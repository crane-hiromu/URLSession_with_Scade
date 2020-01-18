import ScadeKit
import Foundation

class CliantTest {
    
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
    
    func testCall() {
        let url = URL(string: "https://api.droidkaigi.jp/2020/speakers/")!
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with:request,completionHandler: { data, response, error in
            print(data, response, error.debugDescription, error?.localizedDescription)
            
            if let d = data, let result = try? JSONDecoder(type: .convertFromSnakeCase).decode([Speaker].self, from: d) {
                print("----result", result)
            }
        })
        task.resume()
        
    }
}

struct Device: Codable {
    var model: String
    var displaySize: Float
    var capacities: [Int]
    var biometricsAuth: String?
}
