//
//  ViewController.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 14.02.2022.
//

import UIKit

protocol MainPictureListViewProtocol: AnyObject {
}


class MainPictureListView: UIViewController, MainPictureListViewProtocol {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let cell = PictureCell()
    var presenter: MainPictureListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func cellRegister() {
        let nibFile = UINib(nibName: "PictureCell", bundle: nil)
        tableView.register(nibFile, forCellReuseIdentifier: cell.idebtifier)
    }
}

extension MainPictureListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cell.idebtifier, for: indexPath) as? PictureCell else { return UITableViewCell() }
        return cell
    }
}
