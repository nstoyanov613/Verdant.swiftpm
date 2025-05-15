import SwiftUI

@main
struct MyApp: App {
    
    @State private var showApp = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showApp {
                    ContentView()
                        .transition(.opacity)
                } else {
                    Image(systemName: "leaf.fill")
                        .foregroundStyle(.green)
                        .font(.largeTitle)
                        .transition(.opacity)
                        .symbolEffect(.bounce, options: .speed(0.5), isActive: true)
                }
            }
            .animation(.easeInOut(duration: 0.5), value: showApp)
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        showApp = true
                    }
                }
            }
            
        }
    }
}
