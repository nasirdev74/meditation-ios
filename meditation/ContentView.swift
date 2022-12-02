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
}
