# Glossary

- **MRI**: Matz Ruby Intepreter, also known as CRuby. It's the reference implementation for Ruby.

- **GIL**: Global Interpreter Lock. An implementation choice of MRI that prevents multiple threads from running in parallel on non-blocking work. Code executed by the interpreter holds onto a global lock that prevents other threads from executing.

- **GVL**: Global VM Lock. Similar to GIL, but renamed to reflect the evolution of MRI to run on a bytecode implementation called YARV.

- **YARV**: Yet Another Ruby VM. Introduced in Ruby 1.9 and has been the standard implementation for CRuby since. Rather than interpreting Ruby code as the program runs, it is turned into VM instructions that are executed by the Ruby VM.

- **Blocking work**: work that is delegated out of the interpreter into an external process. Typically database queries, HTTP requests, or file I/O.

- **Ractors**: Ruby Actors. Each Ractor has its own VM lock, allowing it to be run in parallel with other Ractors. The catch is that Ractors cannot share mutable state.

- **Fibers**: A primitive that enables creating code blocks that can be paused/resumed, much like a Thread. However, unlike a Thread a Fiber can never be preempted and it must be scheduled by the programmer, not the VM.

- **Preemption**: Interupting an executing task with the intention of resuming it later.

- **Context switching**: Interupting an executing task and switching to another. Involves storing the state of a process or thread so that it can later be resumed. Context switching is often computationally expensive.

- **Non-blocking Fiber**: A concept introduced in Ruby 3.0. When reaching an operation that would normally block a Fiber, e.g. sleep, the Fiber will instead yield control to other Fibers and allow the Fiber Scheduler to handle blocking/resuming the original Fiber when it can proceed.

