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
        view.backgroundColor = .themeWhite()
        
        let label = UILabel()
        label.text = K.viewOneText
        label.font = UIFont(name: "Runic", size: 33)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        
        view.addSubview(label)
        label.edgeTo(view: view)
        
        return view
    }()
    
    private lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .themeWhite()
        
        let label = UILabel()
        label.text = K.viewTwoText
        label.font = UIFont(name: "Runic", size: 33)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        view.addSubview(label)
        label.edgeTo(view: view)
        
        return view
    }()
    
    private lazy var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .themeWhite()
        
        
        
//        let shimmeringView = ShimmeringView()
//        // frame: CGRect(x: 68, y: 760, width: 250, height: 50)
//
//        shimmeringView.shimmerSpeed = 100
//        shimmeringView.isShimmering = true
//        shimmeringView.center = view.center
//        view.addSubview(shimmeringView)
//        shimmeringView.pinTo(view)
//
//        let button = UIButton(frame: shimmeringView.bounds)
//        button.backgroundColor = .themeRed()
//        button.tintColor = .white
//        button.setTitle("NEXT", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Runic AltNo", size: 40)
//        button.layer.cornerRadius = 10
//
//        shimmeringView.addSubview(button)
//        shimmeringView.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//            make.height.equalTo(50)
//            make.width.equalTo(250)
//        }
        
        
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
    
    private lazy var pageControll: UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.numberOfPages = views.count
        pageControll.currentPage = 0
        pageControll.addTarget(self, action: #selector(pageControllTapHandler(sender:)), for: .touchUpInside)
        pageControll.pageIndicatorTintColor = .themeBlack()
        pageControll.currentPageIndicatorTintColor = .themeRed()
        
        return pageControll
    }()
    
    @objc
    func pageControllTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
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
        button.addTarget(self, action: #selector(pressedNextButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc
    func pressedNextButton(sender: UIButton) {
        
        let authCV = AuthViewController()

        authCV.modalPresentationStyle = .fullScreen
        present(authCV, animated: true)
    }
    
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
        view.addSubview(pageControll)
        thirdView.addSubview(shimmeringView)
//        view.addSubview(shimmeringView)
//        shimmeringView.addSubview(nextButton)
        
    }
   
    
    private func applyConstraints() {
        

        scrollView.edgeTo(view: view)
        pageControll.pinTo(view)
        
        shimmeringView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
    }
}

// MARK: - UIScrollViewDelegate
extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControll.currentPage = Int(pageIndex)
    }
}

