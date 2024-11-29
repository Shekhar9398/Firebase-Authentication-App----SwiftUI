import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    
    var textColor: Color = .white
    var bgColor: Color = .teal
    var hasBorder : Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor) // Use 'foregroundColor' instead of 'foregroundStyle'
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColor))
            .font(.headline)
            .fontWeight(.semibold)
            .opacity(configuration.isPressed ? 0.7 : 1.0) // Optional: Add pressed effect for visual feedback
            .overlay {
                hasBorder ?
                Capsule().stroke(.gray, lineWidth: 1) :
                nil
            }
            .scaleEffect(configuration.isPressed ? 0.95 : 1)

    }
}

