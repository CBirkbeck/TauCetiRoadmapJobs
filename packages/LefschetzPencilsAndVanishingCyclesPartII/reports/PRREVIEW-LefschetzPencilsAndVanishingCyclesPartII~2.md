# Review of LefschetzPencilsAndVanishingCyclesPartII (pull request #2254 at 8bad773)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/LefschetzPencilsAndVanishingCyclesPartII/README.md:233` and `:592` supply regular stalks and connected-to-integral conversion from pinned Tau Ceti; §2.4 and Layer 2 dependencies name both inputs.
- R02 — repaired: `TauCetiRoadmap/LefschetzPencilsAndVanishingCyclesPartII/README.md:489` names the relative-dimension, affine-space comparison, openness and density inputs used by §2.2.
- R03 — repaired: the description distinguishes Poonen’s projective Corollary 3.4 from quasi-projective Theorem 3.3 and says the smooth atlas schemes need not be projective; README:111 agrees.
- R04 — repaired: the description names SchemeAndStackFoundations §0.8 as supplier, the open base roadmap as a boundary comparison, and ArithmeticInterpolationDeterminants §0.3 as comparison only.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Revised Poonen comparison, README:111 | `X = 𝔸²_𝔽₂`, coordinate hyperplane; `X = Spec 𝔽₂` | Hyperplane section has dimension `1 = 2 − 1`; `Spec 𝔽₂` has dimension `0`, below Corollary 3.4’s lower bound `1`. | Quasi-projective and zero-dimensional cases distinguished | R03 repaired |
| §2.4 integral shrinking, README:592 | `V₀ = 𝔸¹_k ⊔ 𝔸¹_k`, mark in first component; nodal negative control | Whole ring: `(1,0)(0,1)=0`; marked component: domain `k[t]`. Node: local dimension `1`, embedding dimension `2`, hence not regular. | Component selection and regularity exclude wrong models | R01 repaired |
| §2.2 marked component and relative dimension | Over 𝔽₃, `π(x,z)=(x,z²−1−2x)`, `z` invertible, `B=2`, mark `(0,1)` | Pullback: `z²=(T+1)²`; two branches. Mark has `z=1`, versus `−1=2` on other branch; relative dimension `0+1=1`. | Marked branch is `D(T+1)`, affine and integral | R02 repaired |
| §2.3 good open using §2.2 inputs | Identity chart of `𝔸²_𝔽₂`, `h=X₀²X₁−X₀X₁²`, `B=3` | `h(T,T³)=T⁵+T⁷≠0`; values at `0,1` are both `0`; generic value nonzero. Preimage is dense `D(T⁵+T⁷)`. | Nonempty open need not have a rational point | Dependencies repaired |
| §2.4 `exists_same_field_curve` after shrinking | `Y=Spec k`, `V=U=Y`; `C=𝔸¹_k`, constant `g`, mark `0` | `g(c)=y`; `g⁻¹(U)=C`; curve dimension `1`, target dimension `0`; both marked residue degrees `1`. | Constant morphism covers dimension zero | R01 repaired |

Untouched statement rows and one-tactic probes stand as in the previous review of `ab1e4ae`.

- Source locators checked (7): Poonen2004 lines 514, 536 (p. 10); Stacks-Morphisms line 3743 (054L, p. 83); Stacks-Varieties line 2084 (056T, p. 46); Stacks-Properties line 433 (033N, p. 10); KisinZhou2024 lines 2342 and 2413 (pp. 53–54).
- Pinned declarations opened (13): 11 Mathlib inputs and the two added Tau Ceti suppliers, `TauCeti/AlgebraicGeometry/Morphisms/Smooth/Regular.lean:43` and `TauCeti/AlgebraicGeometry/IrreducibleOfConnectedDomainStalk.lean:408`; the scratch proof also uses `Mathlib/AlgebraicGeometry/Noetherian.lean:236`.
- Cross-roadmap citations resolved (5): SchemeAndStackFoundations §0.8 and ArithmeticInterpolationDeterminants §0.3 on main; LefschetzPencilsAndVanishingCycles §3.4, §3.5 and Layer LPV.3 at open pull request #873.
- Gate: every check passed; targeted build succeeded with four `sorry` warnings. Dependency output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Direct elaboration passed with four `sorry` warnings; scratch `#check @name` verified all five declaration signatures, with no lost binders. The revised smooth-to-integral route compiled as a proof without `sorry`.
- Title and description checked against the new folder’s 867 insertions, 22 added headings and five added Lean declarations; all four headline theorems and supplier boundaries agree; outside-folder changes: 0.
- Overlap check: all three closest-roadmap lists are empty. Read SchemeAndStackFoundations, ArithmeticInterpolationDeterminants and LefschetzPencilsAndVanishingCycles; SchemeAndStackFoundations owns the rational-point component theorem; ArithmeticInterpolationDeterminants owns the two-variable substitution; LefschetzPencilsAndVanishingCycles owns pencils, with no shared target. Added regularity/integrality inputs are owned by pinned Tau Ceti, also cited by other roadmaps.
- Source independence: changed passages only—four prose passages compared with five cached sources and two pinned modules; no copied expression or reused material found. Largest locator share remains KisinZhou2024, 11 of 39 as counted at `ab1e4ae`; no layer added, removed or reordered, so that review’s independent-arrangement check stands.

## Not verifiable

- KisinZhou2024’s published Annals version is paywalled; published numbering was not compared with arXiv v2. The roadmap explicitly cites v2, whose relevant text was checked.

## Source issues

- **Gap** in KisinZhou2024 at the proof of Corollary 5.2.7, p. 53 (reused in Proposition 5.3.5, p. 54): the source applies Poonen’s Corollary 3.4 to a smooth atlas scheme without establishing projectivity or geometric integrality; it should use a same-field curve theorem for smooth non-projective schemes with a rational point; affects the proof.

## For the human reviewers

- Part II’s base LefschetzPencilsAndVanishingCycles is still open, at merge-order line 70; Part II is at line 4. `TauCetiRoadmap/LefschetzPencilsAndVanishingCyclesPartII/README.md:39` cites the base only to mark its boundary and consumes nothing from it.
