# Review of VariationalAnalysisAndMetricRegularity (pull request #2978 at d3b0358)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: three proof routes (Attouch's theorem in 2.4, the horizon characterization of Lipschitz continuity in 5.2, the intersection rule in 5.1) rest on results that no layer, supplier or pinned declaration provides, and two of those results are on the roadmap's own list of material not to be implemented. No stated theorem was found false: every statement of `Suggested.lean` was tested on degenerate instances and the README's Checks were recomputed. There are three small corrections and three format notes, none blocking. No cited source could be read legally from this worker, so no locator was checked against its text; that, and two licence questions, are left to the human reviewers.

## R01 (P2) — Three proof routes use results that nothing in the roadmap, its suppliers or the pinned libraries provides, and two of them are on the list of material not to be implemented

An implementer who follows these routes reaches a step with no owner, and for two of them the boundary list says not to build the missing step under this roadmap.

*Attouch's theorem (2.4, route at lines 312–317; Needs at lines 319–320).* The route proves (a) ⇒ (b) "by convergence of Moreau envelopes and the identity between proximal maps and resolvents of subdifferentials", and (b) ⇒ (a) by the theorem that a graphical limit of maximal monotone maps is maximal monotone, cited to Rockafellar–Wets Thm 12.32. None of the three is a target of any layer, and the Needs line lists only 2.1, 2.3, the Tau Ceti conjugate and subdifferential, and ConvexAnalysisAndDuality 4.4 (maximal monotonicity of one subdifferential, which says nothing about limits). The boundary list (lines 995–996) puts "Moreau envelopes and proximal maps under epi-convergence" outside the roadmap, and Scope (lines 910–911) hands proximal maps to FirstOrderOptimization, while the supplier contracts end with "This roadmap consumes nothing else from other roadmaps". The pinned Tau Ceti does have part of the first input: `TauCeti.TendstoGamma.tendsto_moreauYosida` and `TauCeti.TendstoGamma.exists_tendsto_mem_moreauYosidaResolvent` (`TauCeti/Analysis/GradientFlow/MoreauYosida/GammaConvergence.lean`, lines 82 and 101) give convergence of envelopes and of resolvent steps under Γ-convergence with equicoercivity. Smallest change: in 2.4 add, as prose targets with hypotheses, the stability of maximal monotonicity under graphical limits in finite dimension and the resolvent description of the subdifferential (or cite FirstOrderOptimization 3.2 for the latter and list it in the supplier contracts); name the two Tau Ceti declarations, reached through the bridge of 2.1, in the Needs line; and reword the boundary bullet so that it excludes only what 2.4 does not use.

*Lipschitz continuity (5.2, route at lines 732–734).* For the direction from a trivial horizon subdifferential to the Lipschitz property the route says only that the source uses "a variational argument with the mean value inequality". The mean value inequality for lower semicontinuous functions is on the boundary list (lines 1001–1002), and the Needs line of 5.2 (3.1, 3.5, 5.1, the Tau Ceti subdifferential) contains nothing that could replace it. Smallest change: state the inequality actually used as a prose target of 5.2 with its hypotheses, or give a route through what the roadmap owns (for example through 4.1 and 5.4 applied to the epigraphical map `x ↦ [f x, ∞)`, with the Needs line and the layer order adjusted, since 5.4 currently needs 5.2).

*Intersection rule (5.1, route at lines 694–695; Needs at lines 697–698).* The route goes "through the sum rule 5.3 applied to the indicators", but the Needs line of 5.1 names only 1.1, `posTangentConeAt` and the convex normal cone, and 5.3 needs 5.2, which needs 5.1: as written the subsection depends on a later one. The step from the sum rule to normal cones also needs that the limiting and the horizon subdifferential of the indicator of a closed set `C` at `x ∈ C` are both the limiting normal cone, which is stated nowhere (the Check at lines 812–816 uses it for `{0}`). Smallest change: add that identity as a target of 5.2, and give the intersection rule its own Needs line (5.2, 5.3), or move the rule to 5.3.

## C01 — The first clause of the derivative headline of 3.2 assumes "Lipschitz near `x`", which the statement does not need

In `mem_clarkeSubdiff_of_hasFDerivAt_and_eq_of_hasStrictFDerivAt` (`Suggested.lean` lines 250–255; README line 397) the membership `f' ∈ clarkeSubdiff f x` holds for every `f` with Fréchet derivative `f'` at `x`: the filter `pure x ×ˢ 𝓝[>] 0` is finer than `𝓝 x ×ˢ 𝓝[>] 0`, an upper limit in `EReal` can only decrease along a finer filter, and along `y = x` the quotient tends to `f' v`, so `f' v ≤ f°(x; v)` for all `v`. This is the argument the README already uses for Fermat's rule in 3.3, where it says "no Lipschitz hypothesis is needed". Dropping the hypothesis, or saying in one clause why it is kept, would make the two subsections agree.

## C02 — The characterization of 2.1 promises the identification with Tau Ceti's Γ-convergence, but the Lean statement does not mention it

The README says of `epiTendsto_iff` that "the identification of the two notions is part of this target" (lines 238–241). The Lean statement (`Suggested.lean` lines 143–149) instead writes out the two conditions, which are word for word the fields `le_liminf` and `exists_tendsto_limsup_le` of `TauCeti.TendstoGamma` (`TauCeti/Topology/Semicontinuity/GammaConvergence.lean`, lines 86–92), so the acceptance test never touches the library's notion and a later change to that structure would go unnoticed. The module exists at the pin and can be imported; stating the target as `EpiTendsto f g ↔ TauCeti.TendstoGamma f g` would say what the README says. If the unfolded form is preferred, the README sentence would say that the Lean statement is the unfolded one.

## C03 — The Lyusternik–Graves Check of Layer 4 gives a bound that the computation slightly exceeds

The Check at lines 634–636 says the ratio `d(x, f⁻¹ y) / |y - f x|` for `f x = x + x²/2` over `|x|, |y| ≤ 10⁻³` "is at most `1.001`". With `x*` the root of `f x* = y` near `0`, the ratio is `1 / (1 + (x + x*)/2)`; at `x = y = -10⁻³` one has `x* = -1 + √0.998 ≈ -0.0010005` and the ratio is `≈ 1.0010013`. The conclusion drawn (every `κ > 1` works, no `κ < 1` does) is unaffected; "about `1.001`" or "at most `1.0011`" would be exact.

## N01 — Two labels in `Suggested.lean` do not match what they refer to

The docstring of `tendstoPK_iff_tendsto_nearestPoint` (line 117) is labelled "1.4", but the README has no 1.4: the target is the second headline of 1.3. The name `tendstoPK_iff_tendsto_infEdist` spells Mathlib's `infEDist` with a lower-case `d`.

## N02 — Some sentences describe the state of the repository rather than the mathematics

"an open roadmap, not on main" (lines 43, 50–52, 307, 906, 909, 911, 964) and "The module is at the pin but not built in this repository's dependency" (lines 954–955) will be out of date as soon as those roadmaps merge or the module is built; the roadmap name and section suffice.

## N03 — The closing block of `Suggested.lean` is a heading over thirty-three `#check` lines with no declaration

The block "Suppliers named in the README" (lines 542–576) pins library names, some of which the README says it does not use (`UpperHemicontinuous`, `LowerHemicontinuous`). It would read more naturally without a layer-style heading, or reduced to the declarations the statements and routes use.

## Questions for the author

- 5.1, line 695: is the proof of the intersection rule in Rockafellar–Wets (Thm 6.42) really through the sum rule for indicators? I recall it being derived in Chapter 6 from the rule for inverse images of sets, before any subgradient calculus; I could not read the text to check.
- Layer 5 Examples, lines 829–831: how does the chain rule 5.3 give the normal cone to the matrices of rank at most `r`? For the factorization map `φ` the composite of the indicator with `φ` is identically `0`, so the inclusion of 5.3 is trivial; the unconditional regular inclusion gives only that regular normals annihilate the range of `Dφ`. I could not decide whether a different composition is meant.
- 4.1, lines 537–544: the References list the 2009 edition of Dontchev–Rockafellar. Are the numbers 3E.6 and the pages 159, 164, 165 from that printing? I recall the numbering of §3E differing between editions and could not read either.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 limits, closedness, sequential form | `{(-1)ⁿ}`, `{1/n}`, `[0,n]`, constant `(0,1)` in `ℝ` | outer `{-1,1}`, inner `∅`; `{0}`; `[0,∞)`; `[0,1]` (closure) | holds; README Checks agree | none |
| 1.2 compactness | `{n}` in `ℝ`; empty type | limit `∅` along every subsequence; `D = ∅` | holds; diagonal route gives outer ⊆ inner | none |
| 1.3 distance criterion | `D = ∅`, `C n = {n}`; `D` not closed `(0,1)`; some `C n = ∅` | `infEDist x {n} = n − x → ⊤ = infEDist x ∅`; distance functions of `(0,1)`, `[0,1]` equal | holds both directions; closedness needed | none |
| 1.3 nearest points | `{-1, 1+(-1)ⁿ/n}`, `x = 0` | nearest point `-1` (n even), `1 − 1/n` (n odd): no limit | convexity needed; statement holds | N01 label |
| 1.3 Pompeiu–Hausdorff | `{0,n} → {0}`; `D = ∅` bounded | `hausdorffEDist = n → ⊤`; `C n` eventually `∅`, distance `0` | holds | none |
| 2.1 `EpiTendsto`, `epiTendsto_iff` | `g x = ⊤`, `g x = ⊥`; `min 1 (n|x − 1/n|)`; `sin(nx)` | recovery `u n = x`; points `(x,-k)`; epi-limit `0` at `0`, `1` elsewhere; `-1` | both directions proved by hand | C02 |
| 2.2 monotone sequences | indicators of `(0,1/n)`; `x² + 1/n` | sup `⊤`, sup of hulls = indicator of `{0}`; limit `x²` | holds; hull order matters as stated | none |
| 2.3 dense pointwise convergence | `n|x|` with `g = ⊤`; `g ≡ ⊥`, `f n = -n`; dimension `0` | pointwise `⊤` off `0`, epi-limit indicator `{0}`; both sides `⊥`; reduces to `f n 0 → g 0` | interior hypothesis needed; holds for improper `g` | none |
| 2.4 Wijsman | `(x − 1/n)²/2`; indicator `{-1,1}` vs `[-1,1]` | conjugate `y²/2 + y/n`: `0.945`, `0.315` at `y = 0.7`; both conjugates `|y|` | holds; convexity needed | none |
| 2.4 Attouch | `n x²/2`; `g + n` | distance `(0,2)` to graph `2/√(1+n²)`: `0.199, 0.020, 0.002`; same subdifferential, epi-limit `⊤` | statement holds on instances; route unowned | R01 |
| 3.1 `clarkeDirDeriv`, `clarkeSubdiff` specs | `|·|`, `-|·|` at `0`; `E = 0`; `K = 0` | `f°(0;v) = |v|` both; set `[-1,1]`; `{0}`; `{0}` | holds; frozen-base variant gives `-|v|`, supports `∅` | none |
| 3.2 derivative headline | `x²` at `1`; arbitrary differentiable `f` | `{2}`; `f' v ≤ f°(x;v)` by filter restriction | holds, also without Lipschitz hypothesis | C01 |
| 3.3 Fermat, sum, Lebourg | `-|·|` at `0`; `|·| + (-|·|)`; `|·|` on `[-1,2]`; `x = y` | `0 ∈ [-1,1]`; `{0} ⊊ [-2,2]`; `ζ = 1/3` at `z = 0`; `0 = ζ 0` | holds; local max via `y = x − t v` | none |
| 3.4 chain, max | `F t = (t,t)`, `g = |y₁| − |y₂|`; `max(y₁,y₂)` | `{0}` vs image `[-2,2]`; `f°(0;v) = 1, -1, 1` at three `v` | holds; surjectivity needed for equality | none |
| 3.5 gradient formula | `|·|` at `0`; dimension `0` | limits `±1`, hull `[-1,1]`; `S = ∅` forced, `{0}` | holds | none |
| 4.1 equivalence | `F 0 = ℝ`, `F x = ∅`; `F x = {x}`; `F x = {x²}` | `κ = 0`: Aubin holds, regularity reads `|x| ≤ 0·⊤ = 0`; modulus `1`; ratio `1/√y` | holds for `κ > 0` with the same modulus (two-case proof redone) | none |
| 4.2 perturbation, strict derivative | `κ = 0`; `F = A`, `g = f − A`; `x + x²/2` | `κ' > 0` suffices; perturbed map `{f x}`, base `f x₀`; ratio up to `1.0010013` | holds; `ℝ≥0` subtraction safe under `κμ < 1` | C03 |
| 4.3 Robinson–Ursescu | `[x,∞)`; `[|x|,∞)` at `(0,0)`; `κ = 0` in converse | range `ℝ`; `T⁻¹ y = ∅` for `y < 0`; `infEDist < ⊤` gives nonempty fibre | holds | none |
| 4.4 Hoffman | `A = (1,-1)ᵀ`; `m` empty; `x² ≤ 0` | distance `= ‖(Ax − b)₊‖∞`, `L = 1`; `0 ≤ 0`; ratio `1/|x|` unbounded | holds; Tau Ceti has only the homogeneous case | none |
| 5.1 cones, polarity, convex case | `{y ≥ -|x|}` at `0`; `[0,1]` at `0`; isolated point | regular `{0}`, limiting two rays; `(-∞,0]`; regular cone everything, tangent `{0}` | holds; `[FiniteDimensional]` present in elaborated type | none |
| 5.1 intersection rule | `C = (-∞,0]`, `D = [0,∞)` | `N_C = [0,∞)`, `N_D = (-∞,0]`: qualification fails, `N_{C∩D} = ℝ` still the sum | statement consistent; route needs 5.3 | R01 |
| 5.2 subgradients | `-|·|`, `|·|`, `√|·|` at `0`; indicator of a point | `∅`, `{-1,1}`; `[-1,1]`; horizon `ℝ`; horizon whole dual | holds; convex case needs no semicontinuity | R01 (route) |
| 5.3 sum and chain rules | `f₁ = -√x`, `f₂ = -√(-x)` | `f₁' = -5, -50, -500`; horizons `(-∞,0]`, `[0,∞)`; sum has `∂ = ℝ`, terms `∅` | qualification needed; holds | none |
| 5.4 extremal principle | `(-∞,0]`, `[0,∞)`, `a k = 1/k`; dimension `0` | translate `(-∞,-1/k]` misses `D`; `v = 1`; hypothesis unsatisfiable | holds | none |
| 5.4 Mordukhovich criterion | `{x}`, `{x²}`; `E' = 0`; `E = 0` | normals: line through `(1,-1)`, resp. `(0,1)`; both sides true; both sides say `y₀ ∈ int F 0` | holds | none |

- Source locators checked against the text: 0 of 78 (no cited text could be read legally; see below).
- Library declarations opened at the pin: 19 (among them `TauCeti.subdifferential`, `Analysis/Convex/Subdifferential.lean:89`; `TauCeti.TendstoGamma`, `Topology/Semicontinuity/GammaConvergence.lean:86`; `TauCeti.exists_forall_abs_apply_sub_le_of_forall_neg_le`, `Geometry/Convex/Cone/ErrorBound.lean:104`; Mathlib `posTangentConeAt`, `Analysis/Calculus/TangentCone/Defs.lean:132`; `ContinuousLinearMap.NonlinearRightInverse`, `Analysis/Normed/Operator/Banach.lean:38`).
- Cross-roadmap citations resolved: 9 (VariationalMethods §2.1 on main; OptimalTransport §10.6 on main; ConvexAnalysisAndDuality 3.1, 3.2, 3.4, 3.5–3.6, 3.7, 4.4 at its open head; the local copy of `dirDeriv` agrees with that head character for character).
- Dependency check: `depcheck: 150 roadmaps, 1716 edges, 0 problem(s)`; no upward or cyclic edge.
- Elaboration of `Suggested.lean` at the pins: 38 `sorry` warnings, no error, no other warning. `#check @name` types compared with the README for all 54 declarations: `[FiniteDimensional ℝ E]` is absent only from six definitions of Layer 5, whose bodies do not need it; every theorem carries it.
- One-tactic probe (`rfl`, `simp`, `simp` with all definitions unfolded, `infer_instance`) on a scratch copy: none of the 38 theorems closes.
- Duplication by object: no Painlevé–Kuratowski limit, epi-convergence, Clarke gradient, metric regularity, limiting normal cone or coderivative in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or open, apart from the boundary list of ConvexAnalysisAndDuality, which hands exactly this material away.
- Overlap check: read ConvexAnalysisAndDuality, NonlinearProgrammingOptimality, FirstOrderOptimization, KakutaniFixedPointAndContinuousGames, OptimalTransport, VariationalMethods; nothing shared (Γ-convergence: Tau Ceti and OptimalTransport §10.6; convex normal cone: VariationalMethods §2.1; directional derivative and maximal monotonicity: ConvexAnalysisAndDuality; proximal map: FirstOrderOptimization; all cited, none restated).

Source independence: 0 passages compared with 0 sources, because no cited text could be read; largest share Rockafellar–Wets, 42 of 78 locators; contents compared only through the chapter numbers its locators carry (Layer 1 ↔ Ch. 4; Layer 2 ↔ Chs. 7, 11, 12; Layer 5 ↔ Chs. 6, 8, 9, 10; Layers 3 and 4 from other books): not one to one; its table of contents was not opened.

Research link: Layers 4 and 5 state the regularity and coderivative theory of Rockafellar–Wets (1998), Mordukhovich (2006), Dontchev–Rockafellar (2009) and Ioffe (2017); Layers 1–2 serve OptimalTransport §10.6 and Layer 5 extends VariationalMethods §2.1. Rests on the README's references and its downstream section, not on a text read.

## Not verifiable

- Rockafellar–Wets 1998 (all sampled locators of 1.1–1.3, 2.1–2.4, 5.1, 5.3, 5.4): publisher copy paywalled; the copy on an author's university page was refused by the sources service because the address names no author.
- Clarke 2013 (sampled locators of 3.1, 3.3): paywalled.
- Dontchev–Rockafellar 2009 (sampled locators of 4.1–4.3): paywalled.
- Mordukhovich 2006 (5.1, 5.4): paywalled.
- Ioffe 2017 (4.1–4.3): no legal copy found.
- Hoffman 1952 (4.4): the journal's host is in no licence class known to the sources service.
- The README flags no locator as unverified.
- Ownership against open pull requests was checked with the roadmap search over all open heads, not only the listed checkouts.

Automatic checks set aside as false positives: the name lookup that reported the perturbation theorem's namespaced name `MetricallyRegularAt.add_lipschitzOnWith` as found nowhere; it is declared in `Suggested.lean` at line 345.

## Source issues

- none

## For the human reviewers

- **Not tested.** Rockafellar–Wets carries 42 of the 78 locators in the layers; neither its text nor its contents page was read, so wording and arrangement were not compared with it (nor with any other source).
- **Licence.** A full copy of Rockafellar–Wets is on the first author's university page, but the sources service could not classify the address; whether reviewers may read it there is yours to decide.
- **Licence.** Hoffman 1952 resolves to the journal's government host, which the sources service does not classify.
- **Licence.** README lines 1006–1014 name the author's own repository lean-CKMA as a prior formalization of 3.1 and part of 3.5; I did not compare `clarkeDirDeriv` and `clarkeSubdiff` with that file or read its licence.
