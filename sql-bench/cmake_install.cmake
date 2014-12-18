# Install script for directory: /home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local/mysql")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Debug")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench/Data" TYPE DIRECTORY FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/Data/ATIS")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench/Data" TYPE DIRECTORY FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/Data/Wisconsin")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE DIRECTORY FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/limits")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-ATIS")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-transactions")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest2")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/crash-me")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-select")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/copy-db")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/run-all-tests")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-wisconsin")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-transactions")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-create")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-create")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest1b")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/graph-compare-results")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest2")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest1a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/bench-init.pl")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-alter-table")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-wisconsin")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/copy-db")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest2a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest2b")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-ATIS")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest1a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/bench-count-distinct")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/server-cfg")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest1b")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/graph-compare-results")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/cmake_install.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-connect")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-big-tables")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-alter-table")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-insert")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-insert")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/compare-results")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-connect")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/compare-results")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/bench-count-distinct")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/CTestTestfile.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest1")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest2b")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/run-all-tests")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/bench-init.pl")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest2a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-select")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/crash-me")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/server-cfg")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE FILE FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/README")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/innotest1")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/test-big-tables")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")

