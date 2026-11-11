# Review of SpecialFunctionsGeneralizedHypergeometric (pull request #2136 at a7ab0ad)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: README 4.5 now defines `(x)₋ₘ = (−1)ᵐ/(1 − x)ₘ` for `m ≥ 1`, keeps the Gamma quotient only off the poles, and adds the Check at `(a, b, c, d) = (0, ½, 2, ½)` with both sides `0`.

## Verified sound

| Statement | Instances tried | Left side / computed data | Right side / comparison | Result; change |
|---|---|---|---|---|
| 4.5, negative-index Pochhammer | `x=.3, m=1,3`; `x=0, m=1` | `(−1)ᵐ/(1−x)ₘ`: `−1.428571428571; −0.252837977296; −1` | `Γ(x−m)/Γ(x)`: same first two; pinned `Γ(−1)/Γ(0)=0/0=0` | Agrees off poles; differs at `x=0` as the README says |
| 4.5, term of index `−m` | `p=q=2`, `(a,b,c,d)=(−1,.3,1.5,1.2)`, `m=1,3` | From the definition: `0.071428571429; 0.001400560224` | `(1−c)ₘ(1−d)ₘ/((1−a)ₘ(1−b)ₘ)`: same values | Agrees; sign `(−1)^{m(p−q)}=1` |
| 4.5, bottom parameter in `{1,2,…}` | `c=2`: `(1−c)ₘ`, `m=1,2,3`; `c=3`, `m=2,3` | `−1; 0; 0`; `2; 0` | Terms vanish for `m ≥ c` | Agrees |
| 4.5, new Check `(0,½,2,½)` | `Re(c+d−a−b)=2`; `c,d,1−a,1−b = 2,½,1,½` | Index `0`: `1`; index `−1`: `(−1)₁(½)₁/((1)₁(½)₁)=−1`; others `0`; sum `0` | `Γ(d−b)⁻¹=Γ(0)⁻¹=0`, product `0` | Agrees; with the Gamma quotient the index `−1` term is `0`, sum `1` |
| 4.5, 16.4.17 at an excluded top parameter | `(a,b,c,d)=(−1,.3,1.5,1.2)` | `0.833333333333 + 0.079627547951 = 0.912960881284` | `0.912960881284` | Agrees to 29 digits; continuity route consistent |
| 4.5, 16.4.17 at an integer bottom parameter | `(a,b,c,d)=(.3,.6,3,1.4)` | `1.059129469730 + 2.136854741897 = 3.195984211626` (negative tail has two terms) | `3.195984211626` | Agrees to 29 digits |
| 4.5, route through SpecialFunctionsHypergeometric 4.2 | 15.4.25 needs `a, b ∉ ℤ`; 16.4.17 allows `a, b ∈ {0,−1,…}` | Gap: `a` or `b` a nonpositive integer | Covered by “at the excluded parameters by continuity of both sides” | Route owned |

Rows for untouched statements stand as in the previous review, of `e3df809`.

- 2 source locators read against the text: DLMF-16.4 lines 851 (16.4.16) and 881–883 (16.4.17 and its condition).
- 1 cross-roadmap citation resolved on main: SpecialFunctionsHypergeometric 4.2, 15.4.25 (`README.md:641–644`, hypotheses `Re(c + d − a − b) > 1`, `a, b ∉ ℤ`).
- The diff changes no Lean statement; `Suggested.lean` is identical to `e3df809` and declares nothing of 4.5. Direct elaboration passes: 58 warnings, all `declaration uses sorry`.
- Worker gate on this head: every check passes, including the targeted build. A rerun without the merge order reports only `depcheck: NOT IN ORDER: SpecialFunctionsGeneralizedHypergeometric (insert it after its last supplier)`, which the placement rule exempts.
- Dependency check with the merge order: `depcheck: 236 roadmaps, 2139 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- 0 files changed outside the folder; 0 overlaps reported.
- Pull request title and description read against this head: new roadmap, 58 headlines, three suppliers on main, and “the one of the third” review all agree with it.
- Remark: at a top parameter in `{1, 2, …}` the terms with `m` at or past it divide by zero; 16.4.17 excludes that case by requiring `1 − a`, `1 − b` off the poles of `Γ`.

## Not verifiable

- None among the changed passages.

## Source issues

- none
