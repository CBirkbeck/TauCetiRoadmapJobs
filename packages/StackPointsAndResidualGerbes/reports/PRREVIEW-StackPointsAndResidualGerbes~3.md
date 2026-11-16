# Review of StackPointsAndResidualGerbes (pull request #2429 at 8ca9dfb)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: "Mathlib `AlgebraicGeometry.FormallyUnramified`, `Algebra.FormallyUnramified.finite_of_free` and `Algebra.FormallyUnramified.bijective_of_isAlgClosed_of_isLocalRing` (on each affine open `Spec A` of the `K`-scheme `G_x`, unramified over `K`, … finite over `K` with every local factor equal to `K`" (README 1863–1867). Also in From Mathlib (229–237), Layer 6 Dependencies (1910–1912) and the worked example (2188–2190).
- R02 — repaired: the description now says "over an algebraically closed field the reduction of a finite type Deligne–Mumford stack with quasi-compact diagonal and finite discrete underlying space is a disjoint union of classifying stacks of finite constant groups".

## Verified sound

| Target | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 6.4 API bullet, *Needs:* route (sample) | `K = ℂ`: `B(ℤ/2) ⊔ Spec ℂ`; `K = ℝ`: `Bμ_3`; `Bμ_p/𝔽̄_p`; `Bℤ/K` | `A = ℂ×ℂ`, `ℂ`: finite, factors `ℂ`; `μ_3,ℝ = Spec(ℝ×ℂ)`, factor `ℂ ≠ ℝ`; `Ω(𝔽̄_p[s]/s^p) ≅ A ≠ 0`; `ℤ_K` has infinitely many components | holds; `K = K̄`, DM, qc diagonal each needed | none |
| From Mathlib: `finite_of_free` (`Finite.lean:167`, binders at 129) | `ℚ → ℚ̄`; `ℂ → ℂ×ℂ` | `ℚ̄`: `Ω = 0`, free, infinite-dimensional, not essentially of finite type; `ℂ×ℂ`: `Ω = 0`, dimension 2 | the bullet keeps essential finite type, as the pin does | none |
| From Mathlib: `bijective_of_isAlgClosed_of_isLocalRing` (`Field.lean:61`) | `ℝ → ℂ`; `ℂ → ℂ[ε]`; `ℂ → ℂ×ℂ` | `ℂ`: local, `Ω = 0`, dimension 2; `ℂ[ε]`: `Ω ≅ ℂ ≠ 0`; `ℂ×ℂ`: not local, dimension 2 | the bullet keeps closedness and locality, as the pin does | none |
| 6.4 *Needs:*: DM ⇒ unramified inertia, Lemma 101.6.1 | `B(ℤ/2)/ℂ`; `Bμ_p/𝔽_p`; `B𝔾_m` | inertia `(ℤ/2)`: `Ω = 0`, DM; `μ_p`: `Ω ≠ 0`, not DM; `𝔾_m`: `Ω` rank 1, not DM | matches stacks-06RD 650–654, item (4); covered by the gap text (README 395–400) | none |
| Worked example, zero-dimensional DM stacks | `[Spec ℂ[ε]/(ℤ/2)]`, `ε ↦ −ε`; representative `k/K` | one point, `𝒳_red = B(ℤ/2) ≠ 𝒳`, `G_x = Spec(ℂ×ℂ)`; `k` finitely generated field over `K̄`, so `k = K` | holds | none |
| Description: the FunctionFieldArithmeticPartII sentence | `Bℤ/K`; `Bμ_3/ℝ` | not qc diagonal: excluded; `K` not algebraically closed: excluded; hypotheses = README 1873–1878 | holds | none |

The rows for statements the change does not touch stand as in the previous review, of `bc166a2`.

- 3 source locators checked against the cached text: stacks-06RD 637–657 (Lemma 101.6.1, item (4) at 650–654), stacks-06RD 1527–1528 (Lemma 101.17.8), alper-moduli 6998–6999 (Proposition 4.5.16 (2)).
- 3 Mathlib declarations opened at `1b1ccf4`: `AlgebraicGeometry.FormallyUnramified` (`Morphisms/FormallyUnramified.lean:54`), `Algebra.FormallyUnramified.finite_of_free` (`RingTheory/Unramified/Finite.lean:167`), `.bijective_of_isAlgClosed_of_isLocalRing` (`RingTheory/Unramified/Field.lean:61`). Each From Mathlib gloss states the pinned hypotheses. The pin has no scheme-level unramified class, so "locally of finite type plus formally unramified" is the right translation.
- Cross-roadmap: gap:stack-separation-axioms (README 395–400) names Lemma 101.6.1; FunctionFieldArithmeticPartII line 53 at its head is unchanged and matches the consumer bullet (README 2162–2167); AlgebraicModuliForArithmeticGeometry main line 8710 still has `DMSchematicClosure`.
- Gate rerun at 8ca9dfb: OK, every check 0. The outside-folder diff is empty. Dependency check: `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean Suggested.lean` printed nothing and exited 0. The file has not changed since 3688535 and declares nothing, so there was nothing to `#check` or probe. The change adds no headline that is statable at the pins.
- Gaps: none added. The new step (DM ⇒ unramified inertia) is Lemma 101.6.1 (4), which gap:stack-separation-axioms names.
- Description and title read against 8ca9dfb. The change adds Mathlib declarations only, so "Dependencies, all on main" still holds, and the gap count (15/1/1) still matches.

Overlap check: read SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry and EquivariantIntersectionTheory (main), and SchemeAndStackFoundations, NashBlowups, GroupSchemesOverABase, PurityForFlatCohomology and VirtualFundamentalClass (open); scopes as read at 3688535. For the new step ("quasi-compact unramified over `K̄` ⇒ finite constant"), searches of main and every open head found no owner; Mathlib supplies it.

Source independence: changed passages only. 5 passages compared (the From Mathlib bullet, the 6.4 *Needs:* parenthesis, the Layer 6 Dependencies, the worked example, the description sentence) with 2 sources: stacks-06RD 637–657 and alper-moduli 6353–6360 and 9042–9043, plus the Mathlib docstrings at the pin. Nothing shared beyond forced terms ("unramified inertia"). No layer was added, removed or reordered, so the contents comparison of 3688535 stands (largest share stacks-06QB/06RD, about 134 of about 350 locators; independent).

## Not verifiable

- lmb2000, Chapter 11, Définition 11.2 (cited in 5.5; the change does not touch it): uncertified (paywalled), cited by its locator only.

## Source issues

- none

## For the human reviewers

- AlgebraicModuliForArithmeticGeometry §5.4 (main, 37th in the merge order) uses closed substacks of Deligne–Mumford stacks without defining them (main README line 8710, `DMSchematicClosure`). Their only owner is this roadmap (38th), as its README lines 65–66 record.
