class Comment < ActiveRecord::Base
  validates :name, 
            :email, 
            :body, 
            :presence => true 
  validate :article_should_be_published
  after_create :email_article_author
  
  belongs_to :article
  
  def article_should_be_published 
    errors.add(:article_id, 'is not published yet')  
  end
  def after_create 
    puts 'We will notify the author in Chapter 9'
  end
  
  def email_article_author 
    puts 'We will notify #{article.user.email} in Chapter 9'
  end
end
