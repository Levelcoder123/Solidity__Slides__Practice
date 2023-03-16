// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract First{

    uint age = 26;

    function doSomeWork(uint myAge) public pure returns(uint) {

      myAge = myAge + 2;
      return myAge;
    }

    function getAge() public view returns (uint) {

        doSomeWork (age);
        return age;
    }
}

contract Test {

function receivePayment() public payable {

}

function checkBalance(uint ) public view returns (uint) {
     return address (this).balance;
}

}

contract second{

    function doSomeWork() public pure returns (uint a) {
       a = 45;
       return a;
    }

     function doSomeWork1() public pure returns (string memory) {
       return "Lets code";
    }

    function doSomeWork3() public pure returns (bool) {
       
       uint myAge = 26;
       uint hisAge = 23;
       
       if(myAge == hisAge) {

           bool tellHim = true;
           return tellHim;
       }
    }
}
