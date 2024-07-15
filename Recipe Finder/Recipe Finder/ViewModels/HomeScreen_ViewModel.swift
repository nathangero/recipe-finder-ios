//
//  HomeScreen_ViewModel.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import Foundation

extension HomeScreen {
    @Observable
    final class ViewModel {
        
        var desserts = [String: Any]()
        
        func fetchDesserts() async throws {
            print("@fetchDesserts")
        }
    }
}
