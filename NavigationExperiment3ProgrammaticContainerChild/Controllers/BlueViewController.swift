//
//  BlueViewController.swift
//  NavigationExperiment3ProgrammaticContainerChild
//
//  Created by Albert Yu on 5/7/20.
//  Copyright © 2020 AlbertDemo. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    var mainCollectionView: UICollectionView! = nil
    enum Section: String, CaseIterable {
        case friends = "Brand1"
        case roommates = "Brand2"
        case bestFriends = "Brand3"
    }
    
    
    var dataSource: UICollectionViewDiffableDataSource<Section, String>! = nil
    var brandCollectionView: UICollectionView! = nil
    
    
    override func viewDidLoad() {
        navigationItem.title = "Brands"
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        // Do any additional setup after loading the view.
    }


}


extension BlueViewController {
    // MARK: - Configure Collection View 1
    func configureCollectionView() {
      let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
      view.addSubview(collectionView)
      collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
      collectionView.backgroundColor = .systemBackground
      collectionView.delegate = self
        collectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier: BrandCollectionViewCell.reuseIdentifier)
      collectionView.register(Brand2CollectionViewCell.self, forCellWithReuseIdentifier: Brand2CollectionViewCell.reuseIdentifier)
        self.mainCollectionView = collectionView // Uses that variable up top
    }
    
    // MARK: - Layout Switch 2
    func generateLayout() -> UICollectionViewLayout {
      let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
        layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
        // let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500

        let sectionLayoutKind = Section.allCases[sectionIndex]
        switch (sectionLayoutKind) {
        case .friends: return self.generateBrandLayout()
        case .roommates: return self.generateBrand2Layout(isWide: false)
        case .bestFriends: return self.generateBrandLayout()
        }
      }
      return layout
    }
    
    // MARK: - Layout 1
      func generateBrandLayout() -> NSCollectionLayoutSection {
      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalWidth(1.0))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.2),
        heightDimension: .absolute(100))
      let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
      group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5)

//      let headerSize = NSCollectionLayoutSize(
//        widthDimension: .fractionalWidth(1.0),
//        heightDimension: .estimated(44))
//      let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//        layoutSize: headerSize,
//        elementKind: AlbumsViewController.sectionHeaderElementKind,
//        alignment: .top)

      let section = NSCollectionLayoutSection(group: group)
      // section.boundarySupplementaryItems = [sectionHeader]
      section.orthogonalScrollingBehavior = .groupPaging

      return section
    }
    
        // MARK: - Layout 2
    func generateBrand2Layout(isWide: Bool) -> NSCollectionLayoutSection {
      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

        let groupHeight = NSCollectionLayoutDimension.fractionalWidth(0.5)
      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: groupHeight)
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: isWide ? 4 : 2)

//      let headerSize = NSCollectionLayoutSize(
//        widthDimension: .fractionalWidth(1.0),
//        heightDimension: .estimated(44))
//      let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//        layoutSize: headerSize,
//        elementKind: AlbumsViewController.sectionHeaderElementKind,
//        alignment: .top)

      let section = NSCollectionLayoutSection(group: group)
      // section.boundarySupplementaryItems = [sectionHeader]

      return section
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, String> {
      let friends = ["Albert","Ryan","Minja","Alex","Calla","Colan"]
      let roommates = ["Cool", "Me Too", "Me Three", "Me for balance"]
      let bestFriends = ["Apple", "Oranges", "Limes"]

      var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
      snapshot.appendSections([Section.friends])
      snapshot.appendItems(friends)

      snapshot.appendSections([Section.roommates])
      snapshot.appendItems(roommates)

      snapshot.appendSections([Section.bestFriends])
      snapshot.appendItems(bestFriends)
      return snapshot
    }
    
    // MARK: - Configure Data Source
    func configureDataSource() {
      dataSource = UICollectionViewDiffableDataSource
        <Section, String>(collectionView: mainCollectionView) {
          (collectionView: UICollectionView, indexPath: IndexPath, random: String) -> UICollectionViewCell? in

          let sectionType = Section.allCases[indexPath.section]
          switch sectionType {
          case .friends:
            guard let cell = collectionView.dequeueReusableCell(
              withReuseIdentifier: BrandCollectionViewCell.reuseIdentifier,
              for: indexPath) as? BrandCollectionViewCell else { fatalError("Could not create new cell") }
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
//            cell.title = albumItem.albumTitle
            //print("EXECUTED DUN FUN")
//            cell.totalNumberOfImages = albumItem.imageItems.count
            return cell

          case .roommates:
            guard let cell = collectionView.dequeueReusableCell(
              withReuseIdentifier: Brand2CollectionViewCell.reuseIdentifier,
              for: indexPath) as? Brand2CollectionViewCell else { fatalError("Could not create new cell") }
//            cell.featuredPhotoURL = albumItem.imageItems[0].thumbnailURL
//            cell.title = albumItem.albumTitle
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell

          case .bestFriends:
            guard let cell = collectionView.dequeueReusableCell(
              withReuseIdentifier: BrandCollectionViewCell.reuseIdentifier,
              for: indexPath) as? BrandCollectionViewCell else { fatalError("Could not create new cell") }
//            cell.featuredPhotoURL = albumItem.imageItems[0].thumbnailURL
//            cell.title = albumItem.albumTitle
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell

          }
      }
      
      // For headers?
//      dataSource.supplementaryViewProvider = { (
//        collectionView: UICollectionView,
//        kind: String,
//        indexPath: IndexPath) -> UICollectionReusableView? in
//
//        guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
//          ofKind: kind,
//          withReuseIdentifier: HeaderView.reuseIdentifier,
//          for: indexPath) as? HeaderView else { fatalError("Cannot create header view") }
//
//        supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
//        return supplementaryView
//      }

      // MARK: - Apply
      let snapshot = snapshotForCurrentState()
        //print("Diff Applied - Albert")
      // APPLY
      dataSource.apply(snapshot, animatingDifferences: false)
    }
}



extension BlueViewController: UICollectionViewDelegate {
}
