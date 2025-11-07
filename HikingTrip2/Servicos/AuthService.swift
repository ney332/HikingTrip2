//
//  AuthService.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 10/10/25.
//

import Foundation
class AuthService {
    func login(email:String, password: String, completation: @escaping (Bool) -> Void) {
        completation(true)
    }
}
