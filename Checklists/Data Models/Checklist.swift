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
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
