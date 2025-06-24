//
//  LogIn.swift
//  MySchdules
//
//  Created by RajayGoms on 6/23/25.
//

import SwiftUI

struct LogInView: View {
    @Binding var signInSuccess: Bool
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    var isSignInButtonDisabled: Bool { [email, password].contains(where:\.isEmpty)}
    var body: some View {
        VStack(alignment: .leading) {
            TextField("User Email ID", text: $email)
                .frame(width: 300, height: 50)
                .tint(Color.red)
                .padding([.leading, .trailing], 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(Color.purple, lineWidth: 2.0)
                )
            
                .padding(.bottom, 10)
            HStack {
                Group {
                    if showPassword {
                        TextField("Password", text: $password)
                            .frame(width: 300, height: 50)
                            .tint(.red)
                            .padding([.leading, .trailing], 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.purple, lineWidth: 2.0)
                            )
                    } else {
                        TextField("Password", text: $password)
                            .frame(width: 300, height: 50)
                            .tint(.red)
                            .padding([.leading, .trailing], 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.purple, lineWidth: 2.0)
                            )
                    }
                    
                    Button() {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                    }
                }
            }
            
            Button() {
                // your sign in action
                signInSuccess.toggle()
            } label: {
                Text("Sing In")
                    .foregroundColor(isSignInButtonDisabled ? .gray : .purple)
                    .fontWeight(.bold)
            }.frame(width: 300, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.purple, lineWidth: 2.0)
                        .padding([.leading, .trailing], 10)
                )
                .padding(.top, 20)
                .disabled(isSignInButtonDisabled)
            
            
            Button() {
                // do singup action
            } label: {
                Text("Sing Up")
                    .foregroundColor(.purple)
                    .fontWeight(.bold)
            }.frame(width: 300, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.purple, lineWidth: 2.0)
                        .padding([.leading, .trailing], 10)
                )
                .padding(.top, 20)
        }
        
    }
}

#Preview {
    LogInView(signInSuccess: .constant(false))
}
