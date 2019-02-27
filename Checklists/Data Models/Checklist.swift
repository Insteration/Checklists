//
//  Checklist.swift
//  Checklists
//
//  Created by Artem Karmaz on 2/26/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
