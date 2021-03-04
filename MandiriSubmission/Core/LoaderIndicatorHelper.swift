//
//  LoaderIndicatorHelper.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
import SwiftUI

struct LoaderIndicatorHelper: UIViewRepresentable {

  func makeUIView(context: UIViewRepresentableContext<LoaderIndicatorHelper> ) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: .large)
  }
  
  func updateUIView( _ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoaderIndicatorHelper> ) {
 
    uiView.startAnimating()
  }

}
