// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;

	function createVote(Choices choice) external {
		require(!this.hasVoted(msg.sender));
		// TODO: add a new vote to the array of votes state variable
		votes.push(Vote(choice, msg.sender));
	}
	function hasVoted(address ad) public view returns (bool) {
		for(uint i=0; i<votes.length; i++){
			if(votes[i].voter == ad) return true;
		}
		return false;
	}

	function findChoice(address ad) external view returns (Choices){
		for(uint i=0; i<votes.length; i++){
			if(votes[i].voter == ad) return votes[i].choice;
		}
	}

	function changeVote(Choices c) external {
		require(this.hasVoted(msg.sender));

		for(uint i=0; i<votes.length; i++){
			if(votes[i].voter == msg.sender) {
				votes[i].choice = c;
			}
		}
	}
}