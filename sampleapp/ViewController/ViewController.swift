//
//  ViewController.swift
//  sampleapp
//
//  Created by Ripon sk on 30/07/22.
//

import UIKit

class ViewController: UIViewController{
    var x = Fectchdata.share
    @IBOutlet weak var tableviews: UITableView!
    var arr = [Results]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Fectchdata.share.fetch_data()
        x.vc = self
        tableviews.delegate = self
        tableviews.dataSource = self
       // print(arr.count)
        tableviews.tableFooterView = UIView()
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let url = URL(string: arr[indexPath.row].poster_path!.description)
        cell.tiitle.text = arr[indexPath.row].title!
        cell.img.loadimage(from: url!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }


}
