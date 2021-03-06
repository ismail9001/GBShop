//
//  ProfileScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

protocol ProfileScreenInteractorProtocol: AnyObject {
    func updateUser(updatedUser: UserData, completion: @escaping (UserData) -> Void)
}

class ProfileScreenInteractor: ProfileScreenInteractorProtocol {

    weak var presenter: ProfileScreenPresenterProtocol?
    let requestFactory = RequestFactory()

    required init(presenter: ProfileScreenPresenterProtocol) {
        self.presenter = presenter
    }
    
    func updateUser(updatedUser: UserData, completion: @escaping (UserData) -> Void) {
        let updateUser = requestFactory.makeUserUpdateRequestFactory()

        updateUser.updateUser(userId: 123,
                              username: updatedUser.username,
                              password: updatedUser.password,
                              email: updatedUser.email,
                              gender: updatedUser.gender,
                              creditCard: updatedUser.creditCard,
                              bio: updatedUser.bio) { response in
            switch response.result {
            case .success:
                completion(updatedUser)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
}
