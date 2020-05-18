#カテゴリー

#子/孫カテゴリー
books =     [{children: '教科書', grandchildren: ['教科書（経営学部）', '教科書（経済学部）', '教科書（コミュニケーション学部）',
                                                  '教科書（現代法学部）','教科書（その他）']},
             {children: '参考書'},
             {children: '漫画',   grandchildren: ['少年漫画', '青年漫画', '少女漫画', 'その他(漫画)']},
             {children: '雑誌'},
             {children: '小説'},
             {children: 'ビジネス書'},
             {children: 'その他(本)'}]

mens =      [{children: '服', grandchildren: ['トップス', 'ジャケット/アウター', 'パンツ', 'その他(服/メンズ)']},
             {children: '靴', grandchildren: ['革靴', 'スニーカー', 'サンダル', 'その他(靴/メンズ)']},
             {children: 'カバン', grandchildren: ['リュック', 'トートバッグ', 'ショルダーバッグ', 'ボストンバッグ', 'ボディーバッグ',
                                                 'ビジネスバッグ', 'その他(カバン/メンズ)']},
             {children: 'アクセサリー'},
             {children: '小物'},
             {children: 'その他(メンズ)'}]
        
ledys =     [{children: '服', grandchildren: ['トップス', 'ジャケット/アウター', 'パンツ', 'その他(服/レディース)']},
             {children: '靴', grandchildren: ['革靴', 'スニーカー', 'サンダル', 'その他(靴/レディース)']},
             {children: 'カバン', grandchildren: ['リュック', 'トートバッグ', 'ショルダーバッグ', 'ボストンバッグ', 'ボディーバッグ',
                                                 'ビジネスバッグ', '(カバン/レディース)']},
             {children: 'アクセサリー'},
             {children: '小物'},
             {children: 'その他(レディース)'}]

gadgets =   [{children: 'スマホアクセサリー'},
             {children: 'PC'},
             {children: 'カメラ'},
             {children: 'オーディオ機器', grandchildren: ['イヤホン', 'ヘッドホン', 'スピーカー', 'ポータブルプレーヤー', 'その他(オーディオ機器)']},
             {children: 'その他(ガジェット)'}]


#親カテゴリー
categorys = [{parent: '本',         childs: books},
             {parent: 'メンズ',     childs: mens},
             {parent: 'レディース', childs: ledys},
             {parent: 'ガジェット', childs: gadgets},
             {parent: 'その他'}]
             
             
#カテゴリー作成
categorys.each do |category|
  
  #親とその子カテゴリーをcategorysから一つずつ取り出して親カテゴリーを作る
  p = Category.create!(name: category[:parent])
  if category.has_key?(:childs)
    category[:childs].each do |child|
      
      #childsから子カテゴリーを取り出して、親と関連付けて子カテゴリーを作る
      c = p.children.create!(name: child[:children])
      
      #そのカテゴリーに孫がもしいれば、子カテゴリーから孫カテゴリーを作り出す
      if child.has_key?(:grandchildren)
        child[:grandchildren].each do |g|
          c.children.create!(name: g)
        end
      end
    end
  end
end


1.step(20,4) do |n|
  Product.create!(
    name: Faker::Movies::BackToTheFuture.character,
    description: Faker::Movies::BackToTheFuture.quote,
    images: [open("#{Rails.root}/db/fixtures/seeds_images/image_#{n}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+1}.jpeg"),
                    open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+2}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+3}.jpeg"),],
    seller_id: 1,
    category_id: Faker::Number.between(from: 1, to: 73),
    price: Faker::Number.between(from: 100, to: 50000))
end


21.step(40,4) do |n|
  Product.create!(
    name: Faker::Movies::BackToTheFuture.character,
    description: Faker::Movies::BackToTheFuture.quote,
    images: [open("#{Rails.root}/db/fixtures/seeds_images/image_#{n}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+1}.jpeg"),
                    open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+2}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+3}.jpeg"),],
    seller_id: 2,
    category_id: Faker::Number.between(from: 1, to: 73),
    price: Faker::Number.between(from: 100, to: 50000))
end

41.step(60,4) do |n|
  Product.create!(
    name: Faker::Movies::BackToTheFuture.character,
    description: Faker::Movies::BackToTheFuture.quote,
    images: [open("#{Rails.root}/db/fixtures/seeds_images/image_#{n}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+1}.jpeg"),
                    open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+2}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+3}.jpeg"),],
    seller_id: 3,
    category_id: Faker::Number.between(from: 1, to: 73),
    price: Faker::Number.between(from: 100, to: 50000))
end

61.step(80,4) do |n|
  Product.create!(
    name: Faker::Movies::BackToTheFuture.character,
    description: Faker::Movies::BackToTheFuture.quote,
    images: [open("#{Rails.root}/db/fixtures/seeds_images/image_#{n}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+1}.jpeg"),
                    open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+2}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+3}.jpeg"),],
    seller_id: 4,
    category_id: Faker::Number.between(from: 1, to: 73),
    price: Faker::Number.between(from: 100, to: 50000))
end

81.step(100,4) do |n|
  Product.create!(
    name: Faker::Movies::BackToTheFuture.character,
    description: Faker::Movies::BackToTheFuture.quote,
    images: [open("#{Rails.root}/db/fixtures/seeds_images/image_#{n}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+1}.jpeg"),
                    open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+2}.jpeg"), open("#{Rails.root}/db/fixtures/seeds_images/image_#{n+3}.jpeg"),],
    seller_id: 5,
    category_id: Faker::Number.between(from: 1, to: 73),
    price: Faker::Number.between(from: 100, to: 50000))
end

User.create!(
  name: 'admin',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
  )