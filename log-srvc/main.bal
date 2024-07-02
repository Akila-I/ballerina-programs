import ballerina/http;
import ballerina/log;

service /srvc on new http:Listener(8080) {
    resource function get success() returns string|error {
        log:printInfo("Request received at /success endpoint");
        return "Successful";
    }

    resource function get failure() returns error? {
        log:printInfo("Request received at /failure endpoint");
        return error("Error");
    }

    resource function get testlog() returns string|error? {
        string diff = "diff value";
        string ctx = "context value";
        log:printInfo(string `Executed`, elapsedTime = diff, context = ctx);
        return "Successful";
    }
}
