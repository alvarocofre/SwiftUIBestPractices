//
//  SwiftUIView.swift
//  
//
//  Created by Alvaro Cofre Perez on 09-05-22.
//

import SwiftUI

public struct WidgetBuilderView <Content: View>: View {
    let content: Content
    @Binding var isLoading: Bool
    @Binding var isEmpty: Bool
    
    public init(isLoading: Binding<Bool>,
         isEmpty: Binding<Bool> = .constant(false),
         @ViewBuilder content: () -> Content) {
        self.content = content()
        _isLoading = isLoading
        _isEmpty = isEmpty
    }
    
    public var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                if isEmpty && !isLoading {
                    Spacer()
                        .frame(height: geo.size.height-280)
                    Image(packageResource: "empty_art", ofType: "png")
                        .resizable()
                        .scaledToFit()
                } else {
                    self.content
                }
            }
            .progressDialog(isShowing: $isLoading, message: "", progress: Progress())
        }
    }
}

struct WidgetBuilder_Previews: PreviewProvider {
    static var previews: some View {
        WidgetBuilderView(isLoading: .constant(true)){
            VStack() {
                Text("Hola mundo")
            }
        }
        WidgetBuilderView(isLoading: .constant(false), isEmpty: .constant(true)){
            Text("Hola mundo")
        }
        
//        WidgetBuilderView(isLoading: .constant(false)) {
//            Text("hola")
//        }
    }
}
