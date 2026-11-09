# Review of ReductiveGroups (pull request #1808 at a96d197)

**Verdict:** needs changes

The gate fails at this head: `build` (5 lines), `statement-hygiene` (1) and `outside-folder` (2). Every gate failure appears below as a finding (R01, R08, R09).

## R01 (P1) — Suggested.lean does not elaborate at the pins

**Location.** `TauCetiRoadmap/ReductiveGroups/Suggested.lean` lines 112, 116 and 119 (`def geometricOrbit`, `def orbitClosure`, `def orbitBoundary`), and line 240: "`g⁻¹ * TauCeti.AlgHom.mapValue (H := H) F g`". `README.md` line 1546 repeats "using `TauCeti.AlgHom.mapValue`".

**Claim.** The acceptance module fails to compile, so `lang_surjective` is not stated at all. Every companion file imports this module, directly or through `IntegralRationalTargets`/`SignedADETargets`, so the whole folder fails to build.

**Witness.** `lake env lean` on the file gives four errors. Lines 112, 116 and 119 report "failed to compile definition, consider marking it as 'noncomputable' because it depends on 'Spec'". Line 240 reports "Unknown identifier `TauCeti.AlgHom.mapValue`". The pinned declaration is the root-namespace `AlgHom.mapValue` (`TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:143`, inside `namespace AlgHom`, no `TauCeti` prefix).

**Repair.** Mark the three definitions `noncomputable`. Replace `TauCeti.AlgHom.mapValue` with `AlgHom.mapValue` in Suggested.lean line 240 and README line 1546. Tested: a copy with exactly these four edits elaborates with the twelve `sorry` warnings and nothing else. If R07 is applied, the three definitions are deleted and only the line-240 fix remains.

## R02 (P2) — The supplier contract misstates the pinned Tau Ceti, and four proved theorem families are planned as targets

**Location.** `README.md` lines 181–183: "`Borel/Conjugation.lean` proves conjugacy of Borel subgroups only under the hypothesis … the unconditional theorem is Layer 7's target." Line 188: "the characteristic-zero converse is Layer 6's target". Lines 1124–1127 (Layer 6 target), 1336–1338 (6B target), 704–716 (3A headlines) and 1363–1367 (Layer 7 headline). `Suggested.lean` lines 39–46 say Layer 6B's comparison map is not a pinned carrier.

**Claim.** At the pinned Tau Ceti, each of these is already a theorem, under weaker hypotheses than the roadmap states:
- **Layer 3A.1–3A.4.** `TauCeti.SchemeAction.orbit`, `orbitClosure` and `orbitBoundary` (`AlgebraicGeometry/GroupAction/Orbit/Basic.lean:49,62,65`). `isLocallyClosed_orbit` and `topologicalKrullDim_orbitBoundary_lt` (`GroupAction/LocallyClosed.lean:177,213`). `orbitScheme`, `orbitι` with its `IsImmersion` instance, `range_orbitι`, and `IsReduced (orbitScheme G x)` under `[IsReduced G.left]` (`GroupAction/Orbit/Scheme.lean`). `exists_isClosed_orbit_subset_orbitClosure` and `exists_isClosed_orbit` (`GroupAction/ClosedOrbit.lean:150,178`). These need no smoothness, affineness or separatedness.
- **Layer 6, characteristic-zero converse.** `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive` and `reductiveCommHopfAlgProperty_iff_linearlyReductive` (`Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean:96,118`).
- **Layer 6B, Matsushima.** `TauCeti.HopfIdeal.fppfHomogeneousQuotientToCoinvariantsPoints` is the comparison map from `G/N` to the fppf points of `Spec O(G)^N`. `isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive` proves it is an isomorphism in characteristic zero for every reductive closed subgroup (`Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Coinvariants.lean:111,255`). The same file proves it for linearly reductive subgroups over any field.
- **Layer 7, Borel conjugacy.** `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (`Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.lean:133`) is unconditional. Its docstring says the ambient group "need not be smooth, reduced, or connected".

**Witness.** The probes are recorded under R07. The Matsushima statement `IsIso (I.fppfHomogeneousQuotientToCoinvariantsPoints (H := H.obj))`, for `I` with reductive quotient, elaborates against the pin and closes by the pinned lemma.

**Repair.**
- Move all four families into `From Tau Ceti` with these exact names and files.
- Delete them as targets and headlines, keeping the Checks of 3A.1 and Layer 6 as consumer tests.
- In 6B, keep only what the pin does not give: the reduction from "reductive identity component" to linear reductivity (Milne 2017, Corollary 22.43, p. 478), and the stated base changes.
- Rewrite lines 181–183 and 188.
- Remove the 6B bullet and the 3A/6/7 "Stated here" clauses from the Suggested docstring.

## R03 (P2) — A statable headline is absent: conjugacy of maximal tori

**Location.** `README.md` lines 1368–1369: "Prove that any two maximal tori are conjugate (Milne, Theorem 17.10, p. 354)". Neither `Suggested.lean` nor its docstring mentions it.

**Claim.** Once Borel conjugacy is a library theorem (R02), maximal-torus conjugacy is the remaining Layer 7 headline. Every carrier exists at the pin.

**Witness.** The pin has `TauCeti.HopfIdeal.IsMaximalTorus` (`Algebra/AlgebraicGroup/Torus/Maximal.lean:50`). It proves `exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean:149`) only under the extra hypothesis that every diagonalizable subgroup conjugates into a given torus.

**Repair.** State it. This form elaborates at the pins:

```lean
theorem exists_conjugate_eq_of_isMaximalTorus {k : Type v} [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k) (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj)
    {I J : TauCeti.HopfIdeal k H}
    (hI : TauCeti.HopfIdeal.IsMaximalTorus k H.obj I)
    (hJ : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J) :
    ∃ g : WithConv (H →ₐ[k] k), J = I.conjugate g := by
  sorry
```

Negative control for the README: over ℝ, the diagonal torus and `SO₂` in `SL₂` are not conjugate by `SL₂(ℝ)`. This is the existing Check at line 1422, and the `IsAlgClosed` binder excludes it.

## R04 (P2) — Lang's theorem has two owners, and the claimed consumers state the object themselves

**Location.** `README.md` lines 15–16: "Layer 7a owns Lang's theorem for the `q`-Frobenius". Lines 26–27: "ReductiveGroupsPartII RG2.3.7 states Lang's theorem again … a consumer of Layer 7a". Lines 3676–3677 and 28–30 (IntegralHeckeAndGaloisDeterminants §0.7 "is a consumer").

**Claim.** The ownership move is half done. After this pull request merges, main has two owners of the same theorem with conflicting single-owner claims, and two Lean statements of it.

**Witness.**
- ReductiveGroupsPartII on main, `README.md` lines 61–62: "RG2.3 is the single owner in Tau Ceti of Lang's theorem for connected smooth groups over finite fields".
- RG2.3.7 (line 5204) states it as `Lang.lang_surjective` (`Suggested.lean:212`). Its *Needs* line is "ReductiveGroups layer 3", not Layer 7a.
- IntegralHeckeAndGaloisDeterminants §0.7 at #1689 states "Rational cohomology of a flat affine group scheme" as its own target: enough injectives and the cofree resolution, without citing Layer 1.1.

**Repair.** In this pull request, or in a companion named in the merge-order paragraph, revise ReductiveGroupsPartII:
- RG2.3: replace the single-owner sentence with "consumes ReductiveGroups Layer 7a".
- RG2.3.7: cite Layer 7a for (a)–(c), drop `Lang.lang_surjective` from its Suggested.lean, and keep the pro-algebraic Lang theorem as its own extension.
- Add an old → new line for the dropped name.

Name #1689 in the merge-order paragraph and record there that its §0.7 rational-cohomology block becomes a citation of Layer 1.1. ReductiveGroups is on main and earlier in the supply direction, so it is the right owner; the defect is the second owner. The direction itself is sound: the dependency check reports no cycle.

## R05 (P2) — Affine descent is attributed to ModularCurves §0E, which at this head disclaims it

**Location.** `README.md` lines 36–37: "ModularCurves §§0E–0F supply effective affine descent". Lines 289–290: "Sections 0E–0F supply affine descent". Also lines 364–368 and 389 (Layer 0), and 2912–2913 and 2922 (Layer 9D: "ModularCurves §0E for the sheaf, torsor and effective affine descent operations").

**Claim.** This is a supplier cited for a statement it no longer makes. This pull request itself moved affine descent to the foundations roadmap.

**Witness.** `TauCetiRoadmap/ModularCurves/README.md` line 491–492 (0E, this head): effective faithfully flat descent of affine schemes, finite locally free schemes and closed subschemes "is SchemeAndStackFoundations §1.1's". `SchemeAndStackFoundations/README.md` §1.1 (lines 2224–2233) now states *affine_fpqc_descent*.

**Repair.** Cite SchemeAndStackFoundations §1.1 for effective affine, finite locally free and closed-subscheme descent in all six places. Keep ModularCurves §0F for finite-locally-free Weil restriction (0F lines 519–521 match). Cite ModularCurves §0E only where descent of group objects or homomorphisms on an already-descended scheme is used. Update the `From TauCetiRoadmap.ModularCurves` paragraph accordingly.

## R06 (P2) — The seven companion `.lean` files carry sorry'd data and are an orphaned API catalogue

**Location.**
- `CoverLiftTargets.lean` lines 13–17: `def isometryGroup … one_mem' := by sorry`.
- `SpectralWeylTargets.lean` line 58: `noncomputable def centerHomeomorph … := sorry`. Also `planeBraidEquiv` and `matrixSpectrum` `:= sorry`.
- `sorry` counts per file: SignedADETargets 41, FoldingADETargets 39, IntegralRationalTargets 18, OrbitGeometryTargets 18, CoverLiftTargets 23, SpectralWeylTargets 26.
- `BruhatCoordinateTargets.lean` lines 1–5 import only `Mathlib.*` submodules.

**Claim.** Sorry'd data is a blocking defect under the Principles. These files also break the Lean form rules: no single `import Mathlib`, and submodule imports. The README no longer refers to any of them. They duplicate objects of Suggested.lean and the pin:
- `Spectral.OrderedPlane`, `planePermutationAction` and `permutation_extension_nonsplit` duplicate `PlaneBraidAcceptance`.
- `OrbitGeometry.Points` and `orbitMorphism` duplicate `OrbitAcceptance`.
- `ADECoverLifts.isometryGroup` duplicates the pinned `TauCeti.BilinForm.isometryGroup`, which README line 39 says to use.

**Witness.** `command grep -c sorry` on each file gives the counts above. `command grep -n 'Targets' README.md` returns nothing.

**Repair.** Delete the seven files. The README already carries their targets as prose and Checks, and Suggested.lean is the acceptance test. Delete `CoverLiftTargets.lean` together with the `CoverLifts` block of Suggested.lean (R07), since it is that block's only client.

## R07 (P3) — Padding in Suggested.lean

**Location.** `Suggested.lean`:
- lines 101–171: `OrbitAcceptance`, with `Points`, `orbitMorphism`, `geometricOrbit`, `orbitClosure`, `orbitBoundary`, `orbitDimension` and five theorems;
- line 187: `linearlyReductive_of_reductive`;
- line 220: `exists_conjugate_eq_of_isBorelOverAlgClosed`;
- lines 325–356: `CoverLifts.liftSubgroup`, `LiftGroup`, `projection`.

**Claim.** The first eight declarations restate pinned theorems (R02). The `CoverLifts` definitions support no theorem in the file; the docstring says their kernel theorem is a README target.

**Witness.** Probes on a scratch copy, elaborated at the pins:
- `geometricOrbit G X x = TauCeti.SchemeAction.orbit G x` closes by `comp_orbitMap`, `Hom.smul_def` and `rfl`.
- `orbit_locallyClosed`, `boundary_dimension_lt`, `exists_closed_orbit_in_closure` and `exists_closed_orbit` each close by the pinned lemma after that rewrite and two `QuasiCompact.compactSpace_of_compactSpace` haves.
- `exists_reduced_orbit_model` is the anonymous constructor on `orbitScheme`/`orbitι`/`range_orbitι`, given `IsReduced G.left`, which follows from smoothness via `Smooth.geometricallyReduced`.
- `linearlyReductive_of_reductive` is `h.linearlyReductive`.
- Borel conjugacy is `(hI.exists_conjugate_eq hJ).imp fun _ h => h.symm`.

**Repair.** Delete these declarations from Suggested.lean. The README keeps the statements as consumed library facts (R02), and keeps the cover-lift group and its kernel theorem as targets.

## R08 (P3) — `plane_braid` concludes a bare `Nonempty` of an isomorphism (gate: statement-hygiene)

**Location.** `Suggested.lean` lines 303–305: "`Nonempty (FundamentalGroup (UnorderedPlane n) (unorderedBase n) ≃* TauCeti.BraidGroup n)`".

**Claim.** The gate rule asks for a canonical map with `IsIso`, or an existence statement named `nonempty_*`. README 11A wants the generator-characterized isomorphism. The docstring says the half-twist loops it needs are not pinned.

**Witness.** Gate `statement-hygiene` line 304.

**Repair.** Rename it `nonempty_fundamentalGroup_mulEquiv_braidGroup` and update README line 3344. The generator-characterized form stays a README target until half-twist paths exist. The statement is otherwise sound: n = 0 and 1 give two trivial groups, and n = 2 gives π₁(ℂ × ℂ*) = ℤ = B₂.

## R09 (P3) — Edits outside this pull request's folders (gate: outside-folder)

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this package and supplies its own…") and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 ("adapters consumed by HeegaardFloer and consumed by DGFloer").

**Claim.** Neither folder is named as this pull request's own.

**Witness.** Gate `outside-folder` (2). Open #1854 lists ArithmeticDirichletSeries and SymplecticGeometry among its own roadmaps.

**Repair.** Drop both hunks from this pull request. They belong to #1854. Alternatively, name both roadmaps in the title and description.

## R10 (P3) — Open pull requests that change ReductiveGroups have no stated order

**Location.** The pull request description, merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → this pull request".

**Claim.** Four other open pull requests change this roadmap's files, and their heads conflict with this one. No order is stated for them.

**Witness.** `scratch/overlaps.md`: #1332 and #1676 (@kim-em) conflict in `ReductiveGroups/README.md`, `Suggested.lean`, `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`. #1797 conflicts in `ReductiveGroups/README.md` and `Suggested.lean`. #1854 also changes ReductiveGroups.

**Repair.** State in the merge-order paragraph which of #1332, #1676, #1797 and #1854 rebases on which. Do not restate their changes here.

## R11 (P3) — Layer 1.1's points/comodule dictionary is narrowed below its source

**Location.** `README.md` line 449: "For an affine group scheme G over R with flat coordinate Hopf algebra, extend Layer 1's action/comodule dictionary to arbitrary R-modules."

**Claim.** The equivalence between G-modules and O(G)-comodules needs no flatness.

**Witness.** `jantzen-1985` lines 1127–1136 (§2.8, printed p. 38) prove the two categories equivalent for any k-group scheme. Flatness is a standing hypothesis only "from 3.2 on" (line 1487).

**Repair.** Drop "with flat coordinate Hopf algebra" from this paragraph. Keep flatness where it enters: enough injectives (§3.9), cohomology and induction.

## R12 (P3) — The manifest records a different edition of Milne than the README cites

**Location.** `README.md` line 3694 cites "J. S. Milne, *Algebraic Groups* (2017)" at `iAG2017.pdf` with 2017 numbering. The manifest entry `milne-iag` records `iAG200.pdf` (v2.00, 2015) with locator "Prop. 27.54" for Layer 7a.

**Claim.** The two versions are numbered differently. The manifest text does not contain the README's locators under the cited numbers.

**Witness.** In v2.00, Borel conjugacy is (b) of a Chapter 18 theorem (`milne-iag` line 12774) and Lang's theorem is 27.54–27.56 (line 20282). In the 2017 author-page copy, Theorem 17.9 is on p. 354 and Theorem 17.96/Corollary 17.97 are on p. 383.

**Repair.** The worker should record the 2017 author-page copy under the same key `milne-iag`, with a `version_note`, and keep the README's 2017 numbering. All the 2017 locators checked here are correct (see Verified sound).

## R13 (P3) — A Mathlib item sits under `From Tau Ceti`

**Location.** `README.md` lines 128–132: "Mathlib `AlgebraicGeometry.Group.Affine` provides `hopfSpec.fullyFaithful` and `essImage_hopfSpec` … Mathlib `AlgebraicGeometry.Group.Smooth` provides `AlgebraicGeometry.smooth_of_grpObj`".

**Claim.** It repeats lines 114–116 of `From Mathlib`, under the wrong supplier heading.

**Witness.** README lines 114–116.

**Repair.** Delete lines 128–132. Move the `smooth_of_grpObj` sentence into `From Mathlib`.

## Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `orbit_locallyClosed` (3A) | `𝔾_m` on ℙ¹, x=[1:1] | orbit ℙ¹∖{0,∞}: open, hence locally closed; pinned `isLocallyClosed_orbit` gives the same after `geometricOrbit = orbit` | true; restates pin | R02, R07 |
| `exists_reduced_orbit_model` | trivial group on Spec k[ε]/(ε²) | orbit = one point; model Spec k, reduced; closed immersion into Spec k[ε]; range = the point | true; pin `orbitScheme` | R02, R07 |
| `boundary_dimension_lt` | `𝔾_m` on 𝔸¹, x=1; constant S₃ on itself | dim(𝔸¹∖0)=1 > dim{0}=0; boundary ∅ has `topologicalKrullDim` ⊥ < 0 | true; restates pin | R02, R07 |
| `exists_closed_orbit_in_closure` | `𝔾_m` on ℙ¹, x=[1:1] | closure ℙ¹ ⊇ closed orbits {0}, {∞} | true; restates pin | R02, R07 |
| `exists_closed_orbit` | X=∅; X=𝔸¹ under `𝔾_m` | ∅: hypothesis `Nonempty (Points X)` false (excluded); 𝔸¹: y=0, orbit {0} closed | true; restates pin | R02, R07 |
| `linearlyReductive_of_reductive` | GL₂ in char 0; SL₂ in char p | char 0: every rep semisimple; char p: R_p ⊃ ⟨x^p,y^p⟩ with no complement, excluded by `CharZero` | true; = `h.linearlyReductive` | R02, R07 |
| `exists_levi_complement` | G=𝔾_a; G=B₂⊂GL₂; G=GL₂; SL₂(W₂) in char p | 𝔾_a: O(G)^U=k, J=(t), k→k[t]/(t) bijective; B₂: O(B)^U=k[a^±,d^±]→O(T) bijective; GL₂: U=1, J=0; char p: no Levi (McNinch (3.2.1)), excluded by `CharZero` | true; `hsm` redundant in char 0 (note only) | none |
| `exists_conjugate_eq_of_isBorelOverAlgClosed` | SL₂ over k̄, B⁺ and B⁻ | w=[[0,1],[−1,0]]: w[[a,b],[0,d]]w⁻¹=[[d,0],[−b,a]], lower triangular; non-closed k: hypothesis false | true; restates pin | R02, R07 |
| `lang_surjective` | 𝔾_a/𝔽₂, θ∈𝔽₄; 𝔾_m/𝔽₂; constant C₂; trivial group; transcendental a∈K | θ²−θ=1; θ⁻¹θ²=θ; C₂: every Lang value 1 misses the other point, excluded by geometric connectedness; trivial: 1 value; T^q−T−a has a root in K | true after R01 fix | R01 |
| Lang route (7a) | f(g)=xF(g)x⁻¹ | f^m=Int(y)F^m, y=xF(x)⋯F^{m−1}(x); f^{mr}=F^{mr} since F^m(y)=y; matches Milne 2017 Thm 17.96 proof | sound | none |
| Fixed-coset lifting (7a) | H=F̄_qˣ, q odd, J={±1}, a^{q−1}=−1 | Lang map of J: (±1)^{q−1}=1, misses −1; σ(a)=a·a^{q−1}=−a; neither ±a fixed | Check correct; hypothesis needed | none |
| SL₂ count (7a) | q arbitrary | q(q²−1)/(q(q−1)) = q+1 = #ℙ¹(F_q) | consistent | none |
| `exists_coordinatePresentation` | n=0,1,2; ℤ/4 | n=0: det(∅)−1=0, ℤ/(0)=ℤ=O(SL₀); n=1: ℤ[x]/(x−1)=ℤ; n=2: ad−bc−1; [[1,1],[0,1]]⁻¹=[[1,3],[0,1]] mod 4 | true | none |
| `plane_braid` | n=0,1,2 | n=0,1: π₁=1 and B₀=B₁=1 (`eq_one_of_le_one`); n=2: Conf₂(ℂ)≃ℂ×ℂ*, π₁=ℤ=B₂ | true; `Nonempty` form | R08 |
| `permutation_nonsplit` | n=2; n=1 | n=2: section m with 2m=0 forces m=0, even ≠ odd; n=1: S₁ trivial and a section exists, so `2 ≤ n` is needed | true | none |
| `CoverLifts.liftSubgroup` | E=ℤˣ×C₂ split, ρ, A trivial | kernel of projection = {e↦e·χ(q(e))}, 2 elements = Hom(C₂,ℤˣ) | laws proved; no headline uses it | R07 |
| maximal-torus conjugacy (proposed) | SL₂ over ℝ vs ℂ | diagonal torus vs SO₂: not SL₂(ℝ)-conjugate (unbounded vs compact points); excluded by `IsAlgClosed`; over ℂ conjugate | statement elaborates | R03 |
| 6B Matsushima Checks | GL₂/O₂, g=diag(2,1), h=swap | gh=[[0,2],[1,0]]: (gh)(gh)ᵗ=diag(4,1)=ggᵗ; (gh)ᵗ(gh)=diag(1,4) | Checks correct; theorem pinned | R02 |
| 1.1 dictionary Check | weight-one line of 𝔾_m over ℤ at 2∈ℚˣ | 1↦1⊗t ↦ 1⊗2 = 2; 2 then 3 gives 6 | correct | R11 (generality) |
| 1.1 Hochschild Checks | H=ℤ[t^±], weight one; trivial group, M=ℤ/2 | d⁰(1)=1⊗(t−1); d¹(1⊗(t−1)) = t⊗(t−1) − (t⊗t−1⊗1) + (t−1)⊗1 = 0; differentials 0,id,0, so H⁰=ℤ/2 and Hⁿ=0 for n>0 | correct | none |
| 1.1 induction Checks | C₂⊂S₃, trivial coefficients; q: ℤ→ℤ[t^±] | rank 3 = index; (C₂(123))⁻¹=(132)C₂; Ind = invariants: weight one gives 0, trivial gives ℤ | correct | none |
| 1.1 cofree acyclic, not injective | ℤ over trivial group | 2ℤ→ℤ, 2↦1 would need 1↦1/2 | correct | none |
| 8.1 Checks | SL₂ over 𝔽₂; SL₂ vs PGL₂; rank-0 torus | dim 3, centre μ₂ of length 2; α=2ϖ vs α generating X; r=0 gives trivial group | correct | none |
| 8.2 Checks | x_α(t), x_α(2t); Spec(k×k) with B⁺/B⁻ | tangents E₁₂ and 2E₁₂; signs (+,−) are not a constant Φ⁺ (Conrad Rem. 6.1.2) | correct | none |
| 7C rank-one identity | a=b=1 | x_α(1)x_{−α}(1)=[[2,1],[1,1]]; x_{−α}(½)α∨(2)x_α(½)=[[1,0],[½,1]]·[[2,1],[0,½]]=[[2,1],[1,1]] | correct | none |
| 7C root subsets | A₂, w=s₁s₂ | w⁻¹=s₂s₁: α₁↦−(α₁+α₂), α₂↦α₁, α₁+α₂↦−α₂, so A_w={α₂} | correct | none |
| 9A cocycle | A₂, α₁<α₂ | ε(α₁+α₂,−α₁−α₂)=(−1)^{1·1·(−1)}=−1; [ê,f̂]=(−1)^{B(a,b)} since ε(a,b)ε(b,a) ≡ B(a,b) mod 2 | correct | none |
| 10C Checks | char 3, n=4; char 2, n=2 | dim L(4)=(1+1)(1+1)=4, socle {x⁴,x³y,xy³,y⁴}; g·xy=cd x²+(ad+bc)xy+ab y² spans R₂ | correct | none |
| 9E Check | Sp₄, char 2, τ²=Frob₂ | σ=τ^{2m+1}: σ²=(τ²)^{2m+1}=Frob_{2^{2m+1}} | correct | none |
| Layer 3 Hopf-ideal Check | (tⁿ−1) in k[t^±] | Δ(tⁿ−1)=(tⁿ−1)⊗tⁿ+1⊗(tⁿ−1); S(tⁿ−1)=−t⁻ⁿ(tⁿ−1); ε(t−2)=−1 | correct | none |
| Layer 0 Check | GL₂(ℤ) | [[1,1],[0,1]][[1,0],[1,1]]=[[2,1],[1,1]] vs [[1,1],[1,2]] | correct | none |
| Layer 4 Check | g=[[2,1],[0,2]] over ℚ; k=𝔽₂(a) | g_s g_u = 2I·[[1,½],[0,1]] = g; det g=4=0 in char 2; χ_g = x²−a = (x−√a)² | correct | none |

## Verified sound

- **Gate and depcheck.** Reran the build by `lake env lean` on Suggested.lean and reproduced all four errors. A copy with the four R01 edits elaborates with 12 `sorry` warnings only. The dependency check prints `depcheck: 238 roadmaps, 2324 edges, 0 problem(s)`: no UPWARD or CYCLE line.
- **Signatures.** Ran `#check @name` for all 14 headline and definition declarations. Every hypothesis of the README statements is in the elaborated types: `CharZero`, `Finite k`, `IsAlgClosed K`, `hF`, smoothness and connectedness. `scratch/signatures.md` (0 lost binders) is confirmed. The 22 "Lean names found nowhere" in `scratch/citations.md` are all declared in Suggested.lean.
- **Seeded sample, all correct.**
  - 1.1 against `jantzen-1985`: §2.8 on printed pp. 36–39 (lines 1100–1165); §§3.3–3.7 on pp. 53–57; §3.9 on p. 60 (line 1683; the proof matches the README route); §4.2 on pp. 69–70 (line 1941); §4.7(a) on p. 73 (line 2001); §§4.14–4.16 on pp. 77–79a (lines 2102–2160).
  - 8.1 against `conrad-rgs` Definition 5.1.1, p. 136 (line 5651): nonempty base; constant roots and coroots; root spaces free of rank one.
  - 8.2 against `conrad-rgs` Definition 6.1.1 and Remark 6.1.2, pp. 186–187 (lines 7725–7751).
  - All seven Checks of 8.1–8.2 and the nine Checks of 1.1 were recomputed (table).
- **Further locators, all correct.**
  - Milne 2017 author-page copy: Prop. 1.21 p. 12; Prop. 1.65(b,c) pp. 26–27; Prop. 1.66 pp. 27–28; Def. 17.6 p. 353; Thm 17.9 p. 354; Thm 17.10 p. 354; Def. 17.95 p. 382; Thm 17.96 and Cor. 17.97 p. 383; Thm 22.42 p. 477; Cor. 22.43 p. 478.
  - `mcninch` §3.1 p. 6 (line 236) and (3.2.1) p. 7 (line 280).
  - `dudas-michel` Lemma 7.6(i) p. 25 (line 1145); (ii) needs normality, as the README says.
- **Pinned declarations opened.**
  - Orbits: `Orbit/Basic.lean:49–65`, `LocallyClosed.lean:177–213`, `Orbit/Scheme.lean`, `ClosedOrbit.lean:150–180`.
  - Reductive and Borel: `Reductive/CompleteReducibility.lean:96,118`; `Borel/Conjugacy/Existence.lean:133`; `Borel/Basic.lean:148`.
  - Tori: `Torus/Maximal.lean:50`; `Torus/Conjugation.lean:149`.
  - Matsushima: `Fppf/Quotient/Homogeneous/Coinvariants.lean:111,255,268`.
  - Other: `FunctorOfPoints.lean:143`; `CategoryTheory/Monoidal/Cartesian/Action.lean:41`; Braid `Basic.lean:358,366`.
  - All 60 further cited pinned names were found by declaration grep: `exists_coordinateBialgHom_surjective`, `pointsFunctorIsoTensorAutFunctor`, `kernelLieEquiv`, `frobeniusFixedPointsMulEquiv`, `ArtinGroup.exponentSum`, `BraidGroup.pureSubgroup`, `rootPairingBaseChange`, `existsUnique_dynkinType`, and others.
- **Cross-roadmap citations resolved.**
  - SchemeAndStackFoundations §§0.3, 0.7, 0.8, 1.1, 1.5, 1.13–1.15, 2.6, 4.12 exist at this head.
  - ModularCurves §0F matches the Weil-restriction use.
  - ReductiveGroupsPartII RG2.3/RG2.3.7 on main (R04).
  - IntegralHeckeAndGaloisDeterminants §0.7 at #1689.
  - ComplexComparisonPartII C-1.1 at #848: it builds X(ℂ) with the classical topology inside analytification; the README frames it as extending Layer 3A.5.
  - The resolver reports no unresolved cross-roadmap citation.
- **Not raised.** `exists_levi_complement` matches McNinch §3.1 under perfect-field descent of the radical (`hsm` is redundant in characteristic 0, note only). `permutation_nonsplit` needs `2 ≤ n`, as the table shows.

## Not verifiable

- `waterhouse`, `borel` and `springer` are settled as uncertified (paywalled) in the manifest. They are cited by locator only, and nothing here depends on their wording.
- Cached texts outside the sample were not checked in this review: `fox-neuwirth`, `fadell-neuwirth`, `birman-brendle`, `frenkel-kac`, `brieskorn`, `salvetti`, `callegaro`, `gros-kaneda`, `heden`, `riche`, `sga1`, `conrad-feng`, `arzhantsev`, `ernst`, `fang-lim-tan`, `conrad-adelic`.
- Ownership against open pull requests was checked through the roadmap tools only for the objects named in R04 and R10. A full sweep of the 466 open heads was not run.

## Source issues

- **Misprint** in milne-iag (2017 edition) at Corollary 17.97, p. 383: the proof attributes the needed surjectivity to "the proposition"; it should cite Theorem 17.96, which is labelled a theorem; affects nothing.
- **Misprint** in milne-iag (2017 edition) at the remark after Corollary 17.97, p. 383: the counterexample computes g·F(g)⁻¹ but quantifies "for all x"; it should quantify over g in μ_{q−1}(k^a); affects nothing.
