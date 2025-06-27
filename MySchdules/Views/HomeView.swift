//
//  HomeView.swift
//  MySchdules
//
//  Created by Rajendran Eshwaran on 6/24/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var signInSuccess: Bool
    @State var presentSideMenu = false
    var body: some View {
        ZStack() {
            Color.white.edgesIgnoringSafeArea(.all)
            Color.white.edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(
                            ZStack {
                                HStack {
                                    Button {
                                        presentSideMenu.toggle()
                                    } label: {
                                        Image(systemName: "text.justify")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    .frame(width: 24, height: 24)
                                    .padding(.leading, 30)
                                    
                                    Spacer()
                                }
                            }.frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(Color.white)
                                .zIndex(1)
                                .shadow(radius: 0.3)
                            , alignment: .top)
                        .background(Color.white.opacity(0.8))
                        
                        SideMenu()
            
            Image(signInSuccess ? .personAuth : .personNotAuth)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .background(.purple)
                    .clipShape(.circle)
                    .offset(x:130, y:-350)
            
            Button() {
                
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
            }.frame(width: 80, height: 80)
                .background(.purple)
                .foregroundColor(.white).clipShape(.circle)
                .offset(x:130, y:300)
                    }
                    .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
        private func SideMenu() -> some View {
            SideView(isShowing: $presentSideMenu, direction: .leading) {
                SideMenuView(presentSideMenu: $presentSideMenu, selectedSideMenuTab: .constant(0))
                    .frame(width: 300)
            }
        }
}


#Preview {
    HomeView(signInSuccess: .constant(false))
}
