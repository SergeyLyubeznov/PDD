//
//  PDDSource.h
//  PDD
//
//  Created by Sergey Lyubeznov on 28/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import <Foundation/Foundation.h>

const NSInteger countRules = 25;

NSString *const rulesName [] = {
    @"1. Общие положения",
    @"2. Общие обязанности водителей",
    @"3. Применение специальных сигналов",
    @"4. Обязанности пешеходов",
    @"5. Обязанности пассажиров",
    @"6. Сигналы светофора и регулировщика",
    @"7. Применение аварийной сигнализации и знака аварийной остановки",
    @"8. Начало движения, маневрирование",
    @"9. Расположение транспортных средств на проезжей части",
    @"10. Скорость движения",
    @"11. Обгон, опережение, встречный разъезд",
    @"12. Остановка и стоянка",
    @"13. Проезд перекрестков",
    @"14. Пешеходные переходы и места остановок маршрутных транспортных средств",
    @"15. Движение через железнодорожные пути",
    @"16. Движение по автомагистралям",
    @"17. Движение в жилых зонах",
    @"18. Приоритет маршрутных транспортных средств",
    @"19. Пользование внешними световыми приборами и звуковыми сигналами",
    @"20. Буксировка механических транспортных средств",
    @"21. Учебная езда",
    @"22. Перевозка людей",
    @"23. Перевозка грузов",
    @"24. Дополнительные требования к движению велосипедистов и водителей мопедов",
    @"25. Дополнительные требования к движению гужевых повозок, а также к прогону животных"};


NSString *const ruleItems1 [] = {@"1.1",@"1.2",@"1.3",@"1.4",@"1.5",@"1.5.1",@"1.6",};
NSString *const ruleItems2 [] = {@"2.1",@"2.1.1",@"2.1.2",@"2.2",@"2.3",@"2.3.1",@"2.3.2",@"2.3.3",@"2.4",@"2.5",@"2.6",@"2.6.1",@"2.7"};
NSString *const ruleItems3 [] = {@"3.1",@"3.2",@"3.3",@"3.4",@"3.5",@"3.6"};
NSString *const ruleItems4 [] = {@"4.1",@"4.2",@"4.3",@"4.4",@"4.5",@"4.6",@"4.7",@"4.8"};
NSString *const ruleItems5 [] = {@"5.1",@"5.2"};
NSString *const ruleItems6 [] = {@"6.1",@"6.2",@"6.3",@"6.4",@"6.5",@"6.6",@"6.7",@"6.8",@"6.9",@"6.10",@"6.11",@"6.12",@"6.13",@"6.14",@"6.15",@"6.16"};
NSString *const ruleItems7 [] = {@"7.1",@"7.2",@"7.3"};
NSString *const ruleItems8 [] = {@"8.1",@"8.2",@"8.3",@"8.4",@"8.5",@"8.6",@"8.7",@"8.8",@"8.9",@"8.10",@"8.11",@"8.12"};
NSString *const ruleItems9 [] = {@"9.1",@"9.2",@"9.3",@"9.4",@"9.5",@"9.6",@"9.7",@"9.8",@"9.9",@"9.10",@"9.11",@"9.12"};
NSString *const ruleItems10 [] = {@"10.1",@"10.2",@"10.3",@"10.4",@"10.5"};
NSString *const ruleItems11 [] = {@"11.1",@"11.2",@"11.3",@"11.4",@"11.5",@"11.6",@"11.7"};
NSString *const ruleItems12 [] = {@"12.1",@"12.2",@"12.3",@"12.4",@"12.5",@"12.6",@"12.7",@"12.8"};
NSString *const ruleItems13 [] = {@"13.1",@"13.2",@"13.3",@"13.4",@"13.5",@"13.6",@"13.7",@"13.8",@"13.9",@"13.10",@"13.11",@"13.12",@"13.13"};
NSString *const ruleItems14 [] = {@"14.1",@"14.2",@"14.3",@"14.4",@"14.5",@"14.6",@"14.7"};
NSString *const ruleItems15 [] = {@"15.1",@"15.2",@"15.3",@"15.4",@"15.5"};
NSString *const ruleItems16 [] = {@"16.1",@"16.2",@"16.3"};
NSString *const ruleItems17 [] = {@"7.1",@"17.2",@"17.3",@"17.4"};
NSString *const ruleItems18 [] = {@"18.1",@"18.2",@"18.3"};
NSString *const ruleItems19 [] = {@"19.1",@"19.2",@"19.3",@"19.4",@"19.5",@"19.6",@"19.7",@"19.8",@"19.9",@"19.10",@"19.11"};
NSString *const ruleItems20 [] = {@"20.1",@"20.2",@"20.3",@"20.4"};
NSString *const ruleItems21 [] = {@"21.1",@"21.2",@"21.3",@"21.4",@"21.5",@"21.6"};
NSString *const ruleItems22 [] = {@"22.1",@"22.2",@"22.3",@"22.4",@"22.5",@"22.6",@"22.7",@"22.8",@"22.9"};
NSString *const ruleItems23 [] = {@"23.1",@"23.2",@"23.3",@"23.4",@"23.5"};
NSString *const ruleItems24 [] = {@"24.1",@"24.2",@"24.3",@"24.4",@"24.5",@"24.6",@"24.7",@"24.8",@"24.9",@"24.10"};
NSString *const ruleItems25 [] = {@"25.1",@"25.2",@"25.3",@"25.4",@"25.5",@"25.6"};


