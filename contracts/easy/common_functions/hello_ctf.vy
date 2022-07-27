"""

Intro to CTF.

Here is the contract HelloCtf

Your challenge is to write code inside the function pwn on the right and set flag inside HelloCtf to True.

# @version ^0.3.3

flag: public(bool)


# @external
def capture():
    self.flag = True

"""


# @version ^0.3.3

interface HelloCtf:
    def capture(): nonpayable


target: public(HelloCtf)


@external
def __init__(target: address):
    self.target = HelloCtf(target)


@external
def pwn():
    self.target.capture()
