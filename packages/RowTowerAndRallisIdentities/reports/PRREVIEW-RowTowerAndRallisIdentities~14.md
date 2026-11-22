# Review of RowTowerAndRallisIdentities (pull request #2919 at b112efe)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 8 lines changed since `63a93cf` finds no statement false or unsupported. The new claim that the constant `𝔫₀` of the adjoint identity is positive when `𝔼^♮ ≠ 0` follows from `𝔫_j ≠ 0` (5.5), the positivity of the `L`-values and the positive semidefiniteness of `ι_ξι_ξ^*`, and the new sentence of 5.6 on [FormalProof] agrees with the declaration cited there. There are four format notes (three carried over) and no small correction; none blocks. The standing of the formal proof as main source and the route of this folder to main remain for the human reviewers.

## N01 — R. Godement ("square-integrable representations") is still credited without a title (line 2415), and S. Kudla, *Seesaw dual reductive pairs* (1984), without a venue (line 2423); every other name-only credit in the References has both.

## N02 — The sentence of 5.9 on how [FormalProof] obtains the gaps (line 1766) still names no file or declaration, unlike every other statement about [FormalProof] in the section. What it describes is `GlobalTheory.Mem.HostFrames.hostHyp_of_gaps`, `Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/StandardLatticesDiagonal.lean`.

## N03 — In the Lemma of 5.11 the twist sets are still said to avoid "the small primes" (line 1912), a term not defined here; the same section calls them "the primes of the host" further down.

## N04 — The parenthesis that justifies the positivity of `𝔫₀` in the overview (line 22) gives only `𝔫₀ ≥ 0`; the conclusion also uses `𝔫₀ ≠ 0`, which the sentence stated before the change and which 5.5 still provides (`𝔫_1, …, 𝔫_m ≠ 0`). The parenthesis would be complete as "(`𝔫₀ ≠ 0` by 5.5, `ι_ξι_ξ^*` is positive semidefinite and the `L`-values are positive)". In 5.6 itself the positivity of `𝔫₀` is stated only for the form of [FormalProof]; the same one-line argument could follow "Positivity:" in its Route.

## Questions for the author

- Step (A) of the outline of 5.8e (line 1503) still says that the `n`-fold lift of `ē(w)` is `F′_n(vec_n(𝐩, w))`; `vec_n` occurs only here and is not defined. Is `vec_n(𝐩, w)` conjugate-linear in `w`, or is `F′_n`? Nothing stated depends on the answer; the text does not let me decide it.

## Previous findings

- The previous review (of `63a93cf`) had no finding and no small correction.
- N01 of that review — not repaired: lines 2415 and 2423 are unchanged (N01 above).
- N02 of that review — not repaired: the sentence of 5.9 is unchanged (N02 above).
- N03 of that review — not repaired: "avoids the small primes" stands at line 1912 (N03 above).
- Its question on `vec_n` — the term is still undefined (question above).

## Verified sound

| Statement | Instances tried | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| Overview (1): `𝔫₀ > 0` when `𝔼^♮ ≠ 0` (changed) | `0 ≠ u ∈ 𝔼^♮[𝔥]`; 5.5: `𝔫_j ≠ 0`; 5.6: `L_j > 0` | positive | `0 ≤ ‖ι_ξ^*u‖² = 𝔫₀∏L_j‖u‖²` gives `𝔫₀ ≥ 0`; with `𝔫₀ = ∏𝔫_j ≠ 0`: `𝔫₀ > 0` | holds | N04 (wording) |
| Overview (1): `𝔼^♮ = 0` (degenerate case of the change) | zero space | no sign claimed; "so `ι_ξ` is onto" | identity is `0 = 0` for any constant; onto the zero space trivially; for `𝔼^♮ ≠ 0` the scalar `𝔫₀∏L_j ≠ 0` | holds | — |
| 5.6: [FormalProof] has one positive constant for all tuples and eigensystems (new; sampled) | `GlobalTheory.LiftRows.BForm`; `GlobalTheory.ChainScalar.bForm` | one positive constant, all tuples, all eigensystems | `BForm := ∃ κ₀ : ℝ, 0 < κ₀ ∧ ∀ t c z, (∀ i, IsLval R i t c (z i)) → … Th t (adjoint (Th t) x) = (κ₀·∏ z i) • x`; `bForm` takes `κ₀ = ∏ κ(i+1)`, `Finset.prod_pos` | agrees | — |
| 5.6 against 5.10 and the Check of 5.10 (cite `𝔫₀`) | `𝔪_j ↦ c𝔪_j`, `c > 0`; `𝔫 = 𝔫₀/∏a_j`, `a_j > 0` | `𝔫₀`, `𝔫` multiplied by `c^{−2}` | `c^{−2} > 0` keeps the sign; `𝔫 > 0` iff `𝔫₀ > 0`; consistent with "explicit positive factors" of the Conventions | agrees | — |

The rows for the untouched statements stand as in the previous review, of `63a93cf`.

- [FormalProof], read in the copy the operator holds: 2 files opened for the changed sentence (`…/TwistedInnerProducts/RealLowestKTypeCoeffSquareIntegrable.lean`, `BForm` and `IsLval`; `…/TwistedOperators/LevelGroupActionOnAdelicFunctionsEqZeroOfNoLift.lean`, `bForm`); both are the locators 5.6 already gives.
- Within the README: 5.5 (Statement, `𝔫_j ≠ 0`, independent of `𝔥` and `ξ`), 5.6 (Route: positivity of the factors, surjectivity from a nonzero scalar), 5.10 and the Conventions on normalisations read against the two changed sentences. The change cites no other roadmap.
- Dependency check: `depcheck: 133 roadmaps, 1491 edges, 0 problem(s)`. Automatic checks: all passed.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no message; the file is unchanged since `63a93cf`, declares nothing, has one `import Mathlib`, no `sorry`, no `set_option`. Its docstring states (1) without a sign of `𝔫₀`, which the head does not contradict. No `#check` comparison and no one-tactic probe apply.
- Headlines: unchanged; none statable at the pins, each named in the docstring with what it lacks.
- Changes outside the folder since `63a93cf`: none. Outside the folder and the family index against the base: none.
- Pull request text: no sentence contradicted by this head; the change adds a sign to one constant, no section, supplier or declaration.
- Seeded sample: of its targets, the change touches 5.6 (row above); the others are untouched.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (open), GanGrossPrasadUnitaryGroups (main), as in the previous review; nothing shared: the change adds no object, only the sign of a constant this roadmap owns (5.5, 5.6).

Source independence: changed passages only; 2 passages compared with 1 source (the statements of [FormalProof], which has no prose), none shared; largest share [FormalProof], as in the previous review; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: 5.5–5.7 are Rallis inner product identities for theta lifts between unitary groups (Rallis 1984; Li 1992; Ichino 2004: README References and Rallis84Injectivity), assembled into the row side of the chain of theta lifts of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README Conventions and References).

## Not verifiable

- That the two files opened have the same content at the first commit `40e56bab…` that the reference names: the copy of [FormalProof] read here is of a later commit of the same repository, and the two trees were not compared.
- That `IsLval` of [FormalProof] is the `L`-value of 5.6 and `EEc` the space `𝔼^♮[𝔥]`: I read the shape of `BForm` (one positive constant quantified before the tuple and the eigensystem) and did not unfold these.
- The description's sentence that the family pull request carries the family index "with the same content as here": that head was not compared.
- No proof of [FormalProof] was read beyond the opening of `bForm`; the works cited by name without a locator: as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets rest on [FormalProof] alone (README References), a Lean formalisation by one author announced on 2026-11-20 with no paper; the linked repository describes itself as a public verification setup.
- Licence: the family index says the proof was published without a licence and is mirrored for verification only. The roadmap restates mathematics and cites file and declaration names; it copies no code.
- Not tested: [FormalProof], the source with the largest share of locators, has no prose and no table of contents; wording was compared with statements only.
- Process: #2954 (open, draft) carries this folder; this head changes the folder, so its copy is to be brought to this head. Which of #2919 and #2954 merges this folder is to be decided.
- Several theorems of [FormalProof] cited across the family take hypotheses named `GlobalTheory.Published.*`. Whether these are proved there was not examined.
