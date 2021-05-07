//
//  AlbumTableViewController.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 5/4/21.
//

import UIKit


class AlbumTableViewController: UIViewController {
    
    
    // MARK: - Properties
    
    private var albumArray: [Results] = []
    private let albumTableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(albumTableView)
        
        setupConstraints()
        registerCell()
        
        navigationItem.title = "Top 100 Albums"
        
        getAlbums()

    }

    
    // MARK: - Private
    
    // Ask the view model for the data
    private func getAlbums() {
        
        AlbumTableViewModel.callAPIForItunes { model, error in

            guard error == nil else {

                DispatchQueue.main.async {
                    Alert.displayError(titleString: "Error", messageString: error ?? "Unknown Error", vc: self)
                }

                return
            }
            
            guard model != nil else {

                DispatchQueue.main.async {
                    Alert.displayError(titleString: "Error", messageString: error ?? "No data received", vc: self)
                }

                return
            }
            
            // return empty model as default, but has been tested for nil
            self.albumArray = model ?? self.albumArray
            self.albumTableView.reloadData()

        }
    }
    
    // Register the cell
    private func registerCell() {
        
        albumTableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "albumCell")
        
    }
    
    // Set constraints for table view
    private func setupConstraints() {
        
        albumTableView.translatesAutoresizingMaskIntoConstraints = false
        
        albumTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        albumTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        albumTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        albumTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        albumTableView.dataSource = self
        albumTableView.delegate = self

    }
        
}

// MARK: - Extensions

extension AlbumTableViewController: UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albumArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumTableViewCell
        
        cell.album = albumArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension AlbumTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let album = albumArray[indexPath.row]
//        let detailVC = AlbumDetailView()
//        detailVC.albumName = album.name
//        detailVC.artist = album.artistName
//        detailVC.genre = album.genres.first?.name ?? ""
//        detailVC.releaseDate = album.releaseDate
//        detailVC.copyRight = album.copyright
//        detailVC.albumArt = album.mediaUrl
//        detailVC.albumUrl = album.url
//
//        tableView.deselectRow(at: indexPath, animated: true)
//        show(detailVC, sender: self)
    }
    
}
