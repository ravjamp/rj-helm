
{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.app_nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.app_nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified postgres name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgres-config.fullname" -}}
{{- $name := default .Chart.Name .Values.app_nameOverride -}}
{{- printf "%s-%s" .Release.Name "elasticsearch" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels - see https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/
*/}}
{{- define "commonLabels" -}}
app.kubernetes.io/name: {{ .Values.app_name }}
app.kubernetes.io/version: {{ or .Values.image.tag .Chart.AppVersion }}
app.kubernetes.io/component: application
app.kubernetes.io/managed-by: helm
app.kubernetes.io/created-by: controller-manager
vtx-cfs/stack: {{ .Values.stack }}
vtx-cfs/environment: {{ .Values.environment }}
vtx-cfs/status: {{ .Values.status }}
app.kubernetes.io/instance: mysql-abcxzy
app.kubernetes.io/project: "CI/CD Engineering"
{{- end -}}
