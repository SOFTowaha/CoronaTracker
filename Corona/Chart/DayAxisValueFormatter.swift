//
//  DayAxisValueFormatter.swift
//  Corona
//
//  Created by Mohammad on 3/5/20.
//  Copyright © 2020 Samabox. All rights reserved.
//

import Foundation

import Charts

class DayAxisValueFormatter: NSObject, IAxisValueFormatter {
	private static let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
								 "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

	weak var chartView: BarLineChartViewBase?

	init(chartView: BarLineChartViewBase) {
		self.chartView = chartView
	}

	public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
		let date = Date.fromReferenceDays(days: Int(value))
		let month = Calendar.posix.component(.month, from: date)
		let monthName = Self.months[month - 1]

		if let chartView = chartView,
			chartView.visibleXRange > 30 * 6 {
			let year = Calendar.posix.component(.year, from: date)
			return "\(monthName) \(year)"
		}

		let dayOfMonth = Calendar.posix.component(.day, from: date)
		return "\(monthName) \(dayOfMonth)"
	}
}
