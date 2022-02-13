//
//  HomeView.swift
//  FooShar (iOS)
//
//  Created by Eshwar S on 13/02/22.
//

import SwiftUI

struct HomeView: View {
    @State private var noOfPeople:Float = 0
    private var twoColumnGridConfig:[GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @State var people : [String] = []
    var body: some View {
        Form{
            Section{ // Number of friends
                HStack(spacing:0){
                    Image(systemName: "person.3.fill")
                        .padding(.trailing, 10)
                    Text("Number Of Friends: \(Int(noOfPeople))")
                }
                
                Slider(value: $noOfPeople, in: 0...20, step:1){_ in
                    if(people.count < Int(noOfPeople)){
                        let chunk = [people.count..<Int(noOfPeople)]
                        chunk.forEach{_ in
                            people.append("")
                        }
                    }
                    else {
                        people = Array(people[0..<Int(noOfPeople)])
                    }
                    
                }
                
            }
            Section{
                ScrollView {
                    LazyVGrid(columns:twoColumnGridConfig){
                        ForEach((0..<people.count), id:\.self){index in
                            TextField("Name",text:$people[index])
                                .padding()
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height/3, alignment: .center)
            }
            Section{ // Button
                VStack{
                    RoundedButton(btnLabel:"SPLIT")
                        .onTapGesture {
                            print(people)
                        }
                }
                .frame(maxWidth:.infinity)
            }
        }
        .navigationTitle("Food Price Splite")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
