//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

error details__NotSufficientAge();
error details__SeatsFullfilled();
error details__NotSufficientAmount();

contract data{

    uint256 private immutable i_entranceFees;

    struct Details{
        string Name;
        uint16 Age;
        uint256 Id;
        string Address;
    }
    mapping(address => Details) private s_details;
    address[] private s_players;

    constructor(uint256 entranceFees){
        i_entranceFees = entranceFees;
    }

    modifier Entry(){
        if(msg.value >= i_entranceFees){
            _;
        }
    }

    function EntreDetails( 
        string memory name, 
        uint16 age, 
        uint256 id, 
        string memory add 
        ) Entry public payable {
            
        if(age < 18){
            revert details__NotSufficientAge();
        }
        if(s_players.length > 25){
            revert details__SeatsFullfilled();
        }
        if(msg.value < i_entranceFees){
            revert details__NotSufficientAmount();
        }
        Details memory d1 = Details({
            Name: name,
            Age: age,
            Id: id,
            Address: add
        });
        s_details[msg.sender] = d1;
        s_players.push(msg.sender);
    }

    // View functions

    function getDetailCount() public view returns(uint256){
        return s_players.length;
    }

    function ShowDetails(uint256 index) public view returns(Details memory){
        address toFind = s_players[index];
        return s_details[toFind];
    }

    function getEntranceFees()public view returns(uint256){
        return i_entranceFees;
    }

    function ShowTotalFunds()public view returns(uint256){
        return address(this).balance;
    }

    function balanceOf(address account) public view returns(uint256){
        return address(account).balance;
    }
}