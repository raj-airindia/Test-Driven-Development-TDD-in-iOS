//
//  QuizAppUnitTest.swift
//  QuizAppUnitTest
//
//  Created by Raj Mahajan on 29/08/24.
//

import XCTest
@testable import QuizApp

class when_loading_a_quiz: XCTestCase {

    func test_should_make_sure_quiz_total_points_are_calculated_correctly() {
        
        let quizesDTOs = QuizData.loadQuizDTOs()
        let quizes = quizesDTOs.map(Quiz.init)
        
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
        
        XCTAssertEqual(3, mathQuiz.questions.count)
        XCTAssertEqual(30, mathQuiz.totalPoints)
    }

}


class when_calculate_student_grade: XCTestCase {
    
    lazy var gradeASubmission: QuizSubmission = {
        var userSunmission = QuizSubmission(quizId: 1)
        userSunmission.addChoice(questionId: 1, choiceId: 2)
        userSunmission.addChoice(questionId: 2, choiceId: 3)
        userSunmission.addChoice(questionId: 3, choiceId: 4)
        return userSunmission
    }()
    
    lazy var gradeBSubmission: QuizSubmission = {
        var userSunmission = QuizSubmission(quizId: 1)
        userSunmission.addChoice(questionId: 1, choiceId: 1)
        userSunmission.addChoice(questionId: 2, choiceId: 3)
        userSunmission.addChoice(questionId: 3, choiceId: 4)
        return userSunmission
    }()
    
    lazy var gradeFSubmission: QuizSubmission = {
        var userSunmission = QuizSubmission(quizId: 1)
        userSunmission.addChoice(questionId: 1, choiceId: 4)
        userSunmission.addChoice(questionId: 2, choiceId: 2)
        userSunmission.addChoice(questionId: 3, choiceId: 1)
        return userSunmission
    }()
    
    
    func test_calculate_grade_successfully_based_on_student_score() {
        
        let quizesDTOs = QuizData.loadQuizDTOs()
        let quizes = quizesDTOs.map(Quiz.init)
        
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
        
        XCTAssertEqual("A", mathQuiz.calculateLetterGrade(score: 90))
        XCTAssertEqual("B", mathQuiz.calculateLetterGrade(score: 72))
        XCTAssertEqual("F", mathQuiz.calculateLetterGrade(score: 42))
    }
    
    func test_calculate_grade_based_on_student_submission() {
        
        let quizesDTOs = QuizData.loadQuizDTOs()
        let quizes = quizesDTOs.map(Quiz.init)
        
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
        
        XCTAssertEqual("A", mathQuiz.grade(submission: gradeASubmission).letter)
        XCTAssertEqual("B", mathQuiz.grade(submission: gradeBSubmission).letter)
        XCTAssertEqual("F", mathQuiz.grade(submission: gradeFSubmission).letter)
    }
}
