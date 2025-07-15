//
//  File.swift
//  WayFinder
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI

extension View {
    public func wayFinderNavigationBarHidden(_ hidden: Bool) -> some View {
        Group {
            if #available(iOS 16.0, *) {
                self.navigationBarHidden(hidden)
            } else {
                self.uipNavigationBarHidden(hidden)
            }
        }
    }
}
