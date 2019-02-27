//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Artem Karmaz on 2/25/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import Foundation
import UserNotifications

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = true
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    // MARK:- Check lists
    
    func toggleChecked() {
        checked = !checked
    }
    
    // MARK:- Notifications
    
    func scheduleNotification() {
        if shouldRemind && dueDate > Date() {
            removeNotification()
            // 1
            let content = UNMutableNotificationContent()
            content.title = "Reminder:"
            content.body = text
            content.sound = UNNotificationSound.default
            
            // 2
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: dueDate)
            
            // 3
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            // 4
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
            
            // 5
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled: \(request) for itemID: \(itemID)")
        }
    }
    
    func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
    
    deinit {
        removeNotification()
    }
}
