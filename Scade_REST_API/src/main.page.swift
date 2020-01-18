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
	}
}