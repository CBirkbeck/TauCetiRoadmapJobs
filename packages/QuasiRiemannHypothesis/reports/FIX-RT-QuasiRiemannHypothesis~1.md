# FIX-RT-QuasiRiemannHypothesis~1: repair of red-team round 1 (passes a and b)

Twelve findings in two reviews. Two pairs overlap. 1a/F07 and 1b/F02 are settled together in one
section. The "unmarked" item of 1a/F05 is settled under 1b/F02 and named in both sections. Every
finding was checked against the cited sources, the pinned Mathlib and Tau Ceti, and the roadmaps
on main. None was disputed.

## RT-QuasiRiemannHypothesis~1a/F01 (P3) — applied differently

`sum_smul_rayClassCoeff` is the converse expansion; orthogonality is `sum_inv_smul_toUnitaryIdealWeight`
(pinned `Orthogonality.lean`, lines 68 and 86). §4.6 concerns any finite abelian `T` and `T × T`, so all
three citations now name the general `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`
(`CharacterOrthogonality.lean:184`). The contract also lists the ray class form.

## RT-QuasiRiemannHypothesis~1a/F02 (P3) — applied

The witness holds: `B(e₁, m) = B(e₂, m) = 1`, while `B(m, e₂) = 5/4`. §6.1: `e^(2πi B(m, z_j))` →
`e^(2πi B(z_j, m))`, with a clause saying the dual lattice pairs in the second slot. The witness was
added as a Check. The other pairings (§3.5, §10.2, Layer 6 Examples) use the symmetric `e(xy)`, so
nothing else changes.

## RT-QuasiRiemannHypothesis~1a/F03 (P3) — applied differently

AnalyticNumberTheoryPartI §2.42 (on main) already owns this set, so §5.4 cites it. `X(K)` is now
defined at the least `f` with `K ⊆ ℚ(ζ_f)`, with bullets: group of order `[K : ℚ]`, independent of
`f`, Frobenius values (`milnecft2020` V.3.2, 3.8, 3.10). Added: two Checks, a supplier contract, the
`Suggested.lean` docstring.

## RT-QuasiRiemannHypothesis~1a/F04 (P3) — applied

§11.1: "Hecke characters of `F`" → "… of any number field `K`, under the hypothesis for its family".
The route now names `Γ_ℝ(s + a)`, `Γ_ℂ(s)` and the poles at `0`, `1`, all outside the open strip.
Added Checks: `K = ℚ`, and `ℚ(√2)` (`ζ_K(0) = 0`, excluded). `Suggested.lean` (the instance at `F`)
is unchanged.

## RT-QuasiRiemannHypothesis~1a/F05 (P3) — applied

- "finite-ray characters" → "ray class characters, zero-extended"; also fixed at §9.4 and in the
  Layer 10 preamble.
- "deleted radicals" → "`∏_{𝔭 ∈ E_ψ} 𝔭`".
- "masks" → the periodic weights `Φ`, `χ_p^(j_p)`.
- §7.3 "height/tail order" → exponent `A` and decay order `N`.
- "primary phases" → "`n ↦ R(n, n) = χ_n(−1)`".
- "unmarked": see 1b/F02.

## RT-QuasiRiemannHypothesis~1a/F06 (P3) — applied differently

The lines were split per target. The dependencies were set from the source's proofs, where the
reviewer's lists differ. Source Lemmas 10.2–10.6 cite Lemmas 4.5, 7.1, 8.1, 9.2, 4.9, 4.10 and never
Lemma 8.2, so §7.3 was dropped from §10.5. The outer rows need §5.3 too. §9.4's first statement
also needs §2.3. §9.3 follows the reviewer, including §4.5.

## RT-QuasiRiemannHypothesis~1a/F07, RT-QuasiRiemannHypothesis~1b/F02 (P3) — applied

Source titles were replaced by mathematical names, with section numbers kept:
- the 12 headings listed;
- the same pattern at §§1.4, 4.3, 4.5, 5.3, 10.3–10.5, 10.7 and Layer 9;
- the §10.5 labels and the §9.3 lemma labels.

"Unmarked", "saturated", "buffered", "balanced" and "retained" were removed, not defined. The
Owned-here list, consumers and `Suggested.lean` docstring follow.

## RT-QuasiRiemannHypothesis~1b/F01 (P2) — applied

The match holds (`goldmakherlouvel2013` lines 45–59). §6.2 was rewritten in the roadmap's own words:
- it introduces `I(𝔠)` and writes the order as `χ_𝔞^n = 1`;
- the axioms are named *reciprocity law* and *primitivity axiom*;
- the identity is `C([𝔞], [𝔟]) χ_𝔟(𝔞)`;
- primitivity reads "conductor `𝔞𝔟`".

The Checks still give `21` and `60`.

## RT-QuasiRiemannHypothesis~1b/F03 (P3) — applied

Mathlib `riemannZeta_one_ne_zero` (`NumberTheory/Harmonic/ZetaAsymp.lean:443`) gives the conclusion at `s = 1`, and
`riemannZeta_ne_zero_of_one_le_re` has no exclusion. `(h1 : s ≠ 1)` was deleted. The docstring and
§10.7 now say that `ζ(1) = (γ − log 4π)/2 ≠ 0`. A Check was added (`−0.977`, `π²/6`). The Mathlib
contract and the §10.7 `*Needs:*` line now list `riemannZeta_one_ne_zero`.

## RT-QuasiRiemannHypothesis~1b/F04 (P3) — applied

The Example claimed that §6.5 at `n = 6` contains §6.2. It now says that §6.2 (`χ³`, bound `K + D`)
and §6.5 (`χ^(±1)`, extra `(KD)^(2/3)`) concern different powers: at `K = D` the bounds are
`D^(1+ε)` and `D^(4/3+ε)`, and neither statement implies the other. §6.5 reaches §6.2 through §6.4
at `n = 6`, which handles the cubes.

## RT-QuasiRiemannHypothesis~1b/F05 (P3) — applied

`baierbansal2018` lines 190–197 state Theorem 3 for `ℝ^d` with frequencies in `ℤ^d`, used at `d = 2`.
The citation "Theorem 3, for `ℤ[i]`" → "Theorem 3, for `Λ = ℤ^d` with the dot product, in a form
that counts close pairs of points instead of assuming separation, used there at `d = 2` for `ℤ[i]`".

## Checks run

- **Elaboration.** `lake env lean packages/QuasiRiemannHypothesis/Suggested.lean`, run from the
  content checkout, reports 10 `declaration uses 'sorry'` warnings (lines 80–178), no error and no
  other message.
- **Signatures.** A scratch copy of the file with `#check @name` for all 11 declarations was
  elaborated once. Each type was compared with its README statement. The only change is
  `riemannZeta_ne_zero_of_eleven_twelfths_lt_re : ∀ {s : ℂ}, 11 / 12 < s.re → riemannZeta s ≠ 0`
  (the `s ≠ 1` hypothesis is gone). No binder is lost.
- **Dependency check.** Output: `depcheck: 261 roadmaps, 2607 edges, 0 problem(s)`, with no UPWARD,
  CYCLE or `moved:` line. The new edge is AnalyticNumberTheoryPartI, which is on main.
- **Citations.** `roadmaps resolve` found no cross-roadmap citation and no Lean name missing
  ("None" in both lists). It does not check library names on this host, so the new ones were read at
  the pins:
  - `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`;
  - `TauCeti.LFunctions.sum_inv_smul_toUnitaryIdealWeight`;
  - `riemannZeta_one_ne_zero`;
  - `TauCeti.ClassFieldTheory.kroneckerWeber` (`ClassFields/KroneckerWeber.lean:178`).

  The `HasEnoughRootsOfUnity ℂ n` instance needed by the first is Mathlib's separably closed
  instance.
- **Source titles.** All headings and bold labels were compared with the source's titles. Every
  remaining shared three-word run is a generic name: "zero-free half-plane", "sextic large sieve",
  "transfer to Dirichlet `L`-functions".

## Adversarial pass on the changed statements

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §4.6 supplier `sum_inv_mul_monoidHom_apply_eq_ite` | `T = ℤ/2`, `Φ = 1_0` | `Σ_θ θ(0)⁻¹ θ = 1 + θ₁ = 2·1_0`, `a_θ = 1/2` | matches the §4.6 Check; the old lemma says nothing about `1_0` |
| §5.4 `X(K)` | `ℚ`; `F`; `ℚ(i)`; `ℚ(√5)` at `f = 5` and `f = 10` | `{1}`; `{1, χ₋₃}`; `{1, χ₄}`; `{1, (·/5)}` both times; orders `1, 2, 2, 2 = [K : ℚ]` | holds; the wrong model "all characters mod `f`" gives order `4` for `ℚ(√5)` |
| §5.4 Frobenius value | `ℚ(√5)`, `p = 2` inert, `p = 11` split | `(2/5) = −1`; principal mod `10` gives `0` at `2`; `∏(1 − ψ(p)x)` = `1 − x²` at `2`, `(1 − x)²` at `11` | holds; non-primitive characters excluded |
| §6.1 pairing | `B(x, y) = x₁y₁ + x₁y₂/2 + x₂y₂`, `m = (1/2, 1)`; `ℂ/𝓞` with `e(xy)` | `B(·, m) = 1, 1`; `B(m, e₂) = 5/4`, factor `i`; symmetric pairing unchanged | fixed |
| §6.2 definition | `ℚ`, `n = 2`, `𝔠 = (4)`, `a = 3, 7, 5`; trivial family | `(3/7) = −1 = C · (7/3)` with `C = (−1)^3`; conductors `21`, `60`; trivial family fails primitivity | same verdicts as before |
| Layer 6 Example | `K = D` | `D^(1+ε)` against `D^(4/3+ε)` | neither statement implies the other |
| Layer 10 `T` | ray class group mod `12`; `n = 1 + 3ω` | order `12`; `R(n, n) = γ_3² = −1 = χ_n(−1)` | `R`, `G` and the diagonal factor through it |
| §10.7 `ζ ≠ 0` | `s = 1`; `s = 2` | `(0.5772 − 2.5310)/2 = −0.977`; `π²/6 = 1.645` | true without `s ≠ 1` |
| §11.1 for `K` | `K = ℚ`; `ℚ(√2)`, trivial; `θ = 1/2`; gamma poles | Dirichlet clause; `ζ_K(0) = 0`, order `1`, `Re = 0`; `Re ρ = 1/2`; poles at `−a − 2k`, `0, −1, …` | true; nothing used `F` |
| §10.5 `*Needs:*` | source Lemmas 10.2–10.6 | cite 4.5, 7.1, 8.1, 9.2, 4.9, 4.10; never 8.2 | split as stated |

## For the maintainer

- `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` keeps its name, but its signature lost `(h1 : s ≠ 1)`.
- No section number changed. Only heading texts changed (anchors), and no roadmap on main cites this
  one.
- AnalyticNumberTheoryPartI §2.42 is a new supplier. It is on main and earlier in the merge order.
- Ownership against open pull requests: `roadmaps grep` for the characters of an abelian field
  found only ExplicitNumberFields. It cites the same AnalyticNumberTheoryPartI §2.42, so there is no
  second owner.
- The `milnecft2020` locators were extended in `sources.toml` and in the References. No source is
  missing, and `needs-references.toml` was not written.
- Formatting only: the changed paragraphs were reflowed to the README's line width.
- Neither review contained text addressed to the agent.
