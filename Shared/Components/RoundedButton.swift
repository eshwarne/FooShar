//
//  RoundedButton.swift
//  FooShar (iOS)
//
//  Created by Eshwar S on 13/02/22.
//

import SwiftUI

struct RoundedButton: View {
    var btnLabel:String = "Split"
    var height: CGFloat = UIScreen.main.bounds.height*0.1;
    var width: CGFloat = UIScreen.main.bounds.width*0.8;
    var body: some View {
        Button(action:{}){
            ZStack{
                Rectangle()
                    .cornerRadius(10)
                    .shadow(radius: 4)
                   
                HStack{
                    Text(btnLabel)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        
                }
            }
        }
        .frame(width: 10 + width, height: 10 + height, alignment: .center)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton()
    }
}
