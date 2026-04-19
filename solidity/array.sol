// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] members;

    constructor() {
        members.push(msg.sender);
    }

    function isMember(address isMem) external view returns (bool) {
        for(uint i=0; i<members.length; i++){
            if(members[i] == isMem) return true;
        }

        return false;
    }

    function removeLastMember() external {
        require(this.isMember(msg.sender));
        members.pop();
    }

    function addMember(address newMem) external {
        require(this.isMember(msg.sender));
        members.push(newMem);
    }
    
}