import UIKit
import MapKit

final class CityMapViewController: UIViewController {
    
    private var pin: MKPointAnnotation?
    var viewModel: CityMapViewModelProtocol = CityMapViewModel() {
        didSet {
            setAnnotation()
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
    
    private func setupMainView() {
        view.addSubview(mapView)
        setupConstraints()
        setAnnotation()
    }
    
    private lazy var mapView: MKMapView = {
       let mapView = MKMapView().withAutoLayout()
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.center = view.center
        return mapView
    }()
    
    // MARK: - Private methods
    
    private func setupConstraints() {
        var constraints = mapView.constraintsToFillSuperviewHorizontally()
        constraints += mapView.constraintsToFillSuperviewVertically()
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setAnnotation() {
            guard let coordinates = viewModel.annotationCoordinates else {
                return
            }
        
            pin = MKPointAnnotation()
            let region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(region, animated: true)
            pin!.coordinate = coordinates
            mapView.addAnnotation(pin!)
    }
}

// MARK: - CitySelectionDelegate

extension CityMapViewController: CitySelectionDelegate {
    func citySelected(newCity: City) {
        viewModel.selectedCity = newCity
    }
}

// MARK: - MKMapViewDelegate

extension CityMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let aboutViewController = AboutViewController()
        let presenter = Presenter(view: aboutViewController, model: Model())
        aboutViewController.presenter = presenter
        self.navigationController?.pushViewController(aboutViewController, animated: true)
    }
}
