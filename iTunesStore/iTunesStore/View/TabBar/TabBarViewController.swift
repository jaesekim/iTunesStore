//
//  TabBarViewController.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    enum TabBarItem: CaseIterable {
        case search
        case bookmark
        
        var screen: UIViewController {
            switch self {
            case .search:
                return SearchViewController()

            case .bookmark:
                return BookmarkViewController()
            }
        }
        
        var title: String {
            switch self {
            case .search:
                return "검색"
            case .bookmark:
                return "북마크"
            }
        }
        
        var iconInactive: UIImage? {
            switch self {
            case .search:
                return UIImage(systemName: "magnifyingglass")
            case .bookmark:
                return UIImage(systemName: "book")
            }
        }
        
        var iconActive: UIImage? {
            switch self {
            case .search:
                return UIImage(systemName: "magnifyingglass")
            case .bookmark:
                return UIImage(systemName: "book.fill")
            }
        }
    }

    private func setTabBar() {
        var tabList: [UIViewController] = []
        tabBar.tintColor = .systemBlue
        
        for item in TabBarItem.allCases {
            // NavigationController 달아주기
            let tabVC = UINavigationController(
                rootViewController: item.screen
            )

            tabVC.tabBarItem.selectedImage = item.iconActive
            tabVC.tabBarItem.image = item.iconInactive
            tabVC.tabBarItem.title = item.title

            tabList.append(tabVC)
        }
        viewControllers = tabList

        // tabBar 글자 색상 변경
        let tabProxy = UITabBarItem.appearance()
        tabProxy.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.systemBlue],
            for: .selected
        )

        // navigationViewController로 화면 전환 시 탭 사라지지 않도록
        // hidesBottomBarWhenPushed = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
}
