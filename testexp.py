import matplotlib.pyplot as plt
import math
import csv

cutoff = 40

x = []
y = []

for n in range(2, 256):
    for j in range(1, 10000):
        overround = j/float(10000)
        alpha = overround / (n * math.log(n))
        quotient = 1 / float(n * alpha)
        if (quotient < cutoff):
            print n, j
            x.append(n)
            y.append(j)
            break

with open('overround.csv', mode='w') as ov_file:
    ov_writer = csv.writer(ov_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

    ov_writer.writerow(['Number of options', 'Minimum overround'])
    for n in range(0, 254):
        ov_writer.writerow([x[n], y[n]])

# plt.plot(x,y)
# plt.xlim(0,255)
# plt.xlabel('Number of Outcomes')
# plt.ylabel('Minimum overround (bps)')
# plt.show()
