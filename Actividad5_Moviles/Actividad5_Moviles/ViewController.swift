//
//  ViewController.swift
//  Actividad5_Moviles
//
//  Created by Lore Ang on 04/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tfX: UITextField!
    @IBOutlet weak var tfY: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbNombre: UILabel!
    
    var listaCoordenadas = [Coordenada]()
    var tamano: Int = 0
    var fondo: Bool = false
    var nombre: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        actualizaInterfaz()
        lbNombre.text = nombre
        actualizaTamano()
        
        // UIApplication.shared se refiere a la aplicación
        let app = UIApplication.shared

        // Registrar en centro de notificaciones para llamar al método guardarCoordenadas cuando la aplicación vaya al background
        NotificationCenter.default.addObserver(self, selector: #selector(guardarCoordenadas), name: UIApplication.didEnterBackgroundNotification, object: app)
        
        // Si hay archivo con datos, cargarlo, sino dejar lista vacía
        if FileManager.default.fileExists(atPath: dataFileURL().path) {
            obtenerCoordenadas()
        }
    }
    
    @IBAction func agregaCoordenada(_ sender: UIButton) {
        if let x = Int(tfX.text!), let y = Int(tfY.text!) {
            let coor = Coordenada(x: x, y: y)
            listaCoordenadas.append(coor)
            tableView.reloadData()
            
            tfX.text = ""
            tfY.text = ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaCoordenadas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda")!
        
        cell.textLabel?.text = "(" + String(listaCoordenadas[indexPath.row].x) + ", " + String(listaCoordenadas[indexPath.row].y) + ")"
        
        actualizaInterfaz()
        
        if (fondo) {
            cell.contentView.backgroundColor = UIColor(red: 54/255, green: 125/255, blue: 217/255, alpha: 0.1)
        }
        else {
            cell.contentView.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    // Regresa url del archivo en el directorio Documents (sandbox)
    func dataFileURL() -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = documentsDirectory.appendingPathComponent("Empleados").appendingPathExtension("plist")
        return pathArchivo
    }
    
    // MARK: - Métodos para guardar y obtener las coordenadas
    @IBAction func guardarCoordenadas() {
        do {
            let data = try PropertyListEncoder().encode(listaCoordenadas)
            try data.write(to: dataFileURL())
        }
        catch {
            print("Error al guardar los datos")
        }
    }
    
    @IBAction func obtenerCoordenadas() {
        listaCoordenadas.removeAll()

        do {
            let data = try Data.init(contentsOf: dataFileURL())
            listaCoordenadas = try PropertyListDecoder().decode([Coordenada].self, from: data)
        }
        catch {
            print("Error al cargar los datos del archivo")
        }

        tableView.reloadData()
    }
    
    func actualizaInterfaz() {
        let defaults = UserDefaults.standard
        if let texto = defaults.value(forKey: "texto") as? String {
            nombre = texto
        }
        tamano = defaults.integer(forKey: "entero")
        fondo = defaults.bool(forKey: "booleano")
    }
    
    func actualizaTamano() {
        switch tamano {
            case 0:
                self.tableView.rowHeight = 45
            case 1:
                self.tableView.rowHeight = 65
            case 2:
                self.tableView.rowHeight = 95
        default:
            self.tableView.rowHeight = 45
        }
        
        tableView.reloadData()
    }
}

