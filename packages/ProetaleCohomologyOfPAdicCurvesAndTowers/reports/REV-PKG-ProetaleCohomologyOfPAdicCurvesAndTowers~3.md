<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13166#issuecomment-6784316987 -->
Review (codex) of 582e21b

Verdict: needs_changes

1. **F01** (P1) The closed-annulus Check collapses unseparated cohomology

   **Location:** README.md:343: “the generator of `H¹(C_dR(Y_S)) = C·dlog T`”. Compare the contrary, correct assertion at README.md:390.

   **Claim:** Ordinary degree-one de Rham cohomology of the closed annulus is one-dimensional.

   **Witness:** On `|p|≤|T|≤1`, `ω=Σ_{n≥1}p^n T^{p^n−1}dT` converges and has residue zero. Any primitive has coefficient 1 at every `T^{p^n}`, hence is not analytic on the closed annulus.

   Thus `[ω]≠0`, although its residue is zero, whereas a multiple of `[dlog T]` with residue zero is zero. The degree-one comparison at line 332 transfers this contradiction to `H¹(C_dR(Y_S))`. This is not just an omitted topology adjective: the claimed vector-space equality is false. CDN-CURVES line 108 explicitly distinguishes the infinite-dimensional, nonseparated affinoid group; Proposition 3.20, lines 1926–1929, compares that group, without taking its separated quotient.

   **Exact repair:** Keep the full degree-one comparison. Replace the Check by the assertion that the specified cocycle maps to `[dlog T]`, which has residue 1, and generates the **separated quotient**. Add `ω` as a negative control: it is nonexact, but its polynomial partial sums are exact and converge to it, so its separated class is zero. The repaired statements give `[ω]≠0` before separation, `[ω]=0` after separation, and residue 1 on `[dlog T]`, agreeing with §3.1.

2. **F02** (P3) The revised Tate-curve nonextension Check is still false

   **Location:** README.md:567: “what fails is extension as the `p`-divisible group of an abelian scheme”.

   **Claim:** The generic p-divisible group of a Tate curve over algebraically closed `C` cannot arise from an abelian scheme over `O_C`.

   **Witness:** At `p=5`, `E₀:y²=x³−x` has discriminant 64, a unit. Its abelian-scheme model has generic p-divisible group `(ℚ₅/ℤ₅)²`, also the Tate curve's generic group over `C`.

   Compatible bases of p-power torsion give the isomorphism: finite group schemes in characteristic zero are étale, and the algebraically closed generic field removes the Galois descent data. Therefore `E₀[p∞]` supplies exactly the extension the sentence excludes.

   **Exact repair:** Say that **the Tate elliptic curve itself** has no extension to an abelian scheme, and that extending its abstract generic p-divisible group does not extend that elliptic curve or identify the logarithmic universal cover attached to it. Retain the height-one versus height-two torus test. For the witness, `E₀` has good reduction, while a Tate curve with parameter `q` has `|j|=|q|⁻¹>1`; their generic p-divisible groups are nevertheless isomorphic. Do not replace the sentence by another abstract p-divisible nonextension claim.

3. **F03** (P2) The period-space identification omits uniformizer transport

   **Location:** README.md:598: “it identifies ... the two normalizations, with the same map `θ ⊗ ι_HK`”; also the compatibility claims at README.md:494 and 662.

   **Claim:** Scaling the polynomial coordinate by the ramification index alone identifies the p-based and uniformizer-based diagrams, including their right vertical maps, for an arbitrary uniformizer.

   **Witness:** Take `e=1`, `π=p(1+p)`, odd `p`, and `Ne₁=e₀`. Scaling is the identity, but the supplied transport gives `ρ_π(e₁)=ρ_p(e₁−log(1+p)e₀)`, different from `ρ_p(e₁)`.

   The roadmap itself states this nontrivial transport in §5.2. Its supplier is #1064, `TauCetiRoadmap/CohomologyComparisons/README.md:800–815`, §4.5. For `p=3`, `log(4)` is nonzero (valuation 1), so this is an actual distinction, not a formal possible ambiguity. In general `a=π^e/p` is a unit, and compatible choices give `e log([π♭]/π)=log([p♭]/p)+log([a♭]/a)`. The last term is absent from the proposed scaling identification.

   There is also an arrow-direction ambiguity to remove. Put `D_raw=N_raw−∂_u`, `D_p=N_raw/e−∂_u` and `A_e:f(u)↦f(eu)`. The identity is `D_raw A_e=e A_e D_p`: `A_e` sends p-normalized horizontals to raw horizontals, and its inverse sends raw to p-normalized. At `e=2`, applying `A₂` to the raw horizontal `e₁+2ue₀` gives `e₁+4ue₀`, whose `D_p` is `−3e₀`, not zero.

   **Exact repair:** Specify both directions of the scaling map and its intertwining equation. Separately state the comparison of the embeddings and evaluation/Hyodo–Kato maps for arbitrary `a=π^e/p`, using the signed transport of the named supplier. Use this transported map in §§4.3 and 5.5; do not assert unchanged evaluation maps solely from `u↦eu`, and do not restrict to fields admitting `π^e=p`. Test both `e=2` (inverse scaling sends `e₁+2ue₀` to `e₁+ue₀`) and `e=1,π=3·4` (transport sends `e₁` to `e₁−log(4)e₀`).

4. **F04** (P3) The logarithmic generators are not a free family

   **Location:** README.md:770: “it is free over `O_C` on the logarithmic forms (§6.6)”.

   **Claim:** The forms specified in §6.6 freely generate the degree-one Hodge–Tate target.

   **Witness:** Write `ω_ab=dlog((z−a)/(z−b))`. Then `ω_01+ω_12−ω_02=0`, with all three forms nonzero; the coefficient vector `(1,1,−1)` is nonzero, including over p-adic coefficients at `p=2`.

   Their residues at `0,1,2` are respectively `(1,−1,0)`, `(0,1,−1)`, `(1,0,−1)`, which verify the relation. CDN-DUKE Theorem 1.3 and its proof, lines 89–119, identify a **completed tensor product** and its Hodge–Tate regulator, not a free module on all logarithmic symbols.

   **Exact repair:** Replace the freeness clause by the actual completed measure-module identification `O_C ⊗̂ Sp_1(ℤ_p)^*`, with logarithmic generators subject to the relations of §0.5 and the appropriate completion. Retain the twist-cancellation assertion. Add the three-point relation as a Check; it evaluates to zero on both the measure side `(δ₀−δ₁)+(δ₁−δ₂)−(δ₀−δ₂)` and the differential side.

5. **F05** (P2) The summary presents the plan as following a source programme

   **Location:** README.md:3: “following the programme of Colmez, Dospinescu and Nizioł”.

   **Claim:** The roadmap's organization is described through the programme of its sources.

   **Witness:** This is the explicit source-following sentence prohibited by the organization principle. The package already has a mathematical dependency explanation in “How to read the build”, README.md:142.

   **Exact repair:** Delete the source-programme clause and let the summary state the mathematical constructions, inputs and endpoints. Keep exact source citations at the targets. No reordering of dependency-forced layers is requested: Layers 2–4 build on the curve pattern and comparisons, while Layer 5 is an independent higher-dimensional branch. Removing the clause leaves all endpoints and dependency edges intact.

6. **F06** (P3) Segment representations are cited in the wrong supplier layer

   **Location:** README.md:33 and 135: “SR.3 (*steinberg*, *segment-representations*)”; the comparison at line 193 inherits this locator.

   **Claim:** Both named targets lie in SR.3 of SmoothRepresentationsOfLocalGroups.

   **Witness:** At #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4446`, *segment-representations* is in SR.5.2. The SR.3 *steinberg* target is at line 3002.

   **Exact repair:** Split the citation: SR.3 for *steinberg*, SR.5.2 for *segment-representations*. Update the corresponding dependency summaries where the segment comparison is consumed. The mathematical check remains `St_GL₂=L([−1/2,1/2]_1)`; the supplier uses the irreducible quotient of the increasing normalized product, so no change to that convention is needed. This is not a new dependency on a different roadmap or a claim that the supplier is absent.

7. **F07** (P3) The native flag and translation definitions lack discriminating Checks

   **Location:** README.md:182 defines “`flagSubspace K n m`” and “`translation G H A`”; the Checks at lines 191–195 test Steinberg quotients, not these definitions' indexing and action law.

   **Claim:** The definition/API/three-Checks requirement is fulfilled for these retained native constructions.

   **Witness:** No Check evaluates the flag for `n=0` or `m≥n`, or distinguishes inverse left translation from `f(gx)` on a nonabelian group. The existing scalar/Steinberg examples do not supply these tests.

   **Exact repair:** Add concise prose API laws and at least three discriminating Checks for each, without adding Lean padding. For the flag use `K²,m=0` giving `0`, `m=1` giving `Ke₀` (not `Ke₁`), and `m=2,3` giving `K²`; also record the zero-dimensional convention. For translation use identity evaluation, `H=G` giving the trivial one-dimensional action, and a noncommutative composition test: on discrete `S₃`, `H=1`, `g=(12),h=(23),f=δ₁,x=gh`, the inverse-action composition and product both give 1; the formula `f(gx)` gives composition 1 but product 0. These tests agree with the real Lean bodies. State that the flag is monotone with dimension `min(n,m)`, and that translation is linear and satisfies the representation composition law.

8. **F08** (P2) The classification supplier is narrower than the allowed residue fields

   **Location:** README.md:120 attributes “the slope decomposition of a finite-dimensional `φ`-module over `C̆`” to VectorBundlesAndIsocrystals Layer 1; repeated in the Needs at lines 276 and 409.

   **Claim:** That target supplies the decomposition for every `C` admitted by this roadmap's conventions.

   **Witness:** Take `k=overline(𝔽_p(t))` and `C` the completed algebraic closure of `Frac W(k)`. Here `v_p(C×)=ℚ` but residue transcendence degree is 1; the cited supplier fixes `k=𝔽̄_q`, of transcendence degree 0.

   At #1205, `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:27` fixes that constant field and line 281 states its classification over that field. Its own ownership paragraph, line 13, imports ordinary Witt classification from CrystallineCohomology. The actual general owner is #857, `TauCetiRoadmap/CrystallineCohomology/README.md:6621–6648`, §CR.4.7, *Slope decomposition on the existing isocrystal carrier*: perfect k for slope descent, algebraically closed k for the block classification, without an algebraicity-over-𝔽_p restriction.

   **Exact repair:** Cite CrystallineCohomology §CR.4.7 for the ordinary Witt slope decomposition and classification used in §§1.3 and 3.2, including its exact hypotheses in the supplier contract. Keep the distinct Banach–Colmez contracts with VectorBundlesAndIsocrystals. Update the scope/Needs summaries consistently. Do not narrow C or declare a new gap: the earlier owner already supplies the result. The replacement accepts both `k=𝔽̄_p` and `k=overline(𝔽_p(t))`; in either case the block `Fe₀=e₁, Fe₁=pe₀` has slope `1/2` twice, since `F²=pσ²`.

Eight findings: four blocking (one P1, three P2), four P3. The package is repairable. Its acceptance file elaborates, with only the warning for its single admitted theorem. The dependency check passes. Author inputs were not edited.

Here `README.md` and `Suggested.lean` mean `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` and `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`. Library paths below are relative to the pinned library repositories. Source line numbers refer to the supplied extractions, not to a different version of the papers.

## Previous findings, checked first

The previous repair report marks no finding “not actionable in this package”. The following are assessments of the actual repaired text, not acceptance of the repair report's conclusions. I read the whole README again, examined the changed passages adversarially, and searched for the repaired patterns elsewhere. The previous review contains computed rows for all 50 numbered subsections; unchanged statements may retain those computations. The seeded targets and changed mathematical claims were checked afresh below.

| Round-2 finding | Status | Repaired passage and verification |
| --- | --- | --- |
| R01, WD multiplication | Repaired | README.md:56 now has “`p^{−deg g₁}`”. At geometric Frobenius `diag(1,2)`, conjugation multiplies `N` by `1/2`, as required. |
| R02, dual of Steinberg quotient | Repaired | README.md:186 says “the annihilator ... of the relation submodule”; line 195 tests masses `1` and `0`. The finite-stage spaces are now images in the quotient. |
| R03, tower level numbering | Repaired | README.md:809 gives “`M_{2m} = M_Dr,m`” and constructs odd levels by quotienting. At residue cardinality 2, level-one deck order is `12/4=3`, not 12. |
| R04, absolute irreducibility | Repaired | README.md:809 requires “absolutely irreducible”; line 849 uses scalar endomorphisms. The unramified matrix with polynomial `X²−p` and two-dimensional endomorphism algebra is excluded. |
| R05, disconnected diagrams | Repaired | README.md:480 uses “`H⁰_dR(Y) = ∏_{π₀(Y)} C`”; line 842 says “not locally constant”. Thus `(0,1)` is zero in the quotient for two components. |
| R06, uniqueness of HK structure | Repaired | README.md:494 requires agreement through “the same Čech complex” of a common model. The slope-0/slope-1 counterexample at line 488 remains. The additional normalization problem is R03 below. |
| R07, base-ring class | Repaired | README.md:292 uses complete topological base algebras, with “`p ∈ I`”; `A_inf` is no longer called a valuation ring. Its incomparable elements `p,[p♭]` no longer contradict the definition. |
| R08, Tate nonextension | Partly repaired | README.md:567 admits the generic group “does extend over `O_C`”, but adds “what fails is extension as the ... group of an abelian scheme”. This is still false: R02 below. |
| R09, nilpotent domain | Repaired | README.md:559 uses the “limit” of finite-level evaluations; line 568 explicitly excludes `O_C` from the nilpotent domain. The kernels modulo `p²,p³` have square/cube zero. |
| R10, Dieudonné variance | Repaired | README.md:576 distinguishes “`D_contra`”, “`D_raw`” and “`D_norm`”, with `D_norm=D_contra^∨`. For `μ_{p∞}` their slopes are `1,0,−1`; the two correct fixed-point conditions agree. The route now compares images of compatible lifts, not arbitrary lifts. |
| R11, flat model generality | Repaired | README.md:752 says “not necessarily semistable”. The cusp at line 759 is flat, generically smooth and not normal crossings. The décalage and twisted Artin–Schreier route uses no semistability. |
| R12, comparison exponents | Repaired | README.md:630 retains the enough-roots qualification for “`Nr+c_p`”. README.md:99 and the plan agree on the formal/weak-formal supplier gap and its bounded-error versions. |
| R13, five-term ownership | Repaired | README.md:874 imports “ModpRepresentationsOfGL2OverLocalFields §0.7”; the criterion is not rebuilt here. That supplier's actual section starts at line 510. |
| R14, fine Tate triangulation | Repaired | README.md:325 uses “three points”; line 326 rejects two points. Three vertices give one intersection per pair; two give two intersections for the same pair. |
| R15, twisted polynomial | Repaired | README.md:535 gives “`X² − (a/q)X + 1/q`”. For `q=2,a=0` both twisted realizations give `X²+1/2`. |
| R16, affine-space model | Repaired | README.md:610 supplies the chain model of the affine line; line 659 sends `d≥2` to the model-free theorem. Proper rational components have constant functions; the ordinary disc's affine component does not. |
| R17, supplier labels | Repaired | README.md:138 cites “§§0.3–0.5” and “§0.7”; lines 920–921 use actual downstream section numbers. Old MP/SZ labels are gone. The separate SR.3/segment locator error is R06 below. |
| R18, API and Checks | Repaired for the named defects | README.md:213–223 now defines bounded measures and tests masses and unbounded growth; lines 335–337 give the adoc API; lines 415–424 give regulator laws and discriminating values. Both Lean helper theorems have mathematical docstrings. The same missing-Check pattern survives for other definitions: R07 below. |
| R19, adoc comparison degree | Partly repaired | README.md:332 now says “in degree one”, matching Proposition 3.20; the coefficient argument in §1.1 is also repaired. The newly added annulus Check at line 343 is false: R01 below. The previous review's proposed one-dimensional annulus Check was itself inadequate for ordinary affinoid de Rham cohomology. |
| R20, monodromy normalization | Partly repaired | README.md:598 and 617 distinguish “`N_p = N_raw/e`” and signed uniformizer transport. The new period-space identification does not account for a general uniformizer's unit factor: R03 below. |

## Verified sound

### Coverage and principle checks

All four author inputs were read, along with the previous review/repair report, package index, citation leads, overlap facts, signatures and library-near-match leads. All 20 prior repairs were assessed above. All 50 numbered subsections were reread; the report below compresses the recomputation to the 15 seeded targets, headlines, changed passages and finding witnesses. Unchanged computations from the round-2 table were used only where actual values were recorded. This is a needs-changes verdict, not a claim that source-unavailable statements have been certified.

No re-planning of an existing main-branch roadmap, forbidden supplier, computational algorithm, copied source passage, sorry'd data, `set_option`, admitted example, `lemma` declaration, alternate import header or extraneous Lean API catalogue was found. The README has eight mathematically named layers, each with Examples and Dependencies, and per-target Needs lines. Its generic curves retain arbitrary allowed `C`, its tower retains arbitrary finite `F/ℚ_p`, and its syntomic comparison treats `p=2` separately rather than removing it. The narrower mod-p non-admissibility theorem retains its mathematically necessary `F≠ℚ_p` hypothesis. Organization has the explicit defect R05; definition Checks have R07. The roadmap and source manifest contain no machine paths, job identifiers or pull-request-number narrative. Existing main-branch JacobianChallenge and ReductiveGroupsPartII were consulted for shape.

### Seeded source verification

The manifest has 20 unique work keys: 15 with readable cached texts and five settled uncertified works. No duplicate source key or newly missing work was found. No manifest entry was rewritten. Published/preprint references were checked using the version represented by the supplied text; page numbers below are its printed pagination. Exact source statements were compared for coefficient range, connectedness, model/proper-component hypotheses, topology, truncation, twists and map direction.

| Sample | Source and precise text read | Outcome |
| --- | --- | --- |
| 0.1 graphs with legs | CDN-CURVES §1.2.1–§1.2.4, pp.18–20, lines 718–796 | Ordinary edges versus all compact-support edges and residue signs agree; the source has the typo noted below. |
| 0.3 generalized Steinberg | CDN-STEIN §5.2.1–§5.2.3, pp.38–39, lines 1901–1954; GK14 Corollaries 4.3–4.5, pp.28–30, lines 1300–1364 | Parabolic indexing, pullbacks, coefficient hypotheses and corrected annihilator dual agree. Type A has no exceptional root-system factor. R07 concerns Checks, not the quotient definition. |
| 1.3 period spaces | CDN-CURVES Theorem 0.1, p.3, lines 111–123; CDN-STEIN Theorem 1.8 and §5.5, p.43, lines 2160–2167 | `φ=p^r`, diagonal `N`, and the `r−1` vanishing agree. These sources do not justify suppressing uniformizer transport in the later adapter. |
| 2.5 ℓ-adic filtration | CDN-CURVES Theorem 6.3 and Remark 6.4, pp.77–78, lines 3189–3235 | `ℓ≠p`, graph/component/residue pieces and Picard–Lefschetz sign retained. |
| 3.1 de Rham filtration | CDN-CURVES Proposition 6.8, p.79, line 3283; Theorem 6.14 and Lemma 6.15, p.81, lines 3374–3397 | Separation and length-dependent denominators agree. This confirms R01 against the new §2.3 Check. |
| 3.5 fundamental diagram | CDN-CURVES Theorem 6.32 and Remark 6.33, pp.91–92, lines 3826–3848 | First row exact; second row only a complex; affinoid `H¹(O)=0`. No improper promotion of the second row to exactness. |
| 4.1 overconvergent affinoids | CDN-CURVES Proposition 7.4, Remark 7.5 and Theorem 7.6, p.95, Remark 7.7, p.96, lines 3968–4012 | Dagger finiteness, closed-form row and strictness agree. Ordinary affinoid and dagger cohomology are kept distinct here. |
| 4.3 filtrations | CDN-CURVES Theorem 8.1, p.103, lines 4292–4322; Remark 8.2(ii), p.104; Theorem 8.9, p.108, line 4477 | Filtration supports ordinary/compact graph distinction and slope-one twist. Added cross-model diagram claim requires R03. |
| 4.4 special fibre/WD | CDN-CURVES Theorems 8.4 and 8.7, pp.105–107, lines 4372–4445, especially §8.2.5 | Special points, double points and action construction retained. Corrected inverse weight avoids source inconsistency. |
| 6.2 Schneider–Stuhler/Iovita–Spiess | CDN-STEIN Theorem 5.8, p.40, lines 2001–2035; Corollary 5.9, p.41, line 2042; Theorem 5.10, p.42, lines 2095–2101 | Degree, twists, duals and regulator agree in this readable account. Primary SS91/IS01 remain uncertified, not independently read. |
| 6.3 Frobenius | GK05 Theorem 6.3, p.32, line 1254; Proposition 6.5 and Corollary 6.6, p.33, lines 1275–1291; standing dimension restriction at line 1209 | General-dimensional source and separate tree/residue treatment at dimension one checked; scalar degree-s Frobenius forces `N=0`. |
| 6.7 fixed points of AΩ | CDN-DUKE Theorem 2.9, p.9, lines 358–378; Lemmas 2.11–2.12, pp.9–10, lines 380–426; Corollary 2.13, pp.10–11, lines 461–466 | Arbitrary flat formal model, truncations and twisted equivariant form supported. The proof's operator notation typo is not copied into the roadmap's formulas. |
| 6.8 A_inf cohomology | CDN-DUKE Theorem 1.3, p.2, lines 89–90 and proof sketch p.3, lines 96–119 | Completed tensor product and Hodge–Tate reduction supported; “free on logarithmic forms” is not: R04. |
| 7.3 levelwise diagram | CDN20 Proposition 2.12, p.23, lines 914–928; Proposition A.1 and Remark A.2, pp.53–54, lines 2103–2133 | G-bounded criterion and componentwise constancy valid for the proper-component tower models. Disconnected extension uses all component constants. |
| 7.7 finite copresentation | CDN23 Theorem 2.1, p.27, lines 1042–1044; cpcf argument, pp.32–33, lines 1223–1265 | Finite `K/F`, `k≥1`, `q≥0`, arithmetic rather than geometric space, and finite-copresentation conclusion agree. |

### Computed adversarial table

Each row records values, including unsuccessful negative models, rather than just a declaration of soundness. Finite-rank computations are not proposed as additional Lean targets.

| Statement(s) | Instances | Computed values on the two sides / competing models | Result and change |
| --- | --- | --- | --- |
| 0.1 ordinary/compact graph cohomology | Point; one vertex with two legs; a circle | Point: `(H⁰,H¹)=(L,0)` and compact same. Two legs: ordinary `H¹=0`; compact differential `L→L²`, image diagonal up to orientation, cokernel `L`. Circle: both `H¹=L`. | Supports the all-edge compact-support complex. |
| 0.1–0.2 orientation/length | A loop of length 3; subdivide into lengths 1 and 2 | `N_μ=3`; subdivided pairing `1+2=3`. Reverse cycle orientation changes both factors' signs, leaving pairing 3. | No change. |
| 0.3 flag/parabolic | `n=0`; `n=2,m=0,1,2,3`; empty/full J | Flag values `0;0,Ke₀,K²,K²`. Upper unipotent preserves `Ke₀`; lower unipotent sends `e₀` to `e₀+e₁`. `P_∅=B`, `P_Δ=G`. | Lean bodies correct; missing README tests R07. |
| 0.3 translation | `S₃`, `g=(12),h=(23)`, `δ₁`, `x=gh` | Inverse translation gives `1=1` in composition law. Direct left argument gives `1≠0`. For `H=G`, every g acts as 1. | No action bug; R07. |
| 0.3 quotient/dual | `d=1,J=∅`; `J=Δ`; zero ring | Quotient `LC(P¹,A)/A`; full J gives `A`; zero ring gives 0. `δ_a(1)=1`, `(δ_a−δ_b)(1)=0`. | Correct annihilator excludes mass-one functional. |
| 0.4 Lean headline | `d=0`; `d=1,p=2,A=𝔽₂`; char-0 coefficients | Rank-zero-root quotient is A, invariant subspaces `0,A`. At `d=1`, congruence invariants have dimension `q=2`, obtained from `q+1=3` point functions modulo constants. Characteristic restrictions are exactly `0` or p. | Nontrivial general theorem; no padding. |
| 0.5 measures | Dirac pair; shrinking pairs; `r=0`; `r>d` | Masses `1,0`; unbounded distribution has values `p^{-n}`, norms `p^n→∞`. Degree-zero cocycles are constants `ℤ`; degree above d gives 0. | New boundedness API discriminates distributions from measures. |
| 1.2 tensor completion | Finite product and zero module | Completed tensor of `F^n` gives `B^n`; zero gives 0. Finite-coordinate projections remain coordinate projections. | Consistent with finite-piece topology supplier. |
| 1.3 period space | Slopes 1,0,1/2; M=0 | Slope 1 at r=1 gives `ℚ_p`; slope 0 gives `(B_cris^+)^{φ=p}` with θ-kernel `ℚ_pt`; positive slope 1/2 has no φ=1 plus-crystalline vectors; M=0 gives 0. | Positive-slope injectivity distinguishes the slope-zero wrong model. |
| 1.3 / 3.2 classification scope | Residues `𝔽̄_p`, `overline(𝔽_p(t))` | Transcendence degrees `0,1`; both give value group ℚ after completed algebraic closure. Standard rank-two block has `F²=pσ²`, slopes `(1/2,1/2)` in either case. | R08: use the general Witt-classification owner. |
| 2.1 base algebras | `A_inf`, `O_C`; residues T and T⁻¹ | In A_inf neither `p` nor `[p♭]` divides the other; the revised I-adic class admits it. `Res(dT/T)=1`, `Res(d(T⁻¹)/T⁻¹)=−1`. | Repaired class and sign correct. |
| 2.2 fine triangulation | Tate circle with two/three vertices | Two vertices: intersection multiplicity 2 for one pair. Three: multiplicity 1 for each adjacent pair; `b₁=3−3+1=1`. | Two rejected, three admitted. |
| 2.3 comparison | Closed annulus; exact polynomial; ω of R01 | `[dlog T]` has residue 1; `d(T^m)` is exact; ω has residue 0, nonzero ordinary class, zero separated class. | R01. |
| 2.4 symbols | T on annulus; scalar c; product T² | Residues `1,0,2`; scalar has compatible roots and trivial symbol; `dlog(T²)=2dlog T`. | Regulator normalization preserved. |
| 2.5 ℓ-adic filtration | Good reduction genus g; Tate length v | Graded ranks `(0,2g,0)` and `(1,0,1)`; Tate `Ne₁=v e₀`, `N²=0`. | Correct prime-to-p filtration. |
| 3.1 de Rham | Closed disc and closed annulus | Separated H¹ dimensions `0,1`. R01's ω gives an additional nonzero ordinary class with residue zero on the annulus. | §3.1 correct; §2.3 Check conflicts. |
| 3.2 HK filtration | Disc; annulus; ordinary good elliptic component at boundary | First two separated dimensions `0,1`, annulus φ=p,N=0. Boundary takes only slope 1; ordinary proper component slopes `0,1` contribute 1 rather than 2 there. | Boundary slope restriction is necessary. |
| 3.3 syntomic regulator | Constant; `1+pT`; T²; p=2 | Differential components `0`, `p dT/(1+pT)≠0`, `2dT/T`. `H⁰_syn=ℤ_pt`; replacing φ/p by φ gives 0. At p=2 only 2-torsion cokernel is promised. | Repaired API/normalization checks distinguish zero and rescaled regulators. |
| 3.4–3.5 fundamental diagram | Disc; annulus; proper genus 1 | Disc HK term 0. Annulus HK period term `ℚ_p`, T maps to 1. Proper genus 1 has `dim H¹(O)=1`, period Dimension `(1,2)` mapping to `(1,0)`, kernel height 2. | First row exact, second only complex; no false exactness added. |
| 4.1 dagger | Disc; annulus | Dagger H¹ dimensions `0,1`, annulus class `[dlog T]`; the ordinary ω has no overconvergent coefficients on any larger outer radius. | Dagger and ordinary assertions do not conflict once R01 fixed. |
| 4.2 component constants | Two discs; slopes 0 and 1 with identical de Rham carrier | Constants `C²`, hence `(0,1)` has quotient class 0; rank-one isocrystals have slopes `0≠1` despite both de Rham spaces being C. | Repaired component extension and rejection of fake HK uniqueness. |
| 4.3 common-model normalization | `xy=π²`, e=2; two-term module | Raw edge length 2, p-length 1. `D_raw(e₁+2ue₀)=0`, `D_p(e₁+ue₀)=0`; `D_p A₂(e₁+2ue₀)=−3e₀`. | Requires explicit arrow direction, R03. |
| 4.3 / 5.2 / 5.5 evaluation | e=1, p=3, π=12 | Scaling is 1; signed evaluation transport on e₁ is `e₁−log(4)e₀`, with `v₃(log4)=1`, hence not e₁. | R03: unit factor matters even unramified. |
| 4.4–4.5 WD convention | `Ne₁=e₀`, Φ=diag(1,q), q=2,3 | `NΦe₁=q e₀=qΦNe₁`; `ΦNΦ⁻¹e₁=q⁻¹e₀`, coefficients `1/2,1/3`, not `2,3`. | Repaired negative exponent correct. |
| 4.6 similarity | Elliptic curve over 𝔽₂ with a=0 | Untwisted polynomial `X²+2`; twist divides eigenvalues by 2, yielding `X²+1/2` on both realizations. | R15 repaired. |
| 4.7–4.8 Jacobian cover | g=0; ordinary/supersingular g=1; Tate | Dimensions `0`, `(1,1)+(0,1)=(1,2)`, and `(1,2)`; Tate torus cover `(1,1)` versus Jacobian cover `(1,2)`. | Period dimension theorem retained. |
| 4.8 nonextension | Tate E and good E₀ at p=5 | Both generic groups `(ℚ₅/ℤ₅)²`; good E₀ discriminant 64 unit; Tate `|j|>1`. | R02: distinguish extending group from extending E. |
| 4.8 nilpotence | `O_C`, `O_C/p²`, `O_C/p³` | No finite power of p is zero in O_C; finite-level kernels have powers 2 and 3 zero. Limit taken after finite-level evaluations. | R09 repaired. |
| 4.9 variance and lifts | `μ_{p∞}`; constant étale group; bounded differences | μ slopes contra/raw/norm `1,0,−1`; correct fixed term `(B_cris^+)^{φ=p}`; étale gives `ℚ_p`. Differences multiplied by pⁿ tend to 0. | Repaired comparison is no longer the wrong φ=1 equation on raw data. |
| 5.1 model | Chain model of affine line; affine disc special component | Proper components have `H⁰(O)=k`; affine component has `k[T]`. Chain has generic H¹_HK=0; proper positive-genus curve cannot be Stein. | Actual chain replaces unsupported standard affine model. |
| 5.3 comparison lattice | `(p,r)=(2,2),(3,2)` | `p^a a!` equals `8,3`, respectively; for q=0 constants survive, while truncation at 0 says nothing about q=1. | All-prime lattice and enough-roots bound retained. |
| 5.4–5.5 Stein diagram | Point r=0; affine line r=1 | Point fixed constants `ℚ_p`; affine line HK¹=0 and `H¹_proét=O/C`, mapped by derivative to exact 1-forms. | Deep theorem retained with declared formal comparison gap; compatibility R03. |
| 6.1 standard model | d=1,q=2; d=2,q=2 | Tree components have 3 intersections; plane has 7 rational point centers. Blowing up a Cartier divisor contributes the identity modification. | Compatible with imported dimension-one model. |
| 6.2 regulator | r=0; two-point log form | Empty wedge gives 1; residues of `dlog((z−a)/(z−b))` are `+1,−1`, sum 0. | Correct dual and Tate normalization. |
| 6.3 Frobenius/monodromy | Degree s=1, q=p or p^f | φ^f=q on the residue class; `Nφ^f=p^fφ^f N` gives `qN=q²N`, hence N=0 in characteristic zero. | Scalar Frobenius supports claimed vanishing. |
| 6.4–6.5 half-space diagram | r=0; r=d+1 | Degree 0 constants `ℚ_p`; above d, `Sp_{d+1}=0` and `Ω^d/ker(d:Ω^d→0)=0`, so both corresponding terms vanish. | Correct junk-degree convention. |
| 6.6 integral forms | Constants; two Dirac masses | H⁰ integral functions `O_K`; `δ_a−δ_b` has total mass 0 and residues `1,−1`. | Bounded-measure identification retained. |
| 6.7 AΩ fixed points | Geometric point i=1; cusp p≥5; i=0 | Point H¹_ét=0 and twisted operator cokernel 0; cusp generic singularity would force x=y=p=0, impossible; special tangent cone y² has one repeated line. Degree 0 fixed constants `ℤ_p`. | General flat-model statement and truncation supported. |
| 6.8 Hodge–Tate reduction | i=0; three log forms, i=1 | Degree 0 A_inf; twist `−1+1=0`; relation residue vectors sum `(0,0,0)` despite coefficients `(1,1,−1)≠0`. | Twist sound, freeness false: R04. |
| 6.9 integral/rational étale | r=0; r>d; reduction mod p | `ℤ_p`, 0; integral mass-zero condition reduces to mass 0 over 𝔽_p. | No lost p=2 case. |
| 6.10 compact supports | d=1, banal ℓ | `H¹_c=St`, `H²_c=Λ(−1)`; geometric Frobenius top eigenvalue q, not q⁻¹; shifts `[-1],[-2]`. | Distinguishes duals and shifts. |
| 7.1–7.2 levels/components | q=2,m=1; height classes mod2 | Supplier deck size 12; odd-level quotient size `12/4=3`; height classes `{0,1}` exchanged by odd valuation. | Repaired level dictionary and geometric components. |
| 7.3 levelwise diagram | Central quotient/full level0 | Component constants `C²` and `C^ℤ`; `(0,1)` has derivative/exponential class 0; nonconstant function on a component has nonzero derivative. | Repaired boundedness test correct. |
| 7.4–7.5 multiplicities | Frobenius polynomial X²−p; genuine slope 1/2 type | First End-algebra dimension 2, so excluded by absolute irreducibility. Slope-1/2 period has θ-kernel 0 and Dimension `(1,2)` for rational coefficients. | Scalar endomorphism route no longer admits the counterexample. |
| 7.6 cpcf | Finite constant system; ℤ/pⁿ; infinite discrete constant vector space | Limits finite, ℤ_p, and infinite discrete space respectively; first two profinite, third noncompact. | Object and imported finite-presentation criterion separated. |
| 7.7 arithmetic cohomology | Level0 K=F; unramified quadratic F₂; disjoint ramified quadratic | `K⊗F F₂` has respectively 1,2,1 field factors; H⁰ dimensions `1,2,1`, while geometric dimension is 2. | Arithmetic/geometric distinction maintained. |
| 7.8 non-admissibility | F=ℚ_p versus F≠ℚ_p | The first admits the nonzero p-adic local-Langlands Hom; the stated vanishing concerns only the second. | Necessary field restriction retained. |

### Lean acceptance file, signatures and padding

The prescribed `lake env lean` invocation on the author file was run from the pinned content checkout. Exit status 0; the only warning was “declaration uses 'sorry'” at Suggested.lean:124. There is one `import Mathlib`, no TauCeti import and therefore no missing TauCeti object file to build. No library pins were modified.

All eight declarations were checked in one scratch copy with `#check @name`: five definitions (`flagSubspace`, `parabolic`, `translation`, `steinbergRelations`, `generalizedSteinberg`), two proved construction helpers (`parabolic_mono`, `steinbergRelations_le_comap`) and one admitted headline (`generalizedSteinberg_isIrreducible`). All appear in README.md:182 or 201. The elaborated types retain the topology/group assumptions on translation, the field and topological-ring assumptions on the quotient construction, and `Fact p.Prime`, `NormedAlgebra ℚ_[p] K`, finite dimensionality over ℚ_p and the coefficient characteristic disjunction on the headline. No section binder was lost and no correction to a signature was needed.

For the sole admitted theorem I ran each one-tactic probe on a copy: `simp` made no progress; `rfl` failed; `infer_instance` failed; the pinned equivalent simple-module criterion `Representation.irreducible_iff_isSimpleModule_asModule` could not synthesize the necessary simple-module instance. The library-search lead `Representation.isIrreducible_iff` was not at this pin and was replaced in the probe by the actual declaration, not reported as an author error. No padding finding arises. The proved helpers are necessary to construct the quotient, rather than acceptance-test stand-ins.

| Headline inventory from the summary and endpoints | Acceptance-file treatment |
| --- | --- |
| Generalized Steinberg irreducibility, §0.4 | Stated on the actual native quotient representation at line 124. |
| Kummer symbol description for every ℓ, §2.4 | Named in docstring; adic analytic curve/site/cohomology carriers absent. |
| Curve fundamental diagrams, §§3.5,4.1,4.2,4.7 | Named in docstring; analytic curves, HK and semistable plus-period carriers absent. |
| ℓ-adic/de Rham/HK filtrations and WD similarity, §§2.5,3.2,4.3,4.6 | Named in docstring; the geometric realizations are missing, despite abstract linear algebra being available. |
| Jacobian universal-cover period isomorphism and integration, §§4.8–4.9 | Named in docstring; generic Jacobians/universal vector extensions and their period realization absent. |
| G_K-equivariant semistable Stein diagram in every degree, §5.5 | Named in docstring; weak formal/dagger spaces and syntomic cohomology absent. |
| Half-space computations in all coefficient theories, §§6.2,6.4,6.5,6.9,6.10 | Named in docstring; Ω^d as a rigid space and its cohomologies absent. |
| Tower components/models/multiplicities/fundamental diagram, §§7.1–7.5 | Named in docstring; tower and geometric cohomology carriers absent. |
| Finite copresentation and non-admissibility, §§7.7–7.8 | Named in docstring; tower cohomology and required representation correspondences absent. |

No statable omitted headline or artificial replacement was found. In particular, Mathlib's elliptic-curve `Jacobian` is a coordinate presentation, not the general Jacobian-scheme carrier needed here.

### Pinned library evidence and object duplication

Both the library-search leads and object searches were examined at the pins. A same-word hit is not treated as the same object. These are the definitions actually opened:

| Pinned file and line | Content used / limitation |
| --- | --- |
| `Mathlib/Topology/LocallyConstant/Basic.lean:212,398` | Bundled function plus local constancy, and continuous pullback. No compactness or separation of the domain is built into this carrier. |
| `Mathlib/Topology/LocallyConstant/Algebra.lean:327` | `LocallyConstant.comapₗ`, the actual linear pullback. |
| `Mathlib/Topology/ContinuousMap/Defs.lean:32` | Function plus continuity; compactness for sup-norm use is a separate assumption. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:121` | `Matrix.GeneralLinearGroup.toLin`. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:515` | `MulAction.stabilizer` of the supplied action. |
| `Mathlib/Algebra/Module/Submodule/Pointwise.lean:186` | Pointwise action sends a submodule to its linear-map image; it is not pointwise fixation of its vectors. |
| `Mathlib/GroupTheory/Coset/Basic.lean:424,430` | Subgroup quotient projection and its representative formula. No normality requirement is inserted. |
| `Mathlib/LinearAlgebra/Quotient/Defs.lean:227` | `Submodule.mkQ`, linear quotient map. |
| `Mathlib/Algebra/Category/ModuleCat/Basic.lean:59` | Native module category carrier. |
| `Mathlib/RepresentationTheory/Basic.lean:329` | Quotient representation with invariant-submodule proof. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29,32` | Irreducibility is simple order of invariant subrepresentations, equivalent to a simple associated module; it is not a preexisting Steinberg theorem. |
| `Mathlib/LinearAlgebra/Basis/Flag.lean:40,65` | Basis flag and coordinate criterion; the package's small coordinate definition is headline scaffolding, not a second planned flag library. |
| `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75,88` | De Rham period rings, not B_cris^+ or B_st^+. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | Frobenius on an isocrystal; no automatic finite dimension, topology, monodromy or geometric realization. |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76` | Scheme cohomology, not analytic adic cohomology. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Jacobian/Basic.lean:110` | Jacobian coordinates for a Weierstrass curve, not the Picard/Jacobian functor of an arbitrary curve. |
| `TauCeti/Algebra/Quaternion/Steinberg.lean:14` | Quaternion-symbol relation, unrelated to generalized Steinberg representations. |

Object searches through `roadmaps grep` covered generalized Steinberg representations, graphs with legs, Jacobian periods, fundamental diagrams, Frobenius-fixed constructions and cpcf. The board index was read before checking the additionally present local ModpRepresentationsOfGL2OverLocalFields and PadicLocalLanglandsForGL2QpPartII packages. The generic crystalline/period/AΩ carriers stay with their named suppliers. The owned graph-with-legs complex and analytic adoc construction are different from the imported metric skeleton and formal-curve reconstruction. TropicalAndBerkovichArithmetic §7.5 concerns a valuation/graph Jacobian pairing, not the B_st universal-cover isomorphism here.

For the closest open heads: #1759's model-free dagger diagram has a different scope from arbitrary-C curves and the equivariant model-based diagram; agreement is a target here, with the defect R03. #1757 explicitly imports the tower components and arithmetic finite-presentation result and owns later finite-length/geometric multiplicity results. #1062 owns period/LL type input, #1064 proper comparison, and #1364 local Fontaine–Messing input, all cited rather than restated as general foundation projects. No second fully qualified Lean declaration or mutually handed-off owned object was found. The overlap file reports no shared head conflict, dropped cited id, or revision-only id; the inspected heads did not reveal one. R06 is ordinary locator drift, not a dropped-id overlap.

### Resolved supplier citations and order

The following ledger records current sections, not remembered numbering. Paths are relative to the roadmap repository; open-head numbers identify the inspected evidence, not proposed README citations. Section bodies, conventions and the important comparison/ownership clauses were read. R06 and R08 are the unresolved citation/contract repairs in this ledger.

| Supplier and inspected origin | Resolved anchors in its README |
| --- | --- |
| AdicEtaleGeometry, main | `TauCetiRoadmap/AdicEtaleGeometry/README.md:1703`, A1; corrected pro-étale site and projection in A1.10–A1.12. |
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:682,10053,11218`, F0,R3.4,R3.7. |
| AdicSpacesPartIV, main | `TauCetiRoadmap/AdicSpacesPartIV/README.md:3766,4090,4238,4515,4662,5594`, F1.5–F1.9,F1.11. |
| EnhancedDerivedSheaves; StableReduction, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1290,2031`, E2:towers and E2; `TauCetiRoadmap/StableReduction/README.md:372,405,621`, Layers1,2,7. |
| ClassicalAdicEtaleCohomology #875 | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:354,449,1917,2528,2617,3983,4557,5117,5213`, §§1.3–1.4,4.1,4.6–4.7, Layer8,9.1,9.6–9.7. |
| CrystallineCohomology #857 | `TauCetiRoadmap/CrystallineCohomology/README.md:8466,10029,11098`, CR.5.1,6.1,6.5; CR.4.7 at line 6621 supplies the general classification needed for R08. |
| AInfCohomology #1044 | `TauCetiRoadmap/AInfCohomology/README.md:1045,1898,2108,2658,2824,2901`, AI.1.2,3.1,3.2,6.1–6.3. `Semistable.aOmega` is a planned supplier name, not claimed native Lean. |
| PrismaticCohomologyPartIII #1070 | `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:213,536`, §§6.3,6.25, including the integral Artin–Schreier input. |
| LocallyAnalyticDistributions #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891,1081,1139,1147`, §§0.0,0.2,0.CR.6.6 and its nonproper finite-piece comparison in every dimension. |
| PadicPeriodRings #940 | `TauCetiRoadmap/PadicPeriodRings/README.md:417,470`, §§4.1,4.3; arbitrary-C/plus invariants are explicitly a gap. |
| VectorBundlesAndIsocrystals #1205 | `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:279,1341,1349,1625`, classification, BC dimension and the semistable period example. The classification's constant-field scope does not cover general k_C: R08. |
| PadicDifferentialEquationsAndRigidCohomology #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:7286,7324,7507,7772,7872,7978,13968`, RD.4.10,4.11,4.18,4.29,4.34,4.38,7.7. Last theorem concerns Frobenius; all-endomorphism extension remains a gap. |
| CohomologyComparisons #1064; CstConjectureForDaggerVarieties #1759 | `TauCetiRoadmap/CohomologyComparisons/README.md:800,887,915,925`, §§4.5,4.9a,4.11,4.12; `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:439`, §1.5. |
| CohomologyComparisonsPartII #1364 | `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:500,531,551,570,589`, §§4.1–4.5; formal transfer explicitly contracted as a gap. |
| EndoscopicTransferAndUnitaryTraceComparison #999 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4567,4593,4623,4652,4678,4704,4723,4787,4806,4841,4860,4962,4980,4997`, §§12.2–12.8,12.11–12.14,12.19–12.21. |
| HilbertModularVarietiesAndShimuraCurves #1005 | `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:1769,1793,1817`, R18.5.1–R18.5.3. |
| TropicalAndBerkovichArithmetic #1494 | `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:1237,1265,1279,1291,1316,1369`, §§2.11,2.13–2.17. |
| JacobianChallenge; ReductiveGroupsPartII, main | `TauCetiRoadmap/JacobianChallenge/README.md:218`, LayerD; `TauCetiRoadmap/ReductiveGroupsPartII/README.md:2831,3408`, RG2.2 and tree specialization. |
| AbelianSchemesAndArithmeticModuli #849; FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1868,2143,2241`, A4.2,A4.CR.7.2 and Grothendieck–Messing route; `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:3698,4057,4124,4325`, R07.2.20,2.25,2.26,2.28. |
| SmoothRepresentationsOfLocalGroups #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:581,1667,1908,3002,4446`, SR.0,0d,2, Steinberg and segment target; segment is SR.5.2, R06. |
| PadicHodgeTheory #1062; GL2AutomorphicRepresentationsAndTransfer #931; PadicLocalLanglandsForGL2Qp #1312 | `TauCetiRoadmap/PadicHodgeTheory/README.md:1016,1044,1378`, §§5.3,5.4,8.1; `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:951,961,971`, R16.3.1–3; `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:2311`, §6.9 general JL. |
| ModpRepresentationsOfGL2OverLocalFields, available package | `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:401,438,457,510,845,898`, §§0.3–0.5,0.7,2.4,2.6. |
| Downstream references, not suppliers | `packages/PadicLocalLanglandsForGL2QpPartII/README.md:564,710`, §§4.1,4.9; #1757 `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:240,754,799`, §§0.2,5.4,6.2. |

The three declared gaps have identical slugs in `design/plan.json` and the README's Exact supplier contracts: `formal-syntomic-period-comparison`, `period-rings-general-C`, `endomorphism-characteristic-polynomials`. Each has a named earlier owner and precise missing scope. The first extends the cited comparison to formal/weak-formal charts and finite base changes, with the two qualified bounds; the second extends the period carriers and needed plus-ring invariants to general C; the third extends Frobenius-polynomial equality to every endomorphism of an abelian variety. None was treated as an unowned prerequisite. They are not listed as conditional acceptance because this verdict is needs changes.

The exact prescribed dependency check completed with exit status 0:

```text
depcheck: 236 roadmaps, 2155 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The source-programme wording and mathematical adapter problem are not detectable by this graph check.

## Not verifiable

- **SS91:** Primary text unavailable under the settled uncertified entry. The recorded locators for Schneider–Stuhler were retained; CDN-STEIN Theorem 5.8 supplies a readable secondary verification, not a claim to have opened SS91.
- **IS01:** Primary text unavailable under the settled uncertified entry. The logarithmic-regulator account in CDN-STEIN was checked; the original locator remains uncertified.
- **DS01:** Primary text unavailable under the settled uncertified entry. GK05's cited Frobenius statements were read; this does not certify the original de Shalit proof.
- **NAK84:** Primary text unavailable under the settled uncertified entry. Its role in the finite-copresentation proof was checked through CDN23; its own locator was not independently certified.
- **KM74:** Primary text unavailable under the settled uncertified entry. The all-endomorphism supplier contract remains declared; the original theorem was not independently read.

These five statuses were supplied as settled. None was requested again or entered in a new missing-reference request. No other needed cached text was unreadable. A passing Lean elaboration is not a proof of the geometric theorems and was not used as one.

## Source issues

- **Misprint** in CDN-CURVES at §1.2.1, printed p.18, line 725: the source says the compact-support differential targets compact edges only; it should be all edges, including legs, as its cokernel formula already uses at line 729; affects nothing.
- **Error** in CDN-CURVES at §8.2.5, printed p.107, lines 4432–4437: the source says positive degree scales the additive coordinate while also imposing `Ng=p^deg gN`; it should be negative-degree scaling for additive action `exp(λN)`; affects a stated result.
- **Error** in CDN-STEIN at §5.2.2, printed p.38, line 1936: the source says the dual Steinberg quotient is the inverse limit of all flag-function duals; it should be the annihilator of relations, equivalently duals of their images in the quotient; affects a stated result.
- **Misprint** in CDN-DUKE at proof of Theorem 2.9 and Lemma 2.12, printed pp.9–10, lines 376,415–423: the source says ψ denotes `ξ^iφ⁻¹` and later uses ψ as `1−ξ^iφ⁻¹`; it should distinguish these operators and use the latter in the bijectivity argument; affects the proof.
- **Gap** in CDN20 at Remark A.2, printed pp.53–54, lines 2123–2133: the source says a connected Stein curve with a semistable model has only constant bounded functions; it should require the proper-component hypothesis used in the proof; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "582e21b48de4706672cd5854f1af13d9392d7a08", "job": "REV-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~3", "model": "gpt-6-astra", "worker": "chris-9"} -->
