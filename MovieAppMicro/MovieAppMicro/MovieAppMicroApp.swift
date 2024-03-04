import SwiftUI
import TabMicro
import MyLocalPod
import PodToPackage

@main
struct MovieAppMicroApp: App {
    init() {
        LocalPodTest.sayHello()
        
    }
    var body: some Scene {
        WindowGroup {
            BottomTabView()
        }
    }
}
