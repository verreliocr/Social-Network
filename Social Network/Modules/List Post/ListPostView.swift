//
//  ListPostView.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class ListPostView: UIViewController {
    
    @IBOutlet weak var userButton   : UIButton!
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
        setupNavBar()
        setupMenu()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppearing()
    }
    
    private func setupNavBar() {
        navigationController?.showBarIfNecessary()
        title = "Posts"
    }
    
    private func setupTableView() {
        postTableView.rowHeight             = UITableView.automaticDimension
        postTableView.estimatedRowHeight    = 200
        postTableView.dataSource            = self
        postTableView.delegate              = self
        postTableView.register([PostItemTableCell.self])
    }
    
    private func setupMenu() {
        var actions: [UIAction] = []
        for user in presenter.getUser() {
            let action = UIAction(title: user.username, handler: { [weak self] _ in
                self?.presenter.didSelectUser(at: user.id)
            })
            actions.append(action)
        }
        userButton.menu = UIMenu(children: actions)
    }

}

extension ListPostView: IListPostView {
    func reloadData() {
        DispatchQueue.main.async { [unowned self] in
            self.userButton.setTitle(self.presenter.getSelectedUser(),
                                     for: .normal)
            self.postTableView.reloadData()
        }
    }
}

extension ListPostView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getNumberOfPosts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: PostItemTableCell = tableView.dequeueReusableCell() {
            
            cell.bind(name: presenter.getName(at: indexPath.row),
                      username: presenter.getUsername(at: indexPath.row),
                      post: presenter.getText(at: indexPath.row),
                      image: presenter.getImage(at: indexPath.row))
            
            return cell
        }
        return UITableViewCell()
    }
}

extension ListPostView: UITableViewDelegate { }
