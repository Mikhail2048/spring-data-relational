DROP TABLE DUMMY_ENTITY CASCADE CONSTRAINTS PURGE;
DROP TABLE ROOT CASCADE CONSTRAINTS PURGE;
DROP TABLE INTERMEDIATE CASCADE CONSTRAINTS PURGE;
DROP TABLE LEAF CASCADE CONSTRAINTS PURGE;
DROP TABLE WITH_DELIMITED_COLUMN CASCADE CONSTRAINTS PURGE;
DROP TABLE PROVIDED_ID_ENTITY CASCADE CONSTRAINTS PURGE;

CREATE TABLE DUMMY_ENTITY
(
    ID_PROP          NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    NAME             VARCHAR2(100),
    POINT_IN_TIME    TIMESTAMP,
    OFFSET_DATE_TIME TIMESTAMP WITH TIME ZONE,
    FLAG             NUMBER(1,0),
    REF              NUMBER,
    DIRECTION        VARCHAR2(100),
    BYTES            RAW(8)
);

CREATE TABLE ROOT
(
    ID   NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    NAME VARCHAR2(100)
);

CREATE TABLE INTERMEDIATE
(
    ID       NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    NAME     VARCHAR2(100),
    ROOT     NUMBER,
    ROOT_ID  NUMBER,
    ROOT_KEY NUMBER
);

CREATE TABLE LEAF
(
    ID               NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    NAME             VARCHAR2(100),
    INTERMEDIATE     NUMBER,
    INTERMEDIATE_ID  NUMBER,
    INTERMEDIATE_KEY NUMBER
);

CREATE TABLE WITH_DELIMITED_COLUMN
(
    ID                      NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    "ORG.XTUNIT.IDENTIFIER" VARCHAR(100),
    STYPE                   VARCHAR(100)
)

CREATE TABLE PROVIDED_ID_ENTITY
(
  ID  BIGINT PRIMARY KEY,
  NAME VARCHAR(30)
);
