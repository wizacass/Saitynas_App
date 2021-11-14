//
//  ViewRouter.swift
//  Saitynas_App
//
//  Created by Vytenis Petrauskas on 2021-11-14.
//

import Foundation

enum Page {
     case home
     case liked
     case records
     case user
 }

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home

    
    
}
