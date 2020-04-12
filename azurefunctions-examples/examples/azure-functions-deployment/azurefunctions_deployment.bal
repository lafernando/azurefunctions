import ballerinax/azurefunctions;
import ballerina/system;

// The `@azurefunctions:Function` annotation marks a function to
// generate an AWS Lambda function
@azurefunctions:Function
public function echo(azurefunctions:Context ctx, json input) returns json|error {
   return input;
}

@azurefunctions:Function
public function uuid(azurefunctions:Context ctx, json input) returns json|error {
   return system:uuid();
}

@azurefunctions:Function
// The `azurefunctions:Context` object contains request execution
// context information
public function ctxinfo(azurefunctions:Context ctx, json input) returns json|error {
   json result = { RequestID: ctx.getRequestId(),
                   DeadlineMS: ctx.getDeadlineMs(),
                   InvokedFunctionArn: ctx.getInvokedFunctionArn(),
                   TraceID: ctx.getTraceId(),
                   RemainingExecTime: ctx.getRemainingExecutionTime() };
   return result;
}
