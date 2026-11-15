# Review of HigherHidaAndColemanTheory (pull request #2342 at b82e0be)

**Verdict:** accepted

No finding. The acceptance is conditional on the ten declared supplier gaps (`gap:solid-localization-kernel`, `gap:discrete-adic-solid-comparison`, `gap:siegel-ordinary-igusa`, `gap:klingen-height-one-igusa`, `gap:abelian-affinoid-basis`, `gap:projective-banach-cohomology`, `gap:banach-support-duality`, `gap:coherent-correspondences`, `gap:abelian-subcanonical-vanishing`, `gap:klingen-lci-model`), each stated in `TauCetiRoadmap/HigherHidaAndColemanTheory/README.md` under its supplier with the same slug.

## Verified sound

Coordinates used below: GL₂ with `ρ=(−1/2,1/2)`, `κ=(k,0)`, `t=diag(1,p)`; GSp₄ with `ρ=(−1,−2)`, `2ρ_nc=(−3,−3)`, `v(t₂)=(−1/2,−1/2;−1/2)`, `v(t₁)=(0,−1;−1)`.

| Statement | Instances tried | Values computed (README side / source or recomputed side) | Result |
| --- | --- | --- | --- |
| §1.1 weight dictionary | GSp₄ `ν=(0,−2)`; GL₂ `ν=0`; `(κ∨)∨` | `κ_w=(5,3),(5,1),(2,−2),(0,−2)`; GL₂ `κ=−2ρ, 0`; `(5,3)∨=(0,−2)`, `(5,1)∨=(2,−2)`, double dual returns `κ` | agrees |
| §1.2 slope regions (sampled) | GL₂ long chamber, weight k | `A_long(t)=k`; `a_long(t)=k`, `a_long+w⁻¹2ρ_nc → k−1`; strongly small = `λ<k` = small. BP-Coleman lines 5636–5648, 6022–6032, 6210–6215 | agrees |
| §2.5 coefficient change (sampled) | `M` finite, `A→A′` finite, Tor independence | BP-Hida lines 1039–1052 (flat F, finite-type discrete M), 1132–1143 (finite `S′→S`, Tor independent) | agrees |
| §2.7 Serre duality (sampled) | point d=0; `ℙ¹_(𝔽₂)` d=1; `𝔸¹` with `D+={∞}` | point: `𝔽₂×𝔽₂→𝔽₂`; `ℙ¹`: `RHom(RΓ(Ω¹[1]),A)=𝔽₂[0]`; `𝔸¹`: `𝔽₂[t]`, not perfect. BP-Hida lines 1202–1210 (strict, A artinian) | agrees |
| §2.8 finite rank and bridge (sampled) | two-point and three-point schemes; printed versus corrected cross-containment | `K(∅,∅)=𝔽₂²`, `K({a},∅)=𝔽₂`, `{a}⊆∅` fails; three points: `T²f=(f(a),f(a),f(a))`, both ordinary objects `𝔽₂[0]`. BP-Hida lines 1576–1582, 1650–1652, 1664–1692 | agrees; corrected direction is that of Prop. 2.10.4 |
| §3.2 normalized operator | GL₂ k=2, p=3, `t=diag(2,3)`, `diag(1,3)`, `diag(2,6)` | `ν_id=(−1,−1)`, `ν_long=(0,−2)`; values `1/6, 1/9`, `c_long=3/2`; `3`; `1/12, 1/36`, `c_long=3` | agrees |
| §3.6 Cousin sequence (sampled) | `w′∉Cκ+`, GL₂ k=2 and k≤0 | `n_long=1` (k=2); `n_id=1−k` (k≤0); both 0 at k=1. BP-Hida lines 2666–2674 | agrees |
| §3.7 regular control (sampled) | GL₂ k=2, p=3 | `ν_id(κ)(t)=p⁻¹`; `U_naive`-eigenvalue 3 ↔ `t_κ`-eigenvalue 1; eigenvalue 1 ↔ 1/3. BP-Hida lines 2677–2688 (twist `−ν`) | agrees |
| §3.8 Hecke relations | g=1, ℓ=2, 3; Iwahori level | degrees `(ℓ+1)²=(ℓ²+ℓ)+(ℓ+1)`: 9=6+3, 16=12+4; `ωs=diag(1,ℓ)`, `sω=diag(ℓ,1)` distinct | agrees |
| §4.2 level independence (sampled) | equal versus distinct torus parts | BP-Hida lines 1268, 2800–2802: hypothesis `T_(w,K)=T_(w,K′)` only | agrees |
| §4.4 admissibility (sampled) | `C⁰(T′,ℤ_p)[0]` | dual `Λ′[0]`; BP-Hida lines 2845–2856, 2930–2940 (`lim_m colim_n ℤ/p^m[T′(ℤ/p^n)]=C⁰`) | agrees |
| §4.6 derived control (headline) | `ν(u)=u^k`, `u=1+p`, k=0, 1 | `[u]↦u^(−k)`: `(1+p)⁻¹` at k=1, 1 at k=0; same map in §4.5 and §8.3 | consistent across layers |
| §4.8 Iwasawa duality (headline) | g=1; g=2 | g=1: id ↔ long, degrees 0 ↔ 1, `κ∨=2−k`; g=2: length r ↔ 3−r, `κ∨=(3−κ₂,3−κ₁)` | agrees |
| §4.9, §8.4 amplitude (headlines) | g=2, `w=s1`; g=3 | `[1,3]` canonical, partner `[0,2]` cuspidal with `ℓ(w*)=2`; g=3: d=6, `[ℓ(w),6]` rational only | agrees |
| §5.2 allowed pairs | GL₂ id stratum, p=3, C=2, depth-one standard pair | printed absolute bound forces `m≥1`, then `U⊂B(2,−1)` fails at `v(z)=2`; relative bound holds with `(0,0,1)` | agrees |
| §5.3 continuation (sampled) | `f(z)↦f(3z)`, j=1, 2; j=0 | eigenvalues 1,3,9 (slope ≤2, dim 3); 1,9,81 (slope ≤4, dim 3); identity not compact. BP-Coleman lines 1064–1066, 4687–4698, 5236–5244 | agrees |
| §5.5 local bounds (sampled) | GSp₄ `κ=(5,3;−8)`, w=1; GL₂ w=1 | `⟨w0Mκ,t₂⟩=0`, `+2ρ_nc → 3`; dual `κ∨=(0,−2;8)` pairs with `t₂⁻¹` to 3; GL₂ gap `⟨v(t),2ρ⟩=1`. BP-Coleman lines 5694–5699 | agrees |
| §5.8 classicality (headline) | GL₂ k=2; wall k=1 | k=2: `U_naive` slope `<2`, endpoint excluded; k=1: `MW∖Cκ+=∅`, range `[0,1]` kept | agrees |
| §6.1a descent (sampled) | Hodge type `Δ=1`; `𝔸²→𝔸²/±1` | fibre `F[x,y]/(x²,xy,y²)` of dimension 3 > 2; `ℤ₂[Δ]` invariants have image `2ℤ₂`. BP-Coleman lines 3155–3159, 3926–3933, 4476–4480, 7510–7544 | agrees |
| §6.4 Tor sequence (sampled) | `[A --t→ A]` over `F⟨t⟩` | fibre at 0: `H⁰=H¹=F`; at `a≠0`: acyclic. BP-Coleman lines 7362–7372 | agrees |
| §6.6b analytic bounds (sampled) | identities; C₂ at w=1; GL₂ | `a_an+w⁻¹2ρ_nc=w⁻¹ρ−ρ=−b_an`; C₂: `a_an=(3,3)`, `b_an=0`; GL₂: `−2ρ, 0`. BP-Coleman lines 7690–7694 | agrees; corrected second − bound is the transpose |
| §6.7 BGGsafe | GSp₄ w=1, `v=s0`, `κ=(5,3;−8)` | `ν_alg=(0,−2;8)`, `ν_v=(−3,1;8)`, `κ_w(ν_v)=(2,6;−8)`; thresholds on `t₂`: 0 and 3 | agrees |
| §7.1, §7.5 eigenvariety (headlines) | acyclic family; `H¹`-only family; `t:A→A` | empty support; nonempty support; image `(t)` with fibre F against specialized image 0 | agrees |
| §7.3 interior support (sampled) | `N=Ae₁⊕Ae₂`, `ε²=0` | annihilator of `Ae₁` is `(ε)`; image algebra rank 1, ambient rank 2. BP-Coleman lines 7826–7871 | agrees |
| §7.6 sharp interior bounds (sampled) | GL₂ k=2, k=1; GSp₄ `(5,3;−8)`, `(k+2,2)` | `A_w(t₂)=3,4,4,8`; `U2_std` window `[0,1)`; `(k+2,2)`: `κ+ρ=(k+1,0)` singular. BP-Coleman lines 7935–7948, 7961–7983, 5784–5787 | agrees |
| §8.5, §9.3 sharp Siegel bounds (headline) | `κ=(5,3;−8)`; general `(k₁,k₂)` | `A_w=(0,2),(−2,2),(3,−3),(−5,−3)`; `t₁`: 6,6,11,11; `t₂`: 3,4,4,8 = `3,k₂+1,k₂+1,k₁+k₂`; proved middle values 3 | agrees |
| §9.1 four weights | `ν=(0,−2)`, `ν=(1,1−k)` | `(5,3),(5,1),(2,−2),(0,−2)`; `κ_0=κ_1=(k+2,2)` | agrees |
| §9.5 Klingen refinement | p=3, `(1,1,9,9)` | `δ(a)=p⁻⁴`; `(wχ)(a)=1/27,1/3,1/3,3`; times 9: `1/3,3,3,27` = `p⁻¹`·products | agrees |
| §9.8 Klingen control (headline) | r=2, k=0, 1, 3; `(1,1,9,9)` | threshold `k+2r−3=k+1`; valuations `(0,0,k+1,k+1)`, ratios `0, ±(k+1)`; eigenvalues 20; 2,10,10,18. Pilloni-Singular lines 4554–4556, 4680–4687 | agrees |
| §9.9 split U(2,1) | `ν=(4,2,0)` | `κ_r=(−3,−5,2),(0,−5,−1),(0,−2,−4)`; `κ_0∨=(4,2,0)`, `κ_1∨=(4,−1,3)` | agrees |

- Source locators checked against the text: 63 (BP-Hida 23, BP-Coleman 36, Pilloni-Singular 4), covering all 15 sampled targets; the README flags no locator as unverified.
- Library declarations opened at the pins: 21 (Mathlib 10, Tau Ceti 11), every file and line cited in `README.md` under "From Mathlib" and "From Tau Ceti" matches; `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` is at `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`.
- Cross-roadmap citations: the resolver reports none unresolved; 67 cited section headings of 16 suppliers were located by hand, and the statements of SolidAnalyticRings §§7.2–7.4, ResolutionOfSingularitiesCharacteristicZero §6.3, AdicSpacesPartIV §F1.10 and AutomorphicBundlesPartII §§3.10, 5.2 were read against what is assumed of them.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate rerun on this head: every check 0, `OK`. `Suggested.lean` elaborates with no error and no warning; it declares nothing, so there is no `#check` comparison and no padding probe to run.
- Headlines (§§4.6, 4.8, 4.9, 8.4, 5.8, 7.1, 7.5, 7.6, 8.5, 9.8): none is statable at the pins, which have no Shimura varieties, Igusa towers or supported coherent cohomology; the module docstring names each with its missing carrier.
- Pull request text read against the head: it adds the roadmap, states that `Suggested.lean` declares no theorem, and names the consumers; nothing contradicted.
- Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms, GSp4NonregularModularityLifting, PerfectoidShimuraVarieties, SmoothRepresentationsOfLocalGroups; nothing shared. PadicFamiliesPartII is a consumer and cites the former Layer 5 numbering, which the table at the head of Layer 5 maps; the algebraic BGG resolution of §6.5(0) has no other owner (LieHighestWeight on main and LieHighestWeightPartII state none).

Source independence: 24 passages compared with 3 sources, none shared; largest share BP-Coleman, 83 of 183 locators; contents compared with BP-Coleman: independent (Layer 5 takes its §5 in the order 5.4, 5.7, 5.9, 5.6, 5.5 with 5.8, 5.12; Layer 6 takes its §6 in the order 6.3, 6.4, 6.1, 6.5, 6.2, 6.7, 6.8, 6.6; the order of §§2.2–2.7 is forced by their Needs lines).

## Not verifiable

- Humphreys-BGG, §§6.1–6.3, pp. 108–111 (cited in §6.5(0)): recorded as uncertified; the text was not read.
- Locators outside the sample (among them Jones-BGG and BP-GL2, and the Pilloni-Singular locators of §§9.4–9.6) were not opened.
- Ownership against open pull requests was checked through the roadmap search and the six closest roadmaps, not against all 475 heads.

## Source issues

- **Misprint** in BP-Hida at §2.11, standing assumptions, printed page 31: the source says the first-projection pullback of the middle positive boundary lies in the second-projection pullback of the inner one, and symmetrically for the negative boundary; it should be the second-projection pullback inside the first-projection pullback, as in Proposition 2.10.4; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.8.3(2), printed page 167: the source says the second upper bound of the minus theory lacks the summand ρ present in the first; it should be the first bound plus the inverse-Weyl translate of twice the noncompact half-sum; affects a stated result.
- **Error** in BP-Coleman at Definition 5.4.10 with Example 5.4.11, printed pages 111–112: the source says the whole deeper tube lies in the support, and that standard pairs of every depth qualify; it should be the tube intersected with the open set, since the depth-one GL₂ pair fails when max(t)=2; affects a stated result.
- **Error** in BP-Coleman at Corollary 5.3.8 and Theorem 5.4.12, printed pages 108 and 112: the source says the power of the correspondence indexed by the support witness is potent compact, the witness zero included; it should be a strictly positive power, the zeroth being the identity; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), printed page 173: the source says the vanishing range holds on the strongly small slope part; it should be the small slope part, which is what its proof establishes; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, printed page 90: the source says the lower arrow of the square carries the operator scaled by p to the power −k−1; it should be p to the power k+1, as the thresholds of the following corollary require; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 14.9.1, printed page 102: the source says the two Hecke operators have only eigenvalues of positive valuation; it should be nonnegative valuation, which the proof shows and the corollary uses; affects a stated result.

## For the human reviewers

- **Scope.** The source with the largest share of locators, BP-Coleman, is cited from a revised author-page edition and arXiv:2110.10251v1; `README.md` (References) gives no journal reference for it. BP-Hida and Pilloni-Singular are published (Inventiones 2026, Duke 2020).
- **Scope.** Several targets state forms that differ from the printed sources, listed under "Source issues and conventions" in `README.md` (E1–E18); §§5.2, 6.2 (E13, E18), §2.8(c) (E15), §6.6b (E17) and §9.6(4) (E10) change a hypothesis or a formula.
- **Scope.** Some targets go beyond the cited statements with routes of the roadmap's own: §6.1a(2) (projectivity), §6.6b (arbitrary complete coefficient field), §9.5 (principal-series criterion), §§3.8 and 6.10 (Hecke algebra actions), §6.5(0) (the algebraic BGG resolution, stated here for want of another owner).
- **Licence.** The three main sources are read from author-page PDFs on the host of one author's institution; their licence class is the manifest's to confirm.
