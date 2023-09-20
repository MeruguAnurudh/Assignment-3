//
//  ProfileView.swift
//  SwiftUIAPI
//
//  Created by Merugu Anurudh on 11/09/23.
//

import SwiftUI


struct ProfileView: View {
    var body: some View {
            List {
                Section {
                    HStack {
                        Text("MA")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Merugu Anurudh")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text("meruguanurudh@gmail.com")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
        }
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
