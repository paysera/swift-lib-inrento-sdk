public struct AnsweredQuestion {
    public let key: String
    public let input: Input
    
    public init(
        key: String,
        input: Input
    ) {
        self.key = key
        self.input = input
    }
}

extension AnsweredQuestion {
    public enum Input {
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
    public let answers: [AnsweredQuestion]
    
    public init(answers: [AnsweredQuestion]) {
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
