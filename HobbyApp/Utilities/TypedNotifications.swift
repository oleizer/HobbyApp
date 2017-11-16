//
//  TypedNotifications.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 13.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation

struct TypedNotification<A> {
    let name: NSNotification.Name
    init(name: String) {
        self.name = NSNotification.Name(name)
    }
    init(name: NSNotification.Name) {
        self.name = name
    }
}

func postNotification<A>(_ note: TypedNotification<A>, value: A) {
    let userInfo = ["value": Box(value)]
    NotificationCenter.default.post(name: note.name, object: nil, userInfo: userInfo)
}

class NotificationObserver {
    let observer: NSObjectProtocol

    init<A>(notification: TypedNotification<A>, block aBlock: @escaping (A) -> Void) {
        observer = NotificationCenter.default.addObserver(forName: notification.name, object: nil, queue: nil) { note in
            if let value = (note.userInfo?["value"] as? Box<A>)?.value {
                aBlock(value)
            } else {
                assert(false, "Couldn't understand user info")
            }
        }
    }

    func removeObserver() {
        NotificationCenter.default.removeObserver(observer)
    }

    deinit {
        removeObserver()
    }
}
