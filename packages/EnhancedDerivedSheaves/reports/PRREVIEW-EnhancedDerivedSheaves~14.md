# Review of EnhancedDerivedSheaves (pull request #1630 at 4a36a4c)

**Verdict:** needs changes

The head is the one r13 read (`4a36a4c`; `scratch/changes.md`: 0 changed lines), so this is a fresh full pass over the same folder. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (the `lake-manifest.json` revisions and the package checkouts agree). Main has moved to `d974e46`; since the merge base `eaf17b1` it changed only `PROGRESS.md` and `STATUS.md` of this folder, which this pull request does not touch. `README:N` and `Suggested.lean:N` refer to the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`.

## R01 (P3) — The description is still wrong about the change and still states no order with #1330 or #1891

Location: the pull-request description (`scratch/pull-request.md`, data), line 22: "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)." Nothing in the description names #1330 or #1891.

Claim: the description tells the approver what changes and how this pull request is ordered against the open pull requests that touch the same objects.

Witness: `git diff --stat eaf17b1 HEAD` changes 551 lines of `Suggested.lean`. #1330 (`856fe7a`) conflicts in both files. #1891 (`bdbf9b3`), `EtaleCohomologyFoundations/README.md:1830`–`1831`: "MonoidalCategory.IsInvertible, built here"; `README:3019` names §0.3 the single owner.

Context for the witness:
- #1330's E1.6 imports `TauCetiRoadmap.PurityOfBranchLocus.Suggested`, which this head replaces with Tau Ceti citations (`README:20`).
- The folder side of the `IsInvertible` ownership is correct. EtaleCohomologyFoundations consumes §§0.1–0.4 (#1891 `README:68`), so §0.3 has to be the owner, and the second owner is #1891's text.
- Carried from r13 R01 (r12 R05 and R03, r11 R01, r10 R03, r9 R03, r8 R02, r7 R08).

Repair, in the description:
- Replace "README only; no Lean change, so no importer is affected" by: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is rewritten in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it, and no roadmap cites a declaration it drops."
- Say that this head supersedes #1330, which should be closed rather than merged after it.
- Say that #1891 must cite `MonoidalCategory.IsInvertible` of EnhancedDerivedSheaves §0.3 in place of "built here" at its `README:1830`–`1831`, and that #1891 is to be rebased after this pull request.

## R02 (P3) — E4.3 attaches the point-case Lean theorems to the sheaf statements

Location:
- `README:2733` (`derivedCompleteModules_weakSerre`): "Derived I-complete module sheaves (in degree zero) … are closed under extensions and under kernels and cokernels".
- `README:2757` (`isAdicComplete_iff_derivedComplete_separated`): "For an R-module sheaf `M, M → lim_n M/I^n M` is an isomorphism if and only if…".

Claim: the backticked names are the Lean declarations of these statements, which are made on a replete topos X with a sheaf of rings R (`README:2634`).

Witness: `Suggested.lean:260` and `:268` take `{R : Type u} [CommRing R] (I : Ideal R)` and modules, use the telescope predicate `IsDerivedComplete`, and have docstrings that say "point case". `:268` concludes kernel and cokernel closure only.

Nothing false is asserted. The README's generality, however, is not the Lean's, and the name "weakSerre" promises extensions that `:268` does not state. `README:2640` already does this correctly for `isDerivedComplete_iff_derivedCompleteness`: there the point-site scope is stated in the sentence that names the theorem.

Repair:
- In `README:2733` and `:2757`, give the sheaf statements italic target names, for example *derivedCompleteSheaves_weakSerre* and *isAdicComplete_iff_sheaf*.
- Add one sentence to each: "For `X = Set` (modules over a commutative ring R, with the telescope predicate `IsDerivedComplete`), the statement is `derivedCompleteModules_weakSerre` (Stacks 091U(1), any ideal)", and respectively "`isAdicComplete_iff_derivedComplete_separated` (Stacks 091T, I finitely generated)".
- Either change the README sentence that names `derivedCompleteModules_weakSerre` to "kernels and cokernels", or add the extension clause to `Suggested.lean`. That clause, `(f : M₁ →ₗ[R] M₂) (g : M₂ →ₗ[R] M₃) (hf : Function.Injective f) (hg : Function.Surjective g) (hfg : Function.Exact f g) : IsDerivedComplete I M₁ → IsDerivedComplete I M₃ → IsDerivedComplete I M₂`, elaborates against the built module (`scratch/repair_probe.lean`, `sorry` warnings only).

## R03 (P3) — Section 0.2 states as a target a lemma Mathlib has at the pin

Location: `README:460`, *ClassicalDerived.replacements*: "Provide *ClassicalDerived.replacements*: … every complex has a functorial quasi-isomorphism into a K-injective complex … A bounded-below complex of injectives is K-injective."

Claim: the last sentence is part of what this target provides; neither it nor the supplier contract (`README:92`) cites a library declaration for it.

Witness: Mathlib `CochainComplex.isKInjective_of_injective (L : CochainComplex C ℤ) (d : ℤ) [L.IsStrictlyGE d] [∀ n, Injective (L.X n)] : L.IsKInjective`, at `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:134`, for any abelian C. `#check` elaborates (`scratch/mathlib_probe.lean`).

Repair:
- Rewrite the sentence as "A bounded-below complex of injectives is K-injective (Mathlib's `CochainComplex.isKInjective_of_injective`)", and add that name to the homological-algebra bullet of `### From Mathlib` (`README:92`).
- In the same bullet, name Mathlib's bounded-below Quillen model `CochainComplex.Plus.modelCategoryQuillen` (`Mathlib/Algebra/Homology/ModelCategory/Injective.lean`). Its factorization `CochainComplex.Plus.modelCategoryQuillen.cm5a` gives the bounded-below K-injective resolutions in any abelian category with enough injectives, which are the `D⁺` resolutions that the Check at `README:469` and the `Functor.rightDerivedFunctorPlus` comparison of §0.4 (`README:593`) use.
- E1.2's unbounded injective model (`README:636`) then reads as the extension of this model.

## R04 (P3) — Downstream consumers names two roadmaps that exist nowhere

Location: `README:3021`, "`HodgeStructuresPartII`"; `README:3025` and `:3026`, "`ExcursionOperatorsAndSpectralAction`".

Claim: these roadmaps consume Layers E1 and E5.

Witness: neither name occurs on main (`TauCetiRoadmap/`, `Completed/`), in `ORDER.txt`, in `roadmaps list` or among the board packages. `Completed/HodgeStructures` and #1832 ExcursionOperatorsAndSpectralActionPartII never mention EnhancedDerivedSheaves.

Repair: delete the two names from the three bullets.

## Previous findings

| r13 | Status at `4a36a4c` | Where |
| --- | --- | --- |
| R01 (P3): the description says "README only", and #1330 and #1891 are unnamed | Not repaired. The description is unchanged. #1330 is still open (`856fe7a`). #1891 moved to `bdbf9b3` and still says "built here" (its `README:1830`–`1831`). Carried as R01. | description lines 22 and 31 |

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `4a36a4c76e563b4f31d5755f4e27ce5dc4749cd3` and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty.
- My rerun of `gate … --base origin/main` exits 0 with every counter zero and prints `OK`, as the worker's gate does.
- The dependency check (`gate --depcheck … --movable`, exit 0) prints the line below, with no UPWARD, CYCLE or `moved:` line. The roadmap is on main and is not in `ORDER.txt` (398 lines).

```text
depcheck: 239 roadmaps, 2351 edges, 0 problem(s)
```

- No roadmap from the never-cite list appears in the README.

**Elaboration, signatures, padding.**
- `lake env lean …/Suggested.lean` exits 0 with exactly 10 warnings, all `declaration uses sorry`, at lines 101, 121, 148, 184, 196, 207, 219, 247, 260 and 268.
- `#check @` of all 17 declarations (`scratch/sig_probe.lean`): every binder is present. The six "lost binder" leads of `scratch/signatures.md` are false: `[Category.{v} A] [Abelian A] [IsGrothendieckAbelian.{w} A]` and `[Category.{v} C] [MonoidalCategory C]` appear under renamed universes.
- `example : HasDerivedCategory.{0} (ModuleCat.{0} R) := inferInstance` resolves to `IsGrothendieckAbelian.hasDerivedCategory`; the only error is noncomputability, which names that instance. So `isDerivedComplete_iff_derivedCompleteness` is stated in universe u.
- One-tactic probe (`first | infer_instance | rfl | decide | simp | aesop | exact?` on a scratch copy): all 10 sorried theorems fail.
  - `exact?` proposes `locallySmall_max` for `:121`, which fails on the universe constraint `max (max u' v) ?u = w`.
  - It proposes `GrothendieckTopology.W.monoidal` for `:148`, which fails on `HasLimitsOfSize.{u+1,u+1} (ModuleCat.{u} Λ)`.
  - These are exactly the obstructions `README:445` and `:478` describe.
- No `def`, `instance` or `class` is padding.
- Form: one module docstring naming the not-statable families, `theorem` only, no `set_option`, no sorried data, and imports `Mathlib` plus one existing Tau Ceti module.

**Library names.** I ran `#check @` on 335 backticked names of the README, importing `Mathlib` and the 60 Tau Ceti modules that declare them, all built (`scratch/probe_names.lean`). Every name resolves except the following:
- seven module paths and the namespace `CategoryTheory.Limits`;
- the short forms `TStructure.eTruncGE` and `TStructure.truncLE`, whose full `CategoryTheory.Triangulated.` names resolve;
- `DerivedCategory.Q.map`, which needs a `HasDerivedCategory` instance to `#check`;
- `Algebra.CotangentComplex` and `.smooth`, which are DerivedModuleAlgebra §0.4/§0.12 targets (its `README:583`);
- `CategoryTheory.Sheaf.derivedPushforward` and `.higherDirectImage`, which are SchemeAndStackFoundations §2.1 targets (its `README:3286`).

Pinned statements that I read:
- `TauCeti.HasKInjectiveResolutions` (`Algebra/Homology/DerivedCategory/KInjective.lean:92`): a quasi-isomorphism into a K-injective complex, objectwise.
- Mathlib's `SheafOfModules` Grothendieck instance, `{C : Type u} [SmallCategory C]` and `R : Sheaf J RingCat.{u}`, as `README:460` says.
- `isGrothendieckAbelian_sheaf_smallEtaleTopology` through `AffineEtale.sheafEquiv`, and `EssentiallySmall.{u} S.AffineEtale` (`Sites/AffineEtale.lean:91`, `:149`).
- `W.transport_isMonoidal`, which needs a full, cover-dense, continuous functor with essentially surjective pushforward (`Sites/Monoidal.lean:119`), as `README:478` says.
- `IsRegularRing` extends `IsNoetherianRing`.
- `CommRing.Pic R := Shrink (Skeleton (SemimoduleCat R))ˣ` (`RingTheory/PicardGroup.lean:429`), as `README:569` says.
- `Skeleton.instMonoid` needs only `[MonoidalCategory C]`.
- Mathlib's injective model is on bounded-below complexes only (`ModelCategory/Injective.lean`, `Factorizations/CM5a.lean`), so the unbounded K-injective headline is not in Mathlib.

**Tau Ceti beyond the pin (no change requested).** Tau Ceti `385ec2d` (6 Nov, not an ancestor of the pin) adds `TauCeti.IsDerivedComplete` with `ker`, `quotient_range` and `isAdicComplete_iff_isDerivedComplete_and_isHausdorff (hI : I.FG)`. At the pin these do not exist, so `Suggested.lean:240`, `:260` and `:268` duplicate nothing. When the pin moves past `385ec2d`, they should become citations.

**Supplier citations, resolved on main `d974e46`.**
- SchemeAndStackFoundations:
  - §§0.1, 0.4, 0.9, 0.17, 0.24, 0.25, 1.6–1.11, 2.1, 2.2, 2.5, 2.6, 2.17, 2.18, 4.12 and 4.13 exist as headings.
  - `Sheaf.derivedPushforward` and `leray_spectral_sequence` are in §§2.1–2.2; `cech_to_cohomology` and `cohomology_filtered_colimits` are at its `README:3314` and `:3402`.
  - `IsReplete.derived_limits`, `IsReplete.derivedCategory_leftComplete` and `isReplete_of_locallyWeaklyContractible` are in §2.17 (`:3931`).
  - `DQCoh.affineEquiv`, `DQCoh.restrict` and `torIndependent_baseChange` are in §2.18. The Lean name is `Coherent.DQCoh.affineEquiv` (its `Suggested.lean:1534`), and both spellings occur in its README.
  - `IsRegular.isCohenMacaulay` is in §4.13.
- DerivedModuleAlgebra:
  - §0.I.1 (`moduleKInjectiveReplacement`), §0.2 (`DerivedDeRham.derivedTensor`), §0.4 (`Algebra.CotangentComplex` with `.resolutionIso`, `.transitivityTriangle`, `.regularQuotient`), §0.14 (`derivedExteriorPower`) and §0.K.1 (`koszulComplex`).
  - §1.1 (`DerivedDeRham.derivedLimit`), §1.1.1 (`moduleDerivedHom`), §1.2 (`derivedCompleteness`, `README:1707`), §1.3 (`derivedCompletion`, `completionUnit`) and §1.4 (`koszulCompletionTower`).
- PerfectoidSpaces:
  - P0.1, P0.2, P0.5–P0.8, P0.11, P0.14 and P0.15 exist as headings.
  - `Almost.Algebra.IsFiniteEtale` and `isUnramified_iff_exists_idempotent` are at its `README:2061` and `:2068`; P7.16a is at `:17397`.
- BordismFormalGroups F6.5 (`:1526`) carries the four bold sub-lanes at `:1546`, `:1823`, `:1944` and `:2005`, the monoidal/fibration sub-lane at `:2119` and quotient/Ind at `:2340`.
- GeneralizedCohomology G2 items 1–10 (item 3 has the Ω-spectrum test, item 7 the concrete `HA`) and G3 items 8–9.
- AdicSpacesPartII §R0.19.10 (`:8005`) and AlgebraicTopology Stage 6 item 0 (countable inverse-system algebra).
- DGAInfinity Layers 0–1, ProfiniteCohomology Layers 0 and 10, JacobianChallenge Layer C, StableReduction Layer 2 and StablePeriodicCurved (Frobenius exact categories).
- `roadmaps resolve` lists 19 leads. Every one is a supplier target listed above or this file's own declaration.

**Ownership and overlaps.**
- `roadmaps grep` for the headline objects finds no second owner, apart from #1891's "built here" (R01). CrystallineCohomology (#857) only consumes `isRegular_of_frobenius_flat`.
- HigherToposTheory (#1901, `2176cc4`, `README:51`) says that EnhancedDerivedSheaves takes its notions from there. EnhancedDerivedSheaves is on main and is existing work, so the citation belongs in #1901; nothing here changes.
- #1187's copy of `Suggested.lean` is identical to main's (diff 0 lines), and it bumps Tau Ceti to `ab00ba392`, which is older than the pin. No order is needed with this pull request.
- `overlaps.md` lists no dropped or revision-only id. I checked the 28 declarations of main's `Suggested.lean` that this head drops: none occurs qualified, and nothing imports this module, on main or in the 469 open checkouts.

**Sources: the seeded sample (0.1–0.4), read in the cache, with pages recomputed from the page markers.**
- **0.1.**
  - HA §1.3.5 (p. 121). Definition 1.3.5.8 (`112b145a` line 4739, p. 125) defines `D(A)` as the dg nerve of the fibrant complexes. Proposition 1.3.5.9 (line 4743, p. 125) gives stability. Proposition 1.3.5.21 (line 4874, p. 129) gives presentability and a t-structure compatible with filtered colimits, as `README:429`/`:434` state.
  - Stacks Injectives Theorem 19.12.6, tag 079P (`8042e600` line 883, p. 19) gives functorial, termwise-monic, injective-termed K-injective resolutions in any Grothendieck abelian category. It supports `hasKInjectiveResolutions` with no extra hypothesis.
- **0.2.**
  - Cohomology on Sites §21.17 (p. 29), Lemma 21.17.11, tag 06YS (`f1af633f` line 1342, p. 31): K-flat, flat terms, termwise surjective. §21.19 (p. 36).
  - Modules on Sites: 03EK (`4da0acd5` line 1563, p. 33); Lemma 18.26.1, tag 0GMW (line 1580, p. 34); 04TT (p. 35); Lemma 18.27.1, tag 03EM (p. 35); Lemma 18.27.7, tag 03EP (line 1710, p. 37).
  - HA Proposition 4.1.7.4 (line 18583, p. 486).
- **0.3.**
  - Cohomology on Sites §21.35 (line 3668, p. 82). HA Example 4.1.7.6 (p. 487), Theorem 7.1.2.13 (p. 1212, commutative R) and Remark 7.1.1.16 (p. 1206).
  - Derived Categories §13.34, tag 08TB, with Definition 13.34.1, tag 08TC (`3d6c5169` line 5255, p. 105).
  - More on Algebra: 07KW (p. 231), 07KY (p. 235), 091D (p. 238), 091N (p. 261), 091V (p. 264), 0920 (p. 267), 0G1U (p. 268), 0923 (p. 271), 091P (p. 261, per element f), 091S/091T (p. 263, FG for 091T) and 091U (p. 264, weak Serre for any ideal).
  - HA §1.1.4 (pp. 33–36) is Proposition 1.1.4.1 on exact functors plus limits of stable ∞-categories. It supports the exactness and finite-product compatibility of the comparison; the `Rlim` formula and the Milnor sequence rest on the Stacks and BS-proet locators of the same parenthesis.
- **0.4.**
  - Cohomology on Sites §21.18 (p. 33) and §21.19 (p. 36). HA §1.3.4, "Inverting Quasi-Isomorphisms" (p. 108), with Proposition 1.3.4.25 at p. 119.
- **Other locators that I recomputed.**
  - HA 1.1.1.9 (p. 19), 1.1.2.14 (p. 27), 1.1.3.4 (p. 31), 1.3.1.6 (p. 81), 1.3.1.10 (p. 82), 1.3.1.12 (p. 83), 1.3.2.1 (p. 88), 1.3.5.3 (p. 121), 1.3.5.6 (p. 124), 1.3.5.15 (p. 127) and 1.4.4.1 (p. 154).
  - Cohomology on Sites 07A2/06YT/06YU (pp. 29–31), 0G7E/06YY/0D6D (pp. 33–34), 07A6/0D6E (p. 37), 0D6F (p. 40) and 08G4/08G5 (p. 118). Modules on Sites 03DH/03DI/03DJ (pp. 20–21) and 03EV (p. 40).
  - More on Algebra 0622/0623 (p. 69), 0664 (p. 72), 062F/062G (p. 76), 062I (p. 77), 0913 (p. 74), 0BKC/091Y/091Z (p. 266) and 0A5W/0A63–0A65 (p. 189).
  - BS17 (`b4d5a4e0`): Proposition 11.31 (line 2240, p. 48; its proof gives the bound `d + 1` and the transfer `M ≃ M ⊗ᴸ_P R`), Remark 11.33 with footnotes 24–25 (p. 49; bound `2d`, nodal counterexample, Gabber's `2d + 1` unproved) and Corollary 11.35 (p. 49, proof p. 50).
  - BS-proet (`ae0960a2`): Proposition 3.4.2, Remark 3.4.3 and Lemma 3.4.7 (p. 21), and Lemma 3.4.14 (p. 23).

**Adversarial computations.**

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `hasKInjectiveResolutions` (`Suggested.lean:101`) | `ModuleCat.{u} R`; the zero category; étale `Λ`-sheaves | Tau Ceti's `ModuleCat` instance proves the same `Prop`; in the zero category `K = 0` and `id` works; étale sheaves are Grothendieck abelian by Mathlib, so 079P applies; `exact?` cannot close it | Pass |
| 2 | `locallySmall_localization_quasiIso` (`:121`) | `A = ModuleCat.{u} R`: `u' = u+1, v = w = u` | gives `LocallySmall.{u}`; `standard` gives `Type (u+1)`; `Hom_K(X, I) = ` quotient of `∏_{n∈ℤ} Hom(X_n, I_n)` : `Type w`; `locallySmall_max` needs `w = max u' v` | Pass |
| 3 | `hasDerivedCategory` (`:129`), Checks `README:452`–`454` | `ModuleCat.{0} R` | instance search returns this instance, Hom in `Type 0`; `Localization.uniq` relates any two | Pass |
| 4 | `smallEtaleTopology_W_isMonoidal` (`:148`) | `X = ∅`; `Spec k`, k separably closed; `Spec k ⊔ Spec k` | ∅: all maps in W; `Spec k`: W = isomorphisms, closed under ⊗; two points: presheaf tensor `Λ⁴`, sheaf tensor `Λ²` | Pass |
| 5 | Koszul Check `README:488` | `K = [ℤ_X →id ℤ_X]`, a ∈ K¹, c ∈ K⁰ | `τd(a⊗c) = −dc⊗a`, `dτ(a⊗c) = dc⊗a`, differ by `2dc⊗a ≠ 0`; sign on `K¹⊗K¹` is `(−1)^{1·1} = −1` | Pass |
| 6 | `isInvertible_iff_isUnit_toSkeleton` (`:184`) | `𝟙`; `ℤ/2` in `ModuleCat ℤ` | `𝟙`: T/T; `ℤ/2 ⊗ ℚ = 0 = ℤ/2 ⊗ 0`, not an equivalence, and `[ℤ/2][Y]` is 2-torsion ≠ `[ℤ]`: F/F; `X⊗Y ≅ 𝟙` gives `X⊗(Y⊗X) ≅ X⊗𝟙`, so `Y⊗X ≅ 𝟙` by full faithfulness | Pass |
| 7 | `isRegular_of_frobenius_flat` (`:196`) | `𝔽_p[t]`; `𝔽_p[ε]/(ε²)`; R = 0 | free of rank p, regular: T/T; Frobenius kills ε, not flat, not regular: F/F; `CharP 0 p` forces `p ∣ 1` | Pass |
| 8 | `perfect_projectiveDimension_le` (`:207`) | `P₀ = 𝔽_p(t)`; `P₀ = 𝔽_p[t]`, `R = P`, `M = R/J_t` | perfect field: pd 0 ≤ 1; `J_t` flat, countably generated, idempotent, not f.g., so pd `J_t` = 1 and pd `R/J_t` = 2 = d+1; `Tor^P_{>0}(R,R) = 0` makes `Q•⊗_P R` an R-resolution | Pass, sharp |
| 9 | `perfect_torDimension_le_two_mul_dim` (`:219`), Checks `README:872`–`875` | `(k[x,y]/(xy))_perf`, d = 1; kernel of `(P₀)_perf → R` | `Ann(x) = (y^b : b > 0)` flat; `Tor₂(R/(x), R/(y)) = (y)/yJ ≅ k`; `Tor_{≥3} = 0`; first vanishing degree `2d+1 = 3`; `x^{p^n} ∈ P₀ ∩ K` gives `R = (P₀/I₀)_perf`, I₀ f.g., inside BS17's domain | Pass |
| 10 | `IsDerivedComplete` (`:240`) | ℤ, (p): `ℤ_p`, ℤ, `ℤ/p`, `ℤ[1/p]`; I = 0; I = ⊤ | `ℤ_p` bijective; ℤ cokernel `ℤ_p/ℤ`; `ℤ/p`: `x_n − p x_{n+1} = x_n`; `(p^{−n})` lies in the kernel for `ℤ[1/p]`; I = 0: identity; I = ⊤: kernel = constants, so only M = 0 | Pass |
| 11 | `isDerivedComplete_iff_derivedCompleteness` (`:247`) | ℤ, `ℤ/p` over ℤ; a non-FG ideal | ℤ: `Hom(ℤ[1/p][−1], ℤ) = Ext¹ = ℤ_p/ℤ ≠ 0`: F/F; `ℤ/p`: `RHom = 0`: T/T; 091P is per element, so `hI` is unused (DMA's `derivedCompleteness`, its `Suggested.lean:904`, has no FG); a note, no change | Pass |
| 12 | `isAdicComplete_iff_derivedComplete_separated` (`:260`), Check `README:2764` | `ℤ_p`; ℤ; `coker ψ` | T/T; separated and not derived complete: F/F; derived complete, `ē₀ ∈ ⋂ pᵏM`, not separated: F/F; 091T needs FG, as `hI` | Pass; R02 for scope |
| 13 | `derivedCompleteModules_weakSerre` (`:268`), Checks `README:2737`–`2739` | `p : ℤ_p → ℤ_p`; `ℤ ⊆ ℤ_p` | kernel 0, cokernel `𝔽_p`, both complete; ℤ not complete; the Ext sequence (`pd_ℤ R_f ≤ 1`) gives ker and coker for any I | Pass; R02 for scope |
| 14 | 0.1 Checks `README:438`–`441` | `A[1]`; `Cone(id)`; `Cone(0)` | `H⁻¹(A[1]) = A`; `Cone(id)` acyclic; `Cone(0) = A[1] ⊕ A`, with cohomology in −1 and 0 | Pass |
| 15 | 0.2 Check `README:472` | `⨿_I X → X`, `I : Type u` | étale, fibre of cardinality `|I|`: isomorphism classes not u-small | Pass |
| 16 | 0.2 Check `README:501`, 0.3 Check `:564` | Λ = ℤ/4, `(ℤ/2)_X` | 2-periodic resolution `… →2 ℤ/4 →2 ℤ/4`: `Tor_i = ℤ/2` for every i ≥ 0 | Pass |
| 17 | 0.3 Checks `README:516`, `:530`–`:532` | `ℤ/n ⊗ᴸ ℤ/n`; `ℤ/ℓ^{i+1}`; `K_i = [ℤ → ℤ/ℓ^{i+1}]` | `Tor₁ = ℤ/n`; `lim = ℤ_ℓ`, `lim¹ = 0`; `H⁰(K_i) = ℓ^{i+1}ℤ` not ML, `Rlim = [ℤ → ℤ_ℓ]`, `H¹ = ℤ_ℓ/ℤ` | Pass |
| 18 | 0.3 Checks `README:548`–`550` | ℤ; `ℤ/ℓ`; `ℤ[1/ℓ]` | completion `ℤ_ℓ`; `ℤ/ℓ ⊗ᴸ ℤ/ℓⁿ` in degrees −1 and 0; `ℤ[1/ℓ] ⊗ᴸ ℤ/ℓ = 0`, not complete | Pass |
| 19 | 0.3 Check `README:573`–`575` | `ModuleCat.of R M`; `Λ_X[1]` | `Module.Invertible` (`Dual ⊗ M → R` bijective) ⇔ tensor-invertible; `ε(Λ_X[1]) = (−1)^{1·1} = −1 ≠ 1` when `2 ≠ 0` | Pass |
| 20 | 0.4 exchange direction `README:583`, E3 Check `:1341` | base change along `ℤ → ℤ/p` | `fib(ℤ/p ⊗ᴸ_ℤ ℤ/p → ℤ/p) = ℤ/p[1] ≠ 0`, so the mate is not invertible | Pass |
| 21 | 0.2 bounded-below sentence `README:460` | Mathlib at the pin | `CochainComplex.isKInjective_of_injective` elaborates for every abelian C | R03 |
| 22 | E1.3 Check `README:658` | `Map(ℤ/p, ℤ/p[1])` | `π₀ = Ext¹ = ℤ/p`, `π₁ = Hom = ℤ/p` | Pass |
| 23 | E1.8 Check `README:950` | `K = (ℤ/p)[−1]`, `ℤ → ℤ/p` | source `H⁰(K) ⊗ ℤ/p = 0`; target `H⁰ = Tor₁ = ℤ/p` | Pass |
| 24 | E1.9 Check `README:1172`–`1177` | `B = k[t,ε]/(tε, ε²)`, `A = B/(ε)`, `C = B/(t)` | both sides `k[0]`; `Tor₂^B(A,C) = Tor₁^B(A, tB) = Tor₁^B(A,A) = (ε) ≅ k` since `tB ≅ A` | Pass |
| 25 | E2:towers Checks `README:1401`, `:1451`–`1456` | tail tower `⊕_{j≥i} ℚ` | `lim = 0`, `lim¹ = ∏ℚ/⊕ℚ = V`; `Hom(ℚ[−1], T_i) = Ext¹_ℚ = 0`; `Hom(ℚ[−2], Rlim(T_i⊗T_i)) = 0` (degrees 0, 1) | Pass |
| 26 | E2.4 window `README:2279`, Checks `:2286`, `:2288` | `b ≡ 0`, m = 0 and m = −3 | `N = max(0, 1+max(0,0,−1,−2)) = 1`; `N = 1+max(3,3,2,1) = 4` | Pass |
| 27 | E2.3 Checks `README:2212`, `:2220`, `:2234` | `Ψ(A[1])`; `K = ℤ[1], L₀ = ℤ`; `Ψ(ℤ[3])` | `τ^{≥0}A[1] = 0`; `RHom(ℤ[1], ℤ) = ℤ[−1]` with `H¹ = ℤ`, and both mapping spaces contractible; `H⁻³(L_n) ≠ 0` iff `n ≥ 3` | Pass |
| 28 | E4.5 inclusion `README:2845` | `J_n = (f₁ⁿ,…,f_rⁿ)` | a monomial of degree `r(n−1)+1` has some exponent ≥ n (pigeonhole), so `I^{r(n−1)+1} ⊆ J_n ⊆ Iⁿ` | Pass |
| 29 | E5:animation Check `README:1991` (`WalkingReflexivePair`) | the four diagonal comma categories, computed (`scratch/tools/wrp.py`) | at `(one, one)`: 13 objects, 40 non-identity arrows, ranks 12 and 26, `H₀ = 1`, `H₁ = ℚ²`; at the other three, `H₁ = 0` | Pass |
| 30 | E5 Check `README:3002`; E5:cotangent Check `:2955` | `L_{k/k[ε]}`; `L_{B/k}`, `B = k[ε]/(ε²)` | the triangle via `k[x]` gives `k[1] →0 k[1]`, so `H⁻¹ = H⁻² = k`; `[B → B dε], 1 ↦ 2ε dε`, `H⁻¹ = εB` | Pass |
| 31 | E5:presentability Checks `README:1734`, `:1748` | `Ω` on `∗ ← S⁰ → ∗` | `ΩS⁰ = ∗`, pushout `∗`, while `ΩS¹ ≃ ℤ`; so `ΩΣS⁰ ≠ S⁰` | Pass |
| 32 | Downstream consumers `README:3021`, `:3025`–`:3026` | main, `ORDER.txt`, `roadmaps list`, board packages | 0 hits for `HodgeStructuresPartII` and `ExcursionOperatorsAndSpectralAction` | R04 |
| 33 | The description (`pull-request.md:22`) | `git diff --stat eaf17b1 HEAD` | 551 changed lines of `Suggested.lean` against "no Lean change"; #1330 and #1891 unnamed | R01 |

## Not verifiable

- None was blocked. Every text that I consulted was read in the cache: HA, Stacks Injectives, Cohomology on Sites, Modules on Sites, More on Algebra, Derived Categories, BS17 and BS-proet.
- I did not check the following locators: HTT, Liu–Zheng, Nikolaus–Scholze, Mathew, Robalo, Ramzi, Efimov, Fargues–Scholze, Berkovich motives, Bhatt's two papers, Bhatt–Lurie, SAG and ECD, and the Stacks chapters on spaces, simplicial spaces, the cotangent complex and local cohomology. They lie outside the seeded sample and are touched by no finding.

## Source issues

- none
