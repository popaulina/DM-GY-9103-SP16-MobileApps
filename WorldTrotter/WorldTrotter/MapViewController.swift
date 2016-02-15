//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Paulina Levit on 2/12/16.
//  Copyright © 2016 Paulina Levit. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController {
    
    var mapView : MKMapView!
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        //Set it as the view
        view = mapView
    
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        //let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        //let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)

        
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
}
