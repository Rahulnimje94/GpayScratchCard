//
//  ContentView.swift
//  CardScratchAnimation
//
//  Created by Rahul on 25/02/25.
//

import SwiftUI

struct CardScratch: View {
    @State var points: [CGPoint] = []
    
    var body: some View {
        VStack {
            ZStack {
                ScratchImageView()
                CashBackInfoView().mask {
                    Path { path in
                        path.addLines(points)
                    }.stroke(style: StrokeStyle(lineWidth: 50, lineCap: .round, lineJoin: .round))
                }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged{ drag in
                    points.append(drag.location)
                })
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color(red: 40/255, green: 40/255, blue: 40/255))
    }
}

#Preview {
    CardScratch()
}

struct ScratchImageView: View {
    var body: some View {
        Image("gpay")
            .resizable()
            .scaledToFill()
            .cornerRadius(12)
            .frame(width: 200, height: 200)
            .shadow(radius: 10)
    }
}

struct CashBackInfoView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Image("banner")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 201, height: 140)
                VStack(alignment: .leading, spacing: 6) {
                    Text("₹50 - ₹100")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Text("Cashback on mobile recharge")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
            }
            .background(Color(red: 20/255, green: 20/255, blue: 20/255))
            .clipShape(.rect(cornerRadius: 12))
        }
        .frame(width: 200, height: 200)
    }
}
