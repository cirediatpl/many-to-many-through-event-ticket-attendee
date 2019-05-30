class Event

    attr_reader :name
    attr_accessor :total_cost, :ticket_price

    @@all = []

    def initialize(name, total_cost, ticket_price)
        @name = name
        @total_cost = total_cost
        @ticket_price = ticket_price
        @@all << self
    end

    def self.all
        @@all
    end

    def sell_to_break_even
        remaining_cost = @total_cost - (@ticket_price * Ticket.all.count)
        remaining_cost / @ticket_price
    end

    def attendees
        Ticket.all.select do |ticket|
            ticket.event == self
        end.map do |ticket|
            ticket.attendee
        end
    end

    def average_age
        sum = attendees.map do |attendee|
            attendee.age
        end.inject do |sum, element|
            sum + element
        end.to_f
        sum / attendees.size
    end
end

# Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0. 
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
