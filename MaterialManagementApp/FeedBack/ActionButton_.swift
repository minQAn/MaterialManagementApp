//
//  ActionButton.swift
//  MerterialManagementApp
//
//  Created by Min Ku An on 2022-09-28.
//

import SwiftUI

// Logic을 어떻게 generic하게 만드는가를 보기

struct ActionButton_: View {
    
    var title: String
    var foregroundColor: Color
    var backgroundColor: Color
    
    //action
    var onTap: (() -> Void) // Closure.. logic을 패스함 () -> Void
//    var onTap: () -> Void
    
    var body: some View {
        Button {
            // action
            onTap()
        } label: {
            // UI는 만들었음
            Text(title)
                .padding(.vertical, 15)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(10)
        }
    }
}

struct ActionButton__Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title: "+1", foregroundColor: .gray, backgroundColor: .green){
            print("on Tap test")
        }
        //
//        ActionButton(title: <#T##String#>, foregroundColor: <#T##Color#>, backgroundColor: <#T##Color#>, onTap: {
//              // Do something
//        })
    }
}



// @escaping
private func fetchData(completion: @escaping ( ([ItemModel]) -> Void) ) {
    // API
    
}
