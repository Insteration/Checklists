//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Artem Karmaz on 2/25/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = true
    
    func toggleChecked() {
        checked = !checked
    }
}
