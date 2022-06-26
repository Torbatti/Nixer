import os
import std/[times, os]
import std/terminal
import strformat

import tables, strutils, os

let time = now()

#Checking If NixOs Conf And HardWare Conf Is Avalable
proc checkConfExists() =
    stdout.styledWriteLine(fgRed, "Nixos Configurations")

    let nixos_conf_exists = fileExists("/etc/nixos/configuration.nix")
    let nixos_harware_conf_exists = fileExists("/etc/nixos/hardware-configuration.nix")

    if nixos_conf_exists:
        stdout.styledWriteLine(fgBlack, "- Found Nixos Configurations")
    if nixos_harware_conf_exists:    
        stdout.styledWriteLine(fgBlack, "- Found Nixos HardWare Configurations")

checkConfExists()


let dot_nix_dir = "~/.dotnix/"
let home_user = "torbatti" # TODO: MAKE IT WORK DYNAMICALLY AND NOT HARDCODED 

#Making Backup Of The Current Confs
#Checking If the .dotnix directory exists
proc checkIfDotnixEsists() =

    stdout.styledWriteLine(fgRed, "Dotnix Directory")

    let dotnix_dir_exists = dirExists(fmt"/home/{home_user}/.dotnix/")

    if dotnix_dir_exists:
        stdout.styledWriteLine(fgBlack, "- Found ~/.dotnix")
    else :
        stdout.styledWriteLine(fgBlack, "- Coudln't Find ~/.dotnix")
        stdout.styledWriteLine(fgBlack, "- Making ~/.dotnix")
        discard execShellCmd(fmt"mkdir {dot_nix_dir}")

checkIfDotnixEsists() #Checking If the .dotnix directory exists

#copying Confs To .dotnix directory    
proc copyConfFilesToDotnix()=    
    stdout.styledWriteLine(fgRed, "Making Backup Of Conf Files")

    discard execShellCmd(fmt"mkdir /home/{home_user}/.dotnix/{time}")
    stdout.styledWriteLine(fgBlack, fmt"- Made New Backup Directory ~/.dotnix/{time}")

    discard execShellCmd(fmt"cp -r /etc/nixos/* /home/{home_user}/.dotnix/{time}")
    stdout.styledWriteLine(fgBlack, "- Successfully Copied Nixos Configurations")
    stdout.styledWriteLine(fgBlack, "- Successfully Copied Nixos Hardware Configurations")

copyConfFilesToDotnix() #copying Confs To .dotnix directory 

stdout.styledWriteLine({styleBright, styleBlink, styleUnderscore},fgGreen, "Welcome To Nixer")

for line in lines("configuration.nix"):
    stdout.styledWriteLine(fgBlack, fmt"{line}")
    var fhs = Table[char, File]()
    if fhs.contains("environment"):
        echo "yes"
