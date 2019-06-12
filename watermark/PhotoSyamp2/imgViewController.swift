//
//  imgViewController.swift
//  PhotoSyamp2
//
//  Created by PC on 6/8/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit
//import iOSPhotoEditor
class imgViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate ,PhotoEditorDelegate {
    var bb = 11
    var back2 = 110
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var img2 = UIImage()
    var img3 = UIImage()
    // var discription = ["img.jpg","img.jpg","img.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = img2
      
        btn_share_radius()
    }
    func btn_share_radius() {
        share.layer.cornerRadius = 5
        share.layer.masksToBounds = true
    }
    
    @IBAction func save(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "", message: "Watermark image is successfully saved.", preferredStyle: UIAlertControllerStyle.alert)
       // alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { UIAlertAction in
            let imageData = UIImagePNGRepresentation(self.imageView.image!)
            let compresedImage = UIImage(data: imageData!)
            UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
            let str = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            str.aa = self.bb
            self.navigationController?.pushViewController(str, animated: false)
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        let str = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        str.backk = back2
        str.img1 = img3
         self.navigationController?.pushViewController(str, animated: true)
        
    }
    @IBAction func share(_ sender: Any) {
        let data1 = UIImagePNGRepresentation(imageView.image!)
        
        let image = UIImage(data: data1!)
        // set up activity view controller
        let imageToShare = [ image! ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook , UIActivityType.postToTwitter , UIActivityType.postToFlickr , UIActivityType.postToTencentWeibo , UIActivityType.postToVimeo , UIActivityType.postToWeibo]
        
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    @IBAction func pickImageButtonTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func doneEditing(image: UIImage) {
        imageView.image = image
    }
    
    func canceledEditing() {
        print("Canceled")
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            // picker.dismiss(animated: true, completion: nil)
            return
        }
        picker.dismiss(animated: false, completion: nil)
        
        
        let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
        photoEditor.photoEditorDelegate = self
        photoEditor.image = image
        //Colors for drawing and Text, If not set default values will be used
        //photoEditor.colors = [.red, .blue, .green]
        
        //Stickers that the user will choose from to add on the image
        
        
        //To hide controls - array of enum control
        //photoEditor.hiddenControls = [.crop, .draw, .share]
        
        present(photoEditor, animated: false, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
