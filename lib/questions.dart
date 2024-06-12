const iteratorC = '''
void iteratorFunction()
{
    char fruits[3][7] = {"apple", "banana", "orange"};
    for (int i = 0; i < sizeof(fruits) / sizeof(fruits[0]); i++)
    {
        printf("%s\\n", fruits[i]);
    }
}
''';

const iteratorPython = '''
def iteratorFunction():
  fruits = ["apple", "banana", "orange"]

  for fruit in fruits:
    print(fruit)
''';

const pointerC = '''
void pointerFunction()
{
    int value = 10;
    int *intPointer = &value;

    printf("%p\\n", intPointer);
    printf("%i\\n", *intPointer);
}
''';

const mapC = '''
int getIndex(char key[])
{
    for (int i = 0; i < size; i++)
    {
        if (strcmp(keys[i], key) == 0)
        {
            return i;
        }
    }
    return -1; // Key not found
}

void insert(char key[], double value)
{
    int index = getIndex(key);
    if (index == -1)
    { // Key not found
        strcpy(keys[size], key);
        values[size] = value;
        size++;
    }
    else
    { // Key found
        values[index] = value;
    }
}

int get(char key[])
{
    int index = getIndex(key);
    if (index == -1)
    { // Key not found
        return -1;
    }
    else
    { // Key found
        return values[index];
    }
}

void printStructure()
{
    for (int i = 0; i < size; i++)
    {
        printf("%s: %d\\n", keys[i], values[i]);
    }
}

int main(int argc, char **argv)
{
    insert("John", 1234567890);
    insert("Mary", 246891012);
    insert("Peter", 987654321);

    printStructure();
}


''';

const evalRepr = '''
number = 10

function = eval("number * 3 + 8")

print(repr(function))
''';

const mapPowEnumPython = '''
numbers = [5, 3, 1, 2]

def multiply(x):
  return x + 5

result = map(multiply, numbers)
newResult1 = []
newResult2 = []
for x, y in enumerate(result):
  newResult1.append(eval("pow(y, 2)"))
  newResult2.append(eval("pow(x, 2)"))
print(newResult1)
print(newResult2)
 ''';

const builtInsPython = '''
data = [2, 3.5, 'hello', [1, 2, 3], {'a': 1, 'b': 2}, 4.5, 'world', 6, 7]

filtered_data = list(filter(lambda x: isinstance(x, int), data))
sorted_data = sorted(filtered_data, reverse=True)
squared_data = list(map(lambda x: x**2, sorted_data))
unique_squared_data = set(squared_data)
result = sum(unique_squared_data)

print(result)
''';

const structsC = '''
#include <stdio.h>
#include <string.h>

struct Student 
{
    char name[50];
    int age;
    double gpa;
};

void updateGPA(struct Student *student, double newGPA) 
{
    student->gpa = newGPA;
}

void printStudent(struct Student student) 
{
    printf("%s, %d, %.1f\\n", student.name, student.age, student.gpa);
}

int main() 
{
    struct Student alice = {"Alice", 20, 3.5};

    struct Student students[3] = 
    {
        {"Bob", 22, 3.8},
        alice,
        {"Charlie", 19, 3.2}
    };

    updateGPA(&students[1], 3.9);

    for (int i = 0; i < 3; i++) 
    {
        printStudent(students[i]);
    }

    return 0;
}


''';

const staticQuestions = {iteratorC, pointerC, structsC, mapC};
const dynamicQuestions = {
  iteratorPython,
  evalRepr,
  mapPowEnumPython,
  builtInsPython
};
