defmodule SequenceTest do
	use ExUnit.Case

	test "compute sequence happy day" do
		result = Sequence.computeSequence([20, -10, 5, 4, 3, 9])
		assert result[:max] == 20
		assert result[:min] == -10
		assert_in_delta result[:average], 5.1666, 0.001
		assert result[:length] == 6
	end

	test "compute empty sequence" do
	  	assert catch_error( Sequence.computeSequence([]) ).message == "invalid empty list"
	end

	test "compute nil sequence" do
	  	assert catch_error( Sequence.computeSequence(nil) ).message == "invalid nil list"
	end
end