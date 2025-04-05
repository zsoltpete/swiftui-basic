// SwiftUI importálása
import SwiftUI

// Fő nézet az EnvironmentObject példához
struct EnvironmentExampleView: View {
    // @EnvironmentObject property wrapper:
    // - Hozzáférést biztosít a környezetben lévő megosztott objektumhoz
    // - Nem kell explicit átadni a nézeteknek
    // - Bármely gyermek nézet hozzáférhet
    @EnvironmentObject var settings: GlobalSettings
    
    // Helyi állapot a gyermek nézet hozzáférésének szabályozásához
    @State private var childViewEnabled: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("@EnvironmentObject Property Wrapper Példa")
                .font(.headline)
                .padding()
            
            // Felhasználó nevének megjelenítése és szerkesztése
            VStack {
                Text("Felhasználó neve: \(settings.userName)")
                Spacer(minLength: 50)
                
                TextField("Név módosítása", text: $settings.userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            HStack {
                Text("egy")
                Spacer()
                Text("egy")
                Spacer()
                Text("ketto")
            }
            
            // Betűméret beállítása
            VStack {
                Text("Betűméret beállítása: \(Int(settings.fontSize))")
                    .font(.subheadline)
                
                Slider(value: $settings.fontSize, in: 10...24, step: 1)
                    .padding()
                
                // Példa a betűméret alkalmazására
                Text("Ez a szöveg a beállított mérettel jelenik meg")
                    .font(.system(size: settings.fontSize))
                    .padding()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            // Gyermek nézet hozzáférésének szabályozása
            VStack {
                Text("Gyermek nézet hozzáférése")
                    .font(.subheadline)
                
                Toggle("Gyermek nézet engedélyezése", isOn: $childViewEnabled)
                    .padding()
                
                Text("Ha bekapcsolod, a gyermek nézet hozzáfér a beállításokhoz és nagyobb betűmérettel jelenik meg Ha bekapcsolod, a gyermek nézet hozzáfér a beállításokhoz és nagyobb betűmérettel jelenik meg Ha bekapcsolod, a gyermek nézet hozzáfér a beállításokhoz és nagyobb betűmérettel jelenik meg Ha bekapcsolod, a gyermek nézet hozzáfér a beállításokhoz és nagyobb betűmérettel jelenik meg ")
                    .font(.caption)
//                    .multilineTextAlignment(.trailing)
                    .lineLimit(2)
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            // Gyermek nézet, amely szintén hozzáfér a környezeti objektumhoz
            if childViewEnabled {
                ChildEnvironmentView(fontSize: settings.fontSize)
                    .padding()
            } else {
                // Letiltott gyermek nézet
                VStack {
                    Text("Gyermek nézet letiltva")
                        .font(.headline)
                    
                    Text("Kapcsold be a hozzáférést a gyermek nézet megjelenítéséhez")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            
            Spacer(minLength: 50) // Minimális méretű spacer a tartalom végén
        }
        .padding()
        .navigationTitle("Environment Példa")
    }
}

// Gyermek nézet, amely szintén használja az EnvironmentObject-et
struct ChildEnvironmentView: View {
    // Ugyanaz az objektum, mint a szülő nézetben
    @EnvironmentObject var settings: GlobalSettings
    
    // A szülőtől kapott betűméret
    var fontSize: Double
    
    var body: some View {
        VStack {
            Text("Gyermek nézet")
                .font(.system(size: fontSize)) // Használjuk a kapott betűméretet
            
            Text("Ez a nézet hozzáfér a globális beállításokhoz")
                .font(.system(size: fontSize - 2)) // Kicsit kisebb betűméret
                .padding()
            
            // Értesítések beállítása
            Toggle("Értesítések", isOn: $settings.notificationsEnabled)
                .padding()
            
            // Megjelenítjük a felhasználó nevét is
            Text("Üdvözöllek, \(settings.userName)!")
                .font(.system(size: fontSize))
                .padding()
            
            // Magyarázat
            Text("Ez a nézet az @EnvironmentObject-en keresztül hozzáfér a beállításokhoz, és a szülőtől kapott betűméretet használja")
                .font(.system(size: fontSize - 4))
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}

// Preview provider
struct EnvironmentExampleView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentExampleView()
            .environmentObject(GlobalSettings())
    }
} 
