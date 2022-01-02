//
//  Compose.swift
//  Composite
//
//  Created by Артур Дохно on 02.01.2022.
//

import Foundation

protocol Compose {
    var name: String { get set }
    func showContent() -> Any
    func addComponent(component: Compose)
    func contentCount() -> Int
}

class File: Compose {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any {
        return name
    }
    
    func addComponent(component: Compose) {
        print("К файлу не могу добавить папку")
    }
    
    func contentCount() -> Int {
        return 1
    }
    
}

class Folder: Compose {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    private var contentArray = [Compose]()
    
    func showContent() -> Any {
        return contentArray
    }
    
    func addComponent(component: Compose) {
        contentArray.append(component)
    }
    
    func contentCount() -> Int {
        return contentArray.count
    }
    
}
