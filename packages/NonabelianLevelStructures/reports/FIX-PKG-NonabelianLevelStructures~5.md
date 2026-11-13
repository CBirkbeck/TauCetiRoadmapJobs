# FIX-PKG-NonabelianLevelStructures~5

Repair of the two findings of `REV-PKG-NonabelianLevelStructures~4`. Both were verified against the sources and the pinned libraries, and both are applied.

## F01 (P3) — applied

Verified. CHEN2024 line 2930 (Proposition 4.6.2, printed pp. 373–374) states that the functor from three-point G-covers with gluing data to precuspidal data is an equivalence. CHEN2024 line 2986 (equation (4.6), p. 375) defines H_(δ,x). Proposition 4.4.3 (line 2740, p. 369) gives only monodromy identities.

Change in `packages/NonabelianLevelStructures/README.md` §1.3: one combined locator → per-claim locators. The datum keeps Definition 4.6.1, p. 373. φ_x gets §4.7, p. 374, and Proposition 4.4.3(e) for the effect of changing x. H_(δ,x) gets equation (4.6), p. 375, with §4.5, p. 371 for the cover version. The equivalence gets Proposition 4.6.2, pp. 373–374, in the paragraph and its API bullet. No formula changed.

Pattern search: the only other equivalence locator is §1.2 (normalization, Theorem 4.4.5), which is correct. §§1.5 and 1.8 cite Proposition 4.5.2, Definition 4.7.1 and Theorem 4.8.4 for the claims they actually support. `design/plan.json` repeats the old locator in its target records, but this job may edit only its `gaps` list, so it was left unchanged.

## F02 (P2) — applied

Verified. The pinned Tau Ceti has the needed carriers:
- `TauCeti.SpecialLinear.coordinateHopfAlgebra` (`TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean`) is 𝒪(SLₙ) over every commutative ring, including the zero ring.
- `TauCeti.SpecialLinear.pointsMulEquiv` identifies its points with `Matrix.SpecialLinearGroup`.
- `TauCeti.ComoduleAlgebra.coinvariants` (`TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean`) is the coaction equalizer.

So the "not statable" entry was false, and a headline that is statable but absent is a defect.

Change: the "not statable" bullet is deleted from the module docstring of `Suggested.lean`, and a `Layer 5` section is added. It has two abbreviations (`SL2Coord`, `SL2PairCoord`), five definitions with real bodies (`evalSL2Pair`, `conjSL2`, `traceCoordinates`, `integralTraceMap`, `IsGL2ConjugationInvariant`) and the headline `integral_trace_coordinates`: injectivity, and range = invariant functions, for every commutative ring R. It also has one proved `example`: the trace coordinates evaluate to (tr A, tr B, tr AB) and are invariant. This pins the factor wiring and the conjugation, and shows the "image ⊆ invariants" side is not vacuous on the generators. The new import is `TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic`.

These follow the reviewer's witness, with these differences:
- `conjSL2` is a direct subtype with a determinant proof.
- The names are descriptive.
- The Prop-valued predicate uses UpperCamelCase.

The invariance predicate quantifies over all R-algebras S in the universe of R. The universal point S = 𝒪(GL₂) ⊗_R 𝒪(SL₂ × SL₂) is in that universe, so the predicate is exactly coaction invariance and not invariance under GL₂(R) alone.

README §5.1 is rewritten to define every new name. It gains API bullets and three new Checks:
- the (2,2,3) → (0,0,1) evaluation, against wiring both coordinates to one factor;
- the zero ring;
- an 𝔽₂ example fixed by the finite group GL₂(𝔽₂) but not a polynomial in the traces, which rules out rational-points invariance.

Base-change compatibility is kept as a consequence, using `TauCeti.SpecialLinear.coordinateHopfAlgebraBaseChangeIso`. Also updated: the Mathlib and Tau Ceti supplier contracts, the §5.1 *Needs:* line, the Layer 5 Dependencies and "How to read the build". gap:integral-rank-two-invariants (LanglandsParameterStacks) is kept: the carriers do not prove the generation theorem.

Ownership: ArithmeticDynamicsPartII §6.1 (open head) covers only finite fields, and LanglandsParameterStacks §3.8 covers only characteristic zero. Nothing on main, in the board packages or at the indexed open heads states the integral three-trace isomorphism (`roadmaps grep` for character variety/scheme, Fricke–Vogt, trace coordinates). Tau Ceti has no trace-invariant theorem. This roadmap stays the owner of the three-trace specialization.

## Checks

- **Elaboration**: ran `lake env lean packages/NonabelianLevelStructures/Suggested.lean` from the content checkout. Exit 0. The only warnings are three `declaration uses 'sorry'`, at lines 111 (`combinatorial_congruence`), 125 (`simple_group_congruence`) and 248 (`integral_trace_coordinates`). The imported Tau Ceti module was already built.
- **Binder audit**: a scratch copy with `#check @name` for all 17 declarations was elaborated once. Every new declaration carries `(R : Type u) [CommRing R]` (or `{S : Type u} [CommRing S]`) in its own signature; no section `variable` is used. `evalSL2Pair` keeps `[Algebra R S]`. `integral_trace_coordinates` elaborates as `∀ (R : Type u_1) [CommRing R], Function.Injective ⇑(integralTraceMap R) ∧ ∀ f, f ∈ (integralTraceMap R).range ↔ IsGL2ConjugationInvariant R f`, which matches README §5.1. The nine existing declarations are unchanged from the signature ledger (Fintype, IsSimpleGroup, nonabelianness, the PSL₂ exclusion and the size bound are all present). Nothing changed as a result.
- **Forbidden constructs**: none. No `set_option`, `lemma`, `#eval`, `#print`, `#synth`, sorry'd data or `True` placeholder. The imports are `import Mathlib` plus one existing Tau Ceti module.
- **README ↔ Lean**: every new Lean name appears backticked in README §5.1, and every backticked name of this roadmap's own is declared.
- **Dependency gate** (`gate --depcheck … --movable`): output `depcheck: 237 roadmaps, 2149 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citation resolver**: two leads, both unchanged from before this round and both false positives:
  - MappingClassGroupsAndCanonicalRepresentations §2.3 exists as the board package `packages/MappingClassGroupsAndCanonicalRepresentations/README.md`, earlier in the merge order.
  - `ArithmeticModuli.Rigidification.vertical_kernel` is a planned declaration of AlgebraicModuliForArithmeticGeometry §5.1, not a claimed pinned lemma.
- **Overlaps**: no open pull request changes this roadmap, and no cited id is dropped.
- **Sources**: no new source was fetched and `sources.toml` is unchanged (CHEN2024 already records Layers 1 and 5). No reference request was needed.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §1.3 locators (F01) | S₃, H=⟨(12)⟩, h=(123); G=1 | Hh={(123),(23)} ≠ hH={(123),(13)}; the singleton datum has 1 α | Formulas unchanged; only the locators move |
| `SL2Coord`, `SL2PairCoord` | zero ring; ℤ; 𝔽₂ | Zero ring: Tau Ceti's quotient is 0 (its docstring includes the zero ring), so the tensor is 0 | Real carriers; no nontriviality assumed |
| `evalSL2Pair` | (I,I); unipotent pair over ℤ | The proved example gives entries M i j, hence traces (2,2,2) and (2,2,3) | Correct factor wiring (left ↦ A, right ↦ B) |
| `conjSL2` | P=diag(2,1) over ℚ, A=[[1,1],[0,1]] | P A P⁻¹ = [[1,2],[0,1]], det 1, trace 2; wrong model P⁻¹AP gives [[1,1/2],[0,1]], also trace 2 | The predicate quantifies over every P, so the orientation is immaterial |
| `traceCoordinates` | unipotent pair over ℤ and 𝔽₂; same-factor wrong model | (2,2,3) and (0,0,1); wrong model (tr A, tr A, tr A²) = (2,2,2) | New Check added |
| `integralTraceMap` | R=0; R=ℤ at x ↦ tr A | 0 → 0; x ↦ 2 at (I,I) | Correct |
| `IsGL2ConjugationInvariant` | trace coordinates; 𝔽₂ orbit product N of a₁₂; universal point | Traces invariant (proved: tr(PAP⁻¹)=tr A, (PAP⁻¹)(PBP⁻¹)=P AB P⁻¹). N is GL₂(𝔽₂)-fixed and nonzero (each factor is a nonzero linear form; the ideal (ad−bc−1) has no nonzero element of degree ≤1). N vanishes where a₁₂=0, whose trace triples (s+s⁻¹, p+w, sp+c+s⁻¹w) with q=1, r=pw−1 cover 𝔽̄₂³, so N is not a polynomial in the traces | Excludes the rational-points model; new Check added. The universal algebra is in Type u, so the predicate equals the coaction equalizer |
| `integral_trace_coordinates` | R=0; ℤ; 𝔽₂; non-conjugate pairs (I,I), (U,I); base change ℤ→𝔽₂ | R=0: 0=0, injective and range = all = invariants. ℤ and 𝔽₂: injectivity follows from the trace map hitting all of 𝔸³ over ℂ and over 𝔽̄₂ (same family). (I,I) and (U,I) both give (2,2,2) but are not conjugate; the statement is about functions, not orbits. Base change: S⊗ℤ[x,y,z] = 𝔽₂[x,y,z] → 𝒪_𝔽₂ is the 𝔽₂ trace map | Matches CHEN2024 line 3786 (Theorem 5.2.1, "any ring R", including the identity of invariants with R[A,B,C]) |
| Base-change consequence | R → S arbitrary | S⊗_R(R[x,y,z]) → 𝒪_S sends 1⊗tr_R to tr_S (`TauCeti.GeneralLinear.coordinateHopfAlgebraBaseChangeIso_hom_genericMatrix`, `TauCeti.SpecialLinear.coordinateHopfAlgebraBaseChangeIso_hom_tmul_coordinateMap`), so it is the S trace map, an isomorphism onto the invariants by the theorem over S | Stated as a consequence in README §5.1 and the Lean docstring |

## For the maintainer

- New names in `TauCetiRoadmap.NonabelianLevelStructures`: `SL2Coord`, `SL2PairCoord`, `evalSL2Pair`, `conjSL2`, `traceCoordinates`, `integralTraceMap`, `IsGL2ConjugationInvariant`, `integral_trace_coordinates`. No existing name was renamed or deleted, so no other roadmap's citation is affected.
- Tau Ceti's `Algebra/AlgebraicGroup/Product.lean` already has a product-points equivalence built from `Algebra.TensorProduct.productMap`. `evalSL2Pair` uses the same map directly, as a one-line definition.
- The supplier gap gap:integral-rank-two-invariants (LanglandsParameterStacks §2.1) is unchanged, in both the README and `design/plan.json`.
- `design/plan.json` still carries the old §1.3 locator string in its target records. This job may edit only the plan's `gaps` list, so that string was left as it is.
- Ownership against open pull requests was checked with the roadmaps index tools at the indexed heads, as described under F02.
