//
//  Deporte.swift
//  Actividad4b_Moviles
//
//  Created by Lore Ang on 20/09/21.
//

import UIKit

class Deporte: NSObject {
    var nombre : String
    var imagen : String
    
    init(nombre : String, imagen : String) {
        self.nombre = nombre
        self.imagen = imagen
    }
}
