public struct IRAnsweredQuestion {
    public let key: String
    public let input: IRInput
    
    public init(
        key: String,
        input: IRInput
    ) {
        self.key = key
        self.input = input
    }
}

extension IRAnsweredQuestion {
    public enum IRInput {
        case single(String)
        case array([String])
        
        fileprivate var value: Any {
            switch self {
            case .single(let data):
                return data
            case .array(let data):
                return data
            }
        }
    }
}

public struct IRSaveQuestionAnswersRequest {
    public let answers: [IRAnsweredQuestion]
    
    public init(answers: [IRAnsweredQuestion]) {
        self.answers = answers
    }
    
    public func toJSON() -> [String: Any] {
        answers.reduce([:]) { partialResult, answer in
            var result = partialResult
            result[answer.key] = answer.input.value
            return result
        }
    }
}
