//
//  EnvironmentSettings.swift
//  GameOfLife
//
//  Created by Lambda_School_Loaner_214 on 8/20/20.
//  Copyright © 2020 Empty Bliss. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// TODO: refactor - more swifty
private let KeyLightModeColor = "lightModeColor"
private let KeyDarkModeColor = "darkModeColor"
private let KeyBoardSize = "boardSize"

private let LightModeDefaultColor = Color.black
private let DarkModeDefaultColor = Color.white
private let DefaultBoardSize = 13

final class SettingEnvironment: ObservableObject {
    static let shared: SettingEnvironment = .init()
    
    @Published var darkModeColor: Color
    @Published var lightModeColor: Color
    @Published var boardSize: Int
    
    private var cancellables: [AnyCancellable] = []
    
    init() {
        // Register defaults
        UserDefaults.standard.register(defaults: [KeyBoardSize : DefaultBoardSize])

        // Restore
        lightModeColor = UserDefaults.standard.data(forKey: KeyLightModeColor).flatMap{ color in
            guard let color = color as? Color else { return self
            Color.init(color)} ?? LightModeDefaultColor
        darkModeColor = UserDefaults.standard.data(forKey: KeyDarkModeColor).flatMap(Color.init) ?? DarkModeDefaultColor
        boardSize = UserDefaults.standard.integer(forKey: KeyBoardSize)
        
        // Subscribe changes
        $lightModeColor
            .dropFirst()
            .sink {
                UserDefaults.standard.set($0.rawValue, forKey: KeyLightModeColor)
            }
            .store(in: &cancellables)
        $darkModeColor
            .dropFirst()
            .sink {
                UserDefaults.standard.set($0.rawValue, forKey: KeyDarkModeColor)
            }
            .store(in: &cancellables)
        $boardSize
            .dropFirst()
            .sink {
                UserDefaults.standard.set($0, forKey: KeyBoardSize)
            }
            .store(in: &cancellables)
    }
    
    func resetToDefault() {
        lightModeColor = LightModeDefaultColor
        darkModeColor = DarkModeDefaultColor
    }
}


