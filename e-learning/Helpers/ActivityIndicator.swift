//
//  ActivityIndicator.swift
//  e-learning
//
//  Created by hussein abed on 2/15/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
    
        UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        
        uiView.startAnimating()
    }
}
