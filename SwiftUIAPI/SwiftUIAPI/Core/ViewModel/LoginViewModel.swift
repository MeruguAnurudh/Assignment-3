//
//  LoginViewModel.swift
//  SwiftUIAPI
//
//  Created by Merugu Anurudh on 11/09/23.
//

import Foundation
import Alamofire
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var tokenResponse: TokenResponse?
    
    func getToken(username: String, password: String, completion: @escaping (Bool) -> Void) {
        let basicAuth = "\(username):\(password)"
        let base64Auth = Data(basicAuth.utf8).base64EncodedString()
//        print(base64Auth)
        let headers: HTTPHeaders = [
            "X-Nspire-AppToken": "f07740dc-1252-48f3-9165-c5263bbf373c",
            "Authorization": "Basic \(base64Auth)"
        ]
        AF.request("https://identity-stage.spireon.com/identity/token", method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: TokenResponse.self) { response in
//                if let statusCode = response.response?.statusCode {   // checking status code
//                                print("Status Code: \(statusCode)")
//                            }
                switch response.result {
                case .success(let tokenResponse):
                    self.tokenResponse = tokenResponse
                    if !tokenResponse.token.isEmpty && !tokenResponse.expiresOn.isEmpty {
                                      self.tokenResponse = tokenResponse
//                        print(tokenResponse.token)    //checking the values
//                        print(tokenResponse.expiresOn)
                                      completion(true)
                                  }
                case .failure:
                    completion(false)
                }
            }
    }
}

