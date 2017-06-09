class Request < ApplicationRecord


  belongs_to :user
  belongs_to :property

validates :end_date, :presence => true
validates :start_date, :presence => true

    validate :ends_after_starts
          def ends_after_starts
            if end_date < start_date
              errors.add(:end_date, 'must be greater than start date')
            end
          end
end
