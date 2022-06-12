pragma solidity 0.8.0;

contract Helper {

    receive() external payable {}

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function bokosh() public {
        selfdestruct(payable(0xfb103c1214D61cC228896a3D22e302A2A7542F3e));
    }
}
