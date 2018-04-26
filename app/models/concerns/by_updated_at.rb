module Concerns::ByUpdatedAt
  extend ActiveSupport::Concern

  included do
    #Scope
    scope :by_updated_at, -> (start_date = nil, end_date = nil) do
      start_date = Date.parse(start_date).strftime('%Y-%m-%d %H:%M:%S') if start_date
      end_date = Date.parse(end_date).strftime('%Y-%m-%d %H:%M:%S') if end_date

      if start_date and end_date
        where("#{table_name}.updated_at BETWEEN :start_date AND :end_date", start_date: start_date, end_date: end_date)
      elsif start_date
        where("#{table_name}.updated_at >= :start_date", start_date: start_date)
      elsif end_date
        where("#{table_name}.updated_at <= :end_date", end_date: end_date)
      end
    end
  end
end