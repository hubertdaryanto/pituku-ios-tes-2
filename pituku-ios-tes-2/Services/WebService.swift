//
//  WebService.swift
//  pituku-ios-tes-2
//
//  Created by Hubert Daryanto on 08/11/23.
//

import Foundation
import Alamofire

final class WebService {
    func getArticleList(complete: @escaping (_ success: Bool, _ data: ModelArticleListResponse?) -> ()) {
        let headers: HTTPHeaders = [
            "accept": "application/json"
        ]
        
        AF.request("https://api.pituku.id/api/articles", method: .get, parameters: nil, headers: headers)
            .validate(statusCode: 200..<600)
            .responseDecodable(of: ModelArticleListResponse.self) { response in
                switch response.result {
                case .success(_):
                    guard response.value != nil else {
                        complete(false, nil)
                        return
                    }
                    complete(true, response.value!)
                case .failure(_):
                    guard response.data != nil else {
                        complete(false, nil)
                        return
                    }
                    let decoder = JSONDecoder()
                    if let JSON = try? decoder.decode(ModelArticleListResponse.self, from: response.data!) {
                        complete(false, JSON)
                    }
                }
            }
    }
    
    func getArticleDetail(id: String, complete: @escaping (_ success: Bool, _ data: ModelArticleDetailResponse?) -> ()) {
        let headers: HTTPHeaders = [
            "accept": "application/json"
        ]
        
        AF.request("https://api.pituku.id/api/articles/\(id)", method: .get, parameters: nil, headers: headers)
            .validate(statusCode: 200..<600)
            .responseDecodable(of: ModelArticleDetailResponse.self) { response in
                switch response.result {
                case .success(_):
                    guard response.value != nil else {
                        complete(false, nil)
                        return
                    }
                    complete(true, response.value!)
                case .failure(_):
                    guard response.data != nil else {
                        complete(false, nil)
                        return
                    }
                    let decoder = JSONDecoder()
                    if let JSON = try? decoder.decode(ModelArticleDetailResponse.self, from: response.data!) {
                        complete(false, JSON)
                    }
                }
            }
    }
}
