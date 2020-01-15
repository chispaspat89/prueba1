//
//  ViewController.swift
//  movie
//
//  Created by Ggamma MAC on 14/01/20.
//  Copyright © 2020 P. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
     var peliculasEncontradas:[pelicula]   = []
     let conexion = Repositorymovie()
    
       @IBOutlet var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collection.delegate = self
               collection.dataSource = self
        
        conexion.obtenerPelis(success: { (response) in
            

            
             let objectoa = response as! NSDictionary
            
            let resultadoObjeto = objectoa.value(forKey: "results") as! NSArray
            
            if(resultadoObjeto.count > 0){
                               
                               for resultadosfilms in resultadoObjeto{
                                   
                                    let dicFilms = resultadosfilms as! NSDictionary
                                    let id         = dicFilms.value(forKey: "id") as? Int
                                   let title         = dicFilms.value(forKey: "title") as? String
                                   let popular         = dicFilms.value(forKey: "popularity") as? Double
                                   let vide         = dicFilms.value(forKey: "video") as? Int
                                   let videc         = dicFilms.value(forKey: "vote_count") as? Int
                                   let vaver         = dicFilms.value(forKey: "vote_average") as? Double
                                   let relese         = dicFilms.value(forKey: "release_date") as? String
                                   let origlan         = dicFilms.value(forKey: "original_language") as? String
                                   let origitiel         = dicFilms.value(forKey: "original_title") as? String
                                  
                                   let backs         = dicFilms.value(forKey: "backdrop_path") as? String
                                    let adul         = dicFilms.value(forKey: "adult") as? Int
                                    let over         = dicFilms.value(forKey: "overview") as? String
                                    let poster         = dicFilms.value(forKey: "poster_path") as? String
                               
                 
                                   
                                   let encontrados =  pelicula(ID: id!, Title: title!, Popularity: popular!, Video: vide!, Vote_count: videc!, Vote_average: vaver!, Release_Date: relese!, Original_languaje: origlan!, Original_title: origitiel!, Genersids: "", Backdrop_path: backs!, Adult: adul!, Overview: over!, Poster_path: poster!)
                                   
                                   self.peliculasEncontradas.append(encontrados)
                                  
                          
                                }
                 self.collection.reloadData()
                
            }
            
            
        }, failure: { (error) in
        //se produjo un error en el guardado de la informacion
         let resultado = error!.localizedDescription

        
         if(resultado.isEqualToString(find: "The Internet connection appears to be offline.")){
            ObjetoMensajes.showMessage(title: "Peliculas",msg: "No cuenta con conexión a internet, verifique su conexión.")
         }else if(resultado.isEqualToString(find: "The request timed out.")){
            ObjetoMensajes.showMessage(title: "Peliculas",msg: "Por el momento el servicio no se encuentra disponible, intente más tarde.")
         
         }
        })
        
        
        
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
           let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
           let size:CGFloat = (collection.frame.size.width - space) / 2.0
           return CGSize(width: size, height: 225)
       }*/


       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peliculasEncontradas.count
       }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testcell", for: indexPath)
        
            let imgList     = cell.viewWithTag(1) as? UIImageView
            let nombre      = cell.viewWithTag(2) as? UILabel
            let datosEntidades:pelicula = peliculasEncontradas[indexPath.row]
        
           
        nombre?.text                  = "\(String(describing: datosEntidades.title))"
    
        imgList?.setCustomImage("https://image.tmdb.org/t/p/w500/\(String(describing: datosEntidades.backdrop_path))")
           return cell
       }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as? UICollectionViewCell
        let indexPath = collection.indexPath(for: item!)
        let detailVC = segue.destination as! DetalleViewController
        let datosEntidades:pelicula = peliculasEncontradas[(indexPath?.row)!]
        
        detailVC.detailName = datosEntidades
         detailVC.detailImagen = "https://image.tmdb.org/t/p/w500/\(String(describing: datosEntidades.backdrop_path))"
    }
    

}


extension String {
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
}
extension UIImageView {

    func setCustomImage(_ imgURLString: String?) {
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
