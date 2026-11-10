# Review of OptimalTransport (pull request #950 at 8e44152)

**Verdict:** needs changes

This is an incremental re-review of the 84 lines changed in the folder since `75e39cd`. They are all in `TauCetiRoadmap/OptimalTransport/PROGRESS.md` and `STATUS.md` and come from merging main; `README.md` and `Suggested.lean` are byte-identical to the files the previous review read. The same merge moved `lake-manifest.json` from Tau Ceti `a91d3aa` / Mathlib `6b7abb3` to main's `2fd255d` / `1b1ccf4`, and that makes one passage of `Suggested.lean` and one of the description wrong.

## R01 (P2) — six headlines are now statable at the pins, and the docstring still says they are not

**Location.** `TauCetiRoadmap/OptimalTransport/Suggested.lean:69–90`: "stated on carriers of Tau Ceti that the Tau Ceti pinned by this file's manifest does not contain, so they are not statable at these pins".

**Claim.** The Borel-cost duality through the relaxed primal (2.5), Figalli–Kim–McCann (6.14), JKO convergence (11.7), metrization by the Sinkhorn divergence (13.4), the heat flow on `RCD(K,∞)` spaces (14.7) and completeness of the Gromov–Wasserstein quotient (15.5) cannot be stated at the pins.

**Witness.** `lake-manifest.json:10` at this head pins Tau Ceti `2fd255d9` (identical to main's manifest). At that pin every named carrier exists; a scratch file importing the eleven modules and running `#check @…` on each elaborates with exit 0:

| Carrier | File and line at `2fd255d` |
|---|---|
| `TauCeti.relaxedTransportCost` | `TauCeti/MeasureTheory/OptimalTransport/Cost/Partial/Basic.lean:126` |
| `TauCeti.SatisfiesWeakMTW` | `…/OptimalTransport/Twist/MaTrudingerWang.lean:170` |
| `TauCeti.IsCConvexSet` | `…/OptimalTransport/Twist/CExponential.lean:100` |
| `TauCeti.IsEVISolution` | `TauCeti/Analysis/GradientFlow/EVI/Basic.lean:96` |
| `TauCeti.GeneralizedGeodesicallyConvex` | `…/OptimalTransport/Wasserstein/GeneralizedGeodesic/Convex.lean:100` |
| `TauCeti.moreauYosidaResolvent` | `TauCeti/Analysis/GradientFlow/MoreauYosida/Basic.lean:124` |
| `TauCeti.boltzmannEntropy` | `…/OptimalTransport/Wasserstein/InternalEnergy/Basic.lean:203` |
| `TauCeti.sinkhornDivergence` | `…/OptimalTransport/Entropic/SinkhornDivergence.lean:86` |
| `TauCeti.cheegerEnergy` | `TauCeti/MeasureTheory/Function/CheegerEnergy.lean:83` |
| `TauCeti.MetricMeasureSpace.CurvatureDimensionInfinity` | `…/OptimalTransport/MetricMeasure/CurvatureDimension.lean:170` |
| `TauCeti.GromovWassersteinSpace` | `…/OptimalTransport/GromovWasserstein/Space.lean:154` |

The pin proves none of the six headlines. For 2.5 it has weak duality (`…/Duality/Relaxed.lean:129`) and exactness for lower semicontinuous, bounded and split-bounded costs, not `P^rel = D` for a Borel cost. For 13.4 it has nonnegativity and definiteness (`SinkhornDivergence.lean:257`, `:271`), not metrization. For 15.5 it has only the direction from a complete quotient to a complete target (`…/GromovWasserstein/Point.lean:84`). No file under `TauCeti/` states the Figalli–Kim–McCann theorem, convergence of the JKO scheme, or the identification of the heat flow. So none of them moves to the docstring's first list: each is a statable headline that `Suggested.lean` does not state. The description says the same: after the merge "the six headlines of the docstring's third list become statable and are to be stated there".

**Repair.** State the six theorems in `Suggested.lean` on these carriers, each with `sorry`, under section comments for Layers 2, 6, 11, 13, 14 and 15 in README order; add the Tau Ceti modules they use to the import list; delete the third list (`:69–90`) from the docstring; add the six names to the README where 2.5, 6.14, 11.7, 13.4, 14.7 and 15.5 state them. As a test of the repair on the pin that refutes the present text, this statement of 15.5 elaborates there, with `sorry` the only warning:

```lean
theorem completeSpace_gromovWassersteinSpace_iff {p : ℝ≥0∞} [Fact (1 ≤ p)]
    {Z : Type*} [MetricSpace Z] :
    CompleteSpace (TauCeti.GromovWassersteinSpace p Z) ↔ CompleteSpace Z := by
  sorry
```

(Check the universe of the quotient against the README's "Polish-carrier" category when stating it: `GromovWassersteinSpace.{u} p Z` quantifies over presentations in `Type u`.) If one of the six turns out to need more than its named carriers, say so in the docstring's second list with the missing carrier, as for the five already there.

## R02 (P3) — the description states the pins the branch had before the merge

**Location.** Pull-request description, "What a reviewer needs to know": "This branch's `lake-manifest.json` pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`." and the paragraph that begins "Merging `origin/main` into the branch moves the pin"; also, under "Acceptance test": "most of them are absent from this branch's pinned Tau Ceti" and "Six are stated on Tau Ceti carriers that this branch's pinned Tau Ceti does not contain".

**Claim.** The branch lags main's pins, and the merge is still to be made.

**Witness.** At `8e44152`, `lake-manifest.json:10` and `:22` give Tau Ceti `2fd255d997f4…` and Mathlib `1b1ccf4b088b…`; `git diff origin/main HEAD -- lake-manifest.json lean-toolchain` is empty. The head is itself the merge of main.

**Repair.** Replace the two paragraphs by one sentence: the branch pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`, as main does, and `Suggested.lean` builds there. Rewrite the "Acceptance test" paragraph to the two lists that remain after R01 (seventeen proved at the pin, five not statable) and the fourteen stated theorems.

## Previous findings

The previous report (at `75e39cd`) was an acceptance with no finding, so there is none to account for. Its own account of the report before it (three findings in 6.11, 6.8 and 13.13, all repaired) stands: those passages are unchanged.

## Verified sound

**What changed.**
- `git diff --stat 75e39cd HEAD -- TauCetiRoadmap/OptimalTransport` lists `PROGRESS.md` (29 lines added) and `STATUS.md` only. Both are main's files: `git diff --stat origin/main HEAD -- TauCetiRoadmap/OptimalTransport` lists only `README.md` and `Suggested.lean`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OptimalTransport'` is empty: the pull request changes no other folder. The files listed as changed outside the folder since `75e39cd` are main's, brought in by the merge.

**Gate, build, dependency check.**
- The worker's gate on this head: every counter `0`, `build=0`, `OK`.
- `lake env lean` on `Suggested.lean` at the new pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): exit 0, exactly eight `declaration uses 'sorry'` warnings, at `:116, :140, :169, :205, :229, :253, :270, :292`. This is the first elaboration at main's pins; the earlier ones were at `a91d3aa`.
- One-tactic probe at the new pins, on a scratch copy with each `sorry` replaced by `first | (simp; done) | rfl | infer_instance | (intros; trivial) | sorry`: all eight still report `sorry`; none closes.
- The worker's elaborated signatures (`signatures.md`): 0 of 8 lost a section binder; the file has no `variable` block.
- The dependency check printed `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `overlaps.md` and `citations.md` list no conflicting head, no dropped id, no unresolved citation or name.

**The carriers of the eight stated theorems across the pin change (seven definitions opened).** Between `a91d3aa` and `2fd255d` the five imported modules changed by 730 added and 88 removed lines, but the only definition the diff adds or removes is the new `MeasureTheory.Measure.diagonalCoupling`. `TauCeti.IsCoupling` (`…/OptimalTransport/Coupling.lean:120`), `transportCost` (`…/Cost/Basic.lean:111`), `IsOptimalCoupling` (`…/Cost/Basic.lean:300`), `IsKantorovichOptimalTransportMap` (`…/Monge.lean:322`), `wassersteinEDist` (`…/Wasserstein/Basic.lean:189`, the infimum over couplings of `eLpNorm (edist) p π`), `HasFiniteMoment` (`…/Wasserstein/Basic.lean:445`, `∃ x, MemLp (edist x ·) p ν`) and `riemannianVolume` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`) have the same bodies at both revisions, so the eight statements mean what they meant when the previous reviews computed their instances.

**Duplication at the new pin.** The worker's library near-matches for the eight declarations give no same-name hit and no Tau Ceti declaration with `IsKantorovichOptimalTransportMap`, `wassersteinEDist` or `IsCoupling` in a matching conclusion. The docstring's first list (seventeen headlines proved at `2fd255d9`) and the README's "From Tau Ceti" contract (`README.md:341–342`) already name that revision, which is now the pinned one; they needed no change.

**The seeded sample.** None of the fifteen sampled targets lies in a changed passage, since the README is unchanged; they were not re-read. Two of them border R01: 6.10 is in the docstring's second list (no boundary-regularity predicate at either pin; unchanged), and 14.3's Cheeger energy is the carrier `TauCeti.cheegerEnergy` that R01 finds at the pin.

**Ownership.** The change adds no construction and no citation. The previous reviews' ownership search of main and the open heads stands for the untouched text.

**Adversarial table.** No statement of the README or of `Suggested.lean` changed. The first rows concern R01; the rest are carried from the previous report (PRREVIEW-OptimalTransport~11, at `75e39cd`), whose statements the diff leaves untouched.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Docstring, third list: "not statable at these pins" | the eleven carriers at `2fd255d` | eleven `#check`s elaborate; types as in R01's table, e.g. `sinkhornDivergence : (X × X → ℝ≥0∞) → ℝ≥0 → Measure X → Measure X → ℝ` | false at this head (R01) |
| 15.5, drafted in R01 | `Z` one point; `Z = ℚ` | one point: every kernel is constant, the quotient is one class, both sides hold; `ℚ`: `Z` not complete, and `Point.lean:84` gives the quotient not complete | the "iff" is consistent with the pin's one direction |
| 2.5 `P^rel = D` against the pin | lower semicontinuous `c` | pin: `P^rel = P` (`Relaxed.lean:163`) and `P = D` (Layer 2.4); Borel `c` with a gap (the README's first Check: `P = 1`, `D = 0 = P^rel`) is not covered by either | not proved at the pin; statable |
| 13.4 against the pin | `μ = ν` | `S_ε(μ,μ) = 0` (`SinkhornDivergence.lean:100`); `:271` gives `S_ε = 0 ↔ μ = ν`; no convergence statement | definiteness only; metrization not proved |
| H1 Gangbo–McCann | `h = x²/2`, `U[0,1] → U[1,2]`; `d = 0` | `T = x+1`, cost `1/2`; one point, cost `0` | holds (carried) |
| H2 Caffarelli | `X = (0,1)`, `Y = (0,2)`, `f = 1`, `g = 1/2` | `T = 2x`, exponent `1` | holds (carried) |
| H3 De Philippis–Figalli | `c = 2 − ⟨x,y⟩`; `c ≡ 0` | `−Dₓc = y` injective; `−Dₓc ≡ 0` | twist excludes `c ≡ 0` (carried) |
| H4 McCann | `M = ℝ`, `U[0,1] → U[1,2]` | `T = x+1`, cost `1/2` | holds (carried) |
| H5 Figalli | `U[0,1] → U[1,2]`, `c = \|x−y\|` | `x+1` costs `1`; `2−x` costs `1` | existence only (carried) |
| H6 Agueh–Carlier | two segments in `ℝ²`; `n = 0` | two midpoint laws of value `1/6`; `dimH univ = 0` forces mass `0` | excluded by the hypothesis; vacuous at `n = 0`, as the docstring says (carried) |
| H7 Gaussian | `n = 1`, `C = (1,4)`, `w = (1/2,1/2)` | `√S = 3/2`, `S = 9/4` | holds (carried) |
| H8 Schrödinger potentials | one-point spaces | `dπ/dR = 1`, `φ + ψ = 0` | holds (carried) |
| 6.8 volume estimates | `u = ‖x‖²/2` | `\|S\|·MA_u(S) = ω_n² 2ⁿ hⁿ` | hold (carried) |
| 6.8 engulfing | `u = ‖x‖²/2`, boundary point | needs `θ ≥ 4` | consistent with `∃ C` (carried) |
| 6.11 item 3 | `n = 3`: `x₁ = 1/3`, `1/2` | `640/2187`; `−10/9` | matches the Checks (carried) |
| 13.13 Schilder | `γ = 2t`; `γ = 2t²` | `2`; `8/3 > 2` | holds (carried) |
| 6.1 | `‖x‖²/2`; `‖x‖` on `ℝ²`; `\|x\|` on `ℝ` | Lebesgue; `π δ₀`; `2δ₀` | hold (carried) |
| 6.2 | `Ω = (−1,1)`, `u = x²−1`, `v = \|x\|−1` | masses `4 ≥ 2`, `v(1/2) = −1/2 > −3/4 = u(1/2)` | holds (carried) |
| 10.5 | `Φ = x²/2`; `−x⁴`; `−x²` | `(1+t/k)^{−k} → e^{−t}`; infimum `−∞`; `(1−2t/k)^{−k} → e^{2t}` | hold (carried) |
| 11.8 | `n = 3`; `n = 1`, `m = 1/4` | `2/3 > 3/5`; moment `5`, `∫ρ^{1/4} = ∞` | hold (carried) |
| 13.13 identity | `π = N(0,I₂)`, `ε = 1` | `−(1/2)log(2π)` on both sides | holds (carried) |

The other rows of the earlier reports (1.2, 1.4, 1.5, 1.6, 2.5 Checks, 5.7, 8.3, 8.4, 10.3, 11.2, 11.3, 12.1, 12.3, 12.4) concern untouched statements and stand as recorded there.

## Not verifiable

- The six statements R01 asks for were not drafted beyond 15.5: whether each can be written on the named carriers alone, at the README's generality, is for the author to settle against the pin; the review checked only that every carrier elaborates.
- **Villani 2003 and 2009**, **Ambrosio–Gigli–Savaré 2008**, **Kechris**, **Huang**, **Dembo–Zeitouni**, **Lisini 2007**: as in the previous reports; none is cited by a changed passage.

## Source issues

- none
