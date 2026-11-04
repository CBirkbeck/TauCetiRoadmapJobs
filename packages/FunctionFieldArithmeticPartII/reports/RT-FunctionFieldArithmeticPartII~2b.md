<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1232#issuecomment-6636767193 -->
Red team round 2 pass b (claude) of d06bd72

Verdict: needs_changes

1. **F01** (P3) DeligneWeightsAndPurity §8.24 is cited for five declaration names that do not exist at its head

   **Location.** Line 101: "Consume §8.24's `dmStack_etaleCohomology`, `dmStack_etaleCohomology_atlas`, `dmStack_etaleCohomology_refinement`, `dmStack_etaleCohomology_pullback` and `dmStack_etaleCohomology_frobenius`"; §7.4 `*Needs:*` line 12939.

   **Claim.** The coefficient category of finite-type DM stacks is consumed through these five supplier declarations.

   **Witness.** `roadmaps grep 'dmStack_etaleCohomology'`: "no match on main or in any open roadmap pull request". DeligneWeightsAndPurity at head 6045677 (#929): §8.24 is "The weight spectral sequence of a normal crossings compactification"; its stack clause (its lines 2877–2897) constructs the rational constructible category of a finite-type DM stack over 𝔽_q by atlas descent "with invariance under atlas refinement, pullback, Frobenius descent and proper finite-dimensional cohomology", in prose, with no backticked names; its `Suggested.lean` has none either. The names existed at an earlier head (round 1 read them at its lines 3274–3294); the supplier has since dropped them.

   **Repair.** Line 101: "Consume §8.24's stack clause: for a finite-type Deligne–Mumford stack over a finite field with ℓ≠p, the rational constructible étale coefficient category built by effective étale descent from scheme atlases, with its atlas-descent equivalence, independence of the atlas with composition coherence, pullback and Frobenius functoriality, and finite-dimensionality of proper rational cohomology." Line 12939: "DeligneWeightsAndPurity §8.24 (stack clause: atlas descent, refinement, pullback and Frobenius comparisons)". Tested: the four comparisons §7.4 uses (atlas, refinement, pullback, Frobenius) are each named in that clause's API sentence (its line 2896).

2. **F02** (P3) `*Needs:*` lines carry garbled or non-declaration items

   **Location.** 32 `*Needs:*` lines (sections in parentheses): 1204 (1.59), 1527 (1.80), 2361 (1.128), 4215 (1.241), 4400 (2.5), 4562 (2.14), 4596 (2.17), 4949 (3.12), 4987 (3.13), 5721 (3.56), 6322 (3.91), 11478 (3.403), 11887 (4.4), 12402 (5.15), 12536 (5.22), 12658 (6.4), 12692 (6.5), 12763 (6.8), 12780 (6.9), 12798 (6.10), 12815 (6.11), 12832 (6.12), 12879 (7.1), 12895 (7.2), 13160 (7.14), 13514 (8.3), 13567 (8.5), 13888 (9.6), 14211 (10.4), 14227 (10.5), 14276 (10.8), 14649 (10.27); the split citation "AlgebraicCurves; Layer 12" at 12626, 12692, 12742.

   **Claim.** Every `*Needs:*` item is a section, a declared gap, a backticked pinned declaration or a supplier section.

   **Witness.** A scan of every `*Needs:*` item finds 91 items that are none of these, e.g. line 4215 "of Is Invertible; zariski Precoverage le fppf Precoverage; affine Cover", line 12536 "eval Monoid Hom; finset Prod apply; map prod; scheme Points Mul Equiv map Value", line 13888 "Divisor; degree; degree add; degree nonneg; degree zero; degree of Point; exists le degree add nsmul of Point; of Point", line 14649 "H; map; covariant Sequence; covariant Sequence exact", lines 1527/4400/11887 "pullback", line 4987 "map; eq one iff". These are camel-case names split into words (the round-4 class that round 1 noted as unrepaired). The depcheck ignores them, so they are not build edges; a reader cannot resolve them. Separately, §7.12's route (line 13114) uses §7.5's proper base change but its `*Needs:*` (13128) omits §7.5.

   **Repair.** Restore each item as the backticked fully qualified pinned name, checked at the pin, or delete it. Verified reconstructions: `AlgebraicGeometry.zariskiPrecoverage_le_fppfPrecoverage` (Mathlib `AlgebraicGeometry/Sites/Fpqc.lean:44`), `AlgebraicGeometry.flat_and_surjective_iff_faithfullyFlat_of_isAffine` (`Morphisms/Flat.lean:168`), `IsRegularRing` (`RingTheory/RegularLocalRing/Defs.lean:92`), `AdjoinRoot.mk_ne_zero_of_natDegree_lt` (`RingTheory/AdjoinRoot.lean:231`), `TauCeti.RootsOfUnityGroup.schemePointsMulEquiv_mapValue` (`RootsOfUnity/Scheme.lean:194`), `ValuationSubring.surjective_unitGroupToResidueFieldUnits` (`Valuation/ValuationSubring.lean:735`), `TauCeti.Divisor.exists_le_degree_add_nsmul_ofPoint` (`FunctionField/Divisor/Basic.lean:254`), `TauCeti.Place.exists_forall_residue_eq` (`Place/Approximation.lean:250`), `CategoryTheory.ActionCategory.stabilizerIsoEnd` (`CategoryTheory/Action.lean:102`), `CategoryTheory.Abelian.Ext.covariantSequence_exact` (`Homology/DerivedCategory/Ext/ExactSequences.lean:148`), `AlgHom.convMul_apply` (`HopfAlgebra/Convolution.lean`). Write "AlgebraicCurves Layer 12" without the semicolon at 12626, 12692, 12742. Add "§7.5 (proper base change)" to line 13128.

3. **F03** (P3) thirteen slug cross-references and pseudo-Lean notation survive

   **Location.** Lines 3887 and 3891 ("normalization-change-arrow", "normalization-base-change-natural-iso"), 5003 ("infinite-affine-quotient leaf"), 7484 ("lift-on-coefficients law"), 9227 ("independent-factorial-multiple law"), 11121 ("inverse-second-projection identity"), 13650 ("quotient-stack-algebraic"), 14102 ("root-abel-jacobi square"), 14364 and 14564 ("root-framed-support-moving"), 14559 and 14561 ("quadratic-local-values", "reciprocity-root-unit-triviality", "signed-divisor-trace"), 14659 ("inverse-image-of-unit definition"); "§3.58(1)" in 28 statements (e.g. 4842, 9869) and "AffineRing (1:A) n", "MuHopf A n" in 16 (e.g. 4790).

   **Claim.** Targets are cited by section number and every term is standard or defined here (round-1 F02 repair).

   **Witness.** None of these names is a heading or is defined; the Layer 10 slugs are the round-4 F04 list at its old lines 14371, 14534, 14566, 14571, renumbered and unrepaired. "§3.58(1)" is a Lean-style argument on a section number; §3.58 has no part (1).

   **Repair.** 3887: "§1.20 (normalization on framed arrows)"; 3887, 3891: "§1.209 (the natural base-change isomorphism of normalization functors)"; 5003: "§3.377 (the infinite affine fpqc root quotient)"; 7484: "`AdjoinRoot.lift_of`"; 9227: "§3.143 (independence of the factorial multiple)"; 11121: "§3.375 (inverse comparison and the original chart projection)"; 13650: "SchemeAndStackFoundations §1.19 (algebraicity of quotient stacks)"; 14102: "§5.9 (root Abel–Jacobi maps)"; 14364, 14564: "§10.10 (moving a root-framed line away from the branch)"; 14559, 14561: "§10.22 (split and inert Frobenius signs)", "§10.14 (quadratic reciprocity factors through the root quotient)", "§10.11 (Frobenius trace on every signed divisor)"; 14659: "the degree-zero boundary of §10.27". Write "§3.58 at f=1" for "§3.58(1)", "A[T]/(Tⁿ−1)" for "AffineRing (1:A) n" and "A[ℤ/n]" for "MuHopf A n". Tested: each target section exists at the cited heading at this head.

4. **F04** (P3) §10.18 cites FunctionFieldArithmetic §2.1 for an approximation statement it does not contain, in process wording

   **Location.** Line 14468: "This exact approximation statement is request FunctionFieldArithmetic §2.1 (adelic approximation)."

   **Claim.** Strong approximation with prescribed residue-square root frames is supplied by FunctionFieldArithmetic §2.1.

   **Witness.** FunctionFieldArithmetic at head c5d655e, §2.1 (its line 682) is "Divisor lattices": the lattice A(D), its compact openness, intersection with K and finite quotient; the word "approximation" occurs there only in a proof sketch citing AlgebraicCurves. The approximation this roadmap uses is §10.4 (line 14199), built on the pinned `TauCeti.Place.exists_forall_residue_eq` and `exists_forall_ord_sub_eq` (`Place/Approximation.lean:250`, `:89`), and AlgebraicCurves Layer 5 states strong approximation (its line 645). "is request" is process narrative.

   **Repair.** Replace the sentence by "The approximation input is §10.4 (nonzero residue interpolation), which uses the pinned weak approximation theorem; strong approximation is AlgebraicCurves Layer 5." and add "§10.4 (nonzero residue interpolation)" to the `*Needs:*` line 14474. Tested: §10.4 prescribes nonzero residues at the finitely many branch places and arbitrary finite precision, which is what the route at 14466 needs.

All line numbers refer to `packages/FunctionFieldArithmeticPartII/README.md` unless a file is named. Sources are cited as `<source id> line N` into the worker's cached extractions. Pins: Mathlib `f6090c7`, Tau Ceti `358314d4` (the manifest of the content checkout); every library name below was checked at those pins. Supplier sections were resolved on main (`a0ad405`) or at the open heads named in the brief (FunctionFieldArithmetic `c5d655e`, AlgebraicModuliForArithmeticGeometry `4f0ad34`, InverseGaloisAndArithmeticFundamentalGroups `a5186ac`, DeligneWeightsAndPurity `6045677`).

## Round-1 findings at this head

Each finding of `RT-FunctionFieldArithmeticPartII_r1a` and `_r1b` was re-checked against d06bd72.

| Finding | Status at d06bd72 | Witness |
| --- | --- | --- |
| r1a F01 build order | repaired | Script over all 816 `### a.b` headings and 2 590 section references: 0 forward `*Needs:*` edges, 0 missing internal citations. §§1.35–1.40 (chart points) sit in Layer 1 (lines 764–880); §2.4 (fpqc descent) precedes §2.7 (line 4431); §§7.3–7.7 precede §7.8 (line 12997). Layer 7 `*Needs:*` lines no longer cite the Layer 8 projective input; only §§8.2, 8.8, 8.10–8.12 do. "How to read the build" (line 109) states the order. |
| r1a F02 / r1b F03 process residue | repaired | `grep merged`, `stated coordinate construction`, `source-qualified`, `promotes a consumed API`: 0 hits. One residual process phrase remains at line 14468 (S04). |
| r1a F03 fppf stack vs fppf torsor | repaired | §3.52 line 5640: "the fppf classifying stack of fppf-locally trivial G-torsors misses this object, whereas the two-limit ... is itself an fpqc and hence an fppf stack"; residue field finite over ℚ by §3.2. |
| r1a F04 residual gerbes | repaired | `design/plan.json` gaps has `zero-dimensional-dm-residual-gerbes` (SchemeAndStackFoundations, 1.20); README line 53 states it; §5.23 cites it at lines 12546 and 12554. |
| r1a F05 reduced infinite fibre | repaired | §3.421 "The infinite DVR zero-section gerbe" (line 11730): two-limit of root gerbes banded by G_k=lim μ_n, infinitesimal μ_(p^r) in characteristic p; three Checks at 11744–11746; no "lim μ_n=Ẑ(1)" except the characteristic-zero Check. |
| r1a F06 §3.360 Checks | repaired | Lines 10766–10769: 6 vs 35 vs 41, e_(−1/3) vs e_(1/3), ℤ/4 coefficient 2, P_(1/2)(1⊗u_1)=0 vs P_(1/2)(η(u_1))=u_1; all four recomputed below. |
| r1a F07 collision Check | repaired | §7.20 line 13274: "the map of reduced residual gerbes is Bμ₂×Bμ₂→Bμ₂ ... relative reduced fibre ... Bμ₂. The full fibre retains the nilpotents s,t". |
| r1a F08 / r1b F05 locators | repaired | Every replaced line read in the cache: YZ19 6918 (Def. A.1), 6995 (Def. A.2), 6968 (A.1.2), 7015 (A.1.3), 7142 (A.1.4), 7184 (A.1.5), 7320 (§A.2), 7570 (A.2.2); AV99 189 (Lemma 2.2.3), 213 (Lemma 2.3.3); MILNE-LEC 2602, 2631, 2682, 3058, 3104; STACKS-NORMS 1513, 1536, 1553, 1591; STACKS-AFFINE-DESCENT 807, 1011; STACKS-KUMMER 1505; Stacks-finite-root-projections 46, 51; ETINGOF 1493 (Thm 3.8); CONRAD-EXT 497, 548; NOOHI 288, 700; MILNE-CFT 3357, 3368; ACV01 1594, 1615; TV17 605 (Prop. 3.2). Tag 04UJ replaced by SchemeAndStackFoundations §§1.15 and 2.3 (lines 14274, 14616). |
| r1a F09 perverse base field | repaired differently, sound | §7.7 line 12975: "supplied by DeligneWeightsAndPurity §8.24 (which constructs it over finite fields only)"; geometric stalks by pullback to geometric points (line 12977); the Bμ₂ Check is over a finite field. No consumer uses a k̄ category. |
| r1b F01 statable headline | repaired | `Suggested.lean` lines 94–100 state `rootChartCoaction_eq_includeRight_iff` with `(hn : 0 < n)`; §2.3 line 4341 names it. Truth re-checked below. |
| r1b F02 slugs | partly repaired | The 39 listed slugs are gone (checked each line). Thirteen slug cross-references outside that list remain (S03). |
| r1b F04 Checks | repaired | §§1.63/1.88 (lines 1261–1262, 1692–1693), §1.77 (1459–1460), §1.44 (965), §1.135 (2503), §3.230 (8699), §3.269 (9286), §3.284 (9540–9542); "For arbitrary positive exponent", "projection-recovery", "check naturality": 0 hits. |
| r1b F06 Tau Ceti names | repaired | Line 43 cites `TauCeti.RootsOfUnityGroup.groupScheme` (Scheme.lean:82), `.pointsMulEquiv` (Basic.lean:124), `.schemePointsMulEquiv` (Scheme.lean:101); all three exist at 358314d4. |

No repair introduced a mathematical error: the new §2.3 theorem is true as typed (row below), the renumbering kept every "§x.y (title)" reference consistent (title check of all 2 590 references; the 64 apparent mismatches are paraphrases or external-roadmap citations), and the moved sections kept their statements.

## Verified sound

**Head and policy.** Checkout at d06bd72 (the pull request's head). `git diff --stat origin/main...HEAD` touches only `packages/FunctionFieldArithmeticPartII/` (README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, five reports). No `lemma`, `set_option`, `#print`, `#eval`, `#synth`, `True` placeholder, pull-request number or job id in README.md or Suggested.lean. Every one of the 816 numbered targets and the unnumbered Layer 8 input has a locator line and a `*Needs:*` line. Section numbers §1.18, §2.10, §2.12, §2.15, §3.81, §3.96 and §10.30 are unused after the renumbering; no reference points at them (not a finding).

**Dependency check** (run from the board checkout, exact output):

```text
moved: FunctionFieldArithmeticPartII moved in the merge order from #16 to #169, right after its last supplier FunctionFieldArithmetic (AlgebraicModuliForArithmeticGeometry, InverseGaloisAndArithmeticFundamentalGroups, DeligneWeightsAndPurity also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 207 roadmaps, 1778 edges, 0 problem(s)
```

No UPWARD or CYCLE line. A local scan of every `*Needs:*` line (2 590 section references) finds no forward edge and no dangling internal citation.

**Declared gaps.** The eight gaps in `design/plan.json` (`finite-diagonalizable-coarse`, `zero-dimensional-dm-residual-gerbes`, `coherent-site-universe-lifts`, `invertible-section-coordinates`, `invertible-sheaf-universe-lifts`, `completed-lattice-root-dictionary`, `quadratic-root-residue-character`, `normal-proper-hyperplane-covers`) appear with identical `needs` sentences under "Exact supplier contracts" in the supplier's subsection (lines 51, 53, 55, 67, 69, 81, 87, 93), each with a named supplier earlier in the order or on main, each a single statement with its hypotheses; none asks for what the pins or main provide (checked: SchemeAndStackFoundations §1.20 on main has no residual-gerbe decomposition; §1.23 treats constant finite groups; no completed-lattice/line-bundle dictionary in AlgebraicCurves Layer 12; FunctionFieldArithmetic §§4.1–4.2 treat equal-characteristic local class field theory without the residue quadratic character).

**Sibling citations resolved now, not from memory.** SchemeAndStackFoundations on main §§0.1, 0.9, 1.1, 1.15, 1.16, 1.18–1.23, 2.3, 2.10, 2.11, 3.2–3.7, 4.13 (headings at its lines 487, 848, 2071, 2502, 2589, 2745–3021, 3330, 3631, 3656, 4671–4937, 5643) with `rootStack`, `rootStack.test_fibre_nonreduced`, `test_dvr_chart`, `NonabelianH1`, `affine_transition_limits`, *Torsor.hom_isIso*; AlgebraicVectorBundles L0A–L0C (215, 228, 254); ModularCurves §0F (412, Weil restriction); AlgebraicCurves Layer 12 with sublayers 12A–12E (1468, 1583) and Layer 5 strong approximation (645); JacobianChallenge Layers A–F (111–448); EtaleCohomologyFoundations §§F.0.1, F.0.2, F.0.4, F.0.A1, F.0.A2, F.1, F.2.1, F.2.6, F.2.7, F.3, F.3a, F.4.1–F.4.6, 0.11, F.5, F.6, F.8 (all `##` headings); ProfiniteCohomology Layer 10 (1549); RepresentationTheory/SchurWeyl Layer 8 (its line 352); FunctionFieldArithmetic at c5d655e §§0.1, 2.1, 4.1, 4.2, 4.5–4.10 (444, 682, 1019, 1101, 1304–1599), with §0.1 stating that an idele of degree d_v maps to arithmetic Frobenius to the d_v (line 85's convention agrees) and §4.8 stating b↦O(E(b)) (line 85's comparison agrees); AlgebraicModuliForArithmeticGeometry at 4f0ad34 §§4.3, 4.4, 4.23 with `neutralizationEquivalence`, `rootGerbe` (invertible exponent, its line 2256), `GerbeLimitFamily`, `limitStackDescent`, `nonemptyAffineLimitGerbe`; InverseGaloisAndArithmeticFundamentalGroups at a5186ac §IG.5.7 with the bold target "Finite-cover criteria for full monodromy image" (its line 6463); DeligneWeightsAndPurity at 6045677 §8.24 stack clause (S01 for its names). 61 section citations and 19 declaration names checked.

**Ownership.** `roadmaps grep` over main and all 446 open heads: "infinite root stack", "root Picard", `rootChart*` (this roadmap's names) have no other owner; "geometric class field theory" occurs in PadicDifferentialEquationsAndRigidCohomology §RD.6.62 (abelian covers from Jacobian isogenies and Katz–Lang finiteness) and AutomorphicLFunctionsAndLocalFactors AL.3.10.2 (finite-order unramified characters as covers of Pic¹), both different constructions from the lisse character sheaf on the root Picard stack built here; neither states the symmetric-power descent or any ramified object. AlgebraicModuliForArithmeticGeometry §4.3 explicitly assigns the root stack of a line bundle with a section to this roadmap and SchemeAndStackFoundations §1.21 (consistent with line 9). Ownership against open pull requests other than those read through `roadmaps grep`/`show` was not checked beyond that index.

**Pinned names.** Every backticked name in the supplier contracts (lines 35–45) resolves at the pins: `AdjoinRoot.finitePresentation` (AdjoinRoot.lean:158), `eval₂_root` (255), `liftAlgHom` (317), `algHom_ext` (203), `powerBasis'` (737), `DirectLimit.exists_eq_mk` (DirectedInverseSystem.lean:130, as cited), `finite_of_finite_type_of_isJacobsonRing` (Jacobson/Ring.lean:676, as cited), `Finset.card_product_filter_lt` (Finset/Prod.lean:367), `Nat.choose_two_right` (Choose/Basic.lean:110), `fppfTopology`/`fpqcTopology` (Sites/Fpqc.lean:53, 75), `Pseudofunctor.IsStack` (Sites/Descent/IsStack.lean:49), `Pseudofunctor.Grothendieck` (Bicategory/Grothendieck.lean:77), `MonoidAlgebra.single_pow` (MonoidAlgebra/Defs.lean:720), `rootsOfUnity` (RootsOfUnity/Basic.lean:56), the seven `exteriorPower.*` names (ExteriorPower/Basic.lean:98–181, with `toTensorPower_injective` requiring `IsUnit (n! : R)` as line 45 says), `PiTensorProduct.reindexRepresentation` (TensorAction/Basic.lean:48), `groupCohomology.natCard_nsmul_eq_zero` (Corestriction.lean:432), `AddCircle.exists_mem_torsionBy_rat` (AddCircle.lean:456), `exists_zsmul_eq_of_mem_torsionBy` (191), `TauCeti.AlgebraicGeometry.InvertibleSheaf` (LineBundle/Basic.lean), `SheafOfModules.freePUnitIsoUnit`, the weak-approximation theorems (Place/Approximation.lean:89–250). Stacks 090N at STACKS-FLAT-COLIMIT line 4437 is "a directed system of faithfully flat R-algebras has faithfully flat colimit", as §3.12(c) uses.

**Locators verified** (109, each read at the cited line): YZ19 5656, 5736, 6918, 6943, 6968, 6995, 7015, 7095, 7142, 7184, 7235, 7248, 7320, 7340, 7368, 7410, 7450, 7507, 7536, 7570, 7644, 7677, 7758, 7806, 7850, 7880, 7896; AV99 189, 213, 234; MILNE-LEC 2602, 2631, 2682, 3058, 3104; STACKS-NORMS 1496, 1513, 1536, 1553, 1591; STACKS-AFFINE-DESCENT 807, 1011, 4181; STACKS-KUMMER 1401, 1442, 1455, 1505; Stacks-finite-root-projections 46, 51; ETINGOF 1493; CONRAD-EXT 497, 533, 548; NOOHI 288, 700; MILNE-CFT 3357, 3368; ACV01 1594, 1615; TV17 605, 631, 650, 668, 702, 707, 733, 738, 778; AOV08 454, 906, 910, 924; AGV08 2404, 2431; STACKS-FLAT-COLIMIT 4437, 11925, 21359; SGA1 8303, 8308, 8606; LO-P 169, 287, 327, 354; StacksBaseChange 2815, 2818; STACKS-TORSORS 149 (03AG) and 0CJZ at its line 722; STACKS-KAROUBIAN 259 (09SH); STACKS-PROP/QF/RES 3754, 2140, 1772 with Lemmas 101.37.5 (3777), 101.21.4 (1904), 101.31.2 (3059), 0G2L (2299); STACKS 2524, 3249, 3290, 3334; StacksPic 753; StacksRes 729; STACKS-DIV 207 with Lemmas 44.3.1 and 44.3.3 (209, 268); StacksVanishing 2454; StacksLisse 4675; STACKIFICATION 825; STACKS-STACK-REGULARITY 625, 651, 664; FramedRoot 7989; NormalizationThree 1383, 1410; FramedFppfCover 837; AffineRootPointGroupoid 966. B24 is settled uncertified and cited by locator alone.

**Suggested.lean** (6 declarations read; the elaborated types in the supplied `signatures.md` compared one by one with README §§1.7, 1.26, 1.190, 1.191, 2.3; no section binder lost; both criteria and the invariants theorem carry `(hn : 0 < n)` explicitly; `(A : Type u) [CommRing A] (f : A) (n : ℕ)` on every declaration; no `set_option`; the single `import Mathlib`; no sorry'd data; the module docstring names twelve not-statable headlines and the carrier each lacks). `rootChartCoaction` has a real body: the lift obligation is (h⊗t)ⁿ − algebraMap f = 1⊗f − 1⊗f = 0. Not padding: none of the three theorems follows in one tactic, restates a definition or mirrors a Check (truth table below). No further headline is statable at the pins: the infinite coinvariant theorem needs the colimit coaction, the DM-locus and regularity theorems need `rootStack` (README-only in SchemeAndStackFoundations), and the Layer 7–10 theorems need stack lisse categories absent from both pins. No Lean build was run (not permitted here); the repair report records three `sorry` warnings and no errors at this head.

**Headline coverage** (README headlines versus the file): sharp injectivity/surjectivity (§§1.190–1.191) stated; affine coinvariants (§2.3) stated; §§2.17–2.18, 3.15/3.398/3.424, 3.385, 3.421–3.422, Layers 4–6, §§7.7, 7.11, 7.20, 7.27, 8.13, 9.5, 10.20, 10.28 named in the docstring with the missing carrier.

**Checks tested.** 63 Checks and worked examples recomputed (rows below), all agreeing with the formulas of their sections and with each other; the sign convention π_x⁻¹↦O_X(x) is used identically at lines 29, 85, 12630, 12711, 12738, 12819 and YZ19 line 7286.

## Adversarial pass

One row per statement; values on each side.

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `rootChartComparison_injective_iff` | n=1 any f; ℤ,n=2,f=2; ℤ/4,n=2,f=2; k field,n=2,f=0; zero ring | n=1: Θ=id on A⊗A≅A, both sides true. ℤ: kernel {c: 2c=0}=0 and ·2 injective, both true. ℤ/4: Θ(2(x⊗x))=4(e₁⊗1)=0 with 2(x⊗x)≠0 (free rank 4), and 2·2=0: both false. k,f=0: x⊗x↦0, ·0 not injective: both false. zero ring: both true | true as typed | none |
| `rootChartComparison_surjective_iff` | ℤ,n=2,f=2; 𝔽₂,n=2,f=1; ℤ/8,n=2,f=4; n=1; zero ring | e₁⊗1 has preimage iff 1∈fA: ℤ no, 2 not a unit; 𝔽₂ yes (Θ(x⊗x)=e₁⊗1), 1 unit; ℤ/8 cokernel ℤ/4, 4 not a unit; n=1 identity; zero ring 0 unit, map onto | true as typed | none |
| `rootChartCoaction_eq_includeRight_iff` | n=1; 𝔽₂,f=0,n=2,b=t; ℤ/4,f=0,n=2,b=2 and b=2t; zero ring | n=1: B≅A, both true. t: δ(t)=h⊗t≠1⊗t (distinct basis vectors of a free module), t∉A: both false. 2: 1⊗2=1⊗2, 2∈A: both true. 2t: 2(h−1)⊗t≠0, 2t∉A: both false. zero ring: both true | true as typed; without hn, at n=0 the right side still forces coefficients, hn kept for the README's n≥1 | none |
| `rootChartCoaction` orientation | 𝔽₇,n=3,f=1,ζ=2 | δ(t)=h⊗t specialises to 2t at ζ=2, 4t at ζ⁻¹=4 | matches §1.7 Check line 285 | none |
| Conventions line 17 | i=0,2; f=2 | u_0=f=2; u_2⁶=2, T³≠2 in ℤ[T]/(T⁶−2) (coordinate vectors (0,0,0,1,0,0) vs (2,0,…)) | true (§3.58 Check 5779) | none |
| Conventions line 27 | g=0,ρ=1,d=2; g=1,ρ=1,d=2; g=0,ρ=2 | B=2,n=3,a=2,(2,2,1); B=2,n=2,a=1,(1,2,1); B=3 | matches §§8.5, 8.12, Layer 8 Examples | none |
| Conventions line 29 norm sign | c+dt, basis (1,t) | matrix columns (c,d),(ad,c), det c²−ad²; a=0 gives c²; c=0,d=1 gives −a | matches §10.9 | none |
| §1.4 / §1.15 framed roots | ℤ/4,f=3,n=2,(u,y)=(3,1); ℤ/9,f=0,n=2 | 3·1=3; squares in ℤ/4 are {0,1} so no y'²=3; 3²=0; 0=w·3 needs w≡0 (3), no unit | Checks 208–210, 440–442 true | none |
| §1.20 arrows | ℤ/9,(1,3)→(1,6),label −1; ℤ/7,f=1,(1,1)→(2,2),label 2 | 6=−3, 1·1=1, normalized root 3T has square 9·1=0, nonzero; 2·1=2, 2·2²=8=1, T_q↦4T_p since 2⁻¹=4 | true | none |
| §1.26 Checks | ℤ/8,f=4,n=2; 𝔽₂,f=1,n=2; k,f=0 | image A³⊕4A, cokernel ℤ/4 with 2z≠0,4z=0; bijective, (x−1)²=x²−1=0; Θ(x⊗x)=0 | true | none |
| §1.28 sign | n=2; n=3 | (−1)^{1·1}=−1; rows 0,1,2 are id and two 3-cycles, (−1)^{2·3}=+1 | true | none |
| §1.44, §1.135 | ℤ/4,u=3; ℤ/7,(u,y)=(2,2) | 3T·T=9=1 so T⁻¹=3T; f=8=1, (2T)²=4·2=1, label T | true | none |
| §1.51/§1.77/§1.159 base change | ℤ/4→𝔽₂,u=3,y=1,n=2; n=1,u=3 | T²−1=(T−1)² in 𝔽₂[T], T−1≠0; D=B[T]/(T−3) has T=3↦1 | true | none |
| §1.130 determinant | n=1; n=2; n=3; ZMod1; ZMod2,f=1 | 1; −f; sign (−1)^6=+1 and weight f³; 0; −1=1 | true | none |
| §1.150 frame change | ℚ,n=2,u=y=f=1,a=2,b=1 | u'=1/4,y'=2, u'y'²=1=f'; w=1 with a_p=2 gives w'=1/2 | true | none |
| §1.202/§1.213/§1.243 kernels | ℤ/4,f=2,n=2; k,f=0,n=2,4 | 2(x⊗x)↦4(e₁⊗1)=0, ann(2)={0,2}; kernel dims 1 and 6, range 3 and 10 | true | none |
| §1.212 unit chart | 𝔽₅,v=2,n=2 | 2·3=6=1; Θ(x⊗3x)=e₁⊗3x²=e₁⊗6=e₁⊗1 | true | none |
| Layer 1 Examples line 4282 | n=0,A=ℤ,f=2 | B=ℤ[t]/(−1)=0, H⊗B=0, bijective; 0=1 false, 2 unit false | hn essential | none |
| §2.6 | ℤ/11,n=1,f=7; ℤ/4,n=2,f=0 | root t=7; coefficient 2 with (2)²=0 in chart | true | none |
| §2.13 atlas | n=1; f=0; 𝔽_p[x],f=x,n=p; f unit; ℂ,f=1,n=2 | z=qf eliminated; A[z,q,q⁻¹]/(zⁿ); x=q⁻¹zᵖ gives 𝔽_p[z,q,q⁻¹]; A[z,z⁻¹]; V₂(1)≅𝔾_m connected vs W₂(1) two points; (λw)ⁿ=λⁿf=qf and μ_n-invariance of (w,λ)↦(λw,λⁿ) | true | none |
| §2.17 regularity | 𝔸¹,D=(x²),n=2,char≠2; prime containing z | z²=qx² factors (z−√q x)(z+√q x): node; class of zⁿ−qf is −qf≠0 in cotangent space for n≥2 | hypothesis D regular necessary; proof step valid | none |
| §2.18 DM locus | Spec ℤ,s=2,n=3; s=p,n=p; char p,n=p | V(2)=Spec 𝔽₂ where 3 is a unit: DM; not DM over p; (1+ε)ᵖ=1 | true | none |
| §3.2 Eisenstein | K=ℚ(√2), n=3 | X³−2 irreducible, 3>2 | true | none |
| §3.6 coherence | ℤ, σ₁=−1, σ₂=1 | σ₂³=1≠−1=σ₁ | incoherent, as stated | none |
| §3.9 characters | n=3; 2→6; n=3,k=−1 | c₃(1)=[1/3]≠[2/3]; [1]↦[3], c₆(3)=[1/2]; val(−1)=2, [2/3]=[−1/3] (§3.28 Check agrees) | true | none |
| §3.11 coframes | M=O,φ=id,t=0; φ(eⁿ)=a,t=ce | P_n=μ_n; b with bⁿ=a, x_n=bc, (bc)ⁿ=acⁿ=f; O(P_n)=⊕_{i<n}M^{⊗i} since β↦β(m) has weight 1 | true | none |
| §3.12 towers | μ_n over ℚ, z_nⁿ=2; trivial tower; 090N | fpqc torsor without ℚ-point; P=G; colimit of faithfully flat algebras faithfully flat (STACKS-FLAT-COLIMIT 4437) | true | none |
| §3.13 Kummer coordinates | K₄(ℚ)→K₂(ℚ); ℝ; 𝔽_p(t) | [2]↦[2], squaring would give [4]=1; two compatible families 1 and ([−1]_n) (trivial at odd n); [t]_p≠1 | true | none |
| §3.29/§3.34 over ℝ | lim μ_n(ℝ) | ζ₂=ζ₄²=1: trivial, although μ_2(ℝ)={±1} | true | none |
| §3.58/§3.59 | ℤ,f=2,i=2; 2|6,3|6 | u₂⁶=2, u₂³≠2; 1+v₂+v₃=κ₆(1+t₆³+t₆²) | true | none |
| §3.114 lifts | ℚ ([2]_n); ℝ ([−1]_n); k̄ | tower z_nⁿ=2; z_nⁿ=−1 trivial at odd n; trivial | true | none |
| §3.137 diagram | ℤ/4,f=0, sixth root 2 | 2⁶=0; 6→2 image 2³=0; 4→2 kills label −1 | true | none |
| §3.145/§3.302 scaling over ℂ | σ_i=exp(2πi/d_i) | σ₁=−1 on t₂; ζ₆=(1+√3i)/2, ζ₆³=−1 agreeing with t₂=t₆³; twice gives ζ₆²=(−1+√3i)/2 | true | none |
| §3.180 | ℤ/4,f=0 | values ±1 and 0 or 2; (−1)·2=2, not separating, as the Check says | true | none |
| §3.230, §3.269 | ℤ→ℤ/4,h₁+3; ℤ→𝔽₂,i=2 | ε=1+3=4=0; wrong counit gives 2; S(h₂)=h₂⁻¹=h₂⁵ since h₂⁶=1 | true | none |
| §3.278 | ℤ,f=2 | E(v₂)=u₁ (d₁=2); T⁻¹(e_{1/2}⊗u₂)=e_{1/2}⊗v₆; wrong model e_{1/2}e_{1/6}=e_{2/3} | true | none |
| §3.303/§3.323 inverse | q=−1/3 | −1/3≡2/3, den 3, num 2: ι₃(t₃²) | true | none |
| §3.340 | 3∣6; ℤ/2,f=0,v₂ | δ(v₆)²=e_{1/3}⊗v₆²=δ(v₃); v₂≠0 not coinvariant | true | none |
| §3.360 | ℤ,q=1/2; q=1/3; ℤ/4; ℤ,f=2 | 6 and 35 (41 ignoring index); 0 and 1; 2≠0 with 2²=0; P_{1/2}(1⊗u₁)=0, P_{1/2}(η(u₁))=u₁ | true | none |
| §3.369 | n=2; n=1 | (6/2)/6=1/2; e_[1]=e_[0] | true | none |
| §3.412 origin change | λ'=vλ | arrow scalar a with v aⁿ=1, torsor aⁿ=v⁻¹; b_{λ'}=b_λ·[v] | consistent with §3.13 orientation | none |
| §3.421 band | char p; char 0 | μ_p ⊂ G_k nonreduced, k̄-points trivial; G_k(k̄)=Ẑ(1) | true | none |
| §4.6/§4.11 square action | 𝔽₅,u=2,γ=1; R=Spec 𝔽₂₅ | γ'=4, 4⁻¹·2²=1; T(𝔽₅)=𝔽₂₅ˣ of order 24 | true | none |
| §4.12 inertia | one split branch; 𝔽₅[ε],α=ε | u↦(u²,u) gives 𝔾_m; −ε≠ε | true | none |
| §5.11/§5.22/§5.23 | d=2,I={x,y}; m=3 block; D=x+y; D=2·0 on ℙ¹,R={0} | reduced point x+y; swap(0,1) sends (ζ,η) to ((ζη)⁻¹,η); 2!/(1!1!)=2 points; fibre K[s,t]/(s²+t²,st) from x₁+x₂=0, x₁x₂=0, st=0, diagonal μ₂ | true | none |
| §6.4 kernel size | r closed branch points | ∏μ₂(κ_x) has 2^r elements, not 2^{deg R} | true | none |
| §6.8 | 𝔽₇,v=2 | u=4, v⁻¹=4, 4²=2=4⁻¹ | gluing holds with v⁻¹, fails with v | none |
| §6.9, §6.11 | ℙ¹/𝔽₃, R one degree-two point; ℙ¹/𝔽₅,R={0}; C_R | 𝔽₉ˣ/squares and μ₂(𝔽₉) both order 2; v↦(v⁻²,v): (4,2) squares to (1,4)≠1, order 4, A_R≅C₄; c square in κ_x iff d even or c square in k since (q^d−1)/(q−1)≡d mod 2 | true | none |
| §6.12 sign | a_x=π_x⁻¹, deg x=2 | E=−x, O_X(x), degree 2 | agrees with YZ19 7286 and FunctionFieldArithmetic §0.1 | none |
| §7.1, §7.13 Koszul | K²,d=2; ℤ/2 | transposition acts by −1, invariants ⟨e₁⊗e₂−e₂⊗e₁⟩ rank 1=C(2,2); over ℤ/2 invariants whole line, ∧²=0 | d! hypothesis necessary | none |
| §7.2 averaging | S₂ on K², 2 invertible; ℤ/2 over ℤ/2 | e(x,y)=((x+y)/2,(x+y)/2); augmentation kills 1+g, invariants not onto | true | none |
| §7.4 lattices | 𝔽₅,E=ℚ₃,Frob↦4; J=[[1,1],[0,1]] | 4≡1 (3), 4³≡1 (9), infinite order in ℤ₃ˣ; Jⁿ=[[1,n],[0,1]], one invariant line, commutant dim 2 | true | none |
| §7.8 tameness | χ(τ)²=1, p odd | wild inertia pro-p, so χ trivial on it | true | none |
| §7.14 | A=μ₂, sign, m=2 | (−1,−1)∈N₂, product of characters 1; mixed characters give −1 | true | none |
| §7.22 duality | j_*L on X_k̄ | D(j_*L[1])=j_*L^∨(1)[1], so H² pairs with H⁰(j_*L^∨(1)); ℙ¹, R={0,∞}, Kummer χ: all cohomology 0 | true | none |
| Layer 7 Examples | dim H¹=2, d=0..3 | ∧^d dims 1,2,1,0 in degrees d | true | none |
| §8.1 bound | d≥ρ+max(2g−1,1) | deg L(−R)≥2g−1>2g−2; a=d−ρ−g+1≥max(g,2−g)≥1 | true | none |
| §8.5, §8.6 | g=1,ρ=1,d=2; (a,ρ)=(1,1),(2,1) | ranks (1,2,1), chart (u,α²); ℙ¹→W(2,1) degree 2 ramified at x=0; rank 4 cover | true | none |
| §8.3 | ℤ,(2,3); 𝔽₃[ε],(0,ε) | (2,9); (0,0) with (0,ε)≠0 | true | none |
| §9.6 | away degree-two P, d=−5, B=3 | 4[P]: −5+8=3≥3; 3[P]: 1<3 | true | none |
| Layer 9 Examples, §10.5, §10.11 | D=2x,deg x=2; d=1,2,3 | scalars a² and a⁻²; traces a, −1 (not 1), 2 (not 8) | true | none |
| §10.3 | r=id_ℤ | (1,±1) members, (−1,1) not | true | none |
| §10.14/§10.22 signs | split/inert x; π_x⁻¹ | anti-invariant line eigenvalue +1/−1; FunctionFieldArithmetic §0.1 sends π_x⁻¹ to geometric Frobenius, η of order 2 | consistent | none |
| §10.31, Worked example 8 | ℙ¹→ℙ¹,t↦t²,𝔽₅ | deg ν*O(m)=2m so O(±1) do not descend; ν_*[0']=1·[0] so Nm O(1)=O(1); 8 global root units, norm image 4, (1,1,−1) outside | true | none |
| Worked examples 3–5 | 720/5=144, 720/120=6, 120/5=24; n=3,a=2 over ℚ; ℝ | 6·24=144; arrow class [1/2], coframe [2], ratio 4 not a cube; two real classes with trivial automorphisms | true | none |

## Not verifiable

- B24 (uncertified, settled): the locators p.133 and pp.135–136 cited in §§3.2, 3.13, 3.56, 3.72, 3.74, 3.75, 3.91, 3.114, 3.115, 3.398, 3.403, 3.407, 3.412, 3.421, 3.422 and the worked examples were not read; the Kummer and reduced-fibre calculations were checked independently.
- No Lean process was run (the brief permits none here); the supplied elaborated signatures were compared with the README and the repair report's elaboration record was taken for the build.
- The deep targets (§§3.12, 3.392, 7.7, 7.11, 7.20, 8.12, 10.28) were checked for hypotheses, inputs, degenerate cases and supplier existence, not re-proved.
- Ownership against open pull requests outside the `roadmaps grep` index of 2026-11-04T16:14:02Z was not checked; the index's `resolve` output reports no missing name although S01's names are absent at the supplier head read today, so that index lags the supplier.

## Source issues

- **Misprint** in YZ19 at Lemma A.5, proof, printed p.518 (YZ19 line 7281): the source says the idele coefficient of a framed line is the local trivialization composed after the inverse generic one; with that order O_X(x) has coefficient ϖ_x, contradicting the lemma's ϖ_x⁻¹↦O_X(x)^♮ at its line 7286; it should be the generic trivialization composed after the inverse local one, as §6.5 uses; affects the proof.
- **Gap** in YZ19 at display (A.11), printed p.525 (YZ19 line 7872): the source says the four-term sheaf complex gives an exact sequence of Picard stacks without defining exactness for Picard stacks; on isomorphism classes exactness fails at the first Picard group of the cover (for ℙ¹→ℙ¹, t↦t², the invariant line O(1) is killed by 1−σ but has odd degree, so is not a pullback); it should be the two based torsor fibre sequences with their connecting obstructions, as §§10.26–10.28 state; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d06bd723cf011f1ba45bfd39b9844f3762b2041f", "job": "RT-FunctionFieldArithmeticPartII~2b", "model": "fable", "worker": "chris-x10"} -->
