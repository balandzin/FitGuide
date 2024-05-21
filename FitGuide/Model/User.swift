//
//  User.swift
//  FitGuide
//
//  Created by Антон Баландин on 17.05.24.
//

import Foundation

class User {
    var login: String = ""
    var password: String = ""
    
    
    func getBodyMassIndex(height: String?, weight: String?) -> (Double, String) {
        var conclusion = ""
        let height = Double(height ?? "1") ?? 1
        let weight = Double(weight ?? "0") ?? 0
        
        
        let bodyMassIndex = weight / (height * height / 10000)
        let roundedIndex = round(bodyMassIndex * 10)/10
        
        switch bodyMassIndex {
        case ..<16: conclusion = "Выраженный дефицит массы тела"
        case 16..<18.5: conclusion = "Недостаточная масса тела (дефицит)"
        case 18.5..<25: conclusion = "Норма"
        case 25..<30: conclusion = "Избыточная масса тела (состояние, предшествующее ожирению)"
        case 30..<35: conclusion = "Ожирение 1-й степени"
        case 35..<40: conclusion = "Ожирение 2-й степени"
        default:
            conclusion = "Ожирение 3-й степени"
        }
        
        return (roundedIndex, conclusion)
    }
}
