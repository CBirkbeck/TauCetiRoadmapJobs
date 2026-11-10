# FIX-DESIGN-SchrodingerOperatorsAndSpectralTypes~3

Repair of the eight findings of `REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~2` on the design
of `SchrodingerOperatorsAndSpectralTypes`. Files edited:
`packages/SchrodingerOperatorsAndSpectralTypes/design/README.md`,
`packages/SchrodingerOperatorsAndSpectralTypes/design/plan.json`,
`packages/SchrodingerOperatorsAndSpectralTypes/sources.toml`. The design has no `Suggested.lean`,
so no Lean statement changed and nothing was elaborated. Suppliers read: SelfAdjointSpectralTheory on
main (`4ec889e`), QuantumFoundations at the head of its open pull request (`824bab8`), and the
cached texts of teschl, kato57, rosenblum57 and the newly fetched yafaev04.

## REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~2/R01 (P1) — applied

Verified: `x = 1_{[0,1]}` for `M_λ` has density `1`, so constant `−1` works and constant `0` does not.
Old: "constant `m` implies `m'` for `m ≤ m'`". New: monotonicity under `m² ≤ m'²`, in particular
`0 ≤ m ≤ m'`. The truncation now says `m ≥ 0`, `m → +∞`. Added the sign Check, a scalar law and
the multiplier Check. Plan 1.8a API and tests changed to match.

## REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~2/R02 (P1) — applied

Verified: SA conventions (`SelfAdjointSpectralTheory/README.md` lines 43–47) give `R_A(z) = (zI − A)⁻¹`. For
`A = 2`, `V = 1`, `μ = 0` the old factor gave `1` and the new one gives `3`. Old:
`(1 + V R_A(μ))(A − μ)`. New: `(1 − V R_A(μ))(A − μ)`, then SA-E08 and SA-E11. There is also a
Conventions resolvent bullet with a witness and a sign Check. Pattern: 2.1's equivalence no longer
assumes semiboundedness. Plan 2.1b and 2.3 changed to match.

## REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~2/R03 (P2) — applied

Verified with the witness `e^{itx}1_{[0,1]}`. Old: Pearson's step was described as "weak limit plus
`‖W(t)x‖ = ‖x‖`". New: Pearson's theorem is a named target (1.9a) with the form hypothesis
`⟪H₂ψ,Jφ⟫ − ⟪ψ,JH₁φ⟫ = ⟪ψ,Cφ⟫`. It cites yafaev04 Theorem 1.8 (certified) and pearson78/rs3
(uncertified). Kato–Rosenblum (1.9b) is derived from it in steps (a)–(d). The failed inference is a
negative Check.

## REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~2/R04 (P2) — applied

Verified: for `V = 1_{[0,π)}` on the circle, continuity of `Vu` forces `u(0) = 0`, and the third
derivatives force `u'(0) = 0`, so `u = 0`. Old: "the same eigenvalue description as 3.8". New: the
statement gives compact resolvent, discrete spectrum and an `H²` eigenbasis. Eigenvalues are min–max
values with `λ_{n−1}(X) + ess inf V ≤ μ_n ≤ λ_{n−1}(X) + ess sup V`; eigenfunctions are smooth only for smooth `V`. Checks: `V = 1`
(`1,2,2,5,5`), the step potential, `N` points.

## REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~2/R05 (P2) — applied

Verified: QuantumFoundations §8.2 at its head owns `−Δ/(2m)` on `H²(ℝⁿ)`, its cores, its spectral
measure and `σ = σ_ac = [0,∞)`. It is at ORDER line 212 and does not cite this roadmap. Old: a
"Moved here" bullet and targets 4.2a/4.2b. New: a QF supplier contract. §4.2 keeps only the form
domain `H¹`, the form `4π²∫‖ξ‖²|𝓕u|²` and `σ_ess = [0,∞)` (plan 4.2). QF is dropped from the
consumers.

## REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~2/R06 (P3) — applied

Verified: teschl lines 4420–4427 define the spectral parts, and SA-E06 is commutation only.
Theorem 10.2 (lines 9578–9584) needs `V ∈ L^∞_∞`. Old: §1.3 cited lines 4420–4427 and SA-E06.
New: Lemma 2.24 (p. 80) and Corollary 4.6 (p. 116), with the resolvent-restriction step derived from SA-B44, SA-C14–C15 and SA-E05. §4.4
now cites Theorem 6.4 (p. 135) and Lemma 7.9 (p. 168), with Theorem 10.2 for the decaying clause
only. Added a `V = 1` Check. The plan locators changed to match.

## REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~2/R07 (P2) — applied

Verified: `ψ = 0` gives `u_n = 0`. Old: "a fixed `ψ ∈ C_c^∞((1,2))`". New: `ψ ≠ 0`,
`‖u_n‖² = wn‖ψ‖²₂ > 0`, the explicit residual, and the bound
`≤ (2|t|‖ψ'‖/n + ‖ψ''‖/n²)/‖ψ‖ → 0`. The normalised `v_j = u_{2^j}/‖u_{2^j}‖` are orthonormal since
`3·2^j < 2^{j+2}`. Added the `ψ = 0` negative Check. Plan 3.10b gained two tests.

## REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~2/R08 (P3) — applied

Old: the APIs for §1.8, §3.10 and §4.3 were only in the plan. New: README API bullets. §1.8:
monotonicity, scalars, truncation/density; Checks for the multiplier, the sign of `m`, and `H = 0`
on `ℂ`. §3.10: area, truncation, isometry; truncation Check (`1 → 1/2`). §4.3: sums, bounded
support, bounded multipliers; sums Check.

## Checks run

**Dependency gate** (the command in the brief), exact output:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
note: supplier UnboundedOperators of SchrodingerOperatorsAndSpectralTypes is not in the merge order; it must be inserted before SchrodingerOperatorsAndSpectralTypes
note: supplier VariationalMethods of SchrodingerOperatorsAndSpectralTypes is not in the merge order; it must be inserted before SchrodingerOperatorsAndSpectralTypes
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The two notes are not defects at the design stage.

**Citations** (`roadmaps resolve` on the edited README, index of 2026-11-10T20:52:18Z): no
cross-roadmap citation and no Lean name found nowhere. I checked `IsCompactOperator.comp_clm`,
`TemperedDistribution.MemSobolev`, `ContinuousLinearMap.nuclearENorm` and
`IsSelfAdjoint.hasCompactResolvent_iff_isCompactOperator_resolvent` against the files listed in the
review's pinned-declaration table.

**Lean.** No `Suggested.lean` exists at this design stage. No elaboration and no `#check` binder
comparison was possible, and none is claimed.

**Ownership.** I searched main and the open heads with `roadmaps grep` for
"Pearson|Kato.Rosenblum|Birman|trace.class perturbation" and "wave operator|Møller". The only hits
were unrelated: RelativisticQuantumFieldTheory's Haag–Ruelle wave operators, and braid and statistics
uses. So Pearson's theorem and the abstract wave operators have no other owner, and this roadmap
owns them. QuantumFoundations §8.2 owns the free Hamiltonian, and this roadmap cites it (R05).

**Sources.**

- `yafaev04` (D. Yafaev, *Lectures on scattering theory*, arXiv math/0403213v1) was fetched as
  certified. Its Definition 1.3 (line 116–122), Theorem 1.4 (line 136–140), Theorem 1.8 (line
  191–198) and Lemma 1.9 (line 199–206) were read.
- `pearson78` is recorded as uncertified (paywalled). The service's DOI lookup first attached a
  wrong paper (Connes–Størmer). I corrected the entry to Pearson, *A generalization of the Birman
  trace theorem*, J. Funct. Anal. 28 (1978) 182–186, DOI `10.1016/0022-1236(78)90084-8`. The DOI
  and author were confirmed on the MaRDI portal (zbMATH 0382.47006), and the volume and pages from
  yafaev04 line 1062–1063.
- Kato's finite-rank paper (J. Math. Soc. Japan 9, 1957) could not be fetched legally. It is not
  needed for the Pearson route and is not cited, so I deleted the `needs-references.toml` entry my
  fetch had created. The file did not exist when the job started, and no text is requested.
- Other manifest locators were updated: teschl (Lemma 2.24, Corollary 4.6, (2.68), the remark
  before Lemma 6.22, (7.26)) and kato57 (no longer (2.6)–(2.11)).

## Adversarial pass on every added or changed statement

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.8 monotonicity | `M_λ`, `x = 1_{[0,1]}`; `(m,m') = (−1,0), (1,2), (−2,1)` | density `1`; `1 ≤ 1` true, `1 ≤ 0` false; `1 ≤ 4` true; `(−2)² = 4 ≤ 1` false, so the hypothesis fails | `m² ≤ m'²` is the right law | R01 |
| 1.8 scalars | `x = 1_{[0,1]}`, `c = 3i`, `m = 1` | `μ_{cx} = 9·Leb|[0,1]`, density `9 = (|c|m)²` | true | new bullet |
| 1.8 truncation | `x = |λ|^{−1/4}1_{[−1,1]}`, `m = 1, 2` | removed mass `∫_{|λ|<m^{−4}}|λ|^{−1/2} = 4/m²`: `4`, `1` | `→ 0` | R01/R08 |
| 1.8 membership clause | `H = 0` on `ℂ`, `x = 1`, `C = 1` | `μ_x = δ₀`, rnDeriv `0`; LHS `∫_ℝ 1 dt = ∞`, RHS `2π·0·1 = 0` | clause load-bearing | R08 Check |
| 1.9a Pearson | `J = 1, C = 0, H₁ = H₂ = M_x`; `J = 0`; `ℋ_ac(H₁) = 0` | limits `P_ac = 1`; `0`; `0` | exist; isometry not asserted | new target |
| 1.9a Duhamel sign | `ψ_u = e^{−iuH₂}ψ`, `φ_u = e^{−iuH₁}φ` | `d/du⟪ψ_u,Jφ_u⟫ = i⟪H₂ψ_u,Jφ_u⟫ − i⟪ψ_u,JH₁φ_u⟫ = i⟪ψ_u,Cφ_u⟫` | matches `+i∫` | — |
| 1.9a intertwining | any `s, t` | `e^{isH₂}W(t) = e^{i(t+s)H₂}Je^{−itH₁} = W(t+s)e^{isH₁}` | true | — |
| 1.9b route (a) | `H₂ = H₁ + V`, `V` bounded symmetric | `⟪(H₁+V)ψ,φ⟫ − ⟪ψ,H₁φ⟫ = ⟪ψ,Vφ⟫` | hypothesis met with `C = V` | — |
| 1.9b route (c),(d) | unitary `U_t = e^{itH₂}e^{−itH₁}` | `‖U_t x − y‖ = ‖x − U_t* y‖`; adjoint via `W₂₁x ∈ ℋ_ac(H₂)`, `W₁₂y ∈ ℋ_ac(H₁)` | true | — |
| weak ≠ strong | `H₁ = M_x, H₂ = 2M_x`, `x = 1_{[0,1]}` | `⟪x,e^{itx}x⟫ = (e^{it}−1)/(it) → 0`; norm `1`; distance to weak limit `1` | inference false; `M_x` not trace class | R03 Check |
| 1.3 route | `diag(1,2,3)`, `U = span(e₁,e₃)`, `z = i` | `R_A(i) = diag((i−1)⁻¹,(i−2)⁻¹,(i−3)⁻¹)`; restriction to `U` = resolvent of `diag(1,3)`; spectrum `{1,3}` | true | R06 |
| 2.1 equivalence without lower bound | `ℋ = 0`; `M_x`, `γ = 0`; `A = 2`, `γ = 2, 3` | all true; all false; true at `2`, all false at `3` (`P((−∞,3)) = 1`) | true | R02 pattern |
| 2.3 factorisation | `A = 2, V = 1, μ = 0` on `ℂ` | `R_A(0) = −1/2`; `(1 − V R_A)(A) = 3 = A + V`; `(1 + V R_A)(A) = 1` | minus sign correct | R02 |
| 2.3 norm bound | `γ = −1`, `μ = −3` (`d = 2`), `λ ∈ {−1, 0, 5}` | `|λ|/(λ−μ) = 1/2, 0, 5/8`, all `≤ max(1, 1/2) = 1` | true | — |
| 3.9 compact resolvent | circle, `V = 1`, `s = 2` | `‖V(Δ − 2i)⁻¹‖ ≤ 1/2 < 1` | true | R04 |
| 3.9 min–max sandwich | circle, `V = 1`; `V = 1_{[0,π)}`, `n = 1` | `μ_n = λ_{n−1} + 1`: `1,2,2,5`; `0 ≤ μ₁ ≤ 1` and Rayleigh `1/2` | consistent | R04 |
| 3.9 smoothness | `V = 1_{[0,π)}` | `u(0) = 0`; `(1−λ)u'(0) = −λu'(0)` gives `u'(0) = 0`; `u = 0` | smooth claim false for step `V` | R04 Check |
| 3.9 dimension 0 | `N = 2` points, `V = (3, −1)` | eigenvalues `−1, 3`; `μ₃ = +∞`; `λ_k = 0, 0, +∞` and sandwich `−1 ≤ μ₁ ≤ 3`, `−1 ≤ μ₂ ≤ 3` | true; divergence needs `dim ≥ 1` | Check |
| 3.10 normalisation | `w = 1`, `ψ ≠ 0`; `ψ = 0` | `‖u_n‖² = n‖ψ‖²`; `0` | `ψ ≠ 0` needed | R07 |
| 3.10 residual | `f = e^{itr}ψ((r−n)/n)` | `(1/4 − ∂²)f = (1/4+t²)f − e^{itr}(2itψ'/n + ψ''/n²)` | ratio `≤ (2|t|‖ψ'‖/n + ‖ψ''‖/n²)/‖ψ‖` | R07 |
| 3.10 disjointness | `n = 2^j`, `j = 1, 2` | `log y ∈ (4,6)`, `(8,12)` | disjoint | — |
| 3.10 truncation API | `w = 1`, `a = 1 → 2` | area `1 → 1/2`; model `w·a` gives `1 → 2` | `w/a` correct | R08 |
| 4.2 form | `u = e^{−πx²}` | `‖u'‖² = 4π²·1/(4π√2) = π/√2`, `‖u‖² = 1/√2`, quotient `π`; without `4π²`: `1/(4π√2)` | true | R05 |
| 4.2 `σ_ess` | `d = 1`; `d = 0` | `σ = [0,∞)`, no isolated point, so `σ_ess = [0,∞)`; at `d = 0`, `σ = {0}` isolated, `σ_ess = ∅` | `d ≥ 1` needed | R05 |
| 4.2 Gaussian density versus QF | `n = 1`, `ψ = e^{−πx²}` | QF `½(2π)^{−1}λ^{−1/2}·2e^{−λ/(2π)} = e^{−λ/(2π)}/(2π√λ)`, mass `2^{−1/2}` | agree | — |
| 4.3 sums | `1_{B_1} + (1+‖x‖²)^{−1/2}`, `ε = 0.9` | `√(ε^{−2}−1) ≈ 0.48 < 1`, so the radius is `max(1, ·) = 1`; outside `B_1` the bound is `≤ 2^{−1/2} < 0.9` | radius corrected to `max(1, ·)` | R08 |
| 4.3 product | `V` with `|V| ≤ ε'` off `B_R`, `ess sup|W| = 3`, `ε' = ε/4` | `|VW| ≤ 3ε/4 ≤ ε` | true | new bullet |
| 4.4 decaying clause | `V = 1`; `V = −1_{[−1,1]}` | `σ_ess = [1,∞)`; `k ≈ 0.7391`, `κ ≈ 0.6736`, `E ≈ −0.4538`, `σ_ess = [0,∞)` | Theorem 10.2 only for decay | R06 Check |

## Gate failures

None were listed for this job.

## For the maintainer

- QuantumFoundations is now a supplier (§8.2). The gate places this roadmap after QuantumFoundations
  (ORDER line 212), and QuantumFoundations is no longer listed as a consumer.
- The other roadmaps under "Downstream consumers" (AutomorphicSpectralTheory, CongruenceSpectralGap,
  MaassForms, RelativisticQuantumFieldTheory, RicciFlow, SpectralManifolds, PositiveMass) are earlier
  in the merge order. They could only use this roadmap through later revisions; none cites it today
  (`roadmaps grep` for the roadmap's name finds no match on main or at any open head). This was left
  unchanged because it is outside the findings.
- Plan identifiers changed: `1.9` became `1.9a` (`pearson_waveOperator_exists`, new) and `1.9b`
  (`kato_rosenblum`). `4.2a` (`freeLaplacian`) and `4.2b` (`freeLaplacian_spectrum`) became `4.2`
  (`freeLaplacian_form_essSpectrum`). No other roadmap cites them.
- One README heading changed: "1.9 The Kato–Rosenblum theorem" is now "1.9 Pearson's theorem and
  the Kato–Rosenblum theorem". The section number is kept.
- I could not check open pull requests whose files the tools do not index. The roadmap-folder heads
  were searched through `roadmaps grep`.
- No untrusted text contained instructions.
