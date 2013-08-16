class Application
	class InvalidCodeError < StandardError; end
	class InvalidEventError < StandardError; end
	class InvalidUserError < StandardError; end
	class InvalidVoteError < StandardError; end
	# attendee votes twice for the same user
	class DuplicatedVoteError < InvalidVoteError; end
	# attendee casts more than 3 votes
	class NoVotesAvailableError < InvalidVoteError; end
end