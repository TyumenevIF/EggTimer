//
//  TimerView.swift
//  EggTimer
//
//  Created by Ilyas Tyumenev on 30.07.2023.
//

import UIKit
import SnapKit

class TimerView: UIView {

    // MARK: - Properties
    private let timerView: UIView = {
        let view = UIView()
        return view
    }()

    let progressView: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.progress = 0
        progressBar.tintColor = .systemYellow
        progressBar.trackTintColor = .systemGray
        return progressBar
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    private func setSubviews() {
        addSubview(timerView)
        timerView.addSubview(progressView)
    }

    private func setupConstraints() {        
        timerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        progressView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(5)
        }
    }
}
