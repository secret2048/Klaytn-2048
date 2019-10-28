.PHONY: abi

#install  solc@0.5.6
#brew install https://raw.githubusercontent.com/ethereum/homebrew-ethereum/1ecf6c60875740133ee51f6167aef9a4f05986e7/solidity.rb
#
#brew tap caver-java
#brew install caver-java
#

abi:
	solc --bin --abi klaytn2048.sol -o abi/ --overwrite --optimize
	# caver-java solidity generate -b abi/klaytn2048.bin -a abi/klaytn2048.abi -o java -p com.bifanr.klaytn.service.smartcode
	# abigen --bin=abi/klaytn2048.bin --abi=abi/Store.abi --pkg=klaytn2048 --out=klaytn2048/klaytn2048.go