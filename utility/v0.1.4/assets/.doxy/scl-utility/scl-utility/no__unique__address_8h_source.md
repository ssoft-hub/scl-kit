

# File no\_unique\_address.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**no\_unique\_address.h**](no__unique__address_8h.md)

[Go to the documentation of this file](no__unique__address_8h.md)


```C++
#pragma once


#ifndef SCL_NO_UNIQUE_ADDRESS
#if __has_cpp_attribute(no_unique_address)
#define SCL_NO_UNIQUE_ADDRESS [[no_unique_address]]
#elif __has_cpp_attribute(msvc::no_unique_address)
#define SCL_NO_UNIQUE_ADDRESS [[msvc::no_unique_address]]
#else
#define SCL_NO_UNIQUE_ADDRESS
#endif
#endif
```


