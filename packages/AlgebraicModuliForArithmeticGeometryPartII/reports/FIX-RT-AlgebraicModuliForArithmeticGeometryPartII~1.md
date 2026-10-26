# FIX-RT-AlgebraicModuliForArithmeticGeometryPartII~1

Two red-team passes, a (3 findings, F01–F03, first three sections) and b (6 findings, F01–F06, next six sections); below, a.Fnn and b.Fnn name finding Fnn of pass a or b. Where they overlap (a.F01 = b.F01; a.F02 and the first half of b.F02) the finding was settled once and both sections below say so.

## F01 (P2) — applied

Review a, finding F01.

Merged with b.F01. Old: the docstring said fibre-graph descent (§4.8) and rationality of image points (§4.9) "lack that pairing and the proper Hilbert algebraic space". New: `fibreComponentGraph_descends_of_constantNumericalClasses` and `residueField_eq_of_reducible_geometricFibre` are stated in Layer 4 of `Suggested.lean`, the docstring keeps only negative-curve and label descent as not statable, and README §§4.8–4.9 plus "How to read the build" name both theorems.

Changed from b's draft: b put the closure in `S` on the left only. When `a` is not closed (the generic point of a fibre-type target) the fibre is not closed in `S`, so that equation fails. Both sides now take the closure in `S`. This still determines `e`, because a closed subset T of a subspace satisfies T = closure_S(T) ∩ subspace. Also, `pullback f ā` needed the type ascription `: Scheme.{u}` to elaborate.

## F02 (P2) — applied

Review a, finding F02.

Old: the docstring listed projective contraction descent (§3.7) as unstatable for lack of relative global generation, the section algebra and relative Proj. New: a definition `IsProjectiveOver` (a closed immersion over K into `Proj` of `MvPolynomial.homogeneousSubmodule (Fin (n+1)) K`, with the structure-map equation) and the theorem `contraction_descends_of_constantNumericalClasses`, stated with the same two-square encoding as §3.6. README §3.7 has the definition with 4 API bullets and 3 Checks. The section-ring dictionary stays in the docstring as not statable. Hypotheses checked against SCH23 line 262 (X proper over k, Num constant) and line 260 (contraction definition). Projectivity of Y descends by STACKS 0BDG, Varieties line 1320.

## F03 (P2) — applied

Review a, finding F03.

Verified: SchemeAndStackFoundations §5.2 (README lines 6653–6666) gives proper pushforward with residue-degree weights and `deg f_* = deg`. §5.3 (lines 6701–6712) gives `proper_pushforward`, with no smoothness assumption. Iterating gives π_*(c₁(π*L)^n ∩ [V′]) = c₁(L)^n ∩ [V]. Old: the gap `proper-bigness-birational-comparison` asked for "((π*L)^n·V′) = (L^n·V)". New: that clause is deleted from both the README and `design/plan.json`, and the §1.6 route derives the identity from §§5.2–5.3.

## F01 (P2) — applied

Review b, finding F01.

Same finding as a.F01; settled there, including the change to the closure equation.

## F02 (P3) — applied differently

Review b, finding F02.

The §3.7 half is superseded by a.F02: §3.7 is now stated, so the docstring no longer explains why it is missing. The Keel half is applied as asked. KEE99 line 677 states Lemma 2.16 for projective schemes over the algebraic closure of a finite field. The docstring of `numericallyTrivial_torsion_of_algebraic_finiteField` now says this, and says the extension is by spreading out to a finite subfield and by the proper finite-type τ-component.

## F03 (P3) — applied

Review b, finding F03.

Verified at the Tau Ceti pin: `TauCeti/LinearAlgebra/SesquilinearForm/NumericalQuotient/Basic.lean` lines 66, 90, 96, 138, 141, 273 and 317. Also `TauCeti/.../NumericalType/Topology.lean`, where `intersectionGraph` is a def and `intersectionGraph_connected` a lemma (lines 46 and 65). Note that `intersectionGraph_connected` derives connectedness from the structure's `connected` field; it does not prove fibre connectedness. The "From Tau Ceti" section now has both groups. The §1.4 route uses `RightNumericalQuotient`, `LeftNumericalQuotient` and `numericalPairing_nondegenerate`; the left radical is Pic^τ ⊗ ℝ by §1.3. The §4.6 route cites the graph, with the caveat about the `connected` field.

## F04 (P3) — applied

Review b, finding F04.

Verified: SchemeAndStackFoundations README lines 5470–5474 state `stein_factorization` for a proper morphism of Noetherian schemes. In §3.1, the geometric-connectedness bullet, the factorization bullet and the route sentence now apply it over an affine open cover of the locally Noetherian Y. The preimage of a Noetherian affine open is proper over it, hence Noetherian, and the factorizations glue by uniqueness. The other uses of §4.9 (§2.2 over Spec k, §3.2 over a Noetherian S) were already Noetherian.

## F05 (P3) — applied

Review b, finding F05.

WIT22 line 319 defines relative nefness, and "numerically trivial" occurs only at lines 1524–1526, so the citation is deleted from §0.4. It stays in §§1.5, 1.6 and 3.3, where lines 319–323 do define nef, big and semiample. In §0.3 the KLE05 locator is now Proposition 6.12 (line 2724), plus Theorem 6.3 (line 2498) with Remark 6.14 (line 2754) for the geometric case, and the README says the arbitrary-extension equivalence is proved here.

## F06 (P3) — applied

Review b, finding F06.

Checked at the sibling heads. EnriquesSurfacesAndIntegralNonexistence README lines 80 and 89 have `gap:numerical-contraction-descent` (addressed to SchemeAndStackFoundations Part II) and `gap:picard-flatness-betti`. K3SurfacesAndSymplecticBoundedness README line 98 has `gap:surface-arithmetic-quotient`. WeilConjectures README lines 1420 and 1432 and NeronModelsAndSemistableAbelianVarietiesPartII README line 4072 come from `roadmaps grep`. "Downstream consumers" now maps each request to the sections here, and says the family version and the Picard-flatness request are not targets here. §3.3 gains the AbundanceStatement Layer 5 bullet. Pointing those roadmaps' requests at this one is for those roadmaps to do; no edit here can settle it.

## Checks

- Elaboration: `lake env lean packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean` from the content checkout gives 10 `declaration uses sorry` warnings and no errors. The imports are unchanged.
- `#check @name` for all 18 declarations in one scratch copy, compared with the README. No binder was lost. The new theorems keep `[IsProper s] [Smooth s] [IsProper z] [IsAlgClosed Ω]`, the hypotheses `hsurf hconst hnum hf hfz hfib` (plus `hred`), and `IsProjectiveOver` on both sides of §3.7. Before this round there were 14 declarations; it adds 4: `IsProjectiveOver`, `contraction_descends_of_constantNumericalClasses`, `fibreComponentGraph_descends_of_constantNumericalClasses` and `residueField_eq_of_reducible_geometricFibre`.
- Library names: `AlgebraicGeometry.Proj`, `AlgebraicGeometry.Proj.toSpecZero` (Basic.lean:151), `MvPolynomial.gradedAlgebra` (Homogeneous.lean:613, an `abbrev`, so it is used through a local `letI`) and `AlgebraicGeometry.Scheme.fromSpecResidueField` (ResidueField.lean:237) checked with `#check` at the pin. The Tau Ceti names were checked by reading the pinned files, because their object files are not built and the brief allows building only modules that `Suggested.lean` imports.
- Dependency check output:

```text
depcheck: 56 roadmaps, 645 edges, 0 problem(s)
```

  Exit 0, with no UPWARD, CYCLE or moved line.
- `roadmaps resolve` finds no cross-roadmap citations or Lean names missing.

## Adversarial pass on new or changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| `IsProjectiveOver` | P^n_K; Spec K; ∅; 𝔸¹_K; Spec ℂ over ℝ; Spec K over K=ℚ(t₁,t₂,…) via the shift σ | identity immersion; n=0, Proj K[T₀]=Spec K; empty immersion; 𝔸¹ is not proper, so no closed immersion; closed point V(T₀²+T₁²) of P¹_ℝ (n=1), while n=0 fails; not of finite type via σ, so it fails, but would pass without the y-equation | true, true, true, false, true, false; recorded as Checks |
| `contraction_descends_of_constantNumericalClasses` | K=k; X=∅; X=Spec(k′) with k′/k separable quadratic; P¹_ℂ over ℝ; P¹×P¹ with pr₁ | v an isomorphism and f = v⁻¹∘f′; Γ(Ȳ)=0 forces Ȳ=∅=Y; X_K is two points, every contraction is an isomorphism, Y=X; swap on ℤ², so hnum fails (excluded); Y=P¹ | holds in each admissible case |
| `fibreComponentGraph_descends_…` | blow-up of a k-point of a smooth fibre; generic point of a fibre-type Z; Z=Spec k; birational, generic point; conic bundle over ℝ; S=∅ | 2 vertices and 1 edge on both sides, e the identity; geometric generic fibre irreducible (κ(a) algebraically closed in the function field), 1=1 vertex, both closures equal S; fibre has dim 2, so hfib fails; fibre has dim 0, so hfib fails; hnum fails (2→1 vertices); Γ(∅)=0≠k, so hconst fails | true or excluded; the closure-only-on-the-left draft fails at the generic point (closure S ≠ non-closed fibre) and was corrected |
| `residueField_eq_of_reducible_geometricFibre` | blow-up fibre over a rational point; smooth fibre over a degree-2 point; generic point | κ(a)=k; geometric fibre irreducible, so hred fails; irreducible, so hred fails | the descended D is geometrically integral with H⁰(D,O)=k, maps onto the closed point a, and κ(a) ⊂ k |
| Gap `proper-bigness-birational-comparison` (trimmed) | Bl_p P² → P², L=O(1); n=0 | the top intersection 1=1 now comes from the §5.3 projection formula; the section inequality is unchanged | trimmed contract still covers the route |
| §1.4 route via the Tau Ceti quotient | P¹×P¹ over k; id_S | left radical 0 and N₁=ℝ² with matrix [[0,1],[1,0]] nondegenerate; Z₁=0 and both quotients 0 | consistent |
| §3.1 over a locally Noetherian Y | Y=⊔_ℕ Spec k (not Noetherian), f=id | each affine piece is Noetherian; fibres are points | clause valid |

## Ownership

`IsProjectiveOver` is new. Mathlib and Tau Ceti at the pins have no projectivity predicate (searched for `IsProjective`, `ProjectiveSpace` and `homogeneousSubmodule` uses). The three new theorems are SCH23 Theorems 1.3 and 2.1. The later EnriquesSurfacesAndIntegralNonexistence only requests them through a gap, so this roadmap, earlier in the merge order, owns them. No declaration name here matches another roadmap's fully qualified name. Ownership against open work was checked only against the given sibling checkouts and the `roadmaps grep` index.

## For the maintainer

- New names other roadmaps may cite: `IsProjectiveOver`, `contraction_descends_of_constantNumericalClasses`, `fibreComponentGraph_descends_of_constantNumericalClasses` and `residueField_eq_of_reducible_geometricFibre`.
- The gap `proper-bigness-birational-comparison` is narrower; its supplier, AlgebraicModuliForArithmeticGeometry §1.6, now only needs the section inequality.
- The requests in EnriquesSurfacesAndIntegralNonexistence (`gap:numerical-contraction-descent`) and K3SurfacesAndSymplecticBoundedness (`gap:surface-arithmetic-quotient`) are addressed to a SchemeAndStackFoundations Part II that does not exist. The same content is §§0.3, 1.1, 1.3, 3.7 and 4.8–4.10 here; redirecting those requests is up to those roadmaps.
- No source texts are missing; no `needs-references.toml` was written.

## Gate failures repaired

- Report headings: each finding section now uses the review's own finding id (`## F01 (P2) — applied`, …). The three sections of pass a come first, then the six of pass b, and the first line of each section names its pass.
- `gap:numerical-contraction-descent`, `gap:picard-flatness-betti`, `gap:surface-arithmetic-quotient`: these are supplier contracts declared by EnriquesSurfacesAndIntegralNonexistence and K3SurfacesAndSymplecticBoundedness. They were quoted in this README's "Downstream consumers" paragraph. This package does not consume them, and numerical-contraction-descent is addressed to a SchemeAndStackFoundations Part II, which does not exist. Declaring them in `design/plan.json` would invent supplier gaps this package does not have, so they were not added there. Instead, the Downstream paragraph now names each one without the `gap:` prefix ("its supplier contract named numerical-contraction-descent", and likewise for the others). Every remaining `gap:` token in the README (6) has its entry in `plan.json` `gaps` (6), and `plan.json` is unchanged. `Suggested.lean` is untouched, so the elaboration result above stands. The dependency check after this edit gives `depcheck: 56 roadmaps, 645 edges, 0 problem(s)` and exits 0.
