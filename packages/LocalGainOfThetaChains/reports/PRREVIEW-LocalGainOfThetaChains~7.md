# Review of LocalGainOfThetaChains (pull request #2915 at 8e10391)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 35 lines changed since `fa7ef96`: the five passages that changed (the notes on the formal proof at 4.9c, 4.9d, 4.15d and 4.17d, and the citation of the Weyl-module roadmap in 4.9e (f)) each agree with the declaration or section they now name, and the title and description agree with this head. One small correction is carried over (the docstring of `Suggested.lean` on the Kostant form) and two format notes, none blocking. The scope and licence of the single source remain for the human reviewers.

## C01 — The docstring of `Suggested.lean` says Tau Ceti has "the Kostant form of an enveloping algebra"; at the pin it has the rank-one form

Carried over unchanged (line 17 of `Suggested.lean`). At the pin the Kostant form is that of `𝔰𝔩₂` (`TauCeti/Algebra/Lie/Sl2/Kostant/Basis.lean`, `kostantFormBasis`; `TauCeti/Algebra/Lie/Sl2/IntegralLattice.lean`, `kostantFormRep`); there is none for `𝔤𝔩_N` or a general enveloping algebra. The conclusion of the docstring (no headline is statable) is unaffected. "The Kostant form of `𝔰𝔩₂`" would be exact.

## N01 — Locators into the formal proof are still written in two forms

42 paths carry the prefix `src/` and 46 do not (the passages added at this head use `src/`). One form throughout would let a reader search the source mechanically.

## N02 — The clause letters of 4.9e and 4.9f run (b), (c), (f), then (d), (e), (g), (h)

Unchanged: (f) stands in 4.9e (line 342) before (d) and (e) of 4.9f (lines 373, 399). A sentence at the head of 4.9e saying that the letters are shared across 4.9–4.9f would be enough.

## Previous findings

The previous report (of `fa7ef96`) had no finding (no R-numbered remark). Its small corrections, format notes and question, at this head:

- C01 (4.15d, "by another route") — repaired: the note now says the formal proof proves the equal-probability case as `TileConditionFailureProbBound` and, with the window term `L₂·C(L₂, r−1)δ^{r−1} + n′·C(L₂, r)δ^r`, as `good_orbit_failure_prob_le`, from which `tops_choice_holds` follows.
- C02 (no declaration at 4.9c, 4.9d, 4.17d) — repaired: 4.9c names `GlobalTheory.T.kernelDatum_thetaSeries_shape_at_d_adaptedBases`, 4.9d `UpperTheory.lattice_pairs_odd_degree_isometric`, 4.17d `Formalism.MainNotions.J.tops_exist_of`; each exists in the file given and states what the note says.
- C03 (4.9e (f) cites §0.3 (b), (c)) — repaired: the text cites "§0.3 (b′), (c)", which at the supplier's head is the inclusion with `dim V_λ` and its passage to `ℤ`.
- C04 (Kostant form in the docstring) — not repaired: `Suggested.lean` is unchanged; written again as C01 above.
- C05 (the description's build sentence) — repaired: the description now says "Lean reports nothing on `Suggested.lean`, and the only warning is Lake's notice that the file does not use the module system", which is what the build prints.
- N01, N02 — not repaired; written again above.
- Question on 4.17d (the two-valued profile and `x^ε ≥ 64·C_o⁴`) — settled: the note now attributes to the formal proof the uniform law under `δ_top|A| ≥ 16`, which is the hypothesis `16 ≤ δ·n` of `tops_exist_of` and of `Conclusion6`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.9c note against `OrbitPlaces.ShapeD`, `ThetaKernelShapeAtD`, `LevelFree` | the three displayed properties; `d = 7` | formal: `‖S‖ ≤ p^{1/2}`, `‖u_t‖ ≤ 1`, `n!·coeff_n` integral, `exp(−S·Σ_t u_t Σ X_{(0,t)}X_{(1,t)})·σ`; README: `v_d(S) ≥ −1/2`, same; `|√−7·s₂| = 1/4`, so `v₇(s₂) = −1/2` | matches | none |
| 4.9c note, the places | `LevelFree` | formal: `p ≠ T(u)`, `p ∉ {g₀, g₁}`, `p ∉ Q(μ)`, class `ramD`; README: above `d`, not above `T(u)`, `g₀`, `g₁`, `Q(ξ)` | matches | none |
| 4.9d note against `lattice_pairs_odd_degree_isometric`, `HasThetaProductForm` | hypotheses and shape | formal: `HostAt`, `5 ≤ p`, `Odd (nP D p)`, standard bases, `IsComb`; shape: `‖ep‖ = 1`, `sg r = ±1`, series in `ZMod (2i)` letters with `BHyp`; README: unit, signs `±1`, `2i` letters, (B1)–(B4) | matches | none |
| 4.9e (f), §0.3 (b′), (c) | `GL₂`, `λ = (2,0)`, `p = 3` and `p = 2` | `e = 1`, `dim = 3`: (b′) gives `3∇ ⊂ 3Δ`, i.e. `∇ = Δ` at 3 (true: `Δ = ⟨x², 2xy, y²⟩`); (b) gives only `3∇ ⊂ Δ`; at 2: `2∇ ⊂ 3Δ ⊗ ℤ_(2)` | holds | none |
| 4.15d note against `TileConditionFailureProbBound` | `δ = 1/2`, `u = 2`, `r = 1`, `ω₀ = 1` | `markedBound = ((1/2)²)⁴·(1·(1/2)·(1/2))³ = 2⁻¹⁴`; README term `(1−δ)^{u(3r+1)}(⌊u/2⌋δ(1−δ)^{u−1})^{3r} = 2⁻⁸·2⁻⁶` | equal | none |
| 4.15d note against `good_orbit_failure_prob_le` | `n′ = 1000`, `L₂ = 10`, `r = 2` (`K = 1`), `δ = 0.01` | formal window term `10·10·0.01 + 1000·45·10⁻⁴ = 5.5`; README `1000·10·0.01 = 100`; other two terms identical | matches as described | none |
| 4.17d note against `tops_exist_of`, `TopsOK`, `Conclusion6` | profile `ω = 1` | formal: `16 ≤ δn`; `δn/2 ≤ |T| ≤ 2δn`; `Σ (log p/p)·#bad ≤ 4C_b x⁻²·δn·Σ log p/p`. Route at `ω = 1`: `n_top = δ|A|`, `2n_top/3 ≥ δ|A|/2`, `3n_top/2 ≤ 2δ|A|`, `4p_bad·n_top·Σλ` | matches | none |

The rows for the untouched statements stand as in the previous review, of `fa7ef96`.

- Source locators checked against the text: 6 files and 11 declarations of [FormalProof] named in the changed passages (`kernelDatum_thetaSeries_shape_at_d_adaptedBases`, `thetaKernelShapeAtD_ofKer_of_hyp_adapted`, `OrbitPlaces.ShapeD`, `GlobalTheory.ThLoc.Inputs`, `KerStd.HostAt`, `G2.HasThetaProductForm`, `lattice_pairs_odd_degree_isometric`, `TileConditionFailureProbBound`, `choice_of_tops_refined_holds`, `good_orbit_failure_prob_le` with `tops_choice_holds`, `J.TopsOK` with `J.tops_exist_of`); all exist under the names and namespaces given, in the operator's copy at commit `e50d098`. `choice_of_tops_refined_holds` is declared in `Formalism/SubspaceCounting/SubspaceCountingProofs/ChoiceOfTopsRefined.lean`; the README gives the file of the statement only, which is what it says.
- Seeded sample: of its targets, 4.9c, 4.9d and 4.9e fall in the changed passages (rows above); the others are untouched and stand as in the previous review.
- Cross-roadmap citations resolved: IntegralWeylModulesOfGeneralLinearGroups §0.3 (b), (b′), (c) and FrobeniusRestrictedRieszSums §0.7 (i), (iii′), read at their open heads.
- Dependency check: `depcheck: 2 roadmaps, 13 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: run again on this head; all pass except the two the description itself reports (the three files of the family index outside the folder, which are the pull request's own, and the roadmap not yet being placed in the merge order, which is not a defect).
- Lean: `Suggested.lean` is unchanged and elaborates with no message; the targeted build succeeds, its only output being Lake's notice about the module system. The file declares nothing, so there is no signature to compare and nothing for the one-tactic probe; the four headlines are named in the docstring with the carriers they lack.
- Pull request text: the title and every sentence of the description were read against this head. It adds the roadmap (2043 lines, nothing removed), says that `Suggested.lean` declares nothing, lists the twelve open suppliers of the supplier contracts, and its validation sentence is what the checks and the build print. No correction.
- Nothing is changed outside the folder since `fa7ef96`.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality, TaylorBoundsAndDepthsOnHeightTwoFormalGroups and CongruenceModulesOfThetaLifts (the list for main is empty); nothing shared. The change adds no object; no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 5 passages compared with 1 source ([FormalProof], Lean statements), none shared beyond declaration names; largest share [FormalProof], as in the previous review (119 of about 121 locators, now with 9 further declaration names); contents not compared again, since the change adds, removes and reorders no layer.

Research link: Layer 4 is the gain at inert primes of the chains of theta lifts in Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); the README places it beside Gross (1999) on algebraic modular forms, Hida's normalisation and Bannai–Kobayashi (2010). Basis: the README's References and the family index.

## Not verifiable

- The pinned commit `ab0b752` of [FormalProof] was not read; the copy read is at `e50d098`.
- 4.9c: that `GlobalTheory.ThLoc.Inputs` consists of theorems on the normalised CM theta functions was read from its field names only; the statements behind the fields were not opened.
- 4.9d: `BHyp` was not compared clause by clause with (B1)–(B4) of the supplier.

Automatic checks set aside as false positives: the listing of elaborated signatures, of library near-matches and of declarations added reads the word after "class" in the module docstring of `Suggested.lean` ("class sets") as a declaration named `sets`; the file declares nothing and elaborates cleanly. The search for Lean names found nowhere lists the declarations of the formal proof, which are source locators and not library names.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof], a Lean development announced on 20 November 2026 with no refereed paper; the published works in References carry no locators except Jantzen II.5–II.6.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) says the proof belongs to its author and was published without a licence; the README cites its file paths and declaration names, and no text of it.
- Not tested: the README pins [FormalProof] at commit `ab0b752`; locators were checked on the operator's copy at commit `e50d098`.
