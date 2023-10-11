//
//  SwiftUIView.swift
//  
//
//  Created by Alvaro Cofre Perez on 15-05-23.
//

import SwiftUI

private extension TextFieldStyle {
    var padding: CGFloat { 10 }
    var cornerRadius: CGFloat { 10 }
    var backgroundColor: Color {Color.white}
    var foregroundColor: Color {Color.themeForeground}
}


public struct OvalTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(padding)
//            .background(LinearGradient(gradient: Gradient(colors: [Color.themeInfo, Color.themeInfo]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(cornerRadius)
            .shadow(color: .gray, radius: 10)
    }
}

public struct EmailTextFieldStyle: TextFieldStyle {

    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .colorInvert()
            .padding(padding)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(cornerRadius)
            .keyboardType(UIKeyboardType.emailAddress)
    }
}

public struct SecureInputView: View {

    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String

    public init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }

    public var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
    }
}

/// underLine TextField style
extension View {
    public func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 1).padding(.top, 30))
            .foregroundColor(Color.themeForeground)
            .font(.p)
    }
}



struct TextFieldStyles: View {
    @State var userName = ""
    @State var password = ""
    var body: some View {
        VStack(alignment: .center, spacing: 15){
            
            HStack {
//                Image(systemName: "envelope")
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $userName)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())

            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $userName)
            }
            .textFieldStyle(OvalTextFieldStyle())
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $userName)
            }.underlineTextField()

            HStack {
                Image(systemName: "envelope")
                TextField("Cuenta/Email", text: $userName)
            }
            .padding(.horizontal, 10)
            .textFieldStyle(EmailTextFieldStyle())
                        .shadow(color: .gray, radius: 1)
            .background(Color.white.opacity(userName == "" ? 0 : 0.12))
//
            HStack{
                Image(systemName: "lock")
                SecureField("Contraseña", text: $password)
                    .colorInvert()
                    .padding()
                    .foregroundColor(Color.themeForeground)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 10)
//
            TextField("Escriba un comentario aquí", text: $userName)
                .frame(height: 40)
                .font(.p)
                .textFieldStyle(.roundedBorder)
//                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray))
                .multilineTextAlignment(.center)

            
            SecureInputView("heelo", text: $userName)
        }
    }
}

struct TextFieldStyles_Previews: PreviewProvider {
    
    static var previews: some View {
        TextFieldStyles()
    }
}
