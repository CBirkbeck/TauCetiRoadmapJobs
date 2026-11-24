# Review of KatoEulerSystems (pull request #3027 at dd70a50)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 56 changed lines since `74a09b7`. The change is the new §4.1a (Momose's algebra splits at ordinary places above `p ∤ N`), one added section number in the Dependencies of Layer 4, and two entries of the References; I checked the statement and its three Checks against Brown–Ghate and Ribet at their locators and against the LMFDB, recomputed the commutant argument, resolved the supplier citation, and ran the dependency check and the elaboration. Accepted: no finding and no small correction; one format note on untouched text, which does not block. Nothing is left for a human to decide.

## N01 — Untouched text: `TauCetiRoadmap/KatoEulerSystems/README.md`, "From EtaleCohomologyFoundations and Polylogarithms" (line 3279): `ClassicalAlgebraic.finiteTrace` is in code font, but no declaration of that name exists at the pins.

EtaleCohomologyFoundations §0.8 writes it in prose as a proposed name, so a reader who searches the libraries for it finds nothing. Write it in prose ("the finite trace of EtaleCohomologyFoundations §0.8"), or say that it is that roadmap's proposed name. For a separate pull request.

## Previous findings

- N01 of the previous review (the code-font name `ClassicalAlgebraic.finiteTrace`, line 3279) — not repaired; it lies in untouched text the change does not affect and is carried as N01 above. The previous review had no finding and no small correction; the folder is unchanged since the head it read.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1a statement: B splits at `λ₀` for `p ∤ N`, `a_p` a λ-unit | k = 2; k > 2; Γ trivial | BrownGhate2003 line 1245 (Thm 3.3.1, p. 1656): `p ∤ N`, ordinary, `X_v` a matrix algebra; RibetParis1981 lines 328–333 (Thm 6, p. 274) for k = 2; Γ trivial: `dim_F B = 4`, split | as README | none |
| Route: module structure | t = 1, t odd, t even | `dim V_(λ₀) = Σ 2[F_(λ'):F⁰_(λ₀)] = 2t`; D division: `V ≅ D^(t/2)`, `C = M_(t/2)(D^op)`, V simple over C of dimension `4·t/2 = 2t`; t odd impossible | correct | none |
| Route: the eigenspace | `ker(ρ_f(τ) − c)` on `V_λ` and on `V_(λ₀)` | on `V_λ`: eigenvalues 1, c distinct, kernel of `F_λ`-dimension 1 of 2; so `0 < dim < 2t` on `V_(λ₀)`; commutes with C since `ρ_f(τ) ∈ B_(λ₀)^×` | correct | none |
| Existence of τ | p = 2; k = 2; k odd | `κ(I_p ∩ H)` open in `ℤ_p^×`, infinite; the `(k−1)`-torsion of `ℤ_p^×` is finite (order ≤ p − 1, or 2 for p = 2); so some τ has `κ(τ)^(k−1) ≠ 1` | exists | none |
| Eigenvalues 1 and `κ(τ)^(1−k)` | arithmetic and cohomological realization; opposite sign convention | `AutomorphicGaloisRepresentations` §5.1: one graded piece unramified (quotient, or sub on the cohomological side); nrd = `κ^(1−k)` on H (4.1); with `κ^(k−1)` instead, c is still ≠ 1 | correct | none |
| Check 1: Γ trivial | `F⁰ = F` | `B ⊂ M₂(F)` of dimension 4 over F, so `B = M₂(F)`; agrees with the sentence of 4.1 on trivial Γ | true | none |
| Check 2: `S₃(38, χ₋₁₉)` | LMFDB 38.3.b.a; inner-twist parity | 5 = 9² mod 19, `χ₋₁₉(5) = 1`, so `a₅ ∈ ℤ`; LMFDB: `a₅ = −1`, `a₃ = 2√−2` (`a₃² = −8`); source: ramified at 2, ∞; split at 5 | true | none |
| Check 3: `S₂(57, χ₅₇)` | BrownGhate2003 lines 1755–1758 | source: orbit size 4, twists `χ₋₃, χ₋₁₉, χ₅₇`, `a₅² = −5`, ramified at 2 and 5; `v₅(a₅²) = 1 ≠ 0`, not ordinary; 5 ∤ 57 | true | none |
| 4.1a against 4.1 (untouched, cited) | division-algebra places; ramification bound | 4.1 keeps admissibility as a hypothesis at division places only; 4.1a removes none of it at non-ordinary places; {2, 5} ⊂ primes of `2·57·disc(F)` (F ∋ √−5) | consistent | none |
| Dependencies of Layer 4: added §5.1 | *Needs:* of 4.1a; supplier contract | §5.1 on main: `k ≥ 2`, `p ∤ N`, `a_p` a λ-unit, unramified quotient; the contract already lists §§5.1–5.2 (line 3129) | resolves | none |
| Added locators in the References | Brown–Ghate; Ribet 1981; Ribet 1985 | Thm 2.3.6 p. 1629 (line 527), Thm 2.3.8 p. 1630 (line 540), Thm 3.3.1 p. 1656 (line 1245), Ex. 4.3.2, 4.3.4 p. 1674 (lines 1755, 1769); Thm 6 p. 274; Ribet1985 lines 232–254, pp. 190–191 | match | none |
| Headlines `ellipticCyclotomicFiniteGeneration`, `ellipticCharacterPoints_finite` | elaborated types against README | untouched by the change; `Suggested.lean` identical to the merge base; binders `1 ≤ m`, `NeZero m`, `IsCyclotomicExtension {m} ℚ K`, `F 1 ≠ 0` present | as on main | none |

- Source locators checked against the text: 8 (BrownGhate2003 Thm 2.3.6, 2.3.8, 3.3.1 with its proof, Ex. 4.3.2, 4.3.4; RibetParis1981 Thm 6 with its definition of ordinary; Ribet1985 §3).
- The seeded sample (0.1, 0.2, 0.3, 1.1, 3.2, 4.2a, 4.7, 5.5, 6.1, 6.3, 6.4, 7.3, 7.4, 7.6, 7.9) falls entirely in untouched text the change does not affect; none of it is in the changed passages.
- External data: LMFDB newform 38.3.b.a (coefficient field `ℚ(√−2)`, inner twists 1.a and 19.b, `a₂ = √−2`, `a₃ = 2√−2`, `a₅ = −1`, `a₇ = 5`).
- Cross-roadmap citations resolved: 1 new (`AutomorphicGaloisRepresentations` §5.1, on main). Consumers of §4.1a: BernoulliBoundsForClassGroupEigenspaces §13.1 in this pull request (lines 1013–1050), citing the statement as it stands.
- Record against the merge base: 8 layers at the merge base and at the head, same ids and titles; no layer or item removed or renumbered; §4.1a is the only new id.
- Overlap check: read ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII, AutomorphicCongruences, CMRankZeroConverse, RankOneConverse, NonordinaryCMSpecialValues, EllipticCurveModularityPartII, PadicFamilies; nothing shared. A search of every open head and of main for Brown–Ghate, Momose's algebra and the crossed-product algebra of the inner twists finds only this roadmap and BernoulliBoundsForClassGroupEigenspaces, which cites §4.1a.
- Dependency check: `depcheck: 132 roadmaps, 1484 edges, 0 problem(s)`; no UPWARD or CYCLE line; no supplier added or dropped.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean`: two `declaration uses sorry` warnings (lines 50 and 75), nothing else. Pull-request text: its sentences on this folder ("KatoEulerSystems §4.1a in 13.1", among the "five sections this pull request adds", and "its 14.1 of KatoEulerSystems §7.9") agree with the head. No change outside the pull request's own folders.

Source independence: changed passages only; 7 passages compared with 3 sources (BrownGhate2003 Thm 2.3.6/2.3.8, Thm 3.3.1 and its proof, Ex. 4.3.2, Ex. 4.3.4; RibetParis1981 Thm 6; Ribet1985 §3), none shared beyond what the mathematics forces (the name of a space of forms). The route of 4.1a (commutant and an inertia eigenspace) is not the sources' (slopes of the crystal; the Tate module of the reduction). Largest share Kato2004, as on main; arrangement not compared, since no layer is added, removed or reordered.

Research link: §4.1a is the splitting theorem of Brown–Ghate (2003), and of Ribet (1981) in weight two, for the endomorphism algebra of a modular motive at ordinary places; with 4.1 (Momose 1981, Ribet 1985, Loeffler 2017) it gives the admissibility hypothesis of Kato (2004), Theorems 12.4 and 14.2. Rests on the README and the sources read.

## Not verifiable

- Ribet, Math. Ann. 253 (1980), Theorem 5.1, and Momose 1981, Theorem 4.1: not opened; the README cites them "as stated in Brown–Ghate, Theorem 2.3.6", and that statement was read (BrownGhate2003 lines 524–527).

## Source issues

- **Misprint** in BrownGhate2003 at Example 4.3.4, p. 1674: the source says the square of the fifth coefficient of the weight-three level-38 form is −8; it should be `a₅ = −1` (so `a₅² = 1`), −8 being `a₃²`; affects nothing.

## For the human reviewers

- none
