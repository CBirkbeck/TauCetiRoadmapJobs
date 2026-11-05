<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1764#issuecomment-6483593908 -->
Red team round 2 pass a (codex) of b7087c1

Verdict: needs_changes

1. **F01** (P2) The general-field route cites a geometric linear factorization

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:973`, “list all zeros below a fixed ρ₀ with multiplicity and choose their linear generators π-[z_i]”.

   **Claim:** §3.5 does not state the algebraic-closedness hypothesis on its arbitrary-function decomposition, and the general-field §5.5 cites it in Needs. Reading the Layer 3 heading as imposing geometric F makes §3.5 coherent, but then that prerequisite is outside §5.5’s generality. Reading §3.5 at the standing generality makes its linear-factor assertion false.

   **Witness:** E=𝔽₃((π)), F=completion(𝔽₃((t))^perf), v(t)=1: f=π²−t has slope 1/2 and primitive degree 2, but v(F×)=ℤ[1/3] excludes a square root of t.

   **Exact repair text:** “The convergence assertion for a prescribed family (z_i) holds for every standing F. For the linear-factor decomposition of an arbitrary nonzero f, assume F algebraically closed and choose ρ₀∈I. For general perfect F use the normalized arbitrary-degree factors of §4.9.” Remove §3.5 from §5.5's Needs, where the general-field product is already supplied by §4.9.

   **Repair test:** At ρ₀=3^(−1/3), the quadratic zero radius 3^(−1/2) is below ρ₀. Over F its factor is (π²−t)/π²; over the completed algebraic closure it splits into (1−√t/π)(1+√t/π). Both have the same weighted divisor, without requiring √t∈F. FF17 line 5338 records the source chapter's algebraic-closedness setting.

2. **F02** (P2) The p-typical covectors already have an earlier owner

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:536`, “define the unipotent covectors CWu(R)=colim_V W_OE,n(R); full covectors allow a negative tail generating a nilpotent ideal”.

   **Claim:** §1.12 constructs covectors for every coefficient field without importing their existing p-typical construction.

   **Witness:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4345`, §R07.2.28a, constructs the same nilpotent-tail CW, finite Witt inclusions, stabilized addition, Verschiebung and base change, over every 𝔽_p-algebra by taking base A=𝔽_p.

   **Exact repair text:** “For E=ℚ_p import CW and its unipotent finite-length subfunctor, addition and Verschiebung from FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.28a. Extend these constructions to ramified and equal-characteristic coefficients, with an identification recovering that supplied p-typical functor. This section owns the inverse-V bivectors, the valuation-ring limit, their growth condition and summation into B⁺.” Add that exact supplier to the contract and §1.12 Needs.

   **Repair test:** For R=𝔽_p, both covector constructions give ℚ_p/ℤ_p with V=p. For R=𝔽_p[ε]/ε², the constant negative ε-tail belongs to the supplied full CW but not its finite-support subfunctor. The comparison preserves these distinctions; the new bivector/period work remains here.

3. **F03** (P2) Frobenius product factors need not decay exponentially in qⁿ

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1429`, “the factors approach 1 exponentially in q^n by the positive coefficient bound”.

   **Claim:** Membership in M_d supplies a uniform positive lower bound on the valuations of all error coefficients, yielding that rate.

   **Witness:** In equal characteristic q=2, v(t)=1, put b=1+Σ_(i≥1)t^(2^(−i))π^i∈M₀. At ρ=1/2, v₁(φ^k(b)−1)=min_(i≥1)(2^(k−i)+i)=k+1 for k≥1.

   **Exact repair text:** “The factors approach 1 uniformly on each compact annulus. For a prescribed error, first choose a coefficient cutoff so the positive-index tail is small on the compact interval; then raise the finitely many remaining nonconstant coefficients to sufficiently high q-powers. No uniform exponential-in-qⁿ rate is asserted without a uniform positive lower bound on their valuations.”

   **Repair test:** The witness has error norm 2^(−k−1)→0, whereas v₁(φ^k(b)−1)/2^k=(k+1)/2^k→0. The corrected finite-head/tail argument still gives convergence of the nonarchimedean product and its functional equation.

4. **F04** (P2) The completed fixed-field theorem is already supplied

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1053`, “The same approximation estimates give the Ax fixed-field assertion”.

   **Claim:** §4.1 reproves C^(G_F)=F using a quantitative supplier gap, without importing the existing completed fixed-field theorem.

   **Witness:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:2174`, §RD.0.51(b), identifies these invariants with the completed perfection of the base. For the standing perfect complete F, that is F.

   **Exact repair text:** “Import C^(G_F)=F from PadicDifferentialEquationsAndRigidCohomology §RD.0.51(b), since F is perfect and complete. Coefficient uniqueness then gives W_OE(O_C)^(G_F)=W_OE(O_F). The quantitative cochain contract is used for the continuous cohomology assertions, not to reprove the fixed-field theorem.” Add this supplier section to the contract and §4.1 Needs; retain the new ramified-Witt comparison.

   **Repair test:** For F=completion(𝔽_p((t))^perf), its completed perfection is F itself, so both assertions give C^(G_F)=F. For the excluded imperfect base 𝔽_p((t)), t^(1/p) is fixed and not in the base, exactly as the supplier's stronger statement predicts.

5. **F05** (P3) Four geometric Checks do not test a mathematical instance

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:921`, “The argument controls both increasing evaluation precision and a uniform radius bound before taking a limit”; analogous first Checks occur at lines 936, 951 and 966.

   **Claim:** These four bullets are Checks for §§3.1–3.4. They instead describe the proof, repeat a convention, or announce the scope of the theorem.

   **Witness:** None supplies an input or computed output. In particular the §3.1 sentence cannot distinguish a degree-two equation with two factors from an incorrect purported factorization with one factor.

   **Exact repair text:** Replace these four bullets respectively by: “Over algebraically closed F, (π−[a])² has two factors counted with multiplicity, not one.” “For f=1, θ_y(f)=1 and the Gauss bound is 1≤1, so f is not in the evaluation kernel.” “If |a|=q⁻², the source slope of π−[a] is 2, while its zero radius is q⁻².” “For F=ℂ_p^♭ and I={p^(−√2)}, the point set is empty and B_I is a field; its sole maximal ideal is (0).” Move any retained proof commentary into its proof paragraph.

   **Repair test:** The four outputs are respectively multiplicity 2, nonzero evaluation 1, slope/radius 2 versus q⁻², and 0 classical points versus 1 maximal ideal. Each distinguishes a plausible wrong model.

Head verified as b7087c18. All 2275 README lines and 88 Lean lines have been read; the three supplied elaborated signatures have been compared. No Lean command or package edit has been made.

## Verification of the previous findings

Identifiers below are qualified by the previous pass; its F-numbering is retained. “Repaired” concerns the actual earlier objection, not a certification of every assertion in that section. Quotes are from the present package. The disputed r1b-F05 is resolved on its mathematical merits; no settled finding is re-raised.

| Earlier finding | Status | Present passage and witness |
|---|---|---|
| r1a-F01 | Repaired | §1.13: “natural inclusion in the single-radius ring B_ρ⁺ … not a subring of B.” For p=2 and |a|=1/2, 1−[a]²/2 is a crystalline unit but has a period zero at 1/4. |
| r1a-F02 | Repaired | §8.2: “sum in B_J for every compact J⊆I_minus∖{0}”; §1.2 constructs the boundary value coefficientwise. For f_k=a^k, the interior norms are 2^−k but the zero-radius norms are 1; the resulting constant a/(1−a) extends. |
| r1a-F03 | Repaired | §1.11: “Choose γ₀ in Γ with γ₀>0 and put T₀=[t^γ₀]”. Γ=√2·ℤ[1/2] contains γ₀=√2 and excludes 1; localization at T₀ is defined. |
| r1a-F04 | Repaired | Supplier contract: “root-namespace `surjective_fontaineTheta`”. Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:190 closes WittVector; :195 declares this theorem. |
| r1a-F05 | Repaired | §11.6 Needs: “VB3, Banach–Colmez section and hypercohomology sheaves (banach-colmez-space-definition)”. The current supplier has that anchor, and the matching plan gap uses it. |
| r1a-F06 | Repaired | §1.11 asserts equality of “term values”, not coefficients. At ρ<1, coefficients 1 and 1+π^m differ but both have norm 1 and difference norm ρ^m<1. |
| r1a-F07 | Repaired | §0.7: “Definition 1.6.21, p. 75”. FF17 lines 3047, 3053, 3094 have these labels, at printed pp.73–75. |
| r1a-F08 | Repaired | §8.5: “is a consequence of the gluing theorem of §8.9 and is stated there”; §8.9 now states the identification with sheaves as a consequence. The local Needs edges are 8.9→8.5, not both directions. |
| r1a-F09 | Repaired | §6.7 is now titled “Factoriality of the homogeneous monoid”. §2.12 no longer needs §2.13; §6.7 now needs the already constructed orbit products. Order is 6.3 divisors, 6.4–6.6 products, 6.7 factoriality, 6.8 divisors of sections. |
| r1a-F10 | Repaired | Suggested.lean:79 states `exists_hahnSeries_automorphism_rescaling_order`. For x=t,y=t² the specified ratio is 2; for z=0 its two order values are 0. |
| r1a-F11 | Repaired | §6.1 imports “VB2, Norm topology on twisted Frobenius invariants”. Current supplier VB2 has norms-on-twisted-invariants; the extension here is to every compact fundamental interval, not a second Banach construction. |
| r1a-F12 | Repaired | §1.11: “{1−p^(−n): n≥0}”. At p=2 the first values are 0,1/2,3/4,7/8, not 0,1,2,3. |
| r1a-F13 | Repaired | §10.3: “FF17, Proposition 7.6.1, pp. 269–270”. It now cites FF17 alone; the finite group quotient remains an expressly declared supplier gap. There is no SGA 1 citation requiring a sixth manifest work. |
| r1a-F14 | Repaired | §5.6: “for nonzero f”; §5.7: “B={0}∪{f∈M(Y)×: div(f)≥0}”. For zero, ord is ∞, so no integer divisor is formed. For 1/a_y, ord is −1. |
| r1a-F15 | Repaired | §5.4 names “§RD.0.29” and “§RD.0.24” with their discrete-Cohen/spherical comparison scopes. Current supplier §§RD.0.24 and RD.0.29 have the stated Bézout results; RD.0.10 is no longer cited for them. |
| r1a-F16 | Repaired | §4.3: “Multiplication … by an invariant scalar unit leaves σ(a)/a unchanged”. With a=(1+s)(π−t), σs=−s, the ratio is (1−s)/(1+s), also after scaling by −1. |
| r1a-F17 | Repaired for the identified bullets | §6.9: “The logarithm normalization π^(−n)[π^n]_LT has derivative 1.” §§7.2,9.5,11.6 give jet length, inertia and repeated-jet tests. §0.9 computes (0,±1); §1.5 computes ρ^n versus 1. Other non-testing bullets are a fresh S05. |
| r1b-F01 | Repaired | Suggested.lean:64 states the exotic-untilt theorem, with “0 < Valued.v (p : K)”. Characteristic-p K gives v(p)=0 and is excluded; the Cp-side nonunit Fact remains an explicit binder. |
| r1b-F02 | Repaired | §4.7 constructs “a complete discrete valuation ring with uniformizer a_y and residue field K_y”; §3.6 imports the geometric case only. For degree two and a_y², the quotient has one maximal ideal and length 2, not two geometric components. |
| r1b-F03 | Repaired | §5.4: “§RD.0.29, for the discrete-Cohen-coefficient comparison only”. Same corrected import as r1a-F15; both supplier hypotheses were reread. |
| r1b-F04 | Repaired | §11.6 now names “banach-colmez-space-definition”, the corrected VB3 anchor of r1a-F05. The separately named degree-two obstruction gap is retained; a sufficient representability range is not used contrapositively. |
| r1b-F05 | Repaired; disputed proposed correction not sustained | §4.8: “every factor has |z_j|=‖y‖”. FF17 line 5794 instead uses ‖y‖^d. For s=2^−8,ρ=1/4, the corrected coarse bound is 1/4 at d=1 and 2^196 at d=100; the roadmap's bound is 1/16 in both cases. The previous proposed reading did not repair the source's root-radius error. |
| r1b-F06 | Repaired | §6.4 is now titled “Positive Frobenius products”, preceding §6.7. Same reordering as r1a-F09; no local forward Needs edge found by the textual scan. |
| r1b-F07 | Repaired | VB contract: “ρ_VB=1/r” and point precomposition “is the inverse of the ideal action”. On [a]π² with v(a)=3,r=2, both normalized norms are q^−(7/2); the raw norm is q^−7. |
| r1b-F08 | Repaired | Suggested.lean:79 now declares `exists_hahnSeries_automorphism_rescaling_order`, as in r1a-F10. Positive order excludes x=0 and y=0 without extra nonzero binders. |
| r1b-F09 | Repaired by allowed alternative | The module docstring names the non-Bézout theorem for B⁺ as unavailable because B⁺ is missing; it identifies the existing tilt as `PreTilt 𝓞_ℂ_[p] p`. It no longer claims the tilt carrier is missing. |
| r1b-F10 | Repaired | Banach supplier contract says “lines 228 and 278”; these are `isOpenMap` and `exists_nonlinearRightInverse_of_surjective` at the pin. |
| r1b-F11 | Repaired | §10.3: “FF17, Proposition 7.6.1, pp. 269–270”. Same deletion of SGA 1 as r1a-F13. |
| r1b-F12 | Repaired | §§9.1,9.3 allow endpoints in “|F|”, including 0. At I={0}, the comparison is the unramified Witt-field extension, of degree [L:F]. |
| r1b-F13 | Repaired | §2.12 rejects the source's absolute difference lower bound. For f=1 and δ>0 the two truncated valuations are both 0; the printed bound would give 0≥δ. FF17 lines 4742 and 4955 were reread. |
| r1b-F14 | Repaired in this package | Scope assigns “finite truncations … coefficient diagonal … Q-twisted Witt comparison … Q-Teichmüller lift” to §0.1 and the weak LT lift to §2.10, explicitly for later RelativeFarguesFontaine to consume. The ownership move is recorded; no prerequisite points back to that later roadmap. |

## Statement and computation register

All 109 numbered README targets were read, including their API bullets, proof routes and Checks. There are no separately bold-labelled theorem targets: bold headings are Summary, API and Checks. The rows below cover every numbered target; additional constructions within §§0.1,2.10,11.2 have separate rows. A successful example is evidence for the stated test, not a proof of the universal theorem. “Retain” means no defect found by that computation. Standing context is the README's complete nontrivially valued perfect F/𝔽_q, q=p^f with f≥1, and complete discretely valued E with residue 𝔽_q; zero fields, q=1 and imperfect F are excluded. Geometric rows explicitly use algebraically closed F. The zero module, empty divisor, endpoint and inseparable controls are included where their carriers make sense. These tests do not replace the six declared supplier contracts.

| Target / context | Instances tried | Values computed on the compared sides | Result / change |
|---|---|---|---|
| 0.1 annular comparison, r>0 | q=2,r=2; endpoint 1 | raw(π)=1/4; normalized=(1/4)^(1/2)=1/2; endpoint norm=1 | Correct normalization; retain. |
| 0.1 finite Witt truncations | lengths 0,1; p=2,R=𝔽₂ | length 0 has 0=1; length 1 recovers R; ghosts of (0,0) and (0,1) both (0,0), coordinates unequal | Torsion ghost inversion excluded. |
| 0.1 diagonal | x=π, first two ghosts | Δ: (π,π); wrong [x]: (π,π^q) | Defining ghost law discriminates. |
| 0.1 Q-twist | p=2,Q=(1+X)²−1,a=1; Q=X² | twisted lift −1, its square 1≠−1; monomial lift 1 | Nonmultiplicativity retained. |
| 0.2 coefficient and norm calculus | x=[a]π²,y=[b]π³; norms 1/2,1/4 | first product index 5, product norm ρ⁵/8; q=2,v(a)=3,r=2 gives v_r(φx)=10=2v_1(x) | Retain. |
| 0.3 radial limits | v(a)=3,x=[a]π² | v_r=3+2r; v_r/r→2; v_r→3 at r→0; separate radius-zero norm=q⁻² | Retain distinct endpoints. |
| 0.4 convex transform | π−[a],v(a)=2; monomial [a]π² | L=min(r,2), values 1,2 at r=1,3; monomial 2+2r for r≥0 and −∞ for r<0 | Sign and right horizontal ray correct. |
| 0.4 closedness control | indicator of (0,∞) at x=0 | original +∞; biconjugate 0 | Lower semicontinuity is necessary and present. |
| 0.5 product/Jensen | slopes 2 and 5 | sum of minima at r=1,3,6 is 2,5,7; derivative jumps 1 at each slope | Concatenation, not slope addition. |
| 0.6 restriction | π+[a], |a|=q⁻²; ρ=q⁻¹ | restricted norm max(q⁻¹,q⁻²)=q⁻¹>0, original norm at that radius identical | Restriction is not zero evaluation. |
| 0.7 completed Newton data | (π−[a])², v(a)=2; constant 1 | v=2min(r,2), derivatives 2 and 0, jump 2; constant has jump 0 | Retain. |
| 0.8 stabilization | min(5r,11.2−3r), r∈[0.5,1.5] | endpoint values 2.5,6.7; crossing r=1.4,value 7; error valuation >7 preserves all minima | Endpoint maximum alone insufficient; repair already handles this. |
| 0.9 directional valuations | π[a],v(a)=−r and inverse | first values 0; right/left second values 1,−1; inverse −1,1 | Rank-two signs correct; neither bounds all power-bounded units. |
| 0.10 coefficient change | totally ramified degree 2,π=uπ′²,q=2 | target zero norm(π)=1/4=(1/2)²; raw target radius is √ρ | Retain. |
| 1.1 zero-radius expansions | π⁻¹+[a] | lowest index −1; radius-zero norm q; coefficients below −1 all 0 | Retain bounded negative tail. |
| 1.2 boundary extension | π−[a],v(a)=2; positive constants a^k | polygon lower bound 0 and left cutoff 0; interior error 2⁻k but zero-radius error 1 | Corrected coefficientwise route required. |
| 1.3 unit criterion | π−[a] at/away from |a|; π | at zero radius of factor: order 1, nonunit; away: order 0, inverse exists; π·π⁻¹=1 | Both directions tested. |
| 1.4 overconvergent field | L=F; unramified residue extension degree 2 | [E†_L:E†_F]=1 or 2 respectively, same completed Witt-field degree | Retain comparison scope. |
| 1.5 positive subring | π⁻¹; [a]⁻¹,v(a)=2; π^n | π⁻¹ has endpoint-one norm 1 and interior norm ρ⁻¹>1; [a]⁻¹ endpoint norm q²>1; π^n norms ρ^n→0 versus 1 | Plus differs from power-bounded and endpoint topology. |
| 1.6 Newton positivity | π⁻¹ and [a]⁻¹,v(a)=2 | polygon heights 0 and −2; endpoint norms 1 and q² | True/false membership distinguished. |
| 1.7 monomial perfection | T^(1/p); Σ_j≥0 T^j | norm q⁻¹/p; terms q⁻j→0 weakly, but π-orders all 0 | Weak completion essential. |
| 1.8 annulus tower | q=2,r=2 | ordinary norm(X)=2⁻¹/², square=1/2=raw(T); ordinary norm(π)=1/2,square=1/4=raw(π) | Correct norm power; equal-characteristic tower inseparable. |
| 1.9 cyclotomic coordinate | p=2,e=1; e=2 | ordinary threshold 1/4, period threshold 2⁻¹/²; e=2 faces (0,1),(2,1/2),(4,1/4), slopes 1/4,1/8 | Retain ramification-sensitive calculation. |
| 1.10 variable exchange | u²v³,r=2 | valuations 2r+3=7 and 2+3/r=3.5; first=r·second | Topological comparison, not isometry. |
| 1.11 Hahn carrier | Γ=√2ℤ[1/2]; π⁻¹; exponents 1−2⁻n | 1∉Γ,γ₀=√2∈Γ; norm π⁻¹=2 at ρ=1/2; threshold exponents 0,1/2,3/4,… | Corrected carrier and threshold. |
| 1.11 Hahn summability | coefficients π⁻n² at exponent n; π⁻n at n; π^n at −n | norms 2^(n²−n) unbounded; all norms 1 with unbounded denominators; third norms (2ρ)^n→0 iff ρ<1/2 | Rejects all three wrong models at their bad radii. |
| 1.12 covectors/bivectors | negative index −m, valuations q^(2m) and m² | growth products q^m→∞ versus q⁻m m²→0, although both beat linear Gauss weights | Growth condition sound; import p-typical CW under S02. |
| 1.13 PD radius | p=2,ρ=1/2,z=[a]²/2; p=3 | v₂((2n)!/2^n)=0,1,1,3 for n=1..4; zero radius 1/4; v₂(2!)=1 versus v₃(2!)=0 | Inclusion repaired; retains base PD and pro-object qualification. |
| 1.14 invariant periods | trivial rank-one isocrystal; zero isocrystal | fixed scalars E on both sides; zero module gives 0 on both | Checks invariant equality, not equality of ambient rings. |
| 1.15 boundary quotient | π,[a] with v(a)=2; coefficients v_n=1/(n+1) in a field admitting them | π unit after quotient; [a] maps to 0; inf v_n=0 although every v_n>0 | Separates the two boundary ideals. |
| 2.1 Q-limit | perfect R; p=2 square-root sequence (1,−1,i,…) | perfect-case projection inverse sends a to (a,a^(1/q),…); doubled sequence has (−2)²=4≠2 | Transported addition necessary. |
| 2.2 reduction invariance | R=S[ε]/ε², char p, perfect S | ε^p=0 for p≥2, all compatible nilpotent coordinates vanish; inverse limit=S | Nonreduced control passes. |
| 2.3 theta | perfect R; [1],[0]; nonsurjective residue Frobenius | theta is coordinate 0 in perfect char p case; images 1,0; missing residue roots block digit lifting | Hypotheses retained. |
| 2.4 principal theta kernel | compatible root of π; incompatible root of c≠π | theta([ϖ]_Q−π)=π−π=0; incompatible gives c−π≠0 | Specified root and torsion-freeness retained. |
| 2.5 primitive degree | 1,π,π−[a],(π−[a])² | degrees 0,undefined,1,2; π has constant coefficient 0 | Degenerate case excluded correctly. |
| 2.6 degree-one division | f=a_y² and f=1 | remainders modulo a_y are 0 and 1; quotient in first case a_y | Kernel/closed division discriminated. |
| 2.7 marked untilt valuation | y=(π−c),v_F(c)=2 | v_y(π)=2, norm q⁻², versus coefficient norm q⁻¹ | Normalization retained. |
| 2.8 proximity | equal-characteristic a=b; difference valuations 2,3,2 | δ diagonal=∞,d=0; δ triangle 2≥min(3,2)=2; distances q⁻²≤max(q⁻³,q⁻²) | Symmetry, direction and diagonal agree. |
| 2.9 bounded-point completeness | δ(y_n,y_m)≥n,v_y_n(π)≤2 | for n≥3 ideals agree modulo a₃; π-valuation cannot exceed bound 2 in limit | Retain simultaneous radius bound. |
| 2.10 weak LT lift | multiplicative law, nonzero u,v | sum u+v+uv; replacing by u+v loses nonzero uv; zero lifts to 0 | Transported law distinguished. |
| 2.10 primitive LT equation | p=q=2,Q=2X+X²; ε=0 versus v(ε)=4 | Q/X=2+X has two cyclotomic terms; ε=0 gives π, not primitive; point valuation 2; V norms 1/4 and 1/8 after π-action | Correct quotient, exclusion and scalar norm. |
| 2.11 parametrization | unit scalar; π scalar; v_y(π)=2 | unit keeps radius q⁻²; π sends it to q⁻²q; E× quotient identifies Frobenius, O_E× quotient does not | Retain distinct quotients. |
| 2.12 Berkovich topology | f=1,δ>0 | truncated values min(0,δ)=0=0; purported source bound 0≥δ false | Repair retained. |
| 2.13 ramified coefficient change | separable quadratic; purely inseparable quadratic in char 2 | separable fibre has 2 embeddings, contracted primitive degree 1; inseparable fibre has 1 embedding | Separability retained. |
| 3.1 geometric factorization | (π−[a])²; degree-zero unit | positive-degree factor count 2; empty count 0 and product 1 | Statement passes; replace non-test under S05. |
| 3.2 evaluation | π−a at y_a; π+[b],v(a)=2,v(b)=3 | first evaluates 0 but Gauss norm |a|>0; second valuation min(2,3)=2 | Statement passes; S05 Check repair. |
| 3.3 geometric zeros | (π−[a])² | Newton jump 2; removing one/two factors leaves orders 1/0 | Statement passes; S05 Check repair. |
| 3.4 compact geometric rings | I={0}; irrational singleton; integral boundary | π invertible in field, order 1 nonunit in integral ring; irrational singleton 0 points, 1 zero maximal ideal | Statement passes; S05 Check repair. |
| 3.5 products | empty; one factor; repeated fixed a; nonsplit π²−t over F₃ | products 1 and 1−[a]/π; repeated errors |a|/ρ do not tend to 0; nonsplit slope 1/2 but 1/2∉ℤ[1/3] | Clarify factorization's geometric scope: S01. |
| 3.6 locally finite divisors | radii q⁻n; infinitely many points in compact J; doubled point | compact intersections finite versus infinite; doubled coefficient 2 | Local finiteness excludes wrong global carrier. |
| 3.7 divisor divisibility | f=a_y²,g=a_y and reversed | order difference 1 with holomorphic quotient a_y; reversed −1 with pole | Both directions pass. |
| 4.1 traces and invariants | identity extension; separable degree p; perfect F | Tr_id(1)=1; Tr_degree-p(1)=0 although trace surjective; C^G=F | Trace control sound; fixed-field duplication S04. |
| 4.2 Witt principal units | k=1, (1+πa)(1+πb) | mod π² gives 1+π(a+b); next graded quotient additive m_C, initial quotient multiplicative 1+m_C | Successive corrections use appropriate laws. |
| 4.3 stable primitive ideals | char 3,a=(1+s)(π−t),s²=t,σs=−s | cocycle (1−s)/(1+s)≠1, unchanged by −1; removing 1+s yields cocycle 1 | Repaired scalar Check passes. |
| 4.4 finite orbits | S₃,H order 2; cyclic orbit of size 2 | coset sizes 3 and 2; H nonnormal so no quotient group S₃/H | Coset, not Galois-group, indexing correct. |
| 4.5 finite-degree untilts | degree 1 and 2 | tilt degrees 1 and 2; geometric conjugate counts 1 and 2; integral theta surjective only in degree-one assertion | Retain markings. |
| 4.6 radius/degree | d=2,|a₀|=q⁻⁶ | radius q⁻³=(q⁻⁶)^(1/2), slope 3; each geometric root radius q⁻³ | Correct degree root. |
| 4.7 weighted zeros/DVR | degree 3,order 2; degree 2,length-2 jet | jump 6=3·2, each geometric order 2; jet length 2 with one maximal ideal, not two | General completed-DVR repair passes. |
| 4.8 normalized generators | s=2⁻⁸,ρ=1/4,d=1,100 | max(√s,s/ρ)=1/16 for both; coarse ρ⁻d√s=1/4 or 2^196 | Degree-independent bound distinguishes source error. |
| 4.9 general products | empty divisor; one degree-d point; outer exponent 2 or 0 | empty product 1; local coefficient 1/Newton weight d; 1−h² has extra h=−1 zero when distinct; exponent 0 gives 0 | Majorant versus exact divisor retained. |
| 5.1 general compact ring | singleton outside divisible value group; quadratic point radius | first has no slopes and all nonzero elements invertible; second has degree weight 2 although radius may not lie in original group | Correct exceptional group. |
| 5.2 divisor criterion | orders (2,1),(1,2) | quotient orders 1,−1; first holomorphic, second not | Both directions pass. |
| 5.3 closed ideals | D=0,[y],2[y]; irrational singleton | ideals B,m_y,m_y² with m_y²⊆m_y; singleton 0 nonzero maximal ideals=0 classical points | Correct exclusion of zero ideal/maximal ideal. |
| 5.4 half-open Bézout | (a_y²,a_y³),(f,0),(0,0) | generator a_y², f, 0 respectively | Zero cases avoid div(0); supplier scopes corrected. |
| 5.5 nonclosed ideal | delete all zeros in exhausting J_n | ord on J_n=0, at an escaping zero≥1; compact restriction unit/global nonunit | Dense proper ideal route survives with §4.9; remove inappropriate §3.5 dependence under S01. |
| 5.6 meromorphic field | 1,1/a_y,0; rescaled fraction | orders 0,−1,undefined; multiplying numerator/denominator by a_y changes order by 1−1=0 | Correct nonzero domain and quotient invariance. |
| 5.7 global fractions | a_y⁻²,a_y/a_y,0 | multiplying first by a_y² gives 1 and order 0; second order 0; zero admitted separately | Repair retained. |
| 5.8 holomorphic invariants | invariant constant c; f=gh with one zero carried by g | c∈F by C^G=F; ord(g)=1,ord(h)=0 | Correct remainder gets boundary extension. |
| 6.1 eigenspace topology | h=1,d=1,0,−1; zero vector | positive quotient boundary value 0 gives norm 1 on a nonzero class; fixed space at d=0 is E; negative eigenspace 0; zero norm 0 | No inherited quotient norm asserted; supplied topology imported. |
| 6.2 transport | φ(u)π=uπ′,φ(x)=π^d x; unramified degree 2 | φ(u^d x)=(π′)^d u^d x; φ²(x)=π^(2d)x | Uniformizer and residue-degree directions correct. |
| 6.3 orbit divisors | q=2,ρ=1/4; weights 3 and 2 | next radius 1/16, exactly one representative in (1/16,1/4]; total weight 5 versus unweighted count 2 | Finite orbit support retained. |
| 6.4 positive product | b=1; b=π−[a]; slow-tail b of S03 | first product 1; shift ratio π/b; slow-tail error at ρ=1/2 is 2⁻(k+1), not exp(−c2^k) | Product equation passes; repair rate under S03. |
| 6.5 negative product | b=1; general normalized solution | solution set E, generator 1 after normalization; multiplying solution by c∈E× leaves φ-ratio 1 | Uniqueness only modulo E× retained. |
| 6.6 full product | primitive degree d, d=1 | multiplying φ-ratios (π^d/b)·b gives π^d; negative/positive tails partition ℤ with coefficient 1 | Eigenvalue sign correct. |
| 6.7 homogeneous factoriality, geometric | degree 0 and 2 | empty product 1; degree two factor multiplicities 2 or 1+1 | Does not assert factoriality of inhomogeneous ring. |
| 6.8 eigenvector divisors | P₂; equal-degree identical divisors | orbit degree 2; quotient divisor 0 and scalar class in E× | Degree/sign match. |
| 6.9 LT logarithm | derivative at 0 of π⁻n[π^n]_LT | π⁻n·π^n=1; unnormalized derivative π^n→0 | Correct normalization at every p, including 2. |
| 6.10 finite-jet exact sequence | d=0; one repeated point of length 2 | empty quotient 0, sequence 0→E→E→0; ξ² quotient length 2 and nonzero nilpotent ξ, unlike K×K | Repetition/orbit separation retained. |
| 6.11 backward interpolation | one point; two neighboring orbit representatives | Π₋ tail n<0; φΠ₋ tail n≤0; overlapping required order max(1,1)=1, not 2 | Correct shift and union multiplicity. |
| 6.11 graded fibre | t=s_y versus t=0 | degree-one quotient P₁/E s_y=K_y; t=0 gives P, where alternative factorizations (cT)²=T(πT) would contradict homogeneous uniqueness | Nonzero t and integral normalization necessary. |
| 7.1 geometric Be degree | poles 2,3; constant 1 | ν(ab)=5; ν(1)=0; weak remainder bound allows ν(r)=3, not <3 | Correctly avoids Euclidean descent inference. |
| 7.2 jet descent | orders 0,2 | order-zero module 0; order-two graded lengths 1+1=2 | Keeps full nilpotent thickening. |
| 7.3 positive cohomology | V=0; trivial rank one,d>0 | V=0 gives H⁰=H¹=0; rank one has nonzero H⁰, H¹=0 | Nonzero-section hypothesis retained. |
| 7.4 general Be Dedekind | two zero orders 1,2 | quotient factors lengths 1,2; total local length 3, not 2 | PID conclusion not asserted for general F. |
| 7.5 class group/characters | trivial and product characters | trivial ideal gives 1; product gives χψ; inverse twist gives χχ⁻¹=1 | Character direction and continuity retained. |
| 7.6 degree-one generation | degree 0; char-2 quadratic | Sym⁰=E=P₀; derivative of X²+πX+π is π≠0; derivative X²−π is 0 | Small-degree and separability controls pass. |
| 7.7 weighted curve | s/t,degree(s)=degree(t)=1; constant | weighted zero degree−pole degree=1−1=0; constant sum 0 | Weighted completeness, not finite-type properness. |
| 8.1 interval site | adjacent half-open versus overlapping closed cover | [0,1/2),[1/2,1] has empty overlap and no finite compact refinement; [0,2/3],[1/3,1] overlap [1/3,2/3] | Wrong product-sheaf cover excluded. |
| 8.2 endpoint splitting | π,π⁻¹ at radii 1/4,1/2; f_k=a^k | norms (1/4,1/2) and (4,2); interior f_k norm 2⁻k, zero-radius norm 1 | Corrected construction avoids false endpoint summation. |
| 8.3 Mayer–Vietoris | I=J, (1,2), diagonal (f,f) | difference −1; diagonal difference 0; any h is image of (h,0) | Kernel/surjectivity signs correct. |
| 8.4 Fréchet–Stein | constant system K,K²; zero; dual-number quotient | limits K,K² or 0; K over K[ε]/ε² has length 1, not a multiple of 2, hence not finite free/flat | Generic flatness hypothesis discriminates. |
| 8.5 compatible systems | trivial ranks 0,2; rank-changing transition | base-change gives 0 or B_K²; rank 1 cannot become rank 2 by the required isomorphism | Cocycle and projectivity are real data. |
| 8.6 global sections | rank 0,2; infinite escaping divisor on (0,ρ] | sections 0,B_I²; each compact has finite product generator, global product has infinitely many zeros | Does not mistake compact generator for global one. |
| 8.7 bounded fibres | cyclic jets lengths n; n copies of residue module | cyclic jet fibre dimension 1 for every n, length n; n copies fibre dimension n | Correct bound is dimension, not torsion length. |
| 8.8 matrix factorization | Z=diag(T,T⁻¹),V=E₂₁ | ZVZ⁻¹=T⁻²E₂₁; derivative U+ZVZ⁻¹, quadratic term UZVZ⁻¹ | Actual tangent and Z-dependent radius retained. |
| 8.9 gluing | identity rank 2; rank 0; irrational singleton | sections B_union² or 0; singleton square is field identity and zero prime covers Spm | Uniform factorization radius supplied before approximation. |
| 8.10 half-open closed modules | d=0; aR⊂R,a≠0 | ranks 0 and 1; aR closed, dense proper nonclosed ideal not allowed | Finite rank/closedness retained. |
| 9.1 finite étale annuli | identity; separable degree p; I={0} | ranks 1,p; traces 1,0 on the element 1; zero-radius Witt-field extension unramified | Includes zero, excludes one. |
| 9.2 completed invariants | I={0},Σ[x_n]π^n | σ-invariance iff σx_n=x_n for every n; coefficients lie in C^G=F | Scalar equality is separate from descent effectivity. |
| 9.3 effective descent | σe=[σc/c]e; trivial; rank-two matrices | fixed vector [c]⁻¹e since σ([c]⁻¹)·[σc/c]=[c]⁻¹; trivial gives B_F; E₁₂E₂₁=E₁₁≠E₂₂=E₂₁E₁₂ | Correct cocycle order and inverse basis factor. |
| 9.4 arbitrary intervals | J={q⁻√2}, value group q^ℚ; closed irrational endpoint | number of contained nonempty value-group-endpoint subintervals in singleton=0 | Arbitrary-compact extension is explicitly a target, not an invalid cofinality argument. |
| 9.5 endpoint-one obstruction | z^p−z=t⁻¹ over completed perfection | Artin–Schreier derivative −1≠0; inertia quotient order p; regular representation has nontrivial inertia | Contrasts with residue-factor representations. |
| 10.1 rational quotient | q=2,window [1/4,1/2] | lower endpoint=(upper endpoint)²=1/4; every radius orbit meets it | Correct faithful-flatness window; rational field distinct from Be. |
| 10.2 coefficient curve change | unramified degree 2; inseparable quadratic | coefficient Frobenius becomes φ²; separable geometric tensor two factors; inseparable tensor ε²=0 | Separability and residue-factor choices retained. |
| 10.3 tilt covers | separable quadratic residue field; nonnormal group case | closed-point stabilizer may have order 2 while geometric embedding stabilizer is 1; S₃ coset orbit has 3 elements | Geometric freeness used, not freeness on closed points. |
| 10.4 tower curve | inert unramified tower, residue degrees 2 then 4 | uniformizer order 1 at both stages; ξ² quotient length 2 at both, residue field size/degree changes | No unjustified stabilization of quotient fields. |
| 10.5 Frobenius modules | (B,φ),(B,π⁻¹φ),(B,0),zero module | H⁰=E or P₁; zero on nonzero B not invertible; unique 0→0 map invertible | Invertible linearization, including rank 0, correct. |
| 10.6 Frobenius line degree | multiplier π⁻¹; dual; tensor | −v_π(π⁻¹)=1; dual degree −1; tensor degree 0 | Sign and degree-zero character scope correct. |
| 10.7 positive presentations | Φ(e)=λ⁻¹e; Koszul pair (−s,t) | fixed equation φ(f)=λf; degree v_π(λ)>0; ta+sb=−ts+st=0 | Positive multiplier and both twists retained. |
| 10.8 Runge | dominant ratio [b]⁻¹; |b|=1/4 | proposed product approximates π/[b]; reciprocal gives π[b]; norm ratio 16 | Source reciprocal corrected; norms needed for reconstruction. |
| 11.1 nonprincipal ideal | β_j→√2 in ℤ[1/p]; rational limit control | generator would have value √2∉ℚ; rational limit lies in ℚ and gives no contradiction | Example appropriately scoped. |
| 11.2 differential construction | identity; finite separable; t=s^p purely inseparable | Ω=0; Ω=0; dt=p s^(p−1)ds=0 while ds≠0 | Killing base differential alone not vanishing of completed module. |
| 11.2 strict endomorphism | p=2,d₁,d₂,d₃ | 3,7,17; successive d_(n+1)−2d_n=1,3,…; d_n/2^n→3 | Nested-disc numerical inputs pass; identity endomorphism fails nonsurjectivity. |
| 11.3 exotic untilt | K=Cp; erroneous K=Cp♭; strict untilt | Cp identity is continuous surjective; char-p candidate has v(p)=0 and fails; strict untilt closure of Qpbar is proper | Correct positive p valuation and topological distinction. |
| 11.4 closed primes | (π),maximal,boundary prime | quotient O_F has fraction field F; maximal residue k_F; boundary quotient W_OE(k_F), fraction field W_OE(k_F)[1/π] | Quotient versus residue field distinguished. |
| 11.5 homogeneity | x=t,y=t²,z=t^(1/2),z=0; wrong isometric action | scale 2; image orders 2,1,0; right sides 2·1,2·1/2,2·0; isometry cannot change 1 to 2 | Positive rational rescaling and zero junk value handled. |
| 11.6 representability boundary | slope 2; repeated point | predicate 0<2≤1 is false but says nothing about representability; repeated jet has length 2 and kernel dimension 1 | Separate obstruction gap retained; no false converse. |

### Lean declaration context and headline coverage

All names in this table are in `TauCetiRoadmap.RelativeFarguesFontainePartII`. There are no section variables, local instances, definitions or data stubs: the binders are on each theorem itself. The worker-supplied elaborated signatures were compared, without running Lean, as required by the read-only brief.

| Declaration / README section | Elaborated variable and instance context | Computations and negative controls | Assessment |
|---|---|---|---|
| `exists_strict_laurentClosure_endomorphism`, Suggested.lean:42 / §11.2 | p with Fact p.Prime; arbitrary-universe k with Field and CharP k p; arbitrary-universe K with NormedField, Algebra (LaurentSeries k) K and IsAlgClosure; explicit hvaluation on every pair of Laurent series. Conclusion on UniformSpace.Completion K, continuous ring endomorphism fixing the composite image of every a:k, not surjective. | x=0,1,t orders ∞,0,1 correspond to norms 0,1,c with 0<c<1; hvaluation forces this ordering. Identity map fixes constants but has surjectivity=true, so fails. The zero function sends 1 to 0, so is not a ring endomorphism. At p=2, numerical sequence values 3,7,17 satisfy the strict-disc construction. | All needed binders retained. KT16 Theorem 1.2 and Remark 3.3 cover arbitrary coefficient field k. Not a one-lemma or one-tactic consequence of the pinned carrier definitions. |
| `exists_untilt_padicComplex_not_continuouslyIsomorphic`, Suggested.lean:64 / §11.3 | p with primality and explicit nonunit Fact in 𝓞_ℂ_[p]; existential small K:Type, Field and Valued K NNReal; CompleteSpace and IsAlgClosed; 0<v(p)<1; existential K-side nonunit Fact before the PreTilt ring equivalence; no continuous ring equivalence to Cp. | At K=Cp, identity is continuous, so the final negation fails. At K=Cp♭, v(p)=0, so the strict lower bound fails. In the actual strict untilt, the closure of Qpbar is a proper copy of Cp. | Small existential universe suffices for the existence theorem; no lost completeness/nonunit binder. Complete algebraically closed rank-one mixed-characteristic fields are perfectoid here. README explains why a continuous isomorphism is a homeomorphism. |
| `exists_hahnSeries_automorphism_rescaling_order`, Suggested.lean:79 / §11.5 | p with primality; x,y in native HahnSeries ℚ (AlgebraicClosure (ZMod p)); explicit hx:0<x.order and hy:0<y.order. Ring equivalence fixes every constant, takes x to y and rescales order of every z. | x=t,y=t² gives ratio 2 and z=t^(1/2) gives 1=2·1/2. For z=0, pinned order_zero gives 0=2·0. x=0 would have order 0 and is excluded; denominator is positive. Isometric maps would force 1=2 and are excluded by the rescaling formulation. | Native carriers; no hidden homogeneity hypothesis or sorry'd structure. Poonen's embedding/maximal-completeness argument is substantive. |

The README's headline families are completed Newton/weighted zeros; boundary extension and units; primitive factorization and marked untilts; divisor/closed-ideal and half-open Bézout theorems; Frobenius products and homogeneous factorization; finite-jet fundamental sequences; general-field Dedekind charts and character class groups; degree-one generation and weighted curve; interval bundle/coherent-system equivalences; finite étale annular extension and effective descent; rational functions and finite covers; positive-line Proj; Runge and adic reconstruction; nonprincipal B⁺ ideal; strict Laurent-closure endomorphism; exotic untilt and its curve residue field; closed prime classification; valued homogeneity and primitive-point orbit description. The three field-theoretic native-carrier headlines are stated. The module docstring names 17 unavailable carrier-dependent headline families or parts. No statable headline was found missing, no theorem is a boundary-case substitute, and none of the three declarations is padding. The degree-two representability obstruction is a supplier contract, not an additional local theorem to encode in Lean.

### Suppliers, ownership, pins and order

The read-only dependency command from the brief returned exactly:

```text
depcheck: 186 roadmaps, 1222 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The local Needs scan found no forward edge between the numbered targets. This does not cure the generality mismatch in S01 or the missing imports in S02/S04.

The current citation resolver used main c994070 and the supplied open-head index. It reported no unresolved cross-roadmap citations and no unresolved roadmap Lean names. Its own final line says it did not check external Lean names because its configured host lacks pinned Lake packages; that limitation was handled by reading the explicitly supplied pinned files, not by treating the resolver as proof of library availability. The content manifest pins are Mathlib f6090c7095e1 and Tau Ceti 358314d4ab97.

Fourteen supplier roadmaps had their relevant text inspected in this round: VectorBundlesAndIsocrystals; PerfectoidSpaces; CrystallineCohomology; DerivedDeRhamCohomology; OptimalTransport; SchemeAndStackFoundations; LocallyAnalyticDistributions; PadicDifferentialEquationsAndRigidCohomology; AdicSpaces; AdicSpacesPartIII; NewtonPolygons; PadicHodgeTheory; AdicEtaleGeometry; FiniteFlatGroupsAndIntegralPadicHodgeTheory. The last is the missing import found in S02. In particular:

- VB−1 has arbitrary-coefficient Witt operations, relative annuli and marked Cartier divisors, but its complete-DVR assertion is geometric. The repaired §4.7 supplies the general-field extension. VB2 has the twisted-invariant topology and geometric classification. VB3's actual Banach–Colmez anchor exists.
- RD.0.24 has the spherical-complete analytic comparison, RD.0.29 the discrete-Cohen comparison and RD.0.54 the general-local-field bounded period coefficients. RD.0.51 supplies the fixed-field theorem missed in §4.1.
- SchemeAndStackFoundations §0.3 states the positive Veronese comparison without a degree-one generation assumption. AdicSpacesPartIII §R3.2 states all three gluing conditions and a factorization radius fixed by the strict surjection; its projective descent target uses all three conditions. AdicEtaleGeometry §A4.2a supplies finite Galois descent, not infinite-tower effectivity.
- Main OptimalTransport Layer 5 supplies proper lower-semicontinuous extended-real conjugation; the additional closed convolution identity remains the stated gap. NewtonPolygons' negative geometric slope is converted explicitly. AdicSpaces' power-bounded plus ring is not identified with the positive subring in this package.
- The pinned `WeilDivisor` is exactly `X →₀ ℤ` (TauCeti/AlgebraicGeometry/WeilDivisor/Basic.lean:45); its weighted degree is a finite sum (:339). It cannot encode infinite locally finite support without an additional object. `finiteProjectiveEquiv` in TauCeti/AlgebraicGeometry/VectorBundle/Affine/Basic.lean:102 supplies the affine comparison, not the noncompact interval theorem.
- Mathlib's `IsBezout` quantifies over finitely generated ideals (Mathlib/RingTheory/PrincipalIdealDomain.lean:65); its domain TFAE adds the noetherian/PID equivalences (Mathlib/RingTheory/Bezout.lean:55). `PreTilt` needs the explicit nonunit Fact for its ring instance (Mathlib/RingTheory/Perfection.lean:633–640). `HahnSeries.order` has zero junk value 0 (Mathlib/RingTheory/HahnSeries/Basic.lean:358–362). The theta namespace and Banach declaration locations were checked again.

Ownership searches used the roadmap tool across main and the supplied open-head index, and searched board packages. The checks included Witt covectors, Fréchet–Stein/coadmissible systems, analytic-field Kähler seminorms, annular divisors and the three Lean names. PadicLocalLanglandsForGL2Qp's distribution-algebra construction and OverconvergentAutomorphicForms' consumed distribution interface do not replace the general Fréchet–Stein target here. The analytic-field differential criterion remains explicitly owned in §11.2. RelativeFarguesFontaine's later coefficient direction was inspected; the moved truncations/diagonal/Q-twist/LT lift are recorded in this package rather than imported upward. No other Suggested.lean in the package search declared this namespace, and the three headline names had no match on main or in the open-head search. Ownership against unlisted or unavailable open heads was not checked.

All six gap slugs match between the README contracts and `design/plan.json`: perfectoid-quantitative-cochains; crystalline-pro-final-radius; lubin-tate-all-local-fields; positive-degree-two-obstruction; closed-infimal-convolution; finite-group-free-scheme-quotient. Each names a supplier and its missing interface. They are accepted as conditional contracts; their present absence is not a finding. The quantitative cochain contract covers related corrections in one norm-controlled interface; S04 does not reject that contract, only the needless reproof of its already supplied fixed-field application.

## Verified sound

Counts: **3 Lean declarations read and compared with elaborated signatures; 109 numbered README targets read; 117 target/construction computation rows; 114 Checks blocks read and their mathematical instances grouped in that register; 110 explicit source-line anchors inspected (105 FF17 and five KT16/Berger08/ST02), plus Poonen93 Theorem 2 and Corollaries 5–6; 14 supplier roadmaps checked, with the individual contracts above.** These are counts of checks performed, not a claim that example testing proves every theorem. Named source statements and printed-page locators were compared in the five legal cached texts; source proof problems are recorded separately below.

The three elaborated signatures agree with their current README statements. The single import is Mathlib; there are exactly three `theorem` declarations with `sorry`, no definitions, no instances, no `opaque`, no `set_option`, no admitted examples and no fake Prop fields. The non-Bézout B⁺ theorem is not replaced by a scalar inequality. The mathematical corrections for zero divisors, primitive degree, rational-radius normalization, norm powers, finite jets, the product shift, weighted degree, scalar character direction and zero-rank cohomology survive the computed controls recorded above.

The read-only git diff stat against origin/main shows changes only under `packages/RelativeFarguesFontainePartII/`. The roadmap text and Lean docstrings contain no pull-request-number dependency, no computational algorithm target, and no extra import. No suspicious instruction in source or sibling text was acted upon. This review wrote only its report and scratch notes.

## Not verifiable

- No Lean elaboration/build was run: the explicit read-only prohibition takes precedence over the generic request to make a new #check file. The supplied elaborated types were used; therefore this report does not claim an independent rebuild.
- LubinTateFormalModulesAndQuasiCanonicalLifts LT.0–LT.2 could not be reread from an allowed published/current checkout. The current roadmap-show lookup failed and no main/completed copy was present. An unsubmitted worker copy was not used as a published supplier. The named all-local-field gap remains accepted; no absence finding is inferred from the unavailable copy.
- The six supplier gaps remain hypotheses on the eventual library. In particular quantitative semilinear corrections, arbitrary-compact descent estimates, the pro-final crystalline comparison and the degree-two nonrepresentability obstruction have not been proved by this review.
- Source verification checks the available 2017 FF17 and cached KT16/ST02/Berger08/Poonen93 texts. No assertion is made that every error below persists in a later published edition or has a published correction. No additional source was needed or fetched; no missing-reference request was created.
- The tuple of exact section, hypothesis and carrier matters: searching the whole open-head index does not certify every unrelated open roadmap. AlgebraicVectorBundles' general ownership was corroborated through the pinned affine equivalence; no independent audit of that roadmap was performed.

## Source issues

- **Error** in FF17 at §1.5.1, printed p.66, line 2752: the source says convexity alone suffices for biconjugacy; it should be proper lower-semicontinuous convexity; affects a stated result.
- **Misprint** in FF17 at §1.5.1, printed p.66, lines 2761–2762: the source says transform breakpoints are slopes of that transform; it should be slopes of the original polygon; affects a stated result.
- **Misprint** in FF17 at §1.5.1, printed p.66, lines 2766–2767: the source says the infimal-convolution inputs take values including negative infinity; it should be the preceding convex inputs with positive infinity; affects a stated result.
- **Error** in FF17 at Lemma 1.7.2 and Proposition 1.7.3, printed pp.81–82, lines 3388 and 3443: the source says the raw period and ordinary annular norms are equal; it should be the radius-dependent power equality; affects a stated result.
- **Error** in FF17 at §1.7.5, printed p.84, line 3536: the source says every completed-period coefficient is integral; it should be rational Witt coefficients with the appropriate bounded-denominator and support conditions; affects a stated result.
- **Gap** in FF17 at Proposition 1.9.1, printed p.87, lines 3654–3659: the source says the positive-index double series converges after adjoining radius zero; it should be a coefficientwise boundary extension, since small residue coefficients have zero-radius norm one; affects the proof.
- **Misprint** in FF17 at Proposition 2.3.2, printed p.115, lines 4742–4744: the source says the generator-evaluation valuation is an ordinary ultrametric distance; it should be valuative proximity, with ordinary distance q to its negative; affects a stated result.
- **Error** in FF17 at Proposition 2.3.16, printed p.120, line 4955: the source says the absolute difference of evaluation valuations is bounded below by proximity; it should be equality of valuations truncated at proximity; affects the proof.
- **Error** in FF17 at Corollary 2.5.4, printed p.128, lines 5276–5278: the source says all closed maximal ideals are classical points for every interval; it should be the nonzero closed maximal ideals, excluding the zero ideal of an irrational singleton field; affects a stated result.
- **Misprint** in FF17 at Proposition 3.1.7, printed p.136, lines 5513–5516: the source says the orbit is indexed by Gal(L/F); it should be indexed by G_F/G_L, since the stabilizer need not be normal; affects a stated result.
- **Error** in FF17 at Lemma 3.4.5, printed p.144, lines 5794–5813: the source says each geometric root has norm s^d and derives that coefficient bound; it should be norm s, requiring a new degree-uniform normalization estimate; affects the proof.
- **Error** in FF17 at §3.5.2, printed p.146, line 5872: the source says maximal points freely generate the nonzero-ideal monoid for every compact interval; it should be the nonzero maximal primes, excluding the zero prime when the compact ring is a field; affects a stated result.
- **Error** in FF17 at Theorem 6.4.4, printed p.254, lines 10316–10326: the source says the nonpositive-orbit interpolation ideal is generated by the unshifted negative product; it should be generated by its Frobenius shift, including the original point; affects a stated result.
- **Error** in FF17 at Proposition 7.1.2, printed p.262, lines 10586–10589: the source says positive-twist invariants are nonzero for every finite-dimensional representation; it should be restricted to nonzero representations; affects a stated result.
- **Misprint** in FF17 at Proposition 7.9.1 proof, printed p.276, lines 11158–11161: the source says divide π by the displayed logarithm ratio power to approximate π/[b]; it should be multiplication of π by that ratio power; affects the proof.
- **Gap** in FF17 at Lemma 11.2.6, printed p.371, lines 14670–14683: the source says positive-index summands converge in the enlarged interval including zero; it should be summation at positive radii followed by extension of the resulting function; affects the proof.
- **Misprint** in FF17 at Lemma 11.2.6 proof, printed p.371, line 14669: the source says a negative-index norm is compared with itself at the same radius; it should be a comparison at two distinct radii, with negative-index norms decreasing; affects the proof.
- **Error** in FF17 at Remark 11.2.8, printed p.371, lines 14700–14706: the source says finite set-theoretic subcovers of compact subsets define a topology making period functions a sheaf; it should be defined using finite compact refinements, excluding disjoint adjacent half-open covers; affects a stated result.
- **Gap** in FF17 at Lemma 11.2.10, printed p.372, lines 14715–14726: the source says surjectivity of the unconjugated sum permits applying the local-surjectivity lemma; it should be justified by surjectivity of U+ZVZ⁻¹ and an argument valid in equal characteristic; affects the proof.
- **Gap** in FF17 at the consequence of Proposition 11.2.18, printed p.377, lines 14916–14919: the source says value-group compact descent yields descent on every interval; it should be preceded by arbitrary-compact descent, including irrational singletons and included irrational endpoints; affects the proof.
- **Misprint** in FF17 at Préface §1.4, printed p.9, line 465: the source says automorphisms act transitively on the entire maximal ideal in the maximally complete setting; it should be transitivity on nonzero elements with topological valuation rescalings in the stated Cp-type setting; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b7087c18acf65ea298e54b2a59292b4a8141e4de", "job": "RT-RelativeFarguesFontainePartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
