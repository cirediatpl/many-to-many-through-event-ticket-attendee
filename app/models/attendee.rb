class Attendee

    attr_reader :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def events
        all_tickets = Ticket.all.select do |ticket|
            ticket.attendee == self
        end
        all_tickets.map do |ticket|
            ticket.event
        end
    end

    def money_spent
        sum = events.map do |event|
            event.ticket_price
        end.inject do |sum, element|
            sum + element
        end
    end

end

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events