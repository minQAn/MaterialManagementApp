//
//  ListViewModel.swift
//  MerterialManagementApp
//
//  Created by Min Ku An on 2022-09-23.
//

import Foundation

private let itemsKey: String = "items_list" // private..? better to assign outside of ListViewModel Class? 노드js에 .env 파일같이 따로 깃허브에 노출안되게 해주는 것이 있나요? (.gitignore) -> 그렇게 credential 한게 아니라서 그냥 여기서 해줘도 됨

// Dependency Manager
// 회사나 실제 업무에서는 Carthege, Cocoapods, SPM (swift package manager) -> Apple 이란걸 씀
// pod install 를 주로 씀

// Managing Key
// APIKeys.txt

// Persistence
// CoreData(Apple), Realm, UserDefaults, FileManager, NSCache
// ThirdParty: Realm


// System Design
// Design Documents

class ListViewModel: ObservableObject {
           
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
        
    init(){
        getItems()
    }
    
    func addItem(title: String, count: Int){
        let newItem = ItemModel(title: title, count: count, isCompleted: false )
        items.append(newItem)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteItem(indexSet: IndexSet){ // what is the different of items.remove(at:) and items.remove(atOffsets:) ?
        items.remove(atOffsets: indexSet)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {
            $0.id == item.id
        }){
//            items[index].isCompleted = !items[index].isCompleted // if isCompleted is let, it will be not working
//            items[index].isCompleted.toggle()
            items[index] = item.updateCompletion() // which way is more appropriate way to update isCompleted value?
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) { // try? returns nil if error occours
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
}
