# Review of ClassFieldTheory (pull request #1215 at c1d130b)

**Verdict:** needs changes

This is a full review of the folder at c1d130b. The folder is unchanged since the previous review (0 changed lines), but the pull-request description has changed. Both previous findings are repaired by that description. The full pass found one new P3. Nothing is blocking.

## R01 (P3) — A former declaration that another roadmap cites has no row in the table of names used elsewhere

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md:281–302`, Section and name correspondence. The table says: "Other roadmaps cite the following statements under the names in the left column". Its 17 rows map renamed declarations only.

**Claim.** This head reduces `Suggested.lean` from 445 declarations on main to 7. One of the dropped declarations is still cited by its full name in an open roadmap. `Suggested.lean` on main declares it (`def WeilGroup : Type := localWeilGroup K`, line 2697, in `namespace TauCetiRoadmap.ClassFieldTheory`). At this head it exists only as Tau Ceti's `TauCeti.ClassFieldTheory.WeilGroup`, which Layer 9 consumes (README line 638). The citation therefore breaks when this pull request merges. It is the only dropped declaration cited this way:
- `roadmaps grep 'TauCetiRoadmap\.ClassFieldTheory\.[A-Za-z_]'` over main and all 458 open heads finds no other citation outside this pull request's own folders;
- every short-form citation `ClassFieldTheory.X` of a dropped name resolves at the pinned Tau Ceti, or through the table, apart from module paths.

**Witness.** SmoothRepresentationsOfLocalGroups (#1688 at 3419c0b), `README.md:5021`, places its discretized subgroup "inside the pinned Weil group `TauCetiRoadmap.ClassFieldTheory.WeilGroup`". This head's `Suggested.lean` declares no `WeilGroup`, and the table has no row for it.

**Repair.** Add one row to the table at README line 302:

| Name used elsewhere | Declaration | Difference |
|---|---|---|
| TauCetiRoadmap.ClassFieldTheory.WeilGroup | `WeilGroup` (Tau Ceti, `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean`) | in the namespace `TauCeti.ClassFieldTheory` and universe-polymorphic in `K`; it carries the Weil topology characterized by `weilTopology_unique` |

Test: `TauCeti.ClassFieldTheory.WeilGroup` is declared at `WeilGroup/Basic.lean:181` at the pin, so #1688's citation then resolves through the table. Nothing else in the folder changes.

## Previous findings

- **Previous R01 (merge order against #617 and #1411): repaired.**
  - The description now states an order: "This pull request → #1410 → #1411 → #617. This pull request merges first among the open revisions of ClassFieldTheory, QuadraticFormInvariants and GlobalQuadraticForms."
  - It names the survivors: `normResidue_map_unitFiltration`, `map_artinMap_unitFiltration_eq_upper` and `localAbsoluteUpperRamificationGroup` "stay". It says #1411 and #617 are "rebuilt on this revision", each with "this head's single copy" of the three shared declarations.
  - The README rows it cites exist: line 301 maps `map_unitFiltration_normResidue` and line 302 maps `closure_map_artinMap_unitFiltration`.
  - Residual on #1411's side, not carried here: #1411's description at d6e2855, as quoted by its review PRREVIEW-ClassFieldTheory~51, still says its own names survive. That sentence is #1411's to align with this order. This head is unambiguous, and #1411 is a draft.
- **Previous R02 (`Completed/LocalGaloisGroups/Suggested.lean`): repaired.**
  - The description now says the pull request "also edits `Completed/LocalGaloisGroups/Suggested.lean`", because it "imports ClassFieldTheory's `Suggested.lean` and uses `cyclotomicCharacter_artinMap`".
  - I read the whole diff (112 lines, 62 insertions and 50 deletions). It requalifies about twenty names to `TauCeti.ClassFieldTheory.*` or `TauCeti.*` and rewrites the matching docstrings. It adapts three proofs to Tau Ceti's signatures (`kummerEquivOfCharZero`, `h2MuEquivZMod_mixed`, `h2EquivZModOfMuNRepIso`), adds the import `TauCeti.NumberTheory.ClassFieldTheory.Local.CohomologicalDimension.Strict` and adds one `omit … in`. It keeps this head's `cyclotomicCharacter_artinMap` at line 345.
  - `roadmaps list` records LocalGaloisGroups among #1215's folders. Only the brief's list of folders still omits it (and so the targeted build does not compile that file). That is for the worker to record. Nothing remains for the author, so it is not carried.

## Verified sound

### Gate, dependency check, build

- **Worker's gate:** `scratch/gate.md` passes every check (`build=0`).
- **Gate rerun:** I reran `gate … ClassFieldTheory --base origin/main`. Every folder check is 0 except `outside-folder=5`. All five files are in this pull request's own folders:
  - `GlobalQuadraticForms/README.md` and `Suggested.lean`;
  - `QuadraticFormInvariants/NativeCompletion.md`, `README.md` and `Suggested.lean`.
- **Dependency check, verbatim:** `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. As a roadmap on main, this one names as suppliers only Mathlib, Tau Ceti and roadmaps on main: ProfiniteCohomology, and the Completed ProfiniteProPGroups, LocalFieldsRamification, GlobalNumberFields and NumberFieldArithmetic.
- **Elaboration:** `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` exits 0. Its only output is six ``declaration uses `sorry` `` warnings, at lines 81, 97, 130, 145, 156 and 170.
- **Signatures:** the file has no `variable` block. I compared the 7 elaborated signatures in `scratch/signatures.md` with the README statements (lines 1245–1282, 1323–1398, 2018–2095). Generality agrees:
  - `[IsMulCommutative Gal(L/K)]` and `[ValuativeExtension K L]` on the finite comparison;
  - no characteristic hypothesis on either unit-filtration theorem;
  - `[IsAbelianGalois K L]` on both conductor–discriminant halves;
  - no `ValuativeExtension ℚ_[p] F` on `cyclotomicCharacter_artinMap`. That hypothesis is the open content: Tau Ceti's `localCyclotomicCharacter_artinMap_unit` (`Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311–313`) carries it, and the pin has no theorem deriving it without continuity. `ValuativeExtension.of_continuous_algebraMap`, `Topology/Algebra/ValuativeRel/ContinuousRingHom.lean:174`, needs `Continuous (algebraMap K L)`.

### Names

- **Resolution:** I extracted the 594 backticked Lean-like tokens in the README. After removing notation, roadmap and module names, open targets and the left-column aliases of the name table, 539 remain.
  - A `#check @…` probe importing 298 built Tau Ceti modules resolves 440 at once.
  - The other 99 failed only on sub-namespaces (`ClassFormation.`, `NormalLayer.`, `LayerRestriction.`), on structure fields (`inv_restrict`, `inv_infl`, `inv_conj`, `subsingleton_h1`), or on one unbuilt module (`TateCohomology/Cup/TateNakayama.lean:360`). I located each of the 99 in the pinned sources.
- **ProfiniteCohomology's cup law:** `cup_add_left` (line 139) is ProfiniteCohomology's `Suggested.lean:3890` on main, cited to that roadmap, as the row says.
- **Mathlib inputs of the principal ideal theorem's route:**
  - `Algebra.IsUnramifiedAt.comp`: `RingTheory/Unramified/Locus.lean:55`;
  - `Algebra.IsUnramifiedAt.of_liesOver`: `NumberTheory/RamificationInertia/Unramified.lean:85`;
  - `IsUnramifiedAtInfinitePlaces.trans` and `.bot`: `NumberTheory/NumberField/InfinitePlace/Ramification.lean:538, 548`;
  - `IsSepClosed.lift`: `FieldTheory/IsSepClosed.lean:293`;
  - `Valuation.exists_map_pow_eq_map_algebraMap_of_isAlgebraic`: `RingTheory/Valuation/Algebraic.lean:28`.
- **The docstring's proved-at-pin claims:** none of these 22 declarations' files contains `sorry`, and `NumberTheory/ClassFieldTheory/` has no `sorry` at all:
  - `localAbelianExistence` and `localAbelianExistence_primeToResidueCharacteristic`;
  - `localClassFieldCorrespondencePrimeToResidueCharacteristic`;
  - `globalAbelianExistence` and `globalClassFieldCorrespondence`;
  - `globalArtinMap_local`, `globalArtinMap_ideal` and `globalArtinMap_isArithFrobAt`;
  - `exists_br_of_sum_eq_zero` (`Global/Brauer/Exactness.lean:98`);
  - `cyclicHasseNorm`, `kroneckerWeber`, `hilbertClassField` (`ClassFields/RayClassField.lean:241`), `ringClassArtinEquiv` and `hilbertProductFormula`;
  - `localWeilArtinEquiv`, `conductorExponent_fixedField_ker` and `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot`;
  - `map_artinMap_unitFiltration_zero` (`Local/Unramified.lean:475`) and `localCyclotomicCharacter_artinMap_unit`;
  - `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`, `abelianConductor` (`Global/AdmissibleModulus/Basic.lean:193`) and `relDiscr`.

### Library declarations opened at the pin, with what they say and lack

- **`unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot`** (`Local/Conductor/UpperNumbering.lean:64`):
  - it assumes `IsAbelianGalois K M` and no characteristic, so the README's "in every characteristic" (line 1238) holds;
  - it is the case `H = 1` of the upper-numbering theorem and not the theorem itself, so `normResidue_map_unitFiltration` is not at the pin;
  - its companions are at lines 121 and 130.
- **`abelianConductor`** (line 193): defined from the open norm group, with no abelian hypothesis.
- **`Modulus`** (`NumberField/Global/RayClass/Modulus.lean:98`): carries `finitePart ≠ ⊥`, and its `infinitePart` is a finset of real places. This matches the lcm half's quantifier over `{w // w.IsReal}`.
- **`ClassFormation.natCard_normQuotient`** (`Formation/ClassFormation.lean:303`): assumes `[IsCyclic L.Gal]`, as W.2 says.
- **`finrank_le_index_range_ideleClassNormMap`** (`Global/IdeleClass/FirstInequality.lean:108`): uses the cyclic hypothesis.
- **The Weil Artin map** (`WeilGroup/ArtinMap.lean:145, 154, 163`): `continuous_weilArtinMap`, `surjective_weilArtinMap` and `isOpenMap_weilArtinMap` have no characteristic hypothesis, as line 1612 claims.
- **`ideleClassExtension`** (`NumberField/Global/Ideles/Extension.lean:189`): no declaration at the pin relates it to `Ideal.map` or `ClassGroup.extendedHom`. The README is right to make that comparison a target (line 1972).
- **`Valuation.isNontrivial_comap_algebraMap`** (`RingTheory/Valuation/NontrivialComap.lean:51`): it is about integral algebras, not the `ValuativeExtension` conclusion, so it does not close the cyclotomic headline.

### Cross-roadmap citations resolved (16)

- **NumberFieldArithmetic** (Completed):
  - Layer 2 is Frobenius and the Artin symbol (line 615), with `artinHomAway` at line 120;
  - §4.1 defines `relDiscr` (line 1092);
  - §4.2 includes localization at a prime (line 1123ff.);
  - §5.9 is "The different localizes" (line 1687);
  - §5.10 is the residue-degree-weighted discriminant valuation (line 1714).
- **GlobalNumberFields** (Completed):
  - Layers 0–2 are places, approximation and moduli;
  - Layers 4–8 are adeles, ideles, the ray-class dictionary (Layer 7) and extensions (Layer 8);
  - Layer 11 is orders and `Pic`.
- **ProfiniteCohomology** (main): Layer 1 is the carrier, Layer 4 the finite-quotient colimit, Layer 12 the graded cup.
- **ProfiniteProPGroups** (Completed): Layer 0 has quotients by closed normal subgroups and determination of closed subgroups (`closedSubgroup_eq_sInf_open`).
- **FunctionFieldArithmetic** (#1474): §4.2 is "Local existence, local Kronecker–Weber and injectivity in equal characteristic" (line 1377).
- **RamificationOfCompleteDiscretelyValuedFields** (#1410): §4a.1 (line 909) defers the local-field filtration to this roadmap's Layer 7 and proves the agreement. #1410 is named in the description's merge order.
- **Consumers named at line 2212:**
  - PadicPeriodRings (#940) README:119 cites `map_unitFiltration_normResidue`;
  - LocalAnabelianGeometry (#1811) README:145 cites the same name.
  - Both resolve through rows 301–302 of the name table.
- **Anchors:** every full heading anchor that other roadmaps use into this README resolves at this head, for Layers 5, 6, 7, 9, 10, 11, 12, 13 and 14 (for example ClassicalArithmeticCompletion, main, lines 145–179).
- **GlobalQuadraticForms and QuadraticFormInvariants** on main import this `Suggested.lean`. At this head neither does, so dropping the 444 declarations breaks neither.

### Ownership and duplication

- **The general conductor–discriminant formula:** AnalyticNumberTheoryPartI (main) §2.2a owns it for Artin conductors of all representations, and its *Needs* lists "[ClassFieldTheory 13][R28]". This roadmap owns the abelian class-field form, which that roadmap consumes, so there is no second owner.
- **The principal ideal theorem:** no other roadmap states it. ArithmeticGaloisDuality README:2406 uses it.
- **Unit-filtration reciprocity and the absolute filtration:** #1410, FunctionFieldArithmetic, PadicPeriodRings and LocalAnabelianGeometry all defer to Layer 7.
- **#617 and #1411:** these revise this same roadmap. That is one roadmap amended three times, settled by the stated order.

### Headlines and padding

- **Headlines:** `cyclotomicCharacter_artinMap`, `normResidue_map_unitFiltration`, `localAbsoluteUpperRamificationGroup` with `map_artinMap_unitFiltration_eq_upper`, `isPrincipal_map_hilbertClassField`, `count_relDiscr_eq_finsum_abelianConductor_exponent` and `abelianConductor_eq_lcm`. All are statable and stated. The docstring lists what Tau Ceti proves, and nothing is restated.
- **The supporting comparison:** extension of ideals read on ideles stays in the README as a route step. That is correct.
- **One-tactic probe:** each of the 6 theorems was tried on scratch copies with `exact?`, `simp`, `rfl` and `infer_instance`. `exact?` ran first, so it could not find the sorried copies. That is 24 attempts and 0 closures; the errors were "could not close", "made no progress", "rfl failed" and "type class instance expected". There is no padding.

### Seeded sample: locators read against the text

milne-cft is v4.03. Its printed page is the PDF page minus 9.

| Target | Locator | Found at | Supports the statement as written |
|---|---|---|---|
| 0.1 | none in the section; Tate–Nakayama is Serre IX §8 (C.4) | — (serre-local-fields uncertified) | the Tau Ceti declaration is the witness |
| 1.1, 2.1 | none in the sections; C.1–C.3 cite Artin–Tate XIV (waived) and Milne III Thm 3.1 | milne-cft line 4822, p. 107 | yes |
| 3.1 | C.4: Milne II Thm 3.11, p. 84 | line 3911, p. 84 | yes. Milne's statement has two hypotheses plus a generator of H²(G,C). The README's third hypothesis (restriction generates) is equivalent and comes from Milne's proof |
| 4.1 | W.2: Milne III Thm 3.1, p. 107 | line 4822 | yes |
| 5.1 | milne-adt I Thm 2.1 and Cor 2.3, pp. 26–28; Thm 2.8, p. 31 | milne-adt lines 1073 (p. 26), 1138 (p. 28), 1227 (p. 31) | yes, with M finitely generated and torsion prime to char K. This matches `IsUnit (n : F)` |
| 6.1 | NSW (7.1.8)(i), (7.2.5) | — (uncertified) | checked mathematically in the table |
| 7.1 | serre1961 n° 3.1, Prop. 3 and the following paragraph, p. 128; Serre and Neukirch | serre1961 lines 931–938, p. 128. Serre and Neukirch are uncertified | Herbrand's theorem, then passage to the limit for infinite Galois extensions: yes |
| 8.1 | Milne III Thm 5.1, p. 115; milne-adt I §2 footnote 6, p. 26 | milne-cft line 5186, p. 115 ("only for K of characteristic zero"); milne-adt lines 1078–1083, p. 26 | yes, both |
| 9.1 | none | — | Tau Ceti declarations |
| 10.1 | Milne VIII Thm 4.2, p. 241; VII Thm 7.1, p. 219; VII §4; VII Thm 5.1; VII 8.1(b), 8.2, 8.4–8.6, 7.2, 7.3; VIII Thm 4.7 | lines 10937; 9977; 9566 (§4, "the First Inequality"); 9665 (5.1(b),(c), p. 212); 10042–10180; 9996, 10007; 11011 (p. 242) | yes, all. The 8.1(b) route matches 8.4–8.6 step by step |
| 11.1 | Milne V Thm 5.3(a),(b), pp. 178–179; VII Thm 8.1(a), p. 221 | lines 8123–8141; 10042 | yes |
| 12.1 | Milne V Thm 5.5, p. 179; VII Lemmas 9.1, 9.3, 9.4 and Thm 9.5, p. 226 | lines 8152; 10189; 10218; 10279; 10287 | yes. Lemma 9.3 is "C_K/V killed by p", that is, V contains the p-th powers. The README counts infinite places separately (r), as it says |
| 13.1 | Milne VIII Thm 3.1 and Rem 3.2, p. 234; V Thm 3.17, p. 161; V Thm 3.27, Rem 3.28, Ex 3.30, p. 165; kopp-lagarias Thms 1.1–1.3, pp. 3–4 | lines 10629, 10642 (5² from ℚ[√13,√17]); 7252; 7423–7447; kopp-lagarias lines 128, 160, 174 | yes |
| 14.1 | Milne VIII Thm 4.2, p. 241; V Ex 5.4, p. 179 | lines 10937; 8142 | yes |

### Adversarial pass

"Arithmetic" means `χ(Art u) = u⁻¹`, with a uniformizer going to arithmetic Frobenius.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.1 Nakayama–Rim and Herbrand | `ℤ[C₂]`; trivial `ℤ` | `ℤ[C₂]`: invariants `ℤ(1+g)` = norms `(a+b)(1+g)`, so `Ĥ⁰ = 0` and `Ĥ⁻¹ = ker N/I_G = 0`. Trivial `ℤ`: `Ĥ⁰ = ℤ/2`, `Ĥ¹ = Hom(C₂,ℤ) = 0`, `h = 2/1 = 2 = #C₂` | holds | none |
| 1.1 maximal abelian layer | `G = S₃`, `V = 1`; `V = G` | `[G,G] = A₃` is closed and `G/A₃ = C₂ = G^ab`. At `V = G`: degree `1`, norm quotient `0` | holds | none |
| 2.1 res, cor, inf | cyclic of degree `4` → `2`, inflated to `8` | `inv(res u) = 2·¼ = ½`; `cor(res u) = 2u`, with invariant `½` = `inv_{U'}(res u)`; `inf u = 2u'`, `2/8 = ¼`. Unscaled inflation gives `1/8 ≠ ¼` | holds | none |
| 3.1 Nakayama map | unramified cubic | `Frob ↦ [π]` and `Frob² ↦ [π²]`, `2 mod 3`. The inverse convention gives `1 mod 3` | holds | none |
| 4.1 quadratic test | `ℚ₃(√−1,√3)/ℚ₃` with group `V₄` | `ℚ₃ˣ/ℚ₃ˣ² = ⟨−1,3⟩ ≅ V₄`, which is the norm quotient. The three non-norm classes `−1, 3, −3` have three distinct nonzero symbols, so a fixed `σ` fails | holds | none |
| 5.1 Euler characteristic | `ℚ₂` with `μ₂`, `𝔽₃`, `0`; new: `ℚ₃` with `μ₃` | `8 = 2·2·2`; `3 = 3·1·1`; `1`. New: `μ₃(ℚ₃) = 1` (since `−3` is not a square), `H² = 3`, `#ℚ₃ˣ/ℚ₃ˣ³ = 3·1·3 = 9`, and `1·3·3¹ = 9` | holds | none |
| 5.1 invariant sign | `ℚ₇`, unramified cubic, `χ(Frob) = ⅓` | `inv(7 ∪ δχ) = v(7)·⅓ = ⅓`; the geometric convention gives `⅔` | holds | none |
| 6.1 local reciprocity | `ℚ₉/ℚ₃`; `ℚ₂(ζ₅)`; `cd` | `Art(4) = 1`, `Art(3) = Frob`, of order 2; `ζ₅ ↦ ζ₅²` against `ζ₅³`; `cd₂ G_{ℚ₂} = 2` against `cd₂ G_{𝔽₂((t))} = 1` | holds | none |
| `cyclotomicCharacter_artinMap` | `ℚ₃`, `u = 4`, `μ₉`; `ℚ₂`, `u = −3`, `μ₁₆`; new: `F = ℚ₉`, `u = 2` | `4⁻¹ ≡ 7` against `4`; `13⁻¹ ≡ 5` against `13`. New: `N(2) = 4` and `4⁻¹ ≡ 7 mod 9`; without the norm, `2⁻¹ ≡ 5`. The norm is load-bearing | holds | none |
| same, hypothesis automatic | `X^{ℓ^k} − a` at `1`, `a ∈ 1+pℤ_p`; additive `v(p) < 0` | `‖f(1)‖ ≤ p⁻¹ < 1 = ‖ℓ^k‖²`. If `v(p) < 0`, then `v(1−p) = v(p) < 0`, but `1−p` is a unit | holds | none |
| `normResidue_map_unitFiltration` | `ℚ₃(ζ₉)`, `n = 0,1,2`; `ℚ₂(i)`; `𝔽₂((t))`, `y²−y = t⁻¹`; unramified | orders `6, 3, 1` on both sides; lower numbering would give `3` at `n = 2`. `ℚ₂(i)`: `U¹ ↠ G`, `U² ↦ 1`. Artin–Schreier: `U¹ ↠ C₂`, `U² ↦ 1`. Unramified: `G⁰ = 1` and `U⁰ ⊆ N` | holds | none |
| `localAbsoluteUpperRamificationGroup` | depth `−1`; `ℚ₂(ζ₈)`; `X³ − 5` over `ℚ₅`; `ℚ₅(ζ₅)` | `G_K`; images at depths 0–3 are `{1,3,5,7}, {1,3,5,7}, {1,5}, {1}`; `S₃, C₃, 1` with `C₃ ↦ 1` in `S₃^ab`; orders `4, 1` | determines the object | none |
| `map_artinMap_unitFiltration_eq_upper` | `n = 0`, unramified quadratic quotient of `G_{ℚ₃}^ab`; `ℚ₃(ζ₉)` at `n = 2` | both sides project to `1` and `Art(3) ↦ Frob`; `Kˣ` or depth `−1` give the whole group. Projection `1 = G² = 1` | holds | none |
| 7.1 conductor Checks | `ℚ₂(√2)`, `ℚ₂(ζ₁₂)`, `ℚ₅(μ₅)`, `ℚ₃(ζ₉)` | `f = δ = 3`; `0+0+2+2 = 4 = f·d = 2·2`; sum `3` against max `1`; conductors `0,1,2,2,2,2`, sum `9`, max `2`. Lower numbering gives sum `13` | holds | none |
| 8.1 conductor of `U(K,n)·⟨π⟩` | `ℚ₂`, `n = 1`; `ℚ₃`, `n = 1`; `ℚ₂`, `n = 2` | `U¹⟨2⟩ = ℚ₂ˣ`, conductor `0 ≠ 1`. `ℚ₃(√−3)`, with `N(√−3) = 3`: conductor `1`. `(1+4ℤ₂)⟨2⟩ = N(ℚ₂(i)ˣ)`: conductor `2` | holds | none |
| 9.1 Weil transfer | `𝔽₂((s))/𝔽₂((t))`; unramified quadratic; `ℚ₂(i)` | index `1 ≠ 2` with no embedding; `deg_K = 2 deg_L`, index 2; `deg_K = deg_L`, index 2 | holds | none |
| 10.1 lifting and the sum formula | `ℚ(√13,√17)`; `(−1,−1)/ℚ`; `ℚ(i)/ℚ` without `∞` | `lcm = 2 < 4 = #H²(G,C_L)`; `½+½ = 0`; `½ ≠ 0` | holds | none |
| 11.1 reciprocity | `ℚ(ζ₅)` at `(2),(3)`; new: `ℚ(ζ₇)` | `ζ⁶ = ζ`, `6 ≡ 1 mod 5`. `Art((2))` has order 3 (`2,4,1`) and `Art((3))` order 6 | holds | none |
| 12.1 Kummer index, moduli, meet | `ℚ(ζ₃)`, `p = 3`; `ℚ(i)` at `1, (4), (4)∞`; two `D₄` over `B` | `#U(S)/U(S)³ = 9`, `81/9 = 9`, and dropping `r` gives `3`. `Cl = 1, 1, ℤ/2`, with `Frob₃ ≠ 1`. The fibre product has order 16, abelianization 8 against 4 | holds | none |
| `isPrincipal_map_hilbertClassField` | `ℚ`; `ℚ(√−5)`, `H = K(i)`; the zero ideal | `H(ℚ) = ℚ`. `𝔭𝒪_H = (1+i)`, with `N_{H/ℚ}(𝔭𝒪_H) = 2² = 4 = N(1+i)²`. `⊥` is principal | holds | none |
| 13.1 extension of ideals | `ℚ → ℚ(i)` at 2 and 3; `ℚ(√−5) → ℚ(i,√5)` at `𝔭` | `(1+i)² = (2)`, not `(1+i)`; `3𝒪_E`, not `(9)`; `e(𝔓/𝔭) = 1`, `𝔓 = (1+i)` | holds | none |
| `count_relDiscr_eq_finsum_abelianConductor_exponent` | `ℚ(i)`, `ℚ(ζ₈)`, `ℚ(ζ₅)`, `ℚ(√13,√17)` at 13; new: `ℚ(ζ₉)` | `2 = 0+2`; `8 = 0+2+3+3`; `3 = 0+1+1+1`; `2 = 0+1+0+1`. New: the kernel of the quadratic character is `{1,4,7}` (conductor 3), the other four characters have conductor 9, so `0+1+4·2 = 9 = 3·(6−2−1)` | holds | none |
| `abelianConductor_eq_lcm` | `ℚ(ζ₈)`; `ℚ(√2)`; product and lcm swapped | `max(0,2,3,3) = 3`, with `∞` from `ℚ(i)` and `ℚ(√−2)`, giving `(8)∞`; `(8)`; `2⁸` against `2³` | holds | none |
| 13.1 Hasse and ring class Checks | `25` in `ℚ(√13,√17)`; `(−1,3)₃`; `(−1,−1)/ℚ(√2)`; `ℤ+2ℤ[i]`; `ℚ(ζ₇+ζ₇⁻¹)` | Milne VIII 3.2; `(−1/3) = −1`; `(−1,N(−1))_{ℚ₂} = (−1,1) = 1`; `h = 1·2/(1·2) = 1`, `disc = −16`; `(6/27)·7 = 14/9 < 2` | holds | none |
| 14.1 Hilbert and quadratic reciprocity | `(−1,−1)/ℚ`; `p,q = 3,7`; new: `5, 13` | `½+½ = 0`. `(7/3) = 1`, `(3/7) = −1`, product `−1 = (−1)^{1·3}`. New: `(13/5) = (5/13) = −1`, product `1 = (−1)^{2·6}` | holds | none |
| R01: the name table against #1688 | `WeilGroup` on main; at this head; the table | main `Suggested.lean:2697` declares `TauCetiRoadmap.ClassFieldTheory.WeilGroup`; this head declares 0 such; the table has 17 rows, none for it; Tau Ceti `WeilGroup/Basic.lean:181` | citation breaks on merge | R01: add the row |

## Not verifiable

- **Locators cited only as uncertified or waived:** serre-local-fields (the 7.1 locators; IV §3 Prop. 14; XIV §3; XV §2), neukirch-ant (V Thm 6.2; VI §7), nsw ((7.1.8), (7.2.5), (7.2.6), (7.3.1)–(7.3.4)) and artin-tate (XIII–XV). The manifest settles them as uncertified or waived, and they are cited by locator only. The statements they support are checked mathematically in the table.
- **`Completed/LocalGaloisGroups/Suggested.lean`:** I did not elaborate it. It imports `TauCetiRoadmap.ProfiniteCohomology.Suggested`, `Completed.ProfiniteProPGroups.Suggested` and `Completed.LocalFieldsRamification.Suggested`, whose object files are not built in this worktree. The brief allows building only Tau Ceti modules. The description reports a passing full CI build at a test merge, which I did not check.
- **#1411's current description:** I did not read it. The residual noted under previous R01 is quoted from its review PRREVIEW-ClassFieldTheory~51 at d6e2855.
- **kopp-lagarias:** I read it as arXiv v3 and did not compare it with the published numbering.

## Source issues

- **Misprint** in milne-cft at VII Theorem 9.5, printed p. 226: the source says every finite-index subgroup of the idele class group is a norm group; it should say every open finite-index subgroup, as V Theorem 5.5 and VII Lemma 9.4 do; affects nothing.
