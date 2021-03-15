//
//  OnboardingController.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 05.03.2021.
//

import UIKit


class OnboardingController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var button: UIButton!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    var images = ["care", "distancing", "wash_hands"]
    var desc = ["Care about your health. Recommends a healthy diet, being physically active, managing psychological stress, and getting enough sleep.", "Keep distace with other people. Limiting travel, avoiding crowded areas, using no-contact greetings", "Wash your hands after each walking.Thorough hand hygiene after any cough or sneeze is required"]
    
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        self.scrollView.delegate = self
        slide()
        buttonEdit()
    }
    
    func slide() {
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<desc.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height:
                                    scrollHeight)
            let slide = UIView(frame: frame)
            let image = UIImageView.init(image:
                                            UIImage.init(named: images[index]))
            image.frame = CGRect(x:0,y:0,width:320,height:350)
            image.contentMode = .scaleAspectFit
            image.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
            
            let txt2 = UILabel.init(frame:
                                        CGRect(x:32,y:image.frame.maxY+30,width:scrollWidth-64,height:140)
            )
            txt2.textAlignment = .center
            txt2.numberOfLines = 4
            txt2.font = UIFont.boldSystemFont(ofSize: 19.0)
            txt2.textColor = UIColor.white
            txt2.text = desc[index]
            slide.addSubview(image)
            slide.addSubview(txt2)
            scrollView.addSubview(slide)
        }
        scrollView.contentSize = CGSize(width: scrollWidth *
                                            CGFloat(desc.count), height: scrollHeight)
        self.scrollView.contentSize.height = 1.0
        pageControl.numberOfPages = desc.count
        pageControl.currentPage = 0
        
    }
    @IBAction func currentPage(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth *
                                                CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth,
                                               height: scrollHeight), animated: true)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView:
                                        UIScrollView) {
        setIndiactorForCurrentPage()
    }
    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
    
    func buttonEdit() {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func statisticAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabVC") as! TabController
        self.present(vc, animated: true, completion: nil)
    }
}
