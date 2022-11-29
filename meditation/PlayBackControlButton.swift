import SwiftUI

struct PlayBackControlButton: View {
	var systemName = "play"
	var fontSize = 24.0
	var color = Color.white
	var action = {}
	
	var body: some View {
		Button (
			action: {
				action()
			}) {
				Image(systemName: systemName)
					.font(.system(size: fontSize))
					.foregroundColor(color)
		}
	}
}
