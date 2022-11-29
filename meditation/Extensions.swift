import Foundation

extension DateComponentsFormatter {
	static let abbreviated: DateComponentsFormatter = {
		print("initialising DateComponentsFormatter.abbreviated")
		let formatter = DateComponentsFormatter()
		formatter.allowedUnits = [.hour, .minute, .second]
		formatter.unitsStyle = .abbreviated
		
		return formatter
	}()
	
	static let positional: DateComponentsFormatter = {
		print("initialising DateComponentsFormatter.positional")
		let formatter = DateComponentsFormatter()
		formatter.allowedUnits = [.minute, .second]
		formatter.unitsStyle = .positional
		formatter.zeroFormattingBehavior = .pad
		
		return formatter
	}()
}
