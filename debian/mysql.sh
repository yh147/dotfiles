#!/bin/bash

function grant() {
  grant all privileges on *.* to 'root'@'%'identified by 'passwd' with grant option;
  ALL PRIVILEGES;
}
