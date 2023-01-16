# box/box.py
class Box:
    TOP    = 1
    BOTTOM = 1 << 1  # 2
    LEFT   = 1 << 2  # 4
    RIGHT  = 1 << 3  # 8
    SIDES = LEFT | RIGHT

    def __init__(self, borders):
        self.borders = borders

    @property
    def has_side(self):
        return bool(self.borders & self.SIDES)

    @property
    def has_both_sides(self):
        return self.borders & self.SIDES == self.SIDES
