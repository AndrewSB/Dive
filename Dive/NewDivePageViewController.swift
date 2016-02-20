//
//  NewDivePageViewController.swift
//  Dive
//
//  Created by Andrew Breckenridge on 2/18/16.
//  Copyright © 2016 Andrew Breckenridge. All rights reserved.
//

import UIKit

class NewDivePageViewController: UIPageViewController {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        (dataSource, delegate) = (self, self)
        setViewControllers([pageAtIndex(0)!], direction: .Forward, animated: false, completion: nil)
    }

}


extension NewDivePageViewController: UIPageViewControllerDelegate {
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0 // weird af. this is bs. complete bs. If it's zero the page shouldn't change
    }
    
}

extension NewDivePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index = (viewController as? NewDiveFormViewController)?.pageIndex
        return pageAtIndex(index.flatMap { $0 - 1 })
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = (viewController as? NewDiveFormViewController)?.pageIndex
        return pageAtIndex(index.flatMap { $0 + 1 })
    }
    
    func pageAtIndex(index: Int?) -> NewDiveFormViewController? {
        guard index != nil else { return nil }
        
        switch index! {
        case 0...4:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("newDiveContent") as! NewDiveFormViewController
            vc.pageIndex = index
            vc.title = "page number \(index! + 1)"
            return vc
        default:
            return nil
        }
    }
    
}