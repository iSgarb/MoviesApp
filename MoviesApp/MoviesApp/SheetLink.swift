//
//  SheetLink.swift
//  PracticaSwiftUI
//
//  Created by Sebastián García Burgos on 11/11/22.
//

import SwiftUI

struct SheetLink<Content: View, Label: View>: View {
    @Binding var showBinding: Bool
    @State private var showState: Bool
    private let useBinding: Bool
    let content: () -> Content
    let label: () -> Label
    var onDismiss: (() -> ())? = nil
    
    init(
        show: Binding<Bool>? = nil,
        @ViewBuilder content: @escaping () -> Content,
        onDismiss: (() -> ())? = nil,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.content = content
        self.label = label
        self.onDismiss = onDismiss
        if let show = show {
            self.useBinding = true
            self._showBinding = show
        }
        else{
            self.useBinding = false
            self._showBinding = .constant(false)
        }
        self.showState = false
    }
    
    var body: some View {
        Button(
            action: {
                if useBinding {
                    showBinding.toggle()
                }
                else{
                    showState.toggle()
                }
            },
            label: label
        )
        .sheet(
            isPresented: useBinding ? $showBinding : $showState,
            onDismiss: onDismiss,
            content: content
        )
    }
}
