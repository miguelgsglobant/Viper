//
//  PersonDetailRouter.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation
import UIKit

protocol PersonDetailRouting: AnyObject {
    func showPersonDetail(fromViewController: UIViewController, personId: String)
}

class PersonDetailRouter: PersonDetailRouting {
    func showPersonDetail(fromViewController: UIViewController, personId: String) {
        let interactor = PersonDetailInteractor()
        let presenter = PersonDetailPresenter(personId: personId, interactor: interactor)
        let viewController = PersonDetailViewController(presenter: presenter)
        presenter.ui = viewController
        fromViewController.present(viewController, animated: true)
    }
    
    
}
