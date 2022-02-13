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
    // MARK: UI Declaration
    var body: some View {
        ZStack{
            VStack{
                TextEditor(text: $name)
                    .background(Color("NameCardBackgroundColor"))
                    .cornerRadius(5)
                    .padding(-15)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
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
