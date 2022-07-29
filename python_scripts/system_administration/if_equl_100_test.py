import if_example_equal_100
import unittest

class Test_if(unittest.TestCase):
	def test_if(self):
		result = if_example_equal_100.check_if()
		self.assertEqual(result, 100)
		
if __name__ == '__main__':
	unittest.main()
