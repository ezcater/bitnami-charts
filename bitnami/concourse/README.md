<<<<<<< HEAD
# Concourse

[Concourse](https://concourse-ci.org/) is an automation system written in Go. It is most commonly used for CI/CD, and is built to scale to any kind of automation pipeline, from simple to complex.

=======
<!--- app-name: Concourse -->

# Concourse packaged by Bitnami

Concourse is an automation system written in Go. It is most commonly used for CI/CD, and is built to scale to any kind of automation pipeline, from simple to complex.

[Overview of Concourse](https://concourse-ci.org/)


                           
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
## TL;DR

```console
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm install my-release bitnami/concourse
```

## Introduction

<<<<<<< HEAD
This chart bootstraps a [Concourse](https://concourse-ci.org/) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages [Bitnami Postgresql](https://github.com/bitnami/charts/tree/master/bitnami/postgresql)

Bitnami charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
=======
This chart bootstraps a [Concourse](https://concourse-ci.org/) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages [Bitnami Postgresql](https://github.com/bitnami/charts/tree/master/bitnami/postgresql)

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release bitnami/concourse
```

The command deploys concourse on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |


### Common parameters

<<<<<<< HEAD
| Name                | Description                                        | Value |
| ------------------- | -------------------------------------------------- | ----- |
| `kubeVersion`       | Override Kubernetes version                        | `""`  |
| `nameOverride`      | String to partially override common.names.fullname | `""`  |
| `fullnameOverride`  | String to fully override common.names.fullname     | `""`  |
| `commonLabels`      | Labels to add to all deployed objects              | `{}`  |
| `commonAnnotations` | Annotations to add to all deployed objects         | `{}`  |
| `extraDeploy`       | Array of extra objects to deploy with the release  | `[]`  |
=======
| Name                     | Description                                                                             | Value           |
| ------------------------ | --------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Override Kubernetes version                                                             | `""`            |
| `nameOverride`           | String to partially override common.names.fullname                                      | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname                                          | `""`            |
| `clusterDomain`          | Kubernetes Cluster Domain                                                               | `cluster.local` |
| `commonLabels`           | Labels to add to all deployed objects                                                   | `{}`            |
| `commonAnnotations`      | Annotations to add to all deployed objects                                              | `{}`            |
| `extraDeploy`            | Array of extra objects to deploy with the release                                       | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`         |
| `diagnosticMode.command` | Command to override all containers in the deployment(s)/statefulset(s)                  | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the deployment(s)/statefulset(s)                     | `["infinity"]`  |
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0


### Common Concourse Parameters

| Name                            | Description                                                                                                                            | Value                 |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `image.registry`                | image registry                                                                                                                         | `docker.io`           |
| `image.repository`              | image repository                                                                                                                       | `bitnami/concourse`   |
<<<<<<< HEAD
| `image.tag`                     | image tag (immutable tags are recommended)                                                                                             | `7.4.0-debian-10-r25` |
| `image.pullPolicy`              | image pull policy                                                                                                                      | `IfNotPresent`        |
| `image.pullSecrets`             | image pull secrets                                                                                                                     | `[]`                  |
| `secrets.localAuth.enabled`     | the use of local authentication (basic auth).                                                                                          | `true`                |
| `secrets.teamAuthorizedKeys`    | Array of team names and public keys for team external workers. A single                                                                | `[]`                  |
| `secrets.localUsers`            | List of `username:password` or `username:bcrypted_password` combinations for all your local concourse users. Auto-generated if not set | `""`                  |
=======
| `image.tag`                     | image tag (immutable tags are recommended)                                                                                             | `7.8.2-debian-11-r10` |
| `image.digest`                  | image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                                        | `""`                  |
| `image.pullPolicy`              | image pull policy                                                                                                                      | `IfNotPresent`        |
| `image.pullSecrets`             | image pull secrets                                                                                                                     | `[]`                  |
| `secrets.localAuth.enabled`     | the use of local authentication (basic auth).                                                                                          | `true`                |
| `secrets.localUsers`            | List of `username:password` or `username:bcrypted_password` combinations for all your local concourse users. Auto-generated if not set | `""`                  |
| `secrets.teamAuthorizedKeys`    | Array of team names and public keys for team external workers                                                                          | `[]`                  |
| `secrets.conjurAccount`         | Account for Conjur auth provider.                                                                                                      | `""`                  |
| `secrets.conjurAuthnLogin`      | Host username for Conjur auth provider.                                                                                                | `""`                  |
| `secrets.conjurAuthnApiKey`     | API key for host used for Conjur auth provider. Either API key or token file can be used, but not both.                                | `""`                  |
| `secrets.conjurAuthnTokenFile`  | Token file used for Conjur auth provider if running in Kubernetes or IAM. Either token file or API key can be used, but not both.      | `""`                  |
| `secrets.conjurCACert`          | CA Certificate to specify if conjur instance is deployed with a self-signed cert                                                       | `""`                  |
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
| `secrets.hostKey`               | Concourse Host Keys.                                                                                                                   | `""`                  |
| `secrets.hostKeyPub`            | Concourse Host Keys.                                                                                                                   | `""`                  |
| `secrets.sessionSigningKey`     | Concourse Session Signing Keys.                                                                                                        | `""`                  |
| `secrets.workerKey`             | Concourse Worker Keys.                                                                                                                 | `""`                  |
| `secrets.workerKeyPub`          | Concourse Worker Keys.                                                                                                                 | `""`                  |
| `secrets.workerAdditionalCerts` | Additional certificates to add to the worker nodes                                                                                     | `""`                  |


### Concourse Web parameters

<<<<<<< HEAD
| Name                                     | Description                                                                                       | Value           |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------- | --------------- |
| `web.enabled`                            | Enable web                                                                                        | `true`          |
| `web.replicaCount`                       | Number of web replicas to deploy                                                                  | `1`             |
| `web.args`                               | Override default args of the startup command for the web component.                               | `[]`            |
| `web.baseUrl`                            | url                                                                                               | `/`             |
| `web.logLevel`                           | Minimum level of logs to see. Possible options: debug, info, error.                               | `debug`         |
| `web.clusterName`                        | A name for this Concourse cluster, to be displayed on the dashboard page.                         | `""`            |
| `web.bindIp`                             | IP address on which to listen for HTTP traffic (web UI and API).                                  | `0.0.0.0`       |
| `web.containerPort`                      | Port on which to listen for HTTP traffic (web UI and API).                                        | `8080`          |
| `web.peerAddress`                        | Network address of this web node, reachable by other web nodes.                                   | `""`            |
| `web.externalUrl`                        | URL used to reach any ATC from the outside world.                                                 | `""`            |
| `web.enableAcrossStep`                   | Enable the experimental across step to be used in jobs. The API is subject to change.             | `false`         |
| `web.enablePipelineInstances`            | Enable the creation of instanced pipelines.                                                       | `false`         |
| `web.enableCacheStreamedVolumes`         | Enable caching streamed resource volumes on the destination worker.                               | `false`         |
| `web.livenessProbe.enabled`              | Enable livenessProbe on web nodes                                                                 | `true`          |
| `web.livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe                                                           | `10`            |
| `web.livenessProbe.periodSeconds`        | Period seconds for livenessProbe                                                                  | `15`            |
| `web.livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe                                                                 | `3`             |
| `web.livenessProbe.failureThreshold`     | Failure threshold for livenessProbe                                                               | `1`             |
| `web.livenessProbe.successThreshold`     | Success threshold for livenessProbe                                                               | `1`             |
| `web.readinessProbe.enabled`             | Enable readinessProbe                                                                             | `true`          |
| `web.readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe                                                          | `10`            |
| `web.readinessProbe.periodSeconds`       | Period seconds for readinessProbe                                                                 | `15`            |
| `web.readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe                                                                | `3`             |
| `web.readinessProbe.failureThreshold`    | Failure threshold for readinessProbe                                                              | `1`             |
| `web.readinessProbe.successThreshold`    | Success threshold for readinessProbe                                                              | `1`             |
| `web.customLivenessProbe`                | Custom livenessProbe that overrides the default one                                               | `{}`            |
| `web.customReadinessProbe`               | Custom readinessProbe that overrides the default one                                              | `{}`            |
| `web.resources.limits`                   | The resources limits for the web containers                                                       | `{}`            |
| `web.resources.requests`                 | The requested for the web containers                                                              | `{}`            |
| `web.rbac.create`                        | Specifies whether RBAC resources should be created                                                | `true`          |
| `web.serviceAccount.create`              | Specifies whether a ServiceAccount should be created                                              | `true`          |
| `web.serviceAccount.name`                | Override Web service account name                                                                 | `""`            |
| `web.tls.enabled`                        | enable serving HTTPS traffic directly through the web component.                                  | `false`         |
| `web.tls.containerPort`                  | on which to listen for HTTPS traffic.                                                             | `443`           |
| `web.existingConfigmap`                  | The name of an existing ConfigMap with your custom configuration for web                          | `""`            |
| `web.command`                            | Override default container command (useful when using custom images)                              | `[]`            |
| `web.hostAliases`                        | Deployment pod host aliases                                                                       | `[]`            |
| `web.podLabels`                          | Extra labels for web pods                                                                         | `{}`            |
| `web.podSecurityContext.enabled`         | Enabled web pods' Security Context                                                                | `true`          |
| `web.podSecurityContext.fsGroup`         | Set web pod's Security Context fsGroup                                                            | `1001`          |
| `web.containerSecurityContext.enabled`   | Enabled web containers' Security Context                                                          | `true`          |
| `web.containerSecurityContext.runAsUser` | Set web containers' Security Context runAsUser                                                    | `1001`          |
| `web.psp.create`                         | Specifies whether a PodSecurityPolicy should be created (set `psp.create` to `true` to enable it) | `false`         |
| `web.tsa.logLevel`                       | Minimum level of logs to see. Possible values: debug, info, error.                                | `debug`         |
| `web.tsa.bindIp`                         | IP address on which to listen for SSH.                                                            | `0.0.0.0`       |
| `web.tsa.containerPort`                  | Port on which to listen for SSH.                                                                  | `2222`          |
| `web.tsa.debugbindIp`                    | IP address on which to listen for the pprof debugger endpoints (default: 127.0.0.1)               | `127.0.0.1`     |
| `web.tsa.debugContainerPort`             | Port on which to listen for TSA pprof server.                                                     | `2221`          |
| `web.tsa.heartbeatInterval`              | Interval on which to heartbeat workers to the ATC.                                                | `30s`           |
| `web.tsa.gardenRequestTimeout`           | How long to wait for requests to Garden to complete. 0 means no timeout.                          | `""`            |
| `web.configRBAC`                         | set RBAC configuration                                                                            | `""`            |
| `web.auth.cookieSecure`                  | use cookie secure true or flase                                                                   | `false`         |
| `web.auth.duration`                      | Length of time for which tokens are valid. Afterwards, users will have to log back in.            | `24h`           |
| `web.auth.passwordConnector`             | The connector to use for password authentication for `fly login -u ... -p ...`.                   | `""`            |
| `web.auth.mainTeam.config`               | Configuration file for specifying the main teams params.                                          | `""`            |
| `web.auth.mainTeam.localUser`            | Comma-separated list of local Concourse users to be included as members of the `main` team.       | `user`          |
| `web.podAnnotations`                     | Annotations for web pods                                                                          | `{}`            |
| `web.podAffinityPreset`                  | Pod affinity preset. Ignored if `web.affinity` is set. Allowed values: `soft` or `hard`           | `""`            |
| `web.podAntiAffinityPreset`              | Pod anti-affinity preset. Ignored if `web.affinity` is set. Allowed values: `soft` or `hard`      | `soft`          |
| `web.nodeAffinityPreset.type`            | Node affinity preset type. Ignored if `web.affinity` is set. Allowed values: `soft` or `hard`     | `""`            |
| `web.nodeAffinityPreset.key`             | Node label key to match. Ignored if `web.affinity` is set                                         | `""`            |
| `web.nodeAffinityPreset.values`          | Node label values to match. Ignored if `web.affinity` is set                                      | `[]`            |
| `web.affinity`                           | Affinity for web pods assignment                                                                  | `{}`            |
| `web.nodeSelector`                       | Node labels for web pods assignment                                                               | `{}`            |
| `web.tolerations`                        | Tolerations for web pods assignment                                                               | `[]`            |
| `web.updateStrategy.type`                | web statefulset strategy type                                                                     | `RollingUpdate` |
| `web.priorityClassName`                  | web pods' priorityClassName                                                                       | `""`            |
| `web.lifecycleHooks`                     | for the web container(s) to automate configuration before or after startup                        | `{}`            |
| `web.extraEnvVars`                       | Array with extra environment variables to add to web nodes                                        | `[]`            |
| `web.baseResourceTypeDefaults`           | Configuration file for specifying defaults for base resource types                                | `""`            |
| `web.extraEnvVarsCM`                     | Name of existing ConfigMap containing extra env vars for web nodes                                | `""`            |
| `web.extraEnvVarsSecret`                 | Name of existing Secret containing extra env vars for web nodes                                   | `""`            |
| `web.extraVolumes`                       | Optionally specify extra list of additional volumes for the web pod(s)                            | `[]`            |
| `web.extraVolumeMounts`                  | Optionally specify extra list of additional volumeMounts for the web container(s)                 | `[]`            |
| `web.sidecars`                           | Add additional sidecar containers to the web pod(s)                                               | `[]`            |
| `web.initContainers`                     | Add additional init containers to the web pod(s)                                                  | `[]`            |
| `web.existingSecret`                     | Use an existing secret for the Web service credentials                                            | `""`            |
=======
| Name                                              | Description                                                                                                                                 | Value                                           |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `web.enabled`                                     | Enable Concourse web component                                                                                                              | `true`                                          |
| `web.baseUrl`                                     | url                                                                                                                                         | `/`                                             |
| `web.logLevel`                                    | Minimum level of logs to see. Possible options: debug, info, error.                                                                         | `debug`                                         |
| `web.clusterName`                                 | A name for this Concourse cluster, to be displayed on the dashboard page.                                                                   | `""`                                            |
| `web.bindIp`                                      | IP address on which to listen for HTTP traffic (web UI and API).                                                                            | `0.0.0.0`                                       |
| `web.peerAddress`                                 | Network address of this web node, reachable by other web nodes.                                                                             | `""`                                            |
| `web.externalUrl`                                 | URL used to reach any ATC from the outside world.                                                                                           | `""`                                            |
| `web.auth.cookieSecure`                           | use cookie secure true or false                                                                                                             | `false`                                         |
| `web.auth.duration`                               | Length of time for which tokens are valid. Afterwards, users will have to log back in.                                                      | `24h`                                           |
| `web.auth.passwordConnector`                      | The connector to use for password authentication for `fly login -u ... -p ...`.                                                             | `""`                                            |
| `web.auth.mainTeam.config`                        | Configuration file for specifying the main teams params.                                                                                    | `""`                                            |
| `web.auth.mainTeam.localUser`                     | Comma-separated list of local Concourse users to be included as members of the `main` team.                                                 | `user`                                          |
| `web.existingSecret`                              | Use an existing secret for the Web service credentials                                                                                      | `""`                                            |
| `web.enableAcrossStep`                            | Enable the experimental across step to be used in jobs. The API is subject to change.                                                       | `false`                                         |
| `web.enablePipelineInstances`                     | Enable the creation of instanced pipelines.                                                                                                 | `false`                                         |
| `web.enableCacheStreamedVolumes`                  | Enable caching streamed resource volumes on the destination worker.                                                                         | `false`                                         |
| `web.baseResourceTypeDefaults`                    | Configuration file for specifying defaults for base resource types                                                                          | `""`                                            |
| `web.tsa.logLevel`                                | Minimum level of logs to see. Possible values: debug, info, error                                                                           | `debug`                                         |
| `web.tsa.bindIp`                                  | IP address on which to listen for SSH                                                                                                       | `0.0.0.0`                                       |
| `web.tsa.debugBindIp`                             | IP address on which to listen for the pprof debugger endpoints (default: 127.0.0.1)                                                         | `127.0.0.1`                                     |
| `web.tsa.heartbeatInterval`                       | Interval on which to heartbeat workers to the ATC                                                                                           | `30s`                                           |
| `web.tsa.gardenRequestTimeout`                    | How long to wait for requests to Garden to complete. 0 means no timeout                                                                     | `""`                                            |
| `web.tls.enabled`                                 | enable serving HTTPS traffic directly through the web component.                                                                            | `false`                                         |
| `web.configRBAC`                                  | Set RBAC configuration                                                                                                                      | `""`                                            |
| `web.conjur.enabled`                              | Enable the use of Conjur as a credential manager                                                                                            | `false`                                         |
| `web.conjur.applianceUrl`                         | URL of the Conjur instance.                                                                                                                 | `""`                                            |
| `web.conjur.pipelineSecretTemplate`               | Path used to locate pipeline-level secret                                                                                                   | `concourse/{{.Team}}/{{.Pipeline}}/{{.Secret}}` |
| `web.conjur.teamSecretTemplate`                   | Path used to locate team-level secret                                                                                                       | `concourse/{{.Team}}/{{.Secret}}`               |
| `web.conjur.secretTemplate`                       | Path used to locate a vault or safe-level secret                                                                                            | `concourse/{{.Secret}}`                         |
| `web.existingConfigmap`                           | The name of an existing ConfigMap with your custom configuration for web                                                                    | `""`                                            |
| `web.command`                                     | Override default container command (useful when using custom images)                                                                        | `[]`                                            |
| `web.args`                                        | Override default container args (useful when using custom images)                                                                           | `[]`                                            |
| `web.extraEnvVars`                                | Array with extra environment variables to add to Concourse web nodes                                                                        | `[]`                                            |
| `web.extraEnvVarsCM`                              | Name of existing ConfigMap containing extra env vars for Concourse web nodes                                                                | `""`                                            |
| `web.extraEnvVarsSecret`                          | Name of existing Secret containing extra env vars for Concourse web nodes                                                                   | `""`                                            |
| `web.replicaCount`                                | Number of Concourse web replicas to deploy                                                                                                  | `1`                                             |
| `web.containerPorts.http`                         | Concourse web UI and API HTTP container port                                                                                                | `8080`                                          |
| `web.containerPorts.https`                        | Concourse web UI and API HTTPS container port                                                                                               | `8443`                                          |
| `web.containerPorts.tsa`                          | Concourse web TSA SSH container port                                                                                                        | `2222`                                          |
| `web.containerPorts.pprof`                        | Concourse web TSA pprof server container port                                                                                               | `2221`                                          |
| `web.livenessProbe.enabled`                       | Enable livenessProbe on Concourse web containers                                                                                            | `true`                                          |
| `web.livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                                                                     | `10`                                            |
| `web.livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                                                                            | `15`                                            |
| `web.livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                                                                           | `3`                                             |
| `web.livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                                                                         | `1`                                             |
| `web.livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                                                                         | `1`                                             |
| `web.readinessProbe.enabled`                      | Enable readinessProbe on Concourse web containers                                                                                           | `true`                                          |
| `web.readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                                                                    | `10`                                            |
| `web.readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                                                                           | `15`                                            |
| `web.readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                                                                          | `3`                                             |
| `web.readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                                                                        | `1`                                             |
| `web.readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                                                                        | `1`                                             |
| `web.startupProbe.enabled`                        | Enable startupProbe on Concourse web containers                                                                                             | `false`                                         |
| `web.startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                                                                      | `5`                                             |
| `web.startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                                                                             | `10`                                            |
| `web.startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                                                                            | `1`                                             |
| `web.startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                                                                          | `15`                                            |
| `web.startupProbe.successThreshold`               | Success threshold for startupProbe                                                                                                          | `1`                                             |
| `web.customLivenessProbe`                         | Custom livenessProbe that overrides the default one                                                                                         | `{}`                                            |
| `web.customReadinessProbe`                        | Custom readinessProbe that overrides the default one                                                                                        | `{}`                                            |
| `web.customStartupProbe`                          | Custom startupProbe that overrides the default one                                                                                          | `{}`                                            |
| `web.resources.limits`                            | The resources limits for the Concourse web containers                                                                                       | `{}`                                            |
| `web.resources.requests`                          | The requested resources for the Concourse web containers                                                                                    | `{}`                                            |
| `web.podSecurityContext.enabled`                  | Enabled web pods' Security Context                                                                                                          | `true`                                          |
| `web.podSecurityContext.fsGroup`                  | Set web pod's Security Context fsGroup                                                                                                      | `1001`                                          |
| `web.containerSecurityContext.enabled`            | Enabled web containers' Security Context                                                                                                    | `true`                                          |
| `web.containerSecurityContext.runAsUser`          | Set web containers' Security Context runAsUser                                                                                              | `1001`                                          |
| `web.hostAliases`                                 | Concourse web pod host aliases                                                                                                              | `[]`                                            |
| `web.podLabels`                                   | Extra labels for Concourse web pods                                                                                                         | `{}`                                            |
| `web.podAnnotations`                              | Annotations for Concourse web pods                                                                                                          | `{}`                                            |
| `web.podAffinityPreset`                           | Pod affinity preset. Ignored if `web.affinity` is set. Allowed values: `soft` or `hard`                                                     | `""`                                            |
| `web.podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `web.affinity` is set. Allowed values: `soft` or `hard`                                                | `soft`                                          |
| `web.nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `web.affinity` is set. Allowed values: `soft` or `hard`                                               | `""`                                            |
| `web.nodeAffinityPreset.key`                      | Node label key to match. Ignored if `web.affinity` is set                                                                                   | `""`                                            |
| `web.nodeAffinityPreset.values`                   | Node label values to match. Ignored if `web.affinity` is set                                                                                | `[]`                                            |
| `web.affinity`                                    | Affinity for web pods assignment                                                                                                            | `{}`                                            |
| `web.nodeSelector`                                | Node labels for web pods assignment                                                                                                         | `{}`                                            |
| `web.tolerations`                                 | Tolerations for web pods assignment                                                                                                         | `[]`                                            |
| `web.topologySpreadConstraints`                   | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                    | `[]`                                            |
| `web.priorityClassName`                           | Priority Class to use for each pod (Concourse web)                                                                                          | `""`                                            |
| `web.schedulerName`                               | Use an alternate scheduler, e.g. "stork".                                                                                                   | `""`                                            |
| `web.terminationGracePeriodSeconds`               | Seconds Concourse web pod needs to terminate gracefully                                                                                     | `""`                                            |
| `web.updateStrategy.rollingUpdate`                | Concourse web statefulset rolling update configuration parameters                                                                           | `{}`                                            |
| `web.updateStrategy.type`                         | Concourse web statefulset strategy type                                                                                                     | `RollingUpdate`                                 |
| `web.lifecycleHooks`                              | lifecycleHooks for the Concourse web container(s)                                                                                           | `{}`                                            |
| `web.extraVolumes`                                | Optionally specify extra list of additional volumeMounts for the Concourse web container(s)                                                 | `[]`                                            |
| `web.extraVolumeMounts`                           | Optionally specify extra list of additional volumeMounts for the Concourse web container(s)                                                 | `[]`                                            |
| `web.sidecars`                                    | Add additional sidecar containers to the Concourse web pod(s)                                                                               | `[]`                                            |
| `web.initContainers`                              | Add additional init containers to the Concourse web pod(s)                                                                                  | `[]`                                            |
| `web.psp.create`                                  | Whether to create a PodSecurityPolicy. WARNING: PodSecurityPolicy is deprecated in Kubernetes v1.21 or later, unavailable in v1.25 or later | `false`                                         |
| `web.rbac.create`                                 | Specifies whether RBAC resources should be created                                                                                          | `true`                                          |
| `web.rbac.rules`                                  | Custom RBAC rules to set                                                                                                                    | `[]`                                            |
| `web.serviceAccount.create`                       | Specifies whether a ServiceAccount should be created                                                                                        | `true`                                          |
| `web.serviceAccount.name`                         | Override Web service account name                                                                                                           | `""`                                            |
| `web.serviceAccount.automountServiceAccountToken` | Allows auto mount of ServiceAccountToken on the serviceAccount created                                                                      | `true`                                          |
| `web.serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                                                                                        | `{}`                                            |
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0


### Concourse Worker parameters

<<<<<<< HEAD
| Name                                         | Description                                                                                       | Value           |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------- | --------------- |
| `worker.enabled`                             | Enable worker nodes                                                                               | `true`          |
| `worker.replicaCount`                        | Number of worker replicas                                                                         | `2`             |
| `worker.mode`                                | Selects kind of Deployment. Valid Options are: statefulSet | deployment                           | `deployment`    |
| `worker.logLevel`                            | Minimum level of logs to see. Possible options: debug, info, error                                | `debug`         |
| `worker.command`                             | Override default container command (useful when using custom images)                              | `[]`            |
| `worker.args`                                | Override worker default args                                                                      | `[]`            |
| `worker.bindIp`                              | IP address on which to listen for the Garden server.                                              | `127.0.0.1`     |
| `worker.containerPort`                       | Port on which to listen for the Garden server.                                                    | `7777`          |
| `worker.healthCheckContainerPort`            | Port on which to listen for the healh checks.                                                     | `8888`          |
| `worker.tsa.hosts`                           | TSA host(s) to forward the worker through.                                                        | `[]`            |
| `worker.rbac.create`                         | Specifies whether RBAC resources should be created                                                | `true`          |
| `worker.serviceAccount.create`               | Specifies whether a ServiceAccount should be created                                              | `true`          |
| `worker.serviceAccount.name`                 | Override Worker service account name                                                              | `""`            |
| `worker.autoscaling.enabled`                 | Enable autoscaling for the worker nodes                                                           | `false`         |
| `worker.autoscaling.maxReplicas`             | Set maximum number of replicas to the worker nodes                                                | `""`            |
| `worker.autoscaling.minReplicas`             | Set minimum number of replicas to the worker nodes                                                | `""`            |
| `worker.autoscaling.builtInMetrics`          | Array with built-in metrics                                                                       | `[]`            |
| `worker.autoscaling.customMetrics`           | Array with custom metrics                                                                         | `[]`            |
| `worker.pdb.create`                          | Create Pod disruption budget object for worker nodes                                              | `true`          |
| `worker.pdb.minAvailable`                    | Minimum number of workers available after an eviction                                             | `2`             |
| `worker.livenessProbe.enabled`               | Enable livenessProbe on worker nodes                                                              | `true`          |
| `worker.livenessProbe.initialDelaySeconds`   | Initial delay seconds for livenessProbe                                                           | `10`            |
| `worker.livenessProbe.periodSeconds`         | Period seconds for livenessProbe                                                                  | `15`            |
| `worker.livenessProbe.timeoutSeconds`        | Timeout seconds for livenessProbe                                                                 | `3`             |
| `worker.livenessProbe.failureThreshold`      | Failure threshold for livenessProbe                                                               | `5`             |
| `worker.livenessProbe.successThreshold`      | Failure threshold for livenessProbe                                                               | `1`             |
| `worker.readinessProbe.enabled`              | Enable readiness probe on worker nodes                                                            | `true`          |
| `worker.readinessProbe.initialDelaySeconds`  | Initial delay seconds for readinessProbe                                                          | `10`            |
| `worker.readinessProbe.periodSeconds`        | Period seconds for readinessProbe                                                                 | `15`            |
| `worker.readinessProbe.timeoutSeconds`       | Timeout seconds for readinessProbe                                                                | `3`             |
| `worker.readinessProbe.failureThreshold`     | Failure threshold for readinessProbe                                                              | `5`             |
| `worker.readinessProbe.successThreshold`     | Success threshold for readinessProbe                                                              | `1`             |
| `worker.customLivenessProbe`                 | Custom livenessProbe that overrides the default one                                               | `{}`            |
| `worker.customReadinessProbe`                | Custom readinessProbe that overrides the default one                                              | `{}`            |
| `worker.resources.limits`                    | Configure resource limits.                                                                        | `{}`            |
| `worker.resources.requests`                  | Configure resource request                                                                        | `{}`            |
| `worker.podSecurityContext.enabled`          | Enabled worker pods' Security Context                                                             | `true`          |
| `worker.podSecurityContext.fsGroup`          | Set worker pod's Security Context fsGroup                                                         | `1001`          |
| `worker.containerSecurityContext.enabled`    | Enabled worker containers' Security Context                                                       | `true`          |
| `worker.containerSecurityContext.privileged` | Set worker containers' Security Context with privileged or not                                    | `true`          |
| `worker.containerSecurityContext.runAsUser`  | Set worker containers' Security Context user                                                      | `0`             |
| `worker.psp.create`                          | Specifies whether a PodSecurityPolicy should be created (set `psp.create` to `true` to enable it) | `false`         |
| `worker.podLabels`                           | Custom labels for worker pods                                                                     | `{}`            |
| `worker.podAnnotations`                      | Annotations for worker pods                                                                       | `{}`            |
| `worker.podAffinityPreset`                   | Pod affinity preset. Ignored if `worker.affinity` is set. Allowed values: `soft` or `hard`        | `""`            |
| `worker.podAntiAffinityPreset`               | Pod anti-affinity preset                                                                          | `soft`          |
| `worker.hostAliases`                         | Deployment pod host aliases                                                                       | `[]`            |
| `worker.nodeAffinityPreset.type`             | Node affinity type                                                                                | `""`            |
| `worker.nodeAffinityPreset.key`              | Node label key to match                                                                           | `""`            |
| `worker.nodeAffinityPreset.values`           | Node label values to match                                                                        | `[]`            |
| `worker.affinity`                            | Affinity for pod assignment                                                                       | `{}`            |
| `worker.nodeSelector`                        | Node labels for pod assignment                                                                    | `{}`            |
| `worker.tolerations`                         | Tolerations for worker pod assignment                                                             | `[]`            |
| `worker.updateStrategy.type`                 | worker statefulset strategy type                                                                  | `RollingUpdate` |
| `worker.priorityClassName`                   | worker pods' priorityClassName                                                                    | `""`            |
| `worker.lifecycleHooks`                      | for the worker container(s) to automate configuration before or after startup                     | `{}`            |
| `worker.extraEnvVars`                        | Array with extra environment variables to add to worker nodes                                     | `[]`            |
| `worker.extraEnvVarsCM`                      | Name of existing ConfigMap containing extra env vars for worker nodes                             | `""`            |
| `worker.extraEnvVarsSecret`                  | Name of existing Secret containing extra env vars for worker nodes                                | `""`            |
| `worker.extraVolumes`                        | Optionally specify extra list of additional volumes for the worker pod(s)                         | `[]`            |
| `worker.extraVolumeMounts`                   | Optionally specify extra list of additional volumeMounts for the worker container(s)              | `[]`            |
| `worker.sidecars`                            | Add additional sidecar containers to the worker pod(s)                                            | `[]`            |
| `worker.initContainers`                      | Add additional init containers to the worker pod(s)                                               | `[]`            |
| `worker.existingSecret`                      | name of an existing secret resource containing the keys and the pub                               | `""`            |
| `worker.baggageclaim.logLevel`               | Minimum level of logs to see. Possible values: debug, info, error                                 | `info`          |
| `worker.baggageclaim.bindIp`                 | IP address on which to listen for API traffic.                                                    | `127.0.0.1`     |
| `worker.baggageclaim.containerPort`          | Port on which to listen for API traffic.                                                          | `7788`          |
| `worker.baggageclaim.debugbindIp`            | IP address on which to listen for the pprof debugger endpoints.                                   | `127.0.0.1`     |
| `worker.baggageclaim.debugContainerPort`     | Port on which to listen for baggageclaim pprof server.                                            | `7787`          |
| `worker.baggageclaim.disableUserNamespaces`  | Disable remapping of user/group IDs in unprivileged volumes.                                      | `""`            |
| `worker.baggageclaim.volumes`                | Directory in which to place volume data.                                                          | `""`            |
| `worker.baggageclaim.driver`                 | Driver to use for managing volumes.                                                               | `""`            |
| `worker.baggageclaim.btrfsBin`               | Path to btrfs binary                                                                              | `btrfs`         |
| `worker.baggageclaim.mkfsBin`                | Path to mkfs.btrfs binary                                                                         | `mkfs.btrfs`    |
| `worker.baggageclaim.overlaysDir`            | Path to directory in which to store overlay data                                                  | `""`            |
| `worker.persistence.enabled`                 | Enable persistence using Persistent Volume Claims                                                 | `true`          |
| `worker.persistence.storageClass`            | Persistent Volume storage class                                                                   | `""`            |
| `worker.persistence.annotations`             | Persistent Volume Claim annotations                                                               | `{}`            |
| `worker.persistence.accessModes`             | Persistent Volume access modes                                                                    | `[]`            |
| `worker.persistence.size`                    | Persistent Volume size                                                                            | `8Gi`           |
| `worker.persistence.selector`                | Additional labels to match for the PVC                                                            | `{}`            |
=======
| Name                                                 | Description                                                                                                                                 | Value               |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- |
| `worker.enabled`                                     | Enable Concourse worker nodes                                                                                                               | `true`              |
| `worker.logLevel`                                    | Minimum level of logs to see. Possible options: debug, info, error                                                                          | `debug`             |
| `worker.bindIp`                                      | IP address on which to listen for the Garden server.                                                                                        | `127.0.0.1`         |
| `worker.tsa.hosts`                                   | TSA host(s) to forward the worker through                                                                                                   | `[]`                |
| `worker.existingSecret`                              | name of an existing secret resource containing the keys and the pub                                                                         | `""`                |
| `worker.baggageclaim.logLevel`                       | Minimum level of logs to see. Allowed values: `debug`, `info`, and `error`                                                                  | `info`              |
| `worker.baggageclaim.bindIp`                         | IP address on which to listen for API traffic                                                                                               | `127.0.0.1`         |
| `worker.baggageclaim.debugBindIp`                    | IP address on which to listen for the pprof debugger endpoints                                                                              | `127.0.0.1`         |
| `worker.baggageclaim.disableUserNamespaces`          | Disable remapping of user/group IDs in unprivileged volumes                                                                                 | `""`                |
| `worker.baggageclaim.volumes`                        | Directory in which to place volume data                                                                                                     | `""`                |
| `worker.baggageclaim.driver`                         | Driver to use for managing volumes. Allowed values: `detect`, `naive`, `btrfs`, and `overlay`                                               | `""`                |
| `worker.baggageclaim.btrfsBin`                       | Path to btrfs binary                                                                                                                        | `btrfs`             |
| `worker.baggageclaim.mkfsBin`                        | Path to mkfs.btrfs binary                                                                                                                   | `mkfs.btrfs`        |
| `worker.baggageclaim.overlaysDir`                    | Path to directory in which to store overlay data                                                                                            | `""`                |
| `worker.command`                                     | Override default container command (useful when using custom images)                                                                        | `[]`                |
| `worker.args`                                        | Override worker default args                                                                                                                | `[]`                |
| `worker.replicaCount`                                | Number of worker replicas                                                                                                                   | `2`                 |
| `worker.mode`                                        | Selects kind of Deployment. Allowed values: `deployment` or `statefulset`                                                                   | `deployment`        |
| `worker.containerPorts.garden`                       | Concourse worker Garden server container port                                                                                               | `7777`              |
| `worker.containerPorts.health`                       | Concourse worker health-check container port                                                                                                | `8888`              |
| `worker.containerPorts.baggageclaim`                 | Concourse worker baggageclaim API container port                                                                                            | `7788`              |
| `worker.containerPorts.pprof`                        | Concourse worker baggageclaim pprof server container port                                                                                   | `7787`              |
| `worker.livenessProbe.enabled`                       | Enable livenessProbe on Concourse worker containers                                                                                         | `true`              |
| `worker.livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                                                                     | `10`                |
| `worker.livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                                                                            | `15`                |
| `worker.livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                                                                           | `3`                 |
| `worker.livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                                                                         | `1`                 |
| `worker.livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                                                                         | `1`                 |
| `worker.readinessProbe.enabled`                      | Enable readinessProbe on Concourse worker containers                                                                                        | `true`              |
| `worker.readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                                                                    | `10`                |
| `worker.readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                                                                           | `15`                |
| `worker.readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                                                                          | `3`                 |
| `worker.readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                                                                        | `1`                 |
| `worker.readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                                                                        | `1`                 |
| `worker.startupProbe.enabled`                        | Enable startupProbe on Concourse worker containers                                                                                          | `false`             |
| `worker.startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                                                                      | `5`                 |
| `worker.startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                                                                             | `10`                |
| `worker.startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                                                                            | `1`                 |
| `worker.startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                                                                          | `15`                |
| `worker.startupProbe.successThreshold`               | Success threshold for startupProbe                                                                                                          | `1`                 |
| `worker.customLivenessProbe`                         | Custom livenessProbe that overrides the default one                                                                                         | `{}`                |
| `worker.customReadinessProbe`                        | Custom readinessProbe that overrides the default one                                                                                        | `{}`                |
| `worker.customStartupProbe`                          | Custom startupProbe that overrides the default one                                                                                          | `{}`                |
| `worker.resources.limits`                            | The resources limits for the Concourse worker containers                                                                                    | `{}`                |
| `worker.resources.requests`                          | The requested resources for the Concourse worker containers                                                                                 | `{}`                |
| `worker.podSecurityContext.enabled`                  | Enabled worker pods' Security Context                                                                                                       | `true`              |
| `worker.podSecurityContext.fsGroup`                  | Set worker pod's Security Context fsGroup                                                                                                   | `1001`              |
| `worker.containerSecurityContext.enabled`            | Enabled worker containers' Security Context                                                                                                 | `true`              |
| `worker.containerSecurityContext.privileged`         | Set worker containers' Security Context with privileged or not                                                                              | `true`              |
| `worker.containerSecurityContext.runAsUser`          | Set worker containers' Security Context user                                                                                                | `0`                 |
| `worker.hostAliases`                                 | Concourse worker pod host aliases                                                                                                           | `[]`                |
| `worker.podLabels`                                   | Custom labels for Concourse worker pods                                                                                                     | `{}`                |
| `worker.podAnnotations`                              | Annotations for Concourse worker pods                                                                                                       | `{}`                |
| `worker.podAffinityPreset`                           | Pod affinity preset. Ignored if `worker.affinity` is set. Allowed values: `soft` or `hard`                                                  | `""`                |
| `worker.podAntiAffinityPreset`                       | Pod anti-affinity preset                                                                                                                    | `soft`              |
| `worker.nodeAffinityPreset.type`                     | Node affinity type                                                                                                                          | `""`                |
| `worker.nodeAffinityPreset.key`                      | Node label key to match                                                                                                                     | `""`                |
| `worker.nodeAffinityPreset.values`                   | Node label values to match                                                                                                                  | `[]`                |
| `worker.affinity`                                    | Affinity for pod assignment                                                                                                                 | `{}`                |
| `worker.nodeSelector`                                | Node labels for pod assignment                                                                                                              | `{}`                |
| `worker.tolerations`                                 | Tolerations for worker pod assignment                                                                                                       | `[]`                |
| `worker.topologySpreadConstraints`                   | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                    | `[]`                |
| `worker.priorityClassName`                           | Priority Class to use for each pod (Concourse worker)                                                                                       | `""`                |
| `worker.schedulerName`                               | Use an alternate scheduler, e.g. "stork".                                                                                                   | `""`                |
| `worker.terminationGracePeriodSeconds`               | Seconds Concourse worker pod needs to terminate gracefully                                                                                  | `""`                |
| `worker.podManagementPolicy`                         | Statefulset Pod Management Policy Type. Allowed values: `OrderedReady` or `Parallel`                                                        | `OrderedReady`      |
| `worker.updateStrategy.rollingUpdate`                | Concourse worker statefulset rolling update configuration parameters                                                                        | `{}`                |
| `worker.updateStrategy.type`                         | Concourse worker statefulset strategy type                                                                                                  | `RollingUpdate`     |
| `worker.lifecycleHooks`                              | for the Concourse worker container(s) to automate configuration before or after startup                                                     | `{}`                |
| `worker.extraEnvVars`                                | Array with extra environment variables to add to Concourse worker nodes                                                                     | `[]`                |
| `worker.extraEnvVarsCM`                              | Name of existing ConfigMap containing extra env vars for Concourse worker nodes                                                             | `""`                |
| `worker.extraEnvVarsSecret`                          | Name of existing Secret containing extra env vars for Concourse worker nodes                                                                | `""`                |
| `worker.extraVolumes`                                | Optionally specify extra list of additional volumes for the Concourse worker pod(s)                                                         | `[]`                |
| `worker.extraVolumeMounts`                           | Optionally specify extra list of additional volumeMounts for the Concourse worker container(s)                                              | `[]`                |
| `worker.sidecars`                                    | Add additional sidecar containers to the Concourse worker pod(s)                                                                            | `[]`                |
| `worker.initContainers`                              | Add additional init containers to the Concourse worker pod(s)                                                                               | `[]`                |
| `worker.autoscaling.enabled`                         | Enable autoscaling for the Concourse worker nodes                                                                                           | `false`             |
| `worker.autoscaling.maxReplicas`                     | Set maximum number of replicas to the Concourse worker nodes                                                                                | `""`                |
| `worker.autoscaling.minReplicas`                     | Set minimum number of replicas to the Concourse worker nodes                                                                                | `""`                |
| `worker.autoscaling.builtInMetrics`                  | Array with built-in metrics                                                                                                                 | `[]`                |
| `worker.autoscaling.customMetrics`                   | Array with custom metrics                                                                                                                   | `[]`                |
| `worker.pdb.create`                                  | Create Pod disruption budget object for Concourse worker nodes                                                                              | `true`              |
| `worker.pdb.minAvailable`                            | Minimum number / percentage of Concourse worker pods that should remain scheduled                                                           | `2`                 |
| `worker.pdb.maxUnavailable`                          | Maximum number/percentage of Concourse worker pods that may be made unavailable                                                             | `""`                |
| `worker.psp.create`                                  | Whether to create a PodSecurityPolicy. WARNING: PodSecurityPolicy is deprecated in Kubernetes v1.21 or later, unavailable in v1.25 or later | `false`             |
| `worker.persistence.enabled`                         | Enable Concourse worker data persistence using PVC                                                                                          | `true`              |
| `worker.persistence.existingClaim`                   | Name of an existing PVC to use                                                                                                              | `""`                |
| `worker.persistence.storageClass`                    | PVC Storage Class for Concourse worker data volume                                                                                          | `""`                |
| `worker.persistence.accessModes`                     | PVC Access Mode for Concourse worker volume                                                                                                 | `["ReadWriteOnce"]` |
| `worker.persistence.size`                            | PVC Storage Request for Concourse worker volume                                                                                             | `8Gi`               |
| `worker.persistence.annotations`                     | Annotations for the PVC                                                                                                                     | `{}`                |
| `worker.persistence.selector`                        | Selector to match an existing Persistent Volume (this value is evaluated as a template)                                                     | `{}`                |
| `worker.rbac.create`                                 | Specifies whether RBAC resources should be created                                                                                          | `true`              |
| `worker.rbac.rules`                                  | Custom RBAC rules to set                                                                                                                    | `[]`                |
| `worker.serviceAccount.create`                       | Specifies whether a ServiceAccount should be created                                                                                        | `true`              |
| `worker.serviceAccount.name`                         | Override worker service account name                                                                                                        | `""`                |
| `worker.serviceAccount.automountServiceAccountToken` | Allows auto mount of ServiceAccountToken on the serviceAccount created                                                                      | `true`              |
| `worker.serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                                                                                        | `{}`                |
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0


### Traffic exposure parameters

<<<<<<< HEAD
| Name                                             | Description                                                                                                   | Value                    |
| ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.web.type`                               | For minikube, set this to ClusterIP, elsewhere use LoadBalancer or NodePort                                   | `LoadBalancer`           |
| `service.web.port`                               | Service HTTP port                                                                                             | `80`                     |
| `service.web.tlsPort`                            | Service HTTPS port                                                                                            | `443`                    |
| `service.web.clusterIP`                          | When using `service.web.type: ClusterIP`, sets the user-specified cluster IP.                                 | `""`                     |
| `service.web.loadBalancerIP`                     | When using `service.web.type: LoadBalancer`, sets the user-specified load balancer IP.                        | `""`                     |
| `service.web.labels`                             | Additional Labels to be added to the web api service.                                                         | `{}`                     |
| `service.web.annotations`                        | Annotations to be added to the web api service.                                                               | `{}`                     |
| `service.web.loadBalancerSourceRanges`           | When using `service.web.type: LoadBalancer`, restrict access to the load balancer to particular IPs           | `[]`                     |
| `service.web.nodePort`                           | When using `service.web.type: NodePort`, sets the nodePort for api                                            | `""`                     |
| `service.web.tlsnodePort`                        | When using `service.web.type: NodePort`, sets the nodePort for api tls                                        | `""`                     |
| `service.web.externalTrafficPolicy`              | Set service externalTraffic policy                                                                            | `""`                     |
| `service.workerGateway.type`                     | For minikube, set this to ClusterIP, elsewhere use LoadBalancer or NodePort                                   | `ClusterIP`              |
| `service.workerGateway.clusterIP`                | When using `service.workerGateway.type: ClusterIP`, sets the user-specified cluster IP.                       | `""`                     |
| `service.workerGateway.port`                     | Service HTTP port                                                                                             | `2222`                   |
| `service.workerGateway.loadBalancerIP`           | When using `service.workerGateway.type: LoadBalancer`, sets the user-specified load balancer IP.              | `""`                     |
| `service.workerGateway.labels`                   | Additional Labels to be added to the web workerGateway service.                                               | `{}`                     |
| `service.workerGateway.annotations`              | Annotations to be added to the web workerGateway service.                                                     | `{}`                     |
| `service.workerGateway.loadBalancerSourceRanges` | When using `service.workerGateway.type: LoadBalancer`, restrict access to the load balancer to particular IPs | `[]`                     |
| `service.workerGateway.nodePort`                 | When using `service.workerGateway.type: NodePort`, sets the nodePort for tsa                                  | `""`                     |
| `ingress.enabled`                                | Ingress configuration enabled                                                                                 | `false`                  |
| `ingress.certManager`                            | Add annotations for cert-manager                                                                              | `false`                  |
| `ingress.annotations`                            | Annotations to be added to the web ingress.                                                                   | `{}`                     |
| `ingress.hostname`                               | Hostename for the Ingress object                                                                              | `concourse.local`        |
| `ingress.path`                                   | The Path to Concourse                                                                                         | `/`                      |
| `ingress.rulesOverride`                          | Ingress rules override                                                                                        | `[]`                     |
| `ingress.tls`                                    | TLS configuration.                                                                                            | `false`                  |
| `ingress.pathType`                               | Ingress Path type                                                                                             | `ImplementationSpecific` |
| `ingress.extraHosts`                             | The list of additional hostnames to be covered with this ingress record.                                      | `[]`                     |
| `ingress.extraTls`                               | The tls configuration for additional hostnames to be covered with this ingress record.                        | `[]`                     |
| `ingress.secrets`                                | If you're providing your own certificates, please use this to add the certificates as secrets                 | `[]`                     |
=======
| Name                                             | Description                                                                                                                      | Value                    |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.web.type`                               | Concourse web service type                                                                                                       | `LoadBalancer`           |
| `service.web.ports.http`                         | Concourse web service HTTP port                                                                                                  | `80`                     |
| `service.web.ports.https`                        | Concourse web service HTTPS port                                                                                                 | `443`                    |
| `service.web.nodePorts.http`                     | Node port for HTTP                                                                                                               | `""`                     |
| `service.web.nodePorts.https`                    | Node port for HTTPS                                                                                                              | `""`                     |
| `service.web.sessionAffinity`                    | Control where client requests go, to the same pod or round-robin                                                                 | `None`                   |
| `service.web.sessionAffinityConfig`              | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `service.web.clusterIP`                          | Concourse web service Cluster IP                                                                                                 | `""`                     |
| `service.web.loadBalancerIP`                     | Concourse web service Load Balancer IP                                                                                           | `""`                     |
| `service.web.loadBalancerSourceRanges`           | Concourse web service Load Balancer sources                                                                                      | `[]`                     |
| `service.web.externalTrafficPolicy`              | Concourse web service external traffic policy                                                                                    | `Cluster`                |
| `service.web.annotations`                        | Additional custom annotations for Concourse web service                                                                          | `{}`                     |
| `service.web.extraPorts`                         | Extra port to expose on Concourse web service                                                                                    | `[]`                     |
| `service.workerGateway.type`                     | Concourse worker gateway service type                                                                                            | `ClusterIP`              |
| `service.workerGateway.ports.tsa`                | Concourse worker gateway service port                                                                                            | `2222`                   |
| `service.workerGateway.nodePorts.tsa`            | Node port for worker gateway service                                                                                             | `""`                     |
| `service.workerGateway.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                                                                 | `None`                   |
| `service.workerGateway.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `service.workerGateway.clusterIP`                | Concourse worker gateway service Cluster IP                                                                                      | `""`                     |
| `service.workerGateway.loadBalancerIP`           | Concourse worker gateway service Load Balancer IP                                                                                | `""`                     |
| `service.workerGateway.loadBalancerSourceRanges` | Concourse worker gateway service Load Balancer sources                                                                           | `[]`                     |
| `service.workerGateway.externalTrafficPolicy`    | Concourse worker gateway service external traffic policy                                                                         | `Cluster`                |
| `service.workerGateway.annotations`              | Additional custom annotations for Concourse worker gateway service                                                               | `{}`                     |
| `service.workerGateway.extraPorts`               | Extra port to expose on Concourse worker gateway service                                                                         | `[]`                     |
| `ingress.enabled`                                | Enable ingress record generation for Concourse                                                                                   | `false`                  |
| `ingress.ingressClassName`                       | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `ingress.pathType`                               | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.apiVersion`                             | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `ingress.hostname`                               | Default host for the ingress record                                                                                              | `concourse.local`        |
| `ingress.path`                                   | Default path for the ingress record                                                                                              | `/`                      |
| `ingress.annotations`                            | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.tls`                                    | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                    | `false`                  |
| `ingress.selfSigned`                             | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `ingress.extraHosts`                             | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `ingress.extraPaths`                             | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `ingress.extraTls`                               | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `ingress.secrets`                                | Custom TLS certificates as secrets                                                                                               | `[]`                     |
| `ingress.extraRules`                             | Additional rules to be covered with this ingress record                                                                          | `[]`                     |
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0


### Init Container Parameters

<<<<<<< HEAD
| Name                                                   | Description                                                                                     | Value                   |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`                            | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup` | `false`                 |
| `volumePermissions.image.registry`                     | Bitnami Shell image registry                                                                    | `docker.io`             |
| `volumePermissions.image.repository`                   | Bitnami Shell image repository                                                                  | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                        | `10-debian-10-r171`     |
| `volumePermissions.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                 | `Always`                |
| `volumePermissions.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                | `[]`                    |
| `volumePermissions.resources.limits`                   | The resources limits for the init container                                                     | `{}`                    |
| `volumePermissions.resources.requests`                 | The requested resources for the init container                                                  | `{}`                    |
| `volumePermissions.containerSecurityContext.enabled`   | Enable init container's Security Context                                                        | `true`                  |
| `volumePermissions.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                 | `1001`                  |


### PostgreSQL sub-chart configuration

| Name                            | Description                                                                               | Value               |
| ------------------------------- | ----------------------------------------------------------------------------------------- | ------------------- |
| `postgresql.enabled`            | Switch to enable or disable the PostgreSQL helm chart                                     | `true`              |
| `postgresql.nameOverride`       | Override Concourse Postgresql name                                                        | `""`                |
| `postgresql.postgresqlUsername` | Concourse Postgresql username                                                             | `bn_concourse`      |
| `postgresql.postgresqlDatabase` | Concourse Postgresql database                                                             | `bitnami_concourse` |
| `postgresql.existingSecret`     | Name of an existing secret containing the PostgreSQL password ('postgresql-password' key) | `""`                |
=======
| Name                                                   | Description                                                                                                                       | Value                   |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`                            | Enable init container that changes the owner and group of the persistent volume                                                   | `false`                 |
| `volumePermissions.image.registry`                     | Init container volume-permissions image registry                                                                                  | `docker.io`             |
| `volumePermissions.image.repository`                   | Init container volume-permissions image repository                                                                                | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Init container volume-permissions image tag (immutable tags are recommended)                                                      | `11-debian-11-r23`      |
| `volumePermissions.image.digest`                       | Init container volume-permissions image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `volumePermissions.image.pullPolicy`                   | Init container volume-permissions image pull policy                                                                               | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`                  | Init container volume-permissions image pull secrets                                                                              | `[]`                    |
| `volumePermissions.resources.limits`                   | Init container volume-permissions resource limits                                                                                 | `{}`                    |
| `volumePermissions.resources.requests`                 | Init container volume-permissions resource requests                                                                               | `{}`                    |
| `volumePermissions.containerSecurityContext.enabled`   | Enabled init container Security Context                                                                                           | `true`                  |
| `volumePermissions.containerSecurityContext.runAsUser` | User ID for the init container                                                                                                    | `0`                     |


### Concourse database parameters

| Name                                 | Description                                                                                            | Value               |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------ | ------------------- |
| `postgresql.enabled`                 | Switch to enable or disable the PostgreSQL helm chart                                                  | `true`              |
| `postgresql.auth.enablePostgresUser` | Assign a password to the "postgres" admin user. Otherwise, remote access will be blocked for this user | `false`             |
| `postgresql.auth.username`           | Name for a custom user to create                                                                       | `bn_concourse`      |
| `postgresql.auth.password`           | Password for the custom user to create                                                                 | `""`                |
| `postgresql.auth.database`           | Name for a custom database to create                                                                   | `bitnami_concourse` |
| `postgresql.auth.existingSecret`     | Name of existing secret to use for PostgreSQL credentials                                              | `""`                |
| `postgresql.architecture`            | PostgreSQL architecture (`standalone` or `replication`)                                                | `standalone`        |
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0


### External PostgreSQL configuration

<<<<<<< HEAD
| Name                                         | Description                                                    | Value               |
| -------------------------------------------- | -------------------------------------------------------------- | ------------------- |
| `externalDatabase.host`                      | Database host                                                  | `localhost`         |
| `externalDatabase.user`                      | non-root Username for Airflow Database                         | `bn_concourse`      |
| `externalDatabase.password`                  | Database password                                              | `""`                |
| `externalDatabase.existingSecret`            | Name of an existing secret resource containing the DB password | `""`                |
| `externalDatabase.existingSecretPasswordKey` | Name of an existing secret key containing the DB password      | `""`                |
| `externalDatabase.database`                  | Database name                                                  | `bitnami_concourse` |
| `externalDatabase.port`                      | Database port number                                           | `5432`              |
=======
| Name                                         | Description                                                             | Value               |
| -------------------------------------------- | ----------------------------------------------------------------------- | ------------------- |
| `externalDatabase.host`                      | Database host                                                           | `localhost`         |
| `externalDatabase.port`                      | Database port number                                                    | `5432`              |
| `externalDatabase.user`                      | Non-root username for Concourse                                         | `bn_concourse`      |
| `externalDatabase.password`                  | Password for the non-root username for Concourse                        | `""`                |
| `externalDatabase.database`                  | Concourse database name                                                 | `bitnami_concourse` |
| `externalDatabase.existingSecret`            | Name of an existing secret resource containing the database credentials | `""`                |
| `externalDatabase.existingSecretPasswordKey` | Name of an existing secret key containing the database credentials      | `""`                |
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0


See https://github.com/bitnami-labs/readme-generator-for-helm to create the table

<<<<<<< HEAD
The above parameters map to the env variables defined in [bitnami/concourse](http://github.com/bitnami/bitnami-docker-concourse). For more information please refer to the [bitnami/concourse](http://github.com/bitnami/bitnami-docker-concourse) image documentation.
=======
The above parameters map to the env variables defined in [bitnami/concourse](https://github.com/bitnami/containers/tree/main/bitnami/concourse). For more information please refer to the [bitnami/concourse](https://github.com/bitnami/containers/tree/main/bitnami/concourse) image documentation.
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set secrets.localUsers=admin:password \
<<<<<<< HEAD
  --set postgresql.postgresqlPassword=secretpassword \
    bitnami/concourse
```

The above command sets the Concourse account username and password to `admin` and `password` respectively. Additionally, it sets the PostgreSQL password to `secretpassword`.
=======
    bitnami/concourse
```

The above command sets the Concourse account username and password to `admin` and `password` respectively.
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml bitnami/concourse
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

<<<<<<< HEAD
### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)
=======
### [Rolling vs Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

<<<<<<< HEAD
### External database support

You may want to have concourse connect to an external database rather than installing one inside your cluster. Typical reasons for this are to use a managed database service, or to share a common database server for all your applications. To achieve this, the chart allows you to specify credentials for an external database with the [`externalDatabase` parameter](#parameters). You should also disable the PostgreSQL installation with the `postgresql.enabled` option. Here is an example:

```console
postgresql.enabled=false
externalDatabase.host=myexternalhost
externalDatabase.user=myuser
externalDatabase.password=mypassword
externalDatabase.database=mydatabase
externalDatabase.port=3306
```

### Ingress

This chart provides support for Ingress resources. If an Ingress controller, such as [nginx-ingress](https://kubeapps.com/charts/stable/nginx-ingress) or [traefik](https://kubeapps.com/charts/stable/traefik), that Ingress controller can be used to serve concourse.

To enable Ingress integration, set `ingress.enabled` to `true`. The `ingress.hostname` property can be used to set the host name. The `ingress.tls` parameter can be used to add the TLS configuration for this host. It is also possible to have more than one host, with a separate TLS configuration for each host. [Learn more about configuring and using Ingress](https://docs.bitnami.com/kubernetes/apps/concourse/configuration/configure-use-ingress/).

### TLS secrets

The chart also facilitates the creation of TLS secrets for use with the Ingress controller, with different options for certificate management. [Learn more about TLS secrets](https://docs.bitnami.com/kubernetes/apps/concourse/administration/enable-tls/).

## Persistence

The [Bitnami Concourse](https://github.com/bitnami/bitnami-docker-concourse) image stores the concourse data and configurations at the `/bitnami` path of the container. Persistent Volume Claims are used to keep the data across deployments. [Learn more about persistence in the chart documentation](https://docs.bitnami.com/kubernetes/apps/concourse/configuration/chart-persistence/).

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property.

```yaml
concourse:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values.

### Sidecars

If additional containers are needed in the same pod as concourse (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter. If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/apps/concourse/administration/configure-use-sidecars/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).
=======
### Use an external database

Sometimes, you may want to have Concourse connect to an external database rather than a database within your cluster - for example, when using a managed database service, or when running a single database server for all your applications. To do this, set the `mariadb.enabled` parameter to `false` and specify the credentials for the external database using the `externalDatabase.*` parameters.

Refer to the [chart documentation on using an external database](https://docs.bitnami.com/kubernetes/infrastructure/concourse/configuration/use-external-database) for more details and an example.

### Configure Ingress

This chart provides support for Ingress resources. If you have an Ingress controller installed on your cluster, such as [nginx-ingress-controller](https://github.com/bitnami/charts/tree/master/bitnami/nginx-ingress-controller) or [contour](https://github.com/bitnami/charts/tree/master/bitnami/contour) you can utilize the ingress controller to serve your application.

To enable Ingress integration, set `ingress.enabled` to `true`. The `ingress.hostname` property can be used to set the host name. The `ingress.tls` parameter can be used to add the TLS configuration for this host. It is also possible to have more than one host, with a separate TLS configuration for each host. [Learn more about configuring and using Ingress](https://docs.bitnami.com/kubernetes/infrastructure/concourse/configuration/configure-ingress/).

### Configure TLS Secrets for use with Ingress

The chart also facilitates the creation of TLS secrets for use with the Ingress controller, with different options for certificate management. [Learn more about TLS secrets](https://docs.bitnami.com/kubernetes/infrastructure/concourse/administration/enable-tls-ingress/).

## Persistence

The [Bitnami Concourse](https://github.com/bitnami/containers/tree/main/bitnami/concourse) image stores the concourse data and configurations at the `/bitnami` path of the container. Persistent Volume Claims are used to keep the data across deployments.

### Configure extra environment variables

To add extra environment variables (useful for advanced operations like custom init scripts), use the `extraEnvVars` property.

```yaml
extraEnvVars:
  - name: LOG_LEVEL
    value: DEBUG
```

Alternatively, use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values.

### Configure Sidecars and Init Containers

If additional containers are needed in the same pod as Concourse (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter. Similarly, you can add extra init containers using the `initContainers` parameter.

[Learn more about configuring and using sidecar and init containers](https://docs.bitnami.com/kubernetes/infrastructure/concourse/configuration/configure-sidecar-init-containers/).

### Set Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/master/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).
<<<<<<< HEAD
=======

## Upgrading

Refer to the [chart documentation for more information about how to upgrade from previous releases](https://docs.bitnami.com/kubernetes/infrastructure/concourse/administration/upgrade/).

## License

Copyright &copy; 2022 Bitnami

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
