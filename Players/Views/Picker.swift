//
//  Picker.swift
//  Players
//
//  Created by Andrey Filonov on 08/04/2019.
//  Copyright © 2019 Andrey Filonov. All rights reserved.
//

import UIKit

class Picker: UIPickerView {
    // MARK: - Properties
    weak var pickerDelegate: PickerDelegate?
    static let componentValues = ["Number", "First Name", "Last name", "Position", "Date of birth", "Country", "Years in league", "College"]
    var sortBy = Picker.componentValues[0]

    // MARK: - Initializers
    init(view: UIView, sortBy: String) {
        super.init(frame: CGRect())
        
        delegate = self
        if let currentValueIndex = Picker.componentValues.firstIndex(of: sortBy) {
            selectRow(currentValueIndex, inComponent: 0, animated: true)
            self.sortBy = sortBy
        }
        let dummyTextField = UITextField(frame: CGRect.zero)
        view.addSubview(dummyTextField)
        let toolbar = PickerToolbar(dummyTextField)
        toolbar.toolbarDelegate = self
        dummyTextField.inputView = self //a simple way to present UIPickerView at the bottom of the screen like a keyboard is to attach a picker as the inputView for a dummy 0-sized UITextField
        dummyTextField.becomeFirstResponder()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: -
extension Picker: UIPickerViewDelegate, UIPickerViewDataSource, PickerToolbarDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Picker.componentValues.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Picker.componentValues[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sortBy = Picker.componentValues[row]
    }
    
    
    func doneChoosingParameter() {
        pickerDelegate?.doneChoosingParameter(selectedParameter: sortBy)
    }
}

// MARK: -
protocol PickerDelegate: AnyObject {
    func doneChoosingParameter(selectedParameter: String)
}
