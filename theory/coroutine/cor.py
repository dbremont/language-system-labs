import asyncio

async def compute():
    await asyncio.sleep(1)
    return 42

async def main():
    result = await compute()
    print(result)

asyncio.run(main())
