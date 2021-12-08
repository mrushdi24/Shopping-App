



import Foundation
import Alamofire

class ProductInteractor<T: Decodable> {
    
     func fetchData(url: String, completion :@escaping([T]?)->()) {
         AF.request(url, method: .get, parameters: [:], headers: [:]).responseJSON{(respnse) in
             guard let statueCode = respnse.response?.statusCode else {return}
             if statueCode == 200 {
                 guard let jsonResponse = try? respnse.result.get() else {return}
                 guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {return}
                 guard let responsObject = try? JSONDecoder().decode([T].self, from: jsonData) else {return}
                 completion(responsObject)
             }
         }
    }
    
    
}
