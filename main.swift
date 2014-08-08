import Foundation
import core

let server = TCPServer(ip: "127.0.0.1", port: 8100)

println("Waiting for connection...")

server.start {(client, error) in

    println("New connection")

    let response =
        "HTTP/1.1 200 OK\r\n" +
        "Content-Type: text/plain\r\n" +
        "Content-Length: 12\r\n" +
        "\r\n" +
        "hello world\r\n"

    client?.read {(data, error) in
        let str = NSString(bytes: data!, length: data!.endIndex, encoding: NSUTF8StringEncoding);
        println("Incoming data: \(str)");
        client?.write(response, nil);
    }
}
