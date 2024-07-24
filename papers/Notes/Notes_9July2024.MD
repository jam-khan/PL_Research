# Paper Title: Capabilities: Effects for Free

DOI: --

## Summary
What is a capability?
It is basically a token which allows the program to perform some operation on a resource.
Capability-Safe languages and sytems pass resources with object capabilities and only objects
with access to a specific resource-access capability can provide its access.
This allows for avoiding malicious implementation in huge codebase where a part of code
may have access to resources that it doesn't need and therefore, it may be able to 
exploit these resources.

Reasoning about capability-based system is mainly done informally, but it could be used for formal
just like informal reasoning.

Recent work:
1. Logic that formalizes capability-based reasoning about trust between objects. (Drossopoulou et. al. [6])
2. Instead of formalizing capability-based reasoning, formalize and reason its use.
    2.1 Formalism for reasoning about direct and indirect (influence on others usage) use of capability. (Dimoulas et al. [5])
    2.2 Effect Parametricity Theorem: Formulate an idea that limits the effects of an capabilities
    object based on its capabilities and then, use to reason about logical relations in higher-order
    settings.

Main question:
Can capabilities be used to enhance formal reasoning that is currently done without relying on capabilities? What value do capabilities add to existing formal reasoning approaches?

Case: Effect Systems formal reasoning approach (types + effects)
Why? Relatively simple and effectives linked with capabilities.
--- Effect if capability ---
    
Challenge to effect systems: annotation over-head.
Possible solution: Effect inference, but errors get tricky requiring detailed understanding of
internal structure. 

Capabilities as alternative to reduce overhead for effect annotations.

    import log : String -> Unit with effect File.write
    e

Explanation: expression e must be passed a function of type String -> Unit when invoked and it has
no more than the effect File.write when invoked.

e can only have any effect via functions available to it and those functions will have some effects
with a upper bound limit on those effects.

Benefits:
1. No requirement for e to have effect annotations
2. No need to analyze its structure.
3. Trust with only specific resources.
