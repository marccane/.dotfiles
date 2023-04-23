#!/usr/bin/env python3
import json, subprocess

output = subprocess.check_output(['i3-msg', '-t', 'get_workspaces'])
workspaces = json.loads(output)

valid_workspaces = [*range(1,11)] + [*range(71, 80)] + [*range(710, 713)]

next_num = next(i for i in valid_workspaces if not [ws for ws in workspaces if ws['num'] == i])

subprocess.call(['i3-msg', 'workspace number %i' % next_num])
