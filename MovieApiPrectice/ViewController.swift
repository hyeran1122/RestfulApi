//
//  ViewController.swift
//  MovieApiPrectice
//
//  Created by 김혜란 on 8/6/24.
//

import UIKit

struct MovieData : Codable {
    let boxOfficeResult : BoxOfficeResult
}

struct BoxOfficeResult : Codable {
    let dailyBoxOfficeList : [DailyBoxOfficeList]
}

struct DailyBoxOfficeList : Codable {
    let movieNm : String
    let audiCnt : String
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    let movieURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=055fb9d395f6f9e316f5408e6378b6a4&targetDt=20240806"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        getData()
    }
    
    func getData(){
        if let url = URL(string: movieURL) {
            //url을 담는데. 옵셔널로 저장이된다. = 옵셔널 바인딩이 필요, nill이 아닐때만 변수 저장
            let session = URLSession(configuration: .default) //URL세션 할당
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let JSONdata =  data {
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print(dataString!)
                }
            }
            task.resume() //테스크에 할당 된 데이터를 리줌으로 실행, 테스크가 실행된다는건 데이터가 할당된거고, 할당 된 데이터를 가져오는건 리줌!
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.movieName.text = indexPath.description
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.description)
    }

}
