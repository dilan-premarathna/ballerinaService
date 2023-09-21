import ballerina/http;

// Configuration for the backend host.
configurable string host = ?;

final http:Client clientEP = check new (host);

// Request interceptor class.
service class RequestInterceptor {
    *http:RequestInterceptor;

    // Intercepts the request.
    resource function 'default [string... path](http:RequestContext ctx, http:Request req)
        returns http:NotImplemented|http:NextService|error? {

        req.removeHeader("Set-Cookie");
        return ctx.next();
    }
}

// Response interceptor class.
service class ResponseInterceptor {
    *http:ResponseInterceptor;

    // Intercepts the response.
    remote function interceptResponse(http:RequestContext ctx,
            http:Response res) returns http:NextService|error? {

        res.removeHeader("Set-Cookie");
        res.removeHeader("X-JWT-Assertion");
        return ctx.next();
    }
}

// Create request and response interceptors.
RequestInterceptor requestInterceptor = new;
ResponseInterceptor responseInterceptor = new;

// Define an HTTP listener.
listener http:Listener serviceListener = new (9090, config = {
    interceptors: [requestInterceptor, responseInterceptor]
});

// Define resource functions for HTTP methods.
service / on serviceListener {

    // Handle GET requests.
    isolated resource function get \*(http:Request req) returns string|error {

        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    // Handle POST requests.
    isolated resource function post \*(http:Request req) returns string|error {

        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    // Handle PUT requests.
    isolated resource function put \*(http:Request req) returns string|error {

        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    // Handle PATCH requests.
    isolated resource function patch \*(http:Request req) returns string|error {

        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    // Handle DELETE requests.
    isolated resource function delete \*(http:Request req) returns string|error {

        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    // Handle HEAD requests.
    isolated resource function head \*(http:Request req) returns string|error {

        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }
}
