//
//  ViewControllerConfig.swift
//  Actividad5_Moviles
//
//  Created by Lore Ang on 04/10/21.
//

import UIKit

class ViewControllerConfig: UIViewController {

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var segCont: UISegmentedControl!
    @IBOutlet weak var sw: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIApplication.shared se refiere a la aplicación
        let app = UIApplication.shared

        // Registrar en centro de notificaciones para llamar al método guardarDatosInterfaz cuando la aplicación vaya al background
        NotificationCenter.default.addObserver(self, selector: #selector(guardarDatosInterfaz), name: UIApplication.didEnterBackgroundNotification, object: app)
        
        actualizaInterfaz()
    }
    
    func actualizaInterfaz() {
        let defaults = UserDefaults.standard
        if let texto = defaults.value(forKey: "texto") as? String {
            tfNombre.text = texto
        }
        let entero = defaults.integer(forKey: "entero")
        segCont.selectedSegmentIndex = entero
        let booleano = defaults.bool(forKey: "booleano")
        sw.isOn = booleano
    }
    
    @IBAction func guardarDatosInterfaz() {
        let defaults = UserDefaults.standard
        
        defaults.setValue(tfNombre.text, forKey: "texto")
        defaults.set(segCont.selectedSegmentIndex, forKey: "entero")
        defaults.set(sw.isOn, forKey: "booleano")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guardarDatosInterfaz()
        
        let vistaIni = presentingViewController as! ViewController
        vistaIni.lbNombre.text = tfNombre.text
        vistaIni.tamano = segCont.selectedSegmentIndex
        vistaIni.fondo = sw.isOn
        vistaIni.actualizaTamano()
    }
}
