//
//  ContentView.swift
//  Actividad3_Moviles
//
//  Created by Lore Ang on 06/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var nombre : String = "Donald"
    @State var correo : String = "donald@gmail.com"
    @State var mostrarFoto : Bool = false
    @State var mostrarEditar : Bool = false
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack {
                Color.init(Color.RGBColorSpace.sRGB, red: 202/255, green: 240/255, blue: 248/255, opacity: 1)
                VStack {
                    Button(action: {
                        mostrarFoto = true
                    }) {
                        Image("Donald")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .sheet(isPresented: $mostrarFoto, content: {
                        VistaFoto(foto: Image("Donald"))
                    })
                }
            }
            ZStack {
                Color.init(Color.RGBColorSpace.sRGB, red: 0/255, green: 150/255, blue: 216/255, opacity: 1)
                VStack {
                    Text("Nombre: " + nombre)
                        .padding()
                    Text("Correo: " + correo)
                        .padding()
                    Button(action: {
                        mostrarEditar = true
                    }) {
                        Text("Editar")
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .sheet(isPresented: $mostrarEditar, content: {
                        ViewEditar(nombre: $nombre, correo: $correo)
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
