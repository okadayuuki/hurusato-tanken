class Scene < ApplicationRecord
	enum each_scene: {
	一人でゆっくり:1, 家族でまったり:2, 友人とワイワイ:3, 恋人とドキドキ:4, 美味しいものを食べたい:5, 綺麗な景色が見たい:6, なんとなく出かけたい:7
}
end
