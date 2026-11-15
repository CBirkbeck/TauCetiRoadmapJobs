# Repair report: HochschildHomologyAndHKR, design round 9

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~8`. It has two findings: F01 (P2) and F02
(P3). Both were checked against the roadmap on main, the cached Ginz05 extraction and this
roadmap's own conventions. Both are right, and both are applied. Files edited:

- `packages/HochschildHomologyAndHKR/design/README.md`
- `packages/HochschildHomologyAndHKR/design/plan.json` (one test statement)

`sources.toml` is unchanged. No new work is cited, and no `needs-references.toml` was written.
There is no `Suggested.lean` at the design stage, so nothing was elaborated and there was no
`#check` binder audit to run.

## REV-DESIGN-HochschildHomologyAndHKR~8/F01 (P2) — applied

Old: the scope credited NoncommutativeGeometry N1.Cyclic only with the cochain comparison.
New:
- The §2.1 variants bullet (README line 152) now says that N1.Cyclic states the case `k = ℂ`,
  `M = A`, keeps that statement, and that §2.1 states it over every `k`.
- The contract (line 461) gets a parenthetical.
- Layer 2 Dependencies (line 925) names both the chain and the cochain cases.

**Evidence.** On main, `TauCetiRoadmap/NoncommutativeGeometry/README.md` lines 608–610 (section
N1.Cyclic) ask for two things, for a unital algebra: the normalised form quotient `A⊗(A/ℂ1_A)^⊗n`,
and its comparison with the pinned normalised Hochschild chains. Lines 16–18 of the same README
say the scalars are complex from N1.Cyclic on.

At `k = ℂ`, `M = A` this is exactly what §2.1 states as `N_n(A,A) ≅ A ⊗ Ā^{⊗n}` together with
`N_•(A,A) ≅ TauCeti.normalizedHochschildChains.chainComplex k A`. Before this round the scope cited
the sentence for its cochain half only (line 163).

**Wording of the repair.** I did not copy the review's text verbatim on one point: it could be read
as saying that N1.Cyclic states the chain-complex isomorphism. Lines 608–610 say only "its
comparison", so the new clause says that N1.Cyclic's statement is the complex case of §2.1's
identifications. It does not attribute the boundaries to N1.Cyclic.

**Owner.** NoncommutativeGeometry is on main, so it is earlier than this roadmap. Its statement is
over `ℂ`, which cannot supply the statement over every commutative `k`. This roadmap therefore
keeps the general variant and says in one clause how it differs, and no supplier edge is added.

**Same pattern elsewhere.** Layer 2 Dependencies also named neither half of the overlap. The new
sentence there covers the chain comparison of §2.1 and also the scalar-cochain comparison of §2.2,
which the scope already cited (line 163).

The rest of N1.Cyclic does not overlap with this roadmap:
- its completed bar resolutions are topological (completed projective tensors), not §4.2's
  algebraic bar resolution;
- its universal forms are built on the forced unitisation, and this roadmap has no universal forms;
- its scalar and continuous cochains are already deferred to it in the scope (line 84).

**Repair test.**
- `k = ℂ`, `A = ℂ[x]`, `n = 1`: both quotients are `A ⊗ (A/ℂ)`, where `x ⊗ 1 ↦ 0` and
  `1 ⊗ x ≠ 0`. This is the shared case the clause names.
- `k = ℤ`, `A = ℤ[x]`: N1.Cyclic has no statement here, and §2.1 is the only owner.
- `k = ℤ`, `A = 𝔽₂`: `Ā = 0`, so `N_n = 0` for `n ≥ 1`, and the case lies outside N1.Cyclic.

## REV-DESIGN-HochschildHomologyAndHKR~8/F02 (P3) — applied

Old: "Ginz05 (6.6.3) would give `δ(∂²) = −2∂a∂b` instead" (README §6.2 Checks, line 1463; plan 6.2
test `homotopy_11`).
New: "Ginz05 (6.6.3) would read `2(∂ ∪ ∂) = δ(∂²)`, that is `2∂a∂b = −2∂a∂b`, which fails at
`(a,b) = (x,x)` (`2 = −2`) unless `4 = 0` in `k`". The plan test now carries the same wording.

**Evidence.** The value the old text attributed to (6.6.3) is the true value, so the negative control
did not show any failure. Computation, with every convention taken from Ginz05:
- the coboundary is `bf(a₁,a₂) = a₁f(a₂) − f(a₁a₂) + f(a₁)a₂` (Ginz05 line 1056);
- the cup product is `f(a₁,…,a_p)·g(a_{p+1},…)` (line 1341);
- `f ∘ g` at `p = q = 1` is `f(g(a))` (line 1363).

Then:
- `δ∂ = 0`.
- The true value is `δ(∂²)(a,b) = a∂²b − ∂²(ab) + (∂²a)b = −2∂a∂b`, which is the value the old
  text attributed to (6.6.3).
- At `f = g = ∂`, the identity (6.6.3) of line 1368 reads `∂∪∂ + ∂∪∂ = δ(∂²) − 0 − (−1)·0`, that is
  `δ(∂²)(a,b) = +2∂a∂b`.
- At `(x,x)`: `(∂∪∂)(x,x) = 1`. The true value is `δ(∂²)(x,x) = 0 − 2 + 0 = −2`, so (6.6.3)
  asserts `2 = −2`. This holds only when `4 = 0` in `k` (for example over `𝔽₂` or `ℤ/4`), which
  the new wording states.
- The roadmap's own identity `f∘δg + δf∘g − δ(f∘g) = f∪g + g∪f` gives `−δ(∂²)(x,x) = 2`, which is
  consistent.

**Same pattern elsewhere.** I searched the README and plan for other passages that state what a
source identity, or a wrong model, "would give". Each value was recomputed:

| Passage | Recomputed | Result |
| --- | --- | --- |
| README line 942, `m a_n` last face | `b(m ⊗ a) = ma − ma = 0`, so `HH₀ = Mat₂(k)` | correct |
| README line 1138, `b m a` reading | `E₂₁E₂₂E₁₂ = 0` (`E₂₁E₂₂ = 0`) | correct |
| README line 1426, model without `(−1)^q` | at `f(a,b) = a∂b`, `(1,x,1)`: model `2·1 − x·0 = 2`, while `δf = 1·x·∂1 = 0` | correct |
| README line 1953 / plan line 1949, empty first column | `⟨⟩ = 1 ≠ 2` | correct |
| README line 226, Ginz05 line 404 `ad m` | `ma − am = −δm(a)` with `δm(a) = am − ma` | correct |
| README line 1450, plan line 1198, (6.6.3) "does not hold" / "corrected signs" | as computed above | correct; no change |

## Checks run

Dependency check (`gate --candidate … --only HochschildHomologyAndHKR`), output:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The new mentions of NoncommutativeGeometry are scope and
ownership clauses, not supplier edges. In any case NoncommutativeGeometry is on main, so it could
not produce an UPWARD edge.

`plan.json` parses after the edit (8 layers, the same 37 targets, one gap).

## Adversarial pass on the changed text

| Statement | Instances tried, values | Result | Change |
| --- | --- | --- | --- |
| Scope clause: N1.Cyclic's quotient and comparison are the case `k = ℂ`, `M = A` of §2.1 | `ℂ[x]`, `n = 1`: both give `A ⊗ A/ℂ`, `x ⊗ 1 ↦ 0`, `1 ⊗ x ≠ 0`. `ℤ[x]` over `ℤ`: outside N1.Cyclic (complex scalars, its lines 16–18). `𝔽₂` over `ℤ`: `N_n = 0` for `n ≥ 1`. Nonunital `A`: N1.Cyclic constructs the quotient only for unital `A` (line 608), and so does the clause. | holds | new clause |
| Layer 2 Dependencies sentence: complex cases of the §2.1 and §2.2 comparisons | §2.2 at `k = N = ℂ` is the cochain comparison already cited in scope (line 163); §2.1 as above | holds | new sentence |
| §6.2 first Check, the (6.6.3) negative control | `(x,x)` over `ℤ`: (6.6.3) gives `2 = −2`, false. Over `𝔽₂`: `0 = 0`. Over `ℤ/4`: `2 = −2`, true. True value `−2`; roadmap identity `−(−2) = 2` | holds as reworded | reworded in README and plan |

## For the maintainer

- No name or id that other roadmaps cite has changed. No target was added, removed or renumbered.
- Ownership against open pull requests: the overlap report lists no other pull request changing
  this roadmap, and no id that an open pull request drops. The shared object of F01 is owned on main
  by NoncommutativeGeometry. Nothing about it needs to be done in any other roadmap.
- The "Source issues" and "For the human reviewers" sections of the review list no finding, and
  nothing was changed because of them.
