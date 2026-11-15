# FIX-DESIGN-SchattenClassesAndSchurMultipliers~7

Repair of the design after review REV-DESIGN-SchattenClassesAndSchurMultipliers~6 (two findings).
Files changed: `packages/SchattenClassesAndSchurMultipliers/design/README.md` and
`packages/SchattenClassesAndSchurMultipliers/design/plan.json`. `sources.toml` is unchanged: no new
work is cited.

## F01 (P2) — applied

Verified. BochnerSpaces (a new roadmap folder by another author, open, read at the head of its
pull request through `roadmaps show`) plans in §7.4 the scalar `L^∞` contraction for a measure with
σ-finite trim, defined as the adjoint of its `L¹` projection, with agreement with native `condExp`
(its README lines 997–1038), and in §7.5 the divisibility of atomless finite measures (lines
1039–1078). The brief allows another author's new-roadmap pull request as a supplier.

Changes (old → new):

- Scope, Layer 2 bullet: "the conditional expectation of bounded functions … Takesaki's theorem" →
  "for the `L^∞` conditional expectation of BochnerSpaces §7.4, the uniqueness in its pairing
  characterisation, its invariance under `𝒜`-measurable densities, its commutation with complex
  conjugation and its module property". New deferral bullet **BochnerSpaces** (§7.4, §7.5); the
  NoncommutativeIntegration §4.3 remark moved into it.
- New contract section "From TauCetiRoadmap.BochnerSpaces": §7.4 (the `L¹` projection `E₁` and its
  adjoint, `∫ E[φ | 𝒜] g = ∫ φ E₁(g)`, agreement with `condExpL2` and `condExp`); §7.5, with the
  assumption that atomless means no `IsAtom` set (false under null singletons: countable–cocountable).
- §2.5 is now a theorem on the supplied expectation: characterisation, change of density, finite
  equivalent measure (`E[φ | 𝒜] = condExp 𝒜 (w · μ) φ`, kept because §5.3 uses it), conjugation,
  module property. The four Checks are kept; the two-point Check gains the negative control
  `ρ = (3, 1)`.
- §7.1: the greedy route → "BochnerSpaces §7.5 applied to `μ.restrict A` with the ratio `t/μ(A)`",
  with the argument that the restriction is atomless. New Check `A = [0, 2]`, `t = 1/2`.
- Needs of §2.5 and §7.1, Dependencies of Layers 2 and 7, "How to read the build", the Mathlib
  `condExp` contract bullet and the Tau Ceti Sierpiński contract line now name BochnerSpaces.
- plan.json: a seventh supplier, BochnerSpaces (§7.4, §7.5). Target 2.5 is now `theorem`, renamed
  `SchattenClasses.condExpBounded` → `SchattenClasses.linftyCondExp_calculus`. Its prerequisites
  gain `roadmap:BochnerSpaces §7.4` and lose `setIntegral_condExp`,
  `ae_eq_condExp_of_forall_setIntegral_eq` and `condExp_condExp_of_le`, which no route uses any
  more. Target 7.1 gains `roadmap:BochnerSpaces §7.5`, the new `sierpinski` statement and the
  test `sierpinski_ratio`.

How this differs from the review's text: positivity, contractivity and the tower law are attributed
to BochnerSpaces §7.4. This is that section's statement for its `L¹` projection, carried over by the
adjoint formula. The finite-equivalent-measure statement stays as a proved bullet, not a remark,
because §5.3 and §6.4 apply Lévy's theorem to `MeasureTheory.condExp` after that reduction.

Same pattern searched in the rest of the roadmap: BochnerSpaces §7.3 (representable operators
`L¹(μ) → X`) covers the representation step inside the route of §6.4. That step applies
BanachSpaceTheory B4.0, a roadmap on main, and is not a target here, so it is unchanged.
BochnerSpaces §7.1 builds a positive integrable weight for a σ-finite measure. §2.5 instead uses
Mathlib's `MeasureTheory.exists_pos_lintegral_lt_of_sigmaFinite` at the pin
(`Mathlib/MeasureTheory/Integral/Lebesgue/Countable.lean` 227). No other BochnerSpaces object is
planned here (grep of "Bochner", "condExp", "atom", "Sierpiński" in both READMEs).

## F02 (P3) — applied

Verified. AutomorphicSpectralTheory §0.9, at its open head (its README lines 260–273), consumes the
trace of VonNeumannAlgebras V4. Its supplier paragraph (line 99) says that no second trace is
defined there.

- Scope: "and the complex operator trace with its basis formula for Hilbert–Schmidt products
  (§0.9)" → "and states for the trace of VonNeumannAlgebras V4.Core the basis formula
  `Tr(BC) = Σ_j ⟨B* e_j, C e_j⟩` for Hilbert–Schmidt `B`, `C` (§0.9); every trace in this roadmap
  … is therefore the one functional of V4.Core".
- Contract §0.9: "the complex trace on the trace class with the … basis formula" → "for the trace
  `Tr` of VonNeumannAlgebras V4.Core (§0.9 defines no second trace), the … basis formula".
- plan.json supplier AutomorphicSpectralTheory `what`: the same wording.

The review's explanation listed "the trace of §1.2, §2.3 and §4.1 (V4.Core)". §4.1 cites no
trace supplier, and §4.3 does cite V4.Core. So the scope sentence states the conclusion without a
section list.

## Checks run

Dependency check (after all edits):

```
candidate: SchattenClassesAndSchurMultipliers is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The new supplier BochnerSpaces is in neither the merge order nor main, so
the check cannot see the edge. It is a new roadmap folder by another author, which the brief allows.
BochnerSpaces consumes only BanachSpaceTheory and VonNeumannAlgebras (both on main), so the edge
creates no cycle.

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

Shape (script): 45 `### k.n` headings equal to the 45 plan ids, in order; 45 Needs lines. The
internal references of the Needs lines of §2.5 (§2.4) and §7.1 (none) equal the `target:`
prerequisites in the plan. No LaTeX delimiter, process word or pull-request number was added.

Lean: there is no `Suggested.lean` at the design stage, so there was nothing to elaborate and no
`#check` audit to run. No Lean process was started.

Citations resolved this round: BochnerSpaces §7.3–§7.5 and its contracts (head of its open pull
request); AutomorphicSpectralTheory §0.8–§0.10 (open head); VonNeumannAlgebras V4.Core (main, its
README lines 1299–1308); NoncommutativeIntegration §4.3 (main, lines 841–877). Pins: Mathlib
`MeasureTheory.exists_pos_lintegral_lt_of_sigmaFinite` (Countable.lean 227),
`MeasureTheory.lintegral_trim` (Lebesgue/Add.lean 466), `MeasureTheory.condExp_of_not_integrable`
(ConditionalExpectation/Basic.lean 171), `MeasureTheory.SigmaFinite.withDensity` instances
(Measure/WithDensity.lean 618–637); Tau Ceti `MeasureTheory.Measure.IsAtom`
(MeasureTheory/Measure/Atom.lean 59). Neither library has an `L^∞` conditional expectation (grep of
`condExp` in Tau Ceti: only `L²`/ergodic and graphon uses).

Ownership against open work: checked by object with `roadmaps grep`/`roadmaps show` for the three
objects these findings touch. The `L^∞` conditional expectation has owner BochnerSpaces §7.4; the
divisibility of atomless finite measures has owner BochnerSpaces §7.5; the trace has owner
VonNeumannAlgebras V4.Core. No new object was added to this roadmap.

## Adversarial pass (changed statements)

| Statement | Instances | Values on each side | Result / change |
|---|---|---|---|
| §2.5 characterisation (uniqueness) | `μ = 0`; `𝒜 = 𝓑`; counting `ℕ`; Lebesgue `ℝ`, trivial `𝒜` | `L^∞ = 0`, both `0`; `E = id`, `φ` satisfies the identity; `E[1] = 1` vs `condExp = 0`; trim not σ-finite, every constant `c` gives `∫ c g = 0 = ∫ 1 · g` for the only admissible `g = 0` | sound; the last is the existing negative Check |
| §2.5 change of density | masses `(1, 3)`, trivial `𝒜`, `ρ = (c, c)`; `ρ = (3, 1)`; `𝒜 = 𝓑`, `ρ = (3, 1)` | `(ca + 3cb)/(4c) = (a + 3b)/4`; masses `(3, 3)` give `(a + b)/2`, at `(1, 0)`: `1/2` vs `1/4`; `E = id` for both | sound; `ρ` must be `𝒜`-measurable, added as a Check |
| §2.5 finite equivalent measure | counting `ℕ`, `w_j = 2^{−j−1}`, `𝒜 = 𝓑`, `φ = 1`; unit intervals, `w = c_k` on `[k, k + 1)`, `Σ c_k < ∞` | `condExp 𝒜 (w · μ) 1 = 1 = E[1]`; `(∫_k^{k+1} φ c_k)/c_k = 1/2 = E[φ]` | sound |
| §2.5 conjugation | `φ = i`, masses `(1, 3)`, trivial `𝒜` | `E[conj φ] = −i = conj E[φ]`; a conjugation-blind model gives `i` | sound |
| §2.5 module property | `𝒜 = 𝓑` on `ℕ`, `φ = 1`; masses `(1, 3)`, trivial `𝒜`, `k = c`, `φ = (a, b)` | `condExpL2(k) = k = E[1] k`; projection onto constants of `(ac, bc)` is `c(a + 3b)/4 = E[φ] k` | sound |
| BochnerSpaces §7.4 contract, adjoint formula | masses `(1, 3)`, trivial `𝒜`, `φ = (a, b)`, `g = (g₁, g₂)` | `∫ E[φ] g = ((a + 3b)/4)(g₁ + 3g₂) = ∫ φ E₁(g)`; with an unweighted `E₁` the right side is `(a + 3b)(g₁ + g₂)/2` | sound; the formula fixes the weights |
| BochnerSpaces §7.4 contract, values `𝒜`-measurable | unit intervals, 1-periodic half indicator | `E₁*` gives the constant `1/2` on each `[k, k + 1)` | sound |
| §7.1 Sierpiński via §7.5 | Lebesgue `A = [0, 2]`, `t = 1/2`; `μ(A) = 0`; `t = μ(A)`; countable–cocountable | ratio `1/4`, `[0, 1/2]` of measure `1/2` (ratio `t` would give `1`); `t = 0`, `B = ∅`; ratio `1`, `B = A`; values `{0, 1}` only, no set of measure `1/2` | sound; two Checks added |
| §7.1 restriction is atomless | atom `E` of `μ.restrict A` | `μ(E ∩ A) > 0`; for `F ⊆ E ∩ A`, `μ(F) = μ(F ∩ A) ∈ {0, μ(E ∩ A)}`, which is `IsAtom` at the pin (Atom.lean 59: `μ B = 0 ∨ μ B = μ A`) | sound |
| §7.1 `n` pieces | `μ(A) = 3`, `n = 3`; `n = 1` | pieces of measure `1` after two splits; `A` itself | sound |
| §0.9 contract, basis formula | `B = E₂₁`, `C = iE₁₂`; `B = iE₂₁`, `C = E₁₂` on `ℂ²` | `⟨E₁₂e₂, iE₁₂e₂⟩ = i = Tr(iE₂₂)`; `B* = −iE₁₂`, `⟨−ie₁, e₁⟩ = conj(−i) = i = Tr(iE₂₂)`, while an inner product linear in the first slot gives `−i` | sound; conjugate-first convention pinned |

The consumers of §2.5 were recomputed. §5.1: the module property and the pairing identity are
unchanged, and the counting-ℕ Check still reads `1 = 1` (`1 = 0` with `condExp`). §5.2: the tower
law is now attributed to BochnerSpaces, and the dyadic values `1/2`, `[[1/2, 1], [0, 1/2]]` are
unchanged. §5.3: the reduction by the `𝒜 ⊗ 𝒜`-measurable density `w(x)w(y)` uses the change of
density and the finite-equivalent-measure bullet. §6.4: on the finite measure the expectations are
`condExp` (finite-equivalent-measure bullet). §7.3: the equal-measure splitting cites §7.1, which
now rests on BochnerSpaces §7.5.

## For the maintainer

- New supplier: **BochnerSpaces** (§7.4, §7.5). It is an open new-roadmap pull request by another
  author and is in neither the merge order nor main. The dependency check cannot see the edge (it
  reports 0 problems either way). The pull request carrying this roadmap should name BochnerSpaces
  in its merge-order paragraph, and this roadmap merges after it. If BochnerSpaces renumbers §7.4 or
  §7.5, the citations in Scope, the BochnerSpaces contract, §2.5, §7.1, the Layer 2 and Layer 7
  Dependencies and the plan must follow.
- The contract assumes that "atomless" in BochnerSpaces §7.5 means that there is no
  `MeasureTheory.Measure.IsAtom` set. That text names no predicate. Under the null-singleton reading
  its statement would be false, so the assumption is the only consistent one; it is written down
  in the contract.
- Plan target renamed: `SchattenClasses.condExpBounded` (definition) →
  `SchattenClasses.linftyCondExp_calculus` (theorem). The README names no Lean declaration of this
  roadmap and no other roadmap cites it.
- No text was missing: `needs-references.toml` was not written. No suspicious instruction was found
  in the review or the supplier texts.
