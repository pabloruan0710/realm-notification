//
//  Pessoa.swift
//  RalmNotification
//
//  Created by Pablo Ruan on 03/08/17.
//  Copyright © 2017 pabloruan. All rights reserved.
//

import Foundation
import RealmSwift

class Pessoa: Object {
    
    dynamic var id : Int = 0
    dynamic var nome:String = ""
    
    
    override static func primaryKey()->String? {
        return "id"
    }
    
}
