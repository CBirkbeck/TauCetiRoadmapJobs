<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1205#issuecomment-6420631186 -->
Red team round 1 pass a (codex) of 73538ce

Verdict: needs_changes

1. **F01** (P1) The least auxiliary primes are not field-independent

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:1406`, “for g = 3 the least q ... at some place is 23 ... allow q = 11”.

   **Claim:** The two least-prime assertions hold for the number field K of the section, without a restriction on K.

   **Witness:** Take the totally real K=ℚ(√5,ζ₁₁+ζ₁₁⁻¹). For r=5,11, either r divides q_v or q_v²≡1 mod r. Thus q=11,23 respectively violate the prime-divisor condition at every v.

   **Exact repair text:** “(III) For genus-three curves over ℚ, the least auxiliary prime permitted at some finite place by (1°)–(4°) is 23; conditions (1)–(3), with the good-reduction version of (3), permit 11. These minima are not asserted for an arbitrary number field.” Keep the general field-dependent inequalities and parameter-existence theorem unchanged. On K=ℚ(√5,ζ₁₁+ζ₁₁⁻¹), the repaired assertion makes neither false claim; §8.5 still chooses a larger permitted prime. The ℚ-only comparison in §6.6 already has the required scope.

2. **F02** (P2) The local-system contract drops the supplier’s category restriction

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:57`, “ℚₚ-local systems as continuous fundamental-group representations”; also line 360, “Y normal and connected, so ℚₚ-local systems are continuous representations”.

   **Claim:** The supplied equivalence applies to rational local systems without distinguishing the isogeny category; normality alone suffices in §1.3.

   **Witness:** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:792–807`: nodal-loop monodromy p has no stable lattice, since p·pᵃℤₚ=pᵃ⁺¹ℤₚ≠pᵃℤₚ. The rational-category equivalence explicitly requires normal Noetherian X.

   **Exact repair text:** Replace the first sentence of the contract by: “IG.0.3 supplies finite étale covers, finite free integral local systems and their isogeny category as continuous fundamental-group representations. Its comparison with all rational local systems assumes a normal Noetherian base.” Replace the justification at line 360 by: “For this abelian-by-finite family, use the compatible finite étale torsion systems of the abelian scheme and finite base to obtain a lisse integral lattice; its rationalisation is in IG.0.3’s isogeny category and therefore has a continuous fundamental-group representation.” Preserve the stated generality of the family construction, rather than adding Noetherianity merely to use an unnecessarily broad equivalence. Under this repair, the nodal monodromy-p line is excluded by its lack of a lattice, while the geometric cohomology systems used here remain included.

3. **F03** (P3) The section-pair definition lacks three discriminating Checks

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:402–407`, “For a rational point y the pair of κ(y) is the pair of the fibre at y”; “Conjugate sections give isomorphic pairs”.

   **Claim:** The four bullets supply the required Checks for the new section-pair definition.

   **Witness:** The second and third repeat the target/API at lines 386, 397 and 400. The last gives no instance. Only the constant-family bullet computes a value.

   **Exact repair text:** Keep the constant-family Check and replace the two restatements by these two Checks: “Let E/ℚ be y²=x³−x and use X=E×E→E→E, with first projection followed by [2], polarised on the second factor. At 0, the finite-base fibre E[2] consists of four rational points, so A_s=ℚₚ⁴ with trivial Galois action, dim A_s^{G_ℚ}=4, and V_s has dimension 8.” “At P=(0,0), the finite-base fibre consists of (i,±(1−i)) and (−i,±(1+i)). Complex conjugation exchanges the points in two pairs. Thus A_s is still four-dimensional but dim A_s^{G_ℚ}=2. The pairs at 0 and P are not isomorphic: the section-pair construction cannot discard the action on H⁰.” The doubling formula x([2]Q)=(x(Q)²+1)²/(4x(Q)(x(Q)²−1)) gives x([2]Q)=0 at x(Q)=±i; the listed y-coordinates square to x³−x. These two tests distinguish equal ranks with different Galois algebras, including p=2.

4. **F04** (P1) The modified-adele supplier does not state the required general construction

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:65`, “Section 3.17d supplies the modified adelic carrier and its projection”; also §0.4, line 237.

   **Claim:** HeightsRationalPointsAndObstructions §3.17d provides the modified adelic quotient and projection for every smooth projective geometrically connected variety.

   **Witness:** `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:1824–1828` states a multiplication-cover theorem for A-torsors only. A genus-two curve is not an A-torsor. No general modified-adele construction appears elsewhere in that supplier.

   **Exact repair text:** Replace the assertion of existing supply by: “What HeightsRationalPointsAndObstructions must provide (gap:modified-adelic-varieties): For every smooth projective geometrically connected variety X over a number field K, construct the functorial quotient X(A_K)_•=∏_{v finite}X(K_v)×∏_{v infinite}π₀(X(K_v)) and the surjective projection from ordinary adeles, with finite étale torsor evaluation factoring through this projection.” Add the same slug, supplier `HeightsRationalPointsAndObstructions`, section `3.17d`, and needs sentence to the plan’s gaps; point §0.4 to this contract. The earlier section’s multiplication-cover theorem stays with its owner. The contract covers genus two as well as A-torsors; for an elliptic curve with two real components its real quotient has cardinality 2, whereas P¹ has real quotient cardinality 1. This is a missing extension contract, not an objection to consuming a declared gap.

5. **F05** (P3) Further Checks restate definitions instead of distinguishing inputs

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:953–958` (§6.2); also lines 467, 791, 1018 and 1469.

   **Claim:** The local-locus definition has the required discriminating Checks; the listed projection, factorisation and self-conjugacy bullets test their preceding targets.

   **Witness:** §6.2 has one computed family. Its rational-point and adelic-inclusion bullets repeat its API; forgetting the pairing gives no separating instance. At line 467 the projection Check is exactly the definition.

   **Exact repair text:** Retain §6.2’s constant-family Check and add: “For Y: x²+y²+z²=0 over ℚ at v=2, Y(ℚ₂)=∅, hence the locus has cardinality 0. A primitive integral solution would give 1, 2 or 3 modulo 4 as the sum of its odd-coordinate squares.” “For the family consisting of two copies of a constant elliptic curve over Y, each fibre algebra is ℚₚ×ℚₚ, with four idempotents. A quadratic field A/ℚₚ has the same dimension 2 but only two idempotents, and cannot interpolate that fibre, regardless of its module.” Delete §6.2’s two API-repetition bullets; keep the pairing observation as explanatory prose unless supplied with a separating example. Delete or move to explanatory prose the projection equivalence at line 467, diagram reformulation at line 791, descriptive sentence at line 1018, and definition of covered places at line 1469. Their mathematical content already occurs in the targets. The new computations distinguish full, empty and structurally impossible interpolation, without adding Lean padding.

6. **F06** (P3) The fibre-pair definition also lacks three discriminating Checks

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:346–352`, “#Σ = deg(Y′ → Y) for every y”; “Σ = Y′_y(F̄) is the G_F-set whose orbits are the closed points”.

   **Claim:** These five bullets test the new fibre-pair construction at the required breadth.

   **Witness:** Both concrete positive bullets have Y′=Y and rank-two H¹. The cardinality/orbit bullets repeat the displayed algebra description; the nonisomorphic-fibres bullet names no fibres. No split-versus-nonsplit finite-base instance is computed.

   **Exact repair text:** Keep the one-elliptic-fibre Check. Add: “For X=E⊔E over Y′=Spec(F×F), with E/F elliptic, H⁰=ℚₚ² with trivial G_F-action, dim H¹=4, and Σ consists of two fixed points.” Add: “For a quadratic field L/F and X=E_L over Y′=Spec L, viewed over F, H⁰ is still ℚₚ² but G_F permutes its two primitive idempotents transitively; dim H¹=4, dim(H⁰)^{G_F}=1, and H¹=Ind_{G_L}^{G_F}H¹(E_L).” These have the same underlying ranks but invariant dimensions 2 and 1, respectively. Include both ramified and unramified L/F; the computation concerns the full Galois group and is unchanged at p=2. The general algebra description and orbit fact can remain API statements rather than Checks.

## Verified sound

Coverage: all 1,539 README lines and all 32 Suggested.lean lines read; **59 numbered targets**, **186 Check bullets** (including the five convention Checks) reviewed. There are no separately bold-named theorem targets in this README. The calculations below record the instances used, including tests of the definitions, APIs and proof routes. Restatements are distinguished from discriminating tests in R03/R05/R06. Source checking covered the **59 target-level citation blocks in four cached works**; a block can contain several locators. Locator numbers and printed pages were compared with the cached versions, rather than inferred from bibliography titles. Source mistakes are recorded separately below.

The acceptance file has **0 declarations, 0 section variables, 0 instances, 0 admitted data definitions, and 0 padding declarations**. Its single import is Mathlib, and its namespace is correct. Thus the requested declaration/context table has no mathematical rows:

| Suggested.lean item | Section / variable / instance context | Computation or comparison | Result |
| --- | --- | --- | --- |
| Empty namespace, lines 30–32 | No variables or instances | Number of theorem/def/instance/opaque declarations = 0; number requiring signature checks = 0 | No lost binder or duplicate fully qualified name is possible |
| Headline inventory, lines 11–24 | Fourteen groups of headlines | Fourteen groups name missing geometric/period carriers; none is replaced by a free predicate or stand-in | No padding finding |

The headline inventory covers Harari–Stix; section interpolation; full faithfulness; automorphism bounds; conjugate-place and averaged weights; horizontal transport; period control; the trichotomy; both non-density/finiteness branches; Kodaira–Parshin exclusion/existence; self-conjugate LV finiteness; self-conjugate Selmer finiteness; and Theorems A/B. Mordell is explicitly assigned to MordellLawrenceVenkatesh LV.11. Searches at the pins did not find the arithmetic étale fundamental-group, Selmer-section, filtered discrete-module, relative period-map or Kodaira–Parshin carriers needed for these headlines. A small definition on an absolute Galois group or a vector space would not supply those carriers. No statable omitted headline was identified.

The mechanical dependency check returned:

```text
depcheck: 56 roadmaps, 653 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The diff against origin/main changes eight files, all inside `packages/GaloisSectionsPadicPeriodMaps/`. No Lean build or elaboration was run. With no declarations, the requested elaborated-signature comparison is empty. No package file was edited.

The seven declared gap slugs match between `design/plan.json` and the README. Their suppliers are named and earlier; the absent deliverables are not reported as defects. The model-free and horizontal contracts retain all finite extensions of ℚₚ and p=2,3; the four-Lagrangian contract retains arbitrary fields; the finiteness contract retains a root-degree bound rather than falsely requiring rational coefficient factors. R04 concerns a different prerequisite, not one of those seven gaps.

### Computed adversarial table

Here F is a finite extension of ℚₚ unless stated otherwise. “Pass” means the displayed instance agrees with the statement, not that a finite test proves the theorem. Equal characteristic, zero coefficient rings, inseparable local-field extensions and non-quasi-separated bases do not satisfy the relevant field/smooth-variety hypotheses; they are not silently substituted into these targets. Zero modules and nonreduced coefficient algebras are tested where actually admitted.

| Statement and context | Instances tried | Values computed on the two sides / excluded wrong model | Result; change |
| --- | --- | --- | --- |
| Conventions: weights, line 19 | 1⊕ℚₚ(−1), including p=2 | Jumps 0,1; sum 1, average 1/2; Frobenius 1,q has weights 0,2, not pure weight 1 | Pass |
| Conventions: Nφ=pφN, line 23 | φ(e)=e, φ(f)=pf; N(f)=e | Nφ(f)=pe=pφN(f); reversed relation gives e versus p²e | Pass |
| Conventions: inverse transport | T=[[1,0],[1,1]], Hodge line e₁ | T⁻¹e₁=(1,−1); Te₁=(1,1); distinct over ℚ₂ as well | Pass |
| Conventions: induction | Subgroup index 2, unit object | dim Ind(1)=2; dim(Ind(1)⊗Ind(1))=4 versus dim Ind(1⊗1)=2 | Lax, not strong, monoidal; pass |
| Conventions: reciprocity | F=ℚ₃, u=4 | χ_cyc(Art(u))=1/4 versus inverse character 4; Tate φ=p⁻¹ and jump −1 | Pass |
| §0.1 restriction, line 159; continuous sections modulo geometric conjugacy | Spec K; complex place; inversion semidirect-product quotient | Spec has one splitting before/after restriction; G_ℂ=1 gives one; for cocycle 2, conjugation by −2 changes it to 2+2(−2)=−2 | Class, not raw section, is independent; pass |
| §0.2 local injectivity, line 187; subabelian variety over F | E with full 2-torsion; p=2; real identity component | Four points give four distinct p-adic classes; any finite quotient exponent n kills the image of an all-n-divisible point; two real points in E(ℝ)⁰ have one class | Pass; real-field exclusion necessary |
| §0.3 Selmer/localisation, line 204 | Spec K; E[2]; a real place with no points | Cardinalities 1, four distinct finite localisations, and 0 respectively; all-place intersection is empty if one local image is empty | Pass |
| §0.4 finite descent, line 235; proper smooth X | P¹; Spec K; real E with two components | Finite-descent set = full modified product on P¹; singleton on Spec; real quotient has 2 elements, not all real points | Mathematics passes; supplier range R04 |
| §0.5 Harari–Stix, line 263; separated finite type, all places | Spec K; G_m and diagonal 1; empty local factor | Both sides have one element for Spec; at 1, survival=true and point-section compatibility=true; empty local tuple set=0 on both sides | Pass in both directions; no properness needed in (a) |
| §1.1 symplectic modules/pairs, line 291; finite locally free modules, rank-one line | Zero module; rank-two zero pairing; split/non-split/nonreduced A | 0→Hom(0,L) is an isomorphism; zero pairing on F² has radical dimension 2; Hom(F×F,F) has 2 points, Hom(F₂,F)=0 for a quadratic field F₂, Hom(F[ε]/ε²,F)=1 | Pass; #Σ cannot be dim A |
| §1.2 fibre pair, line 328 | Elliptic fibre; two split fibres; elliptic curve over quadratic L viewed over F | (dim A,dim V)=(1,2),(2,4),(2,4); finite Galois sets are respectively one point, two fixed points, two points exchanged | Mathematics passes; latter is not Weil restriction of the variety; missing Checks R06 |
| §1.3 relative pair, line 356; normal connected characteristic-zero base | Single elliptic fibre; Legendre family; nodal rational local system from supplier | Exterior ranks 1,2,1; Legendre H⁰ rank 1 and H¹ rank 2 with nontrivial geometric monodromy; nodal monodromy p sends lattice pᵃℤₚ to pᵃ⁺¹ℤₚ | Family construction passes; category inference R02 |
| §1.4 section pair, line 384 | Constant elliptic family; multiplication-by-two family at 0 and (0,0) | Constant ranks (1,2) for every section; new test has dim A=4 at both points but dim A^G=4 versus 2, and dim V=8 at both | R03 supplies distinguishing Checks |
| §1.5 local restriction, line 411; system with specified π₁ representation | Unit system; finite double cover; conjugate path | Unit restriction and fibre both rank 1/trivial; double cover gives either two fixed points or one orbit of size 2 on both sides; conjugation changes matrices by PρP⁻¹ | Pass; isomorphism is path-dependent |
| §1.6 interpolation, line 428 | Rational point in constant elliptic family | Restricted section pair and local fibre both (ℚₚ,H¹(E)), dimensions (1,2), same pairing to ℚₚ(−1) | Pass |
| §1.7 adelic locus, line 444; one global pair before all places | Constant family; empty adelic product; full-monodromy KP at self-conjugate place | Constant family gives whole product; empty product of local point sets gives 0 points; KP projection finite whereas a nonempty smooth local curve has infinitely many points | Pass; projection restatement R05 |
| §1.8 Selmer inclusion, line 472 | Rational section; empty Selmer set | At rational y both interpolants are H≤1(X_y); empty image has cardinality 0 and is contained in every locus | Pass; proof also works in genus 1 when localisations exist |
| §2.1 filtered discrete modules, line 499; algebraic ℚₚⁿʳ, discrete descent | Unit, Tate, zero, degree-two induction | Hom(1,1)=ℚₚ on both sides; Hom(1,ℚₚ(1))=0 since a nonzero solution would require v(λ)=v(pλ); Hom(0,0)=0; induced ranks 2 versus tensor rank 4 | Pass; no completed-unramified substitute |
| §2.2 automorphisms/retwists, line 537 | Rank 0; ordinary elliptic module; diag(2,3) | Aut(0)=1 but multiplier-retaining GSp(0)=G_m; ordinary distinct-slope End=ℚₚ×ℚₚ, Aut=G_m²; multiplier of diag(2,3) is 6 | Pass |
| §2.3 orbit criterion, line 570 | F=ℚₚ, ordinary rank-two module and P¹ flags | Diagonal torus has three rational orbits: e-line, f-line, and all lines with both coordinates nonzero; each orbit yields one retwist class, different eigenlines have different filtration positions | Pass |
| §2.4 dimension bounds, line 586 | d=0; ordinary two-space; symplectic rank 2 | dim Aut=0≤0; ordinary Aut dimension 2≤4; dim GSp₂=4=1(2·1+1)+1; rank-zero GSp dimension 1=bound 1 | Pass; Frobenius is essential in the proof |
| §3.1 conjugate places, line 613 | ℚ; ℚ(i) at 3,5,2; odd-degree field | All places over ℚ self-conjugate; over ℚ(i), 3 fixed, two places at 5 exchanged, 2 fixed but ramified/not friendly; a degree-3 field has no even-degree CM subfield | Pass |
| §3.2 pure characters, line 645 | ℚₚ(−1); finite character; self-conjugate odd weight | Jumps 1+1=2=weight; 0+0=0; odd n would require integer jump n/2, impossible | Pass; purity excludes unit⊕Tate mixture |
| §3.3 finite-order twist, line 662 | ℚₚ(−1) and a quadratic finite twist | χ·χ_cyc=1 or the quadratic character; powers 1 and 2 respectively kill the finite factor | Pass; norm descent used, not isolation of one factor of a product |
| §3.4 average identity, line 678 | Elliptic H¹; degree-two L/K; zero representation | Sum of jumps 1=1·1·2/2; degree-two weighted sum 2=1·2·2/2; zero sum 0=0, with no division by rank | Pass |
| §4.1 spherical polyannulus, line 707; de Rham pair with horizontal basis | Dimension 0; constant Tate pair; z²=t over ℚ₃ | Dimension-zero maps are identities; Tate jump/φ remain −1,p⁻¹; cover fibre at t=1 splits into 2 fixed points, at t=2 is one quadratic orbit, so it cannot satisfy the horizontal-basis comparison hypothesis | Pass conditional on declared horizontal contract |
| §4.2 disc reduction, line 729 | Residues 0,1 over 𝔽₂; unramified degrees 2,3 | Available third residues: 0 over 𝔽₂, at least 2 over 𝔽₄, at least 6 over 𝔽₈; 2Ẑ+3Ẑ=Ẑ | Pass at smallest residue field |
| §4.3 horizontal transport, line 745 | Constant pair; x=y=z | T_xy=T_yz=T_xz=id, so T_yzT_xy=id=T_xz and centre comparison=id | Pass; arbitrary horizontal basis is normalised at centre |
| §4.4 smooth proper period control, line 761 | Constant elliptic family in degrees 0,1,3 | Cohomology dimensions 1,2,0 at both fibres; D_pst transport is identity, while changing a Hodge flag is not an equality of filtered objects | Pass |
| §4.5 period control of representations, line 778 | Centre; T=[[1,0],[1,1]] | Centre flag unchanged; transported flag is (1:−1), not (1:1); retwist retains the same unfiltered module but changes F¹ | Pass; diagram-only Check R05 |
| §5.1 Hodge-cohomology pair, line 805 | Elliptic; split double fibre; quadratic fibre | Ranks (1,2),(2,4),(2,4); de Rham H⁰ has 4 idempotents in split case versus 2 for a quadratic field; target Tate jump is 1 | Pass |
| §5.2 symplectic retwist, line 831 | Elliptic line; nonisotropic half-dimensional plane in rank 4 | Every line in alternating rank 2 has self-pairing 0; span(e₁,f₁) has ω(e₁,f₁)=1 but F² of target=0 | Pass; rank alone does not imply Lagrangian |
| §5.3 symplectic period diagram, line 859 | Constant elliptic pair; centre | Both comparison routes yield ranks (1,2), F¹ dimension 1, and the same alternating pairing; period image is a single point | Pass; inverse D_pH only on essential image |
| §5.4 closed-point decomposition, line 875 | Fibre with residue degrees 1 and 2, d=1 | dim domain=1+2=3; dim H⁰=3, dim H¹=2+4=6; induced rank sums agree | Pass; separability required for product splitting |
| §6.1 S-goodness, line 901 | Unit⊕Tate; Tate twist of H¹; dual-number algebra; nonrational factor | Unit⊕Tate has weights 0,2, not 1; H¹(1) has jumps −1,0; A=ℚₚ[ε]/ε² with V=0 has allowed algebra but is not Artin-split; factors of X²−2 have nonrational coefficients although roots are integral | Pass; degree-bound correction retained |
| §6.2 local locus, line 935 | Constant family; empty conic over ℚ₂; split versus quadratic-field algebra | Full Y(F); empty set of cardinality 0; same dimension 2 but idempotent counts 4 versus 2 forbid interpolation | Mathematics passes; R05 adds missing Checks |
| §6.3 period-locus criterion, line 962 | Constant d=1 family; P¹(F); A¹ sequence p⁻ⁿ | Constant image has dimension 0<dim P¹=1; P¹ covered by 2 compact discs; norms pⁿ in A¹ are unbounded and each compact disc meets only finitely many | Pass; projectivity used |
| §6.4 S-goodness of interpolants, line 990 | Constant elliptic global fibre | Outside S, degree-2 polynomial is integral and pure weight 1; p-adic jumps are 0,1; restricted pair equals the prescribed fibre pair | Pass |
| §6.5 rational-point inclusion, line 1006 | Rational fibre; empty point set | Same global fibre is an interpolant at every place; empty image has cardinality 0 | Pass; descriptive Check R05 |
| §6.6 non-symplectic locus, line 1022 | Rank 2; two distinct absolutely irreducible rank-two summands; g=3 | Rank 2 multiplier=det; scaling only second pairing by nonsquare c would require a₂²/a₁²=c, impossible equivariantly; d₁₁=25,d₂₃=55 | Pass; forgetting the action would allow rescaling |
| §6.7 fibre algebra/points, line 1048 | Four split points; degree-four ramified point | Four orbits of size 1 versus one orbit of size 4; totally ramified degree 4 still gives index 4 despite residue degree 1 | Pass; whole local group used |
| §6.8 trichotomy, line 1064 | Σ empty; one orbit of size 1; isotropic rank m=1 | Empty case gives 0≥0; one small point gives 1≥1/(d+1); m=1 weighted inequality forces small fraction≥1/2 | Pass with #Σ; replacing it by dim A fails for a nonsplit field |
| §6.9 types/loci, line 1081 | Singleton; transitive quintic; A=0,d=1; ordinary versus split-CM line | Singleton: (a),(b) false and (c) true; quintic: 0≥5/2 false for d=1; zero algebra: 0≥0 true; local line jumps 0 versus 1 distinguish (b) | Pass; b need not globally extend |
| §7.1 T_i, line 1125 | δ=1; non-CM elliptic H¹; unit⊕Tate | Root-degree bound B=2d; elliptic rank 2 has B=2 and pure weight 1; unit⊕Tate is rejected by purity despite jumps 0,1 | Pass; symplectic isomorphism class retained |
| §7.2 finiteness of T_i, line 1157 | Fixed B; unipotent extensions over imaginary quadratic K | Fixed-degree algebraic integers of fixed Weil size give finitely many roots; extensions with matrices [[1,λ(g)],[0,1]] all have stable isotropic line e₁ and are excluded | Pass; GSp irreducibility is not GL irreducibility |
| §7.3 type-(a) orbit dimension, line 1173 | (d,r)=(1,4),(1,3),(2,4) | 3<4; 3=3; 10<12 respectively | Pass; degree≥4 needed for this estimate |
| §7.4 type-(a) period locus, line 1191 | Elliptic variety over quartic closed fibre; all residue degrees 1 | Quartic case ranks (4,8), domain dimension 4; all degree-one case has no index≥4 factor and type-(a) locus empty | Pass |
| §7.5 type-(a) finiteness, line 1217 | Curve disc and proper exceptional image; constant family | Nonzero analytic equation has finitely many zeros on closed disc; constant map has image dimension 0 and fails full-monodromy density | Pass conditional on period contract |
| §7.6 type-(b) exceptional locus, line 1233 | Four lines e,f,e+f,e+2f; all four equal e | Distinct lines have common intersection 0, so no one-dimensional W meets every line in dimension≥1/2; equal lines permit W=e with intersections 1 | Pass over characteristic zero including ℚ₂; algebraic-closure proof handles arbitrary fields in supplier gap |
| §7.7 type-(b) period locus, line 1251 | Split-CM E:y²=x³−x over ℚ₅; quartic fibre; index 1 | #E(𝔽₅)=8, trace −2; one split-CM local line has jump 1 and is isotropic; quartic index 4 qualifies, index 1 fails | Pass; one common subobject is required |
| §7.8 type-(b) finiteness, line 1275 | Closed disc; proper global curve | Finitely many zeros per closed disc; finite compact subcover gives finite sum of finite cardinalities | Pass; affine unbounded sequence from §6.3 excluded |
| §8.1 small-orbit proportion, line 1301 | Trivial, quintic, 3+4, unequal fibres, S₃, empty Σ | Values 1,0,3/7; unequal-fibre example 1/2>1/5; regular S₃ 0, S₃/C₂ 1; empty ratio undefined whereas cardinal inequality 0≥0 true | Pass; nonempty/equal-fibre hypotheses necessary |
| §8.2 local extensions, line 1330 | ℚ₅, ℚ₇, ℚ₂; local degree 1 | Counts 3+4=7,3+4=7,7+4=11; cubic normality changes at 5 versus 7; uniform bound 2³+6³=224 | Pass; embedded, not isomorphism-class, count |
| §8.3 small-orbit torsion, line 1355 | g=2,k=5,q_v=7; k=1; inverse Frobenius | gcd(5,6·48·342)=1; bound 7·25=175<625; k=1 gives 1≤n_v; 5⁻¹ mod 41=33 since 5·33=165≡1 | Pass; μ_k∨ has inverse action |
| §8.4 exclude type (c), line 1371 | q_v=5,g=2,q=83,k=41,n_v=7 | Forbidden odd primes 5,3,31 do not divide 82; bound (9/8)·7/41²=63/13448<1/124 since 7812<13448; d=123 | Pass; strict inequality excludes equality case |
| §8.5 parameter existence, line 1388 | F=ℚ₂; q=11 versus q=107 | q=11 passes divisors 4,3,7 but 10<99; q=107 passes and 106≥99 | Pass at p=2; auxiliary q depends on v |
| §8.6 coverage/minima, line 1404 | g=3 over ℚ; totally real K=ℚ(√5,ζ₁₁+ζ₁₁⁻¹) | Over ℚ, d₁₁=25,d₂₃=55 and 16ζ(6)/1000≈0.01628<1/26; over K, q_v²≡1 mod 5 or 11 away from corresponding residue characteristic, so both proposed primes are forbidden | R01 |
| §9.1 LV finiteness, line 1428 | Type-(a)/(b)/(c) cardinalities a,b,0; varying S | Union size≤a+b+0<∞ for each fixed S; q chosen before S, bound on a+b may depend on S | Pass; no uniform-in-S bound claimed |
| §9.2 Mordell consequence, line 1445 | Empty local curve; genus-one positive rank | Empty gives #Y(K)=0; positive-rank elliptic has infinitely many points but violates genus≥2 | Pass; owned theorem only |
| §9.3 self-conjugate Selmer finiteness, line 1457 | ℚ(i), places 3,5,2 | 3 fixed,5 exchanged,2 fixed; theorem covers 3 and2, not5 | Pass; definition-only Check R05 |
| §9.4 Theorem A, line 1473 | ℚ at2; totally real ramified place; section-conjecture hypothesis | All places self-conjugate; image finite even at2; under conjecture image=Y(K), already finite | Pass; no conjecture used in proof |
| §9.5 Theorem B, line 1490 | Empty finite-descent locus; HS equality; Stoll hypothesis | Empty projection and Selmer image both cardinality 0; in general HS identifies the two images; under Stoll the image is that of finite Y(K) | Pass conditional on R04’s supplied carrier |
| §9.6 obstruction comparison, line 1506 | v above2 versus old conditions; density1 versus every place | Old condition v∤2 is false, new q=107 at ℚ₂ works; density1 permits exceptional places whereas Theorem A quantifies over all | Pass |

### Supplier and ownership audit

The **22 named roadmap supplier contracts** were compared with their current sections, using main for existing roadmaps and open heads for new roadmap folders. The table records the mathematical range, not just existence of a heading. R02 and R04 are range mismatches found by that comparison. Searches also covered the board’s packages, main/Completed, the open-roadmap search service and **all 47 supplied sibling folders at their supplied heads**. The targeted matches in the supplied siblings concerned symplectic groups and semistable-chart period comparisons, not this roadmap’s section obstruction or filtered-discrete transport construction. No second owner of those new constructions was found. Generic families, Grassmannians, full monodromy and Mordell remain imported. Suggested.lean contains no names that could duplicate another roadmap’s declarations.

| Supplier | Resolved sections/objects and boundary checked |
| --- | --- |
| AnabelianGeometryAndNonabelianChabauty | §7.1/NC.6: section classes, Kummer map and field-general divisibility criterion; the number-field corollary alone would not suffice for F/ℚₚ |
| InverseGaloisAndArithmeticFundamentalGroups | IG.0.3 integral/isogeny/rational categories and IG.1.3 characteristic-zero geometric base change; **R02** |
| ArithmeticGaloisRepresentations | §1.3 has both Shapiro and Mackey, with H open and D closed in compact Γ; §2.1 has closure-compatible local embeddings and restriction, including the real-place reference. §1.12 is semisimplicity rather than the owner of Mackey, but the combined citation includes §1.3 |
| HeightsRationalPointsAndObstructions | §§2.3–2.4, 2.3a, 2.11, 2.11a: actual adelic topology, proper compactness and étale charts; §§3.1–3.5 torsor descent; §3.17d only A-torsors: **R04** |
| PadicHodgeTheory | §§3.3–3.5 finite-level filtered monodromy/descent; §§5.1,5.3 potential semistability and algebraic-unramified periods; §§7.2–7.3 integral systems and de Rham pairs; §§8.1–8.2 comparison. Reported Hodge–Tate weight +1 on ℚₚ(1) is negated here |
| CohomologyComparisons | §§6.4–6.7 cup, trace, cycle and first-Chern compatibility; the line-bundle proof uses proper projective compactification |
| MordellLawrenceVenkatesh | §§0.4–0.5 finite centralisers/unit groups, 0.9–0.12 affine-group and isotropic counts, 0.18 orbit dimension; §§1.4–1.16 CM/weights; §§2–4 family/period machinery in its original model range; LV.7, LV.8, LV.10, LV.11. Model-free and symplectic extensions remain explicit gaps |
| AbelianSchemesAndArithmeticModuli | A3.5/A3.7: Cartier/Weil pairings, including even torsion; A4.3/A4.4: H¹ and exterior cohomology; A6.30/A6.31: Weil restriction and separable splitting. For a quadratic extension, restriction of a line has dimension 2; inseparable extensions do not split into two geometric factors |
| AlgebraicModuliForArithmeticGeometry | §1.3 partial flags with locally free quotients; Gr₁(F²)=P¹ and empty flag=base |
| AdicEtaleGeometry | A1.1 strong sheafiness; A1.3 finite-etale-local-to-global (c): finite étale spaces over Spa(A,A⁺) correspond to FÉt(A)^op |
| AdicSpacesPartII | R1 rigid/adic analytification; the affinoid discs/polyannuli have the required analytic carriers |
| ComplexComparisonPartII | C5.2 Gauss–Manin; C6.0 finite CW type for separated finite type, including singular/nonreduced; C6.2 finite-cover Riemann existence |
| EtaleDualityAndPerverseSheaves | §0.3 curveH1Duality and §0.5 cup/trace equivariance; n invertible in characteristic-zero geometric field, with inverse Tate target μ_n∨ |
| ArithmeticGaloisDuality | R02.3.1 Hermite paragraph: finitely many embedded extensions of bounded degree unramified outside fixed finite S |
| WeightsInEtaleCohomology | R34.1 rational-factor restriction on integer polynomials; R34.2 abelian good-reduction weight 1 |
| ClassFieldTheory | Layers 5,7,11: Kummer including n=p in characteristic zero, arithmetic reciprocity, norm compatibility and global characters |
| GlobalNumberFields | Layers 2,7,8: finite ray classes and componentwise norm product; quadratic local norm on a scalar u is u², not u |
| LocalFieldsRamification | Layers 0–2,4: finite/unramified extensions, primary power-class formula, eight dyadic square classes, tame στσ⁻¹=τ^q |
| LocalGaloisGroups | Layer 7 gives generation of the full group, with [F:ℚₚ]+2 generators, rather than only the maximal pro-p quotient |
| ReductiveGroups | Layers 0,3: group functors, closed subgroups, fppf quotients; orbit dimension is imported separately from LV §0.18 |
| Chebotarev | Layer 10 is Dirichlet density; Layers 13–14 supply prime counts and natural density. The density-one comparison cannot be justified by Layer 10 alone; the exact contract includes 13–14 |
| AnalyticNumberTheoryPartI | §0.32 has logarithmic-modulus Siegel–Walfisz; it does not assert Linnik. The stronger least-prime result is correctly declared as a separate gap |

The **15 explicitly named pinned declarations** in the library contracts were located. Native definitions were read rather than inferred from their names:

| Pin evidence | Definition/context and computed boundary |
| --- | --- |
| `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42,59,87` | Algebraic-closure automorphisms with Krull topology; mapOfAlgebra uses an explicit scalar tower, whereas map chooses a lift. For K algebraically closed the group has one element. No arithmetic étale fundamental group is constructed here |
| `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57` | Extends a monoid homomorphism and continuous map; continuity is present, compactness is not |
| `Mathlib/Topology/Connected/Clopen.lean:510` | Quotient by equality of connected components, with no finiteness/separation assumption. Empty space gives 0 classes, connected nonempty space 1 |
| `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:603` | Wraps the valuation completion of the fraction field; does not supply chosen embeddings of algebraic closures |
| `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286,595` | IsAlt means B(x,x)=0; Nondegenerate means separation on both sides. Zero form on a nonzero vector space fails; zero-space pairing passes. Over ℤ, 2xy is nondegenerate but not perfect, so the finite-dimensional field restriction matters |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:101` | Exact equation AJAᵀ=J; diag(2,3) instead scales J by 6. It is not a similitude carrier |
| `Mathlib/NumberTheory/NumberField/CMField.lean:69,236` | CM is totally complex quadratic over maximal real subfield; the integer-ring conjugation is induced by the field conjugation. For ℚ(i), i maps to −i |
| `Mathlib/FieldTheory/IntermediateField/Basic.lean:52` | A subalgebra closed under inverses; it carries neither a degree bound nor local-field topology automatically |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:49` | Orbit is the range of the action map. Regular S₃ orbit has cardinality 6; no intrinsic finiteness axiom is built in |
| `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442` | Unit residue class and arbitrary lower bound precede prime existence. Class 0 modulo 3 is not a unit and has no primes above 3 |
| `Mathlib/NumberTheory/ZetaValues.lean:457` | Real HasSum over ℕ, with term n=0 equal to 0; sum π⁴/90. Removing that term does not change the value |
| `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:122` | Exact constant-form group scheme, not multiplier-retaining GSp. Rank zero gives the trivial exact-isometry group, while this roadmap’s GSp retains G_m |

### Declared-gap instance record

| Contract | Computed boundary test | Assessment |
| --- | --- | --- |
| horizontal-pst-specialisation | Dimension-zero polyannulus gives identity specialisation; on ℚ₂(1), φ=1/2 and jump=−1 at both ends | Precise required horizontal comparison, not the completed-unramified ring |
| model-free-polarised-fibres | Elliptic H¹ rank 2, Hodge line rank 1; symplectic basis pairing 1; at p=2 the rational scalar 1/2 exists | Rational model-free extension of the good-model input |
| model-free-period-maps | Constant family has image dimension 0; rank-two flag variety dimension 1; T⁻¹e₁=(1,−1) | Full-monodromy condition distinguishes dense from constant image |
| symplectic-faltings-finiteness | Rank 2 gives d=1; integral polynomial degree 2 implies eigenvalue degree≤2; a nonrational linear factor may still have degree 2 over ℚ | B is fixed before representations; extension is needed for coefficient fibres |
| four-isotropic-lagrangians | V=0: exceptional set empty, ambient point nonempty; rank 2 and four equal lines: intersection dimensions 1; four distinct lines: common intersection 0 | Arbitrary-field contract, not only the older five-factor result |
| kodaira-parshin-local-fibres | Nontrivial inertia excludes the trivial cover; an Aff(q) surjection has trivial centraliser, so conjugation-orbit size q(q−1) | Exact Galois-equivariant finite-base fibre, not abelian total-space points |
| linnik-polynomial-least-prime | Unit classes 1 mod2 and2 mod3 have least primes3 and2; nonunit0 mod3 has no primes beyond3 | Coprimality and constants independent of modulus retained |

## Not verifiable

- There is no completed geometric formalisation at the pins against which to test the nonstatable headlines. The empty Suggested.lean is consistent with that limitation; no Lean execution was attempted under the read-only/no-build instruction.
- The seven declared supplier extensions are contracts for future work. Their mathematical ranges and boundary instances were reviewed, but this pass does not certify future implementations or proofs.
- Ownership searches are by mathematical object across main, Completed, board packages, the available open-roadmap index and the 47 supplied sibling checkouts. They do not certify unpublished or inaccessible work. No additional open checkout was fetched.
- Source verification uses exactly the cached versions recorded in sources.toml, not an unseen published revision. All four cited works were available; no missing-source request is needed. No source correction is claimed to be published.

## Source issues

- **Gap** in bs at Proposition 2.16(1), printed page 12, bs lines 605–615: the source says G_v-conjugate relations give the trace to ℚₚ; it should be Frobenius-conjugate relations, since G_v fixes K_v,0; affects the proof.
- **Error** in bs at Proposition 2.16(2), printed page 12, bs line 623: the source says the similitude group is a closed subgroup of Aut(D); it should be a subgroup of Aut(D)×G_m, with the multiplier essential at rank zero; affects the proof.
- **Gap** in bs at Remark 2.20, printed page 14, bs lines 713–720: the source says finite order of a diagonally restricted product isolates one local character; it should be justified by finite-power norm descent, retaining all local factors; affects the proof.
- **Gap** in bs at Proposition 3.20(8), printed page 28, bs lines 1450–1453: the source says smooth-proper cycle comparison applies on a line bundle’s total space; it should be applied after proper compactification, or extended to that nonproper space first; affects the proof.
- **Misprint** in bs at proof of Lemma 4.7, printed page 36, bs line 1839: the source says logarithmic differentials are exact; it should be closed, since dt/t on G_m is not algebraically exact; affects the proof.
- **Misprint** in bs at proof of Lemma 4.7, printed page 36, bs line 1842: the source says dlog has domain O_X; it should be O_X×; affects the proof.
- **Error** in bs at proof of Proposition 5.3, printed page 41, bs lines 2098–2104 and 2122: the source says columns of forward transport T define the pulled-back filtration; it should be columns of T⁻¹, consistent with the intrinsic definition in Remark 5.7; affects the proof.
- **Error** in bs at Remark 5.11, printed page 43, bs lines 2222–2225: the source says compactness gives a finite disc cover of the smooth curve’s local points; it should be restricted to proper curves or a specified compact subset; affects a stated result.
- **Error** in bs at Proposition 6.7(c) and its reduction, printed pages 46–47, bs lines 2364–2375: the source says the small-orbit count is bounded below by dim(A)/(d+1) for every finite algebra A; it should be #Hom(A,ℚₚ)/(d+1), unless A is split; affects a stated result.
- **Gap** in bs at proof of Proposition 6.9, printed page 49, bs lines 2536–2538: the source says the coefficient fibre meets the integer-polynomial condition in Definition 6.11; it should be supplied with rationality, or finiteness should use bounded-degree algebraic-integer eigenvalues; affects the proof.
- **Misprint** in bs at definition preceding Proposition 6.15 and its proof, printed pages 49 and 51, bs lines 2545 and 2656: the source says M¹(Φ) is isomorphic to a symplectic pair; it should be M≤¹(Φ); affects a stated result.
- **Misprint** in bs at Remark 6.23(I), printed page 54, bs line 2780: the source says the product ranges over odd prime factors of q; it should be odd prime factors of q−1; affects the proof.
- **Gap** in bs at Remark 6.23(I), printed page 54, bs lines 2783–2786: the source says the bound on odd divisors of the closure’s degree ensures cyclotomic disjointness; it should also exclude the closure’s ramified primes, or otherwise prove disjointness; affects the proof.
- **Error** in bs at Remark 6.23(III), printed page 54, bs lines 2801–2805: the source says genus three alone gives least admissible auxiliary primes 23 and 11; it should specify a field with the required residue classes, for example ℚ; affects a stated result.
- **Misprint** in stoll at proof of Lemma 5.8(1), printed page 20, stoll lines 766–768: the source says every torsor is trivial when the geometric fundamental group is trivial; it should say every torsor is geometrically trivial and its constant twist admits a lift; affects the proof.
- **Misprint** in stix08 at Remark 46, printed page 22, stix08 line 1113: the source says the applicable injectivity result is Theorem B; it should refer to Theorem 45; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "73538ceaadfb92da361b97e7cf8e9d2e8e319074", "job": "RT-GaloisSectionsPadicPeriodMaps~1a", "model": "gpt-6-astra", "worker": "chris-31"} -->
