# Review of SchemeKTheoryOperations (pull request #1229 at 5571221)

**Verdict:** needs changes

## R01 (P2) — §6.4: uniqueness of the lifted homotopy class does not follow from the named inputs

**Location:** `TauCetiRoadmap/SchemeKTheoryOperations/README.md` line 2409: "there is a unique homotopy class `f:BGL(A)⁺→H` with `η_T=f_*q_T` for all T … Include the uniqueness argument on the whole source, rather than inferring it from agreement at each finite rank."

**Claim:** A natural transformation `η` determines the class of f in `[BGL(A)⁺,H]`, and the classes lifting the stable λ-expressions are independent of choices.

**Witness:** Every `q_T(ρ)` factors through some `BGL_N(A)`, so η fixes only the classes `f∘i_N`. Milnor's sequence leaves f free in `lim¹_N[ΣBGL_N(A),H]`; StableHomotopyKTheory §§3.21–3.25 bound nothing there. For `H=BGL(A)⁺` no stability range kills it.

**Repair:** State what the route proves. Replace the sentence by: "there is a map `f:BGL(A)⁺→H` with `η_T=f_*q_T` for all T, unique up to weak homotopy: two such maps are homotopic on every `BGL_N(A)` and on every `BGL_N(A)⁺`, `N≥3`, hence induce the same map `[T,BGL(A)⁺]→[T,H]` for every finite T, in particular on every `K_m(A)`. The class of f in `[BGL(A)⁺,H]` is unique when `lim¹_N[ΣBGL_N(A),H]=0`, by the sequence `0→lim¹_N[ΣBGL_N(A),H]→[BGL(A),H]→lim_N[BGL_N(A),H]→0`." Reword the three dependants the same way: "choice independence" of the lifted λ-expressions (same paragraph), the Check "the unique factor is the identity" (line 2415: "every factor is weakly homotopic to the identity"), and line 2443 ("commutes with λ-operations up to weak homotopy, hence on `K_m` and on `[T,−]` for finite T"). The operations on `K_m(A)` and on `[T,BGL(A)⁺]` for finite T, which are all that §§6.4–6.9 and §7.3a use, are unchanged. Add the Milnor sequence of a telescope to the *Needs:* line.

## R02 (P2) — A headline that is statable at the pins is absent from `Suggested.lean`: van der Kallen stability (§6.7)

**Location:** `TauCetiRoadmap/SchemeKTheoryOperations/Suggested.lean` lines 19–28 (module docstring) and README line 2592: "For a commutative Noetherian ring of Krull dimension at most d … both maps are bijective for `n≥2m+max(1,d)`."

**Claim:** The docstring lists the headlines that are not statable; it neither states nor lists the stability theorem that Scope and ownership makes §6.7 the owner of.

**Witness:** `TauCeti.stabilizeGL` (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:79`), `groupHomology.map`, `ringKrullDim` exist at the pins. HomologicalStabilityOfGeneralLinearGroups' `Suggested.lean` states the twisted form on them and says the constant-coefficient form is "SchemeKTheoryOperations §6.7's and … not restated here".

**Repair:** Add, under `/-! ## Layer 6: Products, λ-operations and Adams weights -/`, with the extra import `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable` (this text elaborates at the pins, `sorry` the only warning):

```lean
/-- van der Kallen's homology stability, Noetherian form (README §6.7; Kal80, Theorem 4.11,
p.289, with Bass's bound): onto for `n ≥ 2m + max 1 d - 1`, bijective for `n ≥ 2m + max 1 d`. -/
theorem groupHomology_stabilizeGL_of_ringKrullDim_le (R : Type) [CommRing R] [IsNoetherianRing R]
    (d m n : ℕ) (hd : ringKrullDim R ≤ d)
    (φ : Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) R) ℤ ⟶
      Rep.res (TauCeti.stabilizeGL R (Nat.le_succ n))
        (Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin (n + 1)) R) ℤ))
    (hφ : ∀ z : ℤ, φ.hom.toLinearMap z = z) :
    (2 * m + max 1 d ≤ n + 1 → Function.Surjective
      (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) ∧
    (2 * m + max 1 d ≤ n → Function.Bijective
      (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) := by
  sorry
```

Name it in §6.7's interface bullet and in the paragraph of "How to read the build" (line 107), and say in the docstring that the `SR_(s+2)` form lacks a stable-range predicate at the pins and that `R : Type` is forced by Mathlib's `Rep ℤ G`. On the README's own instances the statement gives: `𝔽₂`, `m=1` (`d=0`): onto from `n=2`, bijective from `n=3` (`0, ℤ/2, 0, 0`); `ℤ`, `m=1`: `(ℤ/2)²→ℤ/2` onto at `n=2`.

## R03 (P3) — Supplier declarations named that do not exist where they are cited

**Location:** README line 1846: "with the supplied `ProjectiveBundles.IsCMRegular`" (and line 1862); line 79: "§§7.21–7.23 supply `FilteredSpectrum`, `ExactCouple` and `FilteredSpectrum.spectralSequence.map`" (and line 1516).

**Claim:** These are the suppliers' names for the regularity predicate and for filtered spectra, exact couples and the induced map of spectral sequences.

**Witness:** AlgebraicModuliForArithmeticGeometry §1.5 at its head defines `cmRegularity` ("Define `cmRegularity`. A coherent F on `Pⁿ_k` is m-regular…"); `IsCMRegular` occurs in no roadmap. StableHomotopyKTheory §§7.21–7.23 at its head contain none of the three names; nor do the pins.

**Repair:** Line 1846: "with the supplied m-regularity predicate `cmRegularity`"; line 1862: "agrees with the supplied `cmRegularity` on `P^{r−1}_k`". Line 79: "§§7.21–7.23 supply filtered spectra, exact couples with their derived couples, and the spectral sequence of a filtered spectrum, natural in maps of filtered spectra". Line 1516: "StableHomotopyKTheory §7.23, the map of spectral sequences induced by a map of filtered spectra".

## R04 (P3) — A target is attributed to ColemanIntegration under a name that roadmap does not have

**Location:** README line 3187: "The downstream target `adams_exactCube_comparison`, owned by ColemanIntegration, has the following contract."

**Claim:** ColemanIntegration has a target of this name comparing its cube operations with §6.8's.

**Witness:** `adams_exactCube_comparison` occurs in no roadmap but this one. ColemanIntegration's README at its head (line 2408) has `exactCubeComplex.homologyEquivK` and `adamsOnExactCubes` "agreeing on `K_m(B)` with the Adams operations of MotivicEtaleKTheory §2.0a".

**Repair:** Replace the sentence by: "ColemanIntegration L3.Fa.1 compares the operations induced by `adamsOnExactCubes` with the Adams operations of MotivicEtaleKTheory §2.0a, which are §6.8's under the §2.5 comparison; the comparison with §6.8 reads as follows." Keep the contract text; drop the invented name.

## R05 (P3) — Lean-style names of this roadmap's own that `Suggested.lean` does not declare

**Location:** README line 1045: "`SpecialK1 A` and the unit/SK₁ splitting : `K₁(A) ≃ Additive(A^×) ⊕ SpecialK1 A` as names for this transported package"; line 2715: "`coefficientMooreComparison :`"; line 2544: "`.map`, `.homologyEquiv`".

**Claim:** These read as declarations; a backticked name of the roadmap's own claims that `Suggested.lean` declares it.

**Witness:** `Suggested.lean` declares `IsStrictlyPerfect`, `IsPerfectComplex`, `IsPerfectComplex.exists_strictlyPerfect` only. `SpecialK1` occurs in AlgebraicKTheory neither in its README nor in its `Suggested.lean` (main); it occurs only here and in KTheoryLowDegrees, which cites §3.6 for it.

**Repair:** Line 1045: "Retain the transported stable determinant `K₁(A)→A^×`, its kernel `SK₁(A)` and the splitting `K₁(A)≃A^×⊕SK₁(A)`", and "`SK₁(A)`" for "`SpecialK1 A`" in the Check of line 1051. Line 2715: delete the identifier line and keep the displayed isomorphism. Line 2544: "Expose its localization unit, its functoriality, its invariance under integral homology equivalences, and the completed stable-GL/plus comparison."

## R06 (P3) — "reducedness" is used without a definition

**Location:** README line 1336: "Both reducedness and the dimension hypothesis are retained."

**Claim:** The Brown–Gersten vanishing statement has a hypothesis called reducedness.

**Witness:** The statement in the same paragraph has three hypotheses: zero value on the empty set, the Mayer–Vietoris property, zero homotopy sheaves. Weibel line 27064 (Proposition V.10.8) has no hypothesis of that name. The Check of line 1332 (constant `Hℤ`) tests `F(∅)=0`.

**Repair:** "Both the condition `F(∅)≃0` and the dimension hypothesis are retained."

## R07 (P3) — Five sentences are broken where a name was replaced by a description

**Location:** README line 1344: "Compare the squares with Mathlib’s a Mayer–Vietoris square"; line 1603: "The target the Weierstrass finite-free comparison writes the changed t"; line 1846: "The comparison the field regularity comparison identifies"; line 1702; line 73.

**Claim:** Each is a sentence of the roadmap.

**Witness:** None parses. Line 1702 reads "The retained extension derived Čech charts over the integers has arbitrary characteristic"; line 73 reads "§3.6's the transported stable determinant". Mathlib's structure is `CategoryTheory.GrothendieckTopology.MayerVietorisSquare` (`Mathlib/CategoryTheory/Sites/MayerVietorisSquare.lean:87`).

**Repair:** Line 1344: "with Mathlib's `CategoryTheory.GrothendieckTopology.MayerVietorisSquare`" (and the same name in lines 1352 and 1762). Line 1603: "The Weierstrass finite-free comparison writes the changed t". Line 1846: "The field regularity comparison identifies". Line 1702: "The extension to derived Čech charts over the integers allows arbitrary characteristic". Line 73: "§3.6's transported stable determinant, its kernel and the unit/SK₁ splitting".

## R08 (P3) — Locator: §8.1 of GS87 begins a page earlier

**Location:** README line 3153: "[GS87, §8.1 and Theorem8.2, printed274–275]".

**Claim:** §8.1 and Theorem 8.2 are on printed pp. 274–275.

**Witness:** GS87 line 1255 (§8.1) is on PDF p.32, printed p.273 under the README's own rule "printed page = PDF page+241"; GS87 line 1284 (Theorem 8.2) is on PDF p.33, printed p.274.

**Repair:** "[GS87, §8.1 and Theorem 8.2, printed 273–275]".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 finite-level pseudo-coherence, Tor intervals | `M[0]` at `m=0,−1`; k over `k[ε]/ε²`; `k⊗ᴸ_{k[x]}k` | finite type / finite presentation; `Tor_i(k,k)=k` all i, no interval; `k⊕k[1]`, `[−1,0]` over k, `[−2,0]` over `k[x]`; Stacks.perfect line 1059 gives `D⁻_Coh` | agree | none |
| §1.4 coherator, `D(QCoh)≃D_QCoh` | `j_!O` on a DVR; doubled plane | `Γ(j_!O)=0` so `Q=0`, counit not iso; Stacks.perfect line 760 needs quasi-compact + affine diagonal, as stated | agree | none |
| §1.6 and `IsPerfectComplex.exists_strictlyPerfect` | doubled plane; doubled line; ∅; hypothesis against Stacks.perfect lines 4197, 4392 | `K₀^naive=ℤ`, `K₀=ℤ²` (split sequence `K(k)→K(X)→K(A²)`); line has affine diagonal; `P=0` on ∅; `hres` is Definition 36.1, conclusion Lemma 37.2 | agree | none |
| §2.1 K, 𝕂, G | nodal cubic; dual numbers; even-Euler subcategory | `K₋₁=coker((a,b)↦(a+b,a+b))=ℤ`; Cartan `1↦2[k]`; `2ℤ→ℤ` | agree | none |
| §2.2 derived pullback | x-resolution at the origin; `Lι*k` on dual numbers | `k —0→ k`, `H⁻¹=H⁰=k`, class 0; cohomology k in every degree ≤0 | agree | none |
| §3.2 extension and localization | Stacks.perfect lines 1510, 1554, 1588, 1629, 2020; DVR quotient | `F[−r]⊕E`, `F⊕F[1]`, supported form, summand form, `I⊗ᴸP→E` zero: as restated; `End(O)=Frac O` | agree | none |
| §3.3 localization and boundary (headline) | `ℤ_(p)`; `ℤ_(5)`; `Spec ℚ→Spec ℤ` | `∂[p]=1`, `∂[12]=2` at 2; `∂([5][2])=[2]`, `∂([2][5])=−[2]=[3]`; fibre `K₀=ℚ^×/±1=⊕_pℤ`; GeneralAlgebraicKTheory §8.13 has the same `(−1)^{n−1}` | agree | none |
| §3.4 excision and support models | `V(x)` and `V(x²)` in A¹ | supported `K₁=k^×` for both; `K₁(k[x]/x²)=k^××(1+xk)` | agree | none |
| §3.6 determinant and specialization (R05) | `diag(u,v)`; ℤ; `s=5→10` on `[5]` | `uv`; `diag(−1,−1)` trivial; change `−λ(2̄)∂[5]=−[2]≠0`, and `−λ(ū)∂a=(−1)^n∂a·λ(ū)` | agree | R05 names |
| §4.1 Mayer–Vietoris, Brown–Gersten (R06) | two P¹ glued at two nodes; constant `Hℤ` | `ℤ²→ℤ²` diagonal image, `π₋₁=ℤ`; squares cartesian but `F(∅)≠0` | agree | R06 wording |
| §4.3 hypercohomology and K-sheaves | `O^×` on P¹; two points; Thomason.1985 line 668 | `π₋₁=Pic=ℤ`; `ℤ²`; differential `(r,r−1)` | agree | none |
| §4.6 Gersten, Bloch (headline) | `𝔽_p[t]_(t)`; `ℝ+xℂ[x]` at `(x,ix)`; Weibel line 26782 | `0→K₂(R)→K₂(F)→𝔽_p^×→0`; `ℓ(R/x)=ℓ(R/ix)=2`, image `2ℤ`, `G₀=ℤ⊕ℤ/2`; source has the same hypothesis | agree | none |
| §4.11 Witt hyperdescent, degree | `W₂(𝔽₂)`; `W(k)/p^m`; `p^{−1}`; `k×k` | lifts' automorphisms `{1,3}`; degree m; `c(p^r)=(m+r)[k]−m[k]=r[k]`, so −1; `(1,2)` | agree | none |
| §5.5 projective bundle (headline) | `r=2`; `O(m)` on P¹; `O(−1)` | matrix `(a₀,a₁)↦(a₀,2a₀+a₁)`; `(m+1,−m)`, `π_*=m+1`; 1-regular, `H¹(O(−2))=k` | agree | none |
| §5.6 Bass (headline) | dual numbers; `k[T,T⁻¹]` | `1+εT∈NK₁`, value `1+ε≠0` at `T=1`; `∂_T[T]=1`, `T→T⁻¹` gives −1 | agree | none |
| §5.8 blowup (headline) | `Bl₀A²`, `Bl_xP²`; `d=1` | `ℤ²`, `ℤ⁴=1+2+1`; `Li*i_*k=k⊕k[1]` so recovery fails, as stated | agree | none |
| §6.2 λ-rings and filtrations | binomial ℤ; `P₂`, `P_{2,2}`; `ℤ[C₂]`; `x=(u−1)³`; `η=εδ` | `λ²(2)=1`; `P₂(2,1;2,1)=6`, `P_{2,2}(4,6,4,1)=15`; `Fⁿ=2^{n−1}ℤ(σ−1)`; `γ_t(x)=1+x(t−3t²+2t³)`, `F³J=2J`; `γ_tη=1+η(t−t²)` | agree | none |
| §6.4 operations and products | `γ²(xy)` coefficients; `z=[t][u][2]`; uniqueness of the lift | `(−1,2,2,−2)`; `γ²z=−3z` against `−z`; class free in `lim¹_N[ΣBGL_N(A),H]` | formula agrees; uniqueness does not follow | R01 |
| §6.7 van der Kallen (headline, R02) | `𝔽₂`, ℤ, `m=1`; frames over `𝔽₂`, `𝔽₂×𝔽₂`; `S₃` hyperhomology | `0,ℤ/2,0,0`; `(ℤ/2)²→ℤ/2`; `H₁` rank `6−3+1=4`; 2 components; both spectral sequences give `ℤ/2`, resp. 0; Kal80 lines 275, 874 | agree | R02 Lean |
| §6.8 scheme operations | unit u; `1+aε` | `ψ^k=k`, `λ²=−1`; `(1+aε)^k=1+kaε` | agree | none |
| §6.9 weights (headline) | Moore comparison; `ℓ>N+1` | `[Σ^{m−1}S/n,E]=π_m(E/n)`; `k^i` distinct mod ℓ for `i≤N`, squared factors comaximal | agree | none |
| §6.10 Bott classes | line L; `1−u` | `θ^{−1}(L)=−L^{−1}`, `θ^{−2}(L)=−L^{−2}(1+L)`; `λ_t(1−u)=(1+t)/(1+ut)` | agree | none |
| §7.3a Chern classes (headline) | units a,b,c; `2[O(1)]` on P²; K-cohomology; non-quasi-separated X | `c_{2,2}=−c₁c₁`, `c_{3,3}=2c₁c₁c₁`; `c₂=ξ²`; `H^{2i−j}(𝒦_i[−i])=H^{i−j}(𝒦_i)`; `a=x_i·b` impossible in `k[x_i]^×` | agree | none |
| §7.5 Adams Riemann–Roch (headline) | P¹, `k=2`; `Spec ℚ` over `ℤ_(p)` in two ambients | `π_*((1+h)/2)=1=ψ²π_*1`; `k^{d−j}k^{−r}k^{−e}`: `(2,1,1)` and `(1,0,1)` both give `k^{−1}` | agree | none |
| §7.6 excess and self-intersection (headline) | zero section of L; point on a curve; Thomason93 lines 519–565 | `1−L∨`; `Tor₀=Tor₁=k`, operator 0; `(3.1.3)`, `(3.2.1)`, `(3.1.4)` as restated | agree | none |
| §7.7 supported cycles (headline) | `O/π^m` on a DVR; GS87 line 1284 | `m[s]`; regular of finite Krull dimension, as stated | agree | R08 page |
| §5.4 relative regularity (R03) | `O(n)` on P¹ | 0-regular iff `n≥0`; supplier's Check: `O(a)` m-regular iff `a+m≥0` | agree | R03 name |

- Source locators checked against the text: 231. Stacks.perfect 47 tags (14 statements read), Stacks.cohomology 22, Stacks.more-algebra 3, Stacks divisors 1, Weibel 105 labels with their pages, BS17 12, Thomason93 9, Kal80 8, WeibelChern 10, GS87 8, Thomason.1985 3, LiLiu.2021 2, Totaro.2004 1; one wrong (R08).
- Library declarations opened at the pins: about 50, all present, among them `TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean:113` (its docstring says only the surjective half is proved), `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410`, `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:254`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean:61`.
- Cross-roadmap citations resolved: about 145 sections or names in 17 roadmaps (GeneralAlgebraicKTheory 36 sections, StableHomotopyKTheory 20, EnhancedDerivedSheaves 25, SchemeAndStackFoundations 25, and 13 others on main or at their heads); 5 names not found (R03, R04).
- Gate at this head: every check passed. Dependency check: `depcheck: 223 roadmaps, 1978 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: one warning, `declaration uses sorry` at 57:8.
- One-tactic probe on the one theorem: `simp` (no progress), `rfl`, `infer_instance` all fail; no padding. The three elaborated signatures match README §§1.1, 1.3, 1.6; no binder lost.
- Pull-request text read against the head: no sentence contradicted; nothing outside the folder is changed.
- Overlap check: read GeneralAlgebraicKTheory, KTheoryFiniteLocalFields, KTheoryLowDegrees, MotivicEtaleKTheory, SchemeKTheoryOperationsPartII, EnhancedDerivedSheaves, SchemeAndStackFoundations, BordismFormalGroups, and HomologicalStabilityOfGeneralLinearGroups, QWittVectors, MotivesAndAlgebraicCycles for shared objects. Chern classes on higher K-groups: this roadmap §7.3a (the others cite it); λ-ring foundations: §6.2 (KTheoryLowDegrees, QWittVectors cite it); constant-coefficient stability of `GL_n`: §6.7 (the twisted forms are HomologicalStabilityOfGeneralLinearGroups'); `K₀`, `G₀`, Chow groups: SchemeAndStackFoundations §5.7 (cited here); Brown–Gersten for complexes: SchemeAndStackFoundations §2.14 (cited; §4.1 is the spectral form).
- Source independence: 16 passages compared with 9 sources, none shared; largest share Weibel, 209 of 682 locators; contents compared with Weibel (chapters II, IV, V): independent, Layer 4 puts descent before coniveau where Weibel V.9–V.10 has the reverse, Layer 5 joins V.1, V.6 and V.8 with the blowup formula, Layers 1 and 3.8–3.9 have no counterpart. TT90, the second source (159 locators), could not be read.

## Not verifiable

- TT90 (159 locators, among them those of §§1.2, 1.4, 1.6, 2.1, 2.2, 3.2, 3.4, 4.3, 6.8): the sources service found no legal copy; the README's link is to a personal site.
- Soulé, Opérations en K-théorie algébrique (51 locators, §§6.2, 6.4, 6.8): the service could not obtain the text from the journal's page.
- GS99 (17 locators, §6.8): only an archived copy of a preprint server; not accepted by the service.
- Quillen (17 locators, among them Theorem 5.19 for §4.6) and Schlichting (6, §2.1): copies on third parties' pages; not accepted by the service.
- Zhang.2021 (3 locators, §7.7): not obtained.
- Gillet.1981: settled as uncertified; cited by locator only.
- Weibel line 25665 (Corollary V.7.6.1) is for quasi-projective X; §3.4's ample-family form rests on TT90, Exercise 5.7, not read.
- Outside the sample and not opened: Riou, Serre.1968, Kratzer, Feliu, Borel–Serre, Zhu.2017, Bhatt.2014, Scholze, Hoyois.2016, AsokHoyoisWendt.2015, Brown–Gersten, Panin.2003, Geisser, Schneider, Jannsen.1988, HuberWildeshaus, Soulé.1979, Gillet.1980.

## Source issues

- **Misprint** in Weibel at Corollary V.6.7.4, PDF p.420: the source says the map from the K-groups of an algebraically closed field to those of any commutative algebra over it is injective; it should be any nonzero commutative algebra; affects a stated result.
- **Gap** in Weibel at Proposition IV.5.7, PDF p.323: the source says the map out of the plus construction inducing a given natural transformation is unique up to homotopy, by obstruction theory on the finite stages; it should be unique up to weak homotopy, or assume the lim¹ term over the finite stages vanishes; affects a stated result.
- **Misprint** in BS17 at the proof of Theorem 11.2(2), assertion (1), p.47: the source says the fixed-amplitude perfect complexes form a presheaf of (b−a)-truncated spaces; it should be (b−a+1)-truncated spaces, the mapping spaces being (b−a)-truncated; affects nothing.

## For the human reviewers

- **Licence.** TT90, 159 of 682 locators, is linked at a personal site (README line 3207); the sources service found no legal source for it. The status of that copy was not settled.
- **Licence.** Quillen (a third party's university page), Schlichting (another author's university page), GS99 (web archive of a preprint server), Zhang.2021 (a university archive) and Schneider (a seminar's copy of a book chapter) are linked at hosts not classified here.
- **Not tested.** The largest source, Weibel, was read. The second, TT90, was not: wording and arrangement were not compared with it.
