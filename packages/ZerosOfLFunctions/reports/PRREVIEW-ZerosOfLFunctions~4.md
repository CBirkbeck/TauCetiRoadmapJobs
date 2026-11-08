# Review of ZerosOfLFunctions (pull request #1907 at 21de6c8)

**Verdict:** needs changes

Six findings, all P3, none blocking. The mathematics of the new direct Dirichlet subsection (the retained-zero inequalities with the explicit gamma constant, the finite-family radius, the completion comparisons) is correct at the pins and against Montgomery–Vaughan and the DLMF; what needs repair is the gate (LaTeX in the README), policy wording (a pull-request link, a Check naming the Lean file), README/Lean agreement for the eleven new declarations, padding in `Suggested.lean`, and supplier names that do not resolve at the current pins (two of them carried from the previous review).

## R01 (P3) — The gate fails: LaTeX display blocks in the new subsection

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:1186–1197` and `:1210–1213`, the three `\[ … \]` displays (the one-zero inequality, the finite-sum inequality, the constant `C_Γ`).

**Claim:** The worker's gate reports `latex=3 tex=5 … FAIL` (rule: no LaTeX delimiters or TeX-only syntax outside code spans and code blocks).

**Witness:** Line 1186 `\[`, line 1187 `\frac{1}{\sigma-\beta}`, line 1195 `\sum_{\rho\in S}m_\rho\operatorname{Re}\frac1{\sigma-\rho}`, line 1210 `\[`. Every other display in the README is an indented code block (for instance 8.3 at line 1463).

**Repair:** Replace the three displays by indented `text` code blocks or inline code spans saying the same mathematics, for instance `1/(σ − β) ≤ Re (logDeriv L_χ)(σ) + ½ log q + C`, `∑_{ρ ∈ S} m_ρ Re (1/(σ − ρ)) ≤ Re (logDeriv L_χ)(σ) + ½ log q + C` and `C_Γ = ½ (|−γ_E − 2 log 2| + |2 − γ_E − 2 log 2| + |log π|)`. Code spans and code blocks are what both scanners skip, so the `_{`, `^{` and `∑` of the rewritten forms must stay inside the backticks; the rest of the folder already passes both scanners.

## R02 (P3) — A pull-request link and process wording in the README and the docstring

**Location:** `README.md:1218`, "[Analytic Number Theory Part I §0.34b](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1126)"; `README.md:1251`, "`Suggested.lean` prototypes the direct interfaces, including the explicit gamma constant and its bound"; `Suggested.lean:44–45`, "statements not prototyped here remain definitive README targets".

**Claim:** Cross-roadmap citations name the roadmap and its section, never a pull-request number; a Check never names or claims a Lean counterpart; the README and the docstring are timeless.

**Witness:** The link target is a pull-request URL (the gate's `prnum` scanner matches only `#NNNN`, which is why it passed). The sentence at 1251 is the last item of the subsection's Checks and is about the Lean file, not about the mathematics. "Prototyped" describes the state of the work, not the theorem.

**Repair:** Write "Analytic Number Theory Part I §0.34b" without a link (that roadmap is later in the merge order; naming it as a consumer is fine, as the Downstream consumers section does). Delete the `Suggested.lean` sentence from the Checks. In the docstring say which statements of the subsection are stated and which are README targets, without "prototyped".

## R03 (P3) — The eleven new Lean names appear nowhere in the README; the subsection has no `*Needs:*` line, bulletless Checks and no Checks for the new definition

**Location:** `Suggested.lean:242–301` (`completed_entire`, `completed_orderLE_one`, `analyticOrderAt_completed_eq`, `logDeriv_completed`, `LFunction_real`, `gammaLogDerivBound`, `gammaLogDerivBound_nonneg`, `norm_logDeriv_GammaR_le`, `one_zero_le_logDeriv`, `finite_zero_sum_le_logDeriv`, `bounded_level_zero_free`); `README.md:1154` (a `####` heading), `:1229–1239` ("**Sources and dependencies.**" in place of `*Needs:*`), `:1247–1252` (Checks as one paragraph).

**Claim:** Every Lean name appears in the README; every target carries a `*Needs:*` line listing what its statement and route need; each definition lists its API and at least three Checks as bullets; subsections are `### k.n`.

**Witness:** `grep` of the README for each of the eleven names returns nothing; the constant is named only as `C_Γ`. The subsection cites its inputs in prose ("The generic analytic prerequisites are Layers 0–5 and §1.4") and the dependency check reads only `*Needs:*` lines. `gammaLogDerivBound` is a definition with a real body and has no Check.

**Repair:** Make the passage a bullet **(4g)** of 6.4 (the `(4a)`–`(4f)` pattern, which keeps the numbering that AnalyticNumberTheoryPartI §0.34b and ExplicitZetaBounds cite), or a `###` subsection without renumbering 6.5. Name the kept declarations in it (`one_zero_le_logDeriv`, `finite_zero_sum_le_logDeriv`, `bounded_level_zero_free`, `completed_orderLE_one`, `gammaLogDerivBound`; see R04 for the rest). Add `*Needs:* 1.4; 5.5–5.6; 6.4d; L-functions Layer 4 `dirichletData`; Mathlib `DirichletCharacter.LFunction`, `DirichletCharacter.completedLFunction`, `DirichletCharacter.LFunction_apply_one_ne_zero`, `Complex.digamma_one_half`, `Complex.digamma_apply_add_one`.` Write the Checks as bullets and add three for the constant, with the values computed below: `gammaLogDerivBound = 1 + (log π)/2 ≈ 1.57236` since `|ψ(1/2)| + |ψ(3/2)| = 2` exactly; `‖logDeriv Gammaℝ 1‖ = |ψ(1/2)/2 − (log π)/2| ≈ 1.55412 ≤ 1.57236` (the tight end) and `‖logDeriv Gammaℝ 3‖ ≈ 0.55412`; the wrong model that drops the `|log π|` term gives `1.00000 < 1.55412` and fails at `s = 1`, and the one that uses `ψ(1) = −γ_E` in place of `ψ(1/2)` gives `0.87922` and fails too.

## R04 (P3) — Padding in `Suggested.lean`: six declarations that restate a supplier body, close in one tactic or compute a bound

**Location:** `Suggested.lean:242` (`completed_entire`), `:250` (`analyticOrderAt_completed_eq`), `:256` (`logDeriv_completed`), `:262` (`LFunction_real`), `:271` (`gammaLogDerivBound_nonneg`), `:274` (`norm_logDeriv_GammaR_le`).

**Claim:** `Suggested.lean` states headline theorems; API lemmas that follow from the library in a step, restatements of a definition and numeric bounds are README targets or Checks.

**Witness:** On a scratch copy, `gammaLogDerivBound_nonneg` closes with `unfold gammaLogDerivBound; positivity` (the one-tactic probe reports "No goals to be solved" at the following `sorry`). `completed_entire` compiles from `DirichletCharacter.differentiable_completedLFunction hne` followed by `show Differentiable ℂ (fun s => (q : ℂ) ^ (s / 2) * χ.completedLFunction s)` and `fun_prop (disch := simp [NeZero.ne])`, which is the argument `TauCeti/NumberTheory/LFunctions/Dirichlet/Basic.lean:168–172` already makes inside `dirichletData_hasMeromorphicContinuation`. `logDeriv_completed` is `logDeriv_mul` applied to the body `dirichletData_completed` (`Basic.lean:82`) and `LFunction_eq_completed_div_gammaFactor`. `analyticOrderAt_completed_eq` and `LFunction_real` are API comparisons (order of a product with a nonvanishing analytic factor; reality by the identity theorem). `norm_logDeriv_GammaR_le` computes the interval bound whose values are the Checks of R03. None of the six is named by a README target or by a consumer; AnalyticNumberTheoryPartI §0.34b consumes 6.4d, not these names.

**Repair:** Delete the six from `Suggested.lean`; the README keeps each as a target or Check (R03). Keep `gammaLogDerivBound` (the two headlines mention it), `completed_orderLE_one`, `one_zero_le_logDeriv`, `finite_zero_sum_le_logDeriv` and `bounded_level_zero_free`, and give the three that lack one a docstring stating the mathematics and the source (Montgomery–Vaughan Corollary 10.18 for the inequalities). Tested: a scratch copy with the six removed elaborates with four `sorry` warnings in the new section (fifteen in all) and nothing else.

## R05 (P3) — Supplier names that do not exist at the pins or on main

**Location:** `README.md:221` (`LSeries.wienerIkehara`; carried from the previous review's R01); `:171` (`Complex.PhragmenLindelof.vertical_strip`); `:177–178` (`multipliableLocallyUniformlyOn_one_add`, `Complex.multipliable_sineTerm`, `Complex.cot_series_rep`); `:195` (`TauCeti.Contour.IsPiecewiseC1On` under `Analysis/Contour/`); `:1157–1158` (`dirichletData` consumed from `TauCeti/NumberTheory/LFunctions/Dirichlet/Basic.lean` but listed only under "From TauCetiRoadmap.LFunctions").

**Claim:** Every supplier declaration is cited by its exact name and file at the pin.

**Witness:** `#check` at Mathlib `1b1ccf4b`: `Complex.PhragmenLindelof.vertical_strip`, `Complex.multipliable_sineTerm`, `Complex.cot_series_rep` and `multipliableLocallyUniformlyOn_one_add` are unknown constants; the declarations are `PhragmenLindelof.vertical_strip` (`Analysis/Complex/PhragmenLindelof.lean:275`, namespace opened at `:54`), `multipliable_sineTerm` (`Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:98`), `cot_series_rep` (`:233`) and `Summable.multipliableLocallyUniformlyOn_one_add` (`Analysis/Normed/Module/MultipliableUniformlyOn.lean:137`, namespace `Summable` at `:80`). At Tau Ceti `2fd255d9` the only definition is `TauCeti.IsPiecewiseC1On` in `Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91` (namespace `TauCeti` at `:78`); nothing under `Analysis/Contour/` defines it. `Completed/ArithmeticDirichletSeries/Suggested.lean:1443` declares `wienerIkehara`, and its README export table (`:105`) uses that name; no `LSeries.` prefix exists. `Suggested.lean:2` imports `TauCeti.NumberTheory.LFunctions.Dirichlet.Basic`, a module of the Tau Ceti pin, so `dirichletData` is a Tau Ceti contract (file `NumberTheory/LFunctions/Dirichlet/Basic.lean:38`), and "From Tau Ceti" promises "each with its file".

**Repair:** Write the five names as above; move `TauCeti.IsPiecewiseC1On` to its file; add `TauCeti.LFunctions.dirichletData` with `dirichletData_completed`, `dirichletData_gammaR`, `dirichletData_hasDirichletAgreement`, `dirichletData_hasMeromorphicContinuation`, `dirichletData_hasFunctionalEquation` (`Basic.lean:82, 72, 147, 160, 178`) to "From Tau Ceti". Align the scope bullet at line 60 ("Layers 0–2, 6 and 10") with the contract section (Layers 0–3, 5, 6 and 9–10). Tested: with these names every `#check` of the From-Mathlib list resolves at the pin.

## R06 (P3) — References: Montgomery–Vaughan and the new DLMF equations are missing from `## References`; Lagarias–Odlyzko still has no locator

**Location:** `README.md:1780–1806`; `:1229–1231` (Montgomery–Vaughan cited inline with a URL); `:488–490` (DLMF 5.4.13, 5.4.15, 5.5.2, 5.15.1 cited inline with URLs); `:1802` (carried from the previous review's R02).

**Claim:** Every cited work is listed under `## References` with its locators, and the DLMF bullet lists the equations used.

**Witness:** The References section lists Davenport, Titchmarsh, Kadiri, Trudgian, Lang, Iwaniec–Kowalski, Lagarias–Odlyzko and DLMF "5.5.3, 5.11.1, 5.11.2, 5.11.9, §5.11(ii)"; no Montgomery–Vaughan entry, no 5.4.13/5.4.15/5.5.2/5.15.1. The Lagarias–Odlyzko bullet carries no theorem or page, while line 1651 attributes a theorem to them.

**Repair:** Add "H. L. Montgomery, R. C. Vaughan, *Multiplicative Number Theory I. Classical Theory*, Cambridge Studies in Advanced Mathematics 97 (2006) — Theorem 10.16 (the Hadamard product for `ξ(s, χ)`, p. 351) and Corollary 10.18, (10.37)–(10.38) (the partial-fraction expansion of `L'/L` and `Re B(χ) = −∑_ρ Re (1/ρ)`, pp. 352–353)". Extend the DLMF bullet with 5.4.13 and 5.4.15 (`ψ(1/2)`, `ψ(n + 1/2)`), 5.5.2 (the recurrence) and 5.15.1 (`ψ'(z) = ∑_k (k + z)^{−2}`), and cite them in 1.4 in the parenthetical style of the rest of the file instead of inline URLs. Give Lagarias–Odlyzko its theorem number and page, or phrase line 1651 as attribution without a claim about their hypotheses.

## Verified sound

A full review of the 1,806-line README and the 305-line Lean file at `21de6c8f`, every passage read. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (identical to the manifest on main `3b3f7ef6`). The pull request changes only `README.md` (+113) and `Suggested.lean` (+91/−4) of this folder; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty. No route-specific shortcut, re-planned roadmap, copied passage, computational algorithm, sorry'd data, `set_option` or extra import: the single Tau Ceti import names a module that exists at the pin.

**Previous findings, checked first.** The previous review (of the original pull request, at `98c62f2`) left two P3 notes. R01, `LSeries.wienerIkehara` at line 221: the passage is unchanged, "Layers 9–10: `LSeries.wienerIkehara` and `primeNumberTheoremTransfer`". **Not repaired** (re-raised in R05). R02, the Lagarias–Odlyzko reference without locator: line 1802 is unchanged, "*Effective versions of the Chebotarev density theorem*, in *Algebraic Number Fields* (1977) — effective counting in a fixed Galois extension". **Not repaired** (re-raised in R06). This pull request did not touch either passage.

**Gate and build.** The worker's gate fails only on `latex=3 tex=5` (R01); every other counter is 0, including `build`. My own `lake env lean` of `Suggested.lean` emits exactly 21 `declaration uses sorry` warnings and nothing else. The dependency check prints

```text
depcheck: 245 roadmaps, 2467 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. ZerosOfLFunctions is at line 85 of the merge order, after LFunctions (28); AnalyticNumberTheoryPartI (90) and ExplicitZetaBounds (270) are later and are named only as consumers (no `*Needs:*` line cites them).

**Signatures.** The worker's signature index covers all 26 declarations and reports no dropped binder; I re-elaborated `#check @one_zero_le_logDeriv`, `@finite_zero_sum_le_logDeriv`, `@bounded_level_zero_free`, `@norm_logDeriv_GammaR_le`, `@completed_entire` on the scratch copy: `[NeZero q]` is carried into every statement that mentions `q`, the constant `gammaLogDerivBound` is a closed term fixed before `q, χ, β, σ`, and `δ` in `bounded_level_zero_free` is chosen after `Q` and before `q, χ, s`, as the README says. The README's generality equals the Lean's: primitive, nonprincipal, `IsQuadratic`, `3 ≤ q`, `0 < β < 1`, `1 < σ ≤ 2`; the finite set `S` is restricted to `0 < Re ρ < 1`, which is what "nontrivial zeros" means for the completion (see the table).

**Padding probe.** Every sorried theorem was tried with `first | positivity | simp | rfl | infer_instance | assumption | fun_prop | (unfold gammaLogDerivBound; positivity) | exact?`. The eleven pre-existing headlines and `completed_orderLE_one`, `one_zero_le_logDeriv`, `finite_zero_sum_le_logDeriv`, `bounded_level_zero_free` fall through; `gammaLogDerivBound_nonneg` closes (R04). The tailored three-line proof of `completed_entire` compiles (R04).

**Headline inventory.** Unchanged from the previous review for Layers 3–8 (eleven statements; the docstring names the absent carriers, which I confirmed are still absent at `2fd255d9`: no `RayClass`, `ArtinSymbol` or Hecke completion module, and `NumberField.dedekindZeta` is the series). The new subsection's headlines are the two retained-zero inequalities with the explicit constant; both are stated. The finite-family radius `bounded_level_zero_free` is statable and stated; it is a qualitative corollary of `DirichletCharacter.LFunction_apply_one_ne_zero`, continuity and finiteness of the character family, and the README says so ("No effectiveness or uniformity over unbounded conductors is claimed").

**Two notes that are not findings.** `one_zero_le_logDeriv` and `finite_zero_sum_le_logDeriv` carry `hreal : χ.IsQuadratic` and `hq : 3 ≤ q`; neither is needed for truth (the cancellation `Re B(χ) = −∑ Re 1/ρ` holds for every primitive `χ`, and a primitive `χ ≠ 1` has conductor `≥ 3`). The consumer (AnalyticNumberTheoryPartI §0.34b) applies them to real characters, so the hypotheses match their use.

### Computed adversarial pass

An asterisk marks a seeded target; every headline and every target a finding touches is included.

| Statement | Instances | Values on each side / competing model | Result; change |
|---|---|---|---|
| New 6.4 gamma constant `C_Γ` | the three terms | `ψ(1/2) = −γ_E − 2 log 2 = −1.96351`, `ψ(3/2) = 2 + ψ(1/2) = 0.03649`, `log π = 1.14473`; `C_Γ = (1.96351 + 0.03649 + 1.14473)/2 = 1.57236 = 1 + (log π)/2` | Agrees with the Lean body |
| `norm_logDeriv_GammaR_le` | `s = 1, 1.5, 2, 2.5, 3` | `logDeriv Gammaℝ s = ψ(s/2)/2 − (log π)/2 = −1.55412, −1.11530, −0.86097, −0.68609, −0.55412`; all `≤ 1.57236` in norm; margin at `s = 1` is `0.018` | True; monotone in `s` by `ψ' > 0` |
| `one_zero_le_logDeriv` derivation | primitive `χ ≠ 1`, real `σ ∈ (1, 2]` | MV (10.37): `L'/L(σ) = B − ½ψ((σ+κ)/2) − ½ log(q/π) + ∑_ρ (1/(σ−ρ) + 1/ρ)`; (10.38): `Re B = −∑ Re 1/ρ`; hence `∑_ρ Re 1/(σ−ρ) = Re L'/L(σ) + ½ log q + logDeriv Gammaℝ(σ+κ)`, and `logDeriv Gammaℝ(σ+κ) ≤ ‖·‖ ≤ C_Γ` on `[1, 3]` | Sign by sign the Lean statement |
| `one_zero_le_logDeriv` positivity | `ρ = 1/2 + 14i`, `σ = 2`; `ρ = β` real | `Re 1/(σ−ρ) = (σ − Re ρ)/|σ−ρ|² = 0.00757 > 0`; `Re 1/(σ−β) = 1/(σ−β)`; dropping all but one copy of `β` loses nonnegative terms | Agrees; multiplicity `≥ 1` suffices |
| `finite_zero_sum_le_logDeriv` hypothesis `0 < Re ρ` | even `χ`, `ρ = 0` (`L(0, χ) = 0`, trivial zero) | `Re 1/(2 − 0) = 1/2 > 0` would be added, but `0` is not a zero of `Λ` (`Gammaℝ` has a pole there); with the trivial zeros `−2n` the sum `∑ 1/(σ+2n)` diverges | Hypothesis necessary and present |
| `finite_zero_sum_le_logDeriv` multiplicity | `analyticOrderNatAt` | `L` entire for `χ ≠ 1`; at a zero the order is a positive natural, `toNat` of `⊤` is `0` only for the zero function | Agrees with `m_ρ` |
| `bounded_level_zero_free` | `Q = 0`; `Q = 1`; `Q = 4` | no `q ≥ 1` with `q ≤ 0`, `δ = 1`; `q = 1` has only `χ = 1`, excluded; `q = 3, 4` have one nonprincipal character each, `L(1, χ_{−3}) = π/(3√3) = 0.6046 ≠ 0`, `L(1, χ_{−4}) = π/4 ≠ 0` | Agrees; `q = 2` has no nonprincipal character |
| `completed_orderLE_one` | `χ_{−4}` at `s = 2m` | `Λ(2m) = 2^m Gammaℝ(2m+1) L(2m, χ_{−4})`, `log` of size `m log m`, which is `o(m^{1+ε})` and not `O(m)` | Order `1`, not exponential type |
| `logDeriv_completed` | `q = 1`, `χ = 1`, `Re s > 1` | `log 1 / 2 = 0`, `logDeriv Λ = logDeriv Gammaℝ + logDeriv ζ` | True without `χ ≠ 1`, as stated |
| `analyticOrderAt_completed_eq` | odd `χ` at `Re s > 0`; `s = 0` for even `χ` | `Gammaℝ(s+1)` regular and nonzero for `Re s > −1`; at `s = 0`, even `χ`: `L(0,χ) = 0` but `Λ(0) ≠ 0`, orders differ | Hypothesis `0 < Re s` necessary |
| `LFunction_real` | `χ_{−4}`, `σ = 1`; `χ = 1`, `σ = 1` | `L(1, χ_{−4}) = π/4` real; `LFunction 1 1` is a junk value at the pole | `χ ≠ 1` necessary and present |
| 6.4d at `t = 0` versus the new display | `analyticConductorAt d 0 = q(‖μ‖+3)` | `½ log(q(κ+3)) = ½ log q + ½ log(κ+3)`, absorbed in `C` | Consistent |
| 1.2* Stirling on the sector | DLMF 5.11.1 (`dlmf-5.11 line 104–108`), §5.11(ii) (`line 563–569`) | sector `|ph z| ≤ π − δ`; remainder bounded by `sec^{2n}(½ ph z)` times the first neglected term | Agrees; constant depends on `δ` |
| 1.3* vertical strips | `σ = 1/2`, `t = 50, 200` via `|Γ(1/2+it)|² = π/cosh πt` | `log|Γ(1/2+it)| − ((σ−½) log t − πt/2 + ½ log 2π) = ½ log(2/(1+e^{−2πt})) = 0.0, 0.0` to double precision | Agrees with DLMF 5.11.9 (`line 490–492`, "bounded real values of x", `line 524`) |
| 1.4 digamma inputs | Mathlib at the pin | `Complex.digamma_one_half : digamma (1/2) = −2 log 2 − γ_E` (`Digamma.lean:59`), `digamma_apply_add_one` (`:64`), `digamma_two_mul` (`:124`); no series `ψ' = ∑ (k+z)^{−2}` and no real monotonicity at the pin | "Consume the existing recurrence, duplication and special-value API; prove any missing monotonicity" is exact |
| 1.6* reciprocal factor | `n = 3` | `|1/Gammaℝ(−7)| = π^{−7/2}/|Γ(−7/2)| = π^{−4}·105/16 = 0.0673705 = π^{−9/2}Γ(9/2)`; at `−2n` the value is `0` | Agrees (DLMF 5.5.3 at `dlmf-5.5 line 141–145`) |
| 1.6* continued L at `ζ` | `s = 0, −2` | `ζ(0) = −1/2` versus raw quotient `0/0 = 0`; orders `(Λ, γ, L) = (0, −1, 1)` at `−2` | Agrees |
| 3.1* gamma integral Check | `R = 0`, `c = α = 1` | `E₁(1) = 0.21938 < e^{−1} = 0.36788 < Γ(1) = 1`; `Γ(R/α) = Γ(0)` is the pole | Agrees |
| 3.1* `s(s−1)Λ(2m)` | `m = 5, 10` | `7.06539, 1472.476`; logs `1.9552, 7.2947` against `m log m = 8.05, 23.03` | `m log m + O(m)`, agrees |
| 3.1* edge bounds no order | `g = exp(sin πs)` at `1/2 + 3i` | `log‖g‖ = cosh 3π = 6195.82` while edges give `1` | Agrees |
| 3.3* edge exponent | `σ = −δ` | gamma-power difference `(1+δ+Re μ−1)/2 − (−δ+Re μ−1)/2 = 1/2 + δ` | Agrees |
| 4.2* record divisor | `ζ` record | `div Λ = −1` at `0, 1`, `polarOrder = 1`, sum `0`; `exact_pole_order` at `LFunctions/Suggested.lean:186` | Agrees |
| 4.3* Jensen | `z`, `r = 1/4, R = 1/2, M = 1`; `1 − z/2`, `r = 1, R = 3/2, M = 2` | trailing form `1 + log 2/log 2 = 2 ≥ 1`; naive `0` false; `log 2/log 1.5 = 1.7095 ≥ 0`; pinned `AnalyticOnNhd.sum_divisor_le` (`JensenFormula.lean:389`) needs `1 ≤ M`, `f c ≠ 0` as stated | Agrees |
| 4.5* counts | `ζ`, `T = 14, 15, 100` | `0, 1, 29`; symmetric `58`; Titchmarsh §9.2 counts `0 < t ≤ T` (`titchmarsh line 6918–6919`), Theorem 9.2 `N(T+1) − N(T) = O(log T)` (`line 6923–6924`) | Agrees |
| 6.1* 3-4-1 | `θ = 0, π, π/2` | `3 + 4cos θ + cos 2θ = 8, 0, 2 = 2(1+cos θ)²`; `three_four_one_nonneg` at `LFunctions/Suggested.lean:2685` | Agrees |
| 6.5* edges | `χ_{−4}` at `1`; trivial at `1`; `ζ` at `1+2i` | `4^{1/2}·Gammaℝ(2)·L(1) = 2·(1/π)·(π/4) = 1/2`, order `0`; order `−1` (`:977`); order `0` (`:2688`, needs `t ≠ 0`); `heckeLFunction_ne_zero_of_one_le_re` (`:2680`) needs `χ.character ≠ 1` as stated | Agrees |
| 7.1* rectangle | unit square at `1/2 + i/2`, `2`; degenerate width `0` | windings `1, 0`, clockwise `−1`; retraced segment `0` | Agrees; Tau Ceti names resolve (`Winding/Number/Basic.lean:76, 147, 152`, `Argument/Cycle.lean:110`, `Residue/LogDeriv.lean:63`, `LogDerivFTC.lean:227`, `Argument/Lift.lean:427`) except `IsPiecewiseC1On` (R05) |
| 7.4 Riemann–von Mangoldt | `T = 1000` | `(T/2π) log(T/2πe) = 647.7412 = (T/2π) log T − (1 + log 2π)T/2π` (Titchmarsh (9.4.3), `line 7020–7022`) | Agrees |
| 7.6* corollaries | Titchmarsh after Theorem 9.4 (`line 7028–7036`) | `N(T) ∼ (T/2π) log T`, (9.4.4) `|ρ_n| ∼ γ_n ∼ 2πn/log n`; averaged increment `∫_0^T (N(t+1)−N(t)) dt = ∫_T^{T+1} N − ∫_0^1 N` | Agrees; the printed page `214` is not visible in the cached scan (page markers are scan indices) |
| 8.1* Perron endpoint | `x = c = T = 1` | `arctan(1)/π = 0.25`; ADS hypotheses `0 < x, 0 < c, 0 ≤ T, LSeriesSummable f c` (`ADS/Suggested.lean:1087`), `truncatedPerronKernel_one` needs `c ≠ 0` (`:1073`) | Agrees |
| 8.3* truncated Lean | `x = T = 2` | `ψ(2) = 0.693147`; right side `2 − log 2π − ½ log(3/4) = 0.305964`; discrepancy `0.387183 ≤ C·0.480453` for `C ≥ 0.806` | Agrees |
| 8.5* prime ideals Lean | `K = ℚ`, `x = 2` | count `1`, `Li 2 = 0`, within `=O[atTop]`; `idealSummatory_mul_eq_sub_integral_mul` (`ADS:1006`) and `logIntegral_isEquivalent_div_log` (`:1047`) resolve | Agrees |
| Hadamard headline | `1 − z`, `e^{cz}`, constant `2` | `(a, b) = (0, −1), (0, c), (log 2, 0)`; factor at `ρ = 0` is `1` since `m_0 = 0` | Agrees |
| `ζ` zero-free headline | `s = 2, 1, −2` | `ζ(2) ≠ 0`; `1` excluded; `−2` outside the region since `1 − c/log 5 ≥ 0.32` | Agrees |
| Dirichlet zero-free headline | `q = 2` principal | `L = (1 − 2^{−s})ζ`, zero at `0` outside `Re s ≥ 1/2` | Agrees |
| Weil formula headline | `φ = 0` | all terms `0`; `ContDiff ℝ ⊤` would trivialize the class | Agrees |
| Progressions headline | `q = 4, a = 3` | totient `2`, coefficient `1/2`; `primesBelow (⌊x⌋₊+1)` are the primes `≤ x` | Agrees |

### Pinned declarations opened

Mathlib `1b1ccf4b`: `Analysis/SpecialFunctions/Gamma/Digamma.lean:48, 56, 59, 64, 72, 94, 108, 124`; `NumberTheory/LSeries/DirichletContinuation.lean:97, 206, 231, 257, 266, 291`; `NumberTheory/LSeries/ZMod.lean:295` (`completedLFunction Φ s = N^{−s} ∑_j Φ j · completedHurwitzZeta…`, so no conductor power survives, as the README says); `NumberTheory/LSeries/Nonvanishing.lean:404, 413`; `Analysis/Analytic/Order.lean:63` (`analyticOrderNatAt`); `NumberTheory/MulChar/Basic.lean:443` (`IsQuadratic`); `Analysis/Complex/JensenFormula.lean:389`; `Analysis/Meromorphic/TrailingCoefficient.lean:38`; `Analysis/Complex/PhragmenLindelof.lean:54, 275`; `Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:98, 233`; `Analysis/Normed/Module/MultipliableUniformlyOn.lean:80, 137`; the whole From-Mathlib list elaborated with `#check` (all resolve except the four of R05). Tau Ceti `2fd255d9`: `NumberTheory/LFunctions/Dirichlet/Basic.lean:38–47, 72, 82, 86, 147, 160, 168–172, 178, 194–196`; `Analysis/Calculus/ContDiff/PiecewiseC1On.lean:78, 91`; the six contour files named in the table.

### Supplier resolution and ownership

| Citation | Resolved at |
|---|---|
| LFunctions Layer 0 predicates, Layer 3–8 names of the sampled sections | `TauCetiRoadmap/LFunctions/Suggested.lean:186–188, 977, 1245, 1255, 1670, 2550, 2432, 2680, 2685, 2688, 2820, 2828` on main `3b3f7ef6` |
| Arithmetic Dirichlet Series §§6.1–6.4, Layers 9–10 | `Completed/ArithmeticDirichletSeries/Suggested.lean:568, 1006, 1047, 1073, 1087, 1095, 1112, 1443` (`wienerIkehara`, R05) |
| Global Number Fields, Number Field Arithmetic, Chebotarev, Class Field Theory | every backticked name of those contract sections occurs in the respective `Suggested.lean` on main |
| AnalyticNumberTheoryPartI §0.30, §0.34b, §0.11b, §0.12 (named as consumers) | at the head of #1126: `### 0.30 Rational Dirichlet-to-ray-class dictionary`; §0.34b "ZerosOfLFunctions 6.4d (through §0.30) gives `−L′/L(s,χ) ≤ (1/2)log q + O(1) − ∑_ρ Re 1/(s−ρ)` … keep only `ρ = β`"; "the latter analytic interface is supplied directly by ZerosOfLFunctions §6.4 on the primitive Dirichlet record" |

Ownership by object: the retained-zero inequality is the classical Corollary 10.18 specialization and is cited by AnalyticNumberTheoryPartI (order 90) and ExplicitZetaBounds (order 270, "From TauCetiRoadmap.ZerosOfLFunctions: … 6.4d (the partial-fraction bound for `−Re L'/L`)") as this roadmap's; neither states it. The real digamma values and monotonicity: ExplicitZetaBounds §1.2 proves a different object (the Stirling bracket `log x − 1/(2x) − 1/(12x²) < ψ(x) < log x − 1/(2x)`) and consumes 1.4 from here; ExplicitNumberFields and ExplicitPrimeCounting take explicit digamma remainders from ComputationalNumberTheory §4.17a, again a different object. No open roadmap owns `ψ(1/2)`, `ψ(3/2)` or the monotonicity. The other open pull request on this folder, #1913 (effective statements under the exclusion of Landau–Siegel zeros), changes the scope, 6.3, the introduction of 6.4 and 8.5–8.8 and leaves the 6.4 bullets and the new subsection's position untouched; the overlaps index says the heads merge cleanly, and the two do not change the same targets: #1913 makes the ℚ-forms of 6.3–6.4 consume AnalyticNumberTheoryPartI §0.34 downstream, while this subsection is an input of that §0.34b and says it takes nothing from the exclusion, which is consistent. Overlaps index: no cited id dropped by an open pull request, no id of this roadmap dropped here. Open pull requests whose files the brief does not supply were read only through the service's index.

### Seeded source sample

| Target | Text at its locator | Result |
|---|---|---|
| 1.2 | DLMF 5.11.1, §5.11(ii) (`dlmf-5.11`, cache `3d8f5116…`, lines 104–108, 563–569) | Supports the sector statement with a `δ`-dependent constant |
| 1.3 | DLMF 5.11.9 (`line 490–492, 524`) | Supports the strip statement; computed row |
| 1.6 | DLMF 5.5.3 (`dlmf-5.5`, cache `574a1e08…`, line 141–145) | Supports both Checks |
| 1.4 (new) | DLMF 5.4.13 (`dlmf-5.4`, cache `4fe388f7…`, line 428–431: `ψ(1/2) = −γ − 2 ln 2`), 5.4.15 (`line 490–492`: `ψ(n+1/2) = −γ − 2 ln 2 + 2(1 + … + 1/(2n−1))`, so `ψ(3/2) = 2 − γ − 2 ln 2`), 5.5.2 (`dlmf-5.5 line 100–102`), 5.15.1 (`dlmf-5.15`, cache `26b2dff6…`, line 64–68: `ψ'(z) = ∑_{k≥0} (k+z)^{−2}`, `z ≠ 0, −1, …`) | All four support the statements as written |
| 6.4 new subsection | Montgomery–Vaughan (`montgomery-vaughan2006`, author-page copy of Chapter 10): Theorem 10.16 (`line 1262–1268`, printed p. 351): `ξ(s,χ) = ξ(0,χ) e^{B(χ)s} ∏_ρ (1 − s/ρ)e^{s/ρ}` for primitive `χ`, `q > 1`, multiple zeros repeated; Corollary 10.18 (`line 1315–1331`, p. 352): (10.37) `L'/L(s,χ) = B(χ) − ½Γ'/Γ((s+κ)/2) − ½ log(q/π) + ∑_ρ (1/(s−ρ) + 1/ρ)`, (10.38) `Re B(χ) = −∑_ρ Re 1/ρ`; proof to `line 1348` (p. 353) | Locators exact; the README's "pp. 351–353, (10.37)–(10.38)" is right |
| 3.1 | LFunctions kernels at main (`:1245, 1255, 2432, 2550`); identity checked by substitution | Route sound |
| 3.3 | Internal (1.5, 1.6, 2.2); exponent computed | Agrees |
| 4.2 | LFunctions `exact_pole_order`, `regular_away` (`:186–188`) | Agrees |
| 4.3 | Mathlib `AnalyticOnNhd.sum_divisor_le` (`JensenFormula.lean:389–393`) | Hypotheses as the README states |
| 4.5 | Titchmarsh §9.2, Theorem 9.2 (`titchmarsh`, cache `ee495ba7…`, line 6918–6924) | Count convention and the `O(log T)` increment match |
| 6.1 | LFunctions `:2685, 2820, 2828` | Agrees |
| 6.5 | LFunctions `:977, 2680, 2688`; Mathlib `riemannZeta_ne_zero_of_one_le_re` resolves | Agrees |
| 7.1 | Tau Ceti contour files at `2fd255d9` | Names resolve except `IsPiecewiseC1On` (R05) |
| 7.6 | Titchmarsh Theorem 9.4 and (9.4.4) (`line 7020–7036`) | Agrees; printed page not visible in the scan |
| 8.1 | ADS `:1073, 1087, 1095, 1112` | Hypotheses as stated |
| 8.3 | ADS `:568` (`vonMangoldt_apply_prime_pow`), LFunctions `:2820`; Davenport §17 uncertified | Formula checked at `x = T = 2` |
| 8.5 | ADS `:1006, 1047`; Davenport §18 uncertified | Agrees |

## Not verifiable

- **Davenport, *Multiplicative Number Theory*, §§11–20** and **Lang, *Algebraic Number Theory*, XVII §3**: paywalled; cited by locator, the mathematics checked independently in the table.
- **Iwaniec–Kowalski §§5.1–5.2** and **Lagarias–Odlyzko (1977)**: no legal text found (see R06 for the missing locator).
- **Titchmarsh**: read from the course-page copy the service holds (`ee495ba7…`); its page markers are scan indices, so the printed page `214` of Theorem 9.4 is not confirmed from the text, only the theorem number and statement.
- The sources service recorded the Montgomery–Vaughan fetch (author-page copy, `certified`) in `packages/ZerosOfLFunctions/sources.toml`, which did not exist before this review; no other manifest edit was made.

## Source issues

- none
