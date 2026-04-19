// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {

    //3
    function sendAlert(address hero, uint enemies, bool armed) external {
        (bool success, ) = hero.call(
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed)
        );

        require(success);
    }

    //4
    function relay(address hero, bytes memory data) external {
        // send all of the data as calldata to the hero
        (bool success, ) = hero.call(data);

        require(success);
    }

    //5
    function makeContact(address hero) external {
        // TODO: trigger the hero's fallback function!
        hero.call(
            abi.encodeWithSignature("test(uint256)", 1)
        );

    }
}