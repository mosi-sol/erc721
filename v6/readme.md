# ERC721 releations

### developers deploy `Main contract`
```solidity
contract Main is ERC721 {

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        name = _name;
        symbol = _symbol;
    }

    function supportsInterface(bytes4 interfaceId) external override view returns (bool){}
}
```

### how to final developer/developing
`import "https://github.com/mosi-sol/erc721/blob/main/v6/ERC721Releation.sol";`

make your own just remember:
```solidity
constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
    name = _name;
    symbol = _symbol;
}
```
### todo
declearing code below from the main or final contract to the `ERC721 contract` section
```solidity
function supportsInterface(bytes4 interfaceId) external override view returns (bool){}
```

#

### what & why
- *erc165*:

Checks if the smart contract includes a specific interface.
 This function uses less than 30,000 gas.

- *erc721*:

non-fungible token standard. { NFT 1 of 1 }

- *erc721 receiver*:

The contract address is always the message sender. A wallet/broker/auction application
 MUST implement the wallet interface if it will accept safe transfers.

### why erc165 important
sometimes in some cases nft marketplaces implemented user nfts as/is in an proxy contract, then if not know about (erc165 implmentation) can not use user nft. 

### why erc721receiver important
the target of transfer is valid for receiving nfts or no, in this case safetransfer need to contact by target.
