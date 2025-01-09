//
//  TwoHolidayWidget.swift
//  CalendarWidgetExtension
//
//  Created by 황석현 on 12/2/24.
//

import SwiftUI
import WidgetKit

// TODO: 두 지점의 휴일을 보여준다
struct TwoHolidayEntryView: View {
    @AppStorage("isNormal", store: UserDefaults(suiteName: Utillity.appGroupId)) var isCostco: Bool = false
    @AppStorage("selectedBranch", store: UserDefaults(suiteName: Utillity.appGroupId)) var selectedBranch: Int = 0
    @State private var selectedMartType: MartType = .normal
    
    var entry: TwoHolidayEntry
    var config: MonthConfig
    var widgetDataMapper: WidgetDataMapper
    let startDate = Date()

    init(entry: TwoHolidayEntry) {
        self.entry = entry
        self.config = MonthConfig.determineConfig(from: entry.date)
        self.widgetDataMapper = WidgetDataMapper()
    }
    
    var body: some View {
        
        VStack {
            Text(entry.holidayText[0])
            Text(entry.holidayText[1])
            Text(entry.holidayText[2])
        }
        
    }
}

struct TwoHolidayWidget: Widget {
    let kind = "TwoHoliday"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: TwoHoliydayWidgetProvider()) { entry in
            TwoHolidayEntryView(entry: entry)
        }
        .configurationDisplayName("지점별 휴무위젯")
        .description("두 개의 지점 휴무일을 확인하는 위젯이에요!")
        .supportedFamilies([.systemSmall])
    }
}
