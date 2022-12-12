// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Deposit {
    
    mapping (address => uint) private balances;
    address public owner;

  // Log the event about a deposit being made by an address and its amount
    event LogDepositMade(address indexed accountAddress, uint amount);

    // Constructor is "payable" so it can receive the initial funding of 30, 
    constructor() payable {
        require(msg.value == 0 ether, "0 ether initial deposit required");
        /* Set the owner to the creator of this contract */
        owner = msg.sender;
    }

    /// @notice Deposit ether into bank, requires method is "payable"
    /// @return The balance of the user after the deposit is made
    function deposit() public payable returns (uint) {
        balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
    }

    function withdraws(uint amount) external {
         (bool success,)=owner.call{value:amount}("");
         require(success, "Transfer failed!");
         }

    function balance() public view returns (uint) {
        return balances[msg.sender];
    }


}