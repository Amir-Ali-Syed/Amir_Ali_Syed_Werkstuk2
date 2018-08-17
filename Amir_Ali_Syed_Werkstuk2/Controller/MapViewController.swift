//
//  MapViewController.swift
//  Amir_Ali_Syed_Werkstuk2
//
//  Created by Amir Ali Syed on 17/08/2018.
//  Copyright © 2018 Amir Ali Syed. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func refreshButton(_ sender: UIBarButtonItem) {
        self.viewDidLoad()
    }
    
    let locationManager = CLLocationManager()
    var stations = [Station]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.navigationItem.title = NSLocalizedString("app_title", comment: "")
        
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
        
        let jsonURL = "https://api.jcdecaux.com/vls/v1/stations?apiKey=6d5071ed0d0b3b68462ad73df43fd9e5479b03d6&contract=Bruxelles-Capitale"
        let url = URL(string: jsonURL)
        
        URLSession.shared.dataTask(with: url!) { (data, responds, error) in
            do {
                self.stations = try JSONDecoder().decode([Station].self, from: data!)
                
                for station in self.stations {
                    let locationCoordinate = CLLocationCoordinate2DMake((station.position?.lat)!, (station.position?.lng)!)
                    let stationAnnotation = Annotation(title: station.name, subtitle: station.address, coordinate: locationCoordinate)
                    self.mapView.addAnnotation(stationAnnotation)
                }
            }
            catch {
                print("Could not preform action due to error")
            }
        }.resume()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let point = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        point.canShowCallout = true
        point.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        } else {
            return point
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let annotationView = view.annotation
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        vc.name = ((annotationView?.title!)!)
        vc.address =  ((annotationView?.subtitle!)!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
}
