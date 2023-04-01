pragma solidity ^0.5.0;

// Creating a contract
contract parent {

// Declaring public
// state variable
uint public num = 30;

// Declaring internal
// state variable
uint internal internal_num= 10;

// Defining external function to
// demonstrate access of
// internal state variable
function sqrt() external returns (
    uint) {
    internal_num = internal_num ** 2;
    return internal_num;
}}
// Defining calling contract
contract Caller {

// Creating a child
// contract object
child c = new child();

// Defining public function
// to demonstrate access
// to external function sqrt
function f() public returns (
    uint) {
    return c.sqrt();
}
// Defining function to
// demonstrate access to
// public functions increment()
// and add()
function f2() public returns(
    uint, uint){
    return (c.increment(), c.add());
}
}

// Defining child contract
// inheriting parent contract
contract child is parent {

// Defining public function
// to demonstrate access to
// public state variable num
function increment(
) public payable returns (uint) {
    num = num + 20;
    return num;
}

// Defining public function
// to demonstrate access
// to local variable a, b, and sum
function add() public view returns(
    uint){
    uint a = 10;
    uint b = 20;
    uint sum = a + b;
    return sum;
}
}
