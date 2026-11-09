# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 8c21a15)

**Verdict:** needs changes

This is an incremental re-review of the 10 lines that changed since 36a358a. All of them are in `README.md`, at `:62`, `:70`, `:1062`, `:1066` and `:1070`. `Suggested.lean` is unchanged, and `git diff 36a358a HEAD -- Suggested.lean` is empty.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

This is the previous review's R01, carried forward. No repair report marks it as not actionable. The repair belongs in PurityForFlatCohomology. Its head has moved from 96339c0e to ebfcd463, but that commit does not touch these sections.

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements".
- `README.md:1642`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** §§5.7, 6.11, 6.12, 7.1 and 7.3 have a single owner, and that owner is this roadmap.

**Witness:** PurityForFlatCohomology (#1840 at ebfcd463) still claims them:
- `README.md:200–201` and `:3313–3314` name this roadmap as the importer of its §§1.4–1.5.
- §1.4 (`:1081`) states local étale duality on excellent regular local rings, and §1.5 (`:1134`) states local Lefschetz.
- The *Needs* of §1.6 (`:1175`) cites §1.5.

**Repair** (in PurityForFlatCohomology; this folder needs no change):
- Delete §§1.4–1.5 and the importer bullets at `:200–201` and `:3313–3314`.
- Cite this roadmap's §§5.7, 6.11, 6.12 and 7.3 instead.
- At `:1175`, replace "§§0.2, 1.1, 1.5" by "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

**Test, rerun at ebfcd463:** I made the `:1175` edit on a scratch copy of that README.
- With `--movable`, the dependency check prints `moved: PurityForFlatCohomology moved in the merge order from #220 to #388, right after its last supplier EtaleDualityAndPerverseSheavesPartII`, then `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. A `moved:` line is not a defect.
- Without `--movable`, it prints `UPWARD: PurityForFlatCohomology (#220) -> EtaleDualityAndPerverseSheavesPartII (#388) at README lines [1175]`.

## R02 (P3) — §5.9 does not name the source of the embedding σ, the one unnamed input of the new chain

**Location:**
- `README.md:1066`: "Here and below a separable algebraic extension L/F is used through an F-embedding σ of L into the separable closure F^sep".
- `:62` says "The route of §5.9 also uses four Mathlib theorems". The Mathlib list in the *Needs* at `:1070` also omits this input.

**Claim:** the new sentence names a pinned declaration for every step from field to group except the first one, the existence of σ.

**Witness:**
- The lower bound needs σ for L = Frac(V), which is given only as a separable algebraic extension of K.
- Mathlib provides it: `IsSepClosed.lift` (`Mathlib/FieldTheory/IsSepClosed.lean:293`, variables at `:276` and `:289`) gives an embedding `L →ₐ[K] M` for `Algebra.IsSeparable K L` and a separably closed K-field M.
- `:62`, `:1066` and `:1070` do not name it.

**Repair:**
- At `:1066`, after "into the separable closure F^sep", add "(Mathlib `IsSepClosed.lift`, which needs L/F separable)".
- At `:62`, change "four Mathlib theorems" to "five Mathlib declarations" and describe `IsSepClosed.lift` in `Mathlib.FieldTheory.IsSepClosed`.
- At `:1070`, add `IsSepClosed.lift` to the Mathlib list.

**Test:** in a scratch file I set `σ := IsSepClosed.lift`.
- For `K L : Type u` with `[Algebra.IsSeparable K L]`, the chain `cohomologicalDimensionAt_congr (absoluteGaloisGroupRestrictEquiv L)`, then `(absoluteGaloisGroupEquivFixingSubgroup K L σ)`, then `(absoluteGaloisGroupRestrictEquiv K)`, closed by `cohomologicalDimensionAt_le_of_isClosed (InfiniteGalois.fixingSubgroup_isClosed _)`, elaborates with no error.
- The step is genuinely needed: for K = 𝔽_p(t) and L = K(t^(1/p)) no σ exists, which is why the sentence restricts to separable L/F.

## Previous findings

- R01 — not repaired: `README.md:23` and `:1642` are unchanged. PurityForFlatCohomology at ebfcd463 still states §1.4 (`:1081`) and §1.5 (`:1134`), names this roadmap their importer (`:200`, `:3313`), and cites §1.5 at `:1175`. Raised again as R01.
- R02 — repaired: `:1062` now reads "by Artin's theorem on fixed fields of finite groups (Mathlib `FixedPoints.finrank_eq_card`, applied to that cyclic group of order ℓ acting faithfully on κ̄)". `:62` and `:1070` list it. The broader naming repair introduced R02 of this report.

## Verified sound

**Gate, dependency check, build and signatures, run on this head:**
- The gate prints `set_option=0 blob=0 latex=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's `gate.md` also shows `build=0`.
- The required movable dependency check prints, in full: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder lists no paths.
- `lake env lean` on `Suggested.lean` exits 0 in 16 s. The only warnings are eight "declaration uses `sorry`", at lines 77, 100, 193, 237, 274, 294, 309 and 331.
- The file is unchanged, so the previous elaborated signatures, the one-tactic padding probe (all 8 theorems fail) and the headline audit still apply. `scratch/signatures.md` reports 0 dropped binders across 11 declarations.

**The nine newly cited pinned declarations, opened at the pins (`#check` output in a scratch file):**
- `FixedPoints.finrank_eq_card`, `Mathlib/FieldTheory/Fixed.lean:346`: `[Fintype G] [FaithfulSMul G F]` gives `finrank (FixedPoints.subfield G F) F = Fintype.card G`. This matches `:62`.
- `ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim`, `Mathlib/RingTheory/KrullDimension/Regular.lean:167`. It assumes `IsNoetherianRing`, `IsLocalRing`, `IsSMulRegular R x` and `x ∈ maximalIdeal R`.
  - `IsSMulRegular R x` is "x is a nonzerodivisor", as `:62` says. The variant `_of_mem_nonZeroDivisors` is at `:175`.
  - The domain A satisfies all the hypotheses: it is noetherian through `IsGRing` and local through `HenselianLocalRing`.
- `Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes`, `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:108`: for a noetherian ring, `I.IsPrincipal` and `p ∈ I.minimalPrimes` give `p.height ≤ 1`.
- `InfiniteGalois.fixingSubgroup_isClosed`, `Mathlib/FieldTheory/Galois/Infinite.lean:64`. It needs `[IsGalois k K]`, and the instance for `SeparableClosure K` resolved in the probe.
- `TauCeti.absoluteGaloisGroupRestrictEquiv`, `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:340`: `Field.absoluteGaloisGroup K ≃ₜ* AbsoluteGaloisGroup K`, where `AbsoluteGaloisGroup K` is `Gal(SeparableClosure K/K)` (`:327`).
- `TauCeti.fixingSubgroup_fixedField`, same file `:227`. It is in `section Normal` (`:80–82`) and takes `IsClosed H`.
- `TauCeti.absoluteGaloisGroupEquivFixingSubgroup`, `…/Extension.lean:188`: `AbsoluteGaloisGroup L ≃ₜ* σ.fieldRange.fixingSubgroup`. No finiteness is assumed, as `:70` says.
- `TauCeti.galoisSubgroup`, `…/FiniteExtension.lean:143`. It needs `[FiniteDimensional K L]` (`:136`).
- `TauCeti.cohomologicalDimensionAt_congr`, `…/CohomologicalDimension/ContinuousMulEquiv.lean:78`. It takes `G H : Type u` and works at any coefficient universe `v`.

**Composition probe:** the two route steps the new text describes elaborate in a scratch file in 10.7 s, at the coefficient universe of the closed- and open-subgroup lemmas:
- cd_ℓ(L) ≤ cd_ℓ(K) for `σ : L →ₐ[K] SeparableClosure K`;
- equality for finite L/K with cd_ℓ(K) ≠ ⊤, via `galoisSubgroupEquiv` and `cohomologicalDimensionAt_eq_of_isOpen_of_ne_top (galoisSubgroup K L σ).isOpen`.

**Mathematics of the changed lower-bound sentences (`:1066`):**
- Nonzero x ∈ 𝔪 exists because d ≥ 1.
- dim A/xA + 1 = d gives d − 1.
- The height of 𝔮 is ≥ 1 because (0) is the only height-zero prime of a domain and x ∈ 𝔮.
- The Artin step at `:1062` applies `finrank_eq_card` to `zpowers g ≤ Gal(κ̄/κ)`, which acts faithfully.

**Remark on untouched text (no change requested here):** §5.9's universe choice does not match the lemmas it cites.
- The closed-subgroup, open-subgroup and Sylow lemmas cited at `:70` are stated only at coefficient universe `.{u}`, the group's own: `ClosedSubgroup.lean:61–63,80`, `OpenSubgroup.lean:54–56,111` and `Sylow/CohomologicalDimension.lean:55–57,96`.
- The headline (`Suggested.lean:336`) and `:70` use `.{0}` with `A : Type u`.
- These are not definitionally equal at the pin. In a probe, `rfl` fails on `continuousCohomology.{0,u,0}` against `.{0,u,u}`, and no comparison lemma exists in Tau Ceti.
- For fields in `Type` the chain closes as written.

**Other remark on untouched text:** the `scratch/citations.md` leads at `:21` (PerfectoidQuotientsPartII) and at `:25` and `:120` (EtaleCohomologyFoundations Lean names) are on unchanged lines that earlier reviews passed.

**Sources, ownership, overlaps:**
- None of the 15 seeded targets lies in the changed lines; they were verified at their locators in earlier rounds.
- The changed lines add no locator. The README flags none as unverified.
- The declared gaps are unchanged.
- `scratch/overlaps.md` lists no other pull request changing this roadmap and no dropped or revision-only id.
- The change adds no target, so ownership is unchanged.

**Adversarial table.** Rows marked "prev. r14" are carried from the previous report: the statements they test are untouched. All other rows test changed text.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `FixedPoints.finrank_eq_card` in (ii) (`:1062`, `:62`) | ⟨conj⟩ on ℂ; ℤ/2 acting trivially on ℚ; ⟨g⟩, g of order ℓ in G_κ, on κ̄ | [ℂ:ℝ] = 2 = \|H\|; fixed field ℚ, finrank 1 ≠ 2 = \|G\|; a subgroup of Aut(κ̄) acts faithfully, so the lemma applies | holds; faithfulness needed and present |
| dimension step (`:1066`, `:62`) | k⟦x,y⟧, x; ℤ_p⟦T⟧, x = pT; k⟦x,y⟧/(xy), x; x = 1 | 1 + 1 = 2; components 𝔽_p⟦T⟧ and ℤ_p, so 1 + 1 = 2; zero divisor: 1 + 1 = 2 ≠ 1; ⊥ + 1 = ⊥ ≠ d, so the unit x = 1 is excluded by x ∈ 𝔪 | holds; regularity, hence "domain", needed |
| height one (`:1066`) | k⟦x,y⟧, (xy); ℤ_p⟦T⟧, (pT); non-principal (x,y) | minimal primes (x), (y): height 1; (p), (T): height 1, dim A/𝔮 = 1 = d − 1; height 2, outside the lemma | holds |
| closed, and open when finite (`:1066`) | L = ℚ(√2), ℚ(μ_ℓ^∞) inside ℚ̄ | index 2: closed and open; index ∞: closed but not open | `galoisSubgroup`'s finiteness needed |
| `fixingSubgroup_fixedField` (`:1066`) | Ẑ = Gal(𝔽̄_p/𝔽_p), H = ⟨Frob⟩ ≅ ℤ; H = ℤ_ℓ | fixed field 𝔽_p, fixing subgroup Ẑ ≠ ℤ; fixed field ⋃_(ℓ∤m) 𝔽_(p^m), fixing subgroup ℤ_ℓ (the Sylow use in (i)) | closedness needed and stated |
| `absoluteGaloisGroupRestrictEquiv` (`:70`) | ℚ; 𝔽_p(t) | separable closure = algebraic closure, identity; K̄ purely inseparable over K^sep, so restriction is bijective | holds |
| `absoluteGaloisGroupEquivFixingSubgroup` (`:70`, `:1066`) | ℚ(2^(1/3)), three σ; ℝ/ℚ; 𝔽_p(t^(1/p))/𝔽_p(t) | three conjugate subgroups of index 3; no σ (not algebraic); no σ (inseparable) | embedding is data; separability needed (R02) |
| route chain, universe (remark) | `K L : Type u` at `.{u}`; `Type` at `.{0}`; `.{0}` against `.{u}` for `G : Type u` | elaborates; elaborates; `rfl` fails | holds as written only at matching universe |
| §5.9 Artin–Schreier (`:1062`, prev. r14) | ℂ ⊃ ℝ; ℚ̄ ⊃ ℚ̄∩ℝ; 𝔽̄_p; 𝔽_p(t)^sep ⊃ its p-th powers | [ℂ:ℝ] = 2; index 2; no proper subfield of finite index; t^(1/p) ∉ C, so C is excluded | holds |
| §5.9 torsion consequence (prev. r14) | G_ℝ, G_ℚ, G_𝔽_p, G_ℚ(i), G_ℚ₃ | ℤ/2 with ℝ orderable; order 2 with ℚ ⊂ ℝ; Ẑ torsion-free with −1 = (p−1)·1²; −1 = i²; −1 = 1² + u² | holds |
| (ii) via NCEI §0.11 (prev. r14) | κ = ℂ(t₁, t₂, …), κ′ = κ(t₁^(1/ℓ)); G = ℤ/ℓ, U = 1 | cd = ∞ with no ℓ-torsion, so cd κ′ = ∞; 0 vs ∞ | §0.11 needed and correctly hypothesised |
| (i), infinite case (prev. r14) | ℝ((t)), ℓ = 2 | H^(n−1)(ℤ/2, ℤ/2) ≠ 0 for every n, so cd₂ = ∞ = ∞ + 1 | holds |
| (i), finite case (prev. r14) | 𝔽_q((t)), ℓ ∤ q | cd = 2 = 1 + 1 | consistent |
| Normalization step (prev. r14) | ℤ_p, P = ℤ_ℓ | cd_ℓ = 1 = cd_ℓ 𝔽_p | holds |
| `IsProP.…_subsingleton_cohomFp` (prev. r14) | ℤ_ℓ, n = 1; ℤ/ℓ; S₃ at ℓ = 3 | H² = 0; cd = ∞; H¹ = 0 but cd₃ = ∞ (not pro-3) | pro-ℓ hypothesis needed |
| `IsProPSylow.cohomologicalDimensionAt_eq` (prev. r14) | S₃ at ℓ = 3 and 2; Ẑ | ∞ = ∞; ∞ = ∞; 1 = 1 | holds |
| Artin–Schreier control Check (prev. r14) | 𝔽_p(t)^sep | index p; characteristic p, so not real closed | true and discriminating |
| `cohomologicalDimension_fractionRing_eq` (prev. r14) | ℤ_p, ℓ ≠ p; ℤ₃, ℓ = 2; d = 0 | 2 = 1 + 1; 2 = 1 + 1; c = 0 + c | holds |
| same, negative controls (prev. r14) | (ℝ[x,y]/(x²+y²))^h at ℓ = 2, 3; ℝ⟦t⟧ | 1 vs ⊤, excluded; 1 = 1 + 0; ∞ = 1 + ∞, excluded though true | hypothesis needed, not necessary |
| same, hypotheses used (prev. r14) | ℤ_(p), ℓ = 2; 𝔽_p⟦t⟧, ℓ = p | ∞ ≠ 2; ≤ 1 vs 2 | henselian and `IsUnit ℓ` needed |
| §5.9 Hensel step (prev. r14) | ℤ₃, ℓ = 2 | −2 = u², −1 = (1/u)² + (1/u)² | holds |
| §5.7 henselian bound (prev. r14) | Spec ℤ_p, U = Spec ℚ_p; ℝ⟦t⟧ | 2 ≤ 1 + 1; ∞ ≤ 1 + ∞ | holds |
| §6.11 with ℤ/n (prev. r14) | n = 6, 4, d = 1; d = 0 | ℤ/2 × ℤ/3; ℤ/4; K = Λ | holds |
| Codimension convention (prev. r14) | 𝔸²_k, V(y) ⇝ origin | 1 vs 2; identity 0 vs 2 | holds |
| §§0.1, 0.2, 0.4, 0.5, 0.7, 0.8 (prev. r14) | Spec k, 𝔸¹_k; ℤ[i]/ℤ at ℓ = 3, 2; 𝔽_p(t); k⟦t⟧ vs k; Spec ∏ 𝔽₂ | dim 0, ∞; 2 ∈ 3′, 2 ∉ 2′; t^(1/p) ∉ k^sep; gr¹ k vs 0; no finite subfamily | holds |
| §§2.1, 2.3, 2.4 (prev. r14) | ℙ¹_L; x³ + x² + 2x + t over 𝔽₃[t]_(t); Bl₀ 𝔸²_ℂ | L ⊂ L(t) algebraic; 𝔽₃ × 𝔽₉, not alt_2′; Rj_*Λ = 0 on E × E | holds |
| §§3.4, 4.1, 5.4, 6.6, 6.10, 7.1 (prev. r14) | π = id; ILO XIX 2.2; 𝔸¹_k → Spec k; trait, n = 5; ℤ/6; d = 1 | equivalence; stalk dimensions 2, 1; 1, 0; 4 automorphisms; −2, 0; H^i(η) = 0 for i > 1 | holds |
| §7.3 (prev. r14; R01) | k⟦x,y⟧, f = x, i = 0, 1, 2 | 0 → 0; 0 → 0; 0 → ℤ/ℓ(−1) | range sharp |
| Cohen–Gabber and partial algebraization headlines (prev. r14) | μ₂ on k⟦x⟧; S₃; cusp at p = 2, 3; W[π]/(π^ℓ − p)⟦x⟧; k⟦x,y⟧/(xy) | 2; 6; degrees 3, 2; ℓ; 0 = 1 − 1 | holds |
| `affineLefschetz_strictlyLocal`, `cohomologicalDimension_le_of_strictlyLocal` (prev. r14) | n = 0, 1; punctured k⟦x,y⟧; k⟦t⟧ | IsUnit 0 false; H³ = ℤ/ℓ(−2); H¹(η) ≠ 0 | each hypothesis used; sharp |

## Not verifiable

- **Ser65** is settled as uncertified and I did not read it. This round touched no statement that depends on it beyond what the previous report checked through SGA4 line 1233 and NoncommutativeAndEquivariantIwasawa §0.11.
- **Artin–Schreier (1927)** is SGA4's reference [7]. It is not in the manifest and I did not read it. The changed lines do not cite it anew.
- **Ownership against open pull requests** was checked for PurityForFlatCohomology in its checkout at ebfcd463. The change adds no new object, so I ran no new ownership search.

## Source issues

- none
