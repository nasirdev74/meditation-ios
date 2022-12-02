import SwiftUI

struct PlayerView: View {
		var meditationVM: MeditationViewModel
		@State private var value = 0.0
		@State private var isEditing = false
		@Environment(\.dismiss) var dismiss
		@EnvironmentObject var audioManager: AudioManager
		let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
		
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
												audioManager.stop()
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
										Slider(value: $value, in: 0...(audioManager.player?.duration ?? 0.0)) { editing in
												isEditing = editing
												if(!editing) {
														audioManager.player?.currentTime = value
												}
										}
										.accentColor(.white)
										
										HStack {
												Text(DateComponentsFormatter.positional.string(from: audioManager.player?.currentTime ?? 0.0) ?? "0:00")
												Spacer()
												Text(DateComponentsFormatter.positional.string(from:
																																																												((audioManager.player?.duration ?? 0.0) - (audioManager.player?.currentTime ?? 0.0))) ?? "0:00")
										}
										.font(.caption)
										.foregroundColor(.white)
								}
								
								// MARK: action buttons
								HStack {
										
										let color: Color = audioManager.isLooping ? .teal : .white
										// MARK: repeat button
										PlayBackControlButton(systemName: "repeat", color: color) {
												audioManager.toggleLooping()
										}
										
										Spacer()
										// MARK: back button
										PlayBackControlButton(systemName: "gobackward.10") {
												audioManager.player?.currentTime -= 10
										}
										
										Spacer()
										// MARK: play button
										PlayBackControlButton(systemName: (audioManager.isPlaying) ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
												audioManager.playPause()
										}
										
										Spacer()
										// MARK: forward button
										PlayBackControlButton(systemName: "goforward.10") {
												audioManager.player?.currentTime += 10
										}
										
										Spacer()
										// MARK: stop button
										PlayBackControlButton(systemName: "stop.fill") {
												audioManager.stop()
												dismiss()
										}
								}
								
						}.padding(20)
				}
				.onAppear {
						audioManager.startPlayer(track: meditationVM.meditation.track)
				}.onReceive(timer) { _ in
						guard let player = audioManager.player, !isEditing else { return }
						value = player.currentTime
				}
		}
}

class PlayerViewP: PreviewProvider {
		static var meditationVM = MeditationViewModel(meditation: Meditation.data)
		
		static var previews: some View {
				PlayerView(meditationVM: meditationVM).environmentObject(AudioManager())
		}
}
