import SwiftUI

struct GlowBorder: ViewModifier {
    var color: Color
    var lineWidth: Int
    
    func body(content: Content) -> some View {
        applyShadow(content: content, lineWidth: lineWidth)
    }
    
    @ViewBuilder
    func applyShadow<Content: View>(content: Content, lineWidth: Int) -> some View {
        if lineWidth == 0 {
            content
        } else {
            applyShadow(content: content.shadow(color: color, radius: 1), lineWidth: lineWidth - 1)
        }
    }
}

extension View {
    func glowBorder(color: Color, lineWidth: Int) -> some View {
        self.modifier(GlowBorder(color: color, lineWidth: lineWidth))
    }
}
