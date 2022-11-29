import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack {
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundColor(.accentColor)
			Text("Hello Worlds")
		}
		. padding()
	}
}

class ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
	
#if DEBUG
	@objc class func injected() {
		let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
		windowScene?.windows.first?.rootViewController =
		UIHostingController(rootView: ContentView())
	}
#endif
}
