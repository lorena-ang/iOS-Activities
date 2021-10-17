//
//  ViewController.swift
//  Actividad1_Moviles
//
//  Created by Lore Ang on 23/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbMensaje: UILabel!
    @IBOutlet weak var imgAxolotl: UIImageView!
    @IBOutlet weak var uiViewRect: UIView!
    @IBOutlet weak var uiSegCont: UISegmentedControl!
    @IBOutlet weak var uiSlider: UISlider!
    
    // Animación para cambiar color de fondo con el UISegmentedControl
    @IBAction func indexChanged(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            switch self.uiSegCont.selectedSegmentIndex
            {
            case 0:
                let colorBeige = UIColor(red: 240/255.0, green: 235/255.0, blue: 225/255.0, alpha: 1.0)
                self.view.backgroundColor = colorBeige
            case 1:
                let colorRosa = UIColor(red: 232/255.0, green: 204/255.0, blue: 215/255.0, alpha: 1.0)
                self.view.backgroundColor = colorRosa
            default:
                break
            }
        }
    }
    
    // Mover UIView con slider
    @IBAction func sliderMoveRect(_ sender: UISlider) {
            uiViewRect.frame.origin.x = (uiSlider.frame.size.width * CGFloat(sender.value)) + 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgAxolotl.image = UIImage(named: "axolotl")
        // Para que UIView aparezca sobre la imagen
        self.view.bringSubviewToFront(uiViewRect)
    }
}
