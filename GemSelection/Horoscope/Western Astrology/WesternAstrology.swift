//
//  WesternAstrology.swift
//  GemSelection
//
//  Created by Lakshay Chhabra on 09/07/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class WesternAstrology: UITableViewController {

    
    let array = ["Western Horoscope","Western Chart", "Daily Tropical Transit", "Weekly Tropical Transit", "Monthly Tropical Transit","Solar Return", "Solar Return Planet", "Solar Return House","Solar Return Planet Aspects", "Lunar Metrics", "Romantic Personality Report", "Life Forcast Report", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "WesternAstrology", bundle: nil)
        let output = storyboard.instantiateViewController(withIdentifier: "Output") as! WesternAstrologyOutput
        
        output.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(output, animated: true)
        
        
        
    }
    
    
   


}
