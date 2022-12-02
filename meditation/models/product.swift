import Foundation

struct Product {
		let id: Int
		let name: String
		let price: Int
		let count: Int
		let isActive: Bool
		let type: String
		let product_id: String
		let createdAt: String
		let updatedAt: String
		
		init(id: Int, name: String, price: Int, count: Int, isActive: Bool, type: String, product_id: String, createdAt: String, updatedAt: String) {
				self.id = id
				self.name = name
				self.price = price
				self.count = count
				self.isActive = isActive
				self.type = type
				self.product_id = product_id
				self.createdAt = createdAt
				self.updatedAt = updatedAt
		}
		
		init(from json: Dictionary<String, Any>) {
				self.id = (json["id"] as? Int) ?? 0
				self.name = (json["name"] as? String) ?? ""
//				self.price = (json["price"] as? any Numeric) ?? 0
				self.count = (json["count"] as? Int) ?? 0
				self.price = (json["price"] as? Int) ?? 0
				self.isActive = (json["isActive"] as? Bool) ?? false
				self.type = (json["type"] as? String) ?? "COIN"
				self.product_id = (json["product_id"] as? String) ?? ""
				self.createdAt = (json["createdAt"] as? String) ?? ""
				self.updatedAt = (json["updatedAt"] as? String) ?? ""
		}
}
