class Post < ApplicationRecord
	belongs_to :user
	belongs_to :eria, optional: true
	belongs_to :scene, optional: true
	has_many :likes, dependent: :destroy

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	has_many :comments, dependent: :destroy

	attachment :image

	enum eria_id: {
	  	北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
	    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
	    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
	    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
	    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
	    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
	    徳島県:36,香川県:37,愛媛県:38,高知県:39,
	    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
	  }

	enum scene_id: {
		一人でゆっくり:1, 家族でまったり:2, 友人とワイワイ:3, 恋人とドキドキ:4, 美味しいものを食べたい:5, 綺麗な景色が見たい:6, なんとなく出かけたい:7
	}

	def self.search(search)
		if search
			where(['title LIKE ?', "%#{search}%"])
		else
			Post.all
		end
	end
	def Post.search(eria_id, eria_scene_all)
		if eria_scene_all == 1
			Post.where(eria_id: eria_id, eria_scene_all: 1)
		else
			Post.all
		end
	end

	# def Post.search(scene_id, eria_scene_all)
	# 	if eria_scene_all == "2"
	# 		Post.where(scene_id: scene_id)
	# 	else
	# 		Post.all
	# 	end
	# end

	# def Post.search(eria_id, scene_id, eria_scene_all)
	# 	if eria_scene_all == "3"
	# 		Post.where([:eria_id][:scene_id], eria_id, scene_id)
	# 	else
	# 		Post.all
	# 	end
	# end
end
