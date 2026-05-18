# view-mode.yazi

Set the column ratios to match your viewing needs. The default 1,4,3 is great for exploring directories, but sometimes your task at hand is different. You may have limited horizontal space, preview files in the current directory, or just look at a file in full.
This plugin allows all of that while leaving you in full control of how it's done by just being clever about adjusting the column ratio.

# Syntax:
In keymap keymap.toml
[[mgr.prepend_keymap]]
on   = "<Keystroke>"
run  = "<3digits>"
desc = "Your view mode name"

Each digit is the column width relative to the sum of the digits. It may be a little confusing, but I couldn't figure out how to reliably parse "0 2 6" even after a lot of troubleshooting. If you've got a fix, let me know!

OR you can use the compact inline style:
manager.prepend_keymap = [
    { on = "<Keystroke>", run = "plugin view-mode <3digits>", desc = "Your view mode name" },
]

#Examples
For mac-like finder viewing modes, I use the following.  

# Examples
	# For Mac-like Finder viewing modes, add this to your keymap.toml:
	
	[manager]
	prepend_keymap = [
		{ on = "<C-0>",	run = "plugin view-mode 008", desc = "Quick Look" },
	<img width="1074" height="714" alt="image" src="https://github.com/user-attachments/assets/faa937e3-9a0b-4cfe-8799-a90628c38786" />	
		{ on = "<C-1>",	run = 'shell -- rofi -theme fullscreen-preview -show filebrowser -filebrowser-command "ya emit reveal" -filebrowser-directory "$(pwd)"', desc = "Grid view" },
		{ on = "<C-2>",	run = "plugin view-mode 080", desc = "List View" },
		<img width="1074" height="714" alt="image" src="https://github.com/user-attachments/assets/2aeb5e08-6276-4f44-97e4-7305c15ebd18" />
		{ on = "<C-3>",	run = "plugin view-mode 143", desc = "Columns View" },
		<img width="1074" height="714" alt="image" src="https://github.com/user-attachments/assets/1cb899c9-7e65-429c-b446-659f1cd8a623" />
		{ on = "<C-4>", run = [ "plugin view-mode 026", "linemode none" ], desc = "Gallery View" },
	]
	<img width="1074" height="714" alt="image" src="https://github.com/user-attachments/assets/2b10578e-76ae-4afc-88f8-8810cc6ad676" />


Icons view is not handled by this plugin, but using Rofi for this is explained at https://yazi-rs.github.io/docs/tips.
Gallery view is very space limited, so I set linemode to none in order to make the file names readable. You may or may not want to set specific linemodes for the other views.
The sum of the digits doesn't have to add to 8, but I think it's a good idea to use a consistent number so things line up when regardless of your view mode.
