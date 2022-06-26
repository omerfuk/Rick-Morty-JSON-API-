//
//  Service.swift
//  TableView w CustomCell Tutorial
//
//  Created by Ömer Faruk Kılıçaslan on 26.06.2022.
//

import UIKit

func getAllData(url: String, completion: @escaping ([Result]) -> ()) {
    
    guard let url = URL(string: url) else {return}
    let session = URLSession.shared
    
    let task = session.dataTask(with: url) { data, response, error in
        
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let apiList = try JSONDecoder().decode(ResultList.self, from: data)
            
            completion(apiList.results)

            
        } catch  {
            print(error.localizedDescription)
        }
        
    }
    task.resume()
    
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


