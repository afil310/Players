//
//  PickerToolbar.swift
//  Players
//
//  Created by Andrey Filonov on 08/04/2019.
//  Copyright © 2019 Andrey Filonov. All rights reserved.
//

import UIKit

class PickerToolbar: UIToolbar {
    // MARK: - Properties
    weak var toolbarDelegate: PickerToolbarDelegate?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(_ textField: UITextField) {
        self.init(frame: CGRect())
        sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneChoosingParameter))
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        fixedSpace.width = 16.0
        let flexibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        setItems([fixedSpace, doneButton, flexibleSpace], animated: false)
        isUserInteractionEnabled = true
        textField.inputAccessoryView = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    @objc func doneChoosingParameter() {
        toolbarDelegate?.doneChoosingParameter()
    }
}

// MARK: -
protocol PickerToolbarDelegate: AnyObject {
    func doneChoosingParameter()
}
