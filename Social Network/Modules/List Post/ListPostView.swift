//
//  ListPostView.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class ListPostView: UIViewController {
    
    @IBOutlet weak var userButton   : UIButton!
    @IBOutlet weak var userMenu     : UIMenu!
    @IBOutlet weak var addButton    : UIButton!
    @IBOutlet weak var postTableView: UITableView!
    
    let presenter: IListPostPresenter
    
    init(presenter: IListPostPresenter) {
        self.presenter = presenter
        super.init(nibName: "ListPostView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ListPostView: IListPostView {
    func reloadData() {
        
    }
}
