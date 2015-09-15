defmodule Sequence do
	def computeSequence([head|tail]) do
		tuple = %{:max => head, :min => head, :average => head, :length => 1}
		computeSequence(tail, tuple)
	end

	def computeSequence([head|tail], accumulator) do
		tuple = %{
			:max => if (accumulator[:max] < head) do head else accumulator[:max] end,
			:min => if (accumulator[:min] > head) do head else accumulator[:min] end,
			:average => accumulator[:average]+head,
			:length => accumulator[:length]+1
		}
		computeSequence(tail, tuple)
	end

	def computeSequence([], accumulator) do
		tuple = %{
			:max => accumulator[:max],
			:min => accumulator[:min],
			:average => accumulator[:average] / accumulator[:length],
			:length => accumulator[:length]
		}
	end

	def computeSequence([]) do
		raise ArgumentError, message: "invalid empty list"
	end

	def computeSequence(nil) do
		raise ArgumentError, message: "invalid nil list"
	end
end
