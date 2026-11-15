# Repair report: ComplexHessianEquations design, round 12

One review with one finding (P3), checked against lewis1996 and repaired. Files changed: `packages/ComplexHessianEquations/design/README.md` (§1.2) and `packages/ComplexHessianEquations/design/plan.json` (target 1.2, `locator.where`). `packages/ComplexHessianEquations/sources.toml` is unchanged: its lewis1996 entry cites Theorem 2.1 and does not mention the lines that moved.

## F01 (P3) — applied

Verified. lewis1996 line 145–148 does two things: it defines the function that sums the `m` largest eigenvalues of a Hermitian matrix, and it records Fan's theorem (1949) that this function is convex. It says nothing about a maximum over projections or an equality case. The variational formula in the README is the pinned Tau Ceti `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` (`TauCeti/Analysis/InnerProductSpace/KyFan.lean:489`): for an orthonormal family of `k` vectors, the sum of `Re ⟪T wᵢ, wᵢ⟫` is at most the sum of the `k` largest eigenvalues. Equality at `P_T` is a one-line computation.

Change (README §1.2):
- Line 137: "with equality at `P = P_T` (lewis1996 line 145–148)." → "with equality at `P = P_T`."
- Line 139: "`κ_m` is convex and" → "`κ_m` is convex (Fan's theorem, recorded at lewis1996 line 145–148) and".
- Plan 1.2 `locator.where` → "line 145–148 (the sum of the m largest eigenvalues and Fan's convexity theorem) and Theorem 2.1, line 154–159 (differentiability at a diagonal matrix under the gap); …".

The locator now sits next to "convex" only. The lines do not state subadditivity; the README derives it from convexity and positive homogeneity.

Pattern repair, in the same sentence block. The citation "(lewis1996 Theorem 2.1, line 150–158)" ended a sentence that claims two things: uniqueness of the maximizer, then differentiability. It had two problems:
- **Wrong range.** Lines 150–153 are the copyright line, the page marker, the page number and the running head. The theorem itself runs from line 154 (the hypothesis, garbled by OCR) to line 159 ("vacuous for `m = n`").
- **Claims too much.** Theorem 2.1 states only differentiability at `Diag μ`, with gradient the projection onto the first `m` coordinates. It does not state uniqueness, which the README's own route proves.

So the citation now reads "(lewis1996 Theorem 2.1, line 154–159, states the differentiability at diagonal `T`; the uniqueness is the first step of the route below)". Plan 1.2 gets the same range.

The other lewis1996 locators were re-read against their claims and are correct; none changed:
- §1.3: Theorem 1.1 at line 77–81, line 144 (the real symmetric case), line 468–469 (the `C¹` equivalence).
- §1.3 route: Lemma 2.2 at line 165–166, Lemma 2.3 at line 185–187, Theorem 2.4 at line 199–217.

No other citation of line 145–148 or 150–158 exists in the README or the plan.

## Adversarial pass on the changed text

Only locators changed. The statements they are attached to were recomputed:

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| `κ_m` convex (now cited to line 145–148) | `m = 1`, `diag(1,0)`, `diag(0,1)`, midpoint | `κ_1(diag(1/2,1/2)) = 1/2 ≤ (κ_1(diag(1,0)) + κ_1(diag(0,1)))/2 = 1` | Holds; locator matches the line's content |
| Equality at `P_T` (locator removed) | `T = diag(3,1,1)`, `m = 1`, `2` | `Re tr(P_T T) = 3 = κ_1`; `m = 2`, `P = diag(1,1,0)`: `4 = κ_2` | Holds; direct computation, needs no locator |
| Uniqueness under the gap (now said to be the route's) | `T = diag(3,1)`, `m = 1`, `P` = projection onto `(cos θ, sin θ)`; `T = Id_2` | `Re tr(PT) = 3cos²θ + sin²θ = 3` iff `sin θ = 0`; for `Id_2` every `P` gives `1`, so there is no uniqueness without the gap | Holds; not in Theorem 2.1, so attributed to the route |
| Differentiability (Theorem 2.1, line 154–159) | `T = diag(3,1,1)`, `m = 1` and `m = 2` | `m = 1`: gradient `diag(1,0,0)`; `m = 2`: `κ_2(T + t·diag(0,1,−1)) = 4 + |t|`, not differentiable | Holds; the source states it at `Diag μ`, and the general `T` follows from `κ_m(U*XU) = κ_m(X)` |

## Checks run

Dependency check, run after the final edit (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

- `plan.json` parses after the edit. Its targets, ids, tests and its one gap (`weak-harnack-supersolutions`) are unchanged.
- The README has no new backticked name, no LaTeX delimiter, and no process wording.
- No `Suggested.lean` exists at the design stage, so there was no `#check` comparison to run.

## Ownership and suppliers

No supplier, target or declaration name changed, so no ownership question arises in this round. No source was fetched; nothing was added to `needs-references.toml`.

## Notes for the maintainer

- No name that other roadmaps cite changed.
- The review's "For the human reviewers" section (licence of demailly2012, lewis1996 and spruck2005; scope) was not acted on, as instructed.
- No suspicious text was found in the review or the sources read.
