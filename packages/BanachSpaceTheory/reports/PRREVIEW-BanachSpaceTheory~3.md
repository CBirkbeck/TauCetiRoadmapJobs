# Review of BanachSpaceTheory (pull request #1121 at 5b74de2)

**Verdict:** needs changes

Incremental re-review of the 104 lines changed since 4781067 (the head the previous review read). The change is the merge of main into the branch: main's 𝕜-general B7 text (Banach–Mazur distance, local reflexivity, John's theorem and the projection theorems over `𝕜`, a Garling–Gordon projection target, the Pietsch and Garling–Gordon references) with this roadmap's backticked Lean names kept in it, plus main's generated `PROGRESS.md` and `STATUS.md`, and main's library pins (Mathlib `f6090c70`, Tau Ceti `358314d4`, which replace the `6b7abb3c` / `a91d3aaf` the previous review used). `Suggested.lean` is byte-for-byte unchanged since 4781067 and compiles at the new pins. Four new findings (R01–R04) and the five findings of the previous review, none repaired (R05–R09). Two are blocking: the gate's build failure and a README/Lean generality mismatch the merge created.

## R01 (P1) — The gate's targeted build fails on lake's module-system advisory

Location: `TauCetiRoadmap/BanachSpaceTheory/Suggested.lean` line 5, `import Mathlib`.

Claim: the acceptance build emits only `sorry` warnings.

Witness: the worker's gate at 5b74de2 reports `build=1 FAIL` with the single line that the file "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". `lake env lean` on the file gives the 24 `declaration uses sorry` warnings and nothing else (17 s), so Lean rejects nothing; the advisory comes from lake at the pins the merge brought in. Fourteen roadmaps on main already start with `module` / `public import Mathlib` (among them CoboundaryExpansion, merged on 2026-11-04).

Repair: replace lines 5–6 by

```lean
module

public import Mathlib
public import TauCeti.Analysis.Normed.Module.Complexification
```

A scratch copy with this header (and the R02/R03 changes below) elaborates with exactly 25 `sorry` warnings and no other diagnostic. Rerun the targeted gate after the edit. P1 follows the brief's classification of a failing build gate.

## R02 (P2) — The README states local reflexivity and Kadec–Snobar over `𝕜`; `Suggested.lean` states them over `ℝ`

Location: `README.md` lines 12–14 ("In B7 the Banach–Mazur distance, finite representability, local reflexivity, John's theorem and the projection theorems are over `𝕜`"), line 1273 ("Prove local reflexivity over `𝕜` (`local_reflexivity`)"), lines 1309–1311 ("the Kadec–Snobar projection theorem (`kadec_snobar`): every subspace of dimension at most `n` of a normed `𝕜`-space"); `Suggested.lean` line 292 (`variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]`), 304–314, 315–321.

Claim: the README's generality equals the Lean signature's.

Witness: the elaborated types are `@local_reflexivity : ∀ {E} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] (F : Submodule ℝ (StrongDual ℝ (StrongDual ℝ E))) …` and `@kadec_snobar : ∀ {E} [NormedAddCommGroup E] [NormedSpace ℝ E] (F : Submodule ℝ E) [FiniteDimensional ℝ F], ∃ P, …`; the docstring at line 315 says "of a real normed space". Before the merge the README's scope line said "The local geometry in B7 is over `ℝ`" and agreed with the file; the merge kept main's `𝕜` prose and this roadmap's names together. The complex statements are true (the routes are checked in the table below), so the file is the side to change.

Repair: in `section Local` take `variable {𝕜 : Type*} [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E]`, the four `local instance` lines over `𝕜`, `local_reflexivity` with `F : Submodule 𝕜 (StrongDual 𝕜 (StrongDual 𝕜 E))`, `G : Submodule 𝕜 (StrongDual 𝕜 E)`, `T : F →L[𝕜] E` and `NormedSpace.inclusionInDoubleDual 𝕜 E`; `kadec_snobar (F : Submodule 𝕜 E) [FiniteDimensional 𝕜 F] : ∃ P : E →L[𝕜] E, … ‖P‖ ≤ Real.sqrt (Module.finrank 𝕜 F)` with the docstring "of a normed `𝕜`-space"; and the two Dvoretzky theorems in their own section with `[NormedSpace ℝ E]` (the README keeps them real, lines 14 and 1321–1326). Tested: the scratch copy elaborates, and `#check @kadec_snobar` gives `∀ {𝕜 : Type u_3} [RCLike 𝕜] {E : Type u_4} [NormedAddCommGroup E] [NormedSpace 𝕜 E] (F : Submodule 𝕜 E) [FiniteDimensional 𝕜 ↥F], ∃ P, (↑P).range = F ∧ (∀ x ∈ F, P x = x) ∧ ‖P‖ ≤ √↑(Module.finrank 𝕜 ↥F)`, with `@local_reflexivity` over `𝕜` likewise and `@dvoretzky` still over `ℝ`.

## R03 (P3) — The Garling–Gordon projection theorem is statable at the pins and absent from `Suggested.lean`

Location: `README.md` lines 1311–1319 ("Prove the Garling–Gordon projection theorem, its dual: every closed subspace `M` of codimension at most `n` of a normed `𝕜`-space `X` is, for every `ε > 0`, the kernel of a projection of norm at most `√n + ε`"), with no Lean name; `Suggested.lean` lines 288–340 state Kadec–Snobar and not its dual.

Claim: every headline that is statable at the pins is stated.

Witness: every carrier exists at the pins: `Submodule 𝕜 E`, the normed quotient `E ⧸ M` under `[IsClosed (M : Set E)]` (`Submodule.Quotient.normedAddCommGroup`, `Mathlib/Analysis/Normed/Group/Quotient.lean:432`, and `Submodule.Quotient.normedSpace` at :465), `Module.finrank 𝕜 (E ⧸ M)`, `LinearMap.ker`. The statement

```lean
theorem garling_gordon (M : Submodule 𝕜 E) [IsClosed (M : Set E)]
    [FiniteDimensional 𝕜 (E ⧸ M)] (ε : ℝ) (hε : 0 < ε) :
    ∃ P : E →L[𝕜] E, (∀ x, P (P x) = P x) ∧ LinearMap.ker P.toLinearMap = M ∧
      ‖P‖ ≤ Real.sqrt (Module.finrank 𝕜 (E ⧸ M)) + ε
```

elaborates in the scratch copy. SNumbers (an open roadmap pull request) consumes exactly this form from B7 ("Garling–Gordon projection `P` with `ker P = M`, `‖P‖ ≤ √n + ε` (B7)", its README lines 108 and 324). It is the dual of the stated `kadec_snobar`, of the same depth and from the same source (Pietsch 1.7.17 next to 1.5.5).

Repair: add `garling_gordon` as above to the B7 section with a docstring, and write "(`garling_gordon`)" after "Prove the Garling–Gordon projection theorem" at line 1311. P3 rather than P2 because the summary's five depth milestones are the file's headlines and this is the companion of the stated Kadec–Snobar; its absence next to `kadec_snobar` is the gap.

## R04 (P3) — The `𝕜`-general John decomposition has no locator

Location: `README.md` lines 1302–1309 ("State and prove the same for the closed unit ball `K` of a norm on a finite-dimensional inner product space `E` over `𝕜` … contact points `u_i`, unit vectors with `Re ⟨x, u_i⟩ ≤ ‖x‖_K` … `∑ c_i(u_i⊗u_i)=I` and `∑ c_i=n`").

Claim: every theorem has a locator.

Witness: the only locator for John's theorem in the README is Ball, Lecture 3, Theorem 3.1 (line 1378–1379), stated for real symmetric convex bodies; Albiac–Kalton 13.1.5 (line 1369) is real as well; Pietsch 1.5.5 (line 1380) is cited for Kadec–Snobar. The complex contact-point decomposition is true (checked in the table) and standard, but the paragraph that states it names no source.

Repair: add at the claim a locator for the decomposition over `𝕜` (a source that states the complex case, or the real source together with the one-sentence remark that its variational proof applies verbatim to `𝕜`-linear automorphisms and `|det T|`), as the real statement has.

## R05 (P3) — The two-point family does not exclude cotype q<2 or type p>2 "with any constant" (carried: previous R01)

Location: `README.md` line 1188 ("no nonzero space has cotype q<2 or type p>2 (by the two-point family y,y)") and lines 1202–1204 ("excluding cotype q<2 with constant 1 and type p>2 with any constant"). Unchanged since 4781067.

Witness: for `(y,y)`, `R₂ = √2‖y‖` and `(Σ‖y_i‖^p)^(1/p) = 2^(1/p)‖y‖`; type p with constant C reads `√2 ≤ C·2^(1/p)`, which holds for every `C ≥ 2^(1/2−1/p)` (ℝ, y = 1, p = 4, C = 2: 1.414 ≤ 2.378). The family refutes only constants below `2^|1/2−1/p|`.

Repair: use the n-fold family `(y,…,y)`: `R₂ = √n‖y‖` against `n^(1/q)‖y‖` and `n^(1/p)‖y‖`, so `n^(1/q) ≤ C√n` fails for large n when q<2 and `√n ≤ C n^(1/p)` fails for large n when p>2, for every C; keep `(y,y)` only as the constant-1 witness.

## R06 (P3) — The docstring's reason for omitting the Dunford–Pettis criterion is wrong (carried: previous R02)

Location: `Suggested.lean` lines 27–28 ("B5's dual identification `C(K,𝕜)* ≃ M(K)` and the Dunford–Pettis criterion: the normed space of finite regular scalar Borel measures … is a target carrier"). Unchanged.

Witness: the criterion as the README states it (lines 1010–1018) is about `L¹(μ)` for a finite measure and needs no space of measures: `MeasureTheory.Lp 𝕜 1 μ`, `toWeakSpace`, `MeasurableSet` and set integrals are all at the pins, e.g. `theorem dunford_pettis (μ : Measure X) [IsFiniteMeasure μ] (S : Set (Lp 𝕜 1 μ)) : IsCompact (closure (toWeakSpace 𝕜 (Lp 𝕜 1 μ) '' S)) ↔ Bornology.IsBounded S ∧ ∀ ε : ℝ, 0 < ε → ∃ δ : ℝ, 0 < δ ∧ ∀ A, MeasurableSet A → μ A ≤ ENNReal.ofReal δ → ∀ f ∈ S, ∫ x in A, ‖f x‖ ∂μ ≤ ε`.

Repair: state the criterion with `sorry` in the B5 section, or delete it from the not-statable list and leave only `C(K,𝕜)* ≃ M(K)` there.

## R07 (P3) — Two consumer citations do not match the cited roadmaps (carried: previous R03)

Location: `README.md` lines 45–46 ("the index-theory roadmap (IndexTheory Layer 1) consume it" and "NoncommutativeIntegration §7.5 consumes them"). Unchanged.

Witness: IndexTheory at the head of its pull request has sections I1–I8 and no "Layer 1" (the worker's citation check confirms it again at this round's index); Hilbert dimension is its I1 item 6. NoncommutativeIntegration §7.5 at its head proves type and cotype of `Lp(M)` from its own definitions and lists "no type or cotype" among what its suppliers provide; it consumes nothing from B6.

Repair: write "IndexTheory I1" and replace "NoncommutativeIntegration §7.5 consumes them" by a true statement, for example that §7.5 states the type and cotype of `Lp(M)` with its own definitions and B6's notions are the library's.

## R08 (P3) — A target sentence is glued into a Check bullet (carried: previous R04)

Location: `README.md` lines 1204–1206: the third cotype Check continues "Construct the shared finite Gaussian model here, before its use in this argument and Grothendieck's inequality below; …". Unchanged.

Witness: the `*Needs:*` line of B6.Cotype2 and B7's "Reuse B6's finite Gaussian model" (line 1333) rely on this construction, which is not findable as a target inside a Check bullet.

Repair: end the bullet after the (corrected, R05) constant statement and make the Gaussian-model sentence its own paragraph before "Prove Gaussian weak-2 domination".

## R09 (P3) — README shape (carried: previous R05)

Location: the whole README: milestone headings `## B1.`–`## B7.`, no `## Exact supplier contracts`, `## How to read the build`, `### Examples` or `### Dependencies`; the older carriers (weak p-norm and `Π_p(E,F)`, M(K), the projective and injective norms, nuclear operators, Banach–Mazur distance, the finitely additive charges) have no `**Checks.**` list. Unchanged.

Repair: a revision converting the milestone form to layers with Examples and Dependencies, and three Checks per older carrier (for `Π_p`: `π₂(id_{ℓ₂ⁿ}) = √n`, `π_p(f ⊗ y) = ‖f‖‖y‖`, `π_p(T) ≥ ‖T‖` with equality for rank one). Not blocking.

## Previous findings

- R01 — not repaired: line 1188 "no nonzero space has cotype q<2 or type p>2 (by the two-point family y,y)"; lines 1203–1204 "excluding cotype q<2 with constant 1 and type p>2 with any constant". Now R05.
- R02 — not repaired: `Suggested.lean` lines 27–28 still list "the Dunford–Pettis criterion" among the not-statable headlines for want of M(K). Now R06.
- R03 — not repaired: lines 45–46 "the index-theory roadmap (IndexTheory Layer 1) consume it" and "NoncommutativeIntegration §7.5 consumes them". Now R07.
- R04 — not repaired: lines 1204–1206 "type p>2 with any constant. Construct the shared finite Gaussian model here, before its use in this argument and Grothendieck's inequality below". Now R08.
- R05 — not repaired: the milestone headings and the older carriers without Checks are as they were. Now R09.

## Verified sound

**Gate, build and dependencies.** Worker gate at 5b74de2: every counter 0 except `build=1` (R01); `stray-files=0` and `prnum=0` with `PROGRESS.md` and `STATUS.md` present, which exist on main in this folder as generated files. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/BanachSpaceTheory'` is empty: the files the change set lists outside the folder are main's own commits brought in by the merge, and the branch now carries main's `lake-manifest.json` and `lean-toolchain` (v4.35.0-rc3). The checkouts under `.lake/packages` are at the manifest's revisions (Mathlib `f6090c70`, Tau Ceti `358314d4`). `lake env lean` on `Suggested.lean`: 24 `sorry` warnings, nothing else. Dependency check: `depcheck: 209 roadmaps, 1732 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.

**The diff against main's B7.** The B7 section at this head differs from main's only by the three backticked names (`local_reflexivity`, `kadec_snobar`, `dvoretzky_finite`/`dvoretzky`), this pull request's trace-pairing paragraph after "finite representability of `E**` in `E`", and its quantitative Dvoretzky sentence; main's 𝕜-general John/Kadec–Snobar/Garling–Gordon text is taken verbatim, so the ownership and the contract SNumbers cites are main's. The references list drops nothing that a claim relies on: the Hewitt–Ross Theorem 12.18 and Bekka–de la Harpe–Valette Appendix C.5 locators of B5.LocalHaarDual stay inline at lines 1069–1072, Pisier's Definition 9.6 at 1182–1183 and the CBMS 60 locator at 1229.

**Signatures versus README.** The worker's 33 elaborated types were compared with the README sentences that name them. The two "looks dropped" leads (`exists_reflexive_not_hasApproximationProperty`, `exists_scalarPlusCompact`) are false positives as before: `E` and its instances are bound inside the existential. The only generality mismatch is R02; everything else agrees as in the previous report (`RCLike 𝕜` for B1–B6, completeness and σ-finiteness only where the README asks them). The repaired scratch copy was checked with `#check @local_reflexivity`, `#check @kadec_snobar`, `#check @garling_gordon`, `#check @dvoretzky`: the first three carry `{𝕜} [RCLike 𝕜] {E} [NormedAddCommGroup E] [NormedSpace 𝕜 E]`, the last keeps `[NormedSpace ℝ E] [CompleteSpace E]`.

**The sampled targets.** B5.LocalHaarDual (README lines 1061–1110) and B6.Cotype2 (lines 1176–1235) are untouched by the diff; their locators are unchanged and their rows of the previous report's table are carried below. The Hewitt–Ross text and Pisier's CBMS 60 remain unreadable here (Not verifiable).

**Adversarial pass.** New rows for every changed statement, with the values computed; the rows for untouched statements are carried from the review at 4781067 with their values recapped.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope lines 12–14 versus `Suggested.lean` B7 | `local_reflexivity`, `kadec_snobar`, `dvoretzky` | README: `𝕜`, `𝕜`, `ℝ`; Lean: `ℝ`, `ℝ`, `ℝ` | two mismatches | R02 |
| Banach–Mazur distance over `𝕜` | one-dimensional complex spaces; `ℓ²₂` versus `ℓ∞₂` over ℝ and ℂ; `d = 1` iff isometry | every norm on ℂ is `c·|·|`, so `d = 1`; `id` has `‖id‖ = 1`, `‖id⁻¹‖ = √2`, `d ≤ √2` for both scalars, and `d_ℝ ≤ d_ℂ` since ℂ-linear maps are ℝ-linear; in finite dimension the infimum is attained (compact unit ball of `L(E,F)`), so `d = 1` gives an isometry | consistent | none |
| local reflexivity over `𝕜` | `F = J(E₀)`, `E₀ ⊆ E` finite-dimensional; `G = 0` | `T = J⁻¹` on `F`: `‖Tx‖ = ‖x‖`, so `(1−ε)‖x‖ ≤ ‖Tx‖ ≤ (1+ε)‖x‖`; `f(Tx) = (Jx')(f)` for `x = Jx'`; `T(Jx) = x`; `J` is `𝕜`-linear and isometric over `RCLike 𝕜` | consistent over ℂ | R02 (Lean side) |
| `𝕜`-John decomposition (lines 1302–1309) | `E = ℂ`, `K` the disc; `E = ℓ∞₂(ℂ)`; the contact points lie on `∂K`; the trace | `u⊗u = id` for every unit `u` (`⟨u,x⟩u = ū·x·u = x`), `c₁ = 1 = n`; `ℓ∞₂(ℂ)`: `u = e₁, e₂`, `c = (1,1)`, `Σ c_i u_i⊗u_i = I`, `Σ c_i = 2 = n`, `Re⟨x,e_j⟩ = Re x_j ≤ ‖x‖_∞`; `Re⟨u_i,u_i⟩ = 1 ≤ ‖u_i‖_K ≤ |u_i| = 1` (from `B ⊆ K`), so `‖u_i‖_K = 1`; `tr(Σ c_i u_i⊗u_i) = Σ c_i = tr I = n` (complex trace) | consistent; `x ↦ ⟨u_i,x⟩u_i` is `𝕜`-linear in the conjugate-linear-first convention and `Re⟨x,u_i⟩ = Re⟨u_i,x⟩`, so no convention clash | R04 (locator only) |
| Kadec–Snobar over `𝕜` (lines 1309–1311) | route; `F = 0`; `F = 𝕜x`; "dimension at most n" versus `√(finrank F)` | `|⟨u_i,x⟩| ≤ ‖x‖` by rotating `x` by a unit scalar, Hahn–Banach extensions `f_i` with `‖f_i‖ ≤ 1`, `P = Σ c_i f_i(·) u_i`, `P = id` on `F`, `‖Py‖_E ≤ |Σ c_i f_i(y) u_i|₂ ≤ (Σ c_i |f_i(y)|²)^(1/2) ≤ √n‖y‖`; `F = 0`: `P = 0`, `0 ≤ 0`; `F = 𝕜x`: `P = f(·)x` with `f(x) = 1`, `‖f‖ = 1/‖x‖`, `‖P‖ = 1 ≤ 1`; `√m ≤ √n` for `m ≤ n` | consistent | R02 (Lean side) |
| Garling–Gordon (lines 1311–1319) | the construction; `n = 0`; `M = 0` in dimension `n`; whether `ε` can be dropped; `M` not closed | transposing `Σ c_i u_i⊗u_i = I` gives `ψ = Σ c_i ψ(u_i) w_i` for `ψ ∈ X/M`, so `π∘P = π`, hence `P² = P` and `ker P = M`; `‖w_i‖ ≤ 1` from `Re⟨x,u_i⟩ ≤ ‖x‖_K`; `‖Py‖ ≤ (1+ε') Σ c_i |ψ(u_i)| ≤ (1+ε')√n (Σ c_i |ψ(u_i)|²)^(1/2) = (1+ε')√n |ψ♯|₂ ≤ (1+ε')√n ‖ψ‖` (`B ⊆ K`), so `√n + ε` with `ε' = ε/√n`; `n = 0`: `P = 0`, `0 ≤ ε`; `M = 0`: `P = I`, `1 ≤ √n + ε`; `X = ℓ¹`, `M = ker f`, `f = (1−1/k)_k`: every projection with kernel `M` is `f(·)x/f(x)`, of norm `‖f‖‖x‖/|f(x)| > 1` since `f` attains no norm, while the infimum is `1`, so `≤ √1 + ε` holds and `ε` cannot be dropped; a non-closed `M` is excluded by hypothesis (a kernel of a continuous `P` is closed) | consistent and sharp in `ε` | R03 (state it) |
| `eberlein_smulian`, `james`, `milman_pettis`, `krein_smulian`, `bishop_phelps` | as in the review at 4781067 | zero space; `{e_n} ⊂ ℓ²` neither weakly compact nor sequentially compact; ℓ¹ with `f = (1−1/n)_n` non-attaining, `‖f‖ = 1`; `ℓᵖ` uniformly convex, ℓ¹ not (`‖(e₁+e₂)/2‖ = 1`); `c₀ ⊂ ℓ∞` with `e₁+…+e_n → 1` weak-star | consistent (carried) | none |
| `IsShrinking`, `IsBoundedlyComplete`, `reflexive_iff`, `HasApproximationProperty`, Enflo and Argyros–Haydon existence | carried | `c₀`: shrinking, not boundedly complete (`Σ_{i<n} e_i` bounded, divergent); ℓ¹: the reverse; ℓ²: both; `T = id` in finite dimension; `‖P_n x − x‖ → 0` uniformly on compacts | consistent (carried) | none |
| `exists_complexificationStrongDualEquiv` | carried | `φ(−y+ix) = i·φ(x+iy)` | consistent (carried) | none |
| the three Hilbert-dimension theorems | carried | empty basis ⇔ zero space; `#Fin 1 ≠ #Fin 2`; `ℵ₀ = ℵ₀` with the reindexing unitary | consistent (carried) | none |
| `exists_lpInftyDualEquiv`, `exists_lpDualEquiv`, `banach_stone` | carried | zero measure; counting measure `ℓ∞ = (ℓ¹)*`; `g = ‖φ‖|f|^(p−2)conj f` at a unit maximiser, `‖g‖_q = ‖φ‖`; two-point `K = L`, `T f = (f(2), −f(1))`, `|h| = 1` | consistent (carried) | none |
| `weakNorm`, `IsAbsolutelySumming`, `DualBall`, `pietsch_domination` | carried | `π₂(id_{ℓ₂ⁿ}) = √n`; no `MeasurableSpace (WeakDual _ _)` at the pin; uniform `ν` on `{±e_i}` gives `∫|⟨f,x⟩|² dν = ‖x‖²/n`, `C = √n` | consistent (carried) | none |
| `rademacherSecondMoment`, `HasType`, `HasCotype`, `cotype2_summing_bound`, Gaussian weak-2 domination, truncation absorption, the complex constant | carried | `n = 0, 1, 2`: `0`, `‖y‖²`, `‖y₁‖²+‖y₂‖²` in Hilbert space; `(y,y)`: `R₂ = √2‖y‖` (R05); `c₀`: `R₂ = 1` against `n^(1/q)`; `id_{ℓ₂ⁿ}`: `π₂ = √n = R₂(e)`, `K = 1`; `S = T∘B*` with `‖B‖ ≤ 1`; `G₂ ≤ tR₂ + G₂/2`; `π₂^ℂ ≤ π₂^ℝ ≤ 2Ct·2R₂` | consistent (carried) | R05 |
| `grothendieck_real` (8), `grothendieck_complex` (16) | carried | clipping at `M = 2`: `Γ ≤ 4/(1−√3/4) ≈ 7.05 ≤ 8`; real part of a rotated complex form bounded by `2·8` | consistent (carried) | none |
| `dvoretzky_finite`, `dvoretzky`, the Krawtchouk route, the constants | carried | `k = 0`: `T = 0`; `ε ≥ 1` trivial; `N = exp(10¹² k η⁻² log(3/η))`; `log⌊n/2⌋ ≥ (log n)/3` at `n = 4, 5`; `K_(n−1)(1) = C(2n,n−1)/n` (`5`, `14`) | consistent (carried) | none |
| B5.LocalHaarDual (sampled; untouched) | carried | uncountable discrete `G`: local = global = ℓ∞; `ℝ_d × ℝ`: `1_{ℝ_d×{0}}` locally null, global norm 1; σ-finite: local null = null; the pairing norm equals the local norm; `∫ f(y)g(x⁻¹y) = ∫ f(xz)g(z)` | consistent (carried) | none |
| B5 `D_S`, separability, regularity example; B4.1 parameters and the quantitative contradiction; B1 and B5 examples | carried | `n₂ = 2^32`, `n₃ = 2^1024 ≥ 2^288`; `δ/(4m) > ‖T‖‖z‖` since `192 < 256`; `‖e_m + m e_n‖ = √(1+m²)`; `‖tⁿ‖₁ = 1/(n+1)` | consistent (carried) | none |

**Library declarations opened at the new pins** (Mathlib `f6090c70`, Tau Ceti `358314d4`): `Submodule.Quotient.normedAddCommGroup` (`Mathlib/Analysis/Normed/Group/Quotient.lean:432`, hypothesis `[IsClosed (S : Set M)]`) and `Submodule.Quotient.normedSpace` (:465) for R03; `TauCeti.Analysis.Normed.Module.Complexification` exists (the file imports it and compiles). The worker's citation check at this round finds no library name of the README missing at the pins; its four Lean-name leads are this roadmap's own declarations, present in `Suggested.lean`. The declarations the previous report opened at the old pins were not reopened: every statement that uses them elaborates at the new pins unchanged.

**Padding.** `Suggested.lean` is unchanged since 4781067, where the one-tactic probe closed 0 of 24 admitted theorems; not rerun.

**Cross-roadmap citations and ownership.** Garling–Gordon and the `𝕜`-general John theorem: owned by this roadmap on main (main's README lines 434–457); SNumbers at the head of its pull request consumes "John's theorem with the contact-point decomposition over `𝕜`" and "Garling–Gordon projection theorem (kernel of codimension `≤ n`, `‖P‖ ≤ √n + ε`)" from B7 (its README lines 106–108, 324, 592, 654) and declares nothing of its own for them; CompactQuantumMetricSpaces cites John's ellipsoid theorem as a consumer. SNumbers is not among the sibling checkouts this brief lists; it was read through the roadmap index. The IndexTheory and NoncommutativeIntegration citations of lines 45–46 remain wrong (R07). No other citation changed.

## Not verifiable

- Pietsch, *Eigenvalues and s-Numbers*, 1.5.5 (Kadec–Snobar) and 1.7.17 (Garling–Gordon), the new locators of the References list: no legal copy (Cambridge University Press); recorded as `pietsch87` in `needs-references.toml`. The two statements are checked independently in the table.
- Garling–Gordon, Israel J. Math. 9 (1971), 346–361: Springer, paywalled; the sources service records the citation as uncertified. The `√n + ε` form is proved in the table from the complex John decomposition.
- Carried from the previous review, the texts unchanged: Hewitt–Ross Theorem 12.18, Pisier CBMS 60 §3, Enflo Acta Math. 130, Megginson, Albiac–Kalton, Ryan, Runde (cited by locator only).

## Source issues

- none
