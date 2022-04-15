//
//  UserSettingsForSavingScore.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 30.03.2022.
//

import Foundation


class UserSettingsForSavingScore {
    
    enum UserSettingsForSavingScoreKeys: String {
        case usersModel
    }
    
    var usersModel: UsersModel? {
        
        get{
            guard let savedData = UserDefaults.standard.object(forKey: UserSettingsForSavingScoreKeys.usersModel.rawValue) as? Data, let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UsersModel else { return nil }
            return decodedModel
        }
        
        set{
            let defaults = UserDefaults.standard
            let key = UserSettingsForSavingScoreKeys.usersModel.rawValue
            if let usersModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: usersModel, requiringSecureCoding: false ){
                    defaults.set(savedData, forKey: key)
                }
            }
        }
    }
    
    
}



