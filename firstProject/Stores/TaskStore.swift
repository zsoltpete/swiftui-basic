// Foundation és Combine importálása
import Foundation
import Combine
import SwiftUI

// TaskStore osztály, amely a teendők tárolásáért és kezeléséért felelős
// ObservableObject protokoll: lehetővé teszi, hogy a SwiftUI nézetek figyeljék az objektum változásait
class TaskStore: ObservableObject {
    // @Published property wrapper:
    // - Automatikusan értesíti az összes megfigyelőt (pl. SwiftUI nézeteket), amikor a tasks tömb megváltozik
    // - Amikor egy elem hozzáadódik, törlődik vagy módosul a tömbben, a nézet automatikusan frissül
    // - A Combine keretrendszer Publisher-t hoz létre a háttérben
    @Published var tasks: [Task] = []
    
    // Itt további metódusokat adhatnánk hozzá a teendők kezeléséhez,
    // például mentés, betöltés, szűrés, stb.
} 