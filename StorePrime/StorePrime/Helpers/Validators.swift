//
//  Validators.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import Foundation

class Validators {
    static func validateName(_ name: String) -> Bool {
        let nameRegex = "^[a-zA-Zа-яА-Я]{1,100}$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        
        return namePredicate.evaluate(with: name)
    }
    
    static func validateDateOfBirth(_ date: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let _ = dateFormatter.date(from: date) {
            return true
        } else {
            return false
        }
    }
    
    static func validateNumber(phone: String) -> Bool {
        let phoneRegex = "^\\d{11}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        
        return phonePredicate.evaluate(with: phone)
    }
    
    static func validateAddress(address: String) -> Bool {
        let addressComponents = address.components(separatedBy: ",")
        
        guard addressComponents.count >= 4 else {
            return false
        }
        
        let country = addressComponents[0].trimmingCharacters(in: .whitespacesAndNewlines)
        guard !country.isEmpty else {
            return false
        }
        
        let city = addressComponents[1].trimmingCharacters(in: .whitespacesAndNewlines)
        guard !city.isEmpty else {
            return false
        }
        
        let street = addressComponents[2].trimmingCharacters(in: .whitespacesAndNewlines)
        guard !street.isEmpty else {
            return false
        }
        
        let house = addressComponents[3].trimmingCharacters(in: .whitespacesAndNewlines)
        guard let houseNumber = Int(house) else {
            return false
        }
        
        if addressComponents.count == 5 {
            let apartment = addressComponents[4].trimmingCharacters(in: .whitespacesAndNewlines)
            if apartment.isEmpty {
                return false
            }
        }
        return true
    }
    
    static func validatePassword(password: String) -> Bool {
        guard password.count >= 8 && password.count <= 64 else {
            return false
        }
        
        let lowercaseLetterRegex = ".*[a-z]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", lowercaseLetterRegex).evaluate(with: password) else {
            return false
        }
        
        let uppercaseLetterRegex = ".*[A-Z]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", uppercaseLetterRegex).evaluate(with: password) else {
            return false
        }
        
        let digitRegex = ".*\\d+.*"
        guard NSPredicate(format: "SELF MATCHES %@", digitRegex).evaluate(with: password) else {
            return false
        }
        
        let specialCharacterRegex = ".*[\\^?!=.*\\[\\]\\\\/@$%#&_-]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex).evaluate(with: password) else {
            return false
        }
        return true
    }
}
