# Review of GluedTargetAndDivisionInequality (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** accepted

**Summary.** This is an incremental re-review: 15 lines have changed since `71bbefa`, all in the Conventions paragraph on `*Corollary of:*` lines.

- The new convention deduces the covered case from the general theorem, and lists the needs of any second proof on the `*Needs:*` line.
- It agrees with the only such line, 8.5c, whose covered step reaches ComplexMultiplicationAndExplicitReciprocityPartII §4.6 through ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (c).
- It also agrees word for word with the family index's statement of the convention.

There is no finding. The previous report's two small corrections and two format notes are not repaired and are carried as C01, C02, N01 and N02, none blocking. The scope and licence questions for the human reviewers stand as before.

## C01 — 8.2 (c) as stated is not the formal proof's form, yet neither its Origin label nor the Labels paragraph calls it the roadmap's own formulation

A reader who trusts the Labels paragraph takes 8.2 (c) as a statement of [FormalProof]. That paragraph (Conventions, lines 254–258) lists the sections whose Origin labels name a wider form: 7.12, 8.1, 8.3, 8.6, 8.21 and 8.24. 8.2 is not among them.

8.2's own Method label (lines 577–580) gives the formal proof's form of (c): the factor `∏_τ e·(2n_τ + 2)^{2|ι_τ|}`, for blocks of one size. The statement (line 596) has `e·(2n + 2)^{2N}` instead, for blocks of any sizes, and neither factor bounds the other. Take two blocks of one variable each:

- at `n_τ = 0`, `16e² ≈ 118.2` against `16e ≈ 43.5`;
- at `n_τ = 100`, `e²·202⁴ ≈ 1.23·10¹⁰` against `e·402⁴ ≈ 7.10·10¹⁰`.

The route proves both forms (lines 605–607). The fix is to add to 8.2's Origin label that "(c) as stated, with the factor `e·(2n + 2)^{2N}` for blocks of any sizes, is this roadmap's own formulation", and to add 8.2 to the list on line 257.

## C02 — The description does not say that this roadmap gains supplier roadmaps

The description mentions only "the changed citations" for the family. In this folder the supplier contracts gain the following (all on `main` or added by this pull request):

- a subsection for ComplexMultiplicationAndExplicitReciprocityPartII (§§0.2, 4.6; line 2516);
- a subsection for MetaplecticAutomorphicForms (§1.5 (ii); line 2527);
- three entries for ArakelovGeometryAndAbelianHeights (§§1A.5 (b), 2.9, 4.6; from line 2493).

One sentence under "For reviewers" would cover it: "GluedTargetAndDivisionInequality now lists ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6, MetaplecticAutomorphicForms §1.5 (ii) and ArakelovGeometryAndAbelianHeights §§1A.5 (b), 2.9, 4.6 among its suppliers."

## N01 — Five lines headed `*Sources:*` name topics, not sources

The lines are in 8.1, 8.2, 8.3, 8.8 and 8.10 (lines 561, 613, 653, 927, 1037). For example, 8.3 has "(sub-mean-value estimates for theta functions)". Either name the work (Bargmann 1961 at 8.2, Frame–Robinson–Thrall at 8.10), or drop the heading and leave the provenance to the Origin label.

## N02 — Gillet and Soulé's paper is in English, so the lemma is "Lemma 30"

The References entry (line 2673) writes "Lemme 30", which is how Gaudron and Rémond cite it.

## Previous findings

- none: the previous report raised no finding. Its small corrections and format notes are not repaired at this head and appear above as C01, C02, N01 and N02. The 8.2 Origin label, the list on line 257, the description, the five `*Sources:*` lines and "Lemme 30" are all unchanged.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Corollaries convention (Conventions, lines 260–267) against 8.5c | 8.5c's route against its Corollary line and `*Needs:*` | Covered step: `log Ω_K` from AVIF §8.5 (c), which AVIF deduces from CMER II §4.6. So the route is the deduction, and `*Needs:*` lists AVIF §8.5 | consistent; family index (lines 66–70) says the same | none |
| AVIF §8.5 (c) hypothesis used by 8.5c | `Λ_K` of ThetaChainsOnDefiniteUnitaryGroups §3.1a | `Λ_K = δ_K·ι₀(𝒪_K)`, `δ_K^{12} = Δ(ι₀𝒪_K)`, so `Δ(Λ_K) = 1`, as AVIF §8.5 (c) requires | hypothesis met | none |
| CMER II §4.6 value, as 8.5c's Corollary line quotes it | `K = ℚ(i)` | `−log(Γ(¼)/Γ(¾)) − ½log π = −1.657107`; `(L′/L)(0, χ₋₄) = 0.783189`, class mean `+½log 4 = 1.476336 = Per(ℤ[i])` | formula and AVIF Check agree | none |
| 8.5c transport term | `K = ℚ(√−7)`, `E = ℚ(i, √7)` | `|d_E| = 4·7·28 = 784`, `N(𝔡) = 784/49 = 16`; `log(rd_E/√7) = log 2 = 0.693147 = ¼·log 16` | identity holds | none |
| 8.5c against [FormalProof] | `HtNums` clause `i1`; `logOm`, `v` | mean over embeddings of `logOmτ τ` is `logOm = γ + log(π/v) − (L′/L)(1)`, `v = rd_E/2`; so `log Ω_K − log(rd_E/√D)` | matches statement | none |
| 8.2 (c) (C01) | two one-variable blocks, `n_τ = 0`, `100` | 118.2 vs 43.5; `1.23·10¹⁰` vs `7.10·10¹⁰` | forms incomparable; label missing | C01 |
| 7.12 headline (`pairing_integral_of_localDivision`) | `#check @` on a copy of the file | type identical to the previous round; all instance binders present (`IsScalarTower` ×3, `NumberField`) | unchanged | none |

The rows of the previous review for the untouched statements stand as in that review, of `71bbefa`.

- Diff since `71bbefa`: one paragraph of the README (8 insertions, 7 deletions); `Suggested.lean` unchanged. Against `origin/main`, nothing outside the pull request's own folders changes.
- Cross-roadmap citations resolved: 4.
  - ComplexMultiplicationAndExplicitReciprocityPartII §4.6 and §0.2: on main (`1208582`), lines 616 and 73.
  - ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (a)–(c) and its Corollary line: at this head.
  - ThetaChainsOnDefiniteUnitaryGroups §3.1a (`Δ(Λ_K) = 1`): at this head.
- [FormalProof] locators of 8.5c resolved in the operator's local copy:
  - `Formalism/LocalToGlobal/Divisibility/Inputs.lean` (`HtNums`, clause `i1`, line 264);
  - `Formalism/LocalRingCardinality/DataParams₂.lean` (`logOm`, line 224);
  - `DataHost.lean` (`v`, line 143).
- Automatic checks: all passed.
- Dependency check, run by hand: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gives only the `sorry` warning at line 76.
- Record: no layer, heading or item of the README at the merge base is removed or retitled.
- Wording of the changed paragraph: compared with the family index's statement of the convention, it is the same text adapted to one roadmap.

Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, FiniteReductiveGroups, UniformWildKernelBounds, ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities and SeesawForThetaChains. Only one object touches the change: the Chowla–Selberg class mean. Its owner is ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5, which this roadmap cites. The general formula's owner is ComplexMultiplicationAndExplicitReciprocityPartII §4.6, on main. Nothing else is shared, and the change moves no ownership.

Source independence: 1 passage compared (changed passages only). The changed paragraph is convention text with no source locator; it shares no wording with a source and matches only the family index's own convention. Largest share: [FormalProof], about 159 of 168 locators, as before. Arrangement not compared, since the change adds, removes or reorders no layer.

Research link: The headline targets (integrality after division, the height of the period pairing, the division inequality) are steps of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026. They rest on Bost's slope inequality (Bost 1996) and the Chowla–Selberg formula (1967). This line rests on the README's summary and References.

## Not verifiable

- Chowla–Selberg 1967, pp. 86–110: the De Gruyter landing page is on a host in no licence class, so the text was not fetched. 8.5c's Origin label was checked only against ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 and its Checks.
- Gillet–Soulé 1992, Lemma 30, and Bargmann 1961: behind publishers' paywalls, as in the previous review.
- [FormalProof] at the cited commit `40e56bab`: the locators were checked against the operator's local copy, whose commit I did not compare with the cited one.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside the roadmap folder under review (an edit elsewhere could slip past every roadmap's review), run with only this folder named, counted as outside it 117 files that belong to the other roadmap folders this pull request adds or revises and that have reviews of their own. With those folders excluded, the pull request changes no file against the base.

## Source issues

- none

## For the human reviewers

- Scope: of the 26 sections, the labels mark 22 "particular to this proof", 4 "adapted" and none "published". The statements rest on [FormalProof], a public Lean repository announced 20 November 2026 (README References), not on refereed literature.
- Licence: the formal proof's repository is cited only by file path and declaration name; its licence was not read.
