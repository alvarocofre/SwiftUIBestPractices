//
//  SwiftUIView.swift
//  
//
//  Created by Alvaro Cofre Perez on 17-05-23.
//

import SwiftUI

public struct TextFieldClearButton: ViewModifier {
    @Binding public var text: String
    
    public init(text: Binding<String>) {
        self._text = text
    }
    
    public func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}

struct TextFieldClearButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Example usage of TextFieldClearButton with a TextField
            VStack {
                TextField("Enter text", text: .constant("Example"))
                    .padding()
                    .border(Color.gray)
                    .modifier(TextFieldClearButton(text: .constant("Example")))
            }
            .padding()
            .previewLayout(.sizeThatFits)
            
            // Example usage of TextFieldClearButton with a SecureField
            VStack {
                SecureField("Enter password", text: .constant("Password"))
                    .padding()
                    .border(Color.gray)
                    .modifier(TextFieldClearButton(text: .constant("Password")))
            }
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }
}
