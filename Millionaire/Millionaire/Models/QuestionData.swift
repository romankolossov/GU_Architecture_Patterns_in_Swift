//
//  QuestionData.swift
//  Millionaire
//
//  Created by Роман Колосов on 29.10.2020.
//

import Foundation

final class QuestionData {
    
    let question1 = Question(question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?",
                             rightAnswer: "На гуслях",
                             choiceA: "На виолончели",
                             choiceB: "На баяне",
                             choiceC: "На гитаре")
    
    let question2 = Question(question: "В какой из этих стран один из официальных языков - французский?",
                             rightAnswer: "Республика Гаити",
                             choiceA: "Кения",
                             choiceB: "Эквадор",
                             choiceC: "Венесуэла")
    
    let question3 = Question(question: "В каком из этих фильмов не снимался Александр Абдулов?",
                             rightAnswer: "Московские каникулы",
                             choiceA: "Карнавал",
                             choiceB: "Чародеи",
                             choiceC: "Убить дракона")
    
    let question4 = Question(question: "В каком году произошла Куликовская битва?",
                             rightAnswer: "1380",
                             choiceA: "1569",
                             choiceB: "1616",
                             choiceC: "1773")
    
    let question5 = Question(question: "Кто автор музыки к детской песенке Чунга-Чанга?",
                             rightAnswer: "Шаинский",
                             choiceA: "Зацепин",
                             choiceB: "Дербенёв",
                             choiceC: "Шпиц")
    
    let question6 = Question(question: "Какая картина Малевича находится в Русском музее?",
                             rightAnswer: "Красный квадрат",
                             choiceA: "Белый квадрат",
                             choiceB: "Чёрный квадрат",
                             choiceC: "Точильщик")
    
    let question7 = Question(question: "Шкала Сковилла - это шкала оценки...",
                             rightAnswer: "Остроты перца",
                             choiceA: "Качества воздуха",
                             choiceB: "Привлекательности женщин",
                             choiceC: "Уровня моря")
    
    let question8 = Question(question: "Какой титул имел Дон Кихот?",
                             rightAnswer: "Идальго",
                             choiceA: "Барон",
                             choiceB: "Маркиз",
                             choiceC: "Вождь")
    
    let question9 = Question(question: "Кто автор антиутопического романа \"О дивный новый мир\"?",
                             rightAnswer: "Олдос Хаксли",
                             choiceA: "Рэй Брэдбери",
                             choiceB: "Джордж Оруэлл",
                             choiceC: "Сомерсет Моэм")
    
    let question10 = Question(question: "Как называется самая глубокая точка поверхности Земли, находящаяся на дне Марианской впадины?",
                              rightAnswer: "Бездна Челленджера",
                              choiceA: "Филиппинская плита",
                              choiceB: "Кермадек",
                              choiceC: "Черное Логово")
    
    // MARK: Major Methods
    
    func getQuestions() -> [Question] {
        [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10]
    }
}
