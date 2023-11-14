//
//  Extension+String.swift
//  Recipes
//
//  Created by Marco Mascorro on 11/13/23.
//

import Foundation
 import UIKit



extension String {
    func loadImageData(completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: self) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error downloading image data: \(error.localizedDescription)")
                    completion(nil)
                    return
                }

                guard let data = data else {
                    completion(nil)
                    return
                }

                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    print("Failed to create UIImage from data")
                    completion(nil)
                }
            }

            task.resume()
        } else {
            print("Invalid URL")
            completion(nil)
        }
    }
}
