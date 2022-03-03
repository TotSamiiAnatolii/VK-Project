//
//  File.swift
//  VK
//
//  Created by APPLE on 16.02.2022.
//

import Foundation

struct Session {
    var userID = ""
    var accesToken = ""
    
    init() {}
    static var shared = Session()
   
}
