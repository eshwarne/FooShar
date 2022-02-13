//
//  RoundedButton.swift
//  FooShar (iOS)
//
//  Created by Eshwar S on 13/02/22.
//

import SwiftUI

struct RoundedButton: View {
    var btnLabel:String = "Split"
    var height: CGFloat = 120;
    var width: CGFloat = 160;
    var body: some View {
        Button(action:{}){
            ZStack{
                Rectangle()
                    .cornerRadius(10)
                    .shadow(radius: 4)
                   
                HStack{
                    Text(btnLabel)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                }
            }
        }
        .frame(width: width, height: height, alignment: .center)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton()
    }
}
