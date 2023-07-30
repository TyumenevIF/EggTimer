//
//  ViewController.swift
//  EggTimer
//
//  Created by Ilyas Tyumenev on 07.04.2023.
//

import UIKit
import SnapKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Properties
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 203/255, green: 242/255, blue: 252/255, alpha: 1.0)
        return view
    }()
    
    private let titleView = TitleView()
    private let eggStackView = EggStackView()
    private let timerView = TimerView()
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 20
        [self.titleView,
         self.eggStackView,
         self.timerView].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    var player: AVAudioPlayer!
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        eggStackView.delegate = self
        setViews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func playAlarmSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    private func setViews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            timerView.progressView.progress = Float(secondPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleView.titleLabel.text = "Done"
            playAlarmSound()
        }
    }
}

// MARK: - EggStackViewDelegate
extension ViewController: EggStackViewDelegate {
    
    func eggStackView(_ view: EggStackView, buttonPressed button: UIButton) {
        timer.invalidate()
        let hardness = button.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timerView.progressView.progress = 0.0
        secondPassed = 0
        titleView.titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
}
