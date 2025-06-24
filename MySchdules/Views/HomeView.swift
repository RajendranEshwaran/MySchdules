//
//  HomeView.swift
//  MySchdules
//
//  Created by RajayGoms on 6/24/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var signInSuccess: Bool
    var body: some View {
        ZStack() {
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
    }
}


#Preview {
    HomeView(signInSuccess: .constant(false))
}
