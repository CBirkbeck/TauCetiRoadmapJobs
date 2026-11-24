# Review of KatoEulerSystems (pull request #3027 at 9ea672c)

**Verdict:** accepted

**Summary.** This is an incremental re-review of the 55 lines changed since `0b5086d`, all in §4.1a, the Dependencies of Layer 4 and the References. It is accepted: the previous finding is repaired (the Check now gives `a₅ = −1` for the level-38 form), and so are both small corrections and the first format note. The new proof of 4.1a, which uses the commutant of `B_(λ₀)` and an inertia element with distinct eigenvalues, is correct from 4.1 and `AutomorphicGaloisRepresentations` §5.1 alone, and the new non-ordinary Check agrees with Brown–Ghate and with the LMFDB. One format note on untouched text is carried over and does not block. Nothing is left for a human to decide.

## N01 — In "From EtaleCohomologyFoundations and Polylogarithms" (line 3279), `ClassicalAlgebraic.finiteTrace` is in code font, but no declaration of that name exists at the pins; EtaleCohomologyFoundations §0.8 writes it in prose as a proposed name.

Write it in prose ("the finite trace of EtaleCohomologyFoundations §0.8"), or say that it is that roadmap's proposed name.

## Previous findings

- R01 — repaired: "For the primitive form `f ∈ S₃(38, χ₋₁₉)` … `a₅ = −1` is a 5-adic unit and B is split at 5" (line 1319). The References record the source's misprint (line 3357).
- C01 — repaired: "(Ribet, Math. Ann. 253 (1980), Theorem 5.1, and Momose, Theorem 4.1, as stated in Brown–Ghate, Theorem 2.3.6, p. 1629); its class in the Brauer group of `F⁰` is that of B (Ribet 1985, §3, pp. 190–191)". Ribet 1981, Theorem 6, p. 274, is cited for `k = 2` (lines 1288–1295).
- C02 — repaired: "The statement follows from 4.1 and the ordinary filtration alone." The argument works with the commutant C of `B_(λ₀)` and the eigenspace `ker(ρ_f(τ) − c)` (lines 1300–1313). *Needs:* now lists 4.1 and `AutomorphicGaloisRepresentations` §5.1 only.
- N01 — repaired: "The hypothesis at p cannot be dropped: for the primitive form `f ∈ S₂(57, χ₅₇)` … `a₅² = −5`, so f is not ordinary at 5, and B is ramified at 5 and at 2" (lines 1321–1323).
- N02 — not repaired: "From `EtaleCohomologyFoundations` §0.8: the trace `ClassicalAlgebraic.finiteTrace` of a finite locally free map" (line 3279). This is untouched text and is carried over as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1a statement (unchanged): B splits at λ₀ for `p ∤ N`, `a_p` a λ-unit | `k = 2`; general k; Γ trivial | Brown–Ghate Thm 3.3.1 (p. 1656): `p ∤ N`, `v(a_p²ε(p)⁻¹) = 0`, X_v a matrix algebra; Ribet 1981 Thm 6 (p. 274): same for weight 2 | as README | none |
| New route: dimensions | t = 1; t odd; t even | `dim V_(λ₀) = Σ_(λ'|λ₀) 2[F_(λ'):F⁰_(λ₀)] = 2t`; if division: `V ≅ D^(t/2)`, `C = M_(t/2)(D^op)`, V simple over C; t odd means `4 ∤ 2t`, so B is split | correct | none |
| New route: C-stable eigenspace | ker on V_λ and V_(λ') | V_λ: `dim_(F_λ) ker(ρ(τ) − c) = 1`, so the dimension lies strictly between 0 and 2t; C commutes with `ρ_f(τ) ∈ B_(λ₀)^×` | correct | none |
| Existence of τ | p = 2 with k odd; k = 2 | κ(I_p ∩ H) is open in ℤ_p^×. For p = 2: `μ(ℤ_2) = {±1}`, and `1+2^n` has `(1+2^n)^(k−1) ≠ 1`. For k = 2: κ(τ) ≠ 1 | exists | none |
| Eigenvalues 1 and `κ(τ)^(1−k)` | AGR §5.1 (main), both realizations | Arithmetic realization: quotient unramified. Cohomological: sub unramified. ε is unramified at `p ∤ N`, `nrd = det` via `B⊗F ≅ M₂(F)`. With p = 5, k = 2, κ(τ) = 6: c = 1/6 ≠ 1 | correct | none |
| Check 2: `S₃(38, χ₋₁₉)` | inner-twist relation; LMFDB 38.3.b.a | `9² = 81 ≡ 5 mod 19`, so χ₋₁₉(5) = +1 and a₅ ∈ ℤ; README a₅ = −1 = LMFDB; `\|a₅\| ≤ 2·5`; {2, ∞} is even | true | none |
| Check 3: `S₂(57, χ₅₇)` | LMFDB 57.2.d.a; Brown–Ghate Ex. 4.3.2 | `ν⁴+4ν²+9 = 0`, `a₅ = ν²+2`, `a₅² = ν⁴+4ν²+4 = −5`; `χ₅₇(5) = −1` gives `a₅²ε(5)⁻¹ = 5` with `v₅ = 1`; twists 3.b, 19.b, 57.d; source: X ramified at 2, 5 | true | none |
| Check 3 against 4.1 (2) | ramification bound | `F = ℚ(√2, √−5)`, so `5 ∣ disc F`. {2, 5} lies within the bound `2·57·disc(F)·∞`, and the set is even | consistent | none |
| Layer 4 Dependencies, §§5.1–5.2 → §5.1 | every *Needs:* line of 4.1–4.7 | §5.2 was cited only by the earlier route of 4.1a. The supplier contract keeps §§5.1–5.2, which Layers 6–7 use (lines 2074, 2119, 2305) | correct | none |
| Added locators | Brown–Ghate, Ribet 1981, Ribet 1985 | Thm 2.3.6 on p. 1629 (BrownGhate2003 line 527), Thm 2.3.8 on p. 1630 (line 540), Thm 6 on p. 274 (RibetParis1981 lines 317–333), §3 on pp. 190–191 (Ribet1985 lines 241–252) | match | none |

The rows for the headline theorems `ellipticCyclotomicFiniteGeneration` and `ellipticCharacterPoints_finite`, which this change does not touch, stand as in the previous review, of `0b5086d`.

- Source locators checked against the text: 8. Brown–Ghate Thm 2.3.6 (p. 1629), Thm 2.3.8 (p. 1630), Thm 3.3.1 with its proof (pp. 1656–1657), Ex. 4.3.2 and 4.3.4 (p. 1674); Ribet 1981 Thm 6 (p. 274) with its definition of ordinary; Ribet 1985 §3 (pp. 190–191).
- External data: LMFDB newform 57.2.d.a (character 57.56, even, of order 2; coefficient field `ℚ(√2, √−5)` with `ν⁴ + 4ν² + 9`; a₂ = −(ν³+ν)/3, so a₂² = 2; a₅ = ν² + 2; inner twists 1.a, 3.b, 19.b, 57.d).
- Cross-roadmap citations resolved: `AutomorphicGaloisRepresentations` §5.1 on main (k ≥ 2, `p ∤ N`, `a_p` a λ-unit, no restriction on p). BernoulliBoundsForClassGroupEigenspaces in this pull request cites §4.1a (lines 1013, 1022, 1050, 1274) for the statement, which is unchanged.
- Record against the merge base: 8 layers at the merge base and at the head; no layer or item is removed, renumbered or retitled; §4.1a is the only new id.
- Overlap check: searched ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII, AutomorphicCongruences, CMRankZeroConverse, RankOneConverse (open) and NonordinaryCMSpecialValues, EllipticCurveModularityPartII, PadicFamilies (main) for Momose's algebra, Brown–Ghate's splitting theorem, inner twists and crossed-product algebras. All open heads and main were searched as well. Nothing is shared: HilbertModularForms §9.2 has inner twists of Hilbert newforms, with no Brauer class; `AutomorphicGaloisRepresentations` §7.5 is a cited supplier; BernoulliBoundsForClassGroupEigenspaces cites §4.1a.
- Dependency check: `depcheck: 132 roadmaps, 1484 edges, 0 problem(s)`. No UPWARD or CYCLE line, and no supplier is added or dropped.
- Automatic checks: all pass except the check for edits outside the folder (set aside below). `lake env lean` on `Suggested.lean`: only the two `declaration uses sorry` warnings (lines 50 and 75). The file is unchanged since the merge base.
- Pull-request text: its only sentence about this folder ("KatoEulerSystems §4.1a in 13.1", in the BernoulliBoundsForClassGroupEigenspaces paragraph) still holds. §4.1a is stated in its source's generality and does not mention the family. No change outside the pull request's own folders.

Source independence: changed passages only. I compared 7 passages with 3 sources (Brown–Ghate Thm 2.3.6/2.3.8, Thm 3.3.1 and its slope proof, Ex. 4.3.2, Ex. 4.3.4; Ribet 1981 Thm 6 and its proof; Ribet 1985 §3). The longest shared run is 3 words ("primitive form" plus the space `S₂(57, χ₅₇)`), and the mathematics forces it. The commutant argument is not the source's: Brown–Ghate count slopes of the crystal, and Ribet uses the Tate module of the reduction. Largest share: Kato2004, as in the previous review (about 127 of 172 locator mentions). The change adds six locators, all to Brown–Ghate and Ribet. Arrangement not compared again: no layer is added, removed or reordered.

Research link: §4.1a is the splitting theorem of Brown–Ghate (2003) for the endomorphism algebra of a modular motive at ordinary places, and of Ribet (1981) in weight two. With 4.1 (Momose 1981, Ribet 1985, Loeffler 2017), it gives Kato's admissibility hypothesis at ordinary places, an input to Kato 2004, Theorems 12.4 and 14.2. This rests on the README and the sources read.

## Not verifiable

- Ribet, Math. Ann. 253 (1980), Theorem 5.1, and Momose 1981, Theorem 4.1: not opened. The README cites them "as stated in Brown–Ghate, Theorem 2.3.6", and that statement was checked (BrownGhate2003 lines 524–527).

Automatic checks set aside as false positives: the check for edits outside the roadmap folder flagged 121 files. All of them are in the other roadmap folders this pull request revises, each with its own review. The diff against main, with those folders excluded, is empty.

## Source issues

- **Misprint** in BrownGhate2003 at Example 4.3.4, p. 1674: the source gives the square of the fifth coefficient of the weight-three level-38 form as −8; it should be `a₅ = −1` (`a₅² = 1`), since −8 is `a₃²`; affects nothing.

## For the human reviewers

- none
