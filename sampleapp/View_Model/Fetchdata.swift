//
//  Fetchdata.swift
//  sampleapp
//
//  Created by Ripon sk on 30/07/22.
//

import Foundation
import UIKit
class Fectchdata{
    weak var vc:ViewController!
    static var share = Fectchdata()
    func fetch_data(){
    URLSession.shared.requestdata(url: URL(string: base_url), model: Details.self) { [self] (result) in
            switch result{
            case .success(let res):
               
                DispatchQueue.main.async {
                
                    self.vc.arr.append(contentsOf: res.results!)
                    self.vc.tableviews.reloadData()
                }
           
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
extension URLSession{
    func requestdata<T:Codable>(url:URL?,model:T.Type,completion:@escaping (Result<T,Error>)->Void){
guard let url = url else{
            fatalError("wrong url")
            return
        }
        let task = dataTask(with: url) { (data, resp, error) in
            guard let data = data else{
                if let error = error{
                    completion(.failure(error))
                }
                else{
                    completion(.failure(CustomError.invakidData))
                }
                return
                
            }
            do{
                let result = try! JSONDecoder().decode(model, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
        
        
        
    }
    
}
