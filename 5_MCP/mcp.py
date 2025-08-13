from fastmcp import FastMCP
from langchain_community.tools import DuckDuckGoSearchResults

search_tool = DuckDuckGoSearchResults()

mcp = FastMCP("Demo")

@mcp.tool
def add(a:int, b:int) -> int:
    """ Adds two numbers """
    return a+b

@mcp.tool
def search(query: str) -> str:
    """ Searches about the query and provides the answer """
    result = search_tool.invoke(query)
    return result

if __name__ == "__main__":
    mcp.run()