//
//  AddView.swift
//  MerterialManagementApp
//
//  Created by Min Ku An on 2022-09-23.
//

import SwiftUI

struct AddItemView: View {
    
    @StateObject var viewModel: AddItemViewModel = AddItemViewModel()
                   
    var body: some View {
        VStack(spacing: 20){
            NavigationLink(destination: ListView(viewModel: viewModel.listViewModel)) {
                Text(viewModel.countText)
                    .multilineTextAlignment(.center)
                    .foregroundColor(UIConstants.totalColor)
                    .font(.system(size: viewModel.items.count <= 0 ? 50 : 100, weight: .heavy))
                    .frame(width: 200, height: 200)
                    .background(
                        Image("vegitables")
                            .resizable()
                            .opacity(0.4)
                    )
                    .cornerRadius(UIConstants.totalIconRadius)
            }
            .padding(.bottom,80)
            
            HStack{
                TextField("Enter a new material", text: $viewModel.title)
                    .frame(minHeight: 70)
                    .padding(.leading, 20)
//                    .border(Color.green, width: 3)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 4))
                    .cornerRadius(10)
              
                    
                Text("\(viewModel.count)")
                    .frame(minWidth: 70, minHeight: 70)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            VStack{
                HStack{
                    ActionButton(
                        title: "-1",
                        foregroundColor: .gray,
                        backgroundColor: UIConstants.buttonColor,
                        onTap: {
                            viewModel.onTapMinusButton()
                        })
                    
                    ActionButton(
                        title: "+1",
                        foregroundColor: .gray,
                        backgroundColor: UIConstants.buttonColor,
                        onTap: {
                            viewModel.onTapPlusButton()
                        })
                }
                HStack{
                    ActionButton(
                        title: "Reset",
                        foregroundColor: .gray,
                        backgroundColor: UIConstants.resetButtonColor,
                        onTap: {
                            viewModel.onTapResetButton()
                        })
                   ActionButton(
                        title: "Save",
                        foregroundColor: .gray,
                        backgroundColor: UIConstants.saveButtonColor,
                        onTap: {
                            viewModel.onTapSaveButton()
                        }
                   )
                   .alert(isPresented: $viewModel.showAlert) {
//                       getAlert()
                       Alert(title: Text(viewModel.alertTitle))
                   }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(30)
        .background(UIConstants.backgroundColor)
        .navigationTitle("Add Item")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("View List", destination: ListView(viewModel: viewModel.listViewModel))
            }
        }
        .onAppear { // to reset when back this screen from another view
            viewModel.bindingChange() // to change the items total when come back from ListView
            viewModel.resetInput()
        }
    }
    
//    func getAlert() -> Alert { // Alert는 viewModel에서 없어서 여기했는데 맞나요..? -> 구지 여기서 안하고 위에서 해줘도됨
//        return Alert(title: Text(viewModel.alertTitle))
//    }
        
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddItemView()
        }
    }
}


//            NavigationLink("total", destination: ListView(), isActive: $isTotalTapped)
//                .onAppear{ // to test
//                    print(isTotalTapped)
//                }
//                .overlay(
//                    RoundedRectangle(
//                        cornerRadius: totalIconRadius)
//                            .stroke(.blue, lineWidth: 4)
//                )
//                .shadow(color: .black, radius: 30, x: 0, y: 10)
