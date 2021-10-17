//
//  ContentView.swift
//  Actividad2_Moviles
//
//  Created by Lore Ang on 30/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var valorSlider: Float = 0.5
    @State var valorPicker : Int = 1
    @State var valorToggle : Bool = true
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack {
                    Slider(value: $valorSlider)
                    Text(String(valorSlider))
                        .padding()
                }
                .background(Color.orange)
                Spacer()
                VStack {
                    Picker(selection: $valorPicker, label: Text("Posicion")) {
                        Text("Izquierda").tag(1)
                        Text("Derecha").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    GeometryReader { geo in
                        Text("🙈")
                        .font(.largeTitle)
                        .position(x: valorPicker == 1 ? geo.size.width * 0.1 : geo.size.width * 0.9, y: geo.size.height * 0.2)
                        .animation(.easeIn(duration: 1))
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.2)
                .background(Color.green)
                Spacer()
                VStack {
                    Toggle(isOn: $valorToggle) {
                        Text("Color de fondo")
                            .foregroundColor(valorToggle == true ? .yellow : .yellow)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .background(valorToggle == true ? Color.black : Color.gray)
            .animation(.easeInOut(duration: 1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
