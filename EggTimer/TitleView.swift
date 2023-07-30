//
//  TitleView.swift
//  EggTimer
//
//  Created by Ilyas Tyumenev on 30.07.2023.
//

import UIKit
import SnapKit

class TitleView: UIView {

    // MARK: - Properties
    private let titleView: UIView = {
        let view = UIView()
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(titleView)
        titleView.addSubview(titleLabel)
    }

    private func addConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
