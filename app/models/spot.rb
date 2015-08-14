class Spot < ActiveRecord::Base

	validates :position_x, :position_y,presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 100,less_than_or_equal_to: 900  }
	validate  :collision_check #validates if there is a collision between new/updated and already stored spot


	def collision_check
		
		#second validation required due to lack of possibility to change validations order 
		#(when one of position is empty it is not possible to check collisions)				
		if (!self.position_x.nil? && (self.position_x.is_a? Integer) && !self.position_y.nil? && (self.position_y.is_a? Integer))
			Spot.all.each do |spot|
				# self excluded from collision check to be able to update position by very small (less than 24) value
				if (spot.id != self.id && !(spot.position_x > self.position_x+24 || spot.position_x+24 < self.position_x || spot.position_y > self.position_y+24 || spot.position_y+24 < self.position_y))
					errors.add(:base, "Coordinates error: collision with existing spot: #{spot.name} ")
				end

			end
		end	
	end


end
