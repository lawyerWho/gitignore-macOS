//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/05/14.
//

import SwiftUI

struct GridSyle {
    @PositiveNumber var columnsInPortrait: Int
    @PositiveNumber var columnsInLandscape: Int

    let spacing: CGFloat
    let animation: Animation?

    var columns: Int {
        #if os(OSX) || os(tvOS) || targetEnvironment(macCatalyst)
        return columnsInLandscape
        #elseif os(watchOS)
        return columnsInPortrait
        #else
        let screenSize = UIScreen.main.bounds.size
        return screenSize.width > screenSize.height ? columnsInLandscape : columnsInPortrait
        #endif
    }
}

struct GridStyleKey: EnvironmentKey {
    static let defaultValue = GridSyle(columnsInPortrait: 2, columnsInLandscape: 2,
                                       spacing: 8, animation: .default)
}

extension EnvironmentValues {
    var gridStyle: GridSyle {
        get { self[GridStyleKey.self] }
        set { self[GridStyleKey.self] = newValue }
    }
}