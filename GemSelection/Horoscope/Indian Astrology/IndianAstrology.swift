//
//  IndianAstrology.swift
//  GemSelection
//
//  Created by Lakshay Chhabra on 09/07/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class IndianAstrology: UITableViewController {
    
    
    let array = ["General House Report","General Ascendant Report", "General Moon Biorym Report", "General Planet Report", "Moon Horoscope Report", "Kal Sarpa Report", "Basic Astrology Report", "Basic Astrology Details", "Basic Astrology Planets", "Madhya Bhav", "Ayanmsha", "Major Char Dasha", "Sub Char Dasha", "Gemstone Suggestion"]

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
       
      let storyboard = UIStoryboard(name: "IndianAstrology", bundle: nil)
        let output = storyboard.instantiateViewController(withIdentifier: "Output") as! IndianAstrologyOutput
        
        output.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(output, animated: true)
        
    
        
    }


}
