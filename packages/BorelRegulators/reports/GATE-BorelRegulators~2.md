## H01 (CBirkbeck) — applied

The supplied-cone coordinate −P → the supplier’s +P with its fixed inclusion, while the transported r−f coordinate is −P; the universal-class/evaluation square now distinguishes Burgos’s +P evaluation from that shared coordinate (`TauCetiRoadmap/BorelRegulators/README.md:727`, `:729`, `:731`, `:775`). Consequently r_Bo=2r_Be → r_Bo=−2r_Be and the signed determinant ratio 2^d → (−2)^d, with absolute covolume ratio 2^d, throughout the conventions, infinitesimal comparison and rank-one examples (`TauCetiRoadmap/BorelRegulators/README.md:25`, `:655`, `:754`, `:796`, `:809`, `:812`; `TauCetiRoadmap/BorelRegulators/Suggested.lean:29`), as follows from burgos2002 line 3901–3904, 4010–4016, 4024–4036, 3865–3869 and 4227–4241.

## H02 (CBirkbeck) — answered

The description should say: “Direct open suppliers include CharacteristicClasses C5a/C6, TopologicalKTheory T4/T7 and LFunctions Layer 3, including contributions by other authors; these inputs also occur along transitive prerequisite paths.” Their direct contracts are already explicit at `TauCetiRoadmap/BorelRegulators/README.md:119`, `:127`, `:137`; the indexed heads d077cb4, 7575afa and affb2d0 are new-roadmap additions absent from main fe54001, so an exclusively-transitive classification is incorrect, and the PR-description correction is supplied here for the worker within the authorized file boundary.

---

**Normalization evidence.** MotivicEtaleKTheory §§3.3, 7.1 and 7.4 and its ColemanIntegration downstream contract were read both at indexed head 9bcd1b6 and in the provided sibling checkout at a2a3b038; both retain the positive small-model point projection. The supplied inclusion gives κ_M(I_M(i))=i in weight 2 and κ_M(I_M(1))=1 in weight 3. Pulling those classes back through S gives raw representatives −i and −1 in Burgos’s cone, so his evaluation gives −i and −1. Because S fixes u₁ and the forgetful map is an isomorphism, its universal lift is fixed too: Burgos’s infinitesimal evaluation is PΦ and Borel’s is 2PΦ, whereas the shared coordinate evaluates the transported class to −PΦ. Thus the negative factor is derived from the fixed universal class and both fixed point maps, rather than chosen from equality of lattices. For ℚ(i),n=2 a nonzero shared coordinate t gives Burgos −t and Borel −2t; +2 would differ by 4t≠0.

**Ownership and citations.** The shared Deligne carrier, universal character and point marking remain in MotivicEtaleKTheory §§3.3–3.4, 4.1–4.2, 7.1 and 7.4; the signed arithmetic comparison and its square-ideal/CE/Weil adapter remain here, as that supplier’s BorelRegulators contract specifies. ColemanIntegration §L3.Fc.1 retains its Galois integral-image theorem, pairings and determinants; neither its theorem nor the general Deligne construction was replanned. Object searches covered main fe54001, the indexed open-roadmap catalogue, board package texts and all supplied sibling roadmap folders; ownership against open pull requests without supplied checkouts was not independently checked beyond that indexed search. All cross-roadmap references were resolved again, and supplier sections were checked on main for existing roadmaps and at the indexed new-roadmap heads; no unresolved cross-roadmap or own Lean name was reported. No ownership moved to a later supplier, and no declaration acquired another roadmap’s fully qualified name.

The native carriers were checked at Mathlib 6b7abb3 and Tau Ceti a91d3aa, matching the content manifest. `CSA` carries centrality, simplicity and finite dimension (`Mathlib/Algebra/BrauerGroup/Defs.lean:40`); the native same-universe Brauer group and its class projection are used (`TauCeti/Algebra/BrauerGroup/Group.lean:139`, `:174`). `IsSplittingField` quantifies an arbitrary natural matrix size (`TauCeti/Algebra/CentralSimple/Splitting.lean:120`), whose zero value is ruled out by the division-algebra hypotheses. `IsZLattice` requires a discrete subtype and full scalar span (`Mathlib/Algebra/Module/ZLattice/Basic.lean:433`), and `analyticOrderAt` returns 0 without analyticity (`Mathlib/Analysis/Analytic/Order.lean:48`), so those hypotheses cannot be silently inferred. Searches by the Deligne, regulator and characteristic-cohomology objects found the mixed-Hodge Deligne splitting and unit regulator APIs, which do not supply the higher Quillen/Deligne classifying-space carriers required by the omitted headlines; no replacement carriers or API padding were added.

**Signatures.** All four declarations were re-elaborated together in one scratch file with `#check @name` and compared with README §§1.3, 3.1, 3.2 and 5.1. The analytic continuation hypotheses, n≥2, field and number-field instances, positive algebra degree, total reality and evenness all remain in the elaborated types; no theorem type or binder changed. The sole Lean change names the corrected signed comparison in the missing-carrier explanation.

**Sources.** The sign calculation uses the legally cached Burgos text, including its cone differential, universal forgetful isomorphism, degree-one evaluation and the two infinitesimal cocycles. All texts read were legal copies; borel1980 was re-read through the sources service under its existing key, and its full manifest entry is prepared in scratch `sources.toml` because the authorized edits exclude the package manifest. No source extraction was copied into the repository or this report; weil1961 remains waived and beilinson1985 remains uncertified, without reopening either citation. No missing reference remains.

**Adversarial mathematics pass.** Values below test the definitions and statements, including the unchanged arithmetic layers; they do not replace the cited general proofs. “Retained” means that the displayed instance required no repair.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: signature and parity | ℚ; ℚ(i); real quadratic, n=2,3 | N=r₁+2r₂ gives 1,2,2; d₂,d₃ are (0,1),(1,1),(0,2) | Correct fixed-coordinate counts | Retained |
| Conventions: Tate lines and representative change | n=2,3 | Generators 2πi,−4π²; conjugation gives −2πi,−4π², hence coordinate signs −1,+1 | Nonzero scale and parity | Retained |
| Conventions: determinant orientation | Two coordinates; rank 0 | det[[0,1],[1,0]]=−1; absolute determinant 1; det of empty matrix 1 | Signed and absolute quantities differ | Retained |
| Conventions: rational proportionality and integer powers | ℚ,n=2,3 | d−Nn=−2,−2; natural subtraction would give 0,0; q·0=0 for every q | No quotient by a zero scalar; exponent must be in ℤ | Retained |
| Conventions: compact Chern generator | ε₂=clutch(u²), ε₃=−clutch(u³), ch(u)=−v | (−v)²/v²=1; −(−v)³/v³=1; twists −4π²,−8π³i | Zero or doubled character fails | Retained |
| Conventions: ordered discriminant | ℚ(i), basis 1,i and conjugate embeddings | det[[1,i],[1,−i]]=−2i; square −4=disc; absolute value 2=√4 | Phase precedes absolute value | Retained |
| Conventions: left/right quotients and inverse | g=diag(2,1/2) in SL₂(ℝ) | g⁻¹=diag(1/2,2); inversion twice returns g; Haar multiplier 1 for this unimodular group | Actual inverse map used | Retained |
| §1.1 definition of Vₙ | ℚ,n=2,3; ℚ(i),n=2,3 | t=−t gives t=0; t=t gives a line; pairs (t,−t),(t,t) each give one line | Both parities and conjugation tested | Retained |
| §1.1 definition of Cₙ and coordinate equivalence | Weight 3 generator; twice that generator | (−4π²)/(−4π²)=1∈ℤ; (−8π²)/(−4π²)=2; half-generator gives 1/2∉ℤ | Actual integer lattice determined | Retained |
| §1.1 topology and measure | Weight 2 generator; weight 3 generator | Ambient norms 2π,4π²; coordinate norms 1,1; covolumes of coordinate ℤ and {0} in dimension 0 are 1,1 | Topology agrees without an unscaled isometry | Retained |
| §1.1 coordinate changes | Swap two rows; conjugate one complex representative | Determinants −1 and (−1)^(n−1); absolute determinants 1,1 | Coordinate measure preserved | Retained |
| §1.2 restriction definition | ℚ(i)/ℚ,n=3; identity | R(t)=(t,t); R_id(t)=t | Repetition, not rescaling | Retained |
| §1.2 trace definition | ℚ(i)/ℚ,n=2,3 | T(t,−t)=0; T(a,b)=a+b; selected-coordinate averaging would give t instead of 0 in weight 2 | All extending embeddings required | Retained |
| §1.2 degree and tower laws | Degree 2 then 3; identity | TR(t)=2t; successive tower traces 3(2t)=6t; identity trace t | Degree and composition agree | Retained |
| §1.3 leading coefficient and analytic order | ℚ,n=2,3,4 | Orders 0,1,0; c=−1/12,−ζ(3)/(4π²),1/120; ζ(−2)=0 differs from its nonzero leading coefficient | Correct germ and derivative order | Retained |
| §1.3 functional-equation proportionality | ℚ,n=2,3,4 | Ratios to π^(d−n)ζ(n) are −1/2,−1/4,3/4 | Nonzero rational constants | Retained |
| §1.3 continuation hypotheses and junk values | Z(1)=0 or 7; zero or doubled continuation | Same germs at −1,−2 for both choices at 1; at 2 the other functions give 0,π²/3 instead of π²/6; d!≥1 | Unconstrained value at 1 harmless; wrong continuations excluded | Retained |
| §1.3 weight boundary | ℚ,n=1 | Actual order at 0 is 0; r₁+r₂=1 would give 1 | n≥2 necessary | Retained |
| §2.1 continuous class calibration | ε₂,ε₃; zero and doubled classes | Rational values 1,1 versus 0,2; twisted values −4π²,−8π³i versus twice each value | Scale fixed independently of regulators | Retained |
| §2.1 stabilization and conjugation | Identity block; weight 2 conjugate pair | Positive-degree character of trivial block 0; pair (i,−i) is fixed by simultaneous conjugation and exchange | Stable twisted class | Retained |
| §2.2 actual regulator, addition and torsion | 0; mx=0,m>0; x+x | r(0)=0; mr(x)=0 forces r(x)=0; r(2x)=2r(x) | No torsion image | Retained |
| §2.2 rational inclusion normalization | Rational K₅ class of ℚ with coordinate t≠0 | Actual inclusion and its inverse give t; doubled inverse gives 2t≠t | Actual localization required | Retained |
| §2.3 real isomorphism and kernel | ℚ weights 2,3; real quadratic weight 3 | Source/target dimensions (0,0),(1,1),(2,2); torsion maps to 0 | No rank-only choice of regulator | Retained |
| §2.3 naturality | ℚ(i)/ℚ, weights 2,3 | Transfer targets 0 and 2t; restriction/trace composite equals degree 2 | Full trace agrees | Retained |
| §2.3 finite-stage range | N=1,q=5,a=21,22; N=2,q=3,a=25,26 | a−1=20,21 against 20; 24,25 against 24; q=0,a=2 gives 1>0 and constant 1↦1 | Strict inequality and actual comparison | Retained |
| §3.1 period=index | Split class; invariant pairs (1/2,1/2),(1/3,−1/3) | Period/index 1/1,2/2,3/3; division dimensions 1,4,9 | Split period is 1 | Retained |
| §3.1 invariant exactness | Single 1/3; opposite pair | Sums 1/3≠0 and 0 in ℚ/ℤ | Single nonzero local invariant excluded | Retained |
| §3.1 degree-a representative and splitting divisibility | Split class,a=3; division index 2 and splitting degree 4 | M₃(F) has degree 3,dimension 9; restriction dimension equation 4·2=2·4 gives 2 divides 4 | Matrix degree differs from index | Retained |
| §3.1 cyclic local-degree contract | a=1; ℚ(ζ₃₂)⁺ at 2 and 31 | Degrees 1; cyclic degree 8 with local degrees 8 at 2,1 at 31 | Prescribed full degree only at selected places | Retained |
| §3.1 selected real places | Degree-8 fixed field of {1,15} in ℚ(ζ₃₂) | Quotient group order 8; powers of 3 run through 8 classes; −1∉{1,15}; local degree at 2 is 8 | Imaginary variable-local-extension witness | Retained |
| §3.2 division algebra existence | a=0,1,2,3 | Requested dimensions 0,1,4,9; a=0 impossible for a division ring, a=1 realized by F | All positive degrees and endpoint | Retained |
| §3.2 infinite splitting | Indefinite quaternion versus Hamilton | Infinite invariants 0,1/2; scalar extensions M₂(ℝ),ℍ | Hamilton case is excluded | Retained |
| §3.3 gauge normalization | ℚ,ω→2ω; ℚ(i),h=3 | Infinite/finite multipliers 2,1/2, product 1; Δ^(−3/2)·2³=4^(−3/2)·8=1 | Single discriminant factor | Retained |
| §3.3 gauge endpoints and charts | h=0; complex scalar 2; zero form | Global point mass 2·1/2=1; complex chart Jacobian 4; zero gauge gives mass 0 | Nonzero form and normalized local absolute value | Retained |
| §3.4 norm-one group and mass | Division degrees 1,2,3 | Dimensions 0,3,8; semisimple masses 1,1; degree 1 is point, outside almost-simple input | No rank-dependent Tamagawa multiplier | Retained |
| §3.4 quaternion and torus controls | D=(−1,3)/ℚ; norm-one torus of ℚ(i) | Hilbert symbols at 2,3,∞ are −1,−1,+1; division group dimension 3,characters 0 versus torus dimension 1,characters ℤ | Correct inner form; torus excluded | Retained |
| §3.5 standard finite mass | SL₂ over 𝔽₂,𝔽₃; SL₃ over 𝔽₂ | 6/8=3/4; 24/27=8/9; 168/256=21/32=(3/4)(7/8) | Small primes retained | Retained |
| §3.5 exceptional factor and S independence | q=2, mass b; add a standard place | Correction b/(3/4)=4b/3; added standard correction 1 | No exceptional finite factor dropped | Retained |
| §3.5 gauge and level controls | ω=2ω_std at 2; index-3 subgroup; q=1 | Masses 3/8,1/8; correction 1/2 for first; q=1 factor 0 | Nonunit integral gauge is exceptional; q≥2 needed | Retained |
| §3.6 exact quotient identity | Level index 3 | Finite mass m/3, infinite volume 3v; product vm=1 | Volume direction correct | Retained |
| §3.6 compactness and unscaled volume | Split M₂(ℚ); Hamilton; ℚ(√5),a=2 | Split quotient noncompact; Hamilton real group compact; unscaled/Borel volume ratio 5^(3/2) | Division and infinite splitting serve distinct roles | Retained |
| §4.1 indecomposables | Λ(x₃,x₅); k[u₂]; k | H⁸ dimension 1,Q⁸ dimension 0; u₂² goes to 0 in Q⁴; Q(k)=0 | Quotient is not total cohomology | Retained |
| §4.1 determinant and coefficient extension | Dimension 0 and 1 | ∧⁰0=k with generator 1; ∧¹k=k; extension sends generators 1↦1 | Native determinant functor used | Retained |
| §4.2 invariant-form correction | q=0,1,2,3,5 | Scalars 1,i,−1,−i,i; i·(−1)=−i=i³ | Multiplicative degree-dependent phase | Retained |
| §4.2 quotient hypotheses | C₂ stabilizer over 𝔽₂ versus a point | Higher group cohomology dimensions 1 in every degree versus point dimensions 1,0,0 | Torsion-free and characteristic-zero descent needed | Retained |
| §4.3 compact determinant | ℚ,n=2,3; ℚ(i),n=2 | Classes π²,π³,π⁴/8; absolute twisted character/π²=4 | Correct compact period exponent | Retained |
| §4.3 discriminant phase and embedding order | ℚ(i),n=2,3; swap embeddings | δ⁻³=−i/8; δ⁻⁵=i/32; swapped δ⁻³=i/8 and swapped wedge=−old wedge, same normalized product | Correct rational line | Retained |
| §4.4 regular representation and padding | j=1,N=1,a=17 | b=4; padding 13; det L_g=Nrd(g)²=1; a unital algebra representation on dimension 17 would need 4 dividing 17 | Padded group representation is required | Retained |
| §4.4 cycle dimension | (N,j)=(1,1),(1,2),(2,1) | N(j²+2j)=3,8,6 | Field degree present | Retained |
| §4.4 restriction factor | (N,j)=(1,1),(1,2),(2,1),(2,2) | (j+1)^(jN)=2,9,4,81 | Each factor nonzero | Retained |
| §4.4 cumulative rational forms | ℚ(i),j=1,2 | Total primitive degrees 3,8; δ⁻³=−i/8,δ⁻⁸=1/256 | Same ordered determinant in every wedge | Retained |
| §4.4 lower-generator annihilation | Λ(x₃,x₅),η₁=x₃ | x₃²=0; x₃(x₃x₅)=0; x₃x₅≠0 | Exactly the earlier-generator ideal is killed | Retained |
| §4.5 base/full/fibre sequences | ℚ,n=2,3; ℚ(i),either parity | Ranks (0,1,1),(1,1,0),(1,2,1); base+fibre=full | Exact sequences have correct dimensions | Retained |
| §4.5 lift independence and fibre identity | Triangular change [[1,2],[0,1]]; fibre scalar 2 | Determinants 1 and 2; identity fibre determinant 1 including rank 0 | Unmarked scalar cannot replace identity | Retained |
| §4.5 truncated comparison | N=1,n=3,a=23 or 22 | q=5; 22>20 or 21>20; cumulative wedge degree 8>5; SO₂₂ Euler degree 21>5 | Stability only in individual primitive degrees | Retained |
| §4.6 arithmetic period induction | j=0,1,2 | Products 1,ζ_F(2),ζ_F(2)ζ_F(3); consecutive quotients ζ_F(2),ζ_F(3) | Positive denominator, no circular period input | Retained |
| §4.6 full-group rank | ℚ,n=2 | Full rank N=1,base rank d=0 | ζ(2) period is not discarded | Retained |
| §5.1 primitive determinant and rank zero | ℚ,n=2; ℚ(√5),n=2 | Empty comparison 1; zeta scalars 1/6,2/75; proportionality constants 6,75/2 | Rank zero includes a numerical theorem | Retained |
| §5.1 discriminant cancellation | ℚ(i),n=2,3 | Absolute factors 8,32; divided by √Δ=2 give 4,16∈ℚ_>0 | Final square-root discriminant | Retained |
| §5.2 Cartan map definition | g=diag(i,−i); h=[[0,1],[−1,0]] | ggᵗ=(gh)(gh)ᵗ=−I; C(SO)=I | Right coset definition is independent of representative | Retained |
| §5.2 homotopy indices | ℚ,n=3,5 | Quotient/Cartan indices (1,2),(2,1); composites multiply by 2 in both cases | Real-place parity distinction | Retained |
| §5.2 Tate conversion | ℚ,n=2,3,5; imaginary quadratic,n=2,3 | (2π)^d ε=1,4π,2π,2π,2π | No extra complex-place factor | Retained |
| §5.2 excluded weight | ℚ,n=1 | π₁SU=π₁(SU/SO)=0 but d₁=1; zero subgroup fails full span | Positive point weight does not extend homotopy theorem to 1 | Retained |
| §5.3 integral image and torsion quotient | ℤ⊕C₂ with r(m,a)=tm,t≠0 | Kernel {0}⊕C₂; image tℤ; quotient ℤ maps bijectively | Actual integral image required | Retained |
| §5.3 discreteness and covolume | tℤ; ℤ+√2ℤ; rank 0 | Covolumes abs(t),1 for tℤ and rank 0; 1−√2,3−2√2,… approach 0 in the rank-2 subgroup of ℝ | Finite generation alone insufficient | Retained |
| §5.3 shared Coleman value | Free generator with Borel value t≠0 | Shared value −t/2; image (−t/2)ℤ=(t/2)ℤ; covolume abs(t)/2 | Map sign visible on the generator, invisible on lattice | Added signed value |
| §5.4 zeta covolume | ℚ,n=2,3; ℚ(i),n=2,3 | Leading-term ratio −12 at ℚ,n=2; positive ratio 6; π exponents −2,−2,−3,−5 respectively | All denominators nonzero | Retained |
| §5.4 rational span and basis change | Rank 1 tℚ; rank 2 column swap and dilation | t/m→0 with nonzero values; determinant multipliers −1 and 2; absolute multipliers 1 and 2 | Rational span is not integral lattice | Retained |
| §5.5 S transport | S=∅; add prime above 2; degree-one control | Higher odd integral images Λ=Λ; covolume ratio 1; K₁ ranks of ℤ and ℤ[1/2] are 0,1 | No good-prime restriction; weight boundary necessary | Retained |
| §5.5 order transport | R=ℤ[2i]⊂ℤ[i],image mtℤ⊂tℤ | Index m≥1; covolume ratio m; rank-zero index 1 and covolumes 1 | Inclusion direction fixed by actual K-map | Retained |
| §5.5 commensurability | Common sublattice with indices 2,3 | If covolume common is c,ambient covolumes c/2,c/3; ratio 3/2 | Commensurability is not equality | Retained |
| §6.0a cone chain isomorphism | Point,r=1,n=2 | d_B(1)=1; S₁d_B(1)=−1; d_MS₀(1)=−1; S²=id | Chain sign preserved | Kept S, fixed coordinates |
| §6.0a point inclusion and projection | n=2,x=i; n=3,x=1 | I_M gives i,1; κ_M returns i,1; replacing κ_M by −P returns −i,−1 | Supplier coordinate fixed by inverse identity | −P→+P on C_M |
| §6.0a transported inverse maps | Same x; I_B=S⁻¹I_M | I_B gives −i,−1; κ_B=−P returns i,1; S I_B=I_M | Shared coordinate on C_B must be −P | +P→−P on C_B |
| §6.0a Burgos versus shared evaluation | C_B representatives −i,−1 | η_B gives −i,−1; κ_B gives i,1; η_M on i,1 gives −i,−1 | Burgos evaluation is negative of shared coordinate | Distinguished η and κ |
| §6.0a universal topological lift | Representative (r,f,ω)=(1,1,0); arbitrary r,f | u₁S(1,1,0)=1=u₁(1,1,0); S changes third component only | Forgetful isomorphism fixes the same Chern lift | Explicit lift/evaluation square |
| §6.0a same Coleman map | n=2,x=i; n=3,x=1 | κ_M ch gives i,1=reg_∞ values; transported η gives −i,−1 | Same marked map rather than equal ranks | Repaired equality coordinate |
| §6.0a conjugation and finite descent | Weight 2 imaginary pair; two points | Conjugation/exchange preserves (i,−i); product of two point targets has real dimension 2 | Both space and coefficient action used | Retained |
| §6.0a étale trace | Values i,2i; pulled-back i | Trace 3i; trace after pullback 2i | Sum, not average | Retained |
| §6.0a trace identities and towers | Identity,empty cover; degrees 2 then 3 | Tr_id(i)=i; Tr_empty=0; successive traces 2i,6i=Tr_degree6(i) | Identity,empty and tower cases | Retained |
| §6.0a geometric domain | Nonreduced ℂ[ε]/ε² versus point | Tangent dimension 1 but dimension 0 for the nonreduced algebra; smooth point has tangent dimension 0 | Thickening is outside smooth quasi-projective hypothesis | Retained |
| §6.0a suspended calibration | ε₂,ε₃; zero and double | Rational 1,1 versus 0,2; twists −4π²,−8π³i versus double | Independent scale unchanged | Retained |
| §6.0a Adams/Chern law | ch₃(x)=x³/6,ψ²x=2x,x=1;a=1 | ch₃(2)=4/3=8·(1/6); a=1 multiplier 1 | Character compatibility precedes injectivity | Retained |
| §6.0b infinitesimal square ideal | GL₁,x=t−1 | In ℂ[t,t⁻¹]/(t−1)²,x≠0,x²=0; in ℂ[[x]],x²≠0 | Completion is not the stated object | Retained |
| §6.0b complex/real CE comparison | Trivial group;complex GL₁;underlying real GL₁ | CE dimensions in degrees 0,1,2 are (1,0,0),(1,1,0),(1,2,1); abelian differentials 0 | Real/complex distinction necessary | Retained |
| §6.0b nonabelian differential | sl₂ with [e,f]=h | d(h*)(e,f)=−h*([e,f])=−1 versus zero differential value 0 | Nonabelian comparison cannot use all-zero differential | Retained |
| §6.0b evaluation and constants | z_M=1+i,z_B=−1−i,n=2,3 | κ_M=i,1; η_M=−i,−1=η_B(z_B); function/CE degree-zero constant maps 1↦1 | Evaluation sign is separate from constant normalization | Propagated η/κ distinction |
| §6.1 point quotient and inverse | z=1+i,n=2,3 | P₁z=i,z−P₁z=1∈ℝ(2); P₂z=1,z−P₂z=i∈ℝ(3); P₁i=i,P₂1=1 | Both inverse composites hold | Supplier quotient representative fixed |
| §6.1 weight boundary | n=1;natural subtraction at n=0 | P₀(1+i)=1; at n=0,P₀(1)=1≠0 for 1∈ℝ(0); actual H¹_D(point,ℝ(0))=0 | n>0 needed | Retained |
| §6.1 integral lattice and descent | ℤ(n−1) and ℤ(n);ℚ,n=2,3 | Generator divided coordinate 1; ℤ(n) quotient image 0; fixed dimensions 0,1 | Correct twist shift and real descent | Retained |
| §6.2 exact cocycle comparison | P₁Φ=i,P₂Φ=1 | Bo values 2i,2; shared values −i,−1; (−2)(−i)=2i,(−2)(−1)=2 | Signed factor forced by source evaluation | +2→−2 |
| §6.2 nonzero imaginary-quadratic class | F=ℚ(i),n=2,shared value t≠0 in iℝ | Burgos value −t; Borel value −2t; proposed +2 would give 2t; difference 4t≠0 | Detects the reviewed conflict | Added negative control |
| §6.2 ordered determinant | Ranks 0,1,2,3 | (−2)^d=1,−2,4,−8; absolute ratios 1,2,4,8 | Sign matters in odd rank | 2^d→(−2)^d for signed maps |
| §6.2 same-source lattice covolume | Rank 1 Borel t;rank 2 Borel diag(2,3) | Shared −t/2; shared matrix diag(−1,−3/2),det 3/2; Borel det 6; absolute ratio 4 | Absolute 2^d survives sign repair | Retained positive ratio |
| §6.2 zero/rescaled comparison control | Rank 1 t≠0;negate κ_M | −2·0=0≠t; (−κ_M)I_M(i)=−i≠i | Zero and local sign changes fail fixed normalization | Clarified control |
| §6.3 rational Adams scalar | ℚ,n=3,a=2;real quadratic;ℚ,n=2 | Scalar 8; determinants 8,64,1; a=1 gives 1 in every rank | Rank-zero determinant included; proof needs injectivity, not comparison sign | Retained |

**Validation.**

Commit: `0faed68` — `BorelRegulators: review repairs (shared point coordinate and signed regulator comparison)`. Only the two authorized roadmap files changed; the working tree is clean and nothing was pushed.

Build: `lake build TauCetiRoadmap.BorelRegulators.Suggested` — exit 0; exact output:

```text
⚠ [9010/9010] Built TauCetiRoadmap.BorelRegulators.Suggested (2.5s)
warning: TauCetiRoadmap/BorelRegulators/Suggested.lean:51:8: declaration uses `sorry`
warning: TauCetiRoadmap/BorelRegulators/Suggested.lean:77:8: declaration uses `sorry`
warning: TauCetiRoadmap/BorelRegulators/Suggested.lean:86:8: declaration uses `sorry`
warning: TauCetiRoadmap/BorelRegulators/Suggested.lean:104:8: declaration uses `sorry`
Build completed successfully (9010 jobs).
```

The scratch elaboration of all four `#check @name` commands also exited 0, with the four expected `sorry` warnings and the retained hypotheses described above.

Dependency-direction check with `--movable` — exit 0; exact output, with no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 305 edges, 0 problem(s)
```

Gate against `origin/main` after committing — exit 0; exact summary line:

```text
gate BorelRegulators: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
