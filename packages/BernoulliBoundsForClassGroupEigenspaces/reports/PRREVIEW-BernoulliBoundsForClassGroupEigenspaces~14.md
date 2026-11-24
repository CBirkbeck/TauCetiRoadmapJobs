# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 321 changed lines since `aecb53a`. The review checked the new Origin, Method and Corollary-of labels of all fifteen sections and the rewritten 9.8 (a), 12.1 and 13.1. It resolved the five supplier sections the change adds (ArithmeticGaloisDuality §D7.6a, ArithmeticKTheory §9.1, StableHomotopyKTheory §4.24a, IntegralIwasawaTheory §12.3a, KatoEulerSystems §4.1a) and read seven sources at their locators. No statement is false or unsupported, and no layer or item is lost. Accepted, with four small corrections and one format note, none blocking. The most substantive correction is that the 9.4 Origin line credits Soulé 2003 with a bound of the same shape as BFEH, which this README's own References contradict. One question for the author concerns 12.1 when `p` divides `[E : F]`, and the human reviewers have two items: an unrefereed preprint and an unread source.

## C01 — The 9.4 Origin line puts Soulé 2003 among bounds "of the same shape", but Soulé's bound is much weaker

A reader of the label would take Soulé 2003 to give `log log #H_m(GL_N(𝒪_L); ℤ)_tors` linear in `log |d_L|` away from small primes, which overstates what was known before BFEH. The label at line 374 reads "nearest published results: Soulé (2003) and Bayer-Fluckiger, Emery and Houriet (2014), bounds of the same shape away from small primes". BFEH (p. 2, BFEH2014 lines 47–49) say Soulé's bound for `log card` is at least `exp(α|D_F|^{1/2})`, so its `log log` grows like `|d_L|^{1/2}`. This README says the same in its References entry for Soulé 2003 and in 9.4 itself ("improving Soulé 2003"). One possible wording: "nearest published results: Bayer-Fluckiger, Emery and Houriet (2014), a bound of the same shape away from small primes that improves Soulé (2003), …".

## C02 — The Labels paragraph and the Origin lines put 12.1 and 13.1 in different classes

The change introduces four Origin classes, and these two sections get two of them, so a reader cannot tell which applies. The Labels paragraph (lines 27–32) calls "12.1 when `p` divides `[E : F]`, and 13.1" "this roadmap's own formulations". The Origin lines of 12.1 (line 954) and 13.1 (line 1005) instead say "adapted from Kolster (2009), Theorem 3.3" and "adapted from Brown and Ghate (2003), Theorem 3.3.1". Either the Labels paragraph would say that both are adapted from those theorems and extended here, or the two Origin lines would read "this roadmap's own formulation, extending …".

## C03 — 9.1 is now a special case of ArithmeticKTheory §9.1, and its labels do not say so

ArithmeticKTheory §9.1, added by this pull request and cited in 9.2, states Gabber's lemma for a based complex. Apply it to `ℤ^{Λ₁} → ℤ^ι`, where `Λ₁` is a finite part of `Λ₀` that generates `⟨Λ₀⟩`. The Euclidean norm is at most the `ℓ¹`-norm, which is at most `b`, and `a ≤ #ι`, so the torsion has order at most `b^{#ι}`; this is exactly 9.1. The Origin line at line 247 cites only Soulé's Lemma 1. Under the README's own convention, 9.1 would carry `*Corollary of:* ArithmeticKTheory §9.1`, so that an implementer knows the deduction is available once that section is in the library.

## C04 — The description does not mention this roadmap's supplier changes

A reader of the description cannot tell the following. In this roadmap, the route of 9.8 (a) through Postnikov towers and Eilenberg–MacLane spectra is replaced by a citation of StableHomotopyKTheory §4.24a, and AlgebraicTopology and GeneralizedCohomology are dropped as suppliers. The roadmap also gains ArithmeticGaloisDuality §D7.6a, ArithmeticKTheory §9.1, IntegralIwasawaTheory §12.3a and KatoEulerSystems §4.1a as suppliers, all added by this pull request. One sentence under part 2 would cover it, for example: "In BernoulliBoundsForClassGroupEigenspaces, 9.8 (a) now cites StableHomotopyKTheory §4.24a in place of its own route, so AlgebraicTopology and GeneralizedCohomology are no longer suppliers."

## N01 — Some new citations lack locators or point slightly off

Koecher (1960), in the 9.3 Origin and in the References, has no theorem or section number. The orbit count by de la Torre Durán cited in 9.3 (line 363) is their Theorem 3.9 (p. 14). Their Theorem 4.5, cited in 9.4 (line 394), bounds `K_m(𝒪_F)_tors`; the homology bound behind it is (26) in §4.2 (p. 17).

## Questions for the author

- In 12.1, when `p` divides `[E : F]`, what is "the `χ⁻¹`-part" of `H²(𝒪_{E′,S}, ℤ_p(n))`? Take `F = ℚ`, `p = 5`, `E = ℚ(ζ₁₁)^+`, `n = 2`, `χ = 1`, `ψ = ω²` and `S = {5, 11, ∞}`. The formula gives `v₅(ζ(−1)(1 − 5)(1 − 11)) = v₅(−10/3) = 1`. Read with the idempotent of the prime-to-5 subgroup, the part is `H²(𝒪_{E,S}, ℤ₅(2))`, of order `5²`: `ζ_E(−1) = −20/33`, plus `ℤ/5` from the prime above 11. So under that reading the identification fails. Read as invariants or coinvariants of all of `Gal(E′/ℚ)`, the part has order `5` and the formula holds. Corestriction in degree 2 identifies the coinvariants with the part over the fixed field of the `p`-Sylow subgroup, which would make this case a corollary of IntegralIwasawaTheory §12.3a. If that is the intended reading, would the Origin line and the Labels paragraph say so? I did not check invariants for a non-cyclic Sylow subgroup, or the pole branch `ψ = 1`.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 6.17 Corollary of §D7.6a | `T = ℤ_ℓ(e+1)`; `F = ℚ`, `ℓ` odd | `T^D = ℚ_ℓ/ℤ_ℓ(−e)`; `Ĥ²(ℝ, T) = 0`; one place over `ℓ`, so global `H⁰` = local `H⁰` and `length Ш¹ = length K_{2e}(ℤ){ℓ}` | sound |
| 6.17 Origin (Kolster–Movahhedi) | KolsterMovahhedi2000 §1, p. 41 | sequence `0 → WK → H²(o_S, ℤ_p(i)) → ⊕H²(F_v) → H⁰(F, ℚ_p/ℤ_p(1−i))* → 0`, matching §D7.6a (d) | sound |
| 6.18 labels | `F = ℚ`, `G` trivial | (b) gives `length Ш¹(ℚ, ℓ, e) = V_ℓ(1, e; {ℓ})`; (a) direction `S ⊂ S′ ⇒ V(S′) ≤ V(S)` | sound |
| 9.1, and ArithmeticKTheory §9.1 | `ι = {1}`, `Λ₀ = {b}`; boundaries `(2,1)`, `(−1,2)` | `ℤ/b`, bound `b`; `ℓ¹` gives `3² = 9 ≥ 5`, Euclidean gives `(√5)² = 5` | sound; C03 |
| 9.2 Gabber citation | Soule1999 Prop. 3, p. 6 | `a(k) = min(#Σ_{k+1}, #Σ_k)`, `b(k) = max(sup norm, 1)`, the same as ArithmeticKTheory §9.1 | sound |
| 9.2 / 9.4 Emery | Emery2014 Thm 1.1, p. 2 | assumes `H_q(Γ, ℚ) = 0` for `q ≤ j`; `log|H_j(Γ)| ≤ C_G·vol`; constant not explicit | sound |
| 9.3 Origin | Soule1999 Props 1–2; BCNS arXiv v1 Thm 2.4, Cor 2.5; de la Torre Durán Thm 3.9 | `SL_N(ℤ)` cell count; tessellation over `O_K`; orbit count for totally real / CM fields | sound; N01 |
| 9.4 Origin "same shape" | BFEH Cor 1.2; Soulé 2003 as BFEH quote it; de la Torre Durán Thm 4.5 | BFEH `log log ≤ α log(nd) + β log|D|`, linear; Soulé `≥ α|D|^{1/2}`, not linear; de la Torre Durán linear | C01 |
| 9.5 Method identity | `Φ(ψ^ℓ x) = ℓΦ(x)` | `Φ(∏_{t<j−1}(ψ^ℓ − ℓ^{t+2})x) = ℓ^{j−1}∏(1 − ℓ^{t+1})Φ(x)`; the product is a unit mod `ℓ` | sound |
| 9.7 corestriction form | `cd_ℓ = 2` | `H²` is the top degree, so corestriction is onto | sound |
| 9.8 (a) with §4.24a | `m = 1, 2, 4, 8` | `K₁ = GL/E = GL^{ab} = H₁` (Whitehead), `R₁ = 1`; `R₂ = 2`, `R₄ = 24`, `R₈ = 17280`; primes `≤ m/2 + 1`, consistent with BFEH's quote of Arlettaz | sound |
| 10.1 Corollary of §12.3a | `E = ℚ(i)`, `ψ = 1`, `e = 11`, `ℓ = 691` | `ψ(−1) = 1 = (−1)^{12}`; `v₆₉₁(ζ(−11)) = v(691/32760) = 1 = v₆₉₁(4·30030·B₁₂)` | sound |
| 11.1 Method, `p = 2` | `F₂[σ]` | `(σ − 1)² = σ² − 2σ + 1 ≡ 0`; `dim 𝒱 ≤ 2 dim 𝒱^σ`, so `#𝒱 ≤ (#𝒱^σ)²` | sound |
| 12.1, `[E:F]` prime to `p` | `F = ℚ`, `p = 7`, `E = ℚ(√5)` | `[E′:ℚ] = 12`, prime to 7; `μ₇ ⊂ E′`; this is §12.3a over `E′` | sound |
| 12.1, `p ∣ [E:F]` | `ℚ(ζ₁₁)^+`, `p = 5`, `χ = 1` | formula 1; prime-to-5 idempotent part `v₅ = 2`; part for all of `Gal(E′/ℚ)`: `v₅ = 1` | question |
| 13.1 ordinary case | Brown–Ghate Thm 3.3.1, p. 1656; `S₃(38, χ₋₁₉)` at 5 | `v(a_p²ε(p)^{−1}) = 0` iff `a_p` is a `λ`-unit; `a₅² = −8` is a 5-unit | sound |
| 14.1 Corollary of KatoEulerSystems §7.9 | `k = 2e + 1`, `r = e` | `1 ≤ e ≤ 2e`, `e ≠ e + ½`; §7.9 cites Kato Thm 14.2, p. 235, as the Origin line does | sound |
| Headline (2), Lean (unchanged) | `L = ℚ`, `N = 1`, `m = 0, 1` | `m = 1`: `H₁({±1}) = ℤ/2`, `log log 2 < 0`; `m = 0`: `#tors = 1`, and the junk value `Real.log 0 = 0` is harmless | sound |
| Labels paragraph | 12.1, 13.1 | "own formulations" against Origin "adapted from" | C02 |
| BFEH Cor. 2.3 cutoff | `F = ℚ(√13)`, `N = 7` | `ζ₁₃` has degree 6 over `F`; `GL₇(O_F)` contains an element of order `13 > ℓ = 8` | source issue |

- Source locators checked against the text: 21 locators in 7 sources (Soule1999 Lemma 1, Props 1–3; BFEH2014 Thm 1.1, Cor 1.2, Cor 2.3, §3.1, Lemma 3.1; Emery 2014 Thm 1.1, Lemma 2.2; de la Torre Durán Thm 3.9, Lemma 4.3, Rmk 4.4, Thm 4.5; BCNS Thm 2.4, Cor 2.5; Brown–Ghate Thms 1.0.1, 3.3.1; Kolster–Movahhedi §1 p. 41).
- Cross-roadmap citations resolved at this head: ArithmeticGaloisDuality §D7.6a; ArithmeticKTheory §9.1; StableHomotopyKTheory §4.24a; IntegralIwasawaTheory §§12.3, 12.3a; KatoEulerSystems §§4.1a, 7.9; HeckeIdealsAndTaylorWilesRelations §10.1 (which now carries Corollary of §D7.6a, so there is one owner for each case). None is defined by another open pull request.
- Record check against `aecb53a`: 7 layers, none removed or retitled; 15 sections, all kept; the removed text is the route of 9.8 (a), which now has an owner, and two declaration names of [FormalProof]. No item lost its statement.
- Dependency check: `depcheck: 132 roadmaps, 1481 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: every check passed. Elaboration of `Suggested.lean` (unchanged by this pull request): only the `sorry` warning; its one elaborated signature matches 9.4 and headline (2).
- Library: no declaration added or changed; `groupHomology`, `AddCommGroup.torsion` and `NumberField.discr` appear as in the unchanged file.
- Overlap check: read UniformWildKernelBounds (main and its open revision), ArithmeticKTheory, ArithmeticKTheoryPartII, ModularIwasawaMainConjecturesPartII, HeckeIdealsAndTaylorWilesRelations, SelmerLengthBoundsAndLocalLifting. Shared objects and their owners: Sha-kernel duality (ArithmeticGaloisDuality §D7.6a, with HeckeIdealsAndTaylorWilesRelations §10.1 for `Σ ≠ S`), Gabber's lemma (ArithmeticKTheory §9.1), the Hurewicz exponent (StableHomotopyKTheory §4.24a); UniformWildKernelBounds consumes this roadmap.
- Source independence: changed passages only; 11 passages compared with 7 sources (Soule1999, BFEH2014, Emery 2014, de la Torre Durán 2026, BCNS 2015, Brown–Ghate 2003, Kolster–Movahhedi 2000), no wording shared beyond forced terminology (at most five words, "faces of the Voronoi tessellation"); largest share [FormalProof], 53 of 92 source citations; arrangement not compared (no layer added, removed or reordered).
- Research link: Layer 9 continues Soulé's perfect-form method for torsion in the K-theory of rings of integers (Soulé 1999; Bayer-Fluckiger–Emery–Houriet 2014; de la Torre Durán 2026). Layer 10 carries the Kolyvagin–Rubin Euler system of Gauss sums (1990, 1991) to twists, and Layer 14 rests on Kato's finiteness theorem (2004). All feed the family's formal proof of GRH for Dirichlet L-functions. Basis: README and References.

## Not verifiable

- Soulé 2003, Theorem 3 (9.7 Origin and References): no legal copy fetched; the Documenta landing page is on a host the sources service does not classify.
- Kolster 2009, §3 and Theorem 3.3 (6.18, 10.1, 12.1 Origin): no legal copy found.
- Kato 2004, Theorem 14.2 (14.1 Origin): no legal copy found; it agrees with KatoEulerSystems §7.9's citation of the same theorem.
- Schneider 1979 (6.17 Origin): paywalled.
- Brown 1982, III.1, III.10, VII.7–VII.8 (9.2 Origin): book, not open.
- Koecher 1960 (9.3 Origin): no locator given; not fetched.
- Arlettaz 1991, Theorem 1.5 (9.8 Origin): uncertified, paywalled; read through StableHomotopyKTheory §4.24a and the quotations in BFEH §3.1 and de la Torre Durán §4.2.
- The `*Method of the formal proof:*` labels: not checked against the [FormalProof] repository.

## Source issues

- **Gap** in BFEH2014 at Corollary 2.3, p. 4: the source says primes dividing finite stabilizers in `GL_N(O_F)` are at most `1 + max(d, N)`; it fails for `F = ℚ(√13)`, `N = 7`, where an element of order 13 exists; it should be `p ≤ dN + 1` (de la Torre Durán 2026, Lemma 4.3 and Remark 4.4); affects a stated result (the cutoff of Theorem 1.1 and Corollary 1.2).

## For the human reviewers

- de la Torre Durán 2026 (arXiv:2611.06300, v2 dated 19 November 2026) is an unrefereed preprint. The README cites it in 9.3, 9.4 and its References, calling it "the published result nearest to (e)" at line 363.
- Kolster 2009 (lecture notes, cited in the new Origin lines of 6.18, 10.1 and 12.1): no legal copy found, and the publication venue given in the References was not confirmed.
