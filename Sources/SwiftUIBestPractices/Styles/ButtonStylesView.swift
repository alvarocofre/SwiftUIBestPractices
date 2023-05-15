//
//  SwiftUIView.swift
//  
//
//  Created by Alvaro Cofre Perez on 14-05-23.
//

import SwiftUI

private extension ButtonStyle {
    var foregroundColor: Color { .white }
    var padding: CGFloat { 20 }
    var cornerRadius: CGFloat { 30 }
    var pressedColorOpacity: Double { 0.5 }
}

public struct PrimaryButtonStyle: ButtonStyle {
    
    let backgroundColor: Color = Color.themePrimary
    let isDisabled: Bool
    
    public init(isDisabled: Bool) {
        self.isDisabled = isDisabled
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(foregroundColor)
            .font(Font.custom(FontNameManager.Rubik.medium, size: 16))
            .padding(padding)
            .background(backgroundColor.opacity(
                configuration.isPressed || isDisabled ? pressedColorOpacity : 1
            ))
            .cornerRadius(cornerRadius)
    }
}

public struct SecondaryButtonStyle : ButtonStyle {
    
    let backgroundColor: Color = Color.themeSecondary
    let isDisabled: Bool
    
    public init(isDisabled: Bool) {
        self.isDisabled = isDisabled
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(foregroundColor)
            .font(Font.custom(FontNameManager.Rubik.medium, size: 16))
            .padding(padding)
            .background(backgroundColor.opacity(
                configuration.isPressed || isDisabled ? pressedColorOpacity : 1
            ))
            .cornerRadius(cornerRadius)
    }
}

public struct SuccessButtonStyle : ButtonStyle {
    let backgroundColor: Color = Color.themeSuccess
    let isDisabled: Bool
    
    public init(isDisabled: Bool) {
        self.isDisabled = isDisabled
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(foregroundColor)
            .font(Font.custom(FontNameManager.Rubik.medium, size: 16))
            .padding(padding)
            .background(backgroundColor.opacity(
                configuration.isPressed || isDisabled ? pressedColorOpacity : 1
            ))
            .cornerRadius(cornerRadius)
    }
}

public struct OutlineButtonStyle: ButtonStyle {
    
    let backgroundColor: Color = .white
    let foregroundColor: Color
    let isDisabled: Bool
    var strokeColor: Color { .themeForeground }
    
    public init(foregroundColor: Color, isDisabled: Bool) {
        self.foregroundColor = foregroundColor
        self.isDisabled = isDisabled
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(foregroundColor)
            .font(.p)
            .padding(padding)
            .background(backgroundColor.opacity(
                configuration.isPressed || isDisabled ? pressedColorOpacity : 1
            ))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(strokeColor, lineWidth: 2)
            )
            .cornerRadius(cornerRadius)
    }
}

public struct GoogleSigninButton: View {
    
    public init(clicked: @escaping (() -> Void)) {
        self.clicked = clicked
    }
    
    var clicked: (() -> Void) // use closure for callback
    
    public var body: some View {
        Button(action: clicked) { // call the closure here
            HStack(){
                Image("g_logo", bundle: .module)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                Text("Sign in with Google")
            }
        }.buttonStyle(
            OutlineButtonStyle(foregroundColor: Color.themePrimary,
                               isDisabled: false))
    }
}

public struct AppleSigninButton: View {
    
    public init(clicked: @escaping (() -> Void)) {
        self.clicked = clicked
    }
    
    var clicked: (() -> Void) // use closure for callback
    
    public var body: some View {
        Button(action: clicked) { // call the closure here
            HStack(){
                Image(systemName: "apple.logo")
//                Image("g_logo", bundle: .module)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                Text("Sign in with Apple")
            }
        }.buttonStyle(
            OutlineButtonStyle(foregroundColor: Color.themePrimary,
                               isDisabled: false))
    }
}


struct ButtonStyles: View {
    var body: some View {
        VStack(){
            Button("PrimaryButtonStyle") {
                
            }.buttonStyle(PrimaryButtonStyle(isDisabled: false))
            
            GoogleSigninButton(clicked: {
                print("Testing...")
            })
            
            AppleSigninButton {
                print("Apple")
            }
            
            
            
//            Button {
//
//            } label: {
//                HStack(){
//                    Image("f_logo", bundle: .module)
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                    Text("Sign in with Facebook")
//                }
//            }.buttonStyle(OutlineButtonStyle(foregroundColor: Color.themePrimary, isDisabled: false))

            Button("PrimaryButtonStyle") {
                print("Button pressed!")
            }.buttonStyle(PrimaryButtonStyle(isDisabled: false))
            
            Button("SecondaryButtonStyle") {
                print("Button pressed!")
            }.buttonStyle(SecondaryButtonStyle(isDisabled: false))
            Button("SuccessButtonStyle") {
                print("Button pressed!")
            }
            .buttonStyle(SuccessButtonStyle(isDisabled: false))
        }
        .padding(.horizontal, 20)
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyles()
    }
}
