//
//  LocationManager.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private var locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("Hello")
        case .restricted:
            print("Hello")

        case .denied:
            print("Hello")

        case .authorizedAlways:
            print("Hello")

        case .authorizedWhenInUse:
            print("Hello")

        @unknown default:
            print("Hello")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}
