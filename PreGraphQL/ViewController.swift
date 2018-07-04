//
//  ViewController.swift
//  PreGraphQL
//
//  Created by Masakazu Sano on 2018/06/15.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
import Apollo

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        testRequest()
    }
}

extension ViewController {
    fileprivate func testRequest() {
        
        // ----------------------------
        // 01: 下準備

        // リクエスト先URL
        guard let url = URL(string: "http://localhost:8080/graphql") else { return } // NOTE: HTTPの場合はATSを無効化しておくこと
        
        // ApolloClient
        let applo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: .default))

        
        // ----------------------------
        // 02: リクエストを飛ばす
        
        // リクエスト用クエリの用意。とりあえず全部もらうクエリを叩く
        // PostListViewController.graphqlに記載の「AllPosts」が生成できるようになっている
        let query = AllPostsQuery()
        
        applo.fetch(query: query) { (result, error) in
            guard let result = result else { return }
            print(result.data)
        }
    }
}
