class Item < ActiveRecord::Base
  serialize :raw_info , Hash

  has_many :ownerships  , foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships

  # アイテムをWantしているユーザー一覧をwant_usersとして、仮想的な中間テーブルwantsを用いて取得する
  has_many :wants, class_name: "Want", foreign_key: "item_id", dependent: :destroy
  has_many :want_users , through: :wants, source: :user

  # アイテムをHaveしているユーザー一覧をhave_usersとして、仮想的な中間テーブルhavesを用いて取得する
  has_many :haves, class_name: "Have", foreign_key: "item_id", dependent: :destroy
  has_many :have_users , through: :haves, source: :user

end
