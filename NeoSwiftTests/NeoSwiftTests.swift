//
//  NeoSwiftTests.swift
//  NeoSwiftTests
//
//  Created by Andrei Terentiev on 8/19/17.
//  Copyright © 2017 drei. All rights reserved.
//

import XCTest
import NeoSwift

class NeoSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetBlockCount() {
        let exp = expectation(description: "Wait for block count response")
        let neo = NeoClient(seed: "http://seed4.neo.org:10332")
        
        neo.getBlockCount() { count, error in
            assert(count != nil)
            print(count!)
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetBestBlockHash() {
        let exp = expectation(description: "Wait for block hash response")
        let neo = NeoClient(seed: "http://seed4.neo.org:10332")
        
        neo.getBestBlockHash() { hash, error in
            assert(hash != nil)
            print(hash!)
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
     func testGetBlockByHash() {
        let exp = expectation(description: "Wait for block hash response")
        let neo = NeoClient(seed: "http://seed4.neo.org:10332")
        
        neo.getBlockBy(hash: "f7bcd551a40398ce51e65317fc4d2b48bde3743d563af16c2ca145d08b074461") { block, error in
            assert(block != nil)
            print(block!)
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetBlockByIndex() {
        let exp = expectation(description: "Wait for block hash response")
        let neo = NeoClient(seed: "http://seed4.neo.org:10332")
        
        neo.getBlockBy(index: 42) { block, error in
            assert(block != nil)
            print(block!)
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetBlockHashByIndex() {
        let exp = expectation(description: "Wait for block hash response")
        let neo = NeoClient(seed: "http://seed4.neo.org:10332")
    
        neo.getBlockHash(for: 42) { hash, error in
            assert(hash != nil)
            print(hash!)
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testConnectionCount() {
        let exp = expectation(description: "Wait for block count response")
        let neo = NeoClient(seed: "http://seed4.neo.org:10332")
        
        neo.getConnectionCount() { count, error in
            assert(count != nil)
            print(count!)
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetMemPool() {
        let exp = expectation(description: "Wait for block hash response")
        let neo = NeoClient(seed: "http://seed4.neo.org:10332")
        
        neo.getUnconfirmedTransactions() { transactions, error in
            assert(transactions != nil)
            print(transactions!)
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testTransactionForHash() {
        let exp = expectation(description: "Wait for block hash response")
        let neo = NeoClient(seed: "http://seed4.neo.org:10332")
        
        let hash = "2288ba9bd93da4ac4c414048f019300c8adadc6df5e4bfeb6fc79da7f955e638"
        neo.getTransaction(for: hash) { transaction, error in
            assert(transaction != nil)
            print(transaction!)
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testTransactionOutput() {
        let exp = expectation(description: "Wait for block hash response")
        let neo = NeoClient(seed: "http://seed4.neo.org:10332")
        
        let hash = "2288ba9bd93da4ac4c414048f019300c8adadc6df5e4bfeb6fc79da7f955e638"
        let index: Int64 = 0
        neo.getTransactionOutput(with: hash, and: index) { valueOut, error in
            assert(valueOut != nil)
            print(valueOut!)
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetAssets() {
        let exp = expectation(description: "Wait for block hash response")
    
        NeoClient.shared.getAssets(for: "AY4QCsLjUmfkMa775R9Exs85QMpAu6hyPZ", params: []) { json, error in
            exp.fulfill()
            return
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    //I am exposing the following private keys for testing purposes only
    //Please only use them them to send transactions between each other on
    //the test network, and for the love of god never use them for real funds
    
    // TESTPRIVATEKEY1 -> DO NOT USE FOR REAL FUNDS EVER
    //      d59208b9228bff23009a666262a800f20f9dad38b0d9291f445215a0d4542beb        HEX
    //      L4Ns4Uh4WegsHxgDG49hohAYxuhj41hhxG6owjjTWg95GSrRRbLL                    WIF
    //      AMpupnF6QweQXLfCtF4dR45FDdKbTXkLsr                                  ADDRESS
    //      0398b8d209365a197311d1b288424eaea556f6235f5730598dede5647f6a11d99a   PUBKEY
    // TESTPRIVAATEKEY2 -> DO NOT USE FOR REAL FUNDS EVER
    //      e444ec65fbb94aac0e7fc6bd7f0de64f22513d50c022d3d6e159c24e90b54d8d        HEX
    //      L4sSGSGh15dtocMMSYS115fhZEVN9UuETWDjgGKu2JDu59yncyVf                    WIF
    //      ATLoURz25z4PpsrzZmnowRT3dya44LGEpS                                  ADDRESS
    //      03aa0047673b0bf10f936bb45a909bc70eeef396de934429c796ad496d94911820   PUBKEY
    func testSendNeoTransaction() {
        let wifPersonA = "L4Ns4Uh4WegsHxgDG49hohAYxuhj41hhxG6owjjTWg95GSrRRbLL"
        let wifPersonB = "L4sSGSGh15dtocMMSYS115fhZEVN9UuETWDjgGKu2JDu59yncyVf"
        let accountA = Account(wif: wifPersonA)
        let accountB = Account(wif: wifPersonB)
        
        let exp1 = expectation(description: "Wait for transaction one to go through")
        let exp2 = expectation(description: "Wait for transaction two to go through")

        accountA.sendAssetTransaction(asset: .neoAssetId, amount: 1, toAddress: accountB.address) { success, error in
            assert(success ?? false)
            exp1.fulfill()
            accountB.sendAssetTransaction(asset: .neoAssetId, amount: 1, toAddress: accountA.address) {success, error in
                assert(success ?? false)
                exp2.fulfill()
            }
        }
        waitForExpectations(timeout: 50, handler: nil)
    }
    
    func testSendGasTransaction() {
        let wifPersonA = "L4Ns4Uh4WegsHxgDG49hohAYxuhj41hhxG6owjjTWg95GSrRRbLL"
        let wifPersonB = "L4sSGSGh15dtocMMSYS115fhZEVN9UuETWDjgGKu2JDu59yncyVf"
        let accountA = Account(wif: wifPersonA)
        let accountB = Account(wif: wifPersonB)
        
        let exp1 = expectation(description: "Wait for transaction one to go through")
        let exp2 = expectation(description: "Wait for transaction two to go through")
        
        accountA.sendAssetTransaction(asset: .gasAssetId, amount: 1, toAddress: accountB.address) { success, error in
            assert(success ?? false)
            exp1.fulfill()
            accountB.sendAssetTransaction(asset: .gasAssetId, amount: 1, toAddress: accountA.address) {success, error in
                assert(success ?? false)
                exp2.fulfill()
            }
        }
        waitForExpectations(timeout: 50, handler: nil)
    }
}
