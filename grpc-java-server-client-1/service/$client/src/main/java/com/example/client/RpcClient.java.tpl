package com.example.client;

import {{ index . "javaPackage" }}.{{ index . "serverName" }}Grpc;
import {{ index . "javaPackage" }}.{{ index . "serverName" }}OuterClass;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import io.grpc.StatusRuntimeException;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RpcClient {
    private static final Logger logger = Logger.getLogger(RpcClient.class.getName());

    private final static String Address = "localhost:9999";
    private static ManagedChannel channel;
    private final {{ index . "serverName" }}Grpc.{{ index . "serverName" }}BlockingStub stub;

    public RpcClient(String address) {
        // init conn
        channel = ManagedChannelBuilder.forTarget(address).usePlaintext().build();
        // init remote stub
        stub = {{ index . "serverName" }}Grpc.newBlockingStub(channel);
    }

    {{- range index . "services" }}
      {{- range .RPC}}

    // helloworldAbc123Qwe
    public void {{ .LowCaseName }}(String param) {
        // DemoOuterClass.HelloRequest request = DemoOuterClass.HelloRequest.
        //        newBuilder().setMsg(param).build();
        {{ .ServerName }}OuterClass.{{ .RequestType }} request = {{ .ServerName }}OuterClass.{{ .RequestType }}.newBuilder().build();
        {{ .ServerName }}OuterClass.{{ .ResponseType }} response;
        try {
            response = stub.{{ .LowCaseName }}(request);
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC failed: {0}", e.getStatus());
            return;
        }
        logger.info("Greeting: " + response);
    }
      {{- end}}
    {{- end}}

    public static void main(String[] args) throws Exception {
        try {
            RpcClient client = new RpcClient(Address);
        {{- range index . "services" }}
          {{- range .RPC}}
            // client.{{ .LowCaseName }}("World");
          {{- end}}
        {{- end}}

        } finally {
            channel.shutdownNow().awaitTermination(5, TimeUnit.SECONDS);
        }
    }
}