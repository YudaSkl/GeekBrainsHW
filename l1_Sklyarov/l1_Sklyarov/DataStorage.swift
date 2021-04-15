//
//  TestData.swift
//  l1_Sklyarov
//
//  Created by Valeriy Sklyarov on 15.04.2021.
//

import Foundation
import UIKit

class DataStorage: NSObject{
    static let shared = DataStorage()
    private override init(){
        super.init()
    }
    
    var users = [User]()
    var groups = [Group]()
    
    var currUser: User = User(username: "")
}

struct User{
    var username: String
    var img: UIImage?
    var photos: [UIImage?] = []
    var groups: [Group] = []
    
    mutating func addGroup(group: Group){
        groups.append(group)
    }
}

struct Group{
    var name: String
    var img: UIImage?
    
    func isEqual(group: Group)->Bool{
        if name == group.name && img == group.img{
            return true
        }
        return false
    }
}
