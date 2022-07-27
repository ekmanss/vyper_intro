# Private state variables cannot be accessed from outside the contract.
# Public state variables can be read by anyone,
# including users and other contracts.

# @version ^0.3.3

# publis state variable
owner: public(address)
# private state variable
foo: uint256
bar: public(bool)


@external
def __init__():
    self.owner = msg.sender
    self.foo = 123
    self.bar = True
