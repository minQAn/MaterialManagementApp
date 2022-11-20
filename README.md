## MaterialManagementApp
* MVVM structure
* Data persistence by using Userdefaults
* Made common customized action button
* init for StateObject and sub view used ObservedObsect by taking from parent view which has StateObject
```
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
```

https://user-images.githubusercontent.com/59377684/202919711-2d2436c9-d0bb-4c87-bde3-e27e5b28466c.mov

