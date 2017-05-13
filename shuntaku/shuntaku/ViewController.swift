//
//  ViewController.swift
//  shuntaku
//
//  Created by Takuya Kudo on 2017/05/13.
//  Copyright © 2017年 Takuya Kudo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    var lat = 0.0
    var lon = 0.0
    var Json: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        // Do any additional setup after loading the view, typically from a nib.
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
        
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.notDetermined) {
            if (self.locationManager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization))) {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.latlon), userInfo: nil, repeats: true)
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func latlon(){
        
        print(lat)
        print(lon)
        
//        let postString = "lat=\(lat)"
//        
//        var request = URLRequest(url: URL(string: "http://localhost/Experiments/Swift_MySQL/submit.php")!)
//        request.httpMethod = "POST"
//        request.httpBody = postString.data(using: .utf8)
//        
//        let task = URLSession.shared.dataTask(with: request, completionHandler: {
//            (data, response, error) in
//            
//            if error != nil {
//                print(error ?? <#default value#>)
//                return
//            }
//            
//            print("response: \(response!)")
//            
//            let phpOutput = String(data: data!, encoding: .utf8)!
//            print("php output: \(phpOutput)")
//        })
//        task.resume()
//
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.stopUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func setupLocationManager() {
        locationManager = CLLocationManager()
        guard let locationManager = locationManager else { return }
        locationManager.requestWhenInUseAuthorization()
        
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.distanceFilter = 10
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            lat = location.coordinate.latitude
            lon = location.coordinate.longitude
            print("緯度:\(location.coordinate.latitude) 経度:\(location.coordinate.longitude) 取得時刻:\(location.timestamp.description)")
        }    }
    

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            break
        }
    }
    
    @IBAction func getJson(_ sender: Any) {
        
        print(lat)
        print(lon)
        
        
        let urlStr = "https://version1.xyz/test.json"
        
        if let url = URL(string: urlStr) {
            let req = NSMutableURLRequest(url: url)
            req.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: req as URLRequest, completionHandler: { (data, resp, err) in
                print(resp!.url!)
                print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as Any)
                
                // 受け取ったdataをJSONパース、エラーならcatchへジャンプ
                do {
                    // dataをJSONパースし、グローバル変数"getJson"に格納
                    self.Json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    // "getJson"が空でなければprintし、"userName"と"userAge"を抽出しprint
                    if (self.Json != [:]) {
                        print (self.Json)
                    }
                } catch {
                    print ("json error")
                    return
                }
            })
            task.resume()
            
            
            
            
        }
        
    }

}


