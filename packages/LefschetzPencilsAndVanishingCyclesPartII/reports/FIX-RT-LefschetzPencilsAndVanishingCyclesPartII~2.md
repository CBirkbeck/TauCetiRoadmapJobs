# FIX-RT-LefschetzPencilsAndVanishingCyclesPartII~2: repair of red-team round 2

Two reviews (passes a and b), three findings, all P3. Both F01s report the same defect and are
settled once below. Only `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md` changed;
`Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged (`gaps` stays
empty).

## RT-LefschetzPencilsAndVanishingCyclesPartII~2a/F01, RT-LefschetzPencilsAndVanishingCyclesPartII~2b/F01 (P3) — applied

`Algebra.FormallyEtale.iff_exists_algEquiv_prod` → `Algebra.Etale.iff_exists_algEquiv_prod` at all
six places (contract bullet, §2.1 route and *Needs*, §2.4 step 3 and *Needs*, Layer 2
Dependencies). Dropped `Algebra.EssFiniteType.of_finiteType` (contract, §2.1 *Needs*) and
`Mathlib/RingTheory/EssentialFiniteness.lean` (References). §2.1 now states the torsion-free
embedding `A ↪ k(X) ⊗_{k[X]} A`, citing `IsFractionRing.isAlgebraic_iff` and
`isAlgebraic_algebraMap_iff`.

Evidence (pinned Mathlib, checked by `#check`): `Algebra.FormallyEtale.iff_exists_algEquiv_prod`
(`Mathlib/RingTheory/Etale/Field.lean:194-198`) takes `[Algebra.EssFiniteType K A]` and concludes
only `∀ i, Algebra.IsSeparable K (Ai i)`. `Algebra.Etale.iff_exists_algEquiv_prod` (same file,
`:270-275`) takes `Algebra.Etale K A` with no essential-finiteness instance and concludes
`∀ i, Module.Finite K (Ai i) ∧ Algebra.IsSeparable K (Ai i)`, which is what the README says. The
reviewers' finding holds.

The suggested repair is right. Pass a also asked for the embedding clause. I added it because the
old route went from "the base change is a finite product of fields" to "every element of `A` is
algebraic over `k[X]`" without saying why. The step now names two pinned lemmas:
`IsFractionRing.isAlgebraic_iff` (`Mathlib/RingTheory/Localization/Integral.lean:146`: for a domain
`A` with fraction field `K` and a tower `A → K → C` into a commutative ring `C`,
`IsAlgebraic A x ↔ IsAlgebraic K x`) and `isAlgebraic_algebraMap_iff`
(`Mathlib/RingTheory/Algebraic/Basic.lean:328`: algebraicity over `R` is detected after an
injective `algebraMap S A`). Both are added to the Mathlib supplier contracts, the Layer 2
Dependencies and the References file list.

Other places with the same pattern: none. The old name and `EssFiniteType` occur nowhere else in
the README or in `Suggested.lean`, and the editable files contain neither. No statement of the
roadmap changes. §2.1 uses only algebraicity, and §2.4 step 3 uses only that a domain étale over
`k` is one finite separable field.

## RT-LefschetzPencilsAndVanishingCyclesPartII~2a/F02 (P3) — applied

Summary: "so a lisse sheaf on `Y` has the same Frobenius at `c` and at `y`" → "so the pullback along
`g` of a lisse sheaf on `Y` has at `c` the Frobenius that the sheaf has at `y`". `c` is a point of
`C`, not of `Y`, so only `g^*F` has a Frobenius at `c`. Since `κ(y) → κ(c)` is the identity of
`𝔽_q`, that Frobenius is the one `F` has at `y`.

Other places with the same pattern: none. §2.4 "The marked residue fields" already compares the
geometric Frobenius of `𝔽_q` at `c` with that at `y` along `g`, which is correct. The
`exists_same_field_curve` docstring in `Suggested.lean` only says that both residue fields are
`𝔽_q`, which is also correct. Downstream consumers speak of transporting a statement to a curve and
never say that a sheaf on `Y` has a Frobenius at `c`.

## Adversarial pass on the changed text

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Contract: `Algebra.Etale.iff_exists_algEquiv_prod` | `𝔽_4/𝔽_2`; `𝔽_2 × 𝔽_2`; `𝔽_2[ε]/ε²`; `𝔽_p(t^(1/p))/𝔽_p(t)`; `k(t)/k` | étale, one factor of degree `2`; étale, two factors of degree `1`; not reduced, not étale, no product decomposition; finite, inseparable, not étale; not étale (`Ω ≠ 0`), not a finite product of finite extensions | iff holds in both directions on each | new wording |
| §2.1, `m = 0` | `k[X] = k`, `A = L` | `k(X) ⊗ A = L`, one factor; `Z = ∅`, `I = A`, `h` a nonzero constant, `V(h) = ∅ ⊇ π(∅)` | holds | none |
| §2.1, identity chart `m = 1`, `Z = V(X_0)` | `A = k[X_0]` | base change `k(X_0)`, one factor of degree `1`; `X_0` killed by `t − X_0`; `I = (X_0)`, `h = X_0` | holds | none |
| §2.1, `V = Spec k[x, x⁻¹] → 𝔸¹`, `Z = {x = 1}` | — | base change `k(x)`; `x⁻¹` killed by `X t − 1 ∈ k[X][t]`; `x − 1 = π^*(X − 1) ∈ I`, `h = X − 1` | holds | none |
| §2.1 embedding needs a domain | `A = k[X] × k[X]/(X)` (torsion, not a domain) | `(0, 1)` killed by `X`, maps to `0` in `k(X) ⊗ A`: no embedding | the clause relies on `A` being a domain, which `[IsIntegral V]` gives | domain hypothesis stated in the clause |
| §2.1 étaleness (negative control) | projection `𝔸² → 𝔸¹` | `k(X_0) ⊗ k[x_0, x_1] = k(X_0)[x_1]`: infinite-dimensional, `x_1` transcendental | lemma's hypothesis fails, consistent with the existing Check | none |
| §2.4 step 3, `m = 0` | `V₀ = Spec A`, `A` étale over `k ≅ k[∅]`, a domain with a `k`-point; `Spec 𝔽_4` over `𝔽_2` | `A ≅ Π L_i`, domain gives `|I| = 1`; `L → k` gives `[L : k] = 1`; `𝔽_4` has no `𝔽_2`-point, so the hypothesis fails | holds; matches the "non-rational point" Check | none |
| Summary Frobenius sentence | `Y = 𝔸²_{𝔽_q}`, `g(T) = (T, T³)`, `c = 0`; `Y = Spec 𝔽_q`, `g` constant; a hypothetical point of `C` over `𝔽_{q^r}` | `(g^*F)_c̄ = F_ȳ`, `Frob_c ↦ Frob_y` (both degree `1`); `g^*F` constant with `Frob_q` acting as on `F_ȳ`; that point would give `Frob_y^r`, which a section `c` excludes | corrected sentence holds | applied |

## Checks run

**Elaboration.** `lake env lean packages/LefschetzPencilsAndVanishingCyclesPartII/Suggested.lean`
was run from the content checkout. Exit 0. The only output is the four `declaration uses 'sorry'`
warnings, at lines 55, 66, 81 and 105. The file is unchanged this round.

**Mechanical signature check.** I elaborated one scratch file: a copy of `Suggested.lean` followed
by `#check @name` for all five declarations, plus the cited Mathlib names
`Algebra.Etale.iff_exists_algEquiv_prod`, `Algebra.FormallyEtale.iff_exists_algEquiv_prod`,
`Algebra.Etale.baseChange`, `IsFractionRing.isAlgebraic_iff`, `isAlgebraic_algebraMap_iff` and
`Ideal.under_ne_bot_of_algebraic_mem`. Exit 0. I compared all five elaborated types clause by clause
with README §1.1, §1.2, §1.3, §2.3 and §2.4: no binder is lost and nothing changed. The six Mathlib
signatures match the contract bullets as reworded.

**Dependency check.**

```text
depcheck: 206 roadmaps, 1896 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name
missing everywhere. On this host it did not check Lean names outside TauCetiRoadmap. The scratch
`#check` above covers every name this round added.

## Notes for the maintainer

- No Lean name changed and no section, layer or target id changed, so no other roadmap is
  affected. Supplier edges are unchanged: Mathlib, Tau Ceti and SchemeAndStackFoundations §0.8.
- No new object or target was introduced. The two added Mathlib citations only make explicit a
  step of the §2.1 route, so ownership is unchanged. Ownership against open pull requests outside
  the indexed heads was not checked.
- `design/README.md` (line 178) and `design/plan.json` (line 654) phrase the Frobenius comparison
  through the pullback correctly. They are outside this job's editable files and need no change.
- Both reviews also list "source issues" in Poonen2004 Theorem 3.3 and in the KisinZhou2024 proofs
  of Corollary 5.2.7 and Proposition 5.3.5. These are not numbered findings. The README already
  asserts neither source claim, and no edit was made for them.
- The reviews contain no instruction-like text addressed to the repairer.
