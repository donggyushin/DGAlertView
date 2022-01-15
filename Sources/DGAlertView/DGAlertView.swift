import UIKit

public class DGAlertView: UIViewController {
    
    private lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.3
        view.frame = self.view.frame
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped)))
        return view
    }()
    
    private let contentsView: UIView
    
    public init(_ contentsView: UIView) {
        self.contentsView = contentsView
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(dimmedView)
        view.addSubview(contentsView)
        
        contentsView.clipsToBounds = true
        contentsView.layer.cornerRadius = 20
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        contentsView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        contentsView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        contentsView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let viewPan = UIPanGestureRecognizer(target: self, action: #selector(contentsViewPanGestured))
        viewPan.delaysTouchesBegan = true
        viewPan.delaysTouchesEnded = true
        contentsView.addGestureRecognizer(viewPan)
        
        DispatchQueue.main.async {
            self.showAnimtation()
        }
        
    }
    
    private func showAnimtation() {
        dimmedView.alpha = 0
        contentsView.transform = .init(translationX: 0, y: view.frame.height)
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0.3
            self.contentsView.transform = .init(translationX: 0, y: 0)
        }
    }
    
    public func hide() {
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0.0
            self.contentsView.transform = .init(translationX: 0, y: self.view.frame.height)
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
    
    @objc private func dimmedViewTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false)
    }
    
    @objc private func contentsViewPanGestured(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: contentsView)
        let translationY = translation.y
        let velocity = sender.velocity(in: contentsView)
        switch sender.state {
        case .ended:
            
            if (velocity.y > 1500 && translationY > 0) || translationY > 280 {
                self.hide()
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.contentsView.transform = .init(translationX: 0, y: 0)
                }
            }
            
        default:
            if translationY > 0 {
                contentsView.transform = .init(translationX: 0, y: translationY)
            } else {
                if translationY > -150 {
                    contentsView.transform = .init(translationX: 0, y: translationY)
                }
            }
        }
    }
    
}
