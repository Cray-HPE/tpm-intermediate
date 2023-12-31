{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "tpm-intermediate.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a global for the Chart.yaml appVersion field.
Use a default of "latest" to keep some sort of backwards compatibility.
*/}}
{{- define "tpm-intermediate.app-version" -}}
{{- default "latest" .Values.global.appVersion | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tpm-intermediate.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "tpm-intermediate.apiname"}}
{{- printf "%s" .Chart.Name | replace "cray-" "" | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tpm-intermediate.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Convenient way to refer to the metallb address pool inside or outside a partition
*/}}
{{- define "tpm-intermediate.metallb-address-pool" -}}
{{- if .Values.partitionId -}}
{{- printf "%s-%s" .Values.service.network (.Values.partitionId | nospace | trunc 8) -}}
{{- else -}}
{{- printf .Values.service.network -}}
{{- end -}}
{{- end -}}

{{/*
Convenient way to refer to the boot-services shared IP inside or outside a partition
*/}}
{{- define "tpm-intermediate.boot-services-shared-ip" -}}
{{- if .Values.partitionId -}}
{{- printf "%s-%s" "boot-services" (.Values.partitionId | trunc 8) -}}
{{- else -}}
{{- printf "boot-services" -}}
{{- end -}}
{{- end -}}
