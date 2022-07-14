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
    private lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.textAlignment = .center
        
        view.addSubview(label)
        label.edgeTo(view: view)
        
        return view
    }()
    
    private lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.textAlignment = .center
        
        view.addSubview(label)
        label.edgeTo(view: view)
        
        return view
    }()
    
    private lazy var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.textAlignment = .center
        
        view.addSubview(label)
        label.edgeTo(view: view)
        
        return view
    }()
    
    lazy var views = [firstView, secondView, thirdView]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        
        for indexOfView in 0..<views.count {
            scrollView.addSubview(views[indexOfView])
            views[indexOfView].frame = CGRect(x: view.frame.width * CGFloat(indexOfView),
                                        y: 0, width: view.frame.width,
                                        height: view.frame.height)
        }
        
        scrollView.delegate = self
        
        return scrollView
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
        
        applyConstraints()
    }
    

    

}

//MARK: - Setup UI Elements
extension OnboardingViewController {
    
    private func setupSubViews() {
        view.addSubview(scrollView)
        
//        view.addSubview(shimmeringView)
//        shimmeringView.addSubview(nextButton)
        
    }
   
    
    private func applyConstraints() {
        

        scrollView.edgeTo(view: view)
        
//        shimmeringView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview().inset(40)
//            make.height.equalTo(50)
//            make.width.equalTo(250)
//        }
    }
}

// MARK: - UIScrollViewDelegate
extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

