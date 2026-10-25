<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6392153810 -->
Review (claude) of 3062436

Verdict: needs changes

1. **F01** (P1) §2.10a(c) relies on McCallum's perfectness theorem, which no target or supplier owns

   **Location.** `README.md` line 710 (§2.10a): "For (c), Grothendieck's pairing `Φ_A×Φ_{A^∨}→ℚ/ℤ` is perfect when k is finite (McCallum)". The *Needs:* line at 728 cites only NeronModelsAndSemistableAbelianVarieties §§2.5 and 4.6. The supplier contract at line 77 claims (c) as this roadmap's own target.

   **Claim.** The route to (c), #Φ_A(k)=#Φ_{A∨}(k) for every abelian variety, uses perfectness of Grothendieck's pairing over a finite residue field.

   **Witness.**
   - `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md` (open head), line 2374, §4.6: "Perfectness beyond the semistable case is not asserted."
   - `torsion_and_tamagawa_numbers` lines 1545–1547 attribute the finite-residue-field case to McCallum, Duality theorems for Néron models, 4.8.
   - `roadmaps grep` finds no other owner, and McCallum is not in `sources.toml`.

   **Repair.**
   - Add a target in §2.10a: Grothendieck's pairing Φ_A×Φ_{A∨}→ℚ/ℤ is perfect when the residue field is finite. Give its source (McCallum, Duke Math. J. 53 (1986), 4.8), add the work to `sources.toml` (uncertified if it is paywalled), and list it in the *Needs:* line of (c).
   - Alternatively, declare `gap:neron-pairing-perfect-finite-residue` with supplier NeronModelsAndSemistableAbelianVarieties §4.6, in the README and in the plan's `gaps`.
   - In the same subsection, cite ReductiveGroupsPartII RG2.3.7 for Lang's theorem H¹(k,𝒜°_k)=0 used in (b). RG2.3.7 is that roadmap's README line 5201 at its open head; it is earlier in the merge order and is its declared single owner.

   Tested on the instance that refutes the current text: an abelian surface A with additive reduction and A≇A∨, so that (c) is not the tautology it is for an elliptic curve. NeronModels §4.6 supplies no perfectness for it. After the repair, its input is the new target or the declared gap.

2. **F02** (P2) §§6.23–6.25 plan again the Pila–Wilkie machinery that the earlier supplier B2.6 provides

   **Location.** `README.md` §6.25, line 2036: "#{x∈X_t∩ℚ^n:H(x)≤T, x∉(X_t)_alg}≤C T^ε", proved from §§6.23–6.24 (lines 2006–2030). §6.27, line 2070, imports "the parameter-uniform block decomposition of … B2.6".

   **Claim.** This roadmap plans the uniform Pila–Wilkie bound and its proof ingredients itself.

   **Witness.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md` (open head), lines 1333–1335: B2.6 "construct[s] the parameter-uniform block decomposition". `on_the_algebraic_points_of_a_definable_set` lines 269–273 (Theorem 3.5(2)–(3)) show that this covering yields N(X−X_ε,T)=O(T^ε) with X_ε⊂X_alg.

   That roadmap is at position 130 of the merge order and this one at 154, so the counting machinery now has two owners.

   **Repair.**
   - Restate §6.25 as a corollary of B2.6 (with b=0, or after adjoining a dummy coordinate) and §6.26: positive-dimensional blocks lie in X_alg, and the points outside lie in at most cT^ε zero-dimensional blocks.
   - Delete §§6.23–6.24, or keep them only as one sentence citing the route inside B2.6. Record the deferral under Scope and ownership.
   - `pila_wilkie` stays as the Lean acceptance statement.
   - If the maintainer prefers this roadmap to own the general block theorem, B2.6 must cite it, which needs a change to the merge order outside this package. Note this in the repair report.

   Tested: with b=0, B2.6's covering contains Pila 2009 Theorem 3.5(2), which implies the Lean statement `pila_wilkie` for every fibre.

3. **F03** (P2) Two headline theorems that are statable at the pins are neither stated nor named

   **Location.**
   - `README.md` §4.30, line 1482: "For a number field k and integer r>1, k×∖k×r is Diophantine over k". This is the main theorem of Colliot-Thélène–Van Geel. The docstring treats its input, §4.29a, as a headline.
   - §6.28, line 2082, bounded-degree counting, which the Summary (line 3) names as an end.
   - `Suggested.lean`, lines 7–24, mentions neither.

   **Claim.** Both statements need carriers that the pins lack.

   **Witness.** Two scratch statements elaborated against `import Mathlib` and this file's definitions, with only `sorry` warnings:
   - the nonpowers statement, as finite systems over `[NumberField k]`;
   - the bounded-degree statement, using `NumberField.absMulHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean`:136) and `(minpoly ℚ (x i)).natDegree ≤ k`.

   **Repair.**
   - Add `nonpowers_diophantine (k) [Field k] [NumberField k] (r) (hr : 1 < r) : ∃ m s (p : Fin s → MvPolynomial (Fin (m+1)) k), ∀ x, (x ≠ 0 ∧ ¬∃ y, y^r = x) ↔ ∃ y, ∀ j, eval (Fin.cons x y) (p j) = 0`.
   - Add the bounded-degree analogue of `pila_wilkie`, with the condition ∀ i, `IsAlgebraic ℚ (x i)`, `(minpoly ℚ (x i)).natDegree ≤ k` and `absMulHeight₁ (x i) ≤ T`. This matches `on_the_algebraic_points_of_a_definable_set` lines 74–77: degree and height are bounded coordinatewise.
   - Name §4.26 in the docstring as not statable (sentences carry no `Primcodable` structure).

   Tested: both statements elaborate with only `sorry` warnings.

4. **F04** (P3) Branches with no endpoint remain after the F07 repair

   **Location.** The internal *Needs:* graph of the README has these sinks with no consumer here or downstream:
   - Layer 0: §0.4 and §0.7; §0.3 is used only by §0.4.
   - Layer 1: §1.9, §1.11, §1.12 and §1.18; §§1.6–1.8 and §1.17 feed only these.
   - Layer 6: §6.15; §§6.10–6.14 feed only §6.15.

   **Claim.** The fix report says the retained Dittmann–Pop targets "have independent uses".

   **Witness.**
   - No *Needs:* line outside these chains cites them.
   - Their purposes are absent: Dittmann–Pop Theorems 1.2–1.3 (bi-interpretability of K with ℤ, uniform definability of prime divisors; `dittmann_pop` lines 52–77) are not targets.
   - The period-map definability that §§6.10–6.15 served is ShimuraVarieties §3.5c, which does not cite them.

   **Repair.** Either add the endpoint targets (Dittmann–Pop Theorem 1.2 with its hypotheses, for Layers 0–1) and name a consumer for §6.15, or delete the orphan subsections and the docstring sentence on "the wider-sector curve theorem".

5. **F05** (P3) Leftovers from the F02 and F06 repairs

   **Location.**
   - Line 1616 (Layer 6 introduction): "uniform rational, bounded-degree and semi-rational counting, … the torus lemma behind the abelian group-action application".
   - Line 2102 (Layer 6 Examples): the marked-path example with Σ={(0,0),(1,1/2)} belongs to the deleted §6.29.
   - Line 2106 (Layer 6 Dependencies) omits AbelianSchemesAndArithmeticModuliPartII B2.6, which §§6.27–6.28 need.
   - Line 1612 (Layer 5 Dependencies) lists §§4.12, 4.17 and 4.19, which no Layer 5 target uses.

   **Claim.** Scope (line 12) assigns semi-rational counting and the torus lemma to AbelianSchemesAndArithmeticModuliPartII.

   **Witness.** The introduction contradicts Scope. No Layer 5 *Needs:* line cites 4.12, 4.17 or 4.19.

   **Repair.**
   - Delete "semi-rational" and "the torus lemma" from line 1616, and delete the marked-path example.
   - Add B2.6 to the Layer 6 Dependencies.
   - Remove §§4.12, 4.17 and 4.19 from the Layer 5 Dependencies.

6. **F06** (P3) Garbled label residues, correction narrative and numbering gaps

   **Location.**
   - Labels left in proof sketches:
     - §4.4, line 1041: "By to-dioph-poly-eval". The same label recurs at lines 1055, 1086 and 1142.
     - §4.8, line 1114: "finite-right-support".
     - §4.10, line 1142: "poly-mvpolynomial-equiv", "finite-right-rename" and "right-rename-solutions".
     - §4.13, line 1187: "bounded-universal-closure".
     - §1.18, line 506: "residue-interpretation".
     - §2.10, line 692: "using null-loci".
     - §5.2, line 1578: "congruence-density-series".
     - §7.2, line 2143: "ag andre oort input conjugate lifts", "… promote", "… bounded discriminant".
     - §3.11, line 956: "Construct the realization the residue motivic realization:".
   - Correction narrative at §6.23, lines 2010–2012.
   - Shape: §2.2's fixed-prime target (line 558) comes after the *Needs:* line and has no *Needs:* of its own; the Checks of §§6.9, 6.17, 6.18, 6.22 and 7.8 also come after *Needs:*.
   - Numbering gaps: 1.7, 1.10, 1.13–1.16, 6.29 and 7.6.

   **Claim.** The README is timeless prose.

   **Witness.** The hyphenated strings are former Lean names, now defined nowhere (invented vocabulary). The gaps record the deletions.

   **Repair.**
   - Replace each label by the subsection it means, for example "the evaluation theorem of §4.2", "§4.7", "§4.5", "§4.9", "§4.14", "§1.17", "§2.8", "§5.1", and "the conjugate-lift, promotion and bounded-discriminant clauses of §7.1".
   - Fix the §3.11 sentence.
   - Move the source error of §6.23 to a neutral sentence ("The source's displayed higher chain rule omits terms; use the full Faà di Bruno expansion").
   - Give §2.2's fixed-prime theorem its own *Needs:* line, and place the Checks before *Needs:*.
   - Renumber the subsections consecutively and update the internal links.

7. **F07** (P3) "Frontier" means cl(X)∖X in Conventions but the topological boundary in §6.1 and the Lean

   **Location.**
   - Conventions, line 47: "distinguish the frontier cl(X)∖X from the ambient topological boundary".
   - §6.1, line 1620: "every definable unary subset of ℝ has finite frontier".
   - `Suggested.lean` lines 104–111 use Mathlib `frontier`.

   **Claim.** §6.1 characterises o-minimality by finite frontier.

   **Witness.**
   - Mathlib defines `frontier s = closure s \ interior s` (`Mathlib/Topology/Defs/Basic.lean`:129).
   - For ℤ⊂ℝ, cl(ℤ)∖ℤ=∅, checked in scratch with `Real.isClosed_range_intCast`. Under the README's own convention ℤ therefore has finite frontier, and the Check at line 1636 would fail. Mathlib's `frontier` of ℤ is ℤ, which is infinite.

   **Repair.** In §6.1 and in the `IsOMinimalExpansion` docstring, say "finite topological boundary (Mathlib `frontier`, closure minus interior)". Keep "frontier cl(X)∖X" only in §6.5.

8. **F08** (P3) Wrong or inconsistent locators in `Suggested.lean` docstrings

   **Location.**
   - `Suggested.lean` lines 88–89: `rational_nonsquares_diophantine` "(Koenigsmann, Proposition 21(a), pp.88–89)".
   - Lines 44–46: `igusa_poincare_rationality` cites "Denef 1984, Theorem 1.1", while README line 620 cites "Theorems 1.1–1.2".

   **Claim.** The nonsquare property is Proposition 21(a).

   **Witness.** `koenigsmann_defining_z` line 714: nonsquares are part (b). Part (a), line 713, is the prime-disjointness property.

   **Repair.** Cite "Proposition 21(b), p.88" and make the Denef locator agree with the README.

9. **F09** (P3) Wrong or inconsistent entries in `sources.toml` and References

   **Location.**
   - `sources.toml` lines 621–629 (`denef_1984`): authors "Ricardo Ma��", title "On the instability of Herman rings", 1985, DOI 10.1007/BF01388582. README line 2268 links the same DOI for Denef.
   - `torsion_and_tamagawa_numbers`, line 518: locator "Theorem 1.1, p.1997; Corollary 4.4, p.2009".
   - `bosch_lutkebohmert_raynaud`, line 584: "§7.3 Theorem 3; §9.6".
   - The `integrability_…` entry (line 179) records arXiv v2, while README line 2239 links the author-hosted published copy and cites journal pages.

   **Claim.** These entries record the cited works.

   **Witness.**
   - Crossref resolves 10.1007/BF01388582 to Mañé (Invent. Math. 81, 459–471). Denef's paper is 10.1007/BF01389133 (Invent. Math. 77, 1–23).
   - The README cites Lorenzini Proposition 4.3 and Example 4.4 (`torsion_and_tamagawa_numbers` lines 1555 and 1570) and BLR §7.3 Proposition 6.

   **Repair.**
   - The worker re-records `denef_1984` through the sources service with DOI 10.1007/BF01389133 (uncertified) and fixes README line 2268.
   - Set the Lorenzini locator to "Proposition 4.3 and Example 4.4, pp.2032–2033" and the BLR locator to "§7.3, Proposition 6, p.180".
   - Either cite arXiv v2 numbering and pages for CGH in the README, or record the published copy.
   - Add McCallum (R01).

10. **F10** (P3) Locator slips in the o-minimal sources

   **Location.**
   - Line 1662 (§6.2): "van den Dries–Miller §2.5–2.7, pp.8–9".
   - Line 1684 (§6.4): "§4.8, p.14".
   - Line 1670 (§6.3): analytic cell decomposition for R_an "stated by van den Dries–Miller §4.2".
   - Line 1748 (§6.9): G/M for "a semialgebraic group G and compact semialgebraic subgroup M", credited to "BKT Lemma 2.1".

   **Claim.** The locators support the statements as written.

   **Witness.**
   - `geometric_categories_and_o_minimal_structures` has no §§2.6–2.7: §2.5 is at lines 317–378 and the o-minimality definition at line 370.
   - Its 4.8 is on p.13 (line 530).
   - Its 4.2 lists only S(R^R_an) and S(R_an,exp) as having analytic decomposition (lines 509–510).
   - `bkt` lines 300–304 state Lemma 2.1 for connected semisimple G and connected compact M; the general case is vdD (2.18), p.167 (line 322).

   **Repair.**
   - Cite "§2.5 and the definition on p.9" and "4.8, p.13".
   - Give a source for analytic cell decomposition of R_an, or restrict that sentence to R_an,exp.
   - Cite vdD (2.18), p.167 for the general G/M and BKT Lemma 2.1 for its semisimple case.

11. **F11** (P3) The height of a rational is in Mathlib but cited from a roadmap

   **Location.**
   - §6.22, lines 1992–1994: "Use the rational height identity of DiophantineApproximationAndTranscendence §0.1".
   - `Suggested.lean` lines 120–123 rebuild max(|num|,den).
   - The Reference "Native multiplicative heights" (line 2266) is cited nowhere in the body.

   **Claim.** The identity H(a/b)=max(|a|,b) needs a roadmap supplier.

   **Witness.** `Rat.mulHeight₁_eq_max (q : ℚ) : mulHeight₁ q = max q.num.natAbs q.den` exists at the pin (`Mathlib/NumberTheory/Height/NumberField.lean`:532).

   **Repair.**
   - Cite `Rat.mulHeight₁_eq_max` (with its file) in §6.22 and under "From Mathlib".
   - Define `rationalTupleHeight` through `Height.mulHeight₁`, or say in its docstring that each coordinate term equals `Height.mulHeight₁ (x i)` by that lemma.
   - Keep DA §0.1 only for what Mathlib lacks.

Files reviewed: `packages/LogicAndDefinabilityInNumberTheory/README.md` (2272 lines), `Suggested.lean` (140 lines), `metadata.toml`, `sources.toml` (43 entries). Eleven findings: one P1, two P2, eight P3. Three are blocking.

## Status of the previous round's findings

| Id | Status | Repaired passage or residue |
|---|---|---|
| F01 | repaired | `Suggested.lean` now states `ax_kochen_ring`, `igusa_poincare_rationality` and `pila_wilkie` with `IsOMinimalExpansion`, `algebraicPart`, `rationalTupleHeight`. The docstring (lines 13–24) names each headline it calls non-statable and its missing carrier. The false sentence is gone. Two other statable headlines are still missing (R03). |
| F02 | partly repaired | §§6.29, 6.31 and 7.6 are deleted. Scope (line 12) and the supplier contracts (line 113) cite B2.6, B2.7, B2.14, B2.15 and B2.18. Residues remain in the Layer 6 introduction, the Layer 6 Examples and the Layer 6 Dependencies (R05). The same duplication also occurs at §§6.23–6.25 (R02). |
| F03 | repaired | §2.2, lines 558–564: fixed-F Macintyre cell decomposition "There is no restriction on p or the ramification index". §2.4, line 592: fixed-F integration. §2.6, line 620: rationality "For every prime p, every finite extension F/ℚ_p". The Lean statement allows every characteristic-zero DVR finite over ℤ_p. |
| F04 | repaired | §1.3, line 341: "Over H_ac,0 … with arbitrary ordered abelian value group and fixed expansions L_Res,L_Ord". The Hahn-field Check is at line 349. This matches `cluckers_loeser_2008` lines 328–359. |
| F05 | repaired | §6.17, line 1910: "In an o-minimal expansion of R_an". §6.18, line 1926: "definable in an o-minimal expansion of R_an". The parenthetical is deleted and ShimuraVarieties §3.5d is cited. |
| F06 | repaired | §5.5 and its downstream sentence are deleted. A residue remains in the Layer 5 Dependencies (R05). |
| F07 | partly repaired | §§1.7, 1.10, 1.13–1.16 and 1.19–1.20 are deleted. §§1.9, 1.11, 1.12 and 1.18 are still sinks, and Dittmann–Pop Theorems 1.1–1.3 are still not targets (R04). |
| F08 | repaired | §§0.1–0.6 cite Hodges §5.3. §1.6 cites Dittmann–Pop p.1, which matches `dittmann_pop` lines 34–36. §1.11 cites Stacks 04GN, 04GS and 0ASK (checked at `the_stacks_project` line 17792 and in the Algebra extraction) together with SchemeAndStackFoundations §§0.12–0.14. §4.32(c) follows the published Proposition 23(c), "for each n∈N" (`koenigsmann_defining_z` line 921), so the fix's "applied differently" is correct. |
| F09 | partly repaired | The manifest now exists with 43 entries. Some entries are wrong (R09). |
| F10 | partly repaired | API and Check labels are now prose. Garbled label residues remain (R06). |
| F11 | repaired | The six polynomial-comparison, conditional and count declarations and all examples are deleted. Eight theorems and five definitions remain. |
| F12 | repaired | The docstring is "LogicAndDefinabilityInNumberTheory: target signatures". There is no "not exhaustive", commit hash, PR number or name catalogue. §4.7 cites `MvPolynomial.exists_finset_rename`. |
| F13 | repaired | §3.1, line 780, uses ∀y, y²≠−1: {⋆} over ℝ and ∅ over ℂ. §1.8, line 422, uses 𝔽_p(s,t) with value group ℤ+√2ℤ. |
| F14 | repaired | §0.8 is deleted. Henselization, gauge measures, Weil volumes, Presburger definability and `TauCeti.IsSemialgebraic` are cited by name. A separate citation problem for the height of a rational is R11. |
| F15 | repaired | Downstream consumers (line 2226) names no roadmap, and the §6.15 promise is cut. The fix's reason for not listing ComplexComparisonPartII holds: it is at position 43 of the merge order, this roadmap at 154. |
| F16 | partly repaired | "current" and the "Gap." labels are gone and the supplier contracts are grouped per supplier. Correction wording remains at §6.23 (line 2010: "incorrect", "false single-product identity", "the higher-chain-rule correction"; line 2012: "repairs"), and the numbering gaps expose deleted targets (R06). The decision to keep §6.9 general, with three Checks added, is accepted. |

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean`, run from the content checkout, prints only the 8 `sorry` warnings (lines 35, 47, 63, 79, 85, 90, 95 and 128). There is one `import Mathlib` plus `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic`, whose object file exists. There is no `set_option`, `lemma`, sorry'd data or example.

**`#check @` probe.** All 13 declarations were checked in one scratch file. Each elaborated type matches its README statement. `igusa_poincare_rationality` keeps `IsDomain`, `CharZero`, `IsDiscreteValuationRing`, `Algebra ℤ_[p] O` and `Module.Finite`. `pila_wilkie` keeps `hL`, `hX`, `0<ε` and `1≤T`. No binder was lost; the file has no section variables.

**One-tactic probe.**
- `simp` makes no progress on `ax_kochen_ring` and `mrdp`, and leaves goals on the two `rationalDiophantine` theorems.
- `exact?` on MRDP finds only the file's own `mrdp`.
- `rational_nonintegers_diophantine` follows from `universal_integers` in three tactic steps (obtain, refine with `p.map (Int.castRingHom ℚ)`, `simp`). That is not one tactic, and it is Koenigsmann's Corollary 2, kept at the previous round's request.
- No padding found.

**Dependency check.**
```
depcheck: 45 roadmaps, 457 edges, 0 problem(s)
```
There is no UPWARD, CYCLE or moved line. Every cited roadmap is on main or earlier in the merge order:
- on main: SchemeAndStackFoundations, QuadraticFormInvariants, GlobalQuadraticForms, AdicSpaces, DiophantineApproximationAndTranscendence, RealAlgebraicGeometry, DifferentialGeometry, Chebotarev, ClassFieldTheory;
- earlier in the merge order: ResolutionOfSingularitiesCharacteristicZero (6), AdelicAlgebraicGroups (35), NeronModels (56), MotivesAndAlgebraicCycles (83), ShimuraVarieties (117), AbelianSchemesAndArithmeticModuliPartII (130), WeilConjectures (142), HeightsRationalPointsAndObstructions (153).

**Cross-roadmap citations resolved (36).**
- On main:
  - SchemeAndStackFoundations §§0.7, 0.12, 0.13, 0.14 and 2.20 (lines 755, 969, 1032, 1068, 4275);
  - QuadraticFormInvariants Layer 2 and §6C items 9–12 (lines 1025, 1864, 1945–1992);
  - GlobalQuadraticForms §§4.1–4.4, 5.5 and 6.1;
  - AdicSpaces Layer 1 (line 266);
  - DiophantineApproximation §§0.1–0.3 and 5.6, with `finite_setOf_absMulHeight₁_le` (its Suggested.lean:324);
  - RealAlgebraicGeometry Layers 3 and 6;
  - DifferentialGeometry "Boundary and corners" and 5.5;
  - Chebotarev Layer 14;
  - ClassFieldTheory Layers 5 and 10–13.
- At the open heads:
  - NeronModels §§2.5 and 4.6;
  - MotivesAndAlgebraicCycles §4.20;
  - HeightsRationalPointsAndObstructions §§2.16b, 2.17, 2.20, 2.21, 5.1, 5.6 and 5.8;
  - ShimuraVarieties §§3.5a, 3.5d and 3.6;
  - AdelicAlgebraicGroups §2.4, both items, with its characteristic-zero affine-group scope confirmed;
  - AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15 and B2.18;
  - ResolutionOfSingularities §6.2;
  - WeilConjectures "Curve RH from the surface bound".
- None of them cites this roadmap, except ComplexComparisonPartII (earlier, settled F15).

**Library declarations opened at the pins.**
- Mathlib: 33 names checked with `#check`, none failing, including:
  - `Ultraproduct.realize_formula_cast` and `sentence_realize`;
  - `presburger.definable_iff_isSemilinearSet` and `mul_not_definable`;
  - `Subfield.bot_eq_of_charZero` and `bot_eq_of_zMod_algebra`;
  - `MvPolynomial.exists_finset_rename`, `funext_set`, `Finset.toRight` and `mem_toRight`;
  - `Nat.forall_exists_prime_gt_and_modEq`, `ComputablePred.halting_problem` and `Dioph.pow_dioph`;
  - `Algebra.FiniteType.iff_quotient_mvPolynomial''`, `ExteriorAlgebra.exteriorPower`, `ValuationSubring.valuation_le_one_iff` and `Valuation.isEquiv_valuation_valuationSubring`;
  - `Rat.mulHeight₁_eq_max`.
- Opened in Mathlib: `Dioph.lean` lines 46–49 (the TODO), 93, 197–204 and 226–234; `Height/NumberField.lean` lines 136 and 532; `Topology/Defs/Basic.lean`:129.
- Tau Ceti at the pin:
  - `Semialgebraic/Basic.lean`:68 (by `#check`);
  - `ValuationSpectrum/Basic.lean`:95, 99 and 140;
  - `PatchPresentation.lean`:209;
  - `GrothendieckRing.lean`:180, 205 and 232;
  - `Coarsen.lean` (by reading the source; its object file is not built, so these were not `#check`ed).

**Seeded sample (15).** Twelve are fully verified at their locators:
- **1.1**: `cluckers_loeser_2008` lines 328–345, three-sorted with arbitrary L_Res and L_Ord, and the guard footnote at line 364.
- **1.4**: Theorem 2.1.1 (line 353, p.9) and Corollary 2.1.2 (line 370, p.10). AKE is a direct consequence of the quantifier elimination for sentences, as the route says.
- **2.12**: `geometric_stabilisation_…` (7) at line 339 and (8) at line 362; `mirror_symmetry_…` Proposition 4.1, Claim 4.2 and Lemma 4.3 at lines 1045–1091.
- **4.5**: `Dioph.lean` lines 93 and 197–204; Poonen Definition 1 and footnote 4 at lines 89 and 180.
- **4.9**: Freer's normal form, lines 645–675.
- **6.2**: van den Dries–Miller lines 336–356; BKT §1.1.
- **6.4**: van den Dries–Miller 4.2, lines 502–507 (page slip, R10).
- **6.6**: BKT A.1–A.2, lines 883–933.
- **6.9**: BKT Lemma 2.1 and its second proof, lines 300–329 (scope, R10).
- **6.10**: BKT p.14, lines 649–669. The width-R form is a direct extension.
- **7.3**: Pila–Tsimerman Theorem 7.1 and Lemmas 7.2–7.7, lines 670–870.
- **7.5**: Masser–Zannier p.648, line 588; Pila–Tsimerman p.673, lines 666–669.

4.12, 4.13 and 4.16 are not verifiable (below). Also verified, in passages the repairs touched:
- Koenigsmann numbering against the Annals text: Theorem 1 (line 47), Proposition 18 (609), Definitions 7, 9 and 19 (280, 317, 649), Lemmas 13, 14, 17 and 20, Proposition 21 (712), Corollary 22 (875), Proposition 23 (916) and Remark 24 (956), with their printed pages.
- Lorenzini Proposition 4.3 and Example 4.4 (lines 1555 and 1570).
- GWZ Proposition 2.2 (lines 296–316).
- CGH §3, Theorems 3.1.1, 3.1.3, 3.1.5 and 3.3.2 (lines 516–554 and 670), stated for every p.
- CL-exp Proposition 9.2.1 and its proof (lines 1750–1763) and Theorem 9.2.4 (line 1853).
- Tsimerman Theorems 5.2, 1.3 and 5.3 (lines 274, 44 and 326).
- Dittmann–Pop §3C (line 488) and Fact 5.2 (line 725).

**Ownership against open pull requests.** I searched by object with `roadmaps grep` over main and all 348 open roadmap pull requests, and read the board package index (26 lines). The objects: MRDP/DPRM, Ax–Kochen, Igusa, Koenigsmann, Denef–Pas and motivic integration, Colliot-Thélène–Van Geel, Pila–Wilkie, o-minimal predicates in Lean, Grothendieck's pairing and McCallum, Lang's theorem, gauge measures, henselization and definable Chow.
- Other owners found: B2.6 (R02); ReductiveGroupsPartII RG2.3.7 (R01); SchemeAndStackFoundations, AdelicAlgebraicGroups and ShimuraVarieties, all already cited.
- No `Suggested.lean` declaration reuses another roadmap's fully qualified name.

**Adversarial pass.** 138 rows, each with computed values.

| § | statement | instance | values computed on each side | result |
|---|---|---|---|---|
| Conv | Kronecker codimension | trivial v on 𝔽₂ | dim κ+1=1 ≠ 0=dim K; truncated 0−1=0 would accept | sound |
| Conv | Haar | q=3 | μ(O)=1; μ(πO)=1/3=\|π\| | sound |
| Conv | r-density | π²(dx)⊗2, q=2 | \|π²\|^(1/2)=1/2, not 1/4 | sound |
| Conv | base-first | a=xy | (y dx+x dy)∧(−dx/x)=dx∧dy; +dx/x gives −dx∧dy | sound |
| Conv | q>1 | q=1 | 1−L⁻¹↦0 | sound |
| Conv | frontier | ℤ⊂ℝ | cl∖X=∅; Mathlib frontier=ℤ | R07 |
| Conv | chart direction | φ₁=id, φ₂=2·, on ℝ | φ₂⁻¹∘φ₁(u)=u/2 | sound |
| Conv | height | −3/4; (); 0 | 4; 1; 1 | sound |
| 0.1 | interpretation | ℤ fractions; two-valued graph | (1,2)~(2,4): 4=4; outputs 0,1 not E-equal | sound |
| 0.2 | semantics | ∃y 2y=1 in Frac ℤ | (a,b)=(1,2): 2·1=2 | sound |
| 0.3 | bi-interpretation | 2-element A vs ℤ | quotients of A^m have ≤2^m classes; ℤ infinite | sound; R04 |
| 0.4 | transitivity | tuples of lengths 2, 3 | combined tuple of length 5 | sound; R04 |
| 0.5 | fractions | (−1,2)+(1,2) | (0,4)~(0,1); (1,0) excluded | sound |
| 0.6 | bridges | 2·(1/2)=1 | 2a=b at (1,2) | sound |
| 0.7 | ultrapower | U principal at 2; nonprincipal | H=diag(2), not >2; {i>7} cofinite, so H>7 | sound; R04 |
| 1.1 | DP language | γ=3, 2 in Presburger sort | 3≡1, 2≢1 mod 2; ac(ξ) ill-sorted | sound |
| 1.2 | ac | t³(2+t) over ℂ, over 𝔽₂; π′=επ | ord 3, ac 2; char 2: t⁴, ac 1; ac′(π)=res ε⁻¹ | sound |
| 1.3 | relative QE | ℂ((t^ℚ)); ℚ₂ | residue char 0, Γ=ℚ included; residue char 2 excluded | sound |
| 1.4 | AKE | ℂ((t)) vs algebraic part of ℂ((t)) | residue ℂ≡ℂ, Γ=ℤ≡ℤ, so ≡; ℚ_p excluded | sound |
| 1.5 | large-p transfer | 1+1=0; ∃x x²+1=0 | p=2 differs (false vs true); p=3: false/false; p=5: true/true | sound |
| 1.6 | dim_Kr | 𝔽₂, ℚ, 𝔽₂(t), ℚ(t) | 0, 1, 1, 2 | sound |
| 1.8 | prime divisor | t-adic 𝔽₂(t); 2-adic ℚ; monomial (1,√2) | 0+1=1 geometric; 0+1=1 arithmetic; ℤ+√2ℤ, 0+1≠2 | sound |
| 1.9 | residue criterion | t-adic ℚ(t); 𝔽₂(t^(1/2^∞)) | 1+1=2, DVR; 0+1=1 but Γ=ℤ[1/2], K not f.g. | sound; R04 |
| 1.11 | henselization | ℚ at 2; trivial v | ℚ^h countable vs ℚ₂ uncountable; F^h=F | sound; R04 |
| 1.12 | patch | basicOpen(a,0); U₀; U_{1/2} | ∅; all; excludes ℤ_(2) | sound; R04 |
| 1.17 | residue | ℤ_(3); inputs 1, 4 | 4−1=3∈m, same class; 3 classes | sound |
| 1.18 | composite | t-adic ℚ(t), then 3-adic | Γ=ℤ² lex; residue 𝔽₃ | sound; R04 |
| 2.1 | cells | q=2; q=3 | 1+2O mass 1/2; 2 fibres of 1/3, total 2/3=1−q⁻¹ | sound |
| 2.2 | cells, fixed p | x²+y² over ℚ₂; ℚ₂(√2) | zero set {(0,0)} since −1≡7 mod 8; ord π=1, ord 2=2 | sound |
| 2.3 | constructible | Σq⁻ⁿ, q=3; 1 on F | 3/2=(1−1/3)⁻¹; not integrable | sound |
| 2.4 | integration | 1-cell q=2, a=1; ab−c at (2,3,6), (2,3,5) | 1/4; integrals 0 and ∞ | sound |
| 2.5 | Jacobian | x=πu | μ(πO)=q⁻¹=∫_O\|π\| | sound |
| 2.6 | rationality | f=0, 1, x, π | TZ=1+(T−1)A: 0=0; T=T; T(1−q⁻¹)/(1−q⁻¹T) both sides; T²=1+(T−1)(1+T) | sound |
| 2.7 | gauge | dx on O^d; π²(dx)⊗2; 0 | 1; q⁻¹; zero measure | sound |
| 2.8 | null loci | point in 𝔸¹ | codim 1, mass 0 | sound |
| 2.9 | Weil volume | 𝔾_a; 𝔾_m; GL₂, q=2 | 1; 1−q⁻¹; 6/16=3/8 | sound |
| 2.10 | quotient | split double cover; squaring on ℚ₃× | 2v/2=v; 2 non-square mod 3, no lift | sound |
| 2.10a | dual counts | Tate curve; −1 on ℤ/3; S₃ on 𝔽₃³/Δ | n(q−1); 0=0; M^G=0 vs (M*)^G of order 3 | sound; R01 |
| 2.11 | isogeny volume | ω=0; good reduction, φ=id | 0=0; #A(k)/q^g on both sides | sound |
| 2.12 | Fubini | a=xy, v(a)=n | φ=−dx/x; fibre mass (n+1)(1−q⁻¹) | sound |
| 3.1 | subassignments | ∀y y²≠−1; ∃y y²=−1 | {⋆}→∅ not a map; ∅→{⋆} | sound |
| 3.2 | SK₀ | residue line; two points | L=(L−1)+1; f_!(1)=2, f_!(1)²=4 | sound |
| 3.3 | A₊ | L−2 at q=3/2 | −1/2<0 | sound |
| 3.4 | Presburger | even n, q=2 | Σ4^(−m)=4/3=(1−1/4)⁻¹ | sound |
| 3.5 | C(S) | C(∅); residue line | 0; L | sound |
| 3.6 | grades | singleton | degree 0: 1; degree 1: 0 | sound |
| 3.7 | pushforward | one-cell α=0, q=2 | L⁻¹↦1/2 | sound |
| 3.8 | change of variables | x↦tx on O | ∫_{tO}1=L⁻¹=∫_O L^(−1) | sound |
| 3.9 | specialization | L⁻¹; (L−1)L⁻¹ | q⁻¹; 1−q⁻¹ | sound |
| 3.10 | transfer | φ=ψ=1_O | 1=1 in K₁ and K₂ | sound |
| 3.11 | realization | 𝔾_m, ℙ¹ | [ℚ(1)]−1; 1+[ℚ(1)] | sound; R06 |
| 4.1 | Tα | X₀−2X₁ at (1,3); C(−3) | −5; −3 | sound |
| 4.2 | evaluation | same | −5 both sides | sound |
| 4.3 | surjective | C(−2), X₀ | −2, x₀ | sound |
| 4.4 | injective | X(X−1) | 0, 0, 2 at 0, 1, 2 | sound; R06 |
| 4.5 | equivalence | E(X₀(X₀−1)) at 2; α empty | 2≠0; ℤ≅ℤ | sound |
| 4.6 | rename | X₀−X₁ collapsed | 0=0 | sound |
| 4.7 | support | X_inl(a)+3 | t=∅ | sound |
| 4.8 | enumeration | β empty | m=0 | sound; R06 |
| 4.9 | roots | u−v−1 | root (1,0); collapsed: −1≠0 | sound |
| 4.10 | normal form | evens x−2y; constant 1 | x=4: y=2; x=3: none; no root | sound |
| 4.11 | coding | X−2 at 0 | −2 | sound |
| 4.12 | Dioph ⇒ RE | evens | x=4 halts at y=2; x=3 never halts | Davis unread |
| 4.13 | sequence number | y=6, n=3 | moduli 7, 13, 19, pairwise gcd 1 | Davis unread |
| 4.14 | bounded ∀ | n=0 | empty conjunction true | sound |
| 4.15 | graphs | earlier divergence | not certified | sound |
| 4.16 | MRDP | n=0, S=∅ and univ | 1=0 and 0=0; both RE | sound; Davis unread |
| 4.17 | H10 over ℤ | 7 | 4+1+1+1 | sound |
| 4.18 | ring Diophantine | ℂ; ℤ/6; ℚ | 1+i²=0; 2·3=0; xz=1 iff x≠0 | sound |
| 4.19 | transfer | t=1/2 | m=1, n=2, 1·1+0·2=1 | sound |
| 4.20 | trace sets | (1,0,0,0); a,b<0 | 2∈S; trace in [−2,2] | sound |
| 4.21 | dyadic | (6,15) | −6−15+90=69≡5; −21≡3 mod 8 | sound |
| 4.22 | R^k | R³₅; R¹_{1,3} | ℤ_(2); ℚ | sound |
| 4.23 | radicals | ℤ_(3); ℚ | 3ℤ_(3); {0} | sound |
| 4.24 | Φ_k | 3; −3; 1 | in Φ₃; sign fails; ≡1 mod 8, not in Φ₃ | sound |
| 4.25 | universal ℤ | S={3}: 1/3, 1/5, 0 | 3∈Jac, excluded; 5∉3ℤ_(3), included; 0 included | sound |
| 4.26 | ∀∃ undecidable | x²−4; x²−2 | t=2 witness, true; no rational root, false | sound |
| 4.27 | S_p | 17; 17·41 | ℤ_(17); 1/17∈ℤ_(41) | sound |
| 4.28 | nonsquares | 2/11; 0; −1 | (2/11)=−1; 0 excluded; −1 included | sound |
| 4.29 | one ∀ | t=1/2 | some x lacks a witness | sound |
| 4.29a | normic | p=3 | 7−6=1, gcd(3,7)=1 | sound |
| 4.30 | nonpowers | ℚ, r=2: −1, 4, 0 | in; out; out | sound; R03 |
| 4.31 | e.c. | ℚ⊂ℝ, X²=2 | root in ℝ, none in ℚ | sound |
| 4.32 | preservation | n=3, 8 | 2³=8∈K³ | sound |
| 4.33 | two ∀ | a=−1; a²b²u₄⁸ | guard 0 at (1,0,0,0); coefficient 1, total degree 12 | sound |
| 5.1 | densities | O^d; n=0 | N_n=q^(dn), a_n=1; one class | sound |
| 5.2 | uniform identity | zero expression | 0=0 | sound |
| 5.3 | zeta | f=x, q=2, s=1 | Z(1/2)=2/3=∫\|x\| | sound |
| 5.4 | product map | q=2 | 2q−1=3=#{xy=0 in 𝔽₂²}=4·(1/4)·3 | sound |
| 6.1 | o-minimal | (0,1); ℤ | boundary {0,1}; boundary ℤ infinite | sound; R07 |
| 6.2 | restricted analytic | constant 1 symbol; sin(πx) | 1 at 1, 0 at 2; zero set ℤ | sound; R10 |
| 6.3 | selected | reducts of R_an,exp | o-minimal (vdDM lines 374–375) | sound |
| 6.4 | cells | unit disk | 13 cells, the disk is one open cell | sound |
| 6.5 | dimension | line in ℝ²; ℝ→{0} | cl∖X=∅; section, no left inverse | sound |
| 6.6 | atlases | id and 2· on ℝ | transition u/2 | sound |
| 6.7 | boundary | quadrant vertex | 2 local faces | sound |
| 6.8 | compact corners | [0,1] | 2 boundary points | sound |
| 6.9 | quotients | diagonal; [0,1]²; {0}, ℝ∖{0} | q=id; one point; (1,1/n)→(1,0)∉E | sound; R10 |
| 6.10 | exp cover | R=2, z=1+iy, 5/4+iy | e^(−2πy); i·e^(−2πy) | sound; R04 |
| 6.11 | rings | y>c>0; 1/(x−1/2) | y⁻¹ defined; pole | sound |
| 6.12 | rough monomial | y^s; y+(−y) | C₁=C₂=1; 0 | sound |
| 6.13 | localization | k, with 1/k−1 | x=1/2: ~1; x=0: ~4y⁻¹; growth differs, not P/h | sound |
| 6.14 | decay | y²e^(−y) at 10, 20 | 4.54·10⁻³; 8.24·10⁻⁷ | sound |
| 6.15 | wider curve test | h=(x−2)²+y⁻²; Vandermonde | in (1,5) on Σ¹; y⁻²→0 on Σ³; det −1/2 | sound; R04 |
| 6.16 | algebraic structure | ℙ¹ | z↦1/z on ℂ× | sound |
| 6.17 | Remmert–Stein | ℂ, E={0}; node | closure ℂ; branch y=0 | sound |
| 6.18 | Chow | {1}⊂ℂ×; ∅; Y | (z−1); (1); (0) | sound |
| 6.19 | extensions | f=0; f=1/x | extension 0; none | sound |
| 6.20 | finite reduction | ℚ as points | not definable | sound |
| 6.21 | algebraic part | (0,1); {0}; {0,1} | X; ∅; ∅ | sound |
| 6.22 | height | −3/4; (−3,2); 0 | 4; 3; 1 | sound; R11 |
| 6.23 | parametrization | f=t, ψ=t² | (f∘ψ)″=2, single term 0 | sound; R06 |
| 6.24 | determinant | k=1, n=2, d=1, 2, 3 | η=4d/(D−1): 2, 1.6, 1.33, tends to 0 | sound; R02 |
| 6.25 | Pila–Wilkie | exp graph on (0,1); (0,1) | 0 points (Lindemann); X_alg=X, 0 | sound; R02 |
| 6.26 | blocks | point | nothing added to X_alg | sound |
| 6.27 | integral points | (−3,2); constant map | 3=3; one point | sound |
| 6.28 | bounded degree | k=2, T=2; √2 | 2²·2²=16; H(√2)=√2≤2 | sound; R03 |
| 6.30 | orbit bridge | c=C=A=δ=1, ε=1/2, D=100 | 100 lifts > 10 singleton blocks | sound |
| 7.1 | datum | D=−3 | Re τ=−1/2, height 2≤3; 3a²=3≤3; 4X²−3 | sound |
| 7.2 | exceptional | V={1728}; V=A₁ | 1 point; ∅ | sound; R06 |
| 7.3 | finite families | V={j₀}, CM or not | 1; 0 | sound |
| 7.4 | AO | V={0,1728} | 2 special points | sound |
| 7.5 | CM pairs | Φ₁; j=1728; j=1 | j₁−j₂; j(i); not among the 13 class-number-one values | sound |
| 7.7 | codimension | dim X=2, dim Ď=3, dim U=1 | 4<5≤2+3 | sound |
| 7.8 | mixed AO | torsion vs non-torsion singleton | 1; 0 special points | sound |
| Lean | `ax_kochen_ring` | ∃x x²+1=0 at p=2, 5 | differs at 2; agrees at 5 | sound |
| Lean | `igusa_poincare_rationality` | m=0, f=1; m=1, f=0; ℤ₂[√2], f=x | 1; 1/(1−qT); 1/(1−T) | sound |
| Lean | `Diophantine.mrdp` | n=0 | ∅ and univ | sound |
| Lean | `rationalIntegers` | −7; 1/2 | in; out | sound |
| Lean | `rationalDiophantine` | ∅; x≠0 | 1=0; xy−1 | sound |
| Lean | `universal_integers` | Koenigsmann line 47 | same quantifier form | sound |
| Lean | `rational_nonintegers_diophantine` | from `universal_integers` | 3 tactic steps | sound |
| Lean | `rational_nonsquares_diophantine` | 0; −1; 4 | out; in; out | sound; R08 |
| Lean | `one_universal_variable` | Corollary 22, line 875 | ∀p ∃ form, polynomial over ℤ | sound |
| Lean | `IsOMinimalExpansion` | Tarski structure; ℤ named | holds; ℤ's boundary infinite, fails | sound; R07 |
| Lean | `algebraicPart` | n=1, {0,1} | no connected non-subsingleton subset, ∅ | sound |
| Lean | `rationalTupleHeight` | ![−3/4]; ![] | 4; 1 | sound; R11 |
| Lean | `pila_wilkie` | n=1, m=0, X=ℝ | X_alg=ℝ, count 0 | sound; R02 |

## Not verifiable

- **Davis, *Hilbert's tenth problem is unsolvable*** (uncertified, commercial). Covers §§4.11–4.17, including the sampled 4.12, 4.13 and 4.16.
- **Hodges §5.3, Bosch–Lütkebohmert–Raynaud, Schneider and Denef 1984** (uncertified). For Denef, the DOI in the README and the manifest resolves to another paper (R09).
- **Pas 1989.** An image-only scan; OCR is not available on this worker. It is listed in this job's pre-existing `needs-references.toml`. The general statement is supported by `cluckers_loeser_2008` Theorem 2.1.1.
- **van den Dries, *Tame Topology*; van den Dries–Macintyre–Marker; Pila–Wilkie; the Cluckers–Loeser addenda** (waived). This includes the README's claim (§6.23) that Pila–Wilkie Corollary 4.4 uses a false chain-rule identity, and the vdD part of §6.9.
- **McCallum 1986** (R01). Not in the manifest and not fetched; the finding concerns ownership, not content.
- **CGH published pages.** The cache holds arXiv v2 only. Theorem numbers agree; journal page numbers were not checked.

## Source issues

- **Misprint** in geometric_stabilisation_via_p_adic_integration at Example 2.4, p.7: the source says the quotient of dx∧dy by da is dx/x; it should be −dx/x under its own identification (7); affects nothing.
- **Misprint** in geometric_stabilisation_via_p_adic_integration at the proof of Proposition 2.1(b), p.6: the source says the covering runs X◦→Y◦ with A⊂X◦; it should be Y◦→X◦ with A⊂Y◦; affects nothing.
- **Misprint** in mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int at Proposition 4.1, p.20: the source says θ is a section on Y; it should be a section on X of the relative r-fold top forms; affects nothing.
- **Misprint** in mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int at the proof of Claim 4.2, p.20: the source says take η to be (dx₁∧⋯∧dxₙ)^⊗r; it should be dx₁∧⋯∧dxₙ, a 1-gauge form; affects the proof.
- **Error** in bkt at Definition 4.4, p.14: the source says roughly polynomial functions form a ring; it should restrict denominators to Laurent polynomials, since 1/k−1, with k as in README §6.13, is not of the stated form; affects a stated result.
- **Misprint** in bkt at Appendix A.2, p.20: the source says mixed transition maps are ψ_j∘ϕ_i⁻¹; it should be ψ_j⁻¹∘ϕ_i; affects nothing.
- **Misprint** in bkt at Appendix A.1, p.20: the source says ∂X is a real-analytic n-manifold with corners; it should be an (n−1)-manifold; affects nothing.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at the proof of Proposition 3.4(2), p.6: the source says the preimages P, Q are taken in U; it should be in the basic block V; affects nothing.
- **Misprint** in native_multiplicative_heights at the docstring of `NumberField.absMulHeight₁`: the source says the junk value off algebraic elements is 0; it should be 1, which the definition returns; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3062436", "job": "REV-PKG-LogicAndDefinabilityInNumberTheory~2", "model": "opus", "worker": "fable-rev80"} -->
