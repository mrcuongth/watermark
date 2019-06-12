//
//  ViewController.swift
//  PhotoSyamp2
//
//  Created by PC on 6/8/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit
//import iOSPhotoEditor

class ViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate ,PhotoEditorDelegate{
    func doneEditing(image: UIImage) {
//        let str = self.storyboard?.instantiateViewController(withIdentifier: "imgViewController") as! imgViewController
//        str.img2 = image
//        self.navigationController?.pushViewController(str, animated: true)
        let stt = self.storyboard?.instantiateViewController(withIdentifier: "imgViewController") as! imgViewController
        stt.img2 = image
        stt.img3 = img1
        hidenavbar()
        self.navigationController?.pushViewController(stt, animated: true)
        
        
        
    }
    
    var aa = 101
    var cancel = 10
    var backk = 111
    var viewdid = 222
    var img1 = UIImage()
    func hidenavbar()  {
        self.navigationController?.isNavigationBarHidden = false
    }
    func hidenavbartrue()  {
        self.navigationController?.isNavigationBarHidden = true
    }
    func canceledEditing() {
        cancel = 102
       
        print("cancel")
      //  cancle()
        
    }
    
    
    func cancle()  {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        
        present(picker, animated: false, completion: nil)
            
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       hidenavbartrue()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if aa == 11 {
            hidenavbartrue()
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
            aa = 101
        }else if backk == 110 {
            hidenavbartrue()
            let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
            photoEditor.photoEditorDelegate = self
            photoEditor.image = img1
            present(photoEditor, animated: false, completion: nil)
            
            backk = 111
        }else if viewdid == 222{
            hidenavbartrue()
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
            viewdid = 221
        }else if cancel == 102{
            print("yes")
            hidenavbartrue()
            cancle()
            cancel = 10
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if cancel == 102{
            print("yes")
            hidenavbartrue()
            cancle()
            cancel = 10
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            // picker.dismiss(animated: true, completion: nil)
            
            return
        }
        //        let str = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //            str.img2 = image
        //        self.navigationController?.pushViewController(str, animated: true)
        
       
        let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
        photoEditor.photoEditorDelegate = self
        photoEditor.image = image
        img1 = image
        
        
        
        //To hide controls - array of enum control
        //photoEditor.hiddenControls = [.crop, .draw, .share]
        
        //present(photoEditor, animated: false, completion: nil)
        
        
        
        //         picker.dismiss(animated: true, completion: nil)
        
        picker.dismiss(animated: false) {
            self.navigationController?.present(photoEditor, animated: false, completion: nil)
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

