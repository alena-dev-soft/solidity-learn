// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingWhitelist {
    struct Candidate { 
        string name;
        uint256 voteCount;
    }

    address public owner;

    mapping(address => bool) public hasVoted;
    mapping(address => bool) public whiteList;

    Candidate[] public candidates;
    bool public votingOpen; 

    constructor (string[] memory _names) {
        owner = msg.sender;
        votingOpen = true;
        for(uint i = 0; i < _names.length; i++) {
            candidates.push(Candidate({
                name: _names[i],
                voteCount: 0
            }));
        }
    }

    function addToWhitelist(address _voter) public {
        require(msg.sender == owner, "Only owner");
        whiteList[_voter] = true;
    }

    function vote(uint256 _candidateIndex) public {
        require(votingOpen, "Voting is closed!");
        require(whiteList[msg.sender], "Not whitelisted!");
        require(!hasVoted[msg.sender], "Already voted");
        require(_candidateIndex < candidates.length, "Invalid candidate!");

        hasVoted[msg.sender] = true;
        candidates[_candidateIndex].voteCount += 1;
    }

    function closeVoting() public { 
        require(msg.sender == owner, "Only owner");
        votingOpen = false;
    }

    function getCandidate(uint256 _index) public view returns (string memory, uint256)
    {
        return (candidates[_index].name, candidates[_index].voteCount);
    }
}