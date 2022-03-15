//
//  Sections.swift
//  Expandable sections
//
//  Created by Владимир Рябов on 15.03.2022.
//

import Foundation

class Music {
    var sections = [Section(sectionName: "Rock", customCells: [CustomCellModel(title: "«В утробе», Nirvana, 1993.", imageString: "nirvana"),
                                                               CustomCellModel(title: "«Ночные видения», дебютный альбом Imagine Dragons, 2013.", imageString: "imagineDragons"),
                                                               CustomCellModel(title: "«Игра с огнём», группа «Ария», 1994.", imageString: "aria")], expanded: false),
                    Section(sectionName: "POP", customCells: [CustomCellModel(title: "«Трава не зеленее», Крис Браун, 2016.", imageString: "brown"),
                                                              CustomCellModel(title: "«Мой путь», Келвин Харрис, 2016.", imageString: "harris"),
                                                              CustomCellModel(title: "«Как девственница», Мадонна, 1984.", imageString: "madonna")], expanded: false),
                    Section(sectionName: "Alternative", customCells: [CustomCellModel(title: "«Бугорок впереди», третий альбом хард-рок-группы «Mr. Big», 1993.", imageString: "mrbig"),
                                                                      CustomCellModel(title: "«Гуси-Лебеди», восьмой студийный альбом группы «Вежливый отказ», 2010.", imageString: "politerefuse"),
                                                                      CustomCellModel(title: "«Безопасность», ARLO, 2017.", imageString: "arlo")], expanded: false),
    ]
}
