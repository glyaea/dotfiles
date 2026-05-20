import curses
import pathlib


ACTIONS = ["add bookmark", "remove bookmark", "sort bookmarks"]
BOOKMARKS = pathlib.Path("bookmarks.html")


def menu(screen):
	curses.curs_set(0)
	curses.use_default_colors()
	choice = 0
	while True:
		screen.clear()
		for i, action in enumerate(ACTIONS):
			mark = "x" if choice == i else " "
			screen.addstr(i, 0, f"[{mark}] {action}")
		key = screen.getch()
		if key == curses.KEY_UP:
			choice = (choice - 1) % len(ACTIONS)
		elif key == curses.KEY_DOWN:
			choice = (choice + 1) % len(ACTIONS)
		elif key in (10, 13):
			return ACTIONS[choice]


choice = curses.wrapper(menu)

if choice == "add":
	url = input("URL: ").rstrip("/")
	BOOKMARKS.write_text(BOOKMARKS.read_text() + f'\n<A HREF="{url}">{url}</A>')
elif choice == "remove":
	url = input("URL: ").rstrip("/")
	BOOKMARKS.write_text("\n".join(line for line in BOOKMARKS.read_text().splitlines() if f'HREF="{url}"' not in line))
else:
	BOOKMARKS.write_text("\n".join(sorted(BOOKMARKS.read_text().splitlines())))
