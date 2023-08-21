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

    event Admitted(string indexed _name, string _gender, uint _age, uint indexed _id);

    constructor(address _principal) {
        principal = _principal;
    }

    modifier onlyOwner() {
        require(msg.sender == principal);
        _;
    }

    // add a student 
    function addStudent(string memory _name, string memory _gender, uint _age) external onlyOwner {
        id = id + 1; // assigning to storgage
        uint _id = id; // raeding from storage
        Student storage newStudent = idToStudent[_id];
        newStudent.name = _name;
        newStudent.age = _age;
        newStudent.gender = _gender;

        // emit the event
        emit Admitted(_name, _gender, _age, _id);
    }
}
