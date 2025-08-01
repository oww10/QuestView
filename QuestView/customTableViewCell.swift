import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let titleLable = UILabel()
    let subtitleLable = UILabel()
    let iconImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    private func setupUI(){
        //이미지 뷰 설정
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        contentView.addSubview(iconImageView)
        
        //제목 라벨 설정
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.font = UIFont.boldSystemFont(ofSize: 17)
        contentView.addSubview(titleLable)
        
        //부제목 라벨 설정
        subtitleLable.translatesAutoresizingMaskIntoConstraints = false
        subtitleLable.font = UIFont.systemFont(ofSize: 13)
        subtitleLable.textColor = .gray
        contentView.addSubview(subtitleLable)
        
        //오토레이아웃 설정
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 44),
            iconImageView.heightAnchor.constraint(equalToConstant: 44),
            
            titleLable.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            subtitleLable.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            subtitleLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 4),
            subtitleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            subtitleLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
