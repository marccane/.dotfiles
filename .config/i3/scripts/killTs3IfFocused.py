#!/usr/bin/env python3
import i3ipc

def i_getFocusedContainer(con):
    if con.focused:
        return con
    else:
        for c in con.nodes:
            tmpc = i_getFocusedContainer(c)
            if tmpc != None:
                return tmpc
        return None

def getFocusedContainer(ipc):
    for ws in ipc.get_tree().workspaces():
        #print("focused" if ws.focused else "not focused")
        tmpc = i_getFocusedContainer(ws)
        if tmpc != None:
            return tmpc
    return None

def main():
    ipc = i3ipc.Connection()
    con = getFocusedContainer(ipc)

    if con == None:
        print("Error obtaining focused i3 container", file=sys.stderr)
    elif con.name == "TeamSpeak 3":
        #Cap de les signals que enviem al procés sembla sortir del server netament abans de tancar
        #que vol dir que sempre ens menjavem el timeout encara que fessim pkill (-15 (SIGTERM (default kill signal))) ts3
        #Random: potser fent un exec sleep 1; abans del kill en el bindsym de i3config haguessim pogut guanyar la carrera? tot i aixi m'agrada més la solucio actual
        import os #lazy imports per reduir el temps d'execució en el path habitual (con.name != Teamspeak)
        import time
        os.system("i3-msg kill") #amb bastanta seguretat la finestra focusejada sera el ts, ens podrien guanyar la carrera si s'ho proposessin tho
        time.sleep(1) #leave time for the application to disconnect and shutdown before ensuring no background process is left behind
        os.system("pkill -9 ts3")

main()
