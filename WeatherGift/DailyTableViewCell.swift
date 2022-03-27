//
//  DailyTableViewCell.swift
//  WeatherGift
//
//  Created by Derek Marble on 3/27/22.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    @IBOutlet weak var dailyImageView: UIImageView!
    @IBOutlet weak var dailyWeekdayLabel: UILabel!
    @IBOutlet weak var dailyHighLabel: UILabel!
    @IBOutlet weak var dailyLowLabel: UILabel!
    @IBOutlet weak var dailySummaryView: UITextView!
    
    
    var dailyWeather: DailyWeather! {
        didSet {
            dailyImageView.image = UIImage(named: dailyWeather.dailyIcon)
            dailyWeekdayLabel.text = dailyWeather.dailyWeekday
            dailyHighLabel.text = "\(dailyWeather.dailyHigh)°"
            dailyLowLabel.text = "\(dailyWeather.dailyLow)°"
            dailySummaryView.text = dailyWeather.dailySummary
            
        }
    }
}
