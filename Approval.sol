// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Escrow{
    mapping(address => mapping(address => uint))public allowance;
    mapping(address => uint) public balances;
    


    constructor(){
 
    }

    function mintTo(address to,uint256 amount) public {
        balances[to]  += amount;
    }

    function approve(address to,uint256 amount)public{
        allowance[msg.sender][to] = amount;
    }

    function claim(address from,address to,uint256 amount)public{
        uint256 bal = allowance[from][to];
        require(bal >= amount,"You are not allowed that much");
        require(balances[from] >= amount,"Sender dont have that much money");

        balances[to] += amount;
        balances[from] -= amount;
        allowance[from][to] -= amount;

    }
}
