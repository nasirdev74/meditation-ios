import SwiftUI

@main
struct meditationApp: App {
		@StateObject var audioManager = AudioManager()
		
		var body: some Scene {
				WindowGroup {
						MeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data))
								.environmentObject(audioManager)
				}
		}
}
