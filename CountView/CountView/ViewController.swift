//
//  ViewController.swift
//  CountView
//
//  Created by Zabihullah Najeeb on 2024-05-23.
//


import SwiftUI

// CounterView is a SwiftUI View that displays a counter with buttons to increase count and reset
struct CounterView: View {
    @State private var count: Int = 0 // this is the state variable to hold the count
    @State private var selectedAmount: Int = 1 // this is the state variable to hold the selected amount for increasing the count

    var body: some View {
        VStack {
            // Title label
            Text("Counter App")
                .font(.title)
                .padding(.top, 50) // Add padding to the top of the label
            
            // Display current count
            Text("Count: \(count)")
                .font(.title)
                .padding() // Add padding to the text
            
            // here we can  select the amount to increase count
            Stepper("Select Amount: \(selectedAmount)", value: $selectedAmount, in: 1...10)
                .padding()
            
            // this Button to increase count by selected amount
            Button(action: {
                count += selectedAmount // Increase count when button is tapped
            }) {
                Text("Increase Count by \(selectedAmount)")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                // These properties are goes to Incresas Button
            }
            .padding()
            
            // This is reset botton count to zero
            Button(action: {
                count = 0 // Reset count when button is tapped
            }) {
                Text("Reset")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding() // Add padding to the button
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView() // Preview CounterView
    }
}

