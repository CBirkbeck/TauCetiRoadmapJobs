# Review of GluedTargetAndDivisionInequality (pull request #2922 at 3cb4be1)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This was an incremental re-review of the 75 lines changed since `788bbfb`: the two small corrections of the previous review are repaired (the locators of 8.20 (vi), 8.20b, 8.22 and 8.23 (b) now name declarations that state the clauses they stand at, and the description names #2954), and the new statements (c1)–(c3) of 8.19e were read clause by clause against the declarations of the formal proof they cite. There are two small corrections (a hypothesis of the formal statement that (c3) leaves out; a sentence of the family index that this roadmap's References do not bear out) and three format notes, none blocking. The scope and the licence of the formal proof remain for the human reviewers.

## C01 — 8.19e (c3) leaves out that the algebraically closed field is algebraic over the fraction field of `T`.

The clause (lines 949–954) takes "a framed point `z` over an algebraically closed field" and concludes that "after a finite extension `T′` of `T`" an integral framed point over `T′` has base change differing from `z` by a triangular change of frame. A base change from `T′` to the field of `z` needs `Frac T′` inside that field, and the declaration cited, `GlobalTheory.IndefiniteRowSideFullHecke.UnusedSlot39.HeckeInt` (`Development/AbelianVarietyTheory/BlockTheory/TwistedDiscreteSeries/HeckeValueIntegrality.lean`), asks for it: in `AtHeckePoints` the field `Ω` comes with `k : T.Fr →ₐ Ω` and the hypothesis `Algebra.IsAlgebraic T.Fr Ω`, and `IsIntegralUpToUnits` gives `T′` with an embedding `Frac T′ → Ω` extending `k`. The statement as written is the formal one with this hypothesis dropped; I did not prove it without the hypothesis.

Write "over an algebraically closed field `Ω` algebraic over `Frac T`" and "a finite extension `T′` of `T` in `Ω`". (The formal change of frame also rescales the trivialising section by a unit of `T′`; "a triangular change of frame and a unit rescaling of the section" would say all of it.)

## C02 — The family index now says that each roadmap's reference to the formal proof names the commit; this roadmap's does not.

The index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 20) gained the sentence "the reference to the formal proof in each roadmap names that commit". The [FormalProof] entry of this README's References (line 2300) gives the repository `https://github.com/leanprover-community/riemann-hypothesis` and no commit, and the README names neither the commit nor the directory `src/` anywhere, so a reader who follows one of its 159 file locators from the reference lands on the repository's current state. Add to the entry "at its first commit `40e56bab026552e089d7afcfeff08d2defb9c005`, under `src/`", as the index gives it.

## N01 — The Conventions, 8.1 and 8.5c cite BernoulliBoundsForClassGroupEigenspaces §6.17, ArithmeticKTheory §6.9, ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6, ArakelovGeometryAndAbelianHeights §§2.9, 4.6 and HeightsAndUnits §0.3 for comparison; none is in the supplier contracts or a Dependencies list. One line saying that they are comparisons and not inputs would let a reader tell them from suppliers (carried; the text is unchanged).

## N02 — The route of 8.20b (line 1455) uses `Φ_th` in `30·|Φ_th|·m·b·x^{2ε}`; the symbol is not in the table of symbols and is defined only in CongruenceModulesOfThetaLifts §7.16a (3). Add "the thick places, `|Φ_th| = |𝒯| ≤ f/2`" at its use (carried; the text is unchanged).

## N03 — 8.19e (c3) (line 957) restricts to `P` "outside `S(1)`"; this is the only occurrence of `S(1)` in the README, and it is defined in RowTowerAndRallisIdentities (used in its §5.10a). Add "the set `S(1)` of RowTowerAndRallisIdentities §5.10a" or a row in the table of symbols.

## Questions for the author

- The References give "L. Kronecker; M. Lerch, *Sur quelques formules relatives au nombre des classes*, Bull. Sci. Math. 21 (1897)". Is that title not Lerch's paper alone, with Kronecker's limit formula a separate work? I did not open either text (carried from the two previous reviews).

## Previous findings

- The review of `788bbfb` had no finding (no R01).
- C01 — repaired: 8.22 "The inequality is the seventh clause of [FormalProof] … (`Formalism.MainNotions.LinkDIV_at`), whose main term is … `SizeData₂.MAIN`"; 8.23 "(b): the last clause of … `LinkDIV_at`"; 8.20 (vi) names `ramified_places_weighted_sum_le_one`; `LeafTW1` stands at the twist term of 8.20b.
- C02 — repaired: the description says "they are carried by #2954, which adds the whole family and merges first. #2954 also carries this folder; this pull request is the place where the folder is revised."
- N01 — not repaired: written again as N01.
- N02 — not repaired: written again as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 8.19e (c1) | RowTowerAndRallisIdentities §5.11 Lemma at its open head; `SeriesRat` | one phase of absolute value `1` per step, before the cover; level `M·p_d`; twists of finite order unramified off `p_d`: same in both | matches |
| 8.19e (c2) | quantifier order of `SerIntAt`; `p_d = 1`; descent `DescIntAt` | `∃ ph, ∀ ℓ s Λ, ∃ c, ∀ cover S α Φ v`: README same order; `p_d = 1` is the tower itself, descent trivial; twist conditions `rat`, `cond`, `val` equal the three of the README | matches |
| 8.19e (c3) | `HeckeInt`; normalising constant `hkC`; `n = 0` | `P ⊔ P̄ = ⊤`, `p ∤ M′`, `p ∉ 𝔩`; triangular `cf` with unit diagonal; `hkC = μ(ϖ_P)^{−n}·N(P)^{−n·(r+t)/2}` as `nV = r + t` even; `n = 0` identity, excluded | matches but for `Ω` algebraic (C01) |
| 8.20 (vi) | `ramified_places_weighted_sum_le_one` | formal: `Σ_y ϱ(y)·e_y·2/ℓ(y)² ≤ 1` for every finite set; README: `≤ Σ_ℓ 2·log ℓ/ℓ² = 2·0.493091 = 0.98618 < 1` | holds |
| 8.20b, twist term | `LeafTW1` | index loss `≤ e_𝔭·ε0`, `Σ_j(ε0(w, j) + ε0(w̄, j)) ≤ 2/ℓ(w)²`: one `2e_𝔭/ℓ(𝔭)²` for all steps and both places | matches |
| 8.22 (headline 3) | clauses of `LinkDIV_at` counted | seventh of nine: `muDual + h u − Fo ≤ MAIN u + C·|TT|·a·La + C·m·(B0 + Nc)·x^(Cabs·eps)` | matches |
| 8.23 (b) | last clause of `LinkDIV_at` | `|(h u + Σa_t·log T_u) − (h u′ + Σa_t·log T_u′)| ≤ C·(|TT|·a·La + m·B0)`: the right side of (b) | matches |

The rows for the untouched statements stand as in the previous review, of `788bbfb`.

- Source locators checked against the text: 9 declarations of [FormalProof] read in full at the changed passages (`LinkDIV_at`, `SizeData₂.MAIN` by its use, `ramified_places_weighted_sum_le_one`, `LeafTW1`, `SeriesRat`, `SerInt`, `HeckeInt`, `heckeOperator_preserves_supLattice_realSide`, `HkSupAt`), with the definitions they unfold (`Cover`, `IsUnif`, `IsPinned`, `intForms`, `IsTwist`, `FieldBig`, `AtHeckePoints`, `FrBor`, `hkRelFr`, `hkC`, `VStd`). Of the seeded sample, 8.19e and 8.23 fall in the changed passages and were checked there.
- Cross-roadmap citations resolved at the open heads: RowTowerAndRallisIdentities §5.10a (the algebraic tower, the Hecke transform and its identification at the base embedding) and §5.11 (the Lemma on covers and for twists, the level `M`, `κ_rat`); ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (integral at every integral framed point over a complete discrete valuation ring with finite residue field). The new entries of the *Needs:* line of 8.19e and of the supplier contracts agree with them.
- Dependency check: `depcheck: 2 roadmaps, 21 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed.
- Elaboration: `Suggested.lean` is unchanged since `788bbfb`; it elaborates with `sorry` the only warning; single `import Mathlib`, no `set_option`. The elaborated type of its one declaration stands as compared with 7.12 in the previous review.
- Headlines: three in the README; (1) stated, (2) and (3) named in the module docstring with the carriers they lack (unchanged).
- The pull request's text: title and description read against the head; no sentence contradicted, and the repairs change nothing they describe. Changes outside the folder: the family index only (one sentence, C02).
- Duplication: (c1) is cited from RowTowerAndRallisIdentities §5.11, not restated; (c2), (c3) are stated in no roadmap on main or open (searched for the integrality on covers and for `HeckeInt`); no layer added, removed or reordered.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities, CongruenceModulesOfThetaLifts, LocalGainOfThetaChains, SeesawForThetaChains, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties; nothing shared (RowTowerAndRallisIdentities §5.11 owns the rationality on covers, which (c1) cites; the integrality on covers and at Hecke points is stated only here).

Source independence: changed passages only: 4 passages compared with 1 source ([FormalProof]: the definition of a cover, (c2), (c3), the consequence of (c3)), none shared (the files carry no prose); largest share [FormalProof], 156 of 159 locators; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 7–8 give the integrality, heights and target slopes that the slope inequality for chains of theta lifts needs in Alpöge's formal proof (announced 2026) of the Riemann hypothesis for Dirichlet L-functions, by Bost's slope method (Bost 1996, Prop. 4.3). Rests on the README's Routes paragraph, the family index and Bost1996.

## Not verifiable

- [FormalProof] was read in a copy of the public repository named in the References, held locally; I did not confirm that the copy is the first commit the family index names.
- The proofs of (c2) and (c3), which the README says are not given: the declarations state them as propositions; I read the statements and the theorem that derives the stability of the lattices under the Hecke operators from `HeckeInt`, not the proofs of the propositions.
- Whether (c3) holds without the algebraicity of `Ω` over `Frac T` (C01).
- The clauses without routes listed in the previous review (8.19e (L1), (L2) and the distribution relation; 8.20 (vii) (a)–(g); 8.20 (o); 8.24b; 8.24c): unchanged, not read again.

## Source issues

- none

## For the human reviewers

- Scope: the README follows a formal proof announced on 20 November 2026 (Routes paragraph, line 132; References). No refereed source states the targets 8.9 or 8.22; three of 159 locators are to published texts.
- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only. `pairing_integral_of_localDivision` generalises `Formalism.DivisionValues.DivIntoDualShift` with the same letters `B, R, M, P, ζ, N, σ, τ` and the same order of hypotheses.
- Licence: the repository in the References is on a host the sources service does not classify; the manifest records only Bost1996 and GaudronRemond2014.
