//
//  ViewController.swift
//  HideKeyboardApp
//
//  Created by Justin Williams on 9/30/19.
//  Copyright © 2019 Rock Valley College. All rights reserved.
//


import UIKit
    
class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate  {
        
    //Outlets
        
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var btnBack: UIButton!

    //Actions
        
    @IBAction func btnBack(_ sender: UIButton) {
        //Add Below Code from "Code for Steps.txt". Fulfill Each Comment With Code
        
        //Set ScrollPoint and Go to ZERO location (Top) of ScrollView - animated
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        //set txtFirst as firstresponder
        txtFirst.becomeFirstResponder()
    }
    //  2 Modify btnSave function. Validates UITextfields have content, formats text to place in UITextView txtView, Goes to location of btnBack button.
    @IBAction func btnSave(_ sender: UIButton) {
        //Add Below Code from "Code for Steps.txt". Fulfill Each Comment With Code
            
        //hide keyboard
        DismissKeyboard()
            
        //validation that all fields are entered
        if (txtFirst.text=="" || txtLast.text=="" || txtEmail.text=="")
        {
            //Call MessageBox if any fields are empty
            MsgBox("All fields required, please correct")
        }
        else
        {
            
            //Check if txtView (UITextView) is empty
            if (txtView.text=="")
            {
                //if empty then add text and newline
                txtView.text = "My Contacts \n"
            }
            //format text
            
            //existing contents of txtView, newline, txtFirst, newline,txtLast,newline, txtEmail, newline
                txtView.text = "\(txtView.text!) \n\(txtFirst.text!) \n\(txtLast.text!) \n\(txtEmail.text!)\n"
                //clear textboxes
                txtFirst.text = ""
                txtLast.text = ""
                txtEmail.text = ""
                //load scrollview
                
                //declare CGPoint scrollPoint
                
                var scrollPoint:CGPoint
                
                //X = from Left, Y = from Top
                //get X = 0, Y = location of btnBack Y
                scrollPoint = CGPoint(x:0, y:btnBack.frame.origin.y)
                //Set ScrollPoint and Go to animated
                ScrollView.setContentOffset(scrollPoint, animated: true)
                
            }
        }
        
        // 3) Modify existing viewDidLoad function. Default Function to load when view is shown
        @IBAction func btnView(_ sender: UIButton) {
            //Add Below Code from "Code for Steps.txt". Fulfill Each Comment With Code
            
            //hide keyboard
            DismissKeyboard()
            
            //declare CGPoint scrollPoint
            var scrollPoint:CGPoint
            
            //X = from Left, Y = from Top
            //get X = 0, Y = location of btnBack Y
            scrollPoint = CGPoint(x: 0, y: btnBack.frame.origin.y)
            
            //Set ScrollPoint and Go to animated
            ScrollView.setContentOffset(scrollPoint, animated: true)
        }
        
        
        // 4) Add MessageBox function using AlertView
        func MsgBox(_ message:String)
        {
            //Add Below Code from "Code for Steps.txt". Fulfill Each Comment With Code
            //Create Alert
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = message
            alert.addButton(withTitle: "OK")
            alert.show()
            
        }
        
        // 5) Add touchesBegan function to catch screen tap and resign keyboard
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            //Add Below Code from "Code for Steps.txt". Read Comments
            
            //forces resign first responder and hides keyboard
            txtFirst.endEditing(true)
            txtLast.endEditing(true)
            txtEmail.endEditing(true)
            
            
        }
        
        // 6) Add DismissKeyboard function to resign keyboard on all textboxes
        @objc func DismissKeyboard(){
            //Add Below Code from "Code for Steps.txt". Read Comments
            
            //forces resign first responder and hides keyboard
            txtFirst.endEditing(true)
            txtLast.endEditing(true)
            txtEmail.endEditing(true)
            
            
        }
        
        //  7) Add textFieldShouldReturn function. This is called when 'return' key pressed on any UITextField. return NO to ignore.
        func textFieldShouldReturn(_ textField: UITextField) -> Bool     {
            //Add Below Code from "Code for Steps.txt". Read Comments
            
            textField.resignFirstResponder()
            return true;
        }
        
        //  8) Add textFieldDidBeginEditing function. ScrollPoint when entering UItextfied
        func textFieldDidBeginEditing(_ textField:UITextField){
            //Add Below Code from "Code for Steps.txt". Read Comments
            var scrollPoint:CGPoint
            scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
            ScrollView.setContentOffset(scrollPoint, animated: true)
            
        }
        
        // 9) Add textFieldDidEndEditing function. ScrollPoint when done editing UItextfied
        func textFieldDidEndEditing(_ textField:UITextField){
            //Add Below Code from "Code for Steps.txt". Read Comments
            
            ScrollView.setContentOffset(CGPoint.zero, animated: true)
        }
        
        // 10) Add textViewDidBeginEditing function. ScrollPoint when entering UItextView
        func textViewDidBeginEditing(_ textField:UITextView){
            //Add Below Code from "Code for Steps.txt". Read Comments
            var scrollPoint:CGPoint
            scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
            
            ScrollView.setContentOffset(scrollPoint, animated: true)
            
        }
        
        // 11) Add textViewDidEndEditing function. ScrollPoint when done ending UItextView
        func textViewDidEndEditing(_ textField:UITextView){
            //Add Below Code from "Code for Steps.txt". Read Comments
            ScrollView.setContentOffset(CGPoint.zero, animated: true)
        }
        
        // 12) Modify existing viewDidLoad function. Default Function to load when view is shown
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //Add Below Code. Read Comments
            
            //Looks for single or multiple taps
            let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.DismissKeyboard))
            //Adds tap gesture to ScrollView which will call DismissKeyboard and hide keyboard
            ScrollView.addGestureRecognizer(tap)
            //gets ScreenSize of current device
            let size: CGRect = UIScreen.main.bounds
            //Go to left  = 0 pixels, top = 50 pixels, width or device in pixels, height of device in pixels
            ScrollView.frame = CGRect(x:0, y:50, width:size.width, height:size.height)
            //Set focus on txtFirst
            txtFirst.becomeFirstResponder()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
}

