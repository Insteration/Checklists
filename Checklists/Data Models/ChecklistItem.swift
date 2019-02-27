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
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    func toggleChecked() {
        checked = !checked
    }
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
}
