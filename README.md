# JayBus: Universal Modular Control Architecture

## Project Overview
The **JayBus** is a low-cost, scalable platform for distributed control applications, such as automotive automation (e.g., keyless entry, lock monitoring for older vehicles) and greenhouse management (e.g., sensor monitoring, irrigation control). It features an **RP2040** master microcontroller communicating with **agnostic slave nodes** (ATmega328P, PIC18F1320) over an **RS485 bus**. Slaves have versatile hardware ports (analog, relay, digital, PWM) and generic firmware to execute dynamic commands, enabling flexible GPIO control without reprogramming.

## Vision
To create a **versatile, modular control platform** that:
- Enables reliable, long-distance control for diverse applications.
- Supports cross-platform use (automotive, greenhouse, industrial) with minimal hardware changes.
- Provides dynamic GPIO and feature control via packet-based commands, reducing reprogramming needs.
- Achieves low cost (~$20-30 for 1 master + 2 slaves) and power efficiency for DIY and small-scale deployments.
- Empowers hobbyists and developers with a flexible, open-source system for rapid prototyping and customization.

## Core Principles
- **Modularity**: Design agnostic slave nodes with standardized, versatile ports (analog, relay, digital, PWM) to support diverse applications without hardware redesign.
- **Scalability**: Utilize RS485 bus to support up to 32 slave nodes, enabling expansion for complex systems (e.g., multiple greenhouse zones, vehicle subsystems).
- **Flexibility**: Implement generic slave firmware for dynamic GPIO control and script execution, minimizing reprogramming for new use cases.
- **Cost Efficiency**: Leverage low-cost microcontrollers (RP2040 ~$1, ATmega328P/PIC18F1320 ~$2) and components to keep total cost ~$20-30 for a basic system.
- **Reliability**: Ensure noise immunity via RS485 differential signaling and robust protocol (e.g., CRC8 error checking) for automotive and industrial environments.
- **Power Efficiency**: Use sleep modes (RP2040 ~180 µA, slaves ~1-10 µA) to minimize power consumption, critical for battery-powered applications like vehicles.
- **Open-Source**: Provide all firmware, schematics, and documentation under MIT License to foster community collaboration and customization.
- **Ease of Use**: Support intuitive command protocols and modular connectors (e.g., screw terminals) for rapid prototyping and deployment by hobbyists.

## 3. System Architecture

The JayBus architecture is a modular, master-slave system designed for flexibility and power efficiency. It is composed of three primary layers: the central controller, the external modules, and the communication bus that links them.

### 3.1 High-Level Component Roles

| Component | Role | Description |
| :--- | :--- | :--- |
| **Main Control Unit** | **Master Controller** | The central brain of the system. It houses the primary logic, manages the external bus, and provides the main interface for user control and future expansion. |
| **Slave Modules** | **Distributed I/O** | Small, dedicated microcontrollers responsible for a specific task at a specific location (e.g., controlling relays, reading sensors, interfacing with car systems). |
| **JayBus (RS-485)** | **Communication Backbone** | The robust physical network that connects the Main Control Unit to all Slave Modules, allowing for reliable data transfer over distance in noisy environments. |

### 3.2 Main Control Unit Internals

The Main Control Unit is built on a dual-processor "Sentry/Worker" model to achieve maximum power efficiency, making it ideal for battery-powered automotive applications.

* **Sentry / IO Co-Processor (ATmega328P)**
    * **State:** Always On (in an ultra-low-power sleep mode).
    * **Primary Role:** To act as the real-time controller, bus master, and gatekeeper.
    * **Key Responsibilities:**
        * Listens for commands from the wireless module (BLE/RF).
        * Drives the on-board transistors for direct control of locks, lights, horn, etc.
        * Manages all communication on the external RS-485 JayBus.
        * Decides when a task is complex enough to require waking the Worker processor.
        * Controls the power supply to the Worker processor via a MOSFET switch.

* **Worker / Application Processor (RP2040)**
    * **State:** Normally Off (zero power consumption).
    * **Primary Role:** To act as the high-level brain for complex tasks and future expansion.
    * **Key Responsibilities:**
        * Executes complex, multi-step sequences (e.g., remote start logic, data logging).
        * Drives any future user interface (LCD touchscreen).
        * Manages high-speed peripherals (SD card, GPS).
        * Communicates its decisions and requests back to the Sentry processor.

* **Internal Communication Link**
    * A dedicated, on-board **UART** connection allows the RP2040 and ATmega328P to communicate with each other privately, without using the external bus.

### 3.3 External Bus & Slave Module Examples

The Main Control Unit acts as the master, orchestrating the actions of various slave modules connected to the bus.

* **Gauge Cluster Slave**
    * **Purpose:** To monitor the car's existing door-open switches.
    * **Interfaces With:** The signal wires behind the instrument cluster.
    * **Function:** Sends a message on the JayBus when any door state changes.

* **OBD-II Slave**
    * **Purpose:** To read diagnostic data from the vehicle.
    * **Interfaces With:** The car's OBD-II port.
    * **Function:** Periodically requests data (RPM, speed, temp) and reports it on the JayBus.

* **Remote Start Slave**
    * **Purpose:** To safely manage the high-current ignition circuits.
    * **Interfaces With:** High-current relays connected to the car's ignition, accessory, and starter wires.
    * **Function:** Receives commands from the Main Unit to execute the precise relay sequence for remote start.

## 4. Communication Protocol

Communication occurs over a standard **RS-485 physical bus** for maximum noise immunity and range. The protocol itself is a custom, human-readable ASCII command set.

**Packet Structure:**
`ADDRESS:COMMAND:PARAM1:PARAM2:CHECKSUM`

**Core Command Set:**
| Command | Parameters | Description |
| :--- | :--- | :--- |
| `PIN_MODE` | Pin, Mode | Sets a slave's GPIO pin to INPUT, OUTPUT, or INPUT_PULLUP. |
| `D_WRITE` | Pin, State | Sets a digital output pin HIGH or LOW. |
| `D_READ` | Pin | Requests the digital state of an input pin. |
| `A_READ` | Pin | Requests the 10-bit analog value of an input pin. |
| `PWM_WRITE` | Pin, DutyCycle | Sets the PWM duty cycle (0-255) on a PWM-capable pin. |
| `WRITE_REG`| Address, Value| Directly writes a value to a hardware register on the slave MCU. |

## 5. Hardware Modules

The JayBus platform is built around a set of standardized, role-based hardware modules. The specific implementation of each module can be adapted to meet the power, I/O, and processing requirements of the target application.

### Module Roles

* **Master Controller Module (MCM):** This is the central brain of the system. It initiates all communication, processes high-level logic, runs complex sequences or scripts, and serves as the gateway for user control. Its internal design is application-dependent.

* **Digital I/O Module (DIM):** A standardized slave board designed as the "muscle" of the system. It features a bank of on-board transistor drivers or relays to control higher-power loads like locks, lights, pumps, and motors.

* **Analog/Sensor Module (ASM):** A standardized slave board designed as the "senses" of the system. It features robust input protection and signal conditioning circuits to reliably read data from a wide variety of analog sensors (e.g., temperature, pressure, soil moisture).

* **Specialized Interface Module (SIM):** A custom slave board designed to communicate with a specific, non-standard system. Its role is to translate a proprietary protocol into the standardized JayBus protocol (e.g., an OBD-II or Gauge Cluster interface for a vehicle).

### Example Implementations

This demonstrates how the modular roles can be configured for different projects:

#### 1. Automotive System (e.g., 2001 Accord)
This application prioritizes ultra-low power consumption to protect the vehicle's battery.

* **Master Controller Module:** Implemented using the **dual-processor "Sentry/Worker" architecture** on a single PCB.
    * An **ATmega328P** acts as the always-on Sentry/IO processor, handling basic I/O and listening for wireless commands or bus activity.
    * An **RP2040** acts as the normally-off Worker, woken only for high-level tasks like running a user interface or complex sequences.
* **Slave Modules Used:** `Digital I/O Modules` (for keyless entry), `Specialized Interface Modules` (for gauge cluster and OBD-II).

#### 2. Greenhouse System (AC Wall Power)
This application prioritizes simplicity and constant monitoring, as power is not a constraint.

* **Master Controller Module:** Implemented with a single, **always-on RP2040 (Pico)**.
    * The "Sentry" co-processor is not needed, which simplifies the hardware and software design.
    * The RP2040 directly manages the bus, logs data, and runs the user interface continuously.
* **Slave Modules Used:** `Analog/Sensor Modules` (for temperature, humidity, soil moisture), `Digital I/O Modules` (for irrigation pumps, fans, lights).

#### 3. Off-Grid System (e.g., Solar-Powered Orchard)
This application is a hybrid, requiring robust I/O *and* careful power management.

* **Master Controller Module:** This would revert to the **dual-processor "Sentry/Worker" architecture**, just like the automotive project, to conserve precious battery life overnight and during cloudy periods.
* **Slave Modules Used:** The same `Analog` and `Digital` slaves as the greenhouse system, but their firmware would be programmed to use deep sleep modes between readings to minimize their own power draw.

This approach ensures that your core design for the slave modules and the JayBus protocol remains consistent and reusable, while allowing the heart of the system—the Master Controller—to be perfectly adapted to the specific needs of any project you tackle.

## 6. Project Roadmap & Status

* [ ] **Phase 0: System Definition & Planning** - *Complete*
* [ ] **Phase 1: Proof of Concept** - Breadboard validation of a single slave module and bus communication.
* [ ] **Phase 2: Hardware Design** - Schematic and PCB layout of the Main Control Unit and first slave modules in Altium Designer.
* [ ] **Phase 3: Firmware Development** - Development of the Master firmware for the RP2040 and the command interpreter firmware for the slave MCUs.
* [ ] **Phase 4: Integration & Testing** - Assembly, deployment, and real-world testing in the target application.

This document serves as the guiding vision for the project. All development should align with these core principles and architectural decisions.