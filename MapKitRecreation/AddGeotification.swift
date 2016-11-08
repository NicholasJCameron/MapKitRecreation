//
//  AddGeotification.swift
//  MapKitRecreation
//
//  Created by Nicholas Cameron on 2016-10-27.
//  Copyright © 2016 IBM. All rights reserved.
//

import UIKit
import MapKit


protocol AddGeotificationDelegate {
    
    func addGeotificationViewController(controller: AddGeotification, didAddCoordinate coordinate: CLLocationCoordinate2D,
                                        businessName: String, businessDescription: String,pinColor: String)
}

let latDelta:CLLocationDegrees = 5.05

let lonDelta:CLLocationDegrees = 5.05
let location = CLLocationCoordinate2DMake(46.43, -63.44)

class AddGeotification: UITableViewController,UIPickerViewDataSource,UIPickerViewDelegate {
  
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    //This is description
    var businessType = String();
    //This is name.
    @IBOutlet weak var raduisTextField: UITextField!
    @IBOutlet weak var mapKit: MKMapView!
    @IBOutlet weak var typePicker: UIPickerView!
    
    //PICKERVIEW DATA
    let pickerData = ["Coffee Shop","Resturant","Gift Shop","Golf","Food","Entertainment","Shop","Fun","Exercise","Gym", "Trail"]
    let ColorValues = ["brown","purple","orange","green","yellow","black","red","white","yellow","yellow","green"]
    var pinColorValue = String();
    //ICON IMAGE
    
    @IBOutlet weak var iconImage: UIImageView!
    //ADDGEOTIFICATIONDELEGATE
    var delegate: AddGeotificationDelegate?

    
   
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //zoom in on an initial location
        let span = MKCoordinateSpanMake(latDelta, lonDelta)
        let region = MKCoordinateRegionMake(location, span)
        mapKit.setRegion(region, animated: false)
        
        
        //pickerview
//self.typePicker.dataSource = self;
       // self.typePicker.delegate = self;
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    ///PICKER VIEW PROTOCOLS.
    
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        businessType = pickerData[row]
        pinColorValue = ColorValues[row]
        return pickerData[row]
    }
    
    
    //END OF PICKER VIEW
    
    
    
    

    @IBAction func AddLocation(_ sender: AnyObject) {
  
        let coordinate = mapKit.centerCoordinate
        let businessName = raduisTextField.text!
        let businessDescription = businessType
        let pinColor = pinColorValue
        delegate?.addGeotificationViewController(controller: self, didAddCoordinate: coordinate, businessName: businessName, businessDescription: businessDescription,pinColor:pinColor)

    }
    
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func didChange(_ sender: UITextField) {
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
