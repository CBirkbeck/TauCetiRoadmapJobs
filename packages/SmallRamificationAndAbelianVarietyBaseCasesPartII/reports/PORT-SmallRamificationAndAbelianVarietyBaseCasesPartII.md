# PORT-SmallRamificationAndAbelianVarietyBaseCasesPartII

Branch `roadmap/small-ramification-and-abelian-variety-base-cases-part-ii`, created from main at `3b51055`; head commit `2e903b7b` (`SmallRamificationAndAbelianVarietyBaseCasesPartII: roadmap (README, Suggested.lean, metadata)`). The commit adds exactly `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCasesPartII/{README.md,Suggested.lean,metadata.toml}`; nothing outside the folder changed.

## Build

    ⚠ [8971/8971] Built TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCasesPartII.Suggested (6.2s)
    Build completed successfully (8971 jobs).

Exit 0; 2 warnings, both `declaration uses 'sorry'` (`Suggested.lean:64:8` `lowDegreeHodgeVanishing`, `Suggested.lean:78:8` `geometricK3_hasBadWittPrime`). No other diagnostic; the file carries the `module` / `public import` header and `@[expose] public section`, so Lake's module-system notice does not fire on it.

Signature probe (a scratch file importing the module and running `#check @name` on all four declarations) elaborated with no error. Elaborated types agree with the README: `hasWittGoodReductionAt` keeps `[Fact p.Prime]`; `lowDegreeHodgeVanishing` keeps `[Smooth f] [IsProper f]`, `hasEverywhereWittGoodReduction f`, `i ≠ j`, `i + j ≤ 3`; `geometricK3_hasBadWittPrime` keeps `[Smooth f] [IsProper f]` and the five K3 conditions on the pullback to `AlgebraicClosure ℚ`. Nothing changed in the Lean file.

## Gate

    gate SmallRamificationAndAbelianVarietyBaseCasesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency direction:

    depcheck: 231 roadmaps, 2187 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found nowhere.

## Draft pull request body

This roadmap extends SmallRamificationAndAbelianVarietyBaseCases from its discriminant estimates and finite-flat obstructions to Fontaine's theorem on proper smooth schemes over the integers. It develops, over every absolutely unramified complete discretely valued field with perfect residue field and every weight interval `0 < r < p − 1`, the truncated-period solution argument behind Fontaine's higher-weight ramification bound for killed-p crystalline subquotients (upper break at most `1 + r/(p − 1)`, different strictly below it); it then builds the finite global crystalline category at seven, its four simple objects, the oriented mod-seven splitting theorem and the exhaustive descending cyclotomic filtration of finite and rational seven-adic crystalline representations unramified outside seven; and it combines these with purity to prove that a smooth proper rational scheme with proper smooth models over `W(F̄_p)` at every prime, including two, has `H^j(X, Ω^i) = 0` for `i ≠ j`, `i + j ≤ 3`. The K3 application, that every geometric K3 surface over ℚ has a prime without such a model, is the obstruction EnriquesSurfacesAndIntegralNonexistence consumes. `Suggested.lean` states the two statable headlines, `lowDegreeHodgeVanishing` and `geometricK3_hasBadWittPrime`, on native schemes, Witt vectors, relative differentials, sheaf exterior powers and Zariski cohomology; the local ramification bound, the global filtrations and the zero-or-Tate description of low-degree étale cohomology are declared not statable at the pins (no Fontaine–Laffaille category, no torsion crystalline functor, no geometric rational étale cohomology with Galois action).

## Suppliers that are still pull requests

SmallRamificationAndAbelianVarietyBaseCases, FiniteFlatGroupsAndIntegralPadicHodgeTheory, ArithmeticGaloisRepresentations, PadicHodgeTheory, DeligneWeightsAndPurity, CrystallineCohomology, PadicPeriodRings, K3SurfacesAndSymplecticBoundedness. EnriquesSurfacesAndIntegralNonexistence (also a pull request) is cited only as a consumer. EtaleCohomologyFoundations, SchemeAndStackFoundations and EllipticCurves are on main; LocalFieldsRamification is under `Completed/`. All cited sections were resolved at the current heads (`roadmaps show`) or on main: SRAVBC §§1.1, 1.4, 1.7, 1.9 (rows (b) `rd < 6.93 ⇒ n ≤ 10`, (d) `rd < 19.02 ⇒ n ≤ 287`, (f) `rd ≤ 5.72 ⇒ n ≤ 8`, and `n ≥ 36 ⇒ rd > 12` in §1.7); FFG §§R07.3.4–R07.3.17, R07.6.2–R07.6.5; AGR §§1.1–1.3, 1.6, 1.9, 2.2; PHT §§0.1, 0.4, 3.2–3.5, 8.1; DWP §§0.8, 0.9, 7.15; CC §CR.3.5 (projective-space Hodge computation at its line "H^q(ℙⁿ_A, Ω^p) = 0 unless 0 ≤ p = q ≤ n"); PPR §0.3; K3 §§1.1–1.4, 2.4 and `IsK3` in its `Suggested.lean`; Enriques §§3.3, 3.11, 3.13; ECF §§F.2.1–F.2.2, F.3a, F.4.0–F.4.6; SSF §§0.9, 0.11, 0.12, 0.14, 2.6, 2.20, 4.8–4.10 with `exists_etale_lift`, `henselian_pair_permanence`, `henselian_finiteEtale_equivalence`; EllipticCurves Layer 4; LocalFieldsRamification Layers 2–3 (action formula `θ_i(στσ⁻¹) = θ_0(σ)^i · θ_i(τ)` in Layer 3).

Pinned declarations checked in this worktree's `.lake/packages`: `SheafOfModules.exteriorPower` (`TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean:60`), `Scheme.Modules.Cohomology` (`TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`), `cohomologyBaseModule` (`Cohomology/Module/Base.lean:45`), `Scheme.relativeDifferentials` (`Modules/Differentials/Basic.lean`), `Representation.invariants_ne_bot_of_isPGroup` (`PowerOrder.lean:158`), `TauCeti.Hodge.tate_piece` (`Hodge/Tate/Basic.lean:111`); Mathlib `NumberField.finrank_eq_one_of_unramified` (`ExistsRamified.lean:50`), `rootDiscr`/`rootDiscr_rat`, `Algebra.unramified_iff_forall` (`Unramified/Locus.lean:137`), `IsAdicComplete.henselianRing` (`Henselian.lean:170`), `StandardEtalePresentation` (`StandardEtale.lean:261`), `Ideal.sum_ramification_inertia_eq_finrank` (`RamificationInertia/Basic.lean:72`), `WittVector.isDiscreteValuationRing`, `isAdicCompleteIdealSpanP`, `p_nonzero`, `Representation.invariants`/`mem_invariants`, `IsProper`, `Smooth`, `SmoothOfRelativeDimension`, `GeometricallyIntegral`, and the `IsStableUnderBaseChange` instances for `IsProper` (`Proper.lean:71`) and `Smooth` (`Smooth.lean:112`).

## What moved from the Lean to the README

Nothing. The package file already satisfies the acceptance-test rule: two definitions with real bodies (`hasWittGoodReductionAt`, `hasEverywhereWittGoodReduction`) that make the two headlines statable, no API lemmas, no examples, no sorry'd data, no `set_option`. Both headlines, every API bullet and every Check were already in the README.

## Supplier replacements and citation repairs

- SchemeAndStackFoundations §0.11 is "Descent along field extensions, absolute integral closure, unramified morphisms"; the package cited it for base change of properness and smoothness and for "Witt-ring interfaces". Base change is now cited to Mathlib's `MorphismProperty.IsStableUnderBaseChange` instances for `IsProper` and `Smooth` (From Mathlib paragraph, §0.1 route and Needs, §3.3 Needs, Layer 0 Dependencies); §0.11 is kept for descent along field extensions and for global functions after a field extension.
- SchemeAndStackFoundations §3.3 (degrees of vector bundles, Riemann–Roch on curves) was listed for "constant global functions" and used nowhere: dropped from the contract.
- PadicHodgeTheory §5.5 is "General residue fields and the tensor torsor" (Tannakian torsors), not the unramified-completion detection of crystallinity, which is §3.5: dropped from the contract.
- The eight supplier contracts are rendered in main's form. Slug → contract name: `witt-proper-smooth-comparison` → the Witt proper smooth comparison contract (PadicHodgeTheory); `fl-acris-truncation` → the killed-p A_cris truncation contract; `fl-weight-zero-unramified` → the weight-zero unramified contract; `fl-rank-one-inertia` → the rank-one inertia character contract; `fl-oriented-mod-p-splitting` → the oriented mod-p splitting contract; `pm-remove-inverse-e` → the refined approximate-embedding contract (all five FiniteFlatGroupsAndIntegralPadicHodgeTheory); `finite-torsion-kernel-dictionary` → the finite torsion kernel-field contract (ArithmeticGaloisRepresentations); `completed-unramified-inertia` → the completed unramified inertia contract (LocalFieldsRamification). The review's `conditional_gaps` list uses the same eight slugs.
- Source line locators (`Fontaine93 lines 93–103, …`) were dropped throughout; theorem, section and printed-page locators are kept, and bare line-only citations were replaced by the section and page they point to (§1.4 route → §3.2, pp. 8–9; §4.3 → §2.1, p. 4; Worked examples → Lemma 2, p. 6 and §2.1, p. 4; the LMFDB citation names the entry's sections).
- Title case fixed ("part II — low-degree Hodge vanishing"); the review's two P3 repairs (row (b) with `7^(142/143) < 6.93` and `7^(35/36) < 6.93`; the three-clause kernel-field contract) were already in the accepted package and are kept.
- Process wording removed: "certified" row, "already owned discriminant certificate", "declared rows", "declared gap".

## Duplication sweep

`roadmaps grep` over main and the 446 open pull requests, by object: good reduction over `W(F̄_p)` / everywhere good reduction; `Frac W(F̄_p)`; `i + j ≤ 3`; low-degree Hodge vanishing; Fontaine's "Schémas propres et lisses sur Z"; the cyclotomic filtration and `C₇[0,3]`; the bound `1 + r/(p − 1)`; K3 or Enriques nonexistence over ℤ. Hits are the base roadmap (abelian varieties, finite-flat bound), FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.5 (the finite-flat ramification bound, which this roadmap imports and does not restate), EnriquesSurfacesAndIntegralNonexistence (which names the low-degree Hodge statement as a contract it needs, with Fontaine cited only as a reference), and references to Schröer's paper in unrelated roadmaps. No roadmap states the higher-weight killed-p crystalline bound, the seven-adic filtration or the Hodge vanishing; nothing was removed. This roadmap is the owner of all three. Ownership was checked against the pull requests in the index; no package on the board other than this one plans these objects (`board-packages-index.txt`).

## Adversarial pass

| Statement | Instances and values | Result, change |
| --- | --- | --- |
| §0.1 predicates | ℙⁿ: ℙⁿ over each `W(F̄_p)`, all n ≥ 0; empty X: empty model, both pullbacks empty, holds; `y² = x³ − x`: Δ = −16(4(−1)³) = 64, unit at 3, so a ℤ₃-model; at 2, v₂(Δ_min) = 6, j = 1728 integral, Kodaira III: potential good reduction, nontrivial inertia on T₃, no `W(F̄₂)`-model by base change | Pass; local, everywhere and potential differ as the Checks say |
| §0.2, §3.1 conventions | ℙ¹, q = 2: geometric Frobenius 2 on H², 1/2 on the dual; HT(χ) = +1 gives ℚ₇(−1) weight −1; `(C₇(i) ⊗ ℚ₇(−1))^G ≠ 0` only for i = 1 | Pass; agrees with DeligneWeightsAndPurity (q⁻¹ on ℚ_ℓ(1), weight −2) |
| §1.1 φᵢ well defined, sign | p = 3, r = 1, π² = −3: v₀(π) = 1/2 = r/(p−1), [π] ≠ 0; φ₁([π]) = [π³/(−3)] = [π]; with +3, −[π] ≠ [π] since v₀(2π) = 1/2 is not > 1/2 | Pass |
| §1.1 infinite dimension | values 1/n, n ≥ 3, all ≤ 1/3 < 1/2: classes independent over k | Pass; ambient object not finite length, as stated |
| §1.2 generation hypothesis | M = 𝔽₃, all φ = 0, E = ℚ₃(π): A(E) = 𝔽₃[π]/(π²), φ₀(a + bπ) = a; Hom = {0, π, −π} (3) versus x³ = 0 (1 solution); Σ Im φᵢ = 0 ≠ M excludes it | Pass; negative control kept |
| §1.2 column convention | weights (0,1), rows (1,1),(0,1), p = 3: x₁³ = x₁, x₂³ = −3(x₁ + x₂); θ³ + 3θ + 3 = 0 Eisenstein, v₀(θ) = 1/3, (1, θ) solves; transpose needs 1 = 1 + θ | Pass |
| §1.2 residue-field lift | λ̂ = (1+π)² = −2 + 2π: v₀(λ̂ − 1) = v₀(−3 + 2π) = 1/2, image 1 − π ≠ 1; x = 1 + π: x³ = −8 = λ̂x, φ₀([x]) = [−8] = 1 ≠ 1 + π | Pass |
| §1.3 precision | e = 2: n > 1·2/2 = 1, so n = 2; roots π, −π differ by 2π of value 1/2 | Pass |
| §1.5 iff | d = 0: #J = 1 = 3⁰ for all E, L = K; weight-one unit at p = 3: #J(ℚ₃) = 1 < 3, #J(ℚ₃(π)) = 3, any E ⊇ L still 3 | Pass |
| §1.6 threshold, obstruction | c = 3/2; m = 2 in, 3/2 out; x² + 3 mod 9 for x = 0..8: 3,4,7,3,1,1,3,7,4, never 0 | Pass |
| §1.7 strict different | p = 7, r = 3: bound 3/2, Serre 1/2; ℚ₃(ζ₃): G₀ = G, G₁ = 1, u = 1, ι = 1/2, v₀(𝔇) = 1/2 < 3/2 | Pass |
| §1.8 killed-p boundary | ℤ/9(1): ℚ₃(ζ₉), v₀(𝔇) = 2 − 1/2 = 3/2, equality: excluded | Pass |
| §2.1 simple characters | tame generator value 3: 3⁰..3⁴ = 1, 3, 2, 6, 4 mod 7; weight 4 excluded | Pass |
| §2.2 step on S₃, ℤ/25 | S₃ on ℚ³: step₀(0) = ℚ(1,1,1), dim 1, step₀(top) dim 3, ℚ(1,0,0) not stable; ℤ/25, χ = ρ = 6: 6³ = 216 ≡ 16, 6 − 16 = −10, kernel 5ℤ/25 of 5 elements though 1, 6, 11, 16 are distinct | Pass; field hypothesis needed and stated |
| §2.2 order | C₇⋊C₆: 3³ ≡ 6, ⟨e₁⟩ is a χ³-line, ρ(t)ρ(w)ρ(t)⁻¹ = ((1,6),(0,1)) = ρ(w)⁶; order 3,2,1,0 gives (1,1,1,2), order 0,1,2,3 gives (0,0,0,1) | Pass |
| §2.3 ramified transvection | (8⁶ − 1)/7 = 37449 ≡ 6 mod 7: order-seven inertia element; outside the category by the weight-zero contract | Pass |
| §2.4 Sylow and degrees | 42·6 = 252 ≤ 287 < 294: n″ ≤ 6, Sylow count 1; 7^(35/36) = 6.6317 < 6.93 so 6n″ ≤ 10, n″ = 1; tame: e | 7^f − 1, ef ≤ 287 gives e ≤ 143, 7^(142/143) = 6.9054 < 6.93; e = 194 would give 7^(193/194) = 6.9301 > 6.93, so the divisibility step is needed; 7^(3/2) = 18.52 < 19.02 | Pass |
| §2.5 exception | d(F/ℚ) = 7·5 + 6(a+1) = 41 + 6a, e = 42, f = 1: 7^(47/42) = 8.8248, 7^(53/42) = 11.6529 (< 12 against degree 42 ≥ 36), 7^(59/42) = 15.3873 (no contradiction); unramified relative case 7^(5/6) = 5.0611 < 5.72 against degree 42 > 8; b ≤ a from ψ(u) = 6u over the tame base, b ≡ a mod 6 from θ_b(στσ⁻¹) = θ₀(σ)^b θ_b(τ) | Pass; exception exactly (i,j) = (0,3) |
| §2.6, §2.7 | ℤ/49(1): g₁U has 49 elements; 𝔽₇(1) ⊕ 𝔽₇(2): 7·7; nonsplit χ³-by-trivial: dims (0,1,1,1,2), exhausted, not a direct sum | Pass |
| §2.8 | ℚ₇(1) ⊕ ℚ₇(2): V₃ = 0, V₂ = ℚ₇(2), V₁ = V, V₀ = V: (0,0,1,2,2) | Pass |
| §3.1 | dual grades at q = 2: 1, 1/2, 1/4, 1/8; m = 1 needs 2^(−1/2) = 0.7071, m = 3 needs 2^(−3/2) = 0.3536: none; m = 2: only i = 1, V₁ = V, V₂ = 0, scalar action | Pass |
| §3.2 headline | eight off-diagonal pairs with i + j ≤ 3; ℙ¹ h¹¹ = 1 excluded by i ≠ j; ℙ² h²² = 1 at degree 4 outside; empty X all groups trivial; conclusion `Subsingleton` | Pass; Lean generality equals README |
| §4.1–§4.2 headline | Ω² ≅ O and geometric integrality give H⁰(Ω²) ≅ H⁰(O) of dimension 1 over ℚ̄, hence over ℚ; (2,0) is off-diagonal of degree 2: contradiction, some prime (possibly 2) lacks a model; empty scheme fails `GeometricallyIntegral`; abelian surface has h¹(O) = 2; conditions equal `IsK3` at the K3 head | Pass |
| §4.3 | ℙ⁰: h⁰⁰ only; ℙ¹: h¹¹ = 1, h²⁰ = 0; ℙ²: h²² = 1, h¹² = h²¹ = 0; i > n: Ωⁱ = 0 | Pass |
| p = 2 | no integer r with 0 < r < 1: Layer 1 empty at 2, stated in Conventions and §1.7 | Pass |

## Unresolved

- Ownership was checked against the open pull requests through the `roadmaps grep` index (446 pull requests) and the board packages index; the brief gives file paths for only part of them, and the index tool covers the rest. No open pull request without an index entry was searched.
- EnriquesSurfacesAndIntegralNonexistence addresses its low-degree Hodge contract to PadicHodgeTheory ("In Part II §everywhere-good-reduction …"), while the content it describes is §3.3 and §4.2 of this roadmap. The README states that this roadmap supplies it; redirecting the consumer's contract is that roadmap's edit.
- Source misprints (reported by the review and reconfirmed in the extraction): Fontaine93 p. 4 and §3.6 say "Theorem 1" for Theorem 2; §3.7 takes e and the uniformizer for E where L is meant; Schroeer23 p. 16 calls `W(F₂^sep)` the maximal unramified extension of ℤ₂ rather than its completion. None affects a statement here.
- The eight supplier contracts are future library work and were checked for precision, not proved.


Pull request: #1835 (roadmap/small-ramification-and-abelian-variety-base-cases-part-ii at 2e903b7)
