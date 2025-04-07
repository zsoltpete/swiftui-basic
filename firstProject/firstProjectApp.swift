// SwiftUI importálása
import SwiftUI

// Az alkalmazás belépési pontja tetetete
@main
struct TodoListApp: App {
    // Létrehozunk egy GlobalSettings példányt az alkalmazás szintjén
    @StateObject private var settings    = GlobalSettings()  
    
    var body: some Scene {
        WindowGroup {
            // A MainTabView használata a ContentView helyett
            MainTabView()
                // Az EnvironmentObject hozzáadása a környezethezz
                .environmentObject(settings)
        }
    }
} 
