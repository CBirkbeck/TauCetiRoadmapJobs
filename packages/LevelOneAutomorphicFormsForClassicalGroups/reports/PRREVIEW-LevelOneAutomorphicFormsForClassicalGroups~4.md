# Review of LevelOneAutomorphicFormsForClassicalGroups (pull request #2285 at bd09c51)

**Verdict:** accepted

Incremental re-review of the 149 lines changed since `7466633`. No finding.

## Previous findings

- R01 — repaired: §5.1 now fixes `w`, `δ`, `m`, `ℓ₀` and "a real `c ≥ A_{F_{ℓ₀}}/m`", takes `S′ ⊂ S`, `R ⊂ C`, and concludes `U ∈ R` for `m` distinct classes outside `S`; the negative-control Check is added.
- R02 — repaired: §2.11, third Check: "for `β = diag(1, −1)`, omitting `I = {2}` leaves only `I = {1}` … and gives `1` instead of `−1`."
- R03 — repaired: §2.17, fourth Check: "the root term `−(B_F/4)(1 − ε(U²))` vanishes, because `ε(U²) = 1` for every `U` of determinant one".
- R04 — repaired: §2.8: "If the Gram matrix of `B∞^F` on finitely many of the basis elements `1`, `e`, `I_w` is positive definite … the effective elements of the subgroup they span that satisfy the bound form a finite set."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §5.1 covers (R01) | `w = 0`, `D = {1}`, `S = ∅`, `m = 1`, `c < J(1)`; `ℓ₀ = 7/5` | `C = R = ∅` now barred: `J_F(1) = 0.9662 ≤ A_F = 1.1348 ≤ c`, so `1 ∈ C`; chain §2.8 → `U ∈ C` → §2.17 closes | holds | none |
| §2.6 constant `κ` | `e`, `I_w`, `I₀`; `(1, Δ₁₁)`; `(1, 1)`; supplier §1.8 (iv) | `Γ_ℝ(s+1) = π^{−1/2}·π^{−s/2}Γ(s/2+1/2)`; `Γ_ℂ(s+w/2) = 2(2π)^{−w/2}(2π)^{−s}Γ(s+w/2)`; `2(2π)^{−11/2} = 8.148·10⁻⁵`; `κ = 1`; supplier shape `A^s ∏Γ(a_i s+b_i)` has no constant | holds | none |
| §2.6 formula, normalization | `π = π′ = 1`, `ℓ = 7/5` | prime side `0.1508 + 0.0174 + ≈0 = 0.168`; `A − J(1) = 0.1686`; zero term `≈ 0.0004 ≥ 0` | holds | none |
| §2.8 finiteness clause (R04) | Gram matrix `G` on a finite basis, `x ≥ 0` integral | `xᵀGx ≤ A_F` with `G` positive definite bounds `|x|`; a subgroup is no longer called effective | holds | none |
| §2.9 diagonal bullet | `δ_i = 0`; `δ_i = 1`, `U = a·1 + b·e + Σc_w I_w` | `ε(U²) = (−1)^{ab + (a+b+1)N}`, `N = Σc_w(w+1)`; `det U = e^{b+N}`; `b ≡ N` gives exponent `2ab + 2b ≡ 0` | holds | none |
| §2.11 Check 3 (R02) | `β = diag(1, −1)` | `{1}`: `1`; `{2}`: `−1`; `{1,2}`: least eigenvector `(0, 1)`, not eligible; without `{2}`: `1` | holds | none |
| §2.16 enclosures | ComputationalNumberTheory §4.18 at its head | rational `ℓ > 0`, `w ∈ ℕ`, width at most `2^(−P)` for every `P`, exact scalar contained | cited as stated | none |
| §2.17 Check 4 (R03) | `U = I_w`, `w` odd and even | `ε(I_{2w} + 1 + e) = i^{2w+2} = (−1)^{w+1}`: `1` for `w` odd (`det = 1`), `−1` for `w` even (`det = e`) | holds | none |
| §1.3 `SO_{4n+2}`, `n ≥ 1` | `SO(1,1)`, `SO(3,3)`; AutomorphicFormsOnReductiveGroups §2.4 | `SO(1,1) ≃ ℝ^×`: rank criterion `1 − 1 = 0`, exception; `SO(3,3)`: absolute rank `3`, compact rank `2` | holds | none |
| §3.6 `(R_k)` on effective `U` | `1 + e + I₂`, `3·1`, `2I₁` | weights `±1, 0, 0`, holds for `k ≥ 2`; `1` thrice; `±1/2` twice | holds; `r(π) = r(L(π∞))` | none |
| §6.11 at `ℓ = 7/5` | ten classes; cross-check at `ℓ = log 4` against CL14 lines 12335–12338 | `b + √(ac)` at `7/5`: `−1.079, −0.648, −0.492, −0.355, −0.234, −0.797, −0.873, −0.362, −0.058, −0.829`; at `log 4`: `−1.070, −0.641, …, −0.050, −0.820`, the source's values | holds; `a, c ≥ 0`, `b < 0`, `b² > ac` in all ten | none |
| §8.6 `κ_h` and locators | `h = 0, 8, 12, 16`; CT19a lines 496–500, 726–727, 900–901, 985–990 | kernel orders `1, 1, 3, 10`; `n₂₄ = |O|`, `n₁₆ = |O|`, `n₁₂ = |O|/3`, `n₈ = |O|/10`; Lemma 2.4 on p. 12, Proposition 3.13 on p. 24 | holds | none |
| §§6.1, 6.4, 6.5, 6.10 supplier lines | AutomorphicBundles §12.13; MetaplecticAutomorphicForms §§0.15, 2.4c, 3.4, 3.5, 3.7, 5.6 at their heads | non-neat Hecke descent; Schrödinger model; genuine Weil representation; big and small theta; Howe duality incl. dyadic; global lift for anisotropic `H` | cited for what they state | none |

The rows for untouched statements stand as in the previous review, of `7466633`.

- Seeded sample within the changed passages: §§1.1, 2.6, 2.17, 3.4, 5.1, 6.10 checked (rows above; §1.1 *Needs* AutomorphicFormsOnReductiveGroups §§3.2, 3.4 and §3.4 *Needs* its §2.4 exist at its head and state what is used).
- Source locators checked against the cached texts: CT19a 5 (lines 114–115, 496, 726, 900, 989), CL14 2 (lines 12315, 12336), CT20 2 (lines 705, 1787–1790).
- Cross-roadmap citations resolved at main or at the open heads: 14 section ids in 5 roadmaps (AnalyticNumberTheoryPartI §1.8; ComputationalNumberTheory §§4.17, 4.17a, 4.18; AutomorphicFormsOnReductiveGroups §§2.4, 3.2, 3.4; AutomorphicBundles §12.13; MetaplecticAutomorphicForms §§0.15, 2.4c, 3.4, 3.5, 3.7, 5.6), none missing. No citation of ComputationalNumberTheory §§4.1–4.7 remains in the README.
- Gate at bd09c51: every check passed, build included. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line; no change outside the folder.
- Elaboration of `Suggested.lean`: `sorry` the only warning (four theorems). The one change in the file is the Layer 4 section comment, now equal to the README heading; no statement changed.
- The pull request's title and description agree with this head: a new roadmap, nine gaps, four theorems, no supplier roadmap added or dropped, no section removed or renumbered.
- Overlap check: read SiegelModularForms, OrthogonalTamagawaAndLatticeMass, ModularityAndLanglandsExtensions, AutomorphicLFunctionsAndLocalFactorsPartII, LatticePackingsAndPerfectForms, Rank24LatticeConstructions, ThetaSeries, AlgebraicCodingTheory in the previous review; the change adds no object and moves no ownership; shared objects and owners as there (level-one Siegel operator, all-genus theta maps and singular-range statements: this roadmap; regular packet character: ModularityAndLanglandsExtensions §3.21).
- Source independence: changed passages only; 6 passages compared with 3 sources (CT20, CT19a, CL14), none shared beyond formulas and lists of hypotheses; largest share CT20, as in the previous review; the diff adds, removes and reorders no layer, so the contents were not compared again.
- Remark: the cached CL14 is the arXiv version, whose Proposition 3.38 is on its page 328 (CL14 line 12315); §6.11 cites pp. 322–323.

## Not verifiable

- KT87 (uncertified), Böcherer 1989 Theorem 5, and the works cited through CT20, CL14 and the suppliers: as in the previous review; no changed passage depends on them.
- §6.11 at `ℓ = 7/5`: recomputed here in floating point (margin at least `0.05`), not with the rational enclosures of ComputationalNumberTheory §4.18.

## Source issues

- none

## For the human reviewers

- **Declared gaps.** `gap:scalar-lowest-weight-packet-character` (README line 344) has no entry in the `gaps` list of `packages/LevelOneAutomorphicFormsForClassicalGroups/design/plan.json`, which has eight slugs; the intake reads that list to announce gaps.
- **Scope.** The headline theorems are computer-assisted in the source: about 12,000 interval-arithmetic exclusions, full column rank of a 3477 × 2948 matrix, orbital integrals for `Sp₁₆` (CT20 §§3.3, 4.1); their data are on the authors' web page.
- **Licence.** BoechererNote is an unpublished note on an author's page; it is the only source of §8.7's table of orders, which the previous review recomputed factor by factor.
- **Licence.** The tables of §§6.9, 7.8 and 7.9 state the content of CL14 Table C.5 and CT20 Tables 5–6 in the README's own columns; the 58 regular rows were re-derived by enumeration in the previous review.
- **Source deviation.** §6.11 replaces the source's `ℓ = log 4` (CL14 line 12336) by the rational `ℓ = 7/5`, so the ten negativity checks are not the source's; this review recomputed them (table above).
