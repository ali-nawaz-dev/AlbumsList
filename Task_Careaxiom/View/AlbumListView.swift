//
//  ContentView.swift
//  Task_Careaxiom
//
//  Created by Sheikh Ali on 18/09/2021.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var viewModel: AlbumListViewModel = AlbumListViewModel()
    
    var body: some View {
        
        if viewModel.state == .loading {
            Spinner(style: .large)
        } else if viewModel.state == .error {
            Text(viewModel.albumFetchError)
        } else if viewModel.state == .complete {
            NavigationView{
                List {
                    ForEach(viewModel.albums.keys.sorted(), id: \.self) { key in
                        Section(header: Text("Album # \(key)")) {
                            if let newAlbumds: [AlbumModel] = viewModel.albums[key] as? [AlbumModel] {
                                ForEach(newAlbumds, id: \.id) { model in
                                    AlbumRowView(album: model)
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetListStyle())
                .navigationBarTitle(Text(verbatim: "Albums"))
            }
        }
    }
}

struct AlbumRowView: View {
    
    var album: AlbumModel
    
    var body: some View {
        HStack {
            RemoteImage(url: "\(album.thumbnailUrl)")
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            Text(album.title)
                .foregroundColor(.red)
                .fontWeight(.bold)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
