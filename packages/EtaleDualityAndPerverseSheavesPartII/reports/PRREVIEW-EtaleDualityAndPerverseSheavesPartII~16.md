# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at c8b9b83)

**Verdict:** needs changes

This is an incremental re-review of the 21 lines that changed since 8c21a15: `README.md:62`, `:70`, `:1056`, `:1066`, `:1070`, the new Check at `:1088`, and `Suggested.lean:326–327`, `:337–338`. The changed passages are correct. The one remaining finding is the carried two-owner finding, whose repair is in another roadmap.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

This is the previous review's R01, carried forward. No repair report marks it as not actionable. The repair belongs in PurityForFlatCohomology. Its head has moved from ebfcd463 to fb0e7fb7; that commit moves the line numbers but leaves the two sections and both importer bullets in place.

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements".
- `README.md:1644`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** §§5.7, 6.11, 6.12, 7.1 and 7.3 have a single owner, and that owner is this roadmap.

**Witness:** PurityForFlatCohomology (#1840 at fb0e7fb7) still claims them:
- `README.md:206–207` and `:3440–3441` name this roadmap as the importer of its §§1.4–1.5.
- §1.4 (`:1105`) states local étale duality on excellent regular local rings, and §1.5 (`:1158`) states local Lefschetz.
- The *Needs* of §1.6 (`:1199`) cites §1.5.

**Repair** (in PurityForFlatCohomology; this folder needs no change):
- Delete §§1.4–1.5 and the importer bullets at `:206–207` and `:3440–3441`.
- Cite this roadmap's §§5.7, 6.11, 6.12 and 7.3 instead.
- At `:1199`, replace "§§0.2, 1.1, 1.5" by "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

**Test, rerun at fb0e7fb7:** I made the `:1199` edit on a scratch copy of that README.
- With `--movable`, the dependency check prints `moved: PurityForFlatCohomology moved in the merge order from #220 to #388, right after its last supplier EtaleDualityAndPerverseSheavesPartII`, then `depcheck: 235 roadmaps, 2263 edges, 0 problem(s)`. A `moved:` line is not a defect.
- Without `--movable`, it prints `UPWARD: PurityForFlatCohomology (#220) -> EtaleDualityAndPerverseSheavesPartII (#388) at README lines [1199]`.

## Previous findings

- R01 — not repaired: `README.md:23` and `:1644` are unchanged. PurityForFlatCohomology at fb0e7fb7 still states §1.4 (`:1105`) and §1.5 (`:1158`), names this roadmap their importer (`:206`, `:3440`), and cites §1.5 at `:1199`. Raised again as R01.
- R02 — repaired: `:1066` now reads "into the separable closure F^sep (Mathlib `IsSepClosed.lift`, which needs L/F separable)". `:62` describes it and `:1070` lists it. The repair introduced no new problem.

## Verified sound

**Gate, dependency check, build and signatures, run on this head:**
- The gate prints `set_option=0 blob=0 latex=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's `gate.md` also shows `build=0`.
- The required movable dependency check prints, in full: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder lists no paths.
- `lake env lean` on `Suggested.lean` exits 0 in 9 s. The only warnings are eight "declaration uses `sorry`", at lines 77, 100, 193, 237, 274, 294, 309 and 332.
- `scratch/signatures.md` reports 0 dropped binders across 11 declarations. The only changed signature is `cohomologicalDimension_fractionRing_eq`, now at `TauCeti.cohomologicalDimensionAt.{u}` on both sides; it matches `README.md:1056`.
- One-tactic padding probe on the changed headline: `rfl`, `simp` and `infer_instance` all fail. The other seven theorems are untouched, and the previous report's probe stands.

**The universe repair (`:70`, `:1056`, `Suggested.lean:326–338`).** The previous report remarked that the headline used coefficient universe 0 while the cited lemmas are stated at the group's universe. This head moves the headline to `.{u}`.
- `CohomologicalDimension/Basic.lean:128–147`: for `G : Type u` the modules are `M : Type (max u v)`, and `v` is the first universe parameter. This is what `:70` says.
- The cited lemmas are at `.{u}`: `ClosedSubgroup.lean:80`, `OpenSubgroup.lean:111`, `Sylow/CohomologicalDimension.lean:95–96`, `ProP/CohomologicalDimension.lean:133–134`.
- `FractionRing A`, `IsLocalRing.ResidueField A` and their algebraic closures are in `Type u`, so both Galois groups are in `Type u`, as the docstring says.
- Probe: for `K L : Type u` with `[Algebra.IsSeparable K L]`, the chain `cohomologicalDimensionAt_congr (absoluteGaloisGroupRestrictEquiv L)`, `(absoluteGaloisGroupEquivFixingSubgroup K L IsSepClosed.lift)`, `(absoluteGaloisGroupRestrictEquiv K)`, closed by `cohomologicalDimensionAt_le_of_isClosed (InfiniteGalois.fixingSubgroup_isClosed _)`, elaborates at `.{u}` with no error.

**The six newly cited Mathlib declarations, opened at the pin (`#check` output in a scratch file):**
- `IsSepClosed.lift`, `Mathlib/FieldTheory/IsSepClosed.lean:293`: `[IsSepClosed M] [Algebra.IsSeparable K L]` gives `L →ₐ[K] M`.
- `separableClosure`, `Mathlib/FieldTheory/SeparableClosure.lean:83`, an `IntermediateField F E`; `separableClosure.isSeparable` at `:151`, with no hypothesis on E/F.
- `separableClosure.isPurelyInseparable`, `Mathlib/FieldTheory/PurelyInseparable/Basic.lean:481`. It needs `[Algebra.IsAlgebraic F E]`, as `:62` says; κ′/κ is finite.
- `instSubsingletonAlgHomOfIsPurelyInseparable`, same file `:407`: `[IsPurelyInseparable F E]`, `L` a reduced commutative F-algebra, gives `Subsingleton (E →ₐ[F] L)`.
- `IsAlgClosure.equiv`, `Mathlib/FieldTheory/IsAlgClosed/Basic.lean:421`.

**Mathematics of the purely inseparable step (`:1066`):**
- "An F-automorphism of Ω fixes E pointwise": a scratch `example` proves it from the subsingleton instance applied to `g ∘ (E → Ω)` and `E → Ω`. It elaborates.
- Continuity: a basic open subgroup for the F-topology is the fixer of a finite K/F; it equals the fixer of E(K), finite over E, which is open for the E-topology. A continuous bijective homomorphism from a compact group to a Hausdorff one is a homeomorphism.
- `AlgebraicClosure E` is algebraic over F because E/F is, so `IsAlgClosure.equiv` applies.
- The index is [κ_s : κ] because κ_s/κ is finite separable and `galoisSubgroup` has index equal to the degree.

**The new Check (`:1088`):**
- 𝔽_p(t)(t^(1/p)): the minimal polynomial x^p − t = (x − t^(1/p))^p is inseparable, so κ_s = κ, the index is 1 and not p. No embedding into the separable closure exists. Correct, and it separates the separable degree from the degree.
- 𝔽₃(t)(t^(1/6)): (t^(1/6))³ = t^(1/2) is a root of x² − t, separable in characteristic 3, and t^(1/6) is a root of x³ − t^(1/2), purely inseparable. So κ_s = κ(t^(1/2)), index 2, and 6 = 2 · 3. Correct.

**Sources, ownership, overlaps:**
- None of the 15 seeded targets lies in the changed lines; they were verified at their locators in earlier rounds. The changed lines add no source locator. The README flags none as unverified.
- The declared gaps are unchanged.
- `scratch/overlaps.md` lists no other pull request changing this roadmap and no dropped or revision-only id.
- The change adds no target and no new object, so ownership is unchanged apart from R01.

**Remark on untouched text (no change requested):** the `scratch/citations.md` leads at `:21` (PerfectoidQuotientsPartII) and at `:25` and `:120` (EtaleCohomologyFoundations Lean names) are on unchanged lines that earlier reviews passed.

**Adversarial table.** Rows marked "prev. r15" are carried from the previous report: the statements they test are untouched. All other rows test changed text.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `cohomologicalDimension_fractionRing_eq` at `.{u}` (`Suggested.lean:332`) | ℤ_p, ℓ ≠ p; ℤ₃, ℓ = 2; d = 0 (A a field); `A : Type u`, u ≠ 0 | 2 = 1 + 1; 2 = 1 + 1; c = 0 + c; both sides and every cited lemma at `.{u}`, chain elaborates | holds; universe now matches the route |
| Purely inseparable E/F, same Galois group (`:1066`) | 𝔽_p(t^(1/p))/𝔽_p(t); E = F; ℂ/ℝ (not purely inseparable) | t^(1/p) is the unique p-th root of t, fixed by every g; trivial; conjugation moves i, so the hypothesis is needed | holds |
| Index [κ_s : κ] in (ii) (`:1066`, `:1088`) | 𝔽_p(t^(1/p)); 𝔽₃(t^(1/6)); ℚ(√2)/ℚ | 1, not p; 2, not 6; 2 = 2 | holds; separable degree, not degree |
| `separableClosure.isPurelyInseparable` (`:62`) | κ′/κ finite; ℚ(x)/ℚ | algebraic, applies; separable closure ℚ, ℚ(x)/ℚ not algebraic, so the hypothesis is needed | hypothesis stated |
| `instSubsingletonAlgHomOfIsPurelyInseparable` (`:62`) | L = Ω a field; L = E[ε]/(ε²), E = 𝔽_p(t^(1/p)) | one map; two maps (t^(1/p) ↦ t^(1/p) + ε also works, p-th power still t), so "reduced" is needed | hypothesis stated |
| `IsSepClosed.lift` (`:1066`, R02 of r15) | ℚ(2^(1/3)); 𝔽_p(t^(1/p))/𝔽_p(t) | embeddings exist (three); none, inseparable | separability needed and stated |
| `FixedPoints.finrank_eq_card` in (ii) (prev. r15) | ⟨conj⟩ on ℂ; ℤ/2 trivially on ℚ | 2 = 2; 1 ≠ 2 | faithfulness needed and present |
| dimension step (prev. r15) | k⟦x,y⟧, x; k⟦x,y⟧/(xy), x | 1 + 1 = 2; 1 + 1 = 2 ≠ 1 | regularity needed |
| height one (prev. r15) | k⟦x,y⟧, (xy); (x,y) | height 1; height 2, outside the lemma | holds |
| closed, and open when finite (prev. r15) | ℚ(√2); ℚ(μ_ℓ^∞) | index 2, open; closed, not open | finiteness needed |
| `fixingSubgroup_fixedField` (prev. r15) | Ẑ, H = ⟨Frob⟩; H = ℤ_ℓ | fixing subgroup Ẑ ≠ ℤ; ℤ_ℓ | closedness needed and stated |
| `absoluteGaloisGroupEquivFixingSubgroup` (prev. r15) | ℚ(2^(1/3)); ℝ/ℚ | three conjugate subgroups of index 3; no σ | embedding is data |
| §5.9 Artin–Schreier (prev. r15) | ℂ ⊃ ℝ; 𝔽̄_p | [ℂ:ℝ] = 2; no proper subfield of finite index | holds |
| (ii) via NCEI §0.11 (prev. r15) | κ = ℂ(t₁, t₂, …), κ′ = κ(t₁^(1/ℓ)) | cd = ∞ with no ℓ-torsion, so cd κ′ = ∞ | holds |
| (i), infinite and finite cases (prev. r15) | ℝ((t)), ℓ = 2; 𝔽_q((t)), ℓ ∤ q | ∞ = ∞ + 1; 2 = 1 + 1 | holds |
| `IsProP.…_subsingleton_cohomFp` (prev. r15) | ℤ_ℓ, n = 1; S₃ at ℓ = 3 | H² = 0; H¹ = 0 but cd₃ = ∞ | pro-ℓ needed |
| fraction-field formula, negative controls (prev. r15) | (ℝ[x,y]/(x²+y²))^h at ℓ = 2; ℤ_(p), ℓ = 2; 𝔽_p⟦t⟧, ℓ = p | 1 vs ⊤; ∞ ≠ 2; ≤ 1 vs 2 | each hypothesis needed |
| §5.7 henselian bound (prev. r15) | Spec ℤ_p, U = Spec ℚ_p | 2 ≤ 1 + 1 | holds |
| §6.11 with ℤ/n (prev. r15) | n = 6, 4, d = 1 | ℤ/2 × ℤ/3; ℤ/4 | holds |
| §§0.1–0.8, 2.1–2.4, 3.4, 4.1, 5.4, 6.6, 6.10, 7.1 (prev. r15) | as listed there | as computed there | holds |
| §7.3 (prev. r15; R01) | k⟦x,y⟧, f = x, i = 0, 1, 2 | 0 → 0; 0 → 0; 0 → ℤ/ℓ(−1) | range sharp |
| Cohen–Gabber and partial algebraization headlines (prev. r15) | μ₂ on k⟦x⟧; cusp at p = 2, 3; k⟦x,y⟧/(xy) | 2; degrees 3, 2; 0 = 1 − 1 | holds |
| `affineLefschetz_strictlyLocal`, `cohomologicalDimension_le_of_strictlyLocal` (prev. r15) | n = 0, 1; punctured k⟦x,y⟧; k⟦t⟧ | IsUnit 0 false; H³ = ℤ/ℓ(−2); H¹(η) ≠ 0 | each hypothesis used; sharp |

## Not verifiable

- **Ser65** is settled as uncertified and I did not read it. This round touched no statement that depends on it beyond what earlier reports checked through SGA4 line 1233 and NoncommutativeAndEquivariantIwasawa §0.11.
- **Ownership against open pull requests** was checked for PurityForFlatCohomology in its checkout at fb0e7fb7. The change adds no new object, so I ran no new ownership search.

## Source issues

- none
