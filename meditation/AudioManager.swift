import Foundation
import AVKit

final class AudioManager: ObservableObject {
		//		static let shared = AudioManager()
		var player: AVAudioPlayer?
		
		@Published private(set) var isPlaying = false {
				didSet {
						print("isPlaying: \(isPlaying)")
				}
		}
		
		@Published private(set) var isLooping = false {
				didSet {
						print("isLooping: \(isLooping)")
				}
		}
		
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
								isPlaying = true
						}
				} catch {
						print("failed to initialise player", error)
				}
		}
		
		func playPause() {
				if player?.isPlaying ?? false {
						player?.pause()
						isPlaying = false
				} else {
						player?.play()
						isPlaying = true
				}
		}
		
		func stop() {
				guard let player = player else { return }
				if player.isPlaying {
						player.stop()
						isPlaying = false
				}
		}
		
		func toggleLooping() {
				guard let player = player else { return }
				player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
				isLooping = player.numberOfLoops != 0
		}
}
