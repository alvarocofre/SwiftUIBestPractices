//
//  SwiftUIView.swift
//  
//
//  Created by Alvaro Cofre Perez on 06-05-22.
//

import SwiftUI

extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct ExtensionView: View {
    var body: some View {
        VStack {
            Circle()
                .frame(width: 50, height: 50)
                .hLeading()
            Circle()
                .frame(width: 50, height: 50)
                .hCenter()
            Circle()
                .frame(width: 50, height: 50)
                .hTrailing()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionView()
    }
}
