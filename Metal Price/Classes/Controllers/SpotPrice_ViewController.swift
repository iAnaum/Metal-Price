//
//  SpotPrice_ViewController.swift
//  Metal Price
//
//  Created by Anaum Hamid on 9/9/18.
//  Copyright © 2018 Anaum Hamid. All rights reserved.
//

import UIKit

class SpotPrice_ViewController: UIViewController {
    
    //UI Variables
    @IBOutlet weak var tableView: UITableView!
    //Class Variable
    var properties = [Property]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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

//extension SpotPrice_ViewController: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "cell"))!
//        
//       // cell.textLabel?.text = self.properties[indexPath.row]
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return properties.count
//    }
//    
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 40
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    }
//    
//}
//
