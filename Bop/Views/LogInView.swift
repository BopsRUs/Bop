//
//  LogInView.swift
//  Bop
//
//  Created by Aidan Reid on 3/2/21.
//

import Foundation
import SwiftUI

struct LogInView: View {
    @EnvironmentObject var auth: AuthService
    var body: some View {
        Button("Sign In", action: auth.webSignIn)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(5)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
