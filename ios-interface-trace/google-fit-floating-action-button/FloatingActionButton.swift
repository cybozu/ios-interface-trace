//
//  FloatingActionButton.swift
//  ios-interface-trace
//
//  Created by ky0me22 on 2022/02/21.
//

import SwiftUI

struct FloatingActionButton: View {
    // 子アイテムの展開アニメーションを制御するために配列にする
    @State private var tapped = [false, false, false]
    
    var body: some View {
        // .zIndex() でViewの重なり順を指定する
        ZStack {
            // tappedの状態切り替えで子アイテムの表示/非表示を制御する
            if tapped[0] {
                ChildItemButton(offsetY: -150, color: Color.green, sfName: "paperplane")
                    .zIndex(2)
            }
            if tapped[1] {
                ChildItemButton(offsetY: -300, color: Color.yellow, sfName: "lasso")
                    .zIndex(1)
            }
            if tapped[2] {
                ChildItemButton(offsetY: -450, color: Color.red, sfName: "trash")
                    .zIndex(0)
            }
            Button(action: {
                // 展開のアニメーションは全体で0.9秒
                // それぞれの子アイテムの移動時間を計算して、移動開始時間のズレを調整する
                // 展開する時（tappedがfalse→trueになるとき）はdelayは不要
                // 格納する時は合計で0.9秒になるようにdurationとdelayを設定
                withAnimation(Animation.linear(duration: 0.3).delay(tapped[0] ? 0.6 : 0)) {
                    tapped[0].toggle()
                }
                withAnimation(Animation.linear(duration: 0.6).delay(tapped[1] ? 0.3 : 0)) {
                    tapped[1].toggle()
                }
                withAnimation(Animation.linear(duration: 0.9)) {
                    tapped[2].toggle()
                }
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
            })
                .foregroundColor(.white)
                .frame(width: 100, height: 100, alignment: .center)
                .background(Color.gray)
                .cornerRadius(50)
                .rotationEffect(tapped[0] ? Angle(degrees: 135) : .zero)
                .shadow(color: .gray, radius: 6, x: 0.0, y: 5)
                .zIndex(3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .padding(20)
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
