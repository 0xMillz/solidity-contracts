pragma solidity ^0.4.0;

contract CalledContract {
    bytes32 data = "Hello Ethereum";
    uint number = 45;

    function getNumber() returns (uint) {
        return number;
    }

    function getString() returns (bytes32) {
        return data;
    }

    function setNumber(uint numberIn) {
        number = numberIn;
    }

}
