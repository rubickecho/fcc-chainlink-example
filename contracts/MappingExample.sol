// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// 类似于哈希表或者字典
contract MappingExample {
    struct Person {
        string name;
        uint256 age;
    }

    // 基本映射：地址到余额
    mapping(address => uint256) public balances;

    // 映射到结构体
    mapping(address => Person) public person;

    // 映射到数组
    mapping(address => uint256[]) public balancesHistory;
}

// 映射的特性
contract MappingFeatures {
    mapping(address => uint) public balances;
    
    function example() public {
        // 1. 所有键值默认存在，未赋值的键对应类型的默认值
        // uint defaultValue = balances[address(0)];  // 返回 0
        
        // 2. 无法获取映射的长度
        // uint length = balances.length;  // ❌ 不支持
        
        // 3. 无法遍历映射
        // for(uint i = 0; i < balances.length; i++) { } // ❌ 不支持
        
        // 4. 不能删除整个映射，只能删除单个键值对
        delete balances[msg.sender];  // 将值重置为默认值
    }
}

// 常见用途
contract MappingUseCases {
    // 1. 用户余额管理
    mapping(address => uint256) public balances;
    
    // 2. 用户权限控制
    mapping(address => bool) public isAdmin;
    
    // 3. 代币授权
    mapping(address => mapping(address => uint256)) public allowances;
    
    // 4. 存储复杂数据结构
    struct User {
        string name;
        uint256 age;
        bool active;
    }
    mapping(address => User) public users;
}

// 与数组对比
// contract MappingVsArray {
//     // 映射：适合根据键快速查找
//     mapping(uint256 => string) public idToName;
    
//     // 数组：适合顺序访问和遍历
//     string[] public names;
    
//     function compareAccess() public {
//         // 映射：O(1) 时间复杂度访问
//         string memory name1 = idToName[100];
        
//         // 数组：需要遍历才能找到特定值
//         string memory name2;
//         for(uint i = 0; i < names.length; i++) {
//             if(keccak256(bytes(names[i])) == keccak256(bytes("Alice"))) {
//                 name2 = names[i];
//                 break;
//             }
//         }
//     }
// }