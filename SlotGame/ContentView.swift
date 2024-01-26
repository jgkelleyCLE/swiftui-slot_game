//
//  ContentView.swift
//  SlotGame
//
//  Created by Jack Kelley on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var images = ["cherry", "star", "apple"]
    
    @State var credits = 1000
    @State var imageOne = Int.random(in: 0...2)
    @State var imageTwo = Int.random(in: 0...2)
    @State var imageThree = Int.random(in: 0...2)
    @State var winner = false
    
    var body: some View {
        VStack {
            Text("SwiftUI Slots!")
                .font(.largeTitle)
            Spacer()
            Text("Credits: \(credits)")
            Spacer()
            HStack {
                Image("\(images[imageOne])")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Image("\(images[imageTwo])")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Image("\(images[imageThree])")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            Spacer()
            
            Button {
                spin()
            } label: {
                Text("Spin")
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
                    .frame(width: 80, height: 20)
                    .padding()
                    .background(.pink)
                    .cornerRadius(30)
            }
            .alert(isPresented: $winner){
                Alert(
                    title: Text("WINNER"),
                    message: Text("You won 100 credits!"),
                    dismissButton: .default(Text("OK"))
                )
                
            }
            Spacer()
        }
    }
    
    func spin() {
        imageOne = Int.random(in: 0...2)
        imageTwo = Int.random(in: 0...2)
        imageThree = Int.random(in: 0...2)
        
        if imageOne == imageTwo && imageOne == imageThree {
            credits += 1000
            winner = true
        }else {
            credits -= 100
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
