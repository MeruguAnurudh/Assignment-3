//
//  InputView.swift
//  SwiftUIAPI
//
//  Created by Merugu Anurudh on 11/09/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let placeholder: String
    var isSecureField = false
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 20))
            }else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 20))
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), placeholder: "name@example.com")
    }
}

