//
//  SwiftManager.swift
//  MIDI_APP
//
//  Created by Federico Foglietta on 21/10/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import RealmSwift

class DBManager{
    
    static let shared = DBManager()
    private let db = Firestore.firestore()
    
    init(){}
    
    private func getCurrentRealm() -> Realm {
        return try! Realm()
    }
    
    func storeCurrentUser(uid: String) {
        let user = User()
        user.uid = uid
        let realm = getCurrentRealm()
        try! realm.write {
            realm.add(user)
        }
    }
    
    func getCurrentUserId() -> String? {
        if let user = Auth.auth().currentUser{
            return user.uid;
        }
        if let user = getCurrentUserFromRealm() {
            return user.uid
        }
        return nil
    }
    
    func getCurrentUser() -> User? {
        if let user = Auth.auth().currentUser{
            let realmUser = User()
            realmUser.email = user.email
            realmUser.uid = user.uid
            return realmUser;
        }
        if let user = getCurrentUserFromRealm() {
            return user
        }
        return nil
    }
    
    func getCurrentUserFromRealm() -> User? {
        let users = getCurrentRealm().objects(User.self)
        return users.first
    }
    
    func getConcertoList(completion: @escaping ([Concert]) -> Void) {
        if let uid = getCurrentUserId() {
            let campo = self.db.collection("users").document(uid)
            campo.collection("concerti").getDocuments() { (querySnapshot, err) in
                
                if let err = err {
                    let realm = self.getCurrentRealm()
                    let predicate = NSPredicate(format: "owner.uid = %@", self.getCurrentUserId()!)
                    let list = Array(realm.objects(Concert.self).filter(predicate))
                    completion(list)
                } else {
                    let list = querySnapshot!.documents.map { (doc) -> Concert in
                        let concert = Concert(value: doc.data())
                        concert.nome = doc.documentID
                        concert.owner = self.getCurrentUserFromRealm()
                        print(concert)
                        return concert
                    }
                    completion(list)
                }
            }
        }
    }
    
    func getSongsByConcert(concert: Concert, completion: @escaping ([Song]) -> Void) {
        if let uid = getCurrentUserId() {
            let campo = self.db.collection("users").document(uid)
            campo.collection("concerti").document(concert.nome!).collection("canzoni").getDocuments() { (querySnapshot, err) in
                
                if let err = err {
                    let realm = self.getCurrentRealm()
                    let predicate = NSPredicate(format: "concert.uid = %@", concert.nome!)
                    let list = Array(realm.objects(Song.self).filter(predicate))
                    completion(list)
                } else {
                    let list = querySnapshot!.documents.map { (doc) -> Song in
                        let song = Song(value: doc.data())
                        song.title = doc.documentID
                        song.concert = concert
                        print(song)
                        return song
                    }
                    completion(list)
                }
            }
        }
    }
    
    func getInfosetBySong(song: Song, completion: @escaping ([Infoset]) -> Void) {
        if let uid = getCurrentUserId() {
            let campo = self.db.collection("users").document(uid)
            campo.collection("concerti").document(song.concert!.nome!).collection("canzoni").document(song.title!).collection("infoset").getDocuments() { (querySnapshot, err) in
                
                if let err = err {
                    let realm = self.getCurrentRealm()
                    let predicate = NSPredicate(format: "song.uid = %@", song.title!)
                    let list = Array(realm.objects(Infoset.self).filter(predicate))
                    completion(list)
                } else {
                    let list = querySnapshot!.documents.map { (doc) -> Infoset in
                        let infoset = Infoset(value: doc.data())
                        infoset.index = doc.documentID
                        infoset.song = song
                        print(infoset)
                        return infoset
                    }
                    completion(list)
                }
            }
        }
    }
    
    func writeConcerto(nome : String){
        if let uid = getCurrentUserId() {
            let campo = self.db.collection("users").document(uid)
            
            campo.collection("concerti").document(nome).setData([
                "name": "name",
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
            
            let concert = Concert()
            concert.nome = nome
            concert.owner = getCurrentUserFromRealm()
            let realm = getCurrentRealm()
            try! realm.write {
                realm.add(concert)
            }
        }
    }
    
    func writeCanzone(titolo:String,nome: String) {
        
        if let uid = getCurrentUserId() {
            let campo = self.db.collection("users").document(uid)
            
            let concert = campo.collection("concerti").document(titolo)
                concert.collection("canzoni").document(nome).setData(["nome" : nome])
            
            for n in 1...5 {
                campo.collection("concerti").document(titolo).collection("canzoni").document(nome).collection("infoset").document(String(n)).setData([
                    "ch": "",
                    "prg": "",
                    "volume": "",
                ])
            }
            
            
        }
    }
    func writeInfoset(titolo:String,song:String,chCollection: [UITextField],prgCollection:[UITextField],volumeCollection:[UITextField]){
        
        if let uid = getCurrentUserId() {
            let campo = self.db.collection("users").document(uid)
            
            campo.collection("concerti").document(titolo).collection("canzoni").document(song).setData(["nome" : song])
            
            for n in 0...4 {
                campo.collection("concerti").document(titolo).collection("canzoni").document(song).collection("infoset").document(String(n+1)).setData([
                    "ch": chCollection[n].text ?? "",
                    "prg": prgCollection[n].text ?? "",
                    "volume": volumeCollection[n].text ?? "",
                ])
            }
            
            
        }
    }
    
}
