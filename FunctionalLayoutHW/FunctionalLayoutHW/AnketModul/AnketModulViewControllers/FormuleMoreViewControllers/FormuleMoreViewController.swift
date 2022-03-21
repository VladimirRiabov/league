//
//  FormuleMoreViewController.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 21.03.2022.
//

enum Formules: String {
    case harrisBenedict = "Формула Харриса-Бенедикта"
    case mifflin = "Формула Миффлина-Сан Жеора"
}

import UIKit

class FormuleMoreViewController: UIViewController {
    
    var formula = ""
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var selectedCell: UIView?
    let resultView = ResultView()
    var resultViewModel = ResultView.ViewModel(sexText: "", ageText: "", formulaText: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        informationAboutFormula()
        resultViewModel.formulaText = "\(formula)"
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let cardWithTextFieldFrameHeight = ResultView.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: resultViewModel
        )
            .calculateLayout()
            .cardHeight
        
        let cardWithTextFieldFrame = CGRect(x: 20,
                                            y: 20,
                                            width: UIScreen.main.bounds.width - 20 - 20,
                                            height: cardWithTextFieldFrameHeight)
        
        resultView.frame = cardWithTextFieldFrame
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width
                                        , height: cardWithTextFieldFrameHeight + 40 )
        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: cardWithTextFieldFrameHeight + 40)
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.frame = view.bounds
    }
    
    private func setupViews() {
        view.backgroundColor = .secondarySystemBackground
        title = "Ваш возраст"
        setupScrollView()
        view.addSubview(resultView)
        resultView.viewModel = resultViewModel
        contentView.addSubviews([
            resultView
        ])
    }
    
    private func informationAboutFormula() {
        if formula == Formules.harrisBenedict.rawValue {
            resultViewModel.ageText = """
Все люди отличаются друг от друга и у всех организмы обладают индивидуальными особенностями, поэтому для каждого человека нужно свое количество калорий в день для похудения или поддержания веса. Для определения своей нормы калорий в день рекомендуем использовать формулу Харриса-Бенедикта. Доверительный интервал с уровнем доверия 95% составляет ± 213,0 ккал/сут для мужчин и ± 201,0 ккал/сут для женщин.\
По завершении расчетов суточной нормы калорий по формуле Харриса-Бенедикта у вас появилась точная цифра. Если вашей целью является похудение, то калорий нужно употреблять меньше, чем итоговая цифра (но не меньше 1200 ккал, так как это вредно для здоровья). Если ваша цель поправиться, то нужно кушать больше, чем полученная цифра. Для сохранения веса кушайте столько продуктов, чтобы выходила полученная сумма калорий. Во всех вариантах желательно делать хоть легкие физические упражнения пару раз в неделю. Обратите внимание, что формулу Харриса-Бенедикта нельзя применять очень полным людям (формула переоценивает их действительную потребность в калориях) и очень накачанным (формула недооценивает их действительные потребности).
"""
        } else {
            resultViewModel.ageText =
            """
 Разработанная группой американских врачей-диетологов под руководством докторов Миффлина и Сан Жеора, выдает необходимое количество килокалорий (ккал) в сутки для каждого конкретного человека. Она была выведена в 2005 году и все чаще стала заменять классическую формулу Харриса-Бенедикта. Существует два варианта формулы:\
 1. Упрощенный вариант формулы Миффлина-Сан Жеора: для мужчин: 10 х вес (кг) + 6,25 x рост (см) – 5 х возраст (г) + 5; для женщин: 10 x вес (кг) + 6,25 x рост (см) – 5 x возраст (г) – 161.\
 2. Доработанный вариант формулы Миффлина-Сан Жеора, в отличие от упрощенного дает более точную информацию и учитывает степень физической активности человека: для мужчин: (10 x вес (кг) + 6.25 x рост (см) – 5 x возраст (г) + 5) x A; для женщин: (10 x вес (кг) + 6.25 x рост (см) – 5 x возраст (г) – 161) x A. A – это уровень активности человека, его различают обычно по пяти степеням физических нагрузок в сутки:
 """
        }
    }
}
