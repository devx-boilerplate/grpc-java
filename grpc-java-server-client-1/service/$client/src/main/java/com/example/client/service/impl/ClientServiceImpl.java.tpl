package com.example.client.service.impl;

import {{ index . "javaPackage" }}.{{ index . "serverName" }}Grpc;
import {{ index . "javaPackage" }}.{{ index . "serverName" }}OuterClass;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.stereotype.Service;
import com.example.client.service.ClientService;

@Service
public class ClientServiceImpl implements ClientService {
    @GrpcClient("grpc-server-config")
    private {{ index . "serverName" }}Grpc.{{ index . "serverName" }}BlockingStub stub;

//     @Override
//     public String sayHello(String msg) {
//         ExamplePbOuterClass.HelloReply reply = stub.sayHello(ExamplePbOuterClass.
//                 HelloRequest.newBuilder().setMsg(msg).build());
//         return reply.getMsg();
//     }

    {{- range index . "services" }}

    {{- $ServiceName := .Name }}
    {{- $ServiceName := $ServiceName }}
      {{- range .RPC}}
    @Override
    public String {{ .LowCaseName }}(String param) {
        return "";
    }
      {{- end}}
    {{- end}}
}
