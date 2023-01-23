import SwiftUI

struct ContentView: View {

    @Environment(\.analytics) var analytics

    @State private var loader: WebViewLoader = .url(
        URL(string: "https://developer.apple.com/documentation/")!
    )

    var body: some View {
        ZStack {
            WebView(loader: $loader)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        analytics.send(
                            .init(
                                name: "Tap Button",
                                parameters: ["device_uuid": UUID().uuidString]
                            )
                        )
                    } label: {
                        Text("Send Analytics")
                    }
                    .buttonStyle(.shadow)

                }
            }
        }
        .padding()
    }
}

struct ShadowButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(12)
                .shadow(radius: 8)
    }
}

extension ButtonStyle where Self == ShadowButtonStyle {
    static var shadow: ShadowButtonStyle {
        ShadowButtonStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
