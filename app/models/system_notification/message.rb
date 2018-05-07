module SystemNotification
  class Message < ActiveRecord::Base
    belongs_to :user, required: true, class_name: '::User'

    scope :unseen, -> { where(seen: false) }
    scope :not_dismissed, -> { where(dismiss: false) }

    validates :level, presence: true
    enum level: %i[debug info warning error level0 level1 level2 level3]

    before_create :priority_handler
    # toggle the seen flag on
    def seen!
      self.seen = true
      save!
    end

    # toggle the dismiss flag on
    def dismiss!
      self.dismiss = true
      save!
    end

    protected

    # auto priority handler
    #  on Creation of new notification,
    #  if there is another active one with lower or equal priority, dismiss it
    # if there is another with greater priority, just set ourself as dismissed.
    #
    def priority_handler
      self.class.where(user_id: user_id, dismiss: false).each do |m|
        if m['level'] <= self['level']
          m.dismiss = true
          m.save
        else
          # we got already a message with greater priority
          self.dismiss = true
        end
      end
    end
  end
end
