import ScadeKit

class Scade_REST_API: SCDApplication {

	let window = SCDLatticeWindow()
	let mainAdapter = MainPageAdapter()
	
	override func onFinishLaunching() {	
		mainAdapter.load("main.page")
		mainAdapter.show(window)
	}
}
