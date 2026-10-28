<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1023#issuecomment-6397847297 -->
Review (codex) of 8a25c5e

Verdict: needs_changes

1. **F01** (P2) The holomorphy theorem allows a nonexistent auxiliary character outside GSpin

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1335`, “For unitary Hecke character θ ... form the normalized induced family”; :1337, :1369 and :1389–1391, “Assume the five split groups and the precise unitary/nonessential-self-duality hypotheses above.”

   **Claim:** An arbitrary unitary θ is an inducing datum for every listed family, and excluding essential θ-self-duality suffices for holomorphy on Re(s)≥0.

   **Witness:** CFK lines 1505–1507 and 1516–1518, Theorem 4.1, p.34, require θ=1 outside GSpin. For H=Sp₂, k=c=1, τ=1, a ramified quadratic θ passes the written exclusion but does not remove the usual Eisenstein pole.

   The Siegel Levi of Sp₂ is GL₁, with no additional G₀=GL₁ factor on which θ could act. Thus the proposed tensor datum is either ill-typed or ignores θ. Take the quadratic Hecke character of conductor 5. At a local unit u with θ(u)=−1, every norm character has value 1, so |det|^(it)τ≄θτ∨ for every real t. If θ is ignored, the series is the ordinary spherical SL₂ Eisenstein series. Its section has covariance |a|^(s+1) on diag(a,a⁻¹); the classical parameter is u=(s+1)/2. Its nonzero residue at u=1 becomes a nonzero residue at s=1 (6/π for the classical normalization with residue 3/π). This lies in the claimed holomorphic half-plane. Twisting τ by θ instead would define a different inducing family and would not repair the stated comparison.

   **Exact repair and retest:** In §8.1 require θ=1 for Sp and SO and allow arbitrary unitary θ only for GSpin. Carry this restriction through §§8.2–8.4, including their Checks and the base case. Keep the general local GL intertwiner contract, where arbitrary θ is legitimate. With θ=1 the counterexample τ=1 is essentially self-dual at t=0 and is excluded, so its pole is consistent with the corrected theorem. In the GSpin case the extra character remains a genuine Levi datum. Add this rank-one negative control; do not replace the theorem by a good-place statement.

2. **F02** (P1) The stated global period diverges for the included split SO₂ case

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1419`, “Outside GSpin this distinguished central torus is trivial. In a right half-plane the global integral unfolds”; also :29 and :1448, which explicitly retain a noncompact torus quotient in rank two.

   **Claim:** The unregularized integral over (C_G^•(A)G(F)⧸G(A))² is defined by an absolutely convergent integral in some right half-plane for every included cuspidal π and τ, and supplies the Euler identity used in §§9.2–9.4.

   **Witness:** Set F=ℚ, G=SO₂≃Gₘ, k=1, π=τ=1. Under SL₂×SL₂→SO₄, the Siegel parabolic pulls back to B×SL₂. The kernel ignores the second factor; its unremoved norm integral contains ∫₁ᴿdr/r=log R.

   Here U=1 and ρ₂(1) is the trivial representation of GL₂. On the determinant quadratic space Mat₂, the covering action is (A,B)X=A X B⁻¹. For A=diag(a,a⁻¹), B=diag(b,b⁻¹), the four weights are a/b, ab, (ab)⁻¹, b/a. Thus the two SO₂ coordinates of the doubled subgroup can be taken as t₁=a/b and t₂=ab, up to the fixed ordering/involution. Choose the Siegel parabolic corresponding to B×SL₂. Its inducing character and modulus are trivial on the second SL₂. The spherical Eisenstein series therefore depends on a and not b. For real parameter sufficiently far right it is positive and nonzero. Keeping a in a compact neighborhood of 1 and letting the infinite component b=r>0 vary leaves the integrand positive and independent of r. Finite central isogeny changes only a finite factor in this calculation. Rational points have idele norm 1, so this direction survives the quotient. On a positive-measure transverse neighborhood the truncated integral is at least C log R with C>0. It diverges for arbitrarily large real s.

   The trivial automorphic character of a torus is cuspidal: there are no proper rational parabolics. Its usual central-quotient Petersson pairing is nondegenerate. An abstract choice of that pairing does not give finite measure to the larger domain displayed here. If “Petersson pairing” is instead intended to require integration over that larger domain, the rank-two assertion becomes empty and conflicts with the explicit retained case. The supplier itself distinguishes these notions: `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:607` has the empty torus cuspidality test, and :626 says rapid decay holds only after the central quotient.

   The cited proof does not resolve this: GK lines 4161–4167, p.72, assumes a nontrivial unipotent subgroup before (3.8). Its low-rank discussion at GK lines 4193–4198, p.73, does not remove this k=1 norm divergence. CFK lines 1668–1693, pp.38–39, repeats the broad convergence assertion and has the same boundary problem. The earlier review's local test b_vZ_v=L_v, namely (4/3)·3=4, tests no global volume and does not settle this issue.

   **Exact repair and retest:** State §9.1's unregularized period theorem for the non-torus classical groups. Retain the full SO₂ and GSpin₂ L-function/transfer scope by adding an explicit all-place torus branch, consuming AutomorphicLFunctionsAndLocalFactors AL.1–AL.3 and its isobaric constructor. For SO₂ with character μ, prove the local L-, γ- and ε-factor comparisons with the two GL factors for μτ and μ⁻¹τ at every finite and infinite place. For GSpin₂ use the two standard dual-torus characters α,β, with αβ=χ_π, and prove the corresponding two factors, preserving the distinguished-center convention. Give completed continuation, functional equation, ramified-twist entireness and weak/coarse transfer from those products; carry that branch through §§9.2–9.4 and §§10.4–10.7. This imports existing torus/GL theory and retains bad and infinite places; it does not rebuild the suppliers or discard rank two. A period assertion for the torus would require a separately stated regularization theorem; simply dividing by one central volume is not an established repair.

   For the refuting SO₂ instance, the corrected torus branch gives Λ_ℚ(s)² with its actual poles and functional equation, and at q=2,s=1 gives L_v=4. It makes no finite-value claim for the divergent raw period. Add both log R divergence and the all-place product as discriminating Checks. The corresponding GSpin₂ leftover norm direction must be covered by the same explicit branch.

3. **F03** (P3) The HLS author-version page range is wrong

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1662`, “author text ... internal pp.1–72.”

   **Claim:** The linked author version has internal pages 1–72.

   **Witness:** HLS line 1 records 68 extracted pages; HLS lines 2737–2738 start the last page, whose printed internal number is 68. The published range 393–464 has 72 pages, but is a different pagination.

   **Exact repair and retest:** Change the author-version range to internal pp.1–68, or omit its total range. Keep the valid cited internal pp.43–50 and the distinct published range 393–464. The last-page test then reads 68=68; no change to the manifest's already correct local locator is necessary.

Three findings: one P1, one P2 and one P3; two blocking findings. The package is a repairable Part II extension. All seven findings of round 2 are repaired. The new blockers concern the domain of the Eisenstein holomorphy theorem and convergence of the global period at an explicitly included split-torus boundary. Neither is a re-raised settled finding. No mathematical package file was changed during this review.

## Verified sound

### Previous findings checked first

The repaired passages below were read before the new adversarial pass. Quotations are package text, not source passages. The phase, conjugation, coefficient-field, orbit-bound and ramification patterns were then searched throughout the package.

| Round-2 finding | Status | Repaired passage and independently recomputed witness |
|---|---|---|
| F01, scalar character and critical fiber | Repaired | README:597 gives “(−m+a_χ repeated n; m−b_χ repeated n)”; :722 gives “I_EHLS(χ_u⁻¹,t−n/2)”. At n=1,m=3,a_χ=2,b_χ=0, z=exp(iπ/4), both phases are i, whereas the old labels give −i. At B=2, both positive-Levi values are 1/16. Branching, opposite χ₀⁻¹ twist, projection and §§4.9–4.10 use the correction. |
| F02, inverse intertwiner | Repaired | README:436 types the returning character as “(χ^c)⁻¹”; :541 tracks “χ^c”. For χ(z)=z/abs(z), χʷ(i)=i but χ⁻¹(i)=−i; applying w twice gives χ. Both composites and ψ reversal are stated. |
| F03, Whittaker exactness bound | Repaired | README:105 requires “wave-front set is contained in the closure of O”; :866 places the constituents in this bounded category before applying exactness. For GL₄, (2,2) has prefixes 2,4; (4) has first prefix 4>2 and is excluded. The continuous-dual and inverse neutral-character conventions match GGS17 lines 241–252 and 1310–1326. |
| F04, precise contracts | Repaired | README:69 requires “each of the c successive highest Bernstein–Zelevinsky derivatives has order k”; :95 permits auxiliary ramification only where both comparison representations are unramified; :115 names both twisted-square factors and Re(u)≥0. §§10.5–10.6 separate the two globalization tasks. The cancellation test leaves zero uncontrolled factors; the trivial GL₁ symmetric-square pole is excluded at t=0. All resulting needs sentences match the plan. |
| F05, coefficient-field supplier | Repaired | README:61 retains “over ℂ”; :643–662 builds the “field-compatible Cauchy isomorphism” on pinned rational Weyl modules. Over ℚ(i), (1±swap)/2 have ranks 3 and 1 on (ℚ(i)²)⊗², and 10=9+1. No complex decomposition is falsely treated as a normalized ℚ(i)-form. |
| F06, conductor-one Check | Repaired | README:856 uses “exact conductor n≥2” over ℚ₂. Since ℤ₂×=1+2ℤ₂, conductor-one character count is 0; the extra K(m)-fixed lines for m=1,2,3 are 0,1,2. |
| F07, CPS94 locator | Repaired | README:1590 and :1666 and the CPS94 manifest entry use “pp.161–165”. CPS94 line 296 begins p.165; lines 298–311 contain the inverse-Satake argument. |

The older administrative G1–G6 issue remains settled for the reason accepted in round 2: these six unchanged records belong to immutable design coverage, while their operative obligations have local targets or named supplier contracts. Their absence from the named-contract list is not being used to conceal a new prerequisite. This review does not re-raise that settled administrative finding. In particular, the analytic comparison, theta nonvanishing, auxiliary uniqueness and k=1 pole-attainment obligations are explicit targets, not claims that an unread reference has supplied a proof.

### Coverage and principles

I read all 62 numbered targets, their API paragraphs and Checks, all 62 Needs lines, the conventions and ownership statements, and all 11 layer Examples/Dependencies endings. The 31 definition-bearing Checks blocks each have at least three bullets. The prior review has computed target and individual-API tables; unchanged text was retained only where such numerical or symbolic rows exist. All repaired text, the fifteen seeded targets and every target affected by the new findings were reread. In particular, the prior §8.4 test verified the exclusion but not the available Levi datum, and the prior §9.1 test verified a local Euler factor but not convergence; the new tests below replace those insufficient controls. Arithmetic examples are falsification tests, not proofs of analytic theorems.

The scope genuinely extends AutomorphicLFunctionsAndLocalFactors and imports its GL factors and isobaric machinery. No route-specific good-prime restriction, re-planned base roadmap, executable algorithm, copied source passage, admitted data or set_option was found. Bad places, dyadic places and archimedean factors remain in scope. The two blockers are repairable hypotheses/construction-domain defects, not grounds to reject the direction of the roadmap. The README has the required summary, ownership, conventions, supplier contracts, layer structure, downstream discussion and references. metadata.toml specifies math.NT. No source manifest entry was removed, rewritten or added in this review.

### Seeded source verification

The locators below refer to the exact cached versions identified by sources.toml: CFK arXiv v5, MODELS v1, GGS17 v5, published EHLS, and the internally paginated HLS author version. The page is the page printed in the version read, not an inferred journal-page offset. All fifteen seeded passages were readable. “Supported” below distinguishes the stated result from additional normalization comparisons that the package explicitly undertakes to prove.

| Target | Passage opened | Hypotheses, formula and result of comparison |
|---|---|---|
| 0.1 doubled Hermitian space | EHLS §4.1.1, pp.43–44, lines 1862–1880 | Polarization and Levi checked. The unrescaled cross-pairing is 2h; the radical is skew-adjoint. The package corrects the Hermitian-coordinate slip and separately treats zero rank and split étale coefficients. |
| 0.3 classical groups and degree | CFK §1, pp.6–8, lines 250–304 | Five dual groups, N=2⌊c/2⌋ except Sp where N=c+1, and the distinguished GSpin center agree. The c=2 center distinction is real; it does not prove convergence in §9.1. |
| 1.3 unitary Eisenstein continuation | EHLS §4.1.2, pp.44–45, lines 1882–1906; HLS §3.1.1, p.43, lines 1707–1726 | Inducing characters and variable change checked. The package uses the discrete-unitary-data supplier for continuation and unitary-axis regularity, not a new general residue construction. The conjugate inverse is retained. HLS's narrower pole description is not generalized. |
| 2.2 unitary denominator | EHLS §4.2.1, (53), pp.48–49, lines 2081–2113 | Parity, norm, shifts and correction to HLS checked. The χ⁻¹ right-action comparison is a separately named target, not a claim that the source prints χ⁻¹ in that formula. |
| 2.3 spherical formula | EHLS §4.2.1, pp.48–49, lines 2088–2108 | Unramified data, spherical vector pairing and measure normalization retained. The split rank-one geometric sum and nonsplit parity discriminate inverse conventions. The nonsplit full local proof is not certified by these displayed formulas alone. |
| 3.1 unitary global identity | EHLS §4.1, pp.47–48, lines 2005–2045; HLS §3.1.2, p.45, lines 1791–1819 | The package keeps the vector pairing and removes the false inference from a zero evaluation pairing to a zero translated coefficient. Factorization and finite bad-place factors have explicit measures. |
| 4.9 critical archimedean nonvanishing | EHLS §4.4, pp.80–81, lines 3684–3699; HARRIS Remark 4.4(iii)–(iv), pp.27–28, lines 1184–1196 | Holomorphic theta-image input, nonzero selected vectors and projection are required. Nonzero arbitrary theta correspondence is not substituted for the specified critical section. The exact critical-fiber and rational-kernel comparisons remain targets. |
| 5.1 (k,c) character | MODELS §2, equation (2.1) and Definition 1, pp.2–3, lines 71–100 | Adjacent c×c traces, radical type (c^k), orbit (k^c), and diagonal GL_c stabilizer checked. k=1 is allowed and has trivial unipotent character. |
| 6.9 tempered holomorphy and pole comparison | CFK Theorem 3.8 and following comparison, p.18, lines 711–724 | Tempered, unitary and positive-exponent hypotheses are not interchanged. The open half-plane is distinguished from the imaginary boundary; the Langlands positive block is nonempty when that comparison is used. |
| 6.10 highly ramified stability | CFK Theorem 3.10 and surrounding discussion, p.18, lines 725–737 | Fixed generic test, central-character compatibility, nongeneric GL comparator and ramification threshold checked. The assertion is read in CFK; the proof attributed to CFK22 is settled uncertified. |
| 8.4 Eisenstein holomorphy | CFK Theorem 4.1, p.34, lines 1505–1518; proof pp.36–38, lines 1592–1667 | The source explicitly restricts θ outside GSpin. The package omits that hypothesis: R01. The residual exponent and unitary-boundary arguments otherwise retain their inputs. |
| 8.5 normalizer holomorphy | CFK proof of Theorem 4.8, pp.39–40, lines 1725–1729; formula (3.3), p.14 | Twisted symmetric/exterior-square factors and essential-duality exclusion match the precise named contract. Their smallest square argument has real part ≥1; the Sp-only standard argument has real part ≥3/2. |
| 9.1 global period/unfolding | CFK §4.3, (4.10), pp.38–39, lines 1668–1708; GK §3.2, (3.8), pp.72–73, lines 4161–4198 | The measures, involution and formal Euler identity are identifiable, but the source proof's nontrivial-unipotent assumption is lost at the included split-torus boundary. Direct divergence: R02. |
| 9.4 highly ramified entireness | CFK Theorem 4.8 and proof, pp.39–40, lines 1719–1746 | Unitary hypotheses, duality exclusion, local pole attainment and meromorphic-order inequality checked. The all-place proof must acquire R02's torus branch; a local order computation alone does not repair its divergent global input. |
| 10.5 weak implies coarse everywhere | CFK Theorem 4.10 and proof, p.41, lines 1792–1815 | Stabilization occurs only after central-character matching. The repaired GL test contract makes all auxiliary ramification common-good and leaves exactly the isolated factor. The proof is structurally supported; torus cases still depend on R02's global repair. |

Also reread: EHLS lines 3281–3441 and 3675–3683 for the compact-label and critical-fiber repairs; MODELS lines 108–128 and 194–222 and GGS17 lines 219–252 and 1310–1326 for derivatives and bounded exactness; CPS94 lines 272–311 for both Satake bounds; ADAMS14 lines 46–60 for the fundamental-Cartan involution; HEN02 lines 216–219 for the support conclusion; GARRETT lines 176–197 for the specified Haar model, rational scalar and continuation caveat. GARRETT's auxiliary convergence parameter is not silently identified with the doubling parameter.

### Computed adversarial table

This compact table records the requested sample, all headline groups, repaired conventions and all finding targets. Other unchanged target/API rows were checked against the previous round's computed ledger as described above; a duplicate per-API catalogue is not reproduced. In the values column, alternatives after “wrong” are negative controls. “Compatible” means this instance agrees, not that an unread primary proof has been certified.

| Statement | Instances tried | Values computed on both sides / negative control | Result; required change |
|---|---|---|---|
| Standing field, rank and measure conventions | ℚ₂, ℚ₃, ℂ/ℝ, split F×F; zero module | q=2,3; norm_ℂ(2)=4; norm(2,1/2)=1; split idempotent product=0; U(0)=1, multiplier-recording GU(0)=Gₘ. q=1, zero ring and inseparable quadratic algebra fail hypotheses. | Compatible; residue characteristic 2 is retained. |
| 0.1 doubled form | h=[1], vectors (1,−1),(1,1); (u,v)=(3,1) | Cross-pairing=2; coordinates (1,2) reconstruct (3,1). X=1 has X+X*=2≠0 and fails the unrescaled radical condition; X=i gives 0. | Compatible; no silent Hermitian-coordinate identification. |
| 0.2 modulus, reused in 1.1 and 4.8 | n=1, B=2, λ=1 or 4 | δ_mod=1/4 or 1; inverse convention gives 4 in the first case. At s=0,χ=1, covariance=1/2. | Compatible; use actual conjugation determinant. |
| 0.3 standard degree/central determinant | Sp₂, SO₃, GSpin₅; GSpin₂ | N=3,2; det(tI₄)=t⁴=(t²)²=χ². GSpin₂ center dimensions: full 2, distinguished 1, quotient 1. | Algebra compatible; leftover global norm direction fails in R02. |
| 1.3 continuation and Weyl character | χ=norm^i; s_U=1/4 | At B=2: 4^i→4^(−i)→4^i. z=3/4→1/4, hence s_U→−1/4. | Compatible; returning fiber typed. |
| 2.2 unitary denominator | q=2, trivial χ, n=0,1,2 | d₀=1; d₁(0)=2; d₂(0)=(4/3)(2/3)=8/9. Dropping quadratic parity gives 8/3. | Compatible; empty product and nonsplit sign retained. |
| 2.3 spherical normalization | Split rank one, X=1/2,Y=1/3 | Z=(1−XY)/((1−X)(1−Y))=5/2; d=(1−XY)⁻¹=6/5; dZ=3=L. | Compatible. |
| 2.4 local functional equation | χ(z)=z/abs(z), z=i | χʷ(i)=i; χ⁻¹(i)=−i; (χʷ)ʷ(i)=i. Both typed inverse composites are identity. | F02 repaired; angular test distinguishes conjugation. |
| 3.1 pairing and zero case | S₃ standard plane; v=(1,−1,0), ℓ=x₃ | ℓ(v)=0 but ℓ((23)v)=−1. For a fixed-vector compact subgroup of volume 1, pairing 2 gives local integral 2, not 1. | Compatible corrected statement; source errors are not copied. |
| 3.2 MVW | U(1) weight 2 at exp(iπ/4); GL₂(ℝ) rotation | i becomes −i under duality. For 2R_(π/2), inverse-transpose=R_(π/2)/2; conjugating by diag(1,−1) gives R_(−π/2)/2. | Compatible; fundamental-Cartan inner adjustment retained. |
| 3.3 Garrett pullback | Order-three character; section scaled by 2 or zero | Output character ζ₃ differs from dual ζ₃²; section 2f gives 2T(f); zero gives 0. | Compatible; no unsupported universal nonvanishing. |
| 3.4 completed unitary function | Angular character; reflected standard variable | Original χ⁻¹(i)=−i, returning χ^c(i)=−i; conjugate base-change/dual comparison gives the dual factor. z=3/4 reflects to 1/4. | Compatible after F02; exact local scalar remains a construction target. |
| 4.1 positivity; 4.2–4.3 scalar model/injection | a=b=1; n=1,m=3,a_χ=2,b_χ=0 | κ=(1;−1) has gap 2 and μ=0; κ=0 has gap 0<2. Generator (−1;3) gives z²=i at z=exp(iπ/4); old swapped type gives −i. Generator evaluation=1, zero map=0. | F01 repaired; positivity and phase independently discriminate. |
| 4.4 Cauchy decomposition and rational projectors | Degree 2, two 2-dimensional factors over ℚ(i); empty variables | Dimension 10=3·3+1·1; projector ranks 3,1. u=0,d=0 gives dimension 1, u=0,d>0 gives 0. Noncommuting shear pullback at I gives [[1,−1],[−1,2]], wrong order [[2,−1],[−1,1]]. | F05 repaired; E-linear normalization is an actual target. |
| 4.5 branching/opposite twist | n=2,a=b=1,m=3,a_χ=2,b_χ=0,r=1,s=0 | Generators (−2;3),(−1;4); transported dual (−3;2)+2=(−1;4). Central sums 1+3=4; z=exp(iπ/8) gives i, wrong twist gives −i. | F01 propagated correctly. |
| 4.6 raising operators; 4.7 projection | r=(1,1), matrix [[1,2],[3,4]]; degree-zero target line | Δ₂=−2, wrong Δ₁²=1; weighted degree=2, unweighted differences=1. Projection coefficient 1 becomes 1/2 when target vector doubles; zero projection gives 0. | Compatible; partition degree and normalization fixed. |
| 4.8 critical fiber | n=1,m=3,a_χ=2,b_χ=0 | t=2, s_crit=3/2; J_χ(m(2,1))=1/16=(1/2)4^(−3/2). Unit-circle phase i=χ_u⁻¹(z), wrong χ_u(z)=−i. | F01 repaired in both independent directions. |
| 4.9 nonvanishing; 4.10 normalized algebraicity | Scalar disk, m=2; compact signature; Haar rescaling | 2π∫₀¹r dr=π≠0; π⁻¹I=1; Haar×2 gives 2. ab=0 gives period power 1. Zero paired vector gives 0 and is excluded. | Compatible; the prescribed projection and Haar comparison remain essential. |
| 5.1 unipotent character | k=3,c=1; adjacent entries (1/8,1/4),(3/8,1/2) | Product adjacent trace=5/4, so exp(2πi·trace)=i. The top-right cross term is 1/16 and is omitted; including it gives exp(2πi·21/16)≠i. k=1 gives character 1. | Compatible; wrong-root character rejected. |
| 5.2 model, support, exactness | GL₄ orbit (2,2), generic orbit (4); GL₂ determinant character; ℚ₂ conductors | Prefixes 2,4 versus first prefix 4>2. Determinant-character rectangular model dimension 1, ordinary Whittaker dimension 0. Added K(m)-fixed dimensions for m=1,2,3: 0,1,2; conductor-one count 0. | F03/F04/F06 repaired; finite length only where stated. |
| 5.3 root elimination | k=2,c=3,l=1; determinant norm 1/2 | Exponent (6−2−3+1)/2=1; Jacobian=1/2, inverse convention=2. At c=2,l=1, permutation (1,2,3,4)→(1,3,2,4) is still nonidentity. | Compatible. |
| 6.1–6.4 local integral, uniqueness, normalization | k=1; SO₂ trivial spherical data, q=2,s=1; rescale functional by exp(s) | Inner U integral becomes evaluation; L=4,b=4/3,Z=3. Zero section=0. Open-orbit Schur Hom dimension 1 for equal irreducibles, 0 for distinct ones. Functional rescaling changes C by exp(2s−1), equal to exp(−1) at 0. | Compatible local controls; does not certify the full conormal proof or global convergence. |
| 6.5–6.7 local factors and equations | Dyadic/odd c=2,k=1; ψ_b over ℝ; reciprocal polynomial | The |2|-dependent scalar is 2 over ℚ₂, 1 over ℚ₃ at s=1. N=3,k=1,b=2 gives norm factor 1 at s=1/2 and 2^(3/2) at s=1. P=1−2X has P(0)=1, reciprocal 2 at X=1/4. | Compatible; central factors and monic normalization retained. |
| 6.9 tempered holomorphy/poles | SO₂ trivial tempered π; a=1 positive block | (1−2^(−s))⁻² has pole at s=0 and value 4 at s=1; 0 is outside Re(s)>0. The remaining positive-shift Tate factor at s=1 is L(2)=4/3. | Compatible; strict half-plane and sign distinguished. |
| 6.10 stability | Deep ramified rank-one twist; GSpin₅ | Invariant dimension 0 gives L=1. Standard determinant χ², not χ, in degree 4; mismatched determinant fails the comparison hypothesis. | Compatible statement; CFK22 primary proof unread. |
| 7.1–7.2 auxiliary integral/equation | k=1,c=2 and k=2,c=1; sign characters | Exponents s+1/2 and s−1/2. GL₁ sign gives central sign −1 for k=2, +1 for k=3; sign∘det on GL₂ evaluates to +1 at −I₂. Uncut k=c=1 shell tails demand both Re(s)>0 and Re(s)<0. | Compatible; Schwartz cutoff and central sign necessary. |
| 7.3–7.6 pole domination/attainment | Germs t⁻¹,t⁻²; s_G=1/2 | Common pole order 2 gives quotients t,1. L_RS/auxiliary=t, reverse=t⁻¹. Attainment orders −2≤−1 permit quotient t⁻¹; supplier parameter is 0. | Compatible; no finite 0/0 or reversed divisibility. |
| 8.1–8.4 Speh series and holomorphy | H=Sp₂,k=c=1,τ=1,ramified quadratic θ; c=2 residual bound | θ(u)=−1 versus norm(u)^(it)=1, yet ignored θ leaves residue 6/π at s_E=1. For c=2,Re(s₀)=1/4 the partial sums are ≤−3/4,−1/2; at 0 the last bound is 0. | R01: require θ=1 outside GSpin; residual arithmetic itself agrees. |
| 8.5 normalizer | c=2,s=1/2; τ=χ_π=1 on GL₁ | Square arguments 1,2; Sp standard argument 3/2. Untwisted symmetric-square has a pole at 1 but violates exclusion at t=0; exterior-square dimension 0 gives factor 1. | Compatible exact contract; no assumed boundary nonvanishing from Euler convergence alone. |
| 9.1 global period | SO₂,k=1,π=τ=1; b=r in the second SL₂ cover factor | Positive kernel is constant in r. Truncation ≥C log R→∞, versus the asserted finite period. Local (4/3)·3=4 remains true. | R02: full torus branch, not a local-factor change. |
| 9.2 completion; 9.3 functional equation/strips | Move a good factor 2 into S; rational b=2; trivial SO₂ completion | Removing then reinserting gives (1/2)·2=1. Global norm product 2·1/2=1; real-only idele gives 2. Λ(s)²=Λ(1−s)², ε=1, but pole at 1 prevents applying an entireness-dependent strip theorem. | Formal identities compatible; torus continuation route requires R02. |
| 9.4 entireness | Meromorphic local order test; ramified torus factors | ord Q=−1, ord(b^S Z)=0 imply ord L=1≥0. Deep ramified rank-one local L=1. | Order argument compatible; apply only after a valid global realization or explicit torus product. |
| 10.1–10.2 weak/coarse definitions | Sp₂ identity; GL₂ trivial versus Steinberg | Standard polynomial (1−T)³; trivial and Steinberg share support {ν^(1/2),ν^(−1/2)}, but Whittaker dimensions are 0,1. Cancellation (1−x)/(1−1/x)=−x. | Compatible; support is not an isomorphism assertion. |
| 10.3 converse headline | N=2,3; Satake bound exponent σ₀ | Test ranks {1} or {1,2}. Prime summation requires σ₀+1/2−σ<−1, hence σ>σ₀+3/2; determinant modulus 1 gives inverse bound q^((N−1)σ₀). | Compatible; CPS94 p.165 included. |
| 10.4 weak transfer headline | Squaring a deep local character at p=2 or odd p | Over ℚ₂, m≥4 gives conductor m−1≥3; at odd p deep conductor m stays m. A ramified unit value cannot equal an unramified norm twist. | Compatible twist construction; global torus case needs R02. |
| 10.5 all-place coarseness | T={v₁}, isolated v₀, auxiliary w common-good, η_v₀=1 | v₁ cancels by stability, w by the unramified comparison for arbitrary generic tests; uncontrolled factors away from v₀=0. Permitting ramification at v₁ would leave 1. | F04 repaired; central matching precedes stability. |
| 10.6–10.7 local/general automorphic transfer | One GL₁ block and formal rank-zero tail | N=N₀+2l; Sp tail 1 plus 2 gives 3, SO tail 0 plus 2 gives 2. Unitarizing twist then inverse gives total exponent 0. | Compatible; support/induction imported, torus branch must propagate. |
| R03, HLS pagination | Last author-version page | Last printed internal page 68 versus claimed 72; cited subsection pages 43–50 exist. | Correct total range only. |

### Pinned-library duplication and carrier audit

Pins read from lake-manifest.json: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches were by objects and hypotheses, including block/adjoint algebra, Clifford units, Young symmetrizers, polynomial decomposition, smooth admissibility, Harish–Chandra/Casselman–Wallach carriers, Whittaker/Speh models, Eisenstein families and doubling factors. The following declarations were opened, not inferred from their names.

| Pinned declaration and repository file | What it supplies and does not supply |
|---|---|
| Matrix.fromBlocks, `Mathlib/Data/Matrix/Block.lean:45`; Matrix.fromBlocks_multiply, :213 | Rectangular block constructor; multiplication with finite contracted indices and nonunital nonassociative semiring. No Hermitian or group hypotheses are built in. |
| Matrix.conjTranspose, `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43`; Matrix.IsHermitian, `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44` | Star-transpose and the equality Aᴴ=A. Neither positivity nor nondegeneracy is implicit. |
| Matrix.trace, `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`; AddChar, `Mathlib/Algebra/Group/AddChar.lean:70` | Finite diagonal sum; algebraic zero/addition laws. AddChar does not include continuity, nontriviality or unitary values. |
| lipschitzGroup and spinGroup, `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:61`, :292 | Generated Clifford-unit group and even star-unitary carrier. These are not reductive group schemes or pinned root data. |
| CliffordAlgebra.mem_lipschitzGroup_iff_involute_act_ι_mem_range_ι, `TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/CliffordGroup.lean:138` | Vector-preservation comparison, with field, finite-dimensional, invertible-2, nondegenerate and represented-unit hypotheses. The package preserves them. |
| TauCeti.YoungTableau.weylModule; TauCeti.weylModuleOfShape; TauCeti.weylRepOfShape, `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:130`, :429, :441 | Image of the rational Young symmetrizer and its GL action over a commutative ℚ-algebra. No general Schur functor or selected two-factor polynomial Cauchy isomorphism is supplied by these definitions. |
| TauCeti.isIrreducible_weylRepOfShape_iff, `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Irreducible.lean:160` | Characteristic-zero field; irreducible exactly when row count ≤n. The coefficient-field repair uses the actual hypotheses. |
| Rep, `Mathlib/RepresentationTheory/Rep/Basic.lean:30`; FDRep, `Mathlib/RepresentationTheory/FDRep.lean:63` | Rep bundles a module and algebraic action; FDRep uses Action on FGModuleCat. No local-field smooth admissibility, Casselman–Wallach topology or automorphic occurrence is included. They do not make the seventeen analytic/automorphic headlines statable by a few simple definitions. |

No duplicated native API block or conflicting fully qualified declaration was found. Suggested.lean declares nothing, so its declaration-collision set is empty. The general-field Cauchy comparison is supporting mathematics on the pinned Weyl modules; its holomorphic realization is the new target. It is not a second Weyl-module constructor.

### Resolved suppliers, ownership and order

The supplied content checkout was inspected at `2916f4d2e03ea18d2501288fb1a055372684d120`. Existing roadmaps were read there, not replaced by open revisions. For new roadmaps, the required roadmaps list/grep/show tools resolved the indexed heads. The citation resolver searched main `86e155c` and 362 indexed heads dated 2026-10-25T11:51:01Z and reported no missing roadmap/name; its inability to inspect local Lake packages was covered by the direct pinned reads above. Resolver success was used only as a lead, not as proof of each contract.

Repository locations below use `TauCetiRoadmap/<Supplier>/README.md`; the ClassicalGroups path is `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md`. The line anchors are in the actual files, excluding the tool's provenance header.

| Supplier | Sections opened and boundary resolved |
|---|---|
| ReductiveGroups; OrthogonalSpinGroups | ReductiveGroups Layer 7 (:627), rational parabolics/Levi; OrthogonalSpinGroups Layers 0–1 (:306 onward), general-field SO/Clifford action. These do not supply arbitrary quadratic-étale U/GU or GSpin schemes. |
| RepresentationTheory/ClassicalGroups | Conventions :28 and :34 fix ℂ; Layers 2–3 (:216, :237) supply complex Schur/highest weights. The package now cites pinned rational Weyl modules for other coefficient fields. Two main roadmaps' shape, including this one and OrthogonalSpinGroups, was also compared with the house form. |
| ReductiveGroupsPartII | RG2.0.1–0.2 (:463, :590), RG2.0a (:943), RG2.4.4 (:6213), RG2.5.1–5.2 (:6724, :6931): topology, restriction of scalars, decompositions, dual/L-group of a supplied group. The concrete U/GU/GSpin models remain declared extensions. |
| SmoothRepresentationsOfLocalGroups | SR.0.4 (:800); SR.2.1–2.3 (:1833, :1962, :2122); SR.3.3 (:2768); SR.4; SR.5.2 segment-representations and SR.5.3 mirabolic-derivatives/highest-derivative-adapter (:4716). Right translation, modulus square root and submodule/quotient conventions match. No orbit-bound theorem is inferred from ordinary Jacquet exactness. |
| AdelicAlgebraicGroups | §§0.1–0.4, AA.1, §§2.2–2.3 (:1648, :1815) provide product/quotient measures with their hypotheses. The split-center distinction in §2.1 (:1437) does not imply finite volume for an unremoved norm direction. R02 identifies the misuse, not an absent supplier section. |
| GL2AutomorphicRepresentationsAndTransfer | R16.1.8 (:579), finite-image full-local-component prescriptions, trivial infinity, auxiliary finite ramification and increased order. It does not supply supercuspidal globalization. |
| AutomorphicLFunctionsAndLocalFactors | Representation prerequisites (:271 isobaric sum), AL.0–AL.4; AL.3 strong multiplicity one (:2272; isobaric :2288). Generic pair factors, Fourier theory, Satake bounds and the existing converse families are imported. This package's fixed-twist outside-S converse has a different test family. |
| AutomorphicFormsOnReductiveGroups | §§2.1–2.7 (:288–459), §§3.4–3.5, §§4.1–4.3 (:596–632), §§5.3–5.4 and 6.1–6.2. Harish–Chandra/real induction/globalization, actual cuspidal occurrences and rational compact structures exist as targets. §4.2's occurrence adapter does not assert the two prescribed-local existence contracts; those are declared separately. |
| AutomorphicSpectralTheory | §§1.1–1.4, 2.1–2.6, including 2.3a (:1587), 2.4 (:1600), 2.4a (:1619), 2.5 (:1638); §4.14a (:2522); Layer 4; §5.12 (:2903). Discrete-data continuation and unitary-axis regularity, residual Speh and cuspidal support are present. The additional pole, support and normalizer inputs are named gaps. |
| EndoscopicTransferAndUnitaryTraceComparison | §5.1 (:1890) uses the same residual Speh object; §10.29 (:4052) defines canonical nongeneric GL factors by Langlands/segment data. Its global endoscopic transfer is not consumed here. |
| GeometryOfNumbersAndQuadraticArithmetic | §2.9 (:1194) supplies the initial field-with-involution Hermitian carrier and adjoint. Its later odd-residue-characteristic classification is not imported as a dyadic theorem. |
| MetaplecticAutomorphicForms | §3.2a (:606), §§3.3/3.3b (:618/:646), §§3.5–3.7, §3.15 (:732), §6.2 (:1553), §§6.10a–6.11 (:1674/:1688): split étale carrier, oscillator/theta, finite-place MVW, standard doubling/gcd and completion. Real MVW, the EHLS right-action dictionary and the specified holomorphic critical vector remain distinct comparisons. |

Ownership searches used the required indexed roadmaps tools and local object searches. The board package index was read first. All 20 listed board heads were inspected: five had package READMEs and fifteen exposed design READMEs rather than the proposed package README. No absence of a package README was treated as absence of the roadmap. Relevant adjacent work included ClassicalGroupsPartII, OverconvergentAutomorphicForms, GanGrossPrasadUnitaryGroups, AutomorphicCongruences and the EndoscopicTransferAndUnitaryTraceComparisonPartII design. Their rational GSp, overconvergent, GGP, congruence and Fourier–Jacobi directions do not duplicate this package's EHLS critical-section comparison or nongeneric doubling transfer. The algebraic constructors, general Eisenstein theory and canonical GL factors remain owned by the suppliers above. Ownership against separately named open pull requests without supplied files was not checked beyond the authorized indexed search; no independent checkout or undisclosed head was sought.

All 62 Needs lines and supplier citations were checked against these sources and the layer order. No new upward citation, cycle, fictitious section or duplicated owner was found. The required dependency command exited 0. Its complete output was:

```text
moved: AutomorphicLFunctionsAndLocalFactorsPartII moved in the merge order from #26 to #167, right after its last supplier MetaplecticAutomorphicForms (SmoothRepresentationsOfLocalGroups, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups, GeometryOfNumbersAndQuadraticArithmetic, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, EndoscopicTransferAndUnitaryTraceComparison also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 51 roadmaps, 590 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The permitted moved placement is not a defect. The merge-order file was not edited.

### Declared-gap audit

There are 21 named supplier contracts, all with exactly matching slug, supplier and needs sentence in `packages/AutomorphicLFunctionsAndLocalFactorsPartII/design/plan.json` and README's Exact supplier contracts. I checked the requested hypotheses and the boundary with the supplier's existing targets. These are future supply contracts, not findings for absent implementation. The six legacy G records are treated as the settled coverage records described above.

| Named gap(s) | Precision/minimality check |
|---|---|
| hermitian-unitary-groups; gspin-group-schemes | Native form/Clifford carriers are consumed; the missing group schemes, base change, embeddings and pinned central/root data are requested. Rank zero and split étale cases are explicit. |
| classical-support-quotient | Requests the quotient realization with Weyl-conjugate support and central twists, rather than a duplicate classification. |
| rectangular-orbit-support | Fixes field, finite length, successive highest derivative orders, terminal dual and orbit vanishing. A generic GL₄ representation fails the order-2 hypothesis at its first order-4 derivative. |
| standard-archimedean-transfer | Specializes real/complex parameters to the five standard representations and determinant/infinitesimal-character compatibility; no new real classification. |
| opposite-unipotent-estimate | Tempered σ, positive open chamber, specified smooth vectors and continuous pairing are explicit. Rank-one chamber boundary has logarithmic divergence, so it is correctly excluded. |
| real-chevalley-contragredient | Uses inversion on a fundamental Cartan, not merely a split torus. ADAMS14 Theorem 1.2/Corollary 1.4 has this hypothesis. |
| prescribed-classical-supercuspidal-globalization | Specifies local field, unitary norm twist and compatible global central character before asking for the classical cusp occurrence. |
| controlled-gl-test-globalization | Separately specifies the GL test, forbidden finite set and common-good auxiliary ramification; no uncontrolled bad-place factor remains in §10.5. |
| archimedean-wavefront-whittaker; archimedean-induced-wavefront | Requests orbit detection and induction of maximal orbits/additivity separately; ordinary smooth representation categories do not already contain these assertions. |
| archimedean-derivative-models; archimedean-degenerate-derivative | Separates the repeated derivative-to-model comparison from the explicit derivative of the degenerate induction. Sizes kc and k(c−1), and dual conventions, are fixed. |
| archimedean-whittaker-exactness | Restricts to M≤O/M<O and specifies a contravariant continuous functional functor. The larger-orbit negative control is excluded. |
| eisenstein-pole-cuspidal-detection | Requests equality of pole orders at the stated cuspidal-support constant term, not arbitrary constant-term detection. |
| speh-cusp-normalized-intertwiner | Gives the actual source/target, ratio L(2s+c′)/L(2s), c′≥1 and strict half-plane Re(s)>(1−c′)/4. |
| twisted-square-normalizers | Names the two partial factors, finite S, unitary hypotheses and every-real-t exclusion; wedge²GL₁ has factor 1. |
| hermitian-residual-support | Requires a nonzero square-integrable form and compares the precise Hermitian dual datum, not merely unitarity of an abstract module. |
| automorphic-constituent-support | Requests passage from the supplied support decomposition to an actual irreducible constituent of normalized cuspidal induction. |
| gamma-supercuspidal-support | Only the support-detection implication is requested; the reverse follows from the supplied segment-factor formula. Test ranks 1 through N−1 and N≥2 are explicit. |
| nongeneric-pair-epsilon-character-change | Supplies the nongeneric extension with ω_Π(b)^k, ω_τ(b)^N and norm exponent Nk(s−1/2); generic CPS94 alone is not asserted to cover it. |

These 21 contracts could support conditional acceptance after the blockers are fixed. No conditional_gaps list is attached to this needs_changes verdict.

### Headline and Lean acceptance audit

The README's end results and the corresponding module-docstring entries are:

| Headline | README target(s) | Missing substantial carrier at the pins |
|---|---|---|
| Unitary Siegel continuation/functional equation | 1.3 | Normalized unitary induction and automorphic Eisenstein families |
| Unitary local equation and exact spherical scalar | 2.2–2.4 | Admissible unitary representations, section families, intertwiners and factors |
| Global unitary doubling and Garrett pullback | 3.1–3.3 | Cuspidal adelic unitary occurrences, Petersson realization and kernels |
| Completed meromorphic unitary standard function | 3.4 | Those automorphic carriers and ramified unitary factors |
| Holomorphic injection, branching and nonzero projection | 4.3–4.7 | Harish–Chandra modules, holomorphic discrete series and compact-type branching maps |
| Critical nonvanishing and normalized algebraicity | 4.8–4.10 | Critical induced-fiber comparison and rational projected-kernel integral |
| (k,c) model/support/root elimination | 5.1–5.3 | Smooth/Casselman–Wallach GL modules, Speh and generalized Whittaker objects |
| Generalized local continuation, uniqueness and equation | 6.1–6.6 | Classical normalized induction, equivariant continuous Hom spaces and factors |
| Highly ramified local stability | 6.10 | Those factors and canonical nongeneric GL factors |
| Auxiliary pole domination and pole attainment | 7.1–7.6 | Speh matrix-coefficient integral families and Langlands data |
| Speh Eisenstein holomorphy | 8.1–8.5 | Residual automorphic data, Eisenstein families and support exponents |
| Global unfolding, functional equation and strips | 9.1–9.3 | Cuspidal classical occurrences and completed doubling factors |
| Highly ramified global entireness | 9.4 | Same completed automorphic factors |
| Fixed-twist outside-S converse | 10.3 | Admissible adelic GL modules, automorphy and pair completions |
| Nongeneric cuspidal weak transfer | 10.4 | Classical/GL automorphic modules, Satake and archimedean standard transfer |
| All-place coarse compatibility/local existence | 10.5–10.6 | Supercuspidal support and gamma tests on those actual carriers |
| Weak transfer of every irreducible automorphic module | 10.7 | Automorphic support realizations and GL isobaric induction |

All seventeen appear in the single module docstring at `packages/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean:11` onward with the stated missing carriers. None is replaced by a free predicate, scalar manipulation, bounded substitute or boundary-case theorem. The native matrix and rational Weyl carriers make some supporting algebra statable; they do not make these analytic/automorphic headlines statable by a few simple definitions.

The required `lake env lean` invocation used the absolute filename as instructed and ran from the pinned content checkout. It exited 0 with no output and no warnings. Suggested.lean has 36 lines, one `import Mathlib`, one module docstring and the prescribed empty namespace. There is no TauCeti import to build. I enumerated its declarations: zero. Therefore the expanded-signature/#check audit and one-tactic padding probe both have empty domains; there are no lost binders, sorried theorems, admitted data, examples, options or declaration-name discrepancies to test. No Lean process remains running. Successful elaboration is not evidence against R01 or R02, which are README claims absent from that empty namespace.

## Not verifiable

- CFK22, Lemma 7.3 and the primary local theory behind CFK Theorem 3.10, remains settled uncertified. The cached CFK summary is readable; the full corrected primary proof was not supplied. It was not requested again, and no claim is made that the publisher correction is merely bibliographic.
- KAP23, Theorem 25, remains settled uncertified. CFK's statement of the auxiliary uniqueness input was checked; the primary proof was not read or requested again.
- YAM14, Theorem 7.1, remains settled uncertified. The package explicitly owns the needed comparison/orthogonal-spin adaptations; the primary proof was not read or requested again.
- No inaccessible work was renamed or added to a missing-reference request. The fifteen seeded source passages were readable; the limitations above concern the full primary proofs attributed by those passages, not missing sample pages.
- Ownership against open pull requests without supplied files is limited to the authorized indexed search described above. No assertion is made about unavailable separate heads. The verified native-carrier absence is at the stated pins, not newer libraries or future supplier implementations.

## Source issues

- **Misprint** in EHLS at §4.1.1, printed p.44, EHLS lines 1862–1880: the source says the unrescaled upper-radical coordinate is Hermitian; it should be skew-adjoint, becoming Hermitian after an explicit trace-zero scalar conversion; affects nothing.
- **Error** in EHLS at the pairing assertion before the unfolded integral, printed p.47, EHLS line 2023: the source says zero evaluation pairing forces every section-dependent doubling period to vanish; it should be tested against translated matrix coefficients, which can be nonzero; affects a stated result.
- **Misprint** in HLS at equation (3.1.2.5), author-version printed p.44, HLS lines 1762–1767: the source says the quadratic-character exponent contains an extra n−1; it should be r in that indexing; affects a stated result; corrected in print at EHLS §4.2.1, printed p.49, EHLS lines 2109–2113.
- **Misprint** in HLS after equation (3.1.2.8), author-version printed p.45, HLS line 1799: the source says the unramified base change has general-linear rank m; it should be n; affects nothing; corrected in print at EHLS §4.2.1, printed p.49, EHLS lines 2114–2116.
- **Error** in HLS at equation (3.1.2.9), author-version printed p.45, HLS line 1818: the source says the compact-supported local integral equals the compact volume without a vector-pairing factor; it should include that pairing or explicitly normalize it to one; affects a stated result.
- **Error** in CFK at the proof of Lemma 4.3, printed p.36, CFK lines 1576–1583: the source says holomorphy of the shifted numerator and nonvanishing of the unshifted denominator yield holomorphy of the raw operator; it should use holomorphy of the unshifted factor and nonvanishing of the shifted factor after solving for the raw operator; affects the proof.
- **Error** in CFK at §4.3 after the global-period definition, printed p.38, CFK lines 1668–1693: the source says cusp decay gives convergence on the distinguished-center quotient for all c>1; it should separate the split-torus boundary, whose unremoved norm direction can have infinite volume; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8a25c5efa8eda5b1f141c937d0a09b3ea11221dd", "job": "REV-PKG-AutomorphicLFunctionsAndLocalFactorsPartII~3", "model": "gpt-6-astra", "worker": "chris-12"} -->
