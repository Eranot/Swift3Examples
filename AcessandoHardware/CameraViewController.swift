//
//  ViewController.swift
//  AcessandoHardware
//
//  Created by Unochapeco unochapeco on 03/11/16.
//  Copyright © 2016 Unochapeco unochapeco. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let id = UIDevice.current.identifierForVendor!.uuidString
        print(id)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func UsarCamera(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.camera) {
                
            let imagePicker = UIImagePickerController()
                
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            imagePicker.allowsEditing = false
                
            self.present(imagePicker, animated: true,
                                           completion: nil)
            //newMedia = true
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        print("Só testanto mesmo")
        
        self.dismiss(animated: true, completion: nil)
        
        print("does this shit even makes sense?")
        if let image:UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            imageView.image = image
        }
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

