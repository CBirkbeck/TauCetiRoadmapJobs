# Review of AutomorphicSpectralTheoryPartII (pull request #1761 at 9fe55e7)

**Verdict:** needs changes

Full review of the 305-line change since 219f824. The previous review (r3, at 219f824) raised no finding, so there is nothing to audit finding by finding; the change is the author's own rewrite of ownership: fifteen declared supplier gaps on AutomorphicSpectralTheory and AutomorphicFormsOnReductiveGroups are withdrawn from the README and replaced by targets this Part II owns (§§1.1 products and torus Paley–Wiener, 1.2a, 2.5 isotypic sums, 2.15 tensor holomorphy, 2.15a, 3.2, 3.6a, 3.8, 3.10, 4.5a, 5.7), with a new PseudodifferentialOperators contract, a §0.5 pullback bullet and the GanGrossPrasadUnitaryGroups §6.3a owner named. Every changed passage and every unchanged section was read; the sampled locators, the new citations, the ownership of the newly owned objects, the gate, the dependency check, the Lean elaboration and the one-tactic probe are recorded below. One finding, P3, in a new Check.

## R01 (P3) — §4.5a PGL₂ Check: trivial K∞-type keeps only even Maass forms, and `d=0` contradicts `C,d>0`

Location: `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md` line 1443, "For PGL₂ over ℚ at level PGL₂(Ẑ) and the trivial K∞-type, the discrete spectrum consists of the constant function and the Maass cusp forms for SL₂(ℤ). Weyl's law … gives about R/12"; and line 1445, "so d=0 works", against the statement at line 1437, "there are C,d>0".

Claim: with K_f=PGL₂(Ẑ) and the trivial K∞-type, the K∞-fixed discrete spectrum is constants plus all Maass cusp forms of SL₂(ℤ), about R/12 of them with eigenvalue at most R.

Witness: K∞ is a maximal compact subgroup of PGL₂(ℝ), the image of O(2). PGL₂(ℚ)∖PGL₂(𝔸)/PGL₂(Ẑ)K∞ = PGL₂(ℤ)∖ℍ, where the determinant −1 coset acts by z↦−z̄. K∞-invariant functions are therefore the even Maass forms only; the odd forms carry the sign character of K∞. Weyl's law for the reflection quotient of area π/6 gives about (π/6)/(4π)·R = R/24 even eigenvalues up to R, not R/12 (R/12 is the count over both parities). Separately, the statement quantifies `C,d>0` while the second Check concludes "d=0 works".

Repair: either replace "the trivial K∞-type" by "the K∞-types {trivial, sign}" (equivalently SO(2)-spherical vectors), for which the space is constants plus all Maass cusp forms and the count is about R/12; or keep the trivial type and write "the even Maass cusp forms" with "about R/24". In the second Check write "so any d>0 works, with the count bounded independently of R" or change the statement's quantifier to d≥0. Tested: with the types {1, sgn} the K∞-finite part of L²_disc at this level is constants ⊕ all Maass cusp forms, N(R)~R/12, and d=1 is attainable while d=0 fails, as the Check intends.

## Verified sound

**Gate and dependency check.** My run of the gate at 9fe55e7: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (the worker's run adds `build=0`). Dependency check with `--movable`: `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Diff against origin/main outside the folder: 0 paths. Pins: Mathlib f6090c70, Tau Ceti 358314d4.

**Elaboration, binders, padding.** `lake env lean` on `Suggested.lean`: three `declaration uses sorry` warnings (lines 95, 108, 118), nothing else. A scratch file importing the module `#check`ed all ten declarations; each elaborated type equals the worker's recorded signature and its README statement (`HasRankBound`, `Differentiable`/`HasFiniteEntireOrder`, `LinearIndependent ℂ b` are explicit; no section binder lost), and `elementaryFactor 0 2 = -1` closes by `simp [elementaryFactor]; norm_num`. One-tactic probe on a scratch copy with `first | rfl | simp | infer_instance | decide | exact?` for each `sorry`: all three theorems fail (unsolved goals at 102:71 and 123:28, `exact?` fails at 112:49), so none is padding. The diff touches only the module docstring, which now names Delorme multipliers, Lapid's (HP), Müller's discrete counting and the refined discrete-data decomposition among the headlines not statable at the pins; none of these has a carrier at the pins (no reductive-group Schwartz algebra, automorphic quotient or Eisenstein inducing space), so stating nothing in their place is correct. The three Layer 0 headlines remain stated.

**New and changed citations, resolved at the heads named in the brief.**

| Citation (README) | Where resolved | Content found |
|---|---|---|
| AutomorphicSpectralTheory §0.50 | #925 line 849 | restricted tensor factorization, number field, Flath |
| AST §1.5; §§1.6–1.8; §§1.9–1.10 | lines 969, 980, 1008, 1019, 1030, 1051 | finite Weyl constant term; Paley–Wiener pseudo-Eisenstein series on G(𝔸)¹ with parameters in (𝔞_P^G)*; square-integrability; Langlands inner product; cuspidal data as Weyl-associate classes of (P,σ), σ in L²_cusp([M_P]¹); orthogonal Hilbert sum of L²([G]¹) |
| AST §§2.1–2.5, §2.3a, `M(w,λ)*=M(w⁻¹,−conj(wλ))` | lines 1530–1642, 1583, 1641 | local intertwiners, μ-function, GLₙ normalized estimates, continuation, local–global factorization with exactly that adjoint identity |
| AST §§3.1–3.4, §§3.5–3.6 | lines 1927–2012 | truncation, Maass–Selberg relations |
| AST §3.6a | line 2013 | Rankin–Selberg strip estimates, constants depending on the pair (not conductor-uniform, which §3.6a here proves) |
| AST §§4.1–4.5 | lines 2296–2380 | symmetric associate parameter fields, unitary Eisenstein spectral map, completeness, residual spectrum, finite multiplicity, number field, G(𝔸)¹ |
| AST §4.14a | line 2508 | number-field GLₙ residual blocks (Mœglin–Waldspurger) |
| AST §§6.1–6.4, `K_f(x,y)=Σ_{γ∈G(F)}f(x⁻¹γy)`, `K_{P,f}` | lines 2934–3005 | real invariant and operator Paley–Wiener; Arthur multipliers for compactly supported W-invariant distributions on `C_c^∞(G,K)`; kernels with that formula on `[G]¹` and the parabolic kernel |
| AST §7.1a | line 3765 | finite-place Luo–Rudnick–Sarnak bound `|α_{i,v}|≤q_v^{1/2−1/(m²+1)}` for unitary cuspidal GL_m over a number field |
| ALLF AL.R.2; AL.R.4; AL.3.6.1–AL.3.6.2; AL.3.7.2 | #924 lines 254, 274, 2142, 2159, 2193 | archimedean GLₙ parameters; isobaric sums; Rankin–Selberg continuation and pole criterion; functional equation; isobaric strong multiplicity one |
| PseudodifferentialOperators Layer 5 §5.1 (P5), Layer 6 §6.1 (P6) | main, lines 928–930, 1485–1487 | Hilbert-scale mapping estimates; ellipticity and two-sided parametrices modulo smoothing, with proper support |
| GanGrossPrasadUnitaryGroups §§6.2a, 6.3a, 6.4 | #1404 lines 1315, 1371, 1395 | §6.3a states (ii) bplzz Proposition 4.8 and (iii) Lemma 4.12 with "a linear section cb_h of bc_h from the symbol clause", which is the §0.5 pullback bullet |
| CongruenceSpectralGap §5.1 | #1504 line 816 | LRS bound for m≥2, GL_m(𝔸_ℚ), O(m)-spherical π∞, "no general nonspherical or number-field version is asserted", as the Scope says |
| AdelicAlgebraicGroups §§4.6–4.7; AFRG §§0.1–0.5, 2.1–2.7, 3.4–3.5, 4.1–4.2; SR.1.1–1.3, SR.2.2, SR.4.1–4.2; SM3; NCG N1 (projective tensors at its lines 87, 93) | #792 lines 5102, 5179; #1037 lines 88–184, 300–486, 580, 597, 625, 643; #1688 lines 1045–1294, 2027, 3172, 3267; #1158 line 82; main line 85 | all headings present |
| Mathlib `WithSeminorms.banach_steinhaus` | `Mathlib/Analysis/LocallyConvex/Barrelled.lean:164` at f6090c70 | barrelled source, seminorm-family target, uniform equicontinuity; Fréchet spaces are barrelled, so the §1.2a route applies |

The worker's `resolve` found no citation missing; I found none either.

**Declared gaps.** The README now states 16 gaps (real-plancherel-decomposition, tempered-characters-in-torus-strips, kostant-centralizer, generic-tensor-semisimplicity, minimal-type-detection, k-type-growth, quotient-height-comparison, cusp-fiber-bounds, deep-cusp-uniqueness, quotient-neighborhood-volumes, central-character-affine-lattice, satake-exponential-family, real-point-root-data, real-descent-cartan, local-sobolev-evaluation, hilbert-schmidt-nuclear-composition), each with a named supplier, a one-sentence `needs` with its hypotheses, and a section that exists at the supplier's head; none asks for what a pin or an earlier roadmap already provides (checked: AST §6.3 supplies only compactly supported multipliers, so the withdrawn rapid-symbol gaps were not supplied there; AST §4.5 is finite multiplicity, not counting). Remark, not a finding under the brief's rules: the board's `design/plan.json` still lists all 31 slugs, so the intake's announcements of the 15 withdrawn slugs (nash-schwartz-analysis, tensor-holomorphy, slf-isotypic-sums, frechet-bilinear-continuity, rapid-semisimple-centre, split-centre-fourier-laplace, cuspidal-data-central-comparison, cuspidal-polynomial-counting, hereditary-intertwining-bounds, refined-langlands-discrete-data, discrete-spectrum-casimir-counting, compact-eisenstein-comparison, arthur-factorization-comparison, compact-kernel-central-comparison, compact-kernel-spectral-comparison) on the AutomorphicSpectralTheory and AutomorphicFormsOnReductiveGroups jobs should be withdrawn by the worker, or those suppliers may build what this Part II now owns.

**Ownership of the newly owned objects.** `roadmaps grep` over the 466 open heads and main for Delorme, hereditary property, weak Ramanujan, uniform temperedness, Brumley, Müller, Luo–Rudnick, Aizenbud/Nash Schwartz, SLF, finite differentiability/Arthur factorization: no roadmap other than this one states Delorme's rapid-symbol multiplier (AST §6.3 is Arthur's compact-support multiplier; EndoscopicTransfer cites Delorme–Mezo's twisted Paley–Wiener), Lapid's (UT)/(WR)/(HP) or Lapid's polynomial intertwiner bounds, Brumley's lower bound, Müller's discrete counting, the K_f-isotypic SLF decomposition, Arthur's finite differentiability factorization, the Nash product comparison or the BPLZZ fixed-ω cuspidal data; the archimedean Luo–Rudnick–Sarnak bound exists only in the ℚ/O(m)-spherical form of CongruenceSpectralGap §5.1, which the Scope correctly records as a special case. GanGrossPrasadUnitaryGroups §6.3a (bplzz Proposition 4.8) is the single owner of transfer preservation, as the Scope and Downstream consumers now say. Ownership against open pull requests was checked through the `roadmaps grep` index and the sibling checkouts named in the brief.

Cross-roadmap remark for the operator, not a finding on this folder: GanGrossPrasadUnitaryGroups (merge order 235) declares `gap:spectral-isolation` and `gap:automorphic-spectrum` against AutomorphicSpectralTheory (85), while the T-multipliers, the isolation theorems and the Schwartz kernels it asks for are built here (293) and AutomorphicSpectralTheory stops before them. This README names GanGrossPrasadUnitaryGroups only as a downstream consumer and never as a supplier (depcheck clean), so the direction is right on this side; the repair of the gap's supplier and of GanGrossPrasadUnitaryGroups' position belongs to that pull request.

**Source locators: the seeded sample and every new locator** (bplzz and lapid printed page = preprint page; bpcz journal pagination).

| Target | Source, locator | What I read | Result |
|---|---|---|---|
| 0.6 | bplzz line 471 (Def 2.8(2), p.10), 484 (Remark 2.9) | N_θ: sup over strips and lattice translates finite for every r; closed under multiplication and W | matches |
| 1.1 | bplzz line 522 (§2.3, p.11), 540–546 (Remarks 2.11–2.12); line 2163–2167 (Lemma A.2 proof, p.44) | Df bounded for algebraic D; S⊂⋂C^p with equality iff centre compact; L² derivative topology; Paley–Wiener S(split torus)≃N; [AG10, Cor 2.6.3] product isomorphism | matches, including the new product and torus clauses |
| 1.2a | bplzz line 2099–2109 (Prop A.1, p.43), 2169–2174 ([Del86 Thm 1.7], [Sak Thm 2.1.2]), 2179 (closed graph), 2198 ([Trè67 Thm 34.1]) | semisimple linear connected case is Delorme; Z⁰ case with smooth characters; continuity by injective transform and closed graph; separately continuous bilinear on Fréchet extends to the completed tensor | matches; W-invariance only on the semisimple factor, as stated |
| 1.5 | bplzz line 971 (Lemma 2.25, p.20) | I(σ_ξ)⊗τ semisimple for ξ in general position | matches |
| 1.8 | bplzz line 590 (Lemma 2.18, p.13) | finite set T(μ) of K-types meeting every π with μ(χ_π)≠0; limits of discrete series and minimal K-types in the proof | matches |
| 1.9 | bplzz line 1063 (Def 3.1, p.21); bpcz line 1151 (§2.5.2) | S(G(𝔸))=S(G∞)⊗S(G(𝔸_f)), C_c^∞ at finite places; support C and level J stages | matches |
| 2.5 | bpcz line 1170 (§2.5.3), 1202–1216 (§2.5.4), 1222 (Lemma 2.5.4.1), 1231–1250 (V=⊕V_ρ, (2.5.4.3)) | SLF definition; closed invariant subspace inherits SLF with induced topology; proof via K_f-isotypic topological direct sum | matches the new isotypic-sum target |
| 2.6 | bpcz line 1252–1273 (§2.5.5) | L²_w, non-unitary continuous representation, smooth vectors with R(X)φ∈L²_w, (2.5.5.4) | matches |
| 2.10 | bpcz line 1298–1313 (§2.5.7) | S([G]_P)=(S₀⁰)^∞, dense in every L²_w^∞, =⋂_N L²_N^∞ by open mapping | matches |
| 2.15 | bpcz line 1402 ((2.5.12.10)), 6514 ((A.0.3.1)), 6617 (A.0.7) | nuclearity of S^J, C^J; holomorphy criterion: continuous plus holomorphic pairings against a total set; completed projective tensor universal property | matches; the tensor-holomorphy route (total set of ℓ⊗m by nuclearity) is sound |
| 2.15a | bplzz line 1147 (Ω_M(ω)), 1150–1153 (ξ_s, s∈a*_M=(a_M^G)*), 1158–1175 (Def 3.9, (3.1)); bpcz line 2063–2070 (§2.9.1) | C(M,ω): central character restricting to ω on Z(𝔸); ∼ by s∈ia*_M (relative); ≈ by Weyl; coarse decomposition (3.1); X(G) with central character trivial on A_P∞ | matches |
| 2.17 | bpcz line 1460–1471 (Prop 2.5.14.1) | ‖x‖_P^N d_P^Q(x)^{−r} bound; A_Q∞ integral with w(a)δ_Q(a)^{−1}, N chosen before r | matches |
| 3.1 | bpcz line 1975–1985 (Prop 2.8.4.1) | K-basis, absolute convergence in the completed tensor uniformly on compact real parts | matches |
| 3.2 | bpcz line 2043–2061 (Prop 2.8.4.3) | Z, g₁∈C_c^∞, g₂∈C_c^m, K∞-conjugation invariant, bi-K₀, f=f*g₁+(f*Z)*g₂; [Art78] Lemma 4.1, Cor 4.2 | matches (second-slot display: see Source issues) |
| 3.6a | lapid line 558 (Def 3.2), 571 (Lemma 3.3), 599 (Prop 3.4), 619 ((19)), 628 ((21)), 647 (Prop 3.5), 673 (ξ(s) formula), 694 (residual via [MW89]), 709 (Def 3.7), 724 (Thm 3.8, c=2/(n²+1)), 771 (Lemma 3.11), 801 (HP), 804 (Cor 3.13), 1178 (Appendix A) | every quantifier of (UT), (WR), (HP) and the bounds as restated | matches |
| 3.8 | bpcz line 2420–2425 (§2.10.1) | kernels K_{f,P}, K_{f,P,χ}, K⁰ and their relation | matches |
| 3.10 | bpcz line 2480–2500 (Lemma 2.10.2.1) | coefficient |𝒫(M_P)|⁻¹, absolute value outside the τ-sum, x,y∈G(𝔸)¹, bound ‖L(X)R(Y)f‖‖x‖^N‖y‖^N; "extension to Schwartz functions of [Art78, §4]" | matches |
| 4.5a | bplzz line 1459–1463 (Remark 3.20), 1267 ([Don82 Thm 9.1] in Lemma 3.12), 2294 ([Mül89]) | Müller's theorem replaces Donnelly's in Lemma 3.12 for the Langlands version | matches |
| 4.6 | bplzz line 1263–1267 (Lemma 3.12) | finite rank of Casimir values via Donnelly on M_der | matches |
| 5.7 | bplzz line 1464–1470 | D′(G,ω) with discrete σ, same ≈, Langlands decomposition refining (3.1) | matches |
| 0.5 pullback | bplzz line 1820–1830 (Lemma 4.12 proof, p.37) | splitting sending W′-orbits into W_V-orbits; bc and cb preserve M(·)^W by Remark 2.9(3) | matches |
| bibliography | bplzz line 2204, 2235, 2237, 2294, 2305, 2307 | [AG10], [Del86], [Don82], [Mül89], [Sak], [Trè67] | as cited |

**Adversarial table, changed and new statements** (values on each side).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 torus Paley–Wiener, Check | f(t)=exp(−(log t)²), x=log t | ∫e^{−x²−λx}dx=√π·e^{λ²/4}; |e^{λ²/4}| on |Re λ|≤M is ≤e^{M²/4}e^{−τ²/4}: in N | true | none |
| 1.1 non-example | f(t)=2t/(1+t²)=1/cosh x | decay e^{−|x|}=t^{∓1} only; ∫e^{−λx}/cosh x dx=π/cos(πλ/2) on |Re λ|<1, poles ±1 | not Nash Schwartz, transform not entire | none |
| 1.1 Nash decay on ℝ_{>0} | algebraic operators include t^{±N} | f Schwartz ⇒ e^{N|x|}f bounded for all N; converse by contour shift Re λ=±σ gives |f(x)|≤C_σe^{σx} for every σ | S(H⁰)≅N(h*_ℂ), both directions | none |
| 1.1 product | G₁=G₂=ℝ, exp(−π(x²+xy+y²)) | kernel e^{−πxy} has infinite rank; element of the completion, not a finite sum | Check true | none |
| 0.5 pullback, strip width | ι:h₁*→h₂*, ‖Re α‖≤M | ‖Re ι_ℂα‖=‖ι(Re α)‖≤‖ι‖M; (1+‖ι‖‖α‖)^d≤(1+‖ι‖)^d(1+‖α‖)^d | moderate ⇒ moderate | none |
| 0.5 pullback, Checks | W₂ swap, ι(z)=(z,z); ι(z)=(z,0), W₁={±1} | z₁z₂↦z², value 4 at 2; z₁−z₂↦0; orbit {(z,0),(−z,0)} vs swap orbit {(z,0),(0,z)}; z₁+z₂↦z with values 1,−1 | both Checks true | none |
| 1.2a split-torus multiplier | μ(λ)=e^{λ²}, k(x)=(4π)^{−1/2}e^{−x²/4} | ∫k(x)e^{−λx}dx: −x²/4−λx=−(x+2λ)²/4+λ² ⇒ (4π)^{−1/2}·√(4π)·e^{λ²}=e^{λ²}; k(0)=(4π)^{−1/2}; |e^{(σ+iτ)²}|=e^{σ²−τ²} | true | none |
| 1.2a non-compact output | f≠0 compactly supported, μ⋆f compactly supported | e^{λ²}f̂ of exponential type ⇒ log|f̂(σ)|≤C′+R|σ|−σ², so ∫log|f̂|/(1+σ²)=−∞, contradicting f̂≢0 of exponential type | Check true | none |
| 1.2a Weyl invariance | SL₂(ℝ), μ(λ)=λe^{λ²} | μ(1)=e, μ(−1)=−e, same infinitesimal character | μ(χ_π) undefined | none |
| 1.2a joint continuity | ℓ² weak, e_n | ⟨e_n,y⟩→0 for every y; ⟨e_n,e_n⟩=1 | separately but not jointly continuous; non-metrizable | none |
| 2.5 isotypic sum, Check | GL₁, V=ℂ⊕ℂ_ε | ε|K_f≠1: lines of types 1 and ε|K_f; ε|K_f=1: one trivial-type summand of dimension 2 | true | none |
| 2.15 tensor holomorphy, Checks | E=F=ℂ, e=λ, f=λ² or conj λ; S(ℝ)⊗̂S(ℝ) | λ³ holomorphic; |λ|² not; exp(−π(x²+y²)+λ(x+y)) at λ=0, origin: 1 | true | none |
| 2.15a Z(𝔸)∩G(𝔸)¹ | GL₂, M=T, z=diag(a,a) | T-characters t₁^at₂^b restrict to a^{a+b}; |a^{a+b}|=1 iff |a|=1; in general rank X*_F(G)=dim Z so Z(𝔸)∩G(𝔸)¹=Z(𝔸)¹⊂M(𝔸)¹ | the ω-isotypic part of an AST block is the block or 0 | none |
| 2.15a unitarity of restriction | Z(𝔸)=A_G∞×Z(𝔸)¹ | Z(𝔸)G(F)∖G(𝔸)=Z(𝔸)¹G(F)∖G(𝔸)¹; Z(F)∖Z(𝔸)¹ compact | restriction unitary for compatible measures | none |
| 2.15a Checks | G_m/ℚ; GL₂, σ⊗|det|^{it}; Borel χ₁⊠χ₂ | [G]¹ compact, blocks = characters, (a_G^G)*=0; |z|^{2it} at z=e is e^{2it}=−1 at t=π/2, central characters differ for t≠0; Weyl conjugate pairs one block | true | none |
| 3.2 parametrix Check | ℝ, Δ=1−d²/dx², E=e^{−|x|}/2 | E′=−sgn(x)E, E″=E−δ ⇒ ΔE=δ; E continuous, not C¹; Δ(φE)=δ−h, h smooth compactly supported | true; no smooth g₂ since Δg₂+g₁ smooth ≠ δ | none |
| 3.2 kernel regularity | ψDO of order −N on an n-manifold | kernel ∫a(x,ξ)e^{i(x−y)ξ}dξ has m continuous derivatives when N−m>n | "C^m once N>m+dim G∞", 2k>m+dim G∞ | none |
| 3.2 second slot | I(λ,x)φ(g)=e^{⟨λ,H_P(gx)−H_P(g)⟩}φ(gx), Petersson | ⟨I(λ,x)φ,ψ⟩=⟨φ,I(−λ̄,x⁻¹)ψ⟩; unitary at λ∈ia* iff adjoint is I(−λ̄,·) | README's `I_P(λ,g)*=I_P(−conj λ,g*)` right; source display differs (Source issues) | none |
| 3.6a GL₁ | no maximal parabolic | (UT), (WR) vacuous; 2/(1+1)=1 unused | true | none |
| 3.6a GL₂ Borel, π=χ⊗χ | Λ_F completed Dedekind zeta | n_β(π,−s)=Λ_F(1−s)/Λ_F(1+s); Λ_F(1±s)~±r/s ⇒ value −1 at 0; |Λ_F(1−it)|=|Λ_F(1+it)| ⇒ modulus 1 on Re s=0; agrees with scattering value φ(1/2)=−1 | true | none |
| 3.6a WR constants | GL₃, GL₂, GL₂×Res GL₃ | 2/10=1/5, 2/5, min=1/5 | true | none |
| 3.6a restriction of scalars, products | Res_{K/F}GL_n; G₁×G₂ | automorphic data of Res GL_n over F are those of GL_n over K; maximal parabolics of a product are maximal in one factor | (UT),(WR) inherited with the minimum constant | none |
| 4.5a PGL₂ Check | K∞=PO(2), level PGL₂(Ẑ) | quotient PGL₂(ℤ)∖ℍ, reflection z↦−z̄; K∞-fixed = even forms; N_even(R)~(π/6)/(4π)R=R/24; both parities R/12 | R/12 wrong for the trivial type | R01 |
| 4.5a quaternion Check | D definite over ℚ, H=D^×/ℚ^× | H∞ compact; H(ℚ)∖H(𝔸_f)/K_f finite; finite type set ⇒ finite-dimensional, count bounded | true, but "d=0" vs "d>0" | R01 |
| 4.5a continuous spectrum Check | PGL₂/ℚ | Eisenstein series fill [1/4,∞) | count over all L² infinite for R>1/4 | none |
| 4.6, 4.7 routes | M_der at the conjugate common level | §4.5a with trivial central character gives Donnelly's case | consistent with bplzz line 1267 | none |
| 5.7 refined components | PGL₂ Borel at λ=it vs residual λ=ρ=1/2 | q(λ)=λ²−1/4: −t²−1/4 vs 0, distinct at t=0; same coarse support | Check true | none |
| 5.7 decomposition | D′(G,ω)/≈ | σ-isotypic parts of AST §4.1 inducing spaces on M(𝔸)¹ capture the whole ∼-class, as in 2.15a | consistent | none |
| Scope on CongruenceSpectralGap §5.1 | m=3: 1/2−1/10=2/5 | CSG states |Re μ_j|≤1/2−1/(m²+1) over ℚ, O(m)-spherical; §3.6a's (19) is 1−Re α_j>1/(n₁²+1)+1/(n₂²+1) for pairs over any number field | special case, as stated | none |

**Adversarial table, statements the diff leaves untouched** (carried from the previous reports, which computed them; sections unchanged at this head).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 4.2a near equivalence, GL₁ Check, spherical criterion, eigenpart containment (r3) | GL₁/ℚ, ω⊗χ with χ₂(2)=−1; GL₂ Satake pairs (2,3),(3,2) | π(2)=−1, non-automorphic, line obtained; (1−2T)(1−3T)=1−5T+6T² vs 1−4T+4T² | true |
| 5.5, 5.6 (r3) | GL₂/ℚ, σ=χ₁⊗χ₂, χ₁≠χ₂; χ|·|^{±1/2} | isobaric strong multiplicity one returns {χ₁,χ₂}; χ∘det and St⊗χ share a.e. parameters | true |
| `finite_rank_weierstrass_product`, `HasRankBound`, interpolation theorems, `HasRapidVerticalDecay` (r1–r3) | p=0 Λ={n²}; p=1 Λ=ℤ; Λ=∅,{0}; Λ={1/(n+1)}; k=1, a=1/2, b=1 | least ranks 1, ∞; Ψ≡1 for ∅; Ψ′(0)=1; lattice points −1/2,1/2,3/2; exp(±z²) | true |
| §§0.4–0.10, 1.3–1.9, 2.1–2.14, 2.16–2.18, 3.1, 3.3–3.9, 4.1–4.4, 4.8–4.9, 5.1–5.4 (r1) | as listed there | e^n/(1+n)^d→∞; δ_B=4: 4^{±1/2}; GL₃ depth t vs modulus t⁴ at t=2: 2 vs 16; E₀(2)=−1; circle projector e_n(x)conj(e_n(y)) | true |

**Shape and policy of the changed lines.** No LaTeX delimiters, pull-request numbers, process words or paths; headings keep `### k.n`; every new target has a locator, a `*Needs:*` line and at least three Checks where it defines something (§1.2a three, §2.15a three, §3.6a three, §4.5a three, §2.5 now six); the Layer 1–5 Dependencies lines list the new suppliers (PseudodifferentialOperators, AL.R.2, AL.3.6.1–2, AAG §§4.6–4.7, AST §§4.14a, 7.1a); the References paragraph locates every secondary source at its use in a cached text and claims nothing read from the uncached ones. Headline list unchanged: BPLZZ Theorems 2.13, 3.6–3.7, 3.19, 1.1/1.3, Remark 3.20; BPCZ §§2.5, 2.9–2.10; Lapid (HP) and inversion; none statable at the pins except the three Layer 0 results, which are stated.

## Not verifiable

- `bernstein` (Bernstein 1988): settled as uncertified; cited by locator only.
- [Del86], [Sak], [AG10], [Trè67], [Don82], [Mül89], [Art78], [MS04], [Bru06]: read only through their uses in bplzz, bpcz and lapid at the lines in the table; the README states them at the generality of those uses and the proof routes name the inputs, so no locator into those texts was checked. Müller's Theorem 0.1 in particular was verified only as "the discrete-spectrum counting bound BPLZZ substitutes for Donnelly's" (bplzz line 1460).

## Source issues

- **Misprint** in bpcz at Proposition 2.8.4.3, printed p.229: the second slot of both sums is written with the parameter λ̄ and the inverted function g_i^∨; the Petersson adjoint of I_P(λ,g_i) is I_P(−λ̄, g_i^*) with g_i^*(x)=conj g_i(x⁻¹), and only this is unitary-consistent on the imaginary axis; affects a stated result (the displayed identity), not the argument, which the README's §3.2 Check already corrects.
