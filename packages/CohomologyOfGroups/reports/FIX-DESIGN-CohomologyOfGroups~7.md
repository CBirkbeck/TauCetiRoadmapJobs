# Repair report: FIX-DESIGN-CohomologyOfGroups~7

Files changed:

- `packages/CohomologyOfGroups/design/README.md`
- `packages/CohomologyOfGroups/design/plan.json`

`packages/CohomologyOfGroups/sources.toml` is unchanged: no new work is cited.

One review (`REV-DESIGN-CohomologyOfGroups~6`), two findings: one P2, one P3. Each was checked
before any edit:

- F01 against AlgebraicTopology on main and at the head of open revision #1808, which the roadmap
  tool printed.
- F02 by direct computation.

The design stage has no `Suggested.lean`. No Lean declaration was added, changed or elaborated,
so the `#check @name` binder audit had nothing to run on. The review's "For the human reviewers"
and "Source issues" sections raise no finding and changed nothing. No text read in this job
contained instructions.

## F01 (P2) — applied

Removed the AlgebraicTopology §8.15 attribution in four places:

- **Scope paragraph.** It now cites only §§4.1–4.3, §5.3 and §5.4, and "3.3 is the input of §5.3".
  The exclusion of `G`-CW complexes and of the topological forms of 8.3 is kept.
- **Supplier contract.** The §8.15 line is deleted.
- **plan.json.** The AlgebraicTopology supplier entry loses §8.15 and its sphere-action clause.
- **8.5 Check.** The clause "consistent with AlgebraicTopology §8.15" is dropped. The algebraic
  argument `dim Hⁿ(C_p × C_p, 𝔽_p) = n + 1` is kept.

Evidence:

- **Main defines §8.15.** `TauCetiRoadmap/AlgebraicTopology/README.md` on main has the heading
  "8.15 Finite-group acceptance applications" at line 4458.
- **#1808 has nothing in its place.** At the head of #1808, Stage 8 ends at item 12, the native
  circle comparison. No §8.15 exists there, and nothing about `C_p × C_p` acting on spheres does
  either. Its "Renamed targets" list maps nothing to §8.15.
- **The other cited ids survive in #1808.**
  - Stage 4 items 1–3 are cellular chain groups, differentials and comparison (§§4.1–4.3).
  - Stage 5 item 3 is finite covers, transfer and the Cartan–Leray package (§5.3).
  - Stage 5 item 4 is torus homology (§5.4).

  So only §8.15 breaks, and no other citation needs a change.
- **No other owner exists to cite.** A search of all open heads and of main for
  `C_p × C_p` / sphere-action statements finds only AlgebraicTopology itself: main, and open
  revision #1807, which keeps §8.15.
- **The citation was only illustrative.** It supported a Check comparison, not a proof input, so
  no replacement supplier and no dependency on #1808 are needed.

Pattern search: `8.15`, `sphere` and `C_p × C_p` across README and plan. The other two
`C_p × C_p` occurrences (8.3's third Check, plan test of 8.3) cite only 5.3, and stay.

## F02 (P3) — applied

Old 6.8 Check: "`G = ℤ/n` with `F = ℤ`, `R = nℤ` … would give `nℤ ≅ ℤ`".

New: "For `n ≥ 1`, … would give `nℤ ≅ ℤ`. At `n = 0`, `G = ℤ` and `R = 0`, and both give `0`:
this boundary case does not separate the two models."

The plan test `hopf_cyclic` was changed the same way. The Hopf theorem itself is not restricted.

Pattern repair: the same implicit nonzero modulus sits in a Check of 3.3 (README §3.3; plan test
of 3.3): "`G = ℤ/m` and the free resolution `⋯ →N ℤG →(t−1) ℤG → ℤ`". At `m = 0` the norm `N`
does not exist in `ℤ[ℤ]`. Also, `H₃(ℤ, ℤ) = 0`, not the `ℤ/0 = ℤ` that the formula would give.
Both places now say `m ≥ 1`, matching the source's hypothesis `n ∈ ℕ_{>0}` (Loh19 line 2205).

Other occurrences, left unchanged:

- `H₂(ℤ/n, ℤ) = Λ²(ℤ/n) = 0` (5.4 Check) holds for every `n`, including `n = 0`.
- The 8.3 and 8.4 Checks on `ℤ/m` sit under Layer 8's standing hypothesis "`G` is finite", which
  forces `m ≥ 1`.

## Checks run

Dependency check (command of the brief), after the edits:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2173 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Other checks:

- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean
  name found nowhere.
- **plan.json** parses as JSON.
- **Diff scan:** no LaTeX delimiters and no machine paths.
- **Gate failures:** the brief lists none.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Scope: "3.3 is the group-cohomological input of §5.3" | `G = ℤ/2` deck group of the double cover `S¹ → S¹`; `M = ℤ` trivial and `ℤ_sgn` | Trivial `M`: coinvariant differential `0`, giving `(H₀, H₁) = (ℤ, ℤ)` = `H_*(B; ℤ)`. Sign module: `H₀ = ℤ/2`, `H₁ = 0`, which is not constant coefficients on `B`, as the §5.3 contract says. | Consistent with the 3.3 Checks. |
| Scope: topological forms of 8.3 | `C₂` antipodal on `S¹` (`n = 1`, `χ` trivial) and on `S²` (`n = 2`, `χ = sgn`) | `S¹`: period divides `n + 1 = 2`, and `C₂` has period 2. `S²`: `Ĥ⁰(C₂, ℤ) = ℤ/2` and `Ĥ³(C₂, ℤ_sgn) ≅ Ĥ²(C₂, ℤ) = ℤ/2`, via the sign sequence. The period divides `2(n + 1) = 6` and is 2. | 8.3's twisted shift is consistent; no change. |
| AlgebraicTopology contract §5.3, §5.4 | Main, and the head of #1808 | Main: §5.3 at line 1945, §5.4 at line 2005. #1808: Stage 5 item 3 (cover, transfer, Cartan–Leray), item 4 (torus exterior algebra). | Both ids resolve at both copies. |
| 8.5 Check: `C_p × C_p` not periodic | `p = 2, 3`; `n = 0, 1, 2` | Künneth over `𝔽_p` gives `Σ_{i+j=n} 1 = n + 1`, so dimensions are 1, 2, 3 for `n = 0, 1, 2`. A period `d` would bound `dim Ĥⁿ(−, 𝔽_p)` for `n ≥ 1` by its maximum over `1 ≤ n ≤ d`. | Argument stands without the topological comparison. |
| 6.8 Check, `n ≥ 1` | `n = 1, 2, 3` | Correct model gives `H₂ = 0` throughout. Wrong model `nℤ` gives `ℤ`, `2ℤ ≅ ℤ`, `3ℤ ≅ ℤ`. `F = ℤ` is abelian, so `[F, F] = [F, R] = 0`. | Distinguishes the models. |
| 6.8 Check, `n = 0` | `G = ℤ`, `F = ℤ`, `R = 0` | `H₂(ℤ, ℤ) = 0`, since `ℤ` is free of cohomological dimension 1. `R/[F, R] = 0`. | Pair `(0, 0)`: stated as non-separating. Theorem holds at `n = 0`. |
| 3.3 Check, `m ≥ 1` | `m = 1, 2`; `m = 0` excluded | Coinvariant complex `ℤ ←0 ℤ ←m ℤ ←0 ℤ ←m ⋯`. `m = 1`: `H_odd = ℤ/1 = 0` and `H₂ = ker(×1) = 0`. `m = 2`: `H₁ = H₃ = ℤ/2` and `H₂ = 0`. `m = 0`: `N = Σ_{g∈ℤ} g ∉ ℤ[ℤ]`; true values `H₁(ℤ) = ℤ`, `H₃(ℤ) = 0`, not `ℤ`. | Hypothesis `m ≥ 1` added (Loh19 line 2205). |
| 5.4 Check `H₂(ℤ/n, ℤ) = Λ²(ℤ/n) = 0` | `n = 0, 1, 2` | `n = 0`: `H₂(ℤ) = 0 = Λ²ℤ`. `n = 1`: `0 = 0`. `n = 2`: `0 = Λ²(ℤ/2) = 0`. | True for all `n`; no change. |
| 8.3 and 8.4 Checks on `ℤ/m` | `m = 1`; `m = p = 2` | Layer 8 assumes `G` finite, so `m ≥ 1`. `m = 1`: every `Ĥ = 0`, so "period divides 2" holds. `m = 2`: `Ĥ²(C₂, ℤ) = ℤ/2` has order `|G|₂`, while `Ĥ¹ = 0`, so the 2-period is 2. | No change. |

## For the maintainer

- No name that other roadmaps cite changed.
- This roadmap no longer cites AlgebraicTopology §8.15. Its AlgebraicTopology contract is §§4.1–4.3
  (scope), §5.3 and §5.4, and all of these survive in open revision #1808.
- Ownership against open pull requests was checked with the roadmap tools, which cover the open
  heads, for the one object this round touches: free `C_p × C_p` actions on spheres. Only
  AlgebraicTopology (main, #1807) states it.
