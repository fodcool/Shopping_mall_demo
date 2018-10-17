# 实现 Rails 的自定义 Validation.
class Post < Base
  attr_accessor :title, :content
  validates :title, :content, Presence: true

  def initialize(title, content)
    @title = title
    @content = content
  end
end
