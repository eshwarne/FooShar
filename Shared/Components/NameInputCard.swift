//
//  NameInputCard.swift
//  FooShar (iOS)
//
//  Created by Eshwar S on 14/02/22.
//

import SwiftUI
var screenWidth = UIScreen.main.bounds.width
var screenHeight = UIScreen.main.bounds.height
struct NameInputCard: View {
    // MARK: State variables
    @Binding var name:String;
    @State private var isOnFocus = false;
    @FocusState private var currentFocus: String?
    // MARK: UI Declaration
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    TextEditor(text: $name)
                        .background(Color("NameCardBackgroundColor"))
                        .cornerRadius(5)
                        .padding(-15)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .focused($currentFocus, equals: "NAME_INPUT_FIELD")
                        .onChange(of: currentFocus) { currentFocus in
                            if(currentFocus != "NAME_INPUT_FIELD" ){
                                isOnFocus = false;
                            } else {
                                isOnFocus = true;
                            }
                           
                        }
                    if(name.count == 0 && isOnFocus == false){
                        Text("Name")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .opacity(0.7)
                            .onTapGesture {
                                self.isOnFocus = true
                                self.currentFocus = "NAME_INPUT_FIELD"
                            }
                    }
                   
                        

                }
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
        }
        
        .frame(width: screenWidth*0.3, height: screenWidth*0.25, alignment: .topLeading)
        .cornerRadius(20)
        .padding()
        .shadow(radius: 10)
        
    }
}

struct NameInputCard_Previews: PreviewProvider {
    static var previews: some View {
        NameInputCard(name:.constant("Eshwar"))
    }
}
