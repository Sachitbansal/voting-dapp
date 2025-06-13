// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        string name;
        uint voteCount;
    }

    Proposal[] public proposals;

    constructor(string[] memory proposalNames) {
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    mapping(address => bool) public hasVoted;

    function vote(uint proposalIndex) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(proposalIndex < proposals.length, "Invalid proposal");

        hasVoted[msg.sender] = true;
        proposals[proposalIndex].voteCount++;
    }

    function getWinningProposal() public view returns (string memory winnerName) {
        uint winningVoteCount = 0;
        uint winningIndex = 0;

        for (uint i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningIndex = i;
            }
        }

        winnerName = proposals[winningIndex].name;
    }

    
}
