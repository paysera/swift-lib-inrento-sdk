import PromiseKit

public extension InRentoAPIClient {
    func getAccount() -> Promise<IRAccount> {
        doRequest(requestRouter: Router.getAccount)
    }
    
    func getPortfolio() -> Promise<IRPortfolio> {
        doRequest(requestRouter: Router.getPortfolio)
    }
    
    func getTransactions() -> Promise<IRTransactions> {
        doRequest(requestRouter: Router.getTransactions)
    }
    
    func getProjects() -> Promise<IRProjects> {
        doRequest(requestRouter: Router.getProjects)
    }
    
    func getProject(id: Int) -> Promise<IRProjectInfo> {
        doRequest(requestRouter: Router.getProject(id: id))
    }
    
    func getProjectStats(id: Int) -> Promise<IRProjectStats> {
        doRequest(requestRouter: Router.getProjectStats(id: id))
    }
    
    func invest(request: IRInvestRequest) -> Promise<Void> {
        doRequest(requestRouter: Router.invest(request: request))
    }
    
    func confirmRiskAgreement() -> Promise<Void> {
        doRequest(requestRouter: Router.confirmRiskAgreement)
    }
    
    func getDocument(id: String) -> Promise<IRDocument> {
        doRequest(requestRouter: Router.getDocument(id: id))
    }
    
    func getProjectUpdates(id: String) -> Promise<[IRProjectUpdate]> {
        doRequest(requestRouter: Router.getProjectUpdates(id: id))
    }
    
    func saveQuestionnaireAnswers(request: IRSaveQuestionAnswersRequest) -> Promise<Void> {
        doRequest(requestRouter: Router.saveQuestionnaireAnswers(request))
    }
}
