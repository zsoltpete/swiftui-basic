// SwiftUI importálása
import SwiftUI

// Fő nézet a ViewBuilder példához
struct ViewBuilderExampleView: View {
    var body: some View {
        let test = 0
        VStack(spacing: 20) {
            Text("@ViewBuilder Property Wrapper Példa")
                .font(.headline)
                .padding()
            
            // Magyarázó szöveg
            Text("A ViewBuilder lehetővé teszi, hogy egyéni nézeteket hozzunk létre, amelyek más nézeteket tartalmaznak.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding()
            
            // Egyszerű példa a ViewBuilder használatára
            VStack {
                Text("Egyszerű példa")
                    .font(.subheadline)
                
                // Egyéni kártya nézetek használata
                SimpleCardView(title: "Első kártya", iconName: "star")
                
                InfoCardView(title: "Második kártya", message: "Ez egy információs kártya.")
                
                WarningCardView(title: "Figyelmeztetés", message: "Ez egy figyelmeztető kártya!")
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            // ViewBuilder használata függvényben
            VStack {
                Text("ViewBuilder függvény")
                    .font(.subheadline)
                
                // Különböző típusú kártyák megjelenítése
                createCardView(type: .success, title: "Siker", message: "A művelet sikeres volt!")
                createCardView(type: .error, title: "Hiba", message: "Hiba történt a művelet során.")
                createCardView(type: .info, title: "Információ", message: "Ez egy információs üzenet.")
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            // Magyarázat
            VStack {
                Text("ViewBuilder magyarázat")
                    .font(.headline)
                
                Text("A @ViewBuilder egy property wrapper, amely lehetővé teszi, hogy több nézetet adjunk vissza egy függvényből. A SwiftUI automatikusan használja a ViewBuilder-t a body tulajdonságban, de saját függvényeinkben explicit módon kell megadnunk.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
            .background(Color.yellow.opacity(0.1))
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("ViewBuilder Példa")
    }
    
    // Kártya típusok
    enum CardType {
        case success
        case error
        case info
    }
    
    // ViewBuilder függvény különböző kártyák létrehozásához
    @ViewBuilder
    func createCardView(type: CardType, title: String, message: String) -> some View {
        switch type {
        case .success:
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.title2)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(message)
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            .background(Color.green.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green, lineWidth: 1)
            )
            .padding(.horizontal)
            
        case .error:
            HStack {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .font(.title2)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(message)
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            .background(Color.red.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 1)
            )
            .padding(.horizontal)
            
        case .info:
            VStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(message)
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .padding(.horizontal)
        }
    }
}

// Egyszerű kártya nézet
struct SimpleCardView: View {
    let title: String
    let iconName: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title3)
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}

// Információs kártya nézet
struct InfoCardView: View {
    let title: String
    let message: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            Divider()
            
            Text(message)
                .font(.body)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}

// Figyelmeztető kártya nézet
struct WarningCardView: View {
    let title: String
    let message: String
    
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle")
                .foregroundColor(.orange)
                .font(.title2)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.orange)
                
                Text(message)
                    .font(.body)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.orange, lineWidth: 1)
        )
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}

// Preview provider
struct ViewBuilderExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderExampleView()
    }
} 
