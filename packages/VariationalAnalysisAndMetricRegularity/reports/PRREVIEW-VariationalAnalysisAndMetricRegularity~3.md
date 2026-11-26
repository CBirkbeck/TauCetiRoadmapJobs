# Review of VariationalAnalysisAndMetricRegularity (pull request #2978 at 9f89fd2)

**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 142 lines changed since `c928486`: the three small corrections and the format note of the previous review are repaired, and the new route for the sufficiency half of the Mordukhovich criterion (Ekeland's principle, Fermat's rule and the sum rule of 5.3) is correct and no longer leans on the Lipschitz characterization it is used to prove. Rockafellar–Wets could be read this round, from the first author's page: 45 of its locators agree with the text in number and page and one page is off by one. There are two small corrections, none blocking; the other four books and Hoffman's paper remain unread, which with two licence questions is left to the human reviewers.

## C01 — The sufficiency route of 5.4 applies the sum rule of 5.3 to the indicator of a graph that is only locally closed

In the route for the Mordukhovich criterion (README lines 845–853) the sum rule is applied to a Lipschitz function "plus the indicator of the graph". The sum rule of 5.3 asks both summands to be lower semicontinuous (in `limitingSubdiff_add_subset`, on the whole space), while the criterion assumes the graph only locally closed at `(x₀, y₀)`, so its indicator need not be lower semicontinuous and the rule does not apply as written. Ekeland's principle needs a complete space in any case. One clause settles both: replace the graph by its intersection with a closed ball about `(x₀, y₀)` on which it is closed; the indicator of that set is lower semicontinuous, and its limiting normals at points interior to the ball are those of the graph.

## C02 — Rockafellar–Wets' Exercise 7.32 is on p. 266, not p. 265

In the route `(a) ⇒ (c)` of 2.4 (line 332) the equicoercivity is taken from "Rockafellar–Wets, Ex 7.32(c), p. 265". The exercise (eventual level boundedness, with part (c) for convex functions as used) is on the printed page 266 (its text, lines 13526 and 13537–13545). The line is not one the change touched.

## Previous findings

The previous report had no finding (R); its small corrections, format note and questions are accounted for here.

- C01 (equal proximal maps and ConvexAnalysisAndDuality 4.4) — repaired: "this is the uniqueness of the potential of ConvexAnalysisAndDuality 4.4, since … the map `(z, p) ↦ (p, (z - p) / λ)` carries the graph of `P_λ f` onto that of the subdifferential"; 4.4 is on the *Needs:* line, in the Dependencies and in the supplier contract.
- C02 (scalar rule of 3.3) — repaired: "for `f` Lipschitz near `x`, `clarkeSubdiff (c • f) x = c • clarkeSubdiff f x` for every real `c`".
- C03 (pointer in the Layer 1 example) — repaired: "this is the Attouch Check of Layer 2".
- N01 (max rule) — repaired: "For finitely many, at least one, functions `f i` strictly differentiable at `x`".
- Question on Cor 3.37 — settled by the text: Rockafellar–Wets' Corollary 3.37 (functions determined by their proximal mappings) is on p. 95 and says what 2.4 says.
- Question on the sufficiency proof — settled: the route is now "an adaptation of Mordukhovich's proof" through Ekeland's principle and 5.3, 5.3 is on the *Needs:* line, and Rockafellar–Wets' proof is named as not followed. Their proof does apply Thm 9.13 to `x ↦ d(u, S x)` on pp. 382–383, as the README now says. The repair leaves the detail of C01 above.
- Question on the Dontchev–Rockafellar edition — open; that book could not be read (see Not verifiable).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.4 equal proximal maps ⇒ equal up to a constant, via ConvexAnalysisAndDuality 4.4 | `f = |·|`, `λ = 1`; `f` and `f + 5`; a subgradient `(p, v)` | `z = 3 ↦ (2, 1)`, `z = 1/2 ↦ (0, 1/2)`, both in the graph of `∂|·|`; same proximal map; `z = p + λ v` gives `P_λ f z = p` | the map is a bijection of graphs; 4.4 on main states the uniqueness on a real Hilbert space | none |
| 2.4 `(c) ⇒ (a)` with the constant from 4.4 | cluster point `h` of a subsequence | `P_λ h = P_λ g`, so `h = g + c`; `e_λ h = e_λ g + c` and envelopes along `z n` give `c = 0` | holds | none |
| 3.3 scalar rule, Lipschitz `f` | `|·|` at `0` with `c = -2`, `c = 0`; `y^(1/3)` | `[-2, 2] = -2 • [-1, 1]`; `{0} = 0 • [-1, 1]`; excluded by the hypothesis | holds | none |
| 3.4 max rule | one function; `max(y₁, y₂)` at `0`; empty index | `{f'}`; hull of `e₁, e₂`; excluded by "at least one", as in the Lean `[Nonempty ι]` | README and Lean agree | none |
| 5.4 criterion, sufficiency route | `F x = {x²}` at `(0,0)`, `z k = -ε`; `F x = {x}`; Ekeland with `ε = ‖z k - y k‖ < r/k`, step `k ε` | minimum of `|y + ε|` on the graph at `(0,0)`, normal `(0, 1)`, so `0 ∈ D*F(0|0)(w)`, `w ≠ 0`; normals `(t, -t)` force `w = 0`; `x̃` within `k ε < r`, slope `1/k`; `‖a k‖ ≤ 1/k`, `1 - 1/k ≤ ‖w k‖ ≤ 1 + 1/k` | route correct; uses only 4.1, 5.2, 5.3 and the first half of the Lipschitz route; no circle | C01 |
| 5.4 Lipschitz characterization against the criterion | order of derivation | criterion (Ekeland, 5.3) → Aubin form → epigraphical map; 5.3 routes use 5.1, 5.2 only | no target derived from itself | none |

The rows for the untouched statements stand as in the previous review, of `c928486`; `Suggested.lean` is unchanged since that head.

- Source locators checked against the text: 46 of Rockafellar–Wets (number and printed page; printed page = page of the cached file − 8), 45 agreeing and one off by a page (C02); statements read in full for Thm 2.26(b), Cor 3.37, Thm 7.37, Ex 7.32, Thm 9.13, Thm 9.40 with its proof, Thm 12.35. The locators of Clarke, Mordukhovich, Dontchev–Rockafellar, Ioffe and Hoffman: 0.
- Cross-roadmap citations resolved on main: ConvexAnalysisAndDuality 4.4 (the target named uniqueness of the potential, `TauCetiRoadmap/ConvexAnalysisAndDuality/README.md` lines 754–756) and 3.1–3.2; FirstOrderOptimization 3.2 (subgradient description, lines 328–340); the relative links added to ConvexAnalysisAndDuality, FirstOrderOptimization, NonlinearProgrammingOptimality and OptimalTransport point to folders on main.
- Dependency check: `depcheck: 106 roadmaps, 1216 edges, 0 problem(s)`; no upward or cyclic edge. No file outside the folder is changed.
- Automatic checks on this head: all passed. Elaboration of `Suggested.lean` at the pins: 38 `sorry` warnings, no error, no other warning.
- Pull request text read against this head: the supplier list (with 4.4 consumed in 2.4), the counts (52 headlines, 38 `sorry`s) and the imports agree with it; nothing to correct.
- Duplication: the change adds no object; it replaces an independent derivation by a citation of ConvexAnalysisAndDuality 4.4.
- Overlap check: read ConvexAnalysisAndDuality, NonlinearProgrammingOptimality, FirstOrderOptimization; one shared object, the uniqueness of a closed convex function from its subdifferential, owner ConvexAnalysisAndDuality 4.4, now cited and not restated; the proximal map (FirstOrderOptimization 3.2) and the directional derivative (ConvexAnalysisAndDuality 3.1) are cited as before.

Source independence: changed passages only; 3 passages (the proximal corollary of 2.4, the `(c) ⇒ (a)` route, the sufficiency route of 5.4) compared with 1 source, Rockafellar–Wets, none shared (the sufficiency route differs from the source's in substance); largest share Rockafellar–Wets, about 43 of 78 locators; the change adds, removes or reorders no layer, so the arrangement was not compared again (previous result, by chapter numbers: not one to one).

Research link: Layers 4 and 5 state the regularity and coderivative theory of Rockafellar–Wets (1998), Mordukhovich (2006), Dontchev–Rockafellar (2009) and Ioffe (2017); Layers 1–2 serve OptimalTransport §10.6 and Layer 5 extends VariationalMethods §2.1. Rests on the README's references and downstream section, and on Rockafellar–Wets Chs. 7, 9 and 12 as read.

## Not verifiable

- Mordukhovich 2006 (Thm 4.1, pp. 378–381, Thm 4.5, pp. 382–383, and Lemma 2.32, p. 214, named in the new route of 5.4): paywalled; not in the sources cache.
- Clarke 2013 (Prop 10.11, p. 199, and Cor 10.23, p. 206, in the changed bullets of 3.3 and 3.4): paywalled; not in the sources cache.
- Dontchev–Rockafellar 2009 and Ioffe 2017: paywalled; whether the cited numbers are those of the 2009 printing was not checked.
- Hoffman 1952: the journal's host is in no licence class known to the sources service.
- The README flags no locator as unverified.

## Source issues

- none

## For the human reviewers

- **Not tested.** Rockafellar–Wets (about 43 of 78 locators) was read this round for locators and for the changed passages only; its table of contents was compared with the layers only through chapter numbers. No other cited text was read.
- **Licence.** The copy of Rockafellar–Wets read is the one in the worker's sources cache, taken from the first author's university page (an address with his initials only); whether that page is an acceptable place is yours to confirm.
- **Licence.** Hoffman 1952 resolves to the journal's government host, which the sources service does not classify.
- **Licence.** The README's section on prior formalization names the author's own repository lean-CKMA for 3.1 and part of 3.5; `clarkeDirDeriv` and `clarkeSubdiff` were not compared with that file, and its licence was not read.
