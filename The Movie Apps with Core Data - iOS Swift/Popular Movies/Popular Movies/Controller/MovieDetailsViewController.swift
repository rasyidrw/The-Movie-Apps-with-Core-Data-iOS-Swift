//
//  MovieDetailViewController.swift
//  Popular Movies
//
//  Created by rasyid respati on 22/04/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    var viewModel: MovieDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Back button color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        updateUI()
    }
    
    // Update UI
    private func updateUI() {
        self.movieTitle.text = viewModel.title
        self.movieReleaseDate.text = viewModel.year
        self.movieOverview.text = viewModel.overview
        self.moviePoster.setImageFromPath(viewModel.posterImage)
    }
    
}

// Extension to set an image into UIImageView
extension UIImageView {
    func setImageFromPath(_ path: String?) {
        image = nil
        DispatchQueue.global(qos: .background).async {
            var image: UIImage?
            guard let imagePath = path else {return}
            if let imageURL = URL(string: imagePath) {
                if let imageData = NSData(contentsOf: imageURL) {
                    image = UIImage(data: imageData as Data)
                } else {
                    // Image default - In case of error
                    image = UIImage(named: "noImageAvailable")
                }
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
