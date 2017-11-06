//
//  EmbedSegue.swift
//

import UIKit
import SnapKit

protocol EmbeddingViewController {
    func viewForEmbedSegue(identifier: String?) -> UIView
}

class EmbedSegue: UIStoryboardSegue {

    override func perform() {
        guard let containerView = (self.source as? EmbeddingViewController)?.viewForEmbedSegue(identifier: self.identifier) else {
            fatalError("EmbedSegue: Destination \(self.destination) does not conform EmbedableViewController")
        }

        source.add(childViewController: destination, containerView: containerView)
    }

}

extension UIViewController {
    
    func add(childViewController: UIViewController, containerView: UIView? = nil) {
        let targetContainerView: UIView = containerView ?? view
        
        childViewController.willMove(toParentViewController: self)
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        targetContainerView.addSubview(childViewController.view)
        childViewController.view.snp.makeConstraints { make in
            make.edges.equalTo(targetContainerView)
        }
        
        addChildViewController(childViewController)
        childViewController.didMove(toParentViewController: self)
    }
}
