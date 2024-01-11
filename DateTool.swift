import Foundation

extension Date {
    var dateString: String {
        formatted(
            .dateTime
            .weekday(.wide)
            .month()
            .day()
        )
    }
}
