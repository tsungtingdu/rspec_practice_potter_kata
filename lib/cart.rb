# 每一本哈利波特定價為 100 元，為了推廣哈利波特，書店訂定了以下優惠：
# 購買 2 本不同集的哈利波特可以打 5% 折扣
# 購買 3 本不同集的哈利波特可以打 10% 折扣
# 購買 4 本不同集的哈利波特可以打 20% 折扣
# 購買 5 本不同集的哈利波特可以打 25% 折扣

class Cart

  PRICE = 100

  def add(items)
    @ordered_items = items.map{ |key,value| value }.delete_if{ |i| i == 0 } #將資料轉換為陣列後，刪除客戶沒有買的哈利波特集數
  end

  def calculate
    total = 0

    while @ordered_items.size > 0         # 當客戶還有書籍尚未結帳時
        
      case @ordered_items.size
        when 3
          total = total + 3 * PRICE * 0.90
        when 2
          total = total + 2 * PRICE * 0.95
        else
          total = total + PRICE 
      end  
      @ordered_items = @ordered_items.map{ |i| i -= 1 } # 刪除已計算過的書籍
      @ordered_items = @ordered_items.delete_if{ |i| i == 0 } # 把已經結完的集數刪除
    end

    return total
  end

end