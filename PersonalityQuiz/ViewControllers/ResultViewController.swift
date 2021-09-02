//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        showResult()

    }

    private func getResult() -> Animal? {
        answers
            .reduce(into: [:]) { counts, number in
                counts[number.animal, default: 0] += 1 }
            .sorted { $0.1 > $1.1 }
            .first?.key
    }
        
    private func showResult() {
        guard let animal = getResult() else { return }
        
        switch animal {
        case .dog:
            titleLabel.text = "Вы - \(Animal.dog.rawValue)"
            descriptionLabel.text = Animal.dog.definition
        case .cat:
            titleLabel.text = "Вы - \(Animal.cat.rawValue)"
            descriptionLabel.text = Animal.cat.definition
        case .rabbit:
            titleLabel.text = "Вы - \(Animal.rabbit.rawValue)"
            descriptionLabel.text = Animal.rabbit.definition
        case .turtle:
            titleLabel.text = "Вы - \(Animal.turtle.rawValue)"
            descriptionLabel.text = Animal.turtle.definition
        }
    }
}
