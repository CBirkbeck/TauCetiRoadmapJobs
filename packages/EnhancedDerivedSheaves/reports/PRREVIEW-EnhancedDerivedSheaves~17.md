# Review of EnhancedDerivedSheaves (pull request #1630 at b9d7526)

**Verdict:** needs changes

This is an incremental re-review of the 41 lines that changed since `9158199`. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` and `Suggested.lean:N` refer to the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`. A line `#PR file:N` gives the line in that pull request's file at its head, as printed by `roadmaps show`, with the tool's one-line header removed.

## R01 (P2) — Two open pull requests both claim to own `MonoidalCategory.IsInvertible`

Location: `README:3035`, "Section 0.3 is the single owner of invertible objects". The definition is at `README:574` and `Suggested.lean:178`.

Claim: §0.3 is the only owner of the predicate, and EtaleCohomologyFoundations consumes it.

Witness: EtaleCohomologyFoundations at #1891 (`bdbf9b3`, unchanged since r16), `README:1830`–`1831`: "(the predicate MonoidalCategory.IsInvertible, built here)". On main, neither roadmap mentions the predicate, so both open heads introduce it.

Repair (unchanged from r16 R01): keep §0.3 as the owner. Add this sentence to this pull request's description: "#1891 merges after this pull request; before it merges, `README:1830`–`1831` there replaces 'built here' by 'EnhancedDerivedSheaves §0.3'." The folder needs no change.

## R02 (P3) — The description is wrong about what changes and says nothing about #1330

Location: the description, "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)."

Claim: only the README changes, and no order against other pull requests is needed.

Witness: `git diff --stat origin/main...HEAD` reports `Suggested.lean | 585 +++------`, and this round changes `Suggested.lean:244`–`250` again. #1330 (`856fe7a`, draft) changes both files of this folder and conflicts with this head (`overlaps.md`).

Repair (unchanged from r16 R02): in the description, replace the quoted sentence with: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it, and no roadmap cites a declaration it drops." Then add: "This pull request supersedes #1330, which is closed rather than merged."

## R03 (P3) — The new instance sentences say DerivedModuleAlgebra's §0.2 and §1.1.1 use `moduleDerived`, but its revision #1701 states them for any instance

Location:
- `README:448`: "so the objects of DerivedModuleAlgebra §§0.2, 1.1.1 and 1.2–1.5 … lie in a different category from the derived category here".
- The same claim appears at `README:189` (supplier table), `README:563` (stalk bullet), `README:756`–`758` ("that adjunction lives in the derived category of DerivedModuleAlgebra's `moduleDerived` instance") and `README:978` ("both suppliers use `HasDerivedCategory.standard`").

Claim: DerivedModuleAlgebra's derived tensor (§0.2) and its tensor–Hom adjunction (§1.1.1) live only in the derived category of `moduleDerived`. They are therefore reached only through the instance comparison.

Witness: the description says #1701 merges first. At #1701's head (`8dcba8a`):
- `hasLeftDerivedFunctor₂_tensor` (§0.2, `Suggested.lean:137`) and `nonempty_derivedTensorHomAdj` (§1.1.1, `:321`) both take `[HasDerivedCategory.{w} (ModuleCat.{u} A)]`.
- `moduleDerived` first appears at `:336`, just before §1.2's `derivedCompleteness` at `:354`. The module docstring (`:106`–`108`) says this too.

On main the claim holds: `moduleDerived` is at `Suggested.lean:569`, before `derivedTensor` at `:613`. r16 R03's repair text also named §§0.2 and 1.1.1, which was wrong at #1701's head.

Repair: at `README:448`, replace the two sentences from "Two suppliers fix the standard instance instead" through "lie in a different category from the derived category here" with:

> DerivedModuleAlgebra fixes its local instance `moduleDerived`, which is `HasDerivedCategory.standard (ModuleCat.{u} R)` with Hom types in `Type (u+1)`, for its derived completeness, completion and Koszul-tower statements (§§1.2–1.5). It states its derived tensor (§0.2) and the tensor–Hom adjunction (§1.1.1) for an arbitrary instance, and these are used under this one directly. SchemeAndStackFoundations §2.18 fixes the standard instance on `X.Modules` …[keep the rest of that clause]. The objects of DerivedModuleAlgebra §§1.2–1.5 and of SchemeAndStackFoundations §2.18 therefore lie in a different category from the derived category here.

Then make the four dependent passages agree:
- `README:189`: say "its completeness, completion and Koszul-tower objects (§§1.2–1.5) live under …".
- `README:563`: delete the clause "through the instance comparison … `moduleDerived`".
- `README:756`–`758`: say "that adjunction is stated for any `HasDerivedCategory` instance and applies to `D(A)` here directly".
- `README:978`: say "SchemeAndStackFoundations §2.18 states `Coherent.DQCoh.affineEquiv` under `HasDerivedCategory.standard` on `ModuleCat R`, and DerivedModuleAlgebra §0.2's tensor, stated for any instance, is taken under that one."

Test of the repair on the refuting instance: at #1701, `nonempty_derivedTensorHomAdj` with `w := u` and this roadmap's `IsGrothendieckAbelian.hasDerivedCategory` gives the adjunction in this roadmap's `D(A)` with no comparison. The repaired `README:756`–`758` says exactly that. `README:541` and `README:2649` stay as they are, because §§1.2–1.3 are under `moduleDerived` both on main and at #1701.

## Previous findings

- R01 — not repaired: the description is unchanged, and #1891 `README:1830`–`1831` still says "(the predicate MonoidalCategory.IsInvertible, built here)". Carried as R01.
- R02 — not repaired: the description still says "README only; no Lean change, so no importer is affected" and does not mention #1330. Carried as R02.
- R03 — repaired: `README:448` now names `moduleDerived` and the comparison `CategoryTheory.Localization.uniq`. `README:452` states the comparison, and `README:541` and `:2649` route through it. The repair added claims about §§0.2 and 1.1.1 that are wrong at #1701's head: new R03.
- R04 — repaired: `Suggested.lean:248`–`250` has no `hI`. `README:2649` says "any ideal I, finitely generated or not", and the Check at `README:2657` tests a non-finitely-generated ideal.
- R05 — repaired: `README:854` *Needs:* no longer lists *enhancedDerived_isPresentable*. It cites Mathlib `CategoryTheory.Tor` for "`Tor_i^P(M, R) = 0` for `i > 0`", and the route at `README:852` derives that from Tau Ceti and dimension shifting.

## Verified sound

**Gate, order, worktree.** `HEAD` is `b9d7526`, and the worktree is clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty. I reran `gate … --base origin/main`: it exited 0, every counter was 0, and it printed `OK`. The worker's gate reports `build=0 OK`. The dependency check (`gate --depcheck … --movable`, exit 0) printed:

```text
depcheck: 238 roadmaps, 2338 edges, 0 problem(s)
```

**Elaboration and signatures.** `lake env lean Suggested.lean` exits 0 with exactly 10 warnings, all `declaration uses sorry`, at lines 101, 121, 148, 184, 196, 207, 219, 248, 262 and 279. A scratch copy with `#check @` for all 17 declarations shows every binder of the README statements. The 6 "looks dropped" leads in `signatures.md` are false positives: `[inst : Category.{u_2,u_1} A] [inst_1 : Abelian A] [IsGrothendieckAbelian.{u_3,u_2,u_1} A]` and `[inst : Category C] [MonoidalCategory C]` are present. In the same probe:
- `isDerivedComplete_iff_derivedCompleteness` elaborates as `∀ R [CommRing R] (I : Ideal R) (M : Type u_1) …`, with no generation hypothesis, matching `README:2649`.
- `inferInstance = IsGrothendieckAbelian.hasDerivedCategory (ModuleCat.{u} R)` closes by `rfl`, and `X ⟶ Y` in `DerivedCategory (ModuleCat.{u} R)` has type `Type u`. So the right-hand side is under this roadmap's instance, as `README:448` and `:2649` say.

**Padding probe on the changed theorem.** `simp [IsDerivedComplete]` leaves the unfolded goal. `aesop` fails after exhaustive search, splitting into `mp` and `mpr` with both goals open. `exact?` finds only the sorried `isDerivedComplete_iff_derivedCompleteness` itself. So it is not padding.

**Library declarations opened at the pins (file:line), new this round.**
- Mathlib:
  - `CategoryTheory.Localization.uniq` (`CategoryTheory/Localization/Predicate.lean:438`) and `compUniqFunctor` (`:447`, `L₁ ⋙ (uniq …).functor ≅ L₂`).
  - The instance `Lifting L₁ W' L₂ (uniq L₁ L₂ W').functor` (`:459`).
  - `Functor.commShiftOfLocalization` (`CategoryTheory/Shift/Localization.lean:181`) and the `NatTrans.CommShift` instance of the lifting isomorphism (`:243`). This is what makes the comparison triangulated, as `README:452` says.
  - `DerivedCategory.mem_distTriang_iff` (`Algebra/Homology/DerivedCategory/Basic.lean:198`: distinguished means isomorphic to `Q.mapTriangle` of a mapping-cone triangle).
- Tau Ceti:
  - `TauCeti.derivedHom` (`Algebra/Homology/DerivedCategory/DerivedHom.lean:69`, under `[HasDerivedCategory.{t} C] [HasDerivedCategory.{w'} (ModuleCat.{v} R)]`, `:61`–`62`).
  - `TauCeti.ModuleTower.derivedLimit` (`Algebra/Category/ModuleCat/Tower/DerivedLimit.lean:310`, under the instance variables of `:305`). Both take instances as parameters, as `README:448` says.
  - `TauCeti.isZero_Tor_succ_of_perfectRing` (`RingTheory/Perfect/Tor.lean:159`): for a perfect ring A and perfect A-algebras B and C, `Tor_{n+1}^A(B, C) = 0`. It applies with `A = (P₀)_perf` and `B = C = R`, which is the input of the route at `README:852`.

**Supplier claims of the changed passages, resolved.**
- DerivedModuleAlgebra on main: `local instance moduleDerived … := HasDerivedCategory.standard _` (`Suggested.lean:569`–`571`). Under it are `derivedTensor` (`:613`), `derivedCompleteness` (`:904`, with no generation hypothesis on I), `derivedCompletion` and `completionUnit` (`:909`, `:912`, with `hI : I.FG`). These match `README:448` and `:541`.
- DerivedModuleAlgebra at #1701: §§1.2–1.3 are under `moduleDerived` (`:336`, `:354`), so `README:541` and `:2649` are right there too. For §§0.2 and 1.1.1, see R03.
- SchemeAndStackFoundations on main:
  - `instance instHasDerivedCategoryModules (X : Scheme.{u}) : HasDerivedCategory X.Modules := HasDerivedCategory.standard _` (`Suggested.lean:1521`).
  - `DQCoh` (`:1526`) and `DQCoh.affineEquiv` under `letI := HasDerivedCategory.standard (ModuleCat.{u} A)` (`:1534`–`1536`).
  - These match `README:448` and `:926`. The comparison commutes with `DerivedCategory.homologyFunctor`, since both homology functors are lifts of complex homology through `Q`. So membership in `DQCoh` read through it is well defined.
- Remark: #1656's SchemeAndStackFoundations head makes the affine equivalence instance-generic (`DQCoh.nonempty_affineEquiv … [HasDerivedCategory (ModuleCat.{u} A)]`, its `Suggested.lean:692`). The description does not name #1656, so main governs, and `README:448` and `:978` are right against main.

**Seeded sample in the changed passages (§0.1 at `README:448`–`461`, §0.3 at `README:541` and `:563`).**
- Stacks Injectives Theorem 19.12.6, tag 079P (StacksInjectives line 883, p. 19) gives, for Grothendieck A, a functorial quasi-isomorphism into a K-injective complex of injectives. This is unchanged and supports `README:448`.
- E4.1 (`README:2649`):
  - Stacks Lemma 15.93.1, tag 091P (StacksMoreOnAlgebra line 12005, p. 261) concerns a single element f, with T(K, f) = 0 equivalent to vanishing of all `Extⁿ(A_f, K)`.
  - Definition 15.93.4, tag 091S (line 12101) defines derived completeness for any ideal, with no generation hypothesis.
  - BS-proet Lemma 3.4.7 (line 996, p. 21) also concerns a single element x.
  - So "091P, which concerns a single element" and "no generation hypothesis on I enters" are correct.
- §§0.2 and 0.4 did not change. r16 verified them, and they are not re-read here.

**Ownership and overlaps.**
- `roadmaps grep 'Localization.uniq'` finds no other roadmap that owns a comparison of `HasDerivedCategory` instances. Main's PerfectoidSpaces `README:1161` uses `Localization.uniq` for an unrelated localization. The comparison is a use of Mathlib, owned there.
- `isDerivedComplete_iff_derivedCompleteness` is declared only here and in #1330 (R02).
- #1187 conflicts only through the pin bump of `Suggested.lean`, and a rebase settles it, as r16 found.
- No cited id is dropped (`overlaps.md`; the gate reports `dropped=0`).

**Adversarial computations.** Rows A–I cover the changed statements and were computed at this head. T/F means the left and right side of an iff.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A | Instance comparison (`README:452`) | `ModuleCat.{u} ℤ` with this instance against `standard` | `uniq` exists (both are localizations at `quasiIso`); `Q₁ ⋙ F ≅ Q₂` (`compUniqFunctor`); shift compatibility from `Lifting` (`:459`) and `commShiftOfLocalization`; a triangle `T ≅ Q₁(cone f)` maps to `F T ≅ Q₂(cone f)`, which is distinguished (`mem_distTriang_iff`) | Pass |
| B | Check `README:459` | ℤ/p and ℤ, `n = −1` and `n = 1` | `Hom(X⟦−1⟧, Y) = Hom(X, Y⟦1⟧) = Ext¹`; `0 → ℤ →p ℤ → ℤ/p → 0` gives `Ext¹(ℤ/p, ℤ) = ℤ/p`; `Hom(X⟦1⟧, Y) = Ext⁻¹ = 0`; Hom universes are `u` and `max (u+1) u = u+1` | Pass |
| C | `isDerivedComplete_iff_derivedCompleteness` (`Suggested.lean:248`) | `I = 0`; `I = ⊤`, M ≠ 0; ℤ and (p); `R = ℤ[x₁, x₂, …]`, `I = (x₁, …)` | `f = 0`: telescope is the identity, `R[1/0] = 0`: T/T; `f = 1`: kernel = constants ≅ M ≠ 0, `Hom(R, M) = M ≠ 0`: F/F; ℤ: cokernel `ℤ_p/ℤ = Ext¹(ℤ[1/p], ℤ)`: F/F; resolution `0 → ⊕R →(eₙ ↦ eₙ − f eₙ₊₁) ⊕R → R_f → 0` (injective: lowest nonzero coefficient survives) gives `RHom(R_f, M) = [M^ℕ →T M^ℕ]`, per element f | Pass |
| D | Check `README:2657` | `M = ℤ = R/I`; `M = R`, `f = x₁` | ℤ: `T = id` on `ℤ^ℕ`, f acts as 0 and invertibly on `Hom(R_f[n], ℤ)`, so 0: T/T; R: `T(y) = (1, 1, …)` forces `y₀ ≡ 1 + x₁ + ⋯ + x₁^{k−1} mod x₁^k`; with D = `deg_{x₁} y₀` and `k = D + 2`, the `x₁^{D+1}`-coefficients give `0 = 1`: F, and `Ext¹ ≠ 0`: F | Pass |
| E | Route of `perfect_projectiveDimension_le` (`README:852`) | `P = 𝔽_p[t]_perf`, `R = M = 𝔽_p`, `d = 1` | `Tor₁^P(R, R) = J/J²` with `J = (t^{1/p^∞})` and `J = J²` (since `t^{1/pⁿ} = (t^{1/pⁿ⁺¹})^p`), so 0; for an R-module N, `N ⊗_P R = N ⊗_R (R ⊗_P R) = N`; dimension shift gives `Tor_{i+1}^P(M, R) = Tor_i^P(N, R) = 0`; `pd_P 𝔽_p = 2 = d + 1` resolution ⊗ R is exact | Pass |
| F | `README:541` comparison into `moduleDerived` | DerivedModuleAlgebra main `:569`/`:909`/`:912`; #1701 `:336`/`:354` | reflector, unit and predicate under `moduleDerived` in both | Pass |
| G | `README:926` `DQCoh` membership | SchemeAndStackFoundations main `:1521`–`1536` | `DQCoh` is a predicate on `homologyFunctor`; the comparison commutes with it (row A) | Pass |
| H | `README:448`, `:189`, `:563`, `:756`–`758`, `:978` | #1701 `:137`, `:321` | §0.2 and §1.1.1 take `[HasDerivedCategory.{w} …]`, not `moduleDerived` | R03 |
| I | Ownership of `MonoidalCategory.IsInvertible` | `README:3035`; #1891 `README:1830`–`1831` | "single owner" versus "built here" | R01 |

The statements the diff leaves untouched carry forward from r16's table. All passed there, and the citation is to that report's rows:
- `hasKInjectiveResolutions`: r16 row 1.
- `locallySmall_localization_quasiIso`: row 2.
- `hasDerivedCategory` and the Checks at `README:456`–`457`: row 3.
- `smallEtaleTopology_W_isMonoidal`: rows 4–5.
- The Koszul Check: row 6.
- `P(ℤ/2)` unbounded: row 7.
- The §0.1 cone Checks: row 8.
- The §0.3 tower and completion Checks: rows 9–10.
- `isInvertible_iff_isUnit_toSkeleton`: row 11.
- The §0.4 exchange: row 12.
- `isRegular_of_frobenius_flat`: row 13.
- `perfect_projectiveDimension_le` (statement): row 14.
- `perfect_torDimension_le_two_mul_dim`: row 15.
- `IsDerivedComplete`: row 16.
- `isAdicComplete_iff_derivedComplete_separated`: row 18.
- `derivedCompleteModules_weakSerre`: row 19.
- The E5:descent, E1.3 and E0.4 Checks: rows 20–22.

## Not verifiable

- Nothing was blocked. Every text the changed passages cite was read in the cache: Stacks Injectives (079P), Stacks More on Algebra (091P, 091S) and BS-proet (Lemma 3.4.7).
- I did not reopen the texts r16 listed as not opened (HTT, SAG, ECD and the others). No changed passage cites them.

## Source issues

- none
