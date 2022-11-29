import SwiftUI

@main
struct meditationApp: App {
	init() {
#if DEBUG
		var injectionBundlePath = "/Applications/InjectionIII.app/Contents/Resources"
#if targetEnvironment(macCatalyst)
		injectionBundlePath = "\(injectionBundlePath)/macOSInjection.bundle"
#elseif os(iOS)
		injectionBundlePath = "\(injectionBundlePath)/iOSInjection.bundle"
#endif
		Bundle(path: injectionBundlePath)?.load()
#endif
	}
	
	var body: some Scene {
		WindowGroup {
			MeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data))
		}
	}
}
