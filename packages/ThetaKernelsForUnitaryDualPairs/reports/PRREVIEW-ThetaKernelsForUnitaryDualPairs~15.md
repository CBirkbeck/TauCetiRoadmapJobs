# Review of ThetaKernelsForUnitaryDualPairs (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 39 lines changed since `2899581`, all in the README: four passages (3.46a, 3.47b, 3.47c, 5.7b) that say what the formal proof states and proves and that bring three older sentences into line with the *Origin* labels. Every declaration and file the new text names was opened in the formal proof's source and says what the README says of it; the previous small correction is repaired; no statement of the roadmap changed. No finding, so the folder is accepted, with one format note and one question for the author carried from the previous review; nothing in the mathematics is left for a human to decide.

## N01 — In 3.46a the range "`ArchimedeanRallisFirst` to `ArchimedeanRallisFifth`" hides the name of its third member

In the paragraph *The form of the formal proof* of 3.46a (line 530), the five statements are named as a range. In `Formalism/SharpRestriction/Divisibility/SchurIrreducible.lean` they are `ArchimedeanRallisFirst`, `ArchimedeanRallisSecond`, `ArchimedeanRallisUpDownLine`, `ArchimedeanRallisFourth`, `ArchimedeanRallisFifth`: a reader who searches for a "Third" finds nothing. Naming the third would do.

## Questions for the author

- 3.47, *Status* (carried, the text is unchanged): is the identification of `Θ`, `Θ′` with `α_w ∘ det_a × β_w ∘ det_{a′}` in Kudla–Sweet (1997) at a place where `E = F × F`? Harris–Kudla–Sweet (1996) describes that paper as the structure of the Siegel degenerate principal series of `U(n, n)` for a quadratic field extension (HKS96 lines 33, 287–290). Kudla–Sweet itself is recorded without a readable copy, which is what stopped me.

## Previous findings

- C01 — repaired: 5.7b now reads "(i), (ii) and (iv) are adapted from the works named in *Origin* and (iii) is particular to this proof"; 3.47c "*Origin* names the general theory of which these lemmas are special cases"; 3.47b *Status* calls (v) "adapted from the works named in *Origin*".
- (The previous report had no finding R01, R02, …; its question on Kudla–Sweet is carried above.)

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 3.46a, credit of (a)–(f) | `exists_record_theta_all`, `ExistsRealDiscreteSeriesDataThetaProperties.lean:19` | README: for some realisation, from two hypotheses / source: `DiscreteSeriesCover → HarishChandraModules → ∃ X : ProvA, ChosenSeries X ∧` five statements | match |
| 3.46a, "some realisation" | `ProvA`, `DataTheta.lean:471`; `GrpData`, line 93 | fields `grp` (group, `haar`, `cov`), `fock`, `ds` (one per parameter) / README: covers with Haar measures, Fock modules, discrete series of each parameter | match |
| 3.46a, the two hypotheses proved | kernel export of the proof | `CompanionTheory.RgExh.discreteSeriesCover` (`DsExhaust.lean:20`) and `PositivityTheory.Stage1.PM.harishChandraModules` (`HarishChandraModules.lean:9`): both theorems of exactly the two `Published` props | match |
| 3.47b (ii), Howe duality credit | `GlobalTheory.Published.HoweDualityReal`, `HoweDualityReal.lean:21` | source: `IsCMExt`, submodules of `M.Pol ψ τ` containing the first member's relations: bounded chains, and two proper ones have proper sum / README: trivial representation of first member, CM extension, all real places | match |
| 3.47b (ii), unique quotient from it | `n = 1` chain, two maximal submodules `N ≠ N′` | `N ⊔ N′` would be the whole space; source forbids it, so one maximal submodule and one irreducible quotient / README (ii) first assertion | holds |
| 3.47b, "`onePlace` does not use it" | import closure of `KRealAsmOne.lean` (2675 files) | `HoweDualityRealHolds.lean` not in it; `onePlace` (line 143) has no such premise; hypotheses `a + a′ < κ`, `2(p+q)+1 < (a−a′)/2`, `< a′` / README range with `κ ↦ −κ` | match |
| 3.47b *Status* against *Origin* | (i), (iii), (v) | *Status*: (i), (iii) own, (v) adapted / *Origin*: (i) own formulation, identification with `A_𝔮(λ)` adapted from Li, Paul–Trapa | agree |
| 3.47c closing sentence | *Origin* of 3.47c | *Origin*: Tate, Godement–Jacquet, degenerate Whittaker models, "three special cases … with direct proofs" / sentence: special cases, proved directly | agree |
| 5.7b (ii), `SurjSt` | `RightOnto.lean:23` | all `n`, `d`, `USm ν`, `ν ≠ 1`: every Schwartz `Φ` is a full-rank `Φ₀` modulo `aug` / README: every nontrivial unitary character, all `n`, `d` | match |
| 5.7b (ii), `IrrStNe` against `IrrSt` | `KCoinvOfNarrow.lean:145`, `RightOnto.lean:26` | `IrrStNe` = `IrrSt` plus `ν ≠ 1`, both with `n ≤ d` / README: "for nontrivial `ν`", "without the condition `ν ≠ 1`", `n ≤ d` | match |
| 5.7b (ii), `Narrow` | `KCoinvOfNarrow.lean:13`; `a = b`, `χ₁ = χ₂` | hypothesis `a ≠ b ∨ χ₁ ≠ χ₂`, unitary smooth characters, `prod₂ (detRep a χ₁) (detRep b χ₂)` irreducible; the excluded case is `(a, χ₁) = (b, χ₂)` / README `(a, χ₁) ≠ (b, χ₂)` | match |
| 5.7b (ii), supply of `Narrow` | `SphSplitGeo.lean:98` | `irrSt_narrow Close.narrowBern` is applied there, so `narrowBern` proves `Narrow` / README "supplied by" | match |
| 5.7b (ii), `irrSt_of` | `ExistsExtZ.lean:97` | `(hB : Published.BernsteinUnitaryProductIrreducible) : IrrSt`; that prop proved as `PositivityTheory.RgUd.All.bernsteinUnitaryProductIrreducible` (`BernAll.lean:27`) | match |
| 5.7b (ii), "main theorems do not depend on `IrrSt`" | kernel export of the proof | `PositivityTheory.KCo.IrrSt` and `irrSt_of` absent from the exported declarations; `SurjSt`, `IrrStNe`, `irrSt_narrow`, `Narrow`, `SoCoinv` present | holds |
| 5.7b closing sentence | *Origin* of 5.7b | (i), (ii), (iv) adapted from Kudla–Rallis 1994, Ichino 2004; (iii) particular to the proof, in both places | agree |

The rows for the statements the diff does not touch stand as in the previous review, of `2899581`.

- Formal-proof declarations opened: 17 named by the changed text (all exist under the names and files given); the seven files cited are unchanged between the first commit `40e56bab` and the copy read.
- Seeded sample: of the fifteen targets, 3.46a, 3.47c and 5.7b fall in changed text; the changed sentences carry formal-proof locators only, all checked above; no locator into a published source was added or changed.
- Statements: the diff changes no theorem, definition, Check or `*Needs:*` line; no heading, layer or section added, removed or renumbered; `Suggested.lean` untouched.
- Cross-roadmap citations: none added or changed by the diff.
- Automatic checks: all pass on the folder (the only count is the pull request's files in its other folders, which are its own). Dependency check: `depcheck: 122 roadmaps, 1398 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file declares nothing, so no `#check` comparison and no one-tactic probe applied.
- Pull request text: its three passages on this roadmap (the `*Needs:*` of 5.7c; the sections keeping general statements beside a `*Corollary of:*` line; the corrections to 3.21a, 3.47, 3.47b) agree with this head; the change since `2899581` adds credits only and leaves none of them wrong.

Overlap check: read MetaplecticAutomorphicForms, ThetaLiftsForDefiniteUnitaryGroups, RowTowerAndRallisIdentities and LocalFactorsOfTwistsAndTypes as in the previous review; the diff adds no object and moves no ownership; MetaplecticAutomorphicForms owns the general theorems behind 3.3b, 3.9a, 3.45, 3.46, 5.6a and 6.11; nothing else shared.

Source independence: changed passages only; 4 passages compared with 1 source (the formal proof's Lean files, 7 of them), none shared beyond declaration names and file paths; largest share of locators is the formal proof (86 file and 112 declaration locators); arrangement not compared, since the diff adds, removes and reorders no layer.

Research link: Layers 5–6 state, for unitary pairs, Weil's convergence criterion and the Siegel–Weil and Rallis inner product formulas in the convergent range (Weil 1965; Kudla–Rallis 1988; Ichino 2007; Gan–Qiu–Takeda 2014), inputs of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026); README References, KR88b and GQT §11.

## Not verifiable

- Kudla–Sweet 1997 (3.47, 3.47a): no legal copy recorded; the subject of the question above.
- Tate 1950, Kudla–Rallis 1994, Li 1990, Paul–Trapa 2002 (named by the *Origin* labels that the repaired sentences now point to): not among the texts read; the repair was checked against the labels, not against these works.
- Kudla94, Li89, Weil65, KV78, Paul98, Yamana14, GJ72, Rallis87, PSR87, Ichino07, Ichino04, KS97: settled as uncertified.
- That no other route inside the proof of `PositivityTheory.KRealA.onePlace` reaches the Howe duality statement was checked through the import closure and the statement's premises, not by a kernel dependency trace.

## Source issues

- none

## For the human reviewers

- Neither recorded decision bears on this folder: it removes no section or layer, and the move out of GeneralizedRiemannHypothesisFromWindowBounds does not touch it.
- Scope fact: the source with the largest share of locators is the formal proof (86 file and 112 declaration locators), a Lean repository announced on 20 November 2026 (README, References "FormalProof", "Announcement"), not a refereed publication; published theta-correspondence literature carries the rest.
