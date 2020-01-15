//
//  Repositorymovie.swift
//  movie
//
//  Created by Ggamma MAC on 14/01/20.
//  Copyright © 2020 P. All rights reserved.
//

import Foundation

class Repositorymovie{
    
    
    let remoteRepository: RepoMovieRemote
       
       
       
       init() {
           self.remoteRepository = Remotemovie()
           
       }
       
    
    func obtenerPelis(success: @escaping (AnyObject?) -> Void, failure: @escaping (NSError?) -> Void ){
           remoteRepository.obtenerTodaspeliculas(success: { (response) in
               success(response)
           }) { (error) in
               failure(error)
           }
       }
}
