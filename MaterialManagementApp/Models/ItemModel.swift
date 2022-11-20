//
//  ItemModel.swift
//  MerterialManagementApp
//
//  Created by Min Ku An on 2022-09-23.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String // private is error here why? -> Public 이여야함! 밖에서 접속해야해서
    let title: String
    let count: Int
    let date: Date // the type is not sure, need to check
    let isCompleted: Bool
    
    // private: current Block ItemModel struck안에서 
    // fileprivate: current file 파일전체
    
    // internally 사용하고 싶은 것은 private로 줄 수 있다.
    private var hasTitle: Bool {
        !title.isEmpty
    }
    
    init(id: String = UUID().uuidString, title: String, count: Int, date: Date = Date(), isCompleted: Bool){
        self.id = id
        self.title = title
        self.count = count
        self.date = date
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, count: count, date: date, isCompleted: !isCompleted)
    }
}
