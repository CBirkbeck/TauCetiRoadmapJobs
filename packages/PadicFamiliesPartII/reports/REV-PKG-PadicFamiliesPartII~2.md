# Review of PadicFamiliesPartII (package, round 2)

**Verdict:** needs changes

Seven findings, six blocking: two P1, four P2 and one P3. The package is repairable within its existing scope. README, Suggested.lean, metadata and the design were not edited. The sources service appended AIP15 to sources.toml; the five existing entries were preserved.

**Previous findings, checked first.** The repair report is evidence, not authority. I checked its changed statements and searched for the same patterns elsewhere.

| Previous finding | Disposition | Repaired passage and verification |
| --- | --- | --- |
| F01, purported reversal of BGG scaling | Partly repaired: the clarification is sound and the reversal request is withdrawn; the supplier-contract portion remains (R05). | README §6.4: “prove `θ_v ∘ U_source = p^{m_v} U_target ∘ θ_v`”. AIP15 Proposition 7.2.3, p. 34, lines 1511–1521, and Proposition 7.3.1, p. 35, lines 1538–1540, give precisely this direction. With θe=f, α=p^mβ, hence the equivariant target operator is p^mU, not p^(−m)U. The previous review's slope argument reversed this implication. |
| F02, obsolete supplier labels | Repaired | README lines 110–113: “§3.3: highest weights and coefficient conventions”; “§12.1, §12.11, §12.15: finite locally free traces, geometric Hecke operators and Fourier–Jacobi expansions.” All seven AutomorphicBundles translations and thirteen ShimuraCompactifications translations resolve at their heads. The three gap sections agree with plan.json: 7.20, 7.25, 4.3. No former B/C labels remain in these citations. |
| F03, duplicated coadmissibility | Repaired | README line 910: “a coadmissible `Û(𝔤)`-module is then a coadmissible module of that section”. Scope line 11 and the supplier block import PadicLocalLanglandsForGL2Qp §0.1. Its README at PR #1312, lines 205–220, defines compatible finite Banach-stage modules. The new target is the particular completed enveloping algebra, not general coadmissibility. |
| F04, wrong sign-error locator | Repaired | README line 1268: “P20 Proposition 15.2.4.1 (p. 109).” P20 line 4988 contains the offending sign; lines 4903 and 4933 impose λ₁<0 and k=−λ₁−1. At k=0,5 the parameter is −1,−6. |

## R01 (P1) — Lie cohomology is substituted for Lie homology

**Location:** packages/PadicFamiliesPartII/README.md:929, repeated at lines 937, 942 and 980. Quote: “`H^i(Loc(M(−λ)))|_{C_w^†} = HCS_{w,λ}(H^i(𝔲_{P_w}, M))`”.

**Claim:** The right-hand coefficient and the coefficient carrying the Sen action are Lie cohomology. They must be Lie homology, with its Levi action, not just vector spaces of the same dimension.

**Witness:** BCGP25 lines 1184–1187 define H_i by derived coinvariants. For GL₂ with xe₂=e₁, H₀=M/xM has torus weight ε₂; H⁰=ker x has weight ε₁. At diag(2,1), the eigenvalues are 1 and 2.

**Repair:** Replace the coefficient by H_i(𝔲_{P_w},M), including the API, Check and Sen-action sentence of §7.5. State H_i=H^(−i)(E⊗^L_{U(𝔲)}M). Keep the cohomology calculation of §7.1 explicitly separate. Cite BCGP25 Theorem 3.5.11, p. 58, line 2690, with its duality explanation at lines 2693–2698. Add the weight-sensitive GL₂ Check: homology weights in degrees 0,1 are ε₂ and 2ε₁−ε₂; cohomology weights are ε₁ and 2ε₂−ε₁. The corrected right-hand side uses eigenvalues 1,4 rather than 2,1/2 in this example. The derived tensor in §7.5 already has the correct variance; preserve it.

## R02 (P2) — The localization decomposition lacks a central-character hypothesis

**Location:** packages/PadicFamiliesPartII/README.md:929. Quote: “For `M ∈ O(𝔤,𝔟)_{λ-alg}` … `Loc(M)` decomposes … as `⊕_{w} Loc(M)_{−w_{0,M}(w·λ + 2ρ_M)}`”.

**Claim:** Membership in the λ-algebraic weight coset is treated as having infinitesimal character λ. These conditions are different.

**Witness:** For GL₂, λ=0 and M=det belong to O₀-alg. The scalar Lie matrix acts on M by 2, hence horizontally on Loc(M) by −2; every displayed λ=0 character has central value 0. See BCGP25 lines 2638–2652.

**Repair:** Retain general λ-algebraic M for localization and the spectral sequence, but impose infinitesimal character λ for this particular decomposition. Cite Corollary 3.5.4 and Remark 3.5.5, printed p. 57, rather than p. 58. Index direct factors by distinct generalized eigencharacters, retaining generalized structure at singular characters. Add det at λ=0 as a negative control: it is admitted by the category and excluded by the added hypothesis. With λ=(1,1), its actual character is included and the horizontal central scalar is −2. Do not narrow all of §§7.1–7.5 to a single block merely to repair this sentence.

## R03 (P2) — Analytic localization is a derived object, not an exact sheaf functor

**Location:** packages/PadicFamiliesPartII/README.md:929 and :935. Quotes: “the `G`-equivariant sheaf” and “Loc is exact and contravariant”. The associated supplier contract is at line 155.

**Claim:** Loc is defined as a sheaf and claimed exact on an abelian category, but subsequent targets require its positive cohomology and derived functoriality.

**Witness:** BCGP25 lines 2606–2609 define Loc=RHom into a derived category. For GL₂, λ=0, M=E trivial and one-dimensional 𝔲, H₁(𝔲,E)=𝔲≠0; Theorem 3.5.11 gives nonzero H¹(Loc), impossible for a sheaf in degree zero.

**Repair:** Define the contravariant derived localization functor on the stated BGG domain, with values in the derived category of solid analytic differential-operator modules, using the continuous completed dual description. Its λ-twist has the (𝔤,B)-equivariance of BCGP25 §3.5.8, not an assumed integrated G-action on every BGG module. Replace abelian exactness by the distinguished-triangle assertion. Make gap:solid-vb-sen precise about the derived VB_red functor; distinguish its degree-zero restriction VB⁰ on the acyclic sheaves used for HCS. The trivial GL₂ module then has nonzero cohomology in degrees 0 and 1, as required, rather than being truncated to degree zero. Update §7.4 and §8.3 consistently; the latter extension is H¹ of the derived-invariant object (BCGP25 lines 2914–2921).

## R04 (P1) — The BGG-coefficient higher Coleman functors have no owner

**Location:** packages/PadicFamiliesPartII/README.md:906, :929 and :980. Quote: “Higher Coleman complexes `HC_{w,λ}` … are those of HigherHidaAndColemanTheory §§5.1, 5.5”.

**Claim:** The supplied finite-slope geometric theory is used as a contravariant functor on arbitrary Levi category-O complexes, including infinite slopes. Neither this package nor the cited supplier states that extension.

**Witness:** packages/HigherHidaAndColemanTheory/README.md:752 gives Bruhat geometry; :814 gives a finite-slope spectral sequence; :960 treats analytic-character coefficients. BCGP25 lines 3112–3118 explicitly distinguish extension to arbitrary BGG coefficients and infinite slopes from the older theory.

**Repair:** Add owned, mathematically named targets before their use for HCS and the derived HC/HC_cusp functors on O(𝔪_w,𝔟_w)_{λ-alg}, specifying domain, target, support, twists and exactness. Use BCGP25 Definition 3.4.17, p. 56, lines 2582–2589, and Definition 4.6.35, p. 88, lines 3949–3963. State the finite-dimensional and Verma finite-slope comparisons with the imported theory (Theorems 4.6.56–4.6.57, pp. 96–98). Add at least three discriminating Checks, including zero, a Verma-to-simple quotient and the support/finite-slope distinction. Connect §§7.2 and 7.5 to these targets. Test the domain on the nonsplit SL₂ BGG sequence 0→M(−2)→M(0)→E→0: the repair supplies a contravariant triangle, whereas the cited finite-dimensional-weight interface cannot even accept all three terms. On a scalar U=0 coefficient space the full space has dimension 1 and its finite-slope part dimension 0, so finite-slope comparison alone cannot define the promised full functor. No substitute should be added to Suggested.lean.

## R05 (P2) — The correct BGG convention still contradicts the imported supplier contract

**Location:** packages/PadicFamiliesPartII/README.md:7 and :846. Quote: “this roadmap uses them as stated there”.

**Claim:** HigherHidaAndColemanTheory §9.6 is imported unchanged, including its Klingen BGG scaling, while §6.4 uses the opposite reflected-term twist.

**Witness:** packages/HigherHidaAndColemanTheory/README.md:1396 intertwines middle-term U with p^(−k−1)U on the last term. At k=3 a standard reflected slope −3 becomes −7; this package requires p⁴U, giving slope 1 and excluding ordinarity.

**Repair:** Keep the mathematics of §6.4. Qualify the import in Scope and the supplier contracts by the corrected identity θU_s=p^(k+1)U_tθ and reflected action p^(k+1)U_t. Declare a precise supplier correction contract/gap for this normalization, with the same slug in the allowed top-level gaps list, so the supplier owns its Klingen comparison and the intake can communicate the correction. Cite AIP15 Proposition 7.2.3, p. 34, and §7.3, p. 35. Do not reproduce the supplier's theorem as a competing owned target. The repaired import and §6.4 both give the reflected lower bound −3+4=1 at k=3.

Re-raised: REV-PKG-PadicFamiliesPartII/F01 (supplier-contract portion only). This does not re-raise its erroneous reversal request. The repair report's reason that “intertwined with” fixes no direction fails: an exact-sequence differential from the middle to the last term intertwining the two displayed actions specifies θU_s=(p^(−k−1)U_t)θ. Reversing how that equation is written does not change its exponent. The source and supplier can be corrected without changing this package's correct Hilbert identity.

## R06 (P2) — The partial-Hasse gap asks another supplier to own existing relative vanishing

**Location:** packages/PadicFamiliesPartII/README.md:102, gap:partial-hasse-regularity. Quote: “relative toroidal-to-minimal acyclicity of the cuspidal coefficients”.

**Claim:** This is requested as missing theory from ShimuraCompactifications even though the earlier AutomorphicBundlesPartII already owns that relative vanishing, including opens and finite coefficient algebras.

**Witness:** PR #1823, TauCetiRoadmap/AutomorphicBundlesPartII/README.md:944–946, §5.2, states Rⁱπ_*E=0 for formally subcanonical E, i>0, on normalized PEL models, also over minimal opens and finite coefficient algebras.

**Repair:** Import AutomorphicBundlesPartII §5.2 by name and section. Remove generic relative vanishing from this gap's README and plan needs. Keep precisely the missing supported-stratum formal-coefficient/regularity verification and the two-affine cover, with the hypotheses required to apply §5.2. Do not promise canonical acyclicity at n=0: the supplier excludes it. Tested at the subcanonical n=0 specialization, the imported result is exactly Rⁱπ_*E=0 for i>0; at canonical n=0 neither the new citation nor the narrowed gap should assert vanishing. The other partial-Hasse inputs remain declared contracts, not missing-prerequisite findings.

## R07 (P3) — Downstream design citations lose their numbering

**Location:** packages/PadicFamiliesPartII/README.md:7–13 and Layers 7–9, with no former-numbering map. Quote: “the four projective Hida modules … (Layer 9)”.

**Claim:** The package replaces the design's E6/S7/F8/K2 labels without preserving labels already used by an open consumer.

**Witness:** PR #1817, TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:129, cites E6/four-pieces, S7/sen-cousin, S7/de-rham-classicality and F8/four-modules through F8/central-character. These exist in packages/PadicFamiliesPartII/design/README.md:1057, :1151, :1189 and :1219, but not the package README.

**Repair:** Add a concise former-numbering map in Scope: E6→Layer 7, E6/four-pieces→7.8; S7→Layer 8, S7/sen-cousin→8.4, S7/de-rham-classicality→8.6; F8→Layer 9, F8/four-modules→9.1, F8/projectivity→9.2, F8/classical-specialization→9.3, F8/coleman-specialization→9.4, F8/perfect-pairing→9.5, F8/tame-projectivity→9.6, F8/central-character→9.7. Map K2 to Layer 3 and the explicitly imported HigherHidaAndColemanTheory §§9.6–9.7 for its BGG/continuation parts. Following the consumer's three Sen/filtration links then reaches precisely §§7.8, 8.4, 8.6; its module interval reaches §§9.1–9.7. This is the old-numbering preservation required by the brief, not a new target catalogue.

## Verified sound

**Scope of the pass.** Read the four package files, the previous review and repair, design gaps, the board-package index, cached citation/overlap leads, 23 supplier contracts and their cited sections. Read all 62 target subsections and their Checks, routes and Needs. Reused the earlier review only for unchanged statements having actual computed rows, not its blanket assertions. In particular, independently expanded the previously thin or absent checks of §§1.3, 2.3, 2.7, 4.1, 7.2, 7.4, 7.5, 7.7, 8.4, 9.1, 9.2 and 9.4. The changed BGG, supplier-numbering, coadmissibility and sign passages were checked afresh. R01–R04 replace the earlier inadequate treatment of §7.2.

**Principles and shape.** This is an extension of PadicFamilies with its stopping point stated, not a replacement. The main library ownership boundaries are explicit; the exceptions requiring repair are above. No algorithm, copied source exposition, sorry'd data, set_option, route-specific good-prime replacement of an advertised all-prime theorem, or dependency cycle was found. The Hilbert p>2 split hypothesis is confined to Layers 4–6; Layer 9 includes p=2. Nine mathematical layers have Examples and Dependencies; 62 targets have individual Needs and locators; the 63 Checks blocks include conventions. Definitions have API lists and at least three Checks, though the localization checks need the corrections above. No process residue, PR numbers, HTML anchors, machine paths, LaTeX delimiters or lemma declarations occur in the package's roadmap/Lean text. The layers group mathematical constructions and comparisons rather than reproduce a source's chapter headings; the continuation, comparison and Sen/classicality order is forced by the displayed dependencies. Compared the shape with the main-branch PadicMeasuresIwasawaAlgebras and SchemeAndStackFoundations roadmaps.

**Mechanical dependency check.** Ran the prescribed gate with depcheck, movable and the supplied order/content arguments. Output:

```text
depcheck: 234 roadmaps, 2130 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This does not detect the semantic defects R04–R06. Every Needs line was also read. No forbidden supplier is cited. The tool's sole unresolved lead, HigherHidaAndColemanTheory §9.6, resolves in packages/HigherHidaAndColemanTheory/README.md; it is not a nonexistent-roadmap finding.

**Elaboration, signatures and padding.** Ran the prescribed `lake env lean <absolute Suggested.lean>` from the pinned content checkout: exit 0, no output, no warnings. The file has one `import Mathlib`, one module docstring, the required namespace and zero definitions/theorems/examples. There are zero sorried declarations to probe with simp/rfl/infer_instance/exact and zero declarations for a `#check @name` scratch pass. No TauCeti object build was needed. No Lean binder vanished, and no placeholder, weakened headline or padding declaration was introduced. README backticks that denote mathematical notation are not claimed declarations; the actual pinned names resolve below. There is no unresolved backticked declaration attributed to this roadmap.

**Headline coverage at the pins.** Every summary headline, including intermediate deep comparisons, is named in Suggested.lean's module docstring with its missing carriers:

| Headline | README | Pin limitation recorded in the docstring |
| --- | --- | --- |
| PEL classicality in every dimension | 2.8–2.9 | PEL Iwahori Shimura varieties, analytic forms and their correspondences |
| Spherical ordinary amplitude and localized Klingen Euler characteristic | 3.3, 3.5 | Integral Siegel threefold, coherent coefficients and Klingen complex |
| Hilbert derived control | 4.7 | Hilbert–Siegel models, partial Igusa towers and coefficient complexes |
| Weight-two doubling | 5.8 | Those moduli and normalized geometric operators |
| One-place rational comparison | 6.7 | The actual multiplicative-locus and analytic complexes |
| Higher Eichler–Shimura and four-piece filtration | 7.5, 7.8 | Completed Shimura cohomology, derived analytic vectors and localization |
| Sen–Cousin comparison and de Rham classicality | 8.4, 8.6 | Arithmetic Sen on these completed objects and supported Coleman groups |
| Four projective modules, fibres, duality and tame/central descent | 9.2–9.7 | Universal supported Siegel Iwasawa complexes |

Object searches of both pinned libraries did not find these carriers. Generic derived categories, eigenvectors, Verma modules and projective modules do not make their geometric headline statements statable with a few simple definitions. Generic endomorphism identities in §5.6 are appropriately absent. I did not use the previous review's overly broad assertion that no file mentions overconvergence; existing analytic/dagger objects do not supply these Shimura carriers.

**Pinned declarations opened.** These are paths within the respective pinned library repositories; the lines are the declarations, not search-engine approximations.

| Declaration | File and line | Actual content and limits |
| --- | --- | --- |
| Module.End | Mathlib/Algebra/Module/LinearMap/End.lean:33 | M→ₗ[R]M; no finite-dimensional or compactness condition |
| LinearMap.prod, LinearMap.coprod | Mathlib/LinearAlgebra/Prod.lean:95, :199 | Product/paired linear maps, suitable for the companion matrix |
| Module.End.genEigenspace | Mathlib/LinearAlgebra/Eigenspace/Basic.lean:72 | Generalized kernels; no analytic slope finiteness built in |
| Polynomial.aeval | Mathlib/Algebra/Polynomial/AlgebraMap.lean:259 | Polynomial evaluation in an algebra, not a continuation theorem |
| Module.Projective | Mathlib/Algebra/Module/Projective.lean:71 | Projectivity by splitting; finite generation is additional |
| DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87 | Generic derived carrier, no Shimura coefficient construction |
| LinearMap.eventually_isCompl_ker_pow_range_pow | Mathlib/RingTheory/Artinian/Module.lean:307 | Both Artinian (section scope) and Noetherian (signature); not a derived ordinary projector |
| TauCeti.VermaModule | TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195 | U/vermaIdeal; characteristic zero, finite dimension, nondegenerate Killing form, splitting Cartan and root base. Does not itself cover a reductive centre or analytic completion |

**Seeded source verification.** All fifteen requested targets were opened at their locators, including hypotheses and relevant proofs. BPS uses HAL printed pages (one less than PDF pages); P20 the specified 113-page author version; BCGP21 arXiv v3; BCGP25 v1. No publication pagination was silently substituted.

| Target | Source, locator, extraction lines | Result |
| --- | --- | --- |
| 1.3 degree monotonicity | BPS Propositions 3.1.2–3.1.3, pp. 15–16, lines 691–715 | Generic-isomorphism inequality and BT₁/integrality rigidity agree |
| 2.2 first extension | BPS Proposition 4.2.1 and Remark 4.2.2, p. 19, lines 867–874 | Nonzero eigenvalues suffice; no small-slope assumption inserted |
| 2.7 all-wall continuation | BPS Proposition 4.1.2, p. 18, lines 790–791; Propositions 4.5.7–4.5.8, p. 29, lines 1239–1271 | Bounded completion/gluing and precision loss checked; closed boxes avoid the half-open compactness problem |
| 3.1 spherical operator | P20 §7, pp. 37–40, lines 1660–1860; Lemma 7.1.1 at line 1721, §7.2 divisibility at line 1785 | p^(3−r), T₁ condition k+r≥2 and T₂ condition r≥1 checked; non-finite-flat correspondence retained |
| 3.4 away-p action | P20 Proposition 15.1.1, p. 106, lines 4850–4863 | Raw factors ℓ^(−3), ℓ^(−6), central invertibility and family action agree |
| 3.5 Euler characteristic | P20 Theorem 15.2.1, p. 107, lines 4867–4888; §15.2.5, p. 109, line 5001 | Absolute residual irreducibility, perfect-complex virtual rank and componentwise witness retained; not torsion |
| 4.5 family complex | BCGP21 Theorem 4.6.1, pp. 105–106, lines 5131–5164 | Full derived fibre, ordinary product and [0,|I|] amplitude agree |
| 4.6 trace and Hasse resolution | BCGP21 Proposition 4.6.9, p. 109, lines 5414–5446; Lemmas 4.6.16–4.6.17, pp. 112–113, line 5483 onward; Proposition 4.6.19, pp. 113–114, lines 5564–5580 | Cover and trace factors checked; one-exponent-at-a-time correction avoids the displayed source recursion. The empty auxiliary set is treated separately as identity by the Check |
| 5.5 quadratic relation | BCGP21 Lemma 5.8.1, p. 133, lines 6430–6434 | Ordinary-locus identity U_Iw Z=U₂ and U_Kli=U_Iw+Z agree |
| 5.8 doubling | BCGP21 Theorem 5.8.6, p. 135, lines 6531–6545; companion at line 6443 | Weight two, nonzero U₂ eigenvalue and irreducible residual representation retained |
| 6.3 compact mixed U | BCGP21 §6.3, pp. 147–152, lines 7188–7346; Lemma 6.3.14, p. 152 | Kernel types and p^(−3)/p^(−6) factors agree; Iwahori U₂ alone insufficient; compactness uses radius improvement |
| 7.5 higher Eichler–Shimura | BCGP25 Theorem 4.7.2, pp. 99–100, lines 4426–4492 | E₁ indexing, derived coinvariants and non-Liouville hypothesis agree; R01 corrects the Sen coefficient and R04 supplies the missing full functor |
| 8.3 singular localization | BCGP25 §3.6.4, p. 63, lines 2877–2902; Theorem 3.6.9, p. 64, lines 2914–2921; Proposition 3.6.15, pp. 66–67, lines 3013–3048 | η=(0,−1;1), μ₀=−1−w/2, H¹ extension and nonzero scalar verified. Ambient overlap injectivity fails; package correctly demands a constrained-fibre argument |
| 8.5 balanced eigenspaces | BCGP25 Lemma 4.12.3 and Theorem 4.12.4, p. 113, lines 5050–5109 | Zariski alternatives, tensor multiplicity and separate four-piece balance retained |
| 9.6 tame projectivity | BCGP25 Theorem 7.3.1(5), p. 164, lines 7519–7527; proof and Lemma 7.3.2, p. 165, lines 7540–7565 | Sylow criterion and prime-to-p boundary stabilizers allow p-divisible deck groups |

Previously unread items were also settled: P20 §7.2 above; BCGP21 Proposition 3.8.3 through Lemma 3.8.5, lines 2789–2814 (the asserted natural augmentation splitting is false in characteristic p); η and μ₀ above; and the AIP15 reference underlying the repaired §6.4. HodgeTateAndCanonicalSubgroups §§5.1 and 5.8 were read beyond their headings: their Hilbert chart/flag inputs do not state the mixed Hilbert–Siegel partial tower requested here. SiegelModularForms' scope and relevant Klingen objects concern classical Siegel forms/parabolics, not these family complexes. The five original works are recorded in the manifest; BP26 enters as supplier background. AIP15 was fetched legally through the prescribed add-only service, under its existing/new unique work key, and read in v1 numbering.

**Adversarial values.** The following compact table covers this round's sample, headlines, all finding targets, repairs and previously unsampled statements. Algebraic models test the actual conventions/implications; they do not purport to prove geometric comparison theorems. The earlier computed rows for the remaining unchanged targets were reused, with F01's erroneous row explicitly discarded.

| Statement | Instances | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Shift and valuation conventions | E[0], shift [1]; p=3, eigenvalue 9, factor 3^(−3) | H^(−1)(E[1])=E, H⁰=0; 9/27=1/3 and valuation 2−3=−1 | Agree |
| 1.3 degree and equality | μ_p, constant Z/p over Z_p[ζ_p]; p=2,3 | Degrees 1 and 0; generic isomorphism 0→1 is strict, identity 1→1 is equality; 1/(p+1)=1/3,1/4 is nonintegral, so equality is excluded | Agree; non-isomorphic generic map is not mistaken for equality |
| 2.2 extension | α=3, Uf=3f; α=0 | 3^(−N−1)U^(N+1)f=3^(−N)U^Nf; for α=0 reciprocal does not exist | Agree, finite slope essential |
| 2.3 bad filtration | Three complements, one bad; two coordinates over a curve | N=1: membership in V₀,V₁ but not V₂; dimensions dim B₂=1, dim X²=2 | Agree; product map not étale |
| 2.7 gluing | Bound M=1, contraction q=1/3; precision A=4 | Error at N=4 is ≤1/81=3^(−4), tends to 0; two compatible limits differ by ≤3^(−N) for every N, hence 0 | Agree; fixed precision alone would allow difference 3⁴ |
| 2.8–2.9 classicality | Modular k=4; Siegel (6,6),(6,3) | Modular s<3; Siegel s<3 and s<0 respectively. Nonnegative slopes make the latter set empty. For a compact curve boundary=∅; modular curve has cusp condition | Agree, dimension-one case retained |
| 3.1 integral T | p=2, r=2,3; isotropic-line count | Scalar 2,1; p(1+p+p²+p³)=2·15=30. T₁ needs k+r≥2; T₂ requires r≥1 | Agree, normalization fixed |
| 3.3 spherical amplitude | r=2 versus r=3 | r=2 promises H⁰ iso/H¹ injection, not all degrees; r≥3 promises quasi-isomorphism. A two-term model E→0 has H¹=0; 0→E has H¹=E | Endpoints retained; no unjustified equality at r=2 |
| 3.4 spin action | ℓ=2; formal q=1, (T₀,T₁,T₂)=(1,4,4) | Factors 1/8,1/64; Q=1−4X+6X²−4X³+X⁴=(1−X)⁴ | Agrees with SR.4.5; q=1 is a polynomial test, not a residue field |
| 3.5 Euler characteristic | Λ→Λ with zero differential; p=5; k=0,5 | χ=1−1=0, both cohomology ranks 1; four finite-character components; λ₁=−1,−6 | Zero rank does not imply torsion; F04 repaired |
| 4.1 partial tower | d=2, |I|=0,1,2 | Torus ranks 4,3,2 from |I|+2|Iᶜ|; p-rank-one point with nonmultiplicative distinguished subgroup is excluded | Agrees with selected, not full inverse-image locus |
| 4.2 descent | k=F₃, Δ=C₃, norm N=1+g+g² | aug(N)=3=0; N≠0 and N∈I. Natural map k⊕I→k[Δ] has kernel (1,−N), rank 2 rather than 3 | Package's prime-to-p averaging restriction sound; source splitting proof fails |
| 4.5 derived fibre | Λ=Z_p[[T]], complex [Λ→ᵀΛ], T=0 | Derived fibre H⁰=H¹=Z_p; H⁰ before base change is ker T=0, whose ordinary fibre is 0 | Agree, derived tensor indispensable |
| 4.6 trace and dévissage | p=3, one/two auxiliary places; x²,y² | Cover degrees 4,16; trace factors 3,9. Quotient length 4 versus erroneous 1+1=2; iterating individual exponents gives 2+2=4 | Corrected recursion sound |
| 4.7 control | I=∅ and |I|=1 | Amplitudes [0,0] and [0,1]; real quadratic mixed torus has 3 variables | Matches the actual theorem, no arbitrary-I quasi-isomorphism claimed |
| 5.5 relation | U_Iw=2, Z=3 | U_Kli=5, U₂=6; U_Iw Z=6 and 2²−5·2+6=0 | Agree |
| 5.8 doubling equivariance | Same eigenline model, f=g=1 | Δ(f,g)=1+3=4; U_IwΔ=8. C(1,1)=(11,−1), ΔC=11−3=8 | Agree; injectivity separately uses the geometric non-Eisenstein theorem |
| 6.3 compactness | p=3, monomials z^n with radius contraction; identity negative control | U z^n=3^n z^n gives tail norm ≤3^(−N); identity gives tail norm 1. Mixed trace 3^(−3)·3^(−3)=3^(−6) | Radius improvement, not a bare operator name, gives compactness |
| 6.4 BGG identity and R05 | θe=f, α=1, p=3,m=4; m=3; f(z)=z²,m=2 | β=1/81, slope −4; target twist restores eigenvalue 1. Reflected lower bounds −3+4=1 and −3+3=0. θ²f(3z)=18=9θ²f(z). Wrong supplier twist gives −7 at m=4 | Local mathematics sound; supplier contract needs correction |
| 6.5 polynomial inverse | P=(X+1)², U=−1 | Q=−X−2; UQ(U)=1. Omitting linear coefficient gives R(−1)=0 instead of 1 | Source correction confirmed |
| 6.7 one-place comparison | Kernel/cokernel dimension defects a,b≥0 | χ(source)−χ(target)=−a−b; equality 0 forces a=b=0. With three places four cohomological degrees need not have this implication | One-place restriction is substantive |
| 7.1 completion and F03 | 𝔤=0; 𝔤=E·x; zero module | U(0)_r=E, limit E; norm of x^n is r^n; compatible zero stages limit to 0 | Particular completion retained, general category imported |
| 7.2 homology, R01 | GL₂ standard representation, n=Ex, xe₂=e₁; diag(2,1) | H₀=Ee₂, eigenvalue 1; H⁰=Ee₁, eigenvalue 2. H₁=n⊗Ee₁ has eigenvalue 4; H¹=Ee₂⊗n* has eigenvalue 1/2 | False identification; retain Levi weights |
| 7.2 character, R02 | GL₂, λ=0, M=det | λ-algebraic=yes; central value on M=2, on Loc=−2; claimed λ=0 factors have value 0 | Missing fixed-character hypothesis |
| 7.2 derived object, R03 | GL₂, trivial M, λ=0 | H₀(n,E)=E and H₁(n,E)=n each dimension 1; H¹ of a degree-zero sheaf is 0 | Must be a derived complex |
| 7.2/7.5 coefficient domain, R04 | SL₂ Verma M(0)→E; scalar operator U=0 | Kernel M(−2) is infinite-dimensional, quotient dimension 1; finite-slope subspace of E with U=0 has dimension 0 versus full dimension 1 | Full BGG functor and triangle missing |
| 7.4 comparison/Sen | M=0; Tate twist Q_p(1) | RHom(0,−)=0 and RΓ(VB_red(Loc(0)))=0; arithmetic Sen scalar +1, Hodge–Tate weight −1 | Normalization agrees; derived correction R03 needed |
| 7.5 spectral sequence | Two Bruhat lengths; total degree 1 | (p,q)=(0,1),(1,0) both give p+q=1; E⊗^L_U(n)E has H⁰=E,H^(−1)=n | Correct derived indexing; R01/R04 prevent replacing its coefficients |
| 7.7 boundary | Reducible roots 1,2,3,6 | det(1−ρX)=(1−X)(1−2X)(1−3X)(1−6X), so a boundary-type system is reducible, outside the residual hypothesis | No vanishing before localization inferred |
| 7.8 filtration | λ=(1,1;2) and (1,1;−2) | Descending-degree scalars (−2,−2,−3,−3), (0,0,−1,−1); sums −10 and −2 =−6−2w | Agree |
| 8.3 singular comparison | w=2; x∂+1 and (x+1)∂+1 | μ₀=−2; on x^n first eigenvalue n+1≠0. On 1/(1+x), second gives −1/(1+x)+1/(1+x)=0 | Theorem's extension/twist verified; proof needs constrained fibre |
| 8.4 Sen–Cousin | N=[[0,1],[0,0]]; c=3 | ker N=Ee₁, image N=Ee₁; ker(3N), image(3N) identical. For c=0 kernel dimension jumps 1→2 | Nonzero scalar essential |
| 8.5 balance | E[t]/t² with sub tE; four graded bounds n=1 | t-torsion gives E→E→E with last map 0; total 4 and four bounds ≤1 force dimensions (1,1,1,1), not (2,0,1,1) | Independent balance hypothesis correct |
| 8.6 classicality | w=2, semisimple finite block versus Jordan | Θ=diag(−2,−2,−3,−3): N_(−2)=0. A 2×2 Jordan block at −2 gives N rank 1. With balance n=1, classical and ordinary degree-zero dimensions are both 1 | Implication uses finite-dimensional semisimple block and separate stability contract |
| 9.1 inversion | p=7, order-three character χ(t)=ζ₃ | (ev_χ∘ι)([t])=ζ₃^(−1)=ζ₃²≠ζ₃; ι²([t])=[t] | Character inversion is detected, including finite part |
| 9.2 concentration | Length 1, [E→⁰E]; length 0 | First model has H⁰=H¹=E despite amplitude [0,1]; removing H⁰ leaves E[−1]. Length 0 amplitude [0,0] leaves only H⁰ | Extra supported vanishing is needed and named |
| 9.3–9.4 fibres | ν=(0,−2), four chambers | κ=(5,3),(5,1),(2,−2),(0,−2); extreme degrees 0,1,2,3. Twist by E(−λ) multiplies torus character χ by χ^(−1)=1 | Classical/Coleman conventions agree where both apply |
| 9.5 duality | κ=(5,3), complementary lengths | κ∨=(3−3,3−5)=(0,−2); 0+3=1+2=3 | Shift and transpose convention agree |
| 9.6 tame projectivity | k=F₃, Δ=C₃, regular module | Coinvariants dimension 1; invariants kN dimension 1; norm sends [1] to N≠0. Inclusion followed by augmentation sends N to 3=0 | Projective-module norm comparison works without averaging |
| 9.7 central character | p=2,r=7; p=3,r=7,11 | (r−1)/2=3 is odd at r=7; 7≡1 mod3 excluded, 11≡2 mod3 accepted and quotient order5 is prime to3 | By-cases prime condition correct |
| R06 relative vanishing | Subcanonical n=0; canonical n=0 | Supplier gives all Rⁱπ_*E=0 for i>0 in the first case; no zero value asserted in the second. For π=id both evaluate to 0 | Import existing theorem with its formal criterion |
| R07 numbering | Consumer links E6/four-pieces, S7/sen-cousin, F8/central-character | Current package matches=0; proposed destinations 7.8,8.4,9.7 each match=1 | Add former-numbering map |

**Supplier resolution.** Resolved every cited section at main or the given open head, not merely by name search. The following list records the resolved objects; the semantic exceptions are R04–R06. Paths for open heads are TauCetiRoadmap/<Name>/README.md, with PR numbers supplied only here as review witnesses.

- HigherHidaAndColemanTheory, local package: §§1.1–1.2, 2.3, 3.7, 4.5–4.6, 4.8–4.9, 5.1, 5.5–5.6, 5.8, 6.1–6.3, 6.6, 8.3, 8.5, 9.1, 9.4–9.8. Definitions and bounds read, including the opposite support amplitudes and the C₂ weights. R04 is a domain mismatch, not a missing number.
- PadicFamilies #1019: §§0a.22, 0a.25, 2a.15, 2a.16, ordinary projectors and compact-complex spectral charts.
- PELModuli #966: §§M0.21, M0.27, M1.13, M2.8–M2.10, M4.5–M4.6, M5.1, M5.4. General moduli inputs exist; its Hilbert datum does not itself state the requested Hilbert–Siegel mixed-level extension.
- HodgeTateAndCanonicalSubgroups #1084: §§0.6–0.8, 0.14–0.16, 0.28, 3.6, 5.1, 5.5, 5.8. Generic-isomorphism degree, canonical subgroup and frame inputs read with their own prime and radius conditions; the declared mixed Hilbert–Siegel extensions are not silently assumed already present.
- AdicSpacesPartIII on main: §§R2.10, R3.4, R3.6, R3.7, section domains, quasi-Stein, proper mapping/compact restrictions and GAGA. R2.10 is not the bounded-gluing theorem itself.
- ShimuraCompactifications #1053: §§4.1, 4.3, 4.10, 6.12, 6.16–6.17, 7.16, 7.19–7.22, 7.25–7.26. All replacements resolve; no letter-number labels needed. General relative vanishing belongs to R06's other owner.
- AutomorphicBundles #1069: §§3.3, 5.3–5.4, 11.16, 12.1, 12.11, 12.15. Highest weights, extension/support conventions, finite-flat traces and raw operators resolve. Non-finite-flat trace is not obtained by abusing the finite-flat trace contract.
- SchemeAndStackFoundations on main: §§2.19–2.20 provide upper shriek/duality; the extra lci/base-change/codimension contract is distinct. AlgebraicModuliForArithmeticGeometry §7.5 has related fundamental-class constructions for its embeddable dimensional setting, not the entire declared general contract here.
- SmoothRepresentationsOfLocalGroups #1688: §§SR.1.4 and SR.4.5, positive Hecke algebra and the spin polynomial. The coefficient q(T₁+(q²+1)T₀) was opened and recomputed above.
- IntegralHeckeAndGaloisDeterminants #1689: §§2.3, 3a.2, operator localization and spin/multiplier conventions.
- AutomorphicFormsOnReductiveGroups #1037: §§6.4–6.6, coherent multiplicities, limits and large weights. The singular equality and weight-two stability are additional declared contracts, not consequences of the headings alone.
- EndoscopicTransferAndUnitaryTraceComparison #999: §11.1, general-type GSp₄/GL₄ transfer.
- CompletedCohomologyPartII #1035: §§2.2, 6.7, 7.1, 7.8, F.4. Section 7.8 leaves the GSp₄ boundary calculation to its arithmetic consumer, justifying this package's §7.7 ownership.
- PerfectoidShimuraVarieties #1085: §§3.6, 6.3, Levi torsor and toroidal Hodge–Tate period map. It does not yet give the full solid derived functor; gap:solid-vb-sen is legitimate but needs R03's precise category.
- PadicHodgeTheory #1062: §4.4, arithmetic Sen and Hodge–Tate criterion. De Rham implies this criterion; the proof uses that direction on the finite eigenspace.
- ArithmeticGaloisRepresentations #856: §§5.11, 7.6, annihilating polynomials and the Zariski-image multiplicity argument.
- AutomorphicGaloisRepresentations #1007: §1.1 gives the existing GL₂ relation, not the GSp₄ completed relation; the latter is declared as a gap.
- PadicMeasuresIwasawaAlgebras on main: §§1.1, 1.7, full group algebras and character evaluation, with finite torsion not averaged away.
- DeformationAndDerivedPatchingAlgebra #1034: §§5.9, 7.1, 7.3, Sylow group-ring projectivity and derived residual amplitude detection.
- LieHighestWeight on main: Layer 3, enveloping/Verma/highest-weight objects, not the analytic BGG realization.
- LocallyAnalyticDistributions #854: §§0.0, 0.3, 4.16, locally analytic and compact-operator inputs; no arbitrary category-O Coleman functor hidden there.
- PadicLocalLanglandsForGL2Qp #1312: §0.1, Fréchet–Stein stages and coadmissibility (F03).
- FiniteFlatGroupsAndIntegralPadicHodgeTheory #879: §R07.P7.2, cyclotomic Sen operator 1.

**Gaps and ownership.** All fourteen declared slugs match the plan and README, with named suppliers; none has supplier=none. Their groupings specify coherent mathematical constructions, not unbounded requests. The relative-vanishing component is not minimal (R06), and the derived solid functor needs R03's category correction. The remaining requested complements/isogenies, mixed Hilbert towers, bounded gluing, mixed cube, tame stabilizers, lci extension properties, two distinct multiplicity comparisons and GSp₄ Eichler–Shimura input are stated contracts and are not reported as missing merely because suppliers have not implemented them. Acceptance is not being claimed conditional on gaps because actual findings remain.

Used the roadmap grep/show tools by object for Kassaei/BPS continuation, Klingen families, coadmissibility, completed enveloping algebras, localization/HCS, higher Coleman coefficients and four-piece/four-module theory. Read the closest open scopes: AutomorphicBundlesPartII #1823, GSp4NonregularModularityLifting #1817, AlgebraicModularFormsAndSerreWeightsPartII #1822, OverconvergentAutomorphicForms #1422 and PerfectoidShimuraVarieties #1085; also SiegelModularForms. Coefficient/derived and vanishing ownership produced R04 and R06. Classical Klingen parabolics/Eisenstein constructions are different from the Klingen complexes here. LocallyAnalyticDistributionsPartII is later in the merge order; it cannot supply this package's completed enveloping algebra. The general completed BGG realization is properly owned here, extending the algebraic supplier, rather than imported from that later work.

The cached overlaps report lists no conflicting head, dropped supplier id or revision-only supplier id. I checked its closest matches rather than treating this as a clean bill of ownership. The explicit consumer citation in #1817 exposes R07, which the package-stage overlap report did not list. No other owner of the BPS continuation or the full BGG-coefficient Coleman functors was found in the provided main/open-head/package searches. No fully qualified Lean name collides: this package declares none.

## Not verifiable

- No selected or author-flagged source text was inaccessible. The old unread P20 divisibility, BCGP21 deck-splitting proof, BCGP25 η/μ₀ definition and AIP reference have now been read. There is no new missing-source request.
- BCGP25 Proposition 3.6.15's overlap nonvanishing is not established by the displayed unrestricted-germ injectivity argument. The source's actual constrained fibre still needs the argument already demanded by §8.3. The explicit ambient kernel proves the stated proof issue, not a counterexample to Theorem 3.6.9.
- Declared supplier gaps are future contracts, not completed proofs; this review checks their precision, ownership and matching declarations. R03 and R06 identify the changes needed in those contracts.
- Ownership checking used the supplied board index and the indexed main/open-head files accessible through the prescribed tools. It makes no claim about unavailable or unlisted heads, and no additional pull requests were sought independently.

## Source issues

- **Error** in BPS at Lemma 4.4.3, HAL printed page 24: the source calls the joint quotient map to X^k finite étale; it should be replaced by the individual coordinate maps, since at k=2 dimensions are 1 and 2; affects the proof.
- **Gap** in BPS at Lemma 4.4.5, HAL printed page 25: the source multiplies a degree lower bound by a terminal weight without its sign hypothesis; it should require nonnegative terminal minimum, automatically positive in the later strict-slope region; affects the proof.
- **Misprint** in P20 at Proposition 13.3.3.1, printed page 90: the source places p^(−k−1)U on the reflected BGG term; it should place p^(k+1)U there, agreeing with AIP15 Proposition 7.2.3 and the stated slope thresholds; affects a stated result.
- **Misprint** in BCGP21 at §6.4, printed page 154: the source's displayed BGG composition raises standard slopes; it should lower them, θU_s=p^mU_tθ, agreeing with the immediately following positive-twist sentence and AIP15; affects a stated result.
- **Misprint** in P20 at Corollary 14.6.2, printed page 99: the source's continuation polynomial omits its linear coefficient; it should retain a₁X, giving −(P−P(0))/P(0) before division by X; affects the proof.
- **Misprint** in P20 at Proposition 15.2.4.1, printed page 109: the source requires positive first singular coordinate; it should require a negative coordinate, since k=−λ₁−1≥0; affects a stated result.
- **Error** in BCGP21 at Lemma 3.8.5, printed page 58: the source asserts the natural augmentation-ideal splitting map is an isomorphism étale-locally for every finite group; it should require invertible group order for that map, whose characteristic-p regular-module kernel contains (1,−N); affects the proof.
- **Gap** in BCGP21 at Proposition 4.6.19, printed pages 113–114: the source uses a simultaneous-powers short exact sequence for several Hasse parameters; it should vary one exponent at a time, since at two parameters and exponent two the proposed lengths are four versus two; affects the proof.
- **Gap** in BCGP21 at Theorem 6.6.4, printed page 167: the source applies restriction-map dimension inequalities to the full analytic groups; it should compare the actual multiplicative-locus restriction defects, whose nonnegative sum vanishes by the Euler identity; affects the proof.
- **Misprint** in BCGP25 at Remark 4.10.7, printed page 107: the source gives the degree-zero term weight (1,1;−w); it should have weight (2,2;−w), matching Serre duality and §4.10.8; affects a stated result.
- **Gap** in BCGP25 at Proposition 3.6.15, printed pages 66–67: the source infers overlap injectivity from (x+1)∂_x+1 on germs; it should exclude 1/(1+x) from the constrained fibre or establish nonvanishing otherwise; affects the proof.
- **Misprint** in BCGP25 at the choice preceding Lemma 7.3.8, printed page 167: the source joins odd-prime and p=2 congruences as simultaneous conditions; it should separate the cases, allowing r=7 when p=2; affects nothing.
