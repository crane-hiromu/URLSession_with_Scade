import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		/// api
		HttpClient.call(SpeakersRequest()) { result in
			switch result {
			case .success(let data):
				print("-----success", data)
			case .failure(let error):
				print("-----failure", error)
			}
		}
		
		// testDecode()
	}
}

private extension MainPageAdapter {
	
	func testDecode() {
		let data = """
			{
			"model": "iPhone X",
			"displaySize": 5.8,
			"capacities": [64, 256],
			"biometricsAuth": "Face ID"
			}
		"""
		.data(using: .utf8)!
		
		let device = try? JSONDecoder().decode(Device.self, from: data)
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		
		do {
			let encoded = try encoder.encode(device)
			print("------do", String(data: encoded, encoding: .utf8)!)	
		} catch let error {
			print("------error", error)
		}
		
	}
}

struct Device: Codable {
	var model: String
	var displaySize: Float
	var capacities: [Int]
	var biometricsAuth: String?
}