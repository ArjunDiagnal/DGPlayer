//
//  DGPlayerView.swift
//  DGPlayer
//
//  Created by Arjun Santhosh on 16/01/25.
//

import UIKit
import AVFoundation

public class DGPlayerView: UIView {

    // Buttons for play, seek forward, and seek backward
    private let playButton = UIButton(type: .system)
    private let seekForwardButton = UIButton(type: .system)
    private let seekBackwardButton = UIButton(type: .system)

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        // Set background color for the view
        self.backgroundColor = .darkGray

        // Configure Play button
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.white, for: .normal)
        playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

        // Configure Seek Forward button
        seekForwardButton.setTitle(">>", for: .normal)
        seekForwardButton.setTitleColor(.white, for: .normal)
        seekForwardButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

        // Configure Seek Backward button
        seekBackwardButton.setTitle("<<", for: .normal)
        seekBackwardButton.setTitleColor(.white, for: .normal)
        seekBackwardButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

        // Add buttons as subviews
        addSubview(playButton)
        addSubview(seekForwardButton)
        addSubview(seekBackwardButton)

        // Set up Auto Layout constraints
        setupConstraints()
    }

    private func setupConstraints() {
        // Enable Auto Layout
        playButton.translatesAutoresizingMaskIntoConstraints = false
        seekForwardButton.translatesAutoresizingMaskIntoConstraints = false
        seekBackwardButton.translatesAutoresizingMaskIntoConstraints = false

        // Constraints for Play button
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            playButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])

        // Constraints for Seek Forward button
        NSLayoutConstraint.activate([
            seekForwardButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 30),
            seekForwardButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor)
        ])

        // Constraints for Seek Backward button
        NSLayoutConstraint.activate([
            seekBackwardButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -30),
            seekBackwardButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor)
        ])
    }
    
    public func printTextMessage() {
        print("This is a test message")
    }
}

