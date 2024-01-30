#!/usr/bin/env python3
import json, subprocess

output = subprocess.check_output(['i3-msg', '-t', 'get_workspaces'])
workspaces = json.loads(output)

workspaces_names = [*map(lambda x: x['name'], workspaces)]

valid_workspaces = [*map(lambda x: str(x), range(1,11))]
valid_workspaces += [*map(lambda x: "F"+str(x), [*range(1, 13)])]

last_desktop_slash_default_value = "F12"
new_workspace = next((i for i in valid_workspaces if i not in workspaces_names), last_desktop_slash_default_value)

#next_num = next(i for i in valid_workspaces if not [ws for ws in workspaces if ws['name'] == i])

subprocess.call(['i3-msg', 'workspace %s' % new_workspace])
