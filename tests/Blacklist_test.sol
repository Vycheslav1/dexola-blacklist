// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol";
import "../contracts/Blacklist.sol";

contract BlacklistTest is Blacklist {

    function testTokenInitialValues() public {
        Assert.equal(name(), "Solar Green", "token name did not match");
        Assert.equal(symbol(), "SGR", "token symbol did not match");
        Assert.equal(decimals(), 18, "token decimals did not match");
        Assert.equal(totalSupply(), 0, "token supply should be zero");
    }
}