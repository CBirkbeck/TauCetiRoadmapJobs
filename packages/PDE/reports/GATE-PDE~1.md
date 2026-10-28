# GATE-PDE~1: answers to the human review of the PDE roadmap revision

Head reviewed: `90cd369`. Points are numbered in the order they appear in the review thread. The
three reviews of 2026-09-08, 09-14 and 09-22 were posted against earlier heads, so for each of
their points this report checks whether the repair is present at `90cd369`. The author's two
replies make factual claims, and each claim is checked as its own point.

## H01 (CBirkbeck) — applied

The Hölder estimate no longer has a scale-free constant. At `90cd369` the primitive statement is the ball estimate `weakSolution_holderOn_ball` (`TauCetiRoadmap/PDE/README.md`, "The end goal (v1)", commented Lean block). Its bound is `holderConstant n (Λ/λ) p₀ · r^(−α−n/p₀) · ‖u‖_{L^{p₀}(B_{2r})}`, with exponent `holderExponent n (Λ/λ)`. The compact-subset corollary `weakSolution_holderOn` carries an explicit radius `d` with `ball x (2d) ⊆ Ω`, and its factor is `d^(−α−n/p₀)`. The shrinking-ball witness `u = x₁` now scales the same way on both sides: the left side is `(2r)^(1−α)` and the right side is `C·c·r^(1−α)`. The README states this witness next to the statement.

## H02 (CBirkbeck) — applied

At `90cd369`, Lane C.13 opens with a warning that Hopf does not inherit the standing bounded-measurable hypotheses, and it gives the half-disk example. Recomputed: with `a = e_r⊗e_r + s²e_θ⊗e_θ` and `u = r^s sin θ`, `a∇u = s r^(s−1) sin θ e_r + s² r^(s−1) cos θ e_θ`, so `div(a∇u) = r^(−1)(s² r^(s−1) sin θ − s² r^(s−1) sin θ) = 0`, and `u(0,t)/t = t^(s−1) → 0`. The first Hopf milestone is now the classical Gilbarg–Trudinger Lemma 3.4, and the weak divergence-form version is a separate milestone.

## H03 (CBirkbeck) — applied

This repeats H01. The repair is the same: a ball estimate with `r^(−α−n/p₀)` and `Λ/λ`, and a compact-set corollary with an explicit radius `d`.

## H04 (CBirkbeck) — applied

This repeats H02. Lane C.13 no longer groups Hopf with the bounded-measurable DGNM hypotheses.

## H05 (CBirkbeck) — applied

At `90cd369`, C.13 states two distinct contracts.

- **Classical non-divergence lemma (Gilbarg–Trudinger, Lemma 3.4).**
  - Operator: `aⁱʲ∂ᵢ∂ⱼu + bⁱ∂ᵢu + cu` with symmetric `a`, constants `0 < λ ≤ Λ`, and bounded `b, c`.
  - Solution and boundary point: `u ∈ C²(Ω)` with `Lu ≥ 0`, continuous at `x₀`, a strict boundary maximum, and an open interior ball.
  - Zero-order cases: `c = 0`; or `c ≤ 0` and `u(x₀) ≥ 0`; or `u(x₀) = 0`.
  - Conclusion: a positive normal liminf. The derivative form is a corollary that assumes the derivative exists.
- **Rosales' Theorem 4.1 with Remark 4.2.** I checked this contract against the paper at Rosales2018 lines 521–538 and 854–858:
  - `aⁱʲ, bⁱ ∈ C^{0,α}`, `cⁱ ∈ L^q`, and `d ∈ L^{q/2} ∩ L^{1,α}`, with `q > n`;
  - `b, d` weakly non-positive;
  - `a` symmetric at `−eₙ`;
  - `u ∈ C ∩ W^{1,2}` a weak supersolution with `u > u(−eₙ) = 0`;
  - conclusion: a liminf.

  All of these match the README.

The pattern pass turned up one wrong sentence in the same paragraph. It said that for *Lipschitz* `a` the divergence-form case reduces to the classical lemma with drift `bⁱ = ∂ⱼaʲⁱ`. That sentence has two defects:

- **Index order.** For the roadmap's `∂ⱼ(aⁱʲ∂ᵢu)` the drift is `∂ⱼaⁱʲ`, and the two differ for non-symmetric `a`.
- **Regularity.** For Lipschitz `a` the drift exists only a.e., so the hypothesis `Lu ≥ 0` cannot hold pointwise, and Lemma 3.4 together with its weak maximum principle (GT Theorem 3.1) does not apply as stated.

The new text (README C.13, `For a ∈ C¹(Ω) with bounded first derivatives …`) gives the reduction for `C¹` coefficients with drift `bⁱ = ∂ⱼaⁱʲ`. It sends the Lipschitz case to the a.e. strong-solution maximum principle (ABP).

## H06 (CBirkbeck) — applied

The constancy claim for exponents above one is now stated on a connected open set. `TauCetiRoadmap/PDE/Suggested.lean` (module docstring) says that constancy is forced on a connected open set such as the ball, and is not forced on an arbitrary connected `K`. One further edit fixes the sentence's grammar: "`HolderOnWith` takes a finite `ℝ≥0` constant and exponent above 1 forces …" → "`HolderOnWith` takes a finite `ℝ≥0` constant and a `ℝ≥0` exponent, and an exponent above 1 forces …".

## H07 (kim-em) — answered

The reply's claims about C.13 hold at `90cd369`: the classical contract, the sign convention, the liminf conclusion, the derivative corollary, the named classical weak maximum principle (GT 3.1/3.2), Rosales' contract (checked in H05), and the reworded strong-maximum-principle bullet. One claim does not hold as written: that the Lipschitz-coefficient `C²` divergence case reduces to this lemma with drift `∂ⱼaʲⁱ`. It is now restricted to `C¹` coefficients with drift `∂ⱼaⁱʲ`, and the Lipschitz case is routed through ABP (see H05).

## H08 (kim-em) — answered

Confirmed: the connected-open qualification is in `Suggested.lean`, and the README has no other occurrence of the exponent-above-one claim. Only the grammar fix in H06 was added.

## H09 (CBirkbeck) — applied

At `90cd369` the finite-p restriction is in place everywhere it is needed:

- Lane A.2 defines `W^{k,p}_0` as a closure for `1≤p≤∞`.
- Lane A.2 restricts Meyers–Serrin and whole-space `W^{k,p}_0 = W^{k,p}` to `1≤p<∞`, and lists the constant 1 on ℝⁿ, `|x|` on (−1,1) and `x(1−x)` on (0,1) as endpoint counterexamples. Recomputed: `ess sup|g − sign| ≥ 1` for any continuous `g`, and the `C_c^∞` closure misses the boundary slopes ±1 of `x(1−x)`.
- The inventory and A.6 keep the trace-kernel claim to finite p.

One premise of the review is not accurate for the roadmap's pin. Meyers–Serrin is not only in a newer Tau Ceti. At the pinned Tau Ceti:

- `TauCeti.W1p.dense_contDiffOn_representatives` (`TauCeti/Analysis/Sobolev/W1p/MeyersSerrin.lean`, `hp : p ≠ ⊤`) proves the order-1 theorem on an arbitrary open set.
- `TauCeti.Wkp.dense_contDiff_representatives` (`Wkp/SmoothDensity.lean`) and `TauCeti.wkp0Submodule_top_eq_top` (`Wkp/Density.lean`) prove smooth density in every order and `W^{k,p}_0 = W^{k,p}` on the whole space.

A.2 had said to "consume … when available at the pin, otherwise build". It now cites these three declarations as consumed and keeps only the orders `k ≥ 2` on a general open set as a target. The inventory bullet was changed to match.

## H10 (CBirkbeck) — applied

At `90cd369`, "Separate zero-boundary and mean normalization" ("Getting the statements right") and Lane A.5 keep the two inequalities apart:

- **Zero-trace Poincaré** is stated for closure-defined `W^{1,p}_0` on a bounded open set, for `1≤p≤∞`, with no connectedness assumption.
- **Poincaré–Wirtinger** is stated on a nonempty *connected* bounded Lipschitz domain. A componentwise variant is given, and the two-disjoint-balls counterexample is a required acceptance item.

Recomputed: with `u = ±1` on two equal balls, `∫u = 0` and `∇u = 0`, but `‖u‖_p = (2|B|)^(1/p) > 0`.

## H11 (CBirkbeck) — applied

At `90cd369` both commented signatures package the bound as `Real.toNNReal (…)` of a real expression, with a Bochner integral that `hInt` makes finite. The note below them requires proving `(Real.toNNReal B : ℝ) = B` before the native `HolderOnWith` statement is derived. Pinned Mathlib's `HolderOnWith` takes `C r : ℝ≥0`, which matches.

## H12 (CBirkbeck) — applied

At `90cd369`, Lane F26 consumes the general `C₀`-semigroup, generator, resolvent, Hille–Yosida and Lumer–Phillips theory from OneParameterSemigroups, Part A, and the `LinearPMap` resolvent vocabulary from OperatorTheory, "Ownership boundaries". Both are on main, and both anchors resolve. The inventory bullet says the same, and `Suggested.lean`'s docstring routes the general theory to OneParameterSemigroups. PDE keeps the Gaussian kernel, its concrete `L^p`/BUC realizations, and the F27 classical programme.

## H13 (CBirkbeck) — answered

Carrying these repairs into another PDE branch is outside this pull request's files. The roadmap-PR index of 2026-10-27 does not list that pull request as open; the only other open PDE revision is the mixed-boundary-conditions one. The corrected statements are in this README for any branch that rebases onto it.

## H14 (kim-em) — answered

I checked each listed repair at `90cd369` (H09–H12): they are present, and the earlier repairs (H01, H05) are preserved. On the build: `lake build TauCetiRoadmap.PDE.Suggested` against the pinned toolchain is reported below. `Suggested.lean` contains no `sorry`.

## H15 (kim-em) — applied differently

The VariationalMethods citation in Lane D.19 was a link to a file at a pull-request commit, labelled "proposal". Roadmap citations name the roadmap and its section. The new text is "VariationalMethods supplies generic direct minimization (V1.4), the complex and shifted coercive-energy adapters (V2.3, V2.4), ordered constrained minima (V4.1) and the form-domain/`LinearPMap` operator comparison (V5.1, V5.2)". I checked each section number against the VariationalMethods README at its open head. Direction: VariationalMethods itself lists PDE Lane D/E as a consumer of V1–V5, so there is no cycle. For the merge decision: VariationalMethods is a new-roadmap pull request by the same author. It is neither on main nor in the merge order.

## Not addressed (outside the review's scope)

- `Suggested.lean` is not yet in acceptance-test form. It states no PDE headline theorem; it holds the parabolic metric carrier and its API lemmas. The README is also out of date against the pinned Tau Ceti in places beyond A.2. For example, `TauCeti/Analysis/Sobolev/Poincare/W1p0.lean`, `Poincare/Wirtinger/W1p.lean` (convex domains), `RellichKondrachov.lean` (`W1p0.isCompactOperator_valueL`) and `TauCeti/Analysis/PDE/*` all exist at the pin. No reviewer raised either point, and fixing them would widen the scope.
- The commented DGNM signatures carry `3 ≤ n`, which comes from the port source. The theorem holds for all `n ≥ 1`.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| C.13 `C¹` drift reduction | n=2, `a¹¹=a²²=1`, `a¹²=0`, `a²¹=x₂` on `{|x₂|<1}` (elliptic: `ξ·aξ ≥ (1−|x₂|/2)|ξ|²`), `u = x₁` | true value `∂ⱼ(aⁱʲ∂ᵢu) = ∂₁a¹¹ + ∂₂a¹² = 0`; new formula `bⁱ=∂ⱼaⁱʲ` gives `b¹ = 0`, so `aⁱʲ∂ᵢ∂ⱼu + b¹ = 0` ✓; old formula `bⁱ=∂ⱼaʲⁱ` gives `b¹ = ∂₁a¹¹+∂₂a²¹ = 1`, value 1 ✗ | old index wrong, new correct | index fixed |
| C.13 Lipschitz case | `a = (1+|x₁|)I`, `u` C² | `∂₁a = sign(x₁)` undefined on `{x₁=0}`, so `Lu` is undefined on a hyperplane | pointwise lemma inapplicable | routed to ABP |
| A.2 order-1 Meyers–Serrin consumed | `p = ∞`, `u = |x|` on (−1,1) | the pinned theorem has `hp : p ≠ ⊤`; the README excludes `p = ∞` | consistent | cite added |
| A.2 whole-space `W^{k,p}_0=W^{k,p}` consumed | `p = ∞`, `u = 1` | the pinned theorem has `p ≠ ⊤`; `dist_{L∞}(1, C_c) = 1` | consistent | cite added |
| Suggested docstring, exponent > 1 | `Ω` = unit ball; `K` = von Koch arc | on the ball, `|f(x)−f(y)| ≤ C|x−y|^{1+ε}` gives `Df = 0`, so `f` is constant; on the Koch arc, the inverse of its bi-Hölder parametrization is Hölder with exponent `log 4/log 3 ≈ 1.26 > 1` and is not constant | wording correct | grammar only |
| D.19 VariationalMethods sections | V1.4, V2.3, V2.4, V4.1, V5.1, V5.2 at the open head | headings "Direct-method theorems", "Complex coercive adapter", "Semibounded shifts", "Ordered construction", "Actual domain and operator", "Domain expansions and equations" | match | cite by section |

`Suggested.lean` signatures: only a docstring changed. No declaration was added, removed or retyped, so the 34 elaborated types in the job's `signatures.md` still describe the file. `#check` was not rerun.

Ownership against open pull requests: checked for the objects touched here (Meyers–Serrin and whole-space density are in pinned Tau Ceti; semigroups are on main; VariationalMethods is an open head).

## Build and gate

`lake build TauCetiRoadmap.PDE.Suggested`: `Build completed successfully (8976 jobs).` (exit 0). `TauCetiRoadmap.PDE.Suggested` built with no warnings or errors. The build ran after the `Suggested.lean` edit. Commit `fd8e87f` changed only README text after that build.

Gate, at commit `fd8e87f` (`PDE: review repairs (pinned Tau Ceti density, C¹ Hopf drift, VariationalMethods by section, display formulas)`):

```
gate PDE: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: PDE (insert it after its last supplier)
```

The only failing count is `depcheck=1`, which is the NOT IN ORDER line. It appears because PDE is a roadmap already on main and is not listed in the merge order; it is not a direction defect. At head the gate also reported `tex=8`, on lines this revision had added: bare `W^{1,p}`/`W^{2,1}` in prose (Lane A.1, F26) and three display formulas split across lines as inline code spans (X1 wave bound, X3.1 SPDE and its estimate). Those were mechanical fixes: the bare names were put in backticks, and the formulas became indented code blocks with unchanged content.

Depcheck (after edits):

```
NOT IN ORDER: PDE (insert it after its last supplier)
depcheck: 148 roadmaps, 999 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. PDE is an existing roadmap on main that is being revised, so it is not in the merge order. This revision adds no supplier that is not already on main.
