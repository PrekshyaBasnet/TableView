//
//  ViewController.swift
//  Table Views
//
//  Created by Prekshya Basnet on 3/8/16.
//  Copyright © 2016 Prekshya Basnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    //MARK: Property
    var fruits:[String]=[]
    var alphabetizedFruits=[String:[String]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
       //MARK: INITIALIZATION
        
        fruits=["Apple","Pineapple","Orange", "Blackberry","Banana","Pear","Kiwi","Strawberry","Mango","Walnut","Apricot","Tomato","Almond","Date", "Melon", "Water Melon","Lemon","Coconut","Fig","Passionfruit","Star Fruit", "Clementin", "Citron","Cherry","Cranberry"]
        alphabetizedFruits=alphabetizeArray(fruits)
        print (alphabetizedFruits)

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return alphabetizedFruits.keys.count
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys=alphabetizedFruits.keys
        
        // Sort Keys
        let sortedKeys=keys.sort({(a,b) -> Bool in a.lowercaseString < b.lowercaseString})
        
        //Fetch Fruits
        let key=sortedKeys[section]
        if let fruits=alphabetizedFruits[key]{
                return fruits.count
        }
        return 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("cellIdentifier",forIndexPath: indexPath)
        // Fetch and sort keys
        let keys=alphabetizedFruits.keys.sort({(a,b) -> Bool in a.lowercaseString < b.lowercaseString})
        
        // Fetch  fruits for section
        
        let key=keys[indexPath.section]
        if let fruits=alphabetizedFruits[key]{
            let fruit=fruits[indexPath.row]
            
            //Configure Cell
            cell.textLabel?.text=fruit

        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //Fetch and Sort Keys
        let keys=alphabetizedFruits.keys.sort({(a,b) -> Bool in a.lowercaseString < b.lowercaseString})
        return keys[section]
    }
    //MARK: Helper Methods
    private func alphabetizeArray(array:[String])->[String:[String]]{
        var result=[String:[String]]()
        
        for item in array{
            let index=item.startIndex.advancedBy(1)
            
            let firstLetter=item.substringToIndex(index).uppercaseString
            print(firstLetter)
            if result[firstLetter] != nil {
                result[firstLetter]!.append(item)
            }
            else{
                result[firstLetter]=[item]
            }
        }
        for(key,value) in result{
            result[key]=value.sort({(a,b) -> Bool in a.lowercaseString < b.lowercaseString})
        }
        
        return result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

