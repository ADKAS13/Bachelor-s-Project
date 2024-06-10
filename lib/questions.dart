const iteratorQuestionC = '''
void iteratorFunction()
{
    char fruits[3][7] = {"apple", "banana", "orange"};
    for (int i = 0; i < sizeof(fruits) / sizeof(fruits[0]); i++)
    {
        printf("%s\\n", fruits[i]);
    }
}
''';

const iteratorQuestionPython = '''
def iteratorFunction():
  fruits = ["apple", "banana", "orange"]

  for fruit in fruits:
    print(fruit)
''';

const pointerQuestionC = '''
void pointerFunction()
{
    int value = 10;
    int *intPointer = &value;

    printf("%p\\n", intPointer);
    printf("%i\\n", *intPointer);
}
''';

const mapQuestionC = '''
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

const staticQuestions = {iteratorQuestionC, pointerQuestionC, mapQuestionC};
const dynamicQuestions = {iteratorQuestionPython};
