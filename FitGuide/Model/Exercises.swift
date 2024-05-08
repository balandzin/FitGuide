//
//  Exercises.swift
//  FitGuide
//
//  Created by Антон Баландин on 8.05.24.
//

import Foundation

struct Exercises {
    
    let day: String
    let exercises1: String
    let exercises2: String
    let exercises3: String
    let exercises4: String
    let exercises5: String
    let exercises6: String
    
    
    static func getProgram() -> [Exercises]{
        let exercisesData = Bundle.main.decode(ExercisesData.self, from: "data.json")
        
        var exercises: [Exercises] = []
        
        let day1 = Exercises(
            day: "Day 1",
            exercises1: exercisesData.cardio.randomElement() ?? "",
            exercises2: exercisesData.backFirstExercise.randomElement() ?? "",
            exercises3: exercisesData.backSecondExercise.randomElement() ?? "",
            exercises4: exercisesData.tricepsFirstExercise.randomElement() ?? "",
            exercises5: exercisesData.tricepsSecondExercise.randomElement() ?? "",
            exercises6: exercisesData.hitch.randomElement() ?? ""
        )
        
        let day2 = Exercises(
            day: "Day 2",
            exercises1: exercisesData.cardio.randomElement() ?? "",
            exercises2: exercisesData.breastFirstExercise.randomElement() ?? "",
            exercises3: exercisesData.breastSecondExercise.randomElement() ?? "",
            exercises4: exercisesData.bicepsFirstExercise.randomElement() ?? "",
            exercises5: exercisesData.bicepsSecondExercise.randomElement() ?? "",
            exercises6: exercisesData.hitch.randomElement() ?? ""
            
        )
        
        let day3 = Exercises(
            day: "Day 3",
            exercises1: exercisesData.cardio.randomElement() ?? "",
            exercises2: exercisesData.legsFirstExercise.randomElement() ?? "",
            exercises3: exercisesData.legsSecondExercise.randomElement() ?? "",
            exercises4: exercisesData.shouldersFirstExercise.randomElement() ?? "",
            exercises5: exercisesData.shouldersSecondExercise.randomElement() ?? "",
            exercises6: exercisesData.hitch.randomElement() ?? ""
            
        )
        
        exercises.append(day1)
        exercises.append(day2)
        exercises.append(day3)
        
        return exercises
    }
    
}
