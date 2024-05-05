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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupBackgroundImage()
        setupTitleContainer()
        setupTitleView()
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
            TitleView.InputModel(title: "Bishkek",
                                 subtitle: "Center".uppercased(),
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
}
