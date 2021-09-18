//
//  AlbumRepository.swift
//  Task_Careaxiom
//
//  Created by Sheikh Ali on 18/09/2021.
//

import Foundation
import Combine

class AlbumReository {
    
    var albumPublisher: AnyPublisher<[AlbumModel], Error> {
        let url = URL(string: Constants.photoURL)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [AlbumModel].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var AlbumSubscriber: AnyCancellable?
    
    func getAlbums(completion: @escaping ([AlbumModel]?, Error?) -> ()){
        
        AlbumSubscriber = albumPublisher.sink(receiveCompletion: {  result in
            switch result {
            case .failure(let error):
                completion(nil , error)
            case .finished:
                print("values received")
            }
        }, receiveValue: { albums in
            completion(albums, nil)
        })
    }
}
