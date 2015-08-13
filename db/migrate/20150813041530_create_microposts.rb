class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content

#      t.timestamps null: false
      t.timestamps
      t.index [:user_id, :created_at] #複合インデックス:投稿を指定ユーザーで絞り込んだ後、作成時間で検索や並び替えを行うという処理がより速く行えるようになります。
    end
  end
end
