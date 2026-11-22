# Review of RowTowerAndRallisIdentities (pull request #2919 at df851c3)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 71 lines changed since `51a5443` finds nothing that makes a stated result false or unsupported. The mathematics added holds: the argument that the unit vector of the lowest `K`-type sent to `Δ_j` is an extremal weight vector (5.7), the reduction of the gap hypothesis of 5.9 to ThetaChainsOnDefiniteUnitaryGroups §2.3c, and the hypotheses now recorded for the rational lift of 5.11 ((R5) and the condition on the twist places); every newly cited file and declaration of [FormalProof] exists and says what the README says of it. There are one small correction and three format notes (one carried over), none blocking. The standing of the formal proof as main source and the route of this folder to main remain for the human reviewers.

## C01 — "The file cited for (L5)" in 5.8 no longer identifies one file.

The sentence that locates the record `GlobalTheory.RowTest.NumbersIn` (5.8, line 1696) says it is "of the file cited for (L5)". Three files are now cited for (L5): two in the item itself (lines 1645–1647) and, since this change, `Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsPowEqOneOfLe.lean` in the paragraph on algebraicity (line 1666), which is the nearest one above the sentence. A reader who opens that file does not find the record: `NumbersIn` is declared in `Development/AbelianVarietyTheory/Definitions/TwistedInnerProducts/MemHalfCosetSelf.lean` and does not occur in `ExistsPowEqOneOfLe.lean`. Naming the file in the sentence ("`GlobalTheory.RowTest.NumbersIn`, `…/MemHalfCosetSelf.lean`") settles it; "that file" two lines below then refers to `FormulaAt.lean` or to this one, and would be clearer named as well.

## N01 — R. Godement ("square-integrable representations") is still credited without a title (line 2335), and S. Kudla, *Seesaw dual reductive pairs* (1984), without a venue (line 2343); every other name-only credit in the References has both.

## N02 — The new sentence of 5.9 on how [FormalProof] obtains the gaps (lines 1753–1755) names no file or declaration, unlike every other statement about [FormalProof] in the section. What it describes is `GlobalTheory.Mem.HostFrames.hostHyp_of_gaps` (and `hostHyp_frames_ev` for the large scale), `Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/StandardLatticesDiagonal.lean`; the record is `Formalism.IndefR.Links.HostHyp`.

## N03 — In the Lemma of 5.11 the twist sets are said to avoid "the small primes" (line 1883), a term not defined here; the condition meant (`QGuard` of `Formalism/LocalToGlobal/IndefiniteReal/OneMapT.lean`) excludes the primes that the same paragraph, eleven lines below, calls "the primes of the host". One name for both would do.

## Questions for the author

- Step (A) of the outline of 5.8e (line 1492) says that the `n`-fold lift of `ē(w)` is `F′_n(vec_n(𝐩, w))`. `vec_n` occurs only here and is not defined. Since `w ↦ ē(w)` is conjugate-linear, is `vec_n(𝐩, w)` conjugate-linear in `w`, or is `F′_n`? Step (F) uses only the factorisation, so nothing stated depends on the answer; the passage is unchanged and I could not decide it from the text.
- CongruenceModulesOfThetaLifts, at its open head, still says in its Layer 7 that "RowTowerAndRallisIdentities §5.7 does not give the highest weight of `𝒲_j`", which 5.7 gives. Is that sentence to be brought up to date there? It is outside this folder, so it is not a remark on this pull request.

## Previous findings

- The previous review (of `51a5443`) had no finding and no small correction.
- N01 of that review — not repaired: line 2335 still reads "R. Godement (square-integrable representations)", line 2343 "S. Kudla, *Seesaw dual reductive pairs* (1984)" (N01 above).
- Its question on `vec_n` — the passage is unchanged (first question above). Its question on CongruenceModulesOfThetaLifts — that roadmap's sentence is unchanged at its open head (second question above).

## Verified sound

| Statement | Instances tried | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 5.7 extremal vector (new) | `x ↦ I_j(x ⊗ w)` on the lowest `K`-type; torus element `a` | `e` has the weight `χ` of `Δ_j`; unique up to a phase at each `τ` | map is `K`-equivariant, nonzero at `e`, source irreducible ⇒ injective; `a·e − χ(a)e ↦ aΔ_j − χ(a)Δ_j = 0`; extremal weight has multiplicity one | holds | — |
| 5.7 against [FormalProof] | `IoExt`, `IsExtVec`, `ExtLine`, `ioExt_core` | unit tensor `u ⊗ w ↦ Δ_j`, `u` extremal; proved in `IoExtCore.lean` | `IoExt: ∀ i, ∃ u, IsExtVec u ∧ ExtremalVectorPairsToDelta`; `IsExtVec`: norm 1, in the lowest type, weight `extWt`; `ioExt_core … → IoExt R` | agrees | — |
| 5.8d (norms) citation (new; sampled) | `GlobalTheory.SqTop.NormBig` | `N_big(ξ) = A·∏_{s=1−e_□}^{h_□}Λ(s, ν_ξ)`, `A ≠ 0` independent of `ξ` | `∃ A ≠ 0, ∀ t … P.norm = A * ∏ s ∈ Icc (1 − e0) h0, Λ s`: `A` chosen before the tuple `t` | agrees | — |
| 5.8 (L5), (L7) citations (new; sampled) | `phases_core`; `BotExT` | phases algebraic; bottom triples for every tuple with one pair of periods | `∃ M` finite over `ℚ` with `PhasesIn (algebraMap M ℂ)`; `∀ δ t0 … ∀ t i j, ∃ P P′ : Pair D ⊤ δ t0 _, IsBottom`: `δ, t0` fixed before `t` | agrees | C01 (pointer only) |
| 5.9 gap hypothesis (changed) | `r < 2k`, `f ≥ m⁴ ≥ 16`; the three kinds of gap of `(v; −e′)` | `4Δ_w`, `e′_{l+1} − e′_l`, `v_{k−2} + e′_0` each `≥ 100r⁴` under `SizeGap`, `SizeMf`, `Δ_w > k⁴f⁴` | `4Δ_w > 4k⁴f⁴ ≥ 4·16⁴k⁴ > 1600k⁴ > 100r⁴`; node gaps `≥ h_gap ≥ 120r^{19}`; junction `≥ e′_0 − Sc ≥ h_gap` | holds | — |
| 5.9 against [FormalProof] (new) | `HostHyp`; `hostHyp_of_gaps` | a record of its own; proved from `Δ_w, h_gap ≥ 256N_m⁴`, `e′_0 ≥ 100r⁴` | fields `gapR`, `cloudGap` (`100r⁴`), `nodeGap`, `nodeGapR`; hypotheses `256·N^4 ≤ h`, `256·N^4 ≤ Δ`, `100r⁴ ≤ b_0` | agrees | N02 |
| 5.11 rational lift: hypotheses (changed; sampled) | `oneMapRowR_of_core_of_size`; `QGuard` | `8fr + 4 ≤ r + t`; twist sets over one prime of `K` per rational prime, avoiding given primes | hypothesis `8 * f * r + 4 ≤ nV`, `nV = r + t`; `QHalf` (equal contraction to `K`) and non-divisibility by `QS·q·N(ccK)`; (R5) reads `8fr + 4 ≤ r + t` in the supplier | agrees | N03 |
| 5.11 Lemma term by term (new) | `SeriesRat`, clause by clause | one phase of norm 1 per step; cover uniform, pinned; `p_d` odd, squarefree, split, prime to `M` and host primes; ray class field of conductor `M·p_d`; three rational functions | `∃ ph, ‖ph‖ = 1 ∧ ∀ C, GoodCover → …`; `IsAuxiliarySplitSquarefreeLevel` (Jacobi symbol 1); `RayIn (M·pd)`; `SeriesRatOn` has the theta function, its product with `MuVal`, the twisted Weil datum | agrees | — |
| 5.11 route (changed) | `PhRat`, `OneMapRowR`, `phase_of_oneMap` | phase and component constants of norm 1; lift of rational `x` at the extremal vector is an `𝕃`-combination of algebraic cusp forms | `ph * e(thG(jVx x)) v₀ h = Σ embLL(a k)·(lieFac·phi cc (f k) h)`; `exists_choice`: `‖cc k‖ = 1`, `‖ph‖ = 1` | agrees | — |
| Downstream consumers (new sentence) | ThetaChainsAndFrobeniusPrimeSums §§10.0 (H1), 10.6, 10.6b | takes `C_F ≥ C_F⁰`, `x ≥ x_F`; verifies the gaps in §10.6b | (H1) asks `x ≥ x_F` and the three gap hypotheses "verified … in 10.6b"; §10.6 fixes `C_F ≥ C_F⁰ ≥ 6510` before `ε`; §10.6b has the paragraph | agrees | — |

The rows for the untouched statements stand as in the previous review, of `51a5443`.

- [FormalProof], read in the copy the operator holds: the 8 files and 10 declarations the change newly cites exist where cited (`ioExt_core`, `NormBig`, `BotExT`, `NormRatio.finite_data`, `phases_core`, `SeriesRat`, `OneMapRowR`, `OMDat.PhRat`, `oneMapRowR_of_core_of_size`, `phase_of_oneMap`); statements opened and compared: all but `finite_data`, and in addition `IoExt`, `IsExtVec`, `HostHyp`, `hostHyp_of_gaps`, `QGuard`.
- Cross-roadmap citations of the changed passages resolved: ThetaChainsOnDefiniteUnitaryGroups §§2.1 (R5), 2.3 (letter step), 2.3a, 2.3c (*Gaps of the row parameter*) at its open head; ThetaChainsAndFrobeniusPrimeSums §§10.0, 10.6, 10.6b at its open head (a consumer, named only under Downstream consumers).
- Dependency check: `depcheck: 23 roadmaps, 118 edges, 0 problem(s)`. Automatic checks: all passed.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no message; the file is unchanged since `51a5443`, declares nothing, has one `import Mathlib`, no `sorry`, no `set_option`. No `#check` comparison and no one-tactic probe apply.
- Headlines: unchanged ((1) Rallis identities 5.5/5.6/5.10, (2) rational structure 5.8, (3) descent on rational coordinates 5.12); none statable at the pins, each named in the docstring with what it lacks.
- Changes outside the folder: the family index only (a clause that the cited files lie under `src/` of the published source, and a new description of one sibling roadmap); the pull request's own.
- Pull request text: no sentence contradicted by this head; the change adds no supplier (§2.1 (R5) is a section of a supplier already listed), removes no section and no declaration.
- Seeded sample: of its targets, the change touches 5.8d, 5.8 and 5.11 (rows above); the others are untouched.

Overlap check: read ThetaChainsOnDefiniteUnitaryGroups, ThetaChainsAndFrobeniusPrimeSums, CongruenceModulesOfThetaLifts (open) for the changed passages; nothing shared: the gaps of the row parameter stay with ThetaChainsOnDefiniteUnitaryGroups §2.3c, which 5.9 cites, and the choice of `C_F`, `x_F` with ThetaChainsAndFrobeniusPrimeSums §10.6. The other closest roadmaps (SeesawForThetaChains, GluedTargetAndDivisionInequality, BesselPoincareSeriesAndGramBounds, ThetaLiftsForDefiniteUnitaryGroups; GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactorsPartII on main) are as in the previous review: the change adds no object.

Source independence: changed passages only; 6 passages compared with 1 source (the statements of [FormalProof], which has no prose), none shared; largest share [FormalProof], as in the previous review (the change adds 10 locators into it); the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: 5.5–5.7 are Rallis inner product identities for theta lifts between unitary groups (Rallis 1984; Li 1992; Ichino 2004: README References and Rallis84Injectivity), assembled into the row side of the chain of theta lifts of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README Conventions and References).

## Not verifiable

- That `δ`, `t0` of the record `Pair` behind `BotExT` are the periods `Ω`, `Ω′` of (L7): I checked only that they are fixed before the tuple.
- `GlobalTheory.NormRatio.finite_data` ("the finite-place input" of the norms): the declaration exists in the file cited; its statement was not compared.
- No proof of [FormalProof] was read; "proves" was checked as far as the named theorem having the named statement as its conclusion.
- The description's sentence that the family pull request carries the family index "with the same content as here": that head was not available to compare, and this head changes the index.
- That the rows of [FormalProof] are the complex conjugates of the rows of 5.1, and the works cited by name without a locator: as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets rest on [FormalProof] alone (README References), a Lean formalisation by one author announced on 2026-11-20 with no paper; the linked repository describes itself as a public verification setup.
- Licence: the family index says the proof was published without a licence and is mirrored for verification only. The roadmap restates mathematics and cites file and declaration names; it copies no code.
- Not tested: [FormalProof], the source with the largest share of locators, has no prose and no table of contents; wording was compared with statements only.
- Process: #2954 (open, draft) carries this folder; this head changes the folder and the family index, so its copy is to be brought to this head. Which of #2919 and #2954 merges this folder is to be decided.
- Several theorems of [FormalProof] cited across the family take hypotheses named `GlobalTheory.Published.*` (seen in `Development/AbelianVarietyTheory/Proofs/SatakeParameters/DownLiftUpLiftPositiveScalarUsedTuples.lean`); whether these are proved there was not examined.
