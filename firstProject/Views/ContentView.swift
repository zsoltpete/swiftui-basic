// SwiftUI keretrendszer importálása a felhasználói felület építéséhez
import SwiftUI

// ContentView struktúra, amely a fő nézetet definiálja
// View protokoll: minden SwiftUI nézet alapja
struct ContentView: View {
    // @State property wrapper:
    // - A nézet belső állapotát tárolja
    // - Amikor az érték megváltozik, a nézet automatikusan újrarajzolódik
    // - Egyszerű típusokhoz használjuk (String, Int, Bool, stb.)
    // - A SwiftUI kezeli a memóriát és az életciklust
    @State private var newTask: String = ""
    
    // @ObservedObject property wrapper:
    // - Külső, ObservableObject protokollt implementáló objektumot figyel
    // - Amikor a megfigyelt objektum @Published tulajdonságai változnak, a nézet frissül
    // - Komplexebb adatmodellekhez használjuk
    // - A tulajdonos nézet felelős az objektum életciklusáért
    @ObservedObject var taskStore: TaskStore
    
    var body: some View {
        // VStack: elemeket függőlegesen rendez el
        var test = 2
        test = 3
        
        return VStack {
            // HStack: elemeket vízszintesen rendez el
            HStack {
                // TextField: szövegbeviteli mező
                // A $newTask a @State változó binding-ja (kétirányú adatkötés)
                // A $ operátor létrehoz egy Binding<String> objektumot
                TextField("Új teendő", text: $newTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Button: gomb a teendő hozzáadásához
                Button(action: addTask) {
                    Text("Hozzáadás")
                }
            }
            .padding()
            .background(Color.yellow)// Padding hozzáadása a HStack körül
            
            // List: görgethetó lista a teendők megjelenítéséhez
            List {
                // ForEach: iterálás a taskStore.tasks tömbön
                // Mivel a Task implementálja az Identifiable protokollt, 
                // a ForEach automatikusan használja az id tulajdonságot
                
                ForEach(taskStore.tasks) { task in
                    // Minden teendő megjelenítése szövegként
                    Text(task.name)
                }
                // onDelete: swipe-to-delete funkcionalitás hozzáadása
                .onDelete(perform: deleteTask)
            }
        }
        .navigationTitle("Teendők")
    }
    
    // Metódus új teendő hozzáadásához
    private func addTask() {
        // Csak akkor adjuk hozzá, ha a szöveg nem üres
        if !newTask.isEmpty {
            // Új Task objektum létrehozása és hozzáadása a tárolóhoz
            taskStore.tasks.append(Task(name: newTask))
            // Beviteli mező törlése
            newTask = ""
            
            taskStore.tasks.enumerated().forEach { index, it in
                print(index)
                print(it.name)
            }
            
            for (index, it) in taskStore.tasks.enumerated() {
                print(index)
                print(it.name)
            }
        }
    }
    
    // Metódus teendő törléséhez
    // IndexSet: a törlendő elemek indexeit tartalmazza
    private func deleteTask(at offsets: IndexSet) {
        // Elemek eltávolítása a megadott indexeken
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

// Preview provider a SwiftUI előnézeti funkcióhoz
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // ContentView előnézete
        ContentView(taskStore: TaskStore())
    }
} 
