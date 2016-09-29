require 'byebug'
class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :not_duplicate_response
  validate :no_author_responses

  belongs_to :answer,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :AnswerChoice

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer,
    source: :question

  has_one :poll,
  through: :question,
  source: :poll

  def no_author_responses
    byebug
    if self.question.poll.author_id == self.user_id
      self.errors[:author] << 'can\'t respond to own poll'
    end
  end


  def sibling_responses
    self.question.responses.where.not("responses.id = ?", self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def not_duplicate_response
    if sibling_responses.exists?(user_id: self.user_id)
      self.errors[:duplicate] << 'responses are not accepted'
    end
  end


end
