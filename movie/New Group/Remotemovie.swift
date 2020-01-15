//
//  Remotemovie.swift
//  movie
//
//  Created by Ggamma MAC on 14/01/20.
//  Copyright © 2020 P. All rights reserved.
//

import Foundation
import Alamofire



protocol RepoMovieRemote{
    
    func obtenerTodaspeliculas(success: @escaping (AnyObject?) -> Void, failure: @escaping (NSError?) -> Void )
 
    
}

class Remotemovie: RepoMovieRemote{
    func obtenerTodaspeliculas(success: @escaping (AnyObject?) -> Void, failure: @escaping (NSError?) -> Void) {
        
          let service = "3/movie/now_playing?api_key=634b49e294bd1ff87914e7b9d014daed&language=en-US&page=1"
              let concatenar = "\(constante.direccionPrincipal)\(service)"
              
              Alamofire.request(concatenar, method: .get, parameters: nil)
                  .responseJSON { response in
                      
                      switch response.result {
                      case .success:
                          print("-----success tipos entidades-----")
                          //print(response)
                          success(response.result.value as AnyObject)
                          break
                      case .failure(let error):
                          print("error tipos entidades")
                          failure(error as NSError)
                          break;
                      }
              }
    }
    
    
}
