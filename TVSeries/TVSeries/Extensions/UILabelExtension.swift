//
//  UILabelExtension.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 16/05/22.
//

import UIKit

extension UILabel {
    func setHtmlContent(htmlString: String) {
        if let data = htmlString.data(using: .utf16, allowLossyConversion: false) {
            if let attributedString = try? NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                attributedString.setFontFace(font: UIFont.systemFont(ofSize: 16), color: .label)
                attributedText = attributedString
            }
        }
    }
}
