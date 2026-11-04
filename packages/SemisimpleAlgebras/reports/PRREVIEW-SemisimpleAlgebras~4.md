# Review of SemisimpleAlgebras (pull request #989 at f14d5ee)
Folder: `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/`

**Verdict:** needs changes

🤖 Independent AI incremental re-review of 39 changed lines since 07b43bf. Two findings remain: one P2 and one P3. No pull-request files were changed. Unchanged mathematics and one-tactic probes are carried forward explicitly from the previous review.

## R01 (P2) — Finish repairing the block-supplier names and generality

**Location:** TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:122–125, :303–305, :323–329, :347–357. The contract still names “RingEquiv.exists_simpleSubmodule_of_pi_matrix, RingEquiv.card_blocks_eq, and RingEquiv.wedderburn_blocks_unique” and describes the latter as admitting “arbitrary block index sets”.

**Claim:** Those are the pinned declarations; the named count theorem accepts simple coefficient rings; the named uniqueness theorem directly accepts arbitrary block and finite nonempty matrix index types.

**Witness:** Three #check commands fail with unknown constants. The replacements are in namespace TauCeti; card_blocks_eq requires division rings, and wedderburn_blocks_unique uses Fin block indices and positive natural sizes. See the pinned-file evidence below.

**Repair:** Delete the root-namespace exception. In §2.2 cite TauCeti.blocks_equiv_simpleModules for the stated matrix specialization and TauCeti.exists_simpleSubmodule_of_ringEquiv_pi for finite products of simple rings, retaining the newly added semisimplicity hypothesis. In §2.3 cite TauCeti.card_blocks_eq with division-ring coefficients and TauCeti.wedderburn_blocks_unique with Fin indices and positive sizes. Preserve the broader finite-simple-factor count by citing TauCeti.card_eq_of_ringEquiv_pi_of_isSimpleRing; TauCeti.exists_equiv_factors_of_ringEquiv_pi supplies factor matching for arbitrary finite index types. Do not claim that the Fin-indexed matrix theorem itself has the broader signature. Replace every occurrence in the contracts and Needs lines. The chosen-presentation name is now correct; its locator is line 291, not the newly written 289, and the structure is at line 77, not 75.

**Repair validation:** The corrected names elaborate at the pins. On K × K the enumeration has exactly two classes; on M₂(K) it has one. On M₂(K) × K versus K × M₂(K), the transposition matches sizes (2,1) with (1,2), giving 2 = 2 and 1 = 1. These tests preserve the intended mathematics while fixing the supplied interfaces. The defect is the claimed library contract, not a counterexample to finite Artin–Wedderburn uniqueness.

## R02 (P3) — Remove the family index's claim of Brauer-group signatures

**Location:** TauCetiRoadmap/RepresentationTheory/Suggested.lean:12–13: “the double-centralizer, Skolem–Noether and Brauer-group statements in SemisimpleAlgebras/Suggested.lean”.

**Claim:** The component acceptance test states a Brauer-group headline.

**Witness:** TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean:30, :39, :47 are its only declarations: conjugacy, centralizer simplicity, and double centralizers. Its lines 11–16 describe Brauer theory as consumed. There are zero Brauer-group statements.

**Repair:** Replace the parenthesis with “for example the simple-source Skolem–Noether and simple-subalgebra centralizer statements in SemisimpleAlgebras/Suggested.lean”. This describes all three existing signatures and promises no absent Brauer theorem.

## Previous findings

- R01 — partly repaired: §2.1 fixes the chosen-presentation name; §§2.2, 3.1 and 6.2 clarify hypotheses. The three root RingEquiv names, the §2.3 generality claims, and the presentation locators still need repair; see R01.
- R02 — not repaired: the family-index docstring still claims Brauer-group statements in the component acceptance test, whose only declarations are the three Layer 5 theorems; see R02.
- R03 — repaired: References, lines 811–818, retain public tags, pages and the module-convention note and delete the worker-cache key and line-number sentence.

## Verified sound

**Scope and pins.** The only change since 07b43bf is the 39-line README diff; the component's 53-line Lean file and the family index are unchanged. Read the repository README's normative checklist and CONTRIBUTING, and compared main's CharacterTheory and ReductiveGroups roadmaps. HEAD is f14d5eef9a39be118998d391c51802b3fba616c6. Both dependency checkouts agree with lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The context content checkout agrees with its origin/main at 9c6e95d9. The requested outside-folder diff, excluding this component and the explicitly permitted family-index files, is empty. No new definition, algorithm, route shortcut, supplier edge, import, set_option, or sorry'd data is introduced.

**Gate and build.** The worker-provided gate reports every check passing, including the targeted build. My literal standalone rerun reports all text/dependency counters zero, but stops before building on this line:

    outside-folder: TauCetiRoadmap/RepresentationTheory/Suggested.lean

This is a scope false positive: the review brief explicitly names files directly in TauCetiRoadmap/RepresentationTheory/ as this PR's own. I did not change the tooling or order. The standalone gate's raw result is FAIL, not represented here as a pass; there is no unauthorized file change after applying the brief's explicit exception. Independently ran the permitted targeted build: success, 8976 jobs, only three sorry warnings. Direct lake env lean elaboration of the component also exits 0 with those same three warnings.

The independent dependency check gives exactly:

    depcheck: 209 roadmaps, 1466 edges, 0 problem(s)

No UPWARD or CYCLE line. The affected Needs lines consume Mathlib, Tau Ceti and earlier local sections only; the README has no roadmap supplier. The changes preserve §2.2 → §1.3, §2.3 → §2.2 and §6.2 → §§4.1, 4.2, 6.1.

**Signatures and headline inventory.** The three headlines are simple-source Skolem–Noether (§5.1), simplicity of the centralizer of a simple subalgebra (§5.2), and the double-centralizer equality (§5.3). All three are stated, on native carriers, with sorry, and none requires a missing definition. A fresh scratch copy with #check @ for all three declarations elaborates successfully. All retain Algebra.IsCentral K A, IsSimpleRing A, FiniteDimensional K A, and IsSimpleRing B; the first retains independent universes and both algebra homomorphisms. No source-centrality, separability or finite-dimensionality-of-B assumption was added or lost. The signatures equal the supplied signature listing and the README. The same probe checks eight relevant replacement/changed supplier names successfully. A separate three-name negative probe fails on exactly the three cited RingEquiv constants.

**Padding.** The acceptance test is byte-for-byte unchanged. Carry forward the previous review's one-tactic probes: the three corresponding Tau Ceti theorems require centrality of B, which these headlines intentionally lack; infer_instance, rfl and simp did not discharge the relevant goals. Reopened TauCeti/Algebra/CentralSimple/SkolemNoether.lean:98–110 and TauCeti/Algebra/CentralSimple/Centralizer.lean:367–374,446–480 to confirm those stronger source hypotheses at the unchanged pin. There are no definitions, examples or Check mirrors. The one-tactic experiments were not rerun for unchanged statements at unchanged pins.

**Pinned contracts reopened.** These are paths relative to the respective library repositories:

| Pin | Declaration or carrier | File and line | Verified content |
|---|---|---|---|
| Tau Ceti | WedderburnPresentation; IsSemisimpleRing.wedderburnPresentation | TauCeti/RingTheory/Semisimple/Wedderburn/Presentation.lean:77, :291 | Finite block count, division rings, NeZero sizes and ring equivalence; the choice requires semisimplicity. |
| Tau Ceti | exists_simpleSubmodule_of_ringEquiv_pi; blocks_equiv_simpleModules | TauCeti/RingTheory/Semisimple/Wedderburn/Blocks.lean:148, :180; binders :96–100 | Semisimple R; finite simple factors; matrix specialization with positive sizes. Existence, pairwise inequivalence and exhaustion. |
| Tau Ceti | card_eq_of_ringEquiv_pi_of_isSimpleRing; exists_equiv_factors_of_ringEquiv_pi; card_blocks_eq | TauCeti/RingTheory/Semisimple/BlockCount.lean:77, :252, :268 | General finite simple-factor count and matching; last theorem specializes to matrices over division rings. |
| Tau Ceti | wedderburn_blocks_unique | TauCeti/RingTheory/Semisimple/Wedderburn/Uniqueness.lean:47–53 | Fin m, Fin n, Fin (d i), NeZero (d i); matches sizes and division rings. |
| Mathlib | IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule | Mathlib/RingTheory/SimpleModule/Basic.lean:416 | Simple modules over semisimple R are isomorphic to ideals; supports §2.2 through §1.3. |
| Mathlib | Module.Finite.toModuleEnd_moduleEnd_surjective | Mathlib/RingTheory/SimpleModule/Basic.lean:572 | Density for a semisimple module finite over its endomorphism ring. |
| Tau Ceti | toModuleEnd_moduleEnd_bijective_of_isSimpleRing | TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:172–176 | Simple R, nontrivial semisimple M, finite over Endᵣ M; faithfulness derived. M need not be simple. |
| Tau Ceti | exists_subalgebra_isField_finrank_eq_deg; exists_isSplittingField_finrank_eq_deg | TauCeti/Algebra/CentralSimple/MaximalSubfield.lean:118, :135–142; binders :107–108 | Central finite-dimensional division D; actual field with K-algebra homomorphism into D, finite degree deg D, and splitting. |

**Source sample.** The seeded targets intersect the changes in §§2.1, 2.2, 3.1, 6.2; §2.3 is also rechecked because the block contract and previous R01 depend on it. The library-only contracts are verified against the pin above. The ten other sampled sections retain the previous review's checks. No locator is flagged unverified. Fetched the sole cited work through the sources service with its existing key stacks-brauer; no manifest or PR file was edited. The text identifies version ed88ff78 at stacks-brauer line 39, matching the README.

For §6.2: Lemma 8.3, tag 0750, printed p. 7, says maximal subfields split central division algebras (stacks-brauer line 294–296); Proposition 8.5, tag 0752, printed p. 7, gives a separable maximal subfield (stacks-brauer line 302–304). The degree/maximality connection is Lemmas 7.3–7.4, tags 074V–074W, printed pp. 6–7 (stacks-brauer line 258–268). The revised embedding formulation is supported, with no separability restriction imposed on all subfields. The removed cache references add no new source claim; public tags 074Q and 074T remain the locators for the unchanged headlines.

**Ownership and citations.** Ran roadmaps grep on the changed supplier names and on objects (simple left ideals, finite density, matrix-size/division-ring matching, maximal subfields), and searched board package READMEs/Lean files. The changed objects are already owned by the pinned libraries and remain consumed here; no new carrier or competing construction is introduced. Reopened ExceptionalThetaCorrespondencesForG2 §2.2 (TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md:578–589): it consumes the same pinned maximal-subfield theorem and separately owns its embedding converse. Its board package agrees. FaltingsFinitenessAndIsogenyTheoremsPartII's supplier contract (TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:106–108) consumes retained Layers 2–3 and 6. The search service's entry for this PR contains the previous wording; current findings instead use the requested local head.

Resolved the README's cross-roadmap references again: CharacterTheory Layer 2 and Layer 2.5 on main (TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:221–234), and its open-head §§2.1–2.2 and Layer 2 dependency list; ReductiveGroups Layer 1 on main (TauCetiRoadmap/ReductiveGroups/README.md:176); InductionRestriction's dictionary (TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:517); QuiverRepresentations' radical/Wedderburn boundary (TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:13,37,135,287,461); LieHighestWeight's native isotypic/enveloping-algebra dictionary (TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:258–261); QuadraticFormInvariants' Layers 4 and 6 requirements (TauCetiRoadmap/QuadraticFormInvariants/README.md:542–553); ClassicalArithmeticCompletion's Layers 1–2, 5–6 contract (TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:251–253); and the Faltings contract above. These are consumers or scope boundaries, not upward suppliers. The repair severs no retained layer heading. The original roadmap remains the owner of the three unchanged Layer 5 headlines.

**Adversarial table.** Rows 1–27 carry forward the previous report's computations and cite it individually; line numbers inside those rows refer to that report's head. Rows 28–36 are fresh checks of the changed mathematical statements and surviving findings. Statement truth and whether the cited declaration supplies it are distinguished.

[previous]: packages/SemisimpleAlgebras/reports/PRREVIEW-SemisimpleAlgebras~3.md

| # | Statement | Instances | Values computed | Result | Change / evidence |
|---|---|---|---|---|---|
| 1 | `skolemNoether`, f = g | any B, A | u = 1: 1·f(b)·1⁻¹ = f(b) | sound | Carried from [previous review, row 1][previous]; unchanged statement |
| 2 | `skolemNoether`, B = K, A = M₂(K) (Check line 583) | scalar maps | A as right A-module = two copies of the row module: dim 4, length 2, not simple | sound; route classifies non-simple modules via Lemma 4.6(3) | Carried from [previous review, row 2][previous]; unchanged statement |
| 3 | `skolemNoether`, A = B = M₂(K), g = conjugation by P = E₁₂ + E₂₁ | E₁₁ | P E₁₁ P⁻¹ = E₂₂ = g(E₁₁), u = P | sound | Carried from [previous review, row 3][previous]; unchanged statement |
| 4 | `skolemNoether`, ℂ ⊂ ℍ over ℝ, f inclusion, g conjugation (Check line 585) | i | j i j⁻¹ = j i (−j) = −(j i j) = −((−k) j) = −i; Z(B) has dim 2 | sound without centrality of B | Carried from [previous review, row 4][previous]; unchanged statement |
| 5 | Same with ambient A = ℂ (Check line 587) | u ∈ ℂˣ | u i u⁻¹ = i ≠ −i | centrality of A needed and present | Carried from [previous review, row 5][previous]; unchanged statement |
| 6 | Infinite-dimensional central simple ambient: Weyl algebra A₁(ℚ) | f = id, g: x ↦ x + 1, ∂ ↦ ∂ | units of A₁(ℚ) are ℚˣ, so u x u⁻¹ = x ≠ x + 1 | `FiniteDimensional K A` needed and present | Carried from [previous review, row 6][previous]; unchanged statement |
| 7 | Injectivity of f (line 563–564) | B simple, A nontrivial | ker f is a two-sided ideal ≠ ⊤ (f(1) = 1 ≠ 0), so ker f = ⊥ | finite dimension of B derivable, not a hypothesis | Carried from [previous review, row 7][previous]; unchanged statement |
| 8 | Conjugation orientation (line 65) | ℍ, u = 1 + i, b = j | u j u⁻¹ = (1+i) j (1−i)/2 = (j + k)(1 − i)/2 = (j − j i + k − k i)/2 = (j + k + k − j)/2 = k; Stacks' f = x g x⁻¹ is ours with u = x⁻¹ | consistent with Lean line 34 | Carried from [previous review, row 8][previous]; unchanged statement |
| 9 | Opposite convention (Check line 70) | ℍ, right multiplications | (rᵢ ∘ rⱼ)(1) = rᵢ(j) = j i = −k; r_{ij}(1) = k | End_ℍ(ℍ) = ℍᵒᵖ, as `IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite` needs | Carried from [previous review, row 9][previous]; unchanged statement |
| 10 | `centralizer_isSimpleRing`, count, `centralizer_centralizer`: B = K ⊂ M₂(K) | | C = M₂(K) simple; 1·4 = 4; C(C) = K = B | sound | Carried from [previous review, row 10][previous]; unchanged statement |
| 11 | B = M₂(K) ⊂ M₂(K) | | C = K; 4·1 = 4; C(C) = M₂(K) = B | sound | Carried from [previous review, row 11][previous]; unchanged statement |
| 12 | B = ℂ ⊂ ℍ over ℝ (Checks 611, 644) | | C = ℂ simple, Z(C) dim 2; 2·2 = 4; C(C) = ℂ; mult. ℂ ⊗ ℂ → ℍ has image ℂ, dim 2 ≠ 4 | all three headlines hold; factorization needs B central (Lemma 7.2) | Carried from [previous review, row 12][previous]; unchanged statement |
| 13 | B = diagonal K × K ⊂ M₂(K) (Check 613) | not simple | C = K × K not simple; 2·2 = 4; C(C) = K × K | simplicity of B needed for (1) | Carried from [previous review, row 13][previous]; unchanged statement |
| 14 | B = upper triangular ⊂ M₂(K) (Checks 543, 615) | not simple, dim 3 | C = K; 3·1 = 3 ≠ 4; C(C) = M₂(K) ≠ B; B ⊗ Aᵒᵖ not simple | simplicity of B needed for the count and (3) | Carried from [previous review, row 14][previous]; unchanged statement |
| 15 | B = L = K(s), s² = t, K = 𝔽₂(t), regular embedding in M₂(K) (Checks 618, 647) | inseparable | C = End_L(L) = L, basis (1, s); 2·2 = 4; C(C) = L | no separability hypothesis needed | Carried from [previous review, row 15][previous]; unchanged statement |
| 16 | B = M₂(K) ⊗ 1 ⊂ M₄(K), char 2, 3 | | C = 1 ⊗ M₂(K); 4·4 = 16; C(C) = B; M₂ ⊗ M₂ → M₄ iso (dims 16 = 16, simple source) | sound in every characteristic | Carried from [previous review, row 16][previous]; unchanged statement |
| 17 | A = K, B = K | degenerate | C = K; 1·1 = 1; C(C) = K | sound | Carried from [previous review, row 17][previous]; unchanged statement |
| 18 | A = ℂ over ℝ (not central), B = ℝ (Checks 620, 649) | | C = ℂ; 1·2 = 2; C(C) = ℂ ≠ ℝ | centrality of A needed for (3) | Carried from [previous review, row 18][previous]; unchanged statement |
| 19 | Zero algebra | | not `IsSimpleRing`; `Nontrivial A` in the native count | excluded | Carried from [previous review, row 19][previous]; unchanged statement |
| 20 | §5.3 cancellation (line 630) | | dim Cₐ(B) ≥ 1 since Cₐ(B) ∋ 1 ≠ 0 in nontrivial A; B ≤ C(C) by `le_centralizer_centralizer`; equal finrank ⇒ equal by `eq_of_le_of_finrank_eq` (needs `FiniteDimensional K ↥E`, E ≤ A) | route sound | Carried from [previous review, row 20][previous]; unchanged statement |
| 21 | §5.2 route (line 598–601) | R = B ⊗ Aᵒᵖ, M = A | R simple (`tensorProduct_of_isCentral_right`: B simple, Aᵒᵖ central simple), finite over K hence Artinian (`IsArtinianRing.of_finite`); M nontrivial, finite over R; `moduleEnd` gives End_R M simple; `centralizerAlgEquivEnd` transports | route sound | Carried from [previous review, row 21][previous]; unchanged statement |
| 22 | Positivity of blocks (Check 73, 314, 335) | K vs K × M₀(K) | block counts 1 vs 2; `NeZero (d i)` excludes the second | sound | Carried from [previous review, row 22][previous]; unchanged statement |
| 23 | Jacobson Checks (194–198) | K, K × K, K[ε]/(ε²), T₂(K) | radicals 0, 0, (ε), strictly upper; (ε)² = 0, N² = 0; quotients K, K × K; T₂(K) not semisimple | sound | Carried from [previous review, row 23][previous]; unchanged statement |
| 24 | §4.3 map (Check 504–506) | ℍ, i ⊗ iᵒᵖ | x ↦ i x i: 1 ↦ i² = −1; j ↦ i j i = k i = j; conjugation x ↦ i x i⁻¹ fixes 1 | convention "multiply by b on the right" is the pinned `tensorOpAlgEquivEnd` | Carried from [previous review, row 24][previous]; unchanged statement |
| 25 | Degrees, tensor, index (Checks 485–489, 745–751) | K, M₂(K), ℍ, M₂(ℍ), ℍ ⊗ ℍ | dims 1, 4, 4, 16 = 1², 2², 2², 4²; deg(ℍ ⊗ ℍ) = 4, M₄(ℝ) dim 16; (deg, index) = (1,1), (2,1), (2,2), (4,2); ℂ/ℝ dim 2 not a square | sound; centrality essential to the square law | Carried from [previous review, row 25][previous]; unchanged statement |
| 26 | Brauer laws and representatives (Checks 688–694) | Br(ℝ) | [ℍ]² = [M₄(ℝ)] = 1; [ℍᵒᵖ] = [ℍ]⁻¹ = [ℍ]; [ℝ][ℝ] = [ℝ]; rep of [M₂(ℍ)] is ℍ, of [M₃(ℝ)] is ℝ | `mk_tensorProduct`, `mk_base`, `mk_op` exclude the swapped law | Carried from [previous review, row 26][previous]; unchanged statement |
| 27 | Dimension sums and Schur controls (Checks 242–247, 381–385, 785–787) | M₂(k) on k²; k(t); ℂ over ℝ; k[S₃]; 𝔽₂[C₂] | dim End_A S = 1 vs dim End_k S = 4; End = k(t) infinite; End_ℂ ℂ = ℂ dim 2; 1 + 1 + 4 = 6; (g − 1)² = 0, g − 1 ≠ 0 | contract hypotheses necessary | Carried from [previous review, row 27][previous]; unchanged statement |
| 28 | §2.1 chosen presentation | zero ring, K, K × K | block counts 0, 1, 2; degrees (), (1), (1,1); products have dimensions 0, 1, 2 | Correct new qualified name; locator 291 | Fresh; naming repair partly complete |
| 29 | §2.2 enumeration | K × K, M₂(K), zero ring | (1,0) acts by 1 versus 0 on the two K × K ideals; M₂(K) column ideals are equivalent, giving 1 class; zero ring gives 0 classes | Class counts 2, 1, 0 equal block counts | Fresh; semisimplicity correct, cited name fails |
| 30 | §2.3 count for simple coefficients | M₂(K) as M₁(M₂(K)) and M₂(K) | 1 block = 1 block; coefficient M₂(K) is simple but E₁₁ is nonzero noninvertible | General simple-factor count applies; division-ring specialization rejects M₂(K) as coefficient | Fresh; corrected generic supplier preserves generality |
| 31 | §2.3 uniqueness and positive sizes | M₂(K) × K versus K × M₂(K); K versus K × M₀(K) | transposition gives sizes 2 = 2 and 1 = 1; zero-block padding gives counts 1 ≠ 2 | Fin-indexed positive theorem supports first case and excludes padding | Fresh; correct namespace and actual signature |
| 32 | §3.1 non-simple semisimple modules | R = K, M = K² | End_K(K²) = M₂(K), dimension 4; its commutant is scalar K, dimension 1 = dim K; map sends a to aI | Bijective although M has length 2 and is not simple | Fresh; expanded contract correct |
| 33 | §3.1 nontriviality and faithfulness | M = 0 over K; M = K under K × K → K | K → End(0) has kernel K; first projection has kernel 0 × K and image K | First excluded by nontriviality; second excluded by simple-ring hypothesis | Fresh; hypotheses distinguish wrong extension |
| 34 | §6.2 embedded field of prescribed degree | D = K, L = K; D = ℍ/ℝ, L = ℂ; candidate L = ℝ | degrees 1 = deg K and 2 = deg ℍ; K ⊗ K = M₁(K), ℂ ⊗ ℍ = M₂(ℂ); ℝ ⊗ ℍ = ℍ, not M₂(ℝ) | First two satisfy all conditions; last has degree 1 ≠ 2 and fails splitting | Fresh; matches pinned existential |
| 35 | §6.2 degree implies maximality | ℂ ⊂ ℍ; ℝ ⊂ ℍ | if ℂ ⊆ E ⊆ ℍ is a field, 2 ≤ dimℝ E ≤ 2, so dimℂ E = 1 and E = ℂ; ℝ has dimension 1 < 2 and is properly contained in ℂ | Correct implication; scalar subfield excluded | Fresh; Stacks degree/centralizer criterion |
| 36 | Family-index inventory | component acceptance test | 3 declarations = conjugacy + 2 centralizer claims; Brauer declarations 0 versus claimed ≥ 1 | R02 persists | Fresh inventory witness |

## Not verifiable

- None of the changed claims lacks an accessible source or pinned declaration. The sole cited text was obtained legally and its version and relevant locators verified. No new missing-reference request is needed.
- The unchanged full source sample, exhaustive ownership audit and one-tactic experiments are carried forward from the previous report as required for this incremental review; they are not presented as fresh full-review work.

## Source issues

- **Misprint** in stacks-brauer at Proposition 8.5 (tag 0752), printed p. 7, stacks-brauer line 304: the source says the final consequence using a spelling of splitting that omits its l; it should be splitting field; affects nothing. Confirmed in the [official tag text](https://stacks.math.columbia.edu/tag/0752).
