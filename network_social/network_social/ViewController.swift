//
//  ViewController.swift
//  network_social
//
//  Created by Leonardo Hernandez Sanchez on 05/01/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        animacion()
    }

    
    func animacion()
    {
        let JsonName = "8575-network"
        let animation = Animation.named(JsonName)
        let animationView = AnimationView(animation: animation)
        animationView.frame = CGRect(x: 0, y: 0, width: 340, height: 320)
        view.addSubview(animationView)
        animationView.contentMode = .scaleToFill
        animationView.loopMode = .loop
        animationView.center = self.view.center
        animationView.play()
    }
}

