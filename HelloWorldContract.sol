pragma solidity ^0.4.0;

contract HelloWorldContract {

  string word = "Hello World";
  address public issuer;

  function HelloWorldContract() {
      issuer = msg.sender;
  }

  modifier ifIssuer(){
      if (issuer != msg.sender) {
          throw;
      }
      _;
  }

  function getWord() constant returns (string) {
      return word;
  }

  function setWord(string newWord) ifIssuer {
          word = newWord;
  }
}
