//
//  ViewEditar.swift
//  Actividad3_Moviles
//
//  Created by Lore Ang on 06/09/21.
//

import SwiftUI

struct ViewEditar: View {
    
    @Binding var nombre: String
    @Binding var correo: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Nombre: ")
            TextField("Teclea tu nombre", text: $nombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Correo: ")
            TextField("Teclea tu correo", text: $correo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct ViewEditar_Previews: PreviewProvider {
    static var previews: some View {
        ViewEditar(nombre: .constant("Donald"), correo: .constant("donald@disney.com"))
    }
}
