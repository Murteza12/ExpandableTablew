//
//  Model.swift
//  testExpndable
//
//  Created by Murteza on 17/09/2021.
//

import Foundation
struct ItemList {
var name: String
var items: [contentModel]
var collapsed: Bool

init(name: String, items: [contentModel], collapsed: Bool = false) {
   self.name = name
   self.items = items
   self.collapsed = collapsed
   }
}

var sections = [ItemList]()
struct contentModel {
    let title : String?
    let descritpion : String?
    let status : String?
    internal init(title: String?, descritpion: String?, status: String?) {
        self.title = title
        self.descritpion = descritpion
        self.status = status
    }
}
