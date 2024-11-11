// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


// - 限制：
// * struct 不能包含自己这个类型的成员
// * 但可以包含自己这个类型的指针（如映射或数组）
// - Gas 消耗：
// * struct 中的每个字段都会占用存储空间
// * 读写 struct 会消耗更多的 gas，因为要处理多个字段
contract StructExample {
    // 定义一个 Person 结构体
    struct Person {
        string name;     // 姓名
        uint256 age;     // 年龄
        address wallet;  // 钱包地址
        bool isActive;   // 是否活跃
    }

    // 嵌套使用
    struct Company {
        string name;
        address wallet;
        Person[] employees;
    }
    
    // 声明一个 Person 类型的变量
    Person public person;
    
    // 存储多个 Person
    Person[] public people;  // 数组
    mapping(address => Person) public personMap;  // 映射
    
    // 创建新的 Person
    function createPerson(string memory _name, uint256 _age) public {
        // 方法 1：直接赋值
        person = Person(_name, _age, msg.sender, true);
        
        // 方法 2：命名参数
        person = Person({
            name: _name,
            age: _age,
            wallet: msg.sender,
            isActive: true
        });
        
        // 方法 3：先声明后赋值
        // memory 是临时变量，不会存储在区块链上，存在内存中: 复制，修改不会影响原值
        Person memory newPerson;
        newPerson.name = _name;
        newPerson.age = _age;
        newPerson.wallet = msg.sender;
        newPerson.isActive = true;

        // 存储在区块链上（持久化）: 引用，修改会影响原值
        // Person storage newPersonStorage = person;
        // newPersonStorage.name = _name;
        // newPersonStorage.age = _age;
        // newPersonStorage.wallet = msg.sender;
        // newPersonStorage.isActive = true;

        
        // 添加到数组
        people.push(newPerson);
    }
}