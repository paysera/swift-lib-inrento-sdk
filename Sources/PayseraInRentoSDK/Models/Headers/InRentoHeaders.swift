public class InRentoHeaders {
    private(set) var headers: [InRentoHeader] = []
    
    public init(headers: [InRentoHeader]) {
        self.headers = headers
    }
    
    public func update(header: InRentoHeader) {
        guard let index = headers.firstIndex(where: { $0.name == header.name }) else {
            return headers.append(header)
        }

        headers.replaceSubrange(index...index, with: [header])
    }
}
