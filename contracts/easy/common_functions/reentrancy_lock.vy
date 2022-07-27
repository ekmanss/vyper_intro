"""
Vyper has a handy way to secure your contract from re-entrancy.

A re-entrancy lock can be created on a function with @nonreentrant("lock").

Functions can be locked together by using the same name for the locks.

# @noreentrant("lock-1")
# def func1():
#     ...

# @noreentrant("lock-1")
# def func2():
#     ...

# @noreentrant("lock-2")
# def func3():
#     ...

# @noreentrant("lock-2")
# def func4():
#     ...
"""

# @version ^0.3.3


@external
@nonreentrant("lock")
def func0():
    # call back msg.sender
    raw_call(msg.sender, b"", value=0)


@external
@nonreentrant("lock-2")
def func1():
    raw_call(msg.sender, b"", value=0)


@external
@nonreentrant("lock-2")
def func2():
    raw_call(msg.sender, b"", value=0)
