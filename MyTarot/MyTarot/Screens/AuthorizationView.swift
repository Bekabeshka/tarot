//
//  AuthorizationView.swift
//  MyTarot
//
//  Created by bekabeshka on 06.11.2023.
//

import SwiftUI
import AuthenticationServices

struct AuthorizationView: View {
    var body: some View {
        ZStack() {
            Color.primaryBlack.ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer()
                PrimaryButton(viewData: PrimaryButtonViewData(
                    text: "Sign In with Apple",
                    iconName: "apple-logo",
                    action: {
                        appleAuthorize()
                    }
                ))
                .background(Color.primaryWhite)
                .foregroundColor(.primaryBlack)
                .cornerRadius(.cornerRadius)
                    
                PrimaryButton(viewData: PrimaryButtonViewData(text: "Sign In with Apple"))
                    .background(Color.primaryGray)
                    .foregroundColor(.primaryWhite)
                    .cornerRadius(.cornerRadius)
            }
            .padding(Constants.insets)
        }
    }
    
    private func appleAuthorize() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.performRequests()
    }
    
    private enum Constants {
        static let insets = EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16)
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}

struct AuthorizationsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ZStack {
                PrimaryButton(viewData: PrimaryButtonViewData(text: "7 days 18 hours"))
                    .background(LinearGradient(
                        colors: [.gradientRed, .gradientOrange, .gradientPink],
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                    )
                    .foregroundColor(.primaryWhite)
                    .cornerRadius(.cornerRadius)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
        }
    }
}