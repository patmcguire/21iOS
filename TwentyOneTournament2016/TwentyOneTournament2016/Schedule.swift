//
//  Schedule.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/24/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation

func getRoundSchedule (round: Int) -> Array<String>{
    
    var schedule = []
    
    switch round{
    case 1:
        schedule = ["Purdue","Salisbury","Illinois", "Morehead State", "SMU", "Duke", "Phoenix", "Iowa", "Grown Ass Man", "Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State"]
    case 2:
        schedule = ["Salisbury","Illinois", "Morehead State", "SMU", "Duke", "Phoenix", "Iowa", "Grown Ass Man", "Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State","Purdue"]
    case 3:
        schedule = ["Illinois", "Morehead State", "SMU", "Duke", "Phoenix", "Iowa", "Grown Ass Man", "Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State","Purdue", "Salisbury"]
    case 4:
        schedule = ["Morehead State", "SMU", "Duke", "Phoenix", "Iowa", "Grown Ass Man", "Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State","Purdue","Salisbury","Illinois"]
    case 5:
        schedule = ["SMU", "Duke", "Phoenix", "Iowa", "Grown Ass Man", "Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State","Purdue","Salisbury","Illinois","Morehead State"]
    case 6:
        schedule = ["Duke", "Phoenix", "Iowa", "Grown Ass Man", "Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State","Purdue","Salisbury","Illinois","Morehead State","SMU"]
    case 7:
        schedule = ["Phoenix", "Iowa", "Grown Ass Man", "Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State","Purdue","Salisbury","Illinois","Morehead State","SMU","Duke"]
    case 8:
        schedule = ["Iowa", "Grown Ass Man", "Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State","Purdue","Salisbury","Illinois","Morehead State","SMU","Duke","Phoenix"]
    case 9:
        schedule = ["Grown Ass Man", "Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State","Purdue","Salisbury","Illinois","Morehead State","SMU","Duke","Phoenix","Iowa"]
    case 10:
        schedule = ["Kirkwood CC", "American U", "Asheville", "UTI", "Lincoln Land", "Indiana", "Oregon State","Purdue","Salisbury","Illinois","Morehead State","SMU","Duke","Phoenix","Iowa","Grown Ass Man"]
    default:
        schedule = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    }
    
    return schedule as! Array<String>
}
