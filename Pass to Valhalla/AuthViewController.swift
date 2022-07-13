//
//  ViewController.swift
//  Pass to Valhalla
//
//  Created by Александр Прайд on 12.07.2022.
//

import UIKit
import SnapKit
import ShimmerSwift

class AuthViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "muninn_raven")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let nameLabel = StatusLabel()
    private let nameTextField = TextField()
    private let secondNameLabel = StatusLabel()
    private let secondNameTextField = TextField()
    private let genderLabel = StatusLabel()
    
    private let genderSegmented: UISegmentedControl = {
        let seg = UISegmentedControl(first: "M", second: "F", third: "O")
        seg.layer.cornerRadius = 10
        seg.tintColor = UIColor.themeBlack()
        return seg
    }()
    
    private let shimmeringView: ShimmeringView = {
        let shimm = ShimmeringView()
        // frame: CGRect(x: 68, y: 760, width: 250, height: 50)

        shimm.shimmerSpeed = 100
        
        shimm.isShimmering = true
        return shimm
    }()
    
    
    private lazy var entryButton: UIButton = {
        let button = UIButton(frame: shimmeringView.bounds)
        button.backgroundColor = .themeRed()
        button.tintColor = .white
        button.setTitle("ENTRY", for: .normal)
        button.titleLabel?.font = UIFont(name: "Runic AltNo", size: 40)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .themeWhite()
        
        shimmeringView.contentView = entryButton
        
        subviews()
        applyConstraints()
        setupTitles()
        
    }
}

extension AuthViewController {
    
    private func subviews() {
        view.addSubview(logoImageView)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(secondNameLabel)
        view.addSubview(secondNameTextField)
        view.addSubview(genderLabel)
        view.addSubview(genderSegmented)
        view.addSubview(shimmeringView)
        shimmeringView.addSubview(entryButton)
        
    }
    
    private func setupTitles() {
        nameLabel.text = "Tell reven Muninn your name, wanderer?"
        secondNameLabel.text = "What's your second name?"
        genderLabel.text = "Youre gender?"
    }
    
    private func applyConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(60)
            make.height.width.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(logoImageView).inset(140)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(nameLabel).inset(30)
            make.height.equalTo(46)
        }
        
        secondNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField).inset(100)
            make.left.equalToSuperview().inset(20)
        }
        
        secondNameTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(secondNameLabel).inset(30)
            make.height.equalTo(46)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(secondNameTextField).inset(100)
            make.left.equalToSuperview().inset(20)
        }
        
        genderSegmented.snp.makeConstraints { make in
            make.top.equalTo(genderLabel).inset(40)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        shimmeringView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
        
    }
}
