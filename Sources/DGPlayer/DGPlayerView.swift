//
//  File.swift
//  
//
//  Created by Arjun Santhosh on 16/01/25.
//

import UIKit
import AVFoundation

// Define the protocol
public protocol DGPlayerViewDelegate: AnyObject {
    func playbackReadyToStart()
    func playbackStarted()
    func playbackPaused()
    func playbackStopped()
}

public class DGPlayerView: UIView {
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    
    // Delegate property
    public weak var delegate: DGPlayerViewDelegate?

    private var playbackUrl: String

    // Public initializer that accepts a frame and a string message
    public init(frame: CGRect, url: String) {
        self.playbackUrl = url  // Set the custom message
        super.init(frame: frame)
        self.setupView()
    }
    
    // Required initializer for using the view in Interface Builder
    required init?(coder: NSCoder) {
        self.playbackUrl = ""  // Default message
        super.init(coder: coder)
        self.setupView()
    }
    
    
    // Setup the view with AVPlayer and AVPlayerLayer
    private func setupView() {
        // Set background color for the player view
        self.backgroundColor = .black
        
        // URL for the M3U8 stream (you can replace this with your own URL)
        if let url = URL(string: playbackUrl) {
            let playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
            playerLayer = AVPlayerLayer(player: player)
            
            // Configure the player layer's frame to match the view's bounds
            playerLayer?.frame = self.bounds
            playerLayer?.videoGravity = .resizeAspectFill
            if let playerLayer = playerLayer {
                self.layer.addSublayer(playerLayer)
            }
            
            // Add observers to detect when the player is ready to start and when the rate changes
            player?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
            player?.addObserver(self, forKeyPath: "rate", options: .new, context: nil)
            
            // Start playing the video
            player?.play()
        } else {
            print("Invalid URL for M3U8 stream.")
        }
    }
    
    // Observer method to track the status of the player
    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status" {
            if let player = object as? AVPlayer, player.status == .readyToPlay {
                // Notify the delegate when the player is ready to start
                delegate?.playbackReadyToStart()
            }
        }
        
        if keyPath == "rate" {
            if let player = object as? AVPlayer {
                if player.rate == 0 {
                    // Player is paused or stopped
                    delegate?.playbackPaused()
                } else if player.rate > 0 {
                    // Player is playing
                    delegate?.playbackStarted()
                }
            }
        }
    }
    
    // Optional method to stop the video when the view is deallocated
    deinit {
        player?.pause()
        player?.removeObserver(self, forKeyPath: "status")
        player?.removeObserver(self, forKeyPath: "rate")
    }}

