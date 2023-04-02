// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MyCoinERC20 {

    // Transfer event must be triggered when tokens are transferred.
    event Transfer(address indexed from, address indexed to, uint tokens);

    // Approval event must be triggered when spender is approved to collect tokens from owner.
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    // Set the name of our token, its symbol, and the decimal to use.

    string public constant name = "My Coin";
    string public constant symbol = "MC";
    uint8 public constant decimals = 16;

    // We will declare two mappings.

    mapping(address => uint256) balances; // First for holding the token balance of each owner account.

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_;

    constructor(uint256 total) {
      totalSupply_ = total;
      balances[msg.sender] = totalSupply_;
    }

    function totalSupply() public view returns (uint256) {
      return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }

 function transfer(address receiver, uint numOfTokens) public returns (bool) {
        require(numOfTokens <= balances[msg.sender]);
        balances[msg.sender] -= numOfTokens;
        balances[receiver] += numOfTokens;
        emit Transfer(msg.sender, receiver, numOfTokens);
        return true;
    }

    function approve(address delegate, uint numOfTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numOfTokens;
        emit Approval(msg.sender, delegate, numOfTokens);
        return true;
    }

    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] -= numTokens;
        allowed[owner][msg.sender] -= numTokens;
        balances[buyer] += numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}
