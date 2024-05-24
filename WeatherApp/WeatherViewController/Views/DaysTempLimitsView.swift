//
//  DaysTempLimitsView.swift
//  WeatherApp
//
//  Created by Nureles Abdullai uulu on 5/7/24.
//

import UIKit
import SnapKit

final class DayTempLimitsView: UIView {
    struct InputModel {
        let minWeekTemp: Double
        let maxWeekTemp: Double
        let minDayTemp: Double
        let maxDayTemp: Double
        let currentTemp: Double?
        let dayOfWeek: String?
        let dayIcon: UIImage?
    }
    
    private let tempLimitsContainer = UIView()
    private let tempLimitsView = UIView()
    private let currentTempView = UIView()
    private let lineView = UIView()
    private let dayLabel = UILabel()
    private let weatherIconView = UIImageView()
    private let minTempLabel = UILabel()
    private let maxTempLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupDayInfoView()
        setupContainers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ model: InputModel) {
        let weekTempDiff = model.maxWeekTemp - model.minWeekTemp
        let minOffset = abs(model.minWeekTemp - model.minDayTemp) / weekTempDiff
        let maxOffset = abs(model.maxWeekTemp - model.maxDayTemp) / weekTempDiff
        
        tempLimitsView.snp.remakeConstraints { make in
            make.trailing.equalToSuperview().multipliedBy(1 - maxOffset)
            make.width.equalToSuperview().multipliedBy(1 - minOffset - maxOffset)
            make.height.equalToSuperview()
        }
        
        if let currentTemp = model.currentTemp {
            let currentTempOffset = abs(model.minWeekTemp - currentTemp) / weekTempDiff
            
            if currentTempOffset == 0 {
                currentTempView.snp.remakeConstraints { make in
                    make.centerX.equalTo(tempLimitsContainer.snp.leading)
                    make.size.equalTo(tempLimitsContainer.snp.height)
                }
            } else {
                currentTempView.snp.remakeConstraints { make in
                    make.centerX.equalTo(tempLimitsContainer.snp.trailing).multipliedBy(currentTempOffset)
                    make.size.equalTo(tempLimitsContainer.snp.height)
                }
            }
        }
        
        dayLabel.text = model.dayOfWeek
        weatherIconView.image = model.dayIcon
        minTempLabel.text = "\(Int(model.minDayTemp))º"
        maxTempLabel.text = "\(Int(model.maxDayTemp))º"
    }
    
    private func setupContainers() {
        addSubview(tempLimitsContainer)
        tempLimitsContainer.addSubview(tempLimitsView)
        tempLimitsContainer.addSubview(currentTempView)
        
        tempLimitsContainer.backgroundColor = UIColor(named: "darkBlue")?.withAlphaComponent(0.5)
        tempLimitsContainer.layer.cornerRadius = 3
        
        tempLimitsContainer.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(minTempLabel.snp.trailing).offset(10)
            make.height.equalTo(6)
            make.top.equalTo(minTempLabel.snp.top).offset(9)
            make.width.equalTo(120)
        }
        
        currentTempView.backgroundColor = .white
        currentTempView.layer.borderColor = UIColor(named: "darkBlue")?.withAlphaComponent(0.7).cgColor
        currentTempView.layer.borderWidth = 1
        currentTempView.layer.cornerRadius = 3
        
        tempLimitsView.backgroundColor = UIColor(named: "darkYellow")
        tempLimitsView.layer.borderColor = UIColor(named: "darkBlue")?.withAlphaComponent(0.7).cgColor
        tempLimitsView.layer.borderWidth = 1
        tempLimitsView.layer.cornerRadius = 3
    }
    
    private func setupDayInfoView() {
        addSubview(dayLabel)
        addSubview(weatherIconView)
        addSubview(minTempLabel)
        addSubview(maxTempLabel)
        addSubview(lineView)
        addSubview(tempLimitsContainer)
        
        
        dayLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        dayLabel.textColor = .white
        
        dayLabel.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview().offset(20)
            make.width.equalTo(80)
        }
        
        
        weatherIconView.contentMode = .scaleAspectFit
        
        weatherIconView.snp.makeConstraints { make in
            make.leading.equalTo(dayLabel.snp.trailing).offset(16)
            make.top.equalTo(dayLabel.snp.top)
        }
        
        
        minTempLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        minTempLabel.textAlignment = .center
        minTempLabel.textColor = .white.withAlphaComponent(0.7)
        
        minTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(weatherIconView.snp.trailing).offset(35)
            make.top.equalTo(weatherIconView.snp.top)
            make.width.equalTo(30)
        }
        
        
        maxTempLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        maxTempLabel.textAlignment = .center
        maxTempLabel.textColor = .white
        
        maxTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(tempLimitsContainer.snp.trailing).offset(10)
            make.top.equalTo(minTempLabel.snp.top)
            make.width.equalTo(30)
        }
        
        
        lineView.backgroundColor = .white
        lineView.alpha = 0.7
        lineView.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.top).offset(-10)
            make.leading.equalTo(20)
            make.trailing.equalTo(maxTempLabel.snp.trailing)
            make.height.equalTo(0.5)
        }
    }
}
