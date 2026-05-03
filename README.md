# Register Level Programming
I created this repo to keep track of progress and my project files. My goal is get a deeper understanding of how embedded systems work under all the abstraction layers so, I took it upon my self to learn register-level-programming using a two-wheeled self balancing bot which I made for learning STM32 and I think it is the perfect pick.

To build good habits and reduce my dependence on AI, am going to mainly stick with the reference manuals, data sheets, online courses and forums but I will be using AI to understand these concepts better and increase my efficieny.

## Project Hardware
- STM32F401CCU6
- IMU - MPU6500
- Bonka 7.4V 1300mAh 25C 2S LiPo
- N20 Micro-gear Motors w/ 34mm wheels
- TB6612FNG Motor Driver

### Pin Connections
<table>
<tr valign="top">
<td style="padding: 25px">

<table>
  <tr><td colspan="2" align="center"><b>MPU6500</b></td></tr>  
  <tr><th>PIN</th><th>STM32</th></tr>
  <tr><td>VCC</td><td>3.3V</td></tr>
  <tr><td>SCL</td><td>PB8</td></tr>
  <tr><td>SDA</td><td>PB9</td></tr>
  <tr><td>INT</td><td>PC13</td></tr>
  <tr><td>ADO</td><td>GND</td></tr>
</table>

</td>
<td style="padding: 25px">

<table>
  <tr><td colspan="2" align="center"><b>TB6612FNG</b></td></tr>
  <tr><th>PIN</th><th>STM32</th></tr>
  <tr><td>AIN1</td><td>PB3</td></tr>
  <tr><td>AIN2</td><td>PB4</td></tr>
  <tr><td>BIN1</td><td>PB5</td></tr>
  <tr><td>BIN2</td><td>PB6</td></tr>
  <tr><td>PWMA</td><td>PA6</td></tr>
  <tr><td>PWMB</td><td>PA7</td></tr>
  <tr><td>STBY</td><td>3.3V</td></tr>
  <tr><td>VM</td><td>7.4V</td></tr>
  <tr><td>VCC</td><td>3.3V</td></tr>
  <tr><td>AO1</td><td>M1.1</td></tr>
  <tr><td>AO2</td><td>M1.2</td></tr>
  <tr><td>BO1</td><td>M2.1</td></tr>
  <tr><td>BO2</td><td>M2.2</td></tr>
</table>

</td>
<td style="padding: 25px">

<table>
  <tr><td colspan="2" align="center"><b>Motor 1</b></td></tr>
  <tr><th>PIN</th><th>STM32</th></tr>
  <tr><td>C1</td><td>PA2</td></tr>
  <tr><td>C2</td><td>PA3</td></tr>
  <tr><td>VCC</td><td>3.3/5V</td></tr>
</table>
<table>
  <tr><td colspan="2" align="center"><b>Motor 2</b></td></tr>
  <tr><th>PIN</th><th>STM32</th></tr>
  <tr><td>C1</td><td>PB0</td></tr>
  <tr><td>C2</td><td>PB1</td></tr>
  <tr><td>VCC</td><td>3.3/5V</td></tr>
</table>

</td>
</tr>
</table>

### Version 1.0 & 1.1
Version 1.0 was intented to use 2 seprate PCB's - power board & main board but soon I realised it makes length of the robot very long which is not practical so, in version 1.1 I shifted everyhting to a single PCB. Both 1.0 & 1.1 used 2 Mini 360 buck converters for 3.3V and 5V power rails. But I faced the issue of not being able to adjust the voltage and they broke...
[Version 1 Snapshots](Snapshots/Version%201)

<p align="center">
  <img src="Snapshots/Version 1/v1.0.3.jpg" width="500px" height="300px">
  <img src="Snapshots/Version 1/v1.1.2.jpg" width="500px" height="300px">
</p>


### Version 2.0 & 2.1
Version 2.0 I changed the Mini-360 buck to the more standard LM2596 DC-DC buck converters but I wasn't getting 2 different output rails 3.3v and 5v and both rails were outputing 5v for some reason which I couldn't figure out so, in version 2.1 I removed the 5v buck and wired everything to 3.3v which seemed to do the trick.

The reason I needed 5V was because the motor enocders were labeled VCC and I couldn't find any documentaion on them so, I wired them to 5v but not sure see if they will work with 3.3v as I still haven't tested them yet.
[Version 2.0 & 2.1 Snapshots](Snapshots/Version%202)

<p align="center">
  <img src="Snapshots/Version 2/v2.0.1.jpg" width="500px" height="300px">
  <img src="Snapshots/Version 2/v2.1.1.jpg" width="500px" height="300px">
</p>

<p align="center">
  <a href = "https://www.youtube.com/watch?v=Q476zTCFYxs">
    <img src="https://img.youtube.com/vi/Q476zTCFYxs/maxresdefault.jpg" width="40%">
  </a>
</p>

<div align="center"> This is a video click on it! </div>

> [!IMPORTANT]
> The code for project at this stage was fully AI generated.

### Version 3
Version 3 is a redo of the whole hardware setup,the previous versions used hand-cut acrylic sheet for the base and oversized bolts&nuts(bought in a hardware store) to connect the PCB with the base which resulted in added weight along with imbalance. Therefore, in this version am using a 3D printed base, M3 screws which fit thourgh the PCB holes and a single non-variable 3.3v buck converter.
[Version 3 Snapshots](Snapshots/Version%203)

<p>
  <img src="Snapshots/Version 3/v3.0.1.jpg" width="300px" height="300px">
  <img src="Snapshots/Version 3/v3.0.4.jpg" width="400px" height="300px">
  <img src="Snapshots/Version 3/v3.0.2.jpg" width="500px" height="300px">
</p>

> [!NOTE]
> Images had to be compressed a lot to reduce total repo size.

## Tools & Development
- Debian 13
- bash
- Neovim
- Obsidain
- Make
- arm-none-eabi-gcc

## Sources
- [RM0368 Rev 6 - Reference manual](https://www.st.com/resource/en/reference_manual/rm0368-stm32f401xbc-and-stm32f401xde-advanced-armbased-32bit-mcus-stmicroelectronics.pdf)
- [Makefile Guide](https://makefiletutorial.com/#getting-started)
- [Officail GCC Documentation](https://gcc.gnu.org/onlinedocs/)
- [Embedded Systems Programming - FastBit Academy](https://www.udemy.com/share/101Wdc3@q3zTlLfVGPCEW4a8bv7NjY2NR9K4dHKtHkx5YzrXL_R7W3licZ7vChKeaS9TfTxH9Q==/)


## Current Progress
- Completed hardware connections but I forgot to redo the circuit diagram and also I have to search the 3D model which I created.
- I have gone through the reference manual - sections 2,3,5,6 and 8(a little).
- Started writing code - writing my own `Makefile`, `Startup file` and `linker file` at the moment and succesfully compiled an `.elf` file.
