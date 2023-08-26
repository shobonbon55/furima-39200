class Condition < ActiveHash::Base
  self.data = [
      { id: 1, name: '---' },
      { id: 2, name: '新商品' },
      { id: 3, name: '未使用に近い' },
      { id: 4, name: '目立った傷や汚れなし' },
      { id: 5, name: '傷や汚れあり' },
      { id: 6, name: '全体的に状態が悪い' } 
  ]

  include ActiveHash::Associations
  has_many :articles

end
