# Review of ClassFieldTheory (pull request #1215 at c408926)

**Verdict:** needs changes

Seven findings, all P3. None of them changes a statement's truth. The six open theorems of
`Suggested.lean` hold on every instance tested below, every sampled locator checks out, and the
dependency check is clean.

## R01 (P3) — The depth-0 case of absolute unit-filtration reciprocity is already at the pin; the closure is redundant

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md` lines 1333–1344, "the closure of the image of `U(K,n)` under `artinMap` … is the image of `localAbsoluteUpperRamificationGroup K n`". Also `Suggested.lean` lines 125–131, `((unitFiltration K n).map (artinMap K)).topologicalClosure = …`.

**Claim.** Tau Ceti already proves the case `n = 0`, and the README doesn't cite it anywhere: not in Layer 7, not in the supplier table, not in the route. The `topologicalClosure` changes nothing. `U(K,n)` is compact and `artinMap` is continuous in either characteristic, so the image is already closed in the Hausdorff `G_K^ab`. The README proves closedness for the other side only. Consumers state the closure-free form: PadicPeriodRings speaks of "the compact image of `U_F^n`".

**Witness.** `TauCeti/NumberTheory/ClassFieldTheory/Local/Unramified.lean:475`, `map_artinMap_unitFiltration_zero : (unitFiltration K 0).map (artinMap K) = (inertiaSubgroup K).map (QuotientGroup.mk' _)`. Compactness is `UnitFiltration/Basic.lean:478` (`isCompact_unitFiltration`); continuity is `Local/ArtinMap.lean:248` (`continuous_artinMap`, no characteristic hypothesis).

**Repair.**
- In Layer 7, cite `map_artinMap_unitFiltration_zero` as the proved depth-0 case and use it in the route, together with the API bullet "the term at 0 is the native inertia subgroup".
- Drop `.topologicalClosure` from `closure_map_artinMap_unitFiltration_eq_upper`. Change the prose to "the image of `U(K,n)`", and give closedness by `isCompact_unitFiltration` and `continuous_artinMap`.
- Test: at `n = 0`, the repaired statement is literally Tau Ceti's theorem once the term at 0 is identified with `inertiaSubgroup K`.
- The name `closure_map_artinMap_unitFiltration_eq_upper` may stay, since the README's name table maps other roadmaps' names onto it.

## R02 (P3) — The supplier contracts omit the inputs of the open targets

**Location.** README "Exact supplier contracts", lines 587–630. For example, the Layer 7 conductor row (line 613) lists only `conductorExponent`, `conductorIdeal`, `characterConductorExp`, `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` and `conductorExponent_fixedField_ker`.

**Claim.** The open targets are the only work left. Their routes and the one definition consume pinned declarations that appear only in the *Needs:* lines, or in the Lean file, and not in the contracts.

**Witness.** None of the following occurs in lines 579–663.
- Tau Ceti: `artinMap_quotient`, `normResidue_mk`, `normResidue_mk_eq_one_iff`, `conductorExponent_le_iff_upperRamificationGroup_eq_bot`, `LocalFieldsRamification.artinConductorExponent_le_iff`, `LocalFieldsRamification.finsum_artinConductorExponent_eq_discriminantExponent`, `AlgHom.restrictNormalHom_restrictNormalHom`, the four `finiteIntermediateField*` structures, `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`, `localArtinAt`.
- Mathlib: `cyclotomicCharacter`, `AlgEquiv.restrictNormalHom`, `InfiniteGalois.restrictNormalHom_continuous`, `CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity`, `MonoidHom.domRestrict_surjective`, `CommGroup.card_domRestrictHom_ker`.

**Repair.** Add these names:
- to the "From Tau Ceti" table, as a row "inputs of the open targets (Layers 7 and 13)", together with `map_artinMap_unitFiltration_zero` and `isCompact_unitFiltration` from R01;
- to the "From Mathlib" paragraph, with their files.

Every name is present at the pin (checked; file and line under Verified sound).

## R03 (P3) — Two other open pull requests rewrite this roadmap differently, and no order is stated

**Location.** The pull-request description, and this folder's `README.md` and `Suggested.lean`.

**Claim.** #617 and #1411 both change this README and `Suggested.lean`, and both conflict with this head. #1411 states this head's Layer 13 target under another name. The description doesn't say which merges first.

**Witness.**
- `roadmaps overlaps ClassFieldTheory` reports "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `…/Suggested.lean`", and the same for #1215 and #1411.
- At #1411's head, README line 563 names `relDiscr_eq_finprod_abelianConduc…`, where this head has `count_relDiscr_eq_finsum_abelianConductor_exponent`.

**Repair.** State in the description that this pull request merges first, and that #617 and #1411 then rebase on it, keeping only the ClassFieldTheory edits this head lacks. #1411's Layer 7 names are already mapped at README lines 280–281. This is still unrepaired from the previous review.

## R04 (P3) — An edit outside the declared folders: `Completed/LocalGaloisGroups/Suggested.lean`

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` (62 insertions, 50 deletions). The edits are the `TauCeti.ClassFieldTheory.*` re-pointing at lines 245–470, and line 345, `ClassFieldTheory.cyclotomicCharacter_artinMap p F u hu σ hσ`.

**Claim.** The pull request edits a Completed roadmap that the brief doesn't name as one of its folders. The brief names only GlobalQuadraticForms and QuadraticFormInvariants. The edit can't be avoided: that file imports this roadmap's `Suggested.lean` (line 12), which no longer declares `ClassFieldTheory.H`, `kummerEquiv_mixed` and the other names it used (main, lines 321–325). The gate's `outside-folder` count doesn't flag this path; the brief's rule does.

**Witness.** The brief's `git diff --stat origin/main...HEAD`, with the three declared folders excluded, prints `Completed/LocalGaloisGroups/Suggested.lean | 112`.

**Repair.** Declare `Completed/LocalGaloisGroups` in the description as a folder of this pull request. Add one sentence: the edit only re-points that file from this roadmap's former declarations to Tau Ceti's names, plus the open target `cyclotomicCharacter_artinMap`. Test: with that folder excluded too, the same command prints nothing.

## R05 (P3) — A module attributed to Tau Ceti is Mathlib's

**Location.** README lines 645–646: "consumed through the pinned Tau Ceti modules `NumberTheory/LocalField/Basic`, `FiniteExtension/`, …".

**Claim.** There is no `NumberTheory/LocalField/Basic` at the pinned Tau Ceti. The local-field class comes from Mathlib.

**Witness.** The pinned Tau Ceti `NumberTheory/LocalField/` has no `Basic.lean` and no `Basic/`. Mathlib's `Mathlib/NumberTheory/LocalField/Basic.lean:46` declares `class IsNonarchimedeanLocalField`.

**Repair.** Replace that clause with: "Mathlib's `Mathlib/NumberTheory/LocalField/Basic.lean` (`IsNonarchimedeanLocalField`) and the pinned Tau Ceti modules `NumberTheory/LocalField/FiniteExtension/`, `UnitFiltration/`, `Herbrand/`, `Different/` and `Discriminant/`". Also add `IsNonarchimedeanLocalField` to "From Mathlib".

## R06 (P3) — The `p = 2` half of a Layer 7 Check also holds for the inverse normalization

**Location.** README lines 1354–1356: "At `p = 2`, `−1` acts by `−1`, while `−3` acts on `μ₈` by exponent `5`, since `5² ≡ 1 mod 8`."

**Claim.** Every element of `(ℤ/8)ˣ` is its own inverse, so on `μ₈` the geometric convention `χ(Art u) = u` gives the same values. The arithmetic convention `χ(Art u) = u⁻¹` does too. This half of the Check cannot detect the sign error the first half (`ℚ₃`, `4 ↦ 7` versus `4`) is built for.

**Witness.**
- On `μ₈`: arithmetic gives `(−3)⁻¹ ≡ 5`, geometric gives `−3 ≡ 5`; arithmetic gives `(−1)⁻¹ = −1`, geometric gives `−1`. The two conventions agree.
- On `μ₁₆`: `−3 ≡ 13`, and `13 · 5 = 65 ≡ 1`, so arithmetic gives 5 and geometric gives 13.

**Repair.** Read the `p = 2` case on `μ₁₆`: "`−3` acts on `μ₁₆` by exponent `5`, since `13 · 5 ≡ 1 mod 16`; the geometric normalization gives `13`." Keep `−1 ↦ −1` as the involution test.

## R07 (P3) — A missing blank line makes Tau Ceti's consequences render as open targets

**Location.** README lines 1235–1236: "…`Herbrand/UpperQuotient.lean`." is followed directly by "**Character conductors, as consequences of the contract.** …".

**Claim.** Without a blank line, Markdown reads the paragraph as a lazy continuation of the `normResidue_map_unitFiltration` bullet. The two following bullets (lines 1254–1264, the discriminant sum and the conductor maximum) then render as further items of the list headed "The **open targets** of this layer are". Those two results are Tau Ceti's, as the paragraph itself says.

**Witness.** Line 1235 ends a list item, and line 1236 starts at column 0 with no empty line between them. The next `- ` at line 1254 continues the same list.

**Repair.** Insert an empty line before line 1236. Optionally, put the paragraph under its own bold lead after the open-target list ends, as the absolute-filtration paragraph at line 1275 is.

## Verified sound

**Gate and dependency check.**
- I reran the gate with the brief's command. Every count is 0 except `outside-folder`, whose five hits are all in GlobalQuadraticForms and QuadraticFormInvariants. The brief names both as this pull request's own, so they are not findings. The worker's gate, run with those folders declared, passes, build included.
- Dependency check (`--movable`): `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `lake env lean` on `Suggested.lean`: six `declaration uses 'sorry'` warnings (lines 79, 95, 125, 140, 151, 165) and nothing else.

**Signatures and padding probe.** I ran `#check @` on all seven declarations of a scratch copy, and every elaborated type matches its README statement.
- Each carries its binders explicitly; for example `[ValuativeExtension K L] [Module.Finite K L] [IsGalois K L] [IsMulCommutative Gal(L/K)]` on `normResidue_map_unitFiltration`, and `[IsAbelianGalois K L]` on both conductor theorems.
- The one definition, `localAbsoluteUpperRamificationGroup`, has a real body: an `⨅` of `comap`s.
- One-tactic probe (`first | rfl | simp | infer_instance | exact localCyclotomicCharacter_artinMap_unit …`): none of the six theorems closes. `cyclotomicCharacter_artinMap` fails because Tau Ceti's theorem needs `ValuativeExtension ℚ_[p] F`, and no pinned instance or theorem supplies it. I searched for `instance.*ValuativeExtension` and `ValuativeExtension ℚ_[p]` across Tau Ceti and Mathlib.

**Headline theorems.**
- The open headlines are the cyclotomic normalization at a unit, the finite and absolute unit-filtration reciprocity, the principal ideal theorem, and both halves of the conductor–discriminant formula. All six are stated, none through a stand-in, and none restates a pinned declaration.
- I searched Tau Ceti for `unitFiltration`/`upperRamificationGroup` theorems, `IsPrincipal`, and `relDiscr` in `ClassFieldTheory/`. Only the depth-0 case of R01 exists.
- The headline results the docstring credits to Tau Ceti are all declared and `sorry`-free, with no `axiom` under `NumberTheory/`. That covers the 46 key names I checked, among them `tateTheorem`, `localAbelianExistence`, `injective_artinMap`, `localWeilArtinEquiv`, `brLocalization_injective`, `globalAbelianExistence`, `cyclicHasseNorm`, `kroneckerWeber` and `hilbertProductFormula`.
- A further 100 worked-example and global-layer names are all present: `localArtinMap_Q2_zeta5`, `globalArtinMap_zeta5_two`, `not_isAdmissibleModulus_one_Qi`, `surjective_ideleToClassH2_of_isCyclic`, `globalNormSubgroup_kummerLayer_sUnits`, and the rest.

**Library declarations opened at the pins.**
- Tau Ceti:
  - `Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311` (`localCyclotomicCharacter_artinMap_unit`, with `[ValuativeExtension ℚ_[p] F]`);
  - `Local/Reciprocity.lean:162` (`normResidue`);
  - `LocalField/UnitFiltration/Basic.lean:104` (`unitFiltration`, which is `𝒪ˣ` at 0);
  - `LocalField/RamificationGroup.lean:86` (`RamificationIndexDomain = Ici (-1)`);
  - `Global/AdmissibleModulus/Basic.lean:193` (`abelianConductor`, no hypothesis on `L/K`);
  - `NumberField/Global/RayClass/Modulus.lean:98` (`finitePart_ne_bot`, so `normalizedFactors` is never applied to `⊥`);
  - `Local/Conductor/UpperNumbering.lean:64, 121, 130`;
  - `LocalField/Herbrand/UpperQuotient.lean:98`;
  - `LocalField/Herbrand/ArtinConductor.lean:83`;
  - `LocalField/Discriminant/Conductor.lean:58`;
  - `FieldTheory/Galois/Restriction.lean:146`;
  - `TateCohomology/Projective/Basic.lean:123, 232, 251` and `NakayamaRim.lean:117`, whose hypotheses match the Layer 0 descriptions and the name table;
  - `Formation/PrincipalIdeal.lean:67`;
  - `Topology/Algebra/ValuativeRel/ContinuousRingHom.lean:174`.
- Mathlib:
  - `NumberTheory/Padics/Hensel.lean:460`;
  - `RingTheory/Valuation/Algebraic.lean:28`;
  - `GroupTheory/FiniteAbelian/Duality.lean:63, 107, 133`;
  - `FieldTheory/Galois/Profinite.lean:148`;
  - `FieldTheory/Normal/Defs.lean:195`;
  - `NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107`;
  - `RepresentationTheory/Homological/ContCohomology/Basic.lean:131`;
  - `FieldTheory/AbsoluteGaloisGroup.lean:101`.

**Cross-roadmap citations resolved.**
- ProfiniteCohomology Layers 0–12, on main: Layer 1 carrier, Layer 4 colimit, Layer 9 Kummer, Layer 12 cup with `cup_add_left`/`cup_gradedComm`/`cup_coeffMap` at `Suggested.lean:3890, 3949, 3987`.
- ProfiniteProPGroups Layer 0, Completed: closed normal quotients, and `ProfiniteGrp.closedSubgroup_eq_sInf_open`.
- GlobalNumberFields Layers 0–2, 4–8, 7, 9–11, Completed.
- NumberFieldArithmetic Layer 2, §§4.1, 4.2 (`relDiscr_localization`), 5.9 and 5.10 (`v_𝔭(relDiscr) = Σ f(P/𝔭) v_P(𝔇)`), Completed.
- GlobalQuadraticForms §4.2 (global square theorem) and §4.3 (quadratic Hasse norm adapter), at this head.
- QuadraticFormInvariants' consumption of `hilbertSymbol_eq_cohomological` and `hilbertSymbol_productFormula`, at this head.
- LocalGaloisGroups: all 38 consumed names in the boundary paragraph occur in its README or `Suggested.lean`.
- FunctionFieldArithmetic §4.2 (#1474): it hands unit-filtration reciprocity to this roadmap's Layers 6–7, line 139.
- RamificationOfCompleteDiscretelyValuedFields §4a.1 (#1410): its lines 123–131 assign the local-field absolute upper filtration to this roadmap's Layer 7 and own only the valuation-subring generalization. Single direction, no second owner.
- FilteredLocalGaloisGroups (#1795) takes the filtration from RamificationOfCompleteDiscretelyValuedFields and owns none of it.
- PadicPeriodRings (#940) and LocalAnabelianGeometry (#1811) consume the absolute comparison, under names this README's table maps.
- ArithmeticGaloisRepresentations (#856) declares `gap:unit-filtration-reciprocity` on this roadmap. This head's two Layer 7 targets state what that gap asks for, at integer depths. Hasse–Arf gives every real depth.
- Overlap facts: §2.5 and §2.6, cited by AnticyclotomicLocalUnits and EllipticCurveModularityWild3Adic, are mapped to C.5 and C.6 (README lines 252–253). Of the 446 declarations main's `Suggested.lean` had, 103 have no pinned successor; 18 of those are mapped in the name table. A grep of main and the 256 local open-pull-request checkouts found no other roadmap citing any of the remaining 80, apart from instance names.
- Ownership by object: the principal ideal theorem and the global abelian conductor–discriminant formula have no other owner. ArithmeticGaloisRepresentations §3.5 and ArtinRepresentations treat the Artin-conductor formula for representations, which is a different object.

**Source sample.** Each target was checked against its text, at the locator.
- 0.1–4.1, 9.1, 11.1, 14.1 carry no source locators of their own. C.4 cites milne-cft line 3911, II Thm 3.11, p. 84: hypotheses (a) and (b). The README's third hypothesis follows from Milne's proof (line 3919).
- 5.1: milne-adt line 1073, I Thm 2.1, p. 26; line 1138, Cor 2.3, p. 28; line 1227, Thm 2.8, p. 31: `χ = (R:mR)⁻¹`, which gives `p^{[F:ℚ_p] v_p(#A)}`.
- 6.1: NSW, uncertified.
- 7.1: serre1961 lines 931–938, Prop 3 and the limit paragraph, p. 128.
- 8.1: milne-adt line 1078, footnote 6, p. 26: `1+𝔪 ≅ ∏ℤ_p`, and a proper subgroup containing `⊕ℤ_p` is not closed.
- 10.1: milne-cft lines 9602 (VII §4, p. 211), 9665 (Thm 5.1(c), p. 212), 9996/10007 (Prop 7.2, Lemma 7.3, p. 220), 10042/10059 (Thm 8.1(b), Ex 8.2, p. 221), 10117/10144/10175 (Lemmas 8.4–8.6, pp. 222–223) and 11011 (VIII Thm 4.7, p. 242).
- 12.1: milne-cft lines 10189 (Lemma 9.1), 10218 (Lemma 9.3, `S ⊇ S_∞`, index `p^s`, p. 224), 10279 (Lemma 9.4) and 10287 (Thm 9.5).
- 13.1: milne-cft lines 10629/10642 (VIII Thm 3.1, Remark 3.2 with `5²` and `ℚ(√13,√17)`, p. 234), 7252 (V Thm 3.17, p. 161) and 7423–7447 (Thm 3.27, product and lcm; Rem 3.28; Ex 3.29–3.30, p. 165); kopp-lagarias lines 128, 160 and 174 (Thms 1.1–1.3, pp. 3–4).
- Further locators checked: III Prop 1.9 (line 4641, p. 102), III Thm 3.1 and Lemma 3.2 (lines 4822 and 4844, p. 107), V Ex 3.2 (line 7004, p. 157), V Thm 3.5 (line 7041, p. 158), V Ex 3.11 (line 7121, p. 159), VIII Thm 4.2 (line 10937, p. 241), and ADT Lemmas 2.10 and 2.12 (lines 1266 and 1350).

**Adversarial table.** "arith" is the arithmetic normalization `χ(Art u) = u⁻¹`, "geom" the geometric one.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `cyclotomicCharacter_artinMap` (7.1) | `F=ℚ₃`, `u=4` on `μ₉`; `F=ℚ₂`, `u=−3` on `μ₁₆`; the hypothesis-removal route | `4⁻¹≡7 mod 9`; geom gives 4. `−3≡13`, `13·5≡1 mod 16` gives 5; geom gives 13. `v(1−p)=0`, so `v(p)>0`; a valuation trivial on `ℚ_p` is trivial on `F` (Algebraic.lean:28) | holds | none (R06 for the README Check) |
| `normResidue_map_unitFiltration` | `ℚ₃(ζ₉)`, `n=0,1,2`; `ℚ₂(i)`; unramified; `L=K`; `𝔽₂((t))`, `y²−y=t⁻¹` | image orders 6,3,1 equal `#G⁰,#G¹,#G²`; lower gives 6,3,3. `U¹→G`, `U²→1`, with `G^1=G`, `G^2=1`. `U⁰→1=G⁰`. Trivial on both sides. Break 1: `U¹→C₂`, `U²→1` | holds | none |
| `localAbsoluteUpperRamificationGroup` | `ℚ₂(ζ₈)`; `X³−5/ℚ₅`; `ℚ₅(ζ₅)`; `v=−1` | depths 0–3: `{1,3,5,7}`,`{1,3,5,7}`,`{1,5}`,`{1}`. `S₃`,`C₃`,`1` at −1,0,1; an abelian-only definition sends `C₃` to 1 in `C₂`. Depth 0 has order 4, positive depths 1. All of `G_K` at −1 | determines the object | none |
| `closure_map_artinMap_unitFiltration_eq_upper` | `n=0`; `ℚ₃(ζ₉)` quotient, `n=2` | `n=0` is Tau Ceti's `map_artinMap_unitFiltration_zero`. Image 1 equals `G²=1`, while `#G₂=3` | holds | R01 |
| `isPrincipal_map_hilbertClassField` | `K=ℚ`; `K=ℚ(√−5)`, `H=K(i)`; `I=⊥` | `h=1`, `(2)` principal. `𝔭²=(2)=((1+i)²)`, so `𝔭𝒪_H=(1+i)`. `⊥` maps to `⊥` | holds | none |
| `count_relDiscr_eq_finsum…` | `ℚ(i)`; `ℚ(ζ₈)`; `ℚ(ζ₅)`; `ℚ(ζ₉)`; `L=K` | 2=0+2. 8=0+2+3+3. 3=0+1+1+1. 9=0+1+2·4. 0=0 (`relDiscr=⊤`; the conductor of `K/K` is 1) | holds | none |
| `abelianConductor_eq_lcm` | `ℚ(ζ₈)`; `ℚ(√2)`; product/lcm swap | max 3 gives `(8)·∞`, ∞ from `ℚ(i)`. `(8)`, no ∞. The swap gives 8 against 3 | holds | none |
| 0.1 Nakayama–Rim, `C₂` | `ℤ[C₂]`, trivial `ℤ`, zero module | `Ĥ⁰=0`; `ℤ/2≠0`; 0 | holds | none |
| 2.1 fundamental class | cyclic degree 4; inflation to degree 8 | inv `1/4`, res `1/2`, cor∘res `1/2=inv(2u)`; `2/8=1/4` | holds | none |
| 4.1 quadratic and Klein layers | degree 2; `V₄` | nonzero iff non-norm; three non-norm cosets with three distinct symbols | holds | none |
| 5.1 Euler characteristic | `ℚ₂`: `𝔽₂`, `𝔽₃`, 0; `ℚ₇`, `μ₃`; `𝔽₂((t))` | `8=2·2·2`, `3=3·1·1`, `1=1`; inv `1/3`, geom `2/3`; odd poles independent | holds | none |
| 6.1 | unramified quadratic `ℚ₃`; `ℚ₂(ζ₅)`; `cd₂ 𝔽₂((t))` | `Art 4=1`, `Art 3=Frob`; `2↦ζ₅²`, inverse gives `ζ₅³`; `cd₂=1` | holds | none |
| 7.1 conductors | `ℚ₂(√2)`, `ℚ₂(ζ₁₂)`, `ℚ_p(μ_p)`, `ℚ₃(ζ₉)` | `f=3=δ`; `0+0+2+2=4=f·d`; sum `p−2`, max 1; disc `12−3=9` | holds | none |
| 8.1 | `ℚ₂`, `n=1`; `𝔽_p((t))` | `U¹⟨2⟩=ℚ₂ˣ`, conductor 0; an index-`p` subgroup that is not open | holds | none |
| 9.1 | `ℚ₂(i)`; unramified quadratic; `𝔽₂((√t))` | `deg_K=deg_L`, index 2; `deg_K=2deg_L`; index 1, no `ι` | holds | none |
| 10.1 | `ℚ(√13,√17)`; `(−1,−1)/ℚ` | local degrees ≤2, lcm 2 against `[L:ℚ]=4`; `½+½=0` | holds | none |
| 12.1 Kummer case and meet formula | `ℚ(ζ₃)`, `p=3`; two `D₄` extensions | `9=3^{1+1}`, `81/9=9`, dropping `r` gives 3; `G^ab` of order 8 against 4 | holds | none |
| 13.1 Hasse norm and ring class fields | `5`, `3` over `ℚ`; `ℚ(√2)`; `ℤ+2ℤ[i]`; `ℚ(ζ₇+ζ₇⁻¹)` | `(−1,3)₃=−1`; ramified only at the two real places; `h=2/(1·2)=1`; `14/9<2` | holds | none |
| 14.1 | `p=3`, `q=7` | `1·(−1)=−1=(−1)³` | holds | none |

## Not verifiable

These sources are uncertified or waived in the manifest, so I didn't open them; each is cited by locator only.

- neukirch-ant: V Thm 6.2 and VI §7.
- serre-local-fields: IV §1, IV §3 Prop 14, VI §2, IX §8, XIV §3, and XV §2 Thm 2 / Cor 3 to Thm 1. I checked the statements they support mathematically, in the table above.
- nsw: (7.1.8)(i), (7.2.5), (7.2.6), (7.3.1)–(7.3.4).
- artin-tate: XIV §§1–6 (p. 163), XIII, XV, XII, XI §5.

## Source issues

- none
