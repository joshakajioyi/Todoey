//
//  Category .swift
//  Todoey
//
//  Created by Joshua Akajioyi on 04/08/2018.
//  Copyright © 2018 Joshua Akajioyi. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
