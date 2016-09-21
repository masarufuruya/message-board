class Message < ActiveRecord::Base
    # 必須入力、20文字以上
    validates :name, length: { maximum: 20 }, presence: true
    # 必須入力、2文字以上,30文字以下
    validates :body, length: { minimum: 2, maximun: 30 }, presence: true
end
