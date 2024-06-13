//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Nureles Abdullai uulu on 5/4/24.
//

import UIKit
import SnapKit

final class WeatherViewController: UIViewController {
    
    private let backgroundImage = UIImageView()
    private let titleContainer = UIView()
    private let titleView = TitleView()
    private let bottomBarView = BottomBarView()
    private let temporaryContentView = UIView()
    private let tenDayForecastView = UIView()
    private let dayTempLimitsView = DayTempLimitsView()
    private let hourlyWeatherView = HourlyWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupBackgroundImage()
        setupTitleContainer()
        setupTitleView()
        setupBottomBarView()
        setupTemporaryContentView()
        setupHourlyWeatherViews()
        setupTenDayForecastView()
        setupDayTempView()
    }
    
    private func setupBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = UIImage(named: "clearSky")
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTitleContainer() {
        view.addSubview(titleContainer)
        
        titleContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(titleContainer.snp.width).multipliedBy(0.7)
        }
    }
    
    private func setupTitleView() {
        titleContainer.addSubview(titleView)
        titleView.setup(
            TitleView.InputModel(title: "Asanbai",
                                 subtitle: "Bishkek".uppercased(),
                                 currentTemp: 21,
                                 description: "Clear sky",
                                 highTemp: 25,
                                 lowTemp: 16)
        )
        
        titleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    private func setupBottomBarView() {
        view.addSubview(bottomBarView)
        
        bottomBarView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(50)
        }
    }
    
    private func setupTemporaryContentView() {
        view.addSubview(temporaryContentView)
        
        temporaryContentView.backgroundColor = .lightBlue
        temporaryContentView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        temporaryContentView.layer.borderWidth = 1
        temporaryContentView.layer.cornerRadius = 15
        temporaryContentView.alpha = 0.7
        
        temporaryContentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(titleContainer.snp.bottom).offset(20)
        }
    }
    
    private func setupTenDayForecastView() {
        view.addSubview(tenDayForecastView)
        
        let calendarIcon = UIImageView()
        calendarIcon.image = UIImage(systemName: "calendar")
        calendarIcon.tintColor = .white
        calendarIcon.alpha = 0.7
        
        tenDayForecastView.addSubview(calendarIcon)
        
        let titleLabel = UILabel()
        titleLabel.text = "10-DAY FORECAST"
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        titleLabel.textColor = .white
        titleLabel.alpha = 0.7
        tenDayForecastView.addSubview(titleLabel)
        
        calendarIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(16)
            make.width.equalTo(16)
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel.snp.leading).offset(-8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(42)
        }
        
        tenDayForecastView.backgroundColor = .lightBlue
        tenDayForecastView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        tenDayForecastView.layer.borderWidth = 1
        tenDayForecastView.layer.cornerRadius = 15
        tenDayForecastView.alpha = 0.7
        
        tenDayForecastView.snp.makeConstraints { make in
            make.top.equalTo(temporaryContentView.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.greaterThanOrEqualTo(100)
        }
    }
    
    private func setupDayTempView() {
        tenDayForecastView.addSubview(dayTempLimitsView)
        
        dayTempLimitsView.setup(
            DayTempLimitsView.InputModel(minWeekTemp: 13,
                                         maxWeekTemp: 25,
                                         minDayTemp: 15,
                                         maxDayTemp: 22,
                                         currentTemp: 18,
                                         dayOfWeek: "Monday",
                                         dayIcon: UIImage(systemName: "cloud.sun.bolt.fill")?.withRenderingMode(.alwaysOriginal))
        )
        
        dayTempLimitsView.snp.makeConstraints { make in
            make.top.equalTo(tenDayForecastView).inset(34)
        }
    }
    
    private func setupHourlyWeatherViews() {
        let hourlyData = [
            HourlyWeatherView.InputModel(hour: "Now", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp: 21),
            HourlyWeatherView.InputModel(hour: "12", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp: 19),
            HourlyWeatherView.InputModel(hour: "13", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp: 19),
            HourlyWeatherView.InputModel(hour: "14", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp: 19),
            HourlyWeatherView.InputModel(hour: "15", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp: 19),
            HourlyWeatherView.InputModel(hour: "16", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp: 19),
            HourlyWeatherView.InputModel(hour: "17", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp: 19),
            HourlyWeatherView.InputModel(hour: "18", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp: 19),
            HourlyWeatherView.InputModel(hour: "19", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp: 19)
        ]
        
        temporaryContentView.addSubview(hourlyWeatherView)
        hourlyWeatherView.setup(hourlyData)
        
        hourlyWeatherView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(100)
            make.bottom.equalToSuperview().inset(16)
        }
    }
}
