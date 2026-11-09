# Review of EnhancedDerivedSheaves (pull request #1630 at ae7b6e6)

**Verdict:** needs changes

This is an incremental re-review of the 31 README lines that changed since `b9d7526`. `Suggested.lean` did not change: `git diff b9d7526 HEAD --stat` lists only `README.md`. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` and `Suggested.lean:N` refer to the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`. A line `#PR file:N` gives the line in that pull request's file at its head, as printed by `roadmaps show`, with the tool's one-line header removed.

## R01 (P2) — E1.8.DMA.1 claims the tensor comparison for an arbitrary chosen equivalence

**Location:** `README:992`–`997`: "If `a_R` denotes the equivalence from `D(R)` to DQCoh(Spec R) obtained by composing the instance comparison of Section 0.1 … with a chosen equivalence of `Coherent.DQCoh.affineEquiv`, construct `a_R(K ⊗ᴸ_R L) ≅ a_R(K) ⊗ᴸ_(O_X) a_R(L)`". This wording is new in this round.

**Claim:** whichever equivalence `affineEquiv` supplies, the composite is monoidal.

**Witness:** `Coherent.DQCoh.affineEquiv` (SchemeAndStackFoundations `Suggested.lean:1534`) only asserts that an equivalence exists. Take R = k, a field. The equivalence `(shiftEquiv _ 1).trans F` sends `R ⊗ᴸ R` to `O_X[1]`, but `a(R) ⊗ᴸ a(R) = O_X[2]`: in degree −1 the cohomology is k on one side and 0 on the other.

The probe confirms that `(shiftEquiv (DerivedCategory (ModuleCat.{u} A)) (1 : ℤ)).trans F` elaborates as a second element of the same `Nonempty` type. The unit Check at `README:1010` also fails for this choice, since it gives `a_R(R[0]) = O_X[1]`.

**Repair:** pin `a_R` to the equivalence that SchemeAndStackFoundations §2.18 describes in prose. On main, its `README:3975`–`3976` says "`M ↦ M~` is an equivalence", and `README:4030`–`4031` says the Lean statement asserts only existence. At `README:994`–`995`, replace "with a chosen equivalence of `Coherent.DQCoh.affineEquiv`, construct" by:

> with an equivalence `F` of `Coherent.DQCoh.affineEquiv` together with a natural isomorphism between `DerivedCategory.Q` followed by `F` (read in `DerivedCategory (Spec R).Modules`) and the termwise associated-sheaf functor `(AlgebraicGeometry.tilde.functor R).mapHomologicalComplex (ComplexShape.up ℤ)` followed by `DerivedCategory.Q`, which is the equivalence `M ↦ M~` of SchemeAndStackFoundations §2.18, construct

`AlgebraicGeometry.tilde.functor R : ModuleCat R ⥤ (Spec R).Modules` is at `Mathlib/AlgebraicGeometry/Modules/Tilde.lean:233`, and its termwise extension to cochain complexes elaborates at the pin.

**Test on the refuting instance:** the shifted equivalence admits no such isomorphism. At `R[0]` it gives `O_X[1]` against `O_X[0]`, and their cohomology in degree −1 is k against 0. For the `M ↦ M~` equivalence with R = ℤ and K = L = 𝔽_p, both sides have cohomology 𝔽_p in degrees −1 and 0, which is the Check at `README:1012`–`1013`.

## R02 (P2) — Two open pull requests both claim to own `MonoidalCategory.IsInvertible`

**Location:** `README:3050`: "Section 0.3 is the single owner of invertible objects of a monoidal category, `MonoidalCategory.IsInvertible`". The definition is at `README:585` and `Suggested.lean:178`.

**Claim:** §0.3 is the only owner of the predicate, and EtaleCohomologyFoundations consumes it.

**Witness:** EtaleCohomologyFoundations at #1891 (`bdbf9b3`, unchanged since r16), `README:1830`–`1831`, says "(the predicate MonoidalCategory.IsInvertible, built here)". `roadmaps grep` finds the predicate only in these two open heads, and in neither roadmap on main.

**Repair** (unchanged from r17 R01): keep §0.3 as the owner. Add this sentence to this pull request's description: "#1891 merges after this pull request; before it merges, `README:1830`–`1831` there replaces 'built here' by 'EnhancedDerivedSheaves §0.3'." The folder needs no change.

## R03 (P3) — The description misstates what changes and gives no order against #1330

**Location:** the description: "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)."

**Claim:** only the README changes, and no order against other pull requests is needed.

**Witness:** `git diff --stat origin/main...HEAD` reports `Suggested.lean | 585 +++------`. `overlaps.md` lists #1330 (`856fe7a`, draft), which changes both files of this folder and conflicts with this head.

**Repair** (unchanged from r17 R02): in the description, replace the quoted sentence with: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it, and every name it drops that another roadmap cites is mapped to its pinned Tau Ceti declaration in Scope and ownership." Then state the order against #1330. For example: "This pull request supersedes #1330, which is closed rather than merged." Or, if #1330 is to land, say which of the two rebases onto the other.

## R04 (P3) — The new name table says E1.6 uses a declaration that E1.6 and the Tau Ceti contract never name

**Location:** `README:38`, "Each resolves to the pinned Tau Ceti declaration in the right column, which that section uses unchanged", and the row at `README:46`, which maps `frobeniusRootIdeal_root_mem` to `TauCeti.iterateFrobeniusEquiv_symm_mem_frobeniusRootIdeal`.

**Claim:** E1.6 uses that declaration.

**Witness:** `TauCeti.iterateFrobeniusEquiv_symm_mem_frobeniusRootIdeal` occurs only at `README:46`. The From Tau Ceti list for E1.6 (`README:169`) and the Frobenius-root paragraph (`README:831`) omit it. It exists at `TauCeti/RingTheory/Perfect/FrobeniusRootIdeal.lean:83`.

**Repair:**
- At `README:169`, insert `TauCeti.iterateFrobeniusEquiv_symm_mem_frobeniusRootIdeal` (every `p^n`-th root of f lies in `J_f`) after `TauCeti.frobeniusRootIdeal_eq_radical`.
- At `README:831`, after "the `p^n`-th roots `(iterateFrobeniusEquiv R p n).symm f`", add ", each of which lies in `J_f` (`TauCeti.iterateFrobeniusEquiv_symm_mem_frobeniusRootIdeal`)".

**Test:** PerfectoidQuotients at #1042 (`README:339`) cites `frobeniusRootIdeal_root_mem`. After the repair, that name resolves to a declaration that the E1.6 contract lists. The other six rows already resolve to listed declarations (`README:168`–`169`).

## Previous findings

- R01 — not repaired: #1891 `README:1830`–`1831` still reads "(the predicate MonoidalCategory.IsInvertible, built here)", and the description is unchanged. Carried as R02.
- R02 — not repaired: the description still says "README only; no Lean change, so no importer is affected" and does not mention #1330. Carried as R03.
- R03 — repaired: `README:459` puts §§1.2–1.5 under `moduleDerived` and §0.2 and §1.1.1 under any instance. `README:200`, `:574` and `:768`–`769` agree. The rewrite at `:992`–`995` introduced new R01.

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `ae7b6e6`, and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty, and `changes.md` lists no file outside the folder.
- I reran `gate … --base origin/main`. It exited 0, printed every counter as 0 and ended with `OK`. The worker's gate also reports `build=0 OK`.
- The dependency check (`gate --depcheck … --movable`, exit 0) printed:

```text
depcheck: 236 roadmaps, 2287 edges, 0 problem(s)
```

**Elaboration and signatures.**
- `lake env lean Suggested.lean` exits 0 with exactly 10 warnings, all `declaration uses sorry`, at lines 101, 121, 148, 184, 196, 207, 219, 248, 262 and 279. These are the same lines as r17.
- A scratch copy with `#check @` for the 11 sorried or instance declarations shows every binder of the README statements. The 6 "looks dropped" leads in `signatures.md` are false positives: the probe prints `[inst : Category.{u_2, u_1} A] [inst_1 : Abelian A] [IsGrothendieckAbelian.{u_3, u_2, u_1} A]` and `[inst : Category.{u_2, u_1} C] [inst_1 : MonoidalCategory C]`.
- The same probe restates #1701's `nonempty_derivedTensorHomAdj`, with its `[HasDerivedCategory.{w} (ModuleCat.{u} A)]` binder, and applies it with no instance argument. It elaborates, and so do `inferInstance = IsGrothendieckAbelian.hasDerivedCategory (ModuleCat.{u} A)` (by `rfl`) and `(X ⟶ Y : Type u)`. So `README:768`–`769` ("apply to `D(A)` … directly") is right.
- No padding probe was run, because no Lean statement changed.

**The new name table (`README:38`–`47`), resolved at the Tau Ceti pin.** Each right-column declaration exists, and its statement matches the dropped statement on main:
- `TauCeti.IsRegularRing.flat_frobenius` (`RingTheory/RegularLocalRing/Frobenius.lean:85`, under `ExpChar R p`). It generalizes main's `CharP` statement.
- `TauCeti.IsRegularRing.hasProjectiveDimensionLE` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean:239`).
- `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` (same file, `:336`).
- `TauCeti.isZero_Tor_succ_of_perfectRing` (`RingTheory/Perfect/Tor.lean:159`, with A, B and C all perfect).
- `TauCeti.frobeniusRootIdeal` (`RingTheory/Perfect/FrobeniusRootIdeal.lean:64`), with `frobeniusRootIdeal_eq_radical` (`:202`, `[Fact p.Prime]`) and `iterateFrobeniusEquiv_symm_mem_frobeniusRootIdeal` (`:83`).
- `TauCeti.IsReplete.epi_pi_map` (`CategoryTheory/Limits/Replete.lean:324`). It covers any countable index type, in a replete category with countable products where epimorphisms are stable under base change. Main's statement is the case of ℕ in `Sheaf J (Type u)`.

**Completeness of the table.** Main's `Suggested.lean` has 28 declaration names that this head drops. `roadmaps grep` finds outside citations only for the names in the table:
- CrystallineCohomology at #857, `README:7010` and `:7030`.
- DeformationAndDerivedPatchingAlgebra at #1034, `README:82`.
- PerfectoidQuotients at #1042, `README:283` and `:338`–`339`.
- SolidAnalyticRings at #1458, `README:69`.
- PurityOfBranchLocus on main, which states its own `isRegularLocalRing_of_projectiveDimension_residueField`.

The hits for `IsKFlat` are Tau Ceti's `CochainComplex.IsKFlat`, not this roadmap's dropped name. So the sentence at `README:38` ("Other roadmaps cite …") holds for every row.

**Instance claims of the changed passages, against DerivedModuleAlgebra at #1701 (`8dcba8a`).** The description names #1701 as merging first.
- In #1701's `Suggested.lean`, `hasLeftDerivedFunctor₂_tensor` (`:137`–`138`) and `nonempty_derivedTensorHomAdj` (`:321`–`322`) take `[HasDerivedCategory.{w} (ModuleCat.{u} _)]`.
- `moduleDerived` is at `:336`, after both and before Layer 3's completeness statements. The module docstring at `:106`–`108` says the same.
- #1701's `README:50` maps `DerivedDeRham.derivedTensor` to §0.2, and its `README:72` maps `DerivedDeRham.moduleDerivedHom` to `TauCeti.derivedHom` (§1.1.1). These match `README:31`, `:200`, `:459`, `:574`, `:763`–`769` and `:987`–`992`.
- `TauCeti.derivedHom` (`Algebra/Homology/DerivedCategory/DerivedHom.lean:69`) takes `[HasDerivedCategory.{t} C] [HasDerivedCategory.{w'} (ModuleCat.{v} R)]` as parameters (`:61`–`62`).
- SchemeAndStackFoundations on main: `DQCoh.affineEquiv` is `letI := HasDerivedCategory.standard (ModuleCat.{u} A); Nonempty (… ≌ DQCoh (Spec A))` (`Suggested.lean:1534`–`1536`). This matches `README:990` and is the source of R01.

**Seeded sample, where it falls in the changed passages.**
- §0.1 (`README:459`): Stacks Injectives Theorem 19.12.6, tag 079P, is at StacksInjectives line 883. Unchanged since r17.
- §0.3: the changed stalk bullet `README:574` carries no locator. The section's monoidal-localization locator, HA Proposition 4.1.7.4 on p. 486, is at HA line 18583 (page marker line 18567). It states the monoidal localization under the hypothesis that W is stable under tensoring with objects, which is the `IsMonoidal` hypothesis used at `README:570`.
- E1.8.DMA.1 (changed):
  - Stacks More on Algebra Definition 15.60.13, tag 064M, is at StacksMoreOnAlgebra line 6846 (p. 147).
  - Lemma 15.60.7 (064K) is at line 6741 (p. 145), Lemma 15.60.10 (06Y4) at line 6781 (p. 146), and Lemma 15.60.12 (064L) at line 6824 (p. 147). This matches "pp. 144–147".
- E1.F3.H1 (changed):
  - §15.75 (tag 0A5W) is at line 8707 (p. 189).
  - (75.0.1), tag 0A63, at line 8711 is exactly the adjunction at `README:766`.
  - (75.0.2), tag 0A64, at line 8720 is the cohomology formula.
  - Lemma 15.75.1, tag 0A65, at line 8723 is for any ring, with no boundedness hypothesis. This matches "No boundedness or perfectness of L".
- §§0.2 and 0.4 did not change. r16 verified them, and they were not re-read.

**Ownership and overlaps.**
- The table adds no object: every row is a Tau Ceti declaration, cited.
- #1187 conflicts only through the pin bump of `Suggested.lean`, which a rebase settles.
- #1330 is R03.
- No cited id is dropped (`overlaps.md`; the gate reports `dropped=0`).
- No id this README cites is defined only in an open revision other than #1701, and the description names #1701.

**Adversarial computations.** Rows J–U are new and were computed at this head.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| J | `frobenius_flat_of_isRegular` → `IsRegularRing.flat_frobenius` | `𝔽_p[t]`; `𝔽_p[ε]/(ε²)`; `p = 1` | free basis `1, t, …, t^{p−1}`, so flat; ε ↦ 0, not flat, and the ring is not regular (hypothesis fails); identity, flat | Pass |
| K | `isRegularRing_projectiveDimension_le` → `IsRegularRing.hasProjectiveDimensionLE` | ℤ with `n = 1`; a field with `n = 0` | `pd ℤ/p = 1 ≤ 1` via `[ℤ →p ℤ]`; every module projective | Pass |
| L | `…_of_projectiveDimension_residueField` → `IsRegularLocalRing.of_hasProjectiveDimensionLE` | `ℤ_(p)`; `k[ε]/(ε²)` | `pd 𝔽_p = 1`, regular; resolution `⋯ →ε B →ε B → k` never stops, so no n works and the ring is not regular | Pass |
| M | `perfectRing_tor_eq_zero` → `isZero_Tor_succ_of_perfectRing` | `A = 𝔽_p[t^{1/p^∞}]`, `B = C = A/J_t = 𝔽_p` | `Tor₁ = J_t/J_t² = 0`, since `t^{1/pⁿ} = (t^{1/pⁿ⁺¹})^p`; theorem gives 0 | Pass |
| N | Frobenius-root rows → `frobeniusRootIdeal`, `_eq_radical`, `iterateFrobeniusEquiv_symm_mem_…` | `f = 0`; `f = t` in `𝔽_p[t^{1/p^∞}]` | `J₀ = 0 = √0` (perfect rings are reduced); `t^{1/p} ∈ J_t = √(t)` and `t^{1/p} ∉ (t)` | Pass (contract gap: R04) |
| O | `IsReplete.countableProduct_epi` → `IsReplete.epi_pi_map` | Set with ℕ; empty index | product of surjections is surjective (choice); `1 ⟶ 1` is an iso | Pass |
| P | `README:459` instance sentence | #1701 `:138`, `:322`, `:336`; probe | §0.2 and §1.1.1 take any instance; §§1.2–1.5 under `moduleDerived`; `inferInstance = hasDerivedCategory` by `rfl`; Hom types in `Type u` | Pass |
| Q | `README:200` supplier row | same as P | same | Pass |
| R | `README:574` stalk bullet | `X = Spec k`, k separably closed, `Λ = ℤ/ℓ²`, `K = L = ℤ/ℓ` | stalk = global sections; periodic resolution `⋯ →ℓ ℤ/ℓ² →ℓ ℤ/ℓ²` gives ℤ/ℓ in every degree ≤ 0 on both sides | Pass |
| S | `README:763`–`769` adjunction under this instance | `A = ℤ`, `K = L = 𝔽_p`, `M = ℤ[2]` | `Hom(𝔽_p, RHom(𝔽_p, ℤ[2])) = Hom(𝔽_p, 𝔽_p[1]) = Ext¹(𝔽_p, 𝔽_p) = 𝔽_p`; `Hom(𝔽_p ⊕ 𝔽_p[1], ℤ[2]) = Ext² ⊕ Ext¹(𝔽_p, ℤ) = 0 ⊕ 𝔽_p` | Pass |
| T | `README:992`–`997` affine tensor comparison | R = k with `F∘[1]`; R = ℤ with `M ↦ M~` and `K = L = 𝔽_p` | `O_X[1]` against `O_X[2]`, `H⁻¹` = k against 0; `M ↦ M~`: both sides 𝔽_p in degrees −1 and 0 | R01 |
| U | Ownership of `MonoidalCategory.IsInvertible` | `README:3050`; #1891 `README:1830`–`1831` | "single owner" against "built here" | R02 |

The statements the diff leaves untouched carry forward:
- From r17's table: rows A (instance comparison), B (Check `README:470`), C (`isDerivedComplete_iff_derivedCompleteness`), D (non-finitely-generated ideal Check), E (`perfect_projectiveDimension_le` route), F (`README:552` into `moduleDerived`) and G (`DQCoh` membership).
- From r16's table, through r17: rows 1–16 and 18–22. These cover `hasKInjectiveResolutions`, `locallySmall_localization_quasiIso`, `hasDerivedCategory`, `smallEtaleTopology_W_isMonoidal`, the Koszul Check, `P(ℤ/2)` unbounded, the §0.1 cone Checks, the §0.3 tower and completion Checks, `isInvertible_iff_isUnit_toSkeleton`, the §0.4 exchange, `isRegular_of_frobenius_flat`, `perfect_projectiveDimension_le`, `perfect_torDimension_le_two_mul_dim`, `IsDerivedComplete`, `isAdicComplete_iff_derivedComplete_separated`, `derivedCompleteModules_weakSerre`, and the E5:descent, E1.3 and E0.4 Checks.

All of them passed there.

## Not verifiable

- Nothing was blocked. Every text the changed passages cite was read in the cache: Stacks Injectives (079P), Stacks More on Algebra (064K, 06Y4, 064L, 064M, 0A5W, 0A63–0A65) and HA (Proposition 4.1.7.4).
- I did not reopen the texts r16 listed as not opened (HTT, SAG, ECD and the others), because no changed passage cites them.

## Source issues

- none
