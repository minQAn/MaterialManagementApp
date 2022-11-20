//
//  ListRowItem.swift
//  MerterialManagementApp
//
//  Created by Min Ku An on 2022-09-27.
//

// To-do
// -> style (add count, date, color of isCompleted) , onMove, onDelete, onUpdate(when click, chagne as isCompleted)
// -> Edit -> to change title, count
// UserDefaults -> save 

import SwiftUI

struct ListRowItemView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack ( alignment: .center, spacing: 10) {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .font(.system(size: 24))
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            
            VStack (alignment: .leading, spacing: 1){
                HStack{
                    Text(item.title)
                    Text("\(item.count)")
                        .foregroundColor(.cyan)
                }
                .font(.system(size: 20))
                
                // it is the way of control the date format
                Text("\(item.date.formatted(.dateTime.year().month(.abbreviated).day().hour(.twoDigits(amPM: .wide)).minute().weekday(.abbreviated)))")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }        
        .padding(10)
        .padding(.leading, 10)
//        .frame(maxWidth: .infinity)
        .background(item.isCompleted ? Color.secondary : Color.orange )
        .cornerRadius(10)
        
    }
}

struct ListRowItem_Previews: PreviewProvider {
    
    static var item: ItemModel = ItemModel(title: "first", count: 5, isCompleted: false)
    static var item2: ItemModel = ItemModel(title: "first", count: 5, isCompleted: true)
    
    static var previews: some View {
        VStack{
            ListRowItemView(item: item)
            ListRowItemView(item: item2)
        }
//        .previewLayout(.sizeThatFits)
      
    }
}


// another way to format date type
//            Text("\(item.date.formatted(date: .complete, time: .shortened))") // how to -> Mon, Sep 27, 2022, at 6:05
