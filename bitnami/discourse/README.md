<!--- app-name: Discourse&reg; -->

# Discourse(R) packaged by Bitnami

Discourse is an open source discussion platform with built-in moderation and governance systems that let discussion communities protect themselves from bad actors even without official moderators.

[Overview of Discourse&reg;](http://www.discourse.org/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.
                           
## TL;DR

```console
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm install my-release bitnami/discourse
```

## Introduction

This chart bootstraps a [Discourse](https://www.discourse.org/) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

<<<<<<< HEAD
It also packages [Bitnami Postgresql](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) and [Bitnami Redis&trade;](https://github.com/bitnami/charts/tree/master/bitnami/redis) which are required as databases for the Discourse application.
=======
It also packages [Bitnami Postgresql](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) and [Bitnami Redis&reg;](https://github.com/bitnami/charts/tree/master/bitnami/redis) which are required as databases for the Discourse application.
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install my-release bitnami/discourse
```

The command deploys Discourse on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
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
| Name                | Description                                                                               | Value |
| ------------------- | ----------------------------------------------------------------------------------------- | ----- |
| `kubeVersion`       | Force target Kubernetes version (using Helm capabilities if not set)                      | `""`  |
| `nameOverride`      | String to partially override discourse.fullname template (will maintain the release name) | `""`  |
| `fullnameOverride`  | String to fully override discourse.fullname template                                      | `""`  |
| `commonLabels`      | Labels to be added to all deployed resources                                              | `{}`  |
| `commonAnnotations` | Annotations to be added to all deployed resources                                         | `{}`  |


### Service parameters

| Name                               | Description                                                     | Value          |
| ---------------------------------- | --------------------------------------------------------------- | -------------- |
| `service.type`                     | Kubernetes Service type                                         | `LoadBalancer` |
| `service.port`                     | Service HTTP port                                               | `80`           |
| `service.nodePort`                 | Node Ports to expose                                            | `""`           |
| `service.loadBalancerIP`           | Use loadBalancerIP to request a specific static IP              | `""`           |
| `service.externalTrafficPolicy`    | Enable client source IP preservation                            | `Cluster`      |
| `service.annotations`              | Service annotations                                             | `{}`           |
| `service.loadBalancerSourceRanges` | Limits which cidr blocks can connect to service's load balancer | `[]`           |
| `service.extraPorts`               | Extra ports to expose (normally used with the `sidecar` value)  | `[]`           |
| `service.nodePorts.http`           | Kubernetes http node port                                       | `""`           |


### Discourse parameters

| Name                                           | Description                                                                                               | Value                |
| ---------------------------------------------- | --------------------------------------------------------------------------------------------------------- | -------------------- |
| `image.registry`                               | Discourse image registry                                                                                  | `docker.io`          |
| `image.repository`                             | Discourse image repository                                                                                | `bitnami/discourse`  |
| `image.tag`                                    | Discourse image tag                                                                                       | `2.7.8-debian-10-r0` |
| `image.pullPolicy`                             | Discourse image pull policy                                                                               | `IfNotPresent`       |
| `image.pullSecrets`                            | Discourse image pull secrets                                                                              | `[]`                 |
| `image.debug`                                  | Specify if debug logs should be enabled                                                                   | `false`              |
| `imagePullSecrets`                             | Specify docker-registry secret names as an array                                                          | `[]`                 |
| `discourse.host`                               | Discourse host to create application URLs (include the port if =/= 80)                                    | `""`                 |
| `discourse.siteName`                           | Discourse site name                                                                                       | `My Site!`           |
| `discourse.username`                           | Admin user of the application                                                                             | `user`               |
| `discourse.password`                           | password. WARNING: Minimum length of 10 characters                                                        | `""`                 |
| `discourse.existingSecret`                     | Name of an existing secret containing the password (ignores previous password)                            | `""`                 |
| `discourse.email`                              | Admin user email of the application                                                                       | `user@example.com`   |
| `discourse.command`                            | Custom command to override image cmd                                                                      | `[]`                 |
| `discourse.args`                               | Custom args for the custom command                                                                        | `[]`                 |
| `discourse.containerSecurityContext`           | Container security context specification                                                                  | `{}`                 |
| `discourse.resources.limits`                   | The resources limits for the container                                                                    | `{}`                 |
| `discourse.resources.requests`                 | The requested resources for the container                                                                 | `{}`                 |
| `discourse.livenessProbe.enabled`              | Enable/disable livenessProbe                                                                              | `true`               |
| `discourse.livenessProbe.initialDelaySeconds`  | Delay before liveness probe is initiated                                                                  | `500`                |
| `discourse.livenessProbe.periodSeconds`        | How often to perform the probe                                                                            | `10`                 |
| `discourse.livenessProbe.timeoutSeconds`       | When the probe times out                                                                                  | `5`                  |
| `discourse.livenessProbe.failureThreshold`     | Minimum consecutive failures for the probe                                                                | `6`                  |
| `discourse.livenessProbe.successThreshold`     | Minimum consecutive successes for the probe                                                               | `1`                  |
| `discourse.readinessProbe.enabled`             | Enable/disable readinessProbe                                                                             | `true`               |
| `discourse.readinessProbe.initialDelaySeconds` | Delay before readiness probe is initiated                                                                 | `30`                 |
| `discourse.readinessProbe.periodSeconds`       | How often to perform the probe                                                                            | `10`                 |
| `discourse.readinessProbe.timeoutSeconds`      | When the probe times out                                                                                  | `5`                  |
| `discourse.readinessProbe.failureThreshold`    | Minimum consecutive failures for the probe                                                                | `6`                  |
| `discourse.readinessProbe.successThreshold`    | Minimum consecutive successes for the probe                                                               | `1`                  |
| `discourse.customLivenessProbe`                | Custom liveness probe to execute (when the main one is disabled)                                          | `{}`                 |
| `discourse.customReadinessProbe`               | Custom readiness probe to execute (when the main one is disabled)                                         | `{}`                 |
| `discourse.smtp.enabled`                       | Enable/disable SMTP                                                                                       | `false`              |
| `discourse.smtp.host`                          | SMTP host name                                                                                            | `""`                 |
| `discourse.smtp.port`                          | SMTP port number                                                                                          | `""`                 |
| `discourse.smtp.user`                          | SMTP account user name                                                                                    | `""`                 |
| `discourse.smtp.password`                      | SMTP account password                                                                                     | `""`                 |
| `discourse.smtp.protocol`                      | SMTP protocol (Allowed values: tls, ssl)                                                                  | `""`                 |
| `discourse.smtp.auth`                          | SMTP authentication method                                                                                | `""`                 |
| `discourse.smtp.existingSecret`                | Name of an existing Kubernetes secret. The secret must have the following key configured: `smtp-password` | `""`                 |
| `discourse.extraEnvVars`                       | An array to add extra env vars                                                                            | `[]`                 |
| `discourse.extraEnvVarsCM`                     | Array to add extra configmaps                                                                             | `[]`                 |
| `discourse.extraEnvVarsSecret`                 | Array to add extra environment variables from a secret                                                    | `""`                 |
| `discourse.extraVolumeMounts`                  | Additional volume mounts (used along with `extraVolumes`)                                                 | `[]`                 |
| `discourse.skipInstall`                        | Do not run the Discourse installation wizard                                                              | `false`              |
| `replicaCount`                                 | Number of Discourse & Sidekiq replicas                                                                    | `1`                  |
| `extraVolumes`                                 | Array of extra volumes to be added deployment. Requires setting `extraVolumeMounts`                       | `[]`                 |
| `sidecars`                                     | Attach additional sidecar containers to the pod                                                           | `[]`                 |
| `initContainers`                               | Additional init containers to add to the pods                                                             | `[]`                 |
| `serviceAccount.create`                        | Whether the service account should be created                                                             | `false`              |
| `serviceAccount.annotations`                   | Annotations to add to the service account                                                                 | `{}`                 |
| `serviceAccount.name`                          | Name to be used for the service account                                                                   | `""`                 |
| `podSecurityContext`                           | Pod security context specification                                                                        | `{}`                 |
| `hostAliases`                                  | Add deployment host aliases                                                                               | `[]`                 |
| `persistence.enabled`                          | Whether to enable persistence based on Persistent Volume Claims                                           | `true`               |
| `persistence.storageClass`                     | discourse & sidekiq data Persistent Volume Storage Class                                                  | `""`                 |
| `persistence.existingClaim`                    | Use a existing PVC which must be created manually before bound                                            | `""`                 |
| `persistence.accessMode`                       | PVC Access Mode (RWO, ROX, RWX)                                                                           | `ReadWriteOnce`      |
| `persistence.size`                             | Size of the PVC to request                                                                                | `10Gi`               |
| `persistence.selector`                         | Selector to match an existing Persistent Volume (this value is evaluated as a template)                   | `{}`                 |
| `updateStrategy.type`                          | Update strategy type. Only really applicable for deployments with RWO PVs attached                        | `RollingUpdate`      |
| `podAnnotations`                               | Additional pod annotations                                                                                | `{}`                 |
| `podLabels`                                    | Additional pod labels                                                                                     | `{}`                 |
| `podAffinityPreset`                            | Pod affinity preset. Allowed values: soft, hard                                                           | `""`                 |
| `podAntiAffinityPreset`                        | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                  | `soft`               |
| `nodeAffinityPreset.type`                      | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                 | `""`                 |
| `nodeAffinityPreset.key`                       | Node label key to match Ignored if `affinity` is set.                                                     | `""`                 |
| `nodeAffinityPreset.values`                    | Node label values to match. Ignored if `affinity` is set.                                                 | `[]`                 |
| `affinity`                                     | Affinity for pod assignment                                                                               | `{}`                 |
| `nodeSelector`                                 | Node labels for pod assignment.                                                                           | `{}`                 |
| `tolerations`                                  | Tolerations for pod assignment.                                                                           | `[]`                 |


### Sidekiq parameters

| Name                                         | Description                                                       | Value  |
| -------------------------------------------- | ----------------------------------------------------------------- | ------ |
| `sidekiq.containerSecurityContext`           | Container security context specification                          | `{}`   |
| `sidekiq.command`                            | Custom command to override image cmd (evaluated as a template)    | `[]`   |
| `sidekiq.args`                               | Custom args for the custom command (evaluated as a template)      | `[]`   |
| `sidekiq.resources`                          | Sidekiq container resource requests and limits                    | `{}`   |
| `sidekiq.livenessProbe.enabled`              | Enable/disable livenessProbe                                      | `true` |
| `sidekiq.livenessProbe.initialDelaySeconds`  | Delay before liveness probe is initiated                          | `500`  |
| `sidekiq.livenessProbe.periodSeconds`        | How often to perform the probe                                    | `10`   |
| `sidekiq.livenessProbe.timeoutSeconds`       | When the probe times out                                          | `5`    |
| `sidekiq.livenessProbe.failureThreshold`     | Minimum consecutive failures for the probe                        | `6`    |
| `sidekiq.livenessProbe.successThreshold`     | Minimum consecutive successes for the probe                       | `1`    |
| `sidekiq.readinessProbe.enabled`             | Enable/disable readinessProbe                                     | `true` |
| `sidekiq.readinessProbe.initialDelaySeconds` | Delay before readiness probe is initiated                         | `30`   |
| `sidekiq.readinessProbe.periodSeconds`       | How often to perform the probe                                    | `10`   |
| `sidekiq.readinessProbe.timeoutSeconds`      | When the probe times out                                          | `5`    |
| `sidekiq.readinessProbe.failureThreshold`    | Minimum consecutive failures for the probe                        | `6`    |
| `sidekiq.readinessProbe.successThreshold`    | Minimum consecutive successes for the probe                       | `1`    |
| `sidekiq.customLivenessProbe`                | Custom liveness probe to execute (when the main one is disabled)  | `{}`   |
| `sidekiq.customReadinessProbe`               | Custom readiness probe to execute (when the main one is disabled) | `{}`   |
| `sidekiq.extraEnvVars`                       | An array to add extra env vars                                    | `[]`   |
| `sidekiq.extraEnvVarsCM`                     | Array to add extra configmaps                                     | `[]`   |
| `sidekiq.extraEnvVarsSecret`                 | Name of the secret that holds extra env vars                      | `""`   |
| `sidekiq.extraVolumeMounts`                  | Additional volume mounts                                          | `[]`   |
=======
| Name                     | Description                                                                               | Value           |
| ------------------------ | ----------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Force target Kubernetes version (using Helm capabilities if not set)                      | `""`            |
| `nameOverride`           | String to partially override discourse.fullname template (will maintain the release name) | `""`            |
| `fullnameOverride`       | String to fully override discourse.fullname template                                      | `""`            |
| `clusterDomain`          | Kubernetes Cluster Domain                                                                 | `cluster.local` |
| `commonLabels`           | Labels to be added to all deployed resources                                              | `{}`            |
| `commonAnnotations`      | Annotations to be added to all deployed resources                                         | `{}`            |
| `extraDeploy`            | Array of extra objects to deploy with the release                                         | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)   | `false`         |
| `diagnosticMode.command` | Command to override all containers in the the deployment(s)/statefulset(s)                | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the the deployment(s)/statefulset(s)                   | `["infinity"]`  |


### Discourse Common parameters

| Name                            | Description                                                                                                              | Value                |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | -------------------- |
| `image.registry`                | Discourse image registry                                                                                                 | `docker.io`          |
| `image.repository`              | Discourse image repository                                                                                               | `bitnami/discourse`  |
| `image.tag`                     | Discourse image tag                                                                                                      | `2.8.8-debian-11-r3` |
| `image.digest`                  | Discourse image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                | `""`                 |
| `image.pullPolicy`              | Discourse image pull policy                                                                                              | `IfNotPresent`       |
| `image.pullSecrets`             | Discourse image pull secrets                                                                                             | `[]`                 |
| `image.debug`                   | Enable image debug mode                                                                                                  | `false`              |
| `auth.email`                    | Discourse admin user email                                                                                               | `user@example.com`   |
| `auth.username`                 | Discourse admin user                                                                                                     | `user`               |
| `auth.password`                 | Discourse admin password. WARNING: Minimum length of 10 characters                                                       | `""`                 |
| `auth.existingSecret`           | Name of an existing secret to use for Discourse credentials                                                              | `""`                 |
| `host`                          | Hostname to create application URLs (include the port if =/= 80)                                                         | `""`                 |
| `siteName`                      | Discourse site name                                                                                                      | `My Site!`           |
| `smtp.enabled`                  | Enable/disable SMTP                                                                                                      | `false`              |
| `smtp.host`                     | SMTP host name                                                                                                           | `""`                 |
| `smtp.port`                     | SMTP port number                                                                                                         | `""`                 |
| `smtp.user`                     | SMTP account user name                                                                                                   | `""`                 |
| `smtp.password`                 | SMTP account password                                                                                                    | `""`                 |
| `smtp.protocol`                 | SMTP protocol (Allowed values: tls, ssl)                                                                                 | `""`                 |
| `smtp.auth`                     | SMTP authentication method                                                                                               | `""`                 |
| `smtp.existingSecret`           | Name of an existing Kubernetes secret. The secret must have the following key configured: `smtp-password`                | `""`                 |
| `replicaCount`                  | Number of Discourse & Sidekiq replicas                                                                                   | `1`                  |
| `podSecurityContext.enabled`    | Enabled Discourse pods' Security Context                                                                                 | `false`              |
| `podSecurityContext.fsGroup`    | Set Discourse pod's Security Context fsGroup                                                                             | `0`                  |
| `hostAliases`                   | Add deployment host aliases                                                                                              | `[]`                 |
| `podAnnotations`                | Additional pod annotations                                                                                               | `{}`                 |
| `podLabels`                     | Additional pod labels                                                                                                    | `{}`                 |
| `podAffinityPreset`             | Pod affinity preset. Allowed values: soft, hard                                                                          | `""`                 |
| `podAntiAffinityPreset`         | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                 | `soft`               |
| `nodeAffinityPreset.type`       | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                | `""`                 |
| `nodeAffinityPreset.key`        | Node label key to match Ignored if `affinity` is set.                                                                    | `""`                 |
| `nodeAffinityPreset.values`     | Node label values to match. Ignored if `affinity` is set.                                                                | `[]`                 |
| `affinity`                      | Affinity for pod assignment                                                                                              | `{}`                 |
| `nodeSelector`                  | Node labels for pod assignment.                                                                                          | `{}`                 |
| `tolerations`                   | Tolerations for pod assignment.                                                                                          | `[]`                 |
| `topologySpreadConstraints`     | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `[]`                 |
| `priorityClassName`             | Priority Class Name                                                                                                      | `""`                 |
| `schedulerName`                 | Use an alternate scheduler, e.g. "stork".                                                                                | `""`                 |
| `terminationGracePeriodSeconds` | Seconds Discourse pod needs to terminate gracefully                                                                      | `""`                 |
| `updateStrategy.type`           | Discourse deployment strategy type                                                                                       | `RollingUpdate`      |
| `updateStrategy.rollingUpdate`  | Discourse deployment rolling update configuration parameters                                                             | `{}`                 |
| `sidecars`                      | Add additional sidecar containers to the Discourse pods                                                                  | `[]`                 |
| `initContainers`                | Add additional init containers to the Discourse pods                                                                     | `[]`                 |
| `extraVolumeMounts`             | Optionally specify extra list of additional volumeMounts for the Discourse pods                                          | `[]`                 |
| `extraVolumes`                  | Optionally specify extra list of additional volumes for the Discourse pods                                               | `[]`                 |


### Discourse container parameters

| Name                                              | Description                                                                                  | Value           |
| ------------------------------------------------- | -------------------------------------------------------------------------------------------- | --------------- |
| `discourse.skipInstall`                           | Do not run the Discourse installation wizard                                                 | `false`         |
| `discourse.command`                               | Custom command to override image cmd                                                         | `[]`            |
| `discourse.args`                                  | Custom args for the custom command                                                           | `[]`            |
| `discourse.extraEnvVars`                          | Array with extra environment variables to add Discourse pods                                 | `[]`            |
| `discourse.extraEnvVarsCM`                        | ConfigMap containing extra environment variables for Discourse pods                          | `""`            |
| `discourse.extraEnvVarsSecret`                    | Secret containing extra environment variables (in case of sensitive data) for Discourse pods | `""`            |
| `discourse.containerPorts.http`                   | Discourse HTTP container port                                                                | `8080`          |
| `discourse.livenessProbe.enabled`                 | Enable livenessProbe on Discourse containers                                                 | `true`          |
| `discourse.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                      | `500`           |
| `discourse.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                             | `10`            |
| `discourse.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                            | `5`             |
| `discourse.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                          | `6`             |
| `discourse.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                          | `1`             |
| `discourse.readinessProbe.enabled`                | Enable readinessProbe on Discourse containers                                                | `true`          |
| `discourse.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                     | `30`            |
| `discourse.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                            | `10`            |
| `discourse.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                           | `5`             |
| `discourse.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                         | `6`             |
| `discourse.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                         | `1`             |
| `discourse.startupProbe.enabled`                  | Enable startupProbe on Discourse containers                                                  | `false`         |
| `discourse.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                       | `60`            |
| `discourse.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                              | `10`            |
| `discourse.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                             | `5`             |
| `discourse.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                           | `15`            |
| `discourse.startupProbe.successThreshold`         | Success threshold for startupProbe                                                           | `1`             |
| `discourse.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                          | `{}`            |
| `discourse.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                         | `{}`            |
| `discourse.customStartupProbe`                    | Custom startupProbe that overrides the default one                                           | `{}`            |
| `discourse.resources.limits`                      | The resources limits for the Discourse containers                                            | `{}`            |
| `discourse.resources.requests`                    | The requested resources for the Discourse containers                                         | `{}`            |
| `discourse.containerSecurityContext.enabled`      | Enabled Discourse containers' Security Context                                               | `false`         |
| `discourse.containerSecurityContext.runAsUser`    | Set Discourse containers' Security Context runAsUser                                         | `0`             |
| `discourse.containerSecurityContext.runAsNonRoot` | Set Discourse containers' Security Context runAsNonRoot                                      | `false`         |
| `discourse.lifecycleHooks`                        | for the Discourse container(s) to automate configuration before or after startup             | `{}`            |
| `discourse.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Discourse pods              | `[]`            |
| `persistence.enabled`                             | Enable persistence using Persistent Volume Claims                                            | `true`          |
| `persistence.storageClass`                        | Persistent Volume storage class                                                              | `""`            |
| `persistence.accessModes`                         | Persistent Volume access modes                                                               | `[]`            |
| `persistence.accessMode`                          | Persistent Volume access mode (DEPRECATED: use `persistence.accessModes` instead)            | `ReadWriteOnce` |
| `persistence.size`                                | Persistent Volume size                                                                       | `10Gi`          |
| `persistence.existingClaim`                       | The name of an existing PVC to use for persistence                                           | `""`            |
| `persistence.selector`                            | Selector to match an existing Persistent Volume for Discourse data PVC                       | `{}`            |
| `persistence.annotations`                         | Persistent Volume Claim annotations                                                          | `{}`            |


### Sidekiq container parameters

| Name                                            | Description                                                                                | Value                                               |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------ | --------------------------------------------------- |
| `sidekiq.command`                               | Custom command to override image cmd (evaluated as a template)                             | `["/opt/bitnami/scripts/discourse/entrypoint.sh"]`  |
| `sidekiq.args`                                  | Custom args for the custom command (evaluated as a template)                               | `["/opt/bitnami/scripts/discourse-sidekiq/run.sh"]` |
| `sidekiq.extraEnvVars`                          | Array with extra environment variables to add Sidekiq pods                                 | `[]`                                                |
| `sidekiq.extraEnvVarsCM`                        | ConfigMap containing extra environment variables for Sidekiq pods                          | `""`                                                |
| `sidekiq.extraEnvVarsSecret`                    | Secret containing extra environment variables (in case of sensitive data) for Sidekiq pods | `""`                                                |
| `sidekiq.livenessProbe.enabled`                 | Enable livenessProbe on Sidekiq containers                                                 | `true`                                              |
| `sidekiq.livenessProbe.initialDelaySeconds`     | Delay before liveness probe is initiated                                                   | `500`                                               |
| `sidekiq.livenessProbe.periodSeconds`           | How often to perform the probe                                                             | `10`                                                |
| `sidekiq.livenessProbe.timeoutSeconds`          | When the probe times out                                                                   | `5`                                                 |
| `sidekiq.livenessProbe.failureThreshold`        | Minimum consecutive failures for the probe                                                 | `6`                                                 |
| `sidekiq.livenessProbe.successThreshold`        | Minimum consecutive successes for the probe                                                | `1`                                                 |
| `sidekiq.readinessProbe.enabled`                | Enable readinessProbe on Sidekiq containers                                                | `true`                                              |
| `sidekiq.readinessProbe.initialDelaySeconds`    | Delay before readiness probe is initiated                                                  | `30`                                                |
| `sidekiq.readinessProbe.periodSeconds`          | How often to perform the probe                                                             | `10`                                                |
| `sidekiq.readinessProbe.timeoutSeconds`         | When the probe times out                                                                   | `5`                                                 |
| `sidekiq.readinessProbe.failureThreshold`       | Minimum consecutive failures for the probe                                                 | `6`                                                 |
| `sidekiq.readinessProbe.successThreshold`       | Minimum consecutive successes for the probe                                                | `1`                                                 |
| `sidekiq.startupProbe.enabled`                  | Enable startupProbe on Sidekiq containers                                                  | `false`                                             |
| `sidekiq.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                     | `60`                                                |
| `sidekiq.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                            | `10`                                                |
| `sidekiq.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                           | `5`                                                 |
| `sidekiq.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                         | `15`                                                |
| `sidekiq.startupProbe.successThreshold`         | Success threshold for startupProbe                                                         | `1`                                                 |
| `sidekiq.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                        | `{}`                                                |
| `sidekiq.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                       | `{}`                                                |
| `sidekiq.customStartupProbe`                    | Custom startupProbe that overrides the default one                                         | `{}`                                                |
| `sidekiq.resources.limits`                      | The resources limits for the Sidekiq containers                                            | `{}`                                                |
| `sidekiq.resources.requests`                    | The requested resources for the Sidekiq containers                                         | `{}`                                                |
| `sidekiq.containerSecurityContext.enabled`      | Enabled Sidekiq containers' Security Context                                               | `false`                                             |
| `sidekiq.containerSecurityContext.runAsUser`    | Set Sidekiq containers' Security Context runAsUser                                         | `0`                                                 |
| `sidekiq.containerSecurityContext.runAsNonRoot` | Set Sidekiq containers' Security Context runAsNonRoot                                      | `false`                                             |
| `sidekiq.lifecycleHooks`                        | for the Sidekiq container(s) to automate configuration before or after startup             | `{}`                                                |
| `sidekiq.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Sidekiq pods              | `[]`                                                |


### Traffic Exposure Parameters

| Name                               | Description                                                                                                                      | Value                    |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.type`                     | Discourse service type                                                                                                           | `ClusterIP`              |
| `service.ports.http`               | Discourse service HTTP port                                                                                                      | `80`                     |
| `service.nodePorts.http`           | Node port for HTTP                                                                                                               | `""`                     |
| `service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                                                                 | `None`                   |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `service.clusterIP`                | Discourse service Cluster IP                                                                                                     | `""`                     |
| `service.loadBalancerIP`           | Discourse service Load Balancer IP                                                                                               | `""`                     |
| `service.loadBalancerSourceRanges` | Discourse service Load Balancer sources                                                                                          | `[]`                     |
| `service.externalTrafficPolicy`    | Discourse service external traffic policy                                                                                        | `Cluster`                |
| `service.annotations`              | Additional custom annotations for Discourse service                                                                              | `{}`                     |
| `service.extraPorts`               | Extra port to expose on Discourse service                                                                                        | `[]`                     |
| `ingress.enabled`                  | Enable ingress record generation for Discourse                                                                                   | `false`                  |
| `ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `ingress.hostname`                 | Default host for the ingress record                                                                                              | `discourse.local`        |
| `ingress.path`                     | Default path for the ingress record                                                                                              | `/`                      |
| `ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.tls`                      | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                    | `false`                  |
| `ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                     |
| `ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0


### Volume Permissions parameters

<<<<<<< HEAD
| Name                                   | Description                                                                                                                                               | Value   |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `volumePermissions.enabled`            | Enable init container that changes volume permissions in the data directory (for cases where the default k8s `runAsUser` and `fsUser` values do not work) | `false` |
| `volumePermissions.resources.limits`   | The resources limits for the init container                                                                                                               | `{}`    |
| `volumePermissions.resources.requests` | The requested resources for the init container                                                                                                            | `{}`    |


### Ingress parameters

| Name                  | Description                                                                                   | Value                    |
| --------------------- | --------------------------------------------------------------------------------------------- | ------------------------ |
| `ingress.enabled`     | Enable ingress controller resource                                                            | `false`                  |
| `ingress.certManager` | Add annotations for cert-manager                                                              | `false`                  |
| `ingress.hostname`    | Default host for the ingress resource                                                         | `discourse.local`        |
| `ingress.apiVersion`  | Force Ingress API version (automatically detected if not set)                                 | `""`                     |
| `ingress.path`        | Ingress path                                                                                  | `/`                      |
| `ingress.pathType`    | Ingress path type                                                                             | `ImplementationSpecific` |
| `ingress.annotations` | Ingress annotations done as key:value pairs                                                   | `{}`                     |
| `ingress.tls`         | Enable TLS configuration for the hostname defined at ingress.hostname parameter               | `false`                  |
| `ingress.extraHosts`  | The list of additional hostnames to be covered with this ingress record.                      | `[]`                     |
| `ingress.extraTls`    | The tls configuration for additional hostnames to be covered with this ingress record.        | `[]`                     |
| `ingress.secrets`     | If you're providing your own certificates, please use this to add the certificates as secrets | `[]`                     |


### Database parameters

| Name                                          | Description                                                                                        | Value                 |
| --------------------------------------------- | -------------------------------------------------------------------------------------------------- | --------------------- |
| `postgresql.enabled`                          | Deploy PostgreSQL container(s)                                                                     | `true`                |
| `postgresql.postgresqlUsername`               | PostgreSQL user to create (used by Discourse). Has superuser privileges if username is `postgres`. | `bn_discourse`        |
| `postgresql.postgresqlPassword`               | PostgreSQL password                                                                                | `""`                  |
| `postgresql.postgresqlPostgresPassword`       | PostgreSQL admin password (used when `postgresqlUsername` is not `postgres`)                       | `bitnami`             |
| `postgresql.existingSecret`                   | Name of existing secret object                                                                     | `""`                  |
| `postgresql.postgresqlDatabase`               | Name of the database to create                                                                     | `bitnami_application` |
| `postgresql.persistence.enabled`              | Enable database persistence using PVC                                                              | `true`                |
| `externalDatabase.host`                       | Host of the external database                                                                      | `""`                  |
| `externalDatabase.port`                       | Database port number (when using an external db)                                                   | `5432`                |
| `externalDatabase.user`                       | Non-root PostgreSQL username (when using an external db)                                           | `bn_discourse`        |
| `externalDatabase.password`                   | Password for the above username (when using an external db)                                        | `""`                  |
| `externalDatabase.create`                     | PostgreSQL create user/database                                                                    | `true`                |
| `externalDatabase.postgresqlPostgresUser`     | PostgreSQL admin user, used during the installation stage (when using an external db)              | `""`                  |
| `externalDatabase.postgresqlPostgresPassword` | PostgreSQL admin password used in the installation stage (when using an external db)               | `""`                  |
| `externalDatabase.existingSecret`             | Name of existing secret object                                                                     | `""`                  |
| `externalDatabase.database`                   | Name of the existing database (when using an external db)                                          | `bitnami_application` |


### Redis&trade; parameters

| Name                                      | Description                                                                                                                                                               | Value            |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| `redis.enabled`                           | Whether to deploy a redis server to satisfy the applications requirements. To use an external redis instance set this to false and configure the externalRedis parameters | `true`           |
| `redis.auth.enabled`                      | Use password authentication                                                                                                                                               | `false`          |
| `redis.auth.password`                     | Redis&trade; password (both master and replica)                                                                                                                           | `""`             |
| `redis.auth.existingSecret`               | Name of an existing Kubernetes secret object containing the password                                                                                                      | `""`             |
| `redis.auth.existingSecretPasswordKey`    | Name of the key pointing to the password in your Kubernetes secret                                                                                                        | `redis-password` |
| `redis.architecture`                      | Cluster settings                                                                                                                                                          | `standalone`     |
| `redis.master.persistence.enabled`        | Enable database persistence using PVC                                                                                                                                     | `true`           |
| `externalRedis.host`                      | Host of the external database                                                                                                                                             | `""`             |
| `externalRedis.port`                      | Database port number                                                                                                                                                      | `6379`           |
| `externalRedis.password`                  | Password for the external Redis. Ignored if existingSecret is set                                                                                                         | `""`             |
| `externalRedis.existingSecret`            | Name of an existing Kubernetes secret object containing the password                                                                                                      | `""`             |
| `externalRedis.existingSecretPasswordKey` | Name of the key pointing to the password in your Kubernetes secret                                                                                                        | `redis-password` |


The above parameters map to the env variables defined in [bitnami/discourse](http://github.com/bitnami/bitnami-docker-discourse). For more information please refer to the [bitnami/discourse](http://github.com/bitnami/bitnami-docker-discourse) image documentation.
=======
| Name                                                   | Description                                                                                                                       | Value                   |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`                            | Enable init container that changes the owner and group of the persistent volume                                                   | `false`                 |
| `volumePermissions.image.registry`                     | Init container volume-permissions image registry                                                                                  | `docker.io`             |
| `volumePermissions.image.repository`                   | Init container volume-permissions image repository                                                                                | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Init container volume-permissions image tag (immutable tags are recommended)                                                      | `10-debian-10-r312`     |
| `volumePermissions.image.digest`                       | Init container volume-permissions image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `volumePermissions.image.pullPolicy`                   | Init container volume-permissions image pull policy                                                                               | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`                  | Init container volume-permissions image pull secrets                                                                              | `[]`                    |
| `volumePermissions.resources.limits`                   | Init container volume-permissions resource limits                                                                                 | `{}`                    |
| `volumePermissions.resources.requests`                 | Init container volume-permissions resource requests                                                                               | `{}`                    |
| `volumePermissions.containerSecurityContext.runAsUser` | User ID for the init container                                                                                                    | `0`                     |


### Other Parameters

| Name                                          | Description                                                            | Value   |
| --------------------------------------------- | ---------------------------------------------------------------------- | ------- |
| `serviceAccount.create`                       | Enable creation of ServiceAccount for Discourse pods                   | `false` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                                 | `""`    |
| `serviceAccount.automountServiceAccountToken` | Allows auto mount of ServiceAccountToken on the serviceAccount created | `true`  |
| `serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                   | `{}`    |


### NetworkPolicy parameters

| Name                                                          | Description                                                                                                                   | Value   |
| ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------- |
| `networkPolicy.enabled`                                       | Enable network policies                                                                                                       | `false` |
| `networkPolicy.ingress.enabled`                               | Enable network policy for Ingress Proxies                                                                                     | `false` |
| `networkPolicy.ingress.namespaceSelector`                     | Ingress Proxy namespace selector labels. These labels will be used to identify the Ingress Proxy's namespace.                 | `{}`    |
| `networkPolicy.ingress.podSelector`                           | Ingress Proxy pods selector labels. These labels will be used to identify the Ingress Proxy pods.                             | `{}`    |
| `networkPolicy.ingressRules.backendOnlyAccessibleByFrontend`  | Enable ingress rule that makes the backends (PostgreSQL and Redis) only accessible by Discourse's pods.                       | `false` |
| `networkPolicy.ingressRules.customBackendSelector`            | Backend selector labels. These labels will be used to identify the backend pods.                                              | `{}`    |
| `networkPolicy.ingressRules.accessOnlyFrom.enabled`           | Enable ingress rule that makes Discourse only accessible from a particular origin                                             | `false` |
| `networkPolicy.ingressRules.accessOnlyFrom.namespaceSelector` | Namespace selector label that is allowed to access Discourse. This label will be used to identified the allowed namespace(s). | `{}`    |
| `networkPolicy.ingressRules.accessOnlyFrom.podSelector`       | Pods selector label that is allowed to access Discourse. This label will be used to identified the allowed pod(s).            | `{}`    |
| `networkPolicy.ingressRules.customRules`                      | Custom network policy ingress rule                                                                                            | `{}`    |
| `networkPolicy.egressRules.denyConnectionsToExternal`         | Enable egress rule that denies outgoing traffic outside the cluster, except for DNS (port 53).                                | `false` |
| `networkPolicy.egressRules.customRules`                       | Custom network policy rule                                                                                                    | `{}`    |


### Discourse database parameters

| Name                                                 | Description                                                                                            | Value                 |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | --------------------- |
| `postgresql.enabled`                                 | Switch to enable or disable the PostgreSQL helm chart                                                  | `true`                |
| `postgresql.auth.enablePostgresUser`                 | Assign a password to the "postgres" admin user. Otherwise, remote access will be blocked for this user | `true`                |
| `postgresql.auth.postgresPassword`                   | Password for the "postgres" admin user                                                                 | `bitnami`             |
| `postgresql.auth.username`                           | Name for a custom user to create                                                                       | `bn_discourse`        |
| `postgresql.auth.password`                           | Password for the custom user to create                                                                 | `""`                  |
| `postgresql.auth.database`                           | Name for a custom database to create                                                                   | `bitnami_application` |
| `postgresql.auth.existingSecret`                     | Name of existing secret to use for PostgreSQL credentials                                              | `""`                  |
| `postgresql.architecture`                            | PostgreSQL architecture (`standalone` or `replication`)                                                | `standalone`          |
| `externalDatabase.host`                              | Database host                                                                                          | `localhost`           |
| `externalDatabase.port`                              | Database port number                                                                                   | `5432`                |
| `externalDatabase.user`                              | Non-root username for Discourse                                                                        | `bn_discourse`        |
| `externalDatabase.password`                          | Password for the non-root username for Discourse                                                       | `""`                  |
| `externalDatabase.database`                          | Discourse database name                                                                                | `bitnami_application` |
| `externalDatabase.create`                            | Switch to enable user/database creation during the installation stage                                  | `true`                |
| `externalDatabase.postgresUser`                      | PostgreSQL admin user, used during the installation stage                                              | `""`                  |
| `externalDatabase.postgresPassword`                  | PostgreSQL admin password, used during the installation stage                                          | `""`                  |
| `externalDatabase.existingSecret`                    | Name of an existing secret resource containing the database credentials                                | `""`                  |
| `externalDatabase.existingSecretPasswordKey`         | Name of an existing secret key containing the database credentials                                     | `password`            |
| `externalDatabase.existingSecretPostgresPasswordKey` | Name of an existing secret key containing the database admin user credentials                          | `postgres-password`   |


### Redis&reg; parameters

| Name                                      | Description                                                                | Value            |
| ----------------------------------------- | -------------------------------------------------------------------------- | ---------------- |
| `redis.enabled`                           | Switch to enable or disable the Redis&reg; helm                            | `true`           |
| `redis.auth.enabled`                      | Enable password authentication                                             | `true`           |
| `redis.auth.password`                     | Redis&reg; password                                                        | `""`             |
| `redis.auth.existingSecret`               | The name of an existing secret with Redis&reg; credentials                 | `""`             |
| `redis.architecture`                      | Redis&reg; architecture. Allowed values: `standalone` or `replication`     | `standalone`     |
| `externalRedis.host`                      | Redis&reg; host                                                            | `localhost`      |
| `externalRedis.port`                      | Redis&reg; port number                                                     | `6379`           |
| `externalRedis.username`                  | Redis&reg; username                                                        | `""`             |
| `externalRedis.password`                  | Redis&reg; password                                                        | `""`             |
| `externalRedis.existingSecret`            | Name of an existing secret resource containing the Redis&trade credentials | `""`             |
| `externalRedis.existingSecretPasswordKey` | Name of an existing secret key containing the Redis&trade credentials      | `redis-password` |


The above parameters map to the env variables defined in [bitnami/discourse](https://github.com/bitnami/containers/tree/main/bitnami/discourse). For more information please refer to the [bitnami/discourse](https://github.com/bitnami/containers/tree/main/bitnami/discourse) image documentation.
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install my-release \
  --set auth.username=admin,auth.password=password \
    bitnami/discourse
```

The above command sets the Discourse administrator account username and password to `admin` and `password` respectively.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install my-release -f values.yaml bitnami/discourse
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Setting up replication

By default, this Chart only deploys a single pod running Discourse. Should you want to increase the number of replicas, you may follow these simple steps to ensure everything works smoothly:

> **Tip**: Running these steps ensures the PostgreSQL instance is correctly populated. If you already have an initialised DB, you may directly create a release with the desired number of replicas. Remind to set `discourse.skipInstall` to `true`!

1. Create a conventional release, that will be scaled later:

```console
$ helm install my-release bitnami/discourse
...
```

2. Wait for the release to complete and Discourse to be running successfully.

```console
$ kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
my-release-discourse-744c48dd97-wx5h9   2/2     Running   0          5m11s
my-release-postgresql-0                 1/1     Running   0          5m10s
my-release-redis-master-0               1/1     Running   0          5m11s
```

3. Perform an upgrade specifying the number of replicas and the credentials used.

```console
$ helm upgrade my-release --set replicaCount=2,discourse.skipInstall=true bitnami/discourse
```

Note that for this to work properly, you need to provide ReadWriteMany PVCs. If you don't have a provisioner for this type of storage, we recommend that you install the NFS provisioner chart (with the correct parameters, such as `persistence.enabled=true` and `persistence.size=10Gi`) and map it to a RWO volume.

Then you can deploy Discourse chart using the proper parameters:

```console
persistence.storageClass=nfs
postgresql.primary.persistence.storageClass=nfs
```

### Sidecars

If you have a need for additional containers to run within the same pod as Discourse (e.g. metrics or logging exporter), you can do so via the `sidecars` config parameter. Simply define your container according to the Kubernetes container spec.

```yaml
sidecars:
- name: your-image-name
  image: your-image
  imagePullPolicy: Always
  ports:
  - name: portname
   containerPort: 1234
```

If these sidecars export extra ports, you can add extra port definitions using the `service.extraPorts` value:

```yaml
service:
...
  extraPorts:
  - name: extraPort
    port: 11311
    targetPort: 11311
```

### Using an external database

Sometimes you may want to have Discourse connect to an external database rather than installing one inside your cluster, e.g. to use a managed database service, or use run a single database server for all your applications. To do this, the chart allows you to specify credentials for an external database under the [`externalDatabase` parameter](#parameters). You should also disable the PostgreSQL installation with the `postgresql.enabled` option. For example with the following parameters:

```console
postgresql.enabled=false
externalDatabase.host=myexternalhost
externalDatabase.user=myuser
externalDatabase.password=mypassword
externalDatabase.postgresUser=postgres
externalDatabase.postgresPassword=rootpassword
externalDatabase.database=mydatabase
externalDatabase.port=5432
```

Note also that if you disable PostgreSQL per above you MUST supply values for the `externalDatabase` connection.

In case the database already contains data from a previous Discourse installation, you need to set the `discourse.skipInstall` parameter to _true_. Otherwise, the container would execute the installation wizard and could modify the existing data in the database. This parameter force the container to not execute the Discourse installation wizard.

<<<<<<< HEAD
Similarly, you can specify an external Redis&trade; instance rather than installing one inside your cluster. First, you may disable the Redis&trade; installation with the `redis.enabled` option. As aforementioned, used the provided parameters to provide data about your instance:
=======
Similarly, you can specify an external Redis&reg; instance rather than installing one inside your cluster. First, you may disable the Redis&reg; installation with the `redis.enabled` option. As aforementioned, used the provided parameters to provide data about your instance:
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0

```console
redis.enabled=false
externalRedis.host=myexternalhost
externalRedis.password=mypassword
externalRedis.port=5432
```

### Ingress

This chart provides support for Ingress resources. If an Ingress controller, such as nginx-ingress or traefik, that Ingress controller can be used to serve Discourse.

To enable Ingress integration, set `ingress.enabled` to `true`. The `ingress.hostname` property can be used to set the host name. The `ingress.tls` parameter can be used to add the TLS configuration for this host. It is also possible to have more than one host, with a separate TLS configuration for each host. [Learn more about configuring and using Ingress](https://docs.bitnami.com/kubernetes/apps/discourse/configuration/configure-ingress/).

### TLS secrets

The chart also facilitates the creation of TLS secrets for use with the Ingress controller, with different options for certificate management. [Learn more about TLS secrets](https://docs.bitnami.com/kubernetes/apps/discourse/administration/enable-tls-ingress/).

### Setting Pod's affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod's affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, you can use of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/master/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

## Persistence

The [Bitnami Discourse](https://github.com/bitnami/containers/tree/main/bitnami/discourse) image stores the Discourse data and configurations at the `/bitnami` path of the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Parameters](#parameters) section to configure the PVC or to disable persistence.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

<<<<<<< HEAD
### To 4.0.0

The [Bitnami Discourse](https://github.com/bitnami/bitnami-docker-discourse) image was refactored and now the source code is published in GitHub in the [`rootfs`](https://github.com/bitnami/bitnami-docker-discourse/tree/master/2/debian-10/rootfs) folder of the container image repository.

Upgrades from previous versions require to specify `--set volumePermissions.enabled=true` in order for all features to work properly:

```console
$ helm upgrade discourse bitnami/discourse \
    --set discourse.host=$DISCOURSE_HOST \
    --set discourse.password=$DISCOURSE_PASSWORD \
    --set postgresql.postgresqlPassword=$POSTGRESQL_PASSWORD \
    --set postgresql.persistence.existingClaim=$POSTGRESQL_PVC \
    --set volumePermissions.enabled=true
```

Full compatibility is not guaranteed due to the amount of involved changes, however no breaking changes are expected aside from the ones mentioned above.

### To 3.0.0

This major updates the Redis&trade; subchart to it newest major, 14.0.0, which contains breaking changes. For more information on this subchart's major and the steps needed to migrate your data from your previous release, please refer to [Redis&trade; upgrade notes.](https://github.com/bitnami/charts/tree/master/bitnami/redis#to-1400).

### To 2.0.0

[On November 13, 2020, Helm v2 support was formally finished](https://github.com/helm/charts#status-of-the-project), this major version is the result of the required changes applied to the Helm Chart to be able to incorporate the different features added in Helm v3 and to be consistent with the Helm project itself regarding the Helm v2 EOL.

**What changes were introduced in this major version?**

- Previous versions of this Helm Chart use `apiVersion: v1` (installable by both Helm 2 and 3), this Helm Chart was updated to `apiVersion: v2` (installable by Helm 3 only). [Here](https://helm.sh/docs/topics/charts/#the-apiversion-field) you can find more information about the `apiVersion` field.
- Move dependency information from the *requirements.yaml* to the *Chart.yaml*
- After running `helm dependency update`, a *Chart.lock* file is generated containing the same structure used in the previous *requirements.lock*
- The different fields present in the *Chart.yaml* file has been ordered alphabetically in a homogeneous way for all the Bitnami Helm Charts

**Considerations when upgrading to this version**

- If you want to upgrade to this version using Helm v2, this scenario is not supported as this version doesn't support Helm v2 anymore
- If you installed the previous version with Helm v2 and wants to upgrade to this version with Helm v3, please refer to the [official Helm documentation](https://helm.sh/docs/topics/v2_v3_migration/#migration-use-cases) about migrating from Helm v2 to v3
- This chart depends on the **PostgreSQL 10** instead of **PostgreSQL 9**. Apart from the same changes that are described in this section, there are also other major changes due to the master/slave nomenclature was replaced by primary/readReplica. [Here](https://github.com/bitnami/charts/pull/4385) you can find more information about the changes introduced.
- If you want to upgrade to this version from a previous one installed with Helm v3, it should be done reusing the PVC used to hold the PostgreSQL data on your previous release. To do so, follow the instructions below (the following example assumes that the release name is `discourse`):

> NOTE: Please, create a backup of your database before running any of those actions.

##### Export secrets and required values to update

```console
$ export DISCOURSE_HOST=$(kubectl get svc --namespace default discourse --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
$ export DISCOURSE_PASSWORD=$(kubectl get secret --namespace default discourse-discourse -o jsonpath="{.data.discourse-password}" | base64 --decode)
$ export POSTGRESQL_PASSWORD=$(kubectl get secret --namespace default discourse-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)
$ export POSTGRESQL_PVC=$(kubectl get pvc -l app.kubernetes.io/instance=discourse,app.kubernetes.io/name=postgresql,role=master -o jsonpath="{.items[0].metadata.name}")
```

##### Delete statefulsets

Delete the Discourse deployment and delete the PostgreSQL statefulset. Notice the option `--cascade=false` in the latter:

```
$ kubectl delete deployments.apps discourse
$ kubectl delete statefulsets.apps --cascade=false discourse-postgresql
```

##### Upgrade the chart release

```console
$ helm upgrade discourse bitnami/discourse \
    --set discourse.host=$DISCOURSE_HOST \
    --set discourse.password=$DISCOURSE_PASSWORD \
    --set postgresql.postgresqlPassword=$POSTGRESQL_PASSWORD \
    --set postgresql.persistence.existingClaim=$POSTGRESQL_PVC
```

##### Force new statefulset to create a new pod for postgresql

```console
$ kubectl delete pod discourse-postgresql-0
```
Finally, you should see the lines below in MariaDB container logs:

```console
$ kubectl logs $(kubectl get pods -l app.kubernetes.io/instance=postgresql,app.kubernetes.io/name=postgresql,role=primary -o jsonpath="{.items[0].metadata.name}")
...
postgresql 08:05:12.59 INFO  ==> Deploying PostgreSQL with persisted data...
...
```

**Useful links**

- https://docs.bitnami.com/tutorials/resolve-helm2-helm3-post-migration-issues/
- https://helm.sh/docs/topics/v2_v3_migration/
- https://helm.sh/blog/migrate-from-helm-v2-to-helm-v3/

### To 1.0.0

This new major version includes the following changes:

* PostgreSQL dependency version was bumped to a new major version `9.X.X`, which includes changes that do no longer guarantee backwards compatibility. Check [PostgreSQL Upgrading Notes](https://github.com/bitnami/charts/tree/master/bitnami/postgresql#900) for more information.
* Redis&trade; dependency version was bumped to a new major version `11.X.X`, which includes breaking changes regarding sentinel. Discourse does not use this type of setup, so no issues are expected to happen in this case. Check [Redis&trade; Upgrading Notes](https://github.com/bitnami/charts/tree/master/bitnami/redis#to-1100) for more information.
* Some non-breaking changes so as to use the `bitnami/common` library chart.

As a consequence, backwards compatibility from previous versions is not guaranteed during the upgrade. To upgrade to this new version `1.0.0` there are two alternatives:

* Install a new Discourse chart, and migrate your Discourse site using the [built-in backup/restore feature](https://meta.discourse.org/t/create-download-and-restore-a-backup-of-your-discourse-database/122710).

* Reuse the PVC used to hold the PostgreSQL data on your previous release. To do so, follow the instructions below.

> NOTE: Please, make sure to create or have a backup of your database before running any of those actions.

1. Old version is up and running

  ```console
  $ helm ls
  NAME	    NAMESPACE	REVISION	UPDATED                              	STATUS  	CHART          	APP VERSION
  discourse 	default  	2       	2020-10-22 12:10:16.454369 +0200 CEST	deployed	discourse-0.5.1	2.5.3

  $ kubectl get pods
  NAME                                   READY   STATUS    RESTARTS   AGE
  discourse-discourse-7554ddb864-d55ls   2/2     Running   0          3s
  discourse-postgresql-0                 1/1     Running   0          16s
  discourse-redis-master-0               1/1     Running   0          16s
  ```

2. Export both PostgreSQL and Discourse credentials in order to provide them in the update

  ```console
  $ export DISCOURSE_PASSWORD=$(kubectl get secret --namespace default discourse-discourse-discourse -o jsonpath="{.data.discourse-password}" | base64 --decode)

  $ export POSTGRESQL_PASSWORD=$(kubectl get secret --namespace default discourse-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)
  ```

  > NOTE: You will need to export Redis&trade; credentials as well if your setup makes use of them.

3. Scale down the Discourse deployment and delete the PostgreSQL statefulset. Notice the option `--cascade=false` in the latter.
=======
Refer to the [chart documentation for more information about how to upgrade from previous releases](https://docs.bitnami.com/kubernetes/apps/discourse/administration/upgrade/).
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0

## Community supported solution

Please, note this Helm chart is a community-supported solution. This means that the Bitnami team is not actively working on new features/improvements nor providing support through GitHub Issues for this Helm chart. Any new issue will stay open for 20 days to allow the community to contribute, after 15 days without activity the issue will be marked as stale being closed after 5 days.

The Bitnami team will review any PR that is created, feel free to create a PR if you find any issue or want to implement a new feature.

New versions are not going to be affected. Once a new version is released in the upstream project, the Bitnami container image will be updated to use the latest version.

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