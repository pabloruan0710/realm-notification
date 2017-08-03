//
//  ViewController.swift
//  RalmNotification
//
//  Created by Pablo Ruan on 03/08/17.
//  Copyright © 2017 pabloruan. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
    var Pessoas : Results<Pessoa> = {
        let realm = try! Realm()
        return realm.objects(Pessoa.self).sorted(byKeyPath: "id")
    }()

    var token : NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotification()
        novaPessoa()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    fileprivate func setupNotification(){
        token = Pessoas.addNotificationBlock({(changes: RealmCollectionChange) in
            switch changes {
            case .initial(_):
                print("Inicial")
            case .update(_, deletions:_, insertions: _, modifications: let modificados):
                print("\nModificados: ")
                print(modificados)
            case .error(_):
                fatalError("crash")
            }
            print("\n")
            print(changes)
        })
    }
    
    fileprivate func novaPessoa(){
        
        let realm = try! Realm()
        let newPeople = Pessoa()
        newPeople.nome = "Pablo"
        newPeople.id = 1
        try? realm.write {
            realm.add(newPeople, update: true)
        }
        
        let cachePeople = Pessoa()
        cachePeople.nome = "Pablo"
        cachePeople.id = 1
        try? realm.write {
            realm.add(cachePeople, update: true)
        }
        
        let cachePeople1 = Pessoa()
        cachePeople1.nome = "Pablo"
        cachePeople1.id = 1
        try? realm.write {
            realm.add(cachePeople1, update: true)
        }
        
        let cachePeople2 = Pessoa()
        cachePeople2.nome = "Pablo"
        cachePeople2.id = 1
        try? realm.write {
            realm.add(cachePeople2, update: true)
        }
    }
    
}

