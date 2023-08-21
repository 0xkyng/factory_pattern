// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentDetails {

    address principal;

    struct Student {
        string name;
        uint age;
        string gender;
    }

    uint id;

    mapping (uint => Student) idToStudent;

    constructor(address _principal) {
        principal = _principal;
    }

    modifier onlyOwner() {
        require(msg.sender == principal);
        _;
    }
}
