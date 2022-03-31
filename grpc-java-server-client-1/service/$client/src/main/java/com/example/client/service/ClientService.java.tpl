package com.example.client.service;

import org.springframework.stereotype.Service;

@Service
public interface ClientService {
    {{- range index . "services" }}

    {{- $ServiceName := .Name }}
    {{- $ServiceName := $ServiceName }}
      {{- range .RPC}}
    String {{ .LowCaseName }}(String param);
      {{- end}}
    {{- end}}
}