# FIX-RT-SurfaceGroupCharacterVarieties~1

Repair of red-team round 1 (passes a and b) of `packages/SurfaceGroupCharacterVarieties`. The two
reviews do not overlap: five findings, each settled once below.

## RT-SurfaceGroupCharacterVarieties~1a/F01 (P2) — applied

Verified at the pinned Tau Ceti: `TauCeti.ComoduleAlgebra` (`Algebra/Bialgebra/ComoduleAlgebra.lean`
line 88, a right comodule algebra), `coinvariants` (line 136), `range_le_coinvariants_iff` (line 171),
`finiteType_coinvariants` (`.../ComoduleAlgebra/LinearlyReductive.lean` line 148, with hypothesis
`Coalgebra.IsLinearlyReductive.{u,v,u} k H`, which is exactly what
`reductiveCommHopfAlgProperty.linearlyReductive` returns in characteristic zero).

Changed: the supplier contract's "no affine quotient" → "no representation algebra … with its
conjugation coaction", and the four pinned names were added there and to the Scope. §7.2 defines
`Hom//G` as `Spec` of `coinvariants`, citing `finiteType_coinvariants` and
`range_le_coinvariants_iff`. §4.1 names the right coaction `ρ · g = g⁻¹ρg`. Two Checks were added,
and the `Suggested.lean` docstring was narrowed.

Where this differs from the suggested repair: the scheme-level factorization stays a target, because
the pin has only its algebra form. The new Checks:
- §4.1, the direction of the coaction: `g⁻¹ρg = [[a, λ⁻¹b],[λc, d]]` at `g = diag(λ, 1)`;
- §7.2, `𝔾_m` acting on `𝔸¹`: `x^n ↦ x^n ⊗ t^n`, so the coinvariants are `k`.

## RT-SurfaceGroupCharacterVarieties~1a/F02 (P3) — applied

Verified: BCGGO2024 lines 2714–2718 define `Fuch(PSL₂ℝ)` as all classes of discrete faithful
representations, two connected components, matching Teichmüller space "with either of its
orientations". §7.4 Check: "a subset `Fuch` … in bijection with `Teich(Σ_g)` (lines 2714–2726)" →
"a subset `Fuch⁺` …". A new sentence says `Fuch⁺` is one of the two components of the source's
`Fuch(PSL₂ℝ)` (lines 2714–2718), which is two copies of `Teich(Σ_g)`. Layer 7 Examples: "The Fuchsian
locus of §7.4" → "The locus `Fuch⁺` of §7.4". The old wording also clashed with the source's own
"Fuchsian locus" (line 2726, the image `ι_e(Fuch(S_R))`). No other occurrence: line 182's "Fuchsian
group of the signature" and Downstream consumers' "Fuchsian and Hitchin loci" refer to other objects.

## RT-SurfaceGroupCharacterVarieties~1b/F01 (P2) — applied

Verified: the elaborated conclusion had no `T2Space` conjunct. An object that is initial among
Hausdorff targets need not be Hausdorff itself: for a non-Hausdorff `X`, every map to a Hausdorff `Z`
still factors through `X`'s Hausdorff quotient, so the old statement did not imply what its docstring
claims. Changed: the conclusion `∃ q, …` → `T2Space (CharacterVariety Γ ⊤) ∧ ∃ q, …`, with the four
clauses unchanged. The declaration docstring now opens "`𝒳(Γ, G(ℂ))` is Hausdorff, and …". README
§7.2 now reads "that `𝒳(Γ, G(ℂ))` is Hausdorff and the closed-orbit map …". The module docstring's
§7.2 bullet now names the Hausdorff clause.

## RT-SurfaceGroupCharacterVarieties~1b/F02 (P3) — applied

The four definitions (`symmetricPart`, `IsRealReductiveLinearGroup`, `minimalVectors`, `linearOrbit`)
and every §5.4 API bullet hold without finite dimension (`exp 0 = 1`; a closed cone cut out by the
continuous `v ↦ ⟨Av, v⟩`), so the README was widened rather than adding unused instance arguments.
§5.4's opening "Let `V` be a real finite-dimensional inner product space" → "Let `V` be a real inner
product space …; the four definitions … are made … for every real inner product space; every theorem
… and every Check … takes `V` finite-dimensional".

## RT-SurfaceGroupCharacterVarieties~1b/F03 (P3) — applied

Recomputed: `diag(t, t⁻¹) A diag(t⁻¹, t) = [[1, t²],[0, 1]]`, of squared norm `2 + t⁴`, and
`‖1‖² = tr(1) = 2`. "which tends to the norm `2` of the identity" → "as `t → 0` it tends to the
identity, of squared norm `tr(1) = 2`, … while as `t → ∞` the squared norm grows without bound". The
pattern search found one other limit witness, §6.5's `diag(t, t⁻¹)`-conjugation. It already says
`t → 0` and is correct: `[[1, t²],[0,1]] → 1`, and `diag(2, 1/2)` commutes. The one other
squared-norm value, §5.3's `2` for `(1, 1)`, is also correct.

## Checks

**Elaboration.** `lake env lean packages/SurfaceGroupCharacterVarieties/Suggested.lean` (run from the
content checkout): exit 0. The output is 13 warnings "declaration uses `sorry`", at lines 96, 114,
124, 145, 204, 212, 220, 230, 240, 274, 324, 339 and 362, and no error. No `TauCeti.*` module needed
building; all four imported object files were present.

**Elaborated signatures.** A scratch copy of `Suggested.lean` with `#check @name` for all 25
declarations was elaborated once. Each elaborated type was compared with its README statement:
- `characterVariety_universalHausdorffQuotient` now carries the `T2Space` conjunct;
- the four Layer 5 definitions have no `[FiniteDimensional ℝ V]`, which now matches README §5.4, and
  all five Layer 5 theorems carry it;
- every other type is unchanged and matches its README statement.

**Dependency check.**

    depcheck: 237 roadmaps, 2241 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name
missing. It did not check names outside TauCetiRoadmap. The four new Tau Ceti names were checked by
hand at the pinned files and lines above.

## Adversarial pass (changed or added statements)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `T2Space (CharacterVariety Γ ⊤)` (§7.2 headline) | `Γ = 1`; `Γ = ℤ`, `G = GL₁`; `Γ = ℤ`, `G = SL₂`; `G` trivial | point; `ℂ^×` (`Ad` trivial, all reductive, conjugation trivial); semisimple classes, trace a continuous bijection onto `ℂ`, with continuous inverse because a semisimple class of trace near `2` meets every neighbourhood of `1`; point | true; not implied by the other clauses (initial among Hausdorff targets ⇏ Hausdorff) |
| §4.1 coaction `(δf)(ρ, g) = f(g⁻¹ρg)` | `Γ = ℤ`, `GL₂`, `g = diag(λ, 1)`; right-action law; `G` commutative; `Γ = 1` | `[[a, λ⁻¹b],[λc, d]]`, so `x₁₂ ↦ λ⁻¹x₁₂` (left action would give `λx₁₂`); `(ρ·g)·h = (gh)⁻¹ρ(gh) = ρ·(gh)`, matching Tau Ceti's right-comodule convention (module docstring: right action `X × G → X`); `δf = f ⊗ 1`; `1 ↦ 1 ⊗ 1` | consistent with `TauCeti.ComoduleAlgebra` |
| §7.2 Check `𝔾_m` on `𝔸¹` | `k` infinite; `k = 𝔽₂` | `x^n ↦ x^n ⊗ t^n`, coinvariant iff `n = 0`, over every `k`; over `𝔽₂` the `k`-point orbits `{0}`, `{1}` are both closed, so the first draft's "closure" clause failed and the Check is stated on `k̄`-points, where `k̄^×` is dense | corrected before submission |
| §7.2 finite generation in char 0 via `finiteType_coinvariants` | universes; char `p` | `linearlyReductive : linearlyReductiveCommHopfAlgProperty k H.obj`, definitionally `IsLinearlyReductive.{u,u,u}`, the lemma's hypothesis with `v = u`; char `p` stays with LanglandsParameterStacks §2.2 (`𝔽₂` swap Check: not linearly reductive) | consistent |
| `Fuch⁺` | `g = 2`; reflection conjugate | Euler numbers `−2` and `+2`; union of the two is BCGGO2024's two-component `Fuch(PSL₂ℝ)` | consistent with source |
| §5.4 definitions on every inner product space | `V = 0`; incomplete `V`; `exp 0` | all defs trivial on `V = 0`; `NormedSpace.exp 0 = 1` so `0 ∈ 𝔭` always; where the exponential series diverges `exp` takes its junk value `0`, never a unit for `V ≠ 0`, so such `A` are excluded from `𝔭` | API bullets hold without finite dimension; theorems keep the binder |
| §5.4 conventions witness | `t = 1`, `t → 0`, `t → ∞` | `[[1,1],[0,1]]`, squared norm `3`; `→ 1`, squared norm `2`; squared norm `→ ∞` | correct |

## Ownership

No new construction was added. The invariant subalgebra and its finite generation are Tau Ceti's at
the pin and are cited. The conjugation comodule-algebra structure is part of §4.1's existing
representation-scheme target, which this roadmap owns: the reviews' ownership search (main, the open
heads and the pins) found no second owner, and grepping the pinned Tau Ceti finds a conjugation
comodule algebra only for diagonalizable groups
(`Algebra/AlgebraicGroup/DiagonalizableGroup/Centralizer/Smooth.lean`). No declaration name of
`Suggested.lean` changed.

## For the maintainer

- `characterVariety_universalHausdorffQuotient` keeps its name. Its conclusion gained a leading
  `T2Space` conjunct. No roadmap on main or at an open head cites the name or this roadmap.
- No supplier gap was added. `design/plan.json`, `sources.toml` and `metadata.toml` are unchanged:
  the BCGGO2024 manifest locator (lines 2706–2726) already covers the narrowed citation of lines
  2714–2718.
- Nothing in the reviews or fetched text was treated as an instruction. No suspicious passage was
  found.
