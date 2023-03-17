// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

// While Loop
contract whileLoop{

    uint[3]public arr;
    
    function loop () public{
        uint count;
        while(count < arr.length){

            arr[count] = count;
            count++;
        }
    }
}

// Array
contract Array{

    uint [4] public a = [1,2,3,4 ];

    function setter(uint index,uint value) public{
        a[index]=value;
        
    }

    function length() public view returns(uint){
        return a.length;
    }
}

// Mapping
contract Mapping{

    mapping(uint=>string) public roll_no;

    function setter(uint keys,string memory value) public{

        roll_no[keys]=value;
    }
}

// Struct With Mapping
contract structWithMap{

    struct Student{
        string name;
         uint class;
    }

    mapping(uint=>Student)public data;

    function setter(uint _roll  ,string memory _name,uint _class)public
    {
        data[_roll]=Student(_name,_class);
    }
}

