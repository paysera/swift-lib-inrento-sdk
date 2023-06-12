import XCTest
@testable import PayseraInRentoSDK

final class PayseraInRentoSDKTests: XCTestCase {
    private lazy var inRentoAPIClient: InRentoAPIClient = {
        let credentials = InRentoCredentials(accessToken: "")
        let headers = InRentoHeaders(headers: [.locale("en")])
        return InRentoAPIClientFactory.create(credentials: credentials, headers: headers)
    }()
    
    func testGetAccount() throws {
        executeNonNil(
            inRentoAPIClient.getAccount(),
            description: "Should return account"
        )
    }
    
    func testGetPortfolio() throws {
        executeNonNil(
            inRentoAPIClient.getPortfolio(),
            description: "Should return portfolio"
        )
    }
    
    func testGetTransactions() throws {
        executeNonNil(
            inRentoAPIClient.getTransactions(),
            description: "Should return transactions"
        )
    }
    
    func testGetProjects() throws {
        executeNonNil(
            inRentoAPIClient.getProjects(),
            description: "Should return projects"
        )
    }
    
    func testGetProject() throws {
        executeNonNil(
            inRentoAPIClient.getProject(id: 340),
            description: "Should return project"
        )
    }
    
    func testGetProjectStats() throws {
        executeNonNil(
            inRentoAPIClient.getProjectStats(id: 340),
            description: "Should return project stats"
        )
    }
    
    func testInvest() throws {
        let request = IRInvestRequest(projectID: 340, amount: 1)
        executeNonNil(
            inRentoAPIClient.invest(request: request),
            description: "Should invest"
        )
    }
    
    func testConfirmRiskAgreement() throws {
        executeNonNil(
            inRentoAPIClient.confirmRiskAgreement(),
            description: "Should confirm risk agreement"
        )
    }
    
    func testGetDocument() throws {
        executeNonNil(
            inRentoAPIClient.getDocument(id: "26"),
            description: "Should return document"
        )
    }
    
    func testGetProjectUpdates() throws {
        executeNonNil(
            inRentoAPIClient.getProjectUpdates(id: "337"),
            description: "Should return updates"
        )
    }
    
    func testCalculateInvestmentEarnings() throws {
        executeNonNil(
            inRentoAPIClient.calculateInvestmentEarnings(id: 0, amount: "insert_me"),
            description: "Should return IREarningsCalculationResult type of result"
        )
    }
}
