# Review of EnhancedDerivedSheaves (pull request #1630 at 3e946b0)

**Verdict:** needs changes

Incremental re-review of the 56 changed lines since `ab8f6ff` (the head r8 read), at the unchanged pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (`lake-manifest.json`). In this report, `README:N` and `Suggested.lean:N` refer to the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`, and Tau Ceti and Mathlib paths are relative to the library roots at the pins. The repair of r8 R01 adds the headline as asked, and it is correct, elaborates, and is not padding. Its README sentence and the new instance docstring claim more than the instance gives (R01 below). Tau Ceti already has a lifting lemma about the same objects, and the README does not cite it (R02). The pull-request description is still unchanged (R03, carried from r8 R02).

## R01 (P2) — "every ringed site": the instance gives K-injective resolutions of module sheaves only on small sites

Location: `README:460` "since `SheafOfModules O` on a small site … is Grothendieck abelian (…), this gives `TauCeti.HasKInjectiveResolutions (SheafOfModules O)` for every ringed site, and `TauCeti.kInjectiveReplacement` becomes available there"; `Suggested.lean:96`–`99` "apply to sheaves of modules on every ringed site."

Claim: the new global instance `IsGrothendieckAbelian.instHasKInjectiveResolutions` gives K-injective resolutions, and Tau Ceti's replacement functor, for module sheaves on every ringed site.

Witness: Mathlib's instance (`CategoryTheory/Abelian/GrothendieckAxioms/SheafOfModules.lean:24`–`26`) needs `SmallCategory C` and `SheafOfModules.{u}` over `Sheaf J RingCat.{u}`. In a scratch copy, `inferInstance` proves `HasKInjectiveResolutions (SheafOfModules.{u} R)` on a small site but fails for `R : Sheaf X.smallEtaleTopology RingCat.{u}`.

Why the failure matters: `X.Etale : Type (u+1)` is essentially small but not small, and it is the site of the ringed site `(X_et, O)`. The scope of Section 0.2 (first sentence of `README:460`, and `README:33`) is essentially small ringed sites. On those the statement is true, but it needs the Grothendieck abelian structure of `SheafOfModules O` transported from a small model. Mathlib makes that transport for `Sheaf S.smallEtaleTopology A` (`AlgebraicGeometry/Sites/AffineEtale.lean:149`, by `IsGrothendieckAbelian.of_equivalence` along `AffineEtale.sheafEquiv`), but not for `SheafOfModules`. On sites that are not essentially small, neither the library nor a cited source supports the claim. No consumer inside this roadmap breaks: E1 works on small ringed sites (`README:607`), and the étale coefficient category `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)` does get the instance (checked, see *Verified sound*).

Repair:
- At `README:460`, replace "for every ringed site, and `TauCeti.kInjectiveReplacement` becomes available there" with: "for every small ringed site (`SmallCategory C`, `O : Sheaf J RingCat.{u}`, `SheafOfModules.{u} O`), where `TauCeti.kInjectiveReplacement` becomes available; on an essentially small ringed site that is not small, such as the small étale site of a scheme with a sheaf of rings, the Grothendieck abelian structure of `SheafOfModules O` is transported from a small model by Mathlib's `CategoryTheory.IsGrothendieckAbelian.of_equivalence`, as Mathlib does for `Sheaf X.smallEtaleTopology A`, and that transport is part of this target".
- At `Suggested.lean:99`, replace "on every ringed site" with "on every small ringed site".

Tested on the scratch copy: the repaired claim holds on a small site (the instance is found), and the étale ringed site, where the instance fails, becomes part of the target.

## R02 (P3) — Tau Ceti's characterization of the fibrant objects of the injective model is not cited

Location: `README:460` "What this target adds is, first, the existence of K-injective resolutions in every Grothendieck abelian category"; `README:637` "construct its combinatorial injective model on unbounded complexes, with quasi-isomorphisms as weak equivalences, monomorphisms as cofibrations and K-injective complexes of injectives as fibrant objects".

Claim: Section 0.2's list of what the library already has ("Objectwise existence is in the library on both sides") and the E1.2 target *replacementDGComparison* both treat the fibrant side of the unbounded injective model as unbuilt.

Witness: Tau Ceti `CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero` (`Algebra/Homology/ModelCategory/Injective.lean:162`), for any abelian C: the map `I → 0` lifts against every monomorphic quasi-isomorphism iff I is K-injective with injective terms. `rlp_monomorphisms_inf_quasiIso_iff` (`:150`) does the same for fibrations. Both elaborate at the pin.

What the pin lacks is the factorization; the file's header says so at `:20`–`26`. Mathlib's `CochainComplex.Plus.modelCategoryQuillen` (`Algebra/Homology/ModelCategory/Injective.lean`) covers bounded-below complexes only. So the new headline duplicates nothing (see the probes below), but the existing lifting lemmas belong in the supplier contract. `grep rlp_monomorphisms README.md` returns nothing.

Repair:
- At `README:460`, after the "first" clause, add: "Tau Ceti's `CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero` already recognizes the target of such a resolution: `I → 0` has the right lifting property against monomorphic quasi-isomorphisms exactly when I is a K-injective complex of injective objects. What is added is the existence of the resolution (Stacks' transfinite construction, or a factorization of `K → 0` in the injective model)."
- At `README:637`, cite `CochainComplex.rlp_monomorphisms_inf_quasiIso_iff` and `CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero` as the fibrations and fibrant objects of the model. The factorizations, the cardinal control and the comparison stay as the target.
- Add both names, with `TauCeti/Algebra/Homology/ModelCategory/Injective.lean`, to the From Tau Ceti contract (`README:149`) and to the *Needs:* lines `README:475` and `README:646`.

Tested: both names elaborate in a scratch file after `lake build TauCeti.Algebra.Homology.ModelCategory.Injective`.

## R03 (P3) — The description states no order with #1330 and still calls the change README-only

Location: the pull-request description (`scratch/pull-request.md`, data): "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)". Its revision line names only #1701.

Claim: the description tells the human approver how the change relates to main and to the other open pull requests.

Witness: #1330 (draft, at `856fe7a`) still changes `README.md` and `Suggested.lean` of this folder and conflicts with this head (`roadmaps overlaps EnhancedDerivedSheaves`). `git diff --stat origin/main...HEAD` shows 531 changed lines in `Suggested.lean`, including the new `TauCeti` import.

Carried from r8 R02 (r7 R08); no repair report marks it not actionable. "No importer is affected" is true: no module on main or at an open head imports `TauCetiRoadmap.EnhancedDerivedSheaves.Suggested` (`roadmaps grep --lean-only`).

Repair, in the description only:
- Add one sentence saying that #1330 is superseded by this head (its PurityOfBranchLocus supplier and the declaration it removes are already gone here) and is to be closed or rebased on it.
- Replace "README only; no Lean change" with a sentence saying that `Suggested.lean` is rewritten (module form, the Tau Ceti import, the headline set) and that no roadmap imports it.

No change to the folder.

## Previous findings

- R01 — repaired: `Suggested.lean:91` `theorem IsGrothendieckAbelian.hasKInjectiveResolutions : TauCeti.HasKInjectiveResolutions C`, instance at `:100`, import at `:4`, listed among the statable headlines at `:13`; named at `README:445`, `:456`, `:460`, `:491`, `:664`. The new `README:460` wording is R01 above.
- R02 — not repaired: the description still reads "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change …)" and its revision line names only #1701; carried as R03.

## Verified sound

**Gate, build, dependency check.** The worker's gate (`scratch/gate.md`) reports every counter zero, including `build=0` for the targeted build. An independent rerun on this head (`gate … --base origin/main`, exit 0) prints:

```text
gate EnhancedDerivedSheaves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check, run independently:

```text
depcheck: 244 roadmaps, 2484 edges, 0 problem(s)
```

It shows no UPWARD or CYCLE line. The diff outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'`) is empty. HEAD is `3e946b0551842ea9938afbd2f236c4919439e811` and the worktree is clean; nothing in it was changed.

**Elaboration and signatures.** I elaborated a scratch copy of `Suggested.lean` with `lake env lean` from the worktree. It gives 11 `declaration uses sorry` warnings, one per sorried theorem. The file has 19 declarations: 11 theorems, 4 instances, 3 defs and 1 class. The only error is my own `#check` of `TauCeti.KInjectiveDGCategory.dgNerveHomotopyCategoryEquiv`, a name the README cites in prose from a module the file does not import, as intended. I compared `#check @` of the four Section 0.1–0.2 declarations with the README:
- `hasKInjectiveResolutions` and `instHasKInjectiveResolutions` elaborate to `∀ (C : Type u_1) [Category.{u_2,u_1} C] [Abelian C] [IsGrothendieckAbelian.{u_3,u_2,u_1} C], TauCeti.HasKInjectiveResolutions C`, exactly the generality `README:460` states.
- The six "looks dropped" binders in `scratch/signatures.md` are universe-named instance arguments, and they are present in these types. The other 15 types are unchanged from r8.

The instance has a real body (the theorem) on a `Prop` class: it is not sorried data, and there is no diamond with Tau Ceti's `ModuleCat` instance.

**Instance resolution, by probe.** `inferInstance` finds `TauCeti.HasKInjectiveResolutions` for:
- `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)` (Mathlib `AffineEtale.lean:149` supplies `IsGrothendieckAbelian.{u}`);
- `SheafOfModules.{u} R` on a `SmallCategory` site.

There, `TauCeti.kInjectiveReplacement (SheafOfModules R)` elaborates with the file's `hasDerivedCategory`. Resolution fails for `SheafOfModules` over `X.smallEtaleTopology` (R01). The universe `w`, which occurs only in a hypothesis, does not block resolution.

**Padding probes.** On `TauCeti.HasKInjectiveResolutions C` for a generic Grothendieck abelian `C`, all four one-tactic probes fail: `infer_instance` and `exact inferInstance` (failed to synthesize), `simp` (no progress) and `aesop` (no progress). The headline is not padding.

**Duplication by object.** At the pins, the existence of K-injective resolutions of unbounded complexes is stated only by Tau Ceti's `ModuleCat.{max v u} R` instance (`Algebra/Homology/ModuleCat/KInjective.lean:180`). What the libraries also have:
- Mathlib's injective model `CochainComplex.Plus.modelCategoryQuillen` and `DerivabilityStructureInjectives.lean` are bounded below only.
- Tau Ceti's `ModelCategory/Injective.lean` has the lifting characterizations but no factorization (R02).
- Tau Ceti's `IsGrothendieckAbelian` uses are `ModuleCat/Sheaf/Universe.lean` and `Topology/Sheaves/Cohomology/Basic.lean`, neither about complexes.

**Pinned declarations opened:**
- Tau Ceti `HasKInjectiveResolutions` (`Algebra/Homology/DerivedCategory/KInjective.lean:92`): a `Prop` class with the one field `exists_quasiIso_isKInjective`.
- Tau Ceti `kInjectiveReplacement` (`:154`) and `kInjectiveReplacementAdjunction` (`:160`), under `[HasKInjectiveResolutions C] [HasDerivedCategory.{w} C]`.
- Tau Ceti `KInjectiveDGCategory.dgNerveHomotopyCategoryEquiv` (`CategoryTheory/DG/CochainComplex/KInjective.lean:180`).
- Mathlib `IsGrothendieckAbelian` (`CategoryTheory/Abelian/GrothendieckCategory/Basic.lean:70`) and `IsGrothendieckAbelian.of_equivalence` (`:81`).
- The Mathlib `SheafOfModules` instance (`GrothendieckAxioms/SheafOfModules.lean:24`–`26`) and `Sheaf.isGrothendieckAbelian_of_essentiallySmall` (`GrothendieckAxioms/Sheaf.lean:78`).
- Tau Ceti `rlp_monomorphisms_inf_quasiIso_iff` and `_of_isZero` (`ModelCategory/Injective.lean:150`, `:162`).

**Changed passages read in full:**
- `README:445`: the 0.1 route now names its input.
- `README:456` and `README:664`: the *Needs:* lines. E1.3 is on small ringed sites (`README:607`), where the instance fires.
- `README:460`: R01 and R02.
- `README:491`: "whose existence statement is …", accurate, since the Lean statement is the existence half of 079P.
- The module docstring (`Suggested.lean:13`–`16`, `:37`–`39`; the deleted "statement mentions no object" sentence is gone everywhere: `grep` returns nothing).
- The two new declarations.

**Sources.** Stacks, Injectives, tag 079P is at `8042e600` line 883, p. 19. It is printed "Theorem 12.6" in the chapter PDF, which is Theorem 19.12.6 of the book as the README cites. It states, for a Grothendieck abelian category, a functorial quasi-isomorphism into a K-injective complex with injective terms that is termwise a monomorphism. This is the README's statement, of which the Lean statement is the existence part. The other seeded targets (0.1 local smallness, 0.3, 0.4) have unchanged text and locators since r8, which verified them; that verification is carried.

**Cross-roadmap citations and ownership.** The 19 "found nowhere" names of `scratch/citations.md` are 8 declarations of this `Suggested.lean`, which the resolver does not scan, including the two new ones. The other 11 are supplier targets, re-resolved on main at `3b3f7ef`:
- `DerivedDeRham.*` (7 names) in DerivedModuleAlgebra;
- `IsReplete.derived_limits`, `IsReplete.derivedCategory_leftComplete` and `Sheaf.derivedPushforward` in SchemeAndStackFoundations;
- `Almost.Algebra.isUnramified_iff_exists_idempotent` in PerfectoidSpaces.

Ownership of the new headline:
- `HasKInjectiveResolutions` occurs in no other roadmap on main or at an open head (`roadmaps grep`).
- DerivedModuleAlgebra §0.I.1 (main `README.md:557`) owns only the module case.
- SmoothRepresentationsOfLocalGroups (open head, `README.md:1700`–`1710`) cites EnhancedDerivedSheaves E1.2 for the generic Grothendieck abelian replacement, and the heading `### E1.2 Supplied replacements and their dg comparison` exists at `README:633`.
- ComplexComparisonPartII cites 079P only as a source.

This roadmap is the owner. The overlaps tool lists no dropped or revision-only ids. #1187's copy of this folder's `Suggested.lean` is main's, unchanged (`roadmaps show --pr 1187`), so it needs no order. #1330: R03. The closest-vocabulary leads are as in r8.

**Adversarial computations.** New rows are for the changed statements. The 40 rows of r8 for untouched statements stand, from "0.1 local smallness" to "E2:towers.2 (native)" (r8, *Adversarial computations*). Its row "0.2 K-injective resolutions (R01)" is replaced by the rows below.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `IsGrothendieckAbelian.hasKInjectiveResolutions` | the zero category | every complex is `0`; `id : 0 ⟶ 0` is a quasi-isomorphism into a K-injective complex: hypothesis and conclusion both hold | Pass |
| same | `ModuleCat.{u} R`, `IsGrothendieckAbelian.{u}` | conclusion agrees with Tau Ceti's instance for `ModuleCat.{max v u} R` (`ModuleCat/KInjective.lean:180`); both `Prop`, no diamond | Pass |
| same | `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)`, Hom types in `Type (u+1)` | `IsGrothendieckAbelian.{u}` (Mathlib); instance found; the conclusion has no universe, so the `u`/`u+1` gap is harmless | Pass |
| same, generality | `README:460` against the elaborated type | README: `C : Type u`, `Category.{v}`, `Abelian`, `IsGrothendieckAbelian.{w}`; Lean: the same three binders with three universes | Pass |
| same, source | Stacks 079P, line 883 | source: functorial, termwise mono, injective terms, K-injective; Lean: existence of a quasi-isomorphism into a K-injective complex; README records the extra properties as the source's | Pass |
| same, padding | `infer_instance`, `exact inferInstance`, `simp`, `aesop` | 4 of 4 fail | not padding |
| same, duplication | Mathlib `Plus.modelCategoryQuillen`, Tau Ceti `rlp_…_of_isZero` | bounded below only; recognition of fibrant objects without existence | no duplicate; citation R02 |
| `IsGrothendieckAbelian.instHasKInjectiveResolutions` | étale `ModuleCat` sheaves; `SheafOfModules.{u}` on a small site; `SheafOfModules` over `X.smallEtaleTopology` | found; found, and `kInjectiveReplacement` elaborates; not found | declaration Pass; prose R01 |
| 0.1 route (`README:445`) through the new theorem | `ModuleCat.{u} R`; the zero category | `Hom_D(K, L) ≅ Hom_K(K, I(L))` by `Qh_map_bijective`, a quotient of a subtype of `∏_{n∈ℤ} Hom(K^n, I^n)`, in `Type u`; zero category: `*` | Pass; Lean order `:91` before `:109`, no cycle |
| E1.3 *Needs* (`README:664`) | small ringed site of E1 (`README:607`) | `HasKInjectiveResolutions (SheafOfModules.{u} R)` found | Pass |
| 0.2 étale paragraph (`README:491`) | `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)` | instance found; the Lean statement is the existence half of 079P, as the sentence says | Pass |

## Not verifiable

- none. The one source the changed passages cite (Stacks 079P) is in the cache. The other sampled locators are unchanged since r8, which read them.

## Source issues

- none
