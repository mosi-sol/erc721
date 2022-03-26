## Custom type for bulk mint

- this contract included nft releations
-  Nft wallet & erc20 wallet
- flat version updated/added to repository

##

### At deploy time recomended: 
- cid ( hash link of ipfs without any space slash backslash hyphen )
- maximum number of your items

##
### Prerequire:
- json -would be in a folder & uploaded on ipfs

##
### Disclaimer **
- this repo for study perpuses for my students.
- expermential codes 
- use is/as/on product at your risk

##
### Example for json

```
{
    "name": "Item name here",
    "description": "description of artwork/utility here",
    "image": "https://bafy0000000000000000000000000000wbo4.ipfs.dweb.link/thumbnail.png",
    "attributes": [
        {
            "trait_type": "Collection",
            "value": "IC"
        },
        {
            "trait_type": "Creator",
            "value": "Mosi"
        }
    ],
    "compiler": "MOSi Encrypt"
  }
```
