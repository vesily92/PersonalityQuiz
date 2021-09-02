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
        navigationItem.setHidesBackButton(true, animated: false)
        showResult()

    }

    private func getResult() -> Animal? {
        answers.reduce(into: [:]) { counts, number in
                counts[number.animal, default: 0] += 1 }
               .sorted { $0.1 > $1.1 }
               .first?.key
    }
        
    private func showResult() {
        guard let animal = getResult() else { return }
        
        titleLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}
