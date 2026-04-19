// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    mapping(address => bool) public members;

    function addMember(address a) external {
        members[a] = true;
    }

    function isMember(address a) external view returns (bool){
        return members[a];
    }
    
    function removeMember(address a) external {
        members[a] = false;
    }
}