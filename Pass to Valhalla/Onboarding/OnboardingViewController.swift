//
//  OnboardingViewController.swift
//  Pass to Valhalla
//
//  Created by Александр Прайд on 13.07.2022.
//

import UIKit
import SnapKit
import ShimmerSwift

class OnboardingViewController: UIViewController {

    // properties
    private var collectionView: UICollectionView! = nil
    
    private let pageControll: UIPageControl = {
        let pControll = UIPageControl()
        pControll.pageIndicatorTintColor = .black
        pControll.tintColor = .darkGray
        
        return pControll
    }()
    
    private let shimmeringView: ShimmeringView = {
        let shimm = ShimmeringView()
        // frame: CGRect(x: 68, y: 760, width: 250, height: 50)

        shimm.shimmerSpeed = 100
        
        shimm.isShimmering = true
        return shimm
    }()
    
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(frame: shimmeringView.bounds)
        button.backgroundColor = .themeRed()
        button.tintColor = .white
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont(name: "Runic AltNo", size: 40)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        shimmeringView.contentView = nextButton
        
        setupSubViews()
        createCollectionView()
        applyConstraints()
    }
    

    

}

//MARK: - Setup UI Elements
extension OnboardingViewController {
    
    private func setupSubViews() {
        //view.addSubview(collectionView)
        view.addSubview(pageControll)
        view.addSubview(shimmeringView)
        shimmeringView.addSubview(nextButton)
        
    }
    
    private func createCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //view.addSubview(collectionView)
        collectionView.backgroundColor = .themeWhite()
        
    }
    
    private func applyConstraints() {
        
//        collectionView.snp.makeConstraints { make in
//            make.top.left.right.equalToSuperview()
//            make.bottom.equalTo(pageControll).inset(15)
//        }
        
        pageControll.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(50)
        }
        
        shimmeringView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
    }
}


