// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MyToken {
    address public owner;
    mapping(address => uint256) balances;
    uint256 public totalsupply;
    string public tokenname;

    constructor(string memory TokenName) {
        owner = msg.sender;
        tokenname = TokenName;

    }

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call this function");
        _;
    }

    function mint(uint256 amount) public onlyOwner {
        balances[owner] += amount;
        totalsupply += amount;
    }

    function mintTo(uint256 amount, address payable to)
        public
        payable
        onlyOwner
    {
        payable(to).transfer(amount);
        balances[to] += amount;
        totalsupply += amount;
    }

    function transfer(address payable to, uint256 amount) public payable {
        require(
            balances[msg.sender] >= amount,
            "You dont have required amount"
        );
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
