// Foundation és Combine importálása
import Foundation

// Globális beállításokat kezelő osztály
class GlobalSettings: ObservableObject {
    // Betűméret beállítása
    @Published var fontSize: Double = 14.0
    
    // Értesítések engedélyezése
    @Published var notificationsEnabled: Bool = true
    
    // Felhasználó neve
    @Published var userName: String = "Felhasználó"
} 
