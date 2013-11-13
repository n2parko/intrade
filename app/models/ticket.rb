class Ticket < ActiveRecord::Base
    belongs_to :movies, :dependent => :delete

    before_create :set_default_fields
    
    scope :available, -> {where(onmarket: true)}
    scope :unavailable, -> {where(onmarket: false)}
    scope :bid, -> {where(buy: true)}
    scope :ask, -> {where(buy: false)}
    
    
    def set_default_fields
        self.onmarket = true
    end


end
