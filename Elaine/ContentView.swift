//
//  ContentView.swift
//  Elaine
//
//  Created by ChenQingze on 2022/11/2.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var selectedMenuId: MenuItem.ID?
    @State private var searchText: String=""
    let menuList:[MenuItem] = [
        MenuItem(name:"Elaine Books", subMenuItems:[MenuItem(name:"Reading Now",image: "book")]),
        MenuItem(name:"Library", subMenuItems:[
            MenuItem(name:"All",image: "books.vertical"),
            MenuItem(name:"Want to Read",image: "arrow.right.circle"),
            MenuItem(name:"Finished",image: "checkmark.circle"),
            MenuItem(name:"Books",image: "book")
        ]),
        MenuItem(name:"My Collection")
    ]
    var body: some View {
        
        NavigationSplitView {
            SideBarView(selectedMenuId: $selectedMenuId, menuList: self.menuList)
            
        }detail: {
            NavigationStack {
                ZStack {
                    if let selectedMenuId {
                        Text(selectedMenuId.uuidString)
                    } else {
                        Text("Choose an item from the content")
                    }
                }
                .navigationDestination(for: String.self) { text in
                    Text(verbatim: text)
                }
            }
        }.searchable(text: $searchText,placement: .sidebar)
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
