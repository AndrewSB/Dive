//
//  NewDiveFormViewController.swift
//  Dive
//
//  Created by Andrew Breckenridge on 2/18/16.
//  Copyright © 2016 Andrew Breckenridge. All rights reserved.
//

import UIKit

class NewDiveFormViewController: UIViewController {
    
    var pageIndex: Int?

    @IBOutlet weak var titleLabel: UILabel! {
        didSet { titleLabel.text = title }
    }


}
