//
//  ViewController.swift
//  testExpndable
//
//  Created by Murteza on 17/09/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView : UITableView!
    var items : [ItemList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUp()
        self.setupList()
    }
    func setUp(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TestOneTableViewCell.nib, forCellReuseIdentifier: TestOneTableViewCell.identifier)
        self.tableView.register(TestTwoTableViewCell.nib, forCellReuseIdentifier: TestTwoTableViewCell.identifier)
        self.tableView.reloadData()
        self.tableView.backgroundView = UIView()
    }
    func setupList(){
         items = [
            ItemList(name: "Paid", items: [contentModel(title: "Paid Bil One ", descritpion: "Abc", status: "Paid"),contentModel(title: "Paid Bil Two ", descritpion: "Abc", status: "Paid"),contentModel(title: "Paid Bil One ", descritpion: "Abc", status: "Paid")]),
         ItemList(name: "Upaid", items: [contentModel(title: "UnPaid Bil One ", descritpion: "Abc", status: "unPaid")]),
         ItemList(name: "Docuements", items: [contentModel(title: "Document Paid Bil One ", descritpion: "Abc", status: "Paid"),contentModel(title: "Document Paid Bil Two ", descritpion: "Abc", status: "Paid"),contentModel(title: "Document Paid Bil One ", descritpion: "Abc", status: "Paid")])
        ]
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{

func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 60
}

func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerHeading = UILabel(frame: CGRect(x: 5, y: 10, width: self.view.frame.width, height: 40))
    let imageView = UIImageView(frame: CGRect(x: self.view.frame.width - 40, y: 30, width: 23, height: 13))
    if items[section].collapsed{
        imageView.image = UIImage(named: "collapsed")
    }else{
        imageView.image = UIImage(named: "expand")
    }
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
    let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(headerViewTapped))
    tapGuesture.numberOfTapsRequired = 1
    headerView.addGestureRecognizer(tapGuesture)
    headerView.backgroundColor = UIColor.white
    headerView.tag = section
    headerHeading.text = items[section].name
    headerHeading.textColor = .systemBlue
    headerView.addSubview(headerHeading)
    headerView.addSubview(imageView)
    return headerView
 }
func numberOfSections(in tableView: UITableView) -> Int {
    return items.count
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let itms = items[section]
    return !itms.collapsed ? 0 : itms.items.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: TestOneTableViewCell.identifier, for: indexPath) as! TestOneTableViewCell
        cell.testTitle.text = items[indexPath.section].items[indexPath.row].title
        return cell
    case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: TestTwoTableViewCell.identifier, for: indexPath) as! TestTwoTableViewCell
        cell.testTwoTitle.text = items[indexPath.section].items[indexPath.row].title
        return cell
    case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: TestOneTableViewCell.identifier, for: indexPath) as! TestOneTableViewCell
        cell.testTitle.text = items[indexPath.section].items[indexPath.row].title
        cell.backgroundColor = .green
        return cell
    default:
        break
    }
    return UITableViewCell()
}
@objc func headerViewTapped(tapped:UITapGestureRecognizer){
    print(tapped.view?.tag)
    if items[tapped.view!.tag].collapsed == true{
        items[tapped.view!.tag].collapsed = false
    }else{
        items[tapped.view!.tag].collapsed = true
    }
    if let imView = tapped.view?.subviews[1] as? UIImageView{
        if imView.isKind(of: UIImageView.self){
            if items[tapped.view!.tag].collapsed{
                imView.image = UIImage(named: "collapsed")
            }else{
                imView.image = UIImage(named: "expand")
            }
        }
    }
    tableView.reloadData()
}

}
