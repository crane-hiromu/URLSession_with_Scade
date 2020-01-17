import Foundation

// MARK: - Request

struct SpeakersRequest: BaseRequestProtocol {
	
	typealias ResponseType = [Speaker]

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/speakers"
//		return "/bins/f93xy"
    }

    var parameters: Parameters? {
        return nil
    }
}