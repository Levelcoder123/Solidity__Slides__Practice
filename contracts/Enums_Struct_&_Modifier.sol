// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

// Enum Practice
contract Enum {
    enum Gender {
        male,
        female
    }

    function doSomeWork(Gender g) public pure returns (Gender){
        Gender studentGender = g;
        return studentGender;
    }
}

contract EnumLottery {

enum user {
    allowed,
    not_allowed,
    wait
    }

     user public u1 = user.wait;
     uint public lottery = 1000;

     function owner() public {
          if (u1 == user.allowed)
          {
               lottery = 0;
          }
    }

    function changeOwner() public {

        u1 = user.not_allowed;
    }
}

contract EnumStatus {
    enum Status {pending,Shipped,Accepted,Rejected,Canceled}
    Status public status;
    function get() public view returns (Status) {
        return status;
    }
    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }
    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }
    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}

// Struct Practice
contract Struct{

    struct Student {
        string name;
        uint age;
        bool isFeepaid;
    }

    Student stu = Student ("Rizwan", 24,  false);

    function manageStruct() public pure returns (uint) {

        Student memory s1 = Student("Rehan",20, true);
        Student memory s2 = Student("Ahmed",10, false);

        return s2.age;
    }
}

    
contract Struct2{
    
        struct Student {
            string name ;
            uint age ;
            bool isFeePaid;
        }

    Student stu = Student ("Rizwan", 45, false);

    function manageStruct() public pure returns (uint){
    
        Student memory  s1 = Student ("Rehan", 40, true);
        Student memory s2 = Student ("Rizwan", 20, true);
        Student memory s3 = Student ("Kali", 80, false);

        return s2.age;
    }
}


contract Struct3{
    struct Student {
        string name;
        uint age;
        bool isFeepaid;
    }
    Student stu = Student ("Rizwan", 24,  false);

    function manageStruct() public pure returns (uint) {

        Student memory s2 = Student("Ahmed",10, false);
        return s2.age;
    }

    function manageStruct2() public pure returns (uint) {

        Student memory s2 = Student("Ahmed",10, false);

        s2.name = "Haider";
        s2.age = 38;
        return s2.age;
    }
}

// modifier
contract Modifier{
    uint age = 56;
    modifier verifyAge(uint a) {
        if (a > 60){
            _;
        }
    }
    function updateAge() public pure verifyAge(67) returns(uint) {

    return 45;
 }
    function updateAge2() public pure verifyAge(34) returns (bool) {
        
    return true;
    }
}

// Event
contract eventExample {

    uint256 public value = 0;

    event Increment(address owner);

    function getValue(uint _a, uint _b) public {
        emit Increment(msg.sender);
        
        value = _a + _b;
    }
}
