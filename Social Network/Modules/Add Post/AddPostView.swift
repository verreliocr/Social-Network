//
//  AddPostView.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class AddPostView: UIViewController {
    
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var postImageButton: UIButton!
    
    let presenter: IAddPostPresenter
    
    let imagePicker = UIImagePickerController()
    
    init(presenter: IAddPostPresenter) {
        self.presenter = presenter
        super.init(nibName: "AddPostView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupView()
    }
    
    private func setupNavBar() {
        navigationController?.showBarIfNecessary()
        title = "Add Post"
    }
    
    private func setupView() {
        postTextView.delegate = self
        
        addImageButton.addAction { [unowned self] in
            self.handlePhotoProfile()
        }
        
        postImageButton.addAction { [unowned self] in
            self.presenter.didTapAddPostButton()
        }
        
        setupImagePicker()
    }
    
    private func setupImagePicker() {
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .fullScreen
    }
    
    func handlePhotoProfile() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)

        alertController.addAction(UIAlertAction(title: "Choose From Library", style: UIAlertAction.Style.default) { _ in
            self.presentImagePicker()
        })

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            alertController.addAction(UIAlertAction(title: "Capture Photo", style: UIAlertAction.Style.default) { _ in
                self.presentCamera()
            })
        }

        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive) { _ in })
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true

        present(alertController, animated: true, completion: nil)
    }
    
    func presentImagePicker() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func presentCamera() {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }

}

extension AddPostView: IAddPostView {
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AddPostView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        presenter.setText(textView.text)
    }
}

extension AddPostView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            picker.dismiss(animated: true) { [unowned self] in
                self.postImageView.image = image
                self.presenter.setImage(image)
            }
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }
}
