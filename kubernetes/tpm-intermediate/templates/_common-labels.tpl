{{/*
A common set of labels to apply to resources.
*/}}
{{- define "tpm-intermediate.common-labels" -}}
helm.sh/chart: {{ include "tpm-intermediate.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ with .Values.labels -}}
{{ toYaml . -}}
{{- end -}}
{{ if .Values.partitionId -}}
cray.io/partition: {{ .Values.partitionId }}
{{- end -}}
{{- end -}}
