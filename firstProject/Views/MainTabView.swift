// SwiftUI keretrendszer importálása
import SwiftUI

// Fő TabBar nézet, amely összefogja az alkalmazás különböző részeit
struct MainTabView: View {
    // @StateObject property wrapper:
    // - Hasonló az @ObservedObject-hez, de a SwiftUI kezeli az életciklusát
    // - A nézet létrehozásakor egyszer jön létre és a nézet életciklusához kötődik
    // - Akkor használjuk, amikor a nézet felelős az objektum létrehozásáért
    @StateObject private var taskStore = TaskStore()
    
    // @StateObject a globális beállításokhoz
    @StateObject private var settings = GlobalSettings()
    
    var body: some View {
        // TabView: tabokat tartalmazó nézet
        TabView {
            // Első tab: a már meglévő teendőlista
            NavigationView {
                ContentView(taskStore: taskStore)
            }
            
            .tabItem {
                Label("Teendők", systemImage: "checklist")
            }
            
            // Második tab: @Binding példa
            NavigationView {
                
                    BindingExampleView()
                        .padding()
//                }
            }
            .tabItem {
                Label("Binding", systemImage: "link")
            }
            
            // Harmadik tab: @EnvironmentObject példa
            NavigationView {
                ScrollView {
                    EnvironmentExampleView()
                        .padding()
                }
            }
            .tabItem {
                Label("Environment", systemImage: "globe")
            }
            
            // Negyedik tab: @AppStorage példa
            NavigationView {
                ScrollView {
                    AppStorageExampleView()
                        .padding()
                }
            }
            .tabItem {
                Label("Beállítások", systemImage: "gear")
            }
            
            // Ötödik tab: @ViewBuilder példa
            NavigationView {
                ScrollView {
                    ViewBuilderExampleView()
                        .padding()
                }
            }
            .tabItem {
                Label("ViewBuilder", systemImage: "rectangle.stack")
            }
        }
        // Az EnvironmentObject hozzáadása a környezethez
        // Így minden gyermek nézet hozzáférhet a settings objektumhoz
//        .environmentObject(settings)
        // A taskStore hozzáadása a környezethez
//        .environmentObject(taskStore)
    }
}

// Preview provider
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
} 
