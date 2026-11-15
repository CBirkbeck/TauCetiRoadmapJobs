# Repair report: HochschildHomologyAndHKR, design round 12

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~11`. It has one finding, F01 (P3). It is
right and is applied. The same element of the extension is also written in plan target 3.5. That
Check had no slip, but it now gives the same witness as the README.

Files edited:

- `packages/HochschildHomologyAndHKR/design/README.md` (§3.5 Checks, one bullet)
- `packages/HochschildHomologyAndHKR/design/plan.json` (target 3.5, test `twisted_dual_numbers`)

`sources.toml` is unchanged. The repair cites no new work, and no `needs-references.toml` was
written. There is no `Suggested.lean` at the design stage. Nothing was elaborated, and there was no
`#check` binder audit to run.

## REV-DESIGN-HochschildHomologyAndHKR~11/F01 (P3) — applied

**Verified.** In the §3.5 Check, `A = k[x]/(x²)`, `M = k`, `f(x,x) = 1`, and `t = (x,0)` is an
element of `A ⊕_f M`. A section `s` of the projection has `p(s(x)) = x`, so `s(x) = (x,c)` with
`c ∈ k`. Then `(x,c) = (x,0) + c·(0,1) = t + c t²`. The text said "`x + c t²`", but `x` is an
element of `A`, not of the extension. The other two places that use this section already write
`t + c t²`: README §3.6 Checks (third case) and plan target 3.6.

**Change (old → new).** Old: "An algebra section would send `x` to some `x + c t²` with square
`t² ≠ 0`". New: "An algebra section would send `x` to some `(x,c) = t + c t²` with `c ∈ k`, whose
square is `t² ≠ 0` although `x² = 0`". The Check's conclusion is unchanged. The plan test
`twisted_dual_numbers` gains the same witness in parentheses.

**Same pattern elsewhere.** I searched the README and `plan.json` for `x + c`, `c t²`, `ct²`,
"section would" and "section sends", and for every product written on `A ⊕_f M`:

- the third case of §3.6 Checks;
- the `twisted_nonassociative` Check, `((x,0)(x,0))(x,0)`;
- the `twisted_unit` Check, `(1,0)(x,0)`;
- the commutator Check on `k[x,y]` in §3.6, `(x,0)(y,0)`;
- the Worked example "A non-split extension".

Each one writes elements of the extension as pairs or in `t`. No other slip was found.

## Adversarial pass on the changed statement

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §3.5 Check: no section of `k[x]/(x²) ⊕_f k`, `f(x,x) = 1` | `k` nonzero (`ℚ`, `𝔽₂`) | `t² = (x², x·0 + 0·x + f(x,x)) = (0,1)`; `t³ = (x,0)(0,1) = (0, x·1 + 0 + f(x,0)) = (0,0)`; `s(x) = (x,c) = t + c t²`; `s(x)² = t² + 2c t³ + c² t⁴ = t² = (0,1) ≠ 0`; but `s(x)² = s(x²) = s(0) = 0` | no section, for every `c`. Over `𝔽₂` the cross term `2c t³` is already `0` | notation fixed |
| same | `k = 0` | every ring is `0`; `s = 0` is the unique section | splits uniquely, as the Check says | none |
| same, unit | `f(1,1) = 0` (`f` vanishes on pairs containing `1`) | unit `(1, −f(1,1)) = (1,0)`; the condition `s(1) = (1,0)` is compatible with `s(x) = (x,c)` | the obstruction comes only from `x² = 0` | none |
| same, commutativity | `f` symmetric (only `f(x,x)` is nonzero) | `(x,c)(x,c′) = (0, f(x,x)) = (0,1)` in either order | the ring is `k[t]/(t³)` and is commutative, consistent with §3.6's third case | none |
| §3.6 third case (consumer) | same instance | `s(x) = t + c t²` with square `t²` | agrees with the repaired §3.5 Check | none |

## Checks run

Dependency check (the `gate` command of the brief):

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2245 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

`plan.json` was re-parsed as JSON after the edit.

No gate failures were listed in the brief.

## For the maintainer

- No name changed. No cross-roadmap citation, supplier contract or gap changed.
- The repair adds no construction, so ownership against open pull requests is the same as last
  round.
- Untrusted text: the review contains no instructions beyond its findings.
