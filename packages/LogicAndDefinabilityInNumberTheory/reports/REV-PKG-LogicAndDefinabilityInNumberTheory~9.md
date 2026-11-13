<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6849126553 -->
Review (claude) of 5fd2b64

Verdict: needs_changes

1. **F01** (P2) triangulation and C^p cell decomposition have two owners, and no consumer here

   **Location.** `packages/LogicAndDefinabilityInNumberTheory/README.md` line 9: "§§6.4–6.5 here add the C^p refinement of cell decomposition, connected components with their uniform family bound, definable path-connectedness and triangulation"; lines 17, 24; §6.4 (line 1524); §6.5(d) (line 1542).

   **Claim.** This roadmap is the owner of C^p cell decomposition (van den Dries–Miller 4.1, 4.2) and of the triangulation theorem (4.10) for o-minimal expansions of ℝ.

   **Witness.** Open pull request #1519, `TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md`: line 32 owns "the triangulation theorem for o-minimal expansions of ordered fields", line 36 "`C^p` cells"; §4.1 (line 538) states triangulation over every ordered field; §7.1 (line 919) states 4.2(1)–(2) for every finite p.

   **Why it is a defect here.** §6.5(d) is the case R = ℝ of that §4.1, so the other roadmap cannot obtain its statement by citing this one, and single ownership is not reachable by a citation from there. No target of this roadmap uses either statement: "triangulat" occurs only in lines 9, 17, 24, in §6.5 and in the seven link texts to §6.5; C^p cells occur only in §6.4 and in two remarks (lines 1518, 1645) that say they are not enough. The consumers of §6.5 (§§6.6, 6.8, 6.10, 6.13, 6.14, 7.3) use components, paths and dimension; §6.13 uses C¹ loci, not cells. The other roadmap has a consumer (its §7.2, Whitney stratification).

   **Exact repair.** Keep the section numbers, so that no later section or `Suggested.lean` docstring moves.

   1. Delete the present §6.4 and item (d) of §6.5 with its sentence "Prove (d) by induction…", the Check on (0,1) and (0,1], and "triangulation 4.10" in the locator.
   2. §6.4 becomes "Connected components and definable paths": items (a), (b) of the present §6.5 with its opening paragraph on §3.4d, its proof route, the hyperbola Check, and two further Checks (for example: ℝ∖{0} has two components, each an interval; a cell is connected, so {xy=1} is the union of two graph cells). Locator van den Dries–Miller 4.3, p.13. *Needs:* §6.1, ShimuraVarieties §§3.4c–3.4e.
   3. §6.5 becomes "Uniform bounds on the components of fibres": item (c), the section convention of 4.5, and the Checks on |x|<1, x≠t, on sin(tx) and on the two-point map. Locator 4.4–4.5, p.13. *Needs:* §6.4, ShimuraVarieties §§3.4c, 3.4e.
   4. Repoint the seven links: §§6.6, 6.8, 6.10, 6.13, 6.14, 7.3 to the new §6.4 anchor.
   5. Lines 9, 17, 24: drop "the C^p refinement of cell decomposition" and "triangulation"; add to the Scope list "**TauCetiRoadmap.StratifiedSpacesAndTameTopology** §4.1 owns the triangulation theorem for o-minimal expansions of ordered fields and §7.1 the C^p cell decomposition of definable sets over ℝ; neither is used or restated here." Line 1462: "distinct from continuous cell decomposition in an arbitrary expansion".

   Tested: with that Scope sentence inserted in a scratch copy, the dependency check prints `depcheck: 206 roadmaps, 1904 edges, 0 problem(s)`. StratifiedSpacesAndTameTopology does not mention this roadmap, so no cycle arises. TopologicalMirrorSymmetryForHitchinSystems, the only roadmap that cites sections of this one, cites §§2.5–2.12 only.

   This is not the round-8 item again: that one moved the general theory to ShimuraVarieties and told the repair to keep these two targets without reading the other roadmap's Layers 4 and 7. The repair report of round 9 saw the overlap and left it to a maintainer; no maintainer note decides it.

2. **F02** (P3) BKT is cited at §1.1 for a passage of §1.2

   **Location.** README lines 1510 and 1520: "Tame topology of arithmetic quotients and algebraicity of Hodge loci, §1.1, pp.2–3"; `sources.toml` line 252: `locator = "§1.1; Theorem 4.13; Appendix A.1–A.2"`.

   **Claim.** §1.1 of that text defines R_alg, R_an, R_an,exp and globally subanalytic sets.

   **Witness.** `bkt` line 23: §1.1 is "Arithmetic quotients" (p.1); line 49: §1.2 "Moderate geometry of arithmetic quotients" starts on p.2; lines 101–112 (p.3) define R_alg, R_an and R_an,exp. `bkt` line 106 uses the cube [0,1]ⁿ.

   **Exact repair.** In both README citations and in the manifest locator write "§1.2, pp.2–3". In §6.2 attach the closed cube [−1,1]ⁿ to van den Dries–Miller §2.5(4), p.9 (`geometric_categories_and_o_minimal_structures` lines 336–338), which is the convention the roadmap and ShimuraVarieties §3.5a use; the Check of §3.5a there shows that the two cubes define the same sets. Pages 2–3 and Appendix A, pp.19–21, are right as cited.

3. **F03** (P3) Cluckers–Loeser locators in §§2.6, 3.1, 3.3, 5.1, 5.3, and a *Needs:* edge of §3.3

   **Location.** README line 679: "§4.1, pp.18–19; evaluation and positivity conventions, §4.2, pp.19–20"; line 681: "*Needs:* 3.2 Residue-field Grothendieck semirings"; line 1418: "§16.4, pp.89–90"; line 479: "specialization Theorem 16.4.1, p.90"; line 629: "global subassignments §2.4, pp.11–13".

   **Claim.** Each locator opens the cited statement.

   **Witness.** `cluckers_loeser_2008` lines 764–775: the ring A, ϑ_q, the order and A₊ are all in §4.2, on p.19; §4.1 (line 742) is Presburger sets. Line 3722: §16.4 starts on p.90 and ends on p.91. Line 3751: Theorem 16.4.1 compares with arithmetic motivic integration; specialization is Remark 16.4.2, p.91. Lines 430–443: gluing is §2.3, p.11.

   **Exact repair.**
   - Line 679: "§4.2, p.19 (the ring A, its evaluations ϑ_q, the order and A₊)".
   - Line 681: A is a localization of ℤ[L] and uses nothing of §3.2; write "*Needs:* Mathlib localization of polynomial rings" (the route of line 663) and drop the edge to §3.2.
   - Line 1418: "§16.4, pp.90–91"; lines 1418 and 1438: "§14.4, p.80" (the section is lines 3290–3323, one page).
   - Line 479: "comparison with arithmetic motivic integration, Theorem 16.4.1, p.90, and Remark 16.4.2, p.91"; the specialization the statement uses is the exponential paper's Theorem 9.1.5, already cited in §2.4.
   - Line 629: "definable subassignments of varieties by closed embeddings and finite affine covers, §2.3, p.11; the category GDef_k, §2.4, p.12".

   Right as cited: Theorem 4.4.1 (p.21), Theorem 12.1.1 (p.74), Theorem 14.1.1 (p.78), Theorem 14.4.1 (p.80), §15.1 (pp.82–84), Lemma 15.1.1 (p.83), Proposition 16.1.1 and §16.2 (p.88), §16.3 (p.89).

Independent review of the package at head 5fd2b64 (the repair of round 8), against the pins of the content checkout's `lake-manifest.json` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`), main 7342e8f and the open heads of the index of 2026-11-13. The seven round-8 findings are repaired. Three findings remain: one blocking (two targets that the round-8 repair kept have a second owner at an open head) and two locator findings from the seeded sample.

## Verified sound

### Round-8 findings, checked at this head

| Finding | Status | Repaired passage and check |
|---|---|---|
| F01 (P2) general o-minimal theory had two owners | Repaired | Line 9: "belongs to ShimuraVarieties §§3.4b–3.4e"; gap gone from README and `design/plan.json` (one gap left). ShimuraVarieties at its head: §3.4b bridge `exists_oMinimalStructure_definable_iff` over `Set.univ`, §3.4c (I),(II), §3.4d `WithBot ℕ∞` and `dim_eq_semialgebraicDim`, §3.4e "Every o-minimal expansion of the real field satisfies these hypotheses". What the repair kept is R01. |
| F02 (P2) "(I-orbit) for the pure part" undefined | Repaired | Line 1876: "a Shimura morphism `ι : (G, X_G⁺) → ∏_{i=1}^r (GSp_{2g}, ℋ_g⁺)` is fixed whose group homomorphism … has finite kernel"; D(x)=max D(x_i), N(x) defined. Recomputed below. |
| F03 (P3) GlobalQuadraticForms §4.1 | Repaired | Line 19: "§§4.2–4.3 … §4.4 through that roadmap's section and name map"; Tau Ceti `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds` opened at Vector.lean line 127: finite and real places, neighbourhood form, as described. |
| F04 (P3) dead links | Repaired | `Completed/Chebotarev`, `Completed/RealAlgebraicGeometry`, `#62-snc-compactification`, `#529-curve-rh-from-the-surface-bound` (heading "### 5.29 Curve RH from the surface bound" at the WeilConjectures head). |
| F05 (P3) stale pin hashes | Repaired | Line 47: "The APIs are those pinned by lake-manifest.json." |
| F06 (P3) missing *Needs:* | Repaired | §§6.2, 6.6, 6.11 and the Layer 6 Dependencies name RealAlgebraicGeometry, DifferentialGeometry, `TauCeti.IsSemialgebraic`, `TauCeti.semialgebraicDim` (Dimension/Basic.lean line 76, value ⊥ on ∅, as the README says). |
| F07 (P3) Davis §7/§8 | Repaired | Line 1009: "§8, Definition 8.1 and Theorem 8.1 with the witness-search direction of its proof, p.264". |

Pattern search for the repaired defects in the rest of the text: no other `blob/main/TauCetiRoadmap/` link to a completed roadmap, no other hash, no other `gap:` item than the declared one.

### Mechanical checks

- Elaboration: `lake env lean` on `packages/LogicAndDefinabilityInNumberTheory/Suggested.lean` from the content checkout: exit 0, exactly twelve `declaration uses sorry` warnings (lines 40, 50, 66, 73, 89, 95, 101, 109, 127, 135, 169, 185), nothing else. No module needed building.
- Padding probe on all twelve sorried theorems (`first | rfl | (simp; done) | infer_instance | trivial | (intros; rfl) | decide` on a scratch copy): twelve errors, none closes. The six definitions each serve a headline. No padding.
- Signatures: the 18 elaborated types of `scratch/signatures.md` compared with §§1.5, 2.6, 4.15–4.17, 4.24, 4.25, 4.28, 4.30, 4.33, 6.1, 6.11, 6.12, 6.14, 6.16. The file has no `variable` block; no binder is lost; the file did not change since round 8.
- Library names: a scratch file with `#check` for 62 Mathlib and Tau Ceti names of the README, with the four Tau Ceti modules imported, elaborated with no error, including `(inferInstance : TauCeti.HasSemialgebraicProjections ℝ)`, `TauCeti.semialgebraicDim`, `Finset.toRight`, `Finset.mem_toRight`, `MvPolynomial.exists_finset_rename`, `FirstOrder.Language.presburger.mul_not_definable`, `Rat.mulHeight₁_eq_max`. `TauCeti.isSemialgebraic_iff_definable_real` read at RingLanguage.lean line 135. The lead `Diophantine.mrdp` is this roadmap's own declaration (Suggested.lean line 66).
- Pins by object: no o-minimal structure, no `REPred`–`Dioph` equivalence, no algebraic part, no Pila–Wilkie statement in the pinned Mathlib or Tau Ceti.
- Dependency check, run as prescribed: `depcheck: 206 roadmaps, 1904 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Hygiene: no LaTeX delimiter, pull-request number, round label, machine path, "(removed)" stub, `lemma`, `set_option`, `#eval`, `#print`, `#synth` or `True` placeholder; imports are `import Mathlib` and one existing `TauCeti.*` module.
- Headlines: stated at the pins: §§1.5(a) coefficient-free, 2.6, 4.15, 4.16, 4.24 (two forms), 4.25, 4.28, 4.30, 4.33, 6.14, 6.16. The module docstring names relative elimination, AKE, transfer with coefficients, motivic integration, specialization, dual Néron volumes, normic zero-cycles, definable Chow, the three Layer 7 reductions and the period-codimension consequence, each with the missing carrier. None is forced through a stand-in.
- Gap `neron-pairing-perfect-finite-residue`: same slug in `design/plan.json` and README line 75; one precise `needs`; NeronModelsAndSemistableAbelianVarieties §4.6 at its head: "Perfectness beyond the semistable case is not asserted". Declared, precise, minimal.
- Manifest: 41 entries, 41 ids, no local path, nothing removed. No `needs-references.toml` was needed.
- Shape: eight layers, each ending with Examples and Dependencies; the organisation is by mathematics.

### The seeded source sample

| Target | Passage opened | Result |
|---|---|---|
| 1.3 | `cluckers_loeser_2008` 370–374 (Corollary 2.1.2, p.10); round-8 lines 318–359 | As cited. |
| 2.6 | same, 856 (Theorem 4.4.1, p.21), 3290–3323 (§14.4 and Theorem 14.4.1, p.80), 3751 (Theorem 16.4.1, p.90); `denef_1984` settled uncertified | Pages right; label of 16.4.1: R03. |
| 2.10 | `torsion_and_tamagawa_numbers` 1537–1569 (paragraph before and Proposition 4.3 with proof, pp.2032–2033), 1570–1577 (Example 4.4); `geometric_stabilisation_via_p_adic_integration` 296–316 (Proposition 2.2, p.6) | As cited; the proof route of (b), (c) is the source's. |
| 3.1 | `cluckers_loeser_2008` 375–451 (§§2.2–2.3, pp.10–11), 459–488 (§2.4, p.12), 3389–3446 (§15.1, Lemma 15.1.1) | Statement supported; "not a subfunctor" is line 378; locator of gluing: R03. |
| 3.3 | same, 764–775 (§4.2, p.19) | A, ϑ_q, order, A₊, "L−2 is not in A₊" all there; locator: R03. |
| 3.7 | same, 2437–2461 (Theorem 10.1.1 A0–A3), round-8 lines for A4–A8 | As cited. |
| 3.8 | same, 3039–3045 (Theorem 12.1.1, p.74), 3226–3236 (Theorem 14.1.1, p.78) | `f_!([f*φ]) = L^(ordjac f∘f⁻¹)[φ]`, so the weight L^(−ordjac f) of the README has the right sign. |
| 3.11 | same, 3606–3638 (§16.1, Proposition 16.1.1, p.88), 3646–3659 (§16.2), 3678–3686 (§16.3, γ, p.89) | γ has the source and target the README gives. MotivesAndAlgebraicCycles §4.20 at its head: χᶜ(𝕃)=[R(1)], "1−𝕃^(−i) maps to 1−[R(−i)]". |
| 4.3, 4.6 | `hilbert10_polynomial_bridge` 555–619 (`toDiophPoly`, `exists_mvPolynomial`); `undecidability_in_number_theory` 89 (Definition 1, p.2), 214 (p.3) | As cited. |
| 4.15 | `hilbert_s_tenth_problem_is_unsolvable` settled uncertified | Locator not read; statement checked by instances. |
| 5.3 | `cluckers_loeser_2008` §14.4, §16.4 | Page ranges: R03. |
| 6.2 | `bkt` 49, 101–112, 873–934; `geometric_categories_and_o_minimal_structures` 317–344 (§2.5, pp.8–9) | Section number: R02. |
| 6.10 | `ax_lindemann_for_a_g` 853–863 (Lemma 7.7, p.678) | As cited; the proof uses analytic cells of R_an,exp, as the README says. |
| 7.6 | `the_shafarevich_conjecture_for_hypersurfaces_in_abelian_varieties` 2958–2978 (Lemma 6.3, pp.64–65); `the_ax_schanuel_conjecture_for_variations_of_hodge_structures` 56–64 (Theorem 1.1, p.2) | As cited. |
| also read | `koenigsmann_defining_z` 88–106, 161–272 (Definition 4, Proposition 6, the formula of p.79), 875, 916–923; `geometric_categories_and_o_minimal_structures` 472–549 (4.1–4.10, pp.12–13) | The Lean polynomial is the source's formula term by term. |

### Adversarial pass (sampled targets, headlines, repaired and finding-touched passages)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.6 tail identity TZ=1+(T−1)A | f=x; f=0; f=1 | f=x: Z=(1−q⁻¹)/(1−q⁻¹T), A=1/(1−q⁻¹T), both sides T(1−q⁻¹)/(1−q⁻¹T). f=0: Z=0, A=1/(1−T), 1+(T−1)/(1−T)=0. f=1: Z=A=1, both sides T | Holds. |
| `igusa_poincare_rationality` | m=0; kernel of ℤ_p→O | one point, count 1 iff c∈mⁿ; kernel (p) would give characteristic p, so the map is injective and O is the integral closure | True statement, real hypotheses. |
| 2.10(c) | ℤ/3 with σ=−1; S₃ on 𝔽₃³/diagonal; Tate curve ord Δ=n | σ−1=−2 is onto, Φ^G=0=Φ/(σ−1)Φ; M^G=0 and (M*)^G of order 3 (source Example 4.4); n(q−1) on both sides | Holds; cyclicity needed. |
| 3.1 | ∀y y²≠−1 over ℝ⊂ℂ; y²=x³−x | {⋆} then ∅; genus 1, not open in 𝔸¹ | Holds; the closed-embedding globalization is needed. |
| 3.3 | L−2 at q=3/2; 1−L⁻¹ at q→1 | −1/2<0; tends to 0, so q=1 excluded | Holds. |
| 3.8 | f(x)=tx on the unit ball | ordjac=1; f_!(1)=L·1 on the image, and L⁻¹·L=1: volume L⁻¹ of tO against |t|=q⁻¹ | Sign right; agrees with §2.5 x=πu. |
| 3.11 | 𝔾_m, ℙ¹ | [ℚ(1)]−1; 1+[ℚ(1)]; 𝕃⁻ⁱ↦[ℚ(−i)] | Agrees with the supplier's Checks. |
| 4.6 | p with inputs only; β empty | t=∅ works; s.toRight=∅ | Holds. |
| `Diophantine.mrdp` | n=0; S=∅ | both sides true (constant polynomial 0 or 1) | Retain. |
| `two_universal_integer_formula` | a=0; a,b>0 with t=1/2; degree | a=0: u=0 kills the guard. a,b>0: guards positive, F=0 forces t=2x₁+2y₁∈T_ab, and ⋂T_ab=ℤ. a²b²u₄⁸ has coefficient 1: degree 12, existential degree 8 | Matches source p.79. |
| 4.20 dyadic row (6,15) | (1,1,0); (1,1,1) | −21≡3; 69≡5≡−3 mod 8 | README right, source table wrong (below). |
| 4.21 | R³₃; R³₅ | Δ(−1,−3)={3,∞}, Δ(2,−3)={2,3}, meet {3}; Δ(−1,−5)={2,∞}, Δ(2,−5)={2,5}, meet {2} | ℤ_(3), ℤ_(2): as the Checks say. |
| 1.5 Check | p=5, 13 | 1+ι=3,4; 6,9; squares mod 13 are 1,3,4,9,10,12 | Holds. |
| 5.4 | series | q²(1−q⁻¹)²(1/(1−q⁻¹)²−1)=q²−(q−1)²=2q−1 | Holds. |
| 6.1 `IsOMinimalExpansion` | ℤ; ℚ; (0,1); empty language | frontier ℤ; ℝ; {0,1}; order not a Boolean combination of lines and the diagonal | Retain. |
| 6.5(a)–(c) | {xy=1}; sin(tx)>0 at t=2πk | 2 components; the k intervals (j/k,(2j+1)/(2k)) | Hold. |
| 6.5(d), 6.4 | against StratifiedSpacesAndTameTopology §4.1, §7.1 | same statements, the first there over every ordered field | R01. |
| 6.10 | empty family; point cell | X=∅ is the empty union; a point lies in one V_i | Holds. |
| `pila_wilkie`, `bounded_degree_counting` | n=0; `ncard` of an infinite set | counts 0 or 1; the counted sets are finite (bounded height, and Northcott with explicit algebraicity), so `ncard` is not a junk 0 | Retain. |
| 6.16 Check | √2, k=2, T=2 | H_abs=√2; coefficient height 2≤16; 2⁻²·2≤2≤√3·2 | Holds. |
| 7.1 Checks | g=1 reduced forms; 13 values | 3a²≤|D| so 2a≤|D| for |D|≥3; the list is the thirteen rational CM j-invariants, 1 not among them | Hold. |
| 7.6 | dim U>0; U a point | codim U<dim X+dim Ď≤codim V+codim W; a point is a proper subvariety since dim X>0 | Holds. |
| 7.7 δ | N,D≥1 | N^(1−ε)D^(1/b)≥(ND)^a, max(N,D^B)≤(ND)^m, δ=a/m | Holds. |
| 7.7 quaternionic curve | F real quadratic | weight (−1,0) and its conjugate (0,−1) have the same image, so (−1,1) would lie in a finite kernel | No ι: excluded. |

### Library, ownership and supplier audit

- Supplier citations resolved now, at their open heads: ShimuraVarieties §§3.4b–3.4e, 3.5a (closed cube [−1,1]ⁿ), 3.5d, 3.6; AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15, B2.18; HeightsRationalPointsAndObstructions §§2.16b, 2.17, 2.20, 2.21, 5.1, 5.6, 5.8; MotivesAndAlgebraicCycles §4.20; NeronModelsAndSemistableAbelianVarieties §§2.5, 4.6; WeilConjectures §5.29; AdelicAlgebraicGroups §2.4 (both named items). Those on main rest on the round-8 resolution and the repair's link check.
- Ownership by object (`roadmaps grep` over main and the open heads): MRDP and Hilbert's tenth problem, Koenigsmann's definitions, Denef–Pas, Ax–Kochen, motivic integration and transfer match nowhere else; Pila–Wilkie and André–Oort appear elsewhere only as citations, and ComplexMultiplicationAndExplicitReciprocityPartII puts "André–Oort, o-minimal counting, functional transcendence" outside its scope. The component theorem, definable paths and fibre bounds of §6.5(a)–(c) have no other owner.
- Overlaps: no other open pull request changes this roadmap; no cited id is dropped; no second copy on main.
- Overlap check: read ShimuraVarieties, StratifiedSpacesAndTameTopology, AbelianSchemesAndArithmeticModuliPartII, HeightsRationalPointsAndObstructions, ComplexMultiplicationAndExplicitReciprocityPartII, ComputabilityTheory, ClassicalArithmeticCompletion, RealAlgebraicGeometry; semialgebraic sets, CAD and projection over ℝ: RealAlgebraicGeometry; general o-minimal theory: ShimuraVarieties; block counting: AbelianSchemesAndArithmeticModuliPartII; triangulation and C^p cells: shared with StratifiedSpacesAndTameTopology, owner to be that roadmap (R01); nothing else shared.

## Not verifiable

- `hilbert_s_tenth_problem_is_unsolvable` (§4.15 of the sample), `denef_1984` (§2.6), `bosch_lutkebohmert_raynaud` (§2.10(a)), `schneider`, `hodges`: settled uncertified; cited by locator, statements checked by computation only.
- `pila_wilkie`, `vd_dr_tame`, `vd_dr_macintyre_marker`, `cl_addenda`: settled waived.
- LogicAndDefinabilityInNumberTheoryPartII is later in the merge order; ownership against it was not checked.
- Sections outside the sample and outside the repairs rest on the computed rows of rounds 7 and 8 (§§0.1, 1.2, 2.3, 2.5, 3.6, 4.1, 4.11, 4.14, 4.29, 6.7, 6.13); they were not recomputed.

## Source issues

- **Misprint** in koenigsmann_defining_z at proof of Proposition 6, table for p=2, printed p.78: the source says the row (6,15) uses (x₂,x₃,x₄)=(1,1,0), which gives 3 mod 8; it should be a triple giving 5 mod 8, such as (1,1,1); affects the proof.
- **Error** in cluckers_loeser_2008 at §15.1, printed p.83: the source says every affine open of the ambient variety is isomorphic to an affine open of an affine space; it should use closed embeddings into affine space, as its §2.3 does; affects the proof.
- **Gap** in the_shafarevich_conjecture_for_hypersurfaces_in_abelian_varieties at Lemma 6.3, printed pp.64–65: the source says the Ax–Schanuel theorem applies with the monodromy flag variety as ambient space; it should note that all three codimensions shift equally inside the full compact dual; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5fd2b6467bf81ada11cce7cdfb844f20acdca148", "job": "REV-PKG-LogicAndDefinabilityInNumberTheory~9", "model": "fable", "worker": "chris-x10"} -->
