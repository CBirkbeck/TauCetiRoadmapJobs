# Review of MixedHodgeModulesAndIrregularHodgeTheory (pull request #2279 at 55c249b)

**Verdict:** needs changes

Incremental re-review of the 58 lines changed since `f23e693` (README: 49 lines; `Suggested.lean`: 9 docstring lines). The folder's changed passages raise no finding; the pull request's description was not updated with them.

## R01 (P3) — The description still restricts Hodge modules to smooth quasi-projective varieties

**Location:** pull request description, summary block: "develops rational, graded-polarizable Hodge modules on smooth complex quasi-projective varieties"; first prose sentence: "polarizable and mixed Hodge modules on smooth complex quasi-projective varieties".

**Claim:** The head contradicts both sentences: this change extends `MHM(X)` and the derived operations to every variety and every algebraic map.

**Witness:** `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md` line 3: "on complex algebraic varieties"; line 42: "Mixed Hodge modules are defined on every variety `X`"; line 555 (5.1): "for varieties `X` and algebraic maps between them".

**Repair:** In both sentences replace "on smooth complex quasi-projective varieties" by "on complex algebraic varieties (pure Hodge modules on smooth ones; mixed Hodge modules on every variety, through local embeddings into smooth varieties)". In the Layer 2 clause of the prose write "exponential twists, Fourier–Laplace transformation and the formal stationary phase of a regular input (Layer 2)".

## Deferred findings

- D01 — stands

## Previous findings

- none: the previous report, of `f23e693`, raised no finding.

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result / change |
|---|---|---|---|---|
| 2.3 Check `δ_a ⋆ O = O` in degree zero (seeded sample) | Direct: translate of `O` by `a`; Fourier side | `s_+(δ_a ⊠ O)` = translate of `O` = `O` | `E^{at} ⊗^L δ_0 = δ_0`, `Tor₁ = 0` (`E^{at}` free of rank 1); `FT⁻¹ δ_0 = O` | Equal; consistent with the `O ⋆ O` Check (`Tor₁(δ_0, δ_0) ≠ 0`) |
| 2.4 formal stationary phase `FT N ≅ ⊕_c E^{ct} ⊗ R_c` at `∞` (seeded sample) | `N = δ_c`; `N = O`; `N = O(∗0)`; `N = D/D(τ∂_τ − α)` | `E^{ct}`, slope 1; `δ_0`, germ 0; rank-one germ, slope 0; `−t∂_t − 1 − α`, regular at `0` and `∞` | `c` alone, `R_c` rank 1; empty sum; `c = 0`, `R_0` rank 1; `c = 0`, `R_0` rank 1 | Agree; sign matches the Check `ℱ(δ_a) = E^{at}` |
| 2.4 route: Fuchs bound gives leading coefficient `∝ t^r` and regularity at `t = 0` | `P = Σ a_j(τ)∂_τ^j`, `deg a_j ≤ D − r + j`, `D = deg a_r`; `P = ∂_τ`; `P = τ∂_τ − α` | Order in `∂_t` is `D`, top coefficient `lc(a_r)(−t)^r`; a term `∂_t^k t^j` has `j ≥ k + r − D` | Fuchs at `0` needs `ord b_k ≥ r − D + k`; `−t` (transform `δ_0`, rank 0 on `G_m`); `−t∂_t − 1 − α` | Holds; normal ordering preserves `j − k` |
| 4.1 added Checks (three subspaces) | `ℂ³`: `A = ⟨e₁,e₂⟩`, `B = ⟨e₂,e₃⟩`, `C = ⟨e₁,e₃⟩`; `ℂ²`: `ℂe₁`, `ℂe₂`, `ℂ(e₁+e₂)` | `A ∩ (B + C)`: dimension 2; dimension 1 | `(A ∩ B) + (A ∩ C)`: `ℂe₂ + ℂe₁`, dimension 2; `0 + 0`, dimension 0 | Distributive; not distributive, as the Checks say |
| 4.3 clause for `g ≡ 0` on a strict support (seeded sample) | `M = pℚ_{A¹}`, `g = 0`; `M = δ_0 V`, `g = x` | `ψ_g M = 0`, `φ_{g,1} M = M`, `N_φ = 0`; point support, condition kept | Sai88 lines 3395–3403: condition only for `g⁻¹(0) ⊉ Z` or `dim Z = 0`; same values in the proof | Agrees with Lemma 5.1.8; "positive dimension" keeps the point case |
| 4.6 `MHM(X)` for arbitrary `X`; Conventions "Varieties" | Cusp `y² = x³ ⊂ A²`; nonreduced point `Spec ℂ[ε]`; smooth `X`, `V = X` | Objects of `MHM(A²)` supported on the cusp; `MHM(pt)` | Sai90 lines 3240–3251, 3279: `i_*` onto `MHM_X(Y)`, affine covers; reduction is a point; identity embedding returns the smooth definition | Consistent; API bullet on `i_*` agrees |
| 5.1 operations for arbitrary varieties and maps | `f` quasi-projective; `f` between non-quasi-projective varieties | Immersion then projective projection | Sai90 lines 3358–3370 (Theorem 4.3, p. 319): affine case derived functors, general case by compatible affine covers | Route covers both cases |
| 6.1 Check `j_* L[1] ∈ EMHS`, monodromy `−1` | `H⁰`, `H¹` of `G_m` in `L` | invariants `ker(−1 − 1) = 0`; coinvariants `0`; `χ = 0` | `RΓ(A¹, j_* L[1]) = 0`; constituents of `Π δ_a V` are `δ_a`-type or constant | In `EMHS`; simple, neither punctual nor constant |
| 6.3 Check `K ⊗^H K = K[1]` | `K = j_! ℚ_{G_m}[1]` | `K ⊠ K = (j × j)_! ℚ[2]`; `Δ^*` gives `j_! ℚ_{G_m}[2]` | `K[1]`, in perverse degree `−1`; `K ⊗_E K = K` | Different products, as stated |
| 7.4 Check, index `1/2` | `f = x²`; `M = j_{!*}(j_* L[1])` on `P¹` | `dim ω = dim H¹_dR(A¹, E^{x²}) = 1`; `F^λ_irr = ℂ` iff `λ ≤ 1/2` | 7.1: `F^λ_irr = im H¹(F^Del_{−λ})`, so image `ℂ` iff `a ≥ −1/2`; 8.4 and 10.3 Checks: jump `1/2` | Signs agree with 7.1, 8.4, 10.3, 10.9 |
| gap:regular-holonomic-stability, rewritten sentence | SpringerResolutionAndCharacteristicCycles §9.1 at its open head, lines 964–988 | README: composition, adjunction, proper duality "by §9.1 on holonomic complexes" | §9.1: composition, identity, adjunction and proper-duality comparisons on bounded coherent/holonomic domains | Supplied as cited |
| `Suggested.lean` docstring, 10.5 and 10.8 bullets | Grep of the pins for associated graded rings | Mathlib: `IsRingFiltration` only (`Mathlib/RingTheory/FilteredAlgebra/Basic.lean:75`); no `AssociatedGraded` | Tau Ceti: `AssociatedGraded` of a word filtration (`TauCeti/Algebra/WordFiltration/AssociatedGraded.lean:94`) | Claims hold; both headlines are README targets 10.5, 10.8 |
| 10.6 `twistedDeRham_concentration_finrank` (statement unchanged) | `φ = x`; `φ = x + x⁻¹`; `φ = x²` | `dim H¹ = 1`; `2`; `2` | `1!·vol[0,1] = 1`; `vol[−1,1] = 2`; `vol[0,2] = 2` | Elaborates; one `sorry` warning |

The rows for the statements this change does not touch stand as in the previous review, of `f23e693`.

- Source locators checked against the text: 11 — Sab10 lines 1780–1800 (Lemma A.3, pp. 40–41); KS lines 973–989 (§4.2, p. 27); Sai88 lines 739–757 (1.2.15, p. 870) and 3395–3403 (5.1.8, p. 957); Sai90 lines 97–98 (p. 223), 3240–3251 and 3279 (pp. 316–317), 3358–3370 (Theorem 4.3, p. 319); Kash84 §7 on pp. 355–359; MT appendix on pp. 35–40.
- Seeded sample: 2.3, 2.4, 4.3 and the Scope sentence on 1.2 and 1.3 fall in the change and were checked; the other sampled targets are untouched (the FSY locators of 2.4 were not reread).
- Cross-roadmap citations resolved at the open heads: FormalConnectionsOpers §F6.2 (`exists_cyclicVector`, characteristic zero, `∂ ≠ 0`); EtaleDualityAndPerverseSheaves §3.5 (`complexAnalyticComparison`) and §5.9; SpringerResolutionAndCharacteristicCycles §§9.1, 9.2; ComplexComparisonPartII §C5.6. Citation resolver: 0 unresolved.
- Dependencies: 2.4 now needs 2.3, and 2.3 needs 2.2 and 1.3 only; no cycle. `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at `55c249b`: every scanner 0, `OK`; 0 paths changed outside the folder. Elaboration of `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean`: one warning, `declaration uses sorry` at line 155; no declaration changed, so the 13 signatures and the padding probe stand.
- Checks per definition after the replacements: 2.3, 2.4, 6.1, 6.3 and 7.4 each keep three; 4.1 has five. No heading or number moved; "quasi-projective" remains only in Layer 8, 10.9 and one consumer line, where it is a hypothesis.
- Overlap check: read EtaleDualityAndPerverseSheaves (§§3.5, 5.9 and its supplier contracts) at its open head, the only close roadmap the change names; KloostermanMomentsAndPotentialAutomorphy, LefschetzPencilsAndVanishingCycles, KloostermanSheavesAndBesselIsocrystals and EtaleCohomologyFoundations stand as read in the previous review, the change moving no object of theirs; SheafConvolutionOnAbelianVarieties was not read. One shared object, `D^b_c(X^an, ℂ)` with its perverse heart: EtaleDualityAndPerverseSheaves §5.9 uses it without constructing it, owner this roadmap (1.2, 1.3), as the added Scope sentence says. No open pull request changes this folder; no cited id is dropped.
- Source independence: changed passages only — 6 passages compared with 4 sources (Sab10, KS, Sai88, Sai90), none shared; largest share FSY, as in the previous review; no layer added, removed or reordered, so the contents comparison with FSY stands.

## Not verifiable

- SZ Theorem 4.20 (cited in 5.6, untouched) is recorded uncertified; its text was not read.

## Source issues

- none

## For the human reviewers

- Licence: `packages/MixedHodgeModulesAndIrregularHodgeTheory/sources.toml` records Sai88, Sai90, Kash86 and AS with `licence_class = "answered-by:CBirkbeck"`; AS is hosted by Cambridge. Their legal status rests on the operator's answer.
- Licence: FSY cites for Theorem A.24 a work listed as "in preparation" (FSY line 3317); the roadmap does not cite it.
- Scope: nothing to flag; the main sources are refereed papers or the arXiv versions of refereed papers.
