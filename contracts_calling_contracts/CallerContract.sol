pragma solidity ^0.4.0;

import "./CalledContract.sol";

contract CallerContract {
    CalledContract calledContract = CalledContract(0x9876e235a87f520c827317a8987c9e1fde804485);

    function getNumberFromContract() returns(uint)  {
        return calledContract.getNumber();
    }

    function getStringFromContract() returns (bytes32) {
        return calledContract.getString();
    }

    function setNumberInOtherContract() {
        calledContract.setNumber(65);
    }
}
