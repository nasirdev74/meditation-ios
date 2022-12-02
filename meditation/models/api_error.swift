import Foundation

struct ApiError {
		var status: Bool
		var code: Int
		var message: String
		
		init( status: Bool,
								code: Int,
								message: String) {
				self.status = status
				self.code = code
				self.message = message
		}
		
		init(from json: Dictionary<String, Any>) {
				self.status = (json["status"] as? Bool) ?? false
				self.code = (json["code"] as? Int) ?? 0
				self.message = (json["message"] as? String) ?? ""
		}
}
