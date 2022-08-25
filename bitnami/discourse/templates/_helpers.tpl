{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "discourse.postgresql.fullname" -}}
{{- include "common.names.dependency.fullname" (dict "chartName" "postgresql" "chartValues" .Values.postgresql "context" $) -}}
{{- end -}}

{{/*
Create a default fully qualified app name
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "discourse.redis.fullname" -}}
{{- include "common.names.dependency.fullname" (dict "chartName" "redis" "chartValues" .Values.redis "context" $) -}}
{{- end -}}

{{/*
Return the proper Discourse image name
*/}}
{{- define "discourse.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper Docker image registry secret names
*/}}
{{- define "discourse.imagePullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) }}
{{- end -}}

{{/*
<<<<<<< HEAD
Return true if a secret object for Discourse should be created
*/}}
{{- define "discourse.createSecret" -}}
{{- if or (not .Values.discourse.existingSecret) (and (not .Values.discourse.smtp.existingSecret) .Values.discourse.smtp.password .Values.discourse.smtp.enabled) }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return the Discourse secret name
=======
Create the name of the service account to use
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
*/}}
{{- define "discourse.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return the Discourse SMTP secret name
*/}}
{{- define "discourse.smtp.secretName" -}}
{{- if .Values.discourse.smtp.existingSecret }}
    {{- printf "%s" .Values.discourse.smtp.existingSecret -}}
{{- else -}}
    {{- printf "%s-discourse" (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if Discourse SMTP uses password authentication
*/}}
{{- define "discourse.smtp.password.enabled" -}}
{{- if and (or .Values.discourse.smtp.password .Values.discourse.smtp.existingSecret) .Values.discourse.smtp.enabled }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Get the user defined LoadBalancerIP for this release
Note, returns 127.0.0.1 if using ClusterIP.
*/}}
{{- define "discourse.serviceIP" -}}
{{- if eq .Values.service.type "ClusterIP" -}}
127.0.0.1
{{- else -}}
{{- .Values.service.loadBalancerIP | default "" -}}
{{- end -}}
{{- end -}}

{{/*
Gets the host to be used for this application.
If not using ClusterIP, or if a host or LoadBalancerIP is not defined, the value will be empty
*/}}
{{- define "discourse.host" -}}
{{- if .Values.ingress.enabled }}
  {{- $host := .Values.ingress.hostname | default "" -}}
  {{- default (include "discourse.serviceIP" .) $host -}}
{{- else -}}
  {{- $host := .Values.host | default "" -}}
  {{- default (include "discourse.serviceIP" .) $host -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object for Discourse should be created
*/}}
{{- define "discourse.createSecret" -}}
{{- if or (not .Values.auth.existingSecret) (and .Values.smtp.enabled .Values.smtp.password (not .Values.smtp.existingSecret)) }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return the Discourse secret name
*/}}
{{- define "discourse.secretName" -}}
{{- default (printf "%s-discourse" (include "common.names.fullname" .)) (tpl .Values.auth.existingSecret $) -}}
{{- end -}}

{{/*
Return the Discourse SMTP secret name
*/}}
{{- define "smtp.secretName" -}}
{{- default (printf "%s-discourse" (include "common.names.fullname" .)) (tpl .Values.smtp.existingSecret $) -}}
{{- end -}}

{{/*
Return true if Discourse SMTP uses password authentication
*/}}
{{- define "smtp.password.enabled" -}}
{{- if and .Values.smtp.enabled (or .Values.smtp.password .Values.smtp.existingSecret) }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return the Postgresql hostname
*/}}
{{- define "discourse.database.host" -}}
{{- ternary (include "discourse.postgresql.fullname" .) .Values.externalDatabase.host .Values.postgresql.enabled | quote -}}
{{- end -}}

{{/*
Return the Postgresql port
*/}}
{{- define "discourse.database.port" -}}
{{- ternary "5432" .Values.externalDatabase.port .Values.postgresql.enabled | quote -}}
{{- end -}}

{{/*
Return the Postgresql database name
*/}}
{{- define "discourse.database.name" -}}
{{- if .Values.postgresql.enabled }}
    {{- if .Values.global.postgresql }}
        {{- if .Values.global.postgresql.auth }}
            {{- coalesce .Values.global.postgresql.auth.database .Values.postgresql.auth.database | quote -}}
        {{- else -}}
            {{- .Values.postgresql.auth.database | quote -}}
        {{- end -}}
    {{- else -}}
        {{- .Values.postgresql.auth.database | quote -}}
    {{- end -}}
{{- else -}}
    {{- .Values.externalDatabase.database | quote -}}
{{- end -}}
{{- end -}}

{{/*
Return the Postgresql user
*/}}
{{- define "discourse.database.user" -}}
{{- if .Values.postgresql.enabled }}
    {{- if .Values.global.postgresql }}
        {{- if .Values.global.postgresql.auth }}
            {{- coalesce .Values.global.postgresql.auth.username .Values.postgresql.auth.username | quote -}}
        {{- else -}}
            {{- .Values.postgresql.auth.username | quote -}}
        {{- end -}}
    {{- else -}}
        {{- .Values.postgresql.auth.username | quote -}}
    {{- end -}}
{{- else -}}
    {{- .Values.externalDatabase.user | quote -}}
{{- end -}}
{{- end -}}

{{/*
Return the Postgresql secret name
*/}}
{{- define "discourse.database.secretName" -}}
{{- if .Values.postgresql.enabled }}
    {{- if .Values.global.postgresql }}
        {{- if .Values.global.postgresql.auth }}
            {{- if .Values.global.postgresql.auth.existingSecret }}
                {{- tpl .Values.global.postgresql.auth.existingSecret $ -}}
            {{- else -}}
                {{- default (include "discourse.postgresql.fullname" .) (tpl .Values.postgresql.auth.existingSecret $) -}}
            {{- end -}}
        {{- else -}}
            {{- default (include "discourse.postgresql.fullname" .) (tpl .Values.postgresql.auth.existingSecret $) -}}
        {{- end -}}
    {{- else -}}
        {{- default (include "discourse.postgresql.fullname" .) (tpl .Values.postgresql.auth.existingSecret $) -}}
    {{- end -}}
{{- else -}}
    {{- default (printf "%s-database" .Release.Name) (tpl .Values.externalDatabase.existingSecret $) -}}
{{- end -}}
{{- end -}}

{{/*
<<<<<<< HEAD
Return the Redis&trade; hostname
=======
Return the Postgresql password secret key
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
*/}}
{{- define "discourse.database.secretPasswordKey" -}}
{{- if .Values.postgresql.enabled -}}
    {{- print "password" -}}
{{- else -}}
    {{- if .Values.externalDatabase.existingSecret -}}
        {{- default "password" .Values.externalDatabase.existingSecretPasswordKey }}
    {{- else -}}
        {{- print "password" -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
<<<<<<< HEAD
Return the Redis&trade; port
=======
Return the Postgresql postgres password secret key
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
*/}}
{{- define "discourse.database.secretPostgresPasswordKey" -}}
{{- if .Values.postgresql.enabled -}}
    {{- print "postgres-password" -}}
{{- else -}}
    {{- if .Values.externalDatabase.existingSecret -}}
        {{- default "postgres-password" .Values.externalDatabase.existingSecretPostgresPasswordKey }}
    {{- else -}}
        {{- print "postgres-password" -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
<<<<<<< HEAD
Return true if a secret object for Redis&trade; should be created
=======
Return the Redis&reg; hostname
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
*/}}
{{- define "discourse.redis.host" -}}
{{- ternary (printf "%s-master" (include "discourse.redis.fullname" .)) .Values.externalRedis.host .Values.redis.enabled | quote -}}
{{- end -}}

{{/*
Return the Redis&reg; port
*/}}
{{- define "discourse.redis.port" -}}
{{- ternary "6379" .Values.externalRedis.port .Values.redis.enabled | quote -}}
{{- end -}}

{{/*
<<<<<<< HEAD
Return the Redis&trade; secret name
=======
Return the Redis&reg; secret name
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
*/}}
{{- define "discourse.redis.secretName" -}}
{{- if .Values.redis.enabled }}
    {{- if .Values.redis.auth.existingSecret }}
        {{- printf "%s" .Values.redis.auth.existingSecret -}}
    {{- else -}}
        {{- printf "%s" (include "discourse.redis.fullname" .) -}}
    {{- end -}}
{{- else if .Values.externalRedis.existingSecret }}
    {{- printf "%s" .Values.externalRedis.existingSecret -}}
{{- else -}}
    {{- printf "%s-redis" (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
<<<<<<< HEAD
Return the Redis&trade; secret key
*/}}
{{- define "discourse.redis.secretPasswordKey" -}}
{{- if and .Values.redis.enabled .Values.redis.auth.existingSecret }}
    {{- required "You need to provide existingSecretPasswordKey when an existingSecret is specified in redis" .Values.redis.auth.existingSecretPasswordKey | printf "%s" }}
{{- else if and (not .Values.redis.enabled) .Values.externalRedis.existingSecret }}
    {{- required "You need to provide existingSecretPasswordKey when an existingSecret is specified in redis" .Values.externalRedis.existingSecretPasswordKey | printf "%s" }}
=======
Return the Redis&reg; secret key
*/}}
{{- define "discourse.redis.secretPasswordKey" -}}
{{- if .Values.redis.enabled -}}
    {{- print "redis-password" -}}
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
{{- else -}}
    {{- if .Values.externalRedis.existingSecret -}}
        {{- default "redis-password" .Values.externalRedis.existingSecretPasswordKey }}
    {{- else -}}
        {{- print "redis-password" -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
<<<<<<< HEAD
Return whether Redis&trade; uses password authentication or not
=======
Return whether Redis&reg; uses password authentication or not
>>>>>>> ee2009506fa88a29a08be8ffce1bb6753a5ab4d0
*/}}
{{- define "discourse.redis.auth.enabled" -}}
{{- if or (and .Values.redis.enabled .Values.redis.auth.enabled) (and (not .Values.redis.enabled) (or .Values.externalRedis.password .Values.externalRedis.existingSecret)) }}
    {{- true -}}
{{- end -}}
{{- end -}}
