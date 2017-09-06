cxx_library(
  name = 'liby',
  header_namespace = 'liby',
  exported_headers = subdir_glob([
    ('liby', '**/*.h'),
  ]),
  srcs = glob([
    'liby/**/*.cc',
  ]),
  visibility = [
    '//...',
  ],
)

cxx_library(
  name = 'greety',
  header_namespace = 'mainy',
  exported_headers = subdir_glob([
    ('mainy', '**/greety.h'),
  ]),
  srcs = glob([
    'mainy/**/greety.cc',
  ]),
  visibility = [
    '//...',
  ],
)

cxx_binary(
  name = 'mainy',
  header_namespace = 'mainy',
  headers = subdir_glob([
    ('mainy', '**/*.h'),
  ]),
  srcs = glob([
    'mainy/**/*.cc',
  ]),
  deps = [
    ':liby',
  ],
)

cxx_test(
  name = 'greety_test',
  srcs = [
    'testy/greety_test.cc',
  ],
  linker_flags = [
    '-lpthread',
  ],
  deps = [
    '//googtest:gtest',
    ':greety',
  ],
)
