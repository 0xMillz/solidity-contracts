pragma solidity ^0.4.0;

contract PayableContract {
    address public owner;

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

    }

    function withdraw(uint amount) isOwner returns (string){
        if (owner.send(amount)) {
            return "Withdrawal Successful!";
        } else {
            return "Withdrawal failed!";
        }
    }

    function getBalance() isOwner constant returns (uint) {
        return this.balance;
    }
}
