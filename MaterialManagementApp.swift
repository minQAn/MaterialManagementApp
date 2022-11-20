//
//  MerterialManagementApp.swift
//  MerterialManagementApp
//
//  Created by Min Ku An on 2022-09-23.
//

// MVVM Structure

import SwiftUI

@main
struct MaterialManagementApp: App {
                
    var body: some Scene {
        WindowGroup {
            NavigationView{
                AddItemView()
            }
//            .environmentObject(listViewModel)
        }
    }
}


// 9월28일 week3
// 오늘 주요 내용: Design Pattern!!! MVVM 이건 회사마다 다 다르다.
// FeedBack 파일에서 closure배운거!!

// listViewModel에서 카운트랑 리셋이랑 모든걸 다 거기서 관리해보기
// viewModel하나만 만들어서 거기서 다 가지고있게하기..?
// 이유는 바인딩을 하기가 너무 복잡해져서..?
// Alert를 view level로 옮겨보기
// get Alert같은 로직들을 addItemview로 다 옮겨보기
// EnvironmentObject로 바인딩을 다해서 해보기

// Variable같은거는 다 ViewModel에서 관리하도록 (ListViewModel environmentObject를 사용해서)

// 1. CounterButton 이랑 ResetOrSaveButton 없애기
// 2. ResetOrSaveButton에 있던 alert 로직들 AddItemView로 옮기기 (showAlert:Bool은 viewModel에 들어가야함)
// 3. AddItemView, ListView 에서 ListViewModel environmentObject를 사용해서 관리하기
// 4. 모든 로직들은 ListViewModel에서 핸들하기

// 5. userDefault 추가하기
// 6. Enum, @escaping, didSet, debugging,


