//
//  ExercisesData.swift
//  FitGuide
//
//  Created by Антон Баландин on 8.05.24.
//

import Foundation

struct ExercisesData: Codable {
    let backFirstExercise: [String]
    let backSecondExercise: [String]
    let tricepsFirstExercise: [String]
    let tricepsSecondExercise: [String]
    let breastFirstExercise: [String]
    let breastSecondExercise: [String]
    let bicepsFirstExercise: [String]
    let bicepsSecondExercise: [String]
    let legsFirstExercise: [String]
    let legsSecondExercise: [String]
    let shouldersFirstExercise: [String]
    let shouldersSecondExercise: [String]
    let cardio: [String]
    let hitch: [String]
}
