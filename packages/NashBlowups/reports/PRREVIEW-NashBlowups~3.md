# Review of NashBlowups (pull request #2413 at dd3e0e3)

**Verdict:** needs changes

## R01 (P3) — The description says two suppliers are not on main; both are

**Location:** pull request description, paragraph "Dependencies": "Suppliers not yet on main, which merge first (the merge order below lists them with what they in turn need): AlgebraicModuliForArithmeticGeometry §§1.3 and 5.4 … and DerivedDeRhamCohomology §0.23 (`p`-bases of fields)."

**Claim:** Both roadmaps are on main, so nothing has to merge before this pull request, and the merge-order block the sentence points to lists no supplier. Only the description is wrong; the README's supplier contracts are correct.

**Witness:** main at `818115d` has `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md` (§1.3 line 609, §5.4 line 8674; commit `b4ffac68`) and `TauCetiRoadmap/DerivedDeRhamCohomology/README.md` (§0.23 line 450; commit `ea83ad87`). The description's merge-order block: "No open pull request must merge before this one".

**Repair:** Replace the first two sentences of the paragraph by: "Dependencies. Every supplier is on main: AlgebraicModuliForArithmeticGeometry §§1.3 and 5.4 (the Grassmannian of quotients of a quasi-coherent sheaf; normalisation and scheme-theoretic images); DerivedDeRhamCohomology §0.23 (`p`-bases of fields); SchemeAndStackFoundations §§0.7, 0.11, 0.17, 0.23, 0.30, 4.11 and 4.13; EnhancedDerivedSheaves §E1.6; ResolutionOfSingularitiesCharacteristicZero §2.15; DiophantineApproximationAndTranscendence §5.6. No pull request has to merge before this one." Keep the two sentences that follow (the scope-boundary citations; the Lean imports none of these roadmaps).

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Other side (computed, or source at locator) | Result | Change |
|---|---|---|---|---|---|
| §0.1 comparison map `c_f` | `t ↦ (t², t³)`; identity of `𝔸¹`; `Spec k → 𝔸¹` | `dx ↦ 2t dt`, `dy ↦ 3t² dt`; char 2: `0`, `t² dt`; `k·dx → 0` onto, not injective | zero map fails `c_id(dx) = dx`; stacksNormalization lines 2900–2913 give the characterising property | holds | none |
| §0.2 base change, closed immersions | `k → k(s)`, `X = Spec k`; `𝔽_p(t) → k(τ)`, `K = k[y]/(y^p − t)`; `ℤ → 𝔽₂`, `𝔸¹` | `c: 0 → k(s)ds` not iso, `b: 0 → 0` iso; `c(dy) = dτ + du`, `b(dy) = du`; `dT ↦ dT` | `Ω_{X'/k}` free on `dτ, du`, `Ω_{X'/k'}` free on `du`; stacksNormalization lines 2918, 2926, 2953 | holds | none |
| §0.5 smooth iff regular at closed points | cusp; `Spec 𝔽_p(t^{1/p})` over `𝔽_p(t)`; `Spec k[ε]/(ε²)` | embedding dimension `2 > 1`; regular with `Ω = K·dy ≠ 0`; closed point not regular | not smooth; not smooth, excluded by perfectness; not smooth (iff holds without reducedness); stacksVarieties line 2130 | holds | none |
| §0.7 `HasLocallyFreeQuotientOfDifferentials` | `∅`; `𝔸¹`, `d = 0, 1, 2`; `k[ε]/(ε²)`, `d = 1`; cusp over `𝔽₂`; `𝔸²`, `d = 1` | all `d`; yes, yes, no (fibre dimension `1`); iff char `2`; `dx ↦ 0, dy ↦ 1`; kernels `O dy ≠ O dx` | Lean body: `∃ E : FixedRank X d, ∃ q, Epi q`, empty scheme has every constant rank; nashModificationNotes2024 lines 170–171, 179–181 | holds | none |
| §1.2 Nash modification of a sheaf | `O ⊕ O/(x)` on `𝔸¹`, `r = 1`; ideal of `0` in `𝔸²`; `F` locally free | fibre of `Gr_1` over `0` is `ℙ¹`, closure of `σ(D(x))` is the section `[1 : 0]`, `N ≅ X`; `N = Bl_0`; `N ≅ X` | whole Grassmannian is the wrong model (`ℙ¹` fibre); nashModificationNotes2024 lines 216–225; gonzalezSprinberg1982 lines 85–90 | holds | none |
| §2.1 Nash blowup | cusp, char `0`; node; `Spec k`, `d = 0`; cusp char 2, `d = 2` | `[2t : 3t²] = [1 : 3t/2] → [1 : 0]`, `ν*Ω ≅ k[t] ⊕ k[t]/(t³)`; `[1:0]`, `[0:1]`, `X* = 𝔸¹ ⊔ 𝔸¹`; `X`; `∅` | relation `t³·(−3t, 2)` with `(−3t, 2)` primitive; duarteNunezBetancourt2020 line 127; castilloDuarteLeytonLiendo2026 lines 13–21 | holds | none |
| §2.4 universal property, *isIso_lift_iff* | `Bl_0 𝔸² → 𝔸²`; one line of `𝔸¹ ⊔ 𝔸¹`; normalisation of the cusp | lift `= π`, not iso, classifying map contracts `ℙ¹`; closed immersion, not iso, `π` not surjective; `t ↦ (t², t³, [1 : 3t/2])` closed immersion, iso | `q(y) = z` needs `π` onto; nashModificationNotes2024 lines 153–162 | holds | none |
| §2.5 triviality criterion (headline) | cusp in char `2`, `3`, `0`; `𝔸² ⊔ 𝔸¹`, `d = 2` | `dx ↦ 0, dy ↦ 1`; `dx ↦ 1, dy ↦ 0`; `b = (3t/2)a` has no unit solution in `k[[t², t³]]`; `X* = 𝔸² ≠ X` | `J_f = (x²)`, `(y)` principal, `(y, x²)` not invertible (§3.3): same three answers | holds | none |
| §2.6 locality, field base change | cusp over `ℚ`, `k' = ℚ(i)`; `x^p + y² + t` over `𝔽_p(t)`, `k' = k(t^{1/p})` | both sides `𝔸¹_{ℚ(i)}`; `J = (y)` so `C* = C`, `(C*)_{k'} = C_{k'}` | `C_{k'}: u^p + y² = 0`, `J = (y)`, `(C_{k'})* = C_{k'}`; nobile1975 lines 42–44, 147–148 | holds | none |
| §§3.2–3.3 blowup description (headline) | cusp; node; `x^p − y^q` char `p`; `n = 0`; `I = 0` | `J = (2y, 3x²)`: `(y, x²)`, `(x²)`, `(y)`; `(x, y)`; `(y^{q−1})`; `J = 0` | `df ∧ (dx_1 … dx_j^ … dx_n) = (−1)^{j−1} ∂_j f`; `Bl_0 X = ∅ ≠ Spec k` so `n ≥ 1` is needed; nobile1975 lines 105, 129–141 | holds | none |
| §4.2 Lie derivative, stable annihilators | `k[x]`, `∂ = d/dx` and `x·d/dx`; `k[x]/(x²)`, `∂x = x` | `L(x dx) = dx`, `L(dx) = 0`; `L(dx) = dx`; `L(x dx) = 2x dx = 0` in `Ω` | `μ ∘ (∂⊗1 + 1⊗∂) = ∂ ∘ μ`, so `J`, `J²` preserved; `∂(a)ω = L(aω) − aL(ω)`; stacksAlgebra line 15590; hamann2003 lines 61–64 | holds | none |
| §4.3 minimal primes over a stable ideal | `ℚ[x, y]`, `∂_x`, `(y²)`; `ℚ[x]`, `(x²)`; `𝔽_p[x]`, `(x^p)` | `(y)` stable; `(x²)` not stable (`2x`); `(x^p)` stable, `(x)` not (`∂x = 1`) | `x²∂y ∈ J ⇒ (x∂y)² ∈ J ⇒ ∂y ∈ (J : x) = P`; hamann2003 lines 56–64 | holds | none |
| §4.4 `smooth_iff_…_of_charZero` (Lean headline) | cusp, node over `ℚ`; cusp over `𝔽₂`; `ℚ[ε]/(ε²)`, `d = 0`; `𝔸² ⊔ 𝔸¹`, `d = 2`; `∅`; `Spec K`, `d = 0` | false ↔ false twice; quotient exists, singular; quotient exists, not smooth; smooth, no quotient; true ↔ true twice | excluded in turn by `CharZero`, `IsReduced`, `IsPureDimensional`; a `∂/∂X_i`-stable prime of `k[X]` is `0` in char 0, giving `trdeg κ(P) ≥ d` | holds | none |
| §4.5 Nobile's theorem (headline) | cusp, node over `ℚ`; cusp char `2` | singular and `ν` not iso; singular and `ν` iso | nobile1975 lines 60, 143–146; duarteNunezBetancourt2020 lines 136–141 | holds | none |
| §5.1 `p`-monomial operators | `d = 1`, `p = 2`; `p = 3`; `d = 0` | `φ_0 = id − x∂`, `φ_1 = ∂`; inverse rows `(1, −x, x²)`, `(0, 1, −2x)`, `(0, 0, 1)`, `φ_0(x²) = x² − 2x² + x² = 0`; `φ = id` | without `(α!)⁻¹` the diagonal entry at `α = 2` is `2`; duarteNunezBetancourt2020 lines 271–283 | holds | none |
| §5.3 freeness of `F_*R` | `k[t]_{(t)}`; cusp char `3`; `𝔽_p(t)[s]_{(s)}`; `d = 0` | basis `1, …, t^{p−1}`; `t³ ∉ R³·{1, t², t⁴}` (exponents `{0, 6, 9, …} + {0, 2, 4}` miss `3`); rank `p` against `p²`; `k^p = k` | `ρ_Q ∘ ψ_Q = id` on free modules of rank `p^d`; `bijective_of_depth` needs no finite source; duarteNunezBetancourt2020 lines 284–305 | holds | none |
| §5.4 `smooth_iff_…_of_isNormalScheme` (Lean headline) | cone `z² = xy`, char 2; `𝔽₂[ε]/(ε²)`, `d = 0`; `x^p + y² + t` over `𝔽_p(t)`; normal `X`, `d = 0` | no rank-2 quotient (`y ∉ (x)` in `k[y, z]/(z²)`), singular; quotient, not smooth; `dx ↦ 1`, not smooth; both true | excluded by `IsNormalScheme`, `PerfectField`; duarteNunezBetancourt2020 line 256; stacksAlgebra lines 17720–17726 | holds | none |
| §6.4 criteria for `ν̄` (headline) | cusp char `2`; smooth `X`; `x^p + y² + t` over `𝔽_p(t)` | `ν` iso, `ν̄ = (𝔸¹ → cusp)` not iso; both iso; `ν̄` iso, not smooth | `s = η ∘ ν̄⁻¹` satisfies `ν ∘ s = id` and contains `ν⁻¹(X_sm)`; stacksNormalization line 6636 | holds | none |
| §7.2 open subschemes propagate | `U = Z = W`; cusp char `2`, `m = 1`; `U = W_sm` | identity; `X^{(j)} ≅ X` for all `j`; iterates of `U` are `U` | `Y_{(j+1)m} ⊇ Y_{jm} ⊇ X` by induction; castilloDuarteLeytonLiendo2026 lines 58–67 state only the consequence | holds | none |
| §7.3 never-resolves principle (headline) | `m = 0`, cusp char `0`; cusp char `2`, `m = 1`; smooth `X` | hypothesis holds, `Y_1` smooth: fails, so `m ≥ 1`; no `X^{(i)}` smooth; hypothesis fails | `jm ≥ i` needs `m ≥ 1`; `Y_1 = 𝔸¹` contains no open cusp, so the normalised iteration is not covered | holds | none |
| R01, description "Dependencies" | AlgebraicModuliForArithmeticGeometry; DerivedDeRhamCohomology | "not yet on main, which merge first" | both folders on main at `818115d`; §§1.3, 5.4, 0.23 present with the cited content | fails | R01 |

- Previous review (same head): it had no findings; the passages it tracked still read as it quotes them (README lines 1031, 1060, 1670).
- Source locators: 86 checked against the cached texts in 10 sources (every locator of the 15 sampled targets and every other line locator of the README), all at the stated line with the stated theorem number and hypotheses.
- Library: 99 declarations cited under "From Mathlib" and "From Tau Ceti" located at the pins in the files the README names; `TauCeti.IsPureDimensional` (`TauCeti/Topology/PureDimension.lean:52`), `FixedRank` (`TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:71`), `LinearMap.bijective_of_depth` (`TauCeti/RingTheory/Depth/Bijectivity.lean:120`), `powRingHom_finite` (`TauCeti/Algebra/CharP/Frobenius/Finite.lean:62`) and `IsModification` (`TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53`) read in full.
- Cross-roadmap citations: 16 resolved on main at `818115d` (AlgebraicModuliForArithmeticGeometry §§1.3, 5.4; DerivedDeRhamCohomology §0.23; SchemeAndStackFoundations §§0.7, 0.11, 0.17, 0.23, 0.30, 4.11, 4.13; EnhancedDerivedSheaves §E1.6; ResolutionOfSingularitiesCharacteristicZero §§2.15, 7.8; DiophantineApproximationAndTranscendence §5.6; AdicSpacesPartIII §R3.6), each stating what the README takes from it; the seven SchemeAndStackFoundations headings are unchanged at its open revision.
- Gate rerun at this head: every check passes. Dependency check: `depcheck: 233 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `declaration uses sorry` warnings only. `#check @` of the 3 declarations agrees with README §§0.7, 4.4, 5.4; no binder lost. One-tactic probe (`rfl`, `simp` with the predicate unfolded, `infer_instance`, `Iff.rfl`, anonymous constructor) closes neither theorem. The headlines not stated all need `X*` and are named in the module docstring.
- Overlap check: read SchemeAndStackFoundations (main and its open revision), PurityOfBranchLocus, DirectSummandsAndBigCohenMacaulay, AbhyankarLemma; nothing shared. No other roadmap, open or on main, mentions Nash blowups, geometric normality of algebras, a Lie derivative on Kähler differentials outside fields, or derivation-stable primes.
- Source independence: 14 passages compared with 8 sources, none shared; largest share nashModificationNotes2024, 23 of 109 locators; contents compared with nashModificationNotes2024: independent (Layer 1 ↔ §3, Layer 2 ↔ §§1–2, Layers 4 and 5 ↔ §§2 and 5; Layers 0, 3, 6, 7 and its §§4, 6, 7 unmatched).

## Not verifiable

- hironaka1983: uncertified in the manifest; cited by locator only, for scope.
- spivakovsky1990: uncertified; cited by locator only, for scope.
- semple1954: uncertified; cited by locator only, for the history of the iteration.
- teissier1982: uncertified; cited by locator only, for a downstream consumer.
- ega1: uncertified; cited by locator only, for the Grassmannian convention.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p. 10: the source says the Nash modification of a normal variety is an isomorphism exactly when the variety is singular; it should be exactly when it is nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Theorem 6.2, printed p. 13: the source says the normalised n-th Nash modification is an isomorphism exactly when the variety "is an isomorphism"; it should be exactly when the variety is nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at §1.2, printed p. 3: the source takes the closure of the image of the tangent-space map in the Grassmannian alone; it should be the closure in the product of the variety with the Grassmannian; affects nothing.
- **Misprint** in hamann2003 at the proof of Lemma 0.1, printed p. 2: the source writes the radical J as the annihilator of an element x; it should be that the minimal prime P equals the colon ideal (J : x); affects the proof.
- **Misprint** in alperModuli at Exercise 0.3.21, printed p. 30: the source says the vanishing locus is represented by a closed subscheme of X; it should be a closed subscheme of the base S; affects nothing.
- **Misprint** in nobile1975 at Example 1, printed p. 300 (and Example 4, p. 305): the source cites Remark 1 for the Jacobian ideal as centre; it should cite Remark 2; affects nothing.
- **Gap** in nobile1975 at the proof of Theorem 2, printed p. 300: the source reduces to the complex numbers by descent without argument; it should state that the Nash blowup commutes with extension of the ground field and that smoothness descends; affects the proof.
- **Misprint** in duarteNunezBetancourt2020 at the proof of Theorem 3.10, printed p. 6: the source writes the row index of the inverse matrix as k in the last sum for the modified derivations; it should be t throughout; affects nothing.

## For the human reviewers

- **Licence.** Three cited texts are unpublished: nashModificationNotes2024 (arXiv:2404.09102v1, the source with the largest share of locators), hamann2003 (arXiv:math/0311006v1) and alperModuli (author's page, draft of 19 August 2024); README lines 1760, 1768, 1769.
