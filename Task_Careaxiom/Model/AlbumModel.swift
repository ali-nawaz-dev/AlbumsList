//
//  AlbumModel.swift
//  Task_Careaxiom
//
//  Created by Sheikh Ali on 18/09/2021.
//

import Foundation

class AlbumModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }
    
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
