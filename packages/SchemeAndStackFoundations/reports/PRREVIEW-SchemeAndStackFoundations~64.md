# Review of SchemeAndStackFoundations (pull request #1276 at 3cc1013)

**Verdict:** needs changes

This is a full review of the folder at 3cc1013, with the previous review's findings checked first. The head repairs r61's R02, R05, R06, R07, R08, R09 and R10 and the README half of R01. It does not repair R03 (the pins) or R04 (the description), and the Lean half of R01 is blocked behind R03: `Suggested.lean` still declares the definitions that Tau Ceti builds at the pin the README names.

One finding is blocking (P2): R01. Three are P3.

## R01 (P2) — `Suggested.lean` duplicates seventeen Tau Ceti definitions and one theorem at the pin the README names; the head's manifest still pins a Tau Ceti without them

**Location.**

- `lake-manifest.json` at 3cc1013 pins Tau Ceti `358314d4` and Mathlib `f6090c70`; `README.md:378` and `:419` say "`1b1ccf4b`, the pin in `lake-manifest.json`" and "`2fd255d9`, the pin in `lake-manifest.json`". `origin/main` (01daf25) pins `2fd255d9`/`1b1ccf4b`.
- `Suggested.lean:70, 77, 121, 128, 150, 158, 165, 170, 262, 269, 277, 283, 549, 773, 778, 942, 1128, 1143, 1154` (the definitions in the table), `:699–729` (the Layer 3 degree strand).

**Claim.** Each definition is "the body of Tau Ceti's …" (its own docstring), and the README's "Already stated or built elsewhere" list and §§0.3–0.5, 0.10, 0.16–0.18, 0.20–0.21, 0.23, 0.27, 0.29–0.30, 1.3, 2.1, 2.3, 2.5–2.6, 2.9, 2.17, 3.3, 4.1, 4.11, 4.13 and 5.1 cite about 160 Tau Ceti declarations by file and line. All of them resolve at `2fd255d9` (I checked every one, see Verified sound). None of the files exists at `358314d4`, so the Lean file cannot import them at this head, and the README's pin sentence is false at this head.

**Witness.** `TauCeti/RingTheory/Japanese.lean:125` at `2fd255d9` is `class IsJapanese (R) [CommRing R] [IsDomain R] : Prop` with the field `finite_integralClosure_fractionRing (L : Type u) [Field L] … : Module.Finite R (integralClosure R L)`, the body of `Suggested.lean:121`. `TauCeti/AlgebraicGeometry/VectorBundle/Degree.lean:168` is `vectorBundleDegree_add_of_shortExact_of_isCurveOver`, the statement of `Suggested.lean:699` on `FixedRank` carriers with `[X.IsCurveOver k]` (integral, proper, dimension one) and DVR stalks at codimension-one points.

**Repair.** The merge of `origin/main` is a worker step; it is conflict-free in this folder's files. After it:

1. Replace the definitions of the table by Tau Ceti's and restate the theorems that mention them. I did this on a scratch copy, which elaborates against main's pins with `lake env lean` run from a checkout at `2fd255d9`/`1b1ccf4b`: exit 0, 46 `declaration uses sorry` warnings, no other diagnostic. Its changes, which the worker can copy:
   - imports added: `TauCeti.Algebra.Module.PseudoCoherent.Basic`, `TauCeti.AlgebraicGeometry.AlgebraicSpace.Basic`, `TauCeti.AlgebraicGeometry.Chow.Basic`, `TauCeti.AlgebraicGeometry.Modules.PseudoCoherent.Basic`, `TauCeti.AlgebraicGeometry.Morphisms.Thickening`, `TauCeti.AlgebraicGeometry.Scheme.Regular.Scheme`, `TauCeti.CategoryTheory.Limits.Replete`, `TauCeti.RingTheory.Japanese`, `TauCeti.RingTheory.Nagata`, `TauCeti.RingTheory.RegularLocalRing.GRing`, `TauCeti.RingTheory.RegularLocalRing.Locus`;
   - §0.5: delete both predicates; `isPseudoCoherent_iff_affineOpens : AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent F ↔ F.IsQuasicoherent ∧ ∀ U : X.affineOpens, TauCeti.Huber.IsPseudoCoherentOver Γ(X, U.1) Γ(F, U.1) ⊤`;
   - §0.20: delete `Ring.IsJapanese`, `Ring.IsNagata`; the two `of_complete_local` theorems conclude `TauCeti.Ring.IsJapanese A` and `TauCeti.Ring.IsNagata A`;
   - §0.21: delete `GeometricallyRegular`, `RegularAlgebraMap`, `regularLocus`, `IsGRing`; `IsJ2` uses `TauCeti.Excellence.regularLocus B`; `IsQuasiExcellentRing R := TauCeti.Excellence.IsGRing R ∧ IsJ2 R`; `isNagata` concludes `TauCeti.Ring.IsNagata R`;
   - Layer 1: delete `SchemePresheaf`, `RepresentableDiagonal`, `EtaleAtlas`, `IsAlgebraicSpace`; `open TauCeti.AlgebraicGeometry (SchemePresheaf)` and `open TauCeti.AlgebraicGeometry.Spaces (RepresentableDiagonal EtaleAtlas IsAlgebraicSpace)`; Tau Ceti's `EtaleAtlas a` has `F` and `U` implicit, so `EtaleLocal` and `artinBootstrap` read `EtaleAtlas a` and `EtaleAtlas b`;
   - §2.17: delete `IsReplete`; `isReplete_proetale : TauCeti.IsReplete (Sheaf (Scheme.ProEt.topology X) (Type u))`;
   - §4.1 and §4.13: delete `IsThickening`, `IsFirstOrderThickening`, `IsRegular`; `open TauCeti.AlgebraicGeometry (IsThickening IsFirstOrderThickening IsRegular)` in `namespace Formal`;
   - §5.1: delete `cyclesOfDimension`, `RatEquiv`, `ChowGroup` and the `AddCommGroup` instance; `CH_coprod` on `TauCeti.AlgebraicGeometry.Chow.cyclesOfDimension (∐ X) k` and `RatEquiv` with binders `[∀ i, IsLocallyNoetherian (X i)] [IsLocallyNoetherian (∐ X)]` (Tau Ceti's carriers are for locally Noetherian schemes; schemes locally of finite type over `κ` are such by Mathlib's `LocallyOfFiniteType.isLocallyNoetherian`, `Mathlib/AlgebraicGeometry/Noetherian.lean:254–262`); keep `coprodOver` and `coprod_locallyOfFiniteType`.
2. Layer 3, which the scratch copy does not touch: delete `Curve.isFiniteLocallyFreeOfRank`, `Curve.vectorBundleDegree` and `Curve.vectorBundleDegree_add_of_shortExact` (Tau Ceti's `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree`, `Degree.lean:82`, and `vectorBundleDegree_add_of_shortExact_of_isCurveOver`, `:168`, on `FixedRank X r`, `VectorBundle/FixedRank.lean:71`). Restate `vectorBundleDegree_pullback` and `cohomologyDim_one_eq_zero_of_degree_gt` on that degree (the rank-one case is `InvertibleSheaf.eulerDegree`, `Degree.lean:116`).
3. README: §0.5, §0.20, §0.21, §1.3, §2.17, §4.1, §4.13 and §5.1 say "`Suggested.lean` carries … with the bodies of Tau Ceti's predicates"; after the change each *Lean:* line lists only the theorems, on Tau Ceti's carriers. §3.3's *Lean:* line drops the three deleted names and says the two remaining theorems are on `FixedRank.vectorBundleDegree`. §5.1's *Lean:* line says `CH_coprod` is stated for locally Noetherian schemes. The pin sentences at `:378` and `:419` become true at the merge.

| `Suggested.lean` declaration (line) | Tau Ceti at `2fd255d9`, under `TauCeti/` |
|---|---|
| `PseudoCoherence.IsPseudoCoherentModule` (70), `IsPseudoCoherentSheaf` (77) | `TauCeti.Huber.IsPseudoCoherentOver R M ⊤` (`Algebra/Module/PseudoCoherent/Basic.lean:89`), `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent` (`AlgebraicGeometry/Modules/PseudoCoherent/Basic.lean:81`) |
| `Ring.IsJapanese` (121), `Ring.IsNagata` (128) | `TauCeti.Ring.IsJapanese` (`RingTheory/Japanese.lean:125`), `TauCeti.Ring.IsNagata` (`RingTheory/Nagata.lean:65`, `extends IsNoetherianRing R`) |
| `Excellence.GeometricallyRegular` (150), `RegularAlgebraMap` (158), `regularLocus` (165), `IsGRing` (170) | `TauCeti.Excellence.*`, `RingTheory/RegularLocalRing/GeometricallyRegular.lean:70`, `RegularAlgebraMap.lean:54`, `Locus.lean:61`, `GRing.lean:57` |
| `SchemePresheaf` (262), `Spaces.RepresentableDiagonal` (269), `Spaces.EtaleAtlas` (277), `Spaces.IsAlgebraicSpace` (283) | `AlgebraicGeometry/AlgebraicSpace/Basic.lean:68, 74, 113, 195` |
| `Proetale.IsReplete` (549) | `TauCeti.IsReplete` (`CategoryTheory/Limits/Replete.lean:91`), equivalent by `epi_π_app` (`:107`) |
| `Formal.IsThickening` (773), `Formal.IsFirstOrderThickening` (778) | `AlgebraicGeometry/Morphisms/Thickening.lean:69, 147` |
| `Formal.IsRegular` (942) | `AlgebraicGeometry/Scheme/Regular/Scheme.lean:68` |
| `Chow.cyclesOfDimension` (1128), `Chow.RatEquiv` (1143), `Chow.ChowGroup` (1154) | `AlgebraicGeometry/Chow/Basic.lean:86, 257, 295` |
| `Curve.vectorBundleDegree` (686), `Curve.vectorBundleDegree_add_of_shortExact` (699) | `AlgebraicGeometry/VectorBundle/Degree.lean:82, 168` |

**Tested on the refuting instance.** In the scratch copy `TauCeti.Ring.IsJapanese` is the only definition of a Japanese ring, `Spaces.IsAlgebraicSpace` the only algebraic-space predicate, and `Chow.ChowGroup` the only Chow group; `artinBootstrap`, `torsorRepresentability`, `grothendieck_existence`, `alteration_theorem` and `CH_coprod` elaborate on them. At this head's pin the same file cannot elaborate (the imported modules do not exist), which is why the finding comes due at the merge.

## R02 (P3) — The pull-request description describes a §4.10A this head lacks and states no order with the four conflicting heads

Carried from r54 R02, r57 R04 and r61 R04: not repaired.

**Location.** The pull-request description.

**Witness.** It says "New section 4.10A … from a compatible polarized adic system" and "This README-only addition changes no Lean declarations". The head has no §4.10A, puts polarized algebraization out of scope (`README.md:73–75`), and changes `Suggested.lean` by 1778 lines against main. `scratch/overlaps.md`: #1656 (same author, adds §0.7a), #1807, #1808 and #1854 conflict with this head in `README.md` (#1656 and #1808 also in `Suggested.lean`).

**Repair.** Rewrite the description to say what the branch does against main (the README rewrite citing Tau Ceti's Layer 0–5 packages, the reduction of `Suggested.lean` to headlines, henselization moved to Tau Ceti), and add one line per conflicting pull request saying which side rebases. No file change.

**Tested.** A description naming #1656, #1807, #1808 and #1854 with an order, and no §4.10A, matches this head.

## R03 (P3) — Five locators point into the wrong file or tag

All resolve at `2fd255d9` once the file is corrected; the declarations exist.

- **§2.6 (`README.md:3473`, `:3517`).** "`AlgebraicGeometry.Scheme.Modules.exists_subsingleton_cohomology_of_isAffine`" is in `namespace AlgebraicGeometry.Scheme.Hom` (`TauCeti/AlgebraicGeometry/Cohomology/QuasiSeparated.lean:179–226`, theorem at `:186`; the file's own docstring at `:52` names it `Scheme.Hom.…`). **Repair:** `AlgebraicGeometry.Scheme.Hom.exists_subsingleton_cohomology_of_isAffine`.
- **§0.5 (`README.md:748–749`).** "`finite` (`:127`), `finitePresentation` (`:217`), `of_isNoetherianRing` (`:391`)" follow "`ChainComplex.lean:41`", a file of 81 lines. They are in `TauCeti/Algebra/Module/PseudoCoherent/Basic.lean:127, 217, 391`. **Repair:** name `Basic.lean` before `:127`.
- **§0.17 (`README.md:1289`).** "`TauCeti.Ring.isCohenMacaulay_iff_forall_satisfiesSerreS` (`Ring.lean:59`)" follows `TauCeti/RingTheory/SerreCondition/Basic.lean`; there is no `SerreCondition/Ring.lean`. It is `TauCeti/RingTheory/CohenMacaulay/Ring.lean:59`. **Repair:** write that path.
- **§0.29 (`README.md:1927–1930`).** "(`:98`), (`:103`), (`:117`), (`:64`), (`:78`), (`:112`), (`:145`–`:168`)" follow "`Scheme/ToSpecZMod.lean:52`", a file of 60 lines. They are lines of `Scheme/Characteristic.lean` (checked: `iff_forall_natCast_eq_zero` at `:98`, `iff_affineOpens` `:103`, `spec_iff_natCast_eq_zero` `:117`, `charP_sections` `:64`, `iff_of_iso` `:78`, `of_hom` `:112`). **Repair:** move the `ToSpecZMod.lean:52` parenthesis to the end of the bullet, or restate `Characteristic.lean` before `:98`.
- **§2.9 (`README.md:3636`).** "[Stacks, Lemma 35.8.8](…/tag/03DR)": 03DR is the tag of Section 35.8 (book line 142385). Lemma 35.8.8 is 0GN7 (line 142526). **Repair:** cite 0GN7.

**Tested.** Each corrected locator prints the named declaration or lemma at the cited line.

## R04 (P3) — The module docstring's §5.10 bullet is false at the pin the README names

**Location.** `Suggested.lean:48–50`: "The pins have no intersection pairing on the Picard group of a projective surface over a field; Tau Ceti's intersection matrices of numerical types are combinatorial data, not this pairing."

**Witness.** Tau Ceti at `2fd255d9` has `LineBundleClass.intersectionNumber` (`TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean:111`: the degree of the restriction of a line-bundle class to a curve `C ⟶ X`, additive in the class, `:244`) and `LineBundleClass.IsAmple` (`TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71`). `README.md:7457–7458` itself cites "`intersectionNumber` (a pairing on line-bundle classes)". Neither exists at `358314d4`.

**Repair.** After the merge, say what the pins have and what the Hodge index statement still lacks: `intersectionNumber` pairs a class with a curve, not two classes, and the pairing of §5.9 on `Pic(S)` (through `c_1 ∩ c_1 ∩ [S]`, or the Euler-characteristic form `χ(O) − χ(L⁻¹) − χ(M⁻¹) + χ(L⁻¹ ⊗ M⁻¹)` on `eulerCharBelow`) is not at the pins; ampleness is `LineBundleClass.IsAmple`. If the roadmap chooses the Euler-characteristic form as the pairing, `hodge_index` becomes statable on `IsAmple` and `eulerCharBelow` and belongs in the file.

**Tested.** On `ℙ¹ × ℙ¹` the Euler-characteristic form gives `O(1,0) · O(0,1) = χ(O) − χ(O(−1,0)) − χ(O(0,−1)) + χ(O(−1,−1)) = 1 − 0 − 0 + 0 = 1` and `O(1,0)² = 1 − 0 − 0 + χ(O(−2,0)) = 1 − 1 = 0`, the table of §5.10's Check.

## Previous findings (r61)

- **R01 (Tau Ceti builds most of Layer 0 and parts of Layers 1, 4, 5), partly repaired.** The README now cites Tau Ceti by file and line in every affected subsection (all citations resolve at `2fd255d9`, see below), and the Lean file no longer declares `Proj.isPullback_baseChange`, `FlatAnnihilator.*`, the `NormalSchemes` strand, `exists_regularSystem_of_quotient`, `Formal.IsModification`, `Formal.resolution_of_curves`, `QCoh.higherDirectImage_vanishing` or `Curve.cohomologyDim_zero_structureModule`. The seventeen definitions remain (R01 above); the §0.29 docstring bullet is gone.
- **R02 (§0.13 recognition criterion), repaired.** `README.md:1148–1153`: the hypotheses are ind-étale, `R/I → S/IS` bijective and `(S, IS)` henselian, the conclusion that `existsUnique_lift`'s map is an isomorphism, with the negative-control Check for `(ℤ, (5))`, `S = ℤ` (`:1168–1171`) and the identification of `ℤ_{(5)}^h` (`:1164–1167`).
- **R03 (pins), not repaired.** Folded into R01.
- **R04 (description), not repaired.** Carried as R02.
- **R05 (padding), repaired.** `strictTransform_supportComparison_affine` is deleted; `README.md:5713–5716` keeps it in italics with the Mathlib route.
- **R06 (locators), repaired.** `README.md:1019–1020` cite 0BQ0 for the henselization criterion and 06DM for the strict one (book lines 71875, 71973); `:4330` cites 0E2T (Definition 48.28.1, p. 4153, line 197836); `:4327` cites Definition 36.35.1 (0DI0, p. 3155, line 149761); `:2250–2256` cite 03BV, 03H5, 03BX (3), 03BZ (1), 03H4 with pages (lines 253461, 253481, 253514, 253579, 253467).
- **R07 (§1.7 equivalence of points), repaired.** `README.md:2247–2249` use the common-extension wording; the Check at `:2263–2266` computes `Spec σ = id` after `Ω = L`.
- **R08 (§2.16 `X_{k^s}` clause), repaired.** `README.md:3942–3945` state the computation on `X_{k̄}` with the `Aut(k̄/k)` action.
- **R09 (§4.3 undefined names), repaired.** `README.md:5252–5254` define the test functor `V` in prose; the Checks at `:5257–5263` use `V` and "the one-point functor".
- **R10 (`quotientBaseChangeEquiv`), repaired.** `README.md:447–448`: "with no Noetherian hypothesis except in `isNoetherianRing` and `faithfullyFlat_adicCompletion`".

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** The worker's gate at 3cc1013 reports every counter 0 and `OK`.
- **Dependency check.** The requested `--depcheck` prints `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line. The roadmap is on main and is not in `ORDER.txt`.
- **Suppliers.** AlgebraicVectorBundles, StableReduction, JacobianChallenge, ClassFieldTheory, ProfiniteCohomology, QuadraticFormInvariants and GrothendieckEulerForms are on main. ModularCurves, AlgebraicCurves and EtaleCohomologyFoundations are cited as consumers or comparison owners only.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** The worker's targeted build passed at the head's pins (`build=0`). The post-merge scratch copy elaborates at main's pins (R01): exit 0, 46 sorry warnings, no other diagnostic.
- **Signatures.** `scratch/signatures.md` lists the 118 declarations (the `on` entry at "line 42" is a parse of the docstring, not a declaration) with no dropped section binder. I compared the elaborated types with the README for `flat_over_dedekind`, `unibranch_finite_components`, `IsQuasiExcellentRing.isNagata`, `isAlgebraicSpace_pullback`, `EtaleLocal.baseChange`, `artinBootstrap`, `torsorRepresentability`, `noetherianSpace_vanishing`, `isAffine_of_H1_vanishing`, `brauer_functionField_curve_trivial`, `isReplete_proetale`, `genus_of_finite_etale`, `cohomologyDim_one_eq_zero_of_degree_gt`, `grothendieck_existence`, `algebraize_hom`, `alteration_theorem`, `semistable_alteration_theorem`, `CH_coprod` and `weil_bound`: every standing hypothesis is present (`[IsLocallyNoetherian X]`, `[IsTrait R]`, `[Finite k]`, `[QuasiCompact f]`, `[GeometricallyIntegral …]`). Nothing was changed.
- **Padding probe.** A scratch copy with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | trivial | exact fun _ => trivial`, elaborated at the head's pins, produced 46 errors out of 46: no sorried declaration closes in one tactic. The definitions have real bodies; none mirrors a Check.
- **Lean-name leads.** `scratch/citations.md` reports no cross-roadmap citation found nowhere. Of its 135 Lean-name leads, 73 are declared in `Suggested.lean`; the other 62 are README-only proposed names in strands the file does not carry (`Stack.*`, `Mbar.*`, `Groupoid.*`, `VanishingCycles.*`, …), as Convention 5 allows, and the gate's `readme-ids-missing` is 0.

### Tau Ceti citations at `2fd255d9` (the pin the README names)

I resolved every file-and-line citation of the README against the checkout at `2fd255d9`: 378 citations parsed, of which 252 name a declaration found within one line of the cited line and 80 are line-only citations whose line opens a declaration; the 46 the parser flagged were list-style citations whose names it mis-associated, and I checked those by hand (160 `sed`-verified lines in §§0.1–0.5, 0.7, 0.10, 0.16–0.18, 0.20–0.21, 0.23–0.24, 0.27, 0.29–0.30, 1.1, 1.3, 2.1, 2.3, 2.5–2.6, 2.9, 2.17, 3.1, 3.3, 4.1, 4.11, 4.13 and 5.1; among them `Japanese.lean:125`, `Nagata.lean:65, 97, 171, 178`, `Catenary.lean:56–209`, `UniversallyCatenary.lean:56–194`, `Depth/Basic.lean:247, 258, 269, 341, 364, 470, 485`, `SerreCondition/Basic.lean:85–258`, `SerreCondition/Normal.lean:170, 193, 214`, `Scheme/Normal.lean:84–203`, `CodimensionOne/Basic.lean:72–138`, `RamificationIdx/Basic.lean:74–151`, `RegularLocalRing/Quotient.lean:98–129`, `Frobenius/*.lean` (33 lines), `AlgebraicSpace/Basic.lean:68–221`, `Thickening.lean:69–203`, `Modification/Basic.lean:53, 70`, `Chow/Basic.lean:86–369`, `Chow/ClosedImmersion.lean:211, 243`, `Pullback.lean:69–153`, `Torsor.lean:61–276`, `Replete.lean:91, 107`, `StructureSheaf.lean:84–230`). The only defects are R03's five.
- At `358314d4`, the head's pin, none of the directories `RingTheory/Henselization`, `RingTheory/Japanese.lean`, `AlgebraicGeometry/AlgebraicSpace`, `AlgebraicGeometry/Chow`, `AlgebraicGeometry/IntersectionNumber` or `AlgebraicGeometry/LineBundle/Ample.lean` exists (R01, R04).
- The eight `TauCeti.*` imports of `Suggested.lean` exist at both pins.
- Headline carriers absent at `2fd255d9`, as the docstring says: no algebraic stack, inertia or coarse moduli space (grep `AlgebraicStack`, `coarse`, `KeelMori`: only the real-algebraic CAD files), no Schlessinger, no Chern character or Todd class, no Azumaya algebra on a scheme (only `Algebra/CentralSimple`, `Algebra/BrauerGroup`), no `f^!` or dualizing complex, no formal functions, `relativePicardPresheaf` without representability. The §5.10 bullet is R04.
- Duplication of the remaining theorems: Tau Ceti at `2fd255d9` has no generic flatness, no Nisnevich site, no `D_QCoh`, no Tsen, no Artin–Schreier vanishing for étale sheaves, no scheme-level formal smoothness, no Galois descent of algebras in the semilinear form, no torsor or bootstrap for algebraic spaces, no alterations, no traits, no Grothendieck existence; `Cohomology/Affine.lean` has only the direction "affine implies vanishing" (`:243, 263`); `Curves/Genus/BaseChange.lean:72` is the smooth connected case of `genus_baseChange`, as §3.1 says. The only duplicate found is the Layer 3 degree (R01).

### Seeded sample: Stacks tags in `stacks-project` book.pdf (book line numbers; pages are PDF pages)

Every tag resolves to the number the README gives it.

- **§0.8.** 0AUW = Lemma 15.22.11 (p. 1244, line 59553: flat iff torsion free over a Dedekind domain, the stalk input of `flat_over_dedekind`), 0576/0578/0579 = Lemmas 37.26.2/4/5 (p. 3251–3252), 038F = 33.8.4, 01UA = 29.26.10, 004Z = 5.8.14, 054L = 29.37.21, 04KV = 33.7.14, 056T = 33.25.4, 033N = 28.7.7, 057G/055U = 37.38.5/6 (lines 156192, 156231).
- **§0.15.** 07GC = Theorem 16.12.1 (Popescu), p. 1626, line 77509.
- **§0.16.** 00NI = Definition 10.105.1, 02IH = 10.105.2, 00NK = 10.105.7, 00NJ = 10.105.4, 0AUN = 10.105.6, 0AUP = 10.105.8, 00NL = Definition 10.105.3, 00NM = 10.105.9 (pp. 685–686).
- **§0.17.** 00LI, 0AUI, 00LK, 00LX, 0AV5, 0AUK (Lemma 10.72.11, line 28787: `min_i depth(N_{m_i}) = depth_m(N)`, as `depth_eq_iInf_localization_maximal` says), 0337, 0AV8, 0AV7, 00N3, 0AAH, 0AAG, 0C6G, 0BUS, 0AAF, 0AAE, 0AAI, 031P, 031Q, 031R, 0FCC (Lemma 10.72.10, p. 607, line 28778: `depth(M_p) + dim(R/p) ≥ depth(M)`, exactly *depth_localization_le*), 0E9I = 31.5.11, 0DWR = 51.2.2, 0AVZ = 47.11.1.
- **§0.30.** 033I = Definition 28.7.1, 00PD = 10.119.7, 00H8 = Proposition 10.38.7, 02JE = Section 110.19 (p. 7354), 09E4 = Definition 15.113.1, 00NR = 10.106.4.
- **§1.7.** 03BU = Definition 66.4.1 (p. 5297), 03BX = 66.4.6 (p. 5299), 03BY = Definition 66.4.7 (p. 5300), 03BV = 66.4.2 (p. 5297), 03H5 = 66.4.4 (p. 5298), 03BZ = 66.4.8 (p. 5300), 03H4 = 66.4.3 (p. 5298).
- **§1.8.** 03MJ = 67.22.1, 04RD = Definition 67.22.2, 025W = 65.5.10, 02X0 = 65.7.1, 02X2 = 65.7.3.
- **§1.14.** 043W = Definition 78.11.1 (p. 6023), 0448 = Definition 78.16.2 (p. 6034).
- **§2.1.** 08J6 = Remark 21.14.4, 072Z = 21.14.1, 03F3 = 21.7.1, 03YU = 21.7.2, 072W = 21.7.4, 0730 = 21.14.2 (pp. 1936–1951).
- **§2.3.** 03AH = Definition 21.4.1, 03AI = 21.4.2, 03AJ = 21.4.3 (p. 1933).
- **§2.17.** Bhatt–Scholze 2014 (arXiv 1309.1198v2): Definition 3.1.1 p. 16 (line 701), Proposition 3.2.3 p. 18 (line 798), Proposition 3.3.3 p. 19 (852), Proposition 4.2.8 p. 29 (1361), Definition 2.4.1 p. 13 (604), Lemma 2.4.9 p. 14 (652), Theorem 1.5 p. 3 (98), Proposition 2.3.3 p. 12 (514), Proposition 3.1.10 p. 17 (755); the interfaces paragraph's Definition 6.8.1 p. 58, Lemma 6.8.2 p. 58, Definition 3.4.1 p. 21, Proposition 3.4.2 p. 21, Corollary 5.1.6 p. 35.
- **§3.2.** 0C1C/0C1D/0C1F = Lemmas 53.12.1/2/4 (pp. 4455–4456; 53.12.2 is `2g_X − 2 = (2g_Y − 2) deg f + deg R` for `k = H⁰(Y) = H⁰(X)`, 53.12.4 gives `d_x ≥ e_x − 1`), 0AYZ = 33.44.11, 0C6M/0C6T/0C6N = 53.10.1–3, 0C6U = Proposition 53.10.4, 0E3A–0E3D = 53.22.1–4 (p. 4486–4487; 0E3B with `Z = ∅` is `deg L > 2g − 2 ⇒ H¹(L) = 0`, the Lean statement), 0AYY = 33.44.9, 0H2V = 53.22.5, 0B5E = 53.6.3.
- **§4.4.** 06HG, 06H3, 06HC, 06HR, 06IY, 06IL (Section 90.15), 06T4, 06GX, 06IR, 06T5, 06T2, 06T3, 06T8, 06IV, 06IW, 06IX (Theorem 90.15.5, p. 6564), 06JM (Theorem 90.18.2, p. 6572), 06JB (Example 90.16.10).
- **§5.2.** 02R3, 02S0, 0AZ0, 02RA, 02RF, 02RV are section tags (Sections 42.12, 42.20, 42.41, 42.14, 42.15, 42.19), 02TY = Lemma 42.36.3 (p. 3762). Fulton is not verifiable here.
- **§5.6.** 0FDP = 37.62.18, 0FBR = Section 42.60, 0FC0 = Section 42.62, 067R = 31.23.8, 0FF3 = Definition 42.59.4, 0FF2 = 42.59.3, 0FF4 = 42.59.5.
- **Lean docstrings.** All 50 tags cited in `Suggested.lean` resolve to the numbers given (064Q, 03RV, 04MF, 032F, 032R, 032W, 07QV, 04DZ, 025Y, 02X2, 03MJ, 04RD, 043H, 06P9, 04TY, 04SK, 04S6, 02UZ, 01XF, 01XG, 0A3J, 03RC, 03RD, 06YZ, 06Z0, 0AYR, 0AYS, 0AYZ, 0BY9, 0A27, 0A26, 02H0, 02HG, 02H6, 02HM, 07E8, 0AIF, 088C, 088E, 0899, 09ZT, 0A42, 0AB0, 052A, 02QR, 02QO, 02RW, 04EX, 0AAZ).
- **Tags new in this head.** 0AVK = 29.54.14, 02WQ = 65.8.4, 0C45 = 33.41.1, 0BI4 = 54.15.1, 031S = 10.157.4, 0AB1 = 29.55.8, 0339 = 10.163.4, 02IT = 28.9.2, 0A2L = 59.62.2, 03QV = Example 59.59.3, 09YQ = Theorem 59.51.3, 09IS = Theorem 36.15.3, 08IB = 36.22.5, 0B6I = 48.3.10, 0FW0 = Remark 48.27.6, 0GEW = Example 48.3.9, 01XB = 30.2.2, 0F83 = 30.3.4, 04AA = Definition 83.8.1 (the head's correction of 04A9, a section tag), 01LC, 01LX, 01N2, 01NN, 01O4, 01BG, 0BPZ, 04GP, 04GQ, 0A21, 0ECG, 0CCG, 0EBS, 0A9I, 02K8, 01WI, 01QO, 01SB, 0055, 00P0–00P4, 04KX, 07BZ, 07QK, 0BFK, 0H7S, 0H7T, 07PV, 07QW, 04DD, 04DF, 01S4, 056I, 056J, 05JU, 05JV, 02IO.
- **Milne, Algebraic Geometry, Chapter 11 (AG11.pdf cache).** Theorem 11.53 (Castelnuovo–Severi) and Corollary 11.54 on p. 37 (lines 1461, 1471), Example 11.55 on p. 37 (line 1478, `def(Γ_f) = 2 g₂ deg f`), the Frobenius calculation on p. 38 (lines 1488–1495, `|(Δ·Γ_π) − q − 1| ≤ 2g q^{1/2}`): the `weil_bound` docstring and §5.11's subscript remark are right (Milne's `C_1 = C_1 × pt` has `d_1 = Γ·C_1 = deg f = q`, our `F_2`).
- **Mathlib at `f6090c70`.** `IsAzumaya` (`Algebra/Azumaya/Defs.lean:60`) extends `Module.Projective`, `FaithfulSMul`, `Module.Finite` with `bij : Bijective (AlgHom.mulLeftRight R A)`, so `isAzumaya_iff_positive_fibres_mulLeftRight` is the identification of `FaithfulSMul` with positive rank at every prime for a finite projective module (correct: the locus of rank zero is cut out by an idempotent, and `R → A` is injective iff it is empty).

### Overlaps and ownership

- `scratch/overlaps.md` lists no dropped id and no id that only an open revision defines. #1656 (same author) adds a §0.7a (linear Noether normalization) that this head lacks; #1807, #1808 and #1854 edit this README. The order is R02.
- The closest open roadmaps (PurityForFlatCohomology, AdicCoefficientsAndComparisonsPartII, AlgebraicModuliForArithmeticGeometry and Part II, EtaleDualityAndPerverseSheavesPartII) consume this roadmap (declared gaps on §0.14, §0.21 and §4.14) and own none of its objects.

### Adversarial table

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| `flat_over_dedekind` (0AUW) | `S = Spec k[t]`, `X = S ⊔ 𝔸¹_S`; `S = Spec k` | both components dominate; stalk `O_{X,x}` reduced with minimal primes contracting to `0`, so `t a = 0 ⇒ a ∈ ⋂ p = 0`: torsion free, hence flat; fibres `Spec κ(s) ⊔ 𝔸¹_{κ(s)}` have dimensions `0` and `1`, so no `PureRelativeDimension d` (the Check). Over a field (`IsDedekindDomain k` holds) every module is flat | Pass |
| `flat_over_dedekind` negative control | `X = Spec k[t]/(t)` over `S = Spec k[t]` | the component `{t = 0}` has image `{0}`, not dense: hypothesis fails, and `k[t]/(t)` has `t`-torsion, not flat | Pass |
| §0.8 `rational_point_component` | `X = Spec ℝ[x,y]/(x²+y²+1)` | smooth, connected, no rational point; `X_ℂ` is connected; a hypothesis-free form would be false for `Spec ℂ` over `ℝ`, which is connected and smooth but `Spec ℂ ⊗ ℂ` has two points | Pass |
| §0.15 Popescu | `R = k`, `S = k(t)` | `k → k(t)` regular (fibre `k(t)` geometrically regular, flat); `k(t) = colim k[t, 1/f]`, smooth | Pass |
| §0.16 `isUniversallyCatenary_of_forall_isCohenMacaulay` | `ℤ`; `k × k[t]` | `ℤ_{(p)}` DVR, CM, so universally catenary; `k × k[t]` has `R_p` CM at every prime (fields and `k[t]_{(f)}`), chains `0 ⊂ (p)` in each factor: catenary, no global dimension | Pass |
| §0.17 *depth_localization_le* (0FCC) | `R = M = k[x,y]_{(x,y)}`, `p = (x)`; `M = R/(x)`, `p = (y)` | `1 + 1 = 2 ≥ 2`; `M_p = 0`, depth `⊤ ≥ 1` | Pass |
| §0.17 `satisfiesSerreS_two_iff_hartogs` | `k[x,y,z]/(xz,yz)` | reduced so `(S_1)`; origin height `2` (chain `0 ⊂ (x) ⊂ (x,y)` in the plane), depth `1`; the idempotent `(1, 0)` on the punctured plane and line is a section not in `R` | Pass |
| §0.30 `coheight_apply_eq_one` hypotheses | `x ↦ x²` on `𝔸¹_k`, `char k ≠ 2` | closed point `a ↦ a²`, coheight `1 ↦ 1`; ramification index `2` at `0`, `1` at `1` (`y = x²`, `𝔪_0 = (x)`, `(y) = (x)²`) | Pass |
| §1.7 points | `h_{Spec L}`, `L/K` quadratic | `Spec σ ∼ id` after `Ω = L` since `σ² = id`: one point | Pass |
| §1.8 `EtaleLocal` with a non-surjective `b` | `F = h_U`, `G = h_X`, `U ⊂ X` open, `V = U`, `h = id` | for `P` local on source and target, `P(U → U ⊔ V')` for an atlas `V'` of `X` follows, so the square-independent notion agrees; for `P = Surjective` (not local on the source) the definition would wrongly hold, but `baseChange` assumes `IsLocalAtSource` | Pass |
| §1.14 groupoid laws | `r = (1,0)`, `i(r) = (0,1)` | `c(r, i(r)) = (1,1) = e(t r)`, `c(i(r), r) = (0,0) = e(s r)`; the idempotent `z` with `z∘z = z` on `Spec k ⊔ Spec k` has no inverse since `z ∘ i(z) = 1` is impossible | Pass |
| §2.1 pullback | `Spec ℂ → Spec ℝ`, `ℤ/2`, `n = 1` | `H¹(ℝ, ℤ/2) = Hom(ℤ/2, ℤ/2) = ℤ/2 → H¹(ℂ, ℤ/2) = 0` | Pass |
| §2.3 `NonabelianH1` | `G = GL_n` on `Spec A`, `A` local; `G = S₃` constant over a field | one class (free modules); for `K ⊃ L` quadratic with generator `τ`, cocycles `τ ↦ (12)` and `τ ↦ (13)` have pointwise product `τ ↦ (12)(13) = (132)` of order `3`, not a homomorphism from `ℤ/2` | Pass |
| §2.17 `IsReplete` | `Sh((Spec ℚ)_ét)`, tower `μ_{ℓ^{n+1}} → μ_{ℓ^n}` | `lim μ_{ℓ^n}(K) = 0` for every finite `K/ℚ` (finite torsion), so the legs `0 → μ_{ℓ^n}` are not epi; `Type` is replete (sequential limits of surjections are surjective) | Pass |
| `isReplete_proetale` vs Tau Ceti's class | leg `n = 0` vs all `n` | reindexing along `m ↦ n + m` gives all legs from the zeroth (`epi_π_app`, `Replete.lean:107`): the two predicates agree | Pass |
| §3.2 `genus_of_finite_etale` (0C1D, 0C1F) | `z ↦ z²` on `ℙ¹`, `char ≠ 2`; double cover of genus `2` | `R` has degree `2` and the map is not étale, excluded; étale double cover: `2·3 − 2 = 2(2·2 − 2)`, `g = 3` | Pass |
| `cohomologyDim_one_eq_zero_of_degree_gt` (0E3B) | `L = O(2g−2) = K` on genus `g`; `L = O(2g−1)` | `deg K = 2g − 2` is not `> 2g − 2` and `h¹(K) = 1 ≠ 0`, excluded; `h⁰(O(2g−1)) = 2g − 1 + 1 − g = g`, `h¹ = 0` | Pass |
| §4.4 hulls | `F = h_{k[[t]]}`, `ξ : h_{k[[t,s]]} → F` | versal, tangent `k² → k` not injective; `exists_hull_of_H1H2` gives `R₀ = k[[t]]`, `r = 1`, `k[[t,s]] ≅ k[[t]][[s]]` | Pass |
| §4.4 `schlessinger_prorepresentable` | one-point functor | `H1`–`H4` hold, tangent space `0`, prorepresented by `Λ → k`, that is `h_k` | Pass |
| §5.2 `flatPullback_properPushforward` | `g : Spec k' → Spec k` degree `d`, `f : 𝔸¹_k → Spec k` | `f^* g_* [pt] = f^*(d [pt]) = d[𝔸¹_k]`; `g'_* f'^* [pt] = g'_*[𝔸¹_{k'}] = d [𝔸¹_k]` | Pass |
| §5.2 localization | `𝔸¹ ⊃ 𝔾_m`, `Y = {0}` | `CH_0({0}) = ℤ → CH_0(𝔸¹) = 0 → CH_0(𝔾_m) = 0`: exact, kernel generated by `[0] = 0` | Pass |
| §5.6 `Chow.intersect` on the line with two origins | `L`, `[0₁] · [L]` | diagonal not closed, closed in `U = L × L ∖ {(0₁,0₂),(0₂,0₁)}`; `{0₁} × L` meets `Δ` transversally at `(0₁,0₁)` only after removing `(0₁,0₂)`: `[0₁]` | Pass |
| §5.6 constant map | `f ≡ p : ℙ¹ → ℙ¹` | `f^*[p] = c_1(f^* T_p ℙ¹) ∩ [ℙ¹] = c_1(O) = 0 = f^*[q]` | Pass |
| `artinBootstrap` (04S6 (3)) | `F = h_X`, `a = 𝟙` | pullbacks `h_T`, flat and LFP, locally surjective: `IsAlgebraicSpace h_X` | Pass |
| `torsorRepresentability` | trivial torsor `P = G` | `(a, pr₂) : G × G → G × G` is `(g,h) ↦ (gh, h)`, an iso; section `e`; `Nonempty (G ≅ P)` | Pass |
| `Torsor.trivial_iff_section` | `P` with a section `σ`; `P ≅ G` as objects over `S` | `g ↦ g·σ` is an equivariant iso, in particular an iso of objects; an iso of objects carries `e` to a section. Both directions hold with the non-equivariant `≅` (weaker than the equivariant statement, still true) | Pass |
| `grothendieck_existence` / `algebraize_hom` | `A = k[[t]]`, `X = Spec A`, `Y = 𝔸¹_A` | `F_n = A/t^{n+1}`, `M = A`; compatible `a_n` give `a ∈ A`; `a_0 = 0`, `a_1 = 1` violate `hcompat` | Pass |
| `alteration_theorem` | `𝔸¹_k`, `Z = V(t)` | `X̄₁ = ℙ¹`, `B = {0, ∞}` strict normal crossings, `B = (range j)ᶜ ∪ j(φ⁻¹Z)` | Pass |
| `semistable_alteration_theorem` | `X = Spec K`, `Z = ∅` ∪ special fibre; `xy − p`, `xy − p²`, `x² − p` | `X_s = ∅`, take `X̄₁ = Spec R`, `H = ∅`; `xy − p` regular SNC, `xy − p²` singular (node of `Spec R[x,y]/(xy − p²)` at `(x,y,p)`), `x² − p` nonreduced fibre `𝔽_p[x]/(x²)` | Pass |
| `node_local_structure_dvr` | `a = ε πⁿ`, `n ≥ 1` | `uv − a ↦ ε uv − ε πⁿ = ε(uv − πⁿ)` under `u ↦ εu`, so the iso is well defined; `a = 0` is the identity case | Pass |
| `isAzumaya_iff_positive_fibres_mulLeftRight` | `A = R × 0` (rank `0` at one component); zero ring | `FaithfulSMul` fails (`(0,1) • A = 0`), rank `0` at that prime: both sides false; over `0` both sides true vacuously | Pass |
| `weil_bound` | `ℙ¹/𝔽₂`; `y² = x³ − x/𝔽₃`; `y² = x³ + x + 1/𝔽₅` | `|3 − 3| = 0 ≤ 0`; `|4 − 4| = 0 ≤ 2√3`; `9` points, `|9 − 6| = 3 ≤ 2√5 ≈ 4.47` | Pass |
| §5.11 Castelnuovo–Severi (Milne 11.53) | `V = C₁ × C₂`, `D = Γ_π` | `d_1 = q`, `d_2 = 1`, `def(Γ) = 2gq`, `def(Δ) = 2g`, `(Γ·Δ) − q − 1 = #C(𝔽_q) − q − 1`, bounded by `2g√q` | Pass |
| R01 sample | `Ring.IsJapanese` vs `TauCeti.Ring.IsJapanese` | same binders `(L : Type u) [Field L] [Algebra R L] [Algebra (FractionRing R) L] [IsScalarTower …] [FiniteDimensional …]`, same conclusion | **R01** |
| R01 Layer 3 | `Curve.vectorBundleDegree_add_of_shortExact` vs `FixedRank.vectorBundleDegree_add_of_shortExact_of_isCurveOver` | both `deg E₂ = deg E₁ + deg E₃` with `deg = χ(E) − r χ(O)`, Tau Ceti's under `IsCurveOver` (integral, proper, dim `1`) and DVR codimension-one stalks, the roadmap's under proper and `dim ≤ 1` | **R01** |
| R04 | `ℙ¹ × ℙ¹`, Euler-characteristic pairing | `O(1,0)·O(0,1) = 1 − 0 − 0 + 0 = 1`, `O(1,0)² = 1 − 0 − 0 + χ(O(−2,0)) = 1 − 1 = 0` | **R04** |

## Not verifiable

- **de Jong 1996, Hartshorne 1977 and Fulton 1998.** de Jong and Hartshorne are settled as uncertified in the manifest; I found no legal text of Fulton in the cache. Their statements were checked mathematically only (table).
- **Klevdal–Patrikis 2024 (§0.9), Couveignes 2019 and Česnavičius 2020 (§0.10), Grothendieck, Brauer I/II (§2.22), Rydh 2012 and Conrad 2005 (§1.23), Abramovich–Olsson–Vistoli 2008 (§1.23), Bhargava–Gross–Wang 2017 (§3.6).** Not in the cache under this manifest's keys; this review edits no manifest, so I did not fetch them.
- **Elaboration of this head's `Suggested.lean` at main's pins.** The head's file cannot be elaborated there as it stands (it declares names Tau Ceti now owns); the post-merge scratch copy of R01 is what I elaborated at `2fd255d9`/`1b1ccf4b`, from the main checkout rather than this worktree.
- **Sections outside the sample and the change set.** About 35 subsections were read only where a finding, a headline or a changed hunk led there. Ownership against open pull requests was checked through `roadmaps overlaps`, the README of #1656 at its head and the four closest open roadmaps, not through every open README.

## Source issues

- **Misprint** in stacks-project at Lemma 15.108.2 (0BQ1), proof, p. 1509: the source says "the spectrum of the ring on the right is the is the set of minimal primes"; it should be "is the set"; affects nothing.
- **Misprint** in stacks-project at Definition 37.2.1 (04EX)(4), p. 3179: the source says an `n`th order thickening has `X` a closed subscheme of `X`; it should be a closed subscheme of `X′`; affects nothing.
- **Misprint** in stacks-project at Example 15.11.14 (0FWU), p. 1224: the source says "if (A, pA) where henselian"; it should be "were henselian"; affects nothing.
