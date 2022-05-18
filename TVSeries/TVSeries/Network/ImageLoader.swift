//
//  ImageLoader.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 16/05/22.
//

import UIKit

class ImageLoader {
    var dataTask: URLSessionDataTask?

    func loadImageInto(imageView: UIImageView, fromUrl urlString: String?, withPlaceholder placeholder: UIImage? = nil) {
        dataTask?.cancel()
        imageView.image = placeholder
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }
        task.resume()
        dataTask = task
    }
}
