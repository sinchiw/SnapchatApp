//
//  SnapViewController.swift
//  SnapChatClone
//
//  Created by Wilmer sinchi on 7/3/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
class SnapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageField: UITextField!
    //set up the varaible. A view controller that manages the system interfaces for taking pictures, recording movies, and choosing items from the user's media library.
    var imagePicker : UIImagePickerController?
    var imageAdded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        messageField.text = "testing"
        
        
    

        // Do any additional setup after loading the view.
    }
    @IBAction func nextAction(_ sender: Any) {
        var dowloardURL : [String]
//        messageField.text = "testing"
        imageAdded = true
        guard let message = messageField.text else {return}
        if imageAdded && message != ""{
           
            //add the picture to storage under "image"
            let imageFolder = Storage.storage().reference().child("image")
            
            //turn image into data
            guard let image = imageView.image else {return}
//            var newMetaData = StorageMetadata()
//            newMetaData.contentType = "image"
            
            guard let imageData = image.jpegData(compressionQuality: 0.1) else {return}
//            imageFolder.child("\(NSUUID().uuidString).jpg").putData(imageData, metadata: nil) {
            
            //we can use imageFolder.child("image.jpeg") but we want differnt name for all the image
            let imageRef = imageFolder.child("\(NSUUID().uuidString).jpg")
            
            imageRef.putData(imageData, metadata: nil) { (metaData, error) in
                imageRef.downloadURL(completion: { (url, error) in
                    guard let urldownload = url?.absoluteString else {return}
                    self.performSegue(withIdentifier: "showFriends", sender: urldownload)
                    print(urldownload)
                })
//                if let error = error{
//                    print(error.localizedDescription)
//                } else{
//                    var url123 = ""
//                    metaData?.storageReference?.downloadURL{ (url, error) in
//                        guard let url22 = url?.absoluteString else{return}
//                        url123.append(contentsOf: url22)
//                        print(url22)
                
                
                //so it does print metadata
            
                    
//                    print(ur)
//                    let newMetaData = metaData
//                    let downloadURL = metaData?.storageReference?.downloadURL
//                    let url =
//                   metaData?.storageReference?.downloadURL(completion: { (url, error) in
//                        if let error = error {
//                            print(error.localizedDescription)
//                        } else {
//                    //lse {
////                           dowloardURL = url?.absoluteString
////                            self.performSegue(withIdentifier: "showFriends", sender: url?.absoluteString)
////                        }
//                    guard let url1 = url?.absoluteString else {return}
//                            print(url1)
//                            dowloardURL?.append(url1)
////                    self.performSegue(withIdentifier: "showFriends", sender: url?.absoluteString)
////                    print(downloadURL)
////                    let user = Auth.auth().currentUser
////                    let imageDBRef = Database.database().reference().child("images").child(imageID)
//                    let user = Auth.auth().currentUser
//                    Database.database().reference().child("user").child(user!.uid).child("downloadURL").setValue(url1)
//
////                    //
////                    imageDBRef.setValue(["download_url": downloadURL.absoluteString, "owner":  user?.uid])
////
////                    print(url1)
////                        self.prepare(for: FriendsListTableTableViewController, sender: dowloardURL)
//                    }
//                    })
                    
//                    self.performSegue(withIdentifier: "showFriends", sender: dowloardURL)
//                    {
////                        downloadURL
//                        self.performSegue(withIdentifier: "showFriends", sender: dowloardURL)
//                    }
                    
//                    if let donwloadURL = metaData?.storageReference?.downloadURL
                    
                  
//                self.presentAlert(alert: error.localizedDescription)
                
                
//                (completion: { (url, error) in
//                    guard let error = error else {return}
//                    let downLoadURL = url?.absoluteString
print("success")
                
//                }
                
//                metaData?.storageReference?.downloadURL(completion: { (url, error) in
//                    if error != nil{
//                        print(error!.localizedDescription)
//                    }
//                    if url != nil {
//                        guard let downloadURL2 = url?.absoluteString else {return}
//                        print(downloadURL2)
////                        print(String(url!))
//                    }
//                })
//                print("first comma \(dowloardURL)")
//            met
            }
            //            guard let downLoadURL = U
//            print(dowloardURL)
            
            
            //segue to next view controller
        } else {
            let alertVC = UIAlertController(title: "Error", message: "Please add message or image to continue", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                alertVC.dismiss(animated: true, completion:nil)
            }
            alertVC.addAction(alertAction)
            present(alertVC, animated: true, completion: nil)
            
        }
        
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if let downloadURL = sender as? String{
            if let selectVC = segue.destination as? FriendsListTableTableViewController{
                selectVC.download = downloadURL
            }
        }
//         guard let downloadURL = sender as? String else{return}
        
    }
    
    func presentAlert(alert: String) {
        //        let alertController =
        let alertVC = UIAlertController(title: "Error", message: alert, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion:nil)
        }
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
    }

    @IBAction func selectPhoto(_ sender: Any) {
        if imagePicker != nil{
        imagePicker?.sourceType = .photoLibrary
        present(imagePicker!,animated: true, completion: nil)
        }
    }
    @IBAction func cameraAction(_ sender: Any) {
        if imagePicker != nil{
            imagePicker?.sourceType = .camera
            present(imagePicker!,animated: true, completion: nil)
        } else {
            imagePicker?.sourceType = .photoLibrary
            present(imagePicker!,animated: true, completion: nil)
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] else {return}
        imageView.image = image as? UIImage
        imageAdded = true
        dismiss(animated: true, completion: nil)
    }
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: imageView)
            
            //            super.touchesBegan(touches, with: event)
            
            print(position)
            
            
        }

    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
