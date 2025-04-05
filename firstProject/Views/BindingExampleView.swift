import SwiftUI

// Fő nézet a Binding példához
struct BindingExampleView: View {
    // @State változók, amelyeket átadunk a gyermek nézeteknek
    @State private var sliderValue: Double = 50
    @State private var toggleValue: Bool = false
    @State private var textValue: String = "Szerkeszthető szöveg"
    @State private var counter: Int = 0
    @State private var showActionSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("@Binding Property Wrapper Példa")
                    .font(.largeTitle)
                    .padding()
                
                // Slider értékének megjelenítése
                Text("Slider értéke: \(Int(sliderValue))")
                
                // SliderView komponens, amely @Binding-ot használ
                SliderView(value: $sliderValue)
                    .padding()
                
                Divider()
                
                // Toggle értékének megjelenítése
                Text("Toggle értéke: \(toggleValue ? "Bekapcsolva" : "Kikapcsolva")")
                
                // ToggleView komponens, amely @Binding-ot hasznconteál
                ToggleView(isOn: $toggleValue)
                    .padding()
                
                Divider()
                
                // Szöveg értékének megjelenítése
                Text("Szöveg értéke: \(textValue)")
                
                // TextView komponens, amely @Binding-ot használ
                TextView(text: $textValue)
                    .padding()
                
                Divider()
                
                // Számláló értékének megjelenítése
                Text("Számláló értéke: \(counter)")
                
                // CounterButtonView komponens, amely @Binding-ot használ
                CounterButtonView(counter: $counter, showActionSheet: $showActionSheet)
                    .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Binding Példa")
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                    title: Text("Számláló műv"),
                    message: Text("Válassz egy műveletet a számlálóval"),
                    buttons: [
                        ActionSheet.Button.default(Text("Növelés +10")) {
                            counter += 10
                        },
                        .default(Text("Csökkentés -10")) {
                            counter = max(0, counter - 10)
                        },
                        .destructive(Text("Visszaállítás")) {
                            counter = 0
                        },
                        .destructive(Text("Visszaállítás")) {
                            counter = 0
                        },
                        ActionSheet.Button.cancel()
                    ]
                )
            }
        }
        
        
    }
}

// Slider komponens, amely @Binding-ot használ
struct SliderView: View {
    // @Binding property wrapper:
    // - Más nézet által birtokolt @State változó referenciája
    // - Kétirányú adatkötést biztosít
    // - Lehetővé teszi, hogy a gyermek nézet módosítsa a szülő állapotát
    @Binding var value: Double
    
    var body: some View {
        VStack {
            Text("Slider komponens")
                .font(.subheadline)
            
            Slider(value: $value, in: 0...10, step: 1)
                .padding()
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(10)
    }
}

// Toggle komponens, amely @Binding-ot használ
struct ToggleView: View {
    // @Binding a toggle állapotához
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            Text("Toggle komponens")
                .font(.subheadline)
            
            Toggle("", isOn: $isOn)
                .padding()
                .background(.red)
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(10)
    }
}

// Szöveg komponens, amely @Binding-ot használ
struct TextView: View {
    // @Binding a szöveg értékéhez
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text("Szöveg komponens")
                .font(.subheadline)
            
            TextField("Írj ide valamit", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

// Új gomb komponens, amely @Binding-ot használ
struct CounterButtonView: View {
    // @Binding a számláló értékéhez
    @Binding var counter: Int
    // @Binding az action sheet megjelenítéséhez
    @Binding var showActionSheet: Bool
    
    var body: some View {
        VStack {
            Text("Gomb komponens")
                .font(.subheadline)
            
            // VStack a gombok függőleges elrendezéséhez
            VStack(spacing: 15) {
                // Gomb a számláló növeléséhez
                Button(action: {
                    counter += 1
                }) {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Növelés")
                    }
                    .frame(width: 100)
                    .padding()
                    .foregroundColor(.red)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                
                // Gomb a számláló csökkentéséhez
                Button(action: {
                    if counter > 0 {
                        counter -= 1
                    }
                }) {
                    HStack {
                        Image(systemName: "minus.circle")
                        Text("Csökkentés")
                    }
                    .frame(minWidth: 200)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                }
                
                // Gomb az action sheet megjelenítéséhez
                Button(action: {
                    showActionSheet = true
                }) {
                    HStack {
                        Image(systemName: "ellipsis.circle")
                        Text("Több")
                    }
                    .frame(minWidth: 200)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                }
            }
            
            // Magyarázó szöveg
            Text("Ez a komponens két @Binding-ot használ: egyet a számláló értékéhez, egyet pedig az action sheet megjelenítéséhez")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(.top)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

// Preview provider
struct BindingExampleView_Previews: PreviewProvider {
    static var previews: some View {
        BindingExampleView()
    }
} 
