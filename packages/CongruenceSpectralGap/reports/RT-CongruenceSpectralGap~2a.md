<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/957#issuecomment-6393710956 -->
Red team round 2 pass a (codex) of 0afb099

Verdict: needs_changes

1. **F01** (P3) The min–max locator repair mistook a running header for a section heading

   **Location:** `packages/CongruenceSpectralGap/README.md:800`, “§4.4, Theorem 4.10 and the form-domain observation p.119”; repeated at lines 30, 199, 221, 277, 753 and 772, and `packages/CongruenceSpectralGap/sources.toml:26`.

   **Claim:** Theorem 4.10 belongs to §4.4 of the cited 2009 Teschl text.

   **Witness:** teschl line 4991 starts §4.3, “The min-max theorem”; Theorem 4.10 is at line 5044. The actual §4.4 heading is line 5060, after Corollary 4.11. Line 5043 is a running page header.

   **Exact repair text:** Replace every “§4.4” attached to Theorem 4.10 with “§4.3”. In the existing teschl manifest locator replace “sections 2.3 and 4.4” with “sections 2.3 and 4.3”. Keep Theorem 4.10, printed page 119, and the form-domain observation.

   **Repair test:** Reading forward from the §4.3 heading reaches Theorem 4.10 and its form-domain observation before §4.4 begins. The previous r1a F04 diagnosis was incorrect; implementing it created this locator defect. The r1b section attribution was correct.


2. **F02** (P1) The general convolution route omits the nearby-cycle input for tameness

   **Location:** `packages/CongruenceSpectralGap/README.md:588`, “preservation of these local conditions”; “Prove these general concentration and local-condition steps using compact/ordinary comparison and duality”; its Needs clause at line 608.

   **Claim:** The listed inputs give the general convolution theorem, including preservation of tameness at zero. The new conductor criteria supply lissity and rank on Gₘ, but their stated conclusions do not supply this boundary assertion.

   **Witness:** katz-gkm lines 2616–2626 use an inertia-equivariant vanishing-cycle sequence. `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:11` assigns these functors elsewhere. `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:519`, §§0.5–0.8, supplies the required machinery.

   **Exact repair text:** Add this supplier contract and its reference to §4.2b's Needs:

   > LefschetzPencilsAndVanishingCycles §§0.5–0.8 supplies nearby and vanishing cycles over excellent henselian traits, the inertia-equivariant specialization sequence, coefficient change and rational realization. Apply these to the compactification of the multiplication family over the strict henselization at zero.

   In the Swan-constancy target, replace “smooth proper morphism” with “separated smooth morphism”; replace its conclusion with:

   > If a_L is locally constant, prove that (C,j₍!₎L) is universally locally acyclic over S. If f is also proper, every Rⁱ(f∘j)₍!₎L is lisse and its formation commutes with base change.

   Add the following proof step to the general convolution target:

   > To prove tameness at zero, work at finite coefficient level, kill the tame inertia of the two inputs by a prime-to-p Kummer pullback, and extend them across zero. In the coordinates (x,t), compactify F(1/x)⊗G(tx) on P¹×A¹ by extension by zero. Apply the local-acyclicity conclusion away from (∞,0), and the supplied inertia-equivariant specialization sequence at that point. Its vanishing-cycle term reduces to F₀ tensored with the corresponding term for G(tx). The translation isomorphism identifies the latter family's generic compact cohomology with constant cohomology. The sequence gives unipotent inertia, hence trivial wild inertia. Use finite-étale descent for the Kummer torsor to relate the pulled-back direct image to the convolution of the pulled-back inputs, as in Katz’s Proposition 5.2.1.1. Pass through coefficient change and rationalization and descend the tame pullback. (katz-gkm, proof of Proposition 5.2.1, pp.67–71, lines 2516–2665.)

   **Repair test:** Rank-two lissity on Gₘ alone admits Lψ(1/t)⊕1, with Swan₀=1, as well as Kl₂, with Swan₀=0; the current rank calculation cannot distinguish them. The repaired sequence forces the wild inertia to be trivial, giving Swan₀(Kl₂)=0 also in characteristics 2 and 3. Laumon’s separated smooth local criterion is at laumon-swan lines 391–419; properness is added only for its direct-image corollary, lines 423–426. The new supplier precedes this roadmap (merge-order positions 65 and 107), so this repair introduces no upward dependency.

## Earlier findings: verification at this head

The identifiers below retain the originating pass, since both earlier reports used F01–F04. Quotations are from the current package, not from the repair report.

| Earlier finding | Status | Current passage and independently checked witness |
|---|---|---|
| r1a F01, modular area locator | Repaired | README:62: “Layer 6, item 1, supplies the level-one modular polygon and signature”. FuchsianOrbifolds README:235 supplies polygon Gauss–Bonnet; line 349 supplies that signature. The calculation is 2π(−2+1+1/2+2/3)=π/3; index six gives 2π for Γ(2). |
| r1a F02, nondiscriminating zero Checks | Repaired | README:175: “For every allowed Γ there is an operator-domain u with Δu≠0”; line 197: “there is a nonzero L² vector in the mean-zero subspace”; line 447: “Dropping the factor 1/s would give the inverse transform φ(5)=0.” The three old zero Checks are gone; each affected definition still has three discriminating Checks. The valid G=0 API remains outside the Checks. |
| r1a F03, conductor prerequisites | Repaired | README:567: “Curve Euler–Poincaré”; line 577: “Swan-constancy criterion”; line 588: “rank(F*G)=rank(F)Sw∞(G)+rank(G)Sw∞(F)”. The conductor owners and rational-adic extension are now explicit; ranks two and three give five, not six. Those requested conductor repairs are present. The expanded local-condition proof exposes a further nearby-cycle omission: S02. |
| r1a F04, min–max locator | Not repaired; the previous diagnosis was wrong | README:800: “§4.4, Theorem 4.10”. This implements the earlier recommendation but makes the locator wrong. The actual section begins at teschl line 4991; the next actual heading is line 5060. S01 repairs this regression. |
| r1b F01, redundant boundary gap | Repaired | README:98 now requests “nonnegative full finite self-pair coefficients including ramified primes, coefficient one at n=1 and a positive residue”. Boundary continuity has been removed from this gap in both README and plan. README:365 derives it: for μ=±1/5 every boundary gamma argument has real part at least 3/5; subtracting the sole simple pole leaves a regular boundary. AL.3's continuation and boundary targets supply the stated inputs. |
| r1b F02, process narrative | Repaired | README:796 now starts the ordinary reference list, “lrs95.”. The manifest-process sentence is absent; the complete README and Lean docstrings contain no pull-request number or review/build narrative. |
| r1b F03, unverified attribution of LRS errors | Repaired | README:790 states “The cutoff is normalized by its multiplicative mass” as this package's convention. The indicator of [1,2] has ordinary mass 1 and multiplicative mass log 2; q=5 at n=1 has coefficient 2−1=1. The package no longer claims that the unread LRS text contains either mistake. |
| r1b F04, proof-irrelevance API | Repaired | README:136: “Prove independence of F”. The API at lines 142–143 concerns actual fundamental domains and finite measure, not independence of a proof of a proposition. CongruenceSubgroup.IsCongruenceSubgroup is Prop at the pin; its proof independence would have supplied no measure theorem. |
| r1b F05, forward upper-bound reference | Repaired | README:205: “Prove 0≤λ′₁(Γ)”; line 269: “The API also proves λ′₁(Γ)≤1/4”. The upper bound now follows §0.6. For the multiplication model with spectrum [1/4,∞), the infimum is 1/4, requiring that spectral input. The later bound appearing as a Check in §0.4 is not used to construct its infimum. |
| r1b F06, Γ₀(N) agreement | Repaired | README:168: “with equal domains and actions under the measure-preserving identification”. This is an explicit API target for N≥1. AutomorphicSpectralTheory §1.16a, README:1313, uses the same curvature and effective quotient. At N=1 both actions on a compact smooth lift are −y²(∂ₓ²+∂ᵧ²), with measure dxdy/y². |
| r1b F07, analytic record owner | Repaired | README:106: “Layer 0 supplies LFunctions.AnalyticLFunctionData and its predicates”. LFunctions README:320 and Suggested.lean:121,127,133,139 supply the record interface and four predicates; these are planned supplier declarations, not claims of pinned implementation. All five resolver leads are accounted for. |
| r1b F08, finite-place ownership | Partly repaired; settled external remainder | README:22: “The finite-place Luo–Rudnick–Sarnak bound over number fields belongs to TauCetiRoadmap.AutomorphicSpectralTheory §7.1a.” That section exists at its current version (README:3793), and still owns the quantitative cuspidal bound. The repair report's reason for leaving base-roadmap proof-route coordination outside this package is valid. This review does not re-raise it. |

## Verified sound

Read all **801 README lines**, all **83 Suggested.lean lines**, and all **4 declarations** (one definition, three theorems). Audited **28 numbered target sections**, including the **three additional bold subtargets** within §4.2b, and the bold Summary through the headline inventory. Recomputed **104 Check bullets** in the table below. Resolved citations to **19 distinct supplier roadmaps**, checked **30 explicitly named pinned declarations**, and inspected **21 distinct locator groups in five readable works**, including the source proof steps needed for S02. These are coverage counts, not certification of LRS or of future supplier implementations.

The following tables use README line numbers in `packages/CongruenceSpectralGap/README.md` and Lean line numbers in `packages/CongruenceSpectralGap/Suggested.lean`. “Retain” means the displayed calculation did not refute the statement; it does not claim a proof of a future roadmap theorem. Source and dependency defects are reported separately.

### Lean declarations and full contexts

There is no section-variable block. Each declaration explicitly carries its binders; the supplied elaborated signatures retain them all. Compared all four signatures with the README. No Lean command was run: the supplied elaboration evidence was used in accordance with the read-only instruction.

| Declaration; section; line | Explicit context and typing | Instances and values on both sides | Result/change |
|---|---|---|---|
| hyperKloosterman; §4.2a; 37 | F : Type u; Field F; Fintype F; k : ℕ; ψ : AddChar F ℂ; r : Fˣ. Unit-product condition and additive sum use Fin k; no positivity/nontriviality hypothesis in the definition. | k=0: empty tuple gives 1 at r=1 and 0 elsewhere. F₂: k=1 gives −1, k=2 gives 1. F₃,k=2: r=1,−1 give −1,2. | Real body on native carriers; all natural ranks intentional. |
| hyperKloosterman_bound; §4.2b; 46 | Same universe and field instances; hk : 1≤k; hψ : ψ≠1; unit r. The exponent is real (↑k−1)/2. | F₄ trace character gives k=1 values (1,−1,−1), norms 1≤1; k=2 values (3,−1,−1), norms ≤4; k=3 values (5,−3,−3), norms ≤12. Without hψ, F₅,k=3 gives 16>15. Without hk, F₂,k=0 gives 1>0. | Deep general estimate; retain. Proof-route omission S02. |
| gauss_power_even_average_bound; §4.3; 57 | q : ℕ; Fact q.Prime; NeZero q; 2<q; k : ℕ; 1≤k; r : (ZMod q)ˣ. Star is complex conjugation; characters vanish on nonunits. | q=3,k=1,2: empty sum 0. q=5,k=2: values ±5, bound 8√5+1. If k=0,q=7,r=1, left 2>right 1. | Deep finite-sum bound; no free analytic stand-in. NeZero is an explicit elaboration instance. |
| congruence_eigenvalue_bound; §5.3; 73 | Γ≤SL₂(ℤ), actual congruence proof, u:ℂ→ℂ, real C² regularity on Im>0, invariance on ℍ, boundedness there, nonconstancy there, λ:ℝ and the negative Euclidean Laplacian equation on ℍ. | Constant 1 has λ=0 and fails nonconstancy. E(z,3/2) has λ=−3/4 and fails boundedness. For the noncongruence trivial subgroup, e^(iz) is bounded by 1, harmonic and nonconstant, so λ=0: the congruence hypothesis matters. y^s gives s(1−s), hence 1/4+t² at s=1/2+it. | Matches README. Boundedness gives norm²≤C² area; maximal domain and kernel remove λ=0; λ∫u=0 gives mean zero. Values of u outside ℍ cannot change the statement. |

None of the three theorem declarations follows by one existing library lemma or a one-tactic unfolding of the kept definition. No boundary example, API lemma, computation, sorry'd data, placeholder predicate, lost instance, set_option or extra import occurs. All four own names occur in the README, and its own backticked declaration names resolve to these four.

### Headline inventory

| Headline | Pin-level acceptance decision |
|---|---|
| Arbitrary-congruence spectral description and Rayleigh/clipped-bottom comparison (§§0.6–0.7) | Missing quotient closed-energy/Friedrichs carriers; the module docstring names the spectral comparison and this obstruction. |
| Exceptional cuspidal dictionary and spherical cuspidal adjoint (§§1.1–1.3) | Missing canonical automorphic representation, occurrence and lift carriers; explicitly named in the docstring. |
| Prime-twist equation, all-prime coefficients and forced zero (§§2.1–2.2) | Missing canonical Rankin–Selberg functions and gamma families; the docstring identifies these dependencies. |
| Exact two-kernel identity and uniform estimates (§§3.3–3.4) | Same missing arithmetic carriers; explicitly named. Bare functions would weaken the theorem. The elementary cutoff definitions alone do not replace this headline. |
| Rational-adic Euler–Poincaré, Swan criterion and Kloosterman sheaf realization (§4.2b) | Missing lisse-sheaf, rational direct-image and local-conductor carriers; all three explicitly named in the docstring. |
| General numerical hyper-Kloosterman estimate (§4.2b) | Statable and present as hyperKloosterman_bound, including extension fields and p dividing k. |
| Gauss-power average estimate (§4.3) | Statable and present as gauss_power_even_average_bound. The exact finite orthogonality identity is part of its README route, not an omitted automorphic theorem. |
| First-moment asymptotic and dyadic nonvanishing (§§4.4–4.5) | Missing canonical automorphic L-functions; both named in the docstring. |
| Spherical real-place parameter bound (§5.1) | Missing automorphic representations and canonical archimedean parameters; named in the docstring. |
| Congruence gap (§5.3) | Native bounded classical eigenfunction version is present. The Rayleigh formulation's missing operator carrier is explained. The converse use for small spectrum is justified by cuspidality and boundedness. |
| Operator/form Rayleigh inequality and metric scaling (§§5.4–5.5) | Missing canonical energy domain and quotient realization; all named in the docstring. |

### Statement and construction computations

For operator-model tests write A=diag(0,21/100,1/4) on ℂ³, with first coordinate the constant line. These are tests of formulas, not assertions that a congruence quotient has an equality eigenfunction. Let V denote the positive quotient area.

| Statement or API; README location | Instance and computed values on each side | Result/change |
|---|---|---|
| Conventions: effective action; 26 | Γ(1),Γ(2),Γ(3): effective indices 1,6,12 and areas π/3,2π,4π; central kernels have sizes 2,2,1. Dividing again at level three would halve 4π incorrectly. | Retain. |
| Conventions: differential sign; 28 | 1↦0; y²↦−2y²; y^s↦s(1−s)y^s. With s=1/2+it this is (1/4+t²)y^s, not its negative. | Retain. |
| Conventions: complex energy/mean; 30 | q(ie,ie)=q(e,e)=21/100; integrals of 1 and i are V and iV, both nonzero. | Retain; locator S01. |
| Conventions: parameter symmetry; 32 | r=1/5 gives adjoint {2/5,0,−2/5}, λ=21/100, β₀=4/5 for that adjoint. | Retain. |
| Conventions: conductor and epsilon; 34 | f=4,d=4: norm of normalized epsilon is 2q²/(2q²)=1; replacing τπ by a unit would give 1/2. q∤fπ implies q∤f since the unramified self-pair has conductor exponent zero. | Retain. |
| Conventions: positive additive character; 34 | q=3: ψ(1)=−1/2+i√3/2; 1+ψ(1)+ψ(2)=0; principal Gauss sum −1. Negative Fourier convention reverses the imaginary part. | Retain. |
| Conventions: Mellin inversion/reflection; 36 | ds=i dt gives (2πi)⁻¹ds=(2π)⁻¹dt; [1,2] reflects to [1/2,1]; the Mellin parameter changes s→−s. | Retain. |
| §0.1 measure and domain-independence; 136–143 | Fundamental domains F and γF each have area V and the same quotient pushforward; an overlapping doubled domain gives 2V. Zero measure has mass 0 rather than V>0. | Retain. |
| §0.2 construction/density/self-adjointness; 158–164 | A*=A; domain ℂ³ is dense; pairing is (21/100)∣z₂∣²+(1/4)∣z₃∣²≥0. Negative A gives negative value on e₂. | Retain. |
| §0.2 kernel iff constants; 167 | Az=0 iff z₂=z₃=0. A constant has energy 0; a nonconstant free-chart bump has positive energy. The zero operator would kill all three coordinates. | Retain both directions. |
| §0.2 agreement/maximal domain; 168–169 | Γ₀(1): both differential expressions send y² to −2y² locally. If a bounded eigenfunction has equation λu, its distributional Laplacian has norm²=λ²‖u‖²<∞, giving maximal-domain membership; restriction of the maximal operator gives the same expression. | Retain. |
| §0.2 finite-cover descent; 160 | N=1,2 gives torsion-free levels 3,6. For an S₃ action, averaging over a transposition fixes a 3-dimensional subspace of the regular 6-dimensional representation; full averaging has dimension 1, and each projection squares to itself. | Retain; no freeness assumed at elliptic points downstairs. |
| §0.2 cusp cutoff example; 283 | Width w: discarded L² mass ≤w/R and energy (w/R)∫₁²∣χ′∣². At 2R both bounds halve; both approach 0. Constants therefore survive the form closure. | Retain. |
| §0.3 kernel of mean; 183–190 | ⟨1,u⟩=∫u; constants give V or iV; a bump minus its average gives 0. Its norm is nonzero unless the bump was constant. | Retain both directions; the real-mean kernel would wrongly include i. |
| §0.3 reduction and image; 183,191 | Model H⁰={(0,z₂,z₃)}; Az=(0,.21z₂,.25z₃), with first component zero. Constant projection and A commute, each composite being zero. | Retain. |
| §0.4 nonempty Rayleigh set and lower bound; 205–213 | e₂ gives .21, e₃ gives .25; every nonzero H⁰ vector gives a weighted average in [.21,.25]. Infimum .21; lower bound 0≤.21. | Retain; declared core gap needed for domain equality. |
| §0.4 scale invariance/attainment API; 213–219 | e₂ gives .21/1=.21; 2ie₂ gives .84/4=.21. A lower bound λ plus an eigenvector of eigenvalue λ gives inf≤λ and λ≤inf. | Retain. |
| §0.5 clipped definition and upper API; 227–234 | S=∅,{.21},{1/3} gives .25,.21,.25. For r∈S these values are ≤r when the union is bounded below; an unbounded negative set is outside that hypothesis. | Retain. |
| §0.5 lower API; 235 | c=.2,S={.21}: .2≤.25 and .2≤.21 give .2≤.21. S=∅,c=.26 fails the threshold premise and .26≤.25 is false. | Retain. |
| §0.6 residual and continuous parts; 249–251 | Γ(1): residual projection of 1=(3/π)(π/3)=1, one cusp channel. Γ(2): (1/(2π))(2π)=1, three channels. A residual eigenvalue .2 would contradict constants-only residual spectrum. | Retain conditional on the two level gaps. |
| §0.6 components/invariant passage; 251 | Principal levels 1,2,5 have 1,1,4 positive-determinant components. Characters of the four-component group isolate one component by their finite Fourier projector. For level two, S₃ invariants have dimensions 6,3,1 for trivial/transposition/full deck subgroups. | Retain; no Γ₀ substitution. |
| §0.7 Rayleigh/clipping equality; 265–269 | Spectrum [1/4,∞) alone gives inf=.25 and empty small spectrum; adding a .21 eigenvalue gives inf=.21. Adding a threshold eigenvalue still leaves the small set empty and inf=.25. Adding the constants incorrectly gives inf=0. | Retain; locator S01. |
| §1.1 exceptional dictionary; 295–299 | r=.2 gives .25−.04=.21 for both common parities. r=0 and r=.5 give .25 and 0, excluded endpoints. Passing Γ(3) to itself preserves λ=.21. | Retain conditional on principal-level comparison. |
| §1.2 self-twist temperance; 313–317 | Real quadratic unitary characters have exponent real parts (0,0), incompatible with (.2,−.2). Imaginary quadratic (z/∣z∣)^k∣z∣ℂ^(it) has modulus 1. Real norm shift σ=1 has central absolute exponent 2, σ=0 gives 0. | Retain; discrete-series gamma shifts are not mistaken for Weil exponents. |
| §1.3 adjoint specialization; 331–335 | Input diag(2,3) has adjoint diag(2/3,1,3/2), determinant 1; raw Sym² gives (4,6,9). Common sign divides out, as does the factor θ² in a common twist. | Retain. |
| §2.1 full coefficient positivity and asymptotic; 361 | Ramified rank-one χ_p paired with χ_p⁻¹ has (1−p⁻ˢ)⁻¹, coefficient at p equal 1, whereas deletion gives 0. b(1)=1; Wiener–Ikehara gives x⁻¹Σb(n)→cπ>0. | Retain conditional on positivity gap; example tests ramification, not the m≥2 conclusion. |
| §2.1 primitive local twist; 365 | m=2,3 give d=4,9, twisted local factor 1 and conductor fq⁴,fq⁹. At p≠q the retained coefficient is b(pᵃ)χ(p)ᵃ. | Retain conditional on transport gap. |
| §2.1 parity and regular boundary; 365 | Even χ preserves gamma arguments; odd χ shifts the real sign type by 1. μ=±.2 gives self-pair shifts (.4,0,0,−.4), so Re s≥1 has all arguments of real part ≥.6. A pole-subtracted simple self-pair is then regular on the boundary. | Retain; repaired redundant gap verified. |
| §2.2 forced zero; 381–385 | At β₀=.4 the diagonal gamma factor has order −1; an entire completion has order ≥0, so finite L has order ≥1. Re s>.4 has no gamma pole. At β₀=0 the strict hypothesis fails. | Retain; no total-value infinity used. |
| §2.2 gamma convention; 385 | Γℝ(0)=0 at the pin, but punctured sΓℝ(s)→2. Orders −1+1=0 can give a nonzero completed value while finite L vanishes. | Retain. |
| §3.1 definition, inversion and tails; 411–420 | For a normalized smooth cutoff supported in [1,2], F₁(.5)=1,F₁(3)=0. Integrating x^(s−1) from 0 to y gives yˢ/s, hence M(F₁,s)=M(φ,s)/s. φ=0 gives all values 0 but is excluded by normalization. | Retain. |
| §3.1 dilation; 424 | φ_c(y)=φ(y/c) gives F₁(φ_c,x)=F₁(φ,x/c); for c=2 the transition interval [1,2] moves to [2,4], with no factor 2 in the value. | Retain. |
| §3.2 definition and G=0 API; 434–442 | G=0 gives integral 0 and F₂=0; G=1 gives reflected tail. For normalized support [3,4], x=.2 gives 1 and x=2 gives 0. | Retain; zero identity is an API, not a padding theorem. |
| §3.2 signed argument; 446 | G(w)=w gives βT−φ(1/x), with T the reflected tail; changing β−s to β+s gives βT+φ(1/x). At a point where φ(1/x)=a≠0 the difference is 2a. | Retain. |
| §3.3 decay and pole orders; 456–460 | Right contour Re s=B gives x^(−B); exponential factors exp(−πd∣t∣/4) cancel in G. At σ+β₀=1 a pole of order d=4 together with 1/s has order ≤5, producing log degree ≤4, bounded by x^(−ε). | Retain; constants do not depend on q,Y. |
| §3.3 near-zero integrability; 468 | σ=.5,β₀=.4,ε′=.1 gives powers x^(−.5) and x^(−.5); each integral on (0,1) equals 2. ε′<.6 is satisfied. | Retain. |
| §3.4 exact two-kernel equation; 474–478 | Residue is M(φ,0)Lχ(β)=Lχ(β). At β=.5 the two n-powers are n^(−.5), with χ versus χ̄. Y=2→4 sends dual argument a→2a. Zero cutoff gives residue and both sums 0 and fails M(φ,0)=1. | Retain conditional on analytic-record gap. |
| §4.1 finite average and family congruence; 504–512 | With L≡1,fπ=1, Q=0,1,2,3 gives 0,0,0,1. Changing fπ to 5 at Q=3 gives 0; fπ=0 excludes every prime. Equal selected values give equal sums; all-zero selected values give 0. | Retain, including junk conductor values only in the general finite definition. |
| §4.2 pointwise orthogonality; 527 | q=5: a=0,±1,±2 gives 0,1,−1; q=3 gives 0 everywhere. At a=±1 the expression is (q−1)/2−1, not (q−1)/2. | Retain. |
| §4.2 smoothed identity; 527 | Each selected residue at q=5 gets coefficient 2−1=1; other units get −1, nonunits 0. At n=1 the main contribution is exactly 1, not 2. | Retain. |
| §4.2a raw sum and rank zero; 545–550 | k=0 product is 1 and additive sum 0, so raw value δ_(r=1). k=1 fibre {(r)} gives ψ(r). F₂ all-unit tuple gives (−1)^k. | Retain. |
| §4.2a transport/scaling; 551–552 | Identity field isomorphism leaves each summand unchanged. Multiplying all k coordinates by a multiplies the product by aᵏ; F₃,a=−1,k=2 gives a²r=r and unchanged values −1,2. | Retain. |
| §4.2a trivial character; 553 | For k≥1 the tuple count is (q−1)^(k−1); F₅,k=3 gives 4²=16, compared with nontrivial-character bound 15. | Retain. |
| **Curve Euler–Poincaré**; 567 | Constant rank r on Gₘ: χ_c=0, on P¹: χ_c=2r. Nontrivial Kummer on Gₘ: χ_c=0 with all cohomology 0. AS(xᵃ) on A¹: χ_c=1−a, hence 0 at a=1 and −1 at a=2,p odd. Rank zero gives 0=0. | Retain; rational extension belongs here before the later generic owner. |
| **Swan-constancy criterion**, conductor definition; 577 | Constant A¹ family: (ΣSw,a)=(0,1), H_c² rank 1; proper P¹ with empty D gives (0,0), ranks (1,0,1). Nonreduced doubling of a section does not double its geometric cardinality: a remains 1. | Retain stated direct-image corollary; extend local conclusion for S02. |
| **Swan-constancy criterion**, necessity; 577 | AS(tx): t≠0 gives Sw∞=1,a=2,H_c*=0; t=0 gives Sw∞=0,a=1,H_c² rank 1. D:x²=t in odd p has two→one geometric points, a=2→1 and H_c¹ rank 1→0 despite Swan sum 0→0. | Retain; Swan-only test would be false for colliding boundary. |
| **Kloosterman realization**, AS base; 588 | k=1: mult=id, R⁰ is rank 1 and other degrees 0; nontrivial AS character has Sw₀=0,Sw∞=1, weight 0, trace ψ. Trivial character has Sw∞=0 and fails the assumption. | Retain. |
| **Kloosterman realization**, general concentration/rank; 588 | Kl_k(x)⊗AS(t/x) has Swans k,1, χ_c=−(k+1), H_c⁰=H_c²=0, rank H_c¹=k+1; conductor sum (k+1)+2k=3k+1. k=1,2 give (rank,a)=(2,4),(3,7). | Retain numerical identities; S02 supplies missing local argument. |
| **Kloosterman realization**, general convolution local laws; 588 | Kl₂*Kl₃ gives rank 2·1+3·1=5 and Swan∞=1·1=1; product of ranks would give 6. A zero input gives rank and Swan 0. A nonzero constant input has tame infinity and is excluded. | S02: tameness at zero requires the named nearby-cycle input. |
| **Kloosterman realization**, trace/purity/base extension; 588–596 | k=2,F₃: raw values (−1,2), trace values (1,−2), eigenvalue norms √3. F₂: raw 1, trace −1. Over F′, rank stays k and eigenvalue norm is ∣F′∣^((k−1)/2). | Retain; degree shift contributes (−1)^(k−1). |
| §4.2b numerical bound; 590 | F₄,k=1,2,3 gives norms at most 1,3,5 against bounds 1,4,12. In characteristic two, k=2,r=1 gives 1≤2√2; no p∤k condition occurs. | Retain. |
| §4.3 exact Gauss identity; 612–616 | q=3,k=1 gives −1−(−1)=0; k=2 gives (−1+2)−1=0. q=7,k=0,r=1 gives 3(1+0)−1=2. | Retain. |
| §4.3 norm bound; 612–618 | q=5,k=2 gives ±5, norm 5≤8√5+1. k=0,q=7 would give 2>1; r nonunit is excluded before the fibre argument. | Retain positive-rank binder. |
| §4.4 moment and uniform error; 633–637 | d=4,σ=.9: exponent 1+5(.1)/2=1.25; d=9,σ=.8,.9: exponents 2,1.5. Half the dyadic prime sum has leading coefficient (1/2)(4−1)/2=3/4. | Retain; source proof remains uncertified. |
| §4.4 balancing/divisor route; 637 | d=4,9 gives Y=Q^2.5,Q⁵; Y/Q=Q^1.5,Q⁴→∞, Y/Q^d=Q^(−1.5),Q^(−4)→0. At n=2 the divisor majorant is τ(1)+τ(3)=3; n=1 would use τ(0), so it is removed first. q∣n contributes χ(n)=0. | Retain; no pointwise bound on b(n) assumed. |
| §4.5 nonvanishing; 652–656 | m=2,3 lower strip boundaries .6,.8; equality gives exponent 2 and fails domination by Q²/log Q. At σ=.9 there is a positive exponent margin. Complex summands 1+i,−1 add to i≠0. | Retain; only existence of one nonzero summand follows. |
| §5.1 parameter contradiction; 682–686 | m=3: bound .5−.1=.4; if β₀>.8, §2.2 says every twist value 0 while §4.5 provides one ≠0. Equality β₀=.8 is not in that strict region. For m=2 the bound .3 only yields λ≥.16. | Retain weak endpoint. |
| §5.2 arithmetic; 700–704 | r=.2 gives .21; r=0 gives .25; r=.3 gives .16 and violates 2r≤.4; r=−1 satisfies the latter but gives −.75, so r≥0 is necessary. | Retain in README only; no padding Lean theorem. |
| §5.3 geometric gap; 718–722 | Every exceptional value has r≤.2 and λ≥.21; empty small spectrum gives .25≥.21. Old .1875 versus .21 is improvement 9/400. | Retain conditional on supplier gaps. |
| §5.3 classical eigenfunction; 724 | Boundedness gives ‖u‖²≤C²V; λ=0 would imply constant by kernel; λ≠0 implies λ∫u=0 and hence ∫u=0. Nonconstancy and continuity give positive L² norm, so its Rayleigh quotient equals λ. | Retain, as in Lean table. |
| §5.4 form and operator inequalities; 741–745 | Zero vector gives 0≥0. Equality model e₂ gives .21=.21; 2ie₂ gives .84=.84. Constant 1 gives 0<.21V and fails mean zero. Form-core approximants (1−1/n)e₂ have energy .21(1−1/n)² and norm² (1−1/n)². | Retain; core gap remains declared. |
| §5.5 metric/measure/operator; 759–763 | κ=4 gives g/4, volume/4, operator 4Δ, unchanged two-dimensional energy; curvature −4. Same u has norm² .25, energy .21, quotient .84. Threshold becomes 1. | Retain; positive κ excludes zero and negative metrics. |
| §5.5 scaled infimum and examples; 759,778 | κ=1 gives identity; κ=4 gives .84/4=.21. Consumer arithmetic (.21)(π/3)/(8π)=7/800, with nonzero denominator 8π. | Retain; no conformal-area theorem inferred. |

### All 104 README Checks

Each row is one existing Check bullet, in file order. No Check is imported from an earlier pass without recomputation.

| Section; line | Computed test | Result/change |
|---|---|---|
| 0.1; 147 | Γ(1): π/3; central doubling would give 2π/3. | Retain. |
| 0.1; 148 | Every allowed area V>0; the zero measure gives 0 and fails. | Retain. |
| 0.1; 149 | F and its translate each give V; an overlapping double copy gives 2V and is not a fundamental domain. | Retain. |
| 0.1; 150 | Γ(2): 6·π/3=2π; level-independent π/3 is wrong. | Retain. |
| 0.2; 173 | Constant 1 has finite norm²=V and Δ1=0; excluding it by a cusp boundary condition fails. | Retain. |
| 0.2; 174 | Model Δe₂=.21e₂≠0, pairing .21>0; replacing Δ by −Δ gives −.21. | Retain. |
| 0.2; 175 | Free-chart nonconstant bump has positive energy and Δu≠0; zero operator gives Δu=0 for every u. | Retain. |
| 0.3; 195 | ∫1=V≠0, so 1 is excluded. | Retain. |
| 0.3; 196 | ∫i=iV≠0, but Re∫i=0: the real-only kernel is wrong. | Retain. |
| 0.3; 197 | For a nonconstant bump b, ∫(b−V⁻¹∫b)=0 and its L² norm is positive; zero submodule misses it. | Retain. |
| 0.4; 217 | e₂: (.21)/1=.21; 2ie₂: (.84)/4=.21; norm-only denominator gives .42. | Retain. |
| 0.4; 218 | An eigenvector of eigenvalue λ gives quotient λ; the universal lower premise gives all quotients ≥λ, so inf=λ in both directions. | Retain. |
| 0.4; 219 | The final bound gives λ′₁≥.21>0; retaining constant 0 would give inf=0. This is a future acceptance Check, not a premise of the construction. | Retain. |
| 0.5; 239 | inf{.25}=.25 for empty S. | Retain. |
| 0.5; 240 | inf{.25,.21}=.21. | Retain. |
| 0.5; 241 | inf{.25,1/3}=.25, not 1/3. | Retain. |
| 0.6; 255 | Level one projection: (3/π)(π/3)=1; cusp multiplicity 1. | Retain. |
| 0.6; 256 | Level two projection: (1/(2π))(2π)=1; cusp multiplicity 3, not 1. | Retain. |
| 0.6; 257 | (1/2+it)(1/2−it)=.25+t²; t=0 gives .25. Residual .2 is incompatible with residual constants of eigenvalue 0. | Retain. |
| 0.7; 273 | Empty small spectrum: inf{.25}=.25. | Retain. |
| 0.7; 274 | S={.21}: inf=.21; eigenvalue .25 alone leaves S empty and inf=.25. | Retain. |
| 0.7; 275 | Excluding zero leaves positive bottom ≥.21; inserting zero makes the clipped infimum 0. | Retain. |
| 1.1; 303 | r=1/5, ε=0 or 1: .25−.04=.21. | Retain. |
| 1.1; 304 | r=0 gives .25; r=.5 gives 0; neither is in (0,.25). | Retain. |
| 1.1; 305 | Γ=Γ(3): principal comparison is identity on the group and preserves λ; a deck projector P satisfies ΔPu=PΔu=λPu. | Retain. |
| 1.2; 321 | Re(it₁)=Re(it₂)=0, whereas complementary exponents have real parts .2,−.2. | Retain. |
| 1.2; 322 | For the imaginary-quadratic unitary character, modulus is 1 and its Weil induction is unitary; k=1 gives a nonzero discrete gamma shift without non-temperedness. | Retain. |
| 1.2; 323 | σ=1 gives central exponent 2; σ=0 gives 0. | Retain. |
| 1.3; 339 | r=.2 gives ratios with exponents .4,0,−.4. | Retain. |
| 1.3; 340 | (sgn·absʳ)/(sgn·abs⁻ʳ)=abs²ʳ; the two signs cancel to 1. | Retain. |
| 1.3; 341 | Common θ gives Sym² factor θ² and determinant inverse θ⁻²; product 1, while omitting the inverse leaves θ². | Retain. |
| 2.1; 369 | m=2 gives d=4; primitive local twist has L=1 and conductor q⁴, not q². | Retain. |
| 2.1; 370 | f=4: normalized norm 2q^(d/2)/(2q^(d/2))=1; incorrectly unit τπ would give 1/2. | Retain. |
| 2.1; 371 | Ramified χ_p×χ_p⁻¹ has local factor (1−p⁻ˢ)⁻¹ and coefficient b(p)=1; omission would make it 0. | Retain. |
| 2.1; 372 | Odd χ changes real parity 0→1 and Γℝ(s−μ)→Γℝ(s−μ+1); even χ leaves it unchanged. | Retain. |
| 2.1; 373 | μ=±.2 gives shifts .4,0,0,−.4, with poles shifted left by 2ℕ; rightmost .4<1. On Re s≥1 all arguments have real part ≥.6. | Retain. |
| 2.2; 389 | r=.2 gives shifts .4,0,0,−.4 and a pole at β₀=.4. | Retain. |
| 2.2; 390 | β₀=0 fails the strict positivity premise; the later contradiction region has β₀>.6 or .8 in ranks two or three. | Retain. |
| 2.2; 391 | Total Γℝ(0)=0, punctured sΓℝ(s)→2, meromorphic order −1; finite L must contribute order ≥1. | Retain. |
| 3.1; 424 | c=2 sends F₁(φ₂,x) to F₁(φ,x/2), with value unchanged; a dy-tail would instead multiply it by 2. | Retain. |
| 3.1; 425 | Normalized positive cutoff supported in [1,2]: F₁(.5)=∫φ/y=1, whereas ordinary unit mass only can give log 2. | Retain. |
| 3.1; 426 | Support ≤2 gives F₁(3)=0. | Retain. |
| 3.2; 446 | G(w)=w: βT−φ(1/x), not βT+φ(1/x); at φ(1/x)=a≠0 the erroneous value differs by 2a. | Retain. |
| 3.2; 447 | Normalized support [3,4], G=1, x=1/5: reflected tail 1; deleting 1/s gives φ(5)=0. | Retain. |
| 3.2; 448 | Same support at x=2: reflected tail 0, unreflected tail 1. | Retain. |
| 3.3; 464 | σ+β₀=1 gives exponent −ε, permitting logarithmic growth; a constant bound would not dominate log(1/x). | Retain. |
| 3.3; 465 | Pole order 4 plus 1/s gives order at most 5, hence logarithm degree at most 4; x^ε(log x)^4→0. | Retain. |
| 3.3; 466 | σ=.5,β₀=.4,ε′=.1: exponents −.5 and −.5; integrals each equal 2. | Retain. |
| 3.4; 482 | Y:2→4 sends nY/(fqᵈ) from a to 2a; denominator Y would send it to a/2. | Retain. |
| 3.4; 483 | β=.5 gives primal n⁻¹ᐟ² and dual n⁻¹ᐟ², with χ versus χ̄. | Retain. |
| 3.4; 484 | Zero cutoff gives both kernels 0 and right side 0, but has Mellin mass 0≠1. | Retain. |
| 4.1; 516 | Q=0: empty interval, sum 0; Q=1: q=2 with no nonprincipal character, sum 0; fπ=0: every prime divides it, sum 0. | Retain. |
| 4.1; 517 | L=1,fπ=1,Q=2: only q=3 and zero selected characters, sum 0. | Retain. |
| 4.1; 518 | L=1,fπ=1,Q=3: only q=5, one selected character, sum 1. | Retain. |
| 4.1; 519 | L=1,fπ=5,Q=3: q=5 removed, sum 0. | Retain. |
| 4.2; 535 | q=3: (q−1)/2−1=0 at both units; at zero the value is 0. | Retain. |
| 4.2; 536 | q=5: at 0,±1,±2 the quadratic-character values are 0,1,−1, exactly the three branches. | Retain. |
| 4.2; 537 | q=5,n=1: 2−1=1, not 2. | Retain. |
| 4.2a; 556 | k=0: empty product 1 gives raw sum 1 at r=1, 0 at r≠1; the claimed positive-rank bound would have right side 0. | Retain. |
| 4.2a; 557 | F₂: sole unit tuple has sum k mod 2, hence (−1)^k; k=1,2 give −1,1. | Retain. |
| 4.2a; 558 | F₃,k=2: r=1 sums ζ²+ζ=−1; r=−1 has two terms 1, giving 2. | Retain. |
| 4.2a; 559 | F₅,k=3,trivial ψ: 4²=16>3·5=15. | Retain. |
| 4.2b Euler–Poincaré; 571 | Constant rank r: Gₘ gives r(2−2)=0; P¹ gives 2r. Omitting Gₘ boundary would give 2r. | Retain. |
| 4.2b Euler–Poincaré; 572 | Nontrivial Kummer: (dim H_c⁰,H_c¹,H_c²)=(0,0,0), χ=0. Constant: (0,1,1), χ=0−1+1=0; equal Euler characteristics do not imply concentration. | Retain. |
| 4.2b Euler–Poincaré; 573 | AS(xᵃ): Sw∞=a and χ=1−a; a=1 gives 0, a=2,p odd gives −1. Extension of coefficients changes neither rank nor these integers. | Retain. |
| 4.2b Swan criterion; 581 | Constant A¹ family: Swan 0,a=1,H_c² rank 1, others 0. Empty boundary P¹: a=0,H⁰,H² rank 1,H¹=0. | Retain. |
| 4.2b Swan criterion; 582 | AS(tx): generic Sw∞=1,a=2,H_c*=0; t=0 gives Sw∞=0,a=1,H_c² rank 1. | Retain. |
| 4.2b Swan criterion; 583 | Kl_k multiplication family: Swans (k,1), sum k+1, conductor 3k+1; k=1 gives (sum,a)=(2,4), k=2 gives (3,7). | Retain. |
| 4.2b Swan criterion; 584 | Boundary x²=t,p odd: geometric cardinality 2→1; Swan 0→0 but a=2→1, H_c¹ rank 1→0. | Retain. |
| 4.2b realization; 600 | k=1: trace ψ, norm 1, bound 1; nontrivial AS has Sw∞=1 even at p=2, trivial character has Sw∞=0. | Retain calculation; proof input S02. |
| 4.2b realization; 601 | Ranks (1,1) yield rank 2, Swan 1; (2,1) yield rank 3, Swan 1; Kl₂*Kl₃ yields rank 5, not 6. Constant nonzero input has Swan 0 and is not totally wild. | Retain calculation; proof input S02. |
| 4.2b realization; 602 | F₃,k=2: raw −1,2; traces 1,−2; norms 1,2≤2√3. | Retain calculation; proof input S02. |
| 4.2b realization; 603 | F₂,k=2: raw 1, trace −1; 1≤2√2. | Retain calculation; proof input S02. |
| 4.2b realization; 604 | F₂,k=0,r=1: raw 1 versus proposed rank-zero right side 0; hk cannot be dropped. | Retain calculation; proof input S02. |
| 4.3; 622 | q=3,k=1: Kl₁(1)+Kl₁(−1)=−1, so −1−(−1)=0, matching empty sum. | Retain. |
| 4.3; 623 | q=3,k=2: Kl₂(1)+Kl₂(−1)=−1+2=1, so 1−1=0. | Retain. |
| 4.3; 624 | q=5,k=2: τ²=5, quadratic values 1,−1, giving ±5; norm 5≤8√5+1. | Retain. |
| 4.3; 625 | q=7,k=0,r=1: two selected characters, sum 2; exact identity 3(1+0)−1=2, proposed bound 1<2. | Retain. |
| 4.4; 641 | d=4,σ=.9: error exponent without ε is 1+5/20=5/4<2. | Retain. |
| 4.4; 642 | d=9: σ=.8 gives 2; σ=.9 gives 3/2. The equality threshold has no positive power margin. | Retain. |
| 4.4; 643 | Half the dyadic prime integral gives coefficient (1/2)(4−1)/2=3/4, not 1/2. | Retain. |
| 4.4; 644 | n=1 gives n−1=0 divisible by every prime; separating n=1 leaves positive n−1,n+1, e.g. n=2 gives τ(1)+τ(3)=3. | Retain. |
| 4.5; 660 | m=3: lower boundary .8 excluded; β=.9 is above it and below 1. | Retain. |
| 4.5; 661 | m=2: lower boundary .6; at equality exponent 2 cannot be dominated by Q²/log Q. | Retain. |
| 4.5; 662 | (1+i)+(−1)=i≠0; at least one summand is nonzero, with no positivity conclusion. | Retain. |
| 5.1; 690 | m=3: 1/2−1/10=2/5. | Retain. |
| 5.1; 691 | m=2: 1/2−1/5=3/10; .25−.09=.16=4/25, weaker than .21. | Retain. |
| 5.1; 692 | β₀=1−2/(m²+1) is outside the strict region; the resulting parameter inequality includes equality. | Retain. |
| 5.2; 708 | r=.2: 2r=.4 and .25−r²=.21. | Retain. |
| 5.2; 709 | r=0: .25; r=.3: .16 and 2r=.6>.4. | Retain. |
| 5.2; 710 | r=−1: 2r=−2≤.4 but .25−r²=−.75<.21. | Retain. |
| 5.3; 728 | 3/16=75/400; .21=84/400; .25=100/400; improvement 9/400. | Retain. |
| 5.3; 729 | Empty small spectrum: λ′₁=.25≥.21. | Retain. |
| 5.3; 730 | Γ(0)={I} has infinite index and is excluded by N≠0; its bounded harmonic e^(iz) would have λ=0<.21. Finite index alone does not supply a positive-level Γ(N) inclusion. | Retain. |
| 5.3; 731 | u=1: Δu=0, equation forces λ=0<.21, and nonconstancy fails. | Retain. |
| 5.3; 732 | E(z,3/2): λ=(3/2)(−1/2)=−3/4; its y^(3/2) cusp growth violates boundedness. | Retain. |
| 5.3; 733 | Euclidean Δyˢ=s(s−1)y^(s−2); multiplication by −y² gives s(1−s)yˢ. At s=.5+it, .25+t²; reversed sign gives −.25 at t=0. | Retain. |
| 5.4; 749 | u=0: both sides 0, no division. | Retain. |
| 5.4; 750 | Equality model: e₂ gives .21=.21; 2ie₂ gives .84=.84=21/25. | Retain. |
| 5.4; 751 | u=1: energy 0 but lower expression .21V>0; mean-zero condition fails. | Retain. |
| 5.5; 767 | κ=1: measure factor 1, operator factor 1, threshold .25, unchanged gap .21. | Retain. |
| 5.5; 768 | κ=4: measure /4, operator ×4, energy ×1, threshold 1, gap .84=21/25. | Retain. |
| 5.5; 769 | Same function: new norm² .25, energy .21, quotient .21/.25=.84. | Retain. |
| 5.5; 770 | κ=0: no inverse metric; κ<0: negative metric. Neither is in the Riemannian positive-scaling domain. | Retain. |

Definition/construction Check counts: §§0.1–0.5 have 4,3,3,3,3; §§3.1–3.2 have 3,3; §4.1 has 4; §4.2a has 4; §4.2b has 3 for Euler–Poincaré, 4 for the Swan criterion and 5 for the realization. Each definition has at least three discriminating tests. The zero-vector test in §5.4 tests inclusion of zero in an inequality, not a definition of a linear object.

Fresh finite-sum enumeration additionally tested the exact Gauss identity at every unit for q=3,5,7 and k=0,1,2,3: **48 instances**, maximum floating discrepancy below 10⁻¹³. This is a diagnostic calculation, not a proof. The exact small-field computations above establish the sign and subtraction witnesses without floating-point assumptions. F₄ was computed as F₂[a]/(a²+a+1), including k=2 divisible by the characteristic.

### Remaining boundary classes

| Class | Computed instance | Result/change |
|---|---|---|
| Zero ring and nonexistent field of cardinality one | A Field instance includes 0≠1, so a finite field has cardinality at least two; q=0,1 cannot satisfy Fact q.Prime. | These cannot instantiate the Lean estimates; no hidden 0⁰ or division by zero. |
| Rank zero and empty index sets | Fin 0 tuple: product 1, sum 0, raw value δ_(r=1); zero sheaf has rank/Swan/Euler characteristic 0. Positive-rank arithmetic hypotheses have m≥2 or k≥1. | The definition remains total, and the estimates exclude the false rank-zero case. |
| Nonreduced base/boundary | On S=Spec F_p[ε]/(ε²), the constant P¹ family with one doubled section still has one geometric boundary point, conductor 1 and H_c² rank 1. | Counting scheme length as boundary cardinality would give 2; the stated geometric convention gives 1. |
| Inseparable boundary | In characteristic two, x²=t is radicial: each geometric fibre has one boundary point, so the constant sheaf has a=1 and H_c¹ rank 0 throughout. In odd characteristic the values are 2→1 and 1→0. | The odd-characteristic collision Check correctly excludes this different case. Finite extensions of finite fields are separable, so no missing inseparability binder belongs in the finite-field estimates. |
| Noncompactness | A cusp of width w above height R has area w/R, positive but tending to 0; its infinite length does not make the quotient measure infinite. | Complete finite-area noncompact geometry, not compactness, is used. |
| Zero Hilbert space | In a zero space the set of nonzero Rayleigh vectors is empty. Here the free-chart bump minus its mean has positive norm; thus the actual HΓ⁰ is nonzero. | The declared form-core contract explicitly restricts to a nonzero reducing complement. |
| Trivial and nonabelian groups | Trivial subgroup of SL₂(ℤ) gives Γ(0)={I}, infinite covolume, and bounded harmonic e^(iz) with eigenvalue 0. S₃ regular invariants have dimensions 6,3,1 as the subgroup grows. | Congruence and finite-area hypotheses exclude the first; actual subgroup invariants are necessary for the second. |
| Smooth/proper/finite type | Constant A¹ family has H_c² rank 1; constant P¹ has H⁰ and H² rank 1. For two colliding punctures H_c¹ drops 1→0. | The criterion retains excellent noetherian base, smooth curve and finite flat boundary; replacing it by Swan constancy alone is false. S02 restores the stronger separated local-acyclicity theorem used in the proof. |
| Universe and arbitrary topology | Finite fields are allowed in arbitrary Type u; their tuple index is finite, so the sum remains finite. The eigenfunction domain is the native ℂ and ℍ, with fixed topologies and real derivative structure. | No arbitrary-topology stand-in, cardinality bound or ULift substitution. |
| Junk total values | Γℝ(0)=0 versus residue 2; fπ=0 gives finite average 0; k=0 gives raw δ_(r=1). The analytic conductors are positive, n≥1, q>2 and κ>0. | Total definitions and analytic hypotheses are kept distinct. No natural division appears in the real exponent. |

### Current supplier resolutions and ownership

Locations in this table are in `TauCetiRoadmap/<name>/README.md`, except ArithmeticDirichletSeries in `Completed/ArithmeticDirichletSeries/README.md`. The current main files or the current open-head files returned by the supplied roadmap service were read; earlier review claims were not used as substitute citations.

| Supplier | Current section/target and verified scope |
|---|---|
| FuchsianOrbifolds | Layers 0–3, README:193 onward, and Layer 6 item 1 at line 349. Effective action, invariant quotient charts, polygon area and cusp ends; the modular signature is not in Layer 2 alone. |
| DifferentialGeometry | Layer 12, line 910; gradient 12.2, div-grad 12.3, density 12.4 and Green 12.5. Div-grad is the opposite sign to this package's positive operator; y² gives the expected −2y² after negation. |
| PDE | Lane A items 1–2, line 223; Lane E item 20, line 322. Weak derivatives/completion and local elliptic regularity exist. The package constructs quotient descent and global cusp-domain arguments itself. |
| OperatorTheory/SelfAdjointSpectralTheory | SA-C at line 799 and SA-E01–E13 at line 1202. Domain-aware reductions and form inequalities from actual spectral support; these do not manufacture the quotient Laplacian. |
| UnboundedOperators | UO-A01–A03 at line 23 and UO-D06 at line 172. Spectral integration and closed semibounded form representation with dense inclusion. The three-infimum/core extension is separately declared. |
| AutomorphicSpectralTheory | §§0.6–0.7 (lines 191,208), 1.16–1.16a (1286,1313), 4.3–4.4 (2352,2363), 4.6 (2395), 4.8 (2417), 4.14a (2522), 7.1a (3793). Γ₀(N) realization, orthosums, twist transport, level-one expansion and number-field residual blocks are present. The all-principal-level operator-independent statement remains a declared gap. The finite-place estimate stays with §7.1a. |
| AutomorphicFormsOnReductiveGroups | §§2.5–2.7, 3.1, 3.4–3.5 and 4.5; archimedean parameters/classification, globalization, component comparison and tensor factorization. README:679 defines Maass cusp forms at congruence level; its adelic equivalence is level one, so the principal-level extension is not falsely treated as already supplied. |
| ArithmeticLocallySymmetricSpaces | ALS.F.6, line 898. Cuspidal automorphic carriers, boundedness/rapid decay and the finite-multiplicity discrete decomposition needed to extract a constituent are present. |
| GlobalNumberFields | Layers 6,9,10 at lines 433,502,525. Norm-one compactness and the unique real shift/unitary part of a Hecke character, with real and complex infinity types. Quadratic induction changes absolute central exponent σ to 2σ. |
| GL2AutomorphicRepresentationsAndTransfer | R17.4.13, line 2144: adjoint lift, local compatibility and self-twist branch. Adjoint roots are α/β,1,β/α, not α²,αβ,β². The package consumes, rather than rebuilds, the lift. |
| AutomorphicLFunctionsAndLocalFactors | AL.1 canonical archimedean factors at 1337; AL.3 local pair factor 2044, induction 2071, Whittaker factorization 2141, continuation/poles 2239, global equation 2250, boundary nonvanishing 2263, LDatum 2338, analytic pair instances 2370. The recorded unitary/generic hypotheses and distinction between completed and finite strip bounds are retained. Three precise extensions are gaps. |
| LFunctions | Layer 0, README:320; AnalyticLFunctionData and HasDirichletAgreement, HasMeromorphicContinuation, HasFunctionalEquation, HasAverageCoefficientBound in Suggested.lean:121,127,133,139. All five resolver warnings are planned names under this owner, not missing pinned names. |
| ZerosOfLFunctions | Layer 1 items 2–5, line 475 onward; Layer 3 item 3, line 710. Sector/vertical Stirling estimates and conductor-polynomial bounds for the continued finite function with the specified analytic data hypotheses. Dividing a bounded completed function by gamma alone would not suffice. |
| DeligneWeightsAndPurity | §7.12 at line 2618 and DWP.10 at 3595. Compact-support upper weights, compact-to-ordinary image purity and arithmetic weight transport are present. Neither the additive-character sheaf construction nor the missing tame-convolution proof is silently supplied. |
| EtaleCohomologyFoundations | F.0–F.6 and F.10.1–F.10.2b. Constructible/torsion and rational-adic realization, compact direct image, base change, duality, Künneth and geometric Frobenius are present. README:11 assigns nearby/vanishing cycles to a different owner: S02. |
| ArithmeticGaloisRepresentations | §3.1, line 2448 onward, includes finite wild image/breaks and Swan; §3.7, line 2741, includes Artin–Schreier local calculations. At exponent a prime to p the break is a, so a=1 works for p=2 and 3. |
| InverseGaloisAndArithmeticFundamentalGroups | Euler characteristic of ℓ-torsion local systems on affine curves, lines 6590–6628. This supplies the finite-coefficient formula; the rational-adic extension is explicitly a package target, not attributed to the finite formula without proof. |
| ArithmeticDirichletSeries | Completed roadmap, Layer 6 at line 256. Abel summation preserves inclusive endpoints; it imports the native finite summation identity. |
| AnalyticNumberTheoryPartI | §3.26, Uniform divisor subpower bound. For every ε>0 a constant Cε bounds τ(n) by Cεn^ε for every n≥1. Its exclusion of n=0 is respected by separating n=1 before τ(n−1). |

For S02, also read `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:519`, §§0.5–0.8. It supplies precisely the inertia-equivariant triangle/sequence, trait and coefficient change, and rational realization used by Katz; it is earlier than this package.

Ownership searches used the roadmap service's object searches, main and Completed, the board package heads, and all **47 explicitly supplied sibling folders (94 README/Lean files)**. Objects searched included the quotient Friedrichs realization, congruence spectral gap, prime-twist moment, Mellin cutoffs, hyper-Kloosterman sums/sheaves, curve Euler–Poincaré and Swan constancy, along with all four fully qualified declaration names. The supplied heads have no duplicate declaration of those names. Hits in SieveMethodsAndPrimePatterns concern a bibliography entry for Kloosterman fractions; GlobalShtukasAndFunctionFieldLanglands names a downstream Kloosterman consumer; EffectiveClassNumbers constructs elliptic quadratic-twist formulas, not this general self-pair/moment theorem.

The board index has **20 other package heads**. Four were searched through available read-only git objects (including their design files); AutomorphicCongruences was read through the GitHub file tool at its indexed head. For the other fifteen, package README/Suggested paths are absent and the design README at the same indexed head was searched instead. No competing ownership of the reviewed objects was found there. No remote write was made.

The rational-adic curve formula is also planned in `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4914`, but that roadmap is later in the merge order (123 versus 107). The general curve input therefore moves earlier to this package's §4.2b, which is the owner for this direction of supply; the later roadmap should import it and retain its additional tower bounds. No upward supplier citation is added. The raw sum and all-rank realization similarly stay here before the downstream Kloosterman roadmaps at positions 256–257. Their names in the consumer paragraph are not supplier edges. No present-head content of those two unprovided folders is inferred from the previous review.

The package is explicitly Part II of AutomorphicSpectralTheory and states where that base stops. The generic operator, automorphic, gamma, character, duality and ramification infrastructure remains imported. The within-package order is acyclic: §0.2 precedes spectral transport; §0.4 constructs the infimum without the upper threshold; §0.7 obtains the upper threshold after §0.6. Layers 2–4 do not use the final parameter bound. S02 is an omitted edge, so it is not detected by checking only declared edges.

### Declared gap audit

All seven slug/supplier/needs contracts match **verbatim** between the README supplier subsection and the plan's top-level gaps. Comparing the plan against origin/main shows that **only the top-level gaps key changed**. No supplier is `none`. Each contract is a coherent mathematical interface with its required hypotheses, rather than an unrelated bundle of tasks. They are accepted conditionally, not raised merely because the supplier does not yet implement them.

| Slug | Precision/minimality test |
|---|---|
| form-rayleigh-core | Dense closed nonnegative complex form, nonzero reducing complement and all three infima are specified. The supplier's representation theorem alone does not state this full comparison. Zero-space empty-infimum pathology is excluded. |
| all-level-spectral-realization | Every positive principal level, SO(2) type, determinant residual characters, cusp multiplicities and threshold are explicit. Current AST's one-cusp modular display alone fails level two's three channels. |
| principal-level-classical-constituents | Specifies positive-determinant components, normalized isometry, actual Γ(N) stabilizers, group equivariance, Casimir and cusp eigenspaces. The existing level-one equivalence does not provide the four components at level five. |
| all-prime-self-pair-positivity | Full coefficients, including ramified primes, b(1)=1 and positive finite residue are the remaining asks. Boundary regularity is now derived separately and no longer redundant in the gap. |
| self-pair-local-character-transport | Exact transport at ramified representations away from q and the primitive unramified-rank twist L/epsilon formulas are specified. The example χ_p×χ_p⁻¹ has coefficient 1 at p and detects deletion. |
| finite-rs-polynomial-strips | Identifies both supplier records, coefficients, empty poles, finite-order completion, dual equation, conductor/root number and coefficient bound. It requests the concrete arithmetic adapter, not a second generic convexity theorem. |
| additive-character-sheaf-weight | Specifies nontrivial additive characters, coefficient field, rank one, weight zero, geometric Frobenius over every extension and tensor law. The current general weight theorem alone does not construct this object. |

The required read-only dependency command completed with:

```text
depcheck: 48 roadmaps, 547 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The S02 supplier's earlier position was checked independently. No merge-order file was modified.

### Pinned declaration audit

Used the manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following groups comprise the **30 explicitly named library declarations** in the supplier contracts. Paths are library-relative.

| Declarations | Pin witness and what the carrier actually includes |
|---|---|
| CongruenceSubgroup.IsCongruenceSubgroup; its finiteIndex | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163`, line 181. The predicate is Prop with an existential nonzero natural level; finite index is a consequence, not its definition. |
| MulAction.orbitRel.Quotient; MulAction.toPermHom | `Mathlib/GroupTheory/GroupAction/Defs.lean:349`; `Mathlib/Algebra/Group/Action/End.lean:184`. Orbit carrier and permutation homomorphism; neither asserts free action or a finite quotient measure. |
| UpperHalfPlane.volume_def | `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:44`: hyperbolic density y⁻². |
| MeasureTheory.IsFundamentalDomain.quotientMeasure_eq | `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630`. Actual fundamental domains, countability, measurability and measure preservation are required. Passing to the effective image addresses the action kernel. |
| MeasureTheory.Lp; LinearPMap | `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89`; `Mathlib/LinearAlgebra/LinearPMap.lean:41`. The former is the finite-Lp-norm subgroup of almost-everywhere classes; the latter is a submodule domain plus linear map. No quotient metric, dense domain or self-adjointness is automatic. |
| mellin; mellinInv; mellin_comp_inv; mellinInv_mellin_eq | `Mathlib/Analysis/MellinTransform.lean:90`, lines 95,153; `Mathlib/Analysis/MellinInversion.lean:92`, with CompleteSpace at line 89. Inversion requires positive x, Mellin convergence, vertical integrability and continuity. The inverse prefactor is 1/(2π). |
| Complex.Gammaℝ; Gammaℝ_eq_zero_iff; Gammaℝ_residue_zero | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`, lines 75,104. Totalized zero at a pole is distinguished from the punctured residue 2. |
| DirichletCharacter.sum_characters_eq | `Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean:68`. Nonzero modulus, integral-domain coefficients and sufficient roots of unity; ℂ satisfies the coefficient assumptions. |
| gaussSum; ZMod.stdAddChar; ZMod.isPrimitive_stdAddChar | `Mathlib/NumberTheory/GaussSum.lean:72`; `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83`, line 95. The positive exponential is also explicit in stdAddChar_coe at line 86. |
| Complex.Gamma_ne_zero; Complex.differentiable_one_div_Gamma | `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:426`, line 521. Nonpositive integer exceptions and entire reciprocal supply the meromorphic assertion; there is no assertion that the totalized Gamma never vanishes. |
| InnerProductSpace.instLaplacian; UpperHalfPlane.SLAction | `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138`; `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:282`. Euclidean real second-derivative trace and native SL₂ action; the theorem inserts the negative hyperbolic factor explicitly. |
| UpperHalfPlane.riemannianVolume_eq_volume | `TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean:181`. Actual upstairs metric-volume comparison; quotient descent is still work here. |
| IsSelfAdjoint.isFormalAdjoint; LinearPMap.IsFormalAdjoint.im_inner_self_apply | `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean:76`, line 82. Completeness/inner-product hypotheses and formal pairing give real diagonal expectations, not existence of ΔΓ. |
| TauCeti.PDE.energyFormH1; energyFormH1L0 | `TauCeti/Analysis/PDE/EnergyForm/Sobolev.lean:372`, line 600. Local real Sobolev energies; the coefficient version keeps its boundedness assumption. They are not already the complex orbifold energy. |
| TauCeti.LSeries.wienerIkehara | `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`. Nonnegative coefficients, Dirichlet agreement and continuous pole-subtracted boundary; inclusive summation. |
| TauCeti.primeCount_univ_isEquivalent_div_log | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:46`. Number-field prime-ideal asymptotic; the rational adapter uses `Rat.ringOfIntegersEquiv`, `Mathlib/NumberTheory/NumberField/Basic.lean:427`, and prime-ideal norms, rather than treating arbitrary prime ideals as rational primes. |

Object searches at these pins found no canonical congruence quotient closed-energy/Friedrichs realization, cuspidal automorphic Rankin–Selberg carrier or Kloosterman-sheaf carrier that would make the omitted headlines statable. Existing Poincaré/Sobolev energies and abstract partial operators do not fill those missing constructions. No kept theorem duplicates a pinned theorem. For the Gauss-power estimate, the elementary absolute-value bound is of order q^(1+k/2), whereas the desired bound is of order q^((k+1)/2); the missing square-root cancellation cannot be discharged by a triangle-inequality tactic alone.

### Legal-source locator audit

All five readable works were read from the supplied legal source-cache extractions. No new work was needed, and no source text was copied into the repository. The 21 locator groups below count a theorem with its immediate form-domain remark as one group; LRS is excluded from the verified count.

| Source locator | Extraction witness | Verification |
|---|---|---|
| gj78, Definition 3.1.3 | gj78 line 528 | Adjoint normalization includes inverse central character. |
| gj78, Proposition 3.2 | gj78 line 538 | Local lift and parameter properties used by the supplier. |
| gj78, §3.7 | gj78 line 721 | Self-twist/monomial branch, with the stated local conventions. |
| gj78, Theorem 9.3 | gj78 line 2151 | Automorphic lift theorem and cuspidality branch; exceptional-component strengthening remains the named supplier's work. |
| gj78, Remark 9.9 | gj78 line 2384 | Self-twist relation used in the monomial alternative. |
| teschl, Theorem 2.12, §2.3 | teschl line 2914 | Friedrichs/form construction, on its dense semibounded domain. |
| teschl, Theorem 2.13, §2.3 | teschl line 2960 | Closed-form representation. The printed shift problems below must not be copied. |
| teschl, Theorem 4.10 and form-domain remark | teschl lines 4991,5044,5053,5060 | Correct section is 4.3; the page-119 header is not the next section boundary. S01. |
| katz-gkm, §2.3.1, p.32 | katz-gkm line 1352 | Curve Euler characteristic with Swan contributions; constant and nontrivial Kummer cases distinguish Euler characteristic from vanishing. |
| katz-gkm, §4.0, pp.47–48 | katz-gkm lines 1845,1871 | Raw product-fibre exponential sum. |
| katz-gkm, Theorem 4.1.1, pp.48–49 | katz-gkm lines 1892–1912 | Rank/purity/trace for bᵢ=1; each bᵢ is prime to p, with no condition p∤k. |
| katz-gkm, §4.3, pp.59–60 | katz-gkm lines 2266–2300 | Artin–Schreier realization and Frobenius convention. |
| katz-gkm, Theorem 5.1(1)–(8), pp.63–64 | katz-gkm lines 2392–2430 | General convolution local conditions, rank, Swan and weight consequences. |
| katz-gkm, Proposition 5.2.1 and proof | katz-gkm lines 2460–2489,2516–2665 | Lissity uses conductor constancy; tameness additionally uses Kummer descent and the vanishing-cycle sequence. S02 concerns this exact step, not the truth of Katz's theorem. |
| katz-gkm, §5.2.4, p.76 | katz-gkm lines 2805–2830 | Purity from compact/ordinary comparison, with the weight increment. |
| bms02, §2.1, arXiv v3 p.4 | bms02 lines 151–157 | Minimal/maximal distributional operator domains. |
| bms02, Assumption B, arXiv v3 p.5 | bms02 line 196; scalar regularity at lines 179–193 | Local regularity hypothesis; the roadmap explicitly owns its scalar verification. |
| bms02, Corollary 2.10, arXiv v3 p.7 | bms02 lines 245–253 | Complete-metric essential self-adjointness of D*D, applied to D=d upstairs. The package descends via a torsion-free finite cover rather than applying a smooth-manifold theorem directly to an orbifold. |
| laumon-swan, Theorem 2.1.1, pp.185–186 | laumon-swan lines 391–419 | Excellent noetherian base, separated smooth relative curve, finite flat boundary and locally constant full conductor give universal local acyclicity. |
| laumon-swan, Corollary 2.1.2, p.187 | laumon-swan lines 423–426 | Properness adds lissity of compact direct images. |
| laumon-swan, Remark 2.1.3, p.187 | laumon-swan lines 427–437 | Swan sum alone suffices when geometric boundary cardinality is locally constant, not for arbitrary colliding finite-flat boundary. |

The three source issues below were independently recomputed: for q=0, γ=0, the printed operator formula gives −I instead of 0; for A=0 and a unit vector the printed proof inequality is 0≥1, whereas the corrected shifted inequality is 1≥1. In the min–max proof, evaluating a single vector at Eₙ establishes inf≤Eₙ, not inf≥Eₙ; the spectral-support argument supplies the latter.

The package's own target locators are present throughout. The current source manifest contains six unique work keys; five are certified legal copies, and lrs95 is settled uncertified. No duplicate key, new missing-source request, unsupported LRS erratum attribution, process instruction or copied source passage was introduced.

Policy inspection of `git diff --stat origin/main...HEAD` found **8 changed files, all under packages/CongruenceSpectralGap/**. The diff comprises README, Suggested.lean, design/plan.json, metadata.toml, three earlier reports and sources.toml. No out-of-folder edit is part of the reviewed head. Suggested.lean has the required module docstring and namespace, one import Mathlib, real-body definition, three sorry theorems and no forbidden command. The README has mathematical proof routes rather than computational algorithms.

## Not verifiable

- **lrs95:** Theorem 1.1, Theorem 1.2, Lemma 2.1, Lemmas 3.1–3.2, Proposition 3.1 and equations (3.4), (3.6)–(3.7), (3.11)–(3.12), (3.18)–(3.20) remain cited by their published locators only. The manifest's uncertified status is settled. The formulas were tested independently above; the inaccessible text's exact wording and internal proof cannot be certified. No renewed request is made.
- **Future supplier implementations:** the seven declared gap interfaces were checked for precision, minimality, placement and consistent hypotheses, not proved. Conditional acceptance of these contracts does not discharge them; S02 is a separate undeclared proof input.
- **Lean execution:** no build or fresh elaboration was run. This review compared all four supplied elaborated signatures, then inspected the pinned definitions and computed mathematical instances. There are no package edits requiring a new signature check.
- **Settled base-roadmap coordination:** r1b F08 remains external for the reason recorded in the earlier-findings table. The package names the finite-place owner; this read-only review cannot alter the base roadmap's route.
- **Unprovided downstream heads:** the two downstream Kloosterman folders are not among the supplied sibling checkouts or the twenty current board-package heads. Their merge-order positions and consumer references were checked, but their present contents are not certified here. Ownership searches of every supplied sibling folder and indexed board head were completed.

## Source issues

- **Misprint** in teschl at Theorem 2.13, equation (2.60), printed page 72: the source says the operator subtracts (1−γ)ψ after pairing against the original form; it should be Aψ=ψ̃, or explicitly pair against the shifted form; affects a stated result.
- **Misprint** in teschl at proof of Theorem 2.13, printed page 72: the source says nonnegative A satisfies ‖Aψ‖²≥‖ψ‖²; it should be ‖(A+1)ψ‖²≥‖ψ‖²; affects the proof.
- **Gap** in teschl at proof of Theorem 4.10, equation (4.31), printed page 118: the source says choosing the nth eigenvector proves a lower bound for the infimum; it should be a spectral-support bound for every unit vector in the orthogonal complement; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0afb099c9a8da5b0cf03080abbb7924bbd1845d7", "job": "RT-CongruenceSpectralGap~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
