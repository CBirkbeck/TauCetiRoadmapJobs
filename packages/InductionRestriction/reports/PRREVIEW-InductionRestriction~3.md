# Review of InductionRestriction (pull request #2639 at 61fab9d)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** Accepted. This head repairs the one finding of the previous round. §7.5 now cites Tau Ceti's multiplicity action, tensor representation and evaluation map, which hold over every commutative ring. Its target is only what the pin lacks: evaluation `V ⊗_k Hom_N(V, W) → W` is bijective over any field under scalar endomorphisms. That statement holds on every instance tried, and each of its two hypotheses is needed. The earlier small corrections and format notes are also repaired. One small correction and one format note remain, neither blocking: a supplier-contract parenthesis understates the hypotheses of `tensorRepEquiv`, and a *Needs:* line is incomplete. For the humans: the most-cited text, Isaacs, could not be read legally.

## C01 — The From Tau Ceti list gives `tensorRepEquiv` only the hypotheses of `evalTensor_injective`

Someone reading only the contract would think `V ⊗ Hom_N(V, W) ≅ W` is available for every `W` over an algebraically closed field. In the Layer 7 list under From Tau Ceti (README lines 1022–1023), `TauCeti.IsProjectiveInertiaExtension.evalTensor_injective` and `TauCeti.IsProjectiveInertiaExtension.tensorRepEquiv` share the parenthesis "(algebraically closed, `V` simple)". At the pin, `tensorRepEquiv` (`Clifford/TensorFactorization.lean` line 329) also takes `[σ.IsIrreducible]` and a nonzero `N`-map `φ`, as `evalTensor_surjective` does (line 292). Without these the equivalence fails: for `W` not lying over `V`, `Hom_N(V, W) = 0`. The body of §7.5 (lines 696–699) has the hypotheses right. Would add, after `tensorRepEquiv`: "and, for `tensorRepEquiv`, `W` irreducible with a nonzero `N`-map from `V`".

## N01 — The *Needs:* line of §7.5 (line 707) omits two declarations the tensor-factorization paragraph uses

These are `TauCeti.IsProjectiveInertiaExtension.isProjectiveRep_homAction`, which appears in the type of `evalTensor`, and `FDRep.cliffordBalancedEvaluationEquiv`, which the alternative route for finite-dimensional `W` uses. Both are already in the supplier contracts.

## Questions for the author

- §7.5 (line 673) and §7.6 (line 731) state results over every field, and each cites Isaacs, Ch. 11. Isaacs works with complex characters, which is why §§5.2–5.3 now qualify their Ch. 6 citations. Would "for complex representations" fit the Ch. 11 citations too? Separately, which result of Curtis–Reiner §11 gives the correspondence of §5.3 over an arbitrary field? Neither text could be read legally (AMS and Wiley paywalls).

## Previous findings

- R01 — repaired: "Prove, over any field and under `hScalar`, that evaluation `V ⊗_k Hom_N(V, W) → W` is bijective for every representation `W` of `T` whose restriction to `N` is semisimple and `V`-isotypic" (lines 699–701). The contract parentheses are split, with one slip left (C01).
- C01 — repaired: "Part II, §§9–12 (the ring `R(G)` and Artin's theorem in Ch. 9, Brauer's theorem in Ch. 10, Brauer's characterization of characters in §11.1, realizability over cyclotomic fields in §12.3)" (lines 1040–1042).
- C02 — repaired: "Tau Ceti proves two clauses more generally: `Ind U` lies over `V` over every field (`FDRep.liesOver_indFDRep_of_inertia`), and induction is injective over every field of characteristic zero" (lines 456–458). Both names are in the *Needs:* line.
- C03 — repaired: the description now reads "The version on main consumed SemisimpleAlgebras Layers 1–2 … so the revision drops its only roadmap supplier."
- N01 — repaired: "`Representation.IsIrreducible`, `Representation.IsSemisimpleRepresentation`, Maschke's theorem" (line 928).
- N02 — repaired: `AbstractUCE.relationsInsideDerived` is named in §7.1 (line 546), and `projection_mk` is deleted from `Suggested.lean`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §7.5 tensor factorization (target) | `Q₈ ⊃ {±1}` over `ℝ`, `V` sign, `W = ℍ`; `W = 0`; `W = V^(ℕ)` | `dim Hom_N(V, ℍ) = 4`, `1·4 = 4 = dim ℍ`; `0 = 0`; `Hom = k^(ℕ)`, since `V` is finitely generated | bijective, including non-closed `k` and infinite-dimensional `W` | none |
| §7.5, hypotheses needed | `A₃ ◁ S₃` over `ℚ`, `V = ℚ(ω)`, `W` standard; `C_p` over `𝔽_p`, `V = 1`, `W` a Jordan block | `2·2 = 4 → 2`, not injective (no `hScalar`); `Hom = W^N`, dimension 1, image `1 ≠ 2` (not semisimple) | both hypotheses used | none |
| §7.5 route by density | Mathlib `RingTheory/SimpleModule/Basic.lean` 558, 573 | needs `IsSemisimpleModule k[N] V` and `Module.Finite (End V) V`; `End V = k` and `dim V < ∞` give both; codomain is `End_k V` | route sound | none |
| §7.5 cited Tau Ceti hypotheses | `Clifford/TensorFactorization.lean` 86, 122, 281, 292, 299, 303, 329; `Obstruction.lean` 72, 240 | `tensorRep`, `homAction`, `evalTensor` over `CommRing`; onto: `Field`, `σ` irreducible, `φ ≠ 0`; injective: `IsAlgClosed`, `Simple`; `tensorRepEquiv` needs all four | contract slip on `tensorRepEquiv` | C01 |
| §5.3 clauses the pin proves | `LiesOver.lean` 40–48; `Injectivity.lean` 50–59; `Correspondence.lean` 217–226; `Surjectivity.lean` 84, 135; `Classes.lean` 59, 125 | lies over: `Field`, finite index; injective: `Finite G`, `CharZero`, `V, A, B` simple; simplicity and surjectivity: `IsAlgClosed`, `CharZero` only | "what this target adds" is true | none |
| §5.3 in positive characteristic | `S₃ ⊃ A₃` over `𝔽₄`, `λ` of order 3 | `λ^(12) = λ² ≠ λ`, so `T = A₃`; `Ind λ` simple of dimension 2, outside the pinned `CharZero` | new content confirmed | none |
| §7.1 perfection step | `G = A₅`; `G = 1`; `G = C₂ × C₂` | `[ar, bs] ≡ [a, b]` mod `[F, R]` for `r, s ∈ R`; `F = ℤ`, `U = 1`; `U ≅ H₂ = C₂`, `[U, U] = 1 ≠ U` | holds; perfection of `G` needed | none |
| §7.1 remark on Weibel | Weibel2013 lines 1954–1959, 1976–1978 | Lemma 5.3.3 assumes `X` perfect; the proof of 5.4 invokes it for `[F,F]/[R,F]` without showing perfection | remark true | none |
| §7.1 `kernelMap` (Lean body changed) | `G = 1`; `G = C₂ × C₂` | `1 → 1`; `(R ∩ [F,F])/[F,R] = C₂` = kernel, as the image of `U` is `[G,G] = 1`; elaborates without `projection_mk` | holds | none |

The rows for statements this change leaves untouched stand as in the previous review, of `20870e7`.

- Source locators checked against the text: Weibel2013 lines 1949–1981 (Lemmas 5.3.2–5.3.3, Example 5.3.4, Theorem 5.4, p. 37), for the new §7.1 remark. The Isaacs, Curtis–Reiner and Alperin–Bell locators of the changed §§5.2, 5.3 and 7.5 cannot be read.
- Library declarations opened at the pins:
  - Tau Ceti: `Clifford/TensorFactorization.lean` 86–344; `Clifford/LiesOver.lean` 40, 45; `Clifford/Injectivity.lean` 50, 54; `Clifford/Correspondence.lean` 217, 226; `Clifford/Surjectivity.lean` 84, 135; `Clifford/Classes.lean` 59, 125; `Clifford/ProjectiveCorrespondence.lean` 136, 149; `Clifford/Obstruction.lean` 72, 87, 240, 309; `Clifford/Extension/Evaluation.lean` 117, 246; `Induction/Inertia.lean` 86, 116.
  - Mathlib: `RingTheory/SimpleModule/Basic.lean` 573; `RepresentationTheory/Semisimple.lean` 34; `RepresentationTheory/FDRep.lean` 63.
- `#check @` in one probe file: the 28 declarations of `Suggested.lean` and the 15 supplier names the changed passages add. All elaborate, with the hypotheses the README gives except as in C01. `FDRep.cliffordCorrespondence` was read in its source.
- Cross-roadmap: ModularCharactersAndBlocksPartII, at its open head (lines 398–412, 440–456, 480–486), consumes the algebraically closed tensor factorization and cites InductionRestriction Layers 5 and 7. It owns no general-field version.
- Automatic checks: all passed at this head; a rerun of the gate gave every count 0. Dependency check: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gives 14 `sorry` warnings and nothing else. No statement changed: only two docstrings, the deletion of `projection_mk` and the body of `kernelMap`. Last round's one-tactic probe therefore stands: none of the 14 closes.
- Changes outside the folder: none, and none in the family index. The description agrees with the head (28 Checks in 16 sections, counted).

Overlap check: this round I read ModularCharactersAndBlocksPartII at its open head (its Clifford and tensor-factorization passages). The previous round read ArtinRepresentations, MetaplecticAutomorphicFormsPartII and CohomologyOfGroups at their open heads, and ModularInduction, CharacterTheory and FiniteGroupInvariants on main. Nothing is shared: ModularCharactersAndBlocksPartII consumes Layers 5 and 7, and this roadmap owns general-field Clifford theory, including the §7.5 tensor factorization. The open heads of ModularInduction and CharacterTheory were not available, so ownership against them was not checked.

Source independence: changed passages only. 4 passages were compared with 1 source, Weibel2013, and with the Tau Ceti docstrings they summarize: the §7.1 perfection step and remark, the §7.5 tensor-factorization paragraph and route, the §5.3 clause sentence, and the Serre entry. Nothing is shared beyond forced terms and theorem labels. The largest share is Isaacs, 7 of 23 locators, which cannot be read. No layer was added, removed or reordered, so the previous round's contents comparison (independent) stands.

Research link: §7.1 is the universal central extension that Weibel (2013, Ch. III, Theorems 5.4–5.5) uses for the Kervaire–Steinberg identification `K₂(R) ≅ H₂(E(R); ℤ)`, which StableHomotopyKTheory §3.29 consumes. Clifford theory and crossed products (Layers 5 and 7) feed block theory in ModularCharactersAndBlocksPartII. This rests on Weibel2013 lines 1970–1992 and the README's Downstream consumers.

## Not verifiable

- Isaacs, *Character Theory of Finite Groups*, Ch. 6 and Ch. 11 (§§5.2, 5.3, 7.5): the previous round found no legal copy (AMS paywall), and the manifest records none.
- Curtis–Reiner, *Methods of Representation Theory I*, §11 (§§5.2, 5.3): Wiley paywall.
- Alperin–Bell, *Groups and Representations*, Ch. 8 (§5.2): Springer paywall.

Automatic checks set aside as false positives:

- The citation resolver listed nine names as found nowhere. Eight are declared in this head's `Suggested.lean` (the `AbstractUCE` names and `Gassmann.normalInvariantEquiv`); the ninth is the roadmap's own namespace.
- The overlap report lists two dropped anchors (old Layer 2.1 and "Abstract universal central extensions"). The paragraph after the Scope table (README lines 889–895) maps both to their new places.
- The signature check flagged a dropped `[Group G]` on `AbstractUCE.derived`, which needs no group structure on `G`.

## Source issues

- **Gap** in Weibel2013 at Ch. III, Recognition Theorem 5.4, p. 37: the proof invokes Lemma 5.3.3 for uniqueness of the map out of `[F,F]/[R,F]` without showing that group perfect, which that lemma requires; it should note that perfect `G` gives `F = [F,F]R`, hence `[F,F] ⊆ [[F,F],[F,F]]·[R,F]`; affects the proof.

## For the human reviewers

- Not tested: Isaacs, *Character Theory of Finite Groups*, has the largest share of locators (7 of 23 in the README body) and could not be read legally. Wording and arrangement were checked against it only at chapter level, from public listings of its contents.
