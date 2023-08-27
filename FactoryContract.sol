// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./StudentDetails.sol";

contract FactoryContract {

    StudentDetails[] Details;

    function createFactoryContract() external returns (StudentDeatails newDetails) {
        // craete a new contarct and assign the address to newDatils
        newDetails = new studentDetails(msg.sender);
        // push the newDetails to the state
        Details.push(newDetails);
    }

    function sdStore(uint _studentdetailsIndex, uint _newDetails) public {
        StudentDetails newDetails = Details[_studentdetailsIndex];
        newDetails.store(_newDetails);
    }

    // Get the set student detail
    function sdGet(uint _studentDetailsIndex) public returns(uint) {
        StudentDetails newDetails = Details[_studentDetailsIndex];
        return newDetails.retrieve();

    }

}