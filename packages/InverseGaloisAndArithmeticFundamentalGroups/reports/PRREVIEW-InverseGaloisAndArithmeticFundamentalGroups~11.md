# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at 13ba9e1)

**Verdict:** needs changes

Full review of the head after the 172-line repair. The gate passes, the dependency check is clean,
`Suggested.lean` elaborates with `sorry` as its only diagnostic, every sampled locator that is
legally readable was found at the cited place, and every statement of the adversarial pass
survived. The four findings of the previous review are repaired (below). One P3 remains.

## R01 (P3) — Two consumed suppliers and six consumed Tau Ceti declarations are missing from the supplier contracts

**Location.**
- README:5795–5797, the `*Needs:*` line of IG.5.4 *General-genus Hurwitz comparison*:
  "ComplexComparisonPartII §§C5.2, C6.2 / `ehresmannFibration`, `riemannExistence`; … DifferentialGeometry
  Layer 3 (flows)".
- README:1477–1479, the `*Needs:*` line of IG.1.4 *Pointed finite étale covers of semisimple groups*:
  "Tau Ceti `TauCeti.FundamentalGroup.prodMulEquiv`, `FundamentalGroup.cast_map_prod_mul` and
  `TauCeti.simplyConnectedSemisimpleAffineGroupSchemeProperty.isIso`".
- README:5429 and 5448 (IG.5.1): `TauCeti.BraidGroup.permHom`, `TauCeti.BraidGroup.pureSubgroup`,
  `TauCeti.BraidGroup.orderOf_sigma`.

**Claim.** The README shape requires `## Exact supplier contracts` to list, per supplier, the
sections and declarations consumed, and each layer's `### Dependencies` to list its suppliers.
These consumptions appear only in `*Needs:*` lines:
- `DifferentialGeometry` occurs once in the whole README (line 5797). It is absent from the
  Scope list "It does not own, and consumes by name" (README:117–199), from *From the other
  TauCetiRoadmap roadmaps* (393–405), from *From other roadmaps* (407–441) and from the Layer IG.5
  *Dependencies* paragraph (7069–7111).
- `ehresmannFibration` / §C5.2 occurs only at 5784 and 5795. The *From ComplexComparisonPartII*
  table (360–369) lists §§C6.0–C6.6 only; *From other roadmaps* lists §§C−1.1, C−1.2, C1.9, C3.3,
  C4.5; the IG.5 *Dependencies* paragraph lists §§C−1.2, C1.9, C3.3, C6.2–C6.6.
- The six Tau Ceti declarations above occur nowhere in *From Tau Ceti* (267–282); the braid row
  there lists only `BraidGroup`, `sigma`, `lift`, `lift_sigma`, `strand`, `strandSucc`.

**Witness.** `grep -n` on README.md: `DifferentialGeometry` → line 5797 only; `ehresmannFibration`
→ lines 5784, 5795; `simplyConnectedSemisimpleAffineGroupSchemeProperty` → lines 1449, 1479;
`BraidGroup.permHom` → line 5429. None of these lines lies in the supplier-contract section
(233–442). The cited objects do exist: ComplexComparisonPartII at its open head has
`### C5.2 Families, Ehresmann and the Gauss–Manin connection` with `ehresmannFibration`;
DifferentialGeometry on main has `### Layer 3: flows`; the Tau Ceti names are at
`TauCeti/AlgebraicGeometry/AffineGroupScheme/SimplyConnected.lean:98` (`isIso`),
`TauCeti/AlgebraicTopology/FundamentalGroup/Product.lean` (`prodMulEquiv`),
`TauCeti/AlgebraicTopology/FundamentalGroup/TopologicalMonoid.lean` (`cast_map_prod_mul`) and
`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:136, 358, 504`.

**Repair.**
1. *From ComplexComparisonPartII* table: add a row "Proper-submersion trivialization |
   ComplexComparisonPartII §C5.2 / `ehresmannFibration` | IG.5.4 applies it to proper smooth
   pointed families on manifold charts, with horizontal lifts tangent to the labelled sections".
2. *From the other TauCetiRoadmap roadmaps* (393–405): add "DifferentialGeometry Layer 3 (flows of
   vector fields, used by IG.5.4)"; add the same roadmap to the Scope list at 117–199 and to the
   Layer IG.5 *Dependencies* paragraph, together with §C5.2 / `ehresmannFibration`.
3. *From Tau Ceti* table: add the six declarations, with their files, in two rows: the braid names
   `TauCeti.BraidGroup.permHom`, `TauCeti.BraidGroup.pureSubgroup`, `TauCeti.BraidGroup.orderOf_sigma`
   (IG.5.1) on the existing braid row, and a new row for
   `TauCeti.simplyConnectedSemisimpleAffineGroupSchemeProperty` with `.isIso`,
   `TauCeti.FundamentalGroup.prodMulEquiv`, `TauCeti.FundamentalGroup.cast_map_prod_mul` (IG.1.4).

Tested on the refuted instance: with these additions every roadmap and Tau Ceti declaration named in
a `*Needs:*` line of IG.1.4, IG.5.1 and IG.5.4 has an entry in the supplier-contract section. The
remaining `*Needs:*`-only names are small Mathlib lemmas (for example
`Polynomial.irreducible_X_sub_C`, `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`), which the
*From Mathlib* table summarises by topic; that convention is unchanged from the previous rounds and
is not part of this finding.

## Previous findings

- **R01 (Fitting and Schur–Zassenhaus declarations): repaired.** `Suggested.lean` has 36
  declarations and 18 `sorry` warnings (lines 78–388); `fitting`, `exists_conj_eq_of_isComplement'_of_coprime`
  and the five Fitting lemmas are gone. The docstring (19–24) reads "Layer IG.3 contributes rational
  rigidity and the stable classification of generating braid orbits. Layer IG.4 contributes split
  nilpotent embedding problems, Shafarevich's theorem, …". README:4191 reads "define the Fitting
  subgroup `F(G)` as the supremum of the nilpotent normal subgroups of `G`"; the two `*Lean:*`
  lines are deleted; *Fitting supplements* (4243–4249) keeps only the three results it proves.
  `grep -c 'fitting G\|exists_conj_eq' README.md` = 0.
- **R02 (arithmetic representations restricted to characteristic zero): repaired.** README:1374–1375
  now reads "a finitely generated field `K` of any characteristic"; the finite-image Check
  (1392–1398) argues by descent to a finite separable `K′/K` with orbit of size at most `[K′ : K]`;
  the `𝔾_m` Check is restricted to characteristic zero (1399); a characteristic-`p` Check
  (1402–1409) gives the Artin–Schreier classes `y^p − y = x^m`, `p ∤ m`, as independent elements
  of `K̄[x]/℘(K̄[x])`, and the character of `y^p − y = x` with one-element orbit. I recomputed:
  the monomials `x^m` with `p ∤ m` are linearly independent modulo `{g^p − g}`, so the index-`p`
  open subgroups are infinite in number, while the cover `y^p − y = x` is defined over `𝔽_p`, so
  its orbit is a point.
- **R03 (two locators): repaired.** README:6809 reads "n° 4, the proof, pp. 133–137"; the
  Aschbacher chapter citation is deleted and README:3286–3287 reads "Source: Ribes–Zalesskii,
  *Profinite Groups* (2010), Theorem 2.3.15, for a finite group with the discrete topology."
- **R04 (build overview): repaired.** README:450–453 reads "Of Layer IG.3, Layer IG.4 consumes
  directly only *Reduced Schur covers*, *Conjugacy classes lift bijectively* and *The kernel of the
  universal marked extension*, …, and *Conjugacy of coprime complements*", which is the list of the
  IG.4 *Dependencies* paragraph (5312).

The change set also moves *The Lang–Weil estimate* out of IG.2.5 and consumes it from
SieveMethodsAndPrimePatterns §5.4 (README:292–296, 2119–2121, 2295–2297, 2512). At the head of that
pull request, `### 5.4 affine sieve data and saturation` contains the target *Lang–Weil estimate for
a fixed model* (its line 3589) with the same hypotheses as the contract row here: separated
finite-type model over `O[1/m]`, geometrically irreducible generic fibre of dimension `d`,
`#𝒱(κ(v)) = Nv^d + O(Nv^(d − 1/2))` for `v ∤ m`, constant depending on the model. That roadmap is
earlier in the merge order (line 55 against 60) and does not cite this one, so there is no cycle.
`weil_bound` and the old target name occur 0 times in the README.

## Verified sound

**Gate, build, dependency check.**
- The worker's gate at 13ba9e1: every counter 0, `OK`.
- `lake env lean Suggested.lean`: exit 0, 18 diagnostics, all `declaration uses sorry`, at lines
  78, 82, 89, 104, 112, 119, 127, 181, 236, 256, 263, 279, 304, 326, 345, 370, 377, 387; nothing else.
- Dependency check, output: `depcheck: 235 roadmaps, 2439 edges, 0 problem(s)`. No UPWARD, CYCLE or
  `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder: empty. `metadata.toml` is `topic = "math.NT"`.
- Lean form: single `import Mathlib` plus four existing `TauCeti.*` modules; no `lemma`,
  `set_option`, `#eval`, `#print`, `#synth`; no sorried data; module docstring names the headlines
  that are not statable (trace formulas, local-system categories, pro-étale `π₁`, Hurwitz schemes,
  Brauer–Manin density, Property E, patching).

**`#check @name` for all 36 declarations.** The file is a `module` without `public section`, so I
appended the 36 `#check @` lines to a scratch copy and elaborated it: every type printed and each
matches its README statement; no section binder is lost (for example `shafarevich` keeps
`[Group.IsSolvable G]`, `hasRegularRealization_of_rigid` keeps `[CharZero K]`, `[Finite G]` and
`Subgroup.center G = ⊥`, `abhyankar_affine_curve` keeps `[IsAlgClosed k]`, `[CharP k p]`,
`D.Nonempty`).

**Padding probe.** A scratch copy replacing every `sorry` by
`first | rfl | (simp; done) | infer_instance | decide | trivial` leaves all 17 theorems written with
`:= by` open (every one fails at the last alternative); `isHilbertian_of_numberField` is a term-mode
`sorry` that the substitution did not reach, and it is Hilbert's theorem over number fields. No
declaration is padding.

**Headline theorems.** The end theorems of README:38–42 that are statable at the pins are stated:
`isHilbertian_of_numberField`, `hilbert_irreducibility`, `IsHilbertian.infinite_full_group`,
`HasRegularRealization.exists_disjoint_realizations`, `hasRegularRealization_of_rigid`,
`LiftingInvariant.stable_classification`, `shafarevich`. The Hurwitz component identifications are
named in the docstring as not statable (Hurwitz schemes absent at the pins).

**Library declarations at the pins.** Mathlib 1b1ccf4: `#check` in a scratch file resolved
`Ideal.inertia`, `groupHomology.H2`, `groupHomology.H2π`, `groupHomology.cycles₂`,
`Subgroup.QuotientDiff`, `Subgroup.exists_smul_eq`, `Subgroup.exists_right_complement'_of_coprime`,
`QuaternionGroup.card`, `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`,
`InfiniteGalois.isOpen_iff_finite`, `InfiniteGalois.normal_iff_isGalois`,
`Subgroup.isNilpotent_iff_lowerCentralSeries`, `IsGalois.normalAutEquivQuotient`,
`CategoryTheory.PreGaloisCategory.functorToContAction`, `RatFunc.denom_add_dvd`,
`RatFunc.denom_mul_dvd`, `RatFunc.eval_algebraMap`, `RatFunc.eval_eq_zero_of_eval₂_denom_eq_zero`,
`Polynomial.finite_setOfPred_isRoot`, `Set.Finite.exists_notMem`,
`Polynomial.natDegree_eq_of_le_of_coeff_ne_zero`, `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`,
`HasStrictFDerivAt.implicitFunctionOfProdDomain`, `AddCommGroup.equiv_directSum_zmod_of_finite`,
`CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity`, `AddCommGrpCat.injective_of_divisible`,
`IsKrasner`, `exists_finite_inj_algHom_of_fg`, `Submodule.basisOfPid`, `Group.rank`,
`IntermediateField.LinearDisjoint`, `IsIntegrallyClosedIn`, `Submodule.IsLattice`,
`NumberField.finrank_eq_one_of_unramified`, `FiniteField.frobeniusAlgEquivOfAlgebraic`,
`FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`, `Ideal.card_inertia_eq_ramificationIdxIn`
and the rest of the *From Mathlib* table. `grep -ril fitting Mathlib/GroupTheory` is empty, as
README:4188 says. Tau Ceti 2fd255d: every name of the *From Tau Ceti* table and of the `*Needs:*`
lines was found as a declaration, including `adicOfIrreducible`
(`FieldTheory/FunctionField/Place/RatFunc/Basic.lean:252`), `valuation_ofIrreducible_le_one_iff`
(`…/RatFunc/Order.lean`), `integers` (`…/Place/Basic.lean:132`),
`characterTransgression_injective_of_range_inl_le_commutator`
(`GroupTheory/GroupExtension/Character/Basic.lean`), `permHom` (`…/Braid/Basic.lean:358`),
`pureSubgroup` (:504), `orderOf_sigma` (:136), `nonempty_splitting_iff_cohomologyClass_eq_zero`
(`GroupTheory/GroupExtension/Cohomology.lean:319`), `FiniteEmbeddingProblem.obstruction`
(`…/EmbeddingProblem/Cohomology.lean:87`), `stabilizer_eq_decompositionSubgroup`,
`decompositionQuotientInertiaEquiv`, `card_inertiaSubgroup`, `mem_inertiaSubgroup_of_mk_eq_artinMap`,
`IsTopologicallyFinitelyGenerated.of_openSubgroup`, `PrimeToPTateModule`,
`simplyConnectedSemisimpleAffineGroupSchemeProperty.isIso`, `FundamentalGroup.prodMulEquiv`,
`cast_map_prod_mul`, `IsFunctionField`, `genus`, `Place.restrict`, `Place.ramificationIdx`.
`TauCeti.FiniteEmbeddingProblem.IsSolution` (`…/EmbeddingProblem/Basic.lean`) requires an open
kernel, so the "continuous surjective solution" of README:4150 is exactly
`exists_proper_solution_of_split_nilpotent`.

**Cross-roadmap citations, resolved at the heads the brief gives.**
- ArithmeticGaloisDuality (#858): `### R02.3.0d Finite Galois localization and Sha kernels`,
  `### R02.3.1 The group G_{K,S} …`, `### R02.4.2 The local terms` with *Unramified classes are exact
  annihilators*, *Restricted products of local cohomology and `Ш^r_S`*, *`P^r_S(K, M)` is dual to
  `P^{2−r}_S(K, M^D)`*, `### R02.4.3 Poitou–Tate duality` with the nine-term sequence,
  `### R02.4.5a Finite-coefficient Poitou–Tate input`, `### R02.4.5b Grunwald–Wang and its exceptional
  class`, `### R02.4.6 All-place kernels, Grunwald–Wang and character roots` (the README's *Torus Sha
  duality and adelic annihilators* is a target in that section).
- ArithmeticGaloisRepresentations (#856): `### 6.4a Frattini detection of full profinite image` with
  *Finite Frattini quotient of a compact matrix group*; `## Layer 3: Artin and Swan conductors`,
  `### 3.1`, `### 3.4 Functoriality` (base change of Swan conductors).
- AdelicAlgebraicGroups (#792): `### 4.1 Weak approximation and torsors` with *Hasse kernel and
  injectivity* and `Approximation.hasWeakApproximation_of_simplyConnected`.
- ComplexComparisonPartII (#848): `### C-1.1`, `### C-1.2`, `### C-1.3`, `### C1.9`, `### C3.3
  Derived GAGA for proper algebraic spaces` (`derivedGagaProperSpace`), `### C4.5 Connectedness of
  affine curves` (`affineCurveCompletionInterface`, `puncturedRiemannSurfaceConnected`,
  `affineCurveConnectedness`), `### C5.2` (`ehresmannFibration`), `### C6.0`–`### C6.6` with
  `complexAlgebraicTopology`, `riemannExistence`, `artinComparison`, `artinComparisonCompactSupport`,
  `relativeArtinComparison`, `adicArtinComparison`.
- AlgebraicModuliForArithmeticGeometry (#853): `### 9.4` (`localIsomorphismResolution`), `### 9.5`
  (`sncCompactification`). AbelianSchemesAndArithmeticModuli (#849): `### A3.2`, `### A4.1 The
  integral Tate module` (`AbelianTate`), `### A6.10` (`End.trace`), `### A6.11` (`charpolyTate`); its
  mention of `VanishingCycles.curveEndomorphismTrace` (its lines 245–248, 3930–3933) is a
  downstream-consumer note, not a `*Needs:*` edge.
- SieveMethodsAndPrimePatterns (#1495): §5.4 as above; it cites this roadmap 0 times.
- On main: EtaleCohomologyFoundations `## F.0.A0`, `## F.0.A1`, `## F.0.A2`, `## F.3a`, `## F.4.0`,
  `## F.5`, `## F.6`, `## F.10.1`, `## F.10.2`, `## F.10.2b`, `## F.10.3`, `## F.10.4`, `## F.10.5`,
  `## 0.7`, `## 0.8`, `## 0.9`, `## G.1`–`## G.3`, with every `VanishingCycles.*`,
  `ClassicalAlgebraic.*`, `ContinuousRep`, `GaloisLattice.IntegralModel`, `HenselianTrait`,
  `tameCharacter_*`, `cycleClasses`, `freeTorsor*` name present in its README and Suggested.lean; it
  defines none of the four IG.0.T names, which SchemeAndStackFoundations (main README:7388–7391) and
  AbelianSchemesAndArithmeticModuli consume from this roadmap. SchemeAndStackFoundations §§0.7, 0.9,
  0.12, 0.14, 0.15, 0.21, 1.1, 2.11, 2.16, 2.17, 3.2, 4.10, 5.1, 5.6, 5.9 exist with
  `scheme_riemann_hurwitz`, `grothendieck_existence`, `isReplete_proetale`,
  `popescu_desingularization`, `henselian_smooth_lifting`, `finite_presentation_limits`,
  `qcoh_fpqc_descent`. AdicEtaleGeometry `### A4.2 finite étale torsors` with `galoisTensorMap`;
  EnhancedDerivedSheaves §§0.1–0.4 with the three `ClassicalDerived.*` names;
  ResolutionOfSingularitiesCharacteristicZero `### 5.5 Local-isomorphism resolution`, `### 6.2 SNC
  compactification`; ReductiveGroupsPartII RG2.0a; ClassFieldTheory Layers 5, 7, 10, 11, 12;
  Chebotarev Layer 10; GlobalNumberFields Layers 0–1; AlgebraicCurves Layers 3, 4, 5, 7, 8 (*Galois
  II*), 12; ModularCurves `### 0C. Finite quotients and torsors`, `### 0D. Finite étale schemes and
  Galois actions`; ReductiveGroups Layers 0, 3, 6; InductionRestriction Layer 7 (Schur multiplier);
  DGFloer Layer 1; AlgebraicTopology Stage 8; StableReduction Layer 7; ProfiniteProPGroups Layers 0,
  3, 4, 5; ProfiniteCohomology Layers 1, 5, 6, 7, 10; ProfiniteArithmetic Layers 0, 2;
  PolynomialGaloisGroups (Completed) Layers 2, 3, 9; BelyiMaps Layers 0, 3, 5, 6, 11, 12, 13 and
  milestones 2.4, 6.3, 8.6, 9.8, 12.4, 12.12, 13.5; JacobianChallenge Layers A–D;
  DifferentialGeometry Layer 3.

**Overlap leads (`scratch/overlaps.md`).** "PolynomialGaloisGroups Layer 9 dropped by #763 and
#986" is a false positive: both heads add a new folder `TauCetiRoadmap/PolynomialGaloisGroups`
("part III", respectively "radical solvability") whose first lines link the completed base roadmap,
and `Completed/PolynomialGaloisGroups/README.md:1385` is still "### Layer 9: `Sₙ` as a Galois group
over `ℚ`". No open pull request changes this roadmap. Ownership against the sibling checkouts: the
two restored group-theory inputs are still owned here only (FiniteGroupExtensionSplitting,
OddOrderTheorem and FiniteGroupInvariants consume them from a roadmap the project never cites), and
no `Suggested.lean` of a readable roadmap declares a name in this roadmap's namespace.

**Seeded sample: sources read at the cited place.** Ids are the cache texts; `stacks-0A48` and
`masser-zannier-2020` were fetched through the sources service for this review (the service recorded
both in the board package manifest; nothing in the pull request was changed).

| Target (README line) | Text read | Result |
| --- | --- | --- |
| Comparison with the lisse part (757) | kedlaya-liu 1301.0792v5 lines 785–800 (Def. 1.4.1, p. 20), 818–833 (Rem. 1.4.4, p. 21, citing SGA 5 VI §1.2.4 at 821–822); bhatt-scholze 1309.1198v2 lines 2892–2923 (Lemma 6.8.13, Prop. 6.8.14, pp. 61–62) | Correct |
| Representations and bounded lattice schemes (830) | kedlaya-liu lines 818–833 (Rem. 1.4.4), 834–847 (Ex. 1.4.5–1.4.6), 848–881 (Rem. 1.4.7 (a)–(c), incidence modulo `p^{4m}`), 885–903 (Lemma 1.4.8), 904–908 (Rem. 1.4.9, normal Noetherian), pp. 21–23 | Correct; see *Source issues* for Rem. 1.4.4's full-faithfulness sentence |
| Pro-étale fundamental groups and torsors (878) | bhatt-scholze lines 3163 (Lemma 7.3.9, p. 67), 3242 (Lemma 7.4.1, p. 69), 3273–3278 (Lemma 7.4.3), 3300–3322 (Lemmas 7.4.6–7.4.7, p. 70), 3346–3358 (Lemma 7.4.10, p. 71), 2983–2985 (Prop. 7.1.5, p. 64), 3044 (Lemma 7.1.8, p. 65), 3077–3090 (Thm 7.2.5, pp. 65–66); caraiani-scholze lines 311–318 (Prop. 1.13, Rem. 1.14, printed pp. 656–657), 2901 (Rem. 4.3.14, p. 721) | Correct |
| Finite étale covers over a henselian local base (1181) | stacks-0A48 lines 872–900 (Lemma 9.1, any henselian local `A`, proper `X`; complete case by algebraization, then the full-faithfulness graph argument); sga1 lines 7135–7136 (IX Thm 1.10, p. 179, complete local Noetherian base), 8125–8126 (X Thm 2.1, p. 206, `π₁` form) | Correct; the README's Noetherian hypothesis is the layer convention, narrower than Stacks |
| Membership by reduced denominator (1623) | debes lines 5087–5116 (§5.2.1, printed pp. 135–136), 5134–5160 (§5.2.2, Prop. 5.2.5, p. 137); Mathlib `RatFunc/Basic.lean`, `AsPolynomial.lean` | Correct; Dèbes is cited as motivation only, as the README says |
| Denominator product of a polynomial (1790) | the same; `RatFunc.denom_zero`, `denom_algebraMap` resolved by `#check` | Correct |
| Simultaneous avoidance (1906) | the same; `Set.Finite.union`, `Set.Finite.exists_notMem` resolved | Correct |
| The integral thin-set count (2099) | masser-zannier-2020 lines 1029–1055 (proof of Lemma 5.1, printed p. 659: Frattini subgroup open, thin set `Ω`, Cohen's theorem `≪ N^{G−1/2} log N`, citing Cohen p. 229 and Serre's Lectures p. 177) | Correct; Serre's *Topics* not readable |
| A rigid `S₃` cover and its dessin (2969) | Serre §8.1 not readable; computed below | Mathematics correct |
| Coprime semidirect products and admissible inertia (3317) | lwzb 1907.05002v2 lines 2428–2469 (Lemma 12.10 and proof, p. 53), 2476–2533 (proof of Thm 10.4, p. 54), 1844–1851 (Thm 10.4, p. 39) | Statements 1–3 match; the complement conjugacy step is Schur–Zassenhaus as the README says |
| Torus types and Brauer–Manin descent (4431) | harpaz-wittenberg 1802.09605v2 lines 309–321 (Thm 2.1, p. 8), 322–346 (Cor. 2.2 and proof), 373 (Prop. 2.3, p. 9), 448–466 (Prop. 2.6, sign `ε_σ(α′) = ε_0(α′) − ⟨α′, [σ]⟩`, p. 11), 473–485 (Prop. 2.7), 509 ((3.1), p. 12), 947–975 (Thm 6.6 and the type-existence step, p. 23) | Correct, including the sign |
| Collectively coprime realization degrees (4775) | harpaz-wittenberg lines 1152–1163 (Rem. 7.11, p. 28: moving zero-cycles into a Hilbert subset; degree-one cycle on `SL_n/Γ`) | Correct |
| Fixed-degree Hurwitz mod-`ℓ` comparison (5985) | evw lines 1628–1646 (Prop. 7.8, `ℓ > max(|G|, q, n)`, and (7.8.2), printed pp. 769–770), 1604–1625 (proof of Prop. 7.7, p. 769); lwzb lines 1834 (Lemma 10.3, p. 39), 2161 (p. 46) | Correct |
| Harbater's theorem for the punctured line (6953) | hops 1408.0859v1 lines 511–538 (Thm 3.13 and sketch, p. 12), 536–540 (Rem. 3.14, p. 13), 433–445 (Thm 3.6, Cor. 3.7, pp. 10–11), 464–505 (Thms 3.8, 3.11, pp. 11–12), 317 (Conj. 3.2, p. 8), 378 (§3.2.1, p. 9) | Correct |
| Symmetric groups as realizations (7260) | Completed/PolynomialGaloisGroups README:1385; Tau Ceti `Symmetric/Basic.lean`, `Symmetric/Realization.lean` | Correct; Serre §4.4 not readable |

Also read for the repaired findings and the headlines: raynaud-bourbaki-286 (page range), wood-lifting
lines 53 (Lemma 2.1, p. 2), 90–124 (Lemmas 2.2–2.4, Thm 2.5, p. 3), 186 (Thm 3.1, p. 5), 408 (Thm 5.2,
p. 10), 456 (Rem. 5.4, p. 11), 480 (Thm 6.1, p. 11); wood-moments lines 471 (Lemma 3.2), 519, 631
(Lemmas 3.3, 3.11), 678 (Thm 3.13), 1050 (Prop. 4.4), 1097 (Thm 4.5), 1138 (Thm 4.7), 1393
(Conj. 5.1); schmidt-wingberg lines 130–246 (Props 2, 5–7, pp. 3–11), 321–353 (Def. 9, Lemma 10,
Prop. 11, pp. 10–11), 383 (Lemma 12), 447 (Thm 13, p. 14), 665, 721 (Thms 14–15, pp. 20–22),
1078–1081 (Props 16–17, p. 32).

**Adversarial pass.** Each row gives the values computed on each side.

| Statement | Instances and values | Result |
| --- | --- | --- |
| Comparison with the lisse part (757) | Constant tower `(ℤ/p^n)^r ↦ ℤ_p^r`. `𝔾_m`: monodromies `u, u′` tensor to `uu′` on both sides. Artin–Schreier–Witt torsor composed with `ψ(a) = (1+p)^a`: level `n` is `ℤ/p^n` with action through `ψ∘θ`, monodromy `1 + pℤ_p` infinite. Nodal curve, monodromy `p`: `p·p^aℤ_p = p^{a+1}ℤ_p ≠ p^aℤ_p`, no stable lattice | Holds |
| Bounded lattice schemes (830) | Trivial rank one: lattices `p^aℤ_p`, `−m ≤ a ≤ m`, `2m+1`; submodules of `ℤ/p^{2m}`: `2m+1`; free submodules: `0` and the whole, `2`. `L_0 = X` | Holds |
| Pro-étale `π₁` (878) | Normal `X`: isomorphism (BS 7.4.10). Nodal curve: surjection onto discrete `ℤ`; the rank-one `ℚ_p` system with monodromy `p` factors through no finite quotient. Discrete `ℤ`: open profinite subgroup `{0}` | Holds |
| Henselian local base (1181) | `A = ℤ_p`: unramified extensions ↔ finite fields. `ℤ_(5)[i]`: disc `−4` a unit, closed fibre `𝔽_5[x]/(x²+1) = 𝔽_5 × 𝔽_5` since `2² = 4 ≡ −1`; connectedness lost. `Spec ℂ((t))` over `ℂ[[t]]`: empty closed fibre, cover `ℂ((t^{1/2}))` | Holds; hypotheses necessary |
| Membership by reduced denominator (1623) | `(T²−T)/T = T−1 ∈ R_0`; `T/T² = T⁻¹ ∉ R_0`; `denom(0) = 1`; `T ∈ R_0` with value `0` | Holds |
| Denominator product (1790) | `D(T⁻¹Y + T⁻¹) = T²`, lcm would give `T`; `D(C((T²−1)/(T−1))) = 1`; `D(0) = 1` (empty product); `D(C(T⁻¹)) = T ≠ 0` with `T(0) = 0` | Holds |
| Simultaneous avoidance (1906) | `𝔽_2`, `A = 𝔽_2`: `K ∖ A = ∅`; `(T²−T)Y+1` over `𝔽_2` loses degree at `0` and `1`; `{Y²−T}` over `ℚ`: `t = 4` admissible, `Y²−4` reducible | Holds; infinite `K` needed |
| Integral thin-set count (2099) | Squares in `[−N, N]`: `⌊√N⌋+1 ≤ C√N log N`; `E = {1,…,M}` at `N = M`: `C_E ≥ √M/log M`; `N = 1`: `log 1 = 0 < 1` | Checks correct |
| Rigid `S₃` cover (2969) | Pairs of distinct transpositions: `3·2 = 6`, third entry forced, centraliser trivial: one orbit of size 6. `y³−3y+2 = (y−1)²(y+2)`, `y³−3y−2 = (y+1)²(y−2)`; critical values `∓2` at `y = ±1`. `disc_y(y³−3y−x) = 108 − 27x² = 27(4−x²)`, a nonsquare in `ℚ(x)`, so the group is `S₃`; geometric monodromy `S₃` of order 6 = degree, so the closure is regular | Holds |
| Coprime semidirect products (3317) | `C₃ ⋊ C₂ = S₃`: `c` = 3 transpositions, `M = 0`. `C₃ × C₂ = C₆`: `c` = the one element of order 2, generating `C₂`; admissibility fails. `H = 1`, `Γ = 1`: identity covers. `M(G) = M_H × M_Γ` since the exponent divides `|H||Γ|` | Holds |
| Torus types and descent (4431) | `V = PGL₂ ⊂ ℙ³`: `Pic(V_k̄) = Hom(μ₂, k̄^×) = ℤ/2`, boundary quadric of class 2, so `T̂ = {(n, r) : n ≡ r}` ≅ `ℤ` with `Q̂ = 2ℤ`; dual `1 → μ₂ → 𝔾_m →^2 𝔾_m → 1`. Sign of Prop. 2.6 as displayed. Split `𝔾_m`: `H¹(k, 𝔾_m) = 0`, one twist | Holds |
| Coprime degrees (4775) | `G = 1`: `n = 1`, `E_1 = K`, `gcd = 1`. `n = 0`: `Finset.univ.gcd = 0 ≠ 1`, excluded. Degrees `2, 3`: gcd `1`, no degree `1` | Holds |
| Fixed-degree mod-`ℓ` comparison (5985) | `n = 2`, `ℓ = 2`: `PConf₂(ℂ) ≃ ℂ^×` by `x₂ − x₁`, `Conf₂(ℂ) ≃ ℂ^×` by the discriminant, quotient = squaring, inducing `2 = 0` on `H¹(−, 𝔽_2) = 𝔽_2`, while `S₂` acts on `H¹(PConf₂, 𝔽_2)` by `−1 = 1`, so invariants `𝔽_2 ≠` image `0` | Holds; `ℓ > n` needed |
| Harbater's theorem (6953) | `C_m`, `p ∤ m`: `y^m = x`, tame over `0`. `(ℤ/ℓ)²`: `G/p(G) = G` not cyclic; prime-to-`p` `π₁(𝔾_m)` procyclic. Quasi-`p`: `G/p(G) = 1` | Holds |
| Symmetric groups (7260) | `n = 1`: trivial; `n = 2`: `C₂`; `X²` not separable; `X³−3X+1`: disc `−4(−3)³ − 27 = 81`, group `C₃ ⊊ S₃` | Holds |
| `IsHilbertian`, `isHilbertian_ratFunc`, `hilbert_irreducibility` (Lean 71–99) | `𝔽_2`: `Y²+Y+T` reducible at `t = 0`, `Y²+Y+T+1` at `t = 1`, no common `t`. `𝔽_2(S)` at `t = S`: `Y²+Y+S` irreducible (simple pole at `∞`, `a²+a` has even pole order). Guard `Y − 1/g`: regular exactly where `g(t) ≠ 0`. `r = 0`: empty point | Holds |
| `IsHilbertian.infinite_full_group` (104) | `Y²−T`: `t = 2` gives `C₂`, `t = 1` splits, `t = 4` keeps degree 2 but splits. Constant `c ≠ 0`: separable, trivial group, all `t`. `f = 0`: not separable, excluded | Holds |
| `of_isGalois_of_one_lt_finrank`, `not_isTopologicallyFinitelyGenerated`, `normal_subgroup_…_eq_bot` (112–130) | `M = ℚ(μ_{2^∞})`, `L = M(∛2)`: `[L : M] = 3`. `r` primes give `C₂^r`. `N = Γ_{ℚ(i)}`: index 2, `ℚ(i)^×/ℚ(i)^{×2}` infinite, not f.g. `ℝ`: `Γ_ℝ = C₂`, not Hilbertian | Holds |
| `IsRationalClass`, `IsRigid`, `hasRegularRealization_of_rigid` (154–184) | `S₃`, `(2A, 2A, 3A)`: one orbit. `C₃`, `{a}`: `a² ∉ {a}`. `C₂`, `r = 1`: product `g ≠ 1`. `G = 1`, `r = 0`: rigid, `L = K(T)`. `Multiplicative ℤ`: `Nat.card = 0`, excluded by `[Finite G]` | Holds |
| `ReducedSchur.degree`, `LiftingInvariant.stable_classification` (206–250) | `C₂`, `c = {g}`: `U ≅ ℤ`, `deg[g]^n = n`, one orbit for each `n ≥ 1`. `G = 1`, `c = {1}`: `U ≅ ℤ`, degree = length, `(1, b) ↦ (b, 1)` preserves it. `Π t = Π t′` forces equal degrees, so the one-sided bound suffices | Holds |
| `exists_proper_solution_of_split_nilpotent`, `shafarevich` (256–266) | Kernel `1`: `β = s∘π` surjective. `C₄ → C₂`: no section, excluded. `S₃` via `ℚ(∛2, ω)`. `IsSolution` requires an open kernel | Holds |
| `IsSupersolvable`, the two Grunwald statements (270–322) | `S₃`: `1 < A₃ < S₃` by adjoining `(123)` then `(12)`. `A₄`: only `V₄` is normal proper nontrivial, not cyclic over `1`. `G = 1`: `n = 0`. `C₈`, `K = ℚ`, `S = {2}`: `8 ∈ (2)`, excluded (Wang). `QuaternionGroup 2`: order `8 = 2^{0+3}` | Holds |
| `exists_realizations_coprime_degrees` (326) | as *Coprime degrees* above | Holds |
| `abhyankar_affine_curve` (345) | `g = 0`, `D = {∞}`: bound `0`, `C_ℓ` (`ℓ ≠ p`) excluded, `C_p` allowed (`y^p − y = x`). `D = ∅` excluded by `hD`, else `0 − 1 = 0` would admit `C_p` on `ℙ¹`. Elliptic `C`, `D = {O}`, `G = C_p × C_ℓ²`: rank of `C_ℓ²` is `2 ≤ 2·1 + 1 − 1` | Holds |
| `exists_realization`, `exists_disjoint_realizations`, `inverseGaloisProblem_of_regular` (370–388) | `ℚ(T)(√T)` at `T = 2`. `M = ℚ(√2)`: `t = 3` disjoint, `t = 8` gives `M`, `t = 6` with `M = ℚ(√2, √3)` is inside `M`. Universe `0` on both sides of the implication | Holds |
| Arithmetic representations, characteristic `p` Check (1402) | `𝔽_p(s)`: classes of `x^m`, `p ∤ m`, independent in `K̄[x]/℘(K̄[x])`; infinitely many index-`p` subgroups. `y^p − y = x` over `𝔽_p`: orbit of one element | Holds |
| Frobenius normalisation Check (1125) | `ℙ¹_{𝔽_2} ∖ V(T²+T+1)`: `τ₁ ↦ τ₂² = τ₁^{−2}`; on `C₃`, `−2 ≡ 1`, trivial; `τ₁ ↦ τ₁²` nontrivial on `C₃` | Holds |
| Restricted-ramification adapter Check (4071) | `F = ℚ(√−35)`, `L = ℚ(√5, √−7)`: `5·(−7)·(−35) = 1225 = 35²`; `−7 ≡ 1 (8)` splits `2`; at `3`, `−35 ≡ 1 (3)` splits, `−7 ≡ 2 (3)` nonsquare in `𝔽_3` | Holds |
| Euler characteristic Checks (6834) | Trivial `M`: `2g + s − 1`. `y² − y = x`, `ℓ = 3`: `0 − dim H¹ = 1·(2−0−1) − 1 = 0`. Pullback `x = z³`: `Sw = 3`, `dim H¹ = 2`; `Y²W + YW² + Z³` has partials `W², Y², Z²`, smooth, one point at infinity, genus 1 | Holds |
| Serre's solvable step, growth formula (6893) | `d(φ_m) = m·Sw − dim H = m(d(φ) + dim H) − dim H = m·d(φ) + (m−1) dim H`; `S₃`, `m = 3`: `2 = 3·0 + 2·1` | Holds; HOPS's `d′ = md` is the misprint already recorded |
| Hyperelliptic coordinate group Check (6495) | `(−1, 2, 1)(1, 3, −1)`: `ab′ + b = −3 + 2 = −1`; `d² = aⁿ` checked for `n = 2` | Holds |
| Cyclotomic twist Checks (3449) | `C₅`, unit `2` on `(2, 0, 1, 0)` indexed `(a, a², a³, a⁴)`: `m²(d²) = m(d)` gives `(1, 2, 0, 0)`; unit `3`: `(0, 0, 2, 1)`. `S₃`: `(12)(23) = (123) ≠ (23)(12) = (132)` | Holds |

**Declared gaps.** None declared, and none should have been: every supplier citation I checked
exists where it is cited.

## Not verifiable

- **Serre, *Topics in Galois Theory*** (Cor. 3.2.2, 3.2.4, Prop. 3.3.1, 3.3.3, Cor. 3.3.4, Thm 3.4.1,
  3.4.4, 3.6.2, Appendix §§10.1–10.4, §4.4, §8.1, Thm 8.1.1): no legal open copy; the cache has only
  citations of it. The mathematics of the sampled targets that cite it was checked in the rows above.
- **Fried–Jarden, *Field Arithmetic*** (Thm 13.4.2, 13.9.1(b), Prop. 16.11.6), **Poonen** §8.2,
  **Kollár** IV.6.10, **Huppert** and **Ribes–Zalesskii** (uncertified in the manifest): cited by
  locator only.
- **Published page numbers** of Wood's moments paper and of EVW are taken from the NSF and Annals
  copies in the cache; Milne's and McCullough–Wanderley's cached texts were not opened this round.

## Source issues

- **Error** in kedlaya-liu at Remark 1.4.4, p. 21 (lines 832–833): the source says the functor from
  isogeny `ℤ_p`-local systems to `ℚ_p`-local systems is fully faithful for every scheme; it should
  assume `X` quasi-compact (bounded denominators), since on `⨿_{n≥0} Spec k` the endomorphism
  `(p^{−n})_n` of the constant rational system is not an isogeny morphism; affects a stated remark
  (the README's Check at line 757ff. already restricts to connected `X`).
- The three source issues of the previous review (wood-lifting Thm 2.5 proof, wood-moments
  Conjecture 5.1, lwzb Corollary 12.9) and the HOPS misprint `d′ = md` noted at README:6908 stand.
