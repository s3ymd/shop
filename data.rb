# データお初期化します。
# このファイルの実行の仕方：
# bin/rails r data.rb

User.destroy_all
Item.destroy_all
Category.destroy_all
Order.destroy_all
OrderDetail.destroy_all

User.create(email: 'x', password: 'x',
name: '山田 太郎(管理者)', birthday: '1980/12/31',
postal_code: '999-9999', address: '東京都新宿区', tel: '090-9999-9999', admin: true)

User.create(email: 'y', password: 'y',
name: '山田 二郎(一般ユーザ)', birthday: '1981/12/31',
postal_code: '999-9999', address: '東京都新宿区', tel: '090-9999-9999', admin: false)

c1 = Category.create(name: '飲み物')
c2 = Category.create(name: 'お菓子')
c3 = Category.create(name: '米')
Category.create(name: '麺類')
Category.create(name: '肉')
Category.create(name: '魚介類')
Category.create(name: '野菜')
Category.create(name: 'フルーツ')
Category.create(name: '調味料')
Category.create(name: '健康食品')

all_categories = [c1, c2, c3]
all_items = [
	[
		['伊藤園 健康ミネラルむぎ茶 (2L×6本)×2箱', '水分と適度なミネラルを補給できる、香ばしく甘いコクの健康ミネラルむぎ茶飲料です。', 1832],
		['アサヒ 六条麦茶 (2L×6本)×2箱', '「無添加※」「六条大麦100%」「ノンカフェイン」のおいしさを、お届けしています。', 1991],
		['キリン アルカリイオンの水 (2L×6本)×2箱', '大自然が育んだ天然水をアルカリイオン化。 ミネラルバランスのよいpH8.8～9.4の、口あたりまろやかでからだにやさしい軟水に仕上げました。 ', 984]
	],
	[
		['カルビー ポテトチップス うすしお味 60g×12個', '石垣島のサンゴ礁にはぐくまれた豊かな海水から作られた石垣の塩(R)を使用して、まろやかな味わいに仕上げました。', 1416],
		['江崎グリコ ビスコ 保存缶 30枚', '昭和8年より発売している「ビスコ坊や」でおなじみの「ビスコ」の保存食。', 453],
		['ヤマザキナビスコ リッツ チーズサンド 9枚入り', 'クラッカーと言えば、やっぱりリッツ。世界で愛される、かわらないおいしさ。', 2264]
	],
	[
		['北海道産 無洗米 ななつぼし5kg 平成26年産', 'ツヤ、粘り、甘味のバランスが抜群で、どんな料理にも合い、冷めても美味しいお米と評判です', 1780],
		['タニタ食堂の金芽米 4.5kg (無洗米/ブレンド米) 平成26年産', 'あのタニタ食堂が選んだお米がついにご家庭でも! ', 2102],
		['宮城県産 無洗米 つや姫 10kg 平成26年産', '「コシヒカリ」と比べて粘りが少なく、あっさりし た食感です。', 2199]
	]
]

all_categories.zip(all_items).each do |category, category_items|
	category_items.each do |item|
	  Item.create do |i|
	    i.name = item[0]
	    i.description = item[1]
	    i.price = item[2]
	    i.quantity = rand(10) * 10
	    i.category = category
	  end
	end
end
