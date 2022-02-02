import Alamofire

public struct InRentoAPIClientFactory {
    public static func create(
        credentials: InRentoCredentials,
        headers: InRentoHeaders? = nil,
        tokenRefresher: InRentoTokenRefresherInterface? = nil
    ) -> InRentoAPIClient {
        let interceptor = RequestAdapter(credentials: credentials, headers: headers)
        let session = Session(interceptor: interceptor)
    
        return InRentoAPIClient(
            session: session,
            credentials: credentials,
            tokenRefresher: tokenRefresher
        )
    }
}
