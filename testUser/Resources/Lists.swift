//
//  twoitem.swift
//  realmtests
//
//  Created by Ramana Gandikota on 12/5/15.
//  Copyright © 2015 VG. All rights reserved.
//
import UIKit
import RealmSwift
import Foundation

class Lists: Object {
    dynamic var name:String  = ""
    dynamic var desc:String = ""
let tasks = List<ListItems>()
}
