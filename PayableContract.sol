pragma solidity ^0.4.0;

contract PayableContract {
    address public owner;

    event UserDeposit(string _msg, address _addr, uint _amt);
    event OwnerWithdraw(string _msg);

    function PayableContract() {
        owner = msg.sender;
    }

    modifier isOwner {
        if (msg.sender != owner) {
            throw;
        }
        _;
    }

    function deposit() payable {
        UserDeposit("A user has deposited funds into the contract", msg.sender, msg.value);
    }

    function withdraw(uint amount) isOwner returns (string){
        if (owner.send(amount)) {
            OwnerWithdraw("Owner has withdrawn funds from the contract");
            return "Withdrawal Successful!";
        } else {
            return "Withdrawal failed!";
        }
    }

    function getBalance() isOwner constant returns (uint) {
        return this.balance;
    }
}
