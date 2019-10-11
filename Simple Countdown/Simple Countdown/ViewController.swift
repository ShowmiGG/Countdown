//
//  ViewController.swift
//  Simple Countdown
//
//  Created by Shumeng Guo on 21/12/2017.
//  Copyright © 2017 Shumeng Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var optionButtons: [UIButton]!
    
    @IBAction func menuButton(_ sender: UIButton) {
        optionButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func newEventButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "newEventSegue", sender: self)
    }
    
    @IBAction func exitButton(_ sender: UIButton) {
        
    }
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var number:[String] = ["1", "2", "3", "4", "5", "6", "7"]
    var eventName:[String] = ["Birthday", "Halloween", "Christmas", "New Year", "Chinese New Year", "Easter", "Moon Festival"]
    
    var images:[UIImage] = [
        UIImage(named: "image_1")!,
        UIImage(named: "image_2")!,
        UIImage(named: "image_3")!,
        UIImage(named: "image_4")!,
        UIImage(named: "image_5")!,
        UIImage(named: "image_6")!,
        UIImage(named: "image_7")!
    ]
    
    var parallaxOffsetSpeed: CGFloat = 50
    var cellHeight: CGFloat = 250
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var parallaxImageHeight: CGFloat {
        let maxOffset = sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * self.tableView.frame.height - cellHeight) / 2
        return maxOffset + self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as? imageCell {
            cell.configureCell(number: number[indexPath.row], eventName: eventName[indexPath.row], image: images[indexPath.row])
            
            cell.parallaxHeightConstaint.constant = self.parallaxImageHeight
            cell.parallaxTopConstaint.constant = parallaxOffset(newOffSetY: tableView.contentOffset.y, cell: cell)
            
            return cell
        }
        else{
            return imageCell()
        }
    }
    
    func parallaxOffset(newOffSetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffSetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [imageCell] {
            cell.parallaxTopConstaint.constant = parallaxOffset(newOffSetY: tableView.contentOffset.y, cell: cell)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        
        let delete = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "DELETE"){(UITableViewRowAction,NSIndexPath) -> Void in
            
            self.eventName.remove(at : indexPath.row)
            tableView.reloadData()
        }
        let edit = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "EDIT"){(UITableViewRowAction,NSIndexPath) -> Void in
            
            self.performSegue(withIdentifier: "newEventSegue", sender: self)
        }
        
        edit.backgroundColor = UIColor.orange
        return [delete,edit]
    }

}
















































