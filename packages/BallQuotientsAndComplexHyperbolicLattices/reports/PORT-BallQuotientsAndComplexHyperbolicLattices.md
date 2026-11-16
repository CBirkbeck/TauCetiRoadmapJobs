# PORT-BallQuotientsAndComplexHyperbolicLattices

- **Branch:** `roadmap/ball-quotients-and-complex-hyperbolic-lattices`, created from `51d880d`.
- **Head commit:** `eeb54a8b308d285371357cc24a2fa6d451c7b658`, "BallQuotientsAndComplexHyperbolicLattices: roadmap (README, Suggested.lean, metadata)".
- **Files:** `TauCetiRoadmap/BallQuotientsAndComplexHyperbolicLattices/README.md` (988 lines), `TauCetiRoadmap/BallQuotientsAndComplexHyperbolicLattices/Suggested.lean` (220 lines, unchanged from the package), `TauCetiRoadmap/BallQuotientsAndComplexHyperbolicLattices/metadata.toml` (`topic = "math.AG"`, same shape as the folders on main). Nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.BallQuotientsAndComplexHyperbolicLattices.Suggested`:

    Build completed successfully (18239 jobs).

7 warnings, all `declaration uses sorry`, at Suggested.lean lines 101, 131, 161, 171, 177, 189 and 215 (the seven headline theorems). No other warning, no error.

## Gate

    gate BallQuotientsAndComplexHyperbolicLattices: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency check

    depcheck: 237 roadmaps, 2242 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This roadmap develops complex hyperbolic geometry and the theory of lattices in PU(1,n) for every n ≥ 1, and the algebraic geometry of their quotients. It covers every lattice: arithmetic or not, cocompact or not, with or without torsion. Starting from the ball, its groups and its invariant Kähler metric as a Riemannian symmetric space, it proves that PU(1,n) is the full biholomorphism group of the ball and makes the metric explicit (curvature, distance, Schwarz–Pick). It then classifies totally geodesic subvarieties and proves the Margulis lemma for discrete subgroups. For lattices it proves Garland–Raghunathan's cusp structure theorem, finite presentation, Selberg's lemma in eigenvalue form and the existence of neat subgroups. On the quotient side it builds the analytic quotient Γ\𝔹ⁿ as a normal complex space, the toroidal compactification of a neat quotient by abelian varieties, and Mok's L² construction that makes the minimal compactification S*_Γ a normal projective variety with finite boundary. It also proves the big Picard extension theorem with Borel algebraicity, uniqueness of the algebraic model and of the finite-point compactification, and the bridge from arithmetic lattices to Shimura data, which identifies S*_Γ with the Baily–Borel compactification. The motivation is non-arithmetic ball quotients: no Shimura-variety roadmap reaches them, and the theorems of Baldi–Ullmo on them (finiteness of maximal totally geodesic subvarieties, Ax–Schanuel) need S_Γ, its uniformisation, Γ-special and totally geodesic subvarieties, and the algebraic subvarieties of 𝔹ⁿ × S_Γ as library objects. Layer 12 supplies these. `Suggested.lean` states the seven headlines statable against the pinned Mathlib, on minimal carriers: the biholomorphism group, the Margulis lemma, finiteness of cusp classes, the cocompactness criterion, finite presentation, Selberg's lemma and neat subgroups. Its module docstring names the headlines that need complex analytic spaces, analytification or Shimura data, none of which is at the pins.

## Roadmaps this one depends on that are still pull requests

- **RealSemisimpleLieGroups** (§§3.1, 5.2, 5.3, 5.4, 5.6, 5.7): another author's open pull request adding a new roadmap folder. It is not in the merge order; the dependency check reports no problem for it.
- **ShimuraVarieties** (§§P.1, P.2, P.6, 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.5, 2.7, 3.1, 3.3, 3.4a, 3.5), **PELModuli** (§M5.5) and **ShimuraData** (§3.8): all earlier in the merge order than this roadmap.
- ShimuraCompactifications (Layer 2) and ShimuraVarietiesPartII are named only as a scope boundary and as downstream consumers, not as suppliers.

Since the package was written, ComplexComparisonPartII, AlgebraicModuliForArithmeticGeometry, AbelianSchemesAndArithmeticModuli and ArithmeticLocallySymmetricSpaces have reached main. Every cited section and name of theirs was re-resolved there.

## What moved from the Lean to the README

Nothing. `Suggested.lean` already met the form: one module docstring naming what is not statable and why; nine definitions, each with a real body and each needed by a headline; seven headline theorems; `import Mathlib` only; no `set_option`, no sorry'd data, no examples, no padding. It is committed byte-identical to the package file. No `TauCeti.*` import is needed: no pinned Tau Ceti declaration is a carrier of these statements.

Two headline candidates were reconsidered and left out, as the accepted review had decided:
- Schwarz–Pick between balls (§2.5): a route to §10.1, not an end theorem.
- The Zassenhaus theorem (§4.4): a route to the Margulis lemma.

## Signature check

I put `#check @name` for all 16 declarations in one temporary block appended to the module, elaborated it once with the permitted `lake build`, then restored the file (confirmed identical to the package file). Every elaborated type is the README statement. The file has no section `variable`, so no binder can be lost. One generality mismatch surfaced, in the README rather than the Lean: `conjugationMap` is defined for every finite index type ι, but README §1.2 described it only on Mₙ₊₁(ℂ). The README now says so (fix 5 below). No type changed.

## Supplier replacements and duplication removals

**Supplier repairs.**
- ComplexComparisonPartII's sections on main are numbered `C-1.1` and `C-1.2` with an ASCII hyphen. All 16 citations `C−1.x` were changed to `C-1.x`.
- Main's §C-1.1 no longer proves the Hausdorff and properness comparisons for the analytification itself. It identifies the underlying space with ReductiveGroups §3A.5c's classical topology:
  - separated ⇒ Hausdorff is ReductiveGroups §3A.5b;
  - proper ⇒ proper map, so compact complex points, is ReductiveGroups §3A.5c.

  So the §C-1.1 contract was rewritten, a "From TauCetiRoadmap.ReductiveGroups" contract was added, and ReductiveGroups §§3A.5b–3A.5c was threaded into the three places that use compactness or Hausdorffness of a projective variety's analytification (§§9.4, 10.5, 11.4). The same citation went into their *Needs:* lines and the Dependencies of Layers 9, 10 and 11.
- The claim "finite morphisms go to finite analytic maps (§C-1.1)" was dropped from the contract: main's ComplexComparisonPartII does not state it, and no target uses it.
- The §C1.6 contract now names main's declarations, `montelTheorem` and `cartanSerreFiniteness`, instead of paraphrases.

**Contract completions.** Declarations cited in the body but missing from the contracts were added:
- Mathlib `Group.IsVirtuallyNilpotent` (Mathlib/GroupTheory/Nilpotent.lean:262), recorded as the Margulis conclusion without the uniform index bound that `margulis_lemma` states;
- the Jacobson-ring, lying-over and Krull height-theorem declarations of §§6.3 and 12.4;
- Tau Ceti `TauCeti.riemannianVolume` (TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82), used in §5.3.

All 63 Mathlib and Tau Ceti file:line citations were opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, unchanged from the package baselines), and each line carries the declaration named.

**Duplication sweep.** Done by object over main and the open heads with the roadmaps tools, for:
- Selberg's lemma, the Margulis lemma, Zassenhaus neighbourhoods, PU(1,n) and complex hyperbolic space, ball quotients;
- neat subgroups, finite presentation, rank-one reduction theory (Garland–Raghunathan), Mok's compactification, the biholomorphism group of the ball and Cartan's uniqueness theorem.

Nothing was removed; this roadmap owns all of these. The neighbours:
- RealSemisimpleLieGroups lists Selberg's lemma, finite generation, non-arithmetic ball quotients and the biholomorphism group of the ball as outside itself.
- GeometricTopology §7.3 (main, and its open revision) has the Margulis lemma for ℍⁿ only, already distinguished in Scope.
- AdelicAlgebraicGroups §4.3 has neat subgroups of arithmetic groups only, already distinguished.
- ArithmeticFuchsianGroups (open) owns Margulis's commensurator criterion in PSL₂(ℝ); this roadmap excludes it from scope and lists it among the consumers.
- KleinianGroups and FuchsianOrbifoldsPartII (open) share no object.

One clause was added to Scope and ownership: AdelicAlgebraicGroups §2.3 uses the same lattice notion for the left action, as the accepted review's "for the human reviewers" note pointed out. The clause says that on G the left and right notions give the same lattices and covolumes (§5.1).

**Ownership against open pull requests.** Checked with the roadmaps tools over the indexed heads. RealSemisimpleLieGroups, ShimuraVarieties, PELModuli, ShimuraData, ShimuraCompactifications and KleinianGroups were read through `roadmaps show`. ArithmeticFuchsianGroups and FuchsianOrbifoldsPartII were read from their checkouts. `roadmaps overlaps` reports no other pull request that changes this roadmap and no dropped id. `roadmaps resolve` on the ported README finds 0 citations and 0 Lean names unresolved.

## Fixes from the upstream-reviewer reading

1. **Stale section ids and contract (supplier).** As above: `C−1.x` → `C-1.x`, and Hausdorff/compact analytification credited to ReductiveGroups §§3A.5b–3A.5c through ComplexComparisonPartII §C-1.1, since main's text puts it there.
2. **Unsourced contract claim.** "Finite morphisms go to finite analytic maps" was attributed to §C-1.1, which does not state it; removed.
3. **`ballMap` generality (§1.4).** The README now says `ballMap` is defined for every g ∈ GLₙ₊₁(ℂ) and w ∈ ℂⁿ, with Lean's value 0 where the denominator vanishes, a value never read for g ∈ U(1,n) on the closed ball. Before, the README was narrower than the Lean definition.
4. **`ballDist`, `IsParabolic`, `IsCuspPoint` generality (§§2.4, 4.1, 6.1).**
   - `ballDist`: the README states it is defined on all of ℂⁿ × ℂⁿ, with junk values off B × B that no statement reads.
   - `IsParabolic`: defined for every element of GLₙ₊₁(ℂ), applied only to lifts.
   - `IsCuspPoint`: defined for every subgroup, discrete in every use.
5. **`conjugationMap` generality (§1.2).** Stated for every finite index type ι, as in the Lean.
6. **Lattice notion ownership (Scope).** The AdelicAlgebraicGroups §2.3 clause above.
7. **Missing contract entries.** `TauCeti.riemannianVolume`, `Group.IsVirtuallyNilpotent`, and the commutative-algebra declarations of §§6.3 and 12.4.
8. **Wording.** "A later part of ShimuraCompactifications" became "A Part II of ShimuraCompactifications", and "only a later part can consume" became "only a Part II of it can consume" (Downstream consumers), so that nothing reads as deferred.

No statement was found false.

## Adversarial mathematics pass

Values computed in this job, partly by hand and partly with a plain-Python script (matrix products, the matrix exponential series, random U(1,2) elements built as g_w·diag(a, A)).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `indefiniteUnitaryGroup` (§1.1) | h_t, t = 0.7; swap S; 2·1; diag(1,−1) | h_tᴴJh_t = J (true); SᴴJS = diag(−1, 1) = −J; (2·1)ᴴJ(2·1) = 4J; diag(1,−1) ∈ U(1,1), det −1 | defines U(1,n); excludes "up to scalar" and cone-preserving models | none |
| Convention witness (§1.1) | z = (1, i/2), w = (1, 1/2) | here 1 + i/4, supplier 1 − i/4, ⟨z,z⟩ = 3/4 on both sides | conjugate forms, same values on the diagonal | none |
| `projectiveUnitaryGroup` (§1.2) | n = 0; i·1 | n = 0: U(1)/centre is trivial; i·1 has class 1 | faithful quotient | none |
| `ballMap` (§1.4) | h_t at 0; diag(2,1) at 0.9; sampled denominators on the sphere for random U(1,2) | h_t·0 = −0.6043677771i = −i tanh 0.7; diag(2,1)·0.9 = 0.45 (not onto B); min \|a + bᵀw\| on 200 sphere samples 0.437 > 0 | denominators nonzero on the closed ball for U(1,n) | README states the domain (fix 3) |
| Section g_w (§1.4) | w = (1/2, 0), (0.3 + 0.2i, −0.1i), 0 | g_wᴴJg_w = J in all three; g_w·0 = w exactly | holds, including the 1/2 extension at w = 0 | none |
| lieExp(tY_v) (§1.4) | n = 2, v = e₁, t = 0.4 | 40-term exp series equals [[cosh t, sinh t vᴴ],[sinh t v, 1 + (cosh t − 1)vvᴴ]]; orbit of 0 is 0.379948962 = tanh 0.4 | holds | none |
| [Y_u, Y_v] and 𝔞 one-dimensional (§1.4) | u = e₁, v = ie₁ | uᴴv − vᴴu = 2i, uvᴴ − vuᴴ = −2i e₁e₁ᴴ | ℝ-independent pair does not commute | none |
| dim K·{g_t} < dim G (§1.4) | n = 1, 2 | n² + 1 = 2, 5 against n² + 2n = 3, 8 | second K needed | none |
| Cayley transform (§1.3) | C(0, 1/2); C(0, 2); C⁻¹ | (0, 3i), ρ = 3 = (3/4)/(1/4); (0, −3i), ρ = −3; v − i = w(v + i), 1 − w = 2i/(v + i) | holds | none |
| Heisenberg law (Conventions, §1.5) | n = 2, a = 1, a′ = i; map to `TauCeti.HeisenbergGroup` | (1,0)(i,0) = (1 + i, −2), reversed (1 + i, 2), commutator T₋₄; image law c + c′ + pq′, the pinned law (x,y,z)(x′,y′,z′) = (x + x′, y + y′, z + z′ + xy′) | holds | none |
| `biholomorphic_ball_iff` (§2.1) | n = 0; boost tanh t = −1/2; w ↦ w/2; z + z² on ℂ | n = 0: B = {0}, G trivial, unique class; boost gives (w − 1/2)/(1 − w/2); w/2 has no inverse on B (diag(2,1) is not in U); z + z² has derivative 1 and is unbounded | both directions, both Cartan hypotheses used | none |
| Kähler form coefficients (§2.2) | w = (1/2, 0), u = e₁ | h(u,u) = 4/3 + 4/9 = 16/9, metric 32/9 = supplier's g_𝔹(u,u); det h = (1 − \|w\|²)^−(n+1) | agrees with the supplier | none |
| Ricci and canonical curvature (§2.3) | n = 1 | det h = (1 − \|w\|²)⁻², iΘ(K_B) = +2ω, Ric = −2ω | sign of K_B fixed | none |
| Killing scaling (§§2.2–2.4) | n = 1, n = 2 | curvature −2/6 = −0.3333, −0.5/6 = −0.08333 (n = 2); modular area ω: 0.5236 = π/6, Killing: 2.0944 = 2π/3, the supplier's §5.6 value | consistent with RealSemisimpleLieGroups | none |
| `ballDist` (§2.4) | 0 to (1/2, 0); three random U(1,2) elements; 3000 random triples in B²; boost pair | 0.776836199212 = √2 artanh(1/2), argument 1.1547 = 2/√3; distances before and after g equal to 12 digits (1.633269627158); 0 triangle violations; arcosh argument 2/√3 for both boost pairs | invariant metric | README states the domain (fix 4) |
| h_t displacement (Conventions) | t = 0.7 | d(0, h_t·0) = 0.98994949366 = √2·0.7 | holds | none |
| Schwarz–Pick (§2.5) | (ζ, 0); (ζ, ζ)/√2; (ζ/2, ζ/2); 2ζ | \|Df(0)·1\| = 1, 1, 1/√2; 2ζ leaves B¹ | holds; hypothesis used | none |
| Sub-balls (§§3.1–3.2) | {w₁ = 1/2} (n = 2); span(e₀ + e₁) | form (3/4)\|z₀\|² − \|z₂\|², signature (1,1); ⟨e₀ + e₁, e₀ + e₁⟩ = 0 | holds; signature hypothesis used | none |
| Types of elements (§4.1) | null eigenvectors; Jordan block; T_t in Siegel coordinates (n = 2) | \|λ\| ≠ 1 ⇒ ⟨v,v⟩ = 0; λ̄⟨v,v⟩ = 0; T_t fixes {y₀ = 0} = {w₂ = 1}, meeting the sphere only at b₀ | `IsParabolic` must count sphere fixed points only, as it does | README states the domain (fix 4) |
| Displacements (§4.2) | T_t at height y; a_s | √2 arcsinh(\|t\|/(2y)); ∫ dy/(√2y) over [y, s²y] = √2\|log s\| | holds | none |
| `margulis_lemma` (§4.4) | n = 0; C_m ⊂ K; S₃ ⊂ U(2); dense free subgroup | n = 0: ball {0}, ballDist 0 0 = √2·arcosh 1 = 0, trivial G; C_m abelian of index 1, trivial subgroup index m; S₃: smallest index of a nilpotent subgroup 2 (A₃); dense group not discrete | uniform bound on the index, discreteness used | `Group.IsVirtuallyNilpotent` cited as the unbounded form |
| Discrete groups at a cusp (§4.5) | ⟨n_(1,0), n_(i,0)⟩; {n_(a,0) : a ∈ ℤ} | commutator T₋₄, Λ = ℤ[i] of rank 2; rank 1 < 2n − 2 = 2 | hypothesis used | none |
| `IsLattice` (§5.1) | n = 0; trivial Γ, n ≥ 1; ⟨T_1⟩; S₃ ⊃ {1, s} | n = 0: G a point, Γ = ⊤ a lattice; trivial Γ: conull domain, infinite Haar measure; strip area (ε⁻¹ − 1)/2 → ∞; right-coset representatives {1, r, r²} tile S₃ with measure 3 | left/right sides as stated | Scope clause on AdelicAlgebraicGroups §2.3 (fix 6) |
| Covolume and volume (§5.3) | horoball mod an N-lattice; strip | ∫_c^∞ ρ^−(n+1) dρ = c^−n/n < ∞; ∫_0^1 ρ^−(n+1) dρ = ∞ | holds | `TauCeti.riemannianVolume` added to the contract (fix 7) |
| `IsCuspPoint`, `IsLattice.exists_finset_cuspPoint_orbits`, `IsLattice.compactSpace_quotient_iff` (§6.1) | n = 0; PSL(2,ℤ); elliptic fixed point of parabolic type (n = 2) | n = 0: the sphere of ℂ⁰ is empty, G/Γ a point, both sides true; zᴴHz = 2.8 = 2(Im v − \|u\|²) at z = (1, 0.3 + 0.1i, 0.2 + 1.5i); R̃, T̃ preserve H, det 1; d(x, Tx) at y = 1000 is 0.000707106752 | holds; torsion handled by the trichotomy | README states the domain (fix 4) |
| `IsLattice.isFinitelyPresented` (§6.2) | [F₂, F₂] in Γ(2)/{±1}; trivial subgroup | F₂/[F₂,F₂] ≅ ℤ² infinite, so [F₂,F₂] has infinite index and infinite rank; the trivial subgroup is finitely generated | finite covolume used | none |
| `selberg_lemma` (§6.3) | Γ(3) traces; g = diag(2, −1/2) with 𝔞 = 15ℤ[1/2]; char p example; ι empty | torsion traces −2, −1, 0, 1 are ≡ 1, 2, 0, 1 mod 3, and trace −1 forces order 3; g^k mod 3: (2,1), (1,1) alternately; mod 5: identity first at k = 4, so Λ′ = ⟨g⁴⟩ ⊂ ⟨g²⟩; 2·(−1/2) = −1 excludes Λ′ = Λ; char p: unipotent order-p elements, eigenvalue group ⟨t^k⟩ | holds in every characteristic, products of eigenvalues counted | none |
| `conjugationMap`, `IsNeat`, `IsLattice.exists_neat` (§§1.2, 6.4) | lift diag(1/2, i, 2); screw m·T_t; n = 1; n = 0 | Ad eigenvalues: moduli 1/4, 1/2 (phases ±π/2), 1 (three times), 2 (phases ±π/2), 4; 2i·(i/2) = −1, so ⟨γ⟩ is not neat while ⟨γ²⟩ (eigenvalues (−4)^±k, 16^±k) is; screw has Ad-eigenvalue i; n = 0: Ad = id on M₁(ℂ) | neatness strictly stronger than single-eigenvalue and torsion-free conditions | README states `conjugationMap` for every ι (fix 5) |
| Analytic quotient (§§7.1–7.3) | {±1} acting by w ↦ −w; complex reflection; PSL(2,ℤ) ⊃ Γ(2)/{±1} | n = 2 quadric cone, n = 1 coordinate w²; reflection quotient smooth with coordinates (w₁, w₂²); F ≅ S₃, quotient the j-line | holds | none |
| Cusp chart and semi-character (§8.1) | Γ_b = ⟨n_(λ,0), n_(iλ,0)⟩, λ = 1 | Im⟨a,a′⟩ = 1, commutator T₋₄, τ = 4; χ((1 + i)λ) = −1.000 (computed exp(2πi(−2)/4)); invariance of μ: exponents cancel | χ is a semi-character, not a character | none |
| Appell–Humbert data (§8.2) | H_b(u,a) = −(4/τ)⟨a,u⟩ | πH_b(u,a) + πH_b(a,a)/2 is the multiplier; E′(iλ, λ) = (4/τ)λ² = 1 | L_b⁻¹ positive, L_b negative | none |
| Asymptotics and L² (§§8.3–8.4) | n = 1; f = q^k; ℓ = 0 | ω = i dq∧dq̄/(4\|q\|² log²\|q\|), metric \|dq\|²/(2\|q\|² log²\|q\|); radial exponent (ℓ − 1)(n + 1) ≥ −1 iff ℓ ≥ 1; ∫₀^δ dr/(r log² r) = 1/(−log δ) | ℓ = 0 excluded as stated | none |
| Pluricanonical sections (§§9.1–9.2) | genus g curves; Γ(2)/{±1} | 6g − 6 ≥ 2g + 1 iff g ≥ 2, 4g − 4 ≥ 2g + 1 iff g ≥ 3; dim S_2ℓ(Γ(2)) for ℓ = 2..5: 0, 1, 2, 3 = ℓ − 2 | holds; ℓ₀ depends on Γ | none |
| Finite-point uniqueness (§10.5) | Γ₀(2); doubled cusps; nodal cubic | genus 1 + 3/12 − 1/4 − 2/2 = 0, two ends; six boundary points against three; node has two branches | each hypothesis used | ReductiveGroups citation for compact Hausdorff (fix 1) |
| Functoriality degree (§10.6) | Γ(3) in PSL(2,ℤ); Γ₀(11) (§9.6) | index 12 in PSL, 24 in SL; Γ₀(11) genus 1 + 1 − 0 − 0 − 1 = 1, (−1/11) = (−3/11) = −1 | holds | none |
| Arithmetic witness form (§11.1 (c)) | A = diag(2,1) | A·SL₂(ℤ)·A⁻¹ = {[[a, 2b],[c/2, d]]}, meets SL₂(ℤ) in Γ⁰(2) of index 3; [[1,1],[0,1]] ↦ [[1, 1/2],[0,1]] | commensurable, not equal | none |
| Components of X (§11.3) | n = 1, 2 | \|det g\|² = det(−J)/det J = 1 (n = 1), −1 (n = 2) | X = X⁺ for n ≥ 2 | none |
| Boundary components (§11.4) | closed ball of ℂ²; bidisc | ⟨f(0), f(ζ)⟩ ≡ 1 forces f constant; {1} × Δ is a boundary disc of the bidisc | boundary components of the ball are points | ReductiveGroups citation (fix 1) |
| Intersection inequality (§12.4) | Q = B × {s}; Q = B × S_Γ; Q = {x₀} × S_Γ | dim U = 0 = n − n; n = 2n − n; 0 = n − n | holds | none |

## Unresolved

- **The two supplier gaps remain open:** `gap:normality-analytification` (§C-1.2) and `gap:normal-riemann-extension` (§C0.6). ComplexComparisonPartII on main states neither. Its §C-1.2 has `completedAnalyticStalkComparison` without the simultaneous normality/regularity statement, and its §C0.6 has analytic normalization without the normal Riemann extension theorem. Its README says, beside SGA 1 Proposition 2.4, that its own route avoids "the normality of the analytification of a normal scheme and the extension theorem on normal analytic spaces". The accepted review was conditional on these gaps, and the README keeps the two "What ComplexComparisonPartII must provide" paragraphs, in the form AlgebraicModuliForArithmeticGeometryPartII uses on main.
- **RealSemisimpleLieGroups is outside the merge order.** It is the main supplier (§5.7) and another author's open pull request. The dependency check raises nothing, but merging this roadmap first would leave its §5.7 citations pointing at an unmerged roadmap.
- **Unread sources,** carried from the accepted review: Goldman1999 is uncertified and is the only source cited for §§2.1, 3.2 and 3.4. Mok2012 was read in the HKU IMR preprint, not the published chapter.
- **Suspicious text:** none found in the reviews, reports or fetched roadmaps.


Pull request: #2425 (roadmap/ball-quotients-and-complex-hyperbolic-lattices at eeb54a8)
