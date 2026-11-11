<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12987#issuecomment-6791594692 -->
Review (codex) of 5764307

Verdict: needs_changes

1. **F01** (P2) Geometric continuation is asserted with analytic coefficients

   **Location:** packages/PadicFamiliesPartII/README.md:969, §6.5: “restriction of classical coherent cohomology to `H^†` is a quasi-isomorphism”. The definition at line 911 makes H^† the analytic-coefficient object. The same ambiguity occurs in the last Check of §6.7, line 1007.

   **Claim:** The geometric continuation bounds alone give a quasi-isomorphism to the analytic family complex, in every degree.

   **Witness:** BCGP21 line 7532 retains ω^κ(−D). At (k,r)=(0,2), the geometric bound is 1; the analytic all-degree bound is min(1,−2)=−2. Slope 0 satisfies only the former.

   The distinction is explicit in the cited supplier, packages/HigherHidaAndColemanTheory/README.md:1412, §9.7. Its geometric restriction keeps Ω(k,r); the combined analytic comparison has the additional BGG bound. Its negative-control Check at line 1420 explicitly excludes this reading. BCGP21 lines 7373–7421 also distinguish these coefficient objects and give the ordinary H⁰ isomorphism/H¹ injection, with H¹ isomorphism under the additional weight-gap condition. The numeric test separates the proved ranges; it is not offered as an automorphic eigenclass counterexample.

   **Exact repair:** Introduce a distinct geometric dagger complex, for example G^†_κ = RΓ(X^{mult,†},ω^κ(−D)), with its domain and restriction map. State §6.5 with target G^†_κ and retain its full geometric slope range. Keep H^† for §6.1's analytic coefficients. State the map G^†_κ→H^† and use §6.4 with its actual degree-dependent bounds whenever composing it with geometric continuation. In §6.6 distinguish the two Euler characteristics and retain the comparison inequalities; in §6.7 keep the explicitly written geometric source and replace the ambiguous H^† in its last Check by G^†_κ. Update the API and Needs clauses accordingly.

   **Repair tested:** At F=ℚ, I={p}, weight (2,2), geometric continuation still includes slope 0 because 0<1. The direct BGG argument gives H⁰ isomorphism and H¹ injection, not an all-degree isomorphism at that weight. The later ordinary Euler-characteristic argument remains available to prove the stronger ordinary result. At k=3,r=2, the combined all-degree bound is min(4,1)=1 and does include slope 0. Add these two cases as discriminating Checks.

2. **F02** (P2) The analytic family's admissible parameters are unspecified

   **Location:** packages/PadicFamiliesPartII/README.md:911 and :918, §6.1: “For an affinoid `Spa(A, A⁺)` … and radii `(n, ε, w)`” and “Shrinking radii gives compatible transition maps.”

   **Claim:** The paragraph defines the coefficient sheaf, its complex and its filtered colimit, but neither the parameter set nor the character's required analyticity on the torsor group is specified. No precise definition of “admissible radii” elsewhere in this package supplies them. The generic analytic-family supplier is not a definition of this mixed Hilbert–Siegel parameter set.

   **Witness:** BCGP21 lines 6863–6889 require w≤ε≤n−1/(p−1); lines 6928–6930 require extension to T_{w′}. At p=3,n=1, ε=3/4 exceeds the allowed 1/2.

   The third Check only says that two unnamed transition paths agree; it cannot distinguish the direction of the indexing maps. BCGP21 lines 7151–7152 give transitions when the valuation parameters n, ε and w increase. Calling this “shrinking radii” without defining geometric radii versus valuation parameters leaves the colimit undetermined. The one-place supplier states its corresponding inequalities and analytic-character hypothesis explicitly in packages/HigherHidaAndColemanTheory/README.md:1391.

   **Exact repair:** Define the permitted tuples, place by place: integral levels n_v and rational parameters 0≤w′_v≤w_v≤ε_v≤n_v−1/(p−1), using a strictly positive cofinal subsystem if desired. Require the input character to extend to the indicated T_{w′}; explain independence of the auxiliary w′. State the coefficient base/formal model used for descent, or explicitly import the rigid version after the required coefficient extension. Give the base space and source/target of each transition, with n′≥n, ε′≥ε, w′≥w for the transition parameters, using a different letter from the auxiliary torsor parameter. Define H^† over that directed system. Preserve the determinant-square and boundary twists already present.

   **Repair tested:** At p=3,n=1 the tuple (ε,w,w_aux)=(1/4,1/8,1/16) is allowed for the trivial character; (3/4,1/8,1/16) is excluded. A character which does not extend to the chosen torsor group cannot be descended there. Increasing to (n,ε,w)=(2,1/2,1/4), with an admissible analytic-character radius, gives a map from the first complex to the second. Add these parameter, character and direction tests instead of leaving the colimit's domain implicit.

3. **F03** (P1) The ordinary automorphic comparison lacks owned inputs

   **Location:** packages/PadicFamiliesPartII/README.md:985–987, §6.6: “with ordinarity of the local factors at I from the unit product and §4.3”.

   **Claim:** Integrality in §4.3 turns the unit product of the two Klingen Satake parameters into individual units. The proof also uses the geometric automorphic computation of BCGP21 Theorem 3.10.1(2), while its named supplier is the archimedean classification.

   **Witness:** α=1/3, β=3 gives v₃(αβ)=0 but valuations −1,1. BCGP21 lines 7955–7971 require separate Katz–Mazur integrality. AutomorphicFormsOnReductiveGroups §6.6 explicitly separates geometric comparison from its classification.

   At a place in I, §4.3, line 622, supplies the integral U_{v,2} action, and supplies U_{v,1} only at Iwahori places in Iᶜ. It does not supply integrality of the individual Klingen roots. P20 Proposition 14.9.1 and its corollary, lines 4677–4737, use an additional lattice and codimension-two argument; BCGP21 Remark 6.6.3 identifies precisely the Hilbert extension needed here. The Q-only discussion in HigherHidaAndColemanTheory §9.8 does not state that extension. None of the 15 declared gaps requests it.

   The second missing link has an existing owner: AutomorphicBundlesPartII §8.8, TauCetiRoadmap/AutomorphicBundlesPartII/README.md:1556 at open pull request #1823, states the localized coherent/cuspidal comparison at large gaps, with its level, central-character and degree hypotheses. By contrast, TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:1071–1073, §6.6, distinguishes its local/Künneth classifications from the geometric comparison. Merely citing the paper does not assign the required input to a library target.

   **Exact repair:** Add a named Hilbert–Siegel Satake-integrality target, at least in the full witness-weight range used by §6.6: arbitrary totally real F with p split, the relevant spherical and mixed Klingen/Iwahori levels, non-Eisenstein localized cuspidal H⁰ and H¹, l_v=2 at I, and the specified large gaps elsewhere. State v_p(α_v),v_p(β_v)≥0 in the source's normalization and the lattice/codimension-two inputs proving it, citing BCGP21 Remark 6.6.3 and P20 §14.9. Import the Q case rather than rebuilding it; own the Hilbert extension here, or declare a precise earlier-supplier gap for it. Add this target to §6.6's Needs. Import AutomorphicBundlesPartII §8.8 for the geometric comparison, retaining its hypotheses, rather than attributing that comparison to AutomorphicFormsOnReductiveGroups §6.6 alone. Keep the general theorem; do not restrict it to extra integral-eigenvalue localizations as a shortcut.

   **Repair tested:** The missing law rejects (1/3,3). With a=v_p(α)≥0, b=v_p(β)≥0 and a+b=0, both a=b=0. This is the precise implication the proof needs. The geometric comparison is used only at the large witness weights and in degrees 0,1, as its supplier permits; local constancy then transports the Euler characteristic. Add the nonintegral unit-product example as a negative control. This is an unowned prerequisite finding, not a claim that the source's final comparison theorem is false.

4. **F04** (P2) Concentration omits extension of coefficients to O

   **Location:** packages/PadicFamiliesPartII/README.md:1332, §9.2: “the transported complex is quasi-isomorphic to `𝓜_w[−ℓ(w)]`”. The complex is defined at line 1313 before tensoring with O.

   **Claim:** Transport along the inversion involution alone identifies the imported ℤ_p-Iwasawa complex with the module after coefficient extension to an arbitrary finite DVR O/ℤ_p.

   **Witness:** BCGP25 lines 7480–7490 distinguish the ℤ_p complexes from H^ℓ⊗O. For O unramified quadratic and C=ℤ_p[0], H⁰(C) has ℤ_p-rank 1, whereas H⁰(C)⊗O has rank 2.

   HigherHidaAndColemanTheory §4.5, packages/HigherHidaAndColemanTheory/README.md:673, explicitly uses Λ₀=ℤ_p[[T(ℤ_p)]]. Inversion changes the character convention, not the coefficient ring. Thus the concentration statement needs a scalar extension even though projectivity and specialization of 𝓜_w are correctly stated over Λ=O[[T(ℤ_p)]].

   **Exact repair:** State `(M_w^• ⊗^L_{ℤ_p} O) ≃ 𝓜_w[−ℓ(w)]` in D(Λ), or equivalently extend scalars along Λ₀→Λ. Keep the definition of 𝓜_w and inversion convention. Adjust the first API bullet of §9.1 so that it says length-degree cohomology after this extension. Explain that finite O/ℤ_p is flat, so this scalar extension commutes with the cohomology used in the definition.

   **Repair tested:** For the quadratic O and C above, both sides now have ℤ_p-rank 2 and O-rank 1. For O=ℤ_p the formula reduces to the original concentration statement. This is a coefficient-type test, not a claim that an arbitrary one-term complex is one of the geometric Hida complexes.

5. **F05** (P3) The nonnegative-slope citation points to the wrong passage

   **Location:** packages/PadicFamiliesPartII/README.md:343, §2.1: “BPS §4.1, HAL p. 18”.

   **Claim:** This locator supports nonnegative eigenvalue slopes after the normalization of §1.2.

   **Witness:** BPS lines 768–771 give the normalization assertion in the introductory paragraph of §4, printed p. 17. Section 4.1 starts at line 776; p. 18 concerns bounded sections and finite étale maps.

   **Exact repair:** Cite “BPS §4, introductory paragraph before §4.1, HAL p. 17”. Keep Hypothesis 4.5.1, HAL p. 25, for the strict inequality itself. Distinguish the printed page 17 from extraction page marker 18.

   **Repair tested:** The corrected location contains the eigenvalues α_i and the normalization v(p)=1; the old p. 18 location does not. The numerical region remains unchanged: n=3,c=4,s=0 permits ε=1/8, giving −1/2, while c=3 gives 3/8 and is excluded.

Five findings: one P1, three P2 and one P3. The two findings from round 4 are repaired. The remaining problems are the distinction between geometric and analytic coefficients, the domain of the analytic construction, missing inputs to the ordinary comparison, coefficient extension in the concentration statement, and one source locator. No authored package file was changed.

## Verified sound

### Previous findings, checked first

| Previous finding | Repaired passage | Status and independent test |
| --- | --- | --- |
| Round 4 F01: integral trace domain and hypotheses | README:680 defines “A_κ = H⁰(𝔛^{I,=J1}, ω^κ(−D))”; :686 states “for every `n ≥ 1` and every `f ∈ A_κ`”; :690 separates “If `Jᶜ = ∅`”. | **Repaired.** Formal completions, flat complete section modules, typed pullback/trace, the normalized quotient correspondence, weight hypotheses and uniform C are present. BCGP21 lines 5283–5580, pp. 109–114, were reread. The comparison uses e(U)∘ι, not unprojected ι. Tests below distinguish characteristic-p from integral congruences, n=0 from n≥1, and an empty complement. |
| Round 4 F02: variance of VB⁰ | README:1063: “`HCS_{w,λ}` is exact and contravariant … `VB⁰` is exact and covariant … their composite is exact and contravariant”. | **Repaired.** BCGP25 lines 3431–3437 and 3579–3581 preserve arrows under VB⁰. The dual of x↦(x,0) is (a,b)↦a. A single reversal puts F(V[1]) in degree 1; two would put it in degree −1. |

Neither repair report item was marked not actionable. Searches through all congruences, empty minima, trace domains, occurrences of contravariant/VB, shifts and degree formulas found no recurrence of these two repaired patterns. The new §4.6 definitions, API, eight Checks, proof routes and changed Needs line were reviewed afresh; the changed §7.1b explanation and its applications to §§7.5–7.6 were also recomputed. The unrelated findings above do not reopen the repaired findings.

### Coverage, principles and shape

Read all 64 numbered subsections across nine layers, with scope, conventions, contracts, APIs, Checks, Needs, examples and dependencies. For unchanged mathematics, reliance on round 4 was restricted to its computed adversarial rows, which cover the numbered targets; its prose summaries were not treated as numerical evidence. The 15 newly seeded targets and all newly changed passages were independently checked. The compact table below covers this round's sample, headlines and finding targets rather than reproducing an entire per-target ledger.

The extension boundary with PadicFamilies and HigherHidaAndColemanTheory is explicit. No replanning, algorithmic target, route-specific substitute or unjustified exclusion of primes was found. The unramified PEL theorem, split odd-prime Hilbert setting and all-prime genus-two final modules have separate scopes. In particular p>2 in Layers 4–6 is not imposed on Layer 9. The order of the layers is mathematical: continuation uses degree dynamics; doubling uses mixed-level operators; ordinary comparison uses analytic families and control; completed-cohomology and singular comparisons use the coefficient functors. No source-chapter heading or unconstrained source-order sequence was found.

The shape was compared with TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md and TauCetiRoadmap/SchemeAndStackFoundations/README.md on main. Each layer has Examples and Dependencies; each numbered target has a Needs line and at least three Checks. There are 65 Checks blocks including conventions. Definitions retain prose APIs. A count does not certify that a definition is determined: R02 records the remaining failure to specify an analytic construction's domain. Source and dependency completeness are subject to R01, R03 and R05. No process narrative, machine paths, job identifiers, pull-request numbers, HTML anchors, computational algorithms or prohibited Lean options occur in the authored roadmap/Lean file. The former-numbering map is a citation-compatibility map, not a target catalogue.

### Seeded source verification

All six cited works have one manifest entry and a readable legal cached text. The version notes distinguish the BCGP21 arXiv v3 pagination, BCGP25 v1, the P20 author pagination, and the BPS HAL printed pages. No author-flagged unverified locator or missing text required a fetch; sources.toml was unchanged. Results below were read in the actual text. R01 and R02 are content/hypothesis problems, and R05 is a locator problem; the remaining sampled claims survived this source audit.

| Sampled target | Exact source text opened | Result of hypothesis/page/statement comparison |
| --- | --- | --- |
| 1.2 Normalized U operators | BPS §2.2, pp. 13–15, lines 622–673 | Morita rank, inverse frame map, coefficient pullback direction and exponents d_i a_i(a_i+1)/2 or d_i a_i b_i agree. Polarization transport remains part of the correspondence. |
| 2.1 Strict slope region | BPS §4 introduction, p. 17, lines 768–771; Hypothesis 4.5.1, p. 25, lines 1116–1137 | Nonzero eigenvalues, normalization and strict inequality agree; the nonnegative-slope locator needs R05. |
| 2.3 Bad-complement filtration | BPS §4.3, pp. 20–21, lines 886–920; Lemma 4.4.3, p. 24, lines 1060–1069 | Ordered distinct complements and the first finite étale projection are retained. The README does not repeat the source's erroneous finiteness assertion for the product quotient map. |
| 2.6 Kassaei path sums | BPS §4.5, pp. 27–29, lines 1170–1266 | Contraction, uniform norm bound, common-domain agreement and the fixed normalization loss in torsion precision agree. The shrinking accuracy is not treated as increasing accuracy. |
| 3.2 Rank-zero vanishing | P20 Proposition 7.4.2.2 and Lemma 7.4.2.6, pp. 49–50, lines 2262–2316 | Large k, r≥p²+p, uniformity in tame level, fundamental-class divisibility and nilpotence on thickenings retained. |
| 3.3 Special-fibre ordinary amplitude | P20 Lemma 8.2.1 and Proposition 8.2.1, pp. 52–54, lines 2402–2478 | k>p+1 for local finiteness, large k for perfectness, special-fibre [0,1], and r=2 endpoint versus r≥3 full comparison agree. Cuspidal relative vanishing is separately imported. |
| 5.3 Kodaira–Spencer and first boundary trace | BCGP21 Propositions 5.5.1–3, pp. 123–124, lines 5989–6057; Proposition 5.6.1, p. 125, lines 6081–6099; pp. 127–128, lines 6175–6225 | Prime-to-p compatibility is applied integrally before specialization. The Norm(x_w)³/p³ unit, dualizing trace, Frobenius pushforward and A^{p−1} target twist are correct. |
| 5.9 Two unit-root refinements | BCGP21 Remark 5.8.7, p. 135, lines 6546–6560 | Finite local Hecke algebra, distinct unit residue roots, unique lifted roots and generalized eigenspaces are retained. No semisimplicity of the whole Hecke block is asserted. |
| 6.1 Analytic family complex | BCGP21 §§6.1.6–6.1.9, pp. 142–143, lines 6863–6938; §6.3.4, p. 148, lines 7137–7155 | Weight shift and determinant/boundary factors agree. R02 supplies omitted admissibility, analytic-character and directed-system data. |
| 6.5 Multi-place continuation | BCGP21 Theorem 6.5.8 and Remark 6.5.9, p. 156, lines 7523–7540; §6.4, pp. 153–154, lines 7373–7421 | Thresholds and joint-block qualification agree; coefficient target does not: R01. |
| 6.7 One-place ordinary comparison | BCGP21 Propositions 6.6.1–2, pp. 164–166, lines 7883–7954; Remark 6.6.3 and Theorems 6.6.4–5, pp. 166–167, lines 7955–8008 | Geometric source, H⁰ injection/H¹ surjection, rational comparison and l_v≥4 at Iᶜ agree. The Euler proof needs the R01 distinction and the R03 input. |
| 8.3 Rank-one singular localization | BCGP25 §3.6, pp. 63–67, lines 2880–3055 | η=(0,−1;1), Levi-character condition, parity, localization degree and actual constrained-fibre nonvanishing retained. The README does not infer injectivity on all analytic germs from the overlap differential operator. |
| 9.3 Classical specialization | BCGP25 Theorem 7.3.1(2), pp. 163–164, lines 7494–7506; Remark 7.3.3, p. 165, lines 7566–7570 | G-dominance, κ dictionary, E(−λ), raw positive double coset and cusp/canonical distinction agree. |
| 9.4 Higher Coleman specialization | BCGP25 Theorem 7.3.1(3), p. 164, lines 7507–7515 | Only M-dominance of κ is imposed; ordinary T(ℤ_p)-invariants and support are retained. No general classical identification is asserted. |
| 9.6 Tame group-ring projectivity | BCGP25 Theorem 7.3.1(5), p. 164, and Lemma 7.3.2/proof, pp. 164–165, lines 7519–7565 | Normal neat levels, finite Δ, projectivity over Λ[Δ], and boundary stabilizers are retained. The theorem allows p dividing the deck-group order. |

### Computed adversarial table

The tests are separating calculations, not proofs of the geometric theorems. “Pass” refers to the displayed instance. Rows marked R refer to the requested repair; unmodified algebraic tests from round 4 are retained only where the computed values still apply. Standing hypotheses exclude arbitrary zero coefficient rings, equal-characteristic substitutes for ℤ_p, ramified PEL data in the unramified theorem, noncompact replacements for compact groups, and arbitrary complexes in place of the named geometric objects.

| Statement | Instances tried | Values on both sides / wrong model | Result; change |
| --- | --- | --- | --- |
| Conventions | C=ℤ[0], shift 1; p=3, eigenvalue 9; cyclotomic dual | H⁻¹(C[1])=ℤ and H⁰=0; 9/27=1/3 has slope −1=2−3; Sen values +1 and −1 | Pass. |
| 1.2 | Type C, d=1,a=1,2; type A,a=b=d=1 | Exponents 1,3,1; at p=3 factors 1/3,1/27,1/3. Multiplying instead gives 3,27,3 and reverses the slope shift | Pass. |
| 2.1 | n=3,c=4,s=0, ε=1/8; c=3 control | Exponents −1/2 versus 3/8; only the first is negative. At s=1/2 choose ε=1/16: exponent −1/4 | Pass mathematics; R05 locator. |
| 2.3 | Zero, one, two bad complements; dim X=1 | Filtration counts 0,1,2. Ordered-complement space has dimension 1; X² has dimension 2, ruling out the asserted product finite étale model | Pass for README's corrected projection. |
| 2.6–2.7 | Bad action 3 over ℚ₃, seed 1; fixed precision loss L | Sums 1,4,13; differences 3,9 have norms 1/3,1/9; limit −1/2. Precision N−L tends to infinity, unlike L−N | Pass. |
| 2.8–2.9 headlines | Siegel weights (6,6),(3,3); elliptic k=4 | Bounds 3 and 0; slope 0<3 but not 0<0. Elliptic bound k−1=3 excludes slope 3 | Pass; no replacement by dimension one. |
| 3.2 | p=2,3; k[ε]/ε² | r thresholds 6,12. ε restricts to 0 on the reduced point but ε≠0 on the thickening; multiplication by ε has square 0 | Pass; scheme-theoretic divisibility and nilpotence are distinct. |
| 3.3 | Two-term Hasse resolution; r=2,3 | Resolution degrees 0,1 give zero in degree 2; r=2 retains H¹ injection only, r=3 full comparison. A map 0→E is injective but not surjective | Pass. |
| 3.5 headline | [Λ→⁰Λ]; finite torus at p=2,5 | Euler rank 1−1=0 although both ranks are 1. Averaging denominator 2 is not integral at p=2; p=5 has four prime-to-p tame characters | Pass; Euler zero is not individual torsion. |
| 4.1–4.2 | Two places, I empty/singleton/full; weights (2,2),(4,2) | Character dimensions 4,3,2; coefficient ranks 1 versus 3. Rank-one highest-weight quotient is not Sym² itself | Pass. |
| 4.6 cover, pullback/trace | p=3; complementary-place counts 0,1,2 | Cover degrees 1,4,16; Trι=1,4,16. Leading congruence factors 1,3,9 differ from the degrees | Repaired; pass. |
| 4.6 congruence | One place, r=2, n=0 versus n≥1; ℤ₃ versus F₃ | n=0 would give 4f−3f=f, nonzero mod9 for f=1. Also 0−3 has valuation 1<2 over ℤ₃, but is 0 over F₃ | Repaired; n≥1 and integral domain essential. |
| 4.6 empty complement | J=I=S_p | Empty products and degree equal 1; comparison is identity; no numerical minimum exists to evaluate | Repaired; separate branch. |
| 4.6 divisibility/normalization | One place, r=1,2; l=2; n=1,2 | p f∈pA gives no constraint, p f∈p²A gives f∈pA. Correct factor 3⁻⁵ versus wrong 3⁻³ has ratio9. Kernel orders p⁴,p⁸ versus printed p³,p⁶ | Repaired; pass. |
| 4.6 Hasse dévissage | k[x,y]/(x²,y²); l=2,p=3 | Length 4=2+2 for one-exponent sequence, not 1+1. Twisted l′=4=p+1; k′≥2p+3 follows once C≥p+2=5 | Repaired; pass. |
| 4.7 headline | [Λ→ᵀΛ], specialize T=0 | Derived fibre has H⁰=H¹=ℤ_p; H⁰ before specialization is 0. For I empty the amplitude is [0,0] | Pass; no underived substitution. |
| 5.3 | p=3,5; Frobenius in two variables; v_p(Norm(x_w))=1 | Target twists A²,A⁴; Cartier sends x²y²dx∧dy to dx∧dy at p=3, but xy dx∧dy to 0. Function trace is 0. Normalizing valuation 3−3=0 | Pass. |
| 5.4 trace-type pattern | p=3,5 | δ twists 8,24; inverse twists −8,−24. Frobenius-square degrees 81,625. The opposite δ direction fails to match γ₂'s source | Pass; no recurrence of untyped trace pattern. |
| 5.8 headline / companion | T=5,U₂=6,U_Iw=2,Z=3, (x,y)=(1,1) | C(x,y)=(11,−1); Δ(x,y)=4; ΔC=8=2·4. The bare map E²→E has kernel E(−3,1) | Pass; injection requires geometric target. |
| 5.9 | Roots 2,3 at p=5; repeated root | Product 6≡1, difference −1 is a unit; eigenvector determinant 1/6≡1. Repeated roots give determinant 0. At p=3 root3 is not a unit and is excluded | Pass. |
| 6.1 | p=3,n=1; allowed/forbidden ε; trivial character | Bound ε≤1/2; 1/4≤1/2 but 3/4>1/2. (2,2) shifts to analytic weight (0,0); lattice exponents 1≥1/2≥0 | R02; explicit domain needed. |
| 6.2–6.3 | Number of places 0,1,2; diagonal Ue_n=3ⁿe_n | Cube counts 1;(2,1);(4,4,1), lengths 0,1,2. Tail norm 3⁻ᴺ→0; identity tail norm is 1 | Pass; cube and compactness are genuine inputs. |
| 6.4 | m=4, θe=f, Ue=e, Uf=3⁻⁴f | θUe=f=3⁴Uθe. Reflected lower bound −3+4=1; reversed twist gives −7. For gap2, bound −3+3=0 does not exclude ordinary H¹ | Pass for corrected positive twist. |
| 6.5 inverse on a block | P=(X+1)²,U=−1 | Q=−X−2, Q(−1)=−1, UQ(U)=1; dropping the linear coefficient gives 0 | Pass for polynomial inverse. |
| 6.5 coefficient comparison | F=ℚ,I={p}; (k,r)=(0,2),(3,2) | Geometric bounds 1,4; combined analytic bounds −2,1. Slope0 is geometric in both, analytic all-degree only in the second direct BGG range | R01. |
| 6.6 unit-root inference | α=1/3,β=3; α,β integral with unit product | First valuations −1,+1 sum0. Under repaired hypotheses a,b≥0 and a+b=0 imply a=b=0 | R03. |
| 6.6–6.7 headline Euler argument | [E→ᵗE], t=0,1; edge defects a,b≥0 | Dimensions (1,1) and (0,0), Euler0 in both. χ_s−χ_t=−a−b; if a=1,b=2 difference−3, not0. Equality forces a=b=0 | Pass for algebra; R01/R03 supply correct inputs. |
| 7.1a character/variance pattern | GL₂,Q=G, ε₁ versus det; Q=B | ε₁([e₁₂,e₂₁])=1 but scalar commutator0; det gives0. Borel ε₁(diag(p,1))=p is allowed | Pass; no recurrence of former general-Q defect. |
| 7.1b repaired realization | V[1],V[−1],zero; x↦(x,0) | Only nonzero degrees 1,−1 respectively; zero→0. Dual sends (a,b)→a, while diagonal dual sends (a,b)→a+b | Repaired; one contravariant functor only. |
| 7.1b/7.5 spectral sequence | gl₂ Verma root pairing −1; pairing2 control | e v_k=−k²v_{k−1}: H₀=0,H₁=𝔲⊗Ev₀. At pairing2, e v₃=0 and [v₂] survives H₀ | Pass; degree reversal needed. |
| 7.5–7.8 headlines | d=3,(p,q)=(0,3),(1,2); central w=2,−2 | Coherent index 2p+q−3 equals0,1. Four Sen scalars (−2,−2,−3,−3), then (0,0,−1,−1) | Pass; repeated eigenvalues retain four graded pieces. |
| 8.3 | η=(0,−1;1),λ=(1,1;w),w even | Levi pairings0,−1; λ−η=(1,2;w−1) has parity3≡w−1. (x∂+1)xⁿ=(n+1)xⁿ≠0; ((x+1)∂+1)/(1+x)=0 | Pass for stated constrained-fibre target; generic-germ argument rejected. |
| 8.4 headline comparison | N=[[0,1],[0,0]],c=3 in ℚ₃; c=0 | N²=0, rank1; ker(3N)=kerN=Ee₁. At c=0 kernel dimension2 instead of1 | Pass; nonzero scalar essential. |
| 8.5–8.6 headline | n=1, balanced/unbalanced pieces; semisimple/Jordan | (1,1,1,1) and (2,0,1,1) both total4; only former balanced. Nilpotent Sen ranks0 versus1 distinguish semisimple and Jordan blocks | Pass in stated ordered ordinary setting, not for arbitrary Hodge–Tate representations. |
| 9.1–9.2 coefficients | O/ℤ_p unramified quadratic; C=ℤ_p[0] | Before extension ℤ_p-rank1; after extension rank2. Corrected left/right both rank2 and O-rank1 | R04. |
| 9.2 concentration headline | [E→⁰E], and full torus at p=2 | H⁰=H¹=E disproves concentration from amplitude alone. Averaging over order2 would use1/2, unavailable integrally | Pass for support-vanishing/residual proof; scalar extension needs R04. |
| 9.3–9.4 specialization headlines | ν=(0,−2); order-three character at p=7 | Weights (5,3),(5,1),(2,−2),(0,−2), degrees0,1,2,3; χ(t)=ζ versus χ⁻¹(t)=ζ²; χχ⁻¹=1 | Pass; dominance, inversion and smooth twist distinguish objects. |
| 9.5 duality headline | Length pairs0/3,1/2; κ=(5,3) | Both length sums3; dual weight (0,−2)=(3−3,3−5) | Pass. |
| 9.6 group-ring headline | F₃[C₃] regular; trivial F₃ module | Invariants/coinvariants dimensions1,1. Regular norm [1]→1+g+g²≠0, augmentation0; on the nonprojective trivial module norm=3=0 | Pass; projectivity cannot be dropped. |
| 9.7 central-character headline | p=2,r=7; p=3,r=7,11 | (7−1)/2=3 odd; r=7≡1 mod3 excluded; (11−1)/2=5 prime to3 | Pass. |

### Pins, headline coverage and Lean

The checked pins are Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. These declarations were opened at those pins, not inferred from a name search:

| Pinned file and line | Definition or hypothesis actually read |
| --- | --- |
| Mathlib/Algebra/Module/LinearMap/End.lean:33 | Module.End is M→ₗ[R]M; no topology or finite-generation condition. |
| Mathlib/LinearAlgebra/Prod.lean:95 and :199 | LinearMap.prod and LinearMap.coprod; coprod evaluates f on the first component plus g on the second. |
| Mathlib/LinearAlgebra/Eigenspace/Basic.lean:72 | Module.End.genEigenspace uses kernels of powers and their supremum; it is not the geometric slope decomposition. |
| Mathlib/Algebra/Polynomial/AlgebraMap.lean:259 | Polynomial.aeval is evaluation in an algebra, sufficient for the polynomial inverse identity. |
| Mathlib/Algebra/Module/Projective.lean:71 | Module.Projective supplies a splitting property; finite generation is additional. |
| Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87 | DerivedCategory supplies a generic derived carrier, not any Shimura complex or its construction. |
| Mathlib/RingTheory/Artinian/Module.lean:307 | LinearMap.eventually_isCompl_ker_pow_range_pow uses both Artinian and Noetherian hypotheses. |
| TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195; hypotheses :140–146 | TauCeti.VermaModule is U(L)/vermaIdeal in the finite-dimensional characteristic-zero IsKilling setting with splitting Cartan; it does not provide the reductive-centre BGG localization. |

Object searches at both pins for Igusa towers, Klingen, higher Coleman, analytic coefficient sheaves, Shimura varieties and Arens–Michael envelopes did not find the geometric headline carriers. Bibliographic Shimura references and finite Coxeter terminology are not such carriers. Native modules, schemes, endomorphisms and derived categories do not make those geometric objects into simple definitions.

| README headline | Suggested.lean disposition |
| --- | --- |
| PEL small-slope classicality §§2.8–2.9 | Named as unstatable: PEL/Iwahori moduli, rigid fibres, coefficients and U correspondences missing. |
| Klingen Euler characteristic §3.5; deep amplitude §3.3 | Named: integral Siegel geometry, coherent coefficient complexes and Klingen family missing. |
| Hilbert derived ordinary control §4.7 | Named: mixed-level Hilbert–Siegel moduli and partial Igusa coefficients missing. |
| Weight-two doubling §5.8 | Named: actual geometric source and target missing; arbitrary companion algebra is not a substitute. |
| One-place comparison §6.7 | Named: analytic and Hida complexes missing. |
| Eichler–Shimura/four-piece filtration §§7.5–7.8 | Named: derived completed tower, analytic localization and higher Coleman coefficient functors missing. |
| Sen–Cousin and de Rham classicality §§8.4–8.6 | Named: Sen action on that tower and supported coherent comparison missing. |
| Four modules, specializations, duality, tame projectivity and central character §§9.2–9.7 | Named: universal supported integral Iwasawa complexes missing. |

Suggested.lean has zero declarations, zero sorried theorems, zero definitions and zero instances. The exhaustive one-tactic probe and mechanical `#check @name` audit therefore both have empty domains. No padding, sorried data, lost section binder, stand-in or undeclared own Lean identifier was found. The companion identities correctly remain README mathematics rather than a substitute headline. Every headline from the summary is accounted for in the module docstring with its missing carriers.

Ran `lake env lean` on the package's Suggested.lean, using its absolute pathname from the pinned content checkout as prescribed: exit 0, no output and no warnings. The file has only `import Mathlib`; no Tau Ceti object file needed building. No overriding option or additional build was used. This checks imports and syntax of the intentionally empty acceptance file, not the truth of the geometric claims.

### Supplier resolution, duplication and merge order

Read the board package index and the supplied open-head index, used `roadmaps show`, `roadmaps grep` and `roadmaps resolve`, and opened the actual cited sections. Main copies were used for roadmaps already on main; new roadmap heads and board packages were used for earlier new suppliers. The resolver's three leads—HigherHidaAndColemanTheory §9.6, LocallyAnalyticDistributionsPartII §2.5 and LocallyAnalyticRepresentationsOfLocalGroups §4.2—exist in packages at README lines 1389, 248 and 760 respectively. They are not missing. Their ORDER positions are 255,199,253, before PadicFamiliesPartII at 256. The BGG normalization mismatch is explicitly the declared gap, not an undisclosed supplied theorem.

The following compact resolution register records the sections opened this round. Except for R03's mismatched mathematical input, the section identities and advertised ownership agree. Specialized additions listed as gaps were not misclassified as drift.

| Supplier | Sections resolved and object boundary |
| --- | --- |
| HigherHidaAndColemanTheory | §§1.1–1.2,2.3,3.7,4.5–4.6,4.8–4.9,5.1–5.6,5.8,6.1–6.3,6.6,8.3,8.5,9.1,9.4–9.8. General supported theory and Q Klingen theory are imported; R01 compares its two different continuation statements. |
| PadicFamilies | §§0a.22,0a.25,2a.15–2a.16: ordinary factors and compact-complex charts. §0a.25 requires perfectness for independence of the derived factor, not arbitrary equality of idempotents. |
| PELModuli | §§M0.21,M0.27,M1.13,M2.8–M2.10,M4.5–M4.6,M5.1,M5.4. The Hilbert principal GL₂ datum is not silently substituted for GSp₄; the latter is contracted. |
| HodgeTateAndCanonicalSubgroups | §§0.6–0.8,0.14–0.16,0.28,3.6,5.1,5.5,5.8. Degrees, Hasse and canonical subgroups imported; mixed Hilbert Igusa/frame data contracted. |
| AdicSpacesPartIII | §§R2.10,R3.4,R3.6,R3.7. General domains/quasi-Stein/proper mapping/GAGA imported; bounded-section gluing separately contracted. |
| ShimuraCompactifications | §§4.1,4.3,4.10,6.12,6.16–6.17,7.16,7.19–7.22,7.25–7.26. Models, traces and Koecher keep their boundary hypotheses; special regularity/cube/stabilizers contracted. |
| AutomorphicBundles | §§3.3,5.3–5.4,11.16,12.1,12.11,12.15. Coefficient functors, trace unit law and normalized correspondences. |
| AutomorphicBundlesPartII | §§5.1–5.2: formal subcanonical/chart hypotheses for relative vanishing, including n=0. The additional §8.8 comparison must be imported for R03. |
| SchemeAndStackFoundations | §§2.19–2.20: duality; specialized non-finite-flat lci fundamental class contracted. |
| SmoothRepresentationsOfLocalGroups; IntegralHeckeAndGaloisDeterminants | §§SR.1.4,SR.4.5; §§2.3,3a.2: Hecke/Satake and spin polynomial conventions. |
| AutomorphicFormsOnReductiveGroups; EndoscopicTransferAndUnitaryTraceComparison | §§6.4–6.6; §11.1: archimedean classifications and transfer. Singular balance/weight-two stability remain separate contracts. They do not provide the missing local-p root integrality in R03. |
| CompletedCohomologyPartII | §§2.2,6.7,7.1,7.8,F.4: completed tower and derived analytic vectors; individual underived vectors are not substituted. |
| PerfectoidShimuraVarieties | §§3.6,6.3: tower geometry; the solid VB/Sen functor and compatibility remain explicitly contracted. General toroidal diamonds are not assumed perfectoid. |
| PadicHodgeTheory; FiniteFlatGroupsAndIntegralPadicHodgeTheory | §4.4; §R07.P7.2: arithmetic Sen convention, cyclotomic operator +1. |
| ArithmeticGaloisRepresentations; AutomorphicGaloisRepresentations | §§5.11,7.6; §1.1: multiplicity framework and existing Eichler–Shimura relation; genus-two extension contracted. |
| PadicMeasuresIwasawaAlgebras; DeformationAndDerivedPatchingAlgebra | §§1.1,1.7; §§5.9,7.1,7.3: full Iwasawa algebra, Sylow projectivity and residual amplitude. |
| LieHighestWeight | Layer 3 at TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405: enveloping, Verma and irreducible framework; reductive category supplied separately. |
| LocallyAnalyticRepresentationsOfLocalGroups | §§3.5,3.10,4.1,4.2,4.6: λ-smooth targets, integrable LB modules, reductive highest weights, parabolic O, Kostant homology. |
| LocallyAnalyticDistributions; LocallyAnalyticDistributionsPartII; PadicLocalLanglandsForGL2Qp | §§0.0,0.3,4.16; §2.5; §0.1: analytic categories and compact blocks; specific envelope; generic Fréchet–Stein framework. |

Object searches included Kassaei continuation, the formal trace congruence, rank-zero vanishing, the Arens–Michael envelope, BGG realization, four-piece filtration, projective Hida modules and Satake-integrality/§14.9 inputs. Generic coefficient, moduli, compact-slope and highest-weight objects are assigned to earlier suppliers. This package owns the PEL continuation, singular spherical operator, Hilbert mixed-level comparisons, BGG-coefficient realization and final module applications; it does not declare a second native generic carrier. R03 identifies the missing extension within that boundary.

The nearest open scopes were read: #1817 GSp4NonregularModularityLifting; #1823 AutomorphicBundlesPartII; #1422 OverconvergentAutomorphicForms; #1822 AlgebraicModularFormsAndSerreWeightsPartII; #1085 PerfectoidShimuraVarieties. Their distinctions are respectively modularity applications, generic integral cohomology/comparisons, overconvergent coefficients/compact operators, integral Fourier/theta and ordinary function comparisons, and tower representability. No second owner of this package's retained constructions was established. GSp4NonregularModularityLifting imports E6/S7/F8 in its scope and its §10.2, TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:1391 onward at #1817; the retained former-number map in this README resolves those citations. No declaration-name collision is possible in the empty Lean file.

The overlap report has no conflicting open head changing this roadmap, dropped cited id, or id defined only in an unacknowledged revision. The nearby scopes and cited numbering were checked rather than treating similarity scores as proof of overlap.

All 15 gap slugs occur both in design/plan.json and under the named README supplier: pel-iwahori-complements; hilbert-siegel-models; kodaira-spencer-isogeny; hilbert-siegel-partial-igusa; hilbert-siegel-frame-torsor; bounded-section-gluing; partial-hasse-regularity; mixed-cube-cover; tame-boundary-stabilizers; lci-fundamental-class; gsp4-singular-balance; gsp4-weight-two-stability; solid-vb-sen; gsp4-eichler-shimura; klingen-bgg-normalization. Each states a specific specialized construction/theorem and its compatibility API; no supplier is none. In particular the Hasse contract requests verification of the formal chart hypothesis, not duplication of AutomorphicBundlesPartII §5.2's relative vanishing. The lci contract requests the non-finite-flat extension of the existing duality framework. The solid VB contract specifies its domain, degree-zero restriction, exactness and CE/Sen compatibility. These are contracts, not findings for present absence. R03's root-integrality input is not among them.

The prescribed dependency check completed with exit 0:

```text
depcheck: 237 roadmaps, 2163 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was printed. No forbidden supplier was used. The merge order and tooling were unchanged.

## Not verifiable

- No sampled source was inaccessible. There is no new missing-source request, and no manifest waiver was reopened.
- The declared gaps are future supplier contracts. Their precision, ownership, minimality and matching declaration sites were checked; future implementations were not certified.
- The geometric headlines lack their actual carriers at the pins. The successful empty-file elaboration cannot certify those mathematical results; the source audit and separating calculations supply the review evidence.
- Ownership was checked against main, the supplied open-head index and available board packages, not unlisted or future branches. No unavailable branch was treated as proof that an object has no owner.

## Source issues

- **Error** in BPS at Lemma 4.4.3, printed p. 24, line 1068: the source says the combined quotient map to the product is finite étale; it should be used only for pulling back admissible opens, with the first projection supplying finite étale descent; affects the proof.
- **Misprint** in BCGP21 at the proof of Lemma 4.6.16, printed p. 112, lines 5453–5455 and 5470–5471: the source says the described composite kernel has order p^{3n}; it should be p^{4n}, the product of its étale order p^{3n} and multiplicative order p^n; affects the proof.
- **Error** in BCGP21 at the proof of Proposition 4.6.19, printed p. 114, lines 5563–5578: the source says simultaneous lowering of all Hasse exponents gives a short exact sequence; it should lower one exponent at a time, retaining powers of the others; affects the proof.
- **Misprint** in BCGP21 at the proof of Corollary 6.4.3, printed p. 154, lines 7417–7420: the source says the positive intertwining factor is on the source-differential side opposite its stated reflected twist; it should satisfy θ U_source = p^{k_v−l_v+1} U_target θ; affects the proof.
- **Gap** in BCGP25 at Proposition 3.6.15, printed p. 67, lines 3038–3048: the source says the overlap differential operator is injective from its displayed monomial action; it should justify injectivity on the constrained fibre, since unrestricted analytic germs contain the kernel 1/(1+x); affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5764307be283e89a4d02074524b0a393a1d91b07", "job": "REV-PKG-PadicFamiliesPartII~5", "model": "gpt-6-astra", "worker": "chris-4"} -->
