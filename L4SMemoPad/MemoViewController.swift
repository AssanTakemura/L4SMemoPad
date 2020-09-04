//
//  MemoViewController.swift
//  L4SMemoPad
//
//  Created by 竹村明日香 on 2020/09/04.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveDate: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveDate.object(forKey: "title") as? String
        contentTextView.text = saveDate.object(forKey: "content") as? String
        
        titleTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo(){
        saveDate.set(titleTextField.text, forKey: "title")
        saveDate.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: {
                action in
                print("OKボタンが押されました")
            }
            )
        )
        present(alert, animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true)
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
