//
//  SideMenuView.swift
//  MySchdules
//
//  Created by RajayGoms on 6/27/25.
//
import SwiftUI

struct SideMenuView: View {
    @Binding var presentSideMenu: Bool
    @Binding var selectedSideMenuTab: Int
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                SideMenuTopView()
                VStack {
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                                            RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                                                selectedSideMenuTab = row.rawValue
                                                presentSideMenu.toggle()
                                            }
                                        }
                        .foregroundColor(.purple)
                }.frame( maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
            }
           // .frame(maxWidth: .infinity)
            .background(.white)
            .padding(.top, 100)
                            
        }
    }
    
    func SideMenuTopView() -> some View {
        VStack {
                    HStack {
                        Button(action: {
                            presentSideMenu.toggle()
                        }, label: {
                            Image(systemName: "x.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.yellow)
                        })
                        .frame(width: 34, height: 34)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.leading, 40)
                .padding(.top, 40)
                .padding(.bottom, 30)
    }
}

enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case favorite
    case chat
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home"
        case .favorite:
            return "favorite"
        case .chat:
            return "chat"
        case .profile:
            return "profile"
        }
    }
}

func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
    Button{
        action()
    } label: {
        VStack(alignment: .leading){
            HStack(spacing: 20){
                Rectangle()
                    .fill(isSelected ? .purple : .white)
                    .frame(width: 5)
                
                ZStack{
                    Image(imageName)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(isSelected ? .black : .gray)
                        .frame(width: 26, height: 26)
                }
                .frame(width: 30, height: 30)
                Text(title)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(isSelected ? .black : .gray)
                Spacer()
            }
        }
    }
    .frame(height: 50)
    .background(
        LinearGradient(colors: [isSelected ? .purple.opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing)
    )
}
