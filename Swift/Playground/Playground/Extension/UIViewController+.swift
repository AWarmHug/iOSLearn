//
// Created by Warm-mac on 2018/7/11.
// Copyright (c) 2018 Warm-mac. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {

    var persistentContainer: NSPersistentContainer {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    }

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
