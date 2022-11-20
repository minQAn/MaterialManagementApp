//
//  PlaceholderQuestion.swift
//  MerterialManagementApp
//
//  Created by Min Ku An on 2022-09-28.
//

// ZStack을 이용하여 Placeholder를 커스텀해서 만드는 방법

import SwiftUI

struct PlaceholderQuestion: View {
    
    @State private var text = ""
    
    var body: some View {
        ZStack {
            if text.isEmpty{
                HStack {
                    Text("Placeholder.....")
                        .foregroundColor(.red)
                        .opacity(0.4)
                    Spacer()
                }
            }
            
            TextField("", text: $text)
        }
    }
}

struct PlaceholderQuestion_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderQuestion()
    }
}
