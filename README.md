# view-mode.yazi

Set the column ratios to match your viewing needs. The default 3,5,4 is great for exploring directories, but sometimes your task at hand is different. You may have limited horizontal space, preview files in the current directory, or just look at a file in full.
This plugin allows all of that while leaving you in full control of how it's done by just being clever about adjusting the column ratio.

# Syntax:
# In keymap keymap.toml
[[mgr.prepend_keymap]]
on   = "<Keystroke>"
run  = "plugin view-mode <column1> <column2> <column3>"
desc = "Your view mode name"

OR you can use the compact inline style:
manager.prepend_keymap = [
    { on = "<C-0>", run = "plugin view-mode 0 0 8", desc = "Quick Look" },
]

#Examples
For mac-like finder viewing modes, I use the following.  

# Examples
	# For Mac-like Finder viewing modes, add this to your keymap.toml:
	
	[manager]
	prepend_keymap = [
		{ on = "<C-0>",	run = "plugin view-mode 0 0 8", desc = "Quick Look" },
		{ on = "<C-1>",	run = 'shell -- rofi -theme fullscreen-preview -show filebrowser -filebrowser-command "ya emit reveal" -filebrowser-directory "$(pwd)"', desc = "Grid view" },
		{ on = "<C-2>",	run = "plugin view-mode 0 8 0", desc = "List View" },
		{ on = "<C-3>",	run = "plugin view-mode 3 4 5", desc = "Columns View" },
		{ on = "<C-4>", run = [ "plugin view-mode 0 2 6", "linemode none" ], desc = "Gallery View" },
	]

Icons view is not handled by this plugin, but using Rofi for this is explained at https://yazi-rs.github.io/docs/tips.
Gallery view is very space limited, so I set linemode to none in order to make the file names readable.
The sum of inputs doesn't have to add to 8, but I think it's a good idea to use a consistent number so things line up when regardless of your view mode.
