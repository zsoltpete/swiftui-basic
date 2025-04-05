// Foundation keretrendszer importálása, amely alapvető funkciókat biztosít
import Foundation

// Task struktúra, amely egy teendőt reprezentál
// Az Identifiable protokoll implementálása lehetővé teszi, hogy a ForEach használhassa
struct Task: Identifiable {
    
    // Egyedi azonosító minden Task példányhoz
    // UUID() automatikusan generál egy egyedi azonosítót
    let id = UUID()
    
    // A teendő neve/leírása
    var name: String
} 
