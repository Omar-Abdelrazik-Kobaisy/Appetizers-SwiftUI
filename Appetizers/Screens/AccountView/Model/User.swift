//
//  User.swift
//  Appetizers
//
//  Created by Omar on 31/12/2023.
//

import Foundation

struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapKins = false
    var frequentRefill = false
    
    func convert(object obj:User) -> Data?{
        guard let userData = try? JSONEncoder().encode(obj) else{
            return nil
        }
        return userData
    }
    
    func convert(Data data: Data) -> User?{
        guard let user = try? JSONDecoder().decode(User.self, from: data) else{
            return nil
        }
        return user
    }
}
