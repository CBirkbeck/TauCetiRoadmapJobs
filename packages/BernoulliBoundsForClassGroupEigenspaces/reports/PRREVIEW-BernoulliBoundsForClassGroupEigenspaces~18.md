# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 42 lines changed since `cd123f8`. Accepted: no finding. The change repairs four of the five small corrections of the previous review (the label of 9.8, the Origin line of 9.4, the Labels paragraph on 12.1 and 13.1, the `*Corollary of:*` line of 9.1), and the new sentences of 9.4 and 9.8 about the formal proof agree with its Lean source, declaration by declaration. One small correction (the description still does not mention this roadmap's supplier changes) and one format note are carried, neither blocking; one question for the author is carried, and three items are left for the human reviewers.

## C01 — The description does not mention this roadmap's supplier changes

The description's prose never names this roadmap, and its paragraph on new supplier relations covers only the general roadmaps. A reader cannot tell that 9.8 (a) now cites StableHomotopyKTheory §4.24a in place of its own route through Postnikov towers, that the supplier subsections for AlgebraicTopology and GeneralizedCohomology are removed, or that ArithmeticGaloisDuality §D7.6a, ArithmeticKTheory §9.1, IntegralIwasawaTheory §12.3a and KatoEulerSystems §4.1a become suppliers. One sentence under part 2 would cover it, for example: "In BernoulliBoundsForClassGroupEigenspaces, 9.8 (a) now cites StableHomotopyKTheory §4.24a, so AlgebraicTopology and GeneralizedCohomology are no longer suppliers; 6.17, 9.1, 9.2, 10.1 and 13.1 cite ArithmeticGaloisDuality §D7.6a, ArithmeticKTheory §9.1, IntegralIwasawaTheory §12.3a and KatoEulerSystems §4.1a." Carried from the previous review; the description is unchanged in this respect.

## N01 — Some citations of 9.3 and 9.4 lack locators or point slightly off

Koecher (1960), in the Origin line of 9.3 (line 315) and the References (line 1275), has no theorem or section number. As an earlier review read de la Torre Durán (2026), the orbit count cited in 9.3 is its Theorem 3.9, and its Theorem 4.5, cited in 9.4 (line 399), bounds `K_m(𝒪_F)_tors`, the homology bound being (26) in its §4.2. Carried; not re-read this round.

## Questions for the author

- Carried and unanswered; the statement of 12.1 is unchanged. When `p` divides `[E : F]`, which "`χ⁻¹`-part" of `H²(𝒪_{E′,S}, ℤ_p(n))` is meant? For `F = ℚ`, `p = 5`, `E = ℚ(ζ₁₁)^+`, `n = 2`, `χ = 1`, `S = {5, 11, ∞}` an earlier review computed `v₅ = 1` from the formula, `v₅ = 2` for the part cut out by the idempotent of the prime-to-5 subgroup, and `v₅ = 1` for the invariants or coinvariants of all of `Gal(E′/ℚ)`. If the second reading is intended, would the Origin line say so? Invariants for a non-cyclic Sylow subgroup could not be settled.

## Previous findings

- The previous review raised no finding. Its remarks stand at this head as follows:
- Its C01 (label of 9.8 against the formal proof) — repaired: "none. [FormalProof] states (a), for commutative `R` and `m ≥ 2`, as the proposition `UpperTheory.V.Published.KHurewicz` …, a hypothesis that it does not prove …; it does not state (b)" (lines 605–607).
- Its C02 (9.4 Origin, Soulé 2003) — repaired: "Bayer-Fluckiger, Emery and Houriet (2014), a bound of the same shape away from small primes that improves Soulé (2003)" (lines 378–380).
- Its C03 (Labels against the Origin lines of 12.1, 13.1) — repaired: "12.1 when `p` divides `[E : F]`, and 13.1, … are adapted from published theorems (Kolster 2009, Theorem 3.3; Brown and Ghate 2003, Theorem 3.3.1)" (lines 30–32), as the Origin lines at 965 and 1016 say.
- Its C04 (9.1 without `*Corollary of:*`) — repaired: "*Corollary of:* ArithmeticKTheory §9.1 (Gabber's lemma …), applied to the complex `ℤ^{Λ₀} → ℤ^ι`" (lines 258–260); the Dependencies and the supplier contract say the same.
- Its C05 (description) — not repaired: the prose of the description does not name this roadmap. Now C01.
- Its N01 — not repaired: "adapted from Koecher (1960) and Braun, Coulangeon, Nebe and Schönnenbeck (2015)" (line 315), no locator for Koecher. Now N01.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 9.1 as a corollary of ArithmeticKTheory §9.1 | complex `ℤ^{Λ₀} → ℤ^ι`, `k = 0`; `ι = {1}`, `Λ₀ = {b}`; `Λ₀ = ∅`; `ι = ∅` | `H₀ = ℤ/b`, `a = min(1, 1) = 1`, bound `b¹`; empty `Λ₀`: `a = 0`, `b⁰ = 1`, torsion of `ℤ^ι` is 1; `Λ₀` finite: at most `(2b + 1)^{#ι}` vectors | sound; §9.1 (line 4515 of its README) states `b^a` with Euclidean norms; Soule1999 lines 175, 240 |
| 9.4, the form of the formal proof recorded in the changed sentence, against the stated bound | `e = 1`, `n = 2`, `N = 10`, `m = 3`, `|d_L| = 3` | orbit exponent `12·4·20³·10·log 120 ≈ 1.8·10⁷`; recorded form `4²⁴·log 6 ≈ 5·10¹⁴` with `C = 24`; ranges `N ≤ 4e + 6 = 10`, `m ≤ 2e + 1 = 3` hold | consistent; `torsAll` as quoted: totally complex `L`, `e ≥ 1`, `1 ≤ N ≤ 4e + 6`, `m ≤ 2e + 1`, bound `exp((2en)^C log(2|d_L|))` |
| 9.4, the special `log log` form | `N = 4e + 4`, `m = 2e` | `TorsBound (2·24 + 1)`: `c₂ = 49`; exponent `C·m·(nN)³N·log(2|d_L|nN)` with `m = 2e`, not `m + 1` | as the text says |
| 9.4 against 9.7 | `N = 4E + 6`, `m ≤ 2E + 1` | 9.7 Route (line 585) uses `GL_{4E+6}(𝒪_{L′})`; `STors` is `torsAll` at `N = 4E + 6` | consistent |
| 9.8 (a), label against the source | degree `k + 2`, `k = 0` | `KHurewicz` is a `Prop`-valued definition: commutative `R`, degree `k + 2 ≥ 2`, kernel killed by an integer of the degree (a product over `1 ≤ j ≤ k + 2` of products of primes `≤ j`); used only as a hypothesis | label correct |
| Labels paragraph against the Origin lines | 9.8, 12.1, 13.1 | 9.8 (b) "own formulation" at line 602; 12.1, 13.1 "adapted from" at lines 965, 1016 | agree |

The rows of the untouched statements stand as in the previous review, of `cd123f8`.

- Source locators checked against the text: 3 (Soule1999 lines 175 and 240; BFEH2014 lines 43–49, which give the bound for `log card` as a power of `|D_F|` and say it improves the earlier bound by an exponential factor).
- Declarations of [FormalProof] opened, in a copy the operator holds: `UpperTheory.V.ZK.torsAll` and `sTors` (`AV/ModularityArgument/ClassCounting/ExponentLe.lean`, lines 70 and 122), `UpperTheory.V.kBound` (`AV/GeneratorCountTuples/LemmaK.lean`, line 11), `UpperTheory.V.KT.tors_le` and `torsBound` (`AV/HermiteNormalForms/Assembly.lean`, lines 25 and 32), `UpperTheory.V.K.TorsBound` (`AV/GeneratorCountTuples/TorsBoundPow.lean`, line 19), `UpperTheory.V.Published.KHurewicz` (`AV/PublishedTheorems/KAcyclicHomology.lean`, line 17).
- Cross-roadmap citation resolved at this head: ArithmeticKTheory §9.1. The family index's sentences on this roadmap (Jacobi sums at the odd primes prime to the degree, torsion bounds of Soulé's type in forms of the proof's own, the Hurewicz-kernel item) agree with Layers 9 and 10.
- `Suggested.lean` is unchanged since `cd123f8`; `lake env lean` on it gives only the `sorry` warning at line 78. The one-tactic probe and the `#check` comparison stand as in the previous review.
- Dependency check: `depcheck: 122 roadmaps, 1402 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: every check passed.
- Changes outside the folders the pull request names as its own: none.

Overlap check: read UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, SelmerLengthBoundsAndLocalLifting, ArithmeticKTheory, ArithmeticKTheoryPartII and ModularIwasawaMainConjecturesPartII as in the previous review; the change adds no object. Shared objects and owners are unchanged: Sha kernels with lattice coefficients and their duality, HeckeIdealsAndTaylorWilesRelations §10.1 and ArithmeticGaloisDuality §D7.6a; Gabber's lemma, ArithmeticKTheory §9.1 (9.1 is now recorded as its corollary); the exponent of the kernel of the Hurewicz map, StableHomotopyKTheory §4.24a.

Source independence: changed passages only; 5 passages compared with 2 sources (Soule1999, BFEH2014), none shared beyond formulas; largest share [FormalProof], a Lean repository, of which seven declarations were opened and no prose compared; the arrangement was not compared, no layer being added, removed or reordered.

Research link: Layer 9 continues Soulé's perfect-form method for torsion in the K-theory of rings of integers (Soulé 1999; Bayer-Fluckiger, Emery and Houriet 2014); Layer 10 carries Kolyvagin's and Rubin's Euler system of Gauss sums (1990, 1991) to twists; Layer 14 rests on Kato's finiteness theorem (2004). Basis: README, References, and the two sources read.

## Not verifiable

- That the main theorems of [FormalProof] do not depend on `UpperTheory.V.K.TorsBound` or on `KHurewicz` (9.4, 9.8): the theorems found that use them take the published statements as hypotheses, but the dependencies of the main theorems were not traced.
- The copy of [FormalProof] read is held by the operator without its version history, so that it is the commit the References name was not confirmed.
- Kolster 2009, Brown–Ghate 2003 Theorem 3.3.1 (now also named in the Labels paragraph), Soulé 2003, Emery 2014, Koecher 1960, de la Torre Durán 2026: not in the sources cache, as in the previous review.
- Arlettaz 1991, Theorem 1.5 (9.8 (a)): recorded as uncertified, cited by its locator.

## Source issues

- none

## For the human reviewers

- Scope: de la Torre Durán 2026 (arXiv:2611.06300) is an unrefereed preprint; the README cites it in 9.3, 9.4 and the References, and at line 368 calls it "the published result nearest to (e)".
- Licence: Kolster 2009 (lecture notes cited in the Origin lines of 6.18, 10.1 and 12.1, and now in the Labels paragraph): no legal copy was found, and the venue given in the References was not confirmed.
- Not tested: [FormalProof] has the largest share of the locators; the wording and arrangement were not compared with it beyond the seven declarations opened.
