<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13156#issuecomment-6783283492 -->
Review (codex) of af9840d

Verdict: needs_changes

1. **F01** (P1) The differential index omits residue degrees

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:233–235`, “dim H⁰_dR − dim H¹_dR = r·χ(U) − Σ_z Irr_z(E)”.

   **Claim:** this is the imported index formula for a smooth affine curve over a characteristic-zero field, without an algebraic-closure or rational-boundary assumption.

   **Witness:** Over ℚ remove z=(x²+1) from ℙ¹ and take E=d+d(1/(x²+1)). Then χ(U)=0, Irr_z=1 and deg(z)=2: the index is −2, while the displayed right side is −1.

   The supplier explicitly includes the residue degree: pull request #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12751`, §RD.6.53; its preceding local-length statement also distinguishes local irregularity from degree over the ground field.

   **Exact repair:** write `r·χ(U) − Σ_z [κ(z):F]·Irr_z(E)`, with the boundary indexed by closed points of the smooth completion and `χ(U)=2−2g−Σ_z[κ(z):F]`. Keep the affine hypothesis, so H² vanishes. Add the degree-two example as a Check. On it the repaired right side is 0−2·1=−2, agreeing with base change to two simple exponential poles. The G_m specialization used later is unchanged, since 0 and ∞ are rational.

2. **F02** (P2) Fourier localization is applied on the wrong side of its regularity hypothesis

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1036–1037`, “applied to j_{0,!*}Sym^k K̃l_r”; the contract at :266–267 says “on regular inputs”.

   **Claim:** this intermediate extension is an input satisfying the regularity hypothesis of the imported inverse-Fourier projector identity.

   **Witness:** At r=2,k=1 its infinity factors are E^{2t}L_{−1} and E^{−2t}L_{−1}: slopes 1,1, hence irregularity 2, not 0. The supplier's regular holonomic input N belongs before FT, not after it.

   The precise usable statement is `FT_θ Π_θ N ≅ (FT_θ N)(*0)` for regular N, in `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:652`, §6.6. Its following “equivalently” clause should not be read as making an irregular transformed module regular.

   **Exact repair:** state and consume the first version with `N=M=FT⁻¹(j_{0,!*}Sym^k K̃l_r)`, whose regularity is part of §3.6. Then apply FT⁻¹ and use localization of the intermediate extension to obtain `ΠM ≅ FT⁻¹(j_{0,+}Sym^k K̃l_r)`. Rewrite the supplier contract to put regularity on M, or explicitly say “inputs whose inverse transform is regular.” No new supplier gap is needed. At r=2,k=1, M has slope 0 and rank 1; FT M has slopes 1,1 and rank 2; ΠM has rank 2. This gives the claimed identity without a false regularity assertion.

3. **F03** (P2) The nonzero constant quotient is not an exponential mixed Hodge structure

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1051–1052`, “the quotient M′ is pure of weight 2k + 1 as an exponential structure”.

   **Claim:** M′ belongs to the exponential category and has the displayed exponential weight.

   **Witness:** At r=2,k=1, M′ is a nonzero constant rank-one Hodge module. Its global Betti cohomology is ℚ(−1)[1], not zero; ΠM′=0. Thus it fails the defining condition for EMHS.

   See `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:568` and :584, §§6.1–6.2. FSY line 695, Proposition 2.21, pp.16–17, places the exact sequence in ordinary MHM(A¹); FSY lines 1416–1422 separately computes the top Tate class after Fourier cohomology.

   **Exact repair:** replace “as an exponential structure” by “as an ordinary Hodge module on A¹”; specify that the underlying constant variation has weight 2k. If recording the contribution to moment cohomology, name `H¹(A¹_t, FT M′^H)`, of type (k+1,k+1) and weight 2k+2. Add the non-membership Check `RΓ(M′)≠0`, `ΠM′=0`. At k=1 the three weights are respectively 3,2,4; the corrected category and the cover Hodge table agree.

4. **F04** (P2) The even resolution conflates the open hypersurface with its compactification

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1647–1659`, “take the strict transform K′ of K̄”; :1683 and :1932 subsequently use K̄′ “of §7.3”.

   **Claim:** the one defined space K′ supports both the compact-support comparison and the proper boundary-restriction realization quoted from FSY (5.18)–(5.21).

   **Witness:** FSY line 2005 defines open K′ over K; line 2024 separately compactifies it. At k=4, gr²H³_c(open K′)^χ has dimension 1 (FSY lines 1997–1999, 2044–2051); for smooth proper K̄′ that graded piece is 0.

   **Exact repair:** define both `K′→K` inside the blown-up torus and its proper closure `K̄′→K̄` inside the blown-up toric scheme. Give the open morphism the compact-support comparison of (5.18), and give the proper closure the boundary strata and the restriction-kernel description of (5.19)–(5.21). Identify its boundary as `K̄′\K′`. Update §7.4 and §9.1 to refer to the now-defined proper space. The k=4 Check must distinguish the open weight-two class, of dimension 1, from the zero weight-two part of H³ of the smooth proper closure. This also makes every constructed map's source and target explicit.

5. **F05** (P3) The Euler-product adapter must zero the n=0 summand

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:2105–2106`, “EulerProduct.eulerProduct_tprod applied to n ↦ eulerCoeff L n·n^{−s}”.

   **Claim:** that raw function satisfies the pinned Euler-product theorem's hypotheses whenever the stated normalization and LSeriesSummable hypotheses hold.

   **Witness:** Set every L_p=1 and s=0. Then eulerCoeff L 0=1 and 0^0=1, so the proposed f(0)=1. Mathlib requires f(0)=0. The raw sum is 2; LSeries and the Euler product are both 1.

   The relevant declarations are `Mathlib/NumberTheory/EulerProduct/Basic.lean:225` and `Mathlib/NumberTheory/LSeries/Basic.lean:74`. The former's f₀ premise is explicit; the latter defines the zero-index term as zero.

   **Exact repair:** apply the theorem to `LSeries.term (eulerCoeff L) s`, or the explicitly piecewise function zero at n=0 and equal to the raw expression for n>0. Retain the current normalization and summability hypotheses. Add the normalized constant-family, s=0 negative control; it is in the stated domain. The corrected function has f(0)=0 and both sums equal 1. Three scratch Lean examples verified eulerCoeff L 0=1, the raw zero-index value 1, and `LSeries.term … 0 0=0`. No change to a headline or to the definition of eulerCoeff is needed.

Five findings: one P1, three P2 and one P3. The four Lean headlines elaborate and survive the padding probes. The remaining repairs concern the README's mathematical contracts, the categories and spaces on which they are applied, and an Euler-product proof adapter. No reviewed source file was changed.

## Previous findings and repairs

The previous review and repair report were checked before the new pass. Locations below are in `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`. A “partly repaired” assessment distinguishes a corrected original counterexample from a defect remaining in the replacement passage; it does not repeat the original finding unchanged. No finding was marked not actionable in the repair report.

| Previous finding | Repaired passage, at the present location | Assessment and recomputed witness |
|---|---|---|
| R01, logarithm sign | :655, “Σ_m m₂ᵏ(p^m)T^m/m = log det(1 − F_pT \| H¹_c)” | **Repaired.** At k=1 the first three logarithmic coefficients are −1, −1/2, −1/3 on both sides; exponentiating gives 1−T. |
| R02, cover versus descent projector | :899–939, “e^S_χ”; :991–1004 distinguishes the two isotypic parts | **Repaired.** At r=2,k=3, deck eigenvalues +1,−1,+1,−1 give full dimensions 4→2 and middle dimensions 3→1. The two projectors remain distinct in Layers 4 and 7. |
| R03, inverse Fourier ranks | :1022–1034, “M = FT⁻¹(j_{0,!*}Sym^k K̃l_r)” and “M is its image” | **Partly repaired.** G,M,ΠM,M′ have ranks 2,1,2,1 at r=2,k=1, as required. The replacement still misidentifies the regular input to the cited identity, and its Check calls a nonzero constant quotient an exponential structure: new R02–R03. |
| R04, wrong cohomological degree | :1148–1151, “(gr^W₂H²_c(K_{2,3}))^{S₃×μ₂,χ₁}(−1)” | **Repaired.** Weight 2+2=4, type (2,2), dimension 1; the old degree-one expression would have weight 3. |
| R05, nonexistent supplier labels | :230–277, “§RD.6.52a”, “§RD.6.53”, “§§8.1–8.4”, “§§9.1–9.7” | **Partly repaired.** The sections exist and the old letter labels have gone. The replacement RD.6.53 contract omits residue degrees: new R01. MHM references resolve to the board package. |
| R06, forward dependencies | :1465, “6.4 Hodge numbers on the double cover”; :2094, “Λ′_k(s)” | **Repaired.** Cover Hodge numbers precede the filtration argument. The partial even completion uses only odd primes; its completion at 2 occurs after §11.2. The earlier 6.4→6.5 and Layer 10→11→10 edges are gone. |
| R07, inverse Euler factor | :1912–1917, “Euler factors M₅(p; T)⁻¹” | **Repaired.** At p=2, (1−4T+64T²)(1+4T−48T²)=1+0T+0T²+O(T³). The inverse-factor language in §§10.3 and 11.4 also agrees. |
| R08, convergence and normalization | :2103–2108, “if [T⁰]L(p; T) = 1 … and LSeriesSummable …” | **Partly repaired.** Both missing hypotheses are supplied; the original counterexamples are excluded. The claimed direct application to the raw n=0 summand is still invalid at s=0: new R05. |
| R09, zero parameter | :469–505, “at a unit a”; Lean :47–50 explains a=0 | **Repaired.** Over F₂, a=0 gives −1 versus empty product fibre 0; a=1 gives 1 on both presentations. The total finite-sum definition remains legitimate. |
| R10, singular compactification purity | :1565–1610, “boundary localization”; :1805–1809 uses its singular-fibre version | **Repaired.** At k=3,p=3, g(1,1,1)=6=0 and the gradient is zero; tangent dimension 3 exceeds dimension 2. Boundary terms contributing to degree 2 have weights 1 and 0, so do not alter gr². E₂ degeneration is restricted to the smooth case. |
| R11, coefficient-prime comparison | :2181–2211, “Frobenius slopes at the coefficient prime 2” | **Repaired.** AG2.6 supplies the comparison at 2, with the irreducibility premise discharged by MLE §2.43. M₃ has slope 2; M₅ has slopes 2,4. Restoring trivial factors gives coefficient valuations 0,0,2 and 0,0,2,6. N and inertia invariants are retained. |
| R12, toric projectivity | :1382–1393, “normal fan of P_k”; :330–335 names the embedding gap | **Repaired.** P₁,P₂,P₃ have 3,21,251 lattice points; support values are (1),(2,3),(3,5,6). The ample-polytope embedding, rather than completeness alone, supplies projectivity. The same gap slug is in the plan. |

The older F01 label repair remains sound: ShimuraCompactifications §§0.16–0.18 are the toric scheme, properness and boundary sections; the inappropriate projectivity use of §0.15 has been removed. The finite-sum binder repair also survives: all 21 elaborated signatures were inspected, with no lost hypotheses.

## Verified sound

### Extent, principles and shape

I read all 58 numbered sections, every API and Check, all supplier contracts and Needs lines, all 21 Lean declarations, the metadata, source manifest, previous report and repairs, overlap leads and board index. Changed passages and the 15 seeded sections were checked afresh. The computations below also revisit the unchanged mathematics; earlier descriptions without computed values were not treated as certificates.

The roadmap owns a coherent moment/Hodge/arithmetic application, rather than replacing a roadmap on main. Rank-r connections remain general in characteristic zero; the arithmetic endpoint is explicitly rank two. The p=2 branches, inseparable cyclic cover, singular special fibres, coefficient-prime comparison and higher-thickness contract are retained. No computational algorithm, copied source passage, sorry-valued data, set_option, unsolicited generic carrier or route restricted to good primes was found. The source order is not asserted as the plan; the displayed layer dependencies force the substantive progression from realizations through Hodge and local arithmetic information to automorphy and functional equations. The repaired order has no internal forward edge of the earlier kind.

The required scope, conventions, exact contracts, reading guide, numbered layers, Examples, Dependencies, downstream consumers and references are present. Definition blocks have APIs and at least three Checks. The defects in the particular Checks/carriers above are the exceptions to their mathematical validity. Backticked names attributed to this roadmap resolve to its 21 declarations; mathematical formula spans were distinguished from claimed Lean names. There is one `import Mathlib`, no TauCeti import to build, and no process residue requiring deletion. Main-branch shape comparisons were `TauCetiRoadmap/TensorProductCombinatorics/README.md` and `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md`.

### Elaboration, signatures and padding

Ran the prescribed `lake env lean` on the unchanged package's Suggested.lean from the pinned content checkout. Exit 0; the only warnings were the four expected `declaration uses 'sorry'` warnings at lines 90,109,191,206. A second elaboration of a scratch copy checked `#check @name` for all 21 declarations and tested `simp`, `rfl`, `infer_instance`, and `exact trivial` separately for each of the four theorems using `fail_if_success (solve | ...)`. Exit 0: none of the 16 probes closed a theorem. The meaningful library near-matches were opened separately; none was a one-lemma proof of a headline. No statement was a boundary case, definition unfolding, or duplicated Check. No padding deletion is requested.

The signatures retain `[Field F] [Finite F]`, primality instances, `0<k` where needed, and odd/even hypotheses. Odd k implies positive k; the even theorem explicitly excludes zero. `momentSeries` skips m=0 rather than interpreting a fictitious field of cardinality 1. `Q.roots` is not a vacuity escape: the series has constant coefficient 1, forcing Q(0)=1. The even continuation quantifies actual r, a rational polynomial normalized at zero, a sign, and a meromorphic function agreeing with the defined moment series on a half-plane; these are not free predicates encoding the conclusion.

| Headline from Summary and deep targets | Acceptance signature or explicit missing carrier |
|---|---|
| Integer moment polynomial and degree | `momentSeries_eq_intPolynomial`, :109; actual finite-field moments, all primes, k>0. |
| Reciprocal-root weights | `momentSeries_weights`, :90; actual momentSeries, middle and even boundary alternatives. |
| Explicit Hodge numbers and classicality | Module docstring :26–35 names algebraic de Rham cohomology of connections, exponential pairs and irregular Hodge filtration as missing. Tau Ceti's mixed Hodge carrier alone does not construct them. |
| Moment motive and hypersurface comparison | Docstring :33–35 names missing Nori motives and exponential-pair cohomology. |
| Monodromy and differential Galois groups | Docstring :29–32 names the missing lisse-sheaf and differential-module group carriers. |
| Compatible Galois systems and potential automorphy | Docstring :36–39 names geometric étale cohomology with Galois action and regular algebraic cuspidal automorphic representations. |
| Odd functional equation and continuation | `oddMoment_functionalEquation`, :191; no independent arbitrary L-function in its input. |
| Even functional equation including the factor at 2 | `evenMoment_functionalEquation`, :206; the genuinely unknown factor and conductor are quantified as in FSY Theorem 1.3. |

Searches by object in the pinned libraries found no missing-but-statable geometric headline. The simple finite-sum, recurrence, formal-series, conductor and gamma definitions are needed by the four retained headlines. All 21 names appear in the README.

### Computed adversarial evidence

These are tests of the written statements, in addition to the source and hypothesis checks, not purported proofs from a finite sample. Finite-field arithmetic used explicit extension fields of sizes 2,4,8,16 and trace to F₂; the series coefficients were recovered from m·c_m=Σ_{i=1}^m moment_i·c_{m−i}. The values therefore test the character sign and symmetric-power recurrence independently of the polynomial formulas. “Pass” means no repair from that row; the finding rows identify an actual failed assertion.

| Statement | Instances tried | Values computed on the two sides / distinguishing values | Result; change |
|---|---|---|---|
| §0.1 symmetricTrace, roots and scalar extension | k=0,2,3; (t,d)=(3,2),(2,1); zero ring | h₀=1; h₂=7=4+2+1 versus trace²=9; h₃(2,1)=4=1+1+1+1; zero-ring identities both 0 | Pass |
| §0.2 finite sum, trace character and moments | F₂, a=0,1; k=1,3,5; extension degrees 1–4 | a=0: −1 versus fibre 0; a=1: 1=1. Moment vectors (−1,−1,−1,−1), (3,−17,63,−257), (−5,111,703,−4353) | Unit comparison and trace sign pass |
| §0.3 generating series | p=2; k=0,1,3,5 | k=0 coefficients 1,1,2,4,8 agree with (1−T)/(1−2T), not a polynomial; k=1 gives 1−T; k=3 gives 1+3T−4T²; k=5 gives 1−5T+68T²−64T³ | Pass; k>0 essential |
| §1.1 normalization and cyclic restriction | r=2,3; p=2; m=1,2; c↦−c | Rank-two trace −1/c, sign reverses at m=1 and is unchanged at m=2; rank-three factor c⁻²=1/2; (c^m)⁻²=2⁻ᵐ | Pass |
| §1.2 local block and pairing | r=2, F₂; trivial ψ negative control | Trace −1, determinant 2: det(1−FT)=1+T+2T², root norm 1/√2. Trivial ψ gives a reducible mixed-weight direct image | Pass |
| §1.3 monodromy branches | r=2,3,7; p=2,3 | Sp₂=SL₂ dimension 3; Sym²(SL₃-standard) dimension 6, invariants 0; SO₃ invariants dimension 1; at p=2,r=7 group dimension 14 (G₂), not 21 (SO₇) | Pass |
| §1.4 trace, determinant and logarithm | k=1,3 at p=2 | k=1 log coefficients −1,−1/2,−1/3 on both sides. k=3 determinant eigenvalues 1,−4 give −(1+ (−4)^m)=3,−17,63 | Pass |
| §1.5 integrality and character independence | p=2 extension moments; F₃ nontrivial characters conjugate | The displayed moment and Z coefficients are integers. Over F₃ sums are −1,2; conjugation leaves them unchanged; k=4 gives 1−11=−10 | Pass |
| §2.1 exponential/cyclic connection | r=2,3, sign of potential | θ²e=z e; at r=3 plus potential gives θ³e=z e and minus gives θ³e=−z e; rank 2 has slopes 1/2+1/2=1 irregularity | Pass |
| §2.2 cyclic pullback | r=2,3 | x+z/x=t(y+y⁻¹); (−t,−y) leaves it fixed. For r=3 the wrong y↦ζy gives factor ζ² on ty; correct ζ⁻¹ gives 1. dz/z=r dt/t | Pass |
| §2.3 local structure and duality | r=2,3 | r slopes 1/r sum to 1; dual base change sign +1,−1 respectively; on G_m, H¹−H⁰=1−0=1 | Pass for rational boundary |
| RD.6.53 contract | degree-two boundary over ℚ | χ=0, local Irr=1, residue degree=2: actual index −2 versus written −1; weighted correction −2 | Fail; R01 |
| §2.4 symmetric connections | r=2,k=0,1,2; characteristic zero | ranks 1,2,3 equal binomial(1+k,k), not tensor ranks 1,2,4; Leibniz on e₀² gives 2e₀∇e₀ | Pass |
| §2.5 differential Galois groups | r=2,3; k=2 | Sp₂ Sym² dimension 3; SL₃ Sym² dimension 6 and no invariant line, unlike SO₃'s 1+5 splitting | Pass |
| §2.6 Bessel dictionary | r=3, λ≠0; λ=0 negative control | θe₃=e₂, θ²e₃=e₁, θ³e₃=λ³x e₃; horizontal first coordinate satisfies θ³f=−λ³x f. At λ=0 irregularity falls to 0 | Pass; sign/transpose distinguishes models |
| §3.1 tensor potentials | (n,k)=(1,2),(2,2) | y-torus dimensions 2,4; total exponential dimensions 3,5; common t factors every summand, rather than introducing k separate base coordinates | Pass |
| §3.2 signed and deck projectors | S₂,S₃; n=1,2; r=2,k=3; ℚ₃ coefficients | Swap sign −1 for n=1 and +1 for n=2; full dimensions 4→2, middle 3→1 under μ₂. 1/6 exists in ℚ₃; no integral averaging asserted | Pass |
| §3.3 Thom–Sebastiani shifts | n=1,2; k=2 | Relative degrees 2,4 plus base degree 1 give 3,5; factor-swap signs (−1)^1=−1 and (−1)^4=+1 | Pass |
| §3.4 middle image | r=2,k=1,3,4 | (full,middle)=(1,0),(2,1),(2,0); image differs from full cohomology in all three cases | Pass |
| §3.5 cover and descended realizations | r=2,k=1,3,4 | Cover (full,middle)=(2,1),(4,3),(4,2); descended (1,0),(2,1),(2,0); degrees k+1=2,4,5 | Pass |
| §3.6 inverse Fourier sequence | r=2,k=1 | ranks G,M,ΠM,M′=2,1,2,1; rank additivity 1+1=2. FT M irregularity 2 versus required regular-input irregularity 0 | Rank repair passes; R02 |
| §3.6 constant quotient Check | r=2,k=1 | RΓ(M′)=ℚ(−1)[1]≠0, ΠM′=0; ordinary-module/variation/Fourier-cohomology weights 3,2,4 | Fail; R03 |
| §4.1 classicality and weights | r=2,k=3; k=2 | H¹ weights 4,8, lowest part dimension 1; middle parity (−1)^4=+1. k=2 middle dimension 0, alternating parity (−1)^3=−1 is consistent | Pass |
| §4.2 hypersurface and μ_r action | r=2,k=2,3; F₃; r=3 | y₁y₂g=(y₁+y₂)(1+y₁y₂); at (1,1,1), g=6≠0 over ℚ but =0 over F₃; g transforms by ζ⁻¹, whereas tg transforms by 1 | Pass |
| §4.3 hypersurface realization | r=2,k=3 | Degree nk−1=2, weight before twist 2, after twist 4; dimension 1 and type (2,2), versus old degree-one weight 3 | Pass |
| §4.4 Nori motive and pairing | k=1,2,3,4,6; r=3 sign control | ranks 0,0,1,0,2; weight at k=3 is 4; pairing types symmetric at k=3, alternating at k=6; χ₂ on a transposition is +1 rather than −1 | Pass conditional on Nori gap |
| §4.5 finite-field comparison | p=r=2,k=3 | Étale deck quotient μ₁ has one element; inseparable degree 2 does not supply two sheets. Hypersurface eigenvalue before twist −2 becomes −4; polynomial 1+4T | Pass |
| §5.1 explicit frame | k=2 | θu₀=2u₁, θu₁=u₂+zu₀, θu₂=2zu₁; coefficients (2,1,1,2) agree with Leibniz, not all 1 | Pass |
| §5.2 formal decomposition | k=2,3,4 | Cover exponents at k=2: −4,0,4, irregularity 2; at k=3: −6,−2,2,6, irregularity 4; base regular monodromy at k=2,4 is −1,+1 | Pass |
| §5.3 intermediate extension | k=2,3,4, at 0 and ∞ | Infinity invariant rank on base 0,0,1; on cover 1,0,1. Thus base isomorphism true,true,false; at 0 the punctual boundary contribution always has multiplicity 1 | Both directions pass |
| §5.4 inverse Fourier singularities | k=1,2,3 | Singular points ±2; −4,0,4; −6,−2,2,6. Vanishing ranks 1, monodromy −1,+1,−1 respectively; M ranks 1,2,3 and ΠM ranks 2,3,4 | Pass conditional on stationary phase |
| §5.5 dimensions | k=1,…,8; k=0 negative control | Full 1,1,2,2,3,3,4,4; middle 0,0,1,0,2,2,3,2. k=0 truncation gives 0 versus actual H¹(G_m,O) dimension 1 | Pass; positive k retained |
| §5.6 bases and leading matrix | k=1,2,3 | k=1 determinant −z; k=2 leading kernel u₂−zu₀ maps to 2zu₁−2zu₁=0; k=3 determinant 9z²=(3!!)²(−z)²; base/cover class counts 2/4 at k=3 | Pass |
| §6.1 fan, polytope and projectivity | k=1,2,3; square control | vertices 2,8,48; lattice points 3,21,251; supports (1),(2,3),(3,5,6). Square support is linear inside a quadrant, so cannot have this subdivided fan as its normal fan | Pass conditional on embedding gap |
| §6.2 nondegenerate compactification | k=2,3 near t=∞ | Balanced sign solutions: 2 and 0. With s=1/t and quadratic Q, f=Q/s has exceptional valuation 2−1=1 after first blow-up; second resolving chart has pole order 0 | Pass |
| §6.3 Newton degrees | k=1 and balanced k=2 | (α₁,α₀)=(1,0),(−1,1) both give 2α₀+α₁=1; zʲ,tʲ have degrees 2j,j; k=2 has balanced signs (+,−), unlike k=1 | Pass |
| §6.4 cover Hodge numbers | k=1,2,3 | k=1: (1,1),(2,2), total 2; k=2: (2,2),(3,3), total 2 and middle 0; k=3: (1,3),(2,2),(3,1),(4,4), total 4, middle 3 | Pass |
| §6.5 filtration | k=3; p=4,2,5 | Base dimensions of F^p are 1,2,0 from 2j≤4−p; pullback coefficients are 2, not 1. Cover counts at these p are 1,3,0 | Pass |
| §6.6 base Hodge numbers | k=3,4,5,6,7 | Middle types (2,2); empty; (2,4),(4,2); (2,5),(5,2); (2,6),(4,4),(6,2). Counts 1,0,2,2,3 equal d_k | Pass |
| §7.1 integral boundary and localization | k=2 chart; k=3,p=3 | g₁=1+z₁+z₁²z₂²+z₁z₂²; at z₂=0 on K, z₁=−1 and derivative 1=−1/z₁. At interior (1,1,1), gradient 0. E₁ weights contributing to m=2 from i=1,2 are 1,0<2 | Pass; boundary hypothesis essential |
| §7.2 arithmetic singularities | k=9,p=3, a=1,3; k=6,p=3 | Local constants 6,18 have v₃=1,2 and v_{√−3}=2,4. Even orbits b=0,2 give count 2=1+⌊6/6⌋ | Pass conditional on higher thickness |
| §7.3 even resolution | k=4,6 | Open gr^{k−2}H_c^{k−1},χ dimensions 1,0; smooth proper gr²H³ at k=4 dimension 0, not 1 | Fail carrier distinction; R04 |
| §7.4 realizations and pairing | k=1,2,3,4,6,7 | ranks 0,0,1,0,2,3; symmetric/alternating parity +,− at k=3,6; k=3 twist changes weight 2→4 | Pass with R04's carrier repair |
| §8.1 middle weights and reciprocity | p=2,k=3,5 | k=3 β=−4, norm 4=2²; 2⁴/β=−4, whereas 2²/β=−1. k=5 M=1−4T+64T², roots norm 1/8=2⁻³ | Pass |
| §8.2 degree and trivial factors; polynomial headline | p=2,k=4,6,8,10,12; p=3,k=4 | Z coefficients: (1,−1); (1,7,−8); (1,−17,16); (1,23,2024,−2048); (1,−1,−4096,4096). Degrees 1,2,2,3,3 equal formula. At p=3,k=4: 1−10T+9T² | Pass |
| §8.3 odd local structure | k=9,p=3 | Θ⁻={1}, Θ⁺={3}; ramified and unramified vanishing-line counts both 1. For a=3, a′=1, Legendre(−2/3)=+1, eigenvalue 3⁵=243 | Pass |
| §8.4 even local structure | k=6,p=3 | dim V=2, dim U=1, dim V^I=1, N²=0; surviving local eigenvalue −27 gives 1+27T | Pass |
| §8.5 odd Euler factors and conductor | k=5,p=2; k=9 | M₅=1−4T+64T²; inverse starts 1+4T−48T², product coefficients 0,0. N₉=sf(1)sf(3)sf(5)sf(7)sf(9)=105 | Pass |
| §8.6 even Euler factors and conductor | k=6,8,p=3 | k=6: u=v=1 in boundary factorization, inverse Euler factor 1+27T, N′=3. k=8: boundary ±81, M=1, inverse Euler factor 1+81T; N′=3 | Pass |
| §9.1 geometric comparison inputs | k=9,p=3; k=5,p=2 | Thickness e=2 is required at a=3; M₅ slopes 2,4 sum to 6, matching Hodge sum 2+4. Unit-thickness-only input cannot cover the former | Pass conditional on declared gap |
| §9.2 regular polarized systems | k=5,6,7 | Hodge index sets {2,4},{2,5},{2,4,6}, cardinalities 2,2,3; pairing weights 6,7,8 and signs +,−,+; k=1,2,4 zero representations separated | Pass |
| §10.1 determinant and conjugation | k=1,3,7 | Cyclotomic exponents 0,−2,−12; quadratic radicands 1,−3,+105. At k=7 one unequal Hodge pair contributes −1 and central line −1, product +1 | Pass |
| §10.2 gamma factor | d=0,1,2; d=1,s=3 | Standard/paper ratios 1,√π,π^{3/2}; at (1,3), π⁻¹ versus π⁻³ᐟ² gives √π. Empty product 1 on both sides | Pass with explicit source correction |
| §10.3 local epsilon conventions | k=6,p=3; k=3,∞ | k=6: u=1, v=⌊6/12⌋=0, sign +1 despite inverse Euler coefficient +27. k=3 archimedean factor i^{(9−1)/8}=i | Pass |
| §10.4 Euler coefficients/completion | L_p=1,s=0; unnormalized L₂=2 | normalized: raw n=0 term 1 versus required 0, raw sum 2 versus Dirichlet/Euler 1. Unnormalized: Dirichlet 1 versus product 2 | R05; normalization repair passes |
| §11.1 potential automorphy | k=1,3,5,6 | dimensions 0,1,2,2; trivial case 1, rank-one character χ_{−3}χ_cyc⁻², regular rank-two Hodge sets {2,4},{2,5}; zero-rank automorphic representation not asserted | Pass |
| §11.2 semisimplification, coefficient prime and bound | p=2,k=3,5 | M₃=1+4T slope 2; M₅ slopes 2,4. Z coefficient valuations (0,0,2) and (0,0,2,6) equal n(n−1) in these examples; slope normalization v₂(β)/f restores 2,4 after residue extension f | Pass |
| §11.3 orthogonal root number | k=1,3 | Empty product root number 1; χ_{−3} root number 1; weight k+1=4 and symmetric pairing at k=3 | Consistent; conditional Saito input |
| §11.4 odd functional-equation headline | k=1,3,9 | k=1 Λ=1 on both sides; k=3 N=3,d=1, reflection 5−s, center 5/2; k=9 N=105, Θ⁺₃ factor 1−243T | Pass |
| §11.5 even functional-equation headline | k=2,4,6,8 | k=2,4: r=0,P=1,ε=1,Λ=1; k=6: d=2,N′=3, reflection 8−s, center 4; k=8 conjectural t=2 gives +1 but is not assumed | Pass |

### Seeded source verification

All 15 seeded targets were read at their actual locators. Page numbers below are the printed preprint pages corresponding to the manifest's explicit arXiv versions, not Duke/Inventiones journal pagination. All three readable source entries were checked against those versions. Saito is the sole settled unreadable entry; no new source request is needed.

| Target | Source text opened | Hypotheses and outcome |
|---|---|---|
| 0.3 moment generating series | FSY lines 78–101, §1.1, pp.2–3 | Positive extension degree and k≥1 polynomiality; plus exponential sign. The k=0 rational-series control is correctly excluded. |
| 1.4 cohomology | FSY lines 193–208, (1.5), p.5; lines 981–994, §3.2.1, pp.23–24 | Rank-two positive symmetric powers have no H⁰/H². General odd-rank characteristic-two invariant exceptions are retained. Correct log sign. |
| 1.5 integrality/character independence | FSY lines 78–88 and 203–208 | Integer polynomial for the symmetric-power moment with the signed trace convention. Character change is checked through the finite-field presentation, not arbitrary independent choices over extensions. |
| 2.1 connections | FSY lines 423–505, Proposition 2.4 and Lemma 2.5, pp.10–12 | Exponential direct image, cyclic θ^r−z, rank r; extension from the rational construction preserves the characteristic-zero assertion. |
| 2.5 differential Galois groups | FSY lines 524–533, Proposition 2.7 and proof, p.12 | The proof records SL/Sp and irreducibility; it does not supply the characteristic-two orthogonal table, which belongs to the sheaf target. |
| 2.6 Bessel dictionary | XZ lines 78–100, §1.1.1, (1.1.1.3)–(1.1.1.6), pp.2–3; lines 1972–1985, §4.1.13, p.42 | Nonzero scaling parameter, cyclic versus horizontal equation and transpose/sign distinguished. XZ §2.1.5, lines 480–495, p.10 supplies the corrected Frobenius-sign comparison. |
| 3.3 tensor Thom–Sebastiani | FSY lines 565–596, Proposition 2.10/Corollary 2.11, pp.13–14; lines 634–637 | Relative rank and cohomological shift nk+1; signed permutation action. |
| 5.1 frame | FSY lines 1091–1093, 1131–1139, (4.4)–(4.5), pp.26–27; lines 1260–1320, Lemma 4.15, p.31 | Symmetric, not divided, powers; coefficients k−a and a agree with the written frame. |
| 5.3 intermediate extensions | FSY lines 1189–1203, Corollary 4.9, pp.28–29; lines 1271–1285 | Base versus cover parity conditions differ; zero-boundary contribution remains. |
| 5.4 inverse Fourier local structure | FSY lines 1219–1227, Corollary 4.10, p.29 | Ranks k and k+1, locations 2(2j−k), monodromy (−1)^k. Declared stationary-phase gap supplies the irregular input. |
| 6.2 compactification | FSY lines 1500–1555, §§4.3.2–4.3.3, pp.35–37; lines 1556–1599 | Even balanced critical points require two stages; divisor multiplicities and logarithmic form orders agree. |
| 6.4 cover Hodge table | FSY lines 1378–1425, Proposition 4.20, pp.32–34 | Even k omits the two central middle indices and adds the two stated Tate types; the primitive-index misprint is corrected. |
| 7.3 even resolution | FSY lines 1995–2057, proof of Theorem 5.17, (5.18)–(5.21), pp.45–48 | Open strict transform and proper closure are separate. This locator exposes R04; the numerical boundary correction itself is supported. |
| 10.2 gamma factors | FSY lines 2336–2399, Corollary 5.30, pp.52–53 | The roadmap includes the missing constant π^{d(d+1)/4}. Hodge signs and shifts agree after that correction. |
| 11.5 even functional equation | FSY lines 135–146, Theorem 1.3, p.4 | Existential factor at 2, conductor exponent and sign; no conjectural explicit formula is promoted to a theorem. |

Additional repair locators opened include FSY lines 613–755 (projectors and inverse Fourier objects), 1740–1764 (integral boundary), 2249–2255 (thickness), 2629–2679 (semisimplification and coefficient-prime comparison), 3210–3225 (zero-locus cohomology), and Serre-orthogonal lines 363–397, Theorem 4.2.1, pp.9–10. All four cited works have exactly one manifest key. No entry was added, rewritten or removed.

### Pinned library audit by object

The following are actual declarations opened in the pinned libraries. Paths beginning Mathlib or TauCeti are relative to the respective pinned library repository. These checks distinguish available algebraic/analytic carriers from the geometric structures the docstring says are absent.

| Pinned file and line | Object and comparison |
|---|---|
| `Mathlib/Algebra/Group/AddChar.lean:72`, :242, :354 | AddChar has zero↦1 and addition↦multiplication; composition and finite-field character sum are native. The sum theorem retains its domain hypotheses. |
| `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83` | ZMod.stdAddChar uses the positive exponential convention of traceChar. |
| `Mathlib/FieldTheory/Finite/GaloisField.lean:68`, :117 | Splitting-field carrier, Field and Finite instances; cardinality p^m requires m≠0. No headline applies the cardinality theorem at m=0. |
| `Mathlib/RingTheory/Trace/Defs.lean:70`; `Mathlib/FieldTheory/Finite/Trace.lean:37`, :49 | Algebra.trace and its finite-field formulas; trace, not a chosen coordinate projection, defines the extension character. |
| `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53` | SymmetricPower is the tensor-permutation quotient. It does not construct an algebraic connection or its de Rham cohomology. |
| `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312`; `Mathlib/RingTheory/Polynomial/Chebyshev.lean:263` | hsymm and Chebyshev.U are native comparison objects for the recurrence; no new generic symmetric polynomial is planned. |
| `Mathlib/RingTheory/PowerSeries/Exp.lean:50`; `Mathlib/RingTheory/PowerSeries/Substitution.lean:158` | Exponential coefficients 1/n! and substitution. The moment exponent has zero constant coefficient; dot notation supplies the intended substituted series. |
| `Mathlib/Algebra/Polynomial/Roots.lean:56` | roots of the zero polynomial are empty, but Q(0)=1 in the weight headline excludes that wrong model. |
| `Mathlib/NumberTheory/LSeries/Basic.lean:74`, :164, :178 | term zeroes n=0, LSeries is its sum, LSeriesSummable its summability. The distinction produces R05. |
| `Mathlib/NumberTheory/EulerProduct/Basic.lean:225` | eulerProduct_tprod requires f(0)=0, f(1)=1, coprime multiplicativity and summability. Normalizing local series alone does not imply f(0)=0 for the proposed raw function. |
| `Mathlib/Analysis/Meromorphic/NormalForm.lean:632` | MeromorphicNFOn supplies the stated pointwise normal-form continuation carrier. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:287` | Complex.Gamma; the definition of paperGamma retains its nonzero π scaling. |
| `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109`; `Mathlib/Data/Nat/PadicValNat.lean:21` | legendreSym and padicValNat; positive odd a and prime p constrain their uses. Empty/nonprime Euler factors are explicitly 1. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` | MixedHodgeStructure supplies rational-model filtrations, but not automatically finite dimension or graded polarizability. The README explicitly imposes both. |
| `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, :131; `TauCeti/Geometry/Hodge/Tate/Basic.lean:93` | Strictness for F and WQ; Tate m has weight −2m and type (−m,−m), giving the required +2 at twist −1. |

Object searches included Kloosterman/character sums, symmetric traces, formal exponential substitution, Euler products, Nori motives, irregular Hodge filtrations, de Rham cohomology of connections and differential Galois groups. The library near-match leads for all 21 declarations were examined: Gauss/Jacobi sum lemmas concern different sums; existing Dirichlet functional equations do not prove these moment functional equations. No duplicate fully qualified declaration was identified.

### Supplier resolution, ownership and order

The required mechanical dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2153 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. I also read the Needs lines, since this check alone does not detect internal layer cycles or mathematical hypothesis drift. The resolver's single “no roadmap” lead for MixedHodgeModulesAndIrregularHodgeTheory is a false positive: `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:214` contains §2.1, and the package is earlier in the order. Its actual numbered sections were used, not remembered letter labels.

The following register identifies the current supplier texts opened and the families of citations resolved. Reference lines are headings or the actual statements in those README files, not the tool's output header. Roadmap files are `TauCetiRoadmap/<name>/README.md` unless a package path is specified. The two contract defects found while doing this are R01 and R02; declaring the six gaps is not a supplier-drift defect.

| Supplier and current text | Resolved sections and witness lines |
|---|---|
| CongruenceSpectralGap, #1504 | §§4.2a–4.2b: unit-parameter raw hyper-Kloosterman sum, sheaf, trace sign and curve index. The rank-two eliminated formula is imported at units, with the permitted simple acceptance-test definition. |
| PadicDifferentialEquationsAndRigidCohomology, #1002 | RD.6.52a :12731; RD.6.53 :12751; RD.6.94–RD.6.98 :13643–13764; RD.7.20 :14317; RD.7.21 :14342; RD.7.21a :14370; RD.7.22 :14389. Read the weighted index, prime restrictions, unit thickness, filtered realization hypotheses and odd-prime factorization. |
| SpringerResolutionAndCharacteristicCycles, #1828 | §§8.1–8.4 :834–893; §§9.1–9.7 :966–1077. Ordinary operators, transfer shift, duality, holonomicity, intermediate extension and regularity are at the cited destinations. |
| ComplexComparisonPartII, #848; FormalConnectionsOpers, #1056 | C5.1 :2984 and its operator interface, C5.6 :4440, C5.7 :4565; F2.2 :707. Operators/PBW and logarithmic comparison are separate supplied objects. |
| MixedHodgeModulesAndIrregularHodgeTheory, board package | §§2.1–2.5, 4.3/4.6, 5.1–5.4, 6.1–6.6, 7.1/7.5–7.6, 8.1–8.2, 9.1–9.5, 10.1–10.2, 11.2–11.6, 12.1–12.8. In particular :568 defines EMHS, :584 kills constants, :652 states Fourier localization. These expose R02–R03. |
| EtaleCohomologyFoundations, main; InverseGaloisAndArithmeticFundamentalGroups, #850 | F.0.4, F.2.1/F.2.4–F.2.7, F.4.5, F.5–F.7, F.10.1/F.10.2/F.10.2b: coefficients, operations, invariance, purity, blow-ups and rational comparison. IG.0.T3 :568 supplies the rational trace formula. |
| EtaleDualityAndPerverseSheaves, #1040 | §§2.3 :1661, 2.8 :2333, 3.3 :3220: duality and rational perverse coefficients. |
| DeligneWeightsAndPurity, #929 | §§0.16 :810, 0.18 :837, 7.12 :2256, 7.15 :2310, 8.14 :2564, 8.19 :2720, 8.24 :2868. The last requires a smooth proper compactification; §7.1 now supplies the distinct singular-interior boundary argument. |
| SchemeAndStackFoundations, main | §§2.11 :3797, 4.11 :5822, 4.13 :5947, 4.17 :6391: Artin–Schreier, modifications, regularity, normal crossings. These do not identify open and proper strict transforms automatically. |
| ShimuraCompactifications, #1053 | §§0.16 :752, 0.17 :780, 0.18 :803: arbitrary-base toric schemes, properness and boundary. Completeness alone does not supply an ample embedding. |
| AnalyticToricGeometryPartII, #1647 | §§0.3 :168 and 0.5 :210: character sections and line bundles over arbitrary rings. The missing ample-polytope closed immersion is correctly declared as a gap. |
| LefschetzPencilsAndVanishingCycles, #873 | §§2.1–2.8, including :1493, :1706, :2082, :2198; Layer LPV.2 Examples :2300; §6.6 :3463. Ordinary quadratic points, discriminant and isolated-singularity inputs are supplied; arbitrary thickness remains explicitly contracted. |
| MotivesAndAlgebraicCycles, #1313 | §2.7 :437; §§5.3–5.9 :992–1091. Nori realization/tensor objects exist as plans; the precise filtration and orthogonal-root-number additions remain gaps. |
| ArithmeticGaloisRepresentations, #856 | §§1.7 :1172, 2.5 :2083, 2.6 :2189, 2.7 :2268, 3.3 :2872, 5.3 :3515, 7.4 :4651. Local factors, constants, purity and semisimplification are separate; preserving the form under semisimplification is the declared Serre gap. |
| CohomologyComparisons, #1064; PadicHodgeTheory, #1062 | §§2.13 :436, 3.4–3.5 :641–663, 4.3–4.4 :774–790; §3.2 :667 and §§5.1–5.3 :984–1018. The Hodge–Tate sign is explicitly reversed in the package. D_pst keeps its descent, N and Frobenius data. |
| PotentialModularityAndCompatibleSystems, #1075 | §§1.1 :97, 1.5 :189, 1.6 :212, 1.15 :382. Its strictness statement away from the coefficient prime is not reused as an all-prime assertion. |
| ModularityAndLanglandsExtensions, #1180; AutomorphicGaloisRepresentationsPartII, #1006 | §§2.42 :1472, 2.43 :1490, 2.49 :1570; AG2.5 and AG2.6, including irreducibility condition :2300, coefficient-prime comparison :2453 and totally real descent :3226. The §2.43 proof route avoids using the full coefficient-prime comparison to establish its own premise. |

The overlap report had no conflicting change to this roadmap, no dropped cited id and no citation defined only in an open revision. Its five closest roads were inspected: #1002 owns rigid comparisons, #873 the general vanishing-cycle theory, #1504 the sheaf and raw sums, #2132 FourierDeligneTransform the finite-field Fourier machinery, and #1006 local–global compatibility. The package cites their generic constructions and owns the moment-specific identifications; no reciprocal ownership or duplicate generic construction was found.

The required open-roadmap object search was also used for Kloosterman sums, moment series, toric embeddings and the Hodge/automorphy objects. `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md`, #1712, Scope and §5.1, owns the multiplicatively twisted finite-field sum and identifies its untwisted specialization with CongruenceSpectralGap; it does not own these moment motives. The board companion `packages/KloostermanSheavesAndBesselIsocrystals/README.md:72` and :211–222 hands scalar connections/monodromy to this roadmap and keeps the reductive-group Bessel construction. It does not create an upward supply from this package. Its older KM labels are a consumer-side citation issue, not evidence that this round dropped an externally cited numbered section. The required board index was read before resolving existence. Ownership checks used the supplied indexed heads; no unlisted pull requests were sought.

### Declared gaps

All six slugs match the top-level plan entries and the README's “What … must provide” contracts, with named suppliers earlier in the order. None has supplier none, and none duplicates a located pinned or earlier-roadmap theorem at the required generality. They are stated contracts, not findings:

| Gap | Precision/minimality check |
|---|---|
| higher-thickness-picard-lefschetz | Q−u(√−p)^{2e}, unit u and arbitrary e≥1; the two compatible conclusions are the existing RD.7.20 package extended to this single missing hypothesis range. k=9,p=3 requires e=2. |
| irregular-stationary-phase | Specifies slope-one exponential constants, the inverse-transform sign and monodromy identification; the regular-only supplied case does not cover these factors. |
| nori-weight-filtration | Names finite exhaustive functorial weights and compatibility with realizations, twists and rational projectors; a realization functor alone does not supply this filtration in Nori motives. |
| orthogonal-motive-root-number | Restricts to the even-degree smooth-projective realization with projector/kernel and symmetric pairing needed for Saito's theorem. The paywalled citation remains settled uncertified. |
| semisimplification-similitude-form | Characteristic-zero algebra with anti-involution and nondegenerate symmetric/alternating form; Serre Theorem 4.2.1 supports preservation of the form's type. |
| toric-polytope-projective-embedding | Full-dimensional lattice polytope, regular normal fan, divisor/characters and arbitrary base ring; requests the closed immersion, not merely the existing line bundle or properness. |

## Not verifiable

- `Saito-orthogonal`, main theorem, as invoked in FSY §5.3.3, p.58: its full text remains legally unavailable/paywalled and the manifest records it as uncertified. I checked the FSY invocation and the explicit supplier contract, not the inaccessible original proof. This is the settled citation; no repeat request was made.
- The published journal pagination/numbering was not substituted for the manifest's pinned preprint versions. All source certification above concerns FSY arXiv v5, XZ arXiv v2 and Serre arXiv v3 as explicitly recorded.

## Source issues

- **Misprint** in FSY at §5.1.1, printed p.40 (FSY line 1731): the source says reciprocal roots pair using p^((k+1)/2); it should use p^(k+1), as the pairing weight and k=3,p=2 show; affects nothing.
- **Misprint** in FSY at §3.2.1, printed p.23 (FSY line 987): the source says the single Kloosterman sheaf uses the nk-dimensional torus; it should use the n-dimensional torus, reserving nk for a tensor power; affects nothing.
- **Misprint** in FSY at proof of Proposition 4.20, printed p.33 (FSY line 1408): the source says the primitive monodromy piece has index k; it should have index k−1 for the rank-k block centered at k−1; affects nothing.
- **Misprint** in FSY at §5.1.2, printed p.41 (FSY line 1761): the source says the chart derivative is invertible on the coordinate divisor; it should restrict also to the hypersurface, where the derivative is −1/z₁; affects nothing.
- **Gap** in FSY at proof of Proposition 5.23, printed p.50 (FSY lines 2249–2254): the source says one quadratic resolution supplies the needed semistable model; it should also handle higher thickness, including k=9,p=3 with local constant 18 and uniformizer valuation four; affects the proof.
- **Error** in XZ at §2.1.5, printed p.10 (XZ line 489): the source says exp(π(t−t^p)) gives the displayed Frobenius-to-original horizontal map; it should use exp(π(t^p−t)) for those connections and that direction; affects a stated result.
- **Misprint** in FSY at Corollary 5.30, printed p.52 (FSY lines 2336–2362): the source says the paper-normalized gamma expression equals the standard recipe; it should include π^{d(d+1)/4}, already √π at d=1; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p.63 (FSY line 2876): the source says derived restriction of the shifted constant object has perverse degree zero; it should be the divisor's shifted constant object shifted again by [1], with perverse cohomology in degree −1; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p.71 (FSY line 3222): the source says the composite direct-image functor is zero; it should say the underlying geometric composite is constant at zero, whose direct image need not vanish; affects the proof.
- **Error** in FSY at Remark 5.41, printed p.59 (FSY line 2676): the source says the local determinant equals that of the full semistable period module; it should retain monodromy-kernel and inertia/descent invariants; affects the proof.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, printed p.10 (Serre-orthogonal line 393): the source says isotropy of S requires vanishing on every pair in E; it should require vanishing on pairs in S; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "af9840df9e0c7f8cd1aac101563b65542da38dc4", "job": "REV-PKG-KloostermanMomentsAndPotentialAutomorphy~3", "model": "gpt-6-astra", "worker": "chris-33"} -->
