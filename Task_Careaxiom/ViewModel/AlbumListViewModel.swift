//
//  AlbumListViewModel.swift
//  Task_Careaxiom
//
//  Created by Sheikh Ali on 18/09/2021.
//

import Foundation

class AlbumListViewModel: ObservableObject {
    @Published var state: ViewStatus = .none
    @Published var albums: [Int: Any] = [Int: Any]()
    @Published var albumFetchError: String = ""
    
    let repo = AlbumReository()
    
    init() {
        setupAlbums()
    }
    
    func setupAlbums() {
        
        state = .loading
        repo.getAlbums { albums, error in
            
            guard
                let albums = albums
            else {
                self.state = .error
                self.albumFetchError = error?.localizedDescription ?? "Some thing went wrong"
                return
            }
            
            self.albums = albums.group(by: \.albumId)
            self.state = .complete
        }
    }
}

