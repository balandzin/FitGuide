//
//  UserExerciseStorage.swift
//  FitGuide
//
//  Created by Антон Баландин on 16.05.24.
//

import Foundation

final class UserExerciseStorage {
    
    static let shared = UserExerciseStorage()
    
    private let userDefaults = UserDefaults.standard
    
    private func saveUserData(login: String, password: String, exercises: [Exercises]) {
        let data = try? JSONEncoder().encode(exercises)
        userDefaults.set(data, forKey: "\(login)_\(password)")
    }
    
    private func getUserData(login: String, password: String) -> [Exercises]? {
        if let data = userDefaults.data(forKey: "\(login)_\(password)"),
           let exercises = try? JSONDecoder().decode([Exercises].self, from: data) {
            return exercises
        }
        return nil
    }
    
    func addUserData(login: String, password: String, exercises: [Exercises]) {
        saveUserData(login: login, password: password, exercises: exercises)
    }
    
    func updateUserData(login: String, password: String, exercises: [Exercises]) {
        saveUserData(login: login, password: password, exercises: exercises)
    }
    
    func getUserExercises(login: String, password: String) -> [Exercises]? {
        return getUserData(login: login, password: password)
    }
    
    func checkCredentials(login: String, password: String) -> Bool {
        return userDefaults.object(forKey: "\(login)_\(password)") != nil
    }
}
