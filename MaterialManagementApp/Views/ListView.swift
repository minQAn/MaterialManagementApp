//
//  ListView.swift
//  MerterialManagementApp
//
//  Created by Min Ku An on 2022-09-23.
//



import SwiftUI

struct ListView: View {
    
//    @EnvironmentObject var listViewModel: ListViewModel
    @ObservedObject var viewModel: ListViewModel // 여기선 initialize를 안함
            
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.items) { item in
                    ListRowItemView(item: item)                        
                        .onTapGesture {
                            withAnimation (.linear(duration: 0.1)){
                                viewModel.updateItem(item: item)
                            }
                        }
                }
                .onMove(perform: viewModel.moveItem)
                .onDelete(perform: viewModel.deleteItem)
                .listRowBackground(Color.white.opacity(0.4)) // the way of changing the background color of the List
                // 이곳에서 item의 isCompleted에 따라 색이 변하게하려면 어떻게..?
                // 안된다면 Row백그라운드를 어떻게 꽉 채우는지? 어디서 패딩이 생긴건지..
                
            }
            .listStyle(.plain)
            .background(Color.yellow.opacity(0.5))
            .scrollContentBackground(.hidden) // available in IOS 16 or newer
          
           
        }
        .navigationTitle("Material List") //
        .navigationBarTitleDisplayMode(.inline) // 상단에 타이틀이 안에 들어가서 작아짐 // 근데이건 타이틀 글씨 색을 못바꿔서 보통 51번줄처럼 함
        .padding(.top, 5) // 패딩이 있으면 그부분은 리스트 스크롤이 안되고 고정이됨
        .background(Color.green)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing){
//                EditButton()
//                    .foregroundColor(.white)
//            }
//        }
        .toolbar {
            ToolbarItem(placement: .principal){ // principal은 가운데로
                Text("List View")
                    .foregroundColor(.blue)
                    .padding()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
                    .foregroundColor(.white)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView(viewModel: ListViewModel())
        }
//        .environmentObject(ListViewModel())
    }
}


//    .onDelete { indexSet in // why it doesn't work if it goes under the listRowBackground line?
//        listViewModel.items.remove(atOffsets: indexSet)
//    }
//    .onMove(perform: { from, to in
//        listViewModel.items.move(fromOffsets: from, toOffset: to)
//    })
