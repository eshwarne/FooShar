//
//  HomeView.swift
//  FooShar (iOS)
//
//  Created by Eshwar S on 13/02/22.
//

import SwiftUI

struct HomeView: View {
    @State var noOfPeople:Float = 3
    var body: some View {
        Form{
            Section{ // Number of friends
                HStack(spacing:0){
                    Image(systemName: "person.3.fill")
                        .padding(.trailing, 10)
                    Text("Number Of Friends: \(Int(noOfPeople))")
                }
                
                Slider(value: $noOfPeople, in: 0...20, step:1)
                
            }
            Section{ // Button
                VStack{
                    RoundedButton(btnLabel:"SPLIT")
                }
                .frame(maxWidth:.infinity)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
