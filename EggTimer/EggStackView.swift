//
//  EggStackView.swift
//  EggTimer
//
//  Created by Ilyas Tyumenev on 30.07.2023.
//

import UIKit
import SnapKit

protocol EggStackViewDelegate: AnyObject {
    func eggStackView(_ view: EggStackView, buttonPressed button: UIButton)
}

class EggStackView: UIView {
    
    weak var delegate: EggStackViewDelegate?
    
    // MARK: - Private Properties
    private let softEggView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let softEggImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "soft_egg")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let softEggButton: UIButton = {
        let button = UIButton()
        button.setTitle("Soft", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let mediumEggView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let mediumEggImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "medium_egg")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mediumEggButton: UIButton = {
        let button = UIButton()
        button.setTitle("Medium", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let hardEggView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let hardEggImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hard_egg")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let hardEggButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hard", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var eggStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        [self.softEggView,
         self.mediumEggView,
         self.hardEggView].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        addSubview(eggStackView)
        softEggView.addSubview(softEggImageView)
        softEggView.addSubview(softEggButton)
        mediumEggView.addSubview(mediumEggImageView)
        mediumEggView.addSubview(mediumEggButton)
        hardEggView.addSubview(hardEggImageView)
        hardEggView.addSubview(hardEggButton)
    }
    
    private func addConstraints() {
        eggStackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        softEggButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        softEggImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        mediumEggButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        mediumEggImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        hardEggButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        hardEggImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - Target Actions
private extension EggStackView {
    
    @objc func buttonPressed(_ button: UIButton) {
        delegate?.eggStackView(self, buttonPressed: button)
    }
}
