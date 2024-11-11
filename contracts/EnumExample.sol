// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract EnumExample {
    enum Status {
        PENDING,    // 0
        ACTIVE,     // 1
        INACTIVE    // 2
    }
    
    Status public status;  // 底层是 uint8
    
    // 可以显式转换为 uint8
    function getStatusAsUint() public view returns (uint8) {
        return uint8(status);
    }
    
    // 可以从 uint8 转换为枚举
    function setStatusFromUint(uint8 _status) public {
        status = Status(_status);
    }
}