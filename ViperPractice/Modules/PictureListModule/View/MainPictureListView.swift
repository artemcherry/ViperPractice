//
//  ViewController.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 14.02.2022.
//

import UIKit

protocol MainPictureListViewProtocol: AnyObject {
    func setupModel(model: [PictureModel])
}


class MainPictureListView: UIViewController, MainPictureListViewProtocol {

    @IBOutlet private weak var tableView: UITableView!
    
    private let cell = PictureCell()
    var presenter: MainPictureListPresenterProtocol?
    private var pictures: [PictureModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        getPicture()
        title = "Pictures"
    }

    private func cellRegister() {
        let nibFile = UINib(nibName: "PictureCell", bundle: nil)
        tableView.register(nibFile, forCellReuseIdentifier: cell.idebtifier)
    }
    
    private func getPicture() {
        guard let presenter = presenter else { return }
        DispatchQueue.main.async {
            presenter.getPictureList()
        }
    }
    
    func setupModel(model: [PictureModel]) {
        self.pictures = model
        tableView.reloadData()
    }
}

extension MainPictureListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cell.idebtifier, for: indexPath) as? PictureCell,
              let pictures = pictures else { return UITableViewCell() }
        
        cell.setupCell(model: pictures[indexPath.row])
        
        return cell
    }
}

extension MainPictureListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pictures = pictures else { return }
        presenter?.getDescription(picture: pictures[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
