"""
selfdestruct deletes the contract from the blockchain. 
It takes a single input, an address to send all of Ether stored in the contract.
"""

# @version ^0.3.3


@external
@payable
def __default__():
    pass


@external
def kill():
    selfdestruct(msg.sender)


@external
def burn():
    selfdestruct(ZERO_ADDRESS)
