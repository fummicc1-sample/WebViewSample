import SwiftUI

public struct UserAgentSuffixKey: EnvironmentKey {
    public static var defaultValue: String = "WebViewSample"
}

public struct AnalyticsKey: EnvironmentKey {
    public static var defaultValue: Analytics = AppAnalytics()
}

public extension EnvironmentValues {
    var userAgentSuffix: String {
        get {
            self[UserAgentSuffixKey.self]
        } set {
            self[UserAgentSuffixKey.self] = newValue
        }
    }
    var analytics: Analytics {
        get {
            self[AnalyticsKey.self]
        } set {
            self[AnalyticsKey.self] = newValue
        }
    }
}
