import ballerina/http;

configurable string backendURL = ?;
final http:Client clientEP = check new (backendURL);

RequestInterceptor requestInterceptor = new;
ResponseInterceptor responseInterceptor = new;

listener http:Listener serviceListener = new (9090, config = {
    interceptors: [requestInterceptor, responseInterceptor]
});

// Define resource functions for HTTP methods.
service / on serviceListener {

    isolated resource function get \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function post \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function put \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function patch \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function delete \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function head \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function options \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }
}
