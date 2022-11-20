//
//  AddItemViewModel.swift
//  MaterialManagementApp
//
//  Created by Min Ku An on 2022-10-12.
//

import Foundation

class AddItemViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var count: Int = 0
    
    var alertTitle: String = "" // it doesn't have to be @Published, does it?
    @Published var showAlert: Bool = false // why if this variable is not Published, it is Not working properly?
    
    @Published var listViewModel: ListViewModel = ListViewModel()
    @Published var items: [ItemModel] = [] // [] 초기화를 공백으로 꼭 해줘야하던데.. 이유가 뭘까요
    
    
    // init(items: [ItemModel] {}
    init(){
        self.items = listViewModel.items // 이렇게 하면 ListView에서 돌아올 때 변하질 않음
    }
    
    var countText: String {
        items.count <= 0 ? "Empty" : "\(items.count)"
    }
    
    func onTapMinusButton () {
        if count > 0 {
            count -= 1
        }
    }
    
    func onTapPlusButton() {
        count += 1
    }
    
    func onTapResetButton() {
        resetInput()
    }
    
    func resetInput() {
        count = 0
        title = ""
    }
    
    func textAppropriate () -> Bool {
        if title.count <= 0 {
            alertTitle = "Please enter the name of the material! 🖋"
            return false
        }
        
        return true
    }
    
    func onTapSaveButton() {
        if textAppropriate() {
            updateListViewModel() // add item
            bindingChange() // because of total number of items
            alertTitle = "Successfully Saved ✅"
            resetInput()
        }
        
        showAlert.toggle()
    }
    
    // Bindings ---------
    func bindingChange() {
        items = listViewModel.items
    }
            
    private func updateListViewModel() {
        listViewModel.addItem(title: title, count: count)
    }
}
