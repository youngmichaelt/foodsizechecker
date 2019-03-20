//
//  ViewController.swift
//  draw
//
//  Created by Mac on 3/19/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
//class ViewController: UIViewController
class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet var drawView: DrawView!
    
    @IBOutlet var Photo: UIImageView!
    
    @IBOutlet var Label: UILabel!
    
    @IBAction func loadImage(_ sender: Any) {
        self.Photo.image = UIImage(named: "chickyboi")
    }
    
    @IBAction func takePicture(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        
        drawView?.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    
    @IBAction func reset(_ sender: Any!) {
        drawView.erase()
        self.Label.text = ""
        self.Photo.image = UIImage()
        
        
    }
    
    @IBAction func calculate(_ sender: Any) {
        drawView.area()
        self.Label.text = drawView.ouncesArray[0] + " ounces"
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        Photo.image = info[.originalImage] as? UIImage
    }
    
    
    
    
    
}

