//
//  TitleView.swift
//  WeatherApp
//
//  Created by Nureles Abdullai uulu on 5/4/24.
//

import UIKit
import SnapKit

final class TitleView: UIView {
    
    struct InputModel {
        let title: String
        let subtitle: String?
        let currentTemp: Int
        let description: String
        let highTemp: Int
        let lowTemp: Int
    }
    
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let tempLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let tempLimitsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
        setupTitleLabel()
        setupSubitleLabel()
        setupTempLabel()
        setupDescriptionLabel()
        setupTempLimitsLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ model: InputModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        subtitleLabel.isHidden = model.subtitle == nil
        tempLabel.text = "\(model.currentTemp)º"
        descriptionLabel.text = model.description
        tempLimitsLabel.text = "H: \(model.highTemp)º  L: \(model.lowTemp)º"
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillProportionally
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
    }
    
    private func setupSubitleLabel() {
        stackView.addArrangedSubview(subtitleLabel)
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .white
    }
    
    private func setupTempLabel() {
        stackView.addArrangedSubview(tempLabel)
        tempLabel.font = UIFont.systemFont(ofSize: 92, weight: .thin)
        tempLabel.textAlignment = .center
        tempLabel.textColor = .white
    }
    
    private func setupDescriptionLabel() {
        stackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 2
    }
    
    private func setupTempLimitsLabel() {
        stackView.addArrangedSubview(tempLimitsLabel)
        tempLimitsLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        tempLimitsLabel.textAlignment = .center
        tempLimitsLabel.textColor = .white
    }
    
}
