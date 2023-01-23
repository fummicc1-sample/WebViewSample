public struct AnalyticsEvent {
    public let name: String
    public let parameters: [String: Any]

    public init(name: String, parameters: [String : Any]) {
        self.name = name
        self.parameters = parameters
    }
}

public protocol Analytics {
    func send(_ event: AnalyticsEvent)
}

public struct AppAnalytics: Analytics {
    public func send(_ event: AnalyticsEvent) {
        // do something
        print(event)
    }
}
