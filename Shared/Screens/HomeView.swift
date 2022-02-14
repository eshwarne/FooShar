//
//  HomeView.swift
//  FooShar (iOS)
//
//  Created by Eshwar S on 13/02/22.
//

import SwiftUI
var twoColumnGridConfig:[GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
var currencyCode = Locale.current.currencyCode ?? "INR"

enum HomeFormFields {
    case BILL_AMOUNT, FRIEND_NAMES
}

struct HomeView: View {
    // MARK: State variables
    @State private var noOfPeople:Float = 0
    @State var people : [String] = []
    @State private var billAmount = 0
    @State private var splitResultScreenIsActive:Bool = false
    @FocusState private var currentFocusedField: HomeFormFields?
    
    // MARK: UI View
    var body: some View {
        ZStack{
            NavigationLink(destination: Text(people.joined(separator:", ")), isActive:$splitResultScreenIsActive) {
                EmptyView()
            }
        Form{
            Section{ // Bill Amount input
                HStack{
                    Image(systemName: "newspaper.fill")
                        .frame(width:25)
                        .padding(.trailing, 10)
                    
                    Text("Bill Amount")
                    
                }
                TextField("Amount", value:$billAmount, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
                    .focused($currentFocusedField, equals:HomeFormFields.BILL_AMOUNT )
                    .onChange(of: currentFocusedField) { field in
                       print(field)
                    }
            }
            Section{ // Number of friends
                HStack{
                    Image(systemName: "person.3.fill")
                        .frame(width:25)
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
            Section{ // Friends names input
                HStack{
                    Image(systemName: "person.fill.viewfinder")
                        .frame(width:25)
                        .padding(.trailing, 10)
                    Text("Friend(s) names")
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                
                ScrollView {                    LazyVGrid(columns:twoColumnGridConfig, spacing: 0){
                        ForEach((0..<people.count), id:\.self){index in
                            NameInputCard(name:$people[index])
                                .padding(.trailing, 10)
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height/4, alignment: .center)
            }
            Section{ // Split Button
                VStack{
                    RoundedButton(btnLabel:"SPLIT\n\(billAmount.formatted(.currency(code: currencyCode)))")
                        .onTapGesture {
                            splitResultScreenIsActive = true
                        }
                }
                .frame(maxWidth:.infinity)
            }
        }
        }
        .navigationTitle("Set the Stage")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
