//
//  ViewController.swift
//  Flo
//
//  Created by pegasus on 2018/08/06.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // data model
    private var glasses: Int = 5 {
        didSet {
            // constraint to 0 ~ 8
            guard 0 <= glasses && glasses <= 8 else {
                glasses = oldValue
                return
            }
            // update subviews when valid
            updateViews()
        }
    }
    
    func updateViews() {
        counterView.update(with: glasses)
        counterLabel.text = "\(glasses)"
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    // MARK: - Actions
    
    @IBAction func onButtonPressed(_ sender: PushButton)
    {
        glasses += sender.isAddButton ? 1 : -1
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
}

