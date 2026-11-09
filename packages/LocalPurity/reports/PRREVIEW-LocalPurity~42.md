# Review of LocalPurity (pull request #1808 at a96d197)

**Verdict:** needs changes

This is a full review. The folder changed by 773 lines since `c9403e2`. Pins are unchanged: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

This head repairs eight of the nine previous findings (see "Previous findings" at the end). The README now rests on Tau Ceti's carriers. `Suggested.lean` states four headlines on those carriers and elaborates with `sorry` as the only warning. The one blocking defect left is in §1.3: its proof routes use four Stacks results that nothing owns (R01). The push gate still fails on the two edits outside the declared folders (R02).

## R01 (P2) — §1.3's proof routes rest on four Stacks results that no target, supplier or pin owns

**Location.** `TauCetiRoadmap/LocalPurity/README.md:281-287`: "specialize formal module gluing along `A → Â` … (05ER); its monoidal and finiteness preservation (05EU) … The target here is the finite-morphism specialization, not a second general gluing theory. For *completion_fullyFaithful_of_localCohomology*, use … (0EII) and … (0EKP)".

**Claim.** The routes of *finite_extend_of_completion* (0BLH) and *completion_fullyFaithful_of_localCohomology* (0EKS) consist of these four results:
- formal glueing of module categories (More on Algebra, Proposition 15.91.16, 05ER);
- its preservation of finiteness and tensor structure (Remark 15.91.20, 05EU);
- the formal-sections comparison (Algebraic and Formal Geometry, Lemma 52.12.7, 0EII);
- the completion criterion (Lemma 52.15.1, 0EKP).

None of the four is a target here, and none is in the Scope list at lines 39–50 or in the Stacks-alignment table. No supplier owns them. The phrase "not a second general gluing theory" points at a first theory that exists nowhere. Stacks proves 0EKS in two lines from 0EII and 0EKP (stacks-0EKS lines 2200–2202), so without them that target is hollow.

**Witness.** `roadmaps grep '05ER|0EII|0EKP'` over main and the 466 open heads finds these tags only in the LocalPurity README (main, #1807, #1808, #1854). The Tau Ceti pin has only the torsion input of formal glueing, 15.91.2–15.91.3, in `TauCeti/RingTheory/FormalGlueing/Torsion.lean`. SchemeAndStackFoundations §4.8 (README 5576–5640) has completion, `CoherentFormalModule` and 087W, but not 0EII or 0EKP.

**Repair.**
1. In §1.3, state three README-only targets, with locators:
   - *formalGlueing_completion* (05ER with 05EU). For `A` Noetherian, `𝔪 = (f_1, …, f_t)` and `A → Â` (flat by `AdicCompletion.flat_of_isNoetherian`, with `A/𝔪 ≅ Â/𝔪Â`), modules are equivalent to glueing data: an `Â`-module, `A_{f_i}`-modules and compatible isomorphisms. The equivalence preserves finite modules and tensor products, so it carries finite algebras to finite algebras. It builds on Tau Ceti's `FormalGlueing/Torsion.lean`.
   - *formalSections_of_localCohomology* (0EII). Let `A` be Noetherian and `f`-adically complete, `f ∈ 𝔞`, `M` finite, with `H¹_𝔞(M)` and `H²_𝔞(M)` killed by a power of `f`. Then `Γ(U, M~) → lim Γ(U, M~/fⁿ)` is bijective, where `U = Spec A ∖ V(𝔞)`. Its route uses SchemeAndStackFoundations §2.7 `localCohomology_module_comparison` for `H¹(U, F) ≅ H²_𝔞(M)`.
   - *completion_fullyFaithful_of_sections* (0EKP, (1)⇒(4)). For `X` Noetherian and quasi-affine with `Γ(X, 𝒪_X) ≅ lim Γ(Y_n, 𝒪_{Y_n})`, completion is fully faithful on finite locally free modules.
2. Add all three to Scope, to the alignment table and to §1.3's *Needs:*.
3. Delete "not a second general gluing theory".

After this, the grep above finds an owner for each of the four tags.

## R02 (P3) — Gate `outside-folder`: two edits outside the declared folders (previous R09, not repaired)

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md:331`: "`LFunctions` consumes this package and supplies its own character-specific continuation".
- `TauCetiRoadmap/SymplecticGeometry/README.md:77`: "adapters consumed by HeegaardFloer and consumed by DGFloer".

**Claim.** The pull request edits two roadmap folders that are neither in its title nor among the folders named as its own.

**Witness.** `git diff --stat origin/main...HEAD` lists exactly these two files, one line each, once the 15 declared folders are excluded. I reran the gate at `a96d197`: `outside-folder=28 … FAIL`. Twenty-six of those paths are in declared folders; these two are not. Every other check is 0.

**Repair.** Revert both lines on this branch, or name both folders in the description so that each gets its own review.

## R03 (P3) — No stated order against #1854, which rewrites this folder differently

**Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Claim.** Pull request #1854, by the same author, also changes `TauCetiRoadmap/LocalPurity/README.md` and `Suggested.lean`, and its changes differ from this head's:
- Its README has 594 lines and keeps a §1.1, a Provenance section and per-layer `### Examples`/`### Dependencies`. `diff` against this head is 520 lines.
- Its `Suggested.lean` differs in the module docstring.

The overlap scan reports that the two heads conflict in both files. The description does not mention #1854.

**Witness.** `roadmaps show LocalPurity --pr 1854` and `scratch/overlaps.md`: "#1808 and #1854 conflict in … `TauCetiRoadmap/LocalPurity/README.md`, `TauCetiRoadmap/LocalPurity/Suggested.lean`".

**Repair.** Say in the merge-order paragraph which of #1808 and #1854 is rebased on the other. Carry a single LocalPurity version: either drop the folder from one of them or make the two copies identical.

## R04 (P3) — *Needs:* lines miss inputs that the routes use; two supplier entries are consumed by nothing

**Location.** README §2.2 *Needs:* (lines 378–381), §2.2 text (lines 351–356 and 374–376), §1.4 *Needs:* (line 307), §1.2 *Needs:* (lines 243–248), Mathlib contract (lines 121, 127).

**Claim and witness.**
1. **Gluing schemes is not listed.** Two §2.2 routes glue schemes along an open cover: the extensions in `finiteEtale_extend_of_regular_codimTwo` ("the local extensions glue"), and the glueing step of *spread_from_localScheme* (Stacks glues relative schemes, stacks-0BQ5 lines 2600–2602). Full faithfulness supplies the transition isomorphisms and the cocycle condition. The glued scheme itself comes from Mathlib `Scheme.GlueData` (`Mathlib/AlgebraicGeometry/Gluing.lean:91`). §2.2 lists only `Scheme.Cover.glueMorphisms`.
2. **Separatedness has no supplier.** *spread_from_localScheme* claims that "separated" descends. The supplier list of SchemeAndStackFoundations §0.9 `finite_presentation_limits` (its README 913–918) does not include separated. Stacks proves that case by Limits, Lemma 32.8.6 (stacks-0BQ5 line 2640).
3. **The two depths need a bridge.** §1.4 uses SchemeAndStackFoundations §2.7 `depth_localCohomology_vanishing`. That result is stated for §0.17's sequence depth `depth_I M` (its README 3698–3700 and 1277–1280). Convention 4 instead fixes Mathlib's Ext-defined `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`). The comparison between the two is §0.17's `depth_eq_iff_ext`.
4. **Two route inputs of §1.2 are not listed.** The route uses "`V` is normal" and the cover of `U` by `D(f)`, `f ∈ 𝔪`. Both are pinned but absent from the *Needs:*: `TauCeti.Algebra.Etale.isIntegrallyClosed_localization_atPrime_of_isIntegrallyClosed` (`RingTheory/Etale/Normal.lean:90`) and `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen` (`AlgebraicGeometry/PuncturedSpectrum.lean:81`).
5. **Two Mathlib entries are unused.** `Algebra.HasGoingDown` and `IsRegularLocalRing.of_isRegularRing_of_isLocalRing` are consumed by no target; grep finds each only at line 121 or 127.

**Repair.**
- Add `Scheme.GlueData` to §2.2's *Needs:* and to the Mathlib contract.
- Either cite Limits, Lemma 32.8.6 inside *spread_from_localScheme*, or drop "separated". Neither consumer uses it: 0EY7 and AbhyankarLemma §2.1 need only finite and étale.
- Add SchemeAndStackFoundations §0.17 (`depth_eq_iff_ext`) to §1.4's *Needs:*.
- Add the two Tau Ceti names to §1.2's *Needs:*.
- Delete the two unused Mathlib entries.

## R05 (P3) — The layers have no `### Examples` or `### Dependencies`, and §§1.3–1.4 have no example

**Location.** Layer 1 ends at line 307 and Layer 2 at line 391, each without the two closing subsections. §§1.3–1.4 state nine targets with no Check or example.

**Claim.** The house shape ends every layer with `### Examples` and `### Dependencies`. The sibling copy of this folder in #1854 has both. Neither hypothesis of the local Lefschetz part (henselian pair, local-cohomology annihilation) is illustrated by any instance.

**Witness.** `grep -c '^### Examples'` and `grep -c '^### Dependencies'` both return 0 on this README.

**Repair.**
- Under Layer 1 `### Examples`, add a positive and a negative instance:
  - `A = k⟦x, y, z⟧`, `f = z`. Then depth is 3, so `H¹_𝔪 = H²_𝔪 = 0`, and `(A, (z))` is henselian because `A` is complete. So 0BLJ and 0BLM apply, and every cover of `U_0` extends by 0BMA (1) in dimension two.
  - `A = k⟦x, y⟧`, `f = x`. Here `x^n · x^{−n−1}y^{−1} = x^{−1}y^{−1} ≠ 0` in `H²_𝔪(A)`, so no power of `x` kills it and 0BM6's hypothesis fails in depth 2.
- Under Layer 2 `### Examples`, point to the existing Checks.
- Under each `### Dependencies`, collect that layer's *Needs:* items.

## R06 (P3) — The SGA 1 reference describes Corollaire 3.2 as unproved there

**Location.** README 437–440: "Théorème 3.1 and Corollaire 3.2 (Zariski–Nagata purity, stated there without proof; …)".

**Claim.** Théorème 3.1 is recalled without proof. Corollaire 3.2 is deduced from it, and SGA 1 proves 3.2 directly when `dim A = 2`: depth `≥ 2` gives freeness, and then the discriminant criterion applies. That is exactly the dimension-two route this roadmap takes from Tau Ceti.

**Witness.** sga1 lines 8358–8359 (3.1 "sans démonstration") and lines 8380–8388 (the proof of 3.2 for `dim A = 2`), printed p. 212.

**Repair.** Write instead: "Théorème 3.1, recalled without proof, and Corollaire 3.2, its local form, proved there when `dim A = 2` by freeness and the discriminant".

## Previous findings (review of `c9403e2`)

- **R01 — repaired.** `Suggested.lean:34-35` reads "`[IsRegularLocalRing A] (hd : 2 ≤ ringKrullDim A) : TauCeti.IsLocalRing.PurityHolds A`". The file contains no `def`; the old `finiteEtale`, `FEt`, `FEt.pullback`, `puncturedSpectrum` and `PurityHolds` are gone, and it imports `TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`.
- **R02 — repaired.**
  - README 10–11: "It is built on Tau Ceti's finite étale schemes, punctured spectra and notion of purity, and on Tau Ceti's dimension-two case of 0BMA".
  - Line 214: "There is no Layer 0 and no §1.1".
  - Every item of the old table is now in the Tau Ceti contract (lines 134–200).
  - The Provenance section and the "not at this roadmap's pin" sentence are gone.
- **R03 — repaired.** §2.1 cites `TauCeti.isRegularRing_of_isRegularLocalRing`, `TauCeti.IsRegularRing.isIntegrallyClosed` and `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` (lines 319–331). "4.13" occurs nowhere in the folder.
- **R04 — repaired.** Miracle flatness is Tau Ceti's (lines 71–72 and 186–188). The ModularCurves sentence is deleted.
- **R05 — repaired.** The four padding theorems are deleted.
- **R06 — repaired.** The gate reports `readme-ids-missing=0`. 0BLS is stated with its hypotheses at lines 296–299. The README-only names are italic.
- **R07 — repaired.** `Suggested.lean:34,45` declare `IsLocalRing.purityHolds_of_isRegularLocalRing` and `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` in `TauCetiRoadmap.LocalPurity`. Table rows 413–414 match.
- **R08 — repaired.** `Suggested.lean:5` reads "…: target signatures". Lines 7–8 say this file is not the roadmap, and line 18 reads "No headline is unstatable."
- **R09 — not repaired.** The two outside-folder lines remain; see R02.

## Verified sound

**Gate, build and dependencies.**
- I reran the gate at `a96d197`. It fails only on `outside-folder` (R02). Every other field is 0, including `readme-ids-missing`, `sorry-data`, `set_option`, `imports`, `statement-hygiene`, `stray-files` and `depcheck`.
- `lake env lean` on `TauCetiRoadmap/LocalPurity/Suggested.lean` gives exactly four warnings, all `declaration uses 'sorry'`, at lines 34, 45, 58 and 69.
- Dependency check output: `depcheck: 239 roadmaps, 2325 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- LocalPurity and its one supplier, SchemeAndStackFoundations, are both on main. The consumer PurityForFlatCohomology is at line 218 of the merge order.

**Signatures.**
- I ran `#check @` on all four declarations. The results match `scratch/signatures.md` and the README statements:
  - regular local with `2 ≤ ringKrullDim`;
  - `B` finite, torsion free, normal at every prime and étale off `𝔪`;
  - `[IsNoetherian X]`;
  - `[IsLocallyNoetherian X]` with regular stalks of dimension `≥ 2`.
- The file has no `variable` block, so no binder can be lost.
- `B : Type u` matches `A`'s universe. This loses nothing, since a finite `A`-algebra has a model in that universe.

**Headlines and padding.**
- The README names four end theorems (lines 33–35). All four are stated, and the docstring correctly says none is unstatable.
- One-tactic probe on a scratch copy: `first | simp | rfl | infer_instance | trivial` fails on all four, and `aesop` fails on clause (2). Nothing is padding.
- The same probe confirms §2.1's dimension-two reduction: `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two hd (fun q _ => hnormal q) (fun q _ hq => (hpunct q hq).isUnramifiedAt)` elaborates.
- I counted 0BLM and *finiteNormalEquiv* as route results, as the Summary presents them, not as headlines.

**Library declarations opened at the pins (66).**
- 43 Tau Ceti names via `#check @`. File and line for the ones the statements depend on:
  - `FiniteEtaleScheme` (`FiniteEtale/Basic.lean:66`), `pullback` (`Fiber.lean:51`), `equivOver` (`MorphismProperty.lean:39`);
  - `puncturedSpectrum` (`PuncturedSpectrum.lean:52`), `PurityHolds` (`FiniteEtale/PuncturedSpectrum.lean:63`), `restrictPunctured_faithful_iff` (`:92`);
  - `isIso_appTop_pullback_fst_puncturedSpectrum` (`Sections.lean:190`), `extends_iff_sections_finiteEtale` (`Extension.lean:111`);
  - `finiteNormalPuncturedEtale` (`FiniteNormal.lean:71`), `restrictPuncturedSpec.fullyFaithful` (`:204`), `fullyFaithfulPullbackιOfTwoLeDepth` (`FullyFaithful.lean:105`);
  - `IsRegularLocalRing.isDomain` (instance, `RegularLocalRing/Basic.lean:164`), `quotient_span_singleton` (`:188`), `isRegularRing_of_isRegularLocalRing` (instance, `ProjectiveDimension.lean:441`), `IsRegularRing.isIntegrallyClosed` (instance, `Normal.lean:55`), `depth_eq_ringKrullDim` (`CohenMacaulay.lean:110`);
  - `IsLocalRing.two_le_depth_of_isIntegrallyClosed` (`CohenMacaulay/Normal.lean:144`), `etale_of_finiteNormal_of_ringKrullDim_eq_two` (`RegularLocalRing/Purity.lean:75`), the four `…_prod_residueField` lemmas (`ProdResidueField.lean:82,133,147,153`).
  - Every README description of hypotheses matches the elaborated type.
- 21 Mathlib names via `#check @`, including `IsFinite.toIsAffineHom`, `IsRegularLocalRing` (`RegularLocalRing/Defs.lean:52`: Noetherian local with `spanFinrank 𝔪 = ringKrullDim`), `IsLocalRing.depth` (`Depth/Basic.lean:78`, Ext-defined) and `IsIntegralClosure.finite` (`DedekindDomain/IntegralClosure.lean:175`).
- Also opened: Mathlib `Scheme.GlueData` (`Gluing.lean:91`) and `ZariskisMainTheorem.lean`, which supplies the Zariski main theorem step in Stacks' proof of 0BLI; Tau Ceti `FormalGlueing/Torsion.lean` and `Etale/Normal.lean`.

**Cross-roadmap citations resolved (13).**
- SchemeAndStackFoundations at this head: §0.9 `finite_presentation_limits` (902, 913), §0.14 *henselian_finiteEtale_equivalence* (1205, 1217), §2.7 `localCohomology_module_comparison` and `depth_localCohomology_vanishing` (3685, 3698), §4.7 (5532), §4.8 `CoherentFormalModule` (5586).
- The same sections on main: 848, 1068, 3482, 5339, 5383.
- Consumers:
  - PurityOfBranchLocus README 56–58 at this head: `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`.
  - AbhyankarLemma README 55–58 and 265–268: the prefixed `IsLocalRing.` name, *spread_from_localScheme* and both extension theorems.
  - PurityForFlatCohomology README 93–95 and 499–503 at the #1840 head.
  - CrystallineCohomology (#857), lines 440–445.

  All of them resolve to names this head declares or states.
- No id this pull request drops (§§0.1, 0.2, 1.1, `FEt`, `PurityHolds`, …) is cited anywhere on main or at any open head.
- For the SchemeAndStackFoundations review, not a finding here: its README 5913–5914 and 7694–7696 still list LocalPurity §2.1 as a consumer of §4.13, but this head no longer cites §4.13.

**Ownership and duplication.**
- No other roadmap on main or at any of the 466 open heads states 0BM9 (essential surjectivity), 0BLH–0BLM, 0BMA, 0BQ5/0EY3 or 0EY7 as its own. PurityOfBranchLocus, AbhyankarLemma, PurityForFlatCohomology and CrystallineCohomology all cite this roadmap. DirectSummandsAndBigCohenMacaulay (#1735) has no punctured-spectrum or cover-extension targets.
- None of the four Lean names is declared in any other `Suggested.lean`; it occurs only in LocalPurity's copies at #1807, #1808 and #1854.
- #1807's copy is ordered before this pull request in the description. #1854's copy is not ordered (R03).

**Sources (seeded sample §§1.2, 1.3, 1.4, 2.1, 2.2, and every other locator in those sections).** In each case I checked the number, page, hypotheses and conclusion against the text.
- stacks-0BMA:
  - 0BLF line 2245, 0BLH 2266, 0BLI 2283 (p. 49), 0BM6 2342 (p. 50), 0BLJ 2351, 0BM7 2357;
  - 0BM8 2366, 0BLK 2380, 0BM9 2391 (p. 51), 0BLL 2421 (p. 52), 0BLS 2449, 0BLM 2459;
  - 0BMA 2503 (p. 53), 0EY6 2567, 0EY7 2604 (p. 56), 0EL8 2028 (p. 43).
- stacks-0EKS: 0EII line 1923 (p. 41), 0EKP 2094 (p. 45), 0EKS 2193 (p. 48).
- stacks-0BQ5: 0BQ5 line 2571 (p. 54) and 0EY3 2627.
- stacks-09ZL: 09ZL line 1758 (p. 38).
- Online Stacks tag pages: 05ER is Proposition 15.91.16 (flat `R → S` with `R/I ≅ S/IS`, `I = (f_1, …, f_t)`), and 05EU is Remark 15.91.20.
- sga2, Exposé X: Définitions 3.1–3.2 at lines 3377 and 3382, Proposition 3.3 at 3386 and Théorème 3.4 (i) at 3390 (printed p. 94).
- sga1, Exposé X: Théorème 3.1 at line 8359, Corollaire 3.2 at 8370 (printed p. 212) and Corollaire 3.3 at 8394 (printed p. 213).
- All of these agree with the README, except as R06 says. The README flags no locator as unverified.

**Adversarial pass.** All rows were computed for this review.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0BMA (1) `IsLocalRing.purityHolds_of_isRegularLocalRing` | `d=2` `k⟦x,y⟧`; `d=1` `ℤ_(p)` with `V = Spec ℚ(√p)`; `d=0` a field | `d=2`: Tau Ceti base case plus 0BM9, so every cover extends. `d=1`: the only normal candidate is `ℤ_(p)[√p]`, disc `4p` (`8` for `p=2`), not a unit, so `V` does not extend. `d=0`: `U=∅`, purity holds trivially (excluded by `hd`) | true; `hd` necessary | — |
| 0BMA (2) `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` | `B=0`; `A×κ`; `A[z]/(z²−x)` over `k⟦x,y⟧`, char ≠ 2; `A[z]/(z²−u)`, `u` a non-square unit; `d=1` `ℤ_(p)[√p]` | `B=0`: hypotheses vacuous, étale. `A×κ`: `x·(0,1)=0`, not torsion free, excluded. `z²−x`: disc `4x`, a nonunit at the height-one prime `(x) ≠ 𝔪`, so `hpunct` fails and the conclusion fails, consistently. `z²−u`: disc `4u` a unit, étale. `d=1`: all hypotheses hold, disc `4p` is not a unit, `B` is not étale | true; torsion freeness and `hd` necessary | — |
| §2.1 reduction for `d=2` | Lean probe | Tau Ceti lemma plus `IsEtaleAt.isUnramifiedAt` closes it | claim correct | — |
| 0BM9 essential surjectivity / *finiteNormalEquiv* | `k⟦x,y⟧` with `V=U⊔U`, `V=∅`, `B=A×κ`; `d=1` | `Γ(U⊔U)=A×A` lies in the category and restricts to `U⊔U`. `V=∅` gives `0`. `A×κ` restricts to `U` with `Γ(U)=A ≠ A×κ`, so it is outside the image without torsion freeness. `d=1`: `Γ = ℚ(√p)`, not finite | true as corrected | — |
| Convention 5, "removes exactly the closed-point factors" | `B=∏B_i` normal domains; a factor with kernel `p` | `0 ≠ p ≠ 𝔪` would make `A_p → (B_i)_q` flat, hence injective, which is impossible. So each kernel is `0` or `𝔪`, and a kernel-`𝔪` factor is a field over `κ` | true | — |
| 0BLH | `A=k[x,y]_{(x,y)}`, `V=U`, `Y′=X′`; `V=∅` | `Y=X`. `Y′=∅` forces `Y=∅`, since `X′→X` is surjective | matches tag | route: R01 |
| 0BLL | `k[x,y]_{(x,y)}`; `(k[x²,xy,y²])_{(0)}` with the `μ₂`-cover | Both sides hold. Both sides fail: fibre dimension `3 ≠ 2` over `A` and over `Â` | consistent | — |
| 0BLI, 0BM6, 0BLJ | `k⟦x,y,z⟧`, `f=z`; `k⟦x,y⟧`, `f=x` | Depth 3: `H¹_𝔪=H²_𝔪=0` and complete implies henselian, so the hypotheses hold. Depth 2: `x^n·x^{−n−1}y^{−1} ≠ 0` in `H²_𝔪`, so hypothesis (1) fails | match tags | R05 |
| 0EKS, 0EL8 | `k⟦x,y,z⟧`, `𝔞=𝔪`, `f=z` | `f`-adically complete, `H¹`, `H²` vanish: completion is fully faithful on finite locally free modules over `U` | match tags | route: R01 |
| 0BLS, 0BLM | `k⟦x,y,z⟧`, `f=z` | `V_0` extends by 0BMA (1) for `k⟦x,y⟧`, so `V` extends: the `d=3` step of §2.1 | consistent | R04.3 |
| *spread_from_localScheme* (0BQ5, 0EY3) | `S=Spec ℤ`, `U=Spec ℤ[1/p]`, `s=(p)` | `V=Spec ℚ`. `X′=U` and `Y=Spec ℤ_(p)` glue to `S` over `U′=S`. `U` is retrocompact | true | R04.1–2 |
| 0EY7 `finiteEtale_extend_of_purity` | `Spec ℤ_(p)`, `U={η}`; `𝔸²∖0`; `U=X`; `U=∅` | The hypothesis fails at the closed point and `ℚ(√p)` does not extend. At the origin, regular of dimension 2 gives purity, so covers extend. `U=X`: the hypothesis is vacuous and `pullback ⊤.ι` is an equivalence. `U=∅`: `FÉt_∅` has only `∅` | true; Noetherian as in Stacks | — |
| *restrictOpen_fullyFaithful_of_depth* | `𝔸²∖0`; `Spec k[x,y]/(xy)` minus origin | Depth 2: `Γ(U,𝒪)=k[x,y]`. Depth 1: `Γ(U,𝒪)=k[x^±]×k[y^±]` has 4 idempotents against 2 on `X`, so restriction is not full | true; depth needed | — |
| `finiteEtale_extend_of_regular_codimTwo` | `𝔸²∖0`; `𝔾_m ⊂ 𝔸¹` with `t ↦ t²`; `⊔_ℕ 𝔸²` minus origins | True. In dimension 1 the hypothesis fails and the Kummer cover does not extend. The non-quasi-compact case is affine-local, then glued | true; matches SGA 2 X 3.3 | R04.1 |
| Checks of §§1.2, 2.1, 2.2 | as written | `dim_k k[x,y]/(x²,xy,y²) = 3 ≠ 2`. `det[[2,0],[0,2p]] = 4p`. `Γ(U⊔U) = A×A`. The DVR cover is ramified | all correct | — |
| Lean against README generality (4) | `#check @` | as listed under Signatures | match | — |

## Not verifiable

- The tag pages for 05ER and 05EU are not in the sources cache. I read them on the open Stacks site. Their numbering agrees with the "Proposition 91.16" and "Remark 91.20" cited in stacks-0BMA lines 2270–2277.
- Ownership against open pull requests was checked through the roadmap index (466 heads) and the sibling checkouts this job provides.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says sections give an equivalence onto all finite normal `A`-algebras étale over `U`; it should require `B` torsion free over `A`, since `A × A/𝔪` is not in the essential image; affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal `B` étale over the punctured spectrum is étale; `A × A/𝔪` is a counterexample, so it should require `B` torsion free over `A`; affects a stated result and the proof's going-down step.
- **Misprint** in stacks-0BQ5 at Lemma 32.20.4 (0EY3), p. 54: the source takes `U ⊂ U′ ⊂ X` for the open containing `s`; it should be `U ⊂ U′ ⊂ S`, since `X` names the scheme over `U′`; affects nothing.
