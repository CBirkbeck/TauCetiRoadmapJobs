# FIX-DESIGN-StackPointsAndResidualGerbes~13

This round repairs the findings of the round-12 design review. There is one finding, F01 (P3). It is
right and it is applied. Files changed:

- `packages/StackPointsAndResidualGerbes/design/README.md`
- `packages/StackPointsAndResidualGerbes/design/plan.json`

`sources.toml` is unchanged: the repair cites only pinned Mathlib declarations, and no new source.
The review's "For the human reviewers" section (two licence notes and two ownership notes) lists no
finding, so nothing was changed because of it.

## F01 (P3) — applied

**Verified.** A finite type point needs only *some* locally finite type representative (1.1's
definition, and its second Check). The old reason ("`k(t)` is not a finitely generated
`k[t]`-algebra") rules out one representative, `Spec k(t) → 𝔸¹_k`, and says nothing about
`Spec K → 𝔸¹_k` for `K ⊋ k(t)`. The claim is true but its reason was incomplete.

**The repair is mathematically sound, as proposed.** Take any representative `Spec K → 𝔸¹_k` of `η`.

1. `k[t] → K` is injective, because its kernel is the prime of `η`, which is `0`.
2. Spec of a field and `𝔸¹_k` are both affine, so "locally of finite type" would make `K` a
   finitely generated `k[t]`-algebra.
3. `k[t]` is Jacobson (Mathlib instance `IsJacobsonRing R[X]`, `Mathlib/RingTheory/Jacobson/Ring.lean:438`).
   So `K` would be a finite `k[t]`-module by `finite_of_finite_type_of_isJacobsonRing` (`:691`).
4. `isField_of_isIntegral_of_isField` (`Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Basic.lean:675`)
   would then make `k[t]` a field, which it is not.

**Old → new.**

- **README 1.1 Check.** Old: "`k(t)` is not a finitely generated `k[t]`-algebra". New: the argument
  above for every `K`, plus the witnesses `K = k(t)` and `K = k(t)(√t)`. In both, `1/t` is not
  integral over `k[t]`. The "flat" non-example is kept.
- **Plan test `A1_generic_not` (1.1).** Now gives the same reason.

**Same pattern elsewhere.** I searched the README for every "finite type point" claim.

- **4.1's Check** ("existence alone does not give a finite type point") inferred the point's status
  from one morphism. It now cites 1.1 for "`η` is not a finite type point", and the argument of 1.1
  with `K = k(t)` for "`𝒵_η → 𝔸¹_k` is not locally of finite type". Plan test `generic_not_ft` was
  changed to match.
- **The other places are sound and unchanged:**
  - 4.4's Check on `U/G` makes a positive claim, so one representative is enough.
  - 6.2's Check already cites 1.1.
- **Supplier contract.** The Mathlib bullet for `finite_of_finite_type_of_isJacobsonRing` now also
  names the polynomial-ring Jacobson instance (line 438) and `isField_of_isIntegral_of_isField`. It
  says they serve 1.1's Check.

### Adversarial pass on the changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 Check, `η ∈ 𝔸¹_k` not a finite type point | `K = k(t)`; `K = k(t)(√t)`, including characteristic 2 (inseparable); `K = algebraic closure of k(t)` | `ker(k[t] → K) = 0` in each case. `1/t ∈ K`. Suppose `t⁻ⁿ + a₁t⁻ⁿ⁺¹ + … + aₙ = 0` with `aᵢ ∈ k[t]`. Multiplying by `tⁿ` gives `1 = −t(a₁ + … + aₙtⁿ⁻¹) ∈ (t)`, which is false. So `K` is not integral over `k[t]` and not finite | holds; separability is not used |
| same, with `k = 𝔽₂` (finite field) | `k[t]` over `𝔽₂` | `𝔽₂` is Artinian, hence Jacobson, so `𝔽₂[t]` is Jacobson (line 438). `𝔽₂(t)` needs all `1/f` for the infinitely many irreducible `f`. A finitely generated `𝔽₂[t]`-algebra inside `𝔽₂(t)` is `𝔽₂[t][1/g]` for one `g`, which misses `1/f` for every irreducible `f ∤ g` | holds |
| same, injectivity step needed | closed point `t = a`, `K = k` | `ker = (t − a) ≠ 0`, and `Spec k → 𝔸¹_k` is a closed immersion, which is locally of finite type. The argument does not apply, as it should not | holds; this separates `η` from the closed points |
| same, Jacobson hypothesis needed | `Spec ℤ_(p)`, generic point, `K = ℚ` | `ℤ_(p) → ℚ` is injective and `ℚ = ℤ_(p)[1/p]` is finitely generated, but `ℤ_(p)` is not a field. `ℤ_(p)` is not Jacobson: its Jacobson radical `pℤ_(p)` is not the nilradical `0`. Agrees with 1.1's first Check (that point **is** a finite type point) | holds; `k[t]` being Jacobson is the operative hypothesis |
| agreement with 1.1's fifth Check | `𝔸¹_k` is locally of finite type over a field | finite type points = closed points; `η` is not closed (its closure is `𝔸¹_k`) | agrees |
| 4.1 Check (revised) | `η ∈ 𝔸¹_k`, `𝒵_η = Spec k(t)` (3.3) | Condition (iii) of 4.1 fails (`Spec k(t) → 𝔸¹_k` is not locally of finite type, `K = k(t)` above). Condition (i) fails (1.1). The equivalence holds at `η` | holds |
| Supplier-contract bullet | pinned declarations | Line 438: `instance [IsJacobsonRing R] : IsJacobsonRing R[X]`. Line 675: `isField_of_isIntegral_of_isField (hRS : Function.Injective (algebraMap R S)) (hS : IsField S) : IsField R`, with `[Algebra R S] [Algebra.IsIntegral R S]` from the section `variable` line | matches the prose |

## Checks run

**Dependency check.** Command as given in the brief. Output:

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

There is no UPWARD and no CYCLE line.

**Other checks.**

- `plan.json` parses as JSON after the edits.
- The number of Checks and plan tests is unchanged: two existing Checks were rewritten and none were
  added.
- Every Mathlib declaration added to the README was read at the pinned Mathlib, at the file and
  line given above.

**Not done, and why.**

- No gate failures were listed for this round.
- No `Suggested.lean` exists at the design stage, so no Lean was elaborated and there was no
  `#check` comparison.
- Ownership against open pull requests was not re-checked. The repair adds no construction, only
  the reason inside a Check.

## For the maintainer

- No name that another roadmap cites has changed.
- No target, section or gap slug was added, removed or renumbered.
- Nothing in the reviewed text was suspicious as an instruction.
