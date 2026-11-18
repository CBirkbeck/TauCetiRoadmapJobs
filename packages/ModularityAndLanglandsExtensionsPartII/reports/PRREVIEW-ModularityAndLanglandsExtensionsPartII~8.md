# Review of ModularityAndLanglandsExtensionsPartII (pull request #2449 at bd1490f)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 145 lines changed since `47ed7fa` finds no finding. The four new targets (§§13.11–13.13: Newton–Thorne 2026 Theorem 6.5 and the holomorphy of `L(s, Sym^n π)` for Hilbert modular forms; §14.6: entireness of `Λ(Sym^n E, s)`) agree with their sources at the locators given and with the supplier sections they cite. The earlier finding that this roadmap and its parent supply each other is settled: ModularityAndLanglandsExtensions, at the head of its own pull request, no longer states the theorems proved here. There are four small corrections, none blocking, and one point for the human reviewers.

## C01 — The description still says the parent states §§4.9, 4.12, 4.20, 4.23, 4.29 and 4.30 and routes them through this roadmap; at the parent's head it does not

A reader of the description would conclude that the two roadmaps cannot merge as they stand. The description says: "At the head of its own pull request ModularityAndLanglandsExtensions states §§4.9, 4.12, 4.20, 4.23, 4.29 and 4.30, routes their proofs through this roadmap, and uses them in §§4.34–4.37. Those sections have to leave that roadmap". At that head Layer 4 has no §§4.9, 4.12, 4.20, 4.23, 4.29, 4.30, 4.35–4.37; its §4.34 (Sato–Tate over `ℚ`) is routed through its own §§2.18, 2.39 and 4.14; and its Scope paragraph (README line 2914 there) says that `SP_n` for every `n` and its consequences are stated and proved by this roadmap and that "no target here uses it".

The text that would be right: "ModularityAndLanglandsExtensions, at the head of its own pull request, states none of the theorems proved here and uses none of them; it names §§13.11–13.13 and 14.6 as consequences it does not own."

## C02 — The proof sketch of §13.12 does not say how an essentially conjugate self-dual `π` is brought to the conjugate self-dual case, and its *Needs:* line names no supplier for that step

The statement of §13.12 (line 1862) is for RAECSDC `π`, as Newton–Thorne 2026 Theorem 6.5(2) is. The supplier it cites, ModularityAndLanglandsExtensions §4.22, transfers the hypothesis only "to every non-induced RACSDC `GL₂/E`", which is what Clozel–Thorne Proposition 7.6 proves (ct17 lines 2453–2457). The source's proof (nt26 lines 2369–2371) treats the RACSDC case first and reduces the general case to it by a twist. The sketch, "Clozel–Thorne Proposition 7.6 …, an auxiliary character and an odd extension, §13.10, then base change", describes the inside of Proposition 7.6 (its character `φ` and the odd extension to `G_F`) and not this reduction, so an implementer is left with the RAECSDC case unproved.

The supplier exists: PotentialAutomorphyInfrastructurePartII §0.11 (algebraic characters with prescribed conjugate norm) and §0.8 (automorphy is invariant under algebraic twists); Layer 0 is already in the Dependencies of Layer 13. Adding to the sketch "for RAECSDC `π`, first twist to a RACSDC representation (PotentialAutomorphyInfrastructurePartII §§0.8, 0.11)" and those two sections to the *Needs:* line would close it.

## C03 — The pointer for general Bianchi forms in §13.12 goes to the Sato–Tate theorem, not to the potential automorphy of symmetric powers

Line 1870 says "General Bianchi forms instead use the potential route of ModularityAndLanglandsExtensions §4.42." At the parent's head §4.42 is the Sato–Tate conjecture in parallel weight over imaginary CM fields; the potential automorphy of symmetric powers of rank-two systems over CM fields, which is what replaces §13.12 for a representation that is not conjugate self-dual, is its §4.33 (and §4.42 is deduced from §4.33). Citing §4.33 would send the reader to the statement meant.

## C04 — The module docstring of `Suggested.lean` lists the headline theorems that are not statable and omits the four new ones

The opening of the README now presents the all-place lift for Hilbert modular forms of any parity and over CM fields, the holomorphy of `L(s, Sym^n π)` and the entireness of `Λ(Sym^n E, s)` as results of the roadmap, but the list under "Not statable at the pins" stops at §14.3. A reader of the Lean file cannot tell whether §§13.11–13.13 and 14.6 were left out on purpose. One bullet would do: §§13.11–13.13 lack automorphic representations of `GL_n` over totally real and CM fields and the local Langlands correspondence at every place; §14.6 lacks the `Sym^n` Weil–Deligne Euler factors and conductor of an elliptic curve at its bad primes (its consequence away from the conductor is the second stated theorem, applied to the newform of `E`).

## Deferred findings

- D01 — resolved: the parent's open head no longer states §§4.9, 4.12, 4.20, 4.23, 4.29, 4.30, 4.35–4.37; its Scope says no target there uses this roadmap.

## Previous findings

- R01 — not repaired: deferred (D01)

The previous report had no small correction and no format note.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §13.11 all-place lift for non-CM `π`, essentially square-integrable at infinity, `n ≥ 2` (changed; new) | nt26 Theorem A and 6.5(1); th24 Conjecture `SP′_n`, Theorem 8.1; same and mixed parity; `n = 1` | hypotheses: totally real, without CM, `π_∞` essentially square-integrable, `n ≥ 2`, every place; a regular algebraic twist exists iff parity of `k_v` constant | equals nt26 lines 22–27, 2355–2360; th24 lines 2132–2143; pages 1, 50 and 48–50 right; parent §4.22 covers 8.1/8.3 with infinity |
| §13.12 CM fields (sampled; new) | nt26 6.5(2) and proof; ct17 Proposition 7.6; RACSDC against RAECSDC | statement: CM `E`, RAECSDC, not induced from a quadratic extension, `n ≥ 2`, every place `w`; ct17 7.6 and parent §4.22 give RACSDC only | statement equals nt26 lines 2361–2366; the twist of lines 2369–2371 is missing from the sketch (C02) |
| §13.13 `L(s, Sym^n π)` entire, `n ≥ 1` (new) | `n = 0`, `n = 1`; CM `π`, `n = 2`; `Π` not unitary | `n = 0`: `ζ_F`, pole at 1, excluded; `n = 1`: `GL_2`, entire; CM: `Sym²` not cuspidal, excluded; rank `n + 1 ≥ 2` | AL.2.4.1 is entire for `n ≥ 2` cuspidal, complex determinant twists by translation, with `Λ(s,π) = ε Λ(1−s, π^∨)`; both Checks true |
| §14.6 `Λ(Sym^n E, s)` entire, `n ≥ 2`, non-CM `E/ℚ` (new) | `n = 0`, `n = 1`; conductor 11 at `s = 2`; semistable `E` | `n = 0`: `π^{−s/2}Γ(s/2)ζ(s)`, poles; `N^{s/2} = 11` at `n = 1`, matching parent's Check; semistable and CM would force good reduction everywhere over `ℚ`, impossible | equals nt21b lines 47–50 (p. 2), nt21 lines 71–73 (p. 2); identity `Λ = N_n^{s/2} Λ_AL(Sym^n π_E, s − n/2)` is the parent's §4.17, fourth bullet |
| Scope: §§13.11–13.13, 14.6 owned here | parent Scope at its head | parent: these "are not targets of this roadmap"; its §§4.17, 4.22 define and reduce, not conclude | single owner; supply one way |

The rows for the untouched statements stand as in the previous review, of `47ed7fa`.

- Source locators checked against the text: 6 (nt26 Theorem A p. 1, Theorem 6.5(1), 6.5(2) and proof p. 50; th24 Theorem 8.1, Proposition 8.3 pp. 48–50; nt21b Corollary B p. 2; nt21 Corollary C p. 2), and ct17 Proposition 7.6 through the parent's §4.22.
- Seeded sample: §13.12 is the one sampled target in the changed passages; checked as in the row above. The other sampled targets are untouched.
- Cross-roadmap citations resolved at the suppliers' heads or on main: ModularityAndLanglandsExtensions §§4.15, 4.17, 4.22, 4.42 (open head); AutomorphicGaloisRepresentations §§3.10–3.14, 4.3–4.7 (open head); EllipticCurveModularity Layer R29.6 (open head; entire completed `L`-function of `E`); EndoscopicTransferAndUnitaryTraceComparison §§6.24, 6.26–6.29 (main); AutomorphicLFunctionsAndLocalFactors AL.2.4.1 (main); PotentialAutomorphyInfrastructurePartII §§0.8, 0.11 (open head). All exist with the content claimed, except the choice of §4.42 (C03).
- Dependency check: `depcheck: 213 roadmaps, 2294 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The new suppliers EllipticCurveModularity, AutomorphicGaloisRepresentations, EndoscopicTransferAndUnitaryTraceComparison and AutomorphicLFunctionsAndLocalFactors are all earlier in the merge order.
- Elaboration of `Suggested.lean`: `sorry` at lines 93 and 112 the only warnings; the file is unchanged since `47ed7fa`, so the four elaborated types and the one-tactic probe stand as before; no `set_option`, no sorry'd data. No new headline is statable at the pins (no automorphic representations of `GL_n`, no Weil–Deligne factors of `Sym^n E` at bad primes); see C04.
- Automatic checks: all passed; no change outside the roadmap folder.
- Overlap check: read PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, ModularityAndLanglandsExtensions, PotentialModularityAndCompatibleSystems, GL2ModularityLifting, GlobalGaloisDeformations, LocalGaloisDeformationRings, AutomorphicGaloisRepresentationsPartII (scopes as read for the earlier reviews; the first and third again at their heads for the changed passages); nothing shared: `SP_n` for all `n`, Newton–Thorne 2026 Theorem 6.5, the holomorphy of `L(s, Sym^n π)` and the entireness of `Λ(Sym^n E, s)` are owned here and disowned by ModularityAndLanglandsExtensions, which owns `SP_n` as a statement, `n ≤ 5`, `Λ(Sym^n E, s)` as a definition (§4.17) and the reductions of §4.22.

Source independence: changed passages only: 6 passages compared with 5 sources (nt26, th24, nt21b, nt21, ct17), none shared beyond theorem statements that can be written one way; largest share nt26, 49 of 91 locator citations by source key; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: Layers 11–13 prove Newton–Thorne 2026 (Theorems 3.2, 4.1, 5.5, 5.9, 6.4, 6.5), symmetric power functoriality for Hilbert modular forms, with Thorne 2024 level raising (Layer 6) and Newton–Thorne 2021 II patching (Layer 9); Layer 14 gives Newton–Thorne 2021 I Theorems A, B, E and II Corollary B. Rests on the sources read.

## Not verifiable

- bbm82 Théorème 3.1.1 and kw09 Proposition 9.3: cited by locator only, texts not readable (untouched by this change).
- The published pagination of nt26, nt21b and nt21: the README cites the arXiv pages, which is what was read.
- Dummigan–Martin–Watkins 2009, the definition of `Λ(Sym^n E, s)` that nt21b Corollary B refers to: not read; §14.6 takes the definition from ModularityAndLanglandsExtensions §4.17, which cites it.

## Source issues

- none

## For the human reviewers

- The board's plan for this roadmap declares 14 requests to suppliers; the README at this head uses 5. The other 9 (among them Deligne–Lusztig transfer, Mœglin's packets, equivariant K-theory of the Steinberg variety) belong to routes the text no longer contains.
