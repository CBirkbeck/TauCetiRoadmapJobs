# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #3027 at cd123f8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 322 changed lines since `74a09b7`. Accepted: no finding. The folder is unchanged since the previous review; the labels, `*Corollary of:*` lines and new supplier citations were checked again against the six cited sections at this head, against Soulé 1999 and BFEH 2014 at their locators, and against the family index, which did change. That change exposes one new small correction: the index now says the source of the formal proof states the Hurewicz-kernel bound, while 9.8 says the statement is not in [FormalProof]. There are five small corrections and one format note, none blocking; four corrections and the note are carried unrepaired. One question for the author is carried, and three items are left for the human reviewers.

## C01 — The label of 9.8 says its statement is not in [FormalProof], but the source of the formal proof states 9.8 (a)

A reader who looks for the Hurewicz-kernel bound in the formal proof is told it is absent, and the family index at this head tells them the opposite. The label of 9.8 (line 597) reads "*Method of the formal proof:* none; the statement is not in [FormalProof]", and the Labels paragraph (lines 28–29) says "The statements of 9.8, 12.1 and 13.1 are not statements of [FormalProof]". The family index ("What the proof does not need") now says that the source of the formal proof states each theorem of its list, which includes "bounds for the kernel of the Hurewicz map", and that the main theorems do not depend on those statements. At the commit the References name, the file `AV/PublishedTheorems/KAcyclicHomology.lean` declares the proposition `KHurewicz`: for a commutative ring and degree `k + 2`, the kernel of the Hurewicz map is killed by an integer depending on the degree. The README at the merge base recorded this declaration, and the change removes the record.

The smallest repair is in the label, for example: "*Method of the formal proof:* none. [FormalProof] states (a), for commutative `R` and `m ≥ 2`, as the proposition `UpperTheory.V.Published.KHurewicz` (`AV/PublishedTheorems/KAcyclicHomology.lean`), on which its main theorems do not depend; it does not state (b)." The Labels paragraph would then say that [FormalProof] does not prove or use the statements of 9.8, 12.1 and 13.1.

## C02 — The 9.4 Origin line puts Soulé 2003 among bounds "of the same shape", but Soulé's bound is much weaker

A reader would take Soulé 2003 to bound `log log` of the torsion linearly in `log |d_L|`. The Origin line of 9.4 (lines 373–375) reads "nearest published results: Soulé (2003) and Bayer-Fluckiger, Emery and Houriet (2014), bounds of the same shape away from small primes". BFEH2014 lines 47–49 say that Soulé's bound for `log card` is at least `exp(α|D_F|^{1/2})`, and the README says the same at 9.4 ("improving Soulé 2003", line 394) and in its References. One wording: "nearest published results: Bayer-Fluckiger, Emery and Houriet (2014), a bound of the same shape away from small primes that improves Soulé (2003), …". Carried from the previous review; the text is unchanged.

## C03 — The Labels paragraph and the Origin lines put 12.1 and 13.1 in different classes

The Labels paragraph (lines 30–32) calls "12.1 when `p` divides `[E : F]`, and 13.1" "this roadmap's own formulations"; the Origin lines of 12.1 (line 955) and 13.1 (line 1006) say "adapted from Kolster (2009), Theorem 3.3" and "adapted from Brown and Ghate (2003), Theorem 3.3.1". The labels define these as two distinct classes, so a reader cannot tell which applies. Either the Labels paragraph would say that both are adapted from those theorems and extended here, or the two Origin lines would read "this roadmap's own formulation, extending …". Carried from the previous review.

## C04 — 9.1 is a case of ArithmeticKTheory §9.1 and carries no `*Corollary of:*` line

The convention says that what a `*Corollary of:*` line covers is deduced from the general theorem; 9.1 is such a case and does not say so, so an implementer is not told the deduction is available. Apply ArithmeticKTheory §9.1 to the complex `ℤ^{Λ₀} → ℤ^ι` (`Λ₀` is finite, its vectors being integral of bounded norm): the Euclidean norms of the boundaries are at most their `ℓ¹`-norms, at most `b`, and `a ≤ #ι`, which gives `#(ℤ^ι/⟨Λ₀⟩)_tors ≤ b^{#ι}`. For `Λ₀ = ∅` both sides are `1`. The repair is a line `*Corollary of:* ArithmeticKTheory §9.1` under the labels of 9.1 (line 246). Carried from the previous review.

## C05 — The description does not mention this roadmap's supplier changes

The description's prose never names this roadmap, and its paragraph on new supplier relations covers only the general roadmaps. A reader cannot tell that 9.8 (a) now cites StableHomotopyKTheory §4.24a in place of its own route through Postnikov towers, that the supplier subsections for AlgebraicTopology and GeneralizedCohomology are removed, or that ArithmeticGaloisDuality §D7.6a, ArithmeticKTheory §9.1, IntegralIwasawaTheory §12.3a and KatoEulerSystems §4.1a become suppliers. One sentence under part 2 would cover it, for example: "In BernoulliBoundsForClassGroupEigenspaces, 9.8 (a) now cites StableHomotopyKTheory §4.24a, so AlgebraicTopology and GeneralizedCohomology are no longer suppliers; 6.17, 9.2, 10.1 and 13.1 cite the new sections §D7.6a, ArithmeticKTheory §9.1, §12.3a and KatoEulerSystems §4.1a." Carried from the previous review.

## N01 — Some citations of 9.3 and 9.4 lack locators or point slightly off

Koecher (1960), in the 9.3 Origin line (line 311) and the References, has no theorem or section number. As an earlier review read de la Torre Durán (2026), the orbit count cited in 9.3 (lines 363–364) is its Theorem 3.9, and its Theorem 4.5, cited in 9.4 (line 395), bounds `K_m(𝒪_F)_tors`, the homology bound being (26) in its §4.2. Carried; not re-read this round.

## Questions for the author

- Carried and unanswered; the text of 12.1 is unchanged. When `p` divides `[E : F]`, which "`χ⁻¹`-part" of `H²(𝒪_{E′,S}, ℤ_p(n))` is meant? For `F = ℚ`, `p = 5`, `E = ℚ(ζ₁₁)^+`, `n = 2`, `χ = 1`, `S = {5, 11, ∞}` an earlier review computed `v₅ = 1` from the formula, `v₅ = 2` for the part cut out by the idempotent of the prime-to-5 subgroup, and `v₅ = 1` for the invariants or coinvariants of all of `Gal(E′/ℚ)`. If the second reading is intended, would the Origin line and the Labels paragraph say so? Invariants for a non-cyclic Sylow subgroup could not be settled.

## Previous findings

- The previous review raised no finding. Its remarks stand at this head as follows (the folder has no change since the head it read):
- Its C01 (9.4 Origin, Soulé 2003) — not repaired: "nearest published results: Soulé (2003) and Bayer-Fluckiger, Emery and Houriet (2014), bounds of the same shape away from small primes" (lines 373–375). Now C02.
- Its C02 (Labels against Origin of 12.1, 13.1) — not repaired: "9.8 (b), 12.1 when `p` divides `[E : F]`, and 13.1, … are this roadmap's own formulations" (lines 30–32). Now C03.
- Its C03 (9.1 without `*Corollary of:*`) — not repaired: the heading at line 246 is followed by the Origin and Method labels only. Now C04.
- Its C04 (description) — not repaired: the prose of the description does not name this roadmap. Now C05.
- Its N01 — not repaired: "adapted from Koecher (1960) and Braun, Coulangeon, Nebe and Schönnenbeck (2015)" (line 311), no locator for Koecher.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 6.17 (b)–(c), as corollary of ArithmeticGaloisDuality §D7.6a | `F = ℚ`, `ℓ = 3`, `e = 2`, `T = ℤ₃(3)` | global and local `H⁰(·, ℚ₃/ℤ₃(−2))` both `ℤ/3` (`min v₃(u² − 1) = 1`); `H² = K₄(ℤ) ⊗ ℤ₃ = 0`; identity: `0 + 1 = Ш¹ + 1`, so `Ш¹ = 0` | sound; §D7.6a (b), (d) state what the line cites |
| 6.18 | `F = ℚ` | (b) reads `length Ш¹(ℚ, ℓ, e) = V_ℓ(1, e; {ℓ})`; one character, sum of one term | sound (labels only changed) |
| 9.1 | `ι = {1}`, `Λ₀ = {b}`; `Λ₀ = ∅` | `ℤ/b`, order `b = b¹`; empty: torsion of `ℤ^ι` is 1, bound `b^{#ι} ≥ 1` | sound; Soule1999 line 175, Lemma 1, p. 5; C04 |
| 9.2, Gabber's lemma via ArithmeticKTheory §9.1 | `ℤ → ℤ`, multiplication by `b`, `k = 0` | `H₀ = ℤ/b`, `a = 1`, bound `b¹` | sound; Soule1999 line 240, Proposition 3, p. 6; §9.1 states the same `b^a` |
| 9.3 | `L = ℚ`, `N = 2` | hexagonal form, 3 pairs of minimal vectors `= dim V = 3`; stabilizer 12 `≤ 3⁴ = 81` | sound; Soule1999 lines 88, 141 (Propositions 1–2, pp. 3–4); BFEH2014 line 123 (Theorem 2.2, p. 4) |
| 9.4 and its Lean form `log_log_card_torsion_groupHomology_GL_le` | `L = ℚ`, `N = 1`, `m = 0, 1, 2` | `m = 0`: torsion of `ℤ` has order 1, `log 0 = 0 ≤ c₂ log 2`; `m = 1`: `ℤ/2`, `log log 2 ≈ −0.37`; `m = 2`: `H₂({±1}) = 0`, `0 ≤ 3c₂ log 2` | sound; C02 on the Origin line |
| 9.5 | `B = ℤ/ℓ^ν`, `ρ_j ≥ 1` | bound `(ℓ^ν)^{ρ_j} t_j t_{j−1} ≥ ℓ^ν = #B`: empty, as the text says | sound (labels only changed) |
| 9.6 (b1) | `E = 1`, `q` any | `H₂(C_q × C_q; ℤ/q)`: Künneth ranks `1 + 1 + 1 = 3 = 2E + 1`; 4 elements, a relation with a unit coefficient | sound |
| 9.7 | `L = ℚ(i)`, `ℓ = 2` | `H² = 0`, `log 1 = 0 ≤ 8^{(4E)^{C_K}}` | sound; Soulé 2003 Theorem 3 not read |
| 9.8 (a) via StableHomotopyKTheory §4.24a | `m = 1, 2, 4`; `R = ℤ` | `R₁ = 1`, `K₁ = GL^{ab} = H₁`; `R₂ = 2` (the `η`-multiples from `K₁` are killed by 2); `R₄ = 2·2·6 = 24`; primes `≤ m/2 + 1` | sound; first clause of §4.24a covers `m ≥ 2`; C01 on the label |
| 9.8 (b), `ℓ`-part inequality | finite `A = K_m`, `v = v_ℓ(R_m)` | `#A[ℓ^v] = #(A/ℓ^v) ≤ #(A/ℓ)^v`; kernel of Hurewicz on `A{ℓ}` lies in `A[ℓ^v]` | sound; Soule1999 line 343 (Theorem 2, p. 9), BFEH2014 lines 28–46 |
| 10.1 (a), as corollary of IntegralIwasawaTheory §12.3a | `E = ℚ(i)`, `ψ = 1`, `e = 11`, `ℓ = 691` | `4·30030·(−691/2730) = −44·691 = −30404`, `v = 1`; §12.3a: `v(ζ(−11)) = v(691/32760) = 1`, `1 − 2¹¹ = −23·89` a unit, `H⁰ = 0` (690 ∤ 12): length 1 | sound, sharp |
| 11.1 | `p = 2`, `A = ℚ(i)(μ_{2^∞})`, `q ≡ 3 mod 8` | `X(A) = 0`, `#P = 2`, bound `2(0 + 2) = 4`; two steps: `4r + 8M + 16M = 4(r + 6M)` | sound (labels only changed) |
| 12.1 for `[E : F]` prime to `p`, as §12.3a at `E′` | `F = E = ℚ`, `p = 3`, `n = 2`, `χ = 1`, `E′ = ℚ(μ₃)` | `v₃(L_S(−1)) = v₃((−1/12)(−2)) = −1`; `H⁰(ℚ, ℚ₃/ℤ₃(2)) = ℤ/3`; sum `0 = v₃ #(K₂(ℤ[1/3]) ⊗ ℤ₃)` | sound; `E′` abelian of degree prime to `p`, contains `μ_p`, as §12.3a requires |
| 13.1 against KatoEulerSystems §4.1a | `p ∤ N`, `f` ordinary at `λ` | local representation reducible, so 13.1 gives split; §4.1a gives split: agree; good non-ordinary: irreducible, 13.1 silent | sound |
| 14.1, as corollary of KatoEulerSystems §7.9 | `k = 2`; `k = 3`, `r = 1`; `k = 23`, `r = 11` | `k = 2`: only `r = 1 = k/2`, excluded, vacuous; `k = 3`: `1 ≤ 1 ≤ 2`, `1 ≠ 3/2`; `k = 23`: `11 ≠ 11.5` | sound; divisible subgroup of a finite group is 0 |
| Family index, Kato item, against 14.1 | the instance of [FormalProof] | index: over `ℚ`, odd `ℓ`, weight `2e + 1`, weights `e, −e`, `det` odd of order `≤ 2`, ordinary, level prime to `ℓ`; 14.1 (lines 1085–1095) records the same | consistent |
| Family index, Hurewicz item, against 9.8 | the cited source file at the cited commit | file declares `KHurewicz : Prop` (commutative `R`, degree `k + 2`); 9.8 label says "not in [FormalProof]" | C01 |

- Source locators checked against the text: 9 (Soule1999 lines 53–54, 88, 141, 175, 240, 270, 343; BFEH2014 lines 28–49, 123, 137–150), all as cited; BFEH2014 lines 47–49 for C02.
- Cross-roadmap citations resolved at this head: ArithmeticGaloisDuality §D7.6a (line 5794), ArithmeticKTheory §9.1 (line 4515), IntegralIwasawaTheory §12.3a (line 1794), KatoEulerSystems §§4.1a, 7.9 (lines 1283, 2566), StableHomotopyKTheory §4.24a (line 1731); none of these files changed since the previous review's head.
- Record against the merge base: 7 layers at the base, all kept with their ids and subjects; the two headings removed are the supplier subsections for AlgebraicTopology and GeneralizedCohomology, whose content 9.8 (a) now takes from StableHomotopyKTheory §4.24a. No item or Lean declaration removed.
- Library declarations: `Suggested.lean` unchanged since the base; elaborated type compared with 9.4 (`#check` signature: every binder explicit, no section variable). One-tactic probe decided by reading: the single theorem is the headline of 9.4, not closable from the library.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning at line 78.
- Dependency check: `depcheck: 124 roadmaps, 1417 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: every check passed.
- Changes outside the folders the pull request names as its own: none.

Overlap check: read UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, SelmerLengthBoundsAndLocalLifting, ArithmeticKTheory, ArithmeticKTheoryPartII and ModularIwasawaMainConjecturesPartII (by search for the shared objects in the open heads and on main). Shared objects and owners: Sha kernels with lattice coefficients and their duality, HeckeIdealsAndTaylorWilesRelations §10.1 and ArithmeticGaloisDuality §D7.6a; Gabber's lemma, ArithmeticKTheory §9.1; the exponent of the kernel of the Hurewicz map, StableHomotopyKTheory §4.24a; UniformWildKernelBounds consumes 6.17, 6.18, 9.7, 10.1, 11.1, 13.1 and 14.1 and owns none of them. No other open pull request states these objects.

Source independence: changed passages only; 8 passages compared with 2 sources (Soule1999, BFEH2014), none shared beyond formulas; largest share [FormalProof], 53 of 92 locators, a Lean repository whose text was not compared (one file opened for C01); the arrangement was not compared, no layer being added, removed or reordered.

Research link: Layer 9 continues Soulé's perfect-form method for torsion in the K-theory of rings of integers (Soulé 1999; Bayer-Fluckiger, Emery and Houriet 2014); Layer 10 carries Kolyvagin's and Rubin's Euler system of Gauss sums (1990, 1991) to twists; Layer 14 rests on Kato's finiteness theorem (2004). Basis: README, References, and the two sources read.

## Not verifiable

- Kolster 2009 (Origin lines of 6.18, 10.1, 12.1), Kato 2004 Theorem 14.2 (14.1), Schneider 1979 and Kolster–Movahhedi 2000 (6.17), Brown–Ghate 2003 Theorem 3.3.1 (13.1), Soulé 2003 Theorem 3 (9.7), Emery 2014 Theorem 1.1 (9.2, 9.4), Koecher 1960 and Braun–Coulangeon–Nebe–Schönnenbeck 2015 (9.3), Brown 1982 (9.2): not in the sources cache; the supplier sections that cite the same theorems agree with the README.
- Arlettaz 1991, Theorem 1.5 (9.8 (a)): recorded as uncertified, cited by its locator; Soule1999 line 348 and BFEH2014 line 145 cite the same theorem.
- The `*Method of the formal proof:*` labels and the [FormalProof] declaration names were not checked against the repository, except the one file opened for C01.

## Source issues

- none

## For the human reviewers

- Scope: de la Torre Durán 2026 (arXiv:2611.06300) is an unrefereed preprint; the README cites it in 9.3, 9.4 and the References, and at line 364 calls it "the published result nearest to (e)".
- Licence: Kolster 2009 (lecture notes cited in the Origin lines of 6.18, 10.1 and 12.1): no legal copy was found, and the venue given in the References was not confirmed.
- Not tested: [FormalProof] has the largest share of the locators (53 of 92); the wording and arrangement were not compared with it beyond one file.
