package com.example.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.example.client.service.ClientService;

@RestController
public class ClientController {
    @Autowired
    private ClientService clientService;

//     @RequestMapping("/sayHello")
//     public String sayHello(@RequestParam(defaultValue = "tom") String msg) {
//         return clientService.sayHello(msg);
//     }

    {{- range index . "services" }}

    {{- $ServiceName := .Name }}
    {{- $ServiceName := $ServiceName }}
      {{- range .RPC}}
    @RequestMapping("/{{ .LowCaseName }}")
    public String {{ .LowCaseName }}(@RequestParam() String param) {
        return "";
    }
      {{- end}}
    {{- end}}

}
