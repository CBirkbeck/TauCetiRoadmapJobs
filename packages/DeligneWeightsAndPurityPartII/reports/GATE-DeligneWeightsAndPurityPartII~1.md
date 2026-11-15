# GATE-DeligneWeightsAndPurityPartII~1: answers to human review

One unanswered comment, one point (H01). Commit `7268ab89` on top of `71dd669`, not pushed. Only
`TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md` changed (+10 lines); `Suggested.lean` is unchanged.

## H01 (mycaule) — applied

New secondary `## Provenance` section after the References (README lines 1002–1010). It cites
AxiomMath/Weil at commit `27cdb2049be62ee2911429b47f54774078450e32`, Apache-2.0, as a related
repository that is not a dependency. It says that its `Weil/AlgebraicGeometry/EtaleCohomology/Trace`
directory overlaps this roadmap only in finite-field inputs that Layers 0 and 1 already take from
DeligneWeightsAndPurity: `Weil.satisfiesWeilEstimate` is the eigenvalue assertion of DWP §7.15(ii),
used in §§0.10 and 1.1, and
`Stacks.EtaleCohomology.isAlgebraic_and_norm_eq_of_forall_isCharpolyPureOfWeight` is the case
E = `ℚ_ℓ` of DWP §0.6, used in §1.1. The section also says that the directory's
`ArisesByGoodReduction` (a reduction of a complex variety, in the Freitag–Kiehl IV.1 sense) is not
§0.10's proper smooth model over `O_k`, and that none of its 30 files treats local fields, inertia,
monodromy, tilting, rigid-analytic neighbourhoods or toric varieties, so no target of this roadmap
has a counterpart there.

Evidence, read at that commit (repository README, the directory listing of 30 files, and the files
`DeligneWeilConjecture.lean`, `WeilEstimateFromPurityAllEmbeddings.lean`,
`FrobeniusPoincarePairing.lean`, `RationalCohomologyLevels.lean`, `DeligneConjectureConclusions.lean`,
`BettiNumberGoodReduction.lean`, `ConstantSystemLocalFactor.lean`,
`RepresentationSheafRestrictionIsogeny.lean`, `CanonicalFrobeniusIso.lean`, `Defs/.../RationalCohomologyFrobenius.lean`
and `Definitions.lean`):

- `satisfiesWeilEstimate (B) [Field k] [Fintype k] [Fact ℓ.Prime] [Fact (ℓ ≠ ringChar k)] (S) (f : S ⟶ Spec k) [IsProper f] [Smooth f] : SatisfiesWeilEstimate B S f ℓ`.
  Here `SatisfiesWeilEstimate` says that every root μ ∈ `AlgebraicClosure ℚ_[ℓ]` of the characteristic
  polynomial of `rationalFrobenius ν` is algebraic over ℚ with `‖ι μ‖ = (#k)^(ν/2)` for every
  `ι : ℚ⟮μ⟯ →+* ℂ`. The Frobenius is documented as geometric Frobenius `π_X^*` on
  `H^ν(X_k̄, ℚ_ℓ)` (proper, so the identity compactification), and the theorem takes no extra hypothesis.
- The all-embeddings theorem lives in namespace `Stacks.EtaleCohomology`, for a finite-dimensional
  `ℚ_[ℓ]`-space V and `L` an algebraic closure of `ℚ_[ℓ]`.
- `ArisesByGoodReduction S₀ Y` asks for a domain R of finite type over ℤ, a smooth projective
  `X → Spec R` and ring maps `R → ℂ`, `R → κ` whose base changes are Y and S₀.
- The repository's README reports Lean `v4.34.0-rc2`, a dependency on AxiomMath/Stacks, and the
  Apache-2.0 licence. This repository's pin is `v4.36.0-rc2`.

The wording follows the provenance precedent on main (ModularCurves, "Provenance: existing Lean
work and source audit", which cites the same commit of AxiomMath/Weil), as the README's "Porting
existing work" asks: cite the existing work, in a clearly secondary section. No target, supplier
contract or ownership changed. The overlapping objects are owned by DeligneWeightsAndPurity
(§§0.6, 7.15), which this roadmap already imports.

## Build

`lake build TauCetiRoadmap.DeligneWeightsAndPurityPartII.Suggested`: `Build completed successfully (18239 jobs).`

`Suggested.lean` declares nothing; its docstring explains why no headline is statable at the pins. No
`#check` scratch file was needed, and no elaborated type changed.

## Gate

    gate DeligneWeightsAndPurityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency direction (`gate --depcheck … --movable --pr 1760`):

    depcheck: 238 roadmaps, 2243 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Adversarial pass on the added statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `satisfiesWeilEstimate` paraphrase: geometric-Frobenius eigenvalues on `H^ν(S_k̄,ℚ_ℓ)` have absolute value `q^(ν/2)` | ℙ¹ over 𝔽_q, ν = 2; arithmetic-Frobenius convention | geometric: eigenvalue q, `|q| = q^(2/2)` ✓; arithmetic: q⁻¹ ≠ q¹ ✗ | Geometric is forced by the stated `q^(ν/2)` and matches the file's docstring | "with q elements" fixed to name k |
| Same, empty S and ν > 2 dim S | S = ∅; ν = 3 on ℙ¹ | cohomology 0, no eigenvalues; vacuous on both sides | Holds | none |
| "eigenvalue assertion of DWP §7.15(ii)" | DWP §7.15(ii): integral ℓ-independent `det(1 − Ft)` **and** Weil q-number eigenvalues of weight i | the Lean theorem gives only the eigenvalue part | First draft said "constant-coefficient case of §7.15(ii)", but (ii) already has constant coefficients and also asserts integrality | Reworded to "eigenvalue assertion"; dropped an unverified claim about `CharpolyIntegrality.lean` |
| DWP Weil-number notion vs `SatisfiesWeilEstimate` | DWP §0.1: algebraic, and `|σ α| = q^(n/2)` for all `σ : ℚ(α) → ℂ` | `SatisfiesWeilEstimate`: algebraic, and `‖ι μ‖ = q^(ν/2)` for all `ι : ℚ⟮μ⟯ → ℂ` | Identical; neither includes integrality, as in this roadmap's Conventions | none |
| All-embeddings file = DWP §0.6 | DWP §0.6: E of char 0 with `#E ≤ 𝔠`, q > 1; file: E = `ℚ_ℓ`, any natural Q | E = `ℚ_ℓ` satisfies `#E = 𝔠`; Q = 0, 1 lie outside DWP's q > 1 but inside the file | The file is the case E = `ℚ_ℓ` (and also allows Q ≤ 1) | "coefficient field" → "the case E = `ℚ_ℓ`" |
| `ArisesByGoodReduction` ≠ §0.10 model | Tate curve over `ℚ_p`; Fermat curve over 𝔽_p from ℂ | Tate curve: no smooth proper `ℤ_p` model, and §0.10 does not apply; Fermat: arises by FK good reduction over `ℤ[1/e]`, with no local field involved | The two notions are different | Restated as base changes along `R → κ` and `R → ℂ` (the file's definition) instead of "fibres" |
| "None of the 30 files concerns a variety over a local field, inertia, monodromy, tilting, rigid neighbourhoods, toric" | all 30 file names; 9 files read | e.g. `ConstantSystemLocalFactor`: closed points over 𝔽_q; `RepresentationSheafRestrictionIsogeny`: separated finite type over 𝔽_q; `CanonicalFrobeniusIso`: proper over 𝔽_q | `ℚ_ℓ` coefficients are a local field, so "a local field" became "a variety over a local field" | Reworded |
| "built on Lean `v4.34.0-rc2`, not on the pins" | repository README; `lean-toolchain` here | `v4.34.0-rc2` vs `v4.36.0-rc2` | Different | none |

## Ownership, citations, sources

- The repair adds no construction, target, supplier or `*Needs:*` line, so no ownership question
  arises. The objects in the overlap stay with DeligneWeightsAndPurity §§0.6 and 7.15, checked at
  the head of its open pull request: §0.6 "Algebraicity and Weil purity from ι-purity at every ι"
  and §7.15 "Purity for proper smooth varieties … over a finite field". DeligneWeightsAndPurity does
  not itself cite AxiomMath/Weil. That roadmap's text is outside this job's scope.
- AxiomMath/Weil is a Lean repository cited as provenance, not a mathematical source. No
  `sources.toml` entry is added, and `needs-references.toml` is not written. No source text was copied.
- The pre-existing `roadmaps resolve` leads (`IsWeilNumber`, `IsPureEnd`, `adicFunctoriality`,
  `finiteFanScheme`) are supplier-roadmap names in supplier contracts, untouched by this repair.
  `readme-ids-missing=0`.
- Nothing in the review text was an instruction to act outside this job.
