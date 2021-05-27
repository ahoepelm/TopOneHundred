//
//  AlbumDetailView.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 5/7/21.
//

import Foundation
import UIKit

class AlbumDetailView: UIViewController, NSCacheDelegate {
    
    // MARK: - Properties
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let artistLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let genreLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let dateLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let copyRightLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let albumImageView: ImageDownloader = {

        let img = ImageDownloader()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        return img
    }()
    
    private let albumStoreBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("See in Apple Music", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        btn.layer.cornerRadius = 6.0
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.blue.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return btn
    }()
    
    var albumName = String()
    var artist = String()
    var genre = String()
    var releaseDate = String()
    var copyRight = String()
    var albumArt = String()
    var albumURL = String()
    var albumImage = UIImage()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .white

        // add the sub views
        addSubViews()
        
        // get image
        getImage()
 
        // populate the labels
        populateLabels()
        
        // setup constraints
        setupConstraints()
        
    }
    
    // MARK: - Private
    
    @objc private func btnTapped() {
        
        if let url = URL(string: albumURL) {
            UIApplication.shared.open(url)
        }
    }
    
    private func addSubViews() {
        
        // add the sub views
        view.addSubview(albumImageView)
        view.addSubview(nameLabel)
        view.addSubview(artistLabel)
        view.addSubview(genreLabel)
        view.addSubview(dateLabel)
        view.addSubview(copyRightLabel)
        view.addSubview(albumStoreBtn)
    }
    
    private func populateLabels() {
        
        // populate the labels
        nameLabel.text = albumName
        artistLabel.text = artist
        genreLabel.text = genre
        dateLabel.text = releaseDate
        copyRightLabel.text = copyRight
        
    }
    
    private func getImage() {
     
        guard let imageURL = URL(string: albumArt) else {
            return
        }

        // Ask for image to be downloaded
        albumImageView.loadImage(imageURL: imageURL, placeHolderImage: "AlbumPlaceholder")
    }
    
    private func setupConstraints() {
        
        // set up some constants in case we want to adjust later
        let half: CGFloat = 0.5
        let quarter: CGFloat = 0.25
        let threeQuarter: CGFloat = 0.75
        let labelHeight: CGFloat = 25
        let labelImgSpacing: CGFloat = -165
        let anchorSpacing: CGFloat = 20
        let anchorSpacingNeg: CGFloat = -20
        let labelSpacing: CGFloat = 55
        let genreSpacing: CGFloat = 65
        
        // Album art constarints
        albumImageView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: anchorSpacing).isActive = true
        albumImageView.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: half).isActive = true
        albumImageView.heightAnchor.constraint(equalTo:view.heightAnchor, multiplier: quarter).isActive = true
        albumImageView.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        
        // Album title constarints
        nameLabel.topAnchor.constraint(equalTo:albumImageView.topAnchor, constant: labelImgSpacing).isActive = true
        nameLabel.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: threeQuarter).isActive = true
        nameLabel.heightAnchor.constraint(equalTo:view.heightAnchor, constant: labelHeight).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        
        // Album artists constarints
        artistLabel.topAnchor.constraint(equalTo:nameLabel.topAnchor, constant: genreSpacing).isActive = true
        artistLabel.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: threeQuarter).isActive = true
        artistLabel.heightAnchor.constraint(equalTo:view.heightAnchor, constant: labelHeight).isActive = true
        artistLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        
        // Album genre constarints
        genreLabel.topAnchor.constraint(equalTo:artistLabel.topAnchor, constant: labelSpacing).isActive = true
        genreLabel.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: threeQuarter).isActive = true
        genreLabel.heightAnchor.constraint(equalTo:view.heightAnchor, constant: labelHeight).isActive = true
        genreLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        
        // Album date constarints
        dateLabel.topAnchor.constraint(equalTo:genreLabel.topAnchor, constant: labelSpacing).isActive = true
        dateLabel.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: threeQuarter).isActive = true
        dateLabel.heightAnchor.constraint(equalTo:view.heightAnchor, constant: labelHeight).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        
        // Album copyright constarints
        copyRightLabel.topAnchor.constraint(equalTo:dateLabel.topAnchor, constant: genreSpacing).isActive = true
        copyRightLabel.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: threeQuarter).isActive = true
        copyRightLabel.heightAnchor.constraint(equalTo:view.heightAnchor, constant: labelHeight).isActive = true
        copyRightLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        
        // Album store button constarints
        albumStoreBtn.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: anchorSpacing).isActive = true
        albumStoreBtn.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor, constant: anchorSpacingNeg).isActive = true
        albumStoreBtn.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: anchorSpacingNeg).isActive = true
        albumStoreBtn.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        
    }
}
