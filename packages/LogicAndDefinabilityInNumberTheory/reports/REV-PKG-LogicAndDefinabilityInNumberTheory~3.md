<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6396503382 -->
Review (claude) of d36cfa5

Verdict: needs changes

1. **F01** (P1) The consumed block theorem B2.6 depends on this roadmap's own general o-minimal theory (hidden supply cycle)

   **Location.**
   - `packages/LogicAndDefinabilityInNumberTheory/README.md:9`: "The general Pila–Wilkie parametrization and determinant machinery belongs to the parameter-uniform block decomposition of AbelianSchemesAndArithmeticModuliPartII B2.6".
   - Line 17: "General o-minimal expansions, analytic/exponential theorems, general definable dimension and triangulation belong here."
   - §6.18 (line 1729), §6.19 (line 1743), §6.20 (line 1757) and the contract at line 111 route `pila_wilkie` and `bounded_degree_counting`, which are stated for an arbitrary `IsOMinimalExpansion L`, through B2.6.

   **Claim.** B2.6, earlier in the merge order, supplies the parameter-uniform block decomposition for an arbitrary o-minimal expansion of ℝ.

   **Witness.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md` (open head), line 1350: B2.6 needs "o-minimal definable sets, dimension and cell decomposition" in "a fixed o-minimal expansion" (line 1328). `TauCetiRoadmap/ShimuraVarieties/README.md` line 800 supplies these only for R_an,exp. The pins have none.

   **Consequence.** The only owner of cell decomposition, dimension and definable choice in an arbitrary expansion is §§6.4–6.5 here. This roadmap is at merge position 153 and B2.6's roadmap at 129. In substance the supply runs §6.4 (here) → B2.6 → §6.18 (here), a cycle. The depcheck cannot see it because B2.6 cites no owner for these inputs.

   **Repair.** The two coherent end states:
   - (A), implementable in this package:
     - Add a Layer 6 target, after §6.17: the parameter-uniform block decomposition in an arbitrary o-minimal expansion, in the form of Pila 2009 Theorem 3.5(1)–(3) (`on_the_algebraic_points_of_a_definable_set` lines 265–273). Its route is the Pila–Wilkie parametrization and determinant argument, and it needs §§6.4–6.5 and 6.17.
     - Repoint §§6.18–6.20, the Layer 6 Dependencies and the Exact supplier contracts to that target.
     - State in Scope that B2.6 is the R_an,exp case. Record for the maintainer that ASAMP2 B2.6 must be scoped to R_an,exp-definable families (which is all its own Needs line can supply), so that there is one owner per generality.
   - (B), outside this package: the maintainer moves the general o-minimal foundations (this roadmap's §§6.1, 6.4–6.5) into a roadmap earlier than ASAMP2, B2.6 cites them, and §§6.4–6.5 here are cut and cited.

   If the fix worker cannot apply (A), this needs the maintainer's decision.

   **Tested on** L = R_Pfaff (o-minimal by Wilkie, not covered by ShimuraVarieties §3.5a). The current route needs cell decomposition for L inside B2.6, and its only owner is §6.4 here. Under (A), `pila_wilkie` for this L uses only §§6.4–6.5, 6.17 and the new target, all in this roadmap.

2. **F02** (P2) Hilbert's tenth problem and the ∀∃ undecidability of ℚ are wrongly declared not statable

   **Location.** `packages/LogicAndDefinabilityInNumberTheory/Suggested.lean:17–19`: "Hilbert's tenth problem over ℤ lacks the computable polynomial-code adapter for native semidecidability. Undecidability of the universal-existential rational theory (§4.26) also lacks a native `Primcodable` sentence-code adapter." Related README text: §4.17 (line 1040) and §4.26 (line 1202).

   **Claim.** Neither headline can be stated at the pins.

   **Witness.** `undecidability_in_number_theory` lines 214–226 (p.3): the negative answer is one polynomial p(t, x) with no algorithm deciding integer solvability in the parameter. Both scratch statements below elaborate with only `sorry` warnings.

   **Repair.**
   - Add to Layer 4 of `Suggested.lean`:
     ```lean
     theorem hilbert_tenth_integers :
         ∃ (n : ℕ) (p : MvPolynomial (Fin (n + 1)) ℤ),
           ¬ ComputablePred (fun a : ℤ => ∃ x : Fin n → ℤ, eval (Fin.cons a x) p = 0) := by sorry

     theorem forall_exists_rational_undecidable :
         ∃ (k l : ℕ) (q : MvPolynomial (Fin (1 + k + l)) ℤ),
           ¬ ComputablePred (fun a : ℕ => ∀ x : Fin k → ℚ, ∃ y : Fin l → ℚ,
             eval₂ (Int.castRingHom ℚ) (Fin.append (Fin.append ![(a : ℚ)] x) y) q = 0) := by sorry
     ```
   - Delete the two docstring sentences.
   - In README §4.17 and §4.26, state these one-parameter forms as the theorems (the all-codes forms follow by computable substitution of the parameter), name the acceptance theorems, and keep the code-level statements as corollaries.

   **Tested:** both declarations, as `h10_int_probe` and `forall_exists_probe`, elaborated by `lake env lean` in a scratch copy with only `sorry` warnings. They are true on the README's own route: §4.17 already proceeds through an undecidable Diophantine set, and the complement of that set is defined by a ∀∃ rational family via §4.25.

3. **F03** (P3) Build-order cycle §2.4 ↔ §2.5 ↔ §2.8

   **Location.**
   - Line 411 (§2.4): "Local diffeomorphisms use the locally analytic inverse function theorem over F … and the determinant substitution of §2.5."
   - Line 425: §2.5's *Needs:* lists §2.4.
   - Line 421 (§2.5): "Lower-dimensional loci are null by §2.8". §2.8 needs §2.7 (line 481), and §2.7 needs §2.5 (line 469).

   **Claim.** Subsections follow their prerequisites (line 143).

   **Witness.** §2.5's route uses only cells (§2.2), Haar measure and local substitution. Nothing in it uses constructible integration (§2.4), and its appeal to §2.8 (which needs §2.7, which needs §2.5) closes a second loop.

   **Repair.**
   - Drop §2.4 from §2.5's *Needs:*.
   - Replace "Lower-dimensional loci are null by §2.8" with: a definable subset of Fⁿ of dimension < n is Haar-null by cell decomposition (§2.2), each lower-dimensional cell being a graph over a lower-dimensional base.
   - Keep §2.4 → §2.5.

   **Tested:** the internal *Needs* graph then has no cycle among §§2.1–2.13.

4. **F04** (P3) Locator slips in sampled and repaired targets

   **Location.**
   - §4.21, line 1115: "Proposition 6, pp.77–79".
   - §4.19, line 1080: "§1, Corollaries 3 and 3′, pp.74–75; §3, p.91". Those corollaries concern Th∀∃(ℚ), and p.91 is Corollary 22's proof.
   - §4.26, line 1206: "Corollaries 3 and 3′, pp.74–75".
   - `Suggested.lean:89–90`: "Proposition 21(b), p.88". §4.28, line 1242: "pp.88–90". This is the round-2 F08 page carried over.
   - §6.4, line 1500: "§4.2–4.3, pp.12–13; §4.8, p.13".

   **Witness.**
   - `koenigsmann_defining_z`:
     - lines 161 and 255: Proposition 6 is on pp.76–78;
     - lines 24–27 and 42–46: the transfer is on p.73 and Observation 0 on p.74;
     - lines 59–69: Corollaries 3 and 3′ are on p.74;
     - lines 712–717: Proposition 21 is on p.87.
   - `geometric_categories_and_o_minimal_structures`, lines 472, 513 and 530: 4.1 is monotonicity, 4.3 the component theorem and 4.8 Whitney stratification.

   **Repair.**
   - "Proposition 6, p.76; proof pp.76–78".
   - "§1, p.73, and Observation 0, p.74".
   - "Corollaries 3 and 3′, p.74".
   - "Proposition 21(b), p.87 (proof p.88)" in the Lean docstring, and "Proposition 21(a)–(e), p.87; proofs pp.87–90" in §4.28.
   - "4.1 and 4.2(1)–(2), p.12".

   **Tested:** each new locator was read at the cited line.

5. **F05** (P3) Dead-end subsections remain (the round-2 F04 pattern)

   **Location.** §2.10 (line 497), §6.7 (line 1542; its only consumer is §6.8), §6.8 (line 1552), §6.9 (line 1562), §6.13 (line 1633), and §4.6 (line 889). §4.6 restates the last API bullet of §4.5 (line 876).

   **Claim.** Every target serves a later target or a named consumer.

   **Witness.** In the computed internal *Needs* graph these are sinks: no *Needs* line, Layer 7 hypothesis or Downstream-consumers entry uses them. §7.1 uses only §§6.10 and 6.16, and §4.6 duplicates §4.5's bullet at line 876.

   **Repair.** Either name a consumer for each (a section here or a later roadmap by name and section), or delete §§6.7–6.9, 6.13 and 2.10 and fold §4.6 into §4.5's existing bullet. Then renumber and update the links.

   **Tested:** after the deletions, the remaining sinks are source endpoints (§§2.12, 3.8, 3.11, 4.19, 4.26, 4.29, 4.33, 4.34, 5.2–5.4, 7.5–7.7).

6. **F06** (P3) Stale and wrong manifest entries; process wording

   **Location.**
   - `sources.toml`:
     - `dittmann_pop` (line 636), `the_stacks_project` (line 529) and `integer_points_on_the_dilation_of_a_subanalytic_surface` (line 326) are `cited_for = ["Source provenance"]`.
     - `cl_addenda` (line 40) has empty `cited_for`.
     - The `koenigsmann_defining_z` locator (line 212) reads "Definition 10; Lemmas 11–17".
     - The `mirror_symmetry_…` locator (line 298) reads "Lemma 4.11".
     - `hilbert_s_tenth_problem_is_unsolvable` has `cited_for ["References"]`.
   - README line 1910: "the design provenance".

   **Claim.** The manifest records the cited works, with what each is cited for.

   **Witness.** A README grep finds no citation of Dittmann–Pop, Stacks, Pila 2004 or the addenda. Koenigsmann 10 is a Proposition (line 323) and 11 a Corollary (line 395). The README cites mirror-symmetry Lemma 4.3 (line 1083), not 4.11.

   **Repair.**
   - Delete the four uncited entries.
   - Koenigsmann locator: "Proposition 10; Corollary 11; Definition 12; Lemmas 13–14; Corollary 15; Proposition 16; Lemma 17".
   - Mirror-symmetry locator: "Lemma 4.3".
   - Davis: `cited_for = ["4.11–4.17"]`.
   - Line 1910: drop "and the design provenance".

   **Tested:** the manifest entries were checked against the README's citations by grep.

7. **F07** (P3) `rational_nonsquares_diophantine` is now a special case of `nonpowers_diophantine`

   **Location.** `Suggested.lean:91–92`.

   **Claim.** It is an independent headline.

   **Witness.** With k = ℚ, r = 2 in `nonpowers_diophantine` (line 105), {x ≠ 0 ∧ ¬square} = {¬square} since 0 = 0², and Σ p_j² = 0 turns the system into one equation, which is `rationalDiophantine`. The README §4.31 Check covers this case.

   **Repair.** Delete it from `Suggested.lean` and from the docstring list (line 10), and drop the "acceptance signature" sentence of §4.28. §4.28 keeps the statement as a target.

   **Tested:** the specialization argument was checked by hand. The one-tactic probe does not close it, so it is a special-case duplicate rather than a one-tactic consequence.

Files reviewed: `packages/LogicAndDefinabilityInNumberTheory/README.md` (1949 lines), `Suggested.lean` (167 lines), `metadata.toml`, `sources.toml` (43 entries), `design/plan.json`. Seven findings: one P1, one P2, five P3. Two are blocking.

## Status of the previous round's findings

| Id | Status | Repaired passage or residue |
|---|---|---|
| F01 | repaired (declared gap) | Line 75: "What NeronModelsAndSemistableAbelianVarieties must provide (gap:neron-pairing-perfect-finite-residue): §4.6 must prove that Grothendieck's … pairing … is perfect, without a semistability hypothesis". The same slug is in `design/plan.json`, and §2.11 *Needs* lists the gap and ReductiveGroupsPartII RG2.3.7 (its README line 5201, open head). The repair report's "not actionable" label is inaccurate but immaterial: the round-2 alternative was applied. The gap is precise and minimal (`TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md` line 2374 excludes non-semistable perfectness), and its supplier is earlier (position 55). |
| F02 | repaired, with a new defect | Old §§6.23–6.24 are deleted. §6.18, line 1729: "Apply the parameter-uniform block decomposition of … B2.6 … (b=0)". Residue: the supply cycle in R01. |
| F03 | repaired | `nonpowers_diophantine` (line 105) and `bounded_degree_counting` (line 155) elaborate. §4.26 is named in the docstring, but the reason given is wrong (R02). |
| F04 | repaired | Old §§0.3–0.4, 0.7, 1.6, 1.8–1.9, 1.11–1.12, 1.17–1.18 and 6.10–6.15 are gone. The same pattern remains elsewhere (R05). |
| F05 | repaired | Layer 6 introduction (line 1431) has no "semi-rational" or "torus lemma". The Layer 6 Dependencies list B2.6 (line 1786). The Layer 5 Dependencies have no §§4.12, 4.17 or 4.19. |
| F06 | repaired | No hyphenated label residues (grep). §3.11 reads "Construct the residue motivic realization: …" (line 765). §2.2's fixed-prime target has its own *Needs* (line 373). Subsection numbering is consecutive in every layer. |
| F07 | repaired | Conventions line 41: "use topological boundary for cl(X)∖int(X), Mathlib `frontier`". §6.1 Check, line 1450: "the topological boundary is the infinite set ℤ". |
| F08 | partly repaired | Part (b) and Denef "Theorems 1.1–1.2" are fixed. The page "p.88" should be p.87 (R04). |
| F09 | repaired | `denef_1984` is now Denef, DOI 10.1007/BF01389133 (`sources.toml` lines 621–633, README line 1945). Lorenzini and BLR locators are fixed. CGH cites arXiv v2 numbering (line 413, line 1919). |
| F10 | repaired | "§2.5 and the o-minimality definition, pp.8–9" (line 1478). Analytic decomposition is claimed for R_an,exp only (line 1486). §6.9 cites vdD (2.15), (2.18) and BKT's semisimple case (line 1564). |
| F11 | repaired | Line 1687: "Use Mathlib `Rat.mulHeight₁_eq_max` (… line 532)". The `rationalTupleHeight` docstring cites it (lines 131–132). |

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean`, run from the content checkout, exits 0 with exactly 10 warnings, all `declaration uses sorry` (lines 36, 48, 64, 80, 86, 91, 96, 105, 139, 155). The imports are one `import Mathlib` plus `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic`, whose object file is built. There is no `set_option`, `lemma`, sorry'd data, `example` or `#check`.

**`#check @` probe.** All 15 declarations were checked in one scratch file. Each elaborated type matches its README statement:
- `igusa_poincare_rationality` keeps `IsDomain`, `CharZero`, `IsDiscreteValuationRing`, `Algebra ℤ_[p] O` and `Module.Finite`.
- `nonpowers_diophantine` keeps `Field`, `NumberField` and `1 < r`.
- Both counting theorems keep `hL`, `hX`, `0 < ε` and `1 ≤ T`, with `∃ C` before `∀ t T`.
- `bounded_degree_counting` also keeps `1 ≤ k` and the three coordinate conditions.

No binder was lost, since the file has no section variables.

**One-tactic probe.** On a scratch copy, `first | rfl | simp | infer_instance | exact?` closes none of the 10 theorems (`exact?` fails or `simp` leaves goals). No padding was found apart from R07.

**Dependency check** (exact output):
```
depcheck: 51 roadmaps, 590 edges, 0 problem(s)
```
There is no UPWARD, CYCLE or moved line. Merge positions: this roadmap 153; ReductiveGroupsPartII 23; NeronModelsAndSemistableAbelianVarieties 55; ShimuraVarieties 114; AbelianSchemesAndArithmeticModuliPartII 129; HeightsRationalPointsAndObstructions 152. The depcheck cannot see the cycle in R01.

**Cross-roadmap citations resolved (19 roadmaps).**
- On main:
  - SchemeAndStackFoundations §0.7 (line 755) and §2.20 (line 4275).
  - QuadraticFormInvariants Layer 2 (line 1025) and 6C (line 1864).
  - GlobalQuadraticForms §§4.1–4.4 (lines 381–443), §5.5 (line 665) and §6.1 (line 694).
  - DiophantineApproximationAndTranscendence §0.2 (line 227), §0.3 (line 358), §5.6, and `finite_setOf_absMulHeight₁_le` (its Suggested.lean line 324).
  - RealAlgebraicGeometry Layers 3 and 6 (lines 298, 437).
  - DifferentialGeometry "Boundary and corners" (line 63) and 5.5.
  - Chebotarev Layer 14 (line 609).
  - ClassFieldTheory Layers 5 and 10–13.
- At open heads:
  - NeronModels §§2.5 and 4.6; ReductiveGroupsPartII RG2.3.7.
  - AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15 and B2.18 (lines 1326–1609).
  - MotivesAndAlgebraicCycles §4.20.
  - HeightsRationalPointsAndObstructions §§2.16b, 2.17, 2.20, 2.21, 5.1, 5.6 and 5.8.
  - AdelicAlgebraicGroups §2.4, both bullets.
  - ResolutionOfSingularitiesCharacteristicZero §6.2.
  - WeilConjectures "Curve RH from the surface bound".
  - ShimuraVarieties §§3.5a, 3.5d and 3.6.
- The `roadmaps resolve` lead `Diophantine.mrdp` is this roadmap's own declaration.

**Library declarations at the pins.** 63 names were checked with `#check` in one scratch file, with no failure. They include:
- `Rat.mulHeight₁_eq_max`; `NumberField.absMulHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean`:136, junk value 1, defined for every characteristic-zero field, so it applies to ℝ).
- `FirstOrder.Language.Ultraproduct.structure`, `presburger.mul_not_definable`, `BoundedFormula.IsExistential`.
- `MvPolynomial.funext_set`, `Finset.toRight`, `ExteriorAlgebra.exteriorPower`, `ValuationSubring.ValueGroup`.
- `Dioph.pow_dioph`, `ComputablePred.halting_problem`, `Nat.forall_exists_prime_gt_and_modEq`.
- `TauCeti.IsSemialgebraic` (real coefficients allowed; `Semialgebraic/Basic.lean`:68).
- Tau Ceti `GrothendieckRing.lean` lines 180, 205 and 232.

Also opened: `Mathlib/NumberTheory/Dioph.lean` lines 44–51 (the TODO), 93, 197–204 and 226–234; and `Mathlib/ModelTheory/Encoding.lean`:31 (Primcodable formulas missing, true, but irrelevant to R02's forms).

**Seeded sample (15).**
- Verified at their locators:
  - **1.2**: `cluckers_loeser_2008` lines 321–325, p.8. The ac laws match.
  - **2.5**: CL 7.5.3 (line 1786, p.43), 7.5.4 (line 1867, p.45) and 12.1.1 (line 3039, p.74). The multivariable local-field step rests on Schneider, which is uncertified.
  - **4.3**: `hilbert10_polynomial_bridge` line 619 (`exists_mvPolynomial` by `Poly.induction`), and Poonen Definition 1 and footnote 4 (lines 89, 180, p.2).
  - **4.6**: `Dioph.lean` lines 227 and 234.
  - **4.22**: Definitions 7 and 9 (lines 280, 317) and Proposition 10 (line 323), pp.79–81.
  - **4.23**: Definition 12, Lemmas 13–14 (lines 409–528).
  - **4.29**: Corollary 22 (lines 875–897), pp.90–91.
  - **7.4**: Tsimerman Theorem 1.3 (line 44, p.380), Theorem 5.2 (line 274, p.385), Theorem 5.3 (line 326, p.386) and §6 (lines 329–406).
  - **7.6**: Lawrence–Sawin Lemma 6.3 and its proof (lines 2958–2978, pp.64–65), and Bakker–Tsimerman Theorem 1.1 (line 60, p.2).
- Verified with locator slips (R04): **4.21** (page), **4.19** (wrong passage) and **6.4** (extra items; 4.2 on p.12, line 502, supports the statement).
- Not readable: **0.3** (Hodges), **4.14** and **4.16** (Davis); see below.
- Also verified:
  - CTV Theorem 4.3 (line 568, p.16, for every r > 0).
  - Pila 2009 Theorem 1.6 (line 76), Definition 5.1 and Theorem 5.3 (lines 322, 380), and H^poly_k ≤ 2^k H^k (line 352). These support `bounded_degree_counting` uniformly in the parameter.
  - Lorenzini Proposition 4.3 and Example 4.4 (lines 1555–1577, pp.2032–2033).
  - Pas 1989 from the OCR text now in the cache: §2.4 on p.140 (line 166, equicharacteristic zero), Theorem 3.2 on p.142 (line 246), Lemma 3.5 on p.143 (line 276), §3.6 on p.144 (line 299) and Lemma 3.7 on p.151 (line 544).

**Declared gap.** `gap:neron-pairing-perfect-finite-residue` is precise (one property, with its hypotheses), minimal (§4.6 constructs the pairing but asserts perfectness only for semistable reduction), statable by its supplier (McCallum's theorem, per Lorenzini line 1547), and declared under the same slug in the README (line 75) and `design/plan.json`.

**Ownership against open work.**
- `roadmaps grep` over main and the 357 indexed open heads, by object: MRDP/H10, Koenigsmann, Ax–Kochen, Denef–Pas, Cluckers–Loeser, Igusa rationality, Pila–Wilkie, nonpowers, André–Oort, model completeness, o-minimal cell decomposition. The only other owners are the ones already cited: B2.6 (R01), ShimuraVarieties §§3.5a/3.5d, AdelicAlgebraicGroups §2.4 and NeronModels §4.6. ThousandTheoremsEuclideanGeometry only lists "Ax–Kochen theorem" in a name table.
- No `Suggested.lean` elsewhere reuses this file's names.
- Board packages: the checkout's packages, and the design folders of LawrenceVenkateshMethod and ShimuraVarietiesPartII from the index, were read without writing. LawrenceVenkateshMethod assigns the complex period-codimension consequence (= §7.6) to MordellLawrenceVenkateshPartII (merge position 298, on neither main nor an open pull request). This roadmap, at 153, is the earlier owner, so that roadmap should cite §7.6.

**Adversarial pass.** The rows below recompute every passage the repairs changed or added and every sampled target. Untouched passages rely on the round-2 table, all of whose 138 rows carry computed values.

| § | Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| Conv/6.1 | boundary | ℤ⊂ℝ; ℚ; (0,1) | frontier ℤ=ℤ (infinite) vs cl∖X=∅; frontier ℚ=ℝ; {0,1} (2 points) | sound | none |
| Conv/6.16 | rational height | −3/4; (−3,2); 0; () | 4; 3; 1; 1; `Rat.mulHeight₁_eq_max`: max(3,4)=4, max(0,1)=1 | sound | none |
| Conv | coordinatewise degree | (√2,√3) | 2,2 vs joint 4 | sound | none |
| Lean | constant order | elaborated type | `∃ C` precedes `∀ t T` | sound | none |
| 1.2 | ac change of π | 𝔽₃((t)), res ε=2 | ac′(π)=2⁻¹=2, ac′(π²)=1, ac′(π³)=2; t³(2+t): ord 3, ac 2; in char 2: t⁴, ac 1 | sound | none |
| 2.5 | Jacobian | x↦πx; (x,y)↦(πx,π²y), q=3 | 1/3=∫_O\|π\|; 1/27=\|det\| | sound | R03 |
| 2.4/2.5/2.8 | build order | *Needs* graph | 2.5→2.4→2.5; 2.5→2.8→2.7→2.5 | cycle | R03 |
| 2.6 | tail identity | f=0; f=1; f=x, q=2 | 0=0; T=T; (T/2)/(1−T/2) both sides | sound | none |
| 2.11(a) | prime-to-p | degree-p isogeny, supersingular | kernel connected, reduction inseparable, not étale | hypothesis needed | none |
| 2.11(b) | Lang | constant ℤ/2 over 𝔽_q | H¹=ℤ/2≠0 (RG2.3.7 remark), so connectedness is needed; 𝒜°_k is connected | sound | none |
| 2.11(b) | isogeny count | kernel ℤ/3, σ=−1 | ker(σ−1) order 1 = coker order 1 | sound | none |
| 2.11(c) | dual counts | ℤ/3 with −1; S₃ on 𝔽₃³/Δ | 1=1; M^G order 1 vs (M*)^G order 3 | cyclicity essential | none |
| 2.11 | Tate curve | n=3, q=5 | #𝒜(k)=3·4=12 on both dual sides | sound | none |
| gap | perfectness | ℤ/3, pairing rs/3; zero pairing | ⟨1,1⟩=1/3≠0; zero pairing not perfect | precise, minimal | none |
| 3.11 | realization | 𝔾_m; ℙ¹ | [ℚ(1)]−1; 1+[ℚ(1)] | sound | sentence fixed |
| 4.3 | surjectivity | const(−2); proj₀·proj₁; proj₀−proj₀ | C(−2); X₀X₁; 0 | sound | none |
| 4.6 | renaming | collapse at v=(7); swap at (2,5) | 0=0; 3=3 | sound | R05 |
| 4.14 | bounded ∀ | n=0; P(i)≡i=0, n=1, 2 | true; true; false | sound (Davis unread) | none |
| 4.16 | MRDP | n=0 with ∅ and univ; evens | 1=0 and 0=0; x−2y | sound (Davis unread) | none |
| 4.17 | H10, one-parameter | scratch theorem | elaborates, `sorry` only | statable | R02 |
| 4.19 | Observation 0 | t=1/2; t=3 | (m,n,a,b)=(1,2,1,0): 1=1 and 1=½·2; t=3 forces n=±1, excluded | sound | R04 |
| 4.21 | trace sets | T₋₁,₋₁; (6,15) mod 8 | Δ={2,∞}: 3∈T, 5∉T; (1,1,0)→−21≡3, (1,1,1)→69≡5 | sound (source table error) | R04 |
| 4.22 | semilocal rings | R³₃; R³₅; R¹₁,₃ | ℤ_(3); Δ₋₁,₋₅={2,∞}, Δ₂,₋₅={2,5} give ℤ_(2); Δ₋₂,₃=∅ gives ℚ | sound | none |
| 4.23 | radicals | (a,b)=(−1,3) | Δ={2,3}, v₂ both even, so J=3ℤ_(3) ≠ Jac(ℤ_(2)∩ℤ_(3)); the guard is needed | sound | none |
| 4.26 | ∀∃, one-parameter | scratch theorem | elaborates, `sorry` only | statable | R02 |
| 4.29 | one ∀ | t=0; t=1/2 | holds; fails | sound | none |
| 4.31/Lean | nonpowers | ℚ, r=2: −1, 0, 4; r=3: 2, −8; ℚ(i), r=2: −1; ℚ(ζ₃), r=3: ζ₃ | in, out, out; in, out; out (i²=−1); in (cube roots have degree 6) | sound | none |
| Lean | nonsquares vs nonpowers | k=ℚ, r=2 | same set; Σp_j²=0 | special case | R07 |
| 6.1/Lean | `IsOMinimalExpansion` | R_alg; ℤ named | finite unions; frontier ℤ infinite, fails | sound | none |
| 6.4 | cells | unit disk | 5 base cells; 1+3+5+3+1=13 cells | sound | R04 |
| 6.17 | blocks | (0,1); point; exp graph | ⊂X_alg; nothing; not a semialgebraic image | sound | none |
| 6.18/Lean | `pila_wilkie` | X=ℝ; graph of 2^x; n=0 | 0; points (k,2^k), about log₂T ≤ CT^ε; count 1 or 0 | sound | R01 |
| 6.18 | supply | L=R_Pfaff | B2.6 needs cells for L; §3.5a covers only R_an,exp; owner is §6.4 here | cycle | R01 |
| 6.20/Lean | `bounded_degree_counting` | √2 with k=2, T=2; k=1; π; n=0 | in (H=√2, degree 2); out; IsAlgebraic false (junk height 1, minpoly 0); count 1 | sound | none |
| 6.20 | without IsAlgebraic | graph of exp on (0,1) | uncountable set, ncard 0: the bound would be vacuous | condition needed | none |
| 6.20 | height conversion | X²−2, k=2, T=2 | coefficient height 2 ≤ 2²·2²=16 | sound | none |
| 7.4 | AO | {0,1728}; {1}; A₁ | 2 special points; ∅; special | sound | none |
| 7.6 | codimension | dim X=1, dim Ď=1, Z a point | codim U<2≤1+1; dim U=0 projects to a point | sound | none |
| Lean | `ax_kochen_ring` | ∃x x²+1=0 at p=2, 3, 5 | false/true; false/false; true/true | sound | none |
| Lean | `igusa_…` | m=0, f=1; m=1, f=0; ℤ₂[√2], f=x | 1; 1/(1−qT); 1/(1−T) | sound | none |
| Lean | `universal_integers`, `one_universal_variable` | t=0; t=1/2 | true; false | sound | none |
| Lean | `algebraicPart` | (0,1); {0,1}; n=0 | X; ∅; ∅ | sound | none |

## Not verifiable

- **Hodges, *Model Theory* §5.3** (uncertified). Covers §§0.1–0.4, including the sampled 0.3. Its mathematics was checked: cross-multiplication and the excluded (1,0).
- **Davis, *Hilbert's tenth problem is unsolvable*** (uncertified). Covers §§4.11–4.17, including the sampled 4.14 and 4.16, and the `Diophantine.mrdp` locator "Theorem 8.1, p.264".
- **Bosch–Lütkebohmert–Raynaud §7.3 Proposition 6; Schneider Proposition 6.4; Denef 1984 Theorems 1.1–1.2** (uncertified). Paywalled; cited by locator.
- **van den Dries, *Tame Topology*; van den Dries–Macintyre–Marker; Pila–Wilkie 2006; Cluckers–Loeser addenda** (waived).
- **McCallum 1986**: not cited. The perfectness input is the declared gap.

## Source issues

- **Error** in koenigsmann_defining_z at proof of Proposition 6, table, p.78: the source says row (6,15) uses (x₂,x₃,x₄)=(1,1,0), giving −21≡3 mod 8; it should be a triple such as (1,1,1), giving 69≡5 mod 8 as required; affects the proof.
- **Misprint** in koenigsmann_defining_z at proof of Proposition 10(b), p.81: the source says R[5]_p is T₋₂p,₋p+T₂p,₋p and R[7]_p is T₋p,₋p+T₂p,p; it should be T₋₂,₋p+T₂,₋p and T₋₁,₋p+T₋₂,p as in Definition 7; affects nothing.
- **Misprint** in koenigsmann_defining_z at Corollary 22, p.90: the source says the class-one clause uses R[1]_p, which is never defined; it should be S_p of Definition 19, as the proof's appeal to Lemma 20 shows; affects nothing.
- **Misprint** in koenigsmann_defining_z at proof of Corollary 22, p.91: the source says the guard is p∈k+ℤ_(2); it should be p∈k+8ℤ_(2); affects nothing.
- **Error** in koenigsmann_defining_z at Lemma 13, closing clause, p.82: the source says J_ab is the Jacobson radical of T_ab when ∞∉Δ and the dyadic condition holds; it fails for Δ=∅ (J=ℚ, Jac(ℚ)=0), so it needs Δ≠∅ as in Lemma 14; affects a stated result.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at Definition 5.1, p.7, and Lemma 5.2, p.8: the source says coefficient vectors in ℚ^k with powers α^(j−1), j≤k, which have degree ≤k−1; it should be k+1 coefficients so that degree-k numbers have finite H^poly_k; affects nothing.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at the headings of §§4–5, pp.6–7: the source says "Proof of Theorem 1.3" and "proof of Theorem 1.2"; it should be Theorems 1.7 and 1.6; affects nothing.
- **Misprint** in native_multiplicative_heights at docstring of `NumberField.absMulHeight₁`: the source says the junk value off algebraic elements is 0; it should be 1, which the definition returns; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d36cfa5", "job": "REV-PKG-LogicAndDefinabilityInNumberTheory~3", "model": "opus", "worker": "fable-rev107"} -->
