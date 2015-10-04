class RankingController < ApplicationController
  def have
    @have_top10_ids = Have.group(:item_id).order("count_item_id DESC").limit(10).count(:item_id).keys
    @have_top10_items = Item.find(@have_top10_ids).sort_by{|o| @have_top10_ids.index(o.id)}
  end

  def want
    @want_top10_ids = Want.group(:item_id).order("count_item_id DESC").limit(10).count(:item_id).keys
    @want_top10_items = Item.find(@want_top10_ids).sort_by{|o| @want_top10_ids.index(o.id)}
  end
end
