//
//  VistaFoto.swift
//  Actividad3_Moviles
//
//  Created by Lore Ang on 06/09/21.
//

import SwiftUI

struct VistaFoto: View {
    
    var foto: Image!
    
    var body: some View {
        foto
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct VistaFoto_Previews: PreviewProvider {
    static var previews: some View {
        VistaFoto(foto: Image("Donald"))
    }
}
