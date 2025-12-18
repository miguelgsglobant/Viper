//
//  ListOfPersonView.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation
import UIKit

protocol ListOfPersonRouterProtocol: AnyObject {
    var viewController: ListOfPersonViewController? {get}
    var personDetailRouter: PersonDetailRouting? {get}
    func showListOfPerson(window: UIWindow?)
    func showPersonDetail(personId: String)

}
class ListOfPersonRouter: ListOfPersonRouterProtocol {
    var viewController: ListOfPersonViewController?
    var personDetailRouter: PersonDetailRouting?

    func showListOfPerson(window: UIWindow?) {
        self.personDetailRouter = PersonDetailRouter()
        let interactor = ListOfPersonInteractor()
        let presenter = ListOfPersonPresenter(interactor: interactor, router: self)
        viewController = ListOfPersonViewController(presenter: presenter)
        presenter.ui = viewController
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    func showPersonDetail(personId: String) {
        guard let viewController = viewController else { return }
        personDetailRouter?.showPersonDetail(fromViewController: viewController, personId: personId)
    }
}
