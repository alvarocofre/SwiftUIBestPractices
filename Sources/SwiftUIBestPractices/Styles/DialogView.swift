//
//  SwiftUIView.swift
//  
//
//  Created by Alvaro Cofre Perez on 09-05-22.
//

import SwiftUI
import Combine

struct GenericDialog<DialogContent: View>: ViewModifier {
    @Binding var isShowing: Bool
    let cancelOnTapOutside: Bool
    let cancelAction: (() -> Void)?
    let dialogContent: DialogContent
    
    public init(isShowing: Binding<Bool>,
                cancelOnTapOutside: Bool,
                cancelAction: (() -> Void)?,
                @ViewBuilder dialogContent: () -> DialogContent) {
        _isShowing = isShowing
        self.cancelOnTapOutside = cancelOnTapOutside
        self.cancelAction = cancelAction
        self.dialogContent = dialogContent()
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.1))
                    .onTapGesture {
                        if cancelOnTapOutside {
                            cancelAction?()
                            isShowing = false
                        }
                    }
                ZStack {
                    dialogContent
                        .background(RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.white))
                }.padding(40)
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

public extension View {
    func genericDialog<DialogContent: View>(isShowing: Binding<Bool>,
                                            cancelOnTapOutside: Bool = true,
                                            cancelAction: (() -> Void)? = nil,
                                            @ViewBuilder dialogContent: @escaping () -> DialogContent) -> some View {
        self.modifier(GenericDialog(isShowing: isShowing,
                                    cancelOnTapOutside: cancelOnTapOutside,
                                    cancelAction: cancelAction,
                                    dialogContent: dialogContent))
    }
    
}

public extension View {
    func progressDialog(isShowing: Binding<Bool>,
                        message: String,
                        progress: Progress) -> some View {
        self.genericDialog(isShowing: isShowing, cancelOnTapOutside: false) {
            VStack(spacing: 10) {
                if #available(iOS 14.0, *) {
                    if progress.isIndeterminate {
                        ProgressView()
                            .padding()
                            .scaleEffect(2)
                            .progressViewStyle(CircularProgressViewStyle())
                    } else {
                        ProgressView(value: Float(progress.completedUnitCount) / Float(progress.totalUnitCount))
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                } else {
                    ActivityIndicator(isAnimating: true)
                }
                if !message.isEmpty {
                    Text(message)
                }
            }.padding()
        }
    }
}

public struct ActivityIndicator: UIViewRepresentable {
  public typealias UIView = UIActivityIndicatorView
  public var isAnimating: Bool = true
  public var configuration = { (indicator: UIView) in }

    public init(isAnimating: Bool = true, configuration: ((UIView) -> Void)? = nil) {
        self.isAnimating = isAnimating
        if let configuration = configuration {
            self.configuration = configuration
        }
    }

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView {
        UIView()
        
    }

    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

public extension View where Self == ActivityIndicator {
    func configure(_ configuration: @escaping (Self.UIView) -> Void) -> Self {
        Self.init(isAnimating: self.isAnimating, configuration: configuration)
    }
}

struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hola mundo")
            .progressDialog(isShowing: .constant(true),
                            message: "Cargando...",
                            progress: Progress())
//            .genericDialog(isShowing: .constant(true), dialogContent: {
//                Text("Hi")
//                    .padding()
//            })

    }
}
