//
//  ContentView.swift
//  Actividad4b_Moviles
//
//  Created by Lore Ang on 20/09/21.
//

import SwiftUI

struct ContentView: View {
    
    var listaDeportes = [
        Deporte(nombre: "Soccer", imagen: "β½οΈ"),
        Deporte(nombre: "Football", imagen: "π"),
        Deporte(nombre: "Basketball", imagen: "π"),
        Deporte(nombre: "Tennis", imagen: "πΎ"),
        Deporte(nombre: "Baseball", imagen: "βΎοΈ")
    ]
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach (listaDeportes, id:\.self) { deporte in
                    NavigationLink(
                        destination: DetalleDeporte(titulo: deporte.nombre, imagen: deporte.imagen),
                        label: {
                            celdaDeporte(titulo: deporte.nombre, imagen: deporte.imagen)
                        })
                }
            }
            .navigationTitle("Deportes")
            .font(.largeTitle)
        }
    }
}

struct celdaDeporte : View {
    var titulo : String
    var imagen : String
    
    var body: some View {
        HStack {
            Text(imagen)
                .font(.system(size: 80))
            Spacer()
            Text(titulo)
                .font(.title)
                .padding()
        }
        .background(Color.gray)
        .cornerRadius(10)
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
