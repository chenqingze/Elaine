//
//  NavigationLinkModel.swift
//  Elaine
//
//  Created by ChenQingze on 2022/11/3.
//

import Foundation

struct MenuItem :Identifiable,Hashable{
    let id = UUID()
    var name:String
    var image:String?
    var subMenuItems:[MenuItem]?
}
