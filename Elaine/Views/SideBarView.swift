//
//  SideBarView.swift
//  Elaine
//
//  Created by ChenQingze on 2022/11/3.
//

import SwiftUI

struct SideBarView: View {
    
    @Binding var selectedMenuId: MenuItem.ID?
    let menuList:[MenuItem]
    
    
    var body: some View {
        List(self.menuList,selection: $selectedMenuId){ menu in
                NavigationLink(value:menu){
                    HStack{
                        if let image = menu.image {
                            Image(systemName:image).resizable().scaledToFit().frame(width: 20,height: 20)
                        };
                        Text(menu.name)
                            .font(.system(size:14,design: .rounded)).bold()
                    }
                }.buttonStyle(PlainButtonStyle()).padding(.top,13).disabled(true)
                if let subMenuItems = menu.subMenuItems {
                    ForEach(subMenuItems) { subMenu in
                        NavigationLink(value:subMenu){
                            HStack{
                                if let subMenuImage = subMenu.image {
                                    Image(systemName:subMenuImage).resizable().scaledToFit().frame(width: 14,height: 14)
                                };
                                Text(subMenu.name).font(.system(size: 13))
                            }
                        }
                    }
                    
                }
        }
    }
}

//struct SideBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//    }
//}
