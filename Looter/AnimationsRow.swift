//
//  AnimationsRow.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/23/24.
//

import SwiftUI

struct AnimationsRow: View {
    var item: LootItem
    @State private var isAnimated = false
    @State private var isTriggered = false
    @State private var dropIcon = 0.0
    var body: some View {
        VStack{
            Text(item.type.rawValue)
                .padding()
                .background(item.rarity.colorForRarity())
                .cornerRadius(30)
                .frame(height: 150, alignment: .bottom)
                .font(.system(size: 80))
                .shadow(color: item.rarity.colorForRarity(), radius: isAnimated ? 50 : 0 )
                .animation(.bouncy .delay(1) ,value: isAnimated)
                .rotation3DEffect(.degrees(isAnimated ? 360 : 0), axis: (x: 1, y: isAnimated ? 0.5 : 0, z: 0))
                .animation(.spring(duration: 0.7), value: isAnimated)
                .task {
                    try? await Task.sleep(nanoseconds: 400000000)
                    isAnimated = true
                }
                .onTapGesture {
                    dropIcon = +500
                    isTriggered = true
                }
                .offset(y: dropIcon)
                .animation(.timingCurve(0.55,0,1,0.45).speed(0.1), value: isTriggered)
            
            
            Text(item.name).foregroundColor(item.rarity.colorForRarity())
                .padding(10)
                .frame(height: 100, alignment: .top)
                .font(.system(size: 20))
                .fontWeight(.black)
                .offset(y: dropIcon)
                .animation(.timingCurve(0.55,0,1,0.45).speed(0.1), value: isTriggered)
            
        }
    }
}

#Preview {
    AnimationsRow(item: testLootItems[0])
}
