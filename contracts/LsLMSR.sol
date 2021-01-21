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
    int128 initial_subsidy = ABDKMath.divu(_subsidy, 10**18);
    int128 sum_total;
    alpha = ABDKMath.div(1,ABDKMath.mul(10,ABDKMath.mul(n,ABDKMath.ln(n))));
    b = ABDKMath.mul(ABDKMath.mul(initial_subsidy, n), alpha);
    int128 eqb = ABDKMath.exp(ABDKMath.div(initial_subsidy, b));

    for(uint i=0; i<_numOutcomes; i++) {
      q.push(initial_subsidy);
      sum_total = ABDKMath.add(sum_total, eqb);
    }

    total_balance = ABDKMath.mul(initial_subsidy, n);
    current_cost = cost();
    console.log("Initialisation parameters:");
    console.log("Alpha: %s.", ABDKMath.mulu(alpha, 1000000));
    console.log("Beta: %s", ABDKMath.toUInt(b));
    console.log("Total balance: ", ABDKMath.toUInt(total_balance));
  }

  function buy(uint256 _outcome, int128 _amount) public returns (int128 cost_invariant){
    int128 sum_total;

    for(uint j=0; j<numOutcomes; j++) {
      if((_outcome & (1<<j)) != 0) {
        q[j] = ABDKMath.add(q[j], _amount);
        total_balance = ABDKMath.add(total_balance, _amount);
      }
    }

    b = ABDKMath.mul(total_balance, alpha);

    for(uint i=0; i< numOutcomes; i++) {
      sum_total = ABDKMath.add(sum_total,
        ABDKMath.exp(
          ABDKMath.div(q[i], b)
          ));
    }

    int128 new_cost = ABDKMath.mul(b,ABDKMath.ln(sum_total));

    cost_invariant = ABDKMath.sub(new_cost,current_cost);

    current_cost = new_cost;

  }

  function buyU(uint256 _outcome, int128 _amount) public returns (uint256){
    return ABDKMath.toUInt(buy(_outcome, _amount));
  }

  function cost() public view returns (int128) {
    int128 sum_total;
    for(uint i=0; i< numOutcomes; i++) {
      sum_total = ABDKMath.add(sum_total, ABDKMath.exp(ABDKMath.div(q[i], b)));
    }
    return ABDKMath.mul(b, ABDKMath.ln(sum_total));
  }

  function cost_after_buy(uint256 _outcome, int128 _amount) public view returns (int128) {
    int128 sum_total;
    int128[] memory newq = new int128[](q.length);
    int128 TB = total_balance;

    //console.log("Checking cost for purchasing %s shares on outcome %s", ABDKMath.toUInt(_amount), _outcome);

    for(uint j=0; j< numOutcomes; j++) {
      if((_outcome & (1<<j)) != 0) {
        newq[j] = ABDKMath.add(q[j], _amount);
        TB = ABDKMath.add(TB, _amount);
      } else {
        newq[j] = q[j];
      }
    }

    int128 _b = ABDKMath.mul(TB, alpha);

    for(uint i=0; i< numOutcomes; i++) {
      sum_total = ABDKMath.add(sum_total,
        ABDKMath.exp(
          ABDKMath.div(newq[i], _b)
          ));
    }

    return ABDKMath.mul(_b, ABDKMath.ln(sum_total));
  }

  function cost_after_buyU(uint256 _outcome, int128 _amount) public view returns (int128) {
    return ABDKMath.toUInt(cost_after_buy(_outcome, _amount));
  }

  function costU() public view returns (uint128) {
    return ABDKMath.toUInt(cost());
  }

  function price(uint256 _outcome, int128 _amount) public view returns (int128) {
    return cost_after_buy(_outcome, _amount) - current_cost;
  }

  function priceU(uint256 _outcome, int128 _amount) public view returns (uint256) {
    return ABDKMath.toUInt(price(_outcome, _amount));
  }

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
