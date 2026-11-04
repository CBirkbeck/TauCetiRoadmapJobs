# Review of SemisimpleAlgebras (pull request #989 at 3e33c66)
Folder: `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/`

**Verdict:** accepted

Incremental re-review of 17 changed lines since 0fbb5b6. No findings remain. The previous build failure is repaired; the gate, targeted build, direct elaboration, and signature probes pass. This is an AI review for a human's final approval, not an approval or merge.

## Previous findings

- R01 — repaired: `Suggested.lean:2–3,29` imports the native Brauer group and splitting modules and exports `IsSplittingField`. The targeted build now succeeds for both modules. `README.md:180–183,827–831` documents the compatibility interface; no new construction or hypothesis change was introduced.

## Verified sound

**Scope and pins.** Checked HEAD `3e33c6626655bc76c9928cf8c5b83abbd3db9032`, the actual diff against `0fbb5b6`, and the outside-folder diff against `origin/main`. Exactly 15 insertions and 2 deletions affect this folder; there are no changes outside it, including the family index. The three theorem declarations are byte-identical to the previous head. The package checkouts match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The pull-request worktree remains clean.

**Gate and elaboration.** The worker reports all counters zero, including `build=0`. My independent standalone gate reports:

    gate SemisimpleAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The standalone gate does not build. I separately ran `lake build TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras.Suggested TauCetiRoadmap.QuadraticFormInvariants.Suggested`: exit 0, “Build completed successfully (9593 jobs).” The two requested modules have respectively 3 and 152 `sorry` warnings. Direct `lake env lean` elaboration of this roadmap's `Suggested.lean` also exits 0 with exactly its three expected `sorry` warnings.

The dependency command gives:

    depcheck: 204 roadmaps, 1554 edges, 0 problem(s)

There is no UPWARD or CYCLE line. No supplier, target dependency, source locator, or mathematical hypothesis was added by the diff. The compatibility imports are library dependencies, not a reverse dependency on QuadraticFormInvariants.

**Changed interface and its native owners.** Opened these declarations at the pins:

| Declaration | File and line | Content verified |
|---|---|---|
| `CSA`, `IsBrauerEquivalent`, `BrauerGroup` | `Mathlib/Algebra/BrauerGroup/Defs.lean:40,56,99` | Finite-dimensional central simple algebras; matrix stabilization by positive sizes; the quotient carrier. |
| `TauCeti.BrauerGroup.instCommGroup` | `TauCeti/Algebra/BrauerGroup/Group.lean:174` | Real instance body on `BrauerGroup.{u,u} K`; tensor multiplication, base-field identity, opposite-algebra inverse. |
| `TauCeti.BrauerGroup.mk_tensorProduct`, `mk_base`, `mk_op` | `TauCeti/Algebra/BrauerGroup/Group.lean:195,200,206` | The three operation conventions agree with the README. |
| `TauCeti.Algebra.IsSplittingField` | `TauCeti/Algebra/CentralSimple/Splitting.lean:120` | Explicit `K A L`; fields K and L, a K-algebra A; existence of a matrix-algebra equivalence after base change. No simplicity or nonzero-size condition is bundled into the predicate. |

A scratch copy with `#check @name` for all three headlines, the exported predicate, and the group instance elaborates. The three headline signatures retain ambient centrality, simplicity, finite dimension, and source/subalgebra simplicity. Their universes remain independent. A scratch `rfl` proof identifies the exported predicate with `TauCeti.Algebra.IsSplittingField` for arbitrary permitted K, A, L; a scratch `inferInstance` obtains `CommGroup (BrauerGroup.{u,u} K)`. The export is name resolution to the native declaration, not a second predicate or a new admitted definition.

**Consumer and cross-roadmap citations.** Distinguished two versions of the consumer. At this PR head, `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:5` imports this module, line 1583 opens its namespace, lines 1588–1589 need the group instance, and lines 1603 and 1613 use the short splitting-predicate name. These are the exact previously failing sites; the whole consumer now builds. The PR makes no change to that consumer.

Current main is `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`. Its consumer now names Tau Ceti directly (`Suggested.lean:103,1674,1684`), while its README still records the semisimple-algebra supply contract at lines 749–759. Thus the new compatibility prose describes the consumer at this PR head; it introduces no ownership conflict with main's direct consumption. An unrelated revision of that existing roadmap was not treated as a supplier.

Re-resolved all eight named cross-roadmap relationships against the available authoritative text:

| Roadmap | Witness | Relationship |
|---|---|---|
| CharacterTheory | `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:217–222,347` on main | Layers 1–2 supply Schur and the block dictionary; Layer 2 owns the character-theoretic comparison. |
| InductionRestriction | `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:517–519` on main | Explicit consumption of the simple-module/block dictionary. |
| QuiverRepresentations | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:13–16,135,287` on main | Radical and Wedderburn foundation. |
| LieHighestWeight | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:255–261` on main | Isotypic theory through the enveloping-algebra dictionary. |
| QuadraticFormInvariants | `TauCetiRoadmap/QuadraticFormInvariants/README.md:749–759` on main, and the PR-head consumer sites above | Tensor/opposite theory, group law, and splitting. |
| ClassicalArithmeticCompletion | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:251–253` on main | Layers 1–2, 5, 6, including finite separable and maximal-subfield splitting. |
| FaltingsFinitenessAndIsogenyTheoremsPartII | `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:106–108` at the supplied open head | Layers 2–3 and 6, including index. |
| ReductiveGroups | `TauCetiRoadmap/ReductiveGroups/README.md:176–182` on main | Layer 1 owns the representation/comodule comparison, not a prerequisite here. |

The object search using `roadmaps grep` for `IsSplittingField` and `instCommGroup` returned 19 matching lines across main and open work. The relevant matches consume the native predicate/instance; this change introduces no construction, new theorem name, or duplicate owner. Broader ownership searches for unchanged objects are carried forward from the previous review. The four worker citation leads are false missing-name reports at the actual pin: I opened `TauCeti/RingTheory/Semisimple/Wedderburn/Blocks.lean:148,180` and `TauCeti/RingTheory/Semisimple/BlockCount.lean:77,252`; all four named declarations exist.

**Headlines and padding.** The README's owned headlines are §5.1 simple-source Skolem–Noether, §5.2 simplicity of the centralizer of a simple subalgebra, and §5.3 double centralizers. All three are present, at `Suggested.lean:38,47,55`; none is unstatable. No definition or theorem was added. A scratch probe confirms that none closes by `simp`, `rfl`, or `infer_instance`, even with the new imports. The native-one-lemma comparisons from the previous review remain applicable: `TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107–110` and `Centralizer.lean:367–374,446–447` require centrality of B. I reopened these binders; that assumption is absent from our more general source/subalgebra statements. No padding finding results.

**Sources and seeded sample.** No source locator or sampled mathematical passage changed. Under the incremental brief, the previous report's checks of §§0.1, 0.2, 1.3, 2.1–2.4, 3.1, 4.3–4.4, 5.1–5.2, 6.1–6.2, and 6.4 (15 sampled sections) carry forward. The changed references to the group and splitting predicate connect to §§6.1–6.2, whose native definitions and conventions were checked afresh above. No new literary source is needed for the imports or export. I did not represent the unchanged source audit as a new reading.

**Adversarial table.** Rows 1–41 retain the mathematical values from the immediately previous report, each cited individually. Row 49 carries its unchanged family-index check. Rows 42–48 are fresh checks of the changed interface and its dependent statements; no headline statement changed.

[previous]: PRREVIEW-SemisimpleAlgebras~6.md

| # | Statement | Instances | Values computed | Result | Change / evidence |
|---|---|---|---|---|---|
| 1 | `skolemNoether`, f = g | any B, A | u = 1: 1·f(b)·1⁻¹ = f(b) | sound | Carried from [previous report, row 1][previous] |
| 2 | `skolemNoether`, B = K, A = M₂(K) | scalar maps | A as right A-module = two copies of the row module: dim 4, length 2 | sound | Carried from [previous report, row 2][previous] |
| 3 | `skolemNoether`, A = B = M₂(K), g = conjugation by P = E₁₂ + E₂₁ | E₁₁ | P E₁₁ P⁻¹ = E₂₂ = g(E₁₁), u = P | sound | Carried from [previous report, row 3][previous] |
| 4 | `skolemNoether`, ℂ ⊂ ℍ over ℝ, f inclusion, g conjugation | i | j i j⁻¹ = −i; Z(B) has dim 2 | sound without centrality of B | Carried from [previous report, row 4][previous] |
| 5 | Same with ambient A = ℂ | u ∈ ℂˣ | u i u⁻¹ = i ≠ −i | centrality of A needed and present | Carried from [previous report, row 5][previous] |
| 6 | Infinite-dimensional ambient A₁(ℚ) | f = id, g: x ↦ x + 1 | units are ℚˣ, u x u⁻¹ = x ≠ x + 1 | `FiniteDimensional K A` needed and present | Carried from [previous report, row 6][previous] |
| 7 | Injectivity of f | B simple, A nontrivial | ker f two-sided, f(1) = 1 ≠ 0, so ker f = ⊥ | finite dimension of B derivable | Carried from [previous report, row 7][previous] |
| 8 | Conjugation orientation | ℍ, u = 1 + i, b = j | u j u⁻¹ = k; Stacks' f = x g x⁻¹ is ours with u = x⁻¹ | consistent with Lean line 42 | Carried from [previous report, row 8][previous] |
| 9 | Opposite convention | ℍ, right multiplications | (rᵢ ∘ rⱼ)(1) = j i = −k; r_{ij}(1) = k | End_ℍ(ℍ) = ℍᵒᵖ | Carried from [previous report, row 9][previous] |
| 10 | Centralizer headlines, B = K ⊂ M₂(K) | | C = M₂(K) simple; 1·4 = 4; C(C) = K | sound | Carried from [previous report, row 10][previous] |
| 11 | B = M₂(K) ⊂ M₂(K) | | C = K; 4·1 = 4; C(C) = M₂(K) | sound | Carried from [previous report, row 11][previous] |
| 12 | B = ℂ ⊂ ℍ over ℝ | | C = ℂ, Z(C) dim 2; 2·2 = 4; C(C) = ℂ; ℂ ⊗ ℂ → ℍ has image of dim 2 ≠ 4 | headlines hold; factorization needs B central | Carried from [previous report, row 12][previous] |
| 13 | B = diagonal K × K ⊂ M₂(K) | not simple | C = K × K not simple; C(C) = K × K | simplicity of B needed | Carried from [previous report, row 13][previous] |
| 14 | B = upper triangular ⊂ M₂(K) | dim 3 | C = K; 3·1 = 3 ≠ 4; C(C) = M₂(K) ≠ B | simplicity of B needed | Carried from [previous report, row 14][previous] |
| 15 | B = K(s), s² = t, K = 𝔽₂(t) ⊂ M₂(K) | inseparable | C = L, basis (1, s); 2·2 = 4; C(C) = L | no separability needed | Carried from [previous report, row 15][previous] |
| 16 | B = M₂(K) ⊗ 1 ⊂ M₄(K), char 2, 3 | | C = 1 ⊗ M₂(K); 4·4 = 16; C(C) = B | sound | Carried from [previous report, row 16][previous] |
| 17 | A = K, B = K | degenerate | C = K; 1·1 = 1; C(C) = K | sound | Carried from [previous report, row 17][previous] |
| 18 | A = ℂ over ℝ, B = ℝ | | C = ℂ; 1·2 = 2; C(C) = ℂ ≠ ℝ | centrality of A needed | Carried from [previous report, row 18][previous] |
| 19 | Zero algebra | | not `IsSimpleRing` | excluded | Carried from [previous report, row 19][previous] |
| 20 | §5.3 cancellation | | dim Cₐ(B) ≥ 1; B ≤ C(C); equal finrank ⇒ equal | route sound | Carried from [previous report, row 20][previous] |
| 21 | §5.2 route | R = B ⊗ Aᵒᵖ, M = A | R simple, Artinian; End_R M simple; transport | route sound | Carried from [previous report, row 21][previous] |
| 22 | Positivity of blocks | K vs K × M₀(K) | counts 1 vs 2; `NeZero (d i)` excludes the second | sound | Carried from [previous report, row 22][previous] |
| 23 | Jacobson Checks | K, K × K, K[ε]/(ε²), T₂(K) | radicals 0, 0, (ε), strictly upper; quotients K, K × K | sound | Carried from [previous report, row 23][previous] |
| 24 | §4.3 map | ℍ, i ⊗ iᵒᵖ | 1 ↦ −1, j ↦ j; conjugation fixes 1 | convention is the pinned `tensorOpAlgEquivEnd` | Carried from [previous report, row 24][previous] |
| 25 | Degrees, tensor, index | K, M₂(K), ℍ, M₂(ℍ), ℍ ⊗ ℍ | dims 1, 4, 4, 16; (deg, index) = (1,1), (2,1), (2,2), (4,2) | sound | Carried from [previous report, row 25][previous] |
| 26 | Brauer laws and representatives | Br(ℝ) | [ℍ]² = 1; [ℍᵒᵖ] = [ℍ]; rep of [M₂(ℍ)] is ℍ | sound | Carried from [previous report, row 26][previous] |
| 27 | Dimension sums and Schur controls | M₂(k) on k²; k(t); ℂ/ℝ; k[S₃]; 𝔽₂[C₂] | 1 vs 4; infinite; dim 2; 1 + 1 + 4 = 6; (g − 1)² = 0 | hypotheses necessary | Carried from [previous report, row 27][previous] |
| 28 | §3.1 non-simple semisimple modules | R = K, M = K² | End = M₂(K) dim 4; commutant K dim 1 | bijective | Carried from [previous report, row 28][previous] |
| 29 | §3.1 nontriviality and faithfulness | M = 0; M = K under K × K | kernels K and 0 × K | excluded by hypotheses | Carried from [previous report, row 29][previous] |
| 30 | §6.2 embedded field of prescribed degree | D = K; D = ℍ, L = ℂ; L = ℝ | degrees 1, 2; ℝ ⊗ ℍ = ℍ not split | sound | Carried from [previous report, row 30][previous] |
| 31 | §6.2 degree implies maximality | ℂ ⊂ ℍ; ℝ ⊂ ℍ | dim bounds force E = ℂ; ℝ properly contained | sound | Carried from [previous report, row 31][previous] |
| 32 | §2.1 presentation structure | zero ring, K, K × K | block counts 0, 1, 2; degrees (), (1), (1,1) | sound | Carried from [previous report, row 32][previous] |
| 33 | §2.2 matrix-block enumeration | K × K; M₂(K) | classes 2 = 2 and 1 = 1 | sound | Carried from [previous report, row 33][previous] |
| 34 | §2.2 finite simple-factor enumeration | M₂(K) × K | 2 classes = 2 factors | sound | Carried from [previous report, row 34][previous] |
| 35 | §2.2 empty-family Check | zero ring | 0 simple modules, 0 indices | sound | Carried from [previous report, row 35][previous] |
| 36 | §2.3 division-ring block count | M₂(K) × K vs K × M₂(K); zero ring | 2 = 2; 0 = 0 | sound | Carried from [previous report, row 36][previous] |
| 37 | §2.3 general simple-factor count | M₂(K) vs M₁(M₂(K)) | counts 1 = 1; sizes 2 ≠ 1 | division-ring hypothesis retained | Carried from [previous report, row 37][previous] |
| 38 | §2.3 factor equivalences | transposition | f(X,0) = (0,X); identity permutation fails | sound | Carried from [previous report, row 38][previous] |
| 39 | §2.3 empty matching | two empty products | 1 bijection, 0 equations | sound | Carried from [previous report, row 39][previous] |
| 40 | §2.3 full uniqueness | M₂(K) × K vs K × M₂(K) | sizes 2 = 2, 1 = 1; identity would need 2 = 1 | sound | Carried from [previous report, row 40][previous] |
| 41 | §2.3 positivity and coefficient controls | K vs K × M₀(D); M₂(K) vs M₁(M₂(K)) | 1 ≠ 2; 2 ≠ 1 | hypotheses present | Carried from [previous report, row 41][previous] |
| 42 | Imported Brauer multiplication and identity (§6.1; README 180–183) | A = M₂(K), B = M₃(K), K = 𝔽₂ or 𝔽₃ | dim(A ⊗ B) = 4·9 = 36 = dim M₆(K); [A][B] = 1·1 = 1 = [M₆(K)]; [K] = 1 | sound; multiplicative convention preserved | Fresh; native instance and three operation laws |
| 43 | Imported inverse convention | A = ℍ over ℝ | [ℍᵒᵖ] = [ℍ]⁻¹ = [ℍ]; [ℍ]² = [M₄(ℝ)] = 1; dimensions 4·4 = 16 | sound; inverse is opposite algebra | Fresh; confirms the imported operation on the unchanged real example |
| 44 | Exported splitting predicate (§6.2) | A = K; A = M₂(K), L/K arbitrary field extension | L ⊗ K ≃ M₁(L), dimensions 1 = 1; L ⊗ M₂(K) ≃ M₂(L), dimensions 4 = 4; exported/native predicates both true | sound; same source, target, and parameter order | Fresh; alias equality also proved by `rfl` |
| 45 | Predicate's permitted zero-size case | A = zero K-algebra | L ⊗ A = 0 ≃ M₀(L); dimensions 0 = 0; both predicates true with n = 0; `IsSimpleRing A` false | sound; raw predicate does not silently assert CSA hypotheses | Fresh; native body and headline assumptions |
| 46 | Split versus nonsplit control | A = ℍ over ℝ; L = ℝ or ℂ | Over ℝ, dimension forces n = 2 but ℍ is division and M₂(ℝ) has E₁₁E₂₂ = 0 with both factors nonzero, so both predicates false. Over ℂ, ℂ ⊗ ℍ ≃ M₂(ℂ), dimensions 4 = 4, so both true | sound; export preserves the discriminating condition | Fresh; native predicate applied to the unchanged quaternion example |
| 47 | Compatibility claims in README 180–183,827–831 and module docstring 22–24 | PR-head QuadraticFormInvariants | Required interfaces 2; supplied interfaces 2; previous build errors 26, current errors 0; consumer `sorry` warnings 152 | repaired | Fresh targeted build; current main's direct native names separately resolved |
| 48 | Three headline signatures under added imports | All three declarations; arbitrary permitted K, A, B | Changed theorem bodies/signatures 0; omitted required binders 0; direct elaboration errors 0; `sorry` warnings 3; trivial-tactic successes 0/3 | sound | Fresh signature and padding probes |
| 49 | Family-index deletion remains intact | Family-direct files against main | Files changed by this PR outside its folder: 0; obsolete family-index declaration claims: 0 | repaired and unchanged | Carried from [previous report, row 44][previous], scope diff rechecked |

## Not verifiable

- None in the changed material. The unchanged source audit and broader mathematical ownership audit are carried forward from the previous review rather than repeated. No missing-reference request is needed for this repair.

## Source issues

- **Misprint** in stacks-brauer at Proposition 8.5 (tag 0752), printed p. 7, stacks-brauer line 304: the source says the final consequence using a spelling of splitting that omits its l; it should be splitting field; affects nothing.

This source issue is carried forward from the previous report. No new source issue was found.
