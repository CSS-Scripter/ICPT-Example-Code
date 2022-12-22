// See https://aka.ms/new-console-template for more information

using System.Reflection.Metadata.Ecma335;

Console.WriteLine("Hello, and welcome to the Reactangle assembly line.");
Console.WriteLine("What length should I make it?");
Console.Write("Length: ");
int lengthInput = Convert.ToInt32(Console.ReadLine());

Console.WriteLine("Great! Now what width should it get?");
Console.Write("Width: ");
int widthInput = Convert.ToInt32(Console.ReadLine());

Console.WriteLine("Great, you selected the following reactangle: " + lengthInput + "x" + widthInput);
Reactangle reactangle = new Reactangle(widthInput, lengthInput);

Actions actions = new Actions(reactangle);
actions.AskForAction();

class Actions
{
    private Dictionary<int, Delegate> actionsMap = new Dictionary<int, Delegate>();
    private List<Delegate> callstack = new List<Delegate>();
    private Reactangle reactangle;

    public Actions(Reactangle reactangle)
    {
        this.reactangle = reactangle;
        actionsMap[0] = SetLength;
        actionsMap[1] = AddWidth;
        actionsMap[2] = Multiply;
        actionsMap[3] = Finish;
    }

    public void AskForAction()
    {
        Console.WriteLine("Would you like any modifications?");
        Console.WriteLine("1: Make length x");
        Console.WriteLine("2: Add x to the width");
        Console.WriteLine("3: Scale the reactangle by x");
        Console.WriteLine("4: Finish");
        Console.Write("Your choice: ");
        int actionIndex = Convert.ToInt16(Console.ReadLine());
        actionsMap[actionIndex - 1].DynamicInvoke();
    }

    public void SetLength()
    {
        Console.Write("New length: ");
        int newLength = Convert.ToInt32(Console.ReadLine());
        callstack.Add(() => reactangle.SetLength(newLength));
        AskForAction();
    }

    public void AddWidth()
    {
        Console.Write("Width addition: ");
        int addWidth = Convert.ToInt32(Console.ReadLine());
        callstack.Add(() => reactangle.AddWidth(addWidth));
        AskForAction();
    }

    public void Multiply()
    {
        Console.Write("Multiplication: ");
        int multi = Convert.ToInt32(Console.ReadLine());
        callstack.Add(() => reactangle.Scale(multi));
        AskForAction();
    }

    public void Finish()
    {
        Console.WriteLine("");
        Console.WriteLine("Reactangle: " + reactangle.ToString());
        foreach (Delegate action in callstack)
        {
            action.DynamicInvoke();
            Console.WriteLine("Reactangle: " + reactangle.ToString());
        }
        Console.WriteLine("");
        Console.WriteLine("Thanks for choosing the Reactangle assembly line, see you next time!");
    }
    
}

class Reactangle
{
    private int width;
    private int length;
    public Reactangle(int width, int length)
    {
        this.width = width;
        this.length = length;
    }

    public void SetLength(int newLength)
    {
        length = newLength;
    }

    public void AddWidth(int addition)
    {
        width += addition;
    }

    public void Scale(int multiplier)
    {
        width *= multiplier;
        length *= multiplier;
    }

    public string ToString()
    {
        return width + " x " + length;
    }
}
