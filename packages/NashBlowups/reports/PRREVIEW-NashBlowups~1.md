# Review of NashBlowups (pull request #2413 at f8bd785)

**Verdict:** needs changes

## R01 (P3) — Four targets carry neither a locator nor the "roadmap's own" mark

**Location:** `TauCetiRoadmap/NashBlowups/README.md:1055`: "Prove *nashBlowup.baseChange*: for a field extension `k'/k` and `X` in the Setting, … `(X*)_{k'} ≅ (X_{k'})*` over `X_{k'}`, compatibly with the Nash cotangent bundles." Same for line 1030 (*nashBlowupHom_isIso_of_smooth*) and line 1665 (*nashIterate_of_smooth*, *normalizedNashIterate_of_smooth*).

**Claim:** Every theorem needs a locator, or the mark this README itself uses for statements of its own. These four targets have neither. *nashBlowup.baseChange* is one of the Summary's named results (compatibility with field extensions).

**Witness:** README lines 1055–1061 and 1665–1667 contain no source id. Compare §2.4, line 1001: "(the statement is this roadmap's own)".

**Repair:** After "compatibly with the Nash cotangent bundles" (line 1058), insert: "(the statement is this roadmap's own; its inputs are stacksNormalization, Morphisms Lemma 29.33.10, tag 01V0, line 2926, for `Ω`, and Lemma 29.26.16, tag 081I, line 2198, for the scheme-theoretic image; nobile1975, proof of Theorem 2, lines 147–148, uses it for an extension of algebraically closed fields)". At line 1031, after "then `ν` is an isomorphism", insert "(nashModificationNotes2024, Section 1, lines 110–111)". At line 1667, after "by induction on `i`", insert "(the statement is this roadmap's own)".

## R02 (P3) — The description's dependency paragraph lists no supplier

**Location:** The "Dependencies" paragraph in the pull request description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). … Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The paragraph promises a list but names no roadmap. Its four suppliers on main appear nowhere in the description. AdicSpacesPartIII and ResolutionOfSingularitiesCharacteristicZero §7.8 are named in the README but are neither consumers nor prerequisites, so "everything else … is a consumer" is false.

**Witness:** The README supplier contracts are "From TauCetiRoadmap.SchemeAndStackFoundations", "….EnhancedDerivedSheaves", "….ResolutionOfSingularitiesCharacteristicZero" and "….DiophantineApproximationAndTranscendence" (lines 359–395). AdicSpacesPartIII is named at line 76, for scope only.

**Repair:** Replace the paragraph with: "Dependencies. Suppliers still in pull requests (they merge first): AlgebraicModuliForArithmeticGeometry §§1.3, 5.4 and DerivedDeRhamCohomology §0.23. Suppliers on main: SchemeAndStackFoundations §§0.7, 0.11, 0.17, 0.23, 0.30, 4.11, 4.13; EnhancedDerivedSheaves §E1.6; ResolutionOfSingularitiesCharacteristicZero §2.15; DiophantineApproximationAndTranscendence §5.6. AdicSpacesPartIII §R3.6 and ResolutionOfSingularitiesCharacteristicZero §7.8 are named only to delimit scope. The Lean imports none of them."

## Verified sound

| Target | Instance | Roadmap side | Other side (computed, or source at locator) | Result |
|---|---|---|---|---|
| §0.3 *smoothLocusOfDim* | `𝔸²⊔𝔸¹`; `Spec k[ε]/(ε²)`, char ≠ 2 | `X_sm^{(2)}=𝔸²`, `X_sm^{(1)}=𝔸¹`, `X_sm^{(0)}=∅`; rank 1 at the point, locus `∅` | `X_sm=X`; `Ω=k[ε]dε/(2ε dε)≅k`, smooth locus empty; stacksAlgebra line 17618 (00TT, (1)⇒(3)) | holds |
| §0.4 *mapOfSurjective* | `S=Spec k[x₁,x₂,…]`, `p(a,b)=a`, `r=1,2` | `r=1`: image is the section `[1:0]`; `r=2`: image `∅` | conormal convention gives `[0:1]`; `Gr₂(O_S)=∅`, `Gr₂(O_S²)=S`; alperModuli lines 2985–3007, printed p. 62 (Noetherian there) | holds |
| §0.5 smooth at closed points | cusp over perfect `k`; `Spec 𝔽_p(t)(t^{1/p})` | cusp origin: `dim m/m² = 2 > 1`, not smooth; the field is regular | inseparable over `𝔽_p(t)`, so not smooth; stacksVarieties line 2130 (0B8X: reduced, perfect `k`) | holds |
| §0.6 normality under separable base change | `ℚ(i)⊗_ℚℚ(i)`; `C: x^p+y²+t` over `𝔽_p(t)`, then over `k(t^{1/p})` | `ℚ(i)×ℚ(i)`: normal, not integral; `u^p+y²=0` has a 2-dimensional cotangent space at the origin | `s↦(−s²,s^p)`: `(−s²)^p+s^{2p}=0` (p odd), birational; stacksVarieties line 1049 (0C3M) | holds |
| §0.7 `HasLocallyFreeQuotientOfDifferentials` | `X=∅`; cusp over `𝔽₂` and over `ℚ`; `𝔸¹`, `d=2` | `∅`: holds (`E=0`); `𝔽₂`: `dx↦0, dy↦1` kills `x²dx`; `ℚ`: fails | `ℚ`: `b=(3t/2)a` with `t∉k[[t²,t³]]`, so neither is a unit; `𝔸¹`: fibre dimension `1<2` | holds |
| §1.2 *nashModification* | `𝔸¹`, `F=O⊕O/(x)`, `U=D(x)`; `𝔸²`, `F=m₀` | `N≅𝔸¹`, `L_F=O`; `N=Bl₀𝔸²` | fibre of `Gr₁(F)` at 0 is `ℙ¹`; `Gr₁(m₀)=V(ya−xb)⊆𝔸²×ℙ¹`; nashModificationNotes2024 lines 216–225, gonzalezSprinberg1982 lines 85–90 | holds |
| §1.4 *pluckerIso* | `X` smooth, `F=Ω`, `r=d`; `r=1` | both sides are `X`; for `r=1` the map is the identity | `∧ᵈΩ` invertible, both closures are sections; gonzalezSprinberg1982 lines 99–104, nashModificationNotes2024 line 230 | holds |
| §2.2 proper, modification | `y²=x²z`, char ≠ 2 | `X*≅Bl₀𝔸²`, `ν` not finite, reduced fibre `ℙ¹` | `(uv)²=u²v²`; fibre ideal `(u,v²)` becomes `(vw,v²)`, with `v` nilpotent and `v∉(vw,v²)`; nobile1975 lines 314–324 | holds |
| §2.4 *lift*, *isIso_lift_iff* | `Bl₀𝔸²→𝔸²`; one line `X₁` of `𝔸¹⊔𝔸¹` | the lift is `π`, not an isomorphism; the classifying map is a closed immersion, but the lift is not an isomorphism | `π` is not a closed immersion; `X₁→X` is not surjective; nashModificationNotes2024 lines 153–162 (density not stated; see Source issues) | holds |
| §2.5 triviality criterion (headline) | cusp in characteristic 0, 2, 3 | `J_f=(y,x²)`: not an isomorphism; `(x²)` and `(y)`: isomorphism | free quotients `dx↦0, dy↦1` (char 2) and `dx↦1, dy↦0` (char 3); nobile1975 lines 136–141 | holds |
| §2.6 *baseChange* (R01) | cusp over `ℚ`, `k'=ℚ(i)`; `Spec k[y]/(y^p−t)`, `k'=k(t^{1/p})` | both sides are `𝔸¹_{ℚ(i)}`; the second scheme is outside the Setting | `k'[u]/(u^p)` with `u=y−τ` is non-reduced; no locator at the target | holds; locator missing |
| §3.1 Gauss map | `y=2x`; cusp in characteristic 5, 3, 2 | `[1:2]`; `[1:4t]`; `[1:0]`; `[0:1]` | conormal convention gives `[2:−1]`; `3/2=4` in `𝔽₅`; `df=2y dy`; `df=x²dx`; nobile1975 lines 29–44 | holds |
| §4.4 charZero criterion (Lean headline) | `∅`; `Spec K` with `K/ℚ` finite, `d=0`; cusp over `ℚ`; `ℚ[ε]/ε²`; `𝔸²⊔𝔸¹` | true/true; true/true; false/false; the last two are excluded by `IsReduced` and `IsPureDimensional` | `ℚ[ε]/ε²`: right side true, left false; `𝔸²⊔𝔸¹`, `d=2`: left side true, right false; nashModificationNotes2024 lines 179–181 | holds |
| §4.5 Nobile (headline) | node and cusp over `ℚ`; cusp over `𝔽₂` | `X*=𝔸¹⊔𝔸¹≠X`; `X*=𝔸¹`; `𝔽₂` is excluded by the hypothesis | over `𝔽₂` the cusp is singular with `ν` an isomorphism; nobile1975 lines 59–60 and 143 | holds |
| §5.1 *exists_pMonomialOperators* | `p=3`, `d=1` | `φ₀=id−x∂+2⁻¹x²∂²`, `φ₀(x²)=0` | inverse of `[[1,x,x²],[0,1,2x],[0,0,1]]` is `[[1,−x,x²],[0,1,−2x],[0,0,1]]`, with coefficients in `R`, not `k` | holds |
| §5.4 normal criterion (Lean headline) | `z²=xy` in char 2; `C` over `𝔽_p(t)`; cusp in char 3 | cone: false/false; `C` is excluded by `PerfectField`; the cusp by `IsNormalScheme` | cone: `Ω⊗κ=κ³`; a surjection onto `O²` forces `y∈(x)`, false in `k[y,z]/(z²)`; duarteNunezBetancourt2020 line 256 | holds |
| §5.4 Nash form (headline) | quadric cone in char ≠ 2; cusp in char 2 | `J=(x,y,z)`: `ν` not an isomorphism; the cusp is not normal | duarteNunezBetancourt2020 lines 256–257; nashModificationNotes2024 line 362 has a misprint ("singular") | holds |
| §6.1 *normalizedNashBlowup* | cusp in char 2; `y²=x²z` in char 2 | `X*≅X`, `X̄*=𝔸¹`; `X*=X` | `∂_x=−2xz=0`, `∂_y=2y=0`, `∂_z=−x²`, so `J=(x²)`; castilloDuarteLeytonLiendo2026 lines 20–21 | holds |
| §6.2 *lift* | `Spec κ(x)→X_sm` with `d≥1`; `X=Spec k`, `d=0` | the first is excluded; the second lifts by the identity | a closed point is not generic for `d≥1`; stacksNormalization line 6570 (035Q(4)) | holds |
| §6.4 `ν̄` criterion (headline) | cusp in char 2; `C` over `𝔽_p(t)` | `ν` an isomorphism, `X` not normal, `ν̄` not an isomorphism; `ν̄` an isomorphism, `C` not smooth | `𝔸¹→cusp` is bijective, not an isomorphism; nashModificationNotes2024 lines 515–517; stacksNormalization line 6636 | holds |
| §7.2 *iterate_openSubscheme* | cusp in char 2 (Nash); `Y_m⊇X` | `X^{(j)}⊇X` for all `j`; `Y_{2m}⊇Y_m⊇X` | an open subscheme of an open subscheme is open; castilloDuarteLeytonLiendo2026 lines 58–67 | holds |
| §7.3 never-resolves (headline) | `m=0` with the cusp in char 0; cusp in char 2 with `m=1` | `m=0`: the hypothesis holds, the conclusion fails (`Y₁=𝔸¹`); char 2: no `X^{(i)}` is smooth | `Y₁=𝔸¹` contains no open subscheme isomorphic to the cusp; castilloDuarteLeytonLiendo2026 line 66 | holds |

- Source locators: 84 checked against the cached texts in 10 sources: stacksAlgebra 13, stacksNormalization 12, stacksVarieties 4, nashModificationNotes2024 16, nobile1975 12, duarteNunezBetancourt2020 9, gonzalezSprinberg1982 7, castilloDuarteLeytonLiendo2026 5, alperModuli 3, hamann2003 3. Every one is at the stated line, with the stated hypotheses.
- Library: 95 declarations the README names, elaborated with `#check @` at the pins. All resolve, and their elaborated types agree with the contracts, e.g. `FixedRank`, `IsPureDimensional`, `relativeDifferentialsStalkEquiv`, `powRingHom_finite`, `LinearMap.bijective_of_depth`, `isIso_normalizationDesc_iff`. Mathlib at the pin has no `isReduced_image`.
- Cross-roadmap citations: 21 resolved.
  - AlgebraicModuliForArithmeticGeometry §§1.3, 5.4, at #853 head e5f9c4c.
  - DerivedDeRhamCohomology §0.23 (`IsPBasis`, `pBasis_kaehler_basis`; the converse is in its prose), at #868 head 9c29cd5.
  - SchemeAndStackFoundations §§0.7, 0.11, 0.17, 0.23, 0.30, 4.11, 4.13, on main and at #1808.
  - EnhancedDerivedSheaves §E1.6, on main and at #1330.
  - On main: ResolutionOfSingularitiesCharacteristicZero §§2.15, 7.8; DiophantineApproximationAndTranscendence §5.6; AdicSpacesPartIII §R3.6.
- Gate: the worker's gate passes every check. The dependency check prints `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean TauCetiRoadmap/NashBlowups/Suggested.lean` gives only two `declaration uses sorry` warnings. `#check @` of the 3 declarations matches README §§0.7, 4.4 and 5.4, with no binder lost. The one-tactic probe (`simp`, `exact?`, `constructor <;> intro h <;> simp_all`) closes neither theorem, so neither is padding.
- Duplication: searched the pins and all roadmaps for normality under separable base change, normality of colimits of normal rings, derivation-stable minimal primes, the Lie derivative on Kähler differentials, smoothness from regularity at closed points, and scheme pullback and base-change maps of `Ω`. None is stated elsewhere: AdicSpacesPartIII §R3.6 concerns adic spaces, and no other roadmap names Nash blowups.
- Overlap check: read SchemeAndStackFoundations (main and #1808), PurityOfBranchLocus (#1807), DirectSummandsAndBigCohenMacaulay (#1735) and AbhyankarLemma (main). Shared with SchemeAndStackFoundations: regular locus equals smooth locus, normal schemes, modifications and field-extension descent; that roadmap owns them and this one cites it. Nothing else is shared.
- Source independence: 15 passages compared with 8 sources, at most 4 consecutive words shared; the largest share is nashModificationNotes2024, 23 of 122 source mentions. Contents compared with nashModificationNotes2024 §§1–7: independent. Layer 1 (its §3) precedes Layer 2 (its §1), and its §§4 and 7 are unused.

## Not verifiable

- hironaka1983, Section 1: uncertified in the manifest; cited by locator only, not opened.
- spivakovsky1990, Introduction: uncertified; cited by locator only.
- semple1954, pp. 24–49: uncertified; cited by locator only.
- teissier1982, pp. 314–491: uncertified; cited by locator only.
- ega1, §9.7: uncertified; cited by locator only.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, p. 10: the source says the Nash modification of a normal variety in characteristic p is an isomorphism iff the variety is singular; it should be nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Section 2, Propositions 2.2 and 2.3, p. 5: the source prints one proposition, with its preceding paragraph, twice under two numbers; it should appear once; affects nothing.
- **Error** in nashModificationNotes2024 at Section 2, p. 4: the source states the universal property for every morphism Z → X carrying a rank-d quotient; it should require Z reduced with dense preimage of the regular locus, since a point over the cusp's singular point with another quotient does not lift; affects a stated result.
- **Error** in nashModificationNotes2024 at Section 3, p. 6: the source states the universal property of N(S, F) for every h : T → S with a d-quotient of h*F; it should require T reduced with h⁻¹(U) dense; affects a stated result.
- **Error** in nashModificationNotes2024 at Section 5, step (b), p. 10: the source says the coefficients of the operators Φ_γ lie in k; they must lie in R (for p = 2, d = 1, Φ_0 = id − x∂); affects the proof.
- **Misprint** in duarteNunezBetancourt2020 at the proof of Theorem 3.10, p. 7: the source writes the matrix entries and the operators φ_γ with ∂^α, just after building δ with δ_t(x_j) the Kronecker delta; it should read δ^α; affects nothing.
- **Misprint** in hamann2003 at the proof of Lemma 0.1, p. 2: the source says J is the annihilator of some x not in J; it should say P = (J : x), the annihilator of the class of x in R/J; affects nothing.

## For the human reviewers

- none
