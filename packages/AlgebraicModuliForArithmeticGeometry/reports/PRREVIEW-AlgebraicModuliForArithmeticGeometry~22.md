# Review of AlgebraicModuliForArithmeticGeometry (pull request #3027 at 59b3c66)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 8 lines changed since `3bddf73`, with no finding. The change repairs the three loose `*Needs:*` glosses of the previous review and adds to §9.10 a definition of nefness that agrees with every use of the word in §§9.10–9.12, and the description now states both that change and the addition of §9.12. There are no small corrections and one format note, carried over and not blocking; nothing is left for a human to decide.

## N01 — `AlgebraicGeometry.Scheme.Pullback` is a namespace, not a declaration

The `*Needs:*` line of §7.6a (line 9333) still cites Mathlib `AlgebraicGeometry.Scheme.Pullback`; at the pin this is the namespace opened in `Mathlib/AlgebraicGeometry/PullbackCarrier.lean:37`. "Mathlib's fibre products of schemes (`Mathlib/AlgebraicGeometry/Pullbacks.lean`)" would say what is used.

## Previous findings

The previous review (of `3bddf73`) had no finding; its two small corrections and its format note are accounted for here.

- C01 — repaired: lines 10135 and 10150 read "§5.3 (the degree of `c_1(L)` on curves, by which nefness is stated)"; line 10059 defines nef by that degree on integral closed curves; line 8357 reads "groupoids and their stabilizers".
- C02 — repaired: the description says "The first part receives only §9.12, global division by sections generating a twisted ideal", and that in its `Suggested.lean` only the module docstring changes.
- N01 — not repaired: line 9333 is unchanged; written again above as a format note.

## Verified sound

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §9.10 definition of nef (line 10059): `deg(c_1(L\|_C) ∩ [C]) ≥ 0` on every integral closed curve | `O(m)` on `ℙ¹`, `m = −1, 0, 1`; `O(E)` on the blow-up of `ℙ²` at a point; `m`-independence for rational `A` | degrees `−1, 0, 1`: not nef, nef, nef; `O(E)·E = −1`: not nef though effective; `deg` of `O(mA)` is `m·deg`, so the sign does not depend on `m` | Determines the usual notion; none |
| Same sentence against SchemeAndStackFoundations §5.3 | §5.3 read (line 8102 of that README, unchanged by the pull request) | `c_1(L) ∩ −` defined for invertible `L` with no smoothness; `c1_degree_curve` gives the degree on a proper curve; `inter_additive` gives linearity | Citation supports the definition; none |
| Same sentence against the uses in §§9.10–9.12 | First Check of §9.12 (`ℙ¹`, `a = 2`); proof of §9.12 (line 10206) | `A − 2D` has degree `0`: nef, not big, and `1 ∉ x·H⁰(O(−1)) + y·H⁰(O(−1)) = 0`; a globally generated `N` has a section nonzero on each curve, degree `≥ 0` | Consistent; none |
| Same sentence against AlgebraicModuliForArithmeticGeometryPartII §1.5 | `S = Spec k` in the relative definition there | `f`-nef there is `(L·C) ≥ 0` on every curve over `S`; for `S = Spec k` it is this sentence; rational case there: `D` nef iff `O_X(rD)` is | Same notion, absolute case here; none |
| §9.10 `algebraicAdjointVanishing`, `uniformAdjointVeryAmpleness` *Needs* glosses (lines 10135, 10150) | §5.3 of the supplier | Section states the degree of `c_1(L)` on curves, which is what the gloss now names | Agree; none |
| §5.1 *Needs* gloss (line 8357), sampled | Supplier headings 1.1, 1.14, 1.15, 1.18, 1.21 | "Descent of quasi-coherent modules and of sheaves"; "Groupoids in algebraic spaces and stabilizers"; "Torsors, torsor classes and the multiplicative group"; quotient stacks are §1.21, cited in the same line | Agree; none |
| §9.12 `globalDivisionByGenerators`, sampled (untouched; depends on the new sentence through "nef and big") | Ein–Lazarsfeld Proposition 1.2 (ii) read | `ein_lazarsfeld_nullstellensatz` lines 473–483: `ℓ ≥ min(m + k − 1, n + k)`, `A − ℓD` ample or big and nef, surjection onto `H⁰(O_X(K_X + A) ⊗ I_ℓ)` | Hypotheses and conclusion as stated; none |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `3bddf73`: the diff changes one definition sentence and three glosses, and no theorem, Check, locator, heading or Lean declaration.

- **Changed passages.** 4 lines replaced in the README: three `*Needs:*` glosses and one sentence added to the opening paragraph of §9.10. `Suggested.lean` is unchanged.
- **Seeded sample.** Of the fifteen targets, §5.1 lies in a changed line and §9.12 depends on the added sentence; both are rows above. The other thirteen (§§2.2, 3.3, 3.3a, 4.12, 4.17, 4.22, 7.1a, 7.2, 7.6.1a, 7.6.2, 7.10.2, 9.1, 9.7) are untouched and were not re-read. The README flags no locator as unverified.
- **Source locators checked against the text:** 1 (`ein_lazarsfeld_nullstellensatz` lines 461–483, Proposition 1.2).
- **Cross-roadmap citations resolved:** SchemeAndStackFoundations §§1.1, 1.14, 1.15, 1.18, 1.21 and 5.3, on `main` (the pull request does not change that roadmap); AlgebraicModuliForArithmeticGeometryPartII §1.5 read at this head for the comparison.
- **Record.** Against the merge base: 0 headings removed, 1 added (§9.12); 9 layers kept under their ids; no Lean declaration added, removed or restated.
- **Automatic checks.** The worker's run passed every check. Dependency check: `depcheck: 122 roadmaps, 1388 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration of `Suggested.lean`.** Five `sorry` warnings (lines 50, 75, 89, 121, 133), nothing else; the file is unchanged since `3bddf73`, so the signatures and the one-tactic probe stand as before.
- **Pull request text.** Read in full as it stands. For this roadmap it states: the gain of §9.12 and that the roadmap cites Part II nowhere (0 occurrences in the README); the projection formula repointed to SchemeAndStackFoundations §2.18 (lines 10102, 10139); the three corrected glosses and the new sentence defining nefness; that only the module docstring of `Suggested.lean` changes. Each holds at this head, and the folder's diff against `main` contains nothing else. Every folder the pull request changes is one of its own.

Overlap check: read FunctionFieldArithmeticPartII, SchemeAndStackFoundations, FunctorOfPoints, ResolutionOfSingularitiesCharacteristicZero, StableReductionPartII (scopes as in the previous review); nothing newly shared. Nefness: SchemeAndStackFoundations owns the degree of `c_1(L)` (§5.3) and speaks of nefness only for vector bundles over a curve, in its stable-curve section; this roadmap's §9.10 states the absolute notion for invertible sheaves; AlgebraicModuliForArithmeticGeometryPartII §1.5, a consumer, owns the relative notion and cones, and the two agree over a field.

Source independence: changed passages only; 1 passage (the sentence defining nefness) compared with 1 source read for it (`ein_lazarsfeld_nullstellensatz`, which uses the word without defining it), none shared; the three glosses name roadmap sections and carry no source wording. Arrangement not compared: no layer added, removed or reordered.

Research link: §9.12 is Ein and Lazarsfeld's global division theorem (1999, Proposition 1.2), the algebraic form of Skoda's theorem behind their geometric effective Nullstellensatz; Ein–Lazarsfeld–Smith (2001) use the same multiplier ideals for symbolic powers. Rests on the README and the two sources read.

## Not verifiable

- Lazarsfeld 2004, *Positivity in Algebraic Geometry II*, §9.6 (secondary locator of §9.12): a paywalled book, recorded as uncertified; not read.
- The numbering of the published Inventiones version of Ein–Lazarsfeld 1999: the arXiv v3 was read, which the reference line names.

## Source issues

- none

## For the human reviewers

- none
