//
//  SlideButtonView.swift
//  PetAdoption
//
//  Created by Goran Saric on 25.04.25.
//

import SwiftUI

struct SlideButtonView: View {
    @State private var dragOffset: CGFloat = 0
    @State private var confirmed = false
    @State private var isDragging: Bool = false
    @State private var idleBounce: Bool = false
    @State private var handleOpacity: Double = 1.0
    @Binding var navigate: Bool

    
    let buttonWidth: CGFloat = 300
    let buttonHeight: CGFloat = 60
    let handleSize: CGFloat = 50
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: buttonHeight / 2)
                .fill(Color.blue.opacity(0.9))
                .frame(width: buttonWidth, height: buttonHeight)
            
            Text(confirmed ? "Confirmed!" : "Slide to continue")
                .foregroundColor(.white)
                .font(.headline)
                .opacity(dragOffset > buttonWidth - handleSize * 1.5 ? 0 : 1)
            
            HStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: handleSize, height: handleSize)
                    .opacity(isDragging ? 1.0 : handleOpacity)
                    .overlay(
                        Image(systemName: "chevron.right")
                            .foregroundColor(.blue)
                    )
                    .offset(x: dragOffset + (idleBounce && !isDragging ? 5 : 0))
                    .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: idleBounce)
                    .onAppear{
                        idleBounce = true
                        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                               handleOpacity = 0.5
                           }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                isDragging = true
                                dragOffset = max(0, min(value.translation.width, buttonWidth - handleSize))
                            }
                            .onEnded { _ in
                                isDragging = false

                                if dragOffset > buttonWidth - handleSize * 1.5 {
                                    confirmed = true
                                    navigate = true
                                }

                                dragOffset = confirmed ? buttonWidth - handleSize : 0
                            }
                    )


                Spacer()
            }
            .padding(.leading, 5)
        }
        .frame(width: buttonWidth, height: buttonHeight)
        .background(Color.black.opacity(0.6))
        .clipShape(Capsule())
        .animation(.easeOut, value: dragOffset)
    }
}

#Preview {
    SlideButtonView(navigate: .constant(false))
}
