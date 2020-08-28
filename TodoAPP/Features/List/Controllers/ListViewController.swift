//
//  ListViewController.swift
//  TodoAPP
//
//  Created by aluno on 10/08/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {


    
    @IBOutlet weak var fabButton: CircleButton!
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureCollectionView()
        configureNavigationBar()
        fabButton.isHidden = traitCollection.horizontalSizeClass == .regular
        collectionView.isHidden = !(traitCollection.horizontalSizeClass == .regular)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
       
        fabButton.isHidden = newCollection.horizontalSizeClass == .regular
        collectionView.isHidden = newCollection.horizontalSizeClass == .regular
        tableView.reloadData()
        }
    }


//MARK: configuration method Extension

extension ListViewController {
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListTableViewCellID")
    }
    
    private func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let layout = UICollectionViewFlowLayout()
        
        layout.estimatedItemSize = CGSize(width: (width - 64 / 3 ), height: height * 0.7)
        
        //layout.estimatedItemSize = CGSize (width: 180, height: 155)
        
        let nib = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ListCollectionViewCellID")
    }
    
    private func configureNavigationBar(){
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}


extension ListViewController {
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "Add", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoDataSource.shared.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCellID") as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: TodoDataSource.shared.todos[indexPath.row])
        
        return cell
    }
}


extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TodoModel.ModelType.AllTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCellID", for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
       // cell.configure(with: TodoDataSource.shared.todos[indexPath.row])
        
        return cell
    }
    
    
    
    
}
