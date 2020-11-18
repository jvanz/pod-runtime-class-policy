let PodDeleteRequest = #"""
{
  "uid": "6230ff1b-7dd7-42af-88d2-fbf9aecde94b",
  "kind": {
    "group": "",
    "version": "v1",
    "kind": "Pod"
  },
  "resource": {
    "group": "",
    "version": "v1",
    "resource": "pods"
  },
  "requestKind": {
    "group": "",
    "version": "v1",
    "kind": "Pod"
  },
  "requestResource": {
    "group": "",
    "version": "v1",
    "resource": "pods"
  },
  "name": "nginx",
  "namespace": "default",
  "operation": "DELETE",
  "userInfo": {
    "username": "kubernetes-admin",
    "groups": [
      "system:masters",
      "system:authenticated"
    ]
  },
  "object": null,
  "oldObject": {
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata": {
      "name": "nginx",
      "namespace": "default",
      "uid": "ab31d005-4c2f-43d5-92e4-3729653be8e4",
      "resourceVersion": "110828",
      "creationTimestamp": "2020-11-14T09:01:57Z",
      "labels": {
        "env": "test"
      },
      "annotations": {
        "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"kind\":\"Pod\",\"metadata\":{\"annotations\":{},\"labels\":{\"env\":\"test\"},\"name\":\"nginx\",\"namespace\":\"default\"},\"spec\":{\"containers\":[{\"image\":\"nginx\",\"imagePullPolicy\":\"IfNotPresent\",\"name\":\"nginx\"}],\"tolerations\":[{\"effect\":\"NoSchedule\",\"key\":\"example-key\",\"operator\":\"Exists\"}]}}\n"
      },
      "managedFields": [
        {
          "manager": "kubectl",
          "operation": "Update",
          "apiVersion": "v1",
          "time": "2020-11-14T09:01:57Z",
          "fieldsType": "FieldsV1",
          "fieldsV1": {
            "f:metadata": {
              "f:annotations": {
                ".": {},
                "f:kubectl.kubernetes.io/last-applied-configuration": {}
              },
              "f:labels": {
                ".": {},
                "f:env": {}
              }
            },
            "f:spec": {
              "f:containers": {
                "k:{\"name\":\"nginx\"}": {
                  ".": {},
                  "f:image": {},
                  "f:imagePullPolicy": {},
                  "f:name": {},
                  "f:resources": {},
                  "f:terminationMessagePath": {},
                  "f:terminationMessagePolicy": {}
                }
              },
              "f:dnsPolicy": {},
              "f:enableServiceLinks": {},
              "f:restartPolicy": {},
              "f:schedulerName": {},
              "f:securityContext": {},
              "f:terminationGracePeriodSeconds": {},
              "f:tolerations": {}
            }
          }
        },
        {
          "manager": "kubelet",
          "operation": "Update",
          "apiVersion": "v1",
          "time": "2020-11-14T09:02:12Z",
          "fieldsType": "FieldsV1",
          "fieldsV1": {
            "f:status": {
              "f:conditions": {
                "k:{\"type\":\"ContainersReady\"}": {
                  ".": {},
                  "f:lastProbeTime": {},
                  "f:lastTransitionTime": {},
                  "f:status": {},
                  "f:type": {}
                },
                "k:{\"type\":\"Initialized\"}": {
                  ".": {},
                  "f:lastProbeTime": {},
                  "f:lastTransitionTime": {},
                  "f:status": {},
                  "f:type": {}
                },
                "k:{\"type\":\"Ready\"}": {
                  ".": {},
                  "f:lastProbeTime": {},
                  "f:lastTransitionTime": {},
                  "f:status": {},
                  "f:type": {}
                }
              },
              "f:containerStatuses": {},
              "f:hostIP": {},
              "f:phase": {},
              "f:podIP": {},
              "f:podIPs": {
                ".": {},
                "k:{\"ip\":\"10.244.0.5\"}": {
                  ".": {},
                  "f:ip": {}
                }
              },
              "f:startTime": {}
            }
          }
        }
      ]
    },
    "spec": {
      "volumes": [
        {
          "name": "default-token-fzk8m",
          "secret": {
            "secretName": "default-token-fzk8m",
            "defaultMode": 420
          }
        }
      ],
      "containers": [
        {
          "name": "nginx",
          "image": "nginx",
          "resources": {},
          "volumeMounts": [
            {
              "name": "default-token-fzk8m",
              "readOnly": true,
              "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
            }
          ],
          "terminationMessagePath": "/dev/termination-log",
          "terminationMessagePolicy": "File",
          "imagePullPolicy": "IfNotPresent"
        }
      ],
      "restartPolicy": "Always",
      "terminationGracePeriodSeconds": 30,
      "dnsPolicy": "ClusterFirst",
      "serviceAccountName": "default",
      "serviceAccount": "default",
      "nodeName": "kind-control-plane",
      "securityContext": {},
      "schedulerName": "default-scheduler",
      "tolerations": [
        {
          "key": "example-key",
          "operator": "Exists",
          "effect": "NoSchedule"
        },
        {
          "key": "node.kubernetes.io/not-ready",
          "operator": "Exists",
          "effect": "NoExecute",
          "tolerationSeconds": 300
        },
        {
          "key": "node.kubernetes.io/unreachable",
          "operator": "Exists",
          "effect": "NoExecute",
          "tolerationSeconds": 300
        }
      ],
      "priority": 0,
      "enableServiceLinks": true,
      "preemptionPolicy": "PreemptLowerPriority"
    },
    "status": {
      "phase": "Running",
      "conditions": [
        {
          "type": "Initialized",
          "status": "True",
          "lastProbeTime": null,
          "lastTransitionTime": "2020-11-14T09:01:58Z"
        },
        {
          "type": "Ready",
          "status": "True",
          "lastProbeTime": null,
          "lastTransitionTime": "2020-11-14T09:02:12Z"
        },
        {
          "type": "ContainersReady",
          "status": "True",
          "lastProbeTime": null,
          "lastTransitionTime": "2020-11-14T09:02:12Z"
        },
        {
          "type": "PodScheduled",
          "status": "True",
          "lastProbeTime": null,
          "lastTransitionTime": "2020-11-14T09:01:58Z"
        }
      ],
      "hostIP": "172.18.0.2",
      "podIP": "10.244.0.5",
      "podIPs": [
        {
          "ip": "10.244.0.5"
        }
      ],
      "startTime": "2020-11-14T09:01:58Z",
      "containerStatuses": [
        {
          "name": "nginx",
          "state": {
            "running": {
              "startedAt": "2020-11-14T09:02:11Z"
            }
          },
          "lastState": {},
          "ready": true,
          "restartCount": 0,
          "image": "docker.io/library/nginx:latest",
          "imageID": "docker.io/library/nginx@sha256:aeade65e99e5d5e7ce162833636f692354c227ff438556e5f3ed0335b7cc2f1b",
          "containerID": "containerd://66c05fc69bd54f4bc7579eb969ca5b904ba97eda85d61d1979f874e4efb75c1f",
          "started": true
        }
      ],
      "qosClass": "BestEffort"
    }
  },
  "dryRun": false,
  "options": {
    "kind": "DeleteOptions",
    "apiVersion": "meta.k8s.io/v1",
    "gracePeriodSeconds": 30,
    "propagationPolicy": "Background"
  }
}
"""#
