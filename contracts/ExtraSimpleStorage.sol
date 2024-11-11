// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

// 继承合约, 使用 is 关键字
contract ExtraSimpleStorage is SimpleStorage {
    // override function from SimpleStorage
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}
