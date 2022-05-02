public enum IRQuestionAnswerType {
    case single(String)
    case array([String])
    
    var value: Any {
        switch self {
        case .single(let data):
            return data
        case .array(let data):
            return data
        }
    }
}

public struct IRSaveQuestionAnswersRequest {
    public let answers: [IRQuestionAnswerType]
    
    public init(answers: [IRQuestionAnswerType]) {
        self.answers = answers
    }
    
    public func toJSON() -> [String: Any] {
        guard !answers.isEmpty else {
            return [:]
        }
        
        let maxQuestions = min(answers.count, 12)
        var json: [String: Any] = [:]
        for idx in 0..<maxQuestions {
            let isMax = idx == maxQuestions - 1
            let suffix = isMax ? "_more" : ""
            let formattedIndex = isMax ? idx : idx + 1
            json["question\(formattedIndex)\(suffix)"] = answers[idx].value
        }
        return json
    }
}
