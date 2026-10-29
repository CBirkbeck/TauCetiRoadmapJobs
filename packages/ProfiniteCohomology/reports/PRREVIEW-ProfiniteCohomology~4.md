# Review of ProfiniteCohomology (pull request #616 at d1c54e0)

**Verdict:** accepted

Full review of `TauCetiRoadmap/ProfiniteCohomology/README.md` and `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` at `d1c54e06a476f41b47e7d6ac3bd3119fe248485e`. Three findings, all P3; no P1 or P2. The gate passes, the independent dependency check and the direct elaboration pass, and every cited library name resolves at the pin. No pull-request file was changed.

**Previous findings (review at `da3c848`), checked one by one against this head.**

- Previous R01, rank-one induction formula: **repaired**. “`w(Ind α) = N(1 + α) + d`, with `d` the character of `G/H`. Evens' expansion gives `w₁(Ind α) = cor α + d` and `w₂(Ind α) = N_Ev(α)`” (`README.md:3620`–`3622`) and the two 13.1 Checks (`README.md:3256`–`3261`). I recomputed Kahn's (6) at rank one from `Kahn line 677` with `w^{(j)}` as in `Kahn line 442`: `w^{(0)} = 1 + α`, `w^{(1)} = 1`, so `w(Ind α) = N(1 + α) + d`; (6′) at `Kahn line 680`–`683` gives the same because the `i = 0` term is `N(1)·((d + 1) + 1) = d` and the `i = 1` term carries the factor `(d + 1)⁰ + 1 = 0`. Both Checks hold (table below).
- Previous R02, absent supplier declarations: **repaired**. Every name the previous review listed as missing is now written without backticks and introduced as a target (“Define homClass …”, “Define evensNormIndexTwo …” `README.md:3208`–`3213`; “abelianizationProPTransfer, continuous by continuous_abelianizationProPTransfer” `README.md:2846`; “define galoisEvens” `README.md:3435`). My scan of all 520 dotted backticked identifiers in the README finds a declaration head for each at the pins (details under Verified sound).
- Previous R03, strict criterion: **repaired**. `strictCriterion` is stated (`Suggested.lean:81`–`91`) and owned in 11.7 (“And `strictCriterion`: `scd_p G ≤ n` if and only if …” `README.md:2733`).
- Previous R04, conjugation/corestriction planned twice: **repaired**. “use the contracts `TauCeti.ContinuousCohomology.map_comp_corestriction_of_conj` and `TauCeti.ContCohomology.explicitCor2_explicitMap2_of_conj`” (`README.md:1494`–`1500`); what remains is “explicit degree-one transport of conjugation/corestriction, and conjugation/restriction compatibility” (`README.md:1493`–`1494`).
- Previous R05, Kozlowski locator: **repaired**. “§2 (pp. 310–311) for the characteristic-two homogeneous norm in every degree and its multiplicativity (the unnumbered construction …)” (`README.md:3390`–`3392`); Lemma 2.4 is confined to the special double cover (`README.md:3393`–`3395`). Checked at `Kozlowski1984 line 97`–`102` and `126`–`130`.
- Previous R06, nonexistent arithmetic file: **repaired**. The purported file is gone; 11.1 now says “no arithmetic cohomological-dimension theorem is assumed here” (`README.md:2563`–`2564`), and the cited `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean` exists at the pin.
- Previous R07, shape: **repaired**. Every one of the 70 numbered subsections carries a `*Needs:*` line (82 in total), there are 36 `**Checks.**` blocks, and all fourteen layers end with `### Examples` and `### Dependencies`. The internal hom now has the three discriminating Checks the previous review asked for (`README.md:668`–`669`).
- Previous R08, continuity claim: **repaired**. “both values also hold abstractly. Discrete `ℚ` gives continuous `H¹ = 0`, while an abstract map taking `1` to `1` exists” (`README.md:956`).

## R01 (P3) — The exported-interface table disagrees with the layers and the pin on seven entries

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:194`, `:204`, `:205`, `:209`, `:215`, `:222`; rule at `:186`: “An entry written without backticks is an object this roadmap still builds”.

**Claim:** Seven unbackticked entries are declared by that rule to be targets of this roadmap, but four of them are pinned declarations the layers already cite, two name objects no layer defines, and one row lists the same declaration twice.

**Witness:** Row 205 lists `explicitCor_comp_res0`, `explicitCor_comp_res1`, `explicitCor_comp_res2` as targets; 6 cites them as Tau Ceti's `explicitCor0_comp_res0`, `explicitCor1_comp_res1`, `explicitCor2_comp_res2` (`README.md:1477`), and `Corestriction/Basic.lean` has `explicitCor0_comp_res0`. Row 209 lists `coindTraceRaw` as a target while 10.5 consumes `TauCeti.coindTrace` (`README.md:2358`), which exists in `Coinduced.lean`. Row 204 lists `longExact_exact`; the pin has `longExact_exact₁`, `₂`, `₃` as 10.3 says (`README.md:2287`). Row 194 lists `ofDiscreteModuleRes` and row 215 lists `muN`; neither Layer 1 nor Layer 9 defines or cites either, and neither exists at the pin. Row 222 repeats `TauCeti.exact_trivialF2ResMap_trivialF2CorMap_of_index_two`.

**Repair:** In row 205 write `TauCeti.ContCohomology.explicitCor0_comp_res0`, `…Cor1_comp_res1`, `…Cor2_comp_res2` in backticks; in row 209 replace `coindTraceRaw` by `TauCeti.coindTrace`; in row 204 write `TauCeti.ContCohomology.DiscreteShortExact.longExact_exact₁`, `₂`, `₃`; delete `ofDiscreteModuleRes` and `muN` (the Kummer coefficients are `TauCeti.KummerCoeff`, already in that row); in row 222 keep one copy of the declaration and add the first three names of `Corestriction/IndexTwo/Exact.lean` that 13.1 lists (`README.md:3236`–`3239`). The table then states exactly what the layers state.

## R02 (P3) — The strict criterion's Lean name differs from the name its consumer on main cites

**Location:** `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:81` (`theorem strictCriterion`); `README.md:3562`: “ClassFieldTheory, Layer 6 … consumes the strict criterion”.

**Claim:** The consumer cites the criterion by a different name, so the contract this roadmap says it supplies is not reachable by the name the consumer uses.

**Witness:** `TauCetiRoadmap/ClassFieldTheory/README.md:160` on main (and at its open head): “the strict-dimension criterion `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` at `n = 2` | `ProfiniteCohomology`”. No declaration of that name exists in this folder or at the pin.

**Repair:** Rename the acceptance statement to `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` (its three README mentions at `:218`, `:2720`, `:3006` follow), or keep `strictCriterion` and add to the Downstream consumers paragraph the one clause that ClassFieldTheory's name for it is this declaration. Either way the statement itself is unchanged; the instances in the table below (`ℤ_p` at `n = 1, 2`, the trivial group at `n = 0`) are unaffected.

## R03 (P3) — Three garbled source sentences and one misplaced source paragraph

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:1130` (“The source for the inhomogeneous-against-canonical comparison is The chain-level correspondence is classical”), `:3018` (“The source for the `p`-primary torsion of cohomology is The proof of NSW (3.3.2)”), `:3392` (“the unnumbered construction in Scope and ownership, pp. 310–311”), `:906`–`911` (the Ribes–Zalesskii Prop. 2.2.2 paragraph on continuous sections, inside 1.7 Additivity and linearity).

**Claim:** Two sentences splice two openings together, the Kozlowski cross-reference points at the Scope section instead of his §2, and the continuous-section source paragraph sits in the Layer 1 subsection on additivity rather than in 0.3, which owns the section theorem.

**Witness:** The quoted text at those lines; 0.3 (`README.md:673`–`696`) states the section theorem and its hypotheses without this paragraph.

**Repair:** Write “The chain-level correspondence is classical and is displayed above; what has to be watched is the hypothesis” (`:1130`) and “The `p`-primary torsion of cohomology is used in the proof of NSW (3.3.2), (i) ⇔ (ii), in the form …” (`:3018`); replace “in Scope and ownership” by “in his §2” (`:3392`); move the paragraph at `:906`–`911` to the end of 0.3. Optionally give each `### Examples` section an example that is not a verbatim copy of the first Check of the layer (Layers 0–11 all do this).

## Verified sound

**Scope and principles.** Worktree at the requested head, clean; `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The folder contains only `README.md`, `Suggested.lean`, `metadata.toml`, `STATUS.md`, `PROGRESS.md`, the same five files as every roadmap on main. The roadmap builds the general continuous-cohomology library: no good-prime restriction (the Evens norm is kept for a discrete commutative `G`-ring in even degrees, every degree when `2 = 0`), no algorithm, no admitted data, no `set_option`, a single `import Mathlib` plus two existing `TauCeti.*` modules. It is the existing owner on main (2611 lines there), revised, not re-planned; InductionRestriction is its only roadmap supplier and is on main. I read the root `README.md` and `CONTRIBUTING.md` and compared the shape with `TauCetiRoadmap/ClassFieldTheory` and `Completed/ProfiniteProPGroups`.

**Gate and build.** The worker's gate at this head reports every check at zero and `OK`. Independent dependency check:

```text
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Direct elaboration of `Suggested.lean` with `lake env lean`: exit 0, exactly five `declaration uses sorry` warnings (lines 70, 78, 87, 103, 117), nothing else.

**Elaborated signatures.** A scratch file importing the module ran `#check @` on all five declarations. Each keeps its binders: `p : ℕ`, `G : Type u` with `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]` on the two universe equalities; those plus `Nat.Prime p`, `[CompactSpace G] [TotallyDisconnectedSpace G]` and `n : ℕ` on `strictCriterion`; those plus `strictCohomologicalDimensionAt p G ≤ 2`, `V : Subgroup G`, `[V.Normal]`, `IsOpen ↑V` on the two class-module statements. The universe parameters are the file's `.{u}` and `.{0}`; the coefficient `ULift.{u} ℤ` lands in `Type u`, the universe `strictCohomologicalDimensionAt.{u}` quantifies over. Nothing silently disappeared; no signature needed changing, and each matches its README statement (11.2, 11.7, 11.8).

**Padding probe.** Copies of the five statements were tried with `first | rfl | simp | infer_instance`: none closes (`simp` reduces the criterion to its two predicates and the `H¹` statement to `Z1 ≤ B1`, both unsolved). No declaration restates a definition, mirrors a Check or computes a value. Headline inventory: the comparisons, colimit, exact sequences, Shapiro, dimension shifting, corestriction with Mackey, Hilbert 90, Kummer, ordinary-dimension criteria, graded cup and the index-two graph identities are pinned, and I opened the declarations the docstring names for each (table below); the three remaining statable families are stated; the general norm is correctly declared unstatable (its construction is a resolution-level multiplicative transfer; `Subgroup.tensorInductionFunctor` at `Tensor/Induction.lean:235` is representation-level only).

**Pinned-library audit.** `.lake/packages` is at Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`, the manifest of this branch (main pins Tau Ceti `358314d4`; every name below also exists there). I extracted the 520 distinct dotted backticked identifiers of the README and searched the pinned trees for a declaration head of each final component: 510 matched directly; the remaining 10 are three namespaces and seven declarations whose heads carry `@[expose]`/`@[simp]` prefixes (`explicitFiniteQuotientSystem0/1/2`, `explicitFiniteQuotientCocone0/2`, `cohomologicalDimensionAt_le_iff`, `ofDiscreteModule_V`), all present. Beyond existence, I opened these statements and checked the hypotheses the README attributes to them:

| Pinned file and line | What it states, and the README claim it supports |
|---|---|
| `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`, `:64`, `:213` | `TopRep` is a structure with one `ContRepresentation`, no joint continuity (1.2); `TopRep.of` is an abbrev; `TopRepEquivActionTop` is an equivalence, not an abbreviation (carrier section). |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:54`, `:94`, `:113` | `resolutionX`, `resolution'X X n = resolutionX X (n+1)`, `homogeneousCochains`: a degree-`n` cochain is an invariant of `resolutionX X (n + 1)` (10.6). |
| `Mathlib/Topology/CompactOpen.lean:430`, `:466`, `:556` | `curry` needs nothing, `uncurry` needs `[LocallyCompactSpace Y]`, `Homeomorph.curry` both factors (3.2, 3.4). |
| `Mathlib/Topology/Algebra/ClopenNhdofOne.lean:47`, `:64` | `exist_openNormalSubgroup_sub_open_nhds_of_one`, `closedSubgroup_eq_sInf_open` (0.1, 10.6). |
| `Mathlib/GroupTheory/Transfer.lean:155`, `Index.lean:240`, `Algebra/Homology/ShortComplex/ModuleCat.lean:102` | `transfer_def`, `mul_mem_iff_of_index_two`, `moduleCatLeftHomologyData` (11.8, 13, 11.2). |
| `TauCeti/GroupTheory/Torsion.lean:204` | `IsPPrimaryTorsion p M := ∀ m, m ∈ primaryComponent M p`, as displayed in 11.1. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272` | `IsSmoothDiscrete`: discrete module and open point stabilizers, as 1.2 states. |
| `…/CohomologicalDimension/Basic.lean:131`, `:139`, `:146`, `:151`, `:194` | The two predicates over `M : Type (max u v)`, the two invariants through `leastENatBound`, `cohomologicalDimensionAt_le_iff`; universe `v` first, as 11.1 says. |
| `…/CohomologicalDimension/Basic.lean:110` | `isPPrimaryTorsion_continuousCohomology` for `X` with `p`-primary `X.V` (11.3). |
| `…/CohomologicalDimension/Strict.lean:158`, `ClosedSubgroup.lean:80`, `:108`, `IndexNotDvd.lean:163` | `scd ≤ cd + 1`; `cd`/`scd` monotone in a closed subgroup at `.{u}`; equality for an `OpenSubgroup` of index prime to `p` at `.{u}` (11.5, 11.7; the “stated at `v = u`” claim of 11.1). |
| `…/CohomologicalDimension/Corestriction.lean:107` | `corestriction_surjOn_primaryComponent_of_strictCohomologicalDimensionAt_le`: `p` prime, `scd_p ≤ n`, `U` open, discrete `M`; surjectivity only (11.8 sub-milestone 1 keeps the kernel as a target). |
| `…/CohomologicalDimension/ClassModule/Basic.lean:63`, `:166` | `abelianizationProP := maximalProPQuotient p (TopologicalAbelianization V)`; `abelianizationProPClass` takes `[V.Normal]` and `IsOpen ↑V` (11.8). |
| `…/ClassModule/ChangeOfGroup.lean:179` | `abelianizationProPSubgroupOfH2Equiv_class`: the `W`-class is `explicitRes2` of the `G`-class (sub-milestone 4, NSW (3.6.1)(i)). |
| `…/FiniteCyclic.lean:111`, `:381`, `:392` | `subsingleton_H1_of_forall_mem_zpowers` (`[Fintype G]`, kernel of `groupNorm` inside `(g − 1)M`); `explicitH2CyclicEquiv` for finite discrete cyclic `G'` and arbitrary coefficient topology; its `_mk` formula (sub-milestone 3). |
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/Character/Separation.lean:40` | `exists_continuous_zmodChar_of_notMem`: `[NeZero p]`, compact totally disconnected abelian `IsProP p Y`, closed `I`, `y ∉ I` (sub-milestone 2). |
| `TauCeti/Topology/Algebra/Group/Profinite/MaximalProP.lean:102` | `maximalProPQuotient := G ⧸ proPKernel p G` (11.8). |
| `…/ContCohomology/ClosedSubgroup.lean:213` | `exists_openSubgroup_le_res_eq_zero` for smooth discrete `X` and closed `H` (10.6). |
| `…/ContCohomology/ExactCochains.lean:403`, `FilteredColimits.lean:368` | `continuousCochainsShortExact_shortExact` needs `[LocallyCompactSpace G]`; `continuousCohomology_preservesFilteredColimits` needs `[CompactSpace G]` (10.2, 10.3). |
| `…/Coinduced/Acyclic.lean:328`, `DimensionShifting/Basic.lean:146`, `:192` | `coindAcyclic` for `n > 0`; `explicitDimensionShift0`, `dimensionShiftIso` (7.4, 10.4). |
| `…/Corestriction/Conjugation.lean:172`, `:254`; `Corestriction/Mackey/AllDegrees.lean:279` | `map_comp_corestriction_of_conj` (open finite-index `U`, `V = gUg⁻¹`); `explicitCor2_explicitMap2_of_conj`; `corestriction_mackey` as a sum over `DoubleCoset.Quotient` (6.4, 6.5, 10.5). |
| `…/Corestriction/IndexTwo/EvensConj.lean:72`, `CupExact.lean:213`, `:242`, `Exact.lean:130` | `evensConj := res ∘ cor − id`; `indexTwoDelta1_eq_cup_character`; `exact_cup_res2_of_index_two`; `exact_trivialF2ResMap_trivialF2CorMap_of_index_two` in every degree (13.1). |
| `…/Evens/Identities.lean:74`, `:105`, `:139`; `Class.lean:276`; `CyclicFour.lean:89`; `DihedralPullback.lean:285`; `Character.lean:54`; `Naturality.lean:78`; `Inflation.lean:256`; `Corestriction.lean:135` | `graphClass_comp_subtype` (needs `[LocallyCompactSpace G]`), `trivialF2ResMap_graphClass`, `graphClass_polarization` with the conjugate in the cross term, `graphClass` on a continuous character, `graphClass_cyclicFour_ne_zero`, the cochain-level `D₁₆` pullback with explicit coboundary, `indexTwoCharacterClass`, naturality, inflation and corestriction identities (13.1). |
| `TauCeti/FieldTheory/GaloisCohomology/Corestriction/Basic.lean:138`, `:161`; `Corestriction/Exact.lean:61`, `:75`; `Kummer.lean:920` | `galoisRes_galoisCor`, `galoisConj_evensConj` at `finrank = 2`, `exact_galoisRes_galoisCor_of_finrank_eq_two`, `galoisRes_eq_zero_iff`, `kummerIso_norm` (9.7, 13.3). |
| `TauCeti/Topology/Algebra/Group/Profinite/ZHat/CohomologicalDimension.lean:199` | `zHat.cohomologicalDimensionAt_eq_one` for `[Fact p.Prime]` (11.6). |
| `TauCeti/GroupTheory/Index/Two.lean:206`, `TauCeti/GroupTheory/Perm/WreathProduct/Monomial.lean:43`, `TauCeti/Topology/Algebra/Group/WreathProduct/Monomial.lean:38` | `Subgroup.indexTwoCharacter`, `Subgroup.monomialHom`, `Subgroup.continuous_monomialHom` (13.1, 13.2). |

**Source sample.** The seeded targets 1.3, 1.6, 1.7, 2.3, 3.4, 10.4 and 11.2 cite pinned declarations rather than texts, and are covered by the audit above. For the text locators: Milne, Evens, Kozlowski and Kahn were fetched through the sources service from legal copies (author page and AMS open archive) and read at the locators; NSW, Ribes–Zalesskii, Serre, Koch and Brown could not be read (below), so the locators of 5.5, 6.4, 8.3, 8.7, 10.4, 11.1 and 11.6 into those books are uncertified.

| Source, legal copy | Locator | What the text supports |
|---|---|---|
| Milne, ADT, author's copy | (0.1.1)–(0.1.6), `Milne line 296`–`301` | Boundary in each variable with `(−1)^{deg x}` in the second, associativity, graded commutativity, restriction and inflation of cups (8.3, 8.4, 8.5 signs). |
| Milne | Remark 0.11, `Milne line 449`–`461` | Coinduced module as continuous `H`-equivariant maps with right translation, adjunction, exactness, Shapiro in all degrees (7.1, 10.4). The displayed adjunction carries the misprint recorded below. |
| Milne | Prop. 0.15, `Milne line 542`–`548` | Inner conjugation acts trivially on `Hʳ(G, M)`; nothing about the converse (2.4). |
| Evens 1963, AMS open archive | §5 pp. 59–60, `Evens1963 line 207`–`230` | Norm through the monomial map, transversal independence, the `G`-ring multiplication `ψ` (13.2 milestones 1–5). |
| Evens 1963 | §6 Props. 1–4, pp. 60–62, `Evens1963 line 249`–`250`, `274`–`276`, `301`–`303`, `313`–`314` | Transitivity, double cosets, naturality under equal index, multiplicativity (13.2 milestone 6). |
| Evens 1963 | Thm. 1, p. 63, `Evens1963 line 345`–`348` | For a commutative `G`-ring and `χ ∈ H^{2r}(H, k)`: `N(1 + χ) = Σ N_i(χ)`, `N₀ = 1`, `N₁ = tr`, `N_l = N` (13.2 expansion). |
| Kozlowski 1984, AMS open archive | §2 pp. 310–311, `Kozlowski1984 line 97`–`102`; Prop. 2.1 `line 113`; Lemma 2.4 `line 126`–`130` | Unnumbered homogeneous norm `Hⁱ → Hⁿⁱ` with multiplicativity; Prop. 2.1 concerns the augmented transfer; Lemma 2.4(ii) for the special cover gives `N(x) = x² + tx` in degree one (13.2 source note, References). |
| Kahn 1984, author's institutional copy of the published article | Th. I.4.2 and (6′), pp. 239–240, `Kahn line 674`–`683`; `w^{(j)}` at `line 442` | `w(Ind ρ) = Σ_j N(w^{(j)}(ρ)) d^j`; rank one gives `N(1 + α) + d` (13.1 Checks, References). |
| Kahn 1984 | Remarque II.2.3, pp. 242–243, `Kahn line 812`–`827` | Prop. II.1.5 fails for the dihedral group of order 8 with a character of the Klein four-subgroup (References). |

**Adversarial computations.** One row per statement; finite groups carry the discrete topology, actions are trivial unless said otherwise, `p` is prime, `1` is the trivial group. Rows cover the seeded targets, the five Lean headlines, every target a finding touches, and the conventions and Checks of every layer.

| Statement / location | Instances | Values computed on the two sides | Result |
|---|---|---|---|
| 0.1 stabilizers open | `C₂` on `𝔽₃`, sign vs trivial | stabilizer of `1` is `{1}` vs `C₂`; invariants `0` vs `𝔽₃`; union of `M^U` over `U = 1, C₂` is `𝔽₃` | consistent |
| 0.2 internal hom conjugation | `M = N = 𝔽₃`, sign on `M` | fixed maps: `3` for trivial actions, `1` for `(g•φ) = −φ`; `ev((−id)(−1)) = 1`, wrong model `id(−1) = 2` | discriminating |
| 0.2 finite vs infinite product | `𝔽₂²`, `∏ℕ 𝔽₂` | `4` points, singletons open; every basic zero-neighbourhood of the product contains a nonzero vector | finite-product restriction justified |
| 0.3 section vs homomorphic section | `ℤ_p → ℤ/p` | representatives `0..p−1` give a continuous section; a homomorphic section sends `1` to a `p`-torsion element of `ℤ_p`, i.e. `0` | set section exists, group section does not |
| 0.3 extension lemma nonemptiness | empty closed subset of a point, target `𝔽₂` vs `∅` | `2` extensions vs `0` | hypothesis necessary |
| 1.1 degree zero | `G = 1`, `ℤ`; `C₂` on `𝔽₃` trivial/sign | `H⁰ = ℤ`, unit `1`; `3` elements vs `1` | matches invariants |
| 1.2 `TopRep` need not be smooth | discontinuous `a : ℤ_p → ℚ`, permutation module `ℤ[ℚ]` | each `g` acts by a permutation of a discrete set (continuous); stabilizer of `[q]` is `ker a`, of infinite index, not open | subcategory needed |
| 1.2 zero object | `M = 0` | only stabilizer is `G`, open | smooth |
| 1.3 dictionary Checks | sign on `𝔽₃`; `×2` on `ℤ`; `id : 𝔽₃_sign → 𝔽₃_triv` | `1 ↦ 2` on both sides; `1 ↦ 2`; at `(g, 1)`: `f(g•1) = 2` vs `g•f(1) = 1` | not equivariant, as claimed |
| 1.5 named instances | `C₂ → C₄` inflation; coefficient `×2`, `×0` | character values `0,1,0,1`; `1 ↦ 2`, `1 ↦ 0` | consistent |
| 1.6 degree 0 compatibility | `G = 1`, `φ = id`, `f = ×2` on `ℤ` | both routes send `1 ↦ 2` | consistent |
| 1.7 additivity | `f = ×2`, `g = ×3` on trivial `ℤ`, degree 0 | `map(f+g)(1) = 5 = 2 + 3` | consistent |
| 2.1 differentials | `G = 1`, `M = ℤ` | `d⁰ = 0`, `d¹ = id`, `d² = 0`; `H⁰ = ℤ`, `H¹ = H² = 0` | consistent |
| 2.1 sign convention | `C₂`, sign `ℤ`, `m = 1` | `d⁰1(s) = s•1 − 1 = −2`; `Z¹ ≅ ℤ`, `B¹ = 2ℤ`, `H¹ = ℤ/2`; reversed sign gives `+2` | convention pinned |
| 2.1 continuity Check | `ℤ_p → ℤ/pᵏ`, `ℤ`, discrete `ℚ` | `pᵏ` maps, continuous and abstract alike; `0` and `0`; continuous `0`, abstract nonzero (`ℚ`-dual of `ℚ_p`) | repaired R08 holds |
| 2.4 inner conjugation | `S₃`, `𝔽₂`, sign character | `(23)` and `(13)` both map to `1`; zero character to `0` | Milne 0.15 agrees |
| 3.3 topology on explicit `H¹` | `G = ∏ℕ C₂`, `𝔽₂` | finitely many evaluations leave a nonzero coordinate character; discrete wrapper has open singletons | wrapper needed |
| 3.3 / 3.4 comparison | `G = 1`, `ℤ`; `C₂`, `𝔽₂` | `1 ↦ 1` in degree 0, `−1` excluded; both `H¹` have `2` elements, nonzero to nonzero | consistent |
| 3.2 local compactness | profinite vs arbitrary `G` | `uncurry` needs `[LocallyCompactSpace]` at `CompactOpen.lean:466` | hypothesis matches the pin |
| 4.1 system Checks | `C₂`, `𝔽₂`, degree 1; `V = U`; sign `𝔽₃` | `0` at `U = G`, `𝔽₂` at `U = 1`; identity fixes `1`; invariants `0, 𝔽₃` | direction toward finer quotient |
| 4.2 inflation not injective in degree 2 | `C₄ → C₂`, `𝔽₂` | `x² ↦ χ² = 0` | degree-1 injectivity is not imposed in degree 2 |
| 4.2 colimit | `ℤ_p`, `𝔽_p`; `M = 0` | degree-1 generator appears at level `C_p`; both sides `𝔽_p`; `0 = 0` | consistent |
| 5.2 short exact data | `ℤ →×2 ℤ → ℤ/2`; `×4`; split | kernel `2ℤ` = image; image `4ℤ ≠ 2ℤ`; split connecting maps `0` | consistent |
| 5.3 long exact sequence | `C₂`, `0 → ℤ →×2 ℤ → 𝔽₂ → 0` | `δ⁰ = 0`; `δ¹ : 𝔽₂ ≅ ℤ/2`; image order `2` = kernel of `×2` on `H²(C₂, ℤ) = ℤ/2` | exact |
| 5.5 five-term | `C₂ ◁ C₄`, `𝔽₂` | `inf¹` iso, `res¹(χ)(σ²) = 0`, `tg` iso, `inf²(x²) = χ² = 0`; orders `2/2`, `1/1`, `2/2` | exact |
| 5.5 transgression sign | `C₃ ◁ C₉`, `𝔽₃`, lift `f(i) = ⌊i/3⌋` | at lifts `(2,1)`: `f(1) − f(3) + f(2) = 0 − 1 + 0 = −1 = 2`; carry cocycle gives `1` | lift-differential convention pinned |
| 5.5 split and `N = G` | `C₂ ◁ C₂ × C₂`; `N = G` | every kernel character extends, `tg = 0`; quotient trivial, `H²(1) = 0` | boundary cases hold |
| 6.1 transversal word | `C₄ ⊇ ⟨s²⟩`, reps `1, s` | `ℓ_U(s) = s²`, `ℓ_{sU}(s) = 1`; product `s² = ℓ_U(s²)`; `U = G`: `ℓ(γ) = γ`; `S₃ ⊇ 1`: all words `1` | Schreier law and left cosets agree |
| 6.2 corestriction degree 0 | `C₂ ⊇ 1`, `ℤ`; `S₃ ⊇ C₂`; sign `ℤ` on `C₄ ⊇ C₂` | `cor 1 = 2`; `cor 1 = 3` (`2` if a coset is dropped); `cor⁰(1) = 1 + (−1) = 0` | action factor essential |
| 6.3 cochain correction | `C₄`, sign `ℤ`, `f(s) = 1` | `f(s²) = −1 + 1 = 0` so `res f = 0`, LHS `0`; `c = f(1) + f(s) = 1`, RHS `2 + (−2) = 0`; without correction `2` | cochain vs class distinction |
| 6.3 transitivity | `C₈ ⊇ C₄ ⊇ C₂`, `H⁰(ℤ)` | `×4` directly; `×2 ∘ ×2 = ×4` | indices multiply |
| 6.4 Mackey | `S₃`, `U = V` of order 2, `H⁰(ℤ)` | double cosets of sizes `2, 4`, Mackey subgroups `V, 1`, summands `1 + 2 = 3 = (G:U)`; single cosets give `3` summands; `V ∩ U` throughout gives `1 + 1` | formula and indexing right |
| 6.5 conjugation/corestriction | `⟨(12)⟩`, `⟨(23)⟩` in `S₃`; `𝔽₂` degree 2 | both routes `1 ↦ 3`; nonzero class to nonzero class, restriction back `1` | pinned statement covers it |
| 7.1 coinduced module | `H = G`; `H = 1`, `C₂`, `𝔽₃`; `S₃`, `H = 1` | `f` determined by `f(1)`; `9` functions, `(1,0) ↦ (0,1)`; `(a•(b•f))(x) = f(xab)` vs `f(bax)` differ on indicators | right translation pinned |
| 7.2 Shapiro | `C₂ ⊇ 1`, `𝔽₂` | `Coind` has `4` elements, invariants `{(0,0),(1,1)}`, `H⁰ = 𝔽₂`; `H¹(C₂, 𝔽₂[C₂]) = 0 = H¹(1, 𝔽₂)` vs `H¹(C₂, 𝔽₂) = 𝔽₂` | coinduction is not the trivial module |
| 7.4 dimension shifting at `i = 0` | `C₂`, sign `ℤ` | unit `m ↦ (m, −m)`; quotient `ℤ` trivial via `a + b`; invariants `(a, a) ↦ 2a`; cokernel `ℤ/2 = H¹(ℤ_sign)` while `H⁰(quotient) = ℤ` | isomorphism false at `i = 0`, cokernel form right |
| 10.4 higher shift | same | `H²(C₂, ℤ_sign) = 0 = H¹(C₂, ℤ)`; `H³(C₂, ℤ_sign) = ℤ/2 = H²(C₂, ℤ)` | consistent |
| 8.1 cups | `G = 1`, `(2,3)`; `C₂`, `𝔽₂`, `x` | `6`; `(x⌣x)(s,s) = x(s)·(s•x(s)) = 1`, class nonzero; zero pairing gives `0` | pairing determines the cup |
| 8.3 graded commutativity | `C₃`, `𝔽₃`, degree-1 `x` | `x² = −x²` on classes, so `x² = 0`; cochain value at `(1,1)` is `1` | identity on classes only |
| 8.5 / Layer 12 signs | `(m,n) = (2,1), (1,2), (m,0)` | exponent `mn + (m+1)n ≡ n`: `−1`, `+1`, `+1`; `(−1)^m` would give `+1` at `(2,1)`; Milne (0.1.2) agrees | sign convention consistent across 8.5, 12 and Milne |
| 8.6 Bockstein | `C₂`, `𝔽₂`, `x` | `βx = x²`; `β(x²) = x³ + x³ = 0`; `β1 = 0` | derivation and `β² = 0` consistent |
| 8.7 evaluation pairing | `M = N = 𝔽₃`; sign source; `M = 0` | `(id, 1) ↦ 1`; `(−id)(−1) = 1`; everything `0` | no perfectness inferred |
| 9.1 Galois group | `ℂ`, `ℝ`, `𝔽_p(t)` | `1`, `2` elements; algebraic-closure automorphisms fix `t^{1/p}` | separable closure needed |
| 9.2 invariant units | `ℝ`, `ℂ`, `𝔽_p(t)` | `ℝˣ`, `−1 ↦ −1`; identity; `Kˣ` vs a field containing `t^{1/p}` | consistent |
| 9.3 Kummer coefficients | `ℝ, n = 3`; `n = 1`; `𝔽₃, n = 2, 3` | conjugation sends `ζ ↦ ζ²`; `H¹ = 0`; `±1` fixed, `n = 3` not invertible | hypotheses located |
| 9.5 Hilbert 90 | `ℂ/ℝ`, cocycle `σ ↦ −1` | `σ(i)/i = −1`, class `0`; trivial group `H¹ = 0` | multiplicative coboundary convention |
| 9.6 Kummer | `ℝ, n = 2`; `ℂ`; `𝔽₃, n = 2`; `n = 1` | orders `2 = 2`; `1 = 1`; `𝔽₃ˣ/(𝔽₃ˣ)²` order `2 = Hom(Ẑ, μ₂)`; `1 = 1` | `IsUnit (n : K)` is the right hypothesis |
| 9.7 restriction/corestriction | `ℂ/ℝ`, `𝔽₂`, degree 0 | `res = id`, `cor = ×2 = 0`, composite `0 = 2·id` | index two |
| 10.6 levelwise shortcut fails | `C₂`, diagonal `𝔽₂ ↪ 𝔽₂[C₂]` | `H¹(C₂, 𝔽₂) = 𝔽₂ → H¹(C₂, 𝔽₂[C₂]) = 0` | false neighbour genuinely false |
| 10.7 compactness | discrete `⊕ℕ ℤ`, `ℚ_p/ℤ_p` | `Hom = ∏ ℚ_p/ℤ_p`; coordinates `1/pᵏ` survive every `pʳ` | counterexample valid |
| 10.7 dense index-two subgroup | `∏ℕ 𝔽₂`, kernel of a form vanishing on `⊕ℕ 𝔽₂` | index `2`, dense, proper, hence not open | finite index ≠ open |
| 10.7 rational coefficients | compact `G`, `ℚ`, `i ≥ 1`; `G = 1`, `i = 0` | torsion and divisible so `0`; `H⁰ = ℚ ≠ 0` | positive degree essential |
| 11.1 definitions | `1`; `ℤ_p`; `C_p`; `M = 0` | `(cd, scd) = (0,0)`; `(1,2)` since `H²(ℤ_p, ℤ)(p) = ℚ_p/ℤ_p`; `(⊤,⊤)`; all components `0` | predicates differ in both places |
| 11.1 Lean display vs pin | `IsPPrimaryTorsion` | `Torsion.lean:204` is the displayed formula | matches |
| 11.2 universe equality, `Suggested.lean:70`, `:78` | `1`, `ℤ_p`, `C_p`; `u = 0` | `0 = 0`, `1 = 1`, `⊤ = ⊤`; at `v = u` and `v = 0` both coefficient universes are `Type u`; `rfl` fails at the pin; at `u = 0` the statement is reflexive | sound, not padding |
| 11.2 naturality Check | `×2 : ℤ → ℤ`, degree 0 | both paths `1 ↦ 2`; `x ↦ −x` excluded by the class requirement | comparison pinned |
| 11.3 torsion | `ℤ_p`, `𝔽_p`, all degrees | `H⁰ = 𝔽_p`, `H¹ = 𝔽_p`, `Hⁿ = 0` (`n ≥ 2`), all killed by `p` | `n = 0` included correctly |
| 11.4 simplicity | `𝔽_p`, `𝔽_p²`, `0`, `ℤ/p²`; sign `𝔽₃` on `C₂`, inflated to `C₄` | `2` submodules; proper line `(1,0)`; fails nontriviality; proper `pℤ/p²`; simple with nontrivial action, unchanged by inflation | quotient-independence Check meaningful |
| 11.5 inequalities | `1 ⊂ ℤ_p`; `pℤ_p ⊂ ℤ_p`; `ℤ_p ⊂ ℤ_p × C_ℓ` | ordinary `0 ≤ 1`, `1 ≤ 1`, `1 = 1`; strict `0 ≤ 2`, `2 ≤ 2`, `2 = 2`; bounds `0 ≤ 0 ≤ 1`, `1 ≤ 2 ≤ 2`, `⊤ ≤ ⊤ ≤ ⊤` | consistent with pinned `.{u}` statements |
| 11.6 first values | `Ẑ`: `ℤ/n`, `ℤ`; `C_p`; `ℤ_q`, `q ≠ p` | `H¹ = ℤ/n`, `H² = 0`, `H²(Ẑ, ℤ) = ℚ/ℤ`; `H²(C_p, 𝔽_p) = 𝔽_p`, `cd = ∞`; `H¹(ℤ_q, ℤ/p) = 0` | procyclic caveat correct |
| 11.7 `strictCriterion`, `Suggested.lean:81` | `ℤ_p`, `n = 1`; `ℤ_p`, `n = 2`; `1`, `n = 0`; `ℤ_q` (`q ≠ p`), `n = 1` | `scd = 2 ≰ 1`, `H²(pʳℤ_p, ℤ)(p) = ℚ_p/ℤ_p ≠ 0`: false ↔ false; `2 ≤ 2`, `H³ = 0`: true ↔ true; `0 ≤ 0`, `H¹(1, ℤ) = 0`: true ↔ true; `scd_p = 0 ≤ 1`, `cd_p = 0`, `H²(U, ℤ)(p) = 0`: true ↔ true | the `≤` form holds also below the exact dimension |
| 11.7 converse route | `scd ≤ n` from `cd ≤ n` | `scd ≤ cd + 1 ≤ n + 1` kills degrees `≥ n + 2`; degree `n + 1` by `0 → C → Coind_U(ℤ^m) → A → 0` and exactness of `p`-parts on torsion groups | route inputs are pinned or Layer 10 |
| 11.8 class module, `Suggested.lean:103`, `:117` | `ℤ_p ⊇ pℤ_p`, `p = 2, 3`; `V = G`; `ℤ_p × C_ℓ ⊇ ℤ_p`; `C_p ⊇ 1` | `H¹ = Hom(C_p, pℤ_p) = 0`; `H² = pℤ_p/p²ℤ_p` of order `2, 3`, carry class `p ↦ 1`; `ZMod 1`, `1 = 0`; `H² = 0`, `p`-part of index `1`, full index `ℓ` would be wrong; `H²(C_p, 0) = 0` excluded by `scd = ⊤` | generator and modulus right |
| 11.8 strict bound necessary | `ℤ_p²`, `V = pG` | `cd = 2`, `scd = 3`; `H²(C_p², ℤ_p²)` has order `p⁴ ≠ p²` | ordinary `cd ≤ 2` insufficient |
| 11.8 openness of `V` | `ℤ ⊂ ℤ₂`, `p = 2` | quotient by `⋂ 2ⁿℤ = 0` is `ℤ`; `×3` not surjective | negative control valid |
| 11.8 noncyclic ambient | free pro-`p` rank 2, index-`p` `V` | `V^ab ≅ ℤ_p[C_p] ⊕ ℤ_p`; `H¹ = 0 ⊕ 0`; `H² = 0 ⊕ ℤ/p`, order `p = #(G/V)`; `scd = 2` by the criterion since `H²(U, ℤ)(p) ≠ 0` | theorem holds beyond procyclic `G` |
| 11.8 sub-milestone 1 | `ℤ_p ⊇ pℤ_p`, `X = ℤ`, `n = 2`; `C₂`, `p = 3`, `𝔽₃` trivial and sign, `n = 0` | `cor` on `Hom(V, ℚ/ℤ)` is `ψ ↦ ψ∘Ver`, `Ver x = px`, an isomorphism, kernels `0`; `cor = ×2` bijective on `𝔽₃`, coinvariants `𝔽₃`; sign: `cor = 0`, invariants `0`, `(s − 1)𝔽₃ = 𝔽₃` so coinvariants `0` | kernel statement consistent |
| 11.8 sub-milestone 2 | `ℤ_p ⊇ pℤ_p`; `V = G`; `C_p ⊇ 1` | `Ver(1) = p`, `Ver(p) = p²`, identity would give `1 ∉ V`; identities; `Ver = 0`, not injective, `scd = ⊤` | transfer convention pinned |
| 11.8 sub-milestone 2, Bockstein injectivity | profinite `G`, `0 → ℤ →pᵏ ℤ → ℤ/pᵏ → 0` | `H¹(G, ℤ) = Hom_cont(G, ℤ) = 0`, so `δ_k` injective; `H²(G, ℤ)[pᵐ] = im δ_m` | consistent |
| 11.8 sub-milestone 3, `(s − 1)` argument | `G/V = ⟨s⟩` cyclic `p`-group | `I = preimage of (s−1)V^ab(p)` is `G`-stable, `V/I` central in `G/I`, `G/I` abelian pro-`p`, so `G → G/I` factors through `G^ab(p)` | step verified; `(s−1)V^ab(p)` closed as a compact image |
| 11.8 sub-milestone 3, order `p` | `#(G/V) = p` | `N[v] = 0 ⇒ Ver v = 1 ⇒ [v] = (σ•b) − b`, hence `H¹ = 0`; `u ↦ Ver σ.out`, invariants `= i·Ver σ.out + N[v]`, `p·Ver σ.out = Ver(σ.outᵖ)` a norm, `Ver σ.out` not a norm since `σ.out v⁻¹ ∉ V` | `H²` cyclic of order `p` generated by `u` |
| 11.8 sub-milestone 4, inflation factor | `ℤ_p ⊇ pℤ_p ⊇ p²ℤ_p` | `H²(C_{p²}, p²ℤ_p) = p²ℤ_p/p⁴ℤ_p`, `u_{G/V} ↦ p²` (order `p²`); inflate the `C_p` carry (values `0, p`) and apply `Ver = ×p`: `Σ_i = p·p² = p³ = p·u_{G/V}` (order `p`); coefficient transfer alone gives `p²` | `(W:V)·u_{G/V}` right |
| 11.8 sub-milestone 5, induction | `W ◁ G` of index `p` over `V` | exactness with `H¹(W/V) = 0` gives `#H² ≤ #(G/W)·p`; `i(u_{G/W}) = p·u_{G/V}` of order `#(G/W)`, so `u_{G/V}` has order `#(G/V)` | argument closes |
| 11.8 sub-milestone 5, Sylow | finite `G/V`, Sylow `P` | `cor∘res = (G/V : P)` prime to `p`, groups `p^a`-torsion, `×m` bijective on pro-`p` coefficients, so `res` injective into a cyclic group of order `#P` generated by `res u` | isomorphism onto `P`-part |
| 12 connecting maps | bidegree `(0,0)`; `(m, 0)` with unit | Layer 8's `(0,0)` instance; both sides `δx` by `cup_one_right` | conventions consistent |
| 12 example | `C₂`, `𝔽₂` | `x² ≠ 0`, `H^• = 𝔽₂[x]` | consistent with 8.1 |
| 13.1 Kahn rank one (R01) | `1 ⊂ C₂`, `α = 0`; `C₂ ⊂ C₄`, `α ≠ 0` | `Ind = 1 ⊕ sign`, `w = 1 + d`, formula `N(1) + d = 1 + d`, `w₁ = 0 + d`, `w₂ = N(0) = 0`; rotation by a quarter turn, `det = 1`, `w₁ = 0`; `cor α(σ) = α(σ²) + α(1) = 1` so `cor α = d`, `d + d = 0`; `w₂ = N(α) = u ≠ 0` (`c₁` of `ζ ⊕ ζ⁻¹` mod 2) | repaired formula holds on both controls |
| 13.1 Shapiro components | `C₄ = ⟨σ⟩ ⊇ ⟨σ²⟩`, `s = σ`, `α ≠ 0` | `b₁` at `1, σ, σ², σ³` is `0, 1, 1, 0`; `b₁(σ²) = 1 ≠ b₁(σ) + b₁(σ) = 0` | components are not cocycles |
| 13.1 graph class anchor | same `C₄` | `N_Ev(α) ≠ 0` (`graphClass_cyclicFour_ne_zero`); central extension of `C₄` by `C₂` is abelian; nonzero class is `C₈` | anchor valid |
| 13.1 restriction identity | `C₄ ⊇ C₂`, `𝔽₂` | `res N(α) = α ⌣ evensConj α = α² ≠ 0`; both `H²` have order `2` | nonzero normalization |
| 13.1 polarization | `α = β ≠ 0` on `C₂ ⊂ C₄` | `N(0) − N(α) − N(α) = 0`; `cor(α²) = 0` since `res∘cor = 0` on this class and `res²` is injective | cross term right |
| 13.1 `evensConj` | same, degree 1 | `cor α = χ`, `res χ = 0`, so `evensConj α = −α = α` | agrees with trivial conjugation |
| 13.1 norm of a restricted class | `C₂ ≀ C₂`, `y = χ_U` | `res χ_U = 0`, `N(0) = 0 = χ_U² + χ_U·χ_U`; `χ_U² ≠ 0` so `y ⌣ y` alone is wrong | `d·y` term essential |
| 13.1 index-two sequence | `C₄ ⊇ C₂`; `S₃ ⊇ C₂` | `χ² = 0`, `res¹ = 0`, `cor¹` iso, `res²` iso (`u ↦ x²`, dual of `1/4 ↦ 1/2`); index 3: `res¹`, `cor¹` surjective, sequence fails at `H¹(U)` | index exactly two |
| 13.1 `D₁₆` vs `SD₁₆`, `Q₁₆` | characters `x` (kernel `U₀`), `y` (kernel `⟨uv, s⟩`) of `C₂ ≀ C₂` | lifts of order 4: `D₁₆` only for `uv`; `SD₁₆` also for `u, v` (`(rⁱf)² = r⁴ⁱ`, `i` odd, and `u ↦ rf`, `v ↦ r³f`); `Q₁₆` for all reflections; `y²` is nonzero exactly on `⟨u⟩, ⟨v⟩`, `x² + y²` on all four reflections, both zero on `⟨uv⟩` | classes `[ν] + y²`, `[ν] + x² + y²` as stated |
| 13.2 monomial embedding | `S₃ ⊇ 1`; `ℤ_p = G = U`; `C₄ ⊇ ⟨s²⟩` | factors `1`, `(12)(23) = (123)` vs inverse convention `(132)`; base component `γ`, continuous, not locally constant; `a(s, U) = s²`, `a(s, sU) = 1`, swap | left translation pinned |
| 13.2 tensor-induced multiplication | `ℤ`, two factors; one coset; `ℤ[t]`, `t ↦ −t` | `2 ⊗ 3 ↦ 6`, `3 ⊗ 2 ↦ 6`, sum would give `5`; `a ↦ a`; `t ⊗ 1 ↦ t`, `1 ⊗ t ↦ −t` | twist visible |
| 13.2 norm laws | index one; index 2, degree 0 | `N = id`; `N(3) = 9 ≠ 6`; `N(1) = 1`, `N(0) = 0`; `1 ⊂ C₂ ⊂ C₄`: `2⁴ = (2²)²`; `N(6) = 36 = 4·9` | normalization, transitivity, multiplicativity |
| 13.2 odd characteristic | `C₃ × C₂ ⊇ C₃`, `𝔽₃`, `a ∈ H²(C₃)` | `res` iso in positive degree (`H^{>0}(C₂, 𝔽₃) = 0`); `res N(a) = a·(s•a) = a² ≠ 0`; `N(2) = 2·2 = 1`, so `N(2a) = N(a)` while `2N(a) = −N(a) ≠ N(a)`; `res(1 + cor a + N a) = 1 + 2a + a² = (1 + a)² = res N(1 + a)` | general coefficient ring retained; expansion consistent with Evens Thm. 1 |
| 13.2 parity | two tensor factors of degree `q` | swap sign `(−1)^{q²}`: `+1` for `q = 2`, `−1` for `q = 1`, `1` when `2 = 0` | even-degree scope and char-two extension |
| 13.3 bridge | `ℂ/ℝ`; `L = K`; `𝔽₉/𝔽₃` | `H¹(G_ℂ, 𝔽₂) = 0`, `N(0) = 0`, degree-0 `res = id`, `cor = ×2 = 0`; identities, index-two norm undefined, general norm `id`; `2Ẑ ⊂ Ẑ`, index `2`, `H¹ = 𝔽₂` twice, `H²(Ẑ, 𝔽₂) = 0` | consistent |
| Worked example `H²(Ẑ, ℤ)` | `0 → ℤ → ℚ → ℚ/ℤ → 0` | `Hⁱ(Ẑ, ℚ) = 0` (`i ≥ 1`), so `H²(Ẑ, ℤ) ≅ H¹(Ẑ, ℚ/ℤ) = ℚ/ℤ` | consistent with 11.6 |
| Worked example finite-field Brauer group | `𝔽_{qⁿ}/𝔽_q` | `H²(C_n, 𝔽_{qⁿ}ˣ) = 𝔽_qˣ/N(𝔽_{qⁿ}ˣ) = 0` by norm surjectivity | consistent |
| R01 table entries | `explicitCor_comp_res0` vs pin | `explicitCor0_comp_res0` found at `Corestriction/Basic.lean`; `explicitCor_comp_res0`, `coindTraceRaw`, `muN`, `ofDiscreteModuleRes`: `0` declarations | inconsistency confirmed |
| R02 consumer name | ClassFieldTheory on main | occurrences of `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` in this folder: `0`; of `strictCriterion` in ClassFieldTheory: `0` | name mismatch confirmed |

**Cross-roadmap and ownership audit.** Searches were by object and by name through the roadmap service over the open heads and main, and by hand in the sibling checkouts the brief lists.

| Citation or candidate competing object | Resolution |
|---|---|
| `RepresentationTheory/InductionRestriction` (`README.md:158`, `:268`, `:597`, `:1743`) | On main; owns algebraic induction/coinduction, `Rep.indCoindIso` and finite Mackey; this roadmap's topological coinduction for closed subgroups and the open-subgroup comparison `TauCeti.topologicalCoindIsoAlgebraic` do not duplicate it. It is the only `*Needs:*` supplier outside Mathlib and Tau Ceti; depcheck confirms. |
| `strictCriterion`, `cohomologicalDimensionAt_universe_eq`, `strictCohomologicalDimensionAt_universe_eq`, `subsingleton_h1_abelianizationProP` | Declared nowhere else among the open heads or on main; `abelianizationProPClass_generates` is consumed by `Completed/LocalGaloisGroups/README.md:133` and `TauCetiRoadmap/LocalGaloisGroups/Suggested.lean:2005` as `ProfiniteCohomology.abelianizationProPClass_generates` (consumer, same hypotheses `scd_p ≤ 2`). |
| `evensNormIndexTwo`, `homClass`, `evensNormIndexTwo_eq_ind_pullback`, `galoisEvens` and its three identities | Consumed by `TauCetiRoadmap/QuadraticFormInvariants/README.md:694`, `:2793`, `:2208`–`:2213` on main; no second builder. That consumer also cites `evensConj_eq_conjMapOf`, a name this README does not carry (the pin's `evensConj_explicitH1AddEquivContinuousCohomology` plays that role); that is the consumer's drift, not a finding here. |
| ClassFieldTheory (main and open head) | Consumes `cd_p`, `scd_p`, closed-subgroup monotonicity, `cd ≤ scd` and the strict criterion at `n = 2` (`README.md:160`); supplies `scd_p_absoluteGaloisGroup_eq_two` (`:1295`), which this README correctly treats as the consumer's arithmetic input (`README.md:3011`–`3012`). Name mismatch is R02. |
| ProfiniteProPGroups (open head #618 and `Completed/` on main) | Consumer of Layers 5, 10 and 11; owns Sylow theory and `cd_p G = cd_p G_p` as this README's Out-of-scope list says. Its head cites `ProfiniteCohomology.cd_p`, `cd_p_le_iff_finite_pPrimary`, `cd_p_le_iff_boundedExponent`, `ofDiscreteModuleRes`, names this README replaced by Tau Ceti's `cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ` and `cohomologicalDimensionAt_le_iff_boundedExponent`; consumer drift, recorded for the operator, not a finding against this folder. |
| ProfiniteCohomologyPartII (merge order line 355, package on the board) | Extends this roadmap (cochain DGAs, Massey products); it is not a supplier here and this README does not cite it. |
| Sibling heads with cohomology objects (ProfiniteArithmetic, LocalFieldsRamification, SelmerIwasawaCohomologyPartII, GaloisSectionsPadicPeriodMaps, EtaleDualityAndPerverseSheavesPartII) | Object searches for continuous cohomology carriers, coinduction, dimension predicates, class modules, Evens norms and the universe comparison found no second owner. |

Ownership against open pull requests whose files the brief does not supply was not checked.

## Not verifiable

- **NSW**, *Cohomology of Number Fields*, 2nd ed.: the service classifies the Springer DOI as paywalled. The authors' page (`NSW line 25`–`28`) advertises a free PDF (`./NSW2.3.pdf`), but fetching that URL through the service twice returned only the landing page. The locators (1.2.5), (1.3.2), (1.3.7), (1.4.1)–(1.4.5), (1.5.1)–(1.5.9), (1.6.1), (1.6.4), (1.6.7), (1.7.7), (3.3.1)–(3.3.6), (3.3.11), (3.6.1)–(3.6.4), (6.2.1), (6.2.2) remain locator-only; the statements attributed to them were checked mathematically on the instances in the table, not against the book.
- **Ribes–Zalesskii**, *Profinite Groups*; **Serre**, *Galois Cohomology*; **Serre**, *Local Fields*; **Koch**, *Galois Theory of p-Extensions*: Springer DOIs, uncertified; Prop. 2.2.2, Cor. 6.5.6(a), Thm. 6.10.5, Cor. 7.2.5(a), Thm. 7.3.1, 7.9.6–7.9.7, I §2.2 Prop. 8, VII §7 Prop. 6, X §3, XIII §1, Thms. 3.9, 3.10, 3.14, 3.16, Def. 5.1 unread.
- **Brown**, *Cohomology of Groups*: no legal copy found by the service (recorded in `needs-references.toml` of this job); III §9, III (10.1), V (3.5), (3.6), (3.8) unread. Milne (0.1.1)–(0.1.6) and Evens independently support the cup and transfer statements cited to Brown.
- The Evens, Kozlowski and Kahn extractions have degraded mathematical typography; numbered statements and hypotheses were legible, and no illegible symbol was taken as evidence.

## Source issues

- **Misprint** in Milne at I Remark 0.11, printed p. 8: the source displays the right adjoint's adjunction with the subgroup in place of the restricted module on the `H`-side; it should read as `H`-equivariant maps from the restricted `G`-module to the `H`-module; affects a stated result.
