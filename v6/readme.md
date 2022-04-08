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

### how to  for all
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
