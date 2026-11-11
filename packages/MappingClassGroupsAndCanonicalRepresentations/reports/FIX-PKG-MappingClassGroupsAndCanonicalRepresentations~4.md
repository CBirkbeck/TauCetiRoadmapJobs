# FIX-PKG-MappingClassGroupsAndCanonicalRepresentations~4

Repair of the four findings of `REV-PKG-MappingClassGroupsAndCanonicalRepresentations~3`. All four
were checked against the sources and the supplier heads and found correct. Only
`packages/MappingClassGroupsAndCanonicalRepresentations/README.md` changed. `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no Lean statement, source key
or supplier gap is affected.

## F01 (P1) — applied

Verified. LL22 Corollary 6.1.2 (LL22 lines 1310–1316) and its special case Corollary 1.3.6 (line
252) are false for reducible monodromy. The proof's reduction to irreducible monodromy (§6.4.10,
line 1834) assumes the constituents have equal slopes. The reviewer's witness checks out: for
`O(p) ⊕ O(−p)` with `d`, the residues are `−1, +1`, the weight is `0`, the degrees are `+1, −1`, and
`rk 2 < 2√2`. I found a second counterexample, on the canonical lattice with unitary monodromy:
`L ⊕ O` on a genus-one curve with two points, using the trivial structure or a coarsened one.

Old → new (§5.3): "every refined structure … semistable" → (i) irreducible monodromy, every
refined structure; (ii) flat filtration with irreducible graded pieces, refined induced structures,
equal slopes; (iii) parabolic Deligne extension, `par-deg(F⋆) = 0`. Added: definitions of "parabolic
structure of `∇`" and "refined by", both counterexamples as Checks, the §5.11 route, a Corrections
entry.

Pattern search: the README also cites LL22 Theorem 1.2.12 at §§5.11, 7.6, 8.3 and 10.3, and
LL24 cites it at LL24 lines 369, 377, 1695, 1720 and 1802. All of these use only the canonical
lattice with its full structure and stay true. Nothing else in the README asserts semistability
for an arbitrary lattice or a coarsened structure.

## F02 (P2) — applied

Verified. ArithmeticGaloisRepresentations §1.11, *Reductive quotients over fields and DVRs*, read at
its open head, is stated for an integral affine variety. LanglandsParameterStacks §2.2, also read at
its open head, extends finite generation, closed images, separation of invariant closed subsets and
the unique closed orbit per geometric fibre to arbitrary affine schemes of finite type over a field,
including reducible and nonreduced ones. Its Checks include the trivial action on `k[ε]/(ε²)`.
LanglandsParameterStacks is at merge-order position 81, before this package at 291.

Old → new:
- Scope: ArithmeticGaloisRepresentations §1.11 is kept for closed tuples; LanglandsParameterStacks
  §2.2 is added for general quotients.
- Supplier contracts: new "From TauCetiRoadmap.LanglandsParameterStacks"; the
  ArithmeticGaloisRepresentations contract is narrowed.
- Needs and citations: §1.4, §5.8, §5.10, and the Layer 1 and Layer 5 Dependencies.
- §1.4 Check: `ℂ × ℂ` is not a domain.

No gap was added.

## F03 (P3) — applied

Verified. EG18 Lemma 3.4 (EG18 lines 410–423) takes the direct sum `⊕_j H^j` on the open variety and
`H¹(X̄, j_{!*} A)` on the compactification.

Old → new: "weight-one part of `⊕_j H^j(X̄_s̄, A)` is `H¹(X̄_s̄, j_{!*} A)`" → "with
`j_s : X°_s → X_s`, `H¹(X_s̄, j_{s̄,!*}A) → H¹(X°_s̄, A)` is injective (unshifted convention, as in
§5.9), its image is the weight-one part of `⊕_i H^i(X°_s̄, A)`, and its cokernel is a boundary term
of weights `≥ 2`".

Supporting edits:
- The compactification `j : X° → X` is now named at the start of the route
  (ResolutionOfSingularitiesCharacteristicZero §6.2, added to the Needs line and the contract).
- New Check: the quadratic Kummer sheaf (`0 = 0`) and an elliptic curve minus two points (dimension
  `3` against `2`).

## F04 (P3) — applied

Verified. At `n = 0` the formula gives `B_{−1} = 0`, so `d₀ : ℂ → 0` is not injective, and
truncated subtraction makes `d₀` ill-defined (`t = 0` but `t′ = 1`). The source runs the
construction only for `n ≥ 1` (LL24 lines 891–896 and 918–920).

Old → new (§1.3): `B_n` for `n ≥ 0`; `R_n`, `d_n` and the corrections
`id + C t^n/n` only for `n ≥ 1`, the hypothesis still over `n ≥ 0`; injectivity Check restricted to
`n ≥ 1` with `n = 1, 2` values; new Check: no `d₀`; §8.1 says `n ≥ 0`; Corrections
entry for LL24 §3.2.

## Checks run

- **Elaboration.** `lake env lean packages/MappingClassGroupsAndCanonicalRepresentations/Suggested.lean`,
  run from the content checkout, exited 0. The only messages were three `declaration uses 'sorry'`
  warnings, at lines 160, 175 and 184. No `TauCeti.*` import, so nothing needed building.
- **Signatures.** A scratch copy with `#check @name` for all ten named declarations elaborated, and
  I compared each type with the README:
  - `surfaceRelator`, `surfaceGroup`, `peripheralLoop`, `pureMappingClassAut`,
    `HasFiniteConjugacyOrbitUnder`, `prymStabilizer`, `compactPrymCohomology`: unchanged.
  - `putmanWieland_of_card_lt` keeps `Fintype.card H < g ^ 2`, surjectivity,
    `Γ' ≤ prymStabilizer ϕ`, nonzero `relIndex` and the fixed-class hypothesis.
  - `mcgFinite_finite_image` keeps the orbit predicate and `r ^ 2 < g + 1`.
  - `freeGroup_finite_image` keeps `N = 2g ∨ N = 2g + 1`.

  No binder was lost and nothing changed, since the Lean file is untouched.
- **Dependency direction.** The command exactly as in the brief printed:

  ```text
  depcheck: 236 roadmaps, 2150 edges, 0 problem(s)
  ```

  There are no UPWARD, CYCLE or moved lines. The edge count went from 2149 to 2150 because of the
  new LanglandsParameterStacks edge.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name
  missing anywhere. The earlier `StableCurves.Mbar` lead is gone.
- **Gate failures.** None were listed in the brief.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §5.3 irreducible item | `g=0`; `g=1,n=1`, rank 2; `g=3`, ranks 3 and 4 | Rank 1 only, automatically semistable. A rank-2 HN jump needs `ab ≥ 2` with `a=b=1`, but `ab = 1`, so it is impossible. With `g=3` and rank 3, `max ab = 2 < 4`. Rank 4 gives `4 < 4`, false, so it is excluded. | Consistent with Thm 6.1.1(1) and AM–GM. |
| §5.3 equal-slope item | `O(p)⊕O(−p)`; `O(p)⊕O(p)` with `d`; coarsened `L⊕O`; `k = 1` | Graded slopes: `1, −1` against `µ = 0`, excluded and unstable; `1, 1 = µ`, semistable as a sum of equal-degree line bundles; `−a, 0` against `µ = −a/2`, excluded and unstable. `k = 1` is the irreducible item. | Positive instance on a noncanonical lattice holds; both negative instances are excluded. |
| §5.3 Deligne item, `par-deg F⋆ = 0` | §5.2 character on `ℙ¹∖{0,∞}`; trivial system; residue sign | `−1 + a + (1−a) = 0`; `O`: `0 + 0`; `O(p)` with `d`: residue `−1`, degree `+1 = −(−1)`. | Sign of the residue theorem confirmed. |
| §5.3 induced structures (full) | Sub `F` and quotient `G` with residues `{0, b}` and `{a}` | Induced steps are the generalized eigenspaces with fractional part `≥ λ`, weight `λ`, equal to `∇_F` and `∇_G`. A coarsened structure can give the `b`-line weight `a ≠ b`. | That is why the general item requires refined induced structures. |
| §5.3 Check: `O(p)⊕O(−p)` | Every flat line subbundle | Flat section `(c₁,c₂)` has local coefficients `(c₁z, c₂z⁻¹)`. `c₂ ≠ 0` gives `≅ O(−p)` (degree −1); `c₂ = 0` gives `O(p)` (degree 1). | Slopes `{1, −1}` for every flat filtration. |
| §5.3 Check: coarsened `L⊕O` | Weight `a` deleted at `x₁`; trivial structure | `par-deg L⋆ = −1 + 0 + (1−a) = −a`, `O⋆ = 0`, `µ(E⋆) = −a/2 < 0`. Trivial structure: `deg = −1`, `µ = −1/2 < 0`. | Both refined (first weight `0` at each point), both unstable, `2 < 2√2`. |
| §5.11 route | Uniformizing PVHS, genus `≥ 2` | Hodge line degree `g − 1 > 0`, so its Deligne extension is unstable; rank `2 < 2√(g+1)` makes the deformed Deligne extension semistable, so it is not a PVHS on a nearby curve. | Agrees with the §5.1 Check. |
| §1.3 `d_n` | `n = 0, 1, 2` | `ℂ → 0`, kernel `ℂ`; `a+bt ↦ a+bε`, kernel `0`; `a+bt+ct² ↦ a+bt+ε(b+2ct)`, kernel `0`. Well-definedness: `(t²)′ = 2t ≡ 0` mod `t`. | Positive index needed; restriction made. |
| §5.10 step 4 | Kummer `L_χ` on `𝔾_m`; trivial `A` on `𝔾_m`; `E∖{0,P}` | `H^i(𝔾_m, L_χ) = 0`, `H¹_c = 0`, giving `0 = 0`. `H¹(𝔾_m) = ℚ̄(−1)` has weight 2, weight-one part `0 = H¹(ℙ¹)`. `h¹(E∖2pts) = 3` with weights `1, 1, 2`, weight-one part `2 = h¹(E)`. | Open on the left, compactification on the right. |
| §1.4 with LanglandsParameterStacks §2.2 | `ℤ/2`, `r = 2`; `ℤ`, `r = 2`; trivial `Γ` | `ℂ×ℂ` with `(1,0)(0,1) = 0`, two components kept; unipotent and identity map to the same point; a point. | General supplier needed and cited. |
| ArithmeticGaloisRepresentations closed-tuple contract | Orbit in a closed stable subscheme | A closed subset of a closed subset is closed in the ambient space, and conversely. | No integrality needed. |

## Ownership and overlap

- **No new ownership.** No new target owns an object. The general affine quotient is imported from
  LanglandsParameterStacks §2.2, the only owner found by searching on the object (via
  `roadmaps grep`/`show`). It is earlier in the merge order, so nothing is planned twice and no gap
  is needed.
- **Overlaps lead.** `overlaps.md` lists no open pull request that changes this roadmap and no
  dropped cited id. The five closest roadmaps (MordellLawrenceVenkatesh, TeichmullerGeometry,
  InverseGaloisAndArithmeticFundamentalGroups, GroupActionsOnRiemannSurfaces,
  SheafConvolutionOnAbelianVarieties) own nothing touched by these repairs.
- **Citations checked.** LanglandsParameterStacks §2.2 and ArithmeticGaloisRepresentations §1.11
  were read at their open heads. ResolutionOfSingularitiesCharacteristicZero §6.2 was read on main.

## For the maintainer

- **New edge.** This roadmap now names LanglandsParameterStacks (§2.2) as a supplier. It is an open
  roadmap pull request earlier in the merge order, as ArithmeticGaloisRepresentations already was.
- **Unchanged names.** No Lean name and no section id changed, so other roadmaps citing this one are
  unaffected.
- **Source errors.** Two source errors are now recorded under "Corrections to the sources":
  - LL22 Corollaries 6.1.2 and 1.3.6, false for reducible monodromy, with two rank-two
    counterexamples.
  - LL24 §3.2, where `d_n` needs `n ≥ 1`.

  Every consumer here (Theorem 1.2.12 and its uses in §§5.11, 7.6, 8.3, 10.3) relies only on the
  parabolic Deligne extension, so no downstream statement changes.
- **No suspicious instructions.** Nothing in the review or the fetched roadmap text asked for an
  action outside this job.
