//
//  SwiftUIView.swift
//  
//
//  Created by Alvaro Cofre Perez on 09-05-22.
//

import SwiftUI

public struct WidgetBuilderView <Content: View>: View {
    let content: Content
    var height: CGFloat?  = nil
    @Binding var isLoading: Bool
    @Binding var isEmpty: Bool
    
    public init(isLoading: Binding<Bool>,
                isEmpty: Binding<Bool> = .constant(false),
                height: CGFloat? = nil,
                @ViewBuilder content: () -> Content) {
        self.content = content()
        self.height = height
        _isLoading = isLoading
        _isEmpty = isEmpty
        
    }
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            if isEmpty && !isLoading {
                if let height = height {
                    Spacer()
                        .frame(height: height)
                }
                Text("No hay contenido disponible")
                    .font(.callout)
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10.0)
                Image(packageResource: "empty_art", ofType: "png")
                    .resizable()
                    .scaledToFit()
            } else {
                self.content
            }
        }
        .hLeading()
        .background(Color("SoftBackgroundColor"))
        .progressDialog(isShowing: $isLoading, message: "", progress: Progress())
    }
}

struct WidgetBuilder_Previews: PreviewProvider {
    static var previews: some View {
        WidgetBuilderView(isLoading: .constant(true)){
            VStack() {
                Text("Hola mundo")
            }
        }
        WidgetBuilderView(isLoading: .constant(false), isEmpty: .constant(true), height: CGFloat(500)){
            Text("Hola mundo")
        }
        
        //        WidgetBuilderView(isLoading: .constant(false)) {
        //            Text("hola")
        //        }
    }
}
