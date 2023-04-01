// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

abstract contract AbstractContract {
    // Declaring functions
    function getStr(string memory _strIn)
        public
        view
        virtual
        returns (string memory);

    function setValue(uint256 _in1, uint256 _in2) public virtual;

    function add() public virtual returns (uint256);
}

// child contract 'DerivedContract' inheriting an abstract parent contract 'AbstractContract'
contract DerivedContract is AbstractContract {
    // Declaring private variables
    uint256 private num1;
    uint256 private num2;

    // Defining functions inherited from abstract parent contract
    function getStr(string memory _strIn)
        public
        pure
        override
        returns (string memory)
    {
        return _strIn;
    }

    function setValue(uint256 _in1, uint256 _in2) public override {
        num1 = _in1;
        num2 = _in2;
    }

    function add() public view override returns (uint256) {
        return (num2 + num1);
    }
}

// Caller contract
contract Call {
    // Creating an instance of an abstract contract
    AbstractContract abs;

    // Creating an object of child contract
    constructor() {
        abs = new DerivedContract();
    }

    // Calling functions inherited from abstract contract
    function getValues() public returns (string memory, uint256) {
        abs.setValue(10, 16);

        return (abs.getStr("GeeksForGeeks"), abs.add());
    }
}
