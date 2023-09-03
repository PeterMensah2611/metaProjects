// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract errors {
    address public owner;
    string public name;


    // use require
    function usingRequire(string memory _name) public { 
        require( owner == msg.sender, "permission denied, you are not the owner");
        name = _name;
    }
    

    // use revert
      function usingRevert(string memory _name) public { 
        if (owner != msg.sender) {
            revert( "not allowed");
        }
        name = _name;
    }

    // use assert
      function usingAssert(string memory _name) public { 
        assert(owner == msg.sender);
        name = _name;
    }

    constructor(){
        owner= msg.sender;
    }
}
