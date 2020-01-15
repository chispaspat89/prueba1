//
//  pelicula.swift
//  movie
//
//  Created by Ggamma MAC on 14/01/20.
//  Copyright © 2020 P. All rights reserved.
//

import Foundation
class pelicula{

var id : Int
var title :     String
var popularity : Double
var video : Int
var vote_count : Int
var vote_average : Double
var release_Date :     String
var original_languaje :     String
var original_title :     String
var genersids :     String
var backdrop_path :     String
var adult :     Int
var overview :     String
var poster_path :     String

    init(ID:Int,
         Title:String,
         Popularity:Double,
         Video: Int,
         Vote_count:Int,
         Vote_average: Double,
         Release_Date:String,
         Original_languaje:String,
         Original_title:String,
         Genersids:String,
         Backdrop_path:String,
         Adult: Int,
         Overview: String,
         Poster_path: String) {

        self.id = ID
        self.title = Title
        self.popularity = Popularity
        self.video = Video
        self.vote_count = Vote_count
        self.vote_average = Vote_average
        self.release_Date = Release_Date
        self.original_languaje = Original_languaje
        self.original_title = Original_title
        self.genersids = Genersids
        self.backdrop_path = Backdrop_path
        self.adult = Adult
        self.overview = Overview
        self.poster_path = Poster_path
    
    }



}
