# Review of PrimeProductIntervals (pull request #2865 at 37a574a)

**Verdict:** needs changes

**Summary.** Needs changes, for two reasons, neither of them a mathematical error: every statement, constant and worked example of the three layers was recomputed and is correct, and the Chirre–Hagen input is quoted with its exact hypotheses. `Suggested.lean` does not compile at the pins (one definition lacks `noncomputable`), and the headline theorem of the Summary, the passage from the global mean-square bound to every `x ≥ 9.6·10³⁷`, is statable but not stated there. There are three small corrections and three format notes, none blocking. For the humans who approve: the deduction's only source is a preprint that the README cites without any identifier and that I could not read.

## R01 (P1) — `Suggested.lean` does not compile at the pins: `pairStarts` divides real numbers and is not marked `noncomputable`

The file is the roadmap's acceptance test, and as it stands it fails before its last two theorems can be relied on. Elaborating `TauCetiRoadmap/PrimeProductIntervals/Suggested.lean` at the pinned Mathlib stops at line 38, column 4: "failed to compile definition, consider marking it as 'noncomputable' because it depends on 'Real.instDivInvMonoid'". The description says the targets were checked in another Lean environment; at this repository's pins they are not.

The smallest change is `noncomputable def pairStarts` on line 38 (as `thetaMoment` and `balancedProducts` already are). On a copy with that one word added the file elaborates with `sorry` as the only warning, on lines 27, 32, 41 and 55.

## R02 (P2) — The headline theorem of the Summary, from the global mean-square bound to every `x ≥ 9.6·10³⁷`, is statable at the pins and is not in `Suggested.lean`

The Summary's main claim is "Assuming the explicit relative theta estimate of Chirre and Hagen, every real $x\ge9.6\cdot10^{37}$ has at least $(14/3)\sqrt{x}$ balanced semiprimes" in the window, and Layer 3 (line 34) asks to derive the two local estimates from the global hypothesis. `Suggested.lean` states only the two-scale theorem, whose hypothesis is the local bound at one `x`; an implementer who proves all four statements has not been asked for the parameter check `d ≤ 10⁻¹³`, `2N/3 ≥ 10¹³` and `2.5571·log²(2.0001/d) ≤ 3L²`, which is where the threshold `9.6·10³⁷` comes from (at that `x`, `d = 9.9923·10⁻¹⁴`).

Every carrier exists in the file already. This statement elaborates on a copy, after the repair of R01:

```lean
theorem bounds_of_global_moment
    (h : ∀ Y d : ℝ, 10 ^ 13 ≤ Y → 0 < d → d ≤ 10⁻¹ ^ 13 →
      thetaMoment Y d ≤ 2.5571 * d * Y ^ 2 * (Real.log (2.0001 / d)) ^ 2)
    (x : ℝ) (hx : 96 * 10 ^ 36 ≤ x) :
    (14 / 3 : ℝ) * Real.sqrt x ≤ ((balancedProducts 384 x).card : ℝ) ∧
      (14 / 9 : ℝ) ≤ ∑ n ∈ balancedProducts 384 x, (n.minFac : ℝ) / n := by
  sorry
```

Add it (under whatever name), and name it in the README where Layer 3 states the global hypothesis.

## C01 — `mem_pairStarts` is the definition of `pairStarts` after three cross-multiplications, so as a target it asks an implementer for nothing

With `u, q, t > 0`, the three interval memberships of `pairStarts` are the four inequalities on the right after clearing denominators: one `simp` with the definition and `div_le_iff₀`, `div_lt_iff₀`, `le_div_iff₀` reduces the statement to reordering one conjunction. The content of Layer 2 lies in what follows the identity: the length bound `≤ d·b`, the bound on the integrated pair count, and injectivity of `(p,q) ↦ pq` on disjoint bands. If the membership statement is kept as a sanity check of the definition, say so in its docstring; a statement that would test an implementer is the length bound, for instance `volume (pairStarts x a b (1+d) p q) ≤ ENNReal.ofReal (d*b)` for `d > 0`, `b > 0`.

## C02 — The Selberg sieve the Summary places in Tau Ceti is in Mathlib, and it proves no bound for primes in intervals

The Summary says "The Selberg sieve in Tau Ceti gives upper bounds for primes in single intervals" (line 7). The pinned Tau Ceti has no Selberg sieve: its only occurrences of the name are references to the Eichler–Selberg trace formula. The pinned Mathlib has `Mathlib/NumberTheory/SelbergSieve.lean`, which sets up upper-bound sieves and the Λ² main term and states no estimate for primes in an interval. The comparison the sentence wants is with SieveMethodsAndPrimePatterns, Layer 1 (Brun and Selberg sieves); name that roadmap, or say "Mathlib's Selberg sieve set-up", and keep the point that an upper-bound sieve gives no lower bound.

## C03 — The source of the deduction, Henriksson's paper, is cited with no identifier, and no layer carries a locator

A reader cannot find the text that Layers 1–3 rest on. The References entry for Henriksson gives a title and "Theorem 1.1 and Section 2" but no arXiv number, DOI or address; the one link in that entry points to another author's Lean file, for a variant the entry itself says is not needed. The layer statements cite nothing at all. Give the paper's identifier in the References, and put the locators at the claims: the two-scale and global statements of Layer 3 (Theorem 1.1), the exceptional-set and reciprocal estimates of Layer 1 and the incidence bound of Layer 2 (their numbers in Section 2), and Chirre–Hagen, Theorem 3, at the global hypothesis on line 34.

## N01 — Mathematics is written with `$…$` and `$$…$$` throughout

House style is Unicode, with ASCII in code spans, and displays as code blocks: for example `J(Y,d) = ∫₁^Y (θ((1+d)v) − θ(v) − dv)² dv`.

## N02 — Form of `Suggested.lean`

Three `public import Mathlib.<submodule>` lines where the house form is the single `import Mathlib`; the module docstring does not say which headline theorems are stated and which are not; `exceptional_cost` and `mem_pairStarts` have no docstring.

## N03 — Names and wording that belong to another project or to the moment of writing

`Erdos462RH.theorem_1_1` and `Erdos462RH.composite_sum_384` (References, line 58) are in code font but are declarations of an external development, not of this roadmap or the pinned libraries; say so in prose or drop the code font. "in this proposal" (Scope) and "Lean 4.33.1 development" date the text.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Endpoint check, Layer 2 (seeded sample) | x=35, u=2, p=7, [3,8]; q=5 and q=11 | q=5: [3,8]∩[3.5,7)∩(7,14] = ∅. q=11: [3,8]∩[3.5,7)∩(35/11,70/11] = [7/2,70/11] | both as stated; no source locator, a computation | none |
| `exceptional_cost` (Layer 1.2) | d=0; a=b; general | On E: dv−Δθ > dv/2 ≥ da/2 ≥ 0, so (da/2)²·\|E\| ≤ ∫_E ≤ J. d=0: E=∅, 0 ≤ J. a=b: E=∅ | true; README and Lean hypotheses agree (1≤a≤b≤Y, d≥0) | none |
| `reciprocal_volume` (Layer 1.3) | v=N/2; band [N/2,2N/3] | \|d/dv (N²/v)\| = N²/v² ≤ 4 at v ≥ N/2; N²/(N/2)=2N, N²/(2N/3)=3N/2 | true; image of band is [3N/2,2N] | none |
| `pairStarts`, `mem_pairStarts` | u,q,t>0; signs of x,p free | p/u≤t ⇔ p≤ut; x/q<t ⇔ x/t<q; t≤ux/q ⇔ q≤ux/t | true; definitional up to cross-multiplication | C01; R01 for the `def` |
| Length ≤ d·b (Layer 2) | u=1+d, set nonempty | p/u ≤ t ≤ b gives p ≤ ub; p−p/u = pd/u ≤ db | true | none |
| Exceptional lengths (Layer 3) | bands a=3N/2,Y=2N and a=N/2,Y=2N/3 | 3d·4N²L²/(d²·9N²/16) = 64L²/(3d) = N/24; 3d·(4N²/9)L²/(d²N²/16) = N/24 | as stated | none |
| Good starts and pair count | band length N/2 | N/2 − N/24 − 4·N/24 = 7N/24; (3dN/4)(dN/4)/(log B₁·log B₂) with product 1924.5 ≤ 3L² = 5736.6 at x=9.6·10³⁷ | ≥ d²N²/(16L²) holds | none |
| Final count (14/3)N | per-pair contribution 2dN | (7N/24)·d²N²/(16L²)/(2dN) = 7dN²/(768L²) = 7·512N/768 = 14N/3 | as stated | none |
| Window and weight | d<1 | (1+d)² < 1+3d; 3dx = 1536L²N = 384√x·log²x (both 2.87780·10²⁵ at x=9.6·10³⁷); 1/p > 1/(3N), so weight ≥ 14/9 | as stated; open window matches `balancedProducts` | none |
| Global hypothesis ⇒ local (headline) | x = 9.6·10³⁷ | N=9.79796·10¹⁸, L=43.7287, d=9.99235·10⁻¹⁴ ≤ 10⁻¹³; 2N/3 ≥ 10¹³; 2.5571·log²(2.0001/d)=2398.7 ≤ 5736.6 | true; d decreases in x | R02: state it in Lean |
| `bounds_of_two_scales` | signature against Layer 3 | Y∈{2N,2N/3}, bound 3dY²L², d=512L²/N, x ≥ 96·10³⁶; conclusion on `balancedProducts 384 x` | README and Lean agree | none |
| Chirre–Hagen, Theorem 3 | read at arXiv v1 | J_θ(x,δ) ≤ 2.5571·δ·log²(2.0001/δ)·x², x ≥ 10¹³, δ∈(0,10⁻¹³], under RH; J_θ as in Conventions | README line 34 matches | none |
| Summary on Tao and Zhang §1.1 | read Zhang §1.1 | records Tao's comment of 28 September 2025: semiprimes with both factors √x·log^O(1) x | matches | none |

- Source locators checked against the text: 2 (ChirreHagen lines 34–41 and 672–677, from arXiv:2512.23534v1; Zhang lines 27–53, from arXiv:2608.24930v2).
- Library declarations opened at the pin: `Chebyshev.theta` (Mathlib/NumberTheory/Chebyshev.lean:77), `Chebyshev.theta_eq_sum_primesLE` (:101), `Chebyshev.theta_mono` (:177), `Nat.primesLE` (Mathlib/NumberTheory/PrimeCounting.lean:133), `MeasureTheory.lintegral_image_eq_lintegral_abs_deriv_mul` (Mathlib/MeasureTheory/Function/JacobianOneDim.lean:47); all exist as cited. No near-match in Mathlib or Tau Ceti for any of the eight declarations.
- Cross-roadmap citations: none as suppliers; ExplicitPrimeCounting (named as context) is on main.
- Dependency check: `depcheck: 170 roadmaps, 1969 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: fails at 38:4 (R01); with `noncomputable` added on a copy, `sorry` is the only warning. One-tactic probe on `mem_pairStarts`: one `simp` leaves only a reordered conjunction (C01). The other three theorems need integration or the full counting argument and were decided by reading.
- No `set_option`, no sorried data, no change outside the folder (README.md, Suggested.lean, metadata.toml).
- Overlap check: the three closest-roadmap lists are empty; read the scope of ExplicitPrimeCounting (§2.5, Layer 7), ProbabilisticAndMetricNumberTheory (Layer 5) and SieveMethodsAndPrimePatterns (Layer 1); nothing shared: none states the relative Selberg integral, its exceptional set or a count of semiprimes in a window.
- Source independence: 6 passages compared with 2 sources (ChirreHagen, Zhang), none shared beyond the formula of Theorem 3; largest share Henriksson, 2 of 6 locators, text not readable, so wording and contents were not compared with it; contents compared with ChirreHagen (§§1–5): independent.
- Research link: Layer 3 takes as hypothesis the explicit RH bound for Selberg's integral of Chirre–Hagen (arXiv 2025, Theorem 3), proved there for Goldbach numbers in short intervals, and applies it to the composite reading (Tao 2025, Zhang 2026 §1.1) of a question of Erdős–Graham (1980). Rests on the README and on both texts read.

## Not verifiable

- Erdős–Graham, p. 92 (that the printed sum runs over all integers): the linked copy is on a host the sources service does not class as legal; not read. Zhang §1.1 prints the question with the sum over composites.
- Tao's comment: the discussion site is not a classed host; its date and content are confirmed only through Zhang lines 47–51.
- Henriksson, Theorem 1.1 and Section 2, and the Scope sentence about its companion result: no identifier in the README, no legal copy found.
- Chirre–Hagen: the published version's numbering was not compared; Theorem 3 was read in arXiv:2512.23534v1.

## Source issues

- none

## For the human reviewers

- **Scope.** The deduction (Layers 1–3) has one source, Henriksson's preprint, cited without identifier (README line 58); the description says an AI model is the principal contributor to its proof. No refereed source states the headline.
- **Licence.** README line 58 says an accompanying Lean development (`Erdos462RH`) proves the result and that a variant adapts S. Hubbard's LeanLab code; I could not locate the development or its licence to compare with `Suggested.lean`.
- **Not tested.** Henriksson has the largest share of locators (2 of 6) and its text could not be read: wording and arrangement were not compared with it.
- **Licence.** The Erdős–Graham link (References, line 54) is a copy on a university page that the sources service could not class as an author's page.
