resource "kubernetes_secret" "core-service" {

  metadata {

    name = "core-service"

    namespace = var.state

  }


  data = {

    NODE_ENV : "cHJvZHVjdGlvbgo="
    PORT : 3050
    MONGODB_CONNECTION_STRING : "bW9uZ29kYitzcnY6Ly9rYXJ0aGlrZXlhbmo6dTlPNnVZMUE5VnRHaENsMEBjbHVzdGVyMC51bjJ1cXU0Lm1vbmdvZGIubmV0Cg=="
    MONGODB_DB_NAME : var.state
    BASE_URL : "http://3.21.61.180:3050/"
    APP_TENANTID : "NTk0Y2VkMDJlZDM0NWIyYjA0OTIyMmM1Cg=="
    #debug message
    ENABLE_DEBUG_MSGS : "dHJ1ZQo="
    CORE_API_PORT : 3050
    # Request Body
    REQUESE_LIMIT : "NTBtYgo="
    #No of attempts
    NO_OF_LOGIN_ATTEMPTS : 3
    #AWS
    AWS_API_VERSION : "2016-04-18"
    AWS_REGION : "YXAtc291dGgtMQo="
    AWS_ACCESS_KEY_ID : "QUtJQVNRM1FMRVBFTkVFQ0JGRUsK"
    AWS_CLIENT_ID : "Nm1iY2ozOHIyMGhpa2hpcmJlYThpbWRuMGEK"
    AWS_SECRET_ACCESS_KEY : "dHNjR0xmaERDMFhpRWpBNEduZTdXR3J4ejBHbjRWWHI3VG1MbVRXZAo="
    AWS_SECRET_HASH : "NmFhNjN2NW81Y3ZtbHFrOThocHY5dnNlNm1pMWw2MjdmaWMzamNvbnF0YWo1NnFmMTJiCg=="
    AWS_USER_POOL_ID : "YXAtc291dGgtMV9reWdjMFRZNUoK"
    AWS_COGNITO_JWK_URL : "aHR0cHM6Ly9jb2duaXRvLWlkcC5hcC1zb3V0aC0xLmFtYXpvbmF3cy5jb20vYXAtc291dGgtMV9reWdjMFRZNUovLndlbGwta25vd24vandrcy5qc29uCg=="
    S3_BUCKET_NAME : "Y2FyZWVyLWVkZ2Utc3RhdGUtc3lzdGVtCg=="
    S3_FOLDER_NAME = "dGVuYW50LWltYWdlcwo="
    NODE_ENV : "cHJvZHVjdGlvbgo="
    CORE_API_URL : "http://3.21.61.180:3050"
    NEXTAUTH_SECRET : "dmtESkdmUWVlNU8wekhqMTMwZkJUSU0rQ25maE4vWnJjaC9MNEwyeXhDUT0K"
    NEXTAUTH_URL : "http://3.21.61.180:3030"
    NEXTAUTH_URL_INTERNAL : "http://3.21.61.180:3030"

  }

}
