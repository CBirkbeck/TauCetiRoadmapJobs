# Review of EnhancedDerivedSheaves (pull request #1630 at 9600471)

**Verdict:** needs changes

Incremental re-review of the 16 changed lines since `3e946b0` (the head r9 read), at the unchanged pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. Here `README:N` and `Suggested.lean:N` mean the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`. Mathlib and Tau Ceti paths are relative to the library roots at the pins.

This head repairs r9 R01 and R02. The new transport route for essentially small sites (`README:460`) checks in Lean from start to end in a scratch probe. The new Check (`README:472`) corrects an error in r9's witness: r9 called `X.Etale` essentially small, and it is not. Two small defects remain in the changed text (R01, R02). The pull-request description is still unchanged (R03, carried).

## R01 (P3) — `C` names both the Grothendieck abelian category and the site

Location: `Suggested.lean:99`–`100`, the docstring of `IsGrothendieckAbelian.instHasKInjectiveResolutions`: "on every small ringed site (`SmallCategory C`, `O : Sheaf J RingCat.{u}`)". In `README:460` the new parentheticals "(`C : Type u` with `SmallCategory C`, …)" and "(`Category.{u} C` with `EssentiallySmall.{u} C`)" do the same.

Claim: the docstring says where the instance applies.

Witness: the instance's own argument is the section variable `C : Type u` with `[Abelian C] [IsGrothendieckAbelian.{w} C]` (`Suggested.lean:84`). Its `#check @` type has no `SmallCategory`. For module sheaves that `C` is `SheafOfModules.{u} O : Type (u+1)`, not the site. Earlier in the same paragraph, `README:460` uses "`C : Type u`" for the abelian category.

Repair:
- At `Suggested.lean:99`–`100`, name the site `D`: "on every small ringed site (`D : Type u` with `SmallCategory D`, `O : Sheaf J RingCat.{u}`)".
- At `README:460`, write the Grothendieck abelian category of the "first" clause as `A`: "for `A : Type u'` with `Category.{v} A`, `Abelian A` and `CategoryTheory.IsGrothendieckAbelian.{w} A`, every cochain complex in `A` …", "`IsGrothendieckAbelian.hasKInjectiveResolutions : TauCeti.HasKInjectiveResolutions A`". Then `C` is the site throughout, as in the paragraph's opening "(C,R)", and E1.2 already calls the Grothendieck abelian category A.

Tested: the scratch probe names the site `D` (`D : Type u`, `SmallCategory D`), and `inferInstance` still finds `TauCeti.HasKInjectiveResolutions (SheafOfModules.{u} O)`.

## R02 (P3) — `IsGrothendieckAbelian.of_equivalence` is consumed but missing from the From Mathlib contract

Location: `README:93`, the Sheaves bullet of *From Mathlib*. It now lists the transport inputs "`SheafOfModules.pushforwardPushforwardEquivalence` … `CategoryTheory.GrothendieckTopology.WEqualsLocallyBijective.ofEssentiallySmall` for essentially small sites", but not the step that carries the structure across.

Claim: the contract names every Mathlib declaration that Section 0.2 consumes.

Witness:
- `README:460` and the *Needs:* line `README:476` consume `CategoryTheory.IsGrothendieckAbelian.of_equivalence` (Mathlib `CategoryTheory/Abelian/GrothendieckCategory/Basic.lean:81`).
- `grep -n of_equivalence README.md` finds it only at `:460` and `:476`. The other hits, `:2125` and `:2134`, are the unrelated `TauCeti.IsReplete.of_equivalence`.

Repair: in `README:93`, after `CategoryTheory.GrothendieckTopology.WEqualsLocallyBijective.ofEssentiallySmall`, add "and `CategoryTheory.IsGrothendieckAbelian.of_equivalence`, which carries a Grothendieck abelian structure across an equivalence of abelian categories".

## R03 (P3) — The description states no order with #1330 and still calls the change README-only

Location: the pull-request description (`scratch/pull-request.md`, data): "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)". Its revision line names only #1701.

Claim: the description tells the human approver how the change relates to main and to the other open pull requests.

Witness:
- `roadmaps overlaps EnhancedDerivedSheaves` reports that #1330 still changes this folder's `README.md` and `Suggested.lean` and conflicts with this head. #1330's `Suggested.lean` still imports `TauCetiRoadmap.PurityOfBranchLocus.Suggested` (`roadmaps show --pr 1330`).
- `git diff --stat origin/main...HEAD` changes `Suggested.lean`.

Carried from r9 R03 (r8 R02, r7 R08). No repair report marks it not actionable.

Repair, in the description only:
- Add one sentence saying that this head supersedes #1330, which is to be closed or rebased on it.
- Replace "README only; no Lean change" with a sentence saying that `Suggested.lean` is rewritten (module form, the Tau Ceti import, the headline set) and that no roadmap imports it.

## Previous findings

- R01 — repaired: `README:460` "makes `SheafOfModules.{u} O` Grothendieck abelian on every small ringed site … On an essentially small ringed site … the Grothendieck abelian structure … is part of this target, by transport"; `Suggested.lean:99` "on every small ringed site". The new notation clash is R01 above.
- R02 — repaired: `README:460` "`CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero` says that the map from a complex I to a zero complex has the right lifting property … exactly when I is a K-injective complex of injective objects". Also cited at `README:149`, `:476`, `:638` and `:647`.
- R03 — not repaired: the description still reads "README only; no Lean change, so no importer is affected", and its revision line names only #1701. Carried as R03.

## Verified sound

**A correction to r9.** r9's witness for its R01 said "`X.Etale : Type (u+1)` is essentially small but not small". That was wrong. `README:472` gives the counterexample, which I checked (rows 7–8 below). So r9's proposed wording "such as the small étale site of a scheme with a sheaf of rings" would have been false. The repair is right to depart from it: it scopes the transport to essentially small sites and records the étale ringed site as a non-example.

No target of this README needs `SheafOfModules` over a sheaf of rings on `X.Etale`:
- `grep` for `SheafOfModules` together with "étale" finds only the `ModuleCat`-valued sheaves of `:478`–`:490`, and those get the instance through `AffineEtale`.
- E1 is stated on small ringed sites (`:608`, `:612`, `:624`).

**Gate, build, dependency check.** The worker's gate (`scratch/gate.md`) reports every counter zero, including `build=0`. My rerun on this head (`gate … --base origin/main`, exit 0) prints:

```text
gate EnhancedDerivedSheaves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check (`gate --depcheck … --movable`) prints the line below, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 245 roadmaps, 2493 edges, 0 problem(s)
```

The other checks:
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty.
- HEAD is `9600471bd82b2ab1a2aee42941e235f193844000` and the worktree is clean.
- The changes file lists no file changed outside the folder.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` exits 0 with exactly 11 warnings, all `declaration uses sorry`, one per sorried theorem (lines 91, 110, 137, 173, 185, 196, 208, 246, 276, 289, 297).
- `scratch/signatures.md` lists 23 entries. Four of them (`there;`, `;`, `` `IsGrothendieckAbelian.hasDerivedCategory`, ``, `for`) are words from the module docstring at lines 15, 17, 27 and 39, parsed as declarations. The file has 19 declarations, as in r9.
- The six "looks dropped" leads are present: the elaborated types carry `[Category.{u_2,u_1} C] [Abelian C] [IsGrothendieckAbelian.{u_3,u_2,u_1} C]` and `[MonoidalCategory C]` under universe names that the text match misses.
- The only Lean change is the docstring at `:96`–`:100`. A scratch `#check @` of the instance gives the r9 type, `∀ (C : Type u_1) [Category.{u_2,u_1} C] [Abelian C] [IsGrothendieckAbelian.{u_3,u_2,u_1} C], TauCeti.HasKInjectiveResolutions C`.

**Pinned declarations opened (11):**
- Mathlib `SheafOfModules.pushforwardPushforwardEquivalence` (`Algebra/Category/ModuleCat/Sheaf/PushforwardContinuous.lean:385`). It needs `eqv : C ≌ D`, continuity of both halves, ring-sheaf maps φ and ψ, and the equations H₁ and H₂.
- `CategoryTheory.equivSmallModel` (`CategoryTheory/EssentiallySmall.lean:69`).
- `CategoryTheory.Functor.inducedTopology` (`CategoryTheory/Sites/InducedTopology.lean:50`).
- `CategoryTheory.hasSheafifyEssentiallySmallSite` (`CategoryTheory/Sites/Equivalence.lean:214`) and `CategoryTheory.GrothendieckTopology.WEqualsLocallyBijective.ofEssentiallySmall` (`:310`). Both are lemmas, not instances.
- `CategoryTheory.IsGrothendieckAbelian.of_equivalence` (`CategoryTheory/Abelian/GrothendieckCategory/Basic.lean:81`).
- The `SheafOfModules` instance (`CategoryTheory/Abelian/GrothendieckAxioms/SheafOfModules.lean:23`–`25`). It needs `{C : Type u} [SmallCategory C]` and `R : Sheaf J RingCat.{u}`, exactly the README's "small ringed site".
- `Sheaf.isGrothendieckAbelian_of_essentiallySmall` (`CategoryTheory/Abelian/GrothendieckAxioms/Sheaf.lean:78`). It is for `Sheaf J A`, not for `SheafOfModules`, so "Mathlib has no such instance" for module sheaves holds.
- `AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology` (`AlgebraicGeometry/Sites/AffineEtale.lean:149`), via `AffineEtale.sheafEquiv`.
- Tau Ceti `CochainComplex.rlp_monomorphisms_inf_quasiIso_iff` (`Algebra/Homology/ModelCategory/Injective.lean:150`) and `…_of_isZero` (`:162`). The file header says the factorization is not built.

Tau Ceti has no `IsGrothendieckAbelian` instance for `SheafOfModules` on essentially small sites. Its only uses of `IsGrothendieckAbelian` are `Algebra/Category/ModuleCat/Sheaf/Universe.lean`, which covers `Sheaf J (ModuleCat R)` on small sites, and `Topology/Sheaves/Cohomology/Basic.lean`.

Every fully qualified name the diff adds resolves by `#check` at the pins, with no `open`: the six Mathlib names of `README:476`, `AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`, and both Tau Ceti `rlp_…` names.

**The transport route, checked in Lean.** The scratch probe states the headline with `sorry` and does every other step without `sorry`. For `D : Type u'`, `Category.{u} D`, `EssentiallySmall.{u} D`, `J` and `O : Sheaf J RingCat.{u}`:
1. `SmallCategory (SmallModel.{u} D)` is found, and both halves of `equivSmallModel D` are found continuous for `(equivSmallModel D).inverse.inducedTopology J`.
2. With `hasSheafifyEssentiallySmallSite J AddCommGrpCat.{u}` and `WEqualsLocallyBijective.ofEssentiallySmall J` as local instances, `Abelian (SheafOfModules.{u} O)` is found.
3. `IsGrothendieckAbelian.{u}` holds for module sheaves over the restricted ring sheaf `O'` on the small model, by Mathlib's instance.
4. `pushforwardPushforwardEquivalence (equivSmallModel D) φ (𝟙 _) H₁ H₂ : SheafOfModules.{u} O' ≌ SheafOfModules.{u} O` is built with `φ = whiskerRight (NatTrans.op unitInv) O.obj`. Each of H₁ and H₂ closes in five lines.
5. `IsGrothendieckAbelian.of_equivalence` of step 4 gives `IsGrothendieckAbelian.{u} (SheafOfModules.{u} O)`, and `TauCeti.HasKInjectiveResolutions (SheafOfModules.{u} O)` is then found.
6. Without step 5, `infer_instance` fails for `IsGrothendieckAbelian.{u} (SheafOfModules.{u} O)`. This is the only error in the probe, and it is expected.

**Sources (the seeded target 0.2, whose text changed; its locators did not).**
- Stacks, Injectives, tag 079P is at `8042e600` line 883, p. 19 ("Theorem 12.6" in the chapter PDF, 19.12.6 in the book). For a Grothendieck abelian category it gives a functorial quasi-isomorphism into a K-injective complex with injective terms that is termwise a monomorphism. This is the README's statement.
- Stacks, Cohomology on Sites, Lemma 21.17.11 (tag 06YS) is at `f1af633f` line 1342, p. 31. On a ringed site every complex has a termwise surjective quasi-isomorphism from a K-flat complex of flat modules, as the README says.
- §21.19 (tag 07A5) is at line 1605, pp. 36–37. It makes `Mod(O)` Grothendieck abelian with the generator `⊕_{U∈Ob(C)} j_{U!}O_U`, a sum indexed by the objects of the site. This agrees with Mathlib's instance being for small sites and with the transport for essentially small ones.
- The other seeded targets (0.1, 0.3, 0.4) are not touched by the diff. r8 verified their locators, and that verification is carried.

**Ownership and citations.** The diff adds no cross-roadmap citation. The new transport target has no other owner:
- `roadmaps grep` for "essentially small … module sheaves … Grothendieck", in both word orders, matches nothing on main or at any open head.
- `pushforwardPushforwardEquivalence` occurs elsewhere only in RealAnalyticGeometry (main `README.md:743`, `:791`). There it moves analytic module sheaves across `Over U ≌ Opens U`, a different object.

The overlaps tool lists no dropped or revision-only ids. #1187's copy of this folder's `Suggested.lean` equals main's (`roadmaps show --pr 1187`, a diff of the header line only), so #1187 needs no stated order. #1330 is R03. The 19 "found nowhere" names of `scratch/citations.md` are the same as at r9 and r9 resolved them: 8 declarations of this `Suggested.lean` and 11 supplier targets on main.

**Headline theorems.** The diff does not change the headline set or any statement.
- The statable headlines stated in `Suggested.lean`: `hasKInjectiveResolutions` with its instance; `locallySmall_localization_quasiIso` with the `hasDerivedCategory` instance; `Scheme.smallEtaleTopology_W_isMonoidal` with the two étale instances; `isInvertible_iff_isUnit_toSkeleton`; `isRegular_of_frobenius_flat`; `perfect_projectiveDimension_le`; `perfect_torDimension_le_two_mul_dim`; `valuationSaturated_finite_free`; `isDerivedComplete_iff_derivedCompleteness`; `isAdicComplete_iff_derivedComplete_separated`; `derivedCompleteModules_weakSerre`.
- The unstatable families are named in the module docstring (`:41`–`:68`).
- r9's one-tactic probes on the only declaration whose docstring changed still apply (4 of 4 fail): it is not padding.

**Adversarial computations.** Carried rows: the 40 rows of r8 for untouched statements, from "0.1 local smallness" to "E2:towers.2 (native)" (r8, *Adversarial computations*), and r9's 11 rows (r9, *Adversarial computations*). The prose column of r9's row "`IsGrothendieckAbelian.instHasKInjectiveResolutions`" is replaced by rows 1, 2 and 13 below. The other rows are new, for the changed passages.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `README:460`, small sites | `D : Type u`, `SmallCategory D`, `O : Sheaf J RingCat.{u}` | Mathlib's instance needs exactly these; `inferInstance` finds `HasKInjectiveResolutions (SheafOfModules.{u} O)` | Pass |
| 2 | `README:460`, "Mathlib has no such instance" | `Category.{u} D`, `EssentiallySmall.{u} D` | `infer_instance` for `IsGrothendieckAbelian.{u} (SheafOfModules.{u} O)` fails, even with sheafification supplied | Pass (claim true) |
| 3 | transport: small model and topology | `equivSmallModel D`, `inverse.inducedTopology J` | `SmallCategory (SmallModel.{u} D)` and continuity of both halves found | Pass |
| 4 | transport: "make it abelian" | the two lemmas as local instances | `Abelian (SheafOfModules.{u} O)` found; without them it is not | Pass |
| 5 | transport: the equivalence | `φ = whiskerRight (op unitInv) O.obj`, `ψ = 𝟙` | H₁ at Y: `O.map (G.map (ε_Y)).op = O.map (η⁻¹_{G Y}).op`, true by `unitInv_app_inverse`; H₂ at X: `O.map ((η_X ≫ η⁻¹_X).op) = O.map 𝟙 = 𝟙` | Pass |
| 6 | transport: `of_equivalence` | step 5 | `IsGrothendieckAbelian.{u}` on `SheafOfModules.{u} O`; `HasKInjectiveResolutions` found | Pass |
| 7 | `README:472`, nonempty X | `X = Spec k`, `I : Type u` | `∐_I X → X` étale; fibre over the point is `∐_I Spec k`, with \|I\| points; `I ↦` iso class is injective on `Cardinal.{u}`, which is not `u`-small, so `X.Etale` is not `EssentiallySmall.{u}` | Pass |
| 8 | `README:472`, degenerate case | `X = ∅` | every étale X-scheme is empty; `X.Etale` has one iso class and is essentially small, so "nonempty" is needed, and it is stated | Pass |
| 9 | `README:472`, last clause | `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)` | `IsGrothendieckAbelian.{u}` by Mathlib `AffineEtale.lean:149`; `HasKInjectiveResolutions` found | Pass |
| 10 | `README:149`, `rlp_…_iff` | `#check` | RHS `degreewiseEpiWithInjectiveKernel p ∧ (kernel p).IsKInjective`; only `[Abelian C]`, `CochainComplex C ℤ` unbounded | matches the prose; Pass |
| 11 | `README:149`, `…_of_isZero` | `#check`; `I = 0` | `IsZero Z → (rlp p ↔ (∀ n, Injective (I.X n)) ∧ I.IsKInjective)`; for `I = 0` both sides hold | Pass |
| 12 | `README:638`, factorization of `K → 0` | general K; `K = 0` | `K → I` a monomorphic quasi-isomorphism and `I → 0` a fibration give, by row 11, I K-injective with injective terms, a resolution as in 0.2; `K = 0`: `0 → 0 → 0` | Pass |
| 13 | `Suggested.lean:96`–`100` | elaborated type against the docstring | type unchanged, no `SmallCategory` on `C`; the docstring's `SmallCategory C` names the site | statement Pass; docstring R01 |
| 14 | `README:476`, *Needs:* | the 7 names | all resolve at the pins; `of_equivalence` is absent from the contract | Pass; contract R02 |

## Not verifiable

- none. The three Stacks locators of Section 0.2 were read in the cache (`8042e600`, `f1af633f`). The other sampled locators are unchanged since r8, which read them.

## Source issues

- **Misprint** in Stacks, Cohomology on Sites at §21.19, tag 07A5, p. 37 (`f1af633f` line 1617): the source writes "trianguated category" in item (1); it should be "triangulated category"; affects nothing.
