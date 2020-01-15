//
//  DetalleViewController.swift
//  movie
//
//  Created by Ggamma MAC on 14/01/20.
//  Copyright © 2020 P. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

        var detailName: pelicula?
      var detailImagen: String?
    
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var duracion: UILabel!
    
    @IBOutlet weak var estreno: UILabel!
    
    @IBOutlet weak var calificacion: UILabel!
    

    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var des: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titulo.text = detailName?.title
        duracion.text = "Sin especificar"
        estreno.text = detailName?.release_Date
        calificacion.text = "\(String(describing: detailName?.vote_average))"
        des.text = detailName?.overview
       
        imagen.setCustomImageDTA(detailImagen)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIImageView {

    func setCustomImageDTA(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default.png")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "default.png")
            }
        }
    }
}
