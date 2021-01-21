pragma solidity ^0.6.0;

import "hardhat/console.sol";
import "./ConditionalTokens.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import {ABDKMath} from "./ABDKMath64x64.sol";

contract LsLMSR is IERC1155Receiver, Ownable{

  uint public numOutcomes;
  int128[] private q;
  int128 private b;
  int128 private alpha;
  int128 private current_cost;
  int128 private total_balance;

  ConditionalTokens private CT;

  constructor(address _ct, address _oracle, uint _numOutcomes, uint _subsidy) public {
    CT = ConditionalTokens(_ct);
    CT.prepareCondition(_oracle, bytes32(uint256(1)), _numOutcomes);
    console.log("Condition Preparation: ", _oracle, '0x00000000000000000000000000000001', _numOutcomes);


    numOutcomes = _numOutcomes;

    int128 n = ABDKMath.fromUInt(_numOutcomes);
    int128 initial_subsidy = ABDKMath.fromUInt(_subsidy);
    int128 sum_total;
    alpha = ABDKMath.div(1,ABDKMath.mul(10,ABDKMath.mul(n,ABDKMath.ln(n))));
    b = ABDKMath.mul(ABDKMath.mul(initial_subsidy, n), alpha);
    int128 eqb = ABDKMath.exp(ABDKMath.div(initial_subsidy, b));
    for(uint i=0; i<_numOutcomes; i++) {
      q.push(initial_subsidy);
      sum_total = ABDKMath.add(sum_total, eqb);
    }
    int128 total_balance = ABDKMath.mul(initial_subsidy, n);
    console.log(ABDKMath.toUInt(total_balance));
    current_cost = 0;
    total_balance = 0;
    console.log("q[%s] = %s", q.length, ABDKMath.toUInt(q[0]));
  }

  //function buy()

  //function cost()

  //function price()

  function onERC1155Received(
    address operator,
    address from,
    uint256 id,
    uint256 value,
    bytes calldata data
  ) external override returns(bytes4) {
    return this.onERC1155Received.selector;
  }

  function onERC1155BatchReceived(
    address operator,
    address from,
    uint256[] calldata ids,
    uint256[] calldata values,
    bytes calldata data
  ) external override returns(bytes4) {
    return this.onERC1155BatchReceived.selector;
  }

   function supportsInterface(
     bytes4 interfaceId
  ) external override view returns (bool) {}

}
