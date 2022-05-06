//
//  SwiftUIView.swift
//  
//
//  Created by Alvaro Cofre Perez on 06-05-22.
//

import SwiftUI
let rem = CGFloat(14.0)

extension Font {
    
    public static var h1: Font {
        return Font.system(size: rem+8).weight(.bold)
    }
    public static var h2: Font {
        return Font.system(size: rem+5)
    }
    
    public static var h3: Font {
        return Font.system(size: rem+2)
    }
    
    public static var h4: Font {
        return Font.system(size: rem,weight: Weight.ultraLight)
    }
    
    public static var p: Font {
        return Font.system(size: rem, weight: .light)
    }
    
    public static var small: Font {
        return Font.system(size: 0.75*rem)
    }
    
    public static var sub: Font {
        return Font.system(size: 0.8*rem)
    }
    
}

struct FontStylesView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("h1 Heading con mucho texto para ver como se comporta")
                .font(.h1)
            Text("h2 Heading")
                .font(.h2)
            Text("h3 Heading")
                .font(.h3)
            Text("h4 Heading")
                .font(.h4)
            Text("SubTitle")
                .font(.sub)
            Text("Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.")
                .font(.p)
            Text("Lorem ipsum")
                .font(.small)
        }
    }
}

struct FontStylesView_Previews: PreviewProvider {
    static var previews: some View {
        FontStylesView()
    }
}
