import Foundation
import AVKit

final class AudioManager {
	static let shared = AudioManager()
	var player: AVAudioPlayer?
	
	func startPlayer(track: String, isPreview: Bool = false) {
		guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
			print("Resource not found \(track)")
			return
		}
		do {
			try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
			try AVAudioSession.sharedInstance().setActive(true)
			player = try AVAudioPlayer(contentsOf: url)
			if isPreview {
				player?.prepareToPlay()
			} else {
				player?.play()
			}
		} catch {
			print("failed to initialise player", error)
		}
	}
}
