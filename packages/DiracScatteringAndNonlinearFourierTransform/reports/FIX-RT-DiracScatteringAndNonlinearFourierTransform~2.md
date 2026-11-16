# Repair round FIX-RT-DiracScatteringAndNonlinearFourierTransform~2

Files changed: `packages/DiracScatteringAndNonlinearFourierTransform/README.md` and the top-level `gaps`
list of `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json` (now empty).
`Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged: no repaired statement is a Lean
declaration, and no new source is cited.

## RT-DiracScatteringAndNonlinearFourierTransform~2a/F01 (P2) — applied

Confirmed: `det M(t, z₀) = 1` (§3.1). Free case at `z₀ = i`: `|Θ||Φ| = cosh 2t`. Old: a route through Weyl's
alternative (OperatorTheory/UnboundedOperators §4.8). New: nested discs give `Φ ∈ L²`, and `1 ≤ |Θ||Φ|`
is then integrable, a contradiction. Removed the contract, the gap, its `plan.json` entry, and the `*Needs:*` and
Dependencies items; rewrote the scope bullet.

## RT-DiracScatteringAndNonlinearFourierTransform~2a/F02 (P3) — applied differently

Confirmed. Added bullets `M_{−q} = ΩM_qΩ⁻¹` (§3.1), `E_{−q} = iẼ_q` (§3.2) and `m_{−q} = −1/m_q` (§6.5), and a
Layer 8 paragraph making §8.2–§8.6 Dirichlet targets. Differently from the suggestion: `θ ↦ θ̃` with a new
unimodular `α̃ = −iα`. Substituting `−iα` for `α` flips the sign of §8.6's derivative relation (computed). §8.7,
§8.8 and §9.4 cite these bullets.

## RT-DiracScatteringAndNonlinearFourierTransform~2a/F03 (P3) — applied

Changes to `*Needs:*`:
- §8.6 gains §6.2 and §8.1;
- §8.7 gains §8.1, plus §3.2 and §6.5 for the `−f` reduction;
- §8.8 and §9.3 gain §8.1.

Same omission elsewhere: §9.5 (uses `T₀`) gains §8.1, and §9.4 and §6.5 gain §3.2. No edge points forward.

## RT-DiracScatteringAndNonlinearFourierTransform~2b/F01 (P2) — applied

All four confirmed against mauth2022 and poltoratski2024.
1. §2.3 weak type covers Poisson-finite measures (via §2.2).
2. Strong type holds for `1 < p < ∞`.
3. §2.6 adds `H^p(ℂ₊)`: boundary values, point and maximal bounds.
4. §7.1 represents every meromorphic inner function; §7.2 is unrestricted.

θ_E no longer needs order ≤ 1; the AnalyticNumberTheoryPartI supplier is removed.

## RT-DiracScatteringAndNonlinearFourierTransform~2b/F02 (P3) — applied

Confirmed: mauth2022 Lemmas 43, 45 and Corollary 6 (lines 3140, 3251, 1397) are version 14's Lemmas 7, 8 and
Corollary 3. The dictionary (line 75–83) lists Lemma 8, Lemma 9 and
Corollary 4 instead. Old "matches the numbering" → new: agrees through Lemma 6 and Corollary 2; later pairs
by content. The layer list gains Layer 9.

## Checks run

- **Elaboration.** `lake env lean packages/DiracScatteringAndNonlinearFourierTransform/Suggested.lean`, run
  from the content checkout: exit 0, no errors. There are 9 warnings "declaration uses `sorry`", at lines 51,
  127, 140, 155, 182, 191, 206, 221 and 242. The file imports only `Mathlib`.
- **Binder check.** A scratch copy of the file had `#check @name` appended for all 25 declarations and structure
  fields, and was elaborated once (exit 0). Each elaborated type carries the hypotheses of its README statement.
  For example, `linear_caratheodory` keeps `[CompleteSpace E]` and `szego_condition` keeps
  `MemLp q 2 (volume.restrict (Ioi 0))`. Nothing changed, because no repaired statement is in the Lean file.
- **Dependency check.**

```
depcheck: 251 roadmaps, 2381 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. There are two fewer edges than before the round: the supplier contracts
  with OperatorTheory/UnboundedOperators and AnalyticNumberTheoryPartI were removed.
- **Citation resolution.** `roadmaps resolve` on the edited README found no cross-roadmap citation and no Lean
  name that resolves nowhere.
- **Ownership by object.** `roadmaps grep` was run on main and at the open heads for: Hardy space, inner
  function, Blaschke, nontangential maximal, `H^p`.
  - StochasticCalculus S6.5 (main) owns the disc and ball versions: the circle maximal function of a finite
    measure (S6.5.1, S6.5.3) and harmonic Hardy spaces on balls (S6.5.2).
  - OperatorTheory/ToeplitzOperators (main) owns the disc `H²` and excludes general Hardy spaces.
  - No roadmap owns the half-plane `H^p(ℂ₊)` or meromorphic inner functions, so this roadmap stays their owner.
    The scope paragraph now says how §2.3 reaches measures without consuming S6.5.
  - The open pull requests were searched through `roadmaps grep` only; I did not read every sibling checkout.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.1 `M_{−q} = ΩM_qΩ⁻¹` | `q = 0.7+0.4i, z = 0.6+0.25i, t = 1.7`; `q = 1+i, z = 0, t = 1`; `q = 0.3−0.9i, z = −1.2+0.5i, t = 2.3` | entrywise difference `0.0` in all three; inverse model `M_q⁻¹` differs by `2.61`, `3e−15`, `5.84` | true; the inverse model agrees only at `z = 0` there, so the free case, whose error is `1.13` at `z = 0.6`, is used as the Check | added bullet and Check |
| §3.2 `E_{−q} = iẼ_q`, `Ẽ_{−q} = −iE_q` | same three; `f = c`, `z = 0` | errors `0.0`; `E_{−c}(t,0) = e^{−ct} = i(−ie^{−ct})`; the model `E_{−q} = Ẽ_q` gives `−ie^{−ct}` | true | bullet and Check |
| §6.5 `m_{−q} = −1/m_q` | `f = 0.7` on `[0, 1.3]`, `x = 0` | `m_c(0) = 0.162026i = ie^{−1.82}`; `m_{−c}(0) = 6.171858i = ie^{1.82} = −1/m_c(0)`; model `m_{−q} = −m_q` gives `Im < 0` | true | bullet and Check |
| Layer 8 Dirichlet paragraph | free case; dictionary for the factor `α` | `D̃ = 0.998483+0.018295i = sin(t(λ−z))` at `t = 1.3`, `λ = 0.4+0.2i`, `z = −0.7+0.1i`; `θ_{−f} = −θ̃_f`. With `α̃ = −iα` the derivative relation becomes `α̃²∂θ̃ = α²∂θ_{−f}`, while the suggested pair (`α ↦ −iα`, `θ ↦ θ̃`) gives `−` that | the substitution `θ ↦ θ̃` with a new unimodular `α̃` is exact | paragraph written that way |
| §6.4 limit point at `z₀` | free, `z₀ = i` | `|Θ||Φ| = 1.54308, 3.76220, 27.30823 = cosh 2t` at `t = 0.5, 1, 2`; `det = 1.0000` | not integrable, consistent | new route |
| §2.3 weak type, measures | `ν = δ₀` | `M_1P[δ₀](x)·|x| = 0.3842340` at `x = 0.1, 0.5, 1.2` against `(1+√2)/(2π) = 0.3842340`; `|{|x| ≤ 1: ·> λ}| = 0.768/λ` | weak `L¹`, not `L¹` | statement, route, Check |
| §2.3 smoothing bound | `ε ∈ [0, 1]`, `x ∈ [0, 50]` | `max (1+ε)(1+x²)/(2(x²+(1+ε)²)) = 0.9988 ≤ 1` | `‖h_ε‖_{L¹(Π)} ≤ 2∫dν/(1+x²)` | route |
| §2.3 strong type, `p > 1` | `g = 1_{[0,1]}` | `P[g](x+i|x|) = 0.016738, 0.0015995` at `x = 10, 100`, against `1/(2πx) = 0.015915, 0.0015915` | `L^p` near `∞` only for `p > 1` | statement, Check |
| §2.6 `H^p` point bound | `F = (z+i)^{−1/2}`, `p = 3`; `F = 1/(z+i)`, `p = 2` | `‖F‖₃³ = 5.244115` (`√πΓ(1/4)/Γ(3/4)`); `|F(i)|³ = 0.353553 ≤ 3.338507`; `p = 2`: `1/4 ≤ 2`, Cauchy `1/4 = 1/4` | true; `F ∉ H²` (`∫(1+u²)^{−1/2} = ∞`) | definition, bullets, Check |
| §7.1 representation | `θ = b_{1+i}`; `ζₙ = √n + i/n`; `E = e^{−itz}`; `E = z+i` | `εb(i) = 0.447214 = √5/5`, `α = (1+2i)/√5`; partial sums `Σ Im ζₙ/(1+|ζₙ|²) = 0.8172` (to `10⁶`), `Σ|ζₙ|^{−2} = 13.82` (diverging); `|B′(2)| = 21.98`; `c = 2t` and `c = 0` | true | bullet, route, two Checks |
| §7.2 for every MIF | Apollonius step | `(√(1+ε)+1) < 3` for `0 < ε < 1`; the existing Checks `b_i`, `b_{10i}` still hold | true | hypothesis dropped |

## For the maintainer

- `design/plan.json`'s `suppliers` list still names OperatorTheory/UnboundedOperators §4.8 and
  AnalyticNumberTheoryPartI §0.23. This job may change only the `gaps` list; the README no longer consumes
  either roadmap.
- OperatorTheory/UnboundedOperators §4.8 is still cited as a comparison in the Conventions and in two Checks.
  The Layer 1 Dependencies keep it for the fixed-parameter Check of §1.2.
- No id that another roadmap cites changed. Only the heading of §2.6 was renamed, and its number is the same.
- No source was fetched and `needs-references.toml` was not written: every text cited here is in the cache.
- Ownership against the open pull requests was checked with `roadmaps grep`, not by reading every sibling
  checkout.
