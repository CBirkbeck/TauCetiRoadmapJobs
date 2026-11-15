# Review of PerfectoidQuotientsPartII (pull request #2259 at c2b521a)

**Verdict:** accepted

No finding. Incremental re-review of the 10 lines changed since `2aa6d55` (the proof route of Q8.3 in `TauCetiRoadmap/PerfectoidQuotientsPartII/README.md`, l. 1251–1256), and of the pull request's title and description against this head.

## Previous findings

- The review of `2aa6d55` had no finding; nothing to carry.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Q8.3 `exists_approximation`, reduction to `ρ` (l. 1251–1253) | `A = 𝒪_C`, `ϖ = p^{1/p²}`, `ρ = p^{1/p}`, `m = 1`; perfect `𝔽_p`-algebra, `ϖ = 0` | `v(ρ)^p = p^{−1} ≤ p^{−1/p} = v(ϖ)^p`; bound `p^{−1}·max(v(a'♯), p^{−1}) ≤ p^{−1}·max(v(a'♯), p^{−1/p})`; `ρ = 0`, both bounds `0` | bound for `ρ` implies bound for `ϖ` | none |
| Q8.3, "every valuation allowed for `ϖ` is also allowed for `ρ`" | `v` continuous for `ϖ`; trivial value group | `v(ρ)^{pn} = v(p)ⁿ ≤ v(ϖ)^{pn} → 0`; continuity forces `v(ϖ) = 0`, then `v(p) = v(ρ) = 0` | holds | none |
| Q8.3, last clause from the bound (l. 1254) | `v(a'♯) ≤ v(ϖ)^{pm}`; `v(a) ≤ v(ϖ)^{pm} < v(a'♯)` | `v(a) ≤ max(v(a'♯), v(a − a'♯)) ≤ v(ϖ)^{pm}`; `v(a − a'♯) ≤ v(p)v(a'♯) < v(a'♯)` gives `v(a) = v(a'♯)`, contradiction | iff in both directions | none |
| Q8.3, choice of `z_0`, `ξ` (l. 1255–1257) | conventions l. 139; `θ` of the recursion | `ξ` generates `ker θ` by convention; `[z̄_n] − [ξ̄]u^{−1}w = z_n − ξu^{−1}w` for `ξ = [ξ̄] + pu`, `z_n = [z̄_n] + pw`, so `θ(z_{n+1}) = a` | lifts preserved | none |

The rows of the previous review, of `2aa6d55`, stand for every statement the diff does not touch.

- Source locators checked against the text: 1 (CS24 Lemma 2.3.1 with (2.3.1.1)–(2.3.1.2) at CS24 lines 895–900, p. 22; proof at lines 904–945, p. 23; the reference to Sch12 Corollary 6.7 (i) at CS24 line 894). The seeded sample falls in the changed passage only at this theorem.
- Changed wording against CS24 lines 907–911: the two sentences of the reduction and the choice of `ξ`, `z_0` share no run of more than four words with the source; the earlier clause-by-clause parallel is gone.
- Cross-references of the changed passage resolved: Q5.3 (l. 507), Q8.2 (tilted valuation), conventions on `ξ` (l. 139–140); the `*Needs:*` line of Q8.3 is unchanged and still covers the route.
- No Lean statement changed; `Suggested.lean` is byte-identical to `2aa6d55`. Elaboration at this head: `sorry` the only warning.
- Gate at this head: every check passed. Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Pull request text against this head: title and description read sentence by sentence; none contradicted. It adds the roadmap (not on main; 61 headings, 19 declarations, none removed); the suppliers it names as open (PerfectoidQuotients, PrismaticCohomology, DerivedDeRhamCohomology, DeformationAndDerivedPatchingAlgebra) are the README's suppliers not on main, PerfectoidSpaces and StableReduction being on main; the consumers named in the summary block are those of the README's "Downstream consumers".
- Remark (untouched citation): the element `ρ` is cited to Q5.3, while its existence is the convention of l. 138 (PerfectoidSpaces P1.24).

Overlap check: read PerfectoidQuotients, DirectSummandsAndBigCohenMacaulay, PerfectoidSpacesPartII, PrismaticCohomology, PurityForFlatCohomology, PerfectoidSpaces; the overlap list reports no shared, dropped or revision-only id; perfectoid covers of regular local rings remain two statements with two owners (DirectSummandsAndBigCohenMacaulay §§3.2–3.3; Q10.2 here), as the scope section says; nothing else shared.

Source independence: changed passages only; 3 passages compared with 1 source (CS24), none shared; largest share CS24, 60 of about 125 locators; contents not compared again (the diff adds, removes or reorders no layer; independent as of `2aa6d55`).

## Not verifiable

- Stacks Lemma 15.32.2 as the number of tag 0BIQ (carried from the previous review): the cached Stacks text is the Commutative Algebra chapter only.

## Source issues

- none

## For the human reviewers

- Licence: `Wedhorn` is cited from an arXiv text (1910.05934v1) with no journal reference, and `HM17` from arXiv 1708.05761v3 with no journal named in the README.
