//
//  ViewController.swift
//  ShareButton
//
//  Created by Yessen Yermukhanbet on 12/24/20.
//

import UIKit

class ViewController: UIViewController {
    lazy var textToShare: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        text.layer.borderWidth = 0.5
        text.layer.cornerRadius = 5
        text.placeholder = "Type the text you want to share!"
        return text
    }()
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)
        return button
    }()
    @objc func sharePressed(){
        if textToShare.hasText{
            let activityControler = UIActivityViewController(activityItems: [textToShare.text!], applicationActivities: nil)
            activityControler.completionWithItemsHandler = {(activity, success, items, error) in
                if success{
                    self.textToShare.text = ""
                }
            }
            present(activityControler, animated: true, completion: nil)
        }else{
            print("no text!")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.8108344517)
        addSubviews()
        setConstraints()
    }
    private func addSubviews(){
        self.view.addSubview(textToShare)
        self.view.addSubview(shareButton)
        textToShare.delegate = self
    }
    private func setConstraints(){
        textToShare.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textToShare.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        textToShare.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        textToShare.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        shareButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        shareButton.widthAnchor.constraint(equalTo: textToShare.widthAnchor, multiplier: 0.5).isActive = true
        shareButton.topAnchor.constraint(equalTo: textToShare.bottomAnchor, constant: 30).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
