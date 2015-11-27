module SystemNotification
  class Message < ActiveRecord::Base
    belongs_to :user, required: true

    scope :unseen, -> { where(seen: false) }
    scope :not_dismissed?, -> { where(dismiss: false) }

    enum level: [:debug, :info, :warning, :error ,:level0, :level1, :level2, :level3]

  end
end
