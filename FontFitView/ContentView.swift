// https://github.com/m760622/FontFitView
//  ContentView.swift
//  FontFitView
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2021-01-24.
// https://github.com/m760622

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("FontFit function in SwiftUI")
                .foregroundColor(.blue).opacity(0.7) .fitSystemFont() .frame(height: 50)
            Spacer()
            VStack{
                Text("Mohammed Abunada")
                    .fitSystemFont() .frame( height: 60)
                Text("Mohammed Abunada")
                    .fitSystemFont() .frame(width:300, height: 60)
                Text("Mohammed Abunada")
                    .fitSystemFont() .frame(width:200, height: 60)
                Text("Mohammed Abunada")
                    .fitSystemFont() .frame(height: 60) .padding(.horizontal, 60)
                Text("Mohammed")
                    .fitSystemFont() .frame(height: 40)
                Text("Mohammed")
                    .fitSystemFont() .frame(height: 50)
                Text("Mohammed")
                    .fitSystemFont() .frame(height: 60)
                Text("20210124")
                    .fitSystemFont() .frame(height: 80)
            }//VStack
            Spacer()
        }//VStack
        .padding()
    }//body
}//ContentView

struct FitSystemFont: ViewModifier {
    var lineLimit: Int
    var minimumScaleFactor: CGFloat
    var percentage: CGFloat
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .font(.system(size: min(geometry.size.width, geometry.size.height) * percentage))
                .lineLimit(self.lineLimit) .minimumScaleFactor(self.minimumScaleFactor)
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
        }//GeometryReader
    }//body
}//FitSystemFont

extension View {
    func fitSystemFont(lineLimit: Int = 1, minimumScaleFactor: CGFloat = 0.01, percentage: CGFloat = 1) -> ModifiedContent<Self, FitSystemFont> {
        return modifier(FitSystemFont(lineLimit: lineLimit, minimumScaleFactor: minimumScaleFactor, percentage: percentage))
    }//fitSystemFont
}//extension View


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
