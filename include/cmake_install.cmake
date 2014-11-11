# Install script for directory: /home/adbms/mysqlsrc/mysql-5.6.21/include

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql_com.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql_time.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_list.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_alloc.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/typelib.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql/plugin.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql/plugin_audit.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql/plugin_ftparser.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql/plugin_validate_password.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_dbug.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/m_string.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_sys.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_xml.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql_embed.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_pthread.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/decimal.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/errmsg.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_global.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_net.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_getopt.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/sslopt-longopts.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_dir.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/sslopt-vars.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/sslopt-case.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/sql_common.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/keycache.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/m_ctype.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_attribute.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_compiler.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql_com_server.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_byteorder.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/byte_order_generic.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/byte_order_generic_x86.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/byte_order_generic_x86_64.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/little_endian.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/big_endian.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql_version.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/my_config.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysqld_ername.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysqld_error.h"
    "/home/adbms/mysqlsrc/mysql-5.6.21/include/sql_state.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mysql" TYPE DIRECTORY FILES "/home/adbms/mysqlsrc/mysql-5.6.21/include/mysql/" REGEX "/[^/]*\\.h$" REGEX "/psi\\_abi[^/]*$" EXCLUDE)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

