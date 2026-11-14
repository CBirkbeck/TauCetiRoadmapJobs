# FIX-RT-CohomologyOfGroups~2: red-team round 2 repaired

Three findings (all P3): two applied, one applied differently. `packages/CohomologyOfGroups/README.md`
and the module docstring of `packages/CohomologyOfGroups/Suggested.lean` changed; no Lean
declaration, `metadata.toml`, `sources.toml` or `design/plan.json` changed.

## RT-CohomologyOfGroups~2a/F01 (P3) — applied

README 5.3, Check on the finiteness hypothesis: "`Σ_{m ≤ r} f_m ⊗ g_m` gives a form of rank at most
`r`" → "a sum `Σ_{m < r} f_m ⊗ g_m` of `r` pure tensors gives a form of rank at most `r`", and the
identity's restriction to `⟨e₀, …, e_r⟩` now reads "rank `r + 1 > r`". Witness verified: at `r = 0`
the old sum has one term and rank `1`.

## RT-CohomologyOfGroups~2a/F02 (P3) — applied

`Suggested.lean` module docstring, list of headlines not statable at the pins: new bullet after
the Künneth bullet. It names the Pontryagin comparisons of README 5.4 (torsion-free `A` and any
`k`; any `A` and a `ℚ`-algebra `k`). It also says what is missing: the Pontryagin product on
`⊕ₙ Hₙ(A, k)` and the algebra map, built from 5.1's cross product. Mathlib's `ExteriorAlgebra`
exists. The wording is my own.

## RT-CohomologyOfGroups~2b/F01 (P3) — applied differently

README 8.3 gets a route. It names `Rep.projective_of_isZero_res` and
`Rep.isZero_res_tensor_of_projective`, `δ_bijective_of_isZero_X₂`,
`shortExact_map_tensorLeft_of_leftInverse` and `Submodule.free_of_isPrincipalIdealRing`. It
also names `cup_δ_of_leftInverse` and `cup_right_unit`. The same names are in *Needs:* and in "From
Tau Ceti". A new Check covers `M = ℤ/2`. The suggested route used `cup_δ_of_flat`, which this
`M` does not satisfy.

Why the suggested repair was changed: the reviewer's route sentence makes the connecting maps
"equal up to sign to cup product with `e` by `cup_δ_of_flat`". At the pin,
`TauCeti.TateCohomology.cup_δ_of_flat` (`TateCohomology/Cup/Delta.lean:242`) carries
`[Module.Flat k M.V]`. For the reviewer's own witness `M = ℤ/2` over `ℤ` that instance fails, so
the lemma does not apply. The pieces of the sequence, `0 → Z_j → C_j → Z_{j−1} → 0`, split over
`ℤ` because every `Z_j` is free. So the right lemma is `TauCeti.TateCohomology.cup_δ_of_leftInverse`
(`Cup/Delta.lean:188`), which needs only a `k`-linear retraction and puts no condition on `M`. With
`x ∪ 1 = x` (`Cup/Unit.lean:39`), the composite of the `n + 1` tensored connecting maps is
`x ↦ (−1)^{i(n+1)} x ∪ e` on `Ĥⁱ(G, M)`. The finding itself is right: `Rep.isZero_res_of_projective`
gives `Ĥ(C_j) = 0` only, and the route needs `Ĥ(M ⊗ C_j) = 0` for every `M`.
`Rep.isZero_res_tensor_of_projective` (`TateCohomology/Projective/Basic.lean:104`) gives that once
`C_j` is `ℤ[G]`-projective (`Rep.projective_of_isZero_res`, `:232`, with `k = ℤ`).

Pattern repaired elsewhere:
- **README 8.1.** The `ℚ/ℤ`-duality route did its dimension shifting "with `cup_δ_of_flat` and
  `δ_cup_of_leftInverse`" for an arbitrary `M : Rep ℤ G`. The same flatness gap applies (for
  `M = ℤ/2` neither `M` nor `M^∨` is flat). The route now shifts along the `ℤ`-split sequence
  `0 → M″ → Ind_1^G M → M → 0` and its dual, with `cup_δ_of_leftInverse` and
  `δ_cup_of_leftInverse`. `cup_δ_of_flat` stays where it applies: the integral form, where `M` is
  free and so flat. *Needs:* of 8.1 gains `cup_δ_of_leftInverse` and `Rep.dimensionShiftDown`.
- **"From Tau Ceti" cup row.** It now lists `cup_right_unit` and `cup_δ_of_leftInverse`, with the
  hypotheses of each connecting-map rule.
- **Nakayama–Rim declarations.** `Rep.isZero_res_of_projective` and `Rep.projective_of_isZero_res`
  are pinned Tau Ceti declarations. They were cited only as "ClassFieldTheory Layer 0". They now
  have a "From Tau Ceti" row. The ClassFieldTheory row says that the declarations Layer 0 records
  are consumed from Tau Ceti directly.
- **Layer 8 Dependencies.** It now names the Nakayama–Rim theorem.

## Checks run

- **Elaboration.** `lake env lean packages/CohomologyOfGroups/Suggested.lean`, run from the
  content checkout: exit 0. The output is 14 warnings "declaration uses `sorry`", one per theorem,
  at lines 130, 138, 200, 216, 245, 273, 297, 337, 396, 410, 430, 446, 460 and 480. There are no
  errors and no other messages. No `TauCeti.*` module needed building.
- **Signatures.** I wrote one scratch file: a copy of `Suggested.lean` with `#check @name` for all
  23 declarations (9 `def`, 14 `theorem`). I elaborated it once (exit 0). After whitespace
  normalisation, its 23 elaborated types are identical to the job's signature listing. Only a
  docstring changed in the Lean file. No binder was lost, and nothing changed for any README
  statement.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 244 roadmaps, 2206 edges, 0
  problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on the README): no unresolved cross-roadmap citations
  and no unresolved Lean names. The tool did not check names outside TauCetiRoadmap. I checked each
  name I added at the pinned Tau Ceti and Mathlib:
  - `Rep.isZero_res_tensor_of_projective`, `Rep.isZero_res_of_projective` and
    `Rep.projective_of_isZero_res`: `TateCohomology/Projective/Basic.lean:104,123,232`.
  - `TauCeti.TateCohomology.δ_bijective_of_isZero_X₂`: `TateCohomology/HomologySequence.lean:142`.
  - `Rep.shortExact_map_tensorLeft_of_leftInverse`: `RepresentationTheory/Rep/TensorShortExact.lean:130`.
  - `Submodule.free_of_isPrincipalIdealRing`: `LinearAlgebra/FreeModule/PID.lean:42`.
  - `TauCeti.TateCohomology.cup_δ_of_leftInverse`: `Cup/Delta.lean:188`.
  - `TauCeti.TateCohomology.cup_right_unit`: `Cup/Unit.lean:39`.
  - `Rep.dimensionShiftDown`: `RepresentationTheory/Induction/DimensionShift.lean:156`. This is
    Tau Ceti, so 8.1 lists it under Tau Ceti.
  - Mathlib `ExteriorAlgebra`: `LinearAlgebra/ExteriorAlgebra/Basic.lean:60`.
- **Gate failures.** None were listed for this round.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| 5.3 Check: `r` pure tensors give rank `≤ r` | `r = 0`; `r = 1`; `r = 2` against the identity on `⟨e₀, e₁, e₂⟩` | empty sum = 0, rank 0; `f₀⊗g₀` rank ≤ 1; two tensors rank ≤ 2 < 3 = rank of the restricted identity | holds; the restriction of a rank-≤`r` form has rank ≤ `r` < `r + 1`, so the identity form is not in the image |
| 5.3 Check: image = forms of finite rank | finite-rank form `B` with `V → W^*` image spanned by `g₁, …, g_s` | `B(a, b) = Σ fᵢ(a) gᵢ(b)` with `fᵢ` the coordinates: `s` terms | both inclusions hold |
| Docstring: torsion-free comparison, every `k` | `A = ℤ²`, `k = ℤ/4`; `A = ℤ`, `k = ℤ` | `Λ_k(k²)` ranks `1, 2, 1, 0`; `H_*(ℤ², ℤ/4) = k, k², k, 0`; `H_*(ℤ) = ℤ, ℤ, 0` = `Λ(ℤ)` | agrees with README 5.4 |
| Docstring: rational comparison | `A = C₂`, `k = ℚ`; `A = ℤ² × C₂`, `k = ℚ[x, y]` | `A ⊗ ℚ = 0`, `Λ = ℚ` in degree 0, `H_*(C₂, ℚ) = ℚ, 0, 0`; both sides `k, k², k, 0` | agrees |
| Docstring: negative control (neither hypothesis) | `A = C₂`, `k = ℤ` | `Λ³(C₂) = 0`, `H₃(C₂, ℤ) = ℤ/2` | excluded by the stated hypotheses, as it must be |
| 8.3: `Ĥ(M ⊗ C_j) = 0` for every `M` | `G = ℤ/2`, `C₀ = ℤG`, `M = ℤ`, `M = ℤ/2` | `ℤ ⊗ ℤG = ℤG` projective; `ℤ/2 ⊗ ℤG = 𝔽₂[G]` killed by 2, not projective, induced from `1`, `Ĥ = 0` | needs the tensor lemma with `P = ℤG`, as the route now says |
| 8.3: splitting over `ℤ` | `Z_{−1} = ℤ`; `Z_j ⊂ C_j` free abelian; trivial group, `m = 1` sequence `0 → ℤ → ℤ → ℤ → ℤ → 0` | quotients free ⇒ retractions exist; trivial group: every `Ĥ` is `0` | `cup_δ_of_leftInverse` applies for every `M` |
| 8.3: sign `(−1)^{i(n+1)}` | `n = 0`, `i = 0, 1`; `n = 1`, `i = 1` | `x ∪ δy = (−1)^i δ(x ∪ y)` applied `n + 1` times: `+1, −1`; `(−1)^2 = +1` | sign of a composite of bijections, irrelevant to bijectivity |
| 8.3 new Check (`G = ℤ/2`, `n = 0`, `M = ℤ/2`) | `Ĥⁱ(C₂, 𝔽₂)` for `i = −1, 0, 1` | `ker N / I = 𝔽₂/0 = 𝔽₂`; `𝔽₂/N𝔽₂ = 𝔽₂/0 = 𝔽₂`; period 2; `ℤ/2 ⊗ ℤ_sgn = ℤ/2` trivial | `δ : 𝔽₂ → 𝔽₂` bijective (middle term acyclic) |
| 8.3 existing Check, `M = ℤ`, `n = 0` | `Ĥ⁰(C₂, ℤ) → Ĥ¹(C₂, ℤ_sgn)` | `ℤ/2 → ker(N on ℤ_sgn)/(t−1)ℤ_sgn = ℤ/2ℤ` | bijective, unchanged |
| 8.1: ℚ/ℤ dimension shift with arbitrary `M` | `M = ℤ/2`, `G = ℤ/2` | `M` and `M^∨ = Hom(ℤ/2, ℚ/ℤ) = ℤ/2` both not flat; `Ind_1^G M → M` has the section `m ↦ 1 ⊗ m`; `(Ind_1^G M)^∨ ≅ Coind_1^G M^∨`, so `Ĥ = 0` | `cup_δ_of_flat` cannot drive it, the split-sequence lemmas can; route changed |
| 8.1: integral form keeps `cup_δ_of_flat` | `M = ℤ` (free), `0 → ℤ → ℚ → ℚ/ℤ → 0` | `M` flat, so `M ⊗` the non-split sequence stays exact | correct use; kept |
| Contract row, Nakayama–Rim | `ℤ` as `k`: domain, char 0, every `pℤ` maximal; `ℤ` trivial over `C₂`: `Ĥ⁰ = ℤ/2 ≠ 0` | converse hypothesis fails for trivial `ℤ`, which is not `ℤ[C₂]`-projective | row's hypotheses match the pin (`[Finite G] [IsDomain k] [CharZero k]`, projective over `k`) |
| Contract row, `δ_bijective_of_isZero_X₂` | `0 → ℤ_sgn → ℤC₂ → ℤ → 0` | middle `Ĥⁿ = Ĥⁿ⁺¹ = 0` | `Ĥⁿ(ℤ) ≅ Ĥⁿ⁺¹(ℤ_sgn)`; matches the pin's hypotheses `h₀`, `h₁` |

## Other notes

- **8.2.** While checking 2a/F02 I looked for other headlines missing from both the stated list
  and the not-statable list. 8.2 (a `p`-group whose abelian subgroups are cyclic is cyclic or
  generalised quaternion) is not missing: it is the equivalence of the third and fourth clauses of
  the stated `tfae_periodic_cohomology` and `tfae_primary_periodic_cohomology`.
- **2.3 and 3.2.** These spectral sequences are supporting layers of the end theorems, and the
  docstring already lists the end theorem that needs them (Hochschild–Serre). No other bullet was
  added.

## For the maintainer

- **Names.** No Lean name of this roadmap changed, and no README id, section or target number
  changed. Other roadmaps' citations are unaffected.
- **Suppliers.** No supplier was added or moved. The only new consumed items are pinned Tau Ceti
  declarations. The ClassFieldTheory Layer 0 citation stays for the convention on cohomological
  triviality.
- **Ownership.** No construction, carrier or comparison was added: the changes are routes, a
  Check, contract rows and a docstring bullet. Ownership against open pull requests is therefore
  unchanged and was not re-searched.
- **Sources.** No new source was cited and no text was requested; there is no
  `needs-references.toml`.
- **Untrusted text.** Neither review contained a suspicious instruction.
