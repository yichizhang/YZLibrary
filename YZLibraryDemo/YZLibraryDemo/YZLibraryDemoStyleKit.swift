/*
 
 Copyright (c) 2015 Scinece guy
 
 */


import UIKit

public class YZLibraryDemoStyleKit : NSObject {

    //// Cache

    private struct Cache {
        static var imageOfOne: UIImage?
        static var oneTargets: [AnyObject]?
        static var imageOfTwo: UIImage?
        static var twoTargets: [AnyObject]?
        static var imageOfThree: UIImage?
        static var threeTargets: [AnyObject]?
    }

    //// Drawing Methods

    public class func drawOne() {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Text Drawing
        let textRect = CGRectMake(0, 0, 25, 25)
        var textTextContent = NSString(string: "1")
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Center

        let textFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 25)!, NSForegroundColorAttributeName: UIColor.blackColor(), NSParagraphStyleAttributeName: textStyle]

        let textTextHeight: CGFloat = textTextContent.boundingRectWithSize(CGSizeMake(textRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, textRect);
        textTextContent.drawInRect(CGRectMake(textRect.minX, textRect.minY + (textRect.height - textTextHeight) / 2, textRect.width, textTextHeight), withAttributes: textFontAttributes)
        CGContextRestoreGState(context)
    }

    public class func drawTwo() {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Text Drawing
        let textRect = CGRectMake(0, 0, 25, 25)
        var textTextContent = NSString(string: "2")
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Center

        let textFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 25)!, NSForegroundColorAttributeName: UIColor.blackColor(), NSParagraphStyleAttributeName: textStyle]

        let textTextHeight: CGFloat = textTextContent.boundingRectWithSize(CGSizeMake(textRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, textRect);
        textTextContent.drawInRect(CGRectMake(textRect.minX, textRect.minY + (textRect.height - textTextHeight) / 2, textRect.width, textTextHeight), withAttributes: textFontAttributes)
        CGContextRestoreGState(context)
    }

    public class func drawThree() {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Text Drawing
        let textRect = CGRectMake(0, 0, 25, 25)
        var textTextContent = NSString(string: "3")
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Center

        let textFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 25)!, NSForegroundColorAttributeName: UIColor.blackColor(), NSParagraphStyleAttributeName: textStyle]

        let textTextHeight: CGFloat = textTextContent.boundingRectWithSize(CGSizeMake(textRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, textRect);
        textTextContent.drawInRect(CGRectMake(textRect.minX, textRect.minY + (textRect.height - textTextHeight) / 2, textRect.width, textTextHeight), withAttributes: textFontAttributes)
        CGContextRestoreGState(context)
    }

    //// Generated Images

    public class var imageOfOne: UIImage {
        if Cache.imageOfOne != nil {
            return Cache.imageOfOne!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(25, 25), false, 0)
            YZLibraryDemoStyleKit.drawOne()

        Cache.imageOfOne = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return Cache.imageOfOne!
    }

    public class var imageOfTwo: UIImage {
        if Cache.imageOfTwo != nil {
            return Cache.imageOfTwo!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(25, 25), false, 0)
            YZLibraryDemoStyleKit.drawTwo()

        Cache.imageOfTwo = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return Cache.imageOfTwo!
    }

    public class var imageOfThree: UIImage {
        if Cache.imageOfThree != nil {
            return Cache.imageOfThree!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(25, 25), false, 0)
            YZLibraryDemoStyleKit.drawThree()

        Cache.imageOfThree = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return Cache.imageOfThree!
    }

    //// Customization Infrastructure

    @IBOutlet var oneTargets: [AnyObject]! {
        get { return Cache.oneTargets }
        set {
            Cache.oneTargets = newValue
            for target: AnyObject in newValue {
                target.setImage(YZLibraryDemoStyleKit.imageOfOne)
            }
        }
    }

    @IBOutlet var twoTargets: [AnyObject]! {
        get { return Cache.twoTargets }
        set {
            Cache.twoTargets = newValue
            for target: AnyObject in newValue {
                target.setImage(YZLibraryDemoStyleKit.imageOfTwo)
            }
        }
    }

    @IBOutlet var threeTargets: [AnyObject]! {
        get { return Cache.threeTargets }
        set {
            Cache.threeTargets = newValue
            for target: AnyObject in newValue {
                target.setImage(YZLibraryDemoStyleKit.imageOfThree)
            }
        }
    }

}

@objc protocol StyleKitSettableImage {
    func setImage(image: UIImage!)
}

@objc protocol StyleKitSettableSelectedImage {
    func setSelectedImage(image: UIImage!)
}

