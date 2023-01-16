# doors/doors.py
class Doors:
    def __init__(self):
        self.door_state = 0

    def open_door(self, position):
        self.door_state |= (1 << position)

    def close_door(self, position):
        self.door_state &= ~(1 << position)

    def is_open(self, position):
        return self.door_state & (1 << position)

    def is_open2(self, position):
        return (self.door_state >> position) & 1

    def toggle_door(self, position):
        self.door_state ^= (1 << position)
