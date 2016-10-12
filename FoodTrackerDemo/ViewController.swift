//
//  ViewController.swift
//  FoodTrackerDemo
//
//  Created by Christopher Cole on 10/10/16.
//  Copyright © 2016 Christopher Cole. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
        /* sets the ViewController which is 'self' as the Text Field Delegate to handle text field
        inputs and actions */
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard and give up first responder status
        nameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = nameTextField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if user canceled
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary contains multiple representations of the image, and this usess the original
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        photoImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard and give up first responder status
        nameTextField.resignFirstResponder()
        // View controller to let a user pick media from photo library
        let imagePickerController = UIImagePickerController()
        // Only allow images from photo library, not taken with camera
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        // Make sure to add privacy / permissions to Info.plist
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
}

