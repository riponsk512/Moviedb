//
//  Constants.swift
//  sampleapp
//
//  Created by Ripon sk on 30/07/22.
//

import Foundation
let base_url = "https://api.themoviedb.org/3/movie/now_playing?api_key=34c902e6393dc8d970be5340928602a7&language=en-US&page=1"
enum CustomError:Error {
    case invalidurl
    case invakidData
}
