// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


// mock erc 1155

contract Mock1155 is ERC1155, Ownable {
    constructor() ERC1155("link") {}

    uint256 id;

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint()
        public
        /*onlyOwner*/
    {
        _mint(msg.sender, id, 1, "");
        id += 1;
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
