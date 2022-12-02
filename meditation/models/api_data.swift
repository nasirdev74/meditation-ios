import Foundation

struct ApiData {
		var success:Bool
		var message: String
		var data: Any?
		var error: ApiError
		
		init(success: Bool, message: String, data: Any?, error: ApiError) {
				self.success = success
				self.message = message
				self.data = data
				self.error = error
		}
		
		init(from json: Dictionary<String, Any>) {
				self.success = (json["success"] as? Bool) ?? false
				self.message = (json["message"] as? String) ?? ""
				self.data = json["data"]
				let errorData = (json["error"] as? Dictionary<String, Any>) ?? [:]
				self.error =  ApiError(from: errorData)
		}
}
