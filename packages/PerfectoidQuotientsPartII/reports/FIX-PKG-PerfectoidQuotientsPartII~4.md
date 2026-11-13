# Repair of PerfectoidQuotientsPartII (package, round 4)

Findings settled: the two findings of `REV-PKG-PerfectoidQuotientsPartII~3` (one P1, one P3). I
checked both against the README, the cached Stacks text and direct computation, and found both
correct. Both are applied as the review suggests. While checking the rewritten Q10.4 argument I
also found that a normalisation the Q10.4 statement relied on was only implicit, and I made it
explicit (see F02). No finding is disputed and none is marked not actionable. No supplier gap was
needed, so the plan's `gaps` list is unchanged. `Suggested.lean` is unchanged: neither finding
touches a Lean declaration. Q9.5's API bullets are prose, and Q10.4 is a README target with no
Lean counterpart.

## REV-PKG-PerfectoidQuotientsPartII~3/F01 (P1) — applied

Verified: with `B_z = B_{1+pB}`, the first clause had the form "`B_z` faithfully flat ⇒ `B_z`
faithfully flat". For `A = ℤ₂`, `B = ℚ₂` we have `1 + 2·(−1/2) = 0`, so `B_z = 0`: the hypothesis
and the conclusion are both false.

Old → new (Q9.5 API): the two-clause bullet → one statement: for `p`-Zariski `A` and faithfully
flat `B`, `B_{1+pB}` is faithfully flat over `A`. It is flat as a localization, and a maximal ideal
over `𝔪B` contains `p`, so it survives (Stacks Lemma 10.39.15). New Checks: `ℚ_p` against
`ℤ_p[T]`, and `A = B = ℤ`.

Pattern: I reread every API list (Q7.1, Q7.2, Q8.2, Q9.1, Q9.5) for a clause whose hypothesis
contains its conclusion and found none. "An ind-fppf algebra is faithfully flat" (Q7.1) uses the fact
that a filtered colimit of faithfully flat algebras is faithfully flat. "A faithfully flat
ind-syntomic algebra is ind-fppf" (Q7.2) uses the fact that syntomic algebras are flat and finitely
presented. Neither is circular. The only consumer of the bullet is the Q9.6 proof route ("the
`p`-Zariskization of the countable iteration … faithfully flat"), which uses the retained clause.
`sources.toml` adds `Q9.5` to the Stacks entry's `cited_for` (Stacks line 4367, tag 00HP).

## REV-PKG-PerfectoidQuotientsPartII~3/F02 (P3) — applied

Verified: for `p = 3`, `A = ℤ₃⟦x⟧`, `f = x − 3`, the class of `f` in the basis `([3], [x])` is
`(2, 1)`, not a multiple of `[3]`. At `n = 1` the class of `x³ − 3` is `(2, 0)`.

Old → new (Q10.4 proof of (2)): the uniform statement "in both cases the class is a unit multiple of
`[p]`" → "at `n = 0`, `f ∉ 𝔪_A²` by the choice of presentation; for `n ≥ 1`,
`φ_A^n(f) ≡ φ_W^n(f(0))` modulo `𝔪_A²`, a unit multiple of `[p]`, nonzero because `p, x_1, …, x_d`
is a regular system of parameters".

Also changed, from the adversarial pass: the step for `n ≥ 1` needs `v_p(f(0)) = 1`, and the
statement said "the δ-structure of Q10.2" without fixing the presentation. For `f = p² − x_1`
(which presents `ℤ_p`, with `f ∉ 𝔪_A²`), claim (2) fails at `n = 1`. The statement now names Q10.2's
normalised presentation. I added two Checks: the classes `(1, −1)` and `(1, 0)` for `f = p − x_1`,
and the `p² − x_1` negative control.

Pattern: I checked every other place that uses this presentation or claims regularity stage by
stage. The other Q10.4 Checks use `f = p − x_1` or `f = x_1 − p`, with `v_p(f(0)) = 1`. Its perfect-`k`
presentations are `x_1 − p` and `p − g` with `g ∈ (p, x)²`, again with `v_p(f(0)) = 1`; so is the
Worked-examples tower `W(k)⟦x^{1/p^∞}⟧/(p − f)`. In Q10.1, stage 0 is `R` itself, which is
unramified by hypothesis. Q10.2 only asks for `f ∈ 𝔪_A ∖ 𝔪_A²`. None of them needed a change.

## Adversarial pass on the added and changed statements

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| Q9.5: `p`-Zariskization keeps faithful flatness (`A` `p`-Zariski, `B` faithfully flat) | `A = ℤ₂, B = ℤ₂[T]`; `A = ℤ₂, B = ℤ₂ × ℚ₂`; `A = 𝔽_p, B = 𝔽_p[T]`; `A = ℤ/p², B = (ℤ/p²)[T]`; `A = B = 0` | `B_z/2 = 𝔽₂[T] ≠ 0`; `1 + 2·(0, −1/2) = (1, 0)` is inverted, so `B_z = ℤ₂ × 0`, faithfully flat; `1 + pB = {1}`, so `B_z = B`; `1 + pb` is already a unit (`p` nilpotent), so `B_z = B`; `0` over `0` | Holds in every case. |
| Same, hypothesis `B` faithfully flat | `A = ℤ_p`, `B = ℚ_p` (flat only) | `1 + p·(−1/p) = 0`, so `B_z = 0` and the fibre at `(p)` is `0` | Conclusion fails without the hypothesis; added as a Check. |
| Same, hypothesis `A` `p`-Zariski | `A = B = ℤ` | `B_z = ℤ_(p)`; `ℓ` is a unit in `ℤ_(p)` for a prime `ℓ ≠ p`, so `ℤ_(p)/ℓ = 0` | Conclusion fails without the hypothesis; added as a Check. |
| Proof sketch of the same | maximal `𝔫 ⊇ 𝔪B` | `𝔪B ≠ B` (faithful flatness); `𝔫 ∩ A = 𝔪 ∋ p`; `1 + pb ∈ 𝔫` would give `1 ∈ 𝔫` | Sketch is sound; Stacks line 4367 item (4) is the criterion used. |
| Q10.4 (2), stage `n = 0` | `f = p − x_1`; `f = x_1 − 3` (`p = 3`); ramified `f = p − x_1²` | classes `(1, −1)`; `(−1, 1) = (2, 1)` over `𝔽₃`; `(1, 0)` | All nonzero, but only the ramified class is a multiple of `[p]`; the stage is handled separately. |
| Q10.4 (2), `n ≥ 1` | `p = 2, n = 1`, `x_i ↦ x_i²`; `f = x_1 − 3, n = 1`; `k = 𝔽_p(t)`, `f(0) = p·t` | `x_i² ∈ 𝔪_A²`; class of `x_1³ − 3` is `(2, 0)`; `φ_W^n(pt) = p·t^{pⁿ}` has class `t^{pⁿ}[p] ≠ 0` | A unit multiple of `[p]`, not necessarily `[p]` itself, as stated. |
| `a_0 ≠ 0 ⇔ v_p(f(0)) = 1` | `f(0) = pw` | `𝔪_A² ∩ W = p²W`, so `[f(0)] = w̄[p]` and `a_0 = w̄` | Equivalence holds; `x_1 − p` has `a_0 = −1`. |
| Q10.4 statement without the normalisation | `ℤ_p = ℤ_p⟦x_1⟧/(p² − x_1)` | `a_0 = 0`; `φ_A(f) = p² − x_1^p ∈ 𝔪_A²`; `ℤ_2⟦x⟧/(x² − 4)` has `(x − 2)(x + 2) = 0` | Claim (2) is false here; the hypothesis is now explicit and the case is a Check. |
| Q10.4 Check on the `n = 0` class | `p = 2` | `−1 = 1` in `𝔽₂`, so the classes are `(1, 1)` and `(1, 0)` | As written in the Check. |

## Checks run

- `lake env lean packages/PerfectoidQuotientsPartII/Suggested.lean` (from the content checkout):
  exit 0, 15 warnings, all "declaration uses `sorry`", no errors. No `TauCeti.*` module needed
  building.
- Signature pass: I copied `Suggested.lean` to a scratch file, appended `#check @name` for all 18
  declarations and elaborated it once: exit 0, no errors. The types match their README statements
  and the earlier elaborated signatures; nothing changed, since the file is unchanged. Examples:
  `IsPZariski : ℕ → (A : Type u_1) → [CommRing A] → Prop`, whose body `∀ a, IsUnit (1 + p * a)` is
  the README's `1 + pA ⊆ A^×`; `exists_semiperfectoid_cover` keeps `IsPZariski p A` and its
  positive-degree hypothesis.
- Dependency check output:

```text
depcheck: 236 roadmaps, 2136 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line.

## Notes for the maintainer

- There were no gate failures to repair.
- No Lean name changed or was added or removed, so nothing other roadmaps cite has moved. Section
  numbering is unchanged.
- Ownership: this round adds no new construction. A search of main and the open roadmap pull
  requests for `p-Zariskization` found no other owner. The three unresolved-name leads in the
  citation report still resolve: DerivedDeRhamCohomology §1.10 states both ordinary-flatness
  criteria, and PerfectoidSpaces P7.17 names `RegularTower.exists_perfectoidTower`.
- No source text needed fetching, and nothing was added to `needs-references.toml`.
