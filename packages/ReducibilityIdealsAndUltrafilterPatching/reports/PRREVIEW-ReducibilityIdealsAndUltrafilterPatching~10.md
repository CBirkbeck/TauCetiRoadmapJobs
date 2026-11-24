# Review of ReducibilityIdealsAndUltrafilterPatching (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ReducibilityIdealsAndUltrafilterPatching/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 159 changed lines since `b8f3652`. I checked the `*Origin:*` and `*Method of the formal proof:*` labels of all eleven sections against the statements and routes, each on a computed instance, the citation of DeformationAndDerivedPatchingAlgebra §3.12a as that section stands at this head (it was reworded since the last review and still states the free case of 3.17 (1)), the published locators I could read, and the record against the merge base (no layer, section, Check or declaration removed). The previous review had no finding; the folder's text is unchanged since the head it read, so its four small corrections and one format note stand and are repeated below. Accepted with no finding: four small corrections, one format note and one question, none blocking. The human reviewers are left the questions of scope and of the formal proof as an unread source.

## C01 — Seven `*Origin:*` labels cannot be traced to a place in a published work

A reader checking where a statement comes from finds a name with no place in it, or no work at all. The labels of 3.16 (line 50: Bhattacharya 1957 and Teissier 1973), 6.10 (lines 425–427: De Concini and Strickland 1981), 6.12 (line 553: Skinner–Wiles 1999, Thorne 2015, Allen–Newton–Thorne 2020) and 6.14 (line 759: Pinkham 1974, Rim 1980) give no section or theorem. The labels of 4.8 (line 201), 6.15 (line 787) and 6.16 (line 809) say "adapted from" but name only a notion ("the formal implicit function theorem", "the grading of a versal deformation ring", "the extended Rees algebra"), with no published result.

Add the places. These are the ones I read: Teissier1973, Ch. I, §2, Proposition 2.1 (Teissier1973 line 525), which itself credits Bhattacharya; SkinnerWiles1999 §4.3, Proposition 4.1 (line 2076); AllenNewtonThorne2020 §5, proof of Theorem 5.1 (lines 78–79, 98–99). For 4.8, 6.15 and 6.16, either name a text or, if no published result is meant, use "particular to this proof" or "this roadmap's own formulation".

## C02 — The method label of 6.13 calls the closed normal subgroup `K_∞` the limit group

The method label (lines 635–636) says "The limit group is the closed normal subgroup that agrees with the kernels of almost all levels modulo every open normal subgroup". That subgroup is `K_∞`; in 6.13 (1) the limit group is `G_∞ := Ph/K_∞`, and the Examples of Layer 6 say that for the principal ultrafilter at `N₀` "the limit group is `Γ_{N₀}`". For `Ph = Ẑ` and every `Γ_N = ℤ/2`, the label's object is `2Ẑ`, the statement's is `ℤ/2`. Write "The limit group is the quotient of `Ph` by the closed normal subgroup that …".

## C03 — "This roadmap's own" means two different things

The Labels paragraph (lines 28–33) sorts the forms that are not statements of [FormalProof] into published (3.17 (1)), classical (the Koszul description in 3.16, the height and closure in 6.10 (1)) and "this roadmap's own formulations" (only 4.8 (3), 6.10 (2), 6.13 (1)). Three untouched sentences still call the classical clauses "this roadmap's own": 3.16 (line 93), 3.17 (lines 162–163: "classical (Fulton, Appendix A) and are this roadmap's own") and 6.10 (1) (line 446). A reader of the labels cannot tell which kind these clauses are. In those three places, "classical, not a statement of [FormalProof]" would match the Labels paragraph.

## C04 — 6.15 and 6.16 still say "The route is not given here" although their method labels give one

The method labels give an argument for both sections: for 6.15 through Gordan's lemma, a quotient of a power series ring in finitely many monomials, and generation by the variables; for 6.16 through the subalgebra generated over `C[[T]]` by the nilpotent elements `T^{−c}x`. The Route paragraphs directly below (lines 805 and 824) still say that no route is given, and neither section has a *Needs:* line. Replace the sentence by "The route is the method of the label above" and give each section a *Needs:* line; for 6.15, Gordan's lemma is Mathlib `AddSubmonoid.fg_eqLocusM`.

## N01 — Two sentences narrate a search

"no statement of [FormalProof] was found" (lines 32–33) and "no statement of it was found in [FormalProof]" (line 210) describe a search, not the text. "[FormalProof] has no statement of it" is timeless.

## Questions for the author

- The `*Origin:*` of 3.17 (lines 131–134) calls the expression by primes in (1) published (Fulton 1984, Appendix A). DeformationAndDerivedPatchingAlgebra §3.12a at this head calls the same sum over primes "an elementary adapter, proved from the determinant form", cites only Stacks 02MI for the determinant form, and no longer cites Fulton. Which numbered statement of Fulton's Appendix A gives the sum over the primes of `B` with `length_{B_𝔭}(M_𝔭)` and `N_{κ(𝔭)/E}`? If none does, "adapted from" would fit better. Fulton is paywalled and recorded as uncertified, so I could not open it.

## Verified sound

| Statement | Instances tried | Values computed (README / mine) | Result |
|---|---|---|---|
| 3.16 labels; calculus (8), (10) | `R = M = O[T]`; sections `πⁿT`, `πT`, `T` | `χ(πⁿT) = n`; (8): `χ(πT) = 1 = χ((0,π)) + χ(T) = 1 + 0`; (10): `n·1 + 0 = n` | agrees |
| 3.17 (1)–(2), citing §3.12a | `M = O²`, `a = diag(π, π²)`; `B = M = O[X]/(X² − π)`, `a = X` | `3 = v(π³)`; `length B/XB = 1`, `det = −π`, `N(√π) = −π`, embeddings `2·½ = 1` | agrees |
| DeformationAndDerivedPatchingAlgebra §3.12a (cited, reworded) | `M = O²`, `a = diag(π, π²)`; contract line 856 | section: `M[a] = 0`, `length M/aM = v(det) = 3`, primes: `1 + 2`; contract: `θ = 3 − 0` | still the free case of 3.17 (1) |
| 4.8 method label (2), (3) | `A = O[[X]][b,c]/(bc − X)`; `Hom(O/π³, O/π²)` | two-signed iff `ξ(b)ξ(c) ≠ 0` iff `ξ(X²) ≠ 0`, `X² = b²c² ∈ A_{−2}A_2`; length `min(3,2) = 2 ≤ 3` | agrees |
| 4.9 method label | `r = 1`, `r′ = 0`, toy datum | lower `(Σc_i)·2^{r+r′} = 2n`, upper `2^{r+1+r′}·n = 4n`, quotient `2`; README Check `2n`, `4n` | agrees |
| 4.9 (2) monomial count | `r = 1`, `s = r′ = s′ = 0` | `N₋ = 1`, `N₊(n) = ⌊n/2⌋ + 1`, `H = μ₁ + μ₂ + 1`, `Δ_{e_2}H = 1 = 2^{r+r′−1}` | agrees |
| 6.10 method label (height `≤ g + 1`) | `g = 0`; general `g` | `(m₀₀y₀, m₀₀)`: radical `(m₀₀)`, height 1; Cramer: `det m·y_j ∈ (m·y)`, so the radical is minimal over `g + 1` elements | agrees |
| 6.11 method label | `B = O[[X]]`, `m² = X`, `D₀ = g = 1` | ambient `1 + D₀ + g = 3`, `𝓛 = {X = Y²}` of dimension `2 = 1 + D₀` | agrees |
| 6.12 method label | `k[[x,y]]/(xy)`, `D₁ = 1`; `k × k`, `D₁ = −1` | `dim R/(P+Q) = 0 < 1`: not adjacent; `dim ∅ = −1 ≥ −1`: adjacent, conclusion fails | agrees with Checks |
| 6.13 method label (C02) | `Ph = Ẑ`, `Γ_N = ℤ/2` for all `N` | label: `2Ẑ`; statement and Examples: `G_∞ = ℤ/2` | slip, C02 |
| 6.13 origin label | Pan Prop. 4.5.11; Newton–Thorne Lemma 4.9 (3); Thorne, proof of Prop. 4.16 | kernel and cokernel killed by `f̃²`; by `f`; composites `δ^{2r}`, `δ²` | "inverse up to an element" supported |
| 6.14 method label | `X = ℤ`, weights `0, 1`, `t(w) = (1+u)^w` | `1` and `1 + u` independent over `R/𝔪^N`; components separate | agrees |
| 6.15 method label | weights `(1, −1)`; weights `(2, −3)` | weight-0 monoid generated by `x₁x₂`; by `x₁³x₂²`, `R_1 = R_0·x₁²x₂` | agrees |
| 6.16 method label against the statement | `C = k[ε]/(ε²)`, `c = 1`, `c = 2`; `c = 0` | `c = 1`: both `C[[T]] + k·T^{−1}ε`; `c = 2`: both add `T^{−2}ε`, `T^{−1}ε`; `c = 0`: `C[[T]]` | agrees |
| Labels paragraph (C03) | lines 93, 162–163, 446 | Labels: classical or published; sections: "this roadmap's own" | wording conflict, C03 |
| Headline `length_quot_eq_length_ker_add_valuation_det` | `M = O/πⁿ ⊕ O`, `a = π`; one-tactic probe | `2 = 1 + Ring.ord O π = 1 + 1`; `simp`, `rfl`, `infer_instance`, `aesop` close nothing | not padding |
| Headline `le_of_determinantalPresentation` | `g = 0`; probe | `𝒜 1 = ⊥`, `ired = ⊥ ≤ Z`: hypothesis fails, vacuous as README (2) says; probe closes nothing | not padding |
| Headline `exists_patched_module_up_to_element` | `s = 0`, `f = 1`; probe | `𝔹 = R` completed at `⊥`, `𝕄 = 𝔹 ⊗ 𝒳`, empty sequence; probe closes nothing | not padding |

- Source locators checked against the text: Teissier1973 I 2.1 (line 525); SkinnerWiles1999 Prop. 4.1 (line 2076) and §5 (line 2644); AllenNewtonThorne2020 lines 78–79, 98–99; Pan2022 §§4.4–4.8 (contents lines 37–42) and 4.5.10–4.5.13 (lines 2548–2584); NewtonThorne2023 Def. 4.8, Lemmas 4.9, 4.21 (lines 1502, 1535, 1746); Thorne2026 Prop. 4.16 and proof (lines 1326–1387); DottoThorne2026 Lemmas 3.4.1–3.4.2 (lines 1390, 1462); SGA2 XIII 2.1 (line 5099); Stacks 02MI, 09B8, 05GG, 031D, 00LN, 061R, 061S, 00IQ present.
- Library declarations opened at the pins: Tau Ceti `Matrix.length_quotient_range_mulVecLin_eq_ord_det` (`TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Length.lean`, line 58); Mathlib `Ring.ord` (`Mathlib/RingTheory/OrderOfVanishing/Basic.lean`, line 37), `Ring.ord_eq_addVal` (`Mathlib/RingTheory/OrderOfVanishing/Noetherian.lean`, line 89).
- Cross-roadmap citations resolved: DeformationAndDerivedPatchingAlgebra §3.12a at this head (README line 738); UniformWildKernelBounds cites this roadmap's sections 4 and 6, none renumbered.
- Record: merge-base README against head: 0 headings removed, 7 deleted lines each replaced by a superset; no Check, statement or declaration removed.
- Overlap check: read UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, DeformationAndDerivedPatchingAlgebra, ModularityAndLanglandsExtensionsPartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII; shared: the free case of 3.17 (1), owned by DeformationAndDerivedPatchingAlgebra §3.12a and cited here; nothing else.
- Automatic checks: all passed on this head; dependency check `depcheck: 129 roadmaps, 1440 edges, 0 problem(s)`; `Suggested.lean` (unchanged) elaborates with three `sorry` warnings only; elaborated signatures of the three theorems compared with 3.17 (1), 6.11 (1), 6.13 (2): no lost binder.
- Changes outside this folder: only the other roadmap folders and family indices this pull request owns. The description names the new §3.12a and the labels; it says nothing this folder contradicts.

Source independence: changed passages only; 8 passages compared with 8 sources (Teissier1973, SkinnerWiles1999, AllenNewtonThorne2020, Pan2022, NewtonThorne2023, Thorne2026, DottoThorne2026, SGA2), none shared; largest share [FormalProof], 28 file locators of about 70 (not readable); contents not compared (no layer added, removed or reordered).

Research link: Layer 6 states the commutative algebra of residually reducible modularity lifting: propagation along components (Skinner–Wiles 1999, Prop. 4.1; Allen–Newton–Thorne 2020, §5) and ultrafilter patching up to an element (Pan 2022, §4.5; Newton–Thorne 2023, Lemma 4.9; Thorne 2026). 4.9 is compared with the Wiles–Lenstra equality (Wiles 1995; Lenstra 1995). Based on the README and the sources read.

## Not verifiable

- [FormalProof] (public GitHub repository; host in no licence class): the eleven `*Method of the formal proof:*` labels were checked only against the README's own statements and routes.
- Fulton1984 and Serre1965 (paywalled, recorded as uncertified): the `*Origin:*` labels of 3.17 and 3.16.
- Bhattacharya 1957, De Concini–Strickland 1981, Pinkham 1974, Rim 1980 and Thorne 2015 (no text in the sources cache; not requested, since no required change rests on them): the `*Origin:*` labels of 3.16, 6.10, 6.12 and 6.14.

## Source issues

- none

## For the human reviewers

- Neither recorded decision applies to this folder: it removes, renumbers and moves no section.
- Not tested: [FormalProof], with the largest share of locators (28 file locators), could not be read (GitHub host in no licence class); every method label describes it.
- Scope: the main source is the unrefereed formalization announced 2026-11-20 ([Announcement]); the labels mark 4.9 and 6.11 "particular to this proof", stated by no refereed source.
- 3.17 (1)–(2), labelled published, stay in this family roadmap; the general roadmap DeformationAndDerivedPatchingAlgebra holds only the free case (§3.12a).
