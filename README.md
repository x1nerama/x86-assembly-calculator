<div align="center">

<h1> Basic Calculator in X86 Linux Assembly </h1>

<br/>

<img src="https://user-images.githubusercontent.com/101501854/217953548-a48f7620-4f2e-4f8f-b665-723d71d5297e.gif" width="600px"> 

</div>

<h3> Welcome to my simple calculator project! </h3>

It is a calculator that can only perform **"addition"**, **"subtraction"**, **"multiplication"** operations. Division operation is not in this project but I am trying to add it.

<h2> USAGE </h2>

Its use is simple as you can see above. You just select an operator and enter 2 digits.

Operators that need to be entered must be **'+'**, **'-'**, **'*'**.
<br/>

<h2> Creating Object File and Running Assembly Project </h2>

You can follow the steps below to compile the project:

To get an Object file:

```bash
nasm -f elf64 calc.asm
```

To create an executable

```
ld -o calc calc.o
```

And now just run:
```
./calc
```

<h2> Project algorithm </h2>

I wanted to add the algorithm I created in the project here, in case anyone would like to examine the codes. Here is the algorithm:
<br/>
<div align="center"> 
    <img src="https://user-images.githubusercontent.com/101501854/217955188-c36e055f-7592-4650-a9be-b3728d09a4d8.png" width="450px">
    <h4> Project Algorithm </h4>
</div>


<br/>

I developed the project according to this algorithm. First, an operator input is taken from the user and operations are performed by jumping to different tags according to the selected operator.

Finally, by going to the label named '_printResult', the result of the operation is displayed and the program is terminated.

If an operator other than the operator specified in the program is entered, an error message is printed on the screen and the program is terminated directly.
