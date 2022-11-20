//
//  ActionButton.swift
//  MaterialManagementApp
//
//  Created by Min Ku An on 2022-10-12.
//

import SwiftUI

struct ActionButton: View {
    
    let title: String
    let foregroundColor: Color
    let backgroundColor: Color
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(title)
                .padding(.vertical, 15)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(10)
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(
            title: "test",
            foregroundColor: .gray,
            backgroundColor: .pink,
            onTap: {
                print("tapped")
            }
        )
    }
}
