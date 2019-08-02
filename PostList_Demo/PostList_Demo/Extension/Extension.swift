//
//  extension.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//
import UIKit


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
