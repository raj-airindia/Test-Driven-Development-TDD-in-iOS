//
//  MockNetworkService.swift
//  QuizAppUserInterfaceTest
//
//  Created by Raj Mahajan on 29/08/24.
//

import Foundation
//@testable import QuizApp

class MockNetworkService: NetworkService {
    
    func getAllQuizes(url: URL, completion: @escaping (Result<[QuizDTO], NetworkError>) -> Void) {
        let quizesDTO = QuizData.loadQuizDTOs()
        completion(.success(quizesDTO))
    }
    
    func getQuizById(url: URL, completion: @escaping (Result<QuizDTO, NetworkError>) -> Void) {
        let quizesDTO = QuizData.loadQuizDTOs()
        let quizDTO = quizesDTO.first {$0.quizId == 1}!
        
        completion(.success(quizDTO))
    }
}
