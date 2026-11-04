# Review of SemisimpleAlgebras (pull request #989 at 08635df)
Folder: `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/`

**Verdict:** accepted

🤖 Independent AI incremental re-review of 60 changed lines since f14d5ee. No P1 or P2 findings remain. One P3 documentation finding persists. Ready for human final approval; this is not an approval or merge.

## R01 (P3) — Correct the family index's Brauer-signature claim

**Location:** `TauCetiRoadmap/RepresentationTheory/Suggested.lean:12–13`: “the double-centralizer, Skolem–Noether and Brauer-group statements in SemisimpleAlgebras/Suggested.lean”.

**Claim:** The component acceptance test contains Brauer-group statements.

**Witness:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean:30,39,47` contains exactly three declarations: conjugacy, centralizer simplicity, and double-centralizer equality. Lines 11–16 identify Brauer theory as consumed. The number of Brauer-group declarations is zero.

**Repair:** Replace the parenthesis with “for example the simple-source Skolem–Noether and simple-subalgebra centralizer statements in SemisimpleAlgebras/Suggested.lean”. Comparing this replacement with the three-declaration inventory validates it: one conjugacy statement and two centralizer statements, with no promise of a Brauer-group statement.

## Previous findings

- R01 — repaired: README lines 122–148 and §§2.1–2.3 use the eight verified TauCeti names, corrected presentation locators, finite simple-factor contracts, and positive-size division-ring uniqueness. The added empty-product and transposition Checks agree with those contracts.
- R02 — not repaired: the family-index docstring still claims Brauer-group signatures; the component still contains only the three Layer 5 theorems. This remains the nonblocking P3 finding R01 above.

## Verified sound

**Scope and pins.** Read the repository README's normative writing checklist and CONTRIBUTING, and compared the main-branch CharacterTheory and ReductiveGroups roadmaps. The actual change from f14d5ee is 43 insertions and 17 deletions in the component README only. Both Lean files are unchanged. HEAD is 08635df6084f9d669a221386caa6c302bf5cd173. Mathlib is 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, both matching lake-manifest.json. The content checkout matches its origin/main at 9c6e95d9. The outside-folder diff, after the brief's explicit family-index exception, is empty. No PR file was edited.

The repair introduces no construction, shortcut, algorithm, new supplier edge, source quotation, sorry'd data or option override. It keeps general finite simple-factor counting and matching separate from the division-ring matrix uniqueness specialization. In particular, M₂(K) is an allowed simple factor but is not an allowed coefficient division ring. The four supposedly missing names in the worker's citation leads all exist at the pin and elaborate; they are search false negatives.

**Gate and elaboration.** The worker's gate at this exact head reports all counters zero, including build, and OK. The independent literal standalone rerun reports all text/dependency checks zero but stops before building on:

    outside-folder: TauCetiRoadmap/RepresentationTheory/Suggested.lean

Its raw result is FAIL. This is a scope false positive: the brief explicitly includes the family's direct files as this PR's own. No tooling or order was altered. Acceptance relies on the worker's passing, scope-aware gate and independent verification of the permitted scope and build, not on representing that raw rerun as passing.

The independent targeted build completed successfully (8976 jobs). Direct `lake env lean` elaboration also exited 0. Each produced only the three expected sorry warnings. A fresh scratch copy with `#check @name` for all three headlines and eight repaired supplier names also exited 0. The three headline types retain ambient centrality, ambient finite dimension and simplicity, and source/subalgebra simplicity; conjugacy keeps the independent universes and both algebra maps. No binder disappeared and no signature changed.

The dependency check output is exactly:

    depcheck: 209 roadmaps, 1466 edges, 0 problem(s)

There is no UPWARD or CYCLE line. Read the Needs/dependency passages: the changed edges are §2.2 → §1.3 and §2.3 → §2.2, with Mathlib and Tau Ceti as the external suppliers. Cross-roadmap references are ownership boundaries or consumers, not prerequisites.

**Headlines and padding.** README §§5.1–5.3 and its summary identify simple-source Skolem–Noether, centralizer simplicity for a simple subalgebra, and double-centralizer equality. All three appear in Suggested.lean on native carriers; there is no missing headline, auxiliary definition, stand-in or example. The file and pins are unchanged, so the previous review's unsuccessful one-tactic probes are carried forward. Reopened `TauCeti/Algebra/CentralSimple/SkolemNoether.lean:98–110` and `TauCeti/Algebra/CentralSimple/Centralizer.lean:367–374,446–447`: the native alternatives assume centrality of B, which the three headlines intentionally do not. This remains a substantive generalization.

**Pinned evidence for the changed contracts.** Paths below are relative to the supplying library repository.

| Declaration | File and line | What was verified |
|---|---|---|
| `TauCeti.WedderburnPresentation` | `TauCeti/RingTheory/Semisimple/Wedderburn/Presentation.lean:77` | Natural block count, coefficient division rings, positive natural degrees and a ring equivalence. |
| `TauCeti.IsSemisimpleRing.wedderburnPresentation` | Same file, :291 | Chooses that presentation under semisimplicity; corrected locator is exact. |
| `TauCeti.blocks_equiv_simpleModules` | `TauCeti/RingTheory/Semisimple/Wedderburn/Blocks.lean:180`; binders :96 | Semisimple R, Fin n indices, division rings, positive sizes; simple left ideals, pairwise inequivalence and exhaustion. |
| `TauCeti.exists_simpleSubmodule_of_ringEquiv_pi` | Same file, :148; binders :96–100 | The same family/exhaustion assertion for arbitrary finite index types and simple factors. |
| `TauCeti.card_blocks_eq` | `TauCeti/RingTheory/Semisimple/BlockCount.lean:268` | Positive-size division-ring matrix presentations; no semisimplicity binder on R. |
| `TauCeti.card_eq_of_ringEquiv_pi_of_isSimpleRing` | Same file, :77 | Equal cardinalities for finite products of simple rings, with no division-ring restriction. |
| `TauCeti.exists_equiv_factors_of_ringEquiv_pi` | Same file, :252; binders :90–93 | Bijection and factor equivalences with the exact Pi.single compatibility described in the repair. |
| `TauCeti.wedderburn_blocks_unique` | `TauCeti/RingTheory/Semisimple/Wedderburn/Uniqueness.lean:47` | Fin m and Fin n blocks, positive natural sizes, division-ring equivalences and equal matched sizes. |
| `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule` | `Mathlib/RingTheory/SimpleModule/Basic.lean:416` | The §1.3 input converts the simple-left-ideal enumeration into enumeration of all simple modules. |

All eight repaired names were mechanically checked, including the two presentation names. The four naming search leads are resolved by these exact declarations. The arbitrary-finite-index matching is a separate consumed theorem, not an overclaim about the Fin-indexed uniqueness theorem.

**Sources and seeded sample.** The sample intersects the changed text in §2.1 (presentation locators) and §2.3 (counting, matching and uniqueness). Checked these against the pinned source text at all the lines above, and checked the supporting §2.2 dictionary and §1.3 bridge. The new Checks have no external textual dependency. There is no new or changed Stacks locator and no locator flagged unverified. The other thirteen sampled targets retain the previous report's source certification; their full source audit was not repeated. Stacks version ed88ff78 and its publicly identified tags remain unchanged. No new source fetch or missing-reference request is necessary in this incremental scope.

**Ownership and resolved citations.** Searched objects with the roadmap search service across main and the indexed open heads, and searched board package READMEs/Lean files. The changed finite-product and matrix-block constructions are already proved in the pinned files above, and the repair explicitly consumes them. No new owner or fully qualified declaration was introduced. The original roadmap continues to own the three unchanged general Layer 5 targets. The search service's own entry for this PR contains older wording; review of this PR uses the requested local head.

Resolved all eight named cross-roadmap references afresh:

| Roadmap | Resolved location | Relationship |
|---|---|---|
| CharacterTheory | `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:221–234` on main; open-head §2.1–2.2 and supplier table at :218–222 | Layer 2.5 on main consumes the block dictionary; the open-head split count consumes Mathlib directly. Both remain compatible with §2.2. |
| ReductiveGroups | `TauCetiRoadmap/ReductiveGroups/README.md:176` on main | Layer 1 is the representations/comodules boundary; it is not a supplier here. |
| InductionRestriction | `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:517–521` on main | Consumes the simple-module/block dictionary and preserves the opposite-endomorphism convention. |
| QuiverRepresentations | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:132–135` on main | Consumes radical and Wedderburn theory. |
| LieHighestWeight | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:255–261` on main | Uses native isotypic theory through its enveloping-algebra dictionary. |
| QuadraticFormInvariants | `TauCetiRoadmap/QuadraticFormInvariants/README.md:541–557` on main | Consumes Layers 4 and 6; no new dependency from this repair. |
| ClassicalArithmeticCompletion | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:251–253` on main | Consumes Layers 1–2, 5 and 6. |
| FaltingsFinitenessAndIsogenyTheoremsPartII | `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:106–108` at its supplied open head | Explicitly consumes main-branch Layers 2–3 and 6; board package agrees. |

**Adversarial table.** Thirty-one unchanged rows are carried forward individually from [the previous report][previous] (including its earlier carried evidence). The remaining rows are fresh computations for the changed presentation contracts, their new Checks and the surviving documentation finding. Historical line numbers within carried rows belong to that report, not this head. Scalar K in the fresh rows can be 𝔽₂ or 𝔽₃; all computations hold in either characteristic.

[previous]: packages/SemisimpleAlgebras/reports/PRREVIEW-SemisimpleAlgebras~4.md

| # | Statement | Instances | Values computed | Result | Change / evidence |
|---|---|---|---|---|---|
| 1 | `skolemNoether`, f = g | any B, A | u = 1: 1·f(b)·1⁻¹ = f(b) | sound | Carried from [previous report, row 1][previous]; statement unchanged |
| 2 | `skolemNoether`, B = K, A = M₂(K) (Check line 583) | scalar maps | A as right A-module = two copies of the row module: dim 4, length 2, not simple | sound; route classifies non-simple modules via Lemma 4.6(3) | Carried from [previous report, row 2][previous]; statement unchanged |
| 3 | `skolemNoether`, A = B = M₂(K), g = conjugation by P = E₁₂ + E₂₁ | E₁₁ | P E₁₁ P⁻¹ = E₂₂ = g(E₁₁), u = P | sound | Carried from [previous report, row 3][previous]; statement unchanged |
| 4 | `skolemNoether`, ℂ ⊂ ℍ over ℝ, f inclusion, g conjugation (Check line 585) | i | j i j⁻¹ = j i (−j) = −(j i j) = −((−k) j) = −i; Z(B) has dim 2 | sound without centrality of B | Carried from [previous report, row 4][previous]; statement unchanged |
| 5 | Same with ambient A = ℂ (Check line 587) | u ∈ ℂˣ | u i u⁻¹ = i ≠ −i | centrality of A needed and present | Carried from [previous report, row 5][previous]; statement unchanged |
| 6 | Infinite-dimensional central simple ambient: Weyl algebra A₁(ℚ) | f = id, g: x ↦ x + 1, ∂ ↦ ∂ | units of A₁(ℚ) are ℚˣ, so u x u⁻¹ = x ≠ x + 1 | `FiniteDimensional K A` needed and present | Carried from [previous report, row 6][previous]; statement unchanged |
| 7 | Injectivity of f (line 563–564) | B simple, A nontrivial | ker f is a two-sided ideal ≠ ⊤ (f(1) = 1 ≠ 0), so ker f = ⊥ | finite dimension of B derivable, not a hypothesis | Carried from [previous report, row 7][previous]; statement unchanged |
| 8 | Conjugation orientation (line 65) | ℍ, u = 1 + i, b = j | u j u⁻¹ = (1+i) j (1−i)/2 = (j + k)(1 − i)/2 = (j − j i + k − k i)/2 = (j + k + k − j)/2 = k; Stacks' f = x g x⁻¹ is ours with u = x⁻¹ | consistent with Lean line 34 | Carried from [previous report, row 8][previous]; statement unchanged |
| 9 | Opposite convention (Check line 70) | ℍ, right multiplications | (rᵢ ∘ rⱼ)(1) = rᵢ(j) = j i = −k; r_{ij}(1) = k | End_ℍ(ℍ) = ℍᵒᵖ, as `IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite` needs | Carried from [previous report, row 9][previous]; statement unchanged |
| 10 | `centralizer_isSimpleRing`, count, `centralizer_centralizer`: B = K ⊂ M₂(K) | | C = M₂(K) simple; 1·4 = 4; C(C) = K = B | sound | Carried from [previous report, row 10][previous]; statement unchanged |
| 11 | B = M₂(K) ⊂ M₂(K) | | C = K; 4·1 = 4; C(C) = M₂(K) = B | sound | Carried from [previous report, row 11][previous]; statement unchanged |
| 12 | B = ℂ ⊂ ℍ over ℝ (Checks 611, 644) | | C = ℂ simple, Z(C) dim 2; 2·2 = 4; C(C) = ℂ; mult. ℂ ⊗ ℂ → ℍ has image ℂ, dim 2 ≠ 4 | all three headlines hold; factorization needs B central (Lemma 7.2) | Carried from [previous report, row 12][previous]; statement unchanged |
| 13 | B = diagonal K × K ⊂ M₂(K) (Check 613) | not simple | C = K × K not simple; 2·2 = 4; C(C) = K × K | simplicity of B needed for (1) | Carried from [previous report, row 13][previous]; statement unchanged |
| 14 | B = upper triangular ⊂ M₂(K) (Checks 543, 615) | not simple, dim 3 | C = K; 3·1 = 3 ≠ 4; C(C) = M₂(K) ≠ B; B ⊗ Aᵒᵖ not simple | simplicity of B needed for the count and (3) | Carried from [previous report, row 14][previous]; statement unchanged |
| 15 | B = L = K(s), s² = t, K = 𝔽₂(t), regular embedding in M₂(K) (Checks 618, 647) | inseparable | C = End_L(L) = L, basis (1, s); 2·2 = 4; C(C) = L | no separability hypothesis needed | Carried from [previous report, row 15][previous]; statement unchanged |
| 16 | B = M₂(K) ⊗ 1 ⊂ M₄(K), char 2, 3 | | C = 1 ⊗ M₂(K); 4·4 = 16; C(C) = B; M₂ ⊗ M₂ → M₄ iso (dims 16 = 16, simple source) | sound in every characteristic | Carried from [previous report, row 16][previous]; statement unchanged |
| 17 | A = K, B = K | degenerate | C = K; 1·1 = 1; C(C) = K | sound | Carried from [previous report, row 17][previous]; statement unchanged |
| 18 | A = ℂ over ℝ (not central), B = ℝ (Checks 620, 649) | | C = ℂ; 1·2 = 2; C(C) = ℂ ≠ ℝ | centrality of A needed for (3) | Carried from [previous report, row 18][previous]; statement unchanged |
| 19 | Zero algebra | | not `IsSimpleRing`; `Nontrivial A` in the native count | excluded | Carried from [previous report, row 19][previous]; statement unchanged |
| 20 | §5.3 cancellation (line 630) | | dim Cₐ(B) ≥ 1 since Cₐ(B) ∋ 1 ≠ 0 in nontrivial A; B ≤ C(C) by `le_centralizer_centralizer`; equal finrank ⇒ equal by `eq_of_le_of_finrank_eq` (needs `FiniteDimensional K ↥E`, E ≤ A) | route sound | Carried from [previous report, row 20][previous]; statement unchanged |
| 21 | §5.2 route (line 598–601) | R = B ⊗ Aᵒᵖ, M = A | R simple (`tensorProduct_of_isCentral_right`: B simple, Aᵒᵖ central simple), finite over K hence Artinian (`IsArtinianRing.of_finite`); M nontrivial, finite over R; `moduleEnd` gives End_R M simple; `centralizerAlgEquivEnd` transports | route sound | Carried from [previous report, row 21][previous]; statement unchanged |
| 22 | Positivity of blocks (Check 73, 314, 335) | K vs K × M₀(K) | block counts 1 vs 2; `NeZero (d i)` excludes the second | sound | Carried from [previous report, row 22][previous]; statement unchanged |
| 23 | Jacobson Checks (194–198) | K, K × K, K[ε]/(ε²), T₂(K) | radicals 0, 0, (ε), strictly upper; (ε)² = 0, N² = 0; quotients K, K × K; T₂(K) not semisimple | sound | Carried from [previous report, row 23][previous]; statement unchanged |
| 24 | §4.3 map (Check 504–506) | ℍ, i ⊗ iᵒᵖ | x ↦ i x i: 1 ↦ i² = −1; j ↦ i j i = k i = j; conjugation x ↦ i x i⁻¹ fixes 1 | convention "multiply by b on the right" is the pinned `tensorOpAlgEquivEnd` | Carried from [previous report, row 24][previous]; statement unchanged |
| 25 | Degrees, tensor, index (Checks 485–489, 745–751) | K, M₂(K), ℍ, M₂(ℍ), ℍ ⊗ ℍ | dims 1, 4, 4, 16 = 1², 2², 2², 4²; deg(ℍ ⊗ ℍ) = 4, M₄(ℝ) dim 16; (deg, index) = (1,1), (2,1), (2,2), (4,2); ℂ/ℝ dim 2 not a square | sound; centrality essential to the square law | Carried from [previous report, row 25][previous]; statement unchanged |
| 26 | Brauer laws and representatives (Checks 688–694) | Br(ℝ) | [ℍ]² = [M₄(ℝ)] = 1; [ℍᵒᵖ] = [ℍ]⁻¹ = [ℍ]; [ℝ][ℝ] = [ℝ]; rep of [M₂(ℍ)] is ℍ, of [M₃(ℝ)] is ℝ | `mk_tensorProduct`, `mk_base`, `mk_op` exclude the swapped law | Carried from [previous report, row 26][previous]; statement unchanged |
| 27 | Dimension sums and Schur controls (Checks 242–247, 381–385, 785–787) | M₂(k) on k²; k(t); ℂ over ℝ; k[S₃]; 𝔽₂[C₂] | dim End_A S = 1 vs dim End_k S = 4; End = k(t) infinite; End_ℂ ℂ = ℂ dim 2; 1 + 1 + 4 = 6; (g − 1)² = 0, g − 1 ≠ 0 | contract hypotheses necessary | Carried from [previous report, row 27][previous]; statement unchanged |
| 28 | §3.1 non-simple semisimple modules | R = K, M = K² | End_K(K²) = M₂(K), dimension 4; its commutant is scalar K, dimension 1 = dim K; map sends a to aI | Bijective although M has length 2 and is not simple | Carried from [previous report, row 32][previous]; statement unchanged |
| 29 | §3.1 nontriviality and faithfulness | M = 0 over K; M = K under K × K → K | K → End(0) has kernel K; first projection has kernel 0 × K and image K | First excluded by nontriviality; second excluded by simple-ring hypothesis | Carried from [previous report, row 33][previous]; statement unchanged |
| 30 | §6.2 embedded field of prescribed degree | D = K, L = K; D = ℍ/ℝ, L = ℂ; candidate L = ℝ | degrees 1 = deg K and 2 = deg ℍ; K ⊗ K = M₁(K), ℂ ⊗ ℍ = M₂(ℂ); ℝ ⊗ ℍ = ℍ, not M₂(ℝ) | First two satisfy all conditions; last has degree 1 ≠ 2 and fails splitting | Carried from [previous report, row 34][previous]; statement unchanged |
| 31 | §6.2 degree implies maximality | ℂ ⊂ ℍ; ℝ ⊂ ℍ | if ℂ ⊆ E ⊆ ℍ is a field, 2 ≤ dimℝ E ≤ 2, so dimℂ E = 1 and E = ℂ; ℝ has dimension 1 < 2 and is properly contained in ℂ | Correct implication; scalar subfield excluded | Carried from [previous report, row 35][previous]; statement unchanged |
| 32 | §2.1 presentation structure and choice | zero ring, K, K × K | block counts 0, 1, 2; degree lists (), (1), (1,1); product dimensions 0, 1, 2 | All match the represented rings; appended degree 0 fails NeZero | Fresh; both presentation locators and names repaired |
| 33 | §2.2 matrix-block enumeration | K × K; M₂(K) | (1,0) acts by 1 and 0 on the two ideals, giving 2 inequivalent classes; the two column ideals in M₂(K) are equivalent, giving 1 class | Classes = blocks: 2 = 2 and 1 = 1 | Fresh; TauCeti.blocks_equiv_simpleModules |
| 34 | §2.2 arbitrary finite simple-factor enumeration | M₂(K) × K | The regular module has two copies of K² and one K; isomorphism classes number 2, equal to the two simple factors | Exhaustion counts classes, not the three simple summands with multiplicity | Fresh; TauCeti.exists_simpleSubmodule_of_ringEquiv_pi and §1.3 |
| 35 | §2.2 empty-family Check | empty product; zero ring | 1 = 0 implies m = 1m = 0m = 0 for every module element; simple modules 0, indices 0 | Both enumeration theorems return an empty family, with vacuous exhaustion | Fresh; README :347–348 |
| 36 | §2.3 division-ring block count | M₂(K) × K versus K × M₂(K); zero ring | 2 blocks = 2 blocks; empty presentations give 0 = 0 | Matches Fin-indexed positive hypotheses; no extra semisimplicity binder | Fresh; TauCeti.card_blocks_eq |
| 37 | §2.3 general finite simple-factor count | M₂(K) versus M₁(M₂(K)) | Factor counts 1 = 1; central idempotents 2 = 2; displayed matrix sizes 2 ≠ 1 | General count holds; coefficient M₂(K) is simple, but E₁₁ has no inverse | Fresh; README :362–364,388–390; division-ring hypothesis correctly retained for uniqueness |
| 38 | §2.3 factor equivalences and supported-coordinate law | transposition M₂(K) × K → K × M₂(K) | f(X,0) = (0,X) and f(0,a) = (a,0); matched factor maps are identities; for X = E₁₁, identity permutation places the nonzero entry in the wrong coordinate | The returned bijection is transposition, with the claimed Pi.single compatibility | Fresh; TauCeti.exists_equiv_factors_of_ringEquiv_pi |
| 39 | §2.3 empty matching Check | two empty products | 0 = 0 factors; exactly 1 bijection ∅ → ∅; 0 coordinate equations to verify | No spurious factor or nonemptiness assumption | Fresh; README :393–394 |
| 40 | §2.3 full division-ring uniqueness | M₂(K) × K versus K × M₂(K) | Transposition matches sizes 2 = 2 and 1 = 1 and coefficients K ≃ K; identity would require 2 = 1 | Fin-indexed statement matches the actual pinned theorem | Fresh; TauCeti.wedderburn_blocks_unique |
| 41 | §2.3 positivity and coefficient controls | K versus K × M₀(D); M₂(K) versus M₁(M₂(K)) | Without positive sizes block counts 1 ≠ 2; without division coefficients purported matched sizes 2 ≠ 1 | NeZero excludes the first and DivisionRing excludes the second | Fresh; both hypotheses explicitly present in repair |
| 42 | Family-index statement inventory | component Suggested.lean | 1 conjugacy + 2 centralizer statements = 3; Brauer-group statements = 0 versus claimed at least 1 | P3 R01 persists; proposed replacement matches all 3 | Fresh; previous R02 |

## Not verifiable

- No changed claim is unverifiable: all changed mathematical contracts are supplied by readable pinned declarations. No new missing-reference request was made.
- Unchanged source checks, the broader ownership audit and the one-tactic experiments are carried forward from the previous report, not represented as a fresh full review. Its source erratum is retained below as historical evidence.

## Source issues

- **Misprint** in stacks-brauer at Proposition 8.5 (tag 0752), printed p. 7, stacks-brauer line 304: the source says the final consequence using a spelling of splitting that omits its l; it should be splitting field; affects nothing.

The source issue is carried forward from the previous report; no new source mistake was found in this incremental review.
