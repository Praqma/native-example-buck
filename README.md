# Build with Buck

[![CircleCI](https://circleci.com/gh/sheeeng/omed-buck.png?style=shield&circle-token=df3dc5f6efbc2a267f7805f05a5e91d2878be9fd)](https://circleci.com/gh/sheeeng/omed-buck)

Building with [Buck](https://buckbuild.com).


## The `g++: error: unrecognized command line option ‘-std=c++14’` Error



## The `Buck wasn't able to parse` Error

The `buck targets` from the your current folder will fail, if source code of buck is located under a subdirectory without a BUCK file.

```
./
├── 3rdparty
│   ├── buck-master
│   └── googletest-master
```

* Error

```
Buck wasn't able to parse /home/circleci/omed-buck/3rdparty/buck-master/programs/BUCK:
IOError: [Errno 2] No such file or directory: '/home/circleci/omed-buck/programs/macro_defs'
```

* Workaround

```
./
├── 3rdparty
│   └── googletest-master
└── buck-master
```

#### Undefined reference to `pthread_getspecific` or `pthread_setspecific` Error

```
$ buck test //:greety_test --verbose 1 --num-threads 1 --no-cache
Not using buckd because watchman isn't installed.
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<testing::TestPartResultReporterInterface*>::~ThreadLocal()':
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEED2Ev[_ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEED5Ev]+0x15): undefined reference to `pthread_getspecific'
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEED2Ev[_ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEED5Ev]+0x2a): undefined reference to `pthread_key_delete'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<std::vector<testing::internal::TraceInfo, std::allocator<testing::internal::TraceInfo> > >::~ThreadLocal()':
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEED2Ev[_ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEED5Ev]+0x15): undefined reference to `pthread_getspecific'
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEED2Ev[_ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEED5Ev]+0x2a): undefined reference to `pthread_key_delete'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<std::vector<testing::internal::TraceInfo, std::allocator<testing::internal::TraceInfo> > >::GetOrCreateValue() const':
gtest-all.cc:(.text._ZNK7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE16GetOrCreateValueEv[_ZNK7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE16GetOrCreateValueEv]+0x16): undefined reference to `pthread_getspecific'
gtest-all.cc:(.text._ZNK7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE16GetOrCreateValueEv[_ZNK7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE16GetOrCreateValueEv]+0x79): undefined reference to `pthread_setspecific'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<testing::TestPartResultReporterInterface*>::CreateKey()':
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE9CreateKeyEv[_ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE9CreateKeyEv]+0x18): undefined reference to `pthread_key_create'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<std::vector<testing::internal::TraceInfo, std::allocator<testing::internal::TraceInfo> > >::CreateKey()':
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE9CreateKeyEv[_ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE9CreateKeyEv]+0x18): undefined reference to `pthread_key_create'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<testing::TestPartResultReporterInterface*>::GetOrCreateValue() const':
gtest-all.cc:(.text._ZNK7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE16GetOrCreateValueEv[_ZNK7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE16GetOrCreateValueEv]+0x16): undefined reference to `pthread_getspecific'
gtest-all.cc:(.text._ZNK7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE16GetOrCreateValueEv[_ZNK7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE16GetOrCreateValueEv]+0x79): undefined reference to `pthread_setspecific'
collect2: error: ld returned 1 exit status

BUILD FAILED: //:greety_test#binary failed with exit code 1:
c++ link
stderr: buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<testing::TestPartResultReporterInterface*>::~ThreadLocal()':
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEED2Ev[_ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEED5Ev]+0x15): undefined reference to `pthread_getspecific'
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEED2Ev[_ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEED5Ev]+0x2a): undefined reference to `pthread_key_delete'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<std::vector<testing::internal::TraceInfo, std::allocator<testing::internal::TraceInfo> > >::~ThreadLocal()':
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEED2Ev[_ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEED5Ev]+0x15): undefined reference to `pthread_getspecific'
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEED2Ev[_ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEED5Ev]+0x2a): undefined reference to `pthread_key_delete'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<std::vector<testing::internal::TraceInfo, std::allocator<testing::internal::TraceInfo> > >::GetOrCreateValue() const':
gtest-all.cc:(.text._ZNK7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE16GetOrCreateValueEv[_ZNK7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE16GetOrCreateValueEv]+0x16): undefined reference to `pthread_getspecific'
gtest-all.cc:(.text._ZNK7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE16GetOrCreateValueEv[_ZNK7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE16GetOrCreateValueEv]+0x79): undefined reference to `pthread_setspecific'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<testing::TestPartResultReporterInterface*>::CreateKey()':
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE9CreateKeyEv[_ZN7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE9CreateKeyEv]+0x18): undefined reference to `pthread_key_create'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<std::vector<testing::internal::TraceInfo, std::allocator<testing::internal::TraceInfo> > >::CreateKey()':
gtest-all.cc:(.text._ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE9CreateKeyEv[_ZN7testing8internal11ThreadLocalISt6vectorINS0_9TraceInfoESaIS3_EEE9CreateKeyEv]+0x18): undefined reference to `pthread_key_create'
buck-out/gen/googtest/gtest#default,static/libgtest.a(gtest-all.cc.o): In function `testing::internal::ThreadLocal<testing::TestPartResultReporterInterface*>::GetOrCreateValue() const':
gtest-all.cc:(.text._ZNK7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE16GetOrCreateValueEv[_ZNK7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE16GetOrCreateValueEv]+0x16): undefined reference to `pthread_getspecific'
gtest-all.cc:(.text._ZNK7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE16GetOrCreateValueEv[_ZNK7testing8internal11ThreadLocalIPNS_31TestPartResultReporterInterfaceEE16GetOrCreateValueEv]+0x79): undefined reference to `pthread_setspecific'
collect2: error: ld returned 1 exit status

Parsing buck files: finished in 1.0 sec (100%)
Building: finished in 0.8 sec (100%) 6/7 jobs, 1 updated, 14.3% cache miss
  Total time: 2.0 sec
```

The problem is caused by `circleci/openjdk:jdk` Docker image does not contain `-lpthread` linker flag by default.

```
diff --git a/BUCK b/BUCK
index 1f54b1e..e2e5e15 100644
--- a/BUCK
+++ b/BUCK
@@ -45,6 +45,9 @@ cxx_test(
   srcs = [
     'testy/greety_test.cc',
   ],
+  linker_flags = [
+    '-lpthread',
+  ],
   deps = [
     '//googtest:gtest',
     ':greety',
```
