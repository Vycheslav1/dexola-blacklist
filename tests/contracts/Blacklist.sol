// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract Blacklist is ERC20, ERC20Permit {
  
  address public owner;

  modifier onlyOwner() {
 require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
}

  event AddressBlacklisted(address indexed _address, bool _isBlacklisted);

    constructor() ERC20("Solar Green", "SGR") ERC20Permit("BlackLkist") {
         _mint(msg.sender, 100000000* (10 ** uint256(decimals())));
     owner = msg.sender;
    }
    
   
     mapping(address=>bool) isBlacklisted;

  function blacklistAddress(address _address) external onlyOwner {
isBlacklisted[_address] = true;
emit AddressBlacklisted(_address, true);
}

function unblacklistAddress(address _address) external onlyOwner {
isBlacklisted[_address] = false;
emit AddressBlacklisted(_address, false);
}
function createToken(address to,uint256 tokenId) external onlyOwner{
    _mint(to, tokenId);
}

   
   function kill(address account,uint value) external onlyOwner{
      _burn(account, value);
    
   }
}

