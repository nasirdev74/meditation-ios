import SwiftUI

struct MeditationView: View {
	@State private var showPlayer = false
	@State var meditationVM: MeditationViewModel
	
	var body: some View {
		VStack(spacing: 0) {
			// MARK: Image
			Image(meditationVM.meditation.image)
				.resizable()
				.scaledToFill()
				.frame(height: UIScreen.main.bounds.height/3)
			ZStack {
				// MARK: Background
				Color(red: 24/255, green: 23/255, blue: 22/255)
					.frame(height: UIScreen.main.bounds.height * 2/3)
				VStack(alignment: .leading, spacing: 24) {
					// MARK: 	Type & Duration
					VStack(alignment: .leading, spacing: 8) {
						Text("Music")
						Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ?? meditationVM.meditation.duration.formatted() + "S")
						
					}
					.font(.subheadline)
					.textCase(.uppercase)
					.opacity(0.7)
					
					// MARK: Title
					Text(meditationVM.meditation.title)
						.font(.title)
					// MARK: Play Button
					Button(action:  {
						showPlayer = true
					}) {
						Label("Play", systemImage: "play.fill")
							.font(.headline)
							.foregroundColor(.black)
							.padding(.vertical, 10)
							.frame(maxWidth: .infinity)
							.background(.white)
							.cornerRadius(20)
					}
					// MARK: Description
					Text(meditationVM.meditation.description)
						.font(.title)
					Spacer()
				}
				.foregroundColor(.white)
				.padding(20)
			}
		}
		.ignoresSafeArea()
		.fullScreenCover(isPresented: $showPlayer) {
			PlayerView(meditationVM: meditationVM)
		}
	}
}


class MeditationViewP: PreviewProvider {
	static let meditationVM = MeditationViewModel(meditation: Meditation.data)
	static var previews: some View {
		MeditationView(meditationVM: meditationVM)
	}
#if DEBUG
	@objc class func injected() {
		let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
		windowScene?.windows.first?.rootViewController =
		UIHostingController(rootView: MeditationView(meditationVM: meditationVM))
	}
#endif
}
