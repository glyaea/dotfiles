from pathlib import Path


_ = Path("list.md")
_.write_text("\n".join(sorted(_.read_text().splitlines())))
