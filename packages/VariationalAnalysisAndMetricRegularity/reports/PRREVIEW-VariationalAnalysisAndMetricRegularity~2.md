# Review of VariationalAnalysisAndMetricRegularity (pull request #2978 at c928486)

**Verdict:** accepted

**Summary.** Accepted: no statement of the README or of `Suggested.lean` was found false, and the three unowned proof routes of the previous review are repaired (Attouch's theorem now runs through owned proximal targets, the Lipschitz characterization through the Mordukhovich criterion, the intersection rule through the sum rule with its own indicator target). There are three small corrections and one format note, none blocking. As in the previous round no cited book could be read legally, so no locator was checked against its text and wording and arrangement were not compared with any source; that, and three licence questions, are left to the human reviewers.

## C01 — The corollary "same proximal map implies equal up to a constant" in 2.4 is a one-line consequence of a theorem ConvexAnalysisAndDuality 4.4 owns, which the roadmap says it does not consume

The envelope target of 2.4 (README lines 302–307) states that two proper closed convex functions with the same proximal map for some `λ` differ by a constant, and the route `(c) ⇒ (a)` uses it. ConvexAnalysisAndDuality 4.4 states, as a named target (uniqueness of the potential), that two proper closed convex functions on a real Hilbert space with the same subdifferential differ by a constant; with the subgradient description of the proximal map in FirstOrderOptimization 3.2, which 2.4 already consumes, equal proximal maps give equal subdifferentials, so the corollary is that theorem. An implementer would otherwise prove the same fact twice by two routes. The smallest change: cite ConvexAnalysisAndDuality 4.4 for the corollary (in the bullet, the *Needs:* line of 2.4 and the supplier contract, where 4.4 is at present listed only for maximal monotonicity and as not consumed), keeping the envelope gradient as this roadmap's own target; or say in one clause why the independent derivation through the gradient is preferred.

## C02 — The scalar rule of 3.3 is stated without the hypothesis under which it holds

The prose target at lines 461–464 reads "`clarkeSubdiff (c • f) x = c • clarkeSubdiff f x` for every real `c`" with no hypothesis on `f` in the sentence, while the roadmap's `clarkeSubdiff` is defined for every `f : E → ℝ` and 3.2 and 3.3 stress which statements need no Lipschitz hypothesis. Read that way the rule fails at `c = 0`: for `f y = y^(1/3)` on `ℝ` the quotients `(f (y - t) - f y) / t` are at most `-1 / (3 δ^(2/3))` for `|y|, t < δ/2`, so `f°(0; -1) = ⊥`, `clarkeSubdiff f 0 = ∅` and `0 • ∅ = ∅`, while `clarkeSubdiff (0 • f) 0 = {0}`. With "for `f` Lipschitz near `x`" (Clarke's setting, and that of the bullet before it) the rule is correct, since the gradient is then nonempty; adding those words settles it.

## C03 — The Layer 1 example on the graphs of `x ↦ n x` points to "the first Check of 2.4", which is a different Check

At lines 217–218 the pointer is to the Attouch Check (`f n x = n x²/2`, line 371), which is the ninth bullet of the Checks of Layer 2 and the third of those about 2.4; the first Check is `sin (n x)`. "the Attouch Check of Layer 2" would find it.

## N01 — The max rule of 3.4 says "finitely many functions" where the Lean statement has a nonempty index type

`clarkeSubdiff_iSup_eq_convexHull` carries `[Nonempty ι]`, and needs it: for an empty index the supremum is the zero function, with gradient `{0}`, and the convex hull of no derivatives is empty. The README sentence (line 486) would say "finitely many, at least one".

## Questions for the author

- 2.4, line 307: is the statement that equal proximal maps force equality up to a constant really Rockafellar–Wets Cor 3.37, p. 95? I recall Chapter 3 of that book as being on cones and horizon functions, with nothing on proximal maps, and expected a locator in Chapter 2, 11 or 12. I could not read the text.
- 5.4, lines 834–846: the Lipschitz characterization is now derived from the Mordukhovich criterion, and the sufficiency half of the criterion is attributed to Rockafellar–Wets "through Ekeland's principle and the variational description of normals". I recall their proof of the criterion as passing through their Thm 9.13, the Lipschitz characterization itself, applied to the distance function `(x, y) ↦ d(y, F x)`; if so, the two routes of 5.4 would lean on each other. Which proof of sufficiency is meant? The Ekeland argument of Mordukhovich and Ioffe that I know uses Fermat's rule with the sum rule of 5.3 for a Lipschitz function plus an indicator, and 5.3 is not on the *Needs:* line of 5.4. I could not read either text to check.
- 4.1–4.3: are the Dontchev–Rockafellar numbers and pages (3E.6 p. 165, 5A.3 p. 255, 5B.4 p. 263, 5D.2 p. 276, 5E.1 p. 280) those of the 2009 printing named in the References? The numbering of that book changed between editions and I could read neither.

## Previous findings

- R01, Attouch's theorem (2.4): repaired. The envelope gradient and "epi-convergence through proximal maps" are now prose targets of 2.4 with hypotheses; the route reduces (b) to (c) by the map `(z, p) ↦ (p, z - p)` and says of the stability of maximal monotonicity that it "is not needed, since the limit is the given `g`"; the *Needs:* line names the Tau Ceti resolvent file and FirstOrderOptimization 3.2, and the boundary bullet now excludes only the nonconvex, prox-bounded case. I redid the reduction (see the table).
- R01, Lipschitz continuity: repaired in form. The statement moved to 5.4 and its converse is proved from "the Aubin form of the criterion [applied] to the epigraphical map `S y = {α : ℝ | f y ≤ α}`", with 4.1 and 5.2 on the *Needs:* line; the mean value inequality is no longer used. The second question above concerns the route this now rests on.
- R01, intersection rule: repaired. The rule moved to 5.3, whose route says "the indicator of `C ∩ D` is the sum of the indicators", and 5.2 has the indicator identity as a target.
- C01 (Lipschitz hypothesis in 3.2): repaired; "no Lipschitz hypothesis is needed, as for Fermat's rule in 3.3", and the Lean statement has none.
- C02 (identification with Γ-convergence): repaired; the Lean statement is `EpiTendsto f g ↔ TauCeti.TendstoGamma f g`.
- C03 (bound `1.001`): repaired; "at most `1.0011` (its largest value, `1.0010013`, is at `x = y = -10⁻³`)".
- N01: repaired (the docstring says 1.3; the name is `tendstoPK_iff_tendsto_infEDist`). N02: repaired (no sentence about the state of other roadmaps or of the build remains). N03: the closing list is now under a plain comment; it still has thirty-three `#check` lines, which is form and not raised again.
- The earlier questions on the route of Thm 6.42 and on the rank example are answered in the text (the route is declared an adaptation with the source's own route named; the example is now the zero set of the Schur complement).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 limits, closedness, sequential form | `{(-1)ⁿ}`, `{1/n}`, `[0,n]`, constant `(0,1)` | outer `{-1,1}`, inner `∅`; `{0}`; `[0,∞)`; `[0,1]` | holds; Checks agree | none |
| 1.2 compactness | `{n}`; empty type | limit `∅`; `D = ∅` | holds | none |
| 1.3 distance criterion | `C n = {n}`, `D = ∅`; `D = (0,1)` | `n − x → ⊤ = infEDist x ∅`; distance functions of `(0,1)`, `[0,1]` equal | both directions; closedness needed | none |
| 1.3 nearest points | `{-1, 1+(-1)ⁿ/n}`, `x = 0`; dimension 0 | nearest `-1` (even), `1 − 1/n` (odd); trivial | convexity needed; Lean form implies distance convergence | none |
| 2.1 `epiTendsto_iff` vs `TendstoGamma` | `g x = ⊤`, `⊥`, real; `min 1 (n|x − 1/n|)` | recovery `u n = x`; points `(x,-k)`; `(u n, max(α, f n (u n)))`; epi-limit `0` at `0`, `1` elsewhere | both directions redone against the two fields | none |
| 2.2 monotone | indicators of `(0,1/n)`; `x² + 1/n` | sup `⊤`, sup of hulls = indicator of `{0}`; `x²` | holds in any space | none |
| 2.3 dense convergence | `n|x|`, `g = ⊤`; `g = ⊥` on a half-line; dimension 0 | pointwise `⊤` off `0`, epi-limit indicator `{0}`; diagonal recovery `→ ⊥`; `f n 0 → g 0` | interior hypothesis needed; improper `g` holds | none |
| 2.4 Wijsman | `(x − 1/n)²/2`; indicator `{-1,1}` | `y²/2 + y/n`: `0.945`, `0.315` at `y = 0.7`; conjugate `|y|` | holds; convexity needed | none |
| 2.4 Attouch, (b) ⇔ (c) | `n x²/2`; `g + n`; `z n = u n + w n` | `2/√(1+n²)`: `0.199, 0.020, 0.002`; epi-limit `⊤`; `e₁ = f n (u n) + ‖w n‖²/2` | reduction correct; 1-Lipschitz graphs: graphical ⇔ pointwise | none |
| 2.4 equal proximal maps | graph of `P_λ f` ↦ graph of `∂f` | `(z,p) ↦ (p, (z−p)/λ)` bijective | equal subdifferentials: ConvexAnalysisAndDuality 4.4 | C01 |
| 2.4 `(c) ⇒ (a)`, properness of the limit `h` | `h = ⊤`; `h = ⊥` somewhere | envelopes `→ ⊤` (bounded proximal points); envelopes `→ ⊥` | both excluded by finite envelope limit | none |
| 3.1 specs | `|·|`, `-|·|` at `0`; `E = 0` | `f° = |v|` both; `[-1,1]`; `{0}` | holds | none |
| 3.2 derivative, convex | `x²` at `1`; filter `pure x ×ˢ 𝓝[>] 0` | `{2}`; `f' v ≤ f°(x;v)` | holds without Lipschitz | none |
| 3.3 Fermat, sum, Lebourg | `-|·|` at `0`; `|·| − |·|`; `|·|` on `[-1,2]`; `x = y` | `0 ∈ [-1,1]`; `{0} ⊊ [-2,2]`; `ζ = 1/3` at `z = 0`; open segment `{x}` | holds | none |
| 3.3 scalar rule | `y^(1/3)`, `c = 0` | `f°(0;-1) = ⊥`, gradient `∅`; `0 • ∅ = ∅ ≠ {0}` | needs Lipschitz near `x` | C02 |
| 3.4 chain, max | `F t = (t,t)`, `g = |y₁| − |y₂|`; `max(y₁,y₂)`; empty index | `{0}` vs `[-2,2]`; `1, -1, 1`; `{0}` vs `∅` | holds; Lean has `Nonempty ι` | N01 |
| 3.5 gradient formula | `|·|` at `0`; dimension 0 | limits `±1`, hull `[-1,1]`; Haar null forces `S = ∅` | holds | none |
| 4.1 equivalence | `F 0 = ℝ`, else `∅`; `{x}`; `{x²}` | `κ = 0`: `|x| ≤ 0·⊤ = 0` fails; modulus `1`; ratios `10, 100, 1000` | holds for `κ > 0`, same modulus | none |
| 4.2 perturbation, strict derivative | `κ = 0`; `F = A`, `g = f − A`; `x + x²/2` | modulus monotone in `κ`; `d(x, A⁻¹y) ≤ c‖y − Ax‖`; `x* = −0.0010005`, ratio `1.0010013` | holds | none |
| 4.3 Robinson–Ursescu | `[x,∞)`; `[|x|,∞)` at `(0,0)` | range `ℝ`; `T⁻¹ y = ∅`, `d(y, T 0) = |y|` | holds; converse via `infEDist < ⊤` | none |
| 4.4 Hoffman | `A = (1,-1)ᵀ`; no rows; `x² ≤ 0` | `L = 1`; `0 ≤ 0`; `1/|x|` unbounded | holds | none |
| 5.1 cones | `{y ≥ -|x|}` at `0`; `[0,1]` at `0`; isolated point | regular `{0}`, limiting rays `(-1,-1)`, `(1,-1)`; `(-∞,0]`; everything vs tangent `{0}` | holds; `x ∈ C` in the Lean | none |
| 5.2 subgradients, convex case, Clarke hull | `-|·|`, `|·|`, `√|·|` at `0` | `∅`, `{-1,1}`, hull `[-1,1]`; `[-1,1]`; horizon `ℝ` | holds; limiting = convex without semicontinuity | none |
| 5.2 epigraphical normals | regular normal `(v,-β)`, `β > 0`, at `(u, α)` | forces `α = f u` and `liminf f ≥ f u` at `u` | first equivalence holds without semicontinuity, as stated | none |
| 5.2 indicators | `w n = c n • (w n / c n)`, `c n = 1/n` | horizon = limiting normal cone | holds | none |
| 5.3 sum, chain, intersection | `-√x`, `-√(-x)`; `f₂ = 0`; constant `F` | `∅`, `∅` vs `ℝ`; horizons `(-∞,0]`, `[0,∞)`; `{0} ⊆ {0}` | qualification needed; degenerate cases consistent | none |
| 5.4 extremal principle | `(-∞,0]`, `[0,∞)`, `a k = 1/k`; `C = D = {x}`; dimension 0 | `(-∞,-1/k]` misses `D`, `v = 1`; any `v ≠ 0`; hypothesis unsatisfiable | holds | none |
| 5.4 Mordukhovich criterion | `{x}`, `{x²}`; `F x = {f x}` smooth | normals line `(1,-1)`; line `(0,1)`; kernel of `Df*` | holds; `∃ κ` same as `∃ κ > 0` | none |
| 5.4 Lipschitz characterization | epigraphical map `[f y, ∞)`; dimension 0 | Aubin gives `f y ≤ f y' + κ‖y − y'‖`; coderivative at `0` = horizon set | derivation from the criterion correct given the criterion | question 2 |

- Source locators checked against the text: 0 of about 78 (no cited text could be read legally; see below).
- Library declarations opened at the pin: `TauCeti.TendstoGamma` (`Topology/Semicontinuity/GammaConvergence.lean:86`), `TauCeti.subdifferential` (`Analysis/Convex/Subdifferential.lean:89`), `TauCeti.fenchelConjugate` (`Analysis/Convex/Conjugate.lean:119`), `TendstoGamma.tendsto_moreauYosida`, `mem_moreauYosidaResolvent_of_tendsto`, `exists_tendsto_mem_moreauYosidaResolvent`, `equicoercive_add_edist_sq_div` (`Analysis/GradientFlow/MoreauYosida/GammaConvergence.lean:82, 90, 101, 129`); the thirty-three Mathlib and Tau Ceti names of the closing `#check` list all elaborate.
- Cross-roadmap citations resolved: VariationalMethods §2.1 and OptimalTransport §10.6 on main; ConvexAnalysisAndDuality 3.1, 3.2, 3.4, 3.5–3.6, 3.7, 4.4 and FirstOrderOptimization 3.2 at their open heads (the cited statements are there with the hypotheses the supplier contracts give).
- Dependency check: `depcheck: 136 roadmaps, 1514 edges, 0 problem(s)`; no upward or cyclic edge. No file outside the folder is changed.
- Elaboration of `Suggested.lean` at the pins: 38 `sorry` warnings, no error, no other warning. Elaborated types compared with the README for all 54 declarations: `[FiniteDimensional ℝ E]` is absent only from five definitions of Layer 5, whose bodies do not need it; every theorem carries its hypotheses.
- One-tactic probe (`rfl`, `simp`, `simp` with the sixteen definitions unfolded, `infer_instance`, `exact?`) on a scratch copy: none of the 38 theorems closes.
- Duplication by object: no Painlevé–Kuratowski limit, epi-convergence, Clarke gradient, metric regularity, Moreau envelope gradient, limiting normal cone or coderivative in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or open; ConvexAnalysisAndDuality's boundary list hands this material away.
- Overlap check: read ConvexAnalysisAndDuality, NonlinearProgrammingOptimality, FirstOrderOptimization, OptimalTransport, VariationalMethods; one shared object, the uniqueness of a closed convex function from its subdifferential (owner ConvexAnalysisAndDuality 4.4; C01); Γ-convergence (Tau Ceti, OptimalTransport §10.6), the convex normal cone (VariationalMethods §2.1), the directional derivative (ConvexAnalysisAndDuality 3.1) and the proximal map (FirstOrderOptimization 3.2) are cited, not restated.

Source independence: 0 passages compared with 0 sources, because no cited text could be read; largest share Rockafellar–Wets, about 43 of 78 locators; contents compared only through the chapter numbers its locators carry (Layer 1 ↔ Ch. 4; Layer 2 ↔ Chs. 2, 7, 11, 12; Layer 5 ↔ Chs. 6, 8, 9, 10; Layers 3 and 4 from other books): not one to one; its table of contents was not opened.

Research link: Layers 4 and 5 state the regularity and coderivative theory of Rockafellar–Wets (1998), Mordukhovich (2006), Dontchev–Rockafellar (2009) and Ioffe (2017); Layers 1–2 serve OptimalTransport §10.6 and Layer 5 extends VariationalMethods §2.1. Rests on the README's references and its downstream section, not on a text read.

## Not verifiable

- Rockafellar–Wets 1998 (sampled locators of 1.1–1.3, 2.2–2.4, 3.2, 3.5, 5.2–5.4): the publisher's copy is paywalled; the copy on the first author's university page was refused by the sources service because the address names no author.
- Clarke 2013 (sampled locators of 3.1–3.5): paywalled.
- Dontchev–Rockafellar 2009 and Ioffe 2017 (4.2): paywalled.
- Mordukhovich 2006 (5.2–5.4): paywalled.
- Hoffman 1952: the journal's host is in no licence class known to the sources service.
- The README flags no locator as unverified.
- The route claims that rest on a source's proof (Rockafellar–Wets Ex 7.32(c) for equicoercivity in 2.4, Thm 7.37 for `(c) ⇒ (a)`, the proof of the criterion in 5.4) were checked only as mathematics, not against the text.

Automatic checks set aside as false positives: the name lookup that reported the perturbation theorem's namespaced name `MetricallyRegularAt.add_lipschitzOnWith` as found nowhere; it is declared in `Suggested.lean` at line 342.

## Source issues

- none

## For the human reviewers

- **Not tested.** Rockafellar–Wets carries about 43 of the 78 locators in the layers; neither its text nor its contents page was read, so wording and arrangement were not compared with it, nor with any other source.
- **Licence.** A full copy of Rockafellar–Wets is on the first author's university page, but the sources service could not classify the address; whether reviewers may read it there is yours to decide.
- **Licence.** Hoffman 1952 resolves to the journal's government host, which the sources service does not classify.
- **Licence.** README lines 1081–1087 name the author's own repository lean-CKMA as a prior formalization of 3.1 and part of 3.5; `clarkeDirDeriv` and `clarkeSubdiff` were not compared with that file, and its licence was not read.
