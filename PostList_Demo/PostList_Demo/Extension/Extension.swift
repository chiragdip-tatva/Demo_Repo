//
//  extension.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//
import UIKit


//tableview extensions
extension UITableView {
    private func register<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        register(UINib.init(nibName: String(describing: T.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: T.self))
    }
    func dequeueCellFromNIB<T: UITableViewCell>(_: T.Type) -> T {
        if let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T{
            return cell
        }else{
            register(T.self)
            return dequeueCellFromNIB(T.self)
        }
    }
}

//make a Created At string to show...
extension String{
    var createdAtString: String {
        if self != "" {
            if let date = DateFormatter.sourceDateFormatter.date(from: self) as Date? {
                return "Created At " + DateFormatter.sourceDateFormatter.string(from: date)
            }else{
                return ""
            }
        }else{
            return ""
        }
    }
}

//Static date formatters
extension DateFormatter{
    static var sourceDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }()
    
    static var destDateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
}
