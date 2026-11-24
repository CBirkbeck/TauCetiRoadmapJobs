# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** accepted

**Summary.** Accepted. The only change since the previous review rewrites the convention on `*Corollary of:*` lines. It agrees with the three sections that carry such a line (6.17, 10.1, 14.1): each general theorem has a proof route in the roadmap that states it. The route given is either the deduction (14.1) or a second proof whose label says whose it is (6.17, 10.1), and the deduction's supplier is listed in the layer's Dependencies and in the supplier contracts. There is no finding. The four small corrections and the format note of the previous review are not repaired and are carried below; one of them is that the description still does not state this roadmap's supplier changes. One question for the author is carried, and two items remain for the human reviewers.

## C01 — The 9.4 Origin line puts Soulé 2003 among bounds "of the same shape", but Soulé's bound is much weaker

A reader would take Soulé 2003 to bound `log log #H_m(GL_N(𝒪_L); ℤ)_tors` linearly in `log |d_L|`. The Origin line of 9.4 (lines 373–375) reads "nearest published results: Soulé (2003) and Bayer-Fluckiger, Emery and Houriet (2014), bounds of the same shape away from small primes". BFEH (BFEH2014 lines 47–49) say that Soulé's bound for `log card` is at least `exp(α|D_F|^{1/2})`. This README says the same in its References entry for Soulé 2003 (line 1255) and in 9.4 itself ("improving Soulé 2003", line 395). One possible wording: "nearest published results: Bayer-Fluckiger, Emery and Houriet (2014), a bound of the same shape away from small primes that improves Soulé (2003), …". This is carried from the previous review; the text is unchanged.

## C02 — The Labels paragraph and the Origin lines put 12.1 and 13.1 in different classes

The Labels paragraph (lines 28–32) calls "12.1 when `p` divides `[E : F]`, and 13.1" "this roadmap's own formulations". The Origin lines of 12.1 (line 955) and 13.1 (line 1006) say "adapted from Kolster (2009), Theorem 3.3" and "adapted from Brown and Ghate (2003), Theorem 3.3.1". The labels define these as two distinct classes, so a reader cannot tell which applies. Either the Labels paragraph would say that both are adapted from those theorems and extended here, or the two Origin lines would read "this roadmap's own formulation, extending …". This is carried from the previous review.

## C03 — 9.1 is a case of ArithmeticKTheory §9.1 and carries no `*Corollary of:*` line

The rewritten convention says that what a `*Corollary of:*` line covers is deduced from the general theorem. 9.1 is such a case but does not say so, so an implementer is not told that the deduction is available. Apply ArithmeticKTheory §9.1 (Gabber's lemma, line 4515 of that README) to the complex `ℤ^{Λ₀} → ℤ^ι`. `Λ₀` is finite, because its vectors are integral of bounded norm. The Euclidean norms of the boundaries are at most their `ℓ¹`-norms, which are at most `b`, and `a ≤ #ι`. This gives `#(ℤ^ι/⟨Λ₀⟩)_tors ≤ b^{#ι}`, which is 9.1. For `Λ₀ = ∅` both sides give `1`. The repair is a line `*Corollary of:* ArithmeticKTheory §9.1` under the labels of 9.1 (line 246). This is carried from the previous review.

## C04 — The description does not mention this roadmap's supplier changes

The description never names this roadmap. Its paragraph on new supplier relations covers only the general roadmaps. A reader therefore cannot tell three things. First, 9.8 (a) now cites StableHomotopyKTheory §4.24a in place of its own route through Postnikov towers. Second, the supplier subsections for AlgebraicTopology and GeneralizedCohomology are removed. Third, the roadmap gains ArithmeticGaloisDuality §D7.6a, ArithmeticKTheory §9.1, IntegralIwasawaTheory §12.3a and KatoEulerSystems §4.1a as suppliers, all added by this pull request. One sentence under part 2 would cover it, for example: "In BernoulliBoundsForClassGroupEigenspaces, 9.8 (a) now cites StableHomotopyKTheory §4.24a, so AlgebraicTopology and GeneralizedCohomology are no longer suppliers; 6.17, 9.2, 10.1 and 13.1 cite the new sections §D7.6a, ArithmeticKTheory §9.1, §12.3a and KatoEulerSystems §4.1a."

## N01 — Some citations of 9.3 and 9.4 lack locators or point slightly off

Koecher (1960), in the 9.3 Origin line (line 311) and the References (line 1265), has no theorem or section number. As the previous review read de la Torre Durán (2026), the orbit count cited in 9.3 (lines 363–364) is their Theorem 3.9. Their Theorem 4.5, cited in 9.4 (line 395), bounds `K_m(𝒪_F)_tors`; the homology bound is (26) in §4.2.

## Questions for the author

- This question is carried from the previous review and is unanswered; the text of 12.1 is unchanged. In 12.1, when `p` divides `[E : F]`, which "`χ⁻¹`-part" of `H²(𝒪_{E′,S}, ℤ_p(n))` is meant? Take `F = ℚ`, `p = 5`, `E = ℚ(ζ₁₁)^+`, `n = 2`, `χ = 1`, `S = {5, 11, ∞}`. The formula gives `v₅ = 1`. The part cut out by the idempotent of the prime-to-5 subgroup has `v₅ = 2`, while the invariants or coinvariants of all of `Gal(E′/ℚ)` give `v₅ = 1`. If the second reading is intended, would the Origin line and the Labels paragraph say so? I could not settle invariants for a non-cyclic Sylow subgroup.

## Previous findings

- The previous review raised no finding (R01 …). Its remarks stand at this head as follows:
- C01 — not repaired: "nearest published results: Soulé (2003) and Bayer-Fluckiger, Emery and Houriet (2014), bounds of the same shape away from small primes" (9.4, lines 373–375).
- C02 — not repaired: "9.8 (b), 12.1 when `p` divides `[E : F]`, and 13.1, … are this roadmap's own formulations" (lines 30–32), against "adapted from" at lines 955 and 1006.
- C03 — not repaired: the 9.1 heading (line 246) is followed by the Origin and Method labels only, with no `*Corollary of:*` line.
- C04 — not repaired: the description's paragraph on supplier relations names only general roadmaps and does not mention this roadmap.
- N01 — not repaired: "adapted from Koecher (1960) and Braun, Coulangeon, Nebe and Schönnenbeck (2015)" (line 311), with no locator for Koecher.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| New convention, against 6.17 | `F = ℚ`, `ℓ = 3`, `e = 2`, `T = ℤ₃(3)`, `T^D = ℚ₃/ℤ₃(−2)` | global and local `H⁰` both `ℤ/3` (least `v₃(u² − 1) = 1`); `H² = K₄(ℤ) ⊗ ℤ₃ = 0`; so `length Ш¹ = 0 + 1 − 1 = 0` | sound; the route differs and the label says so; §D7.6a is in Dependencies |
| New convention, against 10.1 | `E = ℚ(i)`, `ψ = 1`, `e = 11`, `ℓ = 691`, `n = 12` | `χ(c) = 1 = (−1)^{12}`; `v(ζ(−11)) = v(691/32760) = 1`; `2^{11} − 1 = 23·89`, a unit; `H⁰(ℚ, ℚ₆₉₁/ℤ₆₉₁(12)) = 0` | sound; the route is Kolyvagin's, the formal proof's; §12.3a is in Dependencies |
| New convention, against 14.1 | `k = 2`; `k = 23`, `r = 11` | `k = 2`: only `r = 1 = k/2`, which is excluded, so vacuous; `k = 23`: `1 ≤ 11 ≤ 22`, `11 ≠ 11.5` | sound; the route is the deduction, and Needs lists §7.9 |
| "The general theorem is proved in the roadmap that states it" | §D7.6a, §12.3a, §7.9 at this head | §D7.6a proves (a)–(d), with Needs; §12.3a has a route via §§10.4, 10.5, 12.1, 12.3; §7.9 says "Prove" and reduces to `K = ℚ` | sound |
| §12.3a formula, used by the deduction of 10.1 | `F = E = ℚ`, `p = 3`, `n = 2`, `χ = 1` | `v₃(L_S(−1)) = v₃((−1/12)(−2)) = −1`; `H⁰(ℚ, ℚ₃/ℤ₃(2)) = ℤ/3`; the sum is `0 = v₃ #(K₂(ℤ) ⊗ ℤ₃)` | sound |
| 9.1 as a case of ArithmeticKTheory §9.1 | `Λ₀ = {b}`, `ι = {1}`; `Λ₀ = ∅` | `ℤ/b`, with `a = 1`, bound `b`; empty: `a = 0`, bound `1 = b^{#ι}`, torsion trivial | C03 |
| Headline (2), Lean (unchanged) | `L = ℚ`, `N = 1`, `m = 0, 1` | `m = 1`: `H₁({±1}) = ℤ/2`, `log log 2 ≈ −0.37`; `m = 0`: the order is 1, and `Real.log 0 = 0` | sound |
| 9.4 Origin | BFEH2014 lines 43–49; README line 1255 | Soulé: `log card ≥ exp(α|d|^{1/2})`; BFEH: `log card ≤ (nd)^α |D|^β` | C01 |
| Description, "General theorems first" | the new convention | "states and proves the general theorem" agrees with "proved in the roadmap that states it" | sound; C04 |

The rows for the statements the diff does not touch stand as in the previous review, of `71bbefa`.

- Changed passage: the convention at lines 34–42. It was read against the `*Corollary of:*` lines of 6.17, 10.1 and 14.1 (lines 66, 646 and 1068), their Needs lines (148, 847 and 1120), the Dependencies of Layers 6, 10 and 14, the supplier contracts, and the family index (line 200 says the same).
- Cross-roadmap citations resolved at this head: 11 in all, namely ArithmeticGaloisDuality §§D7.6, D7.6a and R02.4.3; IntegralIwasawaTheory §§12.3 and 12.3a; KatoEulerSystems §§4.1, 4.1a and 7.9; StableHomotopyKTheory §4.24a; ArithmeticKTheory §9.1; and HeckeIdealsAndTaylorWilesRelations §10.1. §D7.6a and ArithmeticKTheory §9.1 changed since `71bbefa` (in the Matlis duality of (b) and in the source of Hadamard's inequality), but the statements cited here did not change.
- Source locators: the changed passage cites none; BFEH2014 lines 43–49 were re-read for C01.
- Dependency check: `depcheck: 132 roadmaps, 1481 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Automatic checks: every check passed. Elaboration of `Suggested.lean`, which is unchanged since `71bbefa`, gives only the `sorry` warning at line 78.
- Changes outside the folders the pull request names: none (the diff against the base, with those folders excluded, is empty).

Overlap check: read UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, ArithmeticKTheory, SelmerLengthBoundsAndLocalLifting, ArithmeticKTheoryPartII and ModularIwasawaMainConjecturesPartII. Since `71bbefa`, the first two changed only in the same convention paragraph. Shared objects and their owners are as before: Sha-kernel duality belongs to ArithmeticGaloisDuality §D7.6a, Gabber's lemma to ArithmeticKTheory §9.1, and the Hurewicz exponent to StableHomotopyKTheory §4.24a; UniformWildKernelBounds consumes this roadmap.

Source independence: changed passages only. The one changed passage (the convention on corollaries, 9 lines) cites no source, so it was compared with none, and no wording is shared. The largest share of citations is [FormalProof], 53 of 92 (unchanged). The arrangement was not compared, because no layer was added, removed or reordered.

Research link: Layer 9 continues Soulé's perfect-form method for torsion in the K-theory of rings of integers (Soulé 1999; Bayer-Fluckiger, Emery and Houriet 2014; de la Torre Durán 2026). Layer 10 carries the Kolyvagin–Rubin Euler system of Gauss sums (1990, 1991) to twists, and Layer 14 rests on Kato's finiteness theorem (2004). All of them feed the family's formal proof of GRH for Dirichlet L-functions. Basis: README and References.

## Not verifiable

- Kolster 2009, §3 and Theorem 3.3 (Origin lines of 6.18, 10.1 and 12.1): no legal copy found.
- Kato 2004, Theorem 14.2 (Origin line of 14.1): no legal copy found; it agrees with KatoEulerSystems §7.9, which cites the same theorem.
- Schneider 1979 (Origin line of 6.17): paywalled.
- The `*Method of the formal proof:*` labels of 6.17, 10.1 and 14.1 were not checked against the [FormalProof] repository.
- The other items of the previous review's list are in text this change does not touch, and they stand.

## Source issues

- none

## For the human reviewers

- de la Torre Durán 2026 (arXiv:2611.06300, v2 of 19 November 2026) is an unrefereed preprint. The README cites it in 9.3, 9.4 and the References, and at line 364 calls it "the published result nearest to (e)".
- Kolster 2009 (lecture notes cited in the Origin lines of 6.18, 10.1 and 12.1): no legal copy was found, and the publication venue given in the References was not confirmed.
