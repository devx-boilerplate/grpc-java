package com.example.server;

import {{ index . "javaPackage" }}.{{ index . "serverName" }}Grpc;
import {{ index . "javaPackage" }}.{{ index . "serverName" }}OuterClass;
import io.grpc.stub.StreamObserver;
import net.devh.boot.grpc.server.service.GrpcService;

@GrpcService
public class {{ index . "serverName" }}Service extends {{ index . "serverName" }}Grpc.{{ index . "serverName" }}ImplBase {
    {{- range index . "services" }}
      {{- range .RPC}}

    @Override
    // {{ .Name }}
    public void {{ .LowCaseName }}({{ .ServerName }}OuterClass.{{ .RequestType }} request,
    StreamObserver<{{ .ServerName }}OuterClass.{{ .ResponseType }}> responseObserver) {
        // PbServiceOuterClass.HelloReply reply = PbServiceOuterClass.HelloReply.newBuilder().setMsg("Msg: Hello," + request.getMsg() + "\n").build();
        {{ .ServerName }}OuterClass.{{ .ResponseType }} reply = {{ .ServerName }}OuterClass.{{ .ResponseType }}.newBuilder().build();
        responseObserver.onNext(reply);
        responseObserver.onCompleted();
    }
      {{- end}}
    {{- end}}

}
