#カテゴリー
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
  p = ProductCategory.create!(name: category[:parent])
  if category.has_key?(:childs)
    category[:childs].each do |child|
      
      #childsからこカテゴリーを取り出して、親と関連付けて子カテゴリーを作る
      c = p.children.create!(name: child[:children])
      
      #そのカテゴリーに孫がもしいれば子カテゴリーから孫カテゴリーを作り出す
      if child.has_key?(:grandchildren)
        child[:grandchildren].each do |g|
          c.children.create!(name: g)
        end
      end
    end
  end
end
