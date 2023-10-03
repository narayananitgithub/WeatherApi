//
//  HomeViewController.swift
//  WeatherApi
//
//  Created by Narayanasamy on 29/09/23.
//

import UIKit
class WeatherViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    private let weatherService = WeatherService()
    private var viewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        registerCells()
        fetchWeatherData(forCity: "Kolkata")
    }
    
    func registerCells() {
        let weatherNib = UINib(nibName: "WeatherTableViewCell", bundle: nil)
        tableView.register(weatherNib, forCellReuseIdentifier: "WeatherTableViewCell")
    }
    
    func fetchWeatherData(forCity city: String) {
           weatherService.fetchWeatherData(forCity: city) { [weak self] result in
               guard let self = self else { return }
               switch result {
               case .success(let weatherData):
                   self.viewModel = WeatherViewModel(weatherData: weatherData)
                   DispatchQueue.main.async {
                       self.tableView.reloadData()
                   }
               case .failure(let error):
                   print("Error fetching weather data: \(error)")
               }
           }
       }
}

extension WeatherViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel?.numberOfWeatherItems ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell

        cell?.nameLabel?.text = viewModel?.cityName
        cell?.idLabel?.text = viewModel?.cityID
        cell?.codLabel?.text = viewModel?.cityCOD

        return cell ?? UITableViewCell()
    }

}
