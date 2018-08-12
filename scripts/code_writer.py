code="""

#include <stdio.h>

int main()
{
printf("Success\\n");
}
"""
with open("code.cu","w") as f:
  f.write(code)
