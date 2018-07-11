//
//  MatchMaking.swift
//  GemSelection
//
//  Created by Lakshay Chhabra on 09/07/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class MatchMaking: UITableViewController {

    
    let array = ["Match Birth Details", "Match Ashtakoot Details", "Match Vedha (Obstructions)", "MAtch Astro Details", "Match Planet Details", "Match Manglik Report", "Match Making report", "Match Simple Report", "Match Making Detailed Report", "Match Dashakoot Points", "Match Percentage", "Parter Report"]
    
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
        
        let storyboard = UIStoryboard(name: "MatchMaking", bundle: nil)
        let output = storyboard.instantiateViewController(withIdentifier: "Output") as! MatchMakingOutput
        
          output.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(output, animated: true)
        
        
        
    }
    
    
  


}
