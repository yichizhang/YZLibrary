YZLibrary
=========

This is the code that helped me in the past few years of iOS development.

## Install
Simply use [CocoaPods](http://cocoapods.org/):

`pod 'YZLibrary'`

If you are using Swift, add this to your bridging header:

```objc
#import <YZLibrary/YZLibraryImportAll.h>
```


## Some sample usage

```objc
NSArray *fruitArray = @[@"Apple", @"Banana", @"Cherry"];
NSString *fruitForToday = [fruitArray yz_randomObject];
```


Files
=============
 

### UICollectionViewCell+YZLibrary 
### UITableViewCell+YZLibrary

These are for the Lazy Loading of Table View/ Collection View Cells.

Usage:

Set the NIB file name and the identifier to be the same as the class name of the cell.

For example, your custom Table View/ Collection View Cell class is 'MyAwesomeCell'. Put the user interface in 'MyAwesomeCell.xib'; change the cell identifier to 'MyAwesomeCell'.

Then you can register NIB and load the cells VERY LAZILIY:

```swift
    override func viewDidLoad() {
        super.viewDidLoad()

        ...

        // Register cell classes
		MyAwesomeCell.yz_registerForCollectionView(self.collectionView)
		
		...
    }

    override func collectionView(
		collectionView: UICollectionView,
		cellForItemAtIndexPath indexPath: NSIndexPath
		) -> UICollectionViewCell {

        let cell =
		MyAwesomeCell.yz_dequeueFromCollectionView(
			collectionView,
			forIndexPath: indexPath
		)
    
        // Configure the cell
        ...
    
        return cell
    }
```

This can save you a lot of time, but it can be a bad practice.

You can provide custom NIB file name and your own identifier:

```swift

    
    let myAwesomeIdentifier = "AwesomeIdentifier"
    let myAwesomeNibName = "AwesomeNib"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ...

        // Register cell classes
        MyAwesomeCell.yz_registerForCollectionView(
            self.collectionView,
            withNibFileName: myAwesomeNibName,
            andReuseIdentifier: myAwesomeIdentifier
        )
        
        ...
    }

    override func collectionView(
        collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath
        ) -> UICollectionViewCell {

        let cell =
        MyAwesomeCell.yz_dequeueFromCollectionView(
            collectionView,
            forIndexPath: indexPath,
            andReuseIdentifier: myAwesomeIdentifier
        )
    
        // Configure the cell
        ...
    
        return cell
    }
```

### NSArray+YZLibrary 
### NSDictionary+YZLibrary 
### NSObject+YZLibrary 
### NSString+YZLibrary 
### UIButton+YZLibrary 
### UIColor+YZLibrary 
### UIImage+YZLibrary 
### UIImageView+YZLibrary  
### UIView+YZLibrary 
### UIViewController+YZLibrary 
### YZFileHelper 
### YZLibrary 
### YZRandom 
### YZStringHelper 
### YZTimeHelper 
