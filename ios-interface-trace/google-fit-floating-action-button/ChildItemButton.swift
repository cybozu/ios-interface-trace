//
//  ChildItemButton.swift
//  ios-interface-trace
//
//  Created by ky0me22 on 2022/02/21.
//

import SwiftUI

struct ChildItemButton: View {
    let offsetY: CGFloat
    let color: Color
    let sfName: String
    
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: sfName)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
        })
            .foregroundColor(.white)
            .frame(width: 100, height: 100, alignment: .center)
            .background(color)
            .cornerRadius(50)
            .offset(x: 0, y: offsetY)
        // 表示/非表示が切り替わる時のアニメーションを指定する
        // offsetYの分だけズレを戻す
            .transition(.offset(x: 0, y: -offsetY))
    }
}

struct ChildItemButton_Previews: PreviewProvider {
    static var previews: some View {
        ChildItemButton(offsetY: 100, color: Color.orange, sfName: "paperclip")
    }
}
