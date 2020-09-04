//
//  ActivityIndicator.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    //@Binding var isLoading:Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let uiView:UIActivityIndicatorView = UIActivityIndicatorView()
        return uiView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}
