//
//  File.swift
//  
//
//  Created by Arjun Santhosh on 16/01/25.
//

import UIKit

// Public custom view class
public class CustomPlayerView: UIView {
    
    // Initializer for the custom view
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    // Required initializer for using the view in Interface Builder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    // Setup the view's appearance
    private func setupView() {
        // Set background color for visibility
        self.backgroundColor = .yellow
        
        // Example of adding a label to the view
        let label = UILabel()
        label.text = "DGPlayer View"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        // Add constraints to center the label in the view
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
