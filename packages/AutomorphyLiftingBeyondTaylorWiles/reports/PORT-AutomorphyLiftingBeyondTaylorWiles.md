# PORT-AutomorphyLiftingBeyondTaylorWiles

## Result

- Branch: `roadmap/automorphy-lifting-beyond-taylor-wiles`, created from main at `b9db5a4`.
- Head commit: `15836021` "AutomorphyLiftingBeyondTaylorWiles: roadmap (README, Suggested.lean, metadata)". It touches only `TauCetiRoadmap/AutomorphyLiftingBeyondTaylorWiles/{README.md,Suggested.lean,metadata.toml}`.
- Build (`lake build TauCetiRoadmap.AutomorphyLiftingBeyondTaylorWiles.Suggested`):
  `✔ [8954/8954] Built TauCetiRoadmap.AutomorphyLiftingBeyondTaylorWiles.Suggested (4.1s)` / `Build completed successfully (8954 jobs).` **Warning count: 0.** The file declares nothing, so there is no `sorry` warning either.
- Gate (`gate … AutomorphyLiftingBeyondTaylorWiles --base origin/main`, on the commit):
  `gate AutomorphyLiftingBeyondTaylorWiles: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction (`gate --depcheck … --movable`), complete output:

```text
depcheck: 229 roadmaps, 2128 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the ported README (main `b9db5a4`, 450 open pull requests, index of 2026-11-05T13:42:41Z): no cross-roadmap citation and no Lean name found nowhere.

## Draft pull request body

This roadmap develops the Calegari–Geraghty method for conditional integral automorphy lifting for GLₙ over an arbitrary number field. It works where the cohomology of the arithmetic quotients of Res PGLₙ occupies a range of length ℓ₀ = r₁⌊(n−1)/2⌋ + r₂(n−1) > 0, so the Taylor–Wiles numerical coincidence fails and module patching must become patching of perfect complexes. It specializes the arithmetic locally symmetric spaces, integral Hecke algebras, local and global Galois deformation rings and the commutative algebra of patching from their owning roadmaps to Res PGLₙ at Taylor–Wiles level. On that base it builds:
- the corrected Ihara-avoidance comparison of local rings (CG18 Lemma 8.2, without the false flatness assertion) and the defect-ℓ₀ numerical coincidence (Proposition 8.5);
- a strengthened Res PGLₙ form of Conjecture B, imposed on every intermediate cover and finite coefficient, with the inertia–diamond clause that condition (d) of the patching theorem needs;
- the rank-two Taylor–Wiles level comparison (Lemma 9.6) at every component of an arbitrary number field, through S-arithmetic amalgams and a Hecke-equivariant Lyndon sequence, together with a conditional distinct-root comparison for GLₙ and its PGLₙ descent;
- the two finite patching data and their verification.

The end theorems are near faithfulness of the lowest-degree cohomology dual over the minimal deformation ring (CG18 Theorem 9.19) and minimal R = T with freeness when the local rings are smooth. Further results are cuspidal recognition of the resulting eigenclasses, the support-to-eigenclass deduction used in conditional lifting, and the imaginary-quadratic and defect-zero specializations. Conjecture B stays an explicit hypothesis throughout. None of these headline theorems is statable on the pinned Mathlib and Tau Ceti carriers, so `Suggested.lean` declares nothing and its docstring names the missing carrier for each.

## Dependencies still in pull requests

Suppliers (cited in `*Needs:*` lines and the supplier contracts):
- ArithmeticLocallySymmetricSpaces
- IntegralHeckeAndGaloisDeterminants
- LocalGaloisDeformationRings
- GlobalGaloisDeformations
- ArithmeticGaloisRepresentations
- ArithmeticGaloisDuality
- DeformationAndDerivedPatchingAlgebra
- CompletedCohomologyPartII
- SmoothRepresentationsOfLocalGroups
- ModularCurvesPartII
- AdelicAlgebraicGroups
- AutomorphicFormsOnReductiveGroups
- AutomorphicSpectralTheory
- KTheoryLowDegrees
- PadicHodgeTheory

Cited only in "Scope and ownership" as owners of neighbouring material, not consumed:
- PotentialAutomorphyInfrastructure
- ModularityAndLanglandsExtensions
- GL2ModularityLifting
- AlgebraicModularFormsAndSerreWeights
- PotentialModularityAndCompatibleSystems
- AutomorphicBundlesPartII

Every one of these is earlier in the merge order.

On main: ClassFieldTheory, FreeGroupsAndLimitGroups, ReductiveGroupsPartII, DerivedModuleAlgebra, and Chebotarev (under `Completed/`).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` declared nothing; its docstring already explained why no headline is statable.

Changes to the file:
- **Header.** It used `module` with `public import Mathlib`. It now has `module` followed by the single line `import Mathlib`. With a plain `import Mathlib` and no `module`, Lake warned: "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". That breaks the requirement that `sorry` be the only warning. Two roadmaps on main use the same `module` + `import Mathlib` form, and the gate's import checks report 0.
- **Docstring.** Rewritten in the required form ("target signatures"; the roadmap is `README.md`; it states the headline theorems against the pins). It now lists each headline with the carrier it lacks:
  - README §1.3, §1.6 and §1.8 (§1.8 was not in the package's list);
  - §3.5 and §§3.6–3.7;
  - §§4.1–5.1, §§5.4–5.5 and §5.6;
  - §§5.8–5.10.
- **Dropped paragraph.** The docstring paragraph comparing §5.8 with ModularityAndLanglandsExtensions §2.8 is gone; that comparison is ownership prose, and the README Scope carries it.

I re-checked statability at this worktree's pins, which are newer than the review's: Tau Ceti `358314d`, Mathlib `f6090c7`. Neither has Galois deformation rings or functors, arithmetic locally symmetric spaces, adjoint Selmer groups, Fontaine–Laffaille modules or automorphic representations. The Tau Ceti "Selmer" hits are elliptic-curve and Dedekind `K(S, n)` Selmer groups. So no headline can be stated without a stand-in.

Signature audit: with no `def`, `theorem`, `instance` or `abbrev` in the file, there are no `#check @name` lines to elaborate. I enumerated the file's declarations (none) and nothing changed.

## Supplier replacements and duplication removals

- **Removed: none.**
  - No restatement of a supplier-provided declaration was found.
  - I re-checked the eleven declared gaps against each supplier at its current head. Each is still an extension the supplier does not state, so every contract stays:
    - ALS.5a.6 needs |K/K′| invertible.
    - IntegralHeckeAndGaloisDeterminants §2.1 has no intermediate-level or stabilizer clause.
    - GlobalGaloisDeformations §§5.6–5.8 are rank two.
    - ArithmeticGaloisRepresentations §§7.7–7.12 have no CHT big-subgroup detector.
    - DeformationAndDerivedPatchingAlgebra §8.6 is single-datum.
    - AutomorphicSpectralTheory §§4.4, 4.17 and 5.12–5.14 have no ordinary-cohomology boundary-or-residual dichotomy.
    - LocalGaloisDeformationRings §2.16 is semisimple.
    - CompletedCohomologyPartII §6.2 is p-level.
  - "What X must provide (gap:…)" contracts are an accepted form on main (FlagVarieties).
- **CompletedCohomologyPartII §3.8.** This section does treat tame-level colimits, so the tame-place contract now says why it does not cover the gap. It works only at neat levels and identifies invariants only for compact opens of pro-order invertible in O. At x with N(x) ≡ 1 mod p, |PGLₙ(k_x)| is divisible by N(x)² − 1, hence by p.
- **Citation corrected.** "AdelicAlgebraicGroups Layer AA.5" is not a label of that roadmap. It is now "AdelicAlgebraicGroups §5.1" (`GL₁` and logarithmic tori, inside its Layer 5) in the supplier contract and in the Layer 1 and Layer 3 Dependencies.
- **Ownership against ModularityAndLanglandsExtensions.** At its current head, §2.8's proof route names CG18 §9.5 and Theorem 9.19 and ends "These arithmetic verifications are owned here", for its own GLₙ §2.7 hypothesis, without stating targets for them. I kept the accepted review's decision. The Scope sentence now says that those verifications stay with that section for its §2.7 hypothesis. The ones stated here (§§4.1–4.4, 5.1–5.4) are for the Res PGLₙ package of Layer 2, whose Hecke algebras are the simultaneous images over all intermediate covers and finite coefficients and which carries clause (6).
- **Scope names owners of the excluded defect-one material**, instead of only saying it is outside the roadmap:
  - AlgebraicModularFormsAndSerreWeights §2.12 (Hecke operators on torsion coherent cohomology in the CG18 fine-curve setting);
  - PotentialModularityAndCompatibleSystems §8.8 (the CG18 Theorem 4.8 finiteness application);
  - AutomorphicBundlesPartII §1.4 and Layer 2 (the integral coherent complexes of CG18 §7.2, as cited there).
- **Duplication sweep by object** on main, at every open head (via `roadmaps grep`), in the sibling checkouts this brief names, and in the board's packages. Searches: "Theorem 9.19", "Lemma 9.6", "nearly faithful", "Taylor–Wiles projector", "numerical coincidence", "Proposition 8.5", "Lemma 8.2", "Theorem 9.16", "no new cohomology", "Calegari–Geraghty patching", "Conjecture A", "Ihara avoidance", S-arithmetic amalgams, "Res PGLₙ", "Calegari–Geraghty".
  - Hits are the named suppliers' generic material, rank-two or ℚ-only cases (ModularCurvesPartII §§15.4, 15.8; ALS.3.14; GL2ModularityLifting), CM-field lifting (PotentialAutomorphyInfrastructure), other groups (GSp4NonregularModularityLifting and AbelianSurfacesModularity mention no CG18 object), or unrelated "Lemma 8.2"/"Proposition 8.5" of other sources.
  - The board packages BianchiModularForms, EllipticCurveModularityImaginaryQuadratic, ModularityAndLanglandsExtensionsPartII, PotentialAutomorphyInfrastructurePartII, GL2ModularityLiftingPartII and OrdinaryAutomorphicFormsAndModularityLiftingPartII have no README, so ownership against them is not certified.
  - This roadmap owns: the Res PGLₙ hypothesis bundle; the component-indexed amalgam assembly of Layer 3; the rank-n defect-ℓ₀ count of §1.6; the two finite patching data and their verification; and the near-faithfulness theorem for its package. Every generic carrier stays with its supplier.
  - No declaration of `Suggested.lean` carries another roadmap's name (it declares none).
- **No notion moved down.** No supplier is later in the merge order.

## Citation resolution

Every supplier section was checked mechanically against the supplier README at its current head, or on main:
- **ALS**: ALS.0.4, 0.7–0.10, 1.1–1.8, 2.2–2.4, 3.3–3.9, 3.14, 4.1, 4.9–4.12, 5a.2–5a.6, 5b.4–5b.6, 5b.8, 6.1–6.3.
- **IntegralHeckeAndGaloisDeterminants**: 1.2, 1.3, 2.1, 2.2, 2.3, 3a.1, 3b.1, 3b.2.
- **LocalGaloisDeformationRings**: F.1–F.3, F.2.6–F.2.9, F.3.1, 1.6, 1.10, 1.13, 2.8, 2.10, 2.15, 2.16, 2.21, 2.23, 2.26.
- **GlobalGaloisDeformations**: 3.3–3.7, 4.3, 4.4, 5.1, 5.5–5.8, 7.2–7.4.
- **ArithmeticGaloisRepresentations**: 7.2, 7.4, 7.7–7.12.
- **ArithmeticGaloisDuality**: R02.5.1, R02.5.2, R02.6.1, R02.6.2. R02.6.1 contains the balanced archimedean count Σ h⁰(G_v, ad⁰) = [F:ℚ]n(n−1)/2 + ℓ₀.
- **DeformationAndDerivedPatchingAlgebra**: 1.12, 3.1–3.4, 3.10, 4.6, 6.1–6.5, 6.7, 6.8, 7.3, 7.6, 8.6, 9.1, 9.2.
- **CompletedCohomologyPartII**: 0.1–0.3, 1.1, 6.2.
- **SmoothRepresentationsOfLocalGroups**: SR.5.3 with its blocks "The distinct-eigenvalue local block" and "Derived hyperspecial–parahoric comparison".
- **ModularCurvesPartII**: 15.2, 15.4, 15.8.
- **AdelicAlgebraicGroups**: 4.2, 5.1.
- **AutomorphicFormsOnReductiveGroups**: 5.3, 5.5, Layers 4–6.
- **AutomorphicSpectralTheory**: 4.14a, 5.12–5.14.
- **KTheoryLowDegrees**: 11.6.
- **PadicHodgeTheory**: 6.1, 6.2.
- **ModularityAndLanglandsExtensions**: 2.7, 2.8.
- **GL2ModularityLifting**: Layers 4–5, §5.8.
- **PotentialAutomorphyInfrastructure**: Layers 3–5.
- **On main**:
  - ReductiveGroupsPartII RG2.2.4 and its "Ihara's theorem: SL₂ as an amalgam" with x₁ = [O ⊕ ϖO];
  - FreeGroupsAndLimitGroups §§4.5, 4.8;
  - DerivedModuleAlgebra §1.E.0, which carries closure of perfect complexes under retracts and derived scalar change;
  - ClassFieldTheory Layers 7 and 11;
  - `Completed/Chebotarev` Layer 10.

Library declarations, checked at the pins:
- `Field.absoluteGaloisGroup` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` line 42).
- `Representation` (`Mathlib/RepresentationTheory/Basic.lean` line 48, an `abbrev`, no continuity).
- `IsHeckeTriple` (line 75), `HeckeCoset` (line 157) and `HeckeRing` (`Mathlib/NumberTheory/HeckeRing/Defs.lean`).
- `Module.support_eq_zeroLocus` (`Mathlib/RingTheory/Support.lean` line 216, for finite modules).
- `Monoid.PushoutI` (`Mathlib/GroupTheory/PushoutI.lean` line 60).
- `groupCohomology.coindIso` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean` line 58: subgroup S ≤ G, `A : Rep k S`, no index hypothesis).
- `TauCeti.MonoidAlgebra.augmentation` (`TauCeti/Algebra/MonoidAlgebra/Exactness.lean` line 115).

## Fixes a reviewer would flag (README)

1. **Accepted review's note F01.** §1.1 called the coefficient field K, which the Conventions reserve for levels. It is now E/ℚ_p.
2. **Accepted review's note F02.** Trailing spaces on the §§2.1–2.4 headings are removed, along with all trailing whitespace and double blank lines.
3. **§0.2 Check, wrong value.** The order-5 comparison gave the full-determinant reading as (u, u², 1). The same Check had just said that reading is u, u², u³, and for u of order 5, u³ ≠ 1. It now reads (u, u², u³). For order 3 it equals (u, u², 1), which is why order 3 does not discriminate.
4. **§2.3 Check, misleading value.** It said H*(PSL₂(ℤ), 𝔽₃) is 𝔽₃ "in every even degree ≥ 2". By Hⁱ(C₂ ∗ C₃, 𝔽₃) = Hⁱ(C₃, 𝔽₃) for i ≥ 1, it is 𝔽₃ in every degree ≥ 1, including H¹ = Hom(C₃, 𝔽₃). Corrected, with the reason.
5. **§0.6 Check, missing hypothesis.** For F = ℚ, the squarefree-conductor Check now states det r̄ = ε̄ and why it forces unipotent ramification. At ℓ | N, exponent 1 gives semisimplification 1 ⊕ θ with θ tame, and a determinant unramified at ℓ forces θ = 1. The negative control 1 ⊕ θ with θ ≠ 1 needs a nebentypus.
6. **Forward reference in §0.3.** §0.3 asserted that maximal ideals with the same contraction have the same residual representation "when §2.1(i) holds", using a Layer 2 predicate as an input. That assertion now lives in the §2.1 API, where (i) is defined. §0.3 keeps the elementary fact that a maximal ideal of `T_{Q,psi}` contracts to a maximal ideal of `T^an_{Q,psi}` (integral extension).
7. **Forward references in §§2.2 and 2.7.** The §2.2 clause-(6) bullet invoked "the natural coefficient construction of §4.4". It now states the cyclic-decomposition and naturality argument in place. The §2.7 proof sketch's "every coefficient and framing quotient of §4.4" now reads "every finite O-module coefficient".
8. **Vacuous API bullets.** "Clause (1)." / "Clause (2)." / "Clause (3)." in §2.2, "Clause (a)." / "Clause (b)." in §2.3, and "The bundled proposition." / "Assemble from the four clauses." in §2.5 asserted nothing. Each block is replaced by one bullet stating the equivalence of the proposition with the conjunction of its clauses. In §2.5, "Conjecture B for F" now says what it quantifies over.
9. **Summary.** It now says that no headline is statable at the pins and that `Suggested.lean` names the missing carriers.
10. **Supplier corrections.** The AdelicAlgebraicGroups label, the tame-place contract and the two Scope paragraphs are described under the supplier and duplication section above.

## Adversarial mathematics pass

Values were recomputed by hand and by a short script; the script output is kept in the job's scratch directory. Each row gives the instance tried, the values computed on each side, and the result.

| Statement | Instances | Computed values | Result / change |
|---|---|---|---|
| Conventions (d, q₀, ℓ₀) | ℚ n=2; imag. quad. n=2; real quad. n=2; PGL₃/ℚ; CM quartic n=2 | (2,1,0); (3,1,1); (4,2,0); (5,2,1); (6,2,2) | agrees with the Conventions, §2.3 and §2.8 Checks |
| Rank-two polynomial, Frobenius direction | norm 7, trace 3 | X²−3X+7; geometric: trace 3/7, det 1/7; Satake product 1 ⇒ det 7 | correct |
| §0.2 deck classes det(B)a^{1−n}, n=3 | k=1,2,3; u of order 5 and 3 | exponents −2, −1, 0 ⇒ (u³,u⁴,1); det(B)-only (1,u,u²); det(g) (u,u²,u³) | **Check corrected** (it named det(g) as (u,u²,1)) |
| §0.2 PGL₃ Satake example | q=2, s=(2,3,1/6), p=5 | T₁=31/3, T₂=41/3, T₃=1; poly (1,−31/3,82/3,−8); mod 25 (1,23,19,17) vs (1,3,4,17); mod 5 both (1,3,4,2) | correct; inverse cosets are distinguished modulo 25 |
| §0.2/§0.5 C₃ direction model | f=δ₀, r_g(i)=i+1 | r_g^*f=(0,0,1); (r_g)_*f=(0,1,0); ⟨r_g^*f,e₂⟩=1=⟨f,(r_g)_*e₂⟩; standard homology gives 0 | correct |
| §0.3 maximal-ideal Checks | O[C₅], p=5; O×O, d=(1,−1) | k[u]/(u⁵) not a field; m^Q=(ϖ,d−1); −2 a unit for odd p | correct |
| §0.3 finite coefficients | O --ϖ→ O | H⁰ integral 0, with O/ϖᵃ coefficients ≅ k | correct |
| §0.4 projector example | p=7, roots 2,4, Q(V)=V−4 | −2, 0, −3 on the three lines ⇒ diag(1,0) and 1 on the V=1 line | correct; 2·4=8≡1 |
| §0.6 minimal level, F=ℚ | ℓ ∥ N with 1⊕θ | det ε̄ forces θ=1 | **hypothesis added to the Check** |
| §1.1(f) balanced oddness vs trace | all n ≤ 11, primes p ≤ 37 with p > n, all (a,b) | mismatches exactly at (n,p) = (2,3),(4,5),(6,7),(10,11), i.e. n even and p=n+1 | statement correct |
| §1.2 p-torsion of R¹_v | q=7, O=ℤ₃, A=O⟦X⟧[a]/(a²,6a) | det Φ=7, det Σ=1, ΣΦ-relation ⇔ 6a=0; mod 3, tr Φ(Σ−1)=a((1+X)−(1+X)⁻¹)≠0 | correct; the flat quotient differs mod ϖ |
| §1.2 Fontaine–Laffaille direction | F_v=ℚ₅, n=2 | O⊕O(ε): det ε=ξ; the wrong model gives det ε⁻¹, inertia 1, ω³ | correct |
| §1.3 dimension | general | Σ_{v|p}(n²−1+[F_v:ℚ_p]n(n−1)/2)+|R|(n²−1)+1 = 1+|S_p∪R|(n²−1)+[F:ℚ]n(n−1)/2 | correct |
| §1.4 deck coordinate | n=2 (b_x=−1); n=3, p=5 (b_x=2) | θ(u⁻¹)^{−1}=θ(u); θ(d³)²=θ(d), wrong model θ(d)³ | correct |
| §1.4 local condition | diag(4,J₂(3)) over 𝔽₇ | det 36≡1; h⁰(ad⁰)=2; dim L=3 | correct |
| §1.5 framing | n=2, |T|=1,2,0 | 3, 7, −1 | correct; empty T excluded |
| §1.6 count | imag. quad. n=2, |T|=1, q=3 | g=0, j=3, dim R_loc=6, dim R_∞=6=1+3+3−1 | correct |
| §1.6 archimedean count | (r₁,r₂) = (1,0),(0,1),(2,0),(0,2),(3,1), n=2 | Σh⁰ = 1,3,2,6,6 = [F:ℚ]+ℓ₀ | correct |
| §1.7 type S at R | Φ=diag(7,1), Σ=(1 1;0 1) | ΦΣΦ⁻¹=(1 7;0 1)=Σ⁷, det 7 | correct |
| §1.8 GL₁ component dimension | ℚ(i); real quadratic | point vs S¹ without K∞⁰; line with ε² (norm −1) or ε (norm +1) shift | correct |
| §2.1 wrong normalization | n=2, N=2, char 7 | wrong det N^{n(n−3)/2}=2⁻¹=4; correct 2 | correct |
| §2.3 PSL₂(ℤ) at p=3 | Hⁱ(C₂∗C₃,𝔽₃) | 𝔽₃ for every i ≥ 1 | **Check corrected** |
| §2.8 excluded degrees | PGL₃/ℚ; CM quartic PGL₂ | {0,1,4,5}; {0,1,5,6} | correct |
| §3.1 determinant kernel | ℚ(√3), u=2+√3; h=diag(2,1) | N(u)=1, u=(1+√3)²/2 with 2 a nonsquare; γAγ⁻¹=(0 2;−1/2 2) ∉ PSL₂(ℤ) | correct |
| §3.2 nonprincipal prime | ℚ(√−5), (7,3+√−5) | a²+5b²=7 has no solution; roots ±i in 𝔽₉, product 1; index 8 | correct |
| §3.4 chain map | q=3,5,7 | vertex augmentations 1 and 1; edge terms q²; ∂(edge sum)=F(v₀)−F(v₁) checked symbolically | correct |
| §3.3/§3.4 normalization | q=7 over ℤ/9 | q²=4, q⁻²=7, normalized edge degree 1 | correct |
| §3.5 Gram determinant | p=7, N(x)=29, roots 2,4; roots 1,1 | 3=−(2−4)², α²−1=3; 0 | correct |
| §4.2 reflection | (q₀,ℓ₀)=(1,1) | T⁰=H²∨, T¹=H¹∨; the wrong formula gives 0, H⁰∨ | correct |
| §5.3 negative control | O⟦x,y⟧/(xy), M=A/(x) | ϖ regular; M/ϖ supported on V(x) only | correct; shows the hypothesis is needed |
| §5.8 characters | n=2,3, p=5; exhaustive p ∈ {3,5,7,11}, a ∈ {1,2} | (2,3), (4,0,1); wrong models (3,4) sum 2, (1,2,3) sum 1; 254224/254224 tuples have shifted sum 0 and stay distinct | correct |
| §5.9 Q(i) | p=5 split, p=7 inert, q=3 | g=1, 0 | correct |
| §5.10 defect zero | real quadratic, |T|=1, q=3 | g=1, dim R_∞=7=dim S_∞^□, dim S_∞=4 | correct |
| §3.6 contract (new sentence) | |PGLₙ(k_x)|, N(x)≡1 mod p | divisible by N(x)²−1, hence by p | correct |

Context and vacuity: `Suggested.lean` has no declarations, so it has no `variable` context to audit. The README theorems tie their data to the constructions: maximal ideals of the stated Hecke algebras, the standing datum, and Taylor–Wiles sets from §1.6. No hypothesis contains its conclusion.

## Unresolved

- **Conditional on eleven supplier gaps.** The roadmap is conditional on the gaps the accepted review lists:
  - `localized-orbifold-range-duality`, `localized-orbifold-perfect-models`, `congruence-character-localized-h1` (ArithmeticLocallySymmetricSpaces);
  - `simultaneous-orbifold-hecke-finiteness` (IntegralHeckeAndGaloisDeterminants);
  - `big-image-rank-n-taylor-wiles` (GlobalGaloisDeformations);
  - `cht-big-image` (ArithmeticGaloisRepresentations);
  - `character-ring-completed-products`, `paired-cohomology-action-patching` (DeformationAndDerivedPatchingAlgebra);
  - `proper-support-boundary-or-residual` (AutomorphicSpectralTheory);
  - `nonsemisimple-two-scalar-taylor-wiles` (LocalGaloisDeformationRings);
  - `tame-place-fixed-exponent-descent` (CompletedCohomologyPartII).

  None is provided at the suppliers' current heads.
- **Overlap with ModularityAndLanglandsExtensions §2.8.** Its proof route now claims ownership of "these arithmetic verifications" for its GLₙ hypothesis. This roadmap states the corresponding targets for its Res PGLₙ package, as the accepted review decided, and the Scope says so. A maintainer may still want the two owners to agree whether ModularityAndLanglandsExtensions §2.8 should cite this roadmap's Layers 4–5 instead.
- **Ownership against board packages without a README** (listed above) is not certified.
- **Nothing suspicious** appeared in any review, report or roadmap text read for this job.


Pull request: #1824 (roadmap/automorphy-lifting-beyond-taylor-wiles at 1583602)
