# Review of StringOrientation (pull request #948 at ccf7738)

**Verdict:** accepted

No P1 or P2 finding remains. The worker's gate passes on this head; independent elaboration of `Suggested.lean`, the one-tactic padding probe and the dependency check also pass. Three P3 notes follow; they are the author's to take or leave. No file of the pull request was changed.

**Previous findings, checked first, individually** (the previous review read `1eb7cbc`; this head is `ccf7738`, 189 changed lines, all in `TauCetiRoadmap/StringOrientation/README.md`).

- Previous R01 (boundaryless good covers) — repaired. The Conventions now say the manifold inputs "are boundaryless unless a boundary model is specified" and that the prisms `M×[0,1]` "use their actual manifold-with-boundary structure" (README.md:119–126). S3.0 restricts the Bott–Tu theorem to "every Hausdorff second-countable boundaryless n-manifold" (README.md:662–664) and treats the prism intersections `U×J` separately as smoothly contractible boundary models, citing DifferentialGeometry §5.4 and §6.2 (README.md:667–676), both of which exist on main with the boundary generality claimed (DifferentialGeometry README.md:524–527 "so `M` may have boundary"; 791–794 "boundary-chart images"). The new Check computes local H₁ = 0 at 0 in `[0,ε)` against ℤ on ℝ, and `K(dx)=x`, `dK(dx)=dx`, `K(dc)=0` (README.md:708–714); I recomputed these (table rows 24–26).
- Previous R02 (geometric families unspecified) — repaired. S5.4 now defines `V=V^m(2^a,3^b)⊂CP^(m+a+b)`, `m+m′=2n−8`, the classifier `W→CP∞×CP∞→BT′→BF₄` with character pullbacks `n_f(x₁,x₁,x₂,−x₂)`, the lattice check, the vertical class `4n_f²π*(x₁²+x₂²)`, the auxiliary integers `L=4n_f²+m+1` with `3a+8b=L`, torsion-freeness of H⁴(E) and the coprimality `p∤n_f` (README.md:1137–1191). Every displayed number was recomputed (table rows 44–55): for `V²(2,3,3)⊂CP⁵` the coefficients are −16 and −2, the degree 18, the constant-classifier pairing −144; for n=4, n_f=2 the base has 576 points and `s₄[OP²]=−84` has 7-adic valuation 1 as condition (1) demands. McTague's lines 972–1027 and 1392–1419 (mctague-cayley-plane) support the construction with the corrected square on n_f.
- Previous R03 (relative obstruction sign) — repaired. S1.4 now fixes the mapping-cone model (A attached at t=1, apex at t=0, the cone map `H_A(a,1−t)`), the comparison through AlgebraicTopology Stage 4.5, and proves `o(c,H_A)=−δα` with the normalization `⟨δα,[X,A]⟩=⟨α,∂[X,A]⟩` (README.md:394–408); the Check gives connecting values 0,1,2 and obstruction values 0,−1,−2 for α=0,1,2 (README.md:425–430). I rederived the sign independently (row 15): filling the square whose sides are the constant apex path, the reversed boundary nullhomotopy and the extending nullhomotopy gives the top edge `reverse(H_A)·H₀`, which is −α under the roadmap's difference convention, and AlgebraicTopology 8.11b's `δ_(X,B)=(−1)^(n+1)c_AT^*σ_right` is `+c_AT^*σ_right` at n=3 (AlgebraicTopology README.md:2030–2033).

No repair report marking a finding "not actionable in this package" was supplied; nothing below re-raises a settled finding.

## R01 (P3) — Cite DGFloer Layer 1 item 2's Serre spectral sequence where S2.2 and S5.3 use it

**Location:** `TauCetiRoadmap/StringOrientation/README.md:546`: "Compute `H*(BString;ℚ)=ℚ[p₂,p₃,…]` by the Serre spectral sequence with λ-normalized transgression"; and README.md:1110–1113 (the ℤ[1/2]-homology isomorphism `BSpin→BSO` from the fibre `K(ℤ/2,1)`).

**Claim:** Both steps need a Serre spectral sequence, but S2.2's `*Needs:*` line (README.md:577–579) and S5.3's (README.md:1128–1129) name no owner of one, Layer 2's Dependencies (README.md:644–646) list no DGFloer item, and the supplier contract describes DGFloer Layer 1 item 2 only as the "normalized long exact sequence of a homotopy fibre" (README.md:214).

**Witness:** DGFloer on main, Layer 1 item 2, "owns … Serre spectral sequence consumed by AT5.5" (DGFloer README.md:131–133), and GeneralizedCohomology G5.6 consumes its `arbitraryCWSerreCohomologySpectralSequence` (GeneralizedCohomology README.md:2217–2221). S5.4 already cites exactly this item for the same tool (README.md:1218).

**Repair:** Add "DGFloer Layer 1 item 2 (cohomological Serre spectral sequence with its multiplicative structure)" to the S2.2 and S5.3 `*Needs:*` lines and to the Layer 2 and Layer 5 Dependencies, and widen the contract sentence at README.md:214 to "(normalized long exact sequence of a homotopy fibre; the cohomological Serre spectral sequence over CW bases)". For S5.3, the passage from a ℤ[1/2]-homology isomorphism of Thom spectra to an equivalence after inverting 2 is a statement about connective spectra; cite GeneralizedCohomology G5.6's stable Hurewicz comparison (GeneralizedCohomology README.md:2232–2236) beside AlgebraicTopology 8.5, which is the space-level theorem. The mathematics is unchanged: the fibre `RP^∞` has vanishing reduced ℤ[1/2]-homology (row 60), and the rational computation of `H*(BString;ℚ)` from `H*(K(ℤ,3);ℚ)=Λ(ι₃)` (row 30) is the transgression argument the sentence names.

## R02 (P3) — Give S4.2's modularity theorem a locator and its route

**Location:** `TauCetiRoadmap/StringOrientation/README.md:1000–1002`: "For Spin manifolds with rational `p₁=0` (in particular String manifolds) prove modularity of weight 2k with integral q-expansion, using ModularForms' q-expansion comparison."

**Claim:** This is one of the six end theorems (Summary, README.md:12–13), yet it is the only theorem of the roadmap with neither a literature locator nor a proof route; the References list no source for it (README.md:1340–1395 name none of Zagier, Hirzebruch–Berger–Jung or Witten).

**Witness:** `grep -n -i 'zagier\|hirzebruch'` on the README returns only the Borel–Hirzebruch entries (README.md:447, 1075–1076, 1381).

**Repair:** Cite Zagier, *Note on the Landweber–Stong elliptic genus*, in *Elliptic Curves and Modular Forms in Algebraic Topology*, Lecture Notes in Mathematics 1326 (1988), for the theorem that the Witten genus of a Spin manifold with rational `p₁=0` is a level-one modular form of weight 2k, and Hirzebruch–Berger–Jung, *Manifolds and Modular Forms*, Chapter 6, for the exposition; both are paywalled, so record them `uncertified` with the theorem numbers the author holds. State the route in one sentence: the coefficients of `log Q` are the quasimodular forms `2G_(2k)/(2k)!` (S4.1), only `G₂` is non-modular, and `G₂` enters the genus of a 4k-manifold only through the factor `exp(−(2G₂/2!)p₁)`, so rational `p₁=0` removes it; integrality is the index interpretation of S4.2's first sentence. The same gap, in a lesser form, is S1.2's non-Lie theorem (README.md:315–322), which has a complete route but no locator.

## R03 (P3) — Name TangentialBordism among the downstream consumers

**Location:** `TauCetiRoadmap/StringOrientation/README.md:1334–1337`: "FourManifolds consumes S1's BString lifts, the H³ torsor, the dimension-≤7 classification of S1.3 and the adjoint formula of S1.1".

**Claim:** The section lists FourManifolds alone, but TangentialBordism, which the merge order places three lines below this roadmap, consumes S1.3, S1.5, S2.2, S2.3 and S5.3 by name.

**Witness:** TangentialBordism at its open head, supplier table row "StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3" (TangentialBordism README.md:141) and Scope (README.md:20–30); ORDER.txt lists StringOrientation on line 6 and TangentialBordism on line 9.

**Repair:** Add one sentence: "TangentialBordism consumes S1.3's existence criterion and torsor, S1.5's Cayley plane and its characteristic classes, S2.2's structured Pontryagin–Thom isomorphism, S2.3's framed isomorphism and stem, and S5.3's equivalence `MSpin[1/2]≃MSO[1/2]`." Nothing in this roadmap cites TangentialBordism, so no direction of supply changes (the dependency check below is unaffected).

## Verified sound

**Mechanical checks and scope.** Both files were read in full at `ccf7738`. The worker's gate reports every check zero (set_option, blob, latex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, lean-lines, forbidden, readme-ids-missing, empty-sections, round-labels, long-fences, depcheck, metadata, stray-files, dirty, outside-folder, source-material, build). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StringOrientation'` has no output; the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`; `git status` is clean after the review.

Independent `lake env lean` on `TauCetiRoadmap/StringOrientation/Suggested.lean` succeeds with the single expected `sorry` warning. A scratch copy with `#check @homotopyGroup_sphere_three_stem` elaborates to `∀ (n : ℕ), 5 ≤ n → Nonempty (π_ (n + 3) ↑(Metric.sphere 0 1) ⟨EuclideanSpace.single 0 1, ⋯⟩ ≃* Multiplicative (ZMod 24))`: both binders survive, and the type matches S2.3's statement. The one-tactic probe on the same scratch copy tried `simp`, `rfl`, `infer_instance`, `exact ⟨MulEquiv.refl _⟩` and `exact?`; none closes the goal, so the theorem is not padding. There is no other declaration, no definition, no `set_option`, no sorry'd data, a single `import Mathlib`, and the docstring names each unstatable headline with its missing carrier. The claim "no bordism groups" at the pin was checked: `Mathlib/Geometry/Manifold/Bordism.lean` defines only `SingularManifold` (lines 110–143) and says bordism groups are future work.

The dependency command of the brief, with this README, the supplied order, `--movable` and main content, returned exactly:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. ORDER.txt: EllipticCohomology line 5, StringOrientation line 6, SmoothBundlesConnections 7, TangentialBordism 9, HomotopySpheres 64, FourManifolds 119, LieGroupoidsPoisson 136; IndexTheory (open head, new folder) is unlisted and is checked as placed after its suppliers. Every `*Needs:*` line was read. No supplier gap is declared. No copied passage, computational algorithm, route-specific shortcut or re-planned roadmap was found; the three objects also stated by later roadmaps (good covers and connections, submersion fibre products, `π₃S`) are declared in Scope with this roadmap as the earlier owner, and TangentialBordism confirms that assignment (README.md:20–30 there).

**Headlines.** The README names six end theorems: the λ-obstruction, torsor and 8-equivalence (S1); `Ω₃^String≅Ω₃^fr≅ℤ/24` with the framing-change formula (S2); the affine space of string connections and the `Ĥ³` torsor (S3); integrality and modularity of the Witten genus (S4); McTague's kernel theorem away from 6 (S5); the low-weight Ricci vanishing and the two framed counterexamples (S6). Only the stable-range stem `π_(n+3)(Sⁿ)≅ℤ/24`, n≥5, is statable at the pins (Mathlib `HomotopyGroup`, `Mathlib/Topology/Homotopy/HomotopyGroup.lean:441`), and it is stated with the sharp bound; the docstring names the missing carriers for the others (no `BSpin`, `K(ℤ,4)`, Thom spectra, bordism groups, differential cohomology, gerbes, Dirac index, `tmf`). No headline is forced through a stand-in.

**Computed adversarial pass.** One row per statement; values on both sides are recomputed, not copied. Integral cohomology is written H; g is G5.0's quaternionic generator with `Ωλ(g)=−1`. Rows 1–13, 15–18 and 44–55 cover the sampled sections S1.1, S1.3, S2.1, S2.2, S3.0, S3.1, S3.2, S3.4, S3.5, S3.6, S5.1, S5.2, S5.3, S5.4 and S6.3 and the findings; the remaining rows cover the other headlines.

| # | Statement | Instances | Values computed on each side / wrong model | Result | Change |
|---|---|---|---|---|---|
| 1 | S1.1 λ normalized by 2λ=p₁ | universal generator | λ=1, p₁=2; model λ:=p₁ gives 2λ=4≠2 | Pass | None |
| 2 | S1.1 Hopf sign | quaternionic line on S⁴ | λ=−c₂: pairing −1; c₂ pairing +1; reversed orientation gives (+1,−1) | Pass | None |
| 3 | S1.1 adjoint formula | SU(2) weights 0,±2x | c(ad⊗ℂ)=1−4x², p₁=4x²=−4c₂, λ=−2c₂; "λ=−c₂ on BSpin(3)" off by 2 | Pass | None |
| 4 | S1.1 mod 2 | Hopf line, rank 4 | λ=−1 odd; w₄=e mod 2 nonzero; both 1 mod 2 | Pass | None |
| 5 | S1.1 torsion control | S³∪₂e⁴ versus S⁴∪₂e⁵ | cochains ℤ→ℤ (×2) in degrees 3,4: H³=0, H⁴=ℤ/2; in degrees 4,5: H⁴=0, H⁵=ℤ/2 | Pass | None |
| 6 | S1.2 7-connectivity | fibre of λ versus fibre of p₁ | π₄=ker(±1)=0, π₃=coker(±1)=0 versus coker(×2)=ℤ/2 | Pass | None |
| 7 | S1.2 non-Lie argument | Spin(5), K(ℤ,3) | dim 10, H¹⁰(Spin(5);ℚ)=ℚ; H*(K(ℤ,3);ℚ)=Λ(ι₃) has H¹⁰=0 | Pass | None |
| 8 | S1.2 torus criterion | trivial, S¹, SU(2) | (π₁,π₃)=(0,0),(ℤ,0),(0,ℤ); only the first is trivial | Pass | None |
| 9 | S1.3 existence iff | trivial bundle on pt; Hopf on S⁴ | λ=0 ⇒ lift exists; λ=−1 ⇒ none; converse by Redden Prop. 2.2(1) | Pass both ways | None |
| 10 | S1.3 torsor | S³, coordinates 0,1,3 | differences 1,2,3 with 1+2=3; H³(S³)=ℤ acts freely | Pass | None |
| 11 | S1.3 dimension ≤7 bijection | S⁴, S⁸ | 8-connected map: [S⁴,BSpin]=ℤ→H⁴=ℤ bijective; [S⁸,BSpin]=ℤ→H⁴(S⁸)=0 not injective | Pass with bound | None |
| 12 | S1.3 Moore space | S³∪₂e⁴ | [X,BSpin]≅H⁴=ℤ/2; nontrivial class has p₁=2λ=0, λ≠0; H³=0 gives one lift | Pass | None |
| 13 | S1.3 S¹×S² | H⁴=0, H³=ℤ | every stable Spin bundle trivial, ℤ-torsor of lifts | Pass | None |
| 14 | S1.4 gauge transport sign | g, 2g, composition | Ωλ values −1,−2; shifts +1,+2; 1+2=3=−Ωλ(3g) | Pass | None |
| 15 | S1.4 relative obstruction `o=−δα` | square with sides *, reverse(H_A), H₀ | top edge `reverse(H_A)·H₀` = −α; 8.11b: δ=(−1)^(3+1)c_AT^*σ_right=+c_AT^*σ_right; o=c_AT^*σ_right(−α)=−δα | Pass | Previous R03 repaired |
| 16 | S1.4 Check on (D⁴,S³) | α=0,1,2 | ⟨δα,[D⁴,S³]⟩=⟨α,[S³]⟩=0,1,2; obstruction 0,−1,−2; flipped model gives 0,1,2 and fails at α=1,2 | Pass | None |
| 17 | S1.4 reference independence | α ↦ α+i*β | δ(i*β)=0 so δα unchanged | Pass | None |
| 18 | S1.5 dimensions, Euler, Weyl | F₄/Spin(9) | 52−36=16; |W(F₄)|/|W(B₄)|=1152/384=3=χ; wrong Spin(8): 52−28=24 | Pass | None |
| 19 | S1.5 L₄ and Â₄ | p₂=6u, p₄=39u² | L₄=(381·39−19·36)/14175=14175/14175=1; Â₄=(−192·39+208·36)/464486400=0; p₄=36u² gives 1448/1575 | Pass | None |
| 20 | S1.5 s-number | OP² | s₄=2p₂²−4p₄=72−156=−84=−2²·3·7 | Pass | Used in row 47 |
| 21 | S1.5 HP² control | p₁=2u, p₂=7u² | λ=u≠0; L₂=(49−4)/45=1 | Pass | None |
| 22 | S2.1 Postnikov comparison | π₄, π₈ | τ≥4ko→Σ⁴Hℤ sends g to −1; fibre π₄=0, π₈=ℤ, as BString | Pass | None |
| 23 | S2.1 MString source | EllipticCohomology E5 | bstring=τ≥8ko, E∞ Thom spectrum, comparison with G5.3, MString→MSpin (EllipticCohomology README.md:1529–1548) | Pass | None |
| 24 | S3.0 boundaryless good cover | ℝ, half-line | interval covers of ℝ have ℝ intersections; at 0∈[0,ε) local H₁=0, interior ℤ | Pass | Previous R01 repaired |
| 25 | S3.0 prism contraction | F(t,x)=tx on [0,ε) | F*dx=x dt+t dx, K(dx)=∫₀¹x dt=x, dK(dx)=dx, K(dc)=0; dK+Kd=id−ev₀* on dx: dx=dx−0 | Pass | None |
| 26 | S3.0 corner and n=0 | quadrant, point, ∅ | coordinatewise K as in row 25; point=ℝ⁰; empty cover index set | Pass | None |
| 27 | S3.0 connections, curvature | ℝ²×U(1), ℝ²×SU(2) | A=x dy: F=dx∧dy≠0; A=τ₁dx+τ₂dy: dA=0, ½[A∧A]=2τ₃dx∧dy; [A∧A] model gives 4τ₃ | Pass | None |
| 28 | S3.0 fibre products | ℝ²→ℝ; doubled origin; x↦x² | dim 2·2−1=3; {(t,t):t≠0} not closed; {x²=y²} not a manifold at 0 | Pass | None |
| 29 | S3.0 Mathlib pins | `IsSubmersion`, `exists_isSubordinate` | "some global choice of complement" (Submersion.lean:37, def at 553); T2Space and SigmaCompactSpace (PartitionOfUnity.lean:365) | Pass | None |
| 30 | S2.2 rational ranks | degrees 4,8,12,16 | String ℚ[x₈,x₁₂,…]: 0,1,1,2; Spin ℚ[x₄,…]: 1,2,3,5 | Pass | None |
| 31 | S2.2 Pontryagin–Thom degree 0 | BO, BSO | Ω₀^O=ℤ/2=π₀MO; Ω₀^SO=ℤ; 1↦1 mod 2 not injective | Pass | None |
| 32 | S2.2 K3 | σ=−16 | p₁=3σ=−48, λ=−24≠0, not String | Pass | None |
| 33 | S2.3 unit range | degrees ≤6, 7 | cofibre MString/S has cells ≥8: iso i≤6, onto i=7 | Pass | None |
| 34 | S2.3 stable range | n=4,5,6 | n+3≤2n−2 iff n≥5; π₇S⁴=ℤ⊕ℤ/12≠ℤ/24; π₈S⁵, π₉S⁶ cyclic 24 | Pass | None |
| 35 | S2.3 e-invariant | K3 minus disc | ½p₁=−24≡0 mod 24; σ∈16ℤ ⇒ ½p₁∈24ℤ; dividing by 48 gives ℤ/48 | Pass | None |
| 36 | S2.3 framing change | S³⊔S³, α=(1,−1); ∅ | (β₁,β₂)=(−g,g), total −J(g)+J(g)=0; empty sum 0 | Pass | None |
| 37 | S3.1 degree shift | point | Ĥ⁰=ℤ, Ĥ¹=ℝ/ℤ, Ĥᵏ=0 (k≥2); Cheeger–Simons' Ĥ⁰ is on 0-cycles with 1-form curvature (cheeger-simons lines 100–101) | Pass | None |
| 38 | S3.1 homotopy formula sign | h(x)=x on ℝ, F(t)=t/2, t/3 | endpoint differences ½, ⅓; a(KF*dx)=∫₀¹½dt=½, ⅓; reversed −½ | Pass | None |
| 39 | S3.2 dimensions and descent | Y=M; k=2; two arcs on S¹ | dim Y^[k]=k·dimY−(k−1)dimM: M, 2dimY−dimM; δ=pr₂*−pr₁*, functions agreeing on both components glue | Pass | None |
| 40 | S3.3 levels | Sp(1), adjoint Spin(3) | ∫⅙⟨θ∧[θ∧θ]⟩=±1, ±2; π₃ map ×2 matches λ|BSpin(3)=−2c₂ | Pass | None |
| 41 | S3.4 Hopf obstruction | S⁴, Hopf line; flat trivial bundle | ∫½p₁(A)=−1 versus ∫dH=0; flat: 0 and 0 | Pass | None |
| 42 | S3.5 compatibility class | C^∞(pt,S¹)=S¹ | π₁=ℤ; normed space contracts by (t,v)↦(1−t)v, π₁=0; `IsContDiffCompatible` needs `NormedSpace ℝ X` (Diffeology/Basic.lean:368–370) | Pass | None |
| 43 | S3.6 holonomy | ∫H=1 | exp(2πi)=1; exp(1)=e∉U(1); Waldorf (4.2.1) lacks 2πi, (lines 1092–1097) versus degree-one formula (1210–1215) | Pass | Source issue recorded |
| 44 | S5.4 lattice integrality | n_f=2 | (e₂,e₃,e₄,(e₁−e₂−e₃−e₄)/2) ↦ (2x₁,2x₂,−2x₂,0) | Pass | None |
| 45 | S5.4 vertical p₁ | weights ½(e₁±e₂±e₃±e₄) | Σ over 8 weights ¼(…)² = 2Σe_i²; pullback 4n_f²(x₁²+x₂²)=16(x₁²+x₂²) at n_f=2; without square 8 | Pass | None |
| 46 | S5.4 tangent sequence | V^m(2^a,3^b) | p₁=(m+a+b+1−4a−9b)x²=(m+1−3a−8b)x²; c₁=(m+1−a−2b)x | Pass | None |
| 47 | S5.4 n=4 family | m=m′=0, n_f=2, L=17=3·3+8 | V⁰(2,2,2,3): 24 points, base 576 points, E=576·OP²; Prop. 10: 2(C(8,2)−C(8,4))=−84, ord₇=1, 8=1+7 | Pass | None |
| 48 | S5.4 n=5 family | V²(2,3,3)⊂CP⁵ | p₁=(3−3−16)=−16, c₁=−2, ∫x²=18; vertical +16 cancels; constant classifier λ=−8x², pairing −144 | Pass | Previous R02 repaired |
| 49 | S5.4 Spin base | c₁ coefficient | m+1−a−2b with m+1=3a+8b−4n_f²: 2a+8b−4n_f²−2b even | Pass | None |
| 50 | S5.4 Lemma 8 | L=10…20 | solvable except 10,13; 13=3·8−3−8 Frobenius number | Pass | None |
| 51 | S5.4 H⁴(E) torsion-free | weak Lefschetz, Künneth, fibre | H_j(V)≅H_j(CP) for j<m, duality and UCT give free H*(V); Tor terms vanish on W; E₂^{p,q}=0 for 1≤q≤7 so H⁴(W)≅H⁴(E) | Pass | None |
| 52 | S5.4 condition (1) valuations | n=4,5 | gcd{C(8,2)−C(8,4)}=42=2·3·7; gcd{C(10,2)−C(10,4),C(10,2)−C(10,6)}=165=3·5·11; 10=5+5=11−1 | Pass | None |
| 53 | S5.4 prime-square residual | p=5, i=1, j=2 | 5(8·16^22−4·16²)≡20 mod 25; n_f=5 gives 0 | Pass | None |
| 54 | S5.4 dimension | m+m′=2n−8 | 16+2(m+m′)=4n | Pass | None |
| 55 | S5.4 low degrees | n=2,3 | 4=5−1; 6=7−1=1+5; OP² bundle base dimension 8−16<0, 12−16<0 | Pass | None |
| 56 | S5.3 splitting | p=3,5; d=8 | (p−3)/2=0: one factor, [v₁]:BP⟨1⟩₁₂→BP⟨1⟩₈ (q=4); p=5: BP⟨1⟩₈×BP⟨1⟩₁₂, identity on i=1, [v₁]:BP⟨1⟩₁₆→BP⟨1⟩₈ (q=8); Hovey–Ravenel Cor. 1.5(2) lines 292–299 | Pass | None |
| 57 | S5.3 Hovey presentation | p≥5 | Theorem 2.4 (hovey-mstring line 508) is for p≥5, as README's p>3 | Pass | None |
| 58 | S5.2 roots and cosets | F₄, B₄ | 24−16=8=16/2 complementary positive roots; 3 cosets=χ(OP²) | Pass | None |
| 59 | S5.1 base change control | OP²×HP²→HP² | λ(HP²)=u≠0 so the product is not String although fibre and vertical bundle are | Pass | None |
| 60 | S5.3 odd-primary comparison | fibre RP^∞ | H̃_*(RP^∞;ℤ[1/2])=0; π₁MSpin=ℤ/2≠0=π₁MSO before inverting 2 | Pass | R01 Needs line |
| 61 | S5.5 kernel degrees | 8, 12, 16; degree 3 | OP² bundles have dimension ≥16; ℤ/24 in degree 3 has zero genus but is not in the ideal | Pass | None |
| 62 | S4.1 series | q⁰, k=1,2 | log((x/2)/sinh(x/2))=−x²/24+x⁴/2880; 2G₂/2!=−1/24, 2G₄/4!=2/(240·24)=1/2880 | Pass | None |
| 63 | S4.1 Sym_t | line L; trivial line | λ_{−t}(L)=1−tL, Sym_t=1+tL+…; Sym_t(ε−1)=(1−t)⁻¹(1−t)=1; model λ_t⁻¹ gives 1−tL | Pass | None |
| 64 | S4.1 q-part | L⊕L̄−2 | ch ⊗_n Sym_{qⁿ}=∏(1−qⁿ)²/((1−eˣqⁿ)(1−e⁻ˣqⁿ)); q¹ x²-coefficient 1=2σ₁(1)/2 | Pass | None |
| 65 | S4.2 constant term | Θ_q=1+q(T_ℂ−dim)+… | φ_W=Â+qÂ(T_ℂ−dim)+O(q²); OP²: Â=0, weight 8 form ∈ℂE₄² with constant term 0 ⇒ 0 | Pass | R02 locator |
| 66 | S6.2 weights | dims 4,8,12,16,20,24,28,32 | dim M_k=0,1,1,1,1,2,1,2 for k=2,4,…,16; M₁₂∋E₄³,Δ | Pass | None |
| 67 | S6.1 round spheres | n=1,2; r=1 | Ric=(n−1)r⁻²g: 0 and 1 on unit vectors | Pass | None |
| 68 | S6.3 bi-invariant metric | SU(2), g=−B | ∇_XY=½[X,Y], R(X,Y)Z=−¼[[X,Y],Z], Ric=¼g=2r⁻²g ⇒ r=2√2, sectional 1/8 | Pass | None |
| 69 | S6.3 orders | d₂,d₃,D | 192·3=576=72·8; ν_(2) order 8, ν_(3) order 3, 8·3=24; u₈ order 2 | Pass | None |
| 70 | S6.3 sources | Hopkins, BMQ, Belmont–Shimomura | π₃tmf=ℤ/24, π₈tmf=ℤ⊕ℤ/2, SU(3) nonzero (hopkins lines 396–405); π_*tmf=pattern⊗ℤ_(2)[Δ⁸] (bmq 128–129); Δ³ injective at 3 (belmont 653–655) | Pass | None |
| 71 | Lean headline | n=5,6 | indices 8,9; 5≤n retained; one-tactic probe fails | Pass | None |

**Seeded source audit, 15 targets.** Texts were fetched through the sources service from arXiv, an MIT seminar page and Ravenel's author pages; versions read: McTague v5, Waldorf v4, Redden v2, CJMSW v2, Meinrenken v3, Bunke v6, Hopkins v1, McTague quotient v4, BMQ v4, Belmont–Shimomura v2, the April 1994 Hovey–Ravenel preprint, Hovey's AGT 8 paper, the Cheeger–Simons scan. Locators opened and found to support the statement as written: mctague-cayley-plane Theorem 4 line 324 (conditions (1) and (2) verbatim in content), Theorem 1 line 58, line 104 (family vanishing), lines 739 and 775 (Borel–Hirzebruch 10.7 and 20.3), line 370 (Pontryagin numbers detect), line 446 (Hovey's theorem), lines 949–969, 972–1027 (construction, p. 16), Lemma 8 line 1030, Proposition 10 lines 1066–1079, Proposition 11 line 1114, Lemma 12 line 1131, lines 1392–1419; waldorf-string-connections Theorem 1.3.3 line 404, Theorem 1.3.4 line 428, lines 697–699 and 726–730, Lemma 3.1.2 line 759, lines 876–882 and Proposition 3.3.4 line 885, display (4.2.1) lines 1092–1097, lines 1210–1215, Lemmas 4.3.2 and 4.3.3 lines 1258 and 1289; redden-canonical-3forms Propositions 2.2 and 2.3 lines 214 and 237; cjmsw-bundle-gerbes Proposition 4.8 line 913 and Theorem 5.8 line 1109; meinrenken-basic-gerbe §5.2 line 524 (the form ¹⁄₁₂θ·[θ,θ] at 526) and §5.4 line 627; cheeger-simons definition line 100, Theorem 1.1 line 114, Theorem 1.11 line 254, Theorem 2.2 line 341; bunke-differential-cohomology Lemma 3.5 line 1264, (23) line 1442, Proposition 3.28 line 1585, Corollary 3.131 line 2619; hopkins-icm2002 lines 396–405; bmq-hurewicz lines 128–129; belmont-shimomura Theorem 6.1 line 653; hovey-ravenel Corollary 1.5(2) line 292; hovey-mstring Theorem 2.4 line 508. The Mathlib and Tau Ceti pins for S3.0 and S3.5 are in rows 29 and 42.

**Pins and duplication by object.** Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (lake-manifest.json). Opened: `DiffeologicalSpace` (Geometry/Diffeology/Basic.lean:159), `IsPlot` (197), `DSmooth` (202), `CorePlotsOn` (284), `ofCorePlotsOn` (319), `IsDTopologyCompatible` (353), `IsContDiffCompatible` (368), `NormedSpace.toDiffeology` (376, a def, not an instance); the directory holds only `Basic.lean`, so no product, subspace or functional diffeology exists at the pin; `SmoothPartitionOfUnity.exists_isSubordinate` (Geometry/Manifold/PartitionOfUnity.lean:365, 555); `Manifold.IsSubmersion` (Submersion.lean:553) and its three companions (153, 171, 538); `LieGroup` (Algebra/LieGroup.lean:72); `ContMDiffMap` (ContMDiffMap.lean:38); `ContinuousMap.Homotopy` (Topology/Homotopy/Basic.lean:76); `HomotopyGroup` (HomotopyGroup.lean:441); `CovariantDerivative.IsLeviCivitaConnection` (VectorBundle/CovariantDerivative/LeviCivita.lean:27–39); `EuclideanHalfSpace` (Instances/Real.lean:22–33); Tau Ceti `CovariantDerivative.ricciTensor` (Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean:57, with `ricciTensor_apply` at 64); `SingularManifold` (Geometry/Manifold/Bordism.lean:110). Object searches with `roadmaps grep` over the 442 open heads and main for "Pontryagin–Thom", "bundle gerbe", "differential character", "Cayley plane|OP²", "good cover", "BString|String structure", "string connection", "J-homomorphism", "Chern–Simons 2-gerbe" and "manifold diffeology" found no second owner: the only other mentions are EllipticCohomology (which constructs the stable J map `bo→bgl₁(S)` as a spectrum map, README.md:1536–1537, not its degree-3 value), TangentialBordism (downstream, assigns these objects here), SmoothBundlesConnections B6.0/B1.0/B3.1/B4.1 and LieGroupoidsPoisson G0 (both later in the order, as the Scope says), HomotopySpheres Stage 9 (`π₃S≅ℤ/24{ν}`, later), DGFloer (which excludes the Cayley plane from its scope, README.md:49–50), and Orbifolds O2 item 6 (the manifold diffeology this roadmap consumes). Ownership against open pull requests whose files the brief did not supply was not checked.

**Resolved supplier citations, every one opened at its current text.** On main: AlgebraicTopology Stage 4.5 = Stage 4 item 5 (closed cofibrations, mapping cylinders; Stage 8.11b attributes the pair-to-mapping-cone comparison to it, README.md:2030–2033), Stage 5 item 1 Künneth (849–866), Stage 6 (946, fundamental classes 1008, 1398), 8.3/8.5/8.7 (1602 ff.), 8.10 `ordinaryEMRelativeRepresentability` (1911–1912), 8.11b (1993–2045); DifferentialGeometry §5.4 (524–527), §5.5 (528–533), §6.2 (791–794), §8.3–8.5 (836–856); AffineMorseLefschetz A0 `complexProjectiveZeroLocus` (69), A5 (494–533), A6 Veronese (535–566); DGFloer Layer 1 item 2 (462, with the Serre spectral sequence at 131–133) and Layer 11 item 3 (93); GeneralizedCohomology G2 item 5 Freudenthal (326), G2.10 (533), G3.8, G5.0 with `stableBSpin_hopfGenerator_cTwo` (1504), G5.3 (1536), G5.6 (2212–2250); CharacteristicClasses C2 (550), C4 items 1 and 3 (1037–1060); TopologicalKTheory T2 items 1 and 3 with λ_t on virtual classes (613–700); SpinGeometry G4.1 (395), G6 (569); RepresentationTheory/LieHighestWeight Layer 8's two suppliers (1255, 1332); Orbifolds O2 item 6 (220–233); BordismFormalGroups F3–F5 (284, 329, 466); SchemeAndStackFoundations §4.13 `bertini_smoothness` (5680–5685: smooth X over an infinite field, general member of a very ample system); GeometricTopology Layer 1 collars (177, 206); RiemannianGeometry geodesics (56–58); ModularForms level-one dimension formula (10). At open heads: IndexTheory I7 (rev 1077, README.md:723); EllipticCohomology E4.S (913), E4 Δ-lifts and localization (1478–1481), E5 (1527–1548, `π₁₂S⁹≅π₃S≅ℤ/24` at 1675, unit range at 1618), E6 localization criterion (1912–1914) and low-stem unit images (1910). Downstream: FourManifolds consumes S1 (rev 936, README.md:178, 1967, 1991); TangentialBordism consumes S1.3, S1.5, S2.2, S2.3, S5.3 (rev 942, README.md:141). `roadmaps resolve` lists nothing unresolved.

**Shape and completeness.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending in Examples and Dependencies, Downstream consumers and References are present. Each definition block has prose API bullets and at least three Checks (S3.2, S3.6, S4.2, S5.2, S5.5, S6.1–S6.3 have exactly three); every Check was evaluated against its section's theorems (table). No LaTeX delimiters, process words, pull-request numbers or absolute paths appear. The only Lean name claimed by the README, `homotopyGroup_sphere_three_stem`, is declared; "intended name" mentions are unbackticked.

## Not verifiable

- **Milnor–Stasheff §§8, 15, 18; Stong Chapter II; Bott–Tu Theorem 5.1; Lee Theorems 4.26 and 6.30; Toda Chapters V and XIII; Borel–Hirzebruch I §19 and Theorems 10.7, 20.3; Stolz 1996 §1:** books and journal papers with no legal full text known to the sources service (Princeton, Springer, JSTOR routes are paywalled by the configuration); not fetched here. The README marks all but Milnor–Stasheff `uncertified`; the classical statements they are cited for were checked independently (rows 1–5, 19, 24, 31, 34, 58) and McTague's restatements of Borel–Hirzebruch (lines 739–743, 775–778) were read.
- **Jung's unpublished proof of the family vanishing (S5.2):** mctague-cayley-plane lines 106–109 say it has not appeared in print; the target is owned here and its trivial-family instance (row 65) is the only computable check.
- **lean-catdg at the cited commit:** not reopened this round; the previous review recorded its two admitted proofs, and the README treats it as comparison material only.
- **Zagier's and Hirzebruch–Berger–Jung's texts for R02:** paywalled; the suggested locators are by title and chapter, not by page.

## Source issues

- **Misprint** in waldorf-string-connections at display (4.2.1), printed p. 30 (lines 1092–1097): the source writes the degree-three holonomy as the exponential of a real integral; it should carry the factor 2πi, as its degree-one formula at lines 1210–1215 does; affects a stated result.
- **Misprint** in mctague-cayley-plane at the pulled-back p₁ formula, printed p. 16 (lines 1016–1024): the source says the root scaling contributes 4n_f; it should be 4n_f², since the class is quadratic in the roots; affects the proof (and the −4n_f at line 1405 and 1407–1411 inherits it).
- **Misprint** in mctague-cayley-plane at the complete-intersection tangent sequence, printed p. 16 (line 1001): the source puts the normal sum as the subbundle and TV as the quotient; it should be TV as the subbundle with the normal sum as quotient; affects the proof.
- **Error** in mctague-cayley-plane at its account of Stolz's conjecture, printed pp. 2–3 (lines 116–120): the source states the conjecture as an equivalence between vanishing Witten genus and existence of positive Ricci curvature; Stolz's conjecture is the forward implication only; affects a stated result.
- **Misprint** in bunke-differential-cohomology at Problem 3.4, printed p. 33 (lines 1257–1262): the source's case distinction assigns both F and 0 to k=0; it should read F for k=0 and 0 for k>0; affects nothing.
