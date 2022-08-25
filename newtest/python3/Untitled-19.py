def main():
      l = input()
      st = input()
      s = int(input())
      l_s = [chr(i) for i in range(ord('a'),ord('z')+1)]
      l_b = [chr(i) for i in range(ord('A'),ord('Z')+1)]
      cpy = ""
      for i in st:
            if i in l_s:
                  cpy += l_s[(l_s.index(i)+s)%26]
            elif i in l_b:
                  cpy += l_b[(l_b.index(i)+s)%26]
            else:
                  cpy += i
      print (cpy)

if __name__ == "__main__":
      main()