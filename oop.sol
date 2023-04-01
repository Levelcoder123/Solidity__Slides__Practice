// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract payment {
    address public owner;
   constructor() {
       owner = msg.sender;
   }
   function withdrawTo() public view returns (bool) {
       require(msg.sender == owner, "Admin only");
    //    code goes here
    return true;
   }
}

contract Payer is payment {
    constructor() {

    }
    function getOwner() public view returns(address){
        return owner;
    }
}
contract Caller {
    Payer person = new Payer();
    function getResult() public view returns(address){
        return person.getOwner();
    }
}