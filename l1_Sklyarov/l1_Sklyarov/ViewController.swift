//
//  ViewController.swift
//  l1_Sklyarov
//
//  Created by Valeriy Sklyarov on 13.04.2021.
//

import UIKit

class ViewController: UIViewController {
    let referencePassword = ""
    let referenceLogin = ""
    
    
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var loginTextBox: UITextField!
    
    let segueID = "segueID_LoginToPage"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func dataSetUp(){
        DataStorage.shared.users.append(User(username: "Yuso", img: UIImage(named: "friend_anime"),photos: [UIImage(named: "anime_1"), UIImage(named: "anime_2")]))
        DataStorage.shared.users.append( User(username: "Tony", img: UIImage(named: "friend_ironman"), photos: [UIImage(named: "ironman_1"), UIImage(named: "ironman_2")]))
        DataStorage.shared.users.append(User(username: "Leo", img: UIImage(named: "friend_tmnt"),photos: [UIImage(named: "tmnt_1"), UIImage(named: "tmnt_2")]))
        
        DataStorage.shared.groups.append(Group(name: "Avengers", img: UIImage(named: "group_avengers")))
        DataStorage.shared.groups.append(Group(name: "TMNT", img: UIImage(named: "group_tmnt")))
        DataStorage.shared.groups.append(Group(name: "Anime", img: UIImage(named: "group_anime")))
        
        DataStorage.shared.currUser = User(username: "Yuda Skl", img: UIImage(named: "avatar"))
    }
    
    @IBAction func buttonLoginClick(button: UIButton){
        if checkInput(login: loginTextBox.text ?? "" , password: passwordTextBox.text ?? ""){
            dataSetUp()
            performSegue(withIdentifier: segueID, sender: self)
        }
    }
    
    func checkInput(login: String, password: String) -> Bool{
        if login == referenceLogin && password == referencePassword{
            return true
        }
        return false
    }
}

