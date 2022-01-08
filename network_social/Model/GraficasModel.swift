import Foundation

struct Data_Graficas: Codable
{
    let colors: [String]?
    let questions:[DataQuestions]?
    
}

struct DataQuestions: Codable
{
    let total: Int?
    let text: String?
    let chartData: [DataChart]?

}

struct DataChart: Codable
{
    let text: String?
    let percetnage: Int?
}




