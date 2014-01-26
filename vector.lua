local Vector = {}

function Vector:c(x, y)
	local vector = {x=x, y=y}


	function vector:isZero()
		return self.x == 0 and self.y == 0
	end

	function vector:len()
		return math.sqrt(self.x^2 + self.y^2)
	end

	function vector:lenSq()
		return self.x^2 + self.y^2
	end

	function vector:dot(otherVec)
		return self.x*otherVec.x + self.y*otherVec.y

		--positive: same direction
		--negative: different direction
		--zero: perpendicular
	end

	function vector:cross(otherVec)
		return a.x*b.y - a.y*b.x

		--positive: otherVec is CW of vector
		--negative: otherVec is CCW of vector
		--zero: parallel
	end

	function vector:distance(otherVec)
		return math.sqrt((otherVec.x-self.x)^2 + (otherVec.y-self.y)^2)
	end

	function vector:distanceSq(otherVec)
		return (otherVec.x-self.x)^2 + (otherVec.y-self.y)^2
	end

	function vector:equals(otherVec)
		return self.x == otherVec.x and self.y == otherVec.y
	end

	function vector:print()
		print("x: " .. self.x .. ", y:" .. self.y)
	end

	-- CREATES NEW VECTOR

	function vector:perpCCW()
		return Vector:c(-self.y, self.x)
	end

	function vector:perpCW()
		return Vector:c(self.y, -self.x)
	end

	function vector:getReverse()
		return Vector:c(-self.x, -self.y)
	end

	function vector:add(otherVec)
		return Vector:c(self.x + otherVec.x, self.y + otherVec.y)
	end

	function vector:sub(otherVec)
		return Vector:c(self.x - otherVec.x, self.y - otherVec.y)
	end

	function vector:mult(scalar)
		return Vector:c(self.x*scalar, self.y*scalar)
	end

	function vector:div(scalar)
		return Vector:c(self.x/scalar, self.y/scalar)
	end

	function vector:norm()
		return self:div(self:len())
	end

	function vector:scale(mag)
		return (self:norm()):mult(mag)
	end

	-- MODIFIES ORIGINAL VECTOR

	function vector:iadd(otherVec)
		self.x, self.y = self.x + otherVec.x, self.y + otherVec.y
	end

	function vector:isub(otherVec)
		self.x, self.y = self.x - otherVec.x, self.y - otherVec.y
	end

	function vector:imult(scalar)
		self.x, self.y = self.x*scalar, self.y*scalar
	end

	function vector:idiv(scalar)
		self.x, self.y = self.x/scalar, self.y/scalar
	end

	function vector:zero()
		self.x, self.y = 0, 0
	end

	function vector:inorm()
		self:idiv(self:len())
	end

	function vector:truncate(maxMag)
		if self:len() > maxMag then
			self:inorm()
			self:imult(maxMag)
		end
	end

	return vector
end

return Vector