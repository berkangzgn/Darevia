//
//  Extensions.swift
//  Darevia
//
//  Created by Berkan Gezgin on 2.02.2024.
//

import Foundation
import UIKit

extension UITextField: UITextFieldDelegate {
    // Add done button
    func addDoneButtonToKeyboard(target: Any?, action: Selector?) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: target, action: action)
        
        toolbar.items = [flexibleSpace, doneButton]
        
        inputAccessoryView = toolbar
    }
    
    // Only numeric character
    func allowOnlyNumericInput() {
        self.delegate = self
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: characterSet)
    }
    
    // TextField character limit
    func limitCharacterCount(_ maxLength: Int) {
         addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
         maxLengthValue = maxLength
     }

     @objc private func textFieldDidChange() {
         guard let text = self.text else { return }
         if text.count > maxLengthValue {
             let index = text.index(text.startIndex, offsetBy: maxLengthValue)
             self.text = String(text.prefix(upTo: index))
         }
     }

     private var maxLengthValue: Int {
         get {
             return objc_getAssociatedObject(self, &AssociatedKeys.maxLength) as? Int ?? Int.max
         }
         set {
             objc_setAssociatedObject(self, &AssociatedKeys.maxLength, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
         }
     }

     private struct AssociatedKeys {
         static var maxLength: Int = Int.max
     }
    
    // Placeholder color
    func setPlaceholderColor(_ color: UIColor) {
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: color]
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
    }
}

extension UIColor {
    static let appColor = UIColor(red: 235/255, green: 68/255, blue: 90/255, alpha: 1)
    static let appBluredColor = UIColor(red: 223/255, green: 126/255, blue: 136/255, alpha: 1)
    static let appWhite = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let appDark = UIColor(red: 34/255, green: 9/255, blue: 13/255, alpha: 1)
}

extension UIView {
    // Corner radius
    func applyCornerRadius() {
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func applyTopCornerRadius() {
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    // Add border
    func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    // Blur effect
    func addBlurEffect(style: UIBlurEffect.Style = .light, alpha: CGFloat = 1.0) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = alpha
        blurEffectView.isUserInteractionEnabled = false // UIVisualEffectView'in etkileşimini devre dışı bırak
        
        addSubview(blurEffectView)
        
        // Eğer blurEffectView'in altında bir UITextField varsa, etkileşim özelliğini etkinleştir
        for subview in subviews {
            if let textField = subview as? UITextField {
                textField.isUserInteractionEnabled = true
            }
        }
    }
    
}
