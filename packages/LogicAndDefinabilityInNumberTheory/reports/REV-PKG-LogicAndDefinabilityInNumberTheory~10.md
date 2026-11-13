<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6851324051 -->
Review (claude) of 475c9e3

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a Tau Ceti theorem is cited by a name that does not exist at the pin

   **Location.** `packages/LogicAndDefinabilityInNumberTheory/README.md` line 100: "bounded-degree Northcott `finite_setOf_absMulHeight₁_le` ([§0.3](…))".

   **Claim.** `finite_setOf_absMulHeight₁_le` is a declaration, supplied by DiophantineApproximationAndTranscendence §0.3.

   **Witness.** At the pinned Tau Ceti the theorem is `TauCeti.finite_setOf_absMulHeight₁_le` (`TauCeti/NumberTheory/Height/Absolute.lean` line 187). `#check @finite_setOf_absMulHeight₁_le` gives "Unknown identifier"; the qualified name elaborates. The supplier's own §0.3 (its README line 302) calls it "Tau Ceti's `TauCeti.finite_setOf_absMulHeight₁_le`".

   **Exact repair.**

   1. Line 100: replace "and bounded-degree Northcott `finite_setOf_absMulHeight₁_le` ([§0.3](…))" by "and bounded-degree Northcott ([§0.3](…)), which is Tau Ceti's `TauCeti.finite_setOf_absMulHeight₁_le` (TauCeti/NumberTheory/Height/Absolute.lean): in a field of characteristic zero, the algebraic elements of degree at most d and absolute multiplicative height at most B form a finite set". Keep the link.
   2. `sources.toml`, entry `tauceti_pin`: the locator names two files, and the README cites six (seven with the file of item 1). Write `locator = "Geometry/RealAlgebraic/Semialgebraic/Basic.lean, RingLanguage.lean and Dimension/Basic.lean; Geometry/RealAlgebraic/CAD/Existence.lean; RingTheory/GrothendieckRing.lean; NumberTheory/NumberField/Global/Approximation/Vector.lean; NumberTheory/Height/Absolute.lean"` and add "6.1; 6.12; 6.16; 4.20" to `cited_for`.

   Tested: with `TauCeti.NumberTheory.Height.Absolute` imported, `#check @TauCeti.finite_setOf_absMulHeight₁_le` prints `∀ {F} [Field F] [CharZero F] (d : ℕ) (B : ℝ), {x | IsAlgebraic ℚ x ∧ (minpoly ℚ x).natDegree ≤ d ∧ NumberField.absMulHeight₁ x ≤ B}.Finite`, which is the counted set of `bounded_degree_counting` in one coordinate. The other 80 library names of the README elaborate as written (below).

2. **F02** (P3) §6.1 cites the monotonicity theorem, which it does not state

   **Location.** README line 1488, the citation of §6.1: "*Geometric categories and o-minimal structures*, §2, pp.7–9; §4.1, p.12 (revised author copy)".

   **Claim.** §4.1, p.12 of that text supports a statement of §6.1.

   **Witness.** `geometric_categories_and_o_minimal_structures` line 472: 4.1 is the monotonicity theorem. §6.1 states the predicate, the finite-boundary equivalence, reducts and constants; monotonicity is ShimuraVarieties §3.4c (README line 104).

   **Exact repair.** In the §6.1 citation delete "; §4.1, p.12", leaving "§2, pp.7–9 (revised author copy)". That locator is right: the definition of a structure on the real field is on p.7 (line 259) and the o-minimality definition on p.9 (line 370). The manifest needs no change: §6.3 still cites 4.1 (the remark on analytic monotonicity, line 475) and 4.2.

Two findings, both P3, neither blocking. The three round-9 findings are repaired, the fifteen sampled targets agree with their sources, `Suggested.lean` elaborates with `sorry` as its only warning, and no theorem in it is padding. What remains is one library name written without its namespace and one locator that supports nothing in its section.

Checked against the pins of the content checkout's `lake-manifest.json` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`), main `42813dd` and the open heads of the index of 2026-11-13.

## Verified sound

### Round-9 findings, checked at this head

| Finding | Status | Repaired passage and check |
|---|---|---|
| F01 (P2) triangulation and C^p cells had two owners | Repaired | Line 25: "**TauCetiRoadmap.StratifiedSpacesAndTameTopology** §4.1 owns the triangulation theorem … and §7.1 the C^p cell decomposition of definable sets over ℝ; neither is used or restated here." §6.4 is "Connected components and definable paths", §6.5 "Uniform bounds on the components of fibres". "triangulat" now occurs only in lines 25 and 22/84/800 (`TriangulatedK0`). At the head of StratifiedSpacesAndTameTopology: §4.1 (triangulation over every ordered field) and §7.1 (`C^p` cells, van den Dries–Miller 4.2(1)–(2)) exist as cited. Its README does not mention this roadmap, and no other roadmap states the component theorem, definable path-connectedness or the fibre bound (`roadmaps grep`). |
| F02 (P3) BKT §1.1 for a passage of §1.2 | Repaired | Lines 1512 and 1522: "§1.2, pp.2–3"; manifest `bkt` locator "§1.2, pp.2–3; Theorem 4.13; Appendix A.1–A.2". Also read: Theorem 4.13 on p.18 (`bkt` line 844), A.1 on p.19 (874), A.2 on p.20 (908). |
| F03 (P3) Cluckers–Loeser locators and the §3.3 edge | Repaired | Line 680: "§4.2, p.19 (the ring A, its evaluations L↦q for real q>1, the order and A_+)"; line 682: "*Needs:* Mathlib `LaurentPolynomial` with `LaurentPolynomial.isLocalization`, `Localization` and `IsLocalization.lift`" (all four elaborate); lines 480, 630, 1419, 1439 carry the page ranges the review asked for. |

Pattern search for the repaired defects elsewhere: no other BKT "§1.1"; no other citation of a van den Dries–Miller item the text does not use, except R02; no second owner for a Layer 6 target.

### Mechanical checks

- **Elaboration.** `lake env lean` on `packages/LogicAndDefinabilityInNumberTheory/Suggested.lean` from the content checkout: exit 0, twelve `declaration uses sorry` warnings (lines 40, 50, 66, 73, 89, 95, 101, 109, 127, 135, 169, 185), nothing else. The file is unchanged since round 8 (`git diff` against the round-9 head touches only the README, the manifest and a report).
- **Padding probe, all twelve theorems.** A scratch copy with each `sorry` replaced by `first | rfl | (simp; done) | infer_instance | trivial | (intros; rfl) | decide`: twelve errors, none closes. The six definitions each serve a stated headline.
- **Signatures.** The 18 elaborated types of `scratch/signatures.md` compared with §§1.5, 2.6, 4.15, 4.16, 4.17, 4.24, 4.25, 4.28, 4.30, 4.33, 6.1, 6.11, 6.12, 6.14, 6.16. The file has no `variable` block and no binder is lost. Nothing changed.
- **Library names.** One scratch file with `#check` for 81 Mathlib and Tau Ceti names of the README, after `lake build` of six Tau Ceti modules whose object files were missing (build completed). 80 elaborate; the one failure is R01. Opened at the pin:
  - `Rat.mulHeight₁_eq_max`, Mathlib/NumberTheory/Height/NumberField.lean line 532, and `NumberField.absMulHeight₁`, line 136, as the README says. The body returns `1` on a non-integral input, so the README's "total value 1 on transcendental inputs" is right. (Mathlib's docstring there says "junk value of `0`"; the README follows the body.)
  - `Poly.induction` has the cases `proj`, `const`, `f - g`, `f * g`, as §4.3 uses them.
  - `MvPolynomial.funext_set` requires `[IsDomain R]` and infinite coordinate sets, as line 54 says.
  - `FirstOrder.Language.presburger.mul_not_definable` is stated on ℕ, as §2.4 says.
  - Tau Ceti: `isSemialgebraic_iff_definable_real` (RingLanguage.lean line 135), `semialgebraicDim` (Dimension/Basic.lean line 76), the instance of `HasSemialgebraicProjections ℝ` (CAD/Existence.lean line 102), `exists_one_tmul_mem_of_mem_nhds` (Approximation/Vector.lean line 127), `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite` (QuadraticForm/Global/SignPrescription.lean line 154).
- **Pins by object.** No `Dioph` in Tau Ceti, no `REPred`–`Dioph` equivalence, no o-minimal structure, no algebraic part and no Denef–Pas, Ax–Kochen or Igusa statement in the pinned Mathlib or Tau Ceti. `scratch/library-matches.md` has no same-name hit and no candidate that proves a target.
- **Dependency check**, run as prescribed: `depcheck: 208 roadmaps, 1904 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Hygiene.** No LaTeX delimiter, pull-request number, round label, machine path, "(removed)" stub, `lemma`, `set_option`, `#eval`, `#print` or `True` placeholder. Imports are `import Mathlib` and one existing `TauCeti.*` module. None of the roadmaps that may not be cited as suppliers is named.
- **Headlines.** Stated at the pins: §1.5(a) coefficient-free (`ax_kochen_ring`), §2.6, §4.15, §4.16, §4.24 (two forms), §4.25, §4.28, §4.30, §4.33, §6.14, §6.16. The module docstring names, each with its missing carrier: relative elimination, AKE and transfer with coefficients; motivic integration, specialization and integral transfer; dual Néron volumes; normic zero-cycles; definable Chow; the André–Oort, CM-pair and mixed reductions; the period-codimension consequence. None is forced through a stand-in.
- **Gap `neron-pairing-perfect-finite-residue`.** Same slug in `design/plan.json` and README line 76; one `needs` sentence with its hypotheses. NeronModelsAndSemistableAbelianVarieties §4.6 at its head (line 2644): "Perfectness beyond the semistable case is not asserted". Declared, precise, minimal.
- **Manifest.** 41 entries, 41 ids, no local path, nothing removed. Every work the README cites has an entry. No `needs-references.toml` was needed.
- **Shape.** Eight layers, each ending with Examples and Dependencies. §6.4 has three Checks and §6.5 four, each computing a value a wrong statement would miss.

### The seeded source sample

| Target | Passage opened | Result |
|---|---|---|
| 1.4 | `cluckers_loeser_2008` 318–374: Theorem 2.1.1 (p.9), Corollary 2.1.2 (p.10) | Pages right. The source states elimination; §1.4 derives the sentence case by the route it gives. For a coefficient-free sentence the polynomials are integer constants n, with ord(n)=0 and ac(n)=n·1 in residue characteristic zero, so truth depends on the two theories only. |
| 1.5 | `cluckers_loeser_exp` 1580–1622 (Notation 9.1.1, p.40; L_O and the uniformizer map, pp.40–41), 1750–1763 (Proposition 9.2.1, p.44, ultraproduct step), 1853 (Theorem 9.2.4, p.46) | As cited. The source asks for isomorphic residue fields; the README's O-algebra condition is stronger and its Check shows why. |
| 2.10 | `torsion_and_tamagawa_numbers` 1537–1577 (paragraph before and Proposition 4.3, pp.2032–2033; Example 4.4); `geometric_stabilisation_via_p_adic_integration` 296–316 (Proposition 2.2, p.6) | As cited. `bosch_lutkebohmert_raynaud` is uncertified. |
| 3.7 | `cluckers_loeser_2008` 2437–2495 (Theorem 10.1.1, A0–A8, pp.59–60), 2504 (§11, p.61) to 3032 (§12, p.73), 3175 (§13.2, p.77), 3226 (Theorem 14.1.1, p.78) | As cited; the eight laws the README lists are A0, A2–A8, with A1 in "integrable graded positive Functions". |
| 4.2, 4.3 | `hilbert10_polynomial_bridge` 555 (`toDiophPoly`), 593 (`toDiophPoly_apply`), 619 (`exists_mvPolynomial`); `undecidability_in_number_theory` 89 (Definition 1, p.2), 180 (footnote 4, p.2) | As cited. |
| 4.26 | `koenigsmann_defining_z` 540–554 (Corollary 15, p.84), 649–711 (Definition 19, p.86; Lemma 20, pp.86–87) | As cited, including "square p gives the empty set" (line 651). |
| 4.30 | `le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres` 547–601 (Proposition 4.2; Theorem 4.3, pp.16–17) | As cited; the reduction to prime exponent and roots of unity is line 572, p.16. |
| 6.4 | `geometric_categories_and_o_minimal_structures` 497–499 (cells connected, p.12), 513 (4.3, p.13), 522 (4.6, p.13); for §6.5, 515 (4.4, p.13) | As cited. |
| 6.8 | `peterzil_starchenko_agc` 501 (Theorem 3.2, p.10), 520 (Theorem 4.1, p.10), 596–605 (Theorem 4.4 and proof, p.12); `ax_schanuel_for_shimura_varieties` 180–199 (Theorem 2.1, §2.2, p.5) | As cited. ShimuraVarieties §3.5d at its head cites Theorem 4.4 among the extension arguments it constructs. |
| 6.11 | `on_the_algebraic_points_of_a_definable_set` 200–215 (§3 examples, p.5) | As cited: X₁ is the restricted x^y surface with infinitely many components in its algebraic part. `pila_wilkie` is waived. |
| 6.16 | same, 74–77 (Theorem 1.6, p.2), 322–352 (Definition 5.1, the bound 2^k H^k, p.7), 357–398 (Lemma 5.2, Theorem 5.3, p.8); `the_andr_oort_conjecture_for_a_g` 351–385 | As cited. The README's coefficient vector of length k+1 corrects the source (below). |
| 6.17 | `the_andr_oort_conjecture_for_a_g` 351–391 (§§6.2–6.4, pp.387–388) | As cited. |
| 7.3 | `ax_lindemann_for_a_g` 670 (Theorem 7.1, p.673), 710–853 (Lemmas 7.2–7.7, pp.674–678), 761–820 (proof); `the_andr_oort_conjecture_for_a_g` 392–406 (§6.5, p.388) | As cited. |
| 7.5 | `abelian_varieties_isogenous_to_no_jacobian` 492 (§3.2), 584–590 (André's theorem, p.648), 656–667 (blocks, p.650); `ax_lindemann_for_a_g` 666–669 (p.673) | As cited. |
| also read | `ax_lindemann_for_a_g` 195, 199 (Lemmas 2.1, 2.3, p.663), 441 (Theorem 4.4, p.668), 517 (Theorem 6.1, p.670), 654 (Conjecture 7.1, p.673); `the_andr_oort_conjecture_for_a_g` 44 (Theorem 1.3, p.380), 274 (Theorem 5.2, p.385), 326 (Theorem 5.3, p.386) | The locators of §§7.1, 7.2 and 7.4 into these two texts are right. |

### Adversarial pass (sampled targets, headlines, repaired and finding-touched passages)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.5 Checks | x²+1 at p=2, 3, 5; O=ℤ[i] at p=5, 13 | ℚ₂: −1≡7 mod 8, not a square; 𝔽₂((t)): x=1; p=5: 2²≡−1. ι=2, 3 at 2∓i: 1+ι=3 (nonsquare), 4=2². p=13: ι=±5, 1+ι=6, 9; squares mod 13 are 1, 3, 4, 9, 10, 12 | Hold; field isomorphism of residue fields is not enough. |
| 1.5 Check on x²=1+t | ℚ₂ with ϖ=2; 𝔽₂((t)) | 3 is not 1 mod 8; squares are series in t² | Bound in (b) at least 2. |
| 2.10(c) | ℤ/3 with σ=−1; Tate curve ord Δ=n | σ−1=−2 is onto, Φ^G=0=Φ/(σ−1)Φ; ℤ/n and n(q−1) on both sides | Holds. |
| `igusa_poincare_rationality` | n=0; kernel of ℤ_p→O | m⁰=⊤, one-point quotient, count 1; kernel (p) would give characteristic p, so O is the integral closure of ℤ_p | True statement; hypotheses real. |
| §3.3 without §3.2 | L−2 at q=3/2; 1−L⁻¹ at q=1 | −1/2<0; 0, so q=1 is excluded | A is a localization of ℤ[L,L⁻¹]; the edge to §3.2 was not needed. |
| 4.2, 4.3 | X₀−2X₁ at (1,3); α empty, constant −3 | 1−6=−5; −3 | Signed values kept. |
| 4.21 Check | R³₅ | Δ(−1,−5)={2,∞} since (−1/5)=1; Δ(2,−5)={2,5} since (2/5)=−1; meet {2} | ℤ_(2), as stated. |
| 4.26 Checks | p=17; p=17·41; p=1 | 17≡1 mod 8; 697=87·8+1; 1 is a square | S₁₇=ℤ_(17); 1/17∈S₆₉₇; S₁=∅. |
| `nonpowers_diophantine` | ℚ, r=2: −1, 4; r=3: 2, −8; x=0 | nonsquare, 2²; v₂(2)=1, (−2)³; excluded by x≠0 | Agrees with the Checks. |
| `two_universal_integer_formula` | a≤0; a,b>0 | −a is a sum of four rational squares, so a+A(u)=0; guards positive, F=0 forces t=2u₁+2y₁ with both norms 1 | Matches source p.79. |
| 4.20 dyadic row (6,15) | (1,1,0); (1,1,1) | −6−15=−21≡3; −21+90=69≡5 mod 8; the source needs 5 | README right, source table wrong (below). |
| 5.4 | series | q²(1−q⁻¹)²(1/(1−q⁻¹)²−1)=q²−(q−1)²=2q−1 | Holds. |
| §6.2 cube Check | g(x)=f((x+1)/2), f=eˣ·1_[0,1] | (x+1)/2∈[0,1] iff x∈[−1,1]; g(2x−1)=f(x) | Same definable sets. |
| §6.4(a) | A=∅; [0,∞); {xy=1} | 0 components; cells {0}, (0,∞) with 0∈cl(0,∞): 1 component; 2 graph cells, neither meets the other's closure: 2 | Holds; "components = cells" fails on [0,∞). |
| §6.4(b), class argument | X=[0,1)∪(1,2]; closed topologist's sine curve | 1∉X, no adjacency across 1, two classes, X disconnected; trace on y=0 is {0}∪{1/(kπ)}, infinite with no interval | Each class is closed in X (a point of X in the closure of a cell lies in an adjacent cell); definability is needed. |
| §6.5 | {\|x\|<1, x≠t}; sin(tx)>0 on (0,1) at t=2πk; ℝ×(0,1); m=0 | 2 components for \|t\|<1, else 1; the k intervals (j/k,(2j+1)/(2k)); N=1 with infinite fibres; §6.4(a) | Holds; the bound is on components, not points. |
| 6.8 Checks | Y=ℂ, E={0}; node, one punctured branch; E=Y | ℂ; {y=0}; ∅ | Hold. Singular Y: A is closed analytic in W∖E for W smooth open in projective space, and the closure stays in Y, closed in W. |
| `algebraicPart` | (0,1); {0}; finite X | (0,1) itself; ∅ (a singleton is a subsingleton); ∅ | Agrees with §6.11. |
| `pila_wilkie`, `bounded_degree_counting` | n=0; a transcendental coordinate | counts 0 or 1; `absMulHeight₁`=1 and `minpoly`=0 of degree 0, excluded only by `IsAlgebraic` | Counted sets finite (bounded height; R01's Northcott), so `ncard` is no junk value. |
| 6.16 Check | √2, k=2, T=2 | H_abs=√2≤2; coefficient height 2≤2²·2²=16; 2⁻²·2≤(√2)²≤√3·2 | Holds. |
| 6.17 | lifts ≥cD^δ, heights ≤CD^A | blocks ≤C′(CD^A)^ε; Aε<δ makes cD^δ larger for large D, so two lifts share a block, which is then not a point | Holds. |
| 7.1 Checks | reduced (a,b,c), D<0 | \|D\|=4ac−b²≥3a², so 2a≤3a²≤\|D\| | k₁=2, a₁=1. |
| 7.5 | diagonal; {j₁=1728}; {j₁=1} | Φ₁=j₁−j₂; 1728=j(i); 1 not among the thirteen rational CM values | ι(C) is closed (ι finite) with dense special points, so §7.4 applies. |
| 7.7 δ | N, D≥1 | N^(1−ε)D^(1/b)≥(ND)^min(1−ε,1/b); max(N,D^B)≤(ND)^max(1,B) | δ=min/max, as stated. |

### Library, ownership and supplier audit

- **Supplier citations, resolved now.**
  - On main: SchemeAndStackFoundations §0.7 and §2.20; ReductiveGroupsPartII RG2.3.7; QuadraticFormInvariants Layer 2 and §6C items 9–12; GlobalQuadraticForms §§4.2, 4.3, 5.5, 6.1 and its "Section and name map" for 4.4; DiophantineApproximationAndTranscendence §0.2 (the comparison `2⁻ᵈH≤Habs^d≤√(d+1)H`, its line 290), §0.3, §5.6; DifferentialGeometry "Boundary and corners"; ClassFieldTheory Layers 5, 10–13; ResolutionOfSingularitiesCharacteristicZero §6.2; Completed: Chebotarev Layer 14, RealAlgebraicGeometry Layers 3 and 6.
  - At open heads: ShimuraVarieties §§3.4b–3.4e, 3.5a, 3.5d, 3.6; AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15, B2.18; AdelicAlgebraicGroups §2.4 with both named items; NeronModelsAndSemistableAbelianVarieties §§2.5, 4.6; MotivesAndAlgebraicCycles §4.20; HeightsRationalPointsAndObstructions §§2.16b, 2.17, 2.20, 2.21, 5.1, 5.6, 5.8; WeilConjectures §5.29.
  - What §§6.4–6.5 take from ShimuraVarieties is there as cited: §3.4c states that a cell of dimension d is carried homeomorphically onto an open cell by a coordinate projection with continuous definable inverse; §3.4e states curve selection with a continuous definable γ:(0,ε)→A.
- **Ownership by object** (`roadmaps grep` over main and the open heads). MRDP and Hilbert's tenth problem, Denef–Pas and angular components, Ax–Kochen, motivic integration match no other roadmap's targets. Pila–Wilkie appears elsewhere only in AbelianSchemesAndArithmeticModuliPartII, the declared owner of the block theorem. ComputabilityTheory on main works with `REPred` and states nothing Diophantine. ComplexMultiplicationAndExplicitReciprocityPartII puts "André–Oort, o-minimal counting, functional transcendence" outside its scope (its line 16); the lift-height bound it proves is a hypothesis here, (I-lift), not a target. RealAlgebraicGeometry leaves "general o-minimal structures, triangulation" out of its scope (its line 80).
- **Overlaps.** No other open pull request changes this roadmap; no cited id is dropped; no second copy on main. The one roadmap citing sections of this one, TopologicalMirrorSymmetryForHitchinSystems, cites §§2.5, 2.7–2.9, 2.11, 2.12, none renumbered.
- Overlap check: read ShimuraVarieties, StratifiedSpacesAndTameTopology, AbelianSchemesAndArithmeticModuliPartII, HeightsRationalPointsAndObstructions, ComplexMultiplicationAndExplicitReciprocityPartII, ComputabilityTheory, ClassicalArithmeticCompletion, RealAlgebraicGeometry; general o-minimal theory: ShimuraVarieties; triangulation and C^p cells: StratifiedSpacesAndTameTopology; block counting: AbelianSchemesAndArithmeticModuliPartII; semialgebraic sets and projection over ℝ: RealAlgebraicGeometry; nothing else shared.

### Copyright, licences and scope

- **Wording.** Eighteen passages set beside their sources: the fifteen sampled targets, §2.11 against `geometric_stabilisation_via_p_adic_integration` 304–316, §6.13 against `on_the_algebraic_points_of_a_definable_set` 221–231, and the docstring of `pila_wilkie` against the same text, line 59. The longest shared runs are standard statements of a few words ("finitely many connected components, each", six words, at `geometric_categories_and_o_minimal_structures` line 513). No sentence, list or proof plan is reproduced or translated clause by clause; §4.30 compresses a 35-line French proof into four sentences of its own.
- **Arrangement.** `cluckers_loeser_2008` has the largest share, about 36 of roughly 180 source locators. Its contents (lines 292–312) set beside Layer 3: 3.1 ↔ §2, 3.2 ↔ §5.1, 3.3 ↔ §4.2, 3.4 ↔ §4, 3.5 ↔ §5, 3.6 ↔ §6, 3.7 ↔ §§10–11 and 13–14, 3.8 ↔ §12, 3.11 ↔ §16. The order is not the source's (§5.1 before §4, §12 after §§13–14), its §§3, 7, 8, 9 and 15 are in Layers 1–2 or folded into other sections, and 3.9–3.10 come from another paper. The run 3.3 → 3.4 → 3.5 → 3.6 → 3.7 → 3.8 is forced by the *Needs:* lines.
- **Reuse.** No table, figure or exercise list is taken over. The polynomial of §4.33 is a formula.
- Source independence: 18 passages compared with 12 sources, none shared; largest share cluckers_loeser_2008, about 36 of 180 locators; contents compared with cluckers_loeser_2008: independent.

## Not verifiable

- `pila_wilkie` (§§6.11, 6.12, 6.14), `vd_dr_tame`, `vd_dr_macintyre_marker`: settled waived; cited by locator only.
- `hilbert_s_tenth_problem_is_unsolvable`, `denef_1984`, `bosch_lutkebohmert_raynaud`, `schneider`, `hodges`: settled uncertified; statements checked by computation, locators and wording not read.
- LogicAndDefinabilityInNumberTheoryPartII is later in the merge order and has no folder on main or at an open head; ownership against it was not checked.
- Sections outside the sample and outside the repairs rest on the computed rows of rounds 7–9; they were not recomputed. The Gao and Lawrence–Sawin locators of §§7.6–7.7 were not reopened this round.

## Source issues

- **Error** in on_the_algebraic_points_of_a_definable_set at Definition 5.1 and Lemma 5.2, author pp.7–8: the source says a number of degree at most k is annihilated by a nonzero vector of k coefficients, exponents 0 to k−1; it should be k+1 coefficients, exponents 0 to k; affects the proof.
- **Misprint** in koenigsmann_defining_z at the proof of Proposition 6, table for p=2, printed p.78: the source says the row (6,15) uses (x₂,x₃,x₄)=(1,1,0), which gives 3 mod 8; it should be a triple giving 5 mod 8, such as (1,1,1); affects the proof.
- **Error** in cluckers_loeser_2008 at §15.1, printed p.83: the source says every affine open of the ambient variety is isomorphic to an affine open of an affine space; it should use closed embeddings into affine space, as its §2.3 does; affects the proof.

## For the human reviewers

- **Licence.** §§4.1–4.9 follow the construction of a public formalisation, the Hilbert10 repository (`hilbert10_polynomial_bridge` line 497 states Apache 2.0). `Suggested.lean` declares none of its names; only `Diophantine.mrdp` and `hilbert_tenth_integers` concern that subject.
- **Licence.** Four certified sources are author-hosted copies classed `author-page` in the manifest: `bkt`, `geometric_categories_and_o_minimal_structures`, `peterzil_starchenko_agc`, `on_the_algebraic_points_of_a_definable_set`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "475c9e37161dfee930b99a12158bf8b2a179135e", "job": "REV-PKG-LogicAndDefinabilityInNumberTheory~10", "model": "fable", "worker": "chris-x55"} -->
