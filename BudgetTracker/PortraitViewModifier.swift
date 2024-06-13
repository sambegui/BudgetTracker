//
//  PortraitViewModifier.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//

import SwiftUI

struct PortraitViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
            }
            .onDisappear {
                UIDevice.current.setValue(UIInterfaceOrientation.unknown.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
            }
    }
}

extension View {
    func portraitOnly() -> some View {
        self.modifier(PortraitViewModifier())
    }
}
