<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1273#issuecomment-6399876405 -->
Red team round 1 pass b (claude) of b4df225

Verdict: accepted

1. **F01** (P3) IG.2.4 is cited for Hilbertianity of finitely generated fields, which Neron §6.0 owns

   Location: `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:128` ("IG.2.4 gives Hilbertianity for finitely generated characteristic-zero fields"), and the same attribution at line 124; §8.1 *Needs* (line 1159) and §8.2 *Needs* (line 1175) cite IG.2.4 for that input.

   Claim: the Hilbertian property of every finitely generated characteristic-zero field is supplied by InverseGaloisAndArithmeticFundamentalGroups IG.2.4.

   Witness: at the IG head, IG.2.4 (its README lines 1880–1935) defines Hilbert subsets and Hilbertian fields, proves number fields Hilbertian and proves *finite-extension* permanence only; the purely transcendental step is absent. NeronModelsAndSemistableAbelianVarieties §6.0 (its README lines 3537–3553) says it first extends the Hilbertian input from number fields to finitely generated characteristic-zero fields, by permanence under purely transcendental and finite extensions plus a Noether normalization, and declares "the permanence and Noether-normalization bridge" its own subtargets. So the statement cited is made by Neron §6.0, which this README already cites in both *Needs* lines.

   Repair (line 128): replace the first sentence by "IG.2.4 gives Hilbert subsets, Hilbertianity of number fields and finite-extension permanence; NeronModelsAndSemistableAbelianVarieties §6.0 extends Hilbertianity to finitely generated characteristic-zero fields and supplies the full-image closed points, consuming IG.2.4 and IG.2.6." Line 124: "InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and IG.2.6 supply the number-field Hilbertianity, its finite-extension permanence and finite full-group specialization used in that route". Keep the *Needs* entries. Tested on K=ℚ(t): IG.2.4 alone does not yield a Hilbert set in ℚ(t); Neron §6.0's purely transcendental permanence does.

2. **F02** (P3) the cusp-family contract names B5.13, the modular q-expansion comparison, for the Siegel Fourier normalization

   Location: `README.md:106` ("B4.9 and B5.13 identify their algebraic and classical analytic realizations with the Fourier convention") and the contract line 108 (gap:fixed-siegel-cusp-family, "AutomorphicBundles B4.2, B5.13"); §2.4 and §2.5 *Needs* (lines 451, 467).

   Claim: B5.13 supplies the rational Fourier normalization of the scalar Siegel cusp family for every g≥1.

   Witness: at the AutomorphicBundles head, B5.13 (its README line 5001) is "Tate and analytic q-expansion comparison": rank-one Fourier–Jacobi specialized to the Tate curve at full level n≥3, i.e. the GL₂ case. The scalar Fourier(–Jacobi) expansion with coefficients on the PEL toroidal model, which carries the rational Fourier coefficients of a Siegel scalar form in genus g≥2, is B5.1a `ScalarFourierJacobi.expansion` (line 4568). For g=1 B5.13 is the right section; for g≥2 the section cited does not state the expansion used.

   Repair: in lines 106 and 108 (and the §2.4/§2.5 *Needs*) write "B4.2, B5.1a (scalar Fourier–Jacobi expansion; B5.13 for g=1)". The plan's gap entry carries the section "B4.2, B5.13"; the package stage can only append gaps, so record the corrected section for the maintainer in the repair report rather than editing the entry. Tested at g=2: the family's Fourier coefficients live on the boundary modules of B5.1a; B5.13 has no Siegel-genus object.

3. **F03** (P3) gap:hermitian-metric-rescaling asks for a law whose degree half the supplier already states

   Location: `README.md:71` (contract gap:hermitian-metric-rescaling, "Multiplying every archimedean squared norm ... changes μ̂_max by −½ log c").

   Claim: the rescaling law is missing from ArakelovGeometryAndAbelianHeights.

   Witness: at the Arakelov head, §1.3 states `HermitianBundle.arakelovDegree_rescale` (its README line 242): for ‖·‖ ↦ e^{−c}‖·‖ the degree changes by [K:ℚ]c, by r[K:ℚ]c in rank r; §2.7 (line 305) uses exactly this to shift normalized heights. Multiplying squared norms by c₀ is c = −½ log c₀, so the normalized slope of every saturated subbundle, hence μ̂_max, changes by −½ log c₀ in one line once μ̂_max exists (the existence contract at line 65). Only the μ̂_max consequence is missing; the request as written re-asks the degree law.

   Repair (line 71): "What ArakelovGeometryAndAbelianHeights must provide (gap:hermitian-metric-rescaling): with §1.3's `arakelovDegree_rescale` (‖·‖ ↦ e^{−c}‖·‖ adds r[K:ℚ]c to the degree of a rank-r bundle), multiplying every archimedean squared norm on a nonzero Hermitian bundle by c₀>0 with the finite lattices fixed changes μ̂_max by −½ log c₀, since every saturated subbundle rescales with it." Tested on the Check at line 81: c₀=4 gives c=−log 2 and slope −log 2, the dual +log 2, unchanged.

4. **F04** (P3) "such groups are topologically finitely generated" is attributed to AGR §5.8, which does not state it

   Location: `README.md:120` ("Section 5.8, Compact subgroup charts, gives the closed-subgroup theorem ..., a normal open uniform pro-ℓ subgroup and matrix logarithm/exponential. Such groups are topologically finitely generated."); consumed by §7.4 (line 1073, "Compact matrix-group structure gives topological finite generation").

   Claim: §5.8 supplies topological finite generation of a compact subgroup of GL_n(E).

   Witness: AGR §5.8 at its head (its README lines 3301–3325, "Compact subgroup charts") constructs the analytic structure, the logarithm/exponential and a normal open uniform pro-ℓ subgroup U; finite generation of P is not among its statements or Checks. It follows in one line (U is finitely generated as a uniform pro-ℓ group and has finite index), but the pinned theorem `TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq` takes that hypothesis explicitly, so some owner must state it.

   Repair (line 120): "Such groups are topologically finitely generated: the uniform open normal subgroup of §5.8 is finitely generated and has finite index; this one-line deduction is made in §7.4." Add to §7.4's route after "Compact matrix-group structure gives topological finite generation": "(finitely many coset representatives together with the finite generating set of the uniform subgroup)". Tested on P=ℤ_ℓ^×: U=1+ℓℤ_ℓ (ℓ odd) is procyclic and has index ℓ−1.

Scope of this pass: the whole of `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md` (1306 lines, 51 targets, 12 definitions) and `Suggested.lean` (76 lines, 3 declarations) read line by line; every cross-roadmap citation resolved at the cited roadmap's current head (ASAM #849, Arakelov #1000, GN #851, AutomorphicBundles #1069, FaltingsI #1004, AGR #856, Neron #852, IG #850, EllipticCurveModularityPartII at its open head, SemisimpleAlgebras, ClassFieldTheory, HeightsAndUnits, IntegralLattices and ProfiniteArithmetic on main); every library declaration opened at the pins (Tau Ceti a91d3aa, Mathlib 6b7abb3); every cached-source locator read, and the five displays the text extraction lost (bost95 (5.7), (5.9)–(5.11), (4.4); mw93-isog-preprint Lemma 4.2 and (4.1)–(4.2); mz20 (21)–(24)) read on the rendered pages of the cached PDFs. The findings are all P3; no statement, Check, hypothesis, attribution, supplier citation or gap was found false, unowned, cyclic or duplicated.

## Verified sound

Counts: 3 Lean declarations read and their binders compared with the README by reading (no Lean run: the board checkout has no Lake environment; the worker's round-3 report records `lake env lean` exit 0 and a `#check @name` comparison with no lost binder; nothing changed since in the Lean file); 51 README targets and 12 definitions read; 64 source locators verified against the cached texts (mw95 20, mz20 8, mw94-preprint 8, mw93-isog-preprint 2, gr14 4, bost95 7, noot95 3, ry25 10, ts18 1, deligne84 1), of which 5 displays were read on rendered pages; 61 README Checks recomputed; 59 sibling citations checked at the cited heads; 19 pinned declarations opened (Tau Ceti 12, Mathlib 7) with every cited line number exact (`absLogHeight₁` 145, `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` 65, `frobenius_norm_mul` 657, `Algebra.discr` 67; `AbelianVariety` 95, `End` 83, `IsIsogeny` 61, `Isogeny.degree` 99, `covolume_sq_eq_det_gram` 42, `centralizer_centralizer_range` 293, `component` 70/121/136, `finite_openSubgroup_index_eq` 114, `ringEquivPiPadicInt` 162, `tendsto_sum_idem` 320).

Dependency gate (`gate --depcheck ... --movable`), verbatim:

    moved: FaltingsFinitenessAndIsogenyTheoremsPartII moved in the merge order from #47 to #228, right after its last supplier AutomorphicBundles (ArithmeticGaloisRepresentations, InverseGaloisAndArithmeticFundamentalGroups, NeronModelsAndSemistableAbelianVarieties, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems, EllipticCurveModularityPartII also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 52 roadmaps, 591 edges, 0 problem(s)

No UPWARD or CYCLE line. Every supplier named is on main, in the merge order before the moved position, or (EllipticCurveModularityPartII) an open new-roadmap pull request whose §6.0f target `quantitative-elliptic-isogeny` exists at its head with the bound 10⁷d²(max{h_F(E),985}+4 log d)² for all d≥1, CM and non-CM, geometric isogeny, stable height in Faltings' normalization, exactly as the contract at README line 116 records. The downstream consumer ComplexMultiplicationAndExplicitReciprocityPartII exists as a board package at the design stage.

Ownership by object (`roadmaps grep` over main and all 363 open heads): regular-trace order discriminants, class indices, division norm bodies, Hom cross-discriminants, Rosati Gram determinants, the Masser–Wüstholz factorization and isogeny estimates, the j-height elliptic bound, the finite Ẑ-span algebra B(V), supported connected images and the finitely-generated-field uniform Tate bound have no other owner; the quadratic elliptic estimate is EllipticCurveModularityPartII §6.0f (consumed, not restated); cubist models are Arakelov §5.8 (principal case; the symmetric ample extension is the declared gap). No `Suggested.lean` name collides with a declaration of a readable roadmap.

Lean statements. `regularOrderDiscriminant`: the integral left-multiplication trace on a free subring with ℤ-basis, as README §3.1 (general ring, nondegeneracy only asserted under fullness and semisimplicity). `class_index_bound`: `DivisionRing D`, `Algebra ℚ D`, `FiniteDimensional ℚ D`, order with ℤ-basis and full ℚ-span, e>0, left O-submodule M of Dᵉ finitely generated over ℤ with full ℚ-span; conclusion an injective O-linear Oᵉ→M of nonzero additive index ≤ |disc|^{e/2}. This is mw95 line 164 (Class Index Lemma) at the README's generality; the index convention 0=infinite is excluded by the `≠ 0` conjunct; `he` is not needed for truth (e=0 gives index 1 ≤ 1) and is a note, not a finding. `elliptic_isogeny_j_height_bound`: `∃ C>0, ∀ k` with `NumberField`, `2 ≤ finrank`, Weierstrass models with `IsElliptic`, a Tau Ceti isogeny over the algebraic closure (a coordinate pullback whose `MapsInfinity` integrality excludes constant maps, Isogeny/Basic.lean line 139), conclusion an isogeny of degree ≤ C·D²(log D)²(1+h(j(E₁)))²: mz20 line 397 (Lemma 2.2, c absolute, degree at most D≥2) and the derivation at README line 977 from the §6.0f bound and Arakelov §5.9 (h_st ≤ h(j)/12+3, Faltings normalization, verified at the Arakelov head line 1623). C is quantified before k, as it must be; `Type*` is a universe parameter of the theorem. `absLogHeight₁` at the pin takes `[Field K] [CharZero K]`, so the number-field instance is only used for the junk-free reading, as the README says.

Headlines and padding: the roadmap's headline theorems are §2.2, §2.7, §2.9, §3.5, §4.5, §5.2–§5.5, §6.1, §7.7, §8.1, §8.5. At the pins Tau Ceti has no Faltings height, no polarization, no Galois action on the points of its `AbelianVariety`, and Mathlib's `Scheme.Hom.finrank` (FlatRank.lean line 88) gives a degree but no height, so only §3.5 and §6.1 are statable, and both are stated; the module docstring names the missing carriers for the rest. No declaration restates a definition, mirrors a Check or computes a value; nothing to delete.

Gaps: every slug in the README's "Exact supplier contracts" is in `design/plan.json` `gaps` (hom-specialization-saturation, cyclic-maximal-subfield, fixed-siegel-cusp-family, hermitian-maximal-slope-existence, hermitian-symmetric-power-slope, hermitian-morphism-slope, hermitian-metric-rescaling, semistable-abelian-tangent-metric, cubist-model-symmetric-ample); each supplier and section exists at the supplier's head; none except R03's ingredient is already provided there (Arakelov has `HermitianBundle.slope` but no maximal slope and no symmetric powers; ClassFieldTheory Layer 10 has the Brauer sequence and ABHN exactness but no cyclic maximal subfield; SemisimpleAlgebras Layer 6 has maximal subfields, not cyclic ones). The legacy entries G1–G8 (supplier none), the coarse hermitian-maximal-slope entry without a README line, and the redundant injectivity clause of hom-specialization-saturation were marked not actionable in the round-2 repair report because the package stage may only append gaps; that reason is correct and they are not raised here.

Policy: the pull request changes only the package folder; no pull-request numbers, process words, `lemma`, `set_option`, machine paths or computational algorithms in README or Lean; every target carries a locator; imports are `Mathlib` plus one existing `TauCeti.*` module; every Lean name appears in the README and every backticked own name is declared.

Adversarial pass (one row per statement or convention; values computed on both sides):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions κP=Pρ, ρ=[[a,−b],[−c,d]], κ=a−τc | τ=i, v=i; τ=2i, κ=2i | a−τc=i gives (a,c)=(0,−1), −b+τd=−1 gives (b,d)=(1,0), ρ=[[0,−1],[1,0]]; τ=2i: (a,b,c,d)=(0,4,−1,0), lattice ℤ+2iℤ preserved by 2i | §1.1, §1.8 Checks hold |
| ε and E(1,i)=−1, E(i,1)=1 | Gaussian lattice, H(v,w)=v w̄ | Im H(1,i)=−1, Im H(i,1)=1, matrix [[0,−1],[1,0]]=ε; E(J·1,1)=1>0 agrees with ASAM A5.2 positivity | consistent |
| §1.7 q=tr(ρερᵀε⁻¹)=2 Re tr(κyκ̄ᵀy⁻¹) | v=i, τ=i; v=1 | ρε=−I, ρᵀε⁻¹=−I, trace 2; 2 Re(i·(−i))=2; without bar −2, without factor 1; v=1: 2g=2 vs g=1 | realification needed (mz20 (22) misprint, registered) |
| §1.2 q on E² shear | [[1,N],[0,1]], product polarization | vvᵀ=[[1+N²,N],[N,1]], Tr_A=2(N²+2); N=1: 6; identity 4; degree 1 | holds |
| §1.4 submultiplicativity | [2][3] on E; S² | 72≤144; q(S²)=2(4+2)=12≤36 | holds, not equality |
| §1.3 Rosati Gram | ℤ[i]; ℤ[2i]; M₂(ℤ) | diag(2,2)→4; diag(2,8)→16=2²·4; four matrix units of length² 2 →16 | holds |
| §1.5 deg=det ρ | [n]; diag(1,0); g=0 | n^{2g}; 0; empty det 1 | holds |
| §1.6 AM–GM | [−2] on E²; shear N=1 | 16=(16/4)²; 1≤(6/4)² | holds |
| §2.1 minimal subvariety | (η,η),(η,0),0 in E² | diagonal, degree of pr₁*O(0)⊗pr₂*O(0) on Δ is 2; first factor 1; zero variety 1 | holds |
| §2.2 period theorem form | bost95 (5.8) read on p. 135 | deg A_{γ} ≤ C₈ max(deg_L A,h(A),d,‖γ‖²)^κ; gr14 line 67 c=c₀[k:ℚ]^κ(deg_L A)^{1+gκ} | README's C_(g,d) max(1,D,h,q)^κ_g equivalent |
| §2.2a zero estimate | E, deg-2 line, two points; length-2 thickening; zero section; L^D | 2·1=2=d_L(E); 2≤2; 3≤2 false; D^{dim B}ℓ d_L(B)≤D^g d_L(A) gives D^{codim B} (bost95 (5.11) p. 137) | holds |
| §2.2b jets and (5.9) | g=2,3; M=N=2, D=4; type (1,2) line | lengths 1,2,3 and 6; T length 9+5=14; h⁰=16, kernel≥2; h⁰=32, kernel≥18; (5.9) on p. 136 is exactly the three displayed inequalities and (5.10) the restriction map | holds |
| §2.2b tangent heights | bost95 (5.7) p. 135 | h(F) ≥ −C₄(g) max(1,h(A),log deg_L A) | matches README |
| §2.3 period basis | mw93-isog Lemma 4.2 p. 6 | r(ω_i) ≤ c₂(dh)^{2m−1}Δ², from Π r(ω_i)≤c₃Δ² and r(ω)≥c₄⁻¹(dh)⁻¹; Cassels Ch. V Lemma 8 for a basis | Δ² exponent and HeightsAndUnits §2.1 route correct |
| §2.4–2.5 | mz20 lines 937–955 | y≥δy⁽⁰⁾, y⁽⁰⁾≥δI only; D⁻¹log max{1,|u|⁻¹}≪max{1,h(A)}; τ=100+it has same t | holds |
| §2.8 off-diagonal | swap on E² | q=4, length 2; D(M₂(ℤ))=16, √=4 | holds |
| §3.1 disc | ℤ; ℤ[i]; ℤ[2i]; ℚ[ε]/ε² | 1; diag(2,−2)→−4; diag(2,−8)→−16; diag(2,0)→0 | nondegeneracy needs semisimplicity, as stated |
| §3.2 class index | ℤ[2i] on ℤ[i] | [ℤ[i]:αℤ[2i]]=2N(α), min 2 | i₁≥2 ≤ √16 |
| §3.3 norm body | ℚ basis 1 and 2; ℚ(i); Hamilton Lipschitz order | 1·2=2 and 2·1=2; disk π, √4=2, p=2π; Gram diag(4,−4,−4,−4), |disc|=256, √=16, ball π²/2, p=8π²≥16 | holds |
| §3.4 index 3 | invariants ±1/3 | 2α=±2/3≠0, index 3, m=9, bound 512 | holds |
| §3.5 bound | ℤ,e=2; ℤ[2i], e=1,2 | 1≤1; 2≤4; 4≤16; mw95 line 230 i_e≤i₁i_{e−1} | holds |
| §3.6 proportionality | non-CM E; Gaussian E; non-CM E²; E×E′; E×S | 2=2; 16=16; 4096=4096; (2g/m)=2 holds; E×S: Tr(a,b)=2a+4b not proportional | scope sentence correct |
| §4.1 c | ℤ[i]; 2ℤ,3ℤ | det −4, c=16; (6)→36; sign flip 36 | holds |
| §4.2 block determinant | M₂(ℤ); M₄(ℤ); M₂(ℤ[i]); general | 2·(−4)·2=−16; 4⁴(−16)⁶=2³²; 2¹⁶; Gram [[2G,0,0,0],[0,2G,0,0],[0,0,0,2G],[0,0,2G,0]] gives (−1)^m2^{4m}d⁴ | mw95 Lemma 5.1 (line 445) matches |
| §4.3 norm–degree | simple A, D of dim m | V_ℓ free of rank 2g/m over D_ℓ, deg δ=|N_D(δ)|^{2g/m} | holds |
| §4.5 Zarhin input | simple A | A∨ isogenous to A so (A×A∨)⁴ isotypic; dim 8g, height 8h_F (Arakelov §6.1–6.2 lines 1658–1737) | §3.6 applicable |
| §5.3 quasi-inverse | [2] on E; degree N in dim g | dual degree 4=4^{1}; N^{2g}/N=N^{2g−1} | holds |
| §5.4 descent | k=ℚ, K=ℚ̄, g=1 | |GL₂(𝔽₃)|=48, 48²=2304; Hom_K=Hom_L^{Gal(L/K∩L)} | holds (mw95 lines 644–671) |
| §6.1 constant | D=1,2; j=0; h_F=−1 | 989²=978121, C₀=9,781,210,000,000; B(1,−1)=9,702,250,000,000≤C₀; D=2: H≤3, 36C₀ both sides; H≤(3/log 2)log D(1+h(j)) in all three cases of the max; D=1: h/12+3≤4max(1,h) | holds |
| §7.1 spans | Ẑ², V={1}; GL₂; rank 1 | scalar rank 1 vs 4; e₁₂=(I+e₁₂)−I, e₁₂e₂₁=e₁₁; Ẑ | holds |
| §7.2 product | W=∏W_ℓ; coset decomposition | ≤(2g)² adelic generators by Nakayama per prime; B(U′)=Σc_jB(W) compact; indices 2,3→6 | holds |
| §7.3 M_A | ψ(x)=2x; ψ=0 | sat index 2; kernels mod 2: 0→1, mod 3: 0→0; W∩ℓE₀∨=ℓW when ℓ∤[sat W:W] | holds |
| §7.4–7.6 | ℤ_ℓ open subgroups; full GL₂(ℤ/ℓ) | 1+⌊log_ℓ d⌋ choices; ℚ_ℓ[V]=Cent(Cent) by the pinned double centralizer with S=ℚ_ℓ[V] semisimple; residual algebra dim 4, Q/ℓQ=0⇒Q=0 | holds (ry25 lines 500–594) |
| §8.1–8.2 | constant E/ℚ(t); 2ℤ⊂ℤ at ℓ₀=3 | ranks 1,1; ℤ₃-equality with cokernel ℤ/2 | saturation contract needed, as stated |
| §8.3–8.5 | diagonal C₂ at two primes; ∏GL_n(ℤ_p); W=2ℤ,U′=3ℤ | supported factors trivial, W=1; W=U; [2ℤ:6ℤ]=3=[ℤ:3ℤ] | holds (ry25 Thm 4.7 line 456, Prop 4.8 line 602) |
| Arakelov contract Checks | trivial line; [2]; c₀=4; Sym²(ℤ²); type (1,2) on E₁×E₂ | 0=n(0+0); log 2−log 2=0; −log 2/+log 2; norms 1,½,1, (log 2)/2≤4 log 2; χ=2, c₁²=4, deg 4, rank 2n², ¼log 2 | hold; (4.4) on p. 129 is −½h(A)+¼log(χ/(2π)^g) |
| HeightsAndUnits §2.1 | ℤ² disk; (e₁,Ne₁+e₂) | factors max(1,(i+1)/2)=1,1; other basis length √(N²+1) | supplier statement matches (main lines 250–274) |

## Not verifiable

- `Suggested.lean` was not elaborated here: the board checkout has no Lake environment and the brief forbids a build. Binders and instances were compared with the pinned signatures by reading; the round-3 repair report's `lake env lean` exit 0 and `#check` comparison are relied on for elaboration.
- mw93-periods (waived) and mw95-refine (waived): the §2.3 matrix-height input, §2.4's Lemmas 8.4/8.6 and (7.4), and §7.5's Theorems 1–2 are cited by locator only, as settled; their use here matches mz20 lines 942–952 and ry25 lines 483–549 respectively.
- igusa Lemma 20 and fw84 Chapter VI §3 (uncertified): cited by locator only; mz20 line 953 and noot95 line 172 confirm the citations' role.
- bost95 Proposition 5.3(i) (the tangent-space lemma, p. 134) is on the page before the one rendered; (ii) at (5.7) was read and matches. The README's (i) with the extra log d_L(B) term is consistent with the C₆ bound on p. 135 but the display itself was not read.
- The exact mz20 Lemma 4.1 block bounds (p. 654) were not rendered; the README's τ=2i Check is consistent with them.

## Source issues

- **Misprint** in mz20 at equation (22), §4, printed p. 653: the source says the Rosati length squared equals the complex trace tr(κ y κ̄ᵀ y⁻¹) and also the rational trace tr(ρ ε ρᵀ ε⁻¹); it should be twice the real part of the complex trace, as the identity endomorphism (g versus 2g) and v=i on the Gaussian curve (1 versus 2) show; affects nothing (the rational form is the one used); already registered as this roadmap's E1.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b4df225", "job": "RT-FaltingsFinitenessAndIsogenyTheoremsPartII~1b", "model": "fable", "worker": "fable-rt46"} -->
