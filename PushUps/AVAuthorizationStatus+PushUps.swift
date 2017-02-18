//
//  AVAuthorizationStatus+PushUps.swift
//  PushUps
//
//  Created by Andrew Walker on 19/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import AVFoundation

internal extension AVAuthorizationStatus {
    
    // MARK: - Internal Functions
    
    /**
     
     */
    internal func message() -> String? {
        switch self {
        case .denied:
            return "Please adjust your device privacy settings to allow PushUps to use the camera."
        case .restricted:
            return "Your current device permissions do not allow PushUps to use the camera."
        default:
            return nil
        }
    }
    
}
