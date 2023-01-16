# list_queue.py

class Queue:
    def __init__(self):
        self._items = []

    def enqueue(self, item):
        self._items.append(item)

    def dequeue(self):
        try:
            return self._items.pop(0)
        except IndexError:
            print("Empty queue")

    def __len__(self):
        return len(self._items)

    def __repr__(self):
        return f"Queue({self._items})"

