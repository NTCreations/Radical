//
//  profileViewController.swift
//  Radical
//
//  Created by Nyjel Todd on 8/3/17.
//  Copyright © 2017 NTTech. All rights reserved.
//

import UIKit
import FirebaseAuth

class profileViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let pickerController = UIImagePickerController()
    
    @IBAction func logoutTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            
            dismiss(animated: true, completion: nil)
        } catch {
            print("There was a problem logging out")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerController.sourceType = UIImagePickerControllerSourceType.camera
        pickerController.delegate = self
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2;
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 2

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changePicture(_ sender: Any) {
        
        present(pickerController, animated: true, completion: nil)
        
    }
    
    
}

extension profileViewController : UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("The camera has been closed")
    }
    
}

extension profileViewController : UINavigationControllerDelegate {
    
}

