// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec25 {
    /**
     * Error Handler : require, revert, assert, try-catch
     *
     * 0.8.0 이상
     * assert : Panic(uint256) errotType error occured
     * revert : Error(string) error occured
     * require : Error(string) error occured
     */

    // 21254 gas
    function assertNow() public pure {
        assert(false); // test
    }

    // 21542 gas
    function reverNow() public pure {
        revert("error!"); // if or require = if + revert
    }

    // 21536 gas
    function requireNow() public pure {
        require(false, "occured");
    }

    function onlyAdults(uint256 _age) public pure returns (string memory) {
        if (_age < 19) {
            revert("You are not allowed to pay for the cigarette");
        }

        return "Your payment is succeeded";
    }

    function onlyAdults2(uint256 _age) public pure returns (string memory) {
        require(_age > 19, "Your are not allowed to pay for the cigarette");
        return "Your payment is succeeded";
    }
}
