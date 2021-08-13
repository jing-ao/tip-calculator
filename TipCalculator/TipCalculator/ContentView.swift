//
//  ContentView.swift
//  TipCalculator
//
//  Created by Jingao Sun on 8/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var bill = "0.0"
    @State private var people = "0"
    @State private var tip = 0.0
    @State private var isEditing = false
    @State private var tipsPerPerson = 0.0
    @State private var total = 0.0
    
    var body: some View {
        VStack {
            Text("Bill")
                .font(.title)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                
            
            TextField(
                "Enter the bill amount",
                text: $bill
            )
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .border(Color.black)
                .padding()
                .foregroundColor(.blue)
            
            Text("Number of People")
                .font(.title)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            
            TextField(
                "number of people spliting the bill",
                text: $people
            )
                .keyboardType(.numberPad)
                .border(Color.black)
                .multilineTextAlignment(.trailing)
            
            Text("Tip %")
                .font(.title)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            Slider(
                value: $tip,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
                .accentColor(.blue)
                .border(Color.black)

            Text("You tips \(Int(tip)) %")
                .foregroundColor(isEditing ? .red : .blue)
            
            HStack {
                VStack {
                    Text("Tips per person")
                    Text(String(calcTips(
                                    bill: Double(bill) ?? 0.0,
                                    people: Int(people) ?? 0,
                                    tip: tip)))
                }
                Spacer()
                VStack {
                    Text("Total per person")
                    Text(String(calcTotal(
                                    bill: Double(bill) ?? 0.0,
                                    people: Int(people) ?? 0,
                                    tip: tip)))
                }
            }
        }
    }
}

func calcTips(bill: Double, people: Int, tip: Double) -> Double {
    return (bill / Double(people)) * (tip/100)
}

func calcTotal(bill: Double, people: Int, tip: Double) -> Double {
    return bill / Double(people) * (1 + tip/100)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
