import Foundation
import SwiftUI
import WebKit

public enum WebViewLoader {
    case url(URL)
    case html(String)
}

public struct WebView: UIViewRepresentable {
    @Binding public var loader: WebViewLoader

    @State private var shouldMoveToBack: Bool = false
    @State private var sholdMoveToFront: Bool = false

    @Environment(\.userAgentSuffix) private var userAgentSuffix

    public func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.applicationNameForUserAgent = userAgentSuffix
        let view = WKWebView(frame: .zero, configuration: config)
        view.isUserInteractionEnabled = true
        switch loader {
        case .url(let url):
            view.load(URLRequest(url: url))
        case .html(let html):
            view.loadHTMLString(html, baseURL: nil)
        }
        return view
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
        switch loader {
        case .url(let url):
            uiView.load(URLRequest(url: url))
        case .html(let html):
            uiView.loadHTMLString(html, baseURL: nil)
        }
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

extension WebView {
    public class Coordinator: NSObject {}
}
