# Review of BallQuotientsAndComplexHyperbolicLattices (pull request #2425 at a4e5dee)

**Verdict:** needs changes

## R01 (P2) — Borel algebraicity is claimed for every variety, and §10.3 proves it for smooth ones

**Location:** `TauCetiRoadmap/BallQuotientsAndComplexHyperbolicLattices/README.md` line 819 (Layer 10, Examples): "For torsion-free Γ, §10.3 makes every holomorphic map from a quasi-projective variety to S_Γ algebraic"; and line 3 (Summary): "which makes holomorphic maps from algebraic varieties algebraic".

**Claim:** §10.3 gives algebraicity of holomorphic maps V^an → S_Γ^an for every quasi-projective (Summary: every algebraic) variety V.

**Witness:** §10.3 (line 777) assumes "a smooth variety V over ℂ", and its route compactifies V by AlgebraicModuliForArithmeticGeometry §9.5, which takes smooth U only. V = {y² = x³} is quasi-projective and outside §10.3. MilneSVI line 1743 also assumes V nonsingular.

**Repair:** Line 819: "For torsion-free Γ, §10.3 makes every holomorphic map from a smooth quasi-projective variety to S_Γ algebraic; for instance the maps S_(Γ_H) → S_Γ of §12.2 for neat Γ, where S_(Γ_H) is smooth." Line 3: "which makes holomorphic maps from smooth algebraic varieties algebraic". With "smooth" the cusp is excluded and both sentences state §10.3. (Stating §10.3 for singular V instead, as MilneSVI Aside 3.17(a), line 1782 to line 1785, does, needs the closure-of-the-graph step as a target with its own inputs.)

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
|---|---|---|---|---|
| §1.1, `indefiniteUnitaryGroup` | h_t; swap S; 2·1 | h_t ∈ U(1,1); S and 2·1 excluded | h_tᴴJh_t = diag(c² − s², s² − c²) = J; SᴴJS = −J; (2·1)ᴴJ(2·1) = 4J; BaldiUllmo2023 line 486 to line 496 | holds |
| §2.2 Kähler form | w = (1/2, 0), u = e₁; n = 1 modular surface | h(u,u) = 16/9, g = 32/9; area π/6 | 4/3 + 4/9 = 16/9; supplier formula 2(4/3 + 4/9) = 32/9; (π/3)/2; Mok2012 line 249 to line 254 | holds |
| §2.3 Ricci and curvature | n = 1; n = 2 Killing scaling | K = −2, Ric = −2ω; −1/3 and −1/12 times 6 | 2|dw|²/(1 − |w|²)² is half the K = −1 metric; −2/6, −(1/2)/6; RealSemisimpleLieGroups §5.7 Check agrees | holds |
| §2.5 Schwarz–Pick | (ζ, ζ)/√2; (ζ/2, ζ/2); 2ζ | isometric; strict; excluded | |Df(0)| = 1; 1/√2; not into B¹; Kiernan1972 line 64 to line 65 | holds |
| §3.1 sub-balls | W = {z₁ = z₀/2}; m = 0; negative W | signature (1,1); point; empty | form (3/4)|z₀|² − |z₂|²; BaldiUllmo2023 line 496 to line 506 | holds |
| §3.2 sub-ball through a point | p = (1/2, 0), T = ℂe₂ | W_(p,T) = {z₁ = z₀/2} | span((1, 1/2, 0), (0, 0, 1)); ⟨(1,p),(1,p)⟩ = 3/4 > 0; converse read in RealSemisimpleLieGroups §5.7 | holds |
| §5.3 covolume = volume | PSL(2,ℤ); n = 1 Killing factor | π/6; (2(n+1))⁻ⁿ = 1/4 | 4·π/6 = 2π/3, the value in RealSemisimpleLieGroups §5.6; WitteMorris2015 line 1899 to line 1921 | holds |
| §6.3, `selberg_lemma` | diag(2, −1/2) over ℚ; 𝔽_p(t) example; ι = ∅; F finite | Λ′ = ⟨g⁴⟩ from 𝔞 = 15R; eigenvalue conclusion without torsion-freeness | 2·(−1/2) = −1; g ≡ diag(2,1) mod 3, diag(2,2) mod 5, order 4; Π(1 − η^j) = e; Λ′ = 1 has spectrum {1} | holds |
| §7.1 quotient | w ↦ −w, n = 2 and n = 1; reflection diag(1,1,−1) | cone; w²; smooth with torsion | invariants w₁², w₁w₂, w₂²; ℂ[w²]; (w₁, w₂²) | holds |
| §7.2 torsion-free quotient | image of Γ(3) | sphere with four punctures | index 12, 12/3 = 4 cusps, genus 0; Mok2012 line 309 to line 311 | holds |
| §7.3 finite quotients | PSL(2,ℤ) ⊃ image of Γ(2) | F ≅ S₃, quotient ℂ | index 6; ℙ¹ minus 3 points modulo S₃ is the j-line | holds |
| §7.4 n = 1 | elliptic point of order m | coordinate w^m on both sides | ℂ[w]^(C_m) = ℂ[w^m]; Mok2012 line 21 to line 23 | holds |
| §8.5 finite volume | n = 1 cusp; flat cylinder | finite; infinite | ∫₀^δ dr/(r log² r) = 1/(−log δ); ∫ dr/r = ∞; BaldiUllmo2023 line 586 to line 601, Mok2012 line 295 | holds |
| §10.2 extension | r + s = 1; exp(1/z) into Y(1) = ℂ | extends for torsion-free Γ; fails for PSL(2,ℤ) | Kiernan1972 Thm 1(ii) line 115, Thm 2 line 157: hyperbolically imbedded, normal crossings; limits 1 and ∞ along 1/(2πik), 1/k | holds |
| §10.3 Borel algebraicity | V smooth; V = {y² = x³}; exp: ℂ → Y(1) | stated for smooth V; line 819 and Summary say every variety | MilneSVI line 1742 to line 1744: nonsingular V; route needs AlgebraicModuliForArithmeticGeometry §9.5 (smooth U) | R01 |
| `biholomorphic_ball_iff` (§2.1) | n = 0; (w − 1/2)/(1 − w/2); w/2; lift i·g | iff, unique class | n = 0: both sides true; boost with tanh t = −1/2; w/2 has no inverse on B and diag(2,1) ∉ U(1,1); i·1 central | holds |
| `margulis_lemma` (§4.4) | C_m ⊂ K; S₃ ⊂ U(2); dense free subgroup; n = 0 | index ≤ m_n, virtual nilpotence, discreteness needed | C_m index 1; A₃ index 2; covering argument: chain C₀ ⊊ … ⊊ C_m needs m + 1 cosets, at most m exist | holds |
| `IsLattice.exists_finset_cuspPoint_orbits` (§6.1) | PSL(2,ℤ); cocompact; n = 0 | finitely many classes | F = {b₀}; F = ∅; sphere empty | holds |
| `IsLattice.compactSpace_quotient_iff` (§6.1) | PSL(2,ℤ); cocompact Γ; n = 0; ⟨R, T⟩ at (0, 1000i) | iff no cusp point | T parabolic, noncompact; inf d(x, px) attained excludes parabolics; both sides true; displacement 0.000707106752 | holds |
| `IsLattice.isFinitelyPresented` (§6.2) | PSL(2,ℤ); [F₂, F₂]; trivial group n = 0 | finitely presented; lattice needed | ⟨S, T⟩; infinite rank, infinite covolume; trivially presented | holds |
| `IsLattice.exists_neat`, `IsNeat` (§6.4) | lift diag(1/2, i, 2); n = 1; image of Γ(3) | ⟨γ⟩ not neat, ⟨γ²⟩ neat | ratios 2i·(i/2) = −1; γ² ratios (−4)^(±1), 16^(±1) generate ⟨−4⟩; cyclic case decided by λ₀/λ₁ | holds |
| `IsLattice` (§5.1) | trivial subgroup; S₃ coset Check; left versus right | Borel σ-algebra, left action | `QuotientGroup.measurableSpace` synthesised; γ • g = γ * g by `rfl`; {s, r²s, rs} ∪ {1, r, r²} partitions S₃ | holds |
| Conventions: Heisenberg law | a = 1, a′ = i; map to `TauCeti.HeisenbergGroup` | commutator T₋₄; (p, q, −t/4 + pq/2) | Im⟨1, i⟩ = 1; z″ = z + z′ + pq′, the law `mul_z` of the pinned file | holds |
| §§8.1–8.2 toroidal boundary | Γ_b = ⟨n_(λ,0), n_(iλ,0)⟩ | χ((1+i)λ) = −1; E′ principal; deg L_b = −1 | t = −2λ², τ = 4λ²; cocycle ratio exp(−4πi Im/τ)·exp(4πi Im/τ) = 1; c₁ = −E′(λ, iλ) = 1 as in AbelianSchemesAndArithmeticModuli §A5.3 | holds |
| §§9.2–9.4 Mok's theorem | image of Γ(2), ℓ ≥ 2; ℓ = 0, 1 | E = O(1); sections vanishing on D have dimension ℓ − 2 | O(ℓ − 3) on ℙ¹; dim S_(2ℓ)(Γ(2)) = −(2ℓ − 1) + 3(ℓ − 1) = ℓ − 2 | holds |
| §10.5 uniqueness of the finite-point compactification | Γ₀(2); doubled cusps; nodal cubic | Hausdorff and normal both needed | genus 1 + 3/12 − 1/4 − 1 = 0, two ends; six boundary points, not Hausdorff; node has two branches | holds |
| §11.3 Shimura datum | h₀(i); n = 2 and n = 1 component count | w ↦ −w; X = X⁺ for n = 2, two components for n = 1 | diag(1, −1, …, −1); det(−J)/det J = −1 (n = 2), +1 (n = 1) with SᴴJS = −J | holds |
| §12.4 intersection inequality | Q = B × {s}; B × S_Γ; {x₀} × S_Γ | dim U ≥ dim Q − n | 0 ≥ 0; n ≥ n; 0 ≥ 0 | holds |

- Previous review (of this same head): it listed no finding, so there was none to re-check.
- Sources: 36 locators read at their lines in the 8 cached texts (BaldiUllmo2023 5, Mok2012 6, Kiernan1972 4, WitteMorris2015 10, MilneSVI 5, Deng2020 1, Mostow1980 4, DeligneMostow1986 1), covering the 15 sampled targets; each supports its statement, apart from R01.
- Library: all 64 declaration locators of the supplier contracts opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d); each name is at its stated file and line. Mathlib's `Matrix.IsParabolic` (GeneralLinearGroup/FinTwo.lean:38) is the 2 × 2 notion only, and no pinned file has complex analytic spaces, analytification or Shimura data.
- Cross-roadmap: every cited section and named declaration of 24 roadmaps found on main (51d880d) or at the open heads of RealSemisimpleLieGroups, ShimuraVarieties, PELModuli, ShimuraData and ShimuraCompactifications; RealSemisimpleLieGroups §5.7, §5.6 and AbelianSchemesAndArithmeticModuli §A5.3 read for conventions. Both declared gaps match `design/plan.json`, and ComplexComparisonPartII has only the smooth cases.
- Gate: every check passes (`build=0 OK`). Dependency check: `depcheck: 243 roadmaps, 2270 edges, 0 problem(s)`. Nothing changes outside the folder; the pull request's text agrees with the head.
- Lean: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings and nothing else. The 16 elaborated types were compared with the README statements (no binder lost; the seventeenth listed name, `of`, is a word of a docstring). One-tactic probe (`rfl`, `infer_instance`, `simp`, `trivial`, `simp_all`): all 7 theorems stay open.
- Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, KleinianGroups, ShimuraVarieties, GeometricFreyMazur, FuchsianOrbifolds, AdelicAlgebraicGroups, ConformalMappingPartII; ball, PU(1,n), sub-balls: RealSemisimpleLieGroups §5.7; Baily–Borel and arithmetic Borel theorems: ShimuraVarieties; Fuchsian case: FuchsianOrbifolds; arithmetic lattices and neat levels: AdelicAlgebraicGroups; all cited. Selberg's lemma, the Margulis lemma for 𝔹ⁿ and Cartan's uniqueness theorem have no other owner.
- Source independence: 36 passages compared with 8 sources, and README and Lean scanned for 7-word runs shared with them: none beyond titles and forced statements (longest 10 words); largest share BaldiUllmo2023, 38 of 131 locators; contents compared with BaldiUllmo2023 (its §§1–7): independent.

## Not verifiable

- Goldman1999 Ch. 3 (§§1.4, 2.1, 2.3–2.5, 3.2–3.4): uncertified, and the only source locator of §3.2; checked against RealSemisimpleLieGroups §5.7 and by computation instead.
- Raghunathan1972 Theorem 6.11, Ch. VIII, Ch. XIII; GarlandRaghunathan1970 Theorems 0.7, 4.10 (waived); Borel1969 Cor. 17.7; Alperin1987; SiuYau1982: not readable; §§4.4, 4.5, 6.1, 6.3 checked through their proof routes and the cached citing texts.
- Cartan1957 pp. 90–102 (§§7.1, 7.3), Borel1972 Theorem A (§10.2), BailyBorel1966 Theorem 10.11 (§11.4): uncertified, locators not checked.

## Source issues

- **Error** in Mok2012 at equations (5)–(6), line 173 to line 175: the source says cusp-group elements have vertical component an integer multiple of τ, so the induced multiplier has no unitary factor; it should be any t_a determined modulo τ, giving a factor exp(2πi t_a/τ), which is −1 over (1+i)λ for ⟨n_(λ,0), n_(iλ,0)⟩; affects the proof.

## For the human reviewers

- none
