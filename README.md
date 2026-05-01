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
**MPU 6500**
| PIN | STM32 |
|-----|-------|
| VCC | 3.3V  |
| SCL | PB8   |
| SDA | PB9   |
| INT | PC13  |
| ADO | GND   |

**TB6612FNG**
| PIN | STM32 |
|-----|-------|
| AIN1| PB3   |
| AIN2| PB4   |
| BIN1 | PB5 |
| BIN2 | PB6 |
| PWMA | PA6 |
| PWMB | PA7 |
| STBY | 3.3V |
| VM | 7.4V |
| VCC | 3.3V |
| AO1 | M1.1 |
| AO2 | M1.2 |
| BO1 | M2.1 |
| BO2 | M2.2 |

**Motors**
| Motor | Pin | STM32 |
|-------|-----|-------|
| Motor1 | C1 | PA2 |
| Motor1 | C2 | PA3 |
| Motor1 | VCC | 5V |
| Motor2 | C1 | PB0 |
| Motor2 | C2 | PB1 |
| Motor2 | VCC | 5V |

### Version 1
Version 1 used 2 Mini 360 buck converters for 3.3V and 5V power rails. But I faced the issue of not being able to adjust the voltage and they broke...
![inital development snapshot - 1](Pictures%20&%20Videos/Version%201/v1.4.JPG)
![inital development snapshot - 1](Pictures%20&%20Videos/Version%201/v1.2.JPG)
![Version 1 Pictures](Pictures%20&%20Videos/Version%201) - Version 1 Snapshots


## Tools & Development
- Debian 13
- Neovim
- Obsidain
- Make
- arm-none-eabi-gcc

## Current Progress
- I have gone through the reference manual - sections 2,3,5,6 and 8(a little).
- Started writing code - writing my own `Makefile`, `Startup file` and `linker file` at the moment.
