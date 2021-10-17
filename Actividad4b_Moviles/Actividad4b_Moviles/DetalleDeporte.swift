//
//  DetalleDeporte.swift
//  Actividad4b_Moviles
//
//  Created by Lore Ang on 20/09/21.
//

import SwiftUI

struct DetalleDeporte: View {
    
    var titulo : String
    var imagen : String
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                Text(titulo)
                    .font(.largeTitle)
                    .padding()
                Text(imagen)
                    .font(.system(size: 100))
                    .padding()
            }
        }
    }
}

struct DetalleDeporte_Previews: PreviewProvider {
    static var previews: some View {
        DetalleDeporte(titulo: "Basketball", imagen: "🏀")
    }
}
