Continuous integration | License
 -----------------------|--------
[![CI](https://github.com/kubewarden/pod-runtime-class-policy/actions/workflows/test.yml/badge.svg)](https://github.com/kubewarden/pod-runtime-class-policy/actions/workflows/test.yml) | [![License: Apache 2.0](https://img.shields.io/badge/License-Apache2.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)

This directory contains a Kubewarden policy written using Swift.

# The goal

Given the following scenario:

> As an operator of a Kubernetes cluster used by multiple groups of user,
> I want to run untrusted workloads using a more secure container runtime.

Kubernetes has the concept of [Container Runtime Interfaces](https://kubernetes.io/docs/setup/production-environment/container-runtimes/)
which provides the flexibility to execute workloads using different container
engines.
Once properly configured, a Kubernetes cluster can run its workloads using
different runtimes.

On top of that, each Pod can define which Container Runtime has to be used
thanks to the [Runtime Class](https://kubernetes.io/docs/concepts/containers/runtime-class/)
attribute.

For example: trusted workloads could be executed with the "classical" runC,
while untrusted ones could be ran using a container engine that has a
strong focus on security, like [Kata Containers](https://katacontainers.io/)
or [gVisor](https://gvisor.dev/).

This policy inspects the [AdmissionReview](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#request)
objects generated by the Kubernetes API server and either accept or reject
them.

The policy can be used to inspect `CREATE` and `UPDATE` requests of
`Pod` resources.

This policy can also be configured to replace a non-valid runtime with a
fall-back one.

# Configuration

The policy can be configured with the following data structure:

```yml
reservedRuntimes:
- runC
fallbackRuntime: containerd-kata
defaultRuntimeReserved: true
```

This configuration will prevent the usage of the default runtime, plus the
explicit request to use the `runC` one. In these cases, the runtime class
will be changed by the policy to be `containerd-kata`.

# Examples

Let's assume our cluster has two Runtime classes defined:

  * `containerd-runc`: containerD uses runC to start containers. This is the
    default runtime class. Workloads that do not specify a Runtime class
    will automatically use it.
  * `containerd-kata`: containerD uses the Kata Containers runtime to
    start containers.

## Pod without an explicit runtime configured

The following Pod specification doesn't have any runtime class specified:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
```

In the majority of the Kubernetes clusters this would imply the usage of the
runC runtime.

This can be prevented by using the following configuration:

```yml
reservedRuntimes:
- runC
defaultRuntimeReserved: true
```

It's also possible to have the policy accept a mutated version of the request:

```yml
reservedRuntimes:
- runC
fallbackRuntime: containerd-kata
defaultRuntimeReserved: true
```

This would lead to the creation of the following Pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  runtimeClassName: containerd-kata
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
```

## Pod with an invalid runtime

This Pod specification has instead the runtime class set to be `containerd-runc`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  runtimeClassName: containerd-runc
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
```

This Pod can be automatically mutated using the following configuration:

```yml
reservedRuntimes:
- runC
fallbackRuntime: containerd-kata
defaultRuntimeReserved: true
```
