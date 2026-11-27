# Review of DescentSplittingAndPathFollowingMethods (pull request #3231 at da25709)

**Verdict:** needs changes

**Summary.** Changes are needed: the two lower complexity bounds of 4.2 are vacuous as stated, in the README and in `Suggested.lean` (the zero function with `x⋆ = x₀` proves the first, `μ/2 ‖x − x₀‖²` the second), and one Check of 1.1 is false as worded. Every other statement survived the adversarial pass, including the corrections the README makes to its sources. There are two small corrections and four format notes, none blocking. The three Springer books that carry most locators could not be read, which is left to the human reviewers.

## R01 (P1) — Both lower bounds of 4.2 are satisfied by a function minimized at the starting point, so they assert nothing

In 4.2 (README lines 275–286, `exists_lowerBound_smoothConvex` and `exists_lowerBound_strongConvex` in `Suggested.lean`, lines 528–550) the function `f` and its minimizer `x⋆` are chosen after `x₀`, and both bounds are multiples of `‖x₀ − x⋆‖²`. Nothing prevents `x⋆ = x₀`. Take `f = 0` and `x⋆ = x₀`: `f` is smooth, convex, its gradient is `L`-Lipschitz for every `L ≥ 0`, `x₀` is a minimizer, and both conclusions read `0 ≤ f(x_k) − f(x⋆)` and `0 ≤ ‖x_k − x⋆‖²`. I checked this in Lean against the pin: the statement of `exists_lowerBound_smoothConvex`, copied with `IsSpanFirstOrder`, is closed by the witness `fun _ => 0`, `xs := x₀` in eight lines, with no hypothesis on `n` and `k` used. For the strongly convex bound, `f(x) = μ/2 · ‖x − x₀‖²` with `x⋆ = x₀` is `μ`-strongly convex, its gradient `μ(x − x₀)` is `μ`-Lipschitz hence `L`-Lipschitz, and both right-hand sides are `0`. An implementer can therefore discharge both headlines without the chain quadratic or the span lemma of 4.1.

The same witness contradicts the negative control of 4.2 (line 299): as stated, the first bound holds for every `k` and `n`, so "2k + 1 ≤ n cannot be dropped" is not true of the statement; and conjugate gradients on a quadratic bounds only quadratic witnesses and only gives `k < n`.

Smallest change: fix the distance. State both theorems as "for every `R > 0` there are `f` and a minimizer `x⋆` with `‖x₀ − x⋆‖ = R` such that …" (the witnesses `f_{2k+1}` and the ℓ² function rescale to any `R`), or at least add `x⋆ ≠ x₀` to the conclusion, in the README and in both Lean statements. Then reword the negative control to what the conjugate-gradient argument shows (a quadratic witness needs `k < n`).

## R02 (P2) — The negative control of 1.1 is false for `c₁ > 1`

The Check at line 113 says that for `f(x) = x²` at `x = 1` with `p = +1` "no step satisfies sufficient decrease with c₁ > 0". Sufficient decrease reads `(1 + α)² ≤ 1 + 2c₁α`, that is `α ≤ 2c₁ − 2`: for `c₁ = 2` the step `α = 1` satisfies it (`4 ≤ 5`). The claim holds exactly for `c₁ ≤ 1`. Write "with `0 < c₁ ≤ 1`" (or "with `c₁ < 1`", the range of 1.1).

## C01 — The metric of the PDHG route is equation (5.6), not (5.7)

In Layer 7 (line 412) the route cites "the metric M of (5.7), p. 213". In Chambolle–Pock the metric `M` and its positive definiteness for `τσ‖K‖² < 1` are display (5.6), on the page of Algorithm 6 (p. 212); (5.7) is the three-term minimization problem `f(Kx) + g(x) + h(x)` (chambollepock2016 lines 2313–2320 and 2341). Cite "(5.5)–(5.6), p. 212".

## C02 — Chambolle–Pock's Theorem 4.3 is not a restatement of the first bound

Line 290 says Chambolle–Pock, Theorems 4.3–4.4, "restate both bounds". Theorem 4.4 does match the function-value bound of the strongly convex case. Theorem 4.3 states `f(x_k) − f(x⋆) ≥ L‖x₀ − x⋆‖²/(8(k + 1)²)` for `k < n`, with another constant, another range of `k`, and no distance bound (chambollepock2016 lines 1124–1129; the text before it says a different function is used). Say that Theorem 4.3 gives a bound of the same order, and Theorem 4.4 restates the second.

## N01 — TeX-style sub- and superscripts in running text

About 45 places write `x_{k+1}`, `q^{2k}`, `J_{γΓ}`, `(…)^{−1/2}` outside code spans (for instance lines 122, 139, 196, 284, 372–382). Put them in code spans or write them in Unicode.

## N02 — Pull-request numbers and process words

Lines 594 and 597 name "PR #1506" and "PR #2978" and call those roadmaps "open"; line 23 says "the merged roadmap". Cite the roadmaps by name and section only.

## N03 — Several Checks report experiments a reader cannot recompute

The Check of 3.2 does not give `A` and `b`; the first Check of 2.1 uses 3000 random cases; the Check of 2.2 reports 14110 iterations on the Rosenbrock function; the grid of the Check of 8.3 (value 0.859) is not specified; and in 8.2 the supremum of `F′²/F″` is 1 on `(0, 1)` but is not attained on any grid. Each would be stronger as a small explicit instance (for 8.3: `x = 0.07`, `y = 0.005` gives 0.859).

## N04 — No per-target dependency lines

The layers give routes but no `*Needs:*` lines, so the inputs of each target have to be collected from the route sentences and the supplier contracts. A line per target would let an implementer start any target independently.

## Questions for the author

- 6.2, forward–backward: does Bauschke–Combettes, Theorem 26.14(ii), assume `inf θ_n > 0` for the convergence `Cx_n → Cz`? I recall that it does and could not open the book. The statement as written is still true (from `∑ θ_n ‖Cx_n − Cz‖² < ∞`, `Tx_n − x_n → 0` and the Lipschitz bound `‖Cx_{n+1} − Cx_n‖ ≤ θ_n ‖Tx_n − x_n‖/β`), so if the source has the hypothesis the item is an adaptation and should say so.
- 6.2, Douglas–Rachford: the weak convergence of the shadow sequence `J_{γB} y_n` is cited within "Theorem 26.11(i)–(iii)". Is it not a later item of that theorem? The book was not readable here.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 strong Wolfe existence | `x²`, x=1, p=−1, c₁=.1, c₂=.9; p=+1 | steps `[0.1, 1.8]`; p=+1: `α ≤ 2c₁−2`, empty iff c₁ ≤ 1 | true; Check false for c₁>1 (R02) |
| 1.2 Zoutendijk | L=0; c₂ ≤ 0; rotation control | L=0 admits no Wolfe step; `∏ j²/(1+j²) = π/sinh π = 0.2720`, √ = 0.5216 | true; differentiability unused |
| 1.2 angle; quasi-Newton angle | B=0; B=diag(2,−1), m=−1 | B=0: 0 ≤ 0; control: −0.5 ≤ −1 false | true |
| 2.1 Cauchy decrease | g=0; B=0; ⟨g,Bg⟩ ≤ 0; non-symmetric B | 0 ≤ 0; `−Δ‖g‖ ≤ −‖g‖Δ/2`; proof uses only `⟨g,Bg⟩ ≤ ‖B‖‖g‖²` | true; matches Boumal 6.15 |
| 2.2 trust-region limits | γ ≤ 0; β=0; f=−x, B=0 | γ ≤ 0 forces p=0, contradicts decrease; ratio 1, ‖∇f‖=1 | true with `Δ̄ ≤ ε/β` added |
| 3.1 unit step | `x²/2 + x³`, Newton p; c₁=½; c₁=.49 | excess `= p³`: 5.36e−3 at −0.1, 1.10e−6 at −0.01; α=½ Wolfe, x₁=−0.00484 | true for c₁<½; fails at ½ |
| 3.2 BFGS posDef, global, superlinear | ∇f(x_k)=0 at finite k; ι empty | p=0, s=y=0, update returns B; ratios 0/0=0 | true without gradient hypothesis |
| 4.1 chain quadratic, span lemma | k=1..4; p=0; p>n; L=0 | values −.125, −.1667, −.1875, −.2; norms² .25, .556, .875, 1.2; `k(2k+1)/(6(k+1)) ≤ (k+1)/3` | true |
| 4.2 lower bounds | f=0, x⋆=x₀; `μ/2‖x−x₀‖²` | both sides 0; Lean proof of the first closes | vacuous (R01) |
| 5.1 TFAE | D=∅; rotation | rotation: `⟨x−y, R(x−y)⟩ = 0 < ‖R(x−y)‖²` | true |
| 5.2 Minty, resolvents | E=0, Γ=∅; Γ={(0,0)}; any T | Γ=∅ monotone, not maximal, range fails; resolvent of graph of T is T for every T | true |
| 5.2 prox = resolvent | g x = ⊤ | pinned `subdifferential` is empty where `f x = ⊤` or `⊥` | true |
| 6.1 Fejér | C=∅, `x_n = n e₁` | hypotheses vacuous, conclusion false | nonemptiness needed |
| 6.2 KM, PPA, FB, DR | rotation; normal cone of [1,∞) with Id | `‖½(I+R)‖ = 1/√2`; FB: x→1; DR: `y ↦ y/2 + 1`, y→2, shadow→1 | true |
| 7 PDHG gap, weak convergence | K=0; g x=⊤; f⋆ y=⊤; τσ‖K‖²=1 | sum bound `≤ ‖x−x⁰‖²/(2τ)+‖y−y⁰‖²/(2σ)−⟨K(x−x⁰),y−y⁰⟩`; ⊤ and ⊥ cases trivial | true; matches (5.10) |
| 8.1–8.2 barriers | −log; linear; 0 with ν=−1; ι empty | `v²/x² ≤ 1·v²/x²`; `v² ≤ 0` false; `1/x² ≤ 0` false; 0 ≤ 0 | true |
| 8.3 barrier inequality | constant F, ν=0; U without blow-up | `1/φ(0) ≥ 1/ν + 1/φ(1)`; 0<0 false | true; no blow-up needed |
| 8.4 Newton decrement | `x − log x` at 0.6; `3x−log x−log(1−x)` at 0.3; U=(0,½) | λ₊=.16 ≤ .444; λ=.302, λ₊=.0705 ≤ .187; x₊=.6975 ∉ U | true |
| 8.5 central points | U not open; U=(0,∞), t=−1 | blow-up forces U open; x⋆(1)=.381966, x⋆(10)=.0901, x⋆(100)=.0099 | true |
| 8.6 gaps | ν=0; zero space | ν=0 gives DF=0, gap 0; zero space: bound negative for ν<−β²/(1−β) | true |
| 8.7 path following | ν<0, ν=0; τ=.29, τ=½ | PD Hessian and c≠0 force ν>0; β=.126238, γ=.163762; t₁=.4632 ≥ .3963; bound at k=40: 20.4 | true |

- Source locators checked against the text: 8 in Chambolle–Pock ((3.12), (3.15), Theorems 4.3, 4.4, Algorithm 6, (5.6)/(5.7), (5.9), (5.10) with its proof) and 1 in Boumal (Lemma 6.15); 1 wrong (C01), 1 misdescribed (C02).
- Library declarations opened at the pin: `subdifferential` (TauCeti/Analysis/Convex/Subdifferential.lean:89), `fenchelConjugate` (TauCeti/Analysis/Convex/Conjugate.lean:119); no declaration of the pinned Mathlib or Tau Ceti states a Wolfe step, a monotone set, firm nonexpansiveness, a proximal map, self-concordance or a Newton decrement.
- Cross-roadmap citations resolved on main: NewtonAndQuasiNewtonMethods 1.1, 3.1, 3.2, 4.1; FirstOrderOptimization 3.1, 3.2, 3.4, 4.2, 4.3; ConvexAnalysisAndDuality 4.4; InteriorPointMethods 1.1, 1.2, 2.1–2.4, 3.2, 3.4, 3.5, 4.1, 4.3. The nine local copies agree with the owners' definitions character for character. At open heads: ManifoldOptimization O4.2–O4.5 and VariationalAnalysisAndMetricRegularity 2.4 exist.
- Dependency check: `depcheck: 6 roadmaps, 88 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration of `Suggested.lean` at the pins: 38 `sorry` warnings and nothing else; single `import Mathlib` plus two existing Tau Ceti modules; no `set_option`, no sorried data.
- `#check`-level comparison of the 78 elaborated signatures with the README: the 15 declarations that do not carry `[CompleteSpace]` or another section instance are definitions (and `resolvent_mem`) that do not need it; every theorem that needs completeness or finite dimension has it. Nothing changed.
- One-tactic probe, by reading: no sorried theorem closes in one tactic; the five proved statements are marked as checks in their docstrings and in the README.
- Headline theorems: all 38 remaining named headlines are stated; none is declared not statable.

Overlap check: read InteriorPointMethods, FirstOrderOptimization, NewtonAndQuasiNewtonMethods (main), NewtonTypeMethodsAndAlgorithmicDifferentiation, VariationalAnalysisAndMetricRegularity, ManifoldOptimization (open); nothing shared. InteriorPointMethods lists barrier parameters, short-step path following, existence of central points and pure Newton steps as not treated; FirstOrderOptimization and ConvexAnalysisAndDuality list lower bounds, splitting, Minty and resolvents as outside; NewtonTypeMethodsAndAlgorithmicDifferentiation leaves line searches and trust regions to optimization. Ownership against the open pull requests was checked by object search over their heads.

Source independence: 9 passages compared with 2 sources (chambollepock2016, boumal2023), none shared; largest share Nesterov 2018, 21 of 60 source mentions; contents not compared with it (text and contents unreadable here). By the README's own locators, Layer 3 draws on Chapters 3 and 6 of Nocedal–Wright and Layer 8 on §§5.1–5.3 of Nesterov, so no layer run maps one to one onto a chapter run.

Research link: Layer 7 is Theorem 5.1 of Chambolle–Pock 2016, which rests on Chambolle–Pock 2011 and 2015 (chambollepock2016 lines 2377–2378); Layers 4 and 8 are the lower bounds and path-following theory of Nesterov 2018, per the README's locators. Rests on the README and chambollepock2016.

## Not verifiable

- Every locator into Nocedal–Wright 2006, Nesterov 2018 and Bauschke–Combettes 2017 (all sampled targets of 1.1–3.2, 5.1–6.2 and 8.2–8.7): Springer books, DOI resolves only to a paywalled page, no copy in the sources cache; the mathematics was checked independently (table above).
- The two source misprints the README reports (Nocedal–Wright, Theorem 3.6, printed with `c₁ ≤ 1/2`; the display for `t₁` in Nesterov, p. 382): the counterexample and the derivation are correct, the printed text was not seen.
- Boumal, Lemma 6.15, "p. 130": the author's copy has the lemma with the stated content but says its page numbering differs from the printed book.
- Printed page numbers of Chambolle–Pock were inferred from the HAL copy (printed page = file page + 159); this agrees with every page the README cites except the one in C01.

## Source issues

- none

## For the human reviewers

- Not tested: Nesterov 2018 has the largest share of locators, with Nocedal–Wright 2006 and Bauschke–Combettes 2017 next; none could be read, so wording and arrangement were compared only against Chambolle–Pock and Boumal.
- Licence: the README (Prior formalization) names the author's own repository lean-NASC, `NASC/Optimization.lean`, with sorried analogues of six targets; it was not fetched, and the declaration names listed there differ from those in `Suggested.lean`.
