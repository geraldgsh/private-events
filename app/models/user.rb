class User < ApplicationRecord
  has_many :events, :foreign_key => :creator_id
  has_many :invites, :foreign_key => :attendee_id
  has_and_belongs_to_many :attended_events, through: :invites, source: :attended_events
  before_create :create_remember_token
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }

  def previous_events
    self.attended_events.past
  end

  def upcoming_events
    self.attended_events.upcoming
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
    self.invites.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    self.invites.find_by(attended_event_id: event.id).destroy
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_token)
  end

end
