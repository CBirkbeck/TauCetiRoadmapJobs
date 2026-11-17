# FIX-DESIGN-QuasiRiemannHypothesis~4: repair of the design review

Review answered: `REV-DESIGN-QuasiRiemannHypothesis~3` (6 findings: 5 P2, 1 P3). Files changed:
`packages/QuasiRiemannHypothesis/design/README.md`, `packages/QuasiRiemannHypothesis/design/plan.json`
(11 layers, 55 targets, 159 tests, `gaps = []`), `packages/QuasiRiemannHypothesis/sources.toml` (three
locators, one `cited_for`). No target was added or removed and no section, layer or target was
renumbered. The review's "For the human reviewers" section was read and nothing was changed for it.

## F01 (P2) — applied differently

§5.2: the Phragmén–Lindelöf route → the instance of ExplicitZetaBounds §3.2 (`norm_continuedL_le_rademacher`)
at `η = 1/10` and `heckeData ψ`, with explicit `C_K = 3 |d_K|^(3/5) ζ(11/10)^d`; new contract
"From TauCetiRoadmap.ExplicitZetaBounds", "Consumed" line, "Owned here" clause; `PhragmenLindelof.vertical_strip`,
ZerosOfLFunctions §§1.3, 3.4 dropped everywhere; `plan.json` 5.2 and suppliers.

Why differently: the review's repair drops ZerosOfLFunctions §3.1 too, but finite order of the
completion is one of the conditions of "finite-order type" (ExplicitZetaBounds `Suggested.lean`
line 412, hypothesis `hfin`), and ZerosOfLFunctions §3.1 is where it is proved for `heckeData ψ`; it
stays, beside §1.6 (`continuedL (heckeData χ) = heckeLFunctionC χ.character`, ZerosOfLFunctions README
line 942). The other conditions are now supplied explicitly: the three predicates through LFunctions
Layers 6 and 8 (`grossencharacterData_ofRayClassCharacter`, `EqOffZero`; LFunctions `Suggested.lean`
lines 173, 2645), the gamma shifts and polar divisor from the definition of `heckeData` (line 1632),
and the coefficient majorant `ζ_K(σ) ≤ ζ(σ)^d`, proved in the route from `(1 − x)^f ≤ 1 − x^f` and
`Σ_{𝔭 ∣ p} f_𝔭 ≤ d`. The passage from `x^((11/10−σ)/2)` to `(N(3 + |t|)^d)^(3/5)` goes through
`max(1, x)`, since `x < 1` occurs (`K = ℚ`, `s = −1/10`: `x = 0.143`). Same pattern: the Layer 5
Dependencies, the ZerosOfLFunctions "Consumed" line and contract, the LFunctions contract.

## F02 (P2) — applied differently

§6.2: "`{χ_𝔞^(n/d)}` is a `d`-th order Hecke family" → the inducing primitive powers have order dividing
`d`, trivial infinite type and reciprocity with `C^(n/d)` at pairs prime to each other's conductors;
reciprocity elsewhere and primitivity are hypotheses. Corollary: `n ≥ 4` even with the powers a
quadratic family. New Check; §6.4 route verifies the hypothesis; `plan.json` 6.2, 6.4.

Why differently: the suggested text asserts reciprocity (2) with `C^(n/d)` at every coprime pair.
The axioms give it only where `𝔟` is prime to the conductor of `χ_𝔞`: when `𝔟` meets that conductor,
`χ_𝔞(𝔟) = 0 = χ_𝔟(𝔞)` and the primitive characters inducing the powers are not constrained there. The
witness is confirmed: `goldmakherlouvel2013` lines 45–49 (Definition 1 (1): the order *divides* `n`),
line 65 (Remark 3) and lines 90–100 (Corollary 1.2). For the use in §6.4 the evidence is the source's
own: `bgl2014` lines 598–599 (p. 11) apply the corollary at `j = n/2` "because of Lemma 2.1 and 2.3",
and Lemma 2.3 (lines 305–307, p. 7) gives conductor `𝔟₁𝔟₂` for `χ_𝔟₁^j χ̄_𝔟₂^j` in a common class. That
citation replaces the review's local-component argument. The Check's witness is the Fisher–Friedberg
family of `goldmakherlouvel2013` §2 at `n = 2`, not §6.3, which assumes `n ≥ 3`.

## F03 (P2) — applied

§8.5 bullet "`θ` is the residue, up to a nonzero constant, at every essential cusp" → Kubota's
finite-dimensional space of square-integrable limits, with no dimension bound; for `(Γ₁(3), κ_P)` the
essential classes `∞, 0, 1, −1` among twelve, residues proportional to the cubic theta function. New
cusp-count Check. §8.7's "at every essential cusp" made precise. `plan.json` 8.5 (api, test), 8.7.

Evidence: `kubota1969` lines 1334–1356 (p. 49, finite dimensional, no bound); `patterson1977` lines
109–114 (classes of cusps of `Γ₁`, p. 126), 135–138 (essential cusps `∞, 0, ±1`, p. 127), 1175–1177
(Theorem 8.1, p. 152: "proportional" at each `p ∈ P₀`). The review's wording "the cusps `ω, ω²` are not
essential" was widened to the eight non-essential classes `±ω, ±ω², ±(1 − ω), ±(1 − ω)⁻¹`.

## F04 (P2) — applied

§11.2 Hecke analogue: "nontrivial finite-order Hecke character `η` of conductor `𝔣`… `(log N𝔣 + 2)`" →
"a modulus `𝔪`, nontrivial `η : RayClassCharacter 𝔪` (value `0` off ideals prime to `𝔪`), `heckeLFunctionC η`
zero-free right of `θ`… `(log N𝔪₀ + 2)`, `𝔪₀` the finite part; the conductor for primitive `η`". Three
Checks added; `*Needs:*` gains §1.1; `plan.json` 11.2.

Evidence: at `K = ℚ`, `η` modulo `3 ∏_{p ≤ y} p` induced by `(·/3)`, `η(p) = 0` for `p ≤ y`, so no prime
`≤ y` qualifies while `N𝔣 = 3`. The least admissible prime is the least `p > y` with
`p ≡ 2 (mod 3)`, not "the next prime after `y`" as the review says; it is still `≤ 2y`, so the
repaired bound holds.

## F05 (P2) — applied

§10.6 route: the five labelled savings, which reproduced the source's table → the row ranges stated
in this roadmap's notation (`Z^(1/63) < q_u ≤ Z^(501/1000)`, `u = 1`, `q_u ≤ Z^(1/63)`, `q_u > Z^(501/1000)`),
the contour lines they are read on, and the derivation `1/24 − (62/75)(1/1000) = 1021/25000`. Third
Check reworded; new arithmetic Check; `plan.json` 10.6 locator and tests.

Evidence: `openai2026quasiRH` lines 3676–3683 (the table, p. 82) and lines 3422–3427 (p. 76: slope in
`[33/50, 62/75]`, saving `1/24 − (62/75)ς`), checked: `3125/75000 − 62/75000 = 3063/75000 = 1021/25000`.
"Unresidued" no longer occurs. A shingle check of all added text against the cached
`openai2026quasiRH`, `goldmakherlouvel2013`, `bgl2014`, `kubota1969`, `patterson1977` and
`lamzourilisound2015` found no run of 8 shared words.

## F06 (P3) — applied

(a) §5.4 third Check: `N(1 + √2) = −1` → `α = 1 + 3√2 ≡ 1 (mod 3)`, `N(α) = −17`, `χ(17) = −1`.
(b) §5.1: "for `Z ≥ 1` and `B ≥ 0`", with a `B = 0`, `Z → 0` Check. (c) `plan.json` 8.4, 10.3, 10.4 now
carry the README's Checks (3, 4, 3).

Same pattern: a scan of every target's README Check count against its `plan.json` tests found two
more gaps, now filled: 2.1 (the `K = F`, `n = 6`, `a = −1` Check) and 4.3 (the forced conjugate). 4.4 has
four tests for three Checks because one Check holds two computations; no gap. Every target added or
changed by F01–F05 has its new Checks in the plan too.

## Checks run

Dependency check (exact output, after the last edit):

```text
candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
depcheck: 261 roadmaps, 2606 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The one new edge is ExplicitZetaBounds, which is on main.

`roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere.
The newly cited roadmap declarations were read at main: ExplicitZetaBounds `Suggested.lean`
`continuedL` (line 384) and `norm_continuedL_le_rademacher` (line 412); LFunctions `Suggested.lean`
`heckeData` (line 1632), `EqOffZero` (173), `grossencharacterData_ofRayClassCharacter` (2645).
`roadmaps overlaps` for ExplicitZetaBounds, LFunctions and ZerosOfLFunctions: no open pull request
changes them or drops a cited id.

There is no `Suggested.lean` at the design stage, so nothing was elaborated and no `#check` file was
needed. No gate failures were listed for this round.

`sources.toml`: `openai2026quasiRH` locator gains "(10.12), p. 76; §11, p. 82" (and loses "the margin
table"); `goldmakherlouvel2013` gains "Remark 3"; `bgl2014` gains "the case j = n/2 in the proof of
Lemma 3.5, p. 11" and `cited_for` "6.2". The README References gain Remark 3 and §2 for
`goldmakherlouvel2013`. No new source, so no `needs-references.toml`.

Ownership: no new construction. §5.2 now consumes its owner (ExplicitZetaBounds §3.2, main) instead of
re-proving it. The Kubota/Patterson and Hecke-family material was already checked as owned here by
the review's duplication audit; no open roadmap states a Fisher–Friedberg family, a Kubota theta
residue or least prime ideals in a presentation.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §5.2 bound | `K = ℚ`, `ψ = 1`, `s = −1/10 + it`, `t = 0, 1, 10, 50` | `|ℒ| = 0.510, 0.409, 1.813, 1.964`; §3.2 form `9.90, 12.59, 42.07, 110.23`; stated `61.38, 72.95, 147.96, 343.84` | holds | F01 |
| §5.2 interior | `σ = 1/2, 9/10`, `t = 10` | `|ℒ| = 1.534, 1.397` against `36.63, 33.32` (§3.2) and `147.96` | holds | F01 |
| §5.2 base `< 1` | `s = −1/10`, `N = 1` | `x = 0.9/(2π) = 0.143`, `x^(3/5) = 0.311 ≤ 1 = max(1, x)^(3/5)` | the `max` step is needed | F01 |
| §5.2 majorant | `p` split in `ℚ(i)` (`f = 1`, two primes); inert (`f = 2`); `x = 1/2` | `(1 − x)^(−2)` both sides; `(1 − x²)⁻¹ = 4/3 ≤ (1 − x)^(−2) = 4` | holds | F01 |
| §5.2 pole factor | `ψ = 1`, `s → 1`; `s = 11/10` | `|(s−1)/(s+1)| · 3|(1+s)/(1−s)| = 3`; `|ℒ(11/10)| = 0.504` | holds | F01 |
| §5.2 hypotheses of §3.2 | `heckeData 1` of `ℚ(i)`, of `ℚ` | `gammaC = {0}` nonempty, `gammaR = {0}`: pole of `γ` at `0` | holds | F01 |
| §5.1 consequence | `B = 0`, `Z = 1/2, 10⁻⁶`; `Z = 1` | `D = 1` against `Z^ε → 0`; at `Z ≥ 1`, `N𝔯^ε ≤ Z^(Bε)` | needs `Z ≥ 1` | F06 |
| §5.4 Check | `ℚ(√2)`, `q = 3`, `α = 1 + 3√2`; `α = 1 + √2` | `N = −17`, `χ(17) = −1`; `(1 + √2) = 𝓞`, `χ(1) = 1`, `1 + √2 ≢ 1 (mod 3)` | new witness tests the ray | F06 |
| §6.2 powers | quadratic family over `ℚ(i)` with `n = 4` | squares induced by `1`; two primes of one class: `1 · 1` not primitive modulo `𝔭₁𝔭₂` | general claim false | F02 |
| §6.2 reciprocity of powers | `𝔟` prime to `cond χ_𝔞` | `χ_𝔞(𝔟) ≠ 0 ⇒ χ_𝔟(𝔞) ≠ 0`; `(χ_𝔟(𝔞)C)^(n/d)` | holds there only | F02 |
| §6.2 Check | `λ_𝔟 = 1`, `M = N` | inner count `≍ N ∏_{𝔭∣𝔞}(1 − 1/N𝔭)`, double sum `≍ N³`; right side `≍ N^(2+2ε)` | corollary false without hypothesis | F02 |
| §6.4 hypothesis | FF characters, `j = n/2` | `χ̄^(n/2) = χ^(n/2)` (values `0, ±1`); conductor `∣ 𝔠𝔞`; Lemma 2.3: conductor `𝔟₁𝔟₂` | holds | F02 |
| §8.5 cusp count | `Γ₁(3) ⊂ SL₂(𝓞)` | `648/2 = 324`; stabilizer index `3 · 9 = 27`; `12` classes, `4` essential | agrees with Patterson's list | F03 |
| §8.5, §8.7 cusps | `0, 1, −1` as `SL₂(ℤ)` images of `∞` | `(0 −1; 1 0)∞ = 0`, `(1 0; 1 1)∞ = 1`, `(−1 0; 1 −1)∞ = −1` | one `Γ₂`-class | F03 |
| §11.2 Hecke | `ℚ`, modulus `3 ∏_{p≤y} p`, `y = 30` | `log N𝔪₀ = log 3 + 22.59 = 23.69`; least `p > 30`, `p ≡ 2 (3)`: `41 ≤ 60` | bound in `N𝔪₀` holds; in `N𝔣` fails | F04 |
| §11.2 Checks | `ℚ(i)`, `η = (·/3)∘N`; trivial `η` of `F` | `(2/3) = −1` at `(1 + i)`; trivial: hypothesis true (§10.7), no admissible prime | holds; nontrivial needed | F04 |
| §10.6 savings | data of §10.1 | `1/24 − 62/75000 = 1021/25000 = 0.04084`; `(1/6 − 33/200)/2 = 1/1200`; `(1/20)/2 = 1/40`; order `0.000833 < 0.025 < 0.0408 < 0.1433` | holds | F05 |

## For the maintainer

- New supplier citation: ExplicitZetaBounds §3.2 (on main). Newly cited: LFunctions Layers 6 and 8,
  ZerosOfLFunctions §1.6 and §8.5 (the latter was already consumed but missing from the contract). No
  longer cited: ZerosOfLFunctions §§1.3, 3.4; Mathlib `PhragmenLindelof.vertical_strip`.
- No id of this roadmap changed; no other roadmap cites it yet.
- Source issue for the human reviewers, already raised by the review: `goldmakherlouvel2013` Remark 3
  and Corollary 1.2 omit the hypothesis on the powers. `bgl2014` line 598 cites the same corollary as
  "[GL, Corollary 1.5]", the numbering of another version; this roadmap cites the arXiv v2 numbering
  it read (Corollary 1.2).
- Nothing in the review asked for anything outside this job; no suspicious instruction was found.
