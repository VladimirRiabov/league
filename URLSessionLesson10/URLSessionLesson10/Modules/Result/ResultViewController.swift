//
//  ViewController.swift
//  URLSessionLesson10
//
//  Created by Владимир Рябов on 22.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    var companies: [Company] = []
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let resultView = ResultView()
    var resultViewModel = ResultView.ViewModel(companyNameText: "", priceText: "", symbolText: "", priceChangeText: "")
    
    let customPickerView  = CustomPickerView()
    let customPickerViewViewModel = CustomPickerView.ViewModel(pickerIsActive: true)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Лабораторная работа"
        customPickerView.activityIndicatorView.startAnimating()
        fetchCompanies()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupScrollView()
        addResultView()
        addCustomPickerView()
    }
}

//MARK: - SetupViews
extension ResultViewController {
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width
                                        , height: scrollView.frame.maxY)
        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: scrollView.frame.maxY)
    }
    //INFO View
    func addResultView() {
        updateLayoutResultView()
        resultView.viewModel = resultViewModel
        view.addSubview(resultView)
    }
    //Picker View
    func addCustomPickerView() {
        let customPickerViewFrameHeight = CustomPickerView.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: customPickerViewViewModel
        )
            .calculateLayout()
            .cardHeight
        
        let customPickerViewFrame = CGRect(x: 20,
                                           y: UIScreen.main.bounds.height - customPickerViewFrameHeight - 20,
                                           width: UIScreen.main.bounds.width - 20 - 20,
                                           height: customPickerViewFrameHeight)
        
        customPickerView.frame = customPickerViewFrame
        customPickerView.viewModel = customPickerViewViewModel
        customPickerView.pickerView.delegate = self
        customPickerView.pickerView.dataSource = self
        view.addSubview(customPickerView)
    }
}

//MARK: - PickerDataSourseDelegate
extension ResultViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companies.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = companies[row].symbol
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.updateInfoResultView(row: row)
            self.updateLayoutResultView()
        }
    }
    
}

//MARK: - ResultViewUpdating
extension ResultViewController {
    private func updateInfoResultView(row: Int) {
        resultViewModel.companyNameText = "Company name: \(companies[row].companyName)"
        resultViewModel.priceText = "Symbol: \(companies[row].latestPrice)"
        resultViewModel.symbolText = "Price: \(companies[row].symbol)"
        resultViewModel.priceChangeText = "Price change: \(companies[row].change)"
        resultView.viewModel = resultViewModel
    }
    
    private func updateLayoutResultView() {
        let resultViewHeight = ResultView.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: resultViewModel
        )
            .calculateLayout()
            .cardHeight
        let resultViewFrame = CGRect(x: 20,
                                     y: 100,
                                     width: UIScreen.main.bounds.width - 20 - 20,
                                     height: resultViewHeight)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.resultView.frame = resultViewFrame
        }, completion: nil)
    }
}

extension ResultViewController {
    private func fetchCompanies() {
        StockService.shared.fetchListOfCompanies { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.companies = response.array
                    self.customPickerView.pickerView.reloadAllComponents()
                    self.customPickerView.activityIndicatorView.stopAnimating()
                    self.updateInfoResultView(row: 0)
                    self.updateLayoutResultView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}



