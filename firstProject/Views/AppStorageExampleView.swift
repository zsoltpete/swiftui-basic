// SwiftUI importálása
import SwiftUI

// Fő nézet az AppStorage példához
struct AppStorageExampleView: View {
    // @AppStorage property wrapper:
    // - UserDefaults-ban tárolja az adatokat
    // - Alkalmazás újraindítása után is megmarad
    // - Automatikusan szinkronizálja a UserDefaults értékét a SwiftUI nézettel
    @AppStorage("username") private var username: String = "Alapértelmezett név"
    @AppStorage("refreshInterval") private var refreshInterval: Double = 10
    @AppStorage("lastOpenedDate") private var lastOpenedDate: Double = Date().timeIntervalSince1970
    
    // Időzítő a frissítési intervallum demonstrálásához
    @State private var timeRemaining: Double = 10
    @State private var timer: Timer? = nil
    @State private var isTimerRunning: Bool = false
    
    // Formázott dátum a másodpercek megjelenítéséhez
    private var formattedDate: String {
        let date = Date(timeIntervalSince1970: lastOpenedDate)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium // .medium formátum másodperceket is mutat
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("@AppStorage Property Wrapper Példa")
                .font(.headline)
                .padding()
            
            Text("Ezek a beállítások megmaradnak az alkalmazás újraindítása után is")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding()
            
            // Felhasználónév beállítása
            VStack {
                Text("Felhasználónév")
                    .font(.subheadline)
                
                TextField("Felhasználónév", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("Üdvözöllek, \(username)!")
                    .font(.body)
                    .padding(.top, 5)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            // Frissítési intervallum beállítása - most már használjuk is
            VStack {
                Text("Automatikus frissítési intervallum: \(Int(refreshInterval)) másodperc")
                    .font(.subheadline)
                
                Slider(value: $refreshInterval, in: 5...60, step: 5)
                    .padding()
                    .onChange(of: refreshInterval) { newValue in
                        // Ha változik az intervallum és fut a timer, újraindítjuk
                        if isTimerRunning {
                            stopTimer()
                            startTimer()
                        }
                    }
                
                // Időzítő állapota és vezérlése
                HStack {
                    if isTimerRunning {
                        Text("Következő frissítés: \(Int(timeRemaining)) mp múlva")
                            .foregroundColor(.blue)
                    } else {
                        Text("Időzítő leállítva")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button(isTimerRunning ? "Leállítás" : "Indítás") {
                        if isTimerRunning {
                            stopTimer()
                        } else {
                            startTimer()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(isTimerRunning ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            // Utolsó megnyitás dátuma - most másodpercekkel együtt
            VStack {
                Text("Utolsó frissítés")
                    .font(.subheadline)
                
                Text(formattedDate)
                    .font(.body)
                    .padding(.vertical, 5)
                
                Button("Frissítés most") {
                    updateLastOpenedDate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("AppStorage Példa")
        .onAppear {
            // Frissítjük az utolsó megnyitás dátumát, amikor a nézet megjelenik
            updateLastOpenedDate()
            // Beállítjuk a kezdeti időt
            timeRemaining = refreshInterval
            
            let username = UserDefaults.standard.value(forKey: "username") as! String
            
            print(username)
            
            let a = "a"
            let b = "b"
            
            let c = a + b
            
            let name = username + username
            
            print(name)
            
            
        }
        .onDisappear {
            // Leállítjuk az időzítőt, amikor a nézet eltűnik
            stopTimer()
        }
    }
    
    // Időzítő indítása
    private func startTimer() {
        timeRemaining = refreshInterval
        isTimerRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
                print(timeRemaining)
            } else {
                print(timeRemaining)
                // Ha lejárt az idő, frissítjük a dátumot és újraindítjuk az időzítőt
                updateLastOpenedDate()
                timeRemaining = refreshInterval
            }
        }
    }
    
    // Időzítő leállítása
    private func stopTimer() {
//        timer?.invalidate()
//        timer = nil
        isTimerRunning = false
        
    }
    
    // Utolsó megnyitás dátumának frissítése
    private func updateLastOpenedDate() {
        lastOpenedDate = Date().timeIntervalSince1970
    }
}

// Preview provider
struct AppStorageExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageExampleView()
    }
} 
