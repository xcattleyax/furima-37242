class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ' },
    { id: 8, name: 'ホビー・グッズ' },
    { id: 9, name: '家電・スマホ・カメラ' },
    { id: 10, name: 'スポーツ・レジャー' },
    { id: 11, name: 'ハンドメイド' },
    { id: 12, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :items
  end