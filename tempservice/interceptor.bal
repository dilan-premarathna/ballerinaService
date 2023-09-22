import ballerina/http;

service class RequestInterceptor {
    *http:RequestInterceptor;

    // Intercepts the request.
    resource function 'default [string... path](http:RequestContext ctx, http:Request req)
        returns http:NotImplemented|http:NextService|error? {
        req.removeHeader("Set-Cookie");
        return ctx.next();
    }
}

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
