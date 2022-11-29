import SwiftUI

struct PlayerView: View {
	var meditationVM: MeditationViewModel
	@State private var value = 0.0
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		ZStack {
			// MARK: Background Image
			Image(meditationVM.meditation.image)
				.resizable()
				.scaledToFill()
				.frame(width: UIScreen.main.bounds.width)
				.ignoresSafeArea()
			
			// MARK: Blur view
			Rectangle()
				.background(.thinMaterial)
				.opacity(0.25)
				.ignoresSafeArea()
			
			VStack(spacing: 32) {
				HStack {
					// MARK: Button View
					Button(action: {
						dismiss()
					}) {
						Image(systemName: "xmark.circle.fill")
							.font(.system(size: 36))
							.foregroundColor(.white)
						Spacer()
					}
				}
				
				//MARK: Title
				Text(meditationVM.meditation.title)
					.font(.title)
					.foregroundColor(.white)
				
				Spacer()
				
				// MARK: Playback
				VStack(spacing: 5) {
					Slider(value: $value, in: 0...60)
						.accentColor(.white)
					
					HStack {
						Text("0")
						Spacer()
						Text("1 minute")
					}
					.font(.caption)
					.foregroundColor(.white)
				}
				
				// MARK: action buttons
				HStack {
					// MARK: repeat button
					PlayBackControlButton(systemName: "repeat")
					
					Spacer()
					// MARK: back button
					PlayBackControlButton(systemName: "gobackward.10") {}
					
					Spacer()
					// MARK: play button
					PlayBackControlButton(systemName: "play.circle.fill", fontSize: 44) {}
					
					Spacer()
					// MARK: forward button
					PlayBackControlButton(systemName: "goforward.10") {}
					
					Spacer()
					// MARK: stop button
					PlayBackControlButton(systemName: "stop.fill") {}
				}
				
			}.padding(20)
		}
		.onAppear {
			AudioManager.shared.startPlayer(track: meditationVM.meditation.track)
		}
	}
}

class PlayerViewP: PreviewProvider {
	static var meditationVM = MeditationViewModel(meditation: Meditation.data)
	
	static var previews: some View {
		PlayerView(meditationVM: meditationVM)
	}
#if DEBUG
	@objc class func injected() {
		let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
		windowScene?.windows.first?.rootViewController =
		UIHostingController(rootView: PlayerView(meditationVM: meditationVM))
	}
#endif
}
