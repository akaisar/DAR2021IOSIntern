//
//  DetailViewController.swift
//  Movie
//
//  Created by Kaysar Altynbek on 08.02.2021.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieId: Int = 0
    var movieTitle: String = ""
    var movieDescription: String = ""
    var favMovies: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieDetails()
        
        descriptionLabel.text = movieDescription
        let button: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addToFav))
        self.navigationItem.rightBarButtonItem = button
        // Do any additional setup after loading the view.
        favMovies = UserDefaults.standard.stringArray(forKey: "Movie") ?? []
        favMovies.forEach({
            if movieTitle == $0 {
                button.image = UIImage(systemName: "star.circle")
            } else {
                button.image = UIImage(systemName: "star")
            }
        })
        
    }
    
    @objc func addToFav() {
        if favMovies.contains(movieTitle) {
            favMovies.remove(at: favMovies.firstIndex(of: movieTitle)!)
        } else {
            favMovies.append(movieTitle)
        }
        UserDefaults.standard.setValue(favMovies, forKey: "Movie")
    }
    
    func getMovieDetails() {
        let api_token = "6c78da2cf41529284dc65d510d302bca"
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(self.movieId)/videos?api_key=\(api_token)")
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "cache-control": "no-cache"
        ]
        let session = URLSession.shared
        session.dataTask(with: request) {
            rawdata, response, error in
            if let error = error {
                print(#function, "error", error.localizedDescription)
                return
            }
            guard let data = rawdata,
                  let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                print(#function, "error", "\(String(describing: rawdata))")
                let alert = UIAlertController(title: "My Alert", message: "Movie did not downloaded.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                return
            }
            guard let trailersJSON = json["results"] as? [[String: Any]], let key = trailersJSON[0]["key"] as? String else {
                let alert = UIAlertController(title: "My Alert", message: "Movie did not downloaded.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            print("111", trailersJSON[0])
            DispatchQueue.main.async() {
                self.playVideo(key)
            }
        }.resume()
    }
    func playVideo(_ key: String){
        let myUrl = URL(string: "https://www.youtube.com/embed/\(key)?playsinline=1?autoplay=1")
        let youtubeRequest = URLRequest(url: myUrl!)
        self.webView?.load(youtubeRequest)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
