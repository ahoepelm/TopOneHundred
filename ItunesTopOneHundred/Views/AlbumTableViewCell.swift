//
//  AlbumTableViewCell.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 5/5/21.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    private let albumImageView: ImageDownloader = {
        let img = ImageDownloader()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        return img
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var album: Results? {
        didSet {
            guard let albumItem = album else {return}
            let name = albumItem.name
            
            guard let imageURL = URL(string: albumItem.mediaUrl) else {
                return
            }
            
            // Ask for image to be downloaded
            albumImageView.loadImage(imageURL: imageURL, placeHolderImage: "")
            
            nameLabel.text = name
            
            let artist = albumItem.artistName
            artistLabel.text = artist
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    // MARK: - Private Method
    
    private override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(albumImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(artistLabel)
        self.contentView.addSubview(containerView)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        
        // Lets add contraints
        albumImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.albumImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        artistLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        artistLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        
    }
    
}

