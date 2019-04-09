//
//  CSVReader.swift
//  Players
//
//  Created by Andrey Filonov on 08/04/2019.
//  Copyright © 2019 Andrey Filonov. All rights reserved.
//

import Foundation

struct CSVReader {
    
    /// Reads records from specified csv file into [Player]
    static func loadRecords(fileName: String, fileType: String) -> [Player]? {
        var players = [Player]()
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                print("File \(fileName).\(fileType) does not exist")
                return nil
        }
        do {
            let data = try String(contentsOfFile: filepath, encoding: .utf8)
            let rows = data.components(separatedBy: "\n").map{ $0.components(separatedBy: ",") }
            for row in rows {
                if row[0] == "Number", row[1] == "First_Name" { continue }
                if let player = convertData(input: row) {
                    players.append(player)
                }
            }
            return players
        } catch {
            print("File read error for file \(filepath)")
            return nil
        }
    }
    
    /// Converts specified [String] into Player recored
    private static func convertData(input: [String]) -> Player? {
        guard input.count == 8 else {
            return nil
        }
        
        let number = Int(input[0]) ?? Int.max //Converts Number field to Int. If "NA" then converts to max number to put it to the end of the list
        let yearsInLeague = Int(input[6]) ?? 0 //Converts Years_in_League field to Int. If "R" then converts to 0
        
        let dateString = input[4]
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        formatter.dateFormat = "MMMM d y"
        guard let DobDate = formatter.date(from: dateString) else { //Converts DOB from String to Date to enable sort by DOB
            return nil
        }
        let country = input[5].uppercased()
        let college = input[7].trimmingCharacters(in: .newlines)
        let player = Player(number: input[0],
                            convertedNumber: number,
                            firstName: input[1],
                            lastName: input[2],
                            position: input[3],
                            dob: input[4],
                            convertedDob: DobDate,
                            country: country,
                            yearsInLeague: input[6],
                            convertedYearsInLeague: yearsInLeague,
                            college: college,
                            age: ageFromDob(dob: DobDate))
        return player
    }
    
    /// Calculates current age for specified date of birth
    private static func ageFromDob(dob: Date) -> String {
        let now = Date()
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year], from: dob, to: now)
        if let age = ageComponents.year {
            return String(age)
        } else {
            return ""
        }
    }
}
