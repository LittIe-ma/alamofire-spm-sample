//
//  ViewController.swift
//  alamofire-spm-sample
//
//  Created by yasudamasato on 2021/10/27.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var articleListTableView: UITableView!

    let decoder: JSONDecoder = JSONDecoder()
    var articles = [Aricle]()

    override func viewDidLoad() {
        super.viewDidLoad()

        articleListTableView.delegate = self
        articleListTableView.dataSource = self

        getQiitaArticles()
    }

    private func getQiitaArticles() {
        AF.request("https://qiita.com/api/v2/items").responseJSON { response in
            switch response.result {
            case .success:
                do {
                    self.articles = try self.decoder.decode([Aricle].self, from: response.data!)
                    self.articleListTableView.reloadData()
                } catch {
                    print("デコードに失敗しました。")
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }

}

