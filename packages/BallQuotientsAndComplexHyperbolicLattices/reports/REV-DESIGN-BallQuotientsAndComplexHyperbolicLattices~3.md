# Review of BallQuotientsAndComplexHyperbolicLattices (design, round 3)

**Verdict:** needs changes

Four findings, three blocking: one false assertion in the repaired cusp argument, two ownership conflicts, and one group of residual README/plan inconsistencies. The scope is repairable. I changed neither the README nor the plan nor the sources manifest. This is a design, with no `Suggested.lean`.

## Previous findings, checked first

Locations below refer to `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md`, unless a different file is named. The repair report marked no finding “not actionable in this package”.

| Round-2 finding | Repaired passage and check | Status |
| --- | --- | --- |
| R01, full Shimura domain | §11.3: “the connected component X⁺ of X containing h₀”; §11.4 uses “acting on X⁺ ≅ B”. For SL₂ the adjoint real group has determinant-sign quotient of order 2; the domain has two components, each a disc. For n≥2 inertia (1,n) differs from (n,1). | Repaired, including §§11.4–11.5 and their plan statements. |
| R02, cyclic target graph | §1.2: “The Cartan decomposition, connectedness and unimodularity of G … are proved in §1.4.” §1.6 sends its metric comparison to §2.2; §3.4 now assumes an interior fixed point directly. Parsed all 57 targets: no missing or forward `target:` edge, and all 57 are topologically removable. | Mathematical/build-order repair complete; one residual plan locator remains in current R04. |
| R03, false Checks | §2.1: “g = [[cosh t, sinh t],[sinh t, cosh t]]”; §6.2: “The commutator subgroup [F, F]”. The first sends 0 to −1/2, while h_t sends it to i/2. The second has quotient ℤ² and infinite rank, whereas {1} has zero generators. | Repaired in both files. |
| R04, Jordan input | §4.4: “The passage from U to displacement is a covering argument”. Words of length ≤m meet ≤m cosets; if all m inclusions from C₀ were strict there would be ≥m+1 cosets. Equality at one stage is invariant under left multiplication by the symmetric generating set. | Repaired by the proposed alternative; no Jordan theorem is needed. |
| R05, projective atlas | §1.3: “restriction to B of the inverse of the standard affine chart of index 0”. Both recorded pins match `lake-manifest.json`. The native chart sends [1:1/2] to 1/2, its inverse sends 1/2 to [1:1/2]. | Native ownership repaired; an old plan API sentence still reverses this map, current R04. |
| R06, SNC names | Supplier contract: “§9.5 (its consumption of ResolutionOfSingularitiesCharacteristicZero §6.2”. The three obsolete SNC declaration names are gone. At #853, §9.5 retains the dense open, smooth projective compactification and labelled strict-SNC boundary. | Repaired. |
| R07, zero pluricanonical power | §§8.4 and 9.2: “for every integer ℓ ≥ 1”. For ℓ=0 the constant has integral π on Γ(2)/±1 and nonzero cusp value; for ℓ=1 the constant coefficient gives ∫dr/r=∞. | The equivalences are repaired in both files. A separate dimension Check in the plan lacks its README bound; current R04. |
| R08, torsion in thin regions | §6.1 now states “three intermediate statements”, including finite small-displacement groups and general Garland–Raghunathan reduction. The modular cone groups are C₂ and C₃, and no Selberg/cusp circular reduction remains. | Partly repaired. The added assertion that every elliptic fixed point belongs to the finite case is false: current R01. |
| R09, native proper discontinuity | Contract: “it always gives finite stabilisers”; “freeness … only for torsion-free subgroups”. The native theorem takes singleton compact sets without T₂, and C₂ acting on the disc has stabilizer size 2 at 0. | Repaired; §5.2 consumes the native result. |
| R10, functoriality locator | §10.6: “This theorem is proved here from §§9.5 and 10.4–10.5”. Baldi–Ullmo is now motivation only. The common neat normal core gives degrees 6, 12 and 1 in the modular, level-3 and identity tests. | Repaired. |

I also looked for the repaired patterns elsewhere: full versus connected domains, finite versus trivial stabilizers, powers ℓ=0, chart direction, displacement conventions, finite-index cores, and internal forward dependencies. The residual occurrences are reported below, rather than treated as clean repairs.

## R01 (P1) — An elliptic fixed point can lie in the parabolic thin part

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:460`: “this case contains every point fixed by an elliptic element”; `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json:1160` repeats this in target 6.1's proof sketch.

**Claim.** If an elliptic element fixes x, the small-displacement group Γ_ε(x) is finite.

**Witness.** In Siegel coordinates let R(u,v)=(−u,v), T(u,v)=(u,v+1). At x=(0,iy), d(x,Rx)=0 and d(x,Tx)=√2 asinh(1/(2y))→0, while ⟨T⟩ is infinite. Both occur in an arithmetic lattice.

For an explicit verification of that last assertion, use the Hermitian matrix H with rows (0,0,−i), (0,−2,0), (i,0,0). It has signature (1,2) and its positive affine lines are Im(v)>|u|². The matrices R̃=diag(−1,1,−1) and T̃=I+E₃₁ lie in SU(H,ℤ[i]): both determinants are 1 and direct multiplication gives R̃ᴴHR̃=T̃ᴴHT̃=H. Their projective actions are R and T. The projective arithmetic group is a lattice by the supplier theorem used in §11.2. For any ε>0 choose y>1/(2 sinh(ε/√2)); then R,T∈Γ_ε(x). At y=1000, T's displacement is approximately 0.000707106752. Thus an actual elliptic fixed point lies in an infinite group of parabolic type, even for the uniform ε_n of §4.4.

**Exact repair.** Replace the quoted clause in both files by: “The finite case includes points whose entire small-displacement group is finite. An elliptic fixed point can also belong to the parabolic or loxodromic case.” Keep the three group types, the general reduction theorem, and the modular cone Checks. Add the R,T example as a negative control to any assertion that elliptic fixed points are necessarily thick. In the Layer 4 Examples retain the explicit condition that Γ_ε(x) is finite. With this repair, the example is classified by its infinite parabolic subgroup and no longer contradicts the trichotomy.

## R02 (P2) — The basic ball geometry has two owners

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:9`, “This roadmap owns complex hyperbolic geometry”; targets §§1.1–1.4, 2.2–2.3 and 3.1–3.3, and their plan entries.

**Claim.** These group, ball, metric and totally geodesic constructions are new owned work here.

**Witness.** Open pull request #2229, `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:1286`, §5.7, already constructs U(1,n), PU(1,n), the ball, its homogeneous action, invariant metric and complex totally geodesic subspaces; see also lines 1298–1323.

This is an object overlap, not a title match. Its §5.7 includes the SU kernel μ_(n+1), K≅U(n), positive-line/affine-ball identification, the action and homogeneous-space comparison, precisely the potential −i∂∂̄log(1−|w|²), and the signature-(1,m) subspace/stabilizer classification. Its scope at lines 50–58 explicitly owns them. It excludes Cartan's biholomorphism theorem, Selberg, finite generation and nonarithmetic compactifications at lines 136–143, so those exclusions do not resolve the shared geometry.

**Exact repair.** Make RealSemisimpleLieGroups §5.7 the earlier owner of the shared constructions and add it to scope and supplier contracts, with a single supply direction into this roadmap. Replace the shared target bodies by consumption/comparison statements, retaining here the Siegel/Cayley and horospherical formulas, full Aut(B) theorem, matrix-conjugation eigenvalue adapter, the closed-analytic-subset extension of the totally geodesic theorem, and the lattice/compactification work. If target ids disappear, record their old→supplier or old→new mapping. Recheck the external gate after placing this design after that supplier; do not create reciprocal dependencies.

The convention adapter must be explicit: that supplier's form is linear in its first slot, while this roadmap's is conjugate-linear there. The values are complex conjugates, their diagonal values and positive lines agree, and their matrix groups coincide. At n=1 both metrics have g₀=2|dw|² and curvature −2; its Killing metric is 4 times this metric. At n=2, W={z₁=z₀/2} has form (3/4)|z₀|²−|z₂|² in either convention, giving the same sub-ball and stabilizer. These tests validate the proposed consumption without rescaling ω. The finite-group circumcentre input newly used in §6.1 should likewise be tied to the supplier's §5.4, rather than inferred from a curvature label alone.

The Baldi–Ullmo locator currently attached to all of §1.2 only defines the matrix quotient; it does not state its topology or conjugation spectrum. When separating the supplied group from the retained matrix adapter, cite that locator only for the definition and identify the adapter as a deduction, with its tensor-product spectrum and closed-image argument. Do not preserve the appearance of a source theorem that the cited lines do not contain.

## R03 (P2) — The arithmetic predicate and compact-kernel lattice argument are already supplied

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:779`, “Define Γ ⊂ G to be arithmetic”; line 792, “Prove that every arithmetic Γ ⊂ G is a lattice”; targets 11.1–11.2 in the plan.

**Claim.** The real-Lie-group arithmetic predicate, its invariances and the compact-kernel lattice argument are owned here, using only the integral-points input of AdelicAlgebraicGroups.

**Witness.** Pull request #792, `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3384`, §3.4 “Arithmetic lattices in a real Lie group”, defines this compact-kernel predicate and proves invariance and the image-lattice assertion. Lines 3366–3375 supply anisotropic cocompactness.

In particular lines 3392–3418 retain the identity component, finite-index passage, openness/properness of p, discreteness of its arithmetic image, and the quotient-measure step. These are precisely the route of §11.2. The distinction that §11.1 phrases the witnesses before assuming Γ is a lattice can be retained as an equivalence/comparison; it does not require a second construction or proof of the supplier's theorem.

**Exact repair.** Expand the existing §3.4 contract to include its real-Lie-group arithmetic predicate, compact-kernel image theorem and invariance. Rewrite §§11.1–11.2 as the specialization to the supplied PU(1,n) carrier and the equivalence between the witness-only condition and the supplied arithmetic-lattice predicate. Keep the ℚ-simple-factor reduction and the actual Shimura-datum construction as this roadmap's work. Delete the repeated general image-lattice proof and cite §3.4 for it in both files. For SL₂→PSL₂, the kernel has order 2 and the image of SL₂(ℤ) is PSL₂(ℤ); for the Picard form the isotropic vector (1,1,0,…) still gives noncocompactness. Thus the imported theorem yields the same intended examples.

The external source pointer at line 792 also needs correction during this rewrite: WitteMorris2015 lines 1896–1898 merely announce existence of lattices. The arithmetic-lattice theorem is Theorem 5.1.11, printed p.88, line 3676; the Godement criterion is Proposition 5.3.1, printed p.94, lines 3909–3911. The exact general anisotropy contract remains the supplier's §3.4.

## R04 (P3) — Three plan entries still disagree with the repaired README

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json:174`, “ι is the restriction of the affine chart”; line 974, “G unimodular … (1.2)”; line 1779, “vanishing on D: ℓ−2”.

**Claim.** These entries describe the same map, prerequisite and dimension range as the README.

**Witness.** The chart takes [1:1/2] to 1/2, whereas ι takes 1/2 to [1:1/2]. Unimodularity moved to §1.4. For ℓ=1, H⁰(ℙ¹,O(1−3)) has dimension 0, not ℓ−2=−1.

**Exact repair.** In target 1.3's API say “restriction of the inverse affine chart of index 0”; in target 5.1's hypothesis cite §§1.2 and 1.4, assigning unimodularity to §1.4; in target 9.2's dimension Check retain the README's ℓ≥2 restriction, or write max(ℓ−2,0) for ℓ≥0. Retest with ι(1/2)=[1:1/2] and dimensions 0,0,1 at ℓ=1,2,3. No Lean declaration is involved.

## Verified sound

### Coverage, shape and principles

I read all 57 target statements, their hypotheses, API entries and Checks in both files, all supplier contracts and target dependencies, and all ten repair explanations. Earlier round-2 computed rows were reused only for unchanged assertions they actually instantiate; the new arguments and all fifteen seeded targets were read afresh. The table below records the seeded targets, headline results, changed arguments and every finding's mathematical controls. It is evidence from examples and deductions, not a claim that examples prove the general theorems.

The README has twelve layers, each with Examples and Dependencies; all 57 targets have at least three Checks, and all ten definition-kind plan entries have an API. There are 57 target-level Needs lines (58 occurrences of the marker including the reading-guide sentence). The requested summary, ownership, conventions, supplier contracts, reading guide, consumers and references are present. No second copy of this roadmap exists on main. No forbidden supplier, executable algorithm, copied source table/figure, local machine path, pull-request number or instruction from untrusted text was found in the design. The subject remains all n≥1 and all lattices; neatness and torsion-freeness are explicitly retained only for the results that need them. Ownership is not clean: R02–R03.

### Computed adversarial table

“Pass” means the displayed calculation agrees with the stated target; it does not certify an unread source. Unchanged controls agree with the previous computed ledger.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| 1.1 form and unitary group | h_t; coordinate swap; 2I | h_tᴴJh_t=J, det=1; SᴴJS=−J; (2I)ᴴJ(2I)=4J | Pass; shared ownership R02. |
| 1.2 quotient and Ad | n=1,2; diag(1,ζ,1), ζ³=1; scalar iI | SU kernels have 2 and 3 elements; Ad eigenvalues are five 1s, two ζ, two ζ⁻¹; Ad(iI)=identity | Pass; R02 separates supplied group and retained adapter. |
| 1.3 projective/Cayley comparison | 0,−1,1; w=(0,1/2); [1:1/2] | C gives i,0,∞; ρ(C(w))=3=(1−1/4)/(1/4); chart([1:1/2])=1/2 and ι(1/2)=[1:1/2] | README passes; reversed plan API R04. |
| 1.4 Cartan, section, unimodularity | w=e₁/2; reversing diagonal k; P∞ | γ=2/√3; tanh((log3)/2)=1/2; kg_tk⁻¹=g_(−t), so Δ(g_t)²=1 and Δ(g_t)>0 forces 1; determinant on Lie N=s^(2n) | Pass; plan's old §1.2 citation R04. |
| 1.5 Heisenberg convention | a=1,a′=i; n=1 | products have central entries −2 and +2; commutator T_(−4); map to native Heisenberg gives z=1 for the product, equal to xy′=1; n=1 horizontal rank 0 | Pass. |
| 1.6 comparison | w↦−w | C(−w)=−1/C(w); matrix S²=−I, projective order 2 rather than 4 | Repair passes. |
| 2.1 Cartan uniqueness and automorphisms | corrected boost; w/2; z+z² | boost sends 0↦−1/2 and 1/2↦0; h_t sends 0↦i/2; derivatives 1/2 and 1, last map unbounded-domain only | Repair passes. |
| 2.2–2.3 metric/curvature | n=1,2; c=2; swap of coordinates | g₀=2I; det h=(1−r²)^(−n−1); Ric=−(n+1)ω; K(ω)=−2, K(2ω)=−1; diag(1,2) swaps to diag(2,1) | Pass; R02 ownership. |
| 2.4 distance/completeness | tanh(t)e₁; unit-speed radial curve | RHS of distance identity=cosh²t; d=√2 abs(t); radial speed √2/√2=1; d→∞ as r→1 | Pass. |
| 2.5 Schwarz–Pick | (ζ,0), (ζ,ζ)/√2, (ζ/2,ζ/2), constant map, 2ζ | derivative norms 1,1,1/√2,0,2; metric ratios 1,1,1/2,0,4; last map leaves the ball | Pass, including zero derivative where the proof's unit direction is unnecessary. |
| 3.1–3.3 sub-ball classification | m=0; w₁=1/2; w₂=w₁²; two axes | point dimension 0; restricted form (3/4)abs(z₀)²−abs(z₂)²; curved graph second derivative 2; axes union has 2 irreducible components | Pass with complex/complete/irreducible hypotheses; R02 ownership. |
| 3.4 fixed set | diag(1,ζ,1); diag(1,ζ,ζ); identity | fixed sets w₁=0, {0}, B, of dimensions 1,0,2; identity excluded | Repair removes forward reference without weakening theorem. |
| 4.1–4.3 types/displacement | T_t; a_s; conjugate translations | translation infimum 0 unattained; dilation length √2 abs(log s)>0; a_(1/2)^k T₁ a_(1/2)^(−k)=T_(4^(−k))→1 | Pass; this combined group is not discrete. |
| 4.4 Margulis proof | C_m, S₃, trivial Δ; word-coset chain | nilpotent indices 1,2,1; m+1 strict-stage cosets contradict ≤m covering bound; stable stage is all cosets | New covering argument passes, including nonnormal subgroup cosets acted on from the left. |
| 4.5 parabolic lattice | Gaussian horizontal lattice; rank-one subgroup | horizontal ranks 2 and 1; centres 4ℤ and {0}; only the first is cocompact on a three-dimensional horosphere | Pass; full finite-holonomy source remains uncertified. |
| 5.1–5.3 measure and lattice | PSL₂(ℤ), Γ(2)/±1, trivial Γ; cusp | volumes π/6,π,∞; index factor 6; integral from N to ∞ of ρ^(−n−1) is N^(−n)/n, integral from 0 to 1 diverges | Pass. |
| 5.2 proper/free distinction | C₂ rotation, irrational rotation, singleton transporter | stabilizer sizes 2,∞; transporter of {x},{x}=Stab(x) with no separation axiom; torsion-free finite stabilizer has size 1 | Repair passes. |
| 5.3 null nonfree locus | C_m on disc; trivial Γ | nonfree locus {0} or empty, both volume 0; sector angle 2π/m gives a.e. coverage with disjoint translates | Native fundamental-domain hypothesis satisfied. |
| 6.1 modular cone controls | i, exp(2πi/3), 10i in PSL₂(ℤ) | finite groups C₂,C₃ for small ε; translation at 10i has d=√2 asinh(1/20)≈0.07068 | Modular repair controls pass, but do not prove all elliptic points thick. |
| 6.1 new negative control | SU(H,ℤ[i]); R,T at (0,1000i) | R̃ᴴHR̃=T̃ᴴHT̃=H; both determinants 1; R²=1; T^k≠1 for k≠0; displacements 0 and 0.000707106752 | False finite-case assertion, R01. |
| 6.1 reduction and compact core | modular Siegel set; compact lattice | Im(γz)≥√3/2 and Im z≥√3/2 imply c²≤4/3 when c≠0; thus abs(c)≤1; compact quotient has 0 cusp classes | Source reduction input and compactness deduction pass these controls. |
| 6.2 generation | PSL₂(ℤ), [F₂,F₂], {1} | presentation C₂*C₃: 2 generators, 2 relations; abelianization F₂/[F₂,F₂]=ℤ²; trivial subgroup needs 0 generators | Repair passes. |
| 6.3–6.4 Selberg/neat | ±1; Γ(3); order-4 screw | subgroup {1} has index 2 and sole eigenvalue 1; A=I+3B in SL₂ has trace 2−9det B; screw has infinite order and Ad eigenvalue i | Pass; weaker eigenvalue condition is explicitly distinguished from the supplier's stronger neatness. |
| 7.1–7.2 analytic quotient | ±1 on ℂ²; reflection; Γ(3) | invariant ring ℂ[a,b,c]/(ac−b²); reflection invariant ring ℂ[w₁,w₂²] smooth; sphere minus 4 points has π₁=F₃ | Pass; torsion does not characterize smoothness. |
| 7.3 finite quotients | Γ′=Γ; Γ′={1}, finite Γ; level 2 | quotient groups {1},Γ,S₃; tower invariants (A^Γ′)^(Γ/Γ′)=A^Γ; modular generic degree 6 | Pass, including nonabelian S₃. |
| 8.1 cusp multiplier | a=1,a′=i,τ=4; n=1 | χ(1)=χ(i)=1, χ(1+i)=−1; cocycle exponential correction −1, product 1; n=1 horizontal torus dimension 0 | Prior repair survives. |
| 8.2 toroidal compactification | Γ(2)/±1; compact neat group; n=2 cusp | boundary has 3 points; empty boundary in compact case; normal line curvature coefficient −4π/τ<0 in n=2 | Pass with neat/unipotent hypothesis. |
| 8.3–8.4 cusp growth and L² | q=e^(−R); (ℓ,k)=(0,0),(1,0),(1,1) | ρ=τR/(2π); metric coefficient 1/(2 abs(q)²R²); radial integrals 1/(−logδ),∞,δ²/2 respectively | Positive-power repair passes. |
| 8.5 finite volume | k=n=1; cylinder metric | ∫dr/(r log²r)=1/(−logδ)<∞; ∫dr/r=∞; vertical 2-form squares to 0 | Pass. |
| 9.1 jets | orders 0,1,2 under r^(−2n−2); g=2,3 | radial exponents −3,−1,1 force order≥2; degrees at (g,ℓ)=(2,2),(2,3),(3,2) are 4<5,6≥5,8≥7 | Pass. |
| 9.2 dimension/boundary | Γ(2)/±1, E=O(1), three cusps | H⁰(E^ℓ(−D)) dimensions at ℓ=1,2,3 are 0,0,1; unqualified ℓ−2 gives −1,0,1 | README passes; plan Check R04. |
| 9.3 projective theorem | Γ(2)/±1, ℓ=2 | [s:t]↦[s²:st:t²] embeds ℙ¹ as a conic; h⁰(O(2))=3; h⁰(K)=h⁰(O(−2))=0 | Pass; log twist essential. |
| 9.4–9.6 minimal compactifications | compact Γ; PSL₂(ℤ); Γ(2)/±1; Γ₀(11) | boundary sizes 0,1,3; Γ₀(11) index 12, two cusps, no elliptic points, genus 1+12/12−2/2=1 | Pass. |
| 10.1–10.2 hyperbolicity/extension | cusp circle r=e^(−R); exp(1/q) to j-line | circle length √2π/R→0; radial distance grows log(R)/√2; exp(1/q) tends to ∞ and 0 along q=±1/k | Torsion-free hypothesis retained. |
| 10.3–10.5 algebraicity/uniqueness | identity; cusp normalization; nodal compactification of ℂ* | identity degree 1; ℂ[t²,t³] proper subring of ℂ[t]; ℙ¹ adds 2 points, nodal cubic identifies them to 1 nonnormal point | Pass; marked and normal hypotheses matter. |
| 10.6 functoriality | level 2, level 3, identity | effective quotient orders and generic degrees 6,12,1; SL₂ level-3 index 24 becomes projective index 12 | Repaired normal-core argument passes. |
| 11.1–11.2 arithmetic | SL₂; Picard isotropic vector; definite conjugate place | kernel ±1 has order 2; h(1,1,0,…)=0; a nonzero isotropic vector cannot stay isotropic under a definite embedding | Mathematics passes; duplicate supplier work R03. |
| 11.3 connected domains | n=1,2,3; h₀(2),h₀(i) | 2 domain components for n=1; n=2 would require abs(det g)²=−1 for negative similitude; n=3 excluded by unequal inertia despite determinant ratio 1; h₀(2)=1, h₀(i) acts by −1 | Repair passes beyond its determinant-only Check. |
| 11.4 Baily–Borel comparison | modular curve; Picard surface | boundary dimension 0 in both; codimensions 1 and 2 respectively; X(1)=ℙ¹ | Pass, with X⁺. |
| 11.5 Borel embedding | n=1, w=0,1,2 | form values 1,0,−3; chosen disc maps to positive lines, other full-domain component to negative lines | Repair passes. |
| 12.1–12.2 Γ-special images | m=n; Picard sub-ball; trivial stabilizer | normalization map degree 1 for full sub-ball; w₂=0 has complex dimension 1; trivial subgroup in PU(1,m) has infinite covolume | Pass; compact kernel is retained, not a false direct-product assertion. |
| 12.3 converse | n=1; finite neat cover of degree d | only positive-dimensional closed irreducible W is S_Γ; pulled-back volume=d times original, finite exactly when original is finite | Pass for the geometric finite-volume route, not a circular use of Ax–Schanuel. |
| 12.4 dimension bound | B×{s}, B×S, {x₀}×S | (dim W,dim U)=(n,0),(2n,n),(n,0); all satisfy dim U=dim W−n | Pass, including finite-quotient descent for torsion. |
| Two declared gaps | cusp, node, line | normalization t↦(t²,t³); node has 2 preimages of 0; line completion ℂ[[t]] is regular; y/x on cusp continuous but not holomorphic at 0 | Contracts precise in their README/detail statements, matching slugs; normality indispensable. |

### Seeded source verification

The manifest parses and has 17 distinct work entries: eight readable cached texts, eight settled uncertified works, and GarlandRaghunathan1970 waived. I fetched none and reopened no settled request. Exact line numbers below belong to the supplied extractions. Mok pages are those of the expressly cited IMR2009-4 preprint, not invented page numbers in the published chapter.

| Seeded target | Locator actually read; support and limits |
| --- | --- |
| 1.1 | BaldiUllmo2023 lines 486–496, §3.2, printed p.12: signature and matrix-form quotient. The inverse, polarization and centre statements are elementary consequences here. Its standing n>1 does not supply n=1; that case is checked directly. |
| 1.2 | Same source lines 492–496, p.12: matrix quotient only. It does not state the full topological/conjugation package. R02 requires a supplied group plus an explicitly owned matrix adapter instead of treating these lines as that theorem. |
| 2.3 | Mok2012 lines 515–516, p.12, recall negative-curvature compactification, not the normalization of curvature. Goldman1999 Ch.3 is the stated but uncertified curvature source. The potential, Ricci formula and scale were calculated above. |
| 2.5 | Kiernan1972 lines 64–65, §2, p.348: holomorphic maps decrease Kobayashi distance. It does not identify the ball's chosen √2-scaled metric. The roadmap gives its own tangent Schwarz argument; Goldman Ch.3 remains uncertified. |
| 3.3 | BaldiUllmo2023 lines 478–506, §3.2, p.12, discuss Hermitian subdomains and stabilizers, not arbitrary singular analytic subsets. The latter conclusion is the explicit §3.2/connected-regular-locus/dimension deduction. General submanifold ownership is R02. |
| 5.3 | WitteMorris2015 Proposition 4.1.11, lines 1899–1921, printed pp.45–46: lattice iff a group fundamental domain has finite Haar measure. The B=G/K comparison is this roadmap's compact-K measure argument, using the named native domain theorem. BaldiUllmo2023 lines 338–339 give only the cocompact/discrete observation. |
| 7.3 | The primary Cartan1957 pp.90–102 citation in the plan remains uncertified. The actual general finite analytic invariant-quotient contract was read at ShimuraVarieties §P.6, #933, README line 234. Its universal property and transitivity of invariants support the deduction for all discrete Γ′◁Γ of finite index. |
| 8.2 | Mok2012 Theorem 1, lines 476–484, p.11; BaldiUllmo2023 lines 510–557, pp.13–14. Baldi–Ullmo explicitly assumes unipotent cusp groups at lines 523–524. The roadmap retains neatness and supplies unipotence, avoiding the torsion-free-only issue in Mok's recalled construction. |
| 9.3 | Mok2012 Main Theorem, lines 546–562, p.13; final separation and contraction argument at lines 895–934, p.20. Finite volume, smooth compactification with abelian boundary and E=K(D) are retained. The roadmap does not repeat the misleading “singularity” terminology for n=1 cusp points. |
| 11.2 | WitteMorris2015 lines 1896–1898 do not state this theorem. Read Theorem 5.1.11 at line 3676, p.88, and Proposition 5.3.1 at lines 3909–3911, p.94. BaldiUllmo2023 lines 336–339, p.8, cover restricted arithmetic/cocompact examples. Correct general supplier and locator are part of R03. |
| 11.4 | MilneSVI Theorem 3.12, lines 1686–1689, p.38, assumes torsion-free arithmetic Γ; Remark 3.13(a), lines 1722–1724, p.39, includes torsion and normality. Mok2012 lines 123–128, p.3, give finite-point ball boundary. BailyBorel1966 Theorem 10.11 remains uncertified. Chosen components are retained. |
| 11.5 | BaldiUllmo2023 lines 533–540, p.13, use the Borel embedding. The exact compact-dual construction is ShimuraData §3.8, #1038, README lines 528–550, including tangent and equivariance comparisons. The positive-line identification is the roadmap's comparison with §1.3. |
| 12.2 | BaldiUllmo2023 Corollary 3.4.6, lines 686–702, p.17: algebraicity in the paper's torsion-free real-Shimura setting. Lines 433–434, p.11, give closedness; line 474, p.12, gives total geodesy. Finite normalization, boundary behavior and general torsion are the stated owned argument via neat finite covers, not literal claims of the corollary. |
| 12.3 | BaldiUllmo2023 lines 1346–1352, Corollary 5.5.2, p.33, states the equivalence for positive-dimensional irreducible algebraic W. The source uses its Hodge/bi-algebraic route. This roadmap instead uses closed analytic preimages, finite volume and compact-kernel stabilizers, with the needed hypotheses visible. |
| 12.4 | BaldiUllmo2023 Theorem 1.2.2, lines 91–97, p.3, compares these codimensions but is the stronger atypical-intersection theorem. This roadmap owns only the ordinary dimension inequality, with its Krull-height/finite-cover proof; it explicitly leaves Ax–Schanuel to a consumer. |

All citations marked uncertified remain so; none was silently described as text-verified. The seeded sample is fifteen targets, not the different round-2 sample.

### Pinned declarations and supplier resolution

Pins checked against `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

| Objects opened at the pins | Locators and contract checked |
| --- | --- |
| Indefinite form; definite unitary group | `Matrix.indefiniteDiagonal`, `Mathlib/Algebra/Lie/Classical.lean:175`, diagonal of Sum.elim(1,−1); `Matrix.unitaryGroup`, `Mathlib/LinearAlgebra/UnitaryGroup.lean:105`, definite unitary submonoid, not a signature-(1,n) group. |
| Projectivization | `Projectivization`, `Mathlib/LinearAlgebra/Projectivization/Basic.lean:48`; `instTopologicalSpace`, `Mathlib/Topology/Algebra/Projectivization.lean:44`. This is a quotient topology; Hausdorffness is not built into the carrier. |
| Projective atlas | `instT2Space`, `instCompactSpace`, `affineOpenPartialHomeomorph` at `TauCeti/Topology/Algebra/Projectivization.lean:188`, :215, :311; `instChartedSpace`, `instIsManifold`, `contMDiff_affineChart_symm` at `TauCeti/Geometry/Manifold/Instances/Projectivization.lean:54`, :82, :96. Finite dimension/RCLike and separating-dual hypotheses are available for ℂⁿ. |
| Finite reindexing | `finSumFinEquiv`, `Mathlib/Logic/Equiv/Fin/Basic.lean:224`: left index 0 goes to 0; compose the 1+n=n+1 cast. The chart itself and its inverse have opposite types, R04. |
| Disc/Schwarz | `Complex.UnitDisc`, `Mathlib/Analysis/Complex/UnitDisc/Basic.lean:30`; `Complex.dist_le_div_mul_dist_of_mapsTo_ball`, `Mathlib/Analysis/Complex/Schwarz.lean:189`, complex differentiability on an open ball and image in a closed ball. |
| Proper discontinuity | `ProperlyDiscontinuousSMul`, `Mathlib/Topology/Algebra/ConstMulAction.lean:534`; `finite_stabilizer'` :566 and `finite_stabilizer` :601. Transporter finiteness for singleton compact sets proves finite stabilizers with no T₂. |
| Proper-action bridges | `Subgroup.properlyDiscontinuousSMul_iff`, `Mathlib/Topology/Algebra/Group/DiscontinuousSubgroup.lean:28`; `Subgroup.properlyDiscontinuousSMul_of_tendsto_cofinite`, `Mathlib/Topology/Algebra/Group/Subgroup.lean:155`; `properlyDiscontinuousSMul_iff_properSMul`, `Mathlib/Topology/Algebra/ProperAction/CompactlyGenerated.lean:95`. No freeness conclusion was read into them. |
| Measure/covolume | `MeasureTheory.IsFundamentalDomain`, `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:69`, has null-measurability, a.e. coverage and a.e. disjointness; `covolume` :679 and `covolume_eq_volume` :695. The default value without a fundamental domain is 0, so §5.3's existence input is essential. |
| Haar uniqueness | `MeasureTheory.Measure.isMulLeftInvariant_eq_smul_of_innerRegular`, `Mathlib/MeasureTheory/Measure/Haar/Unique.lean:889`; finite measure on compacts and inner regularity are retained. |
| Commensurability | `Subgroup.Commensurable` and `Subgroup.commensurator`, `Mathlib/GroupTheory/Commensurable.lean:58`, :141; finite relative indices in both directions. |
| Normalization | `AlgebraicGeometry.Scheme.Hom.normalization`, `Mathlib/AlgebraicGeometry/Normalization.lean:122`; normalize the generic-point morphism, not the identity. |
| Ring inputs | `IsJacobsonRing`, `isJacobsonRing_of_finiteType`, `finite_of_finite_type_of_isJacobsonRing`, `Mathlib/RingTheory/Jacobson/Ring.lean:60`, :681, :691; `Ideal.height_le_spanFinrank`, `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:282`, requires a proper ideal. |
| Compactness/completeness | `TauCeti.Matrix.isCompact_unitaryGroup`, `TauCeti/Topology/Algebra/UnitaryGroup.lean:104`; `TauCeti.completeSpace_ofRiemannianMetric_of_isPretransitive_isom`, `TauCeti/Geometry/Manifold/Riemannian/Homogeneous.lean:79`, under finite real dimension, manifold/separation and Riemannian-bundle hypotheses. |
| Holomorphic expansions | `DifferentiableOn.analyticOnNhd_of_finiteDimensional`, `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:351`; open set, finite-dimensional source and complete target. |
| Free quotient | `TauCeti.isLocalDiffeomorph_quotientMk`, `TauCeti/Geometry/Manifold/Instances/Quotient.lean:253`; free, properly discontinuous smooth action, not a torsion quotient theorem. |
| Measurable domain | `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul`, `TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean:100`; `TauCeti.freeLocus`, `TauCeti/Topology/Algebra/GroupAction/FreeLocus.lean:36`. Countability, second countability, local compactness, T₂, measurable opens and null nonfree locus were read in scope. |
| Heisenberg/volume | `TauCeti.HeisenbergGroup`, `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:58`; `TauCeti.riemannianVolume`, `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`. The former is three-dimensional and does not supply higher-dimensional N. |

The fourteen automated “Lean names found nowhere” leads are supplier targets, not pinned declarations: eleven `TauCeti.Shimura.*` targets at #933 and three `Reduction.*` targets at #792. Each was resolved at that roadmap's head. No backticked identifier in the README is presented as a declaration owned by this design and missing from a Lean file; its proposed `BallQuotient.*` catalogue is in the plan. Native carrier and supplier names are not such promises.

Cross-roadmap contracts were reread at these locations (open-head file lines exclude the one-line tool wrapper):

- `TauCetiRoadmap/FuchsianOrbifolds/README.md`, Layers 0–4, including Layer 2 L2.1 and Layer 4 cusp/finite-index maps; `Completed/ConformalMapping/README.md`, Layer 2. Their disc and upper-half-plane normalizations agree after the factor 1/2 in ω-area.
- `TauCetiRoadmap/RiemannianGeometry/README.md:2726`, R4.7's generic free quotient, completeness and local-isometry one-jet assertion; :3187, R5a's immersion/normal-bundle geometry. `Completed/HopfRinow/README.md` supplies the geodesic/completeness framework via that contract.
- `TauCetiRoadmap/ComplexKahlerGeometry/README.md:363`, retained old K labels and their mapping; Layers K1–K4 and K6.0 supply complex type calculus, analytic subsets, Chern/canonical bundles and the curvature bound. Its normal-extension assertion is the manifold case, so it does not discharge the singular-space gap.
- `TauCetiRoadmap/ComplexManifolds/README.md:238`, :267, :296, :319: Milestones 4–7, free quotients, open gluing, finite-gluing separation and holomorphic bundles. Hausdorffness of a gluing still needs the generated relation closed; the cusp neighborhoods provide the comparison here.
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:2861`, Layer 9's discrete finite-covolume lattice and Weil formula; `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3450`, §1.17's projective finite quotient over a Noetherian base.
- #848, `TauCetiRoadmap/ComplexComparisonPartII/README.md`, C−1.1–C−1.2 at lines 1037–1108: analytic spaces, analytification, smooth charts and completed stalks; C0.6 at 1460: analytic geometry/normalization; C1.4 at 1678: complete weighted L² estimate and canonical twist; C1.6 at 1850; C1.9 at 1966; C4.1, C4.2, C4.4 at 2667, 2689, 2730. The analytic carrier imposes no global Hausdorffness; the ball-quotient construction proves it.
- #933, `TauCetiRoadmap/ShimuraVarieties/README.md`, P.1 at 155, P.2 at 167, P.6 at 232; §§0.1,0.4,0.5 at 244,299,316; §1.2 at 391; §2.7 at 659; §§3.3,3.4a,3.5 at 769,807,919. Full real orbits and chosen components are explicitly distinguished, supporting the repaired arithmetic bridge.
- #792, `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, §3.4 at 3184 onward: arithmetic commensurability and level groups, finite-volume/anisotropy criteria, and now the real-Lie-group definition and compact-kernel passage (R03). Its §4.3 uses the stronger torsion-free eigenvalue-group definition; this roadmap explicitly defines its weaker condition and does not claim they coincide.
- #966, `TauCetiRoadmap/PELModuli/README.md:3661`, M5.5, unitary data; the pure-datum result at 3684 retains connectedness and SV3. The (1,n) imaginary-quadratic example satisfies them. #1038, `TauCetiRoadmap/ShimuraData/README.md:528`, §3.8 compact dual/Borel embedding, read with its complex/Hodge sign convention.
- #853, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:8674`, §5.4 normalization; :10167, §9.5's explicit consumption of ResolutionOfSingularitiesCharacteristicZero §6.2. No obsolete SNC declaration names remain.
- #871, `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:1364`, ALS.0.5 includes discrete effective image with finite kernel, not an arithmeticity restriction. Its mention here delimits ownership; it is not a hidden dependency on an arithmetic lattice.

The two gap slugs occur in both README and plan with the named ComplexComparisonPartII owner. Normality, regularity and compatibility of normalization are tied to the same completed-local-ring comparison; the second contract gives continuous extension across a nowhere-dense analytic subset of a normal space. These are declared contracts, not findings about absent prerequisites. Acceptance, once the findings are repaired, may be conditional on them.

The required dependency command completed with:

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 223 roadmaps, 1981 edges, 0 problem(s)
```

No UPWARD or CYCLE line appears in the declared external graph. This does not settle the undeclared ownership conflict R02. No `moved:` line appeared. Internal target edges are acyclic and in order; the obsolete textual label in target 5.1 is separately R04.

### Object and overlap audit

I read the board-package index before making ownership conclusions, used `roadmaps show` at the supplied open heads, and used `roadmaps grep` for Cartan uniqueness, Zassenhaus, Selberg and the roadmap name. The board's three indexed packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory; none is the owner of the specific shared ball construction identified here. No second-copy case, competing head modifying this folder, dropped cited id or revision-only cited id appears in the supplied overlap report. Main has no BallQuotientsAndComplexHyperbolicLattices folder. The major new lead is #2229, which was read rather than omitted because it was absent from the older closest-roadmap list.

The closest scopes distinguish real hyperbolic three-space (#432 KleinianGroups), quaternionic arithmetic Fuchsian groups (#2026 ArithmeticFuchsianGroups), and Nielsen cores/quadratic classes (#1696 FuchsianOrbifoldsPartII). None owns nonarithmetic complex-ball compactification. Main FuchsianOrbifolds owns the n=1 quotient/cusp objects already imported. ConformalMappingPartII owns pointed hyperbolic plane domains, analytic ODE continuation and value-distribution work, not several-variable Cartan uniqueness. ComplexKahlerGeometry owns the general Kähler/analytic/bundle inputs, already imported. ShimuraVarieties owns arithmetic quotients and Baily–Borel, already imported; the nonarithmetic construction is genuinely additional. R02 identifies the direct shared owner for basic complex-ball geometry, and R03 identifies the general arithmetic predicate/image-lattice owner.

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, KleinianGroups, ShimuraVarieties, FuchsianOrbifoldsPartII, FuchsianOrbifolds, ConformalMappingPartII, ComplexKahlerGeometry; ball/group/invariant-metric/complex-geodesic geometry → RealSemisimpleLieGroups §5.7 (R02); n=1 quotient/cusps → FuchsianOrbifolds; arithmetic quotients/Baily–Borel/finite analytic quotients → ShimuraVarieties; general Kähler/type/analytic/bundle theory → ComplexKahlerGeometry; no further shared owned object in the other closest scopes. The headings/results closest list is empty.

### Headline and Lean acceptance-test audit

The README headlines are: Aut(B)=PU(1,n); the complete invariant metric and curvature/distance formula; complex totally geodesic classification; Margulis and cusp structure; finite generation/presentation and eigenvalue Selberg; analytic and toroidal quotients; L² jets and projective minimal compactification; extension, Borel algebraicity and marked uniqueness; finite-index functoriality; arithmetic Shimura/Baily–Borel comparison; and Γ-special/totally-geodesic equivalence with the graph dimension setting. Baldi–Ullmo finiteness and Ax–Schanuel are explicitly downstream, not promised end theorems here.

No `Suggested.lean` exists at this design stage. Therefore there are zero sorried declarations to probe, zero elaborated declarations to compare with `#check @name`, and no file whose import/docstring/padding can receive a package verdict. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean process was started; no claim of passing elaboration or “sorry is the only warning” is made. There is no sorry'd data or `set_option` in the supplied design.

At package stage, Cartan uniqueness on native bounded domains and the characteristic-zero finitely generated linear-group eigenvalue Selberg statement are statable with simple native predicates. Their absence cannot be excused by missing analytic-space carriers. The quotient, toroidal, algebraization and special-subvariety headlines require supplier carriers not supplied by this design; any genuinely unavailable headline must be named individually in the module docstring. No replacement by a free predicate, boundary case or Check is justified.

### Wording, arrangement and reuse

I compared fourteen of the fifteen sampled passages with their readable cited text; §7.3 has only its settled unread Cartan primary source, so its supplier contract was checked instead. Five further comparisons were §§1.5, 2.2, 6.3, 8.1 and 10.2, covering definitions, metric construction, proof route, automorphy factors and extension. A normalized-word check accompanied the reading: longest shared runs for the nineteen comparisons were 5,3,2,2,2,4,3,3,2,2,3,3,3,5,4,2,10,5,2 words respectively. The ten-word run in §6.3 is the standard root-of-unity eigenvalue condition, not distinctive expository wording. No clause-by-clause imitation or copied expression was found.

Counting cited source-key occurrences before References gives BaldiUllmo2023 39 of 120, the largest share (Mok2012 26, WitteMorris2015 15). These are citation occurrences, including repeated locators, not a count of distinct theorems. Baldi–Ullmo's contents were read at lines 14–23: §§2–3 concern background/real Shimura data, §§4–7 Hodge theory, comparison, finiteness and special points. Its §3.2 feeds this roadmap's Layers 1–3, §3.3 feeds Layer 8, and §3.4 feeds parts of Layers 6 and 12. There is no ordered one-to-one run of matching scope. The Hodge/finiteness layers of that paper are excluded here. Mok's §1.1 feeds Layer 8.1, §1.2 feeds 8.3, §1.3 feeds Layers 4–6 and 8.2, and §2 feeds Layer 9; that is also not a copied contents order. The group→metric→cusp→compactification→projectivity→algebraicity dependencies force the retained mathematical order. No reused figure, table, data set or exercise list was found.

Source independence: 19 passages compared with 5 sources; no copied expression found; largest share BaldiUllmo2023, 39 of 120 README source-citation occurrences before References; contents compared with BaldiUllmo2023 and Mok2012: independent organization. Cartan1957's text remains uncertified, so wording of that primary finite-quotient source was not compared.

## Not verifiable

- Goldman1999 Ch.3; Raghunathan1972 Ch.VIII and XIII; Borel1969 §17 Corollary 17.7; Alperin1987 pp.269–273; Borel1972 Theorem A; BailyBorel1966 Theorem 10.11; SiuYau1982; Cartan1957 pp.90–102 are settled uncertified. I did not verify their exact wording, theorem numbering or pagination or request them again.
- GarlandRaghunathan1970 Theorems 0.7 and 4.10 are waived. BaldiUllmo2023 lines 649–661 were read as a secondary statement, but the general reduction proof itself was not read. The roadmap explicitly undertakes that general theorem rather than reducing to a torsion-free shortcut.
- Mok was checked in its identified IMR preprint. No assertion about correspondence with every page of the published chapter is made.
- Lean elaboration, executable one-tactic probes and elaborated binder checks are unavailable in this lane, and there is no Suggested file. The repair report's possible collision between the Mathlib and Tau Ceti projectivization topology names has not been tested by importing the modules together.
- Ownership was checked at the supplied main/open-head snapshot and board index. No later, unprovided head was investigated. No issue, pull request or comment was written.

## Source issues

- **Misprint** in BaldiUllmo2023 at §3.3.1, printed p.13, line 536: the source says the real rank of the horizontal unipotent quotient is n−1; it should be real dimension 2n−2, or complex dimension n−1; affects a stated result.
- **Error** in BaldiUllmo2023 at §3.2, printed p.12, lines 492–496: the source says projective unitary classes are realized on the underlying real vector space by their matrix representatives; it should use a scalar-independent representation, such as conjugation on endomorphisms; affects a stated result.
- **Error** in BaldiUllmo2023 at §3.2, printed p.12, lines 500–502: the source says the subspace stabilizer is a direct product of PU(1,m) with a compact group; it should be a compact-kernel extension, not generally a direct product; affects a stated result.
- **Error** in Mok2012 at §1.1 equations (5)–(6), printed p.5, lines 173–175: the source says every lifted vertical component is an integral multiple of τ and omits its multiplier; it should retain the coset t_a+τℤ and the unitary semi-character; affects a stated result.
- **Gap** in Mok2012 at Theorem 1, printed p.11, lines 476–484: the source says torsion-freeness suffices for the displayed abelian-boundary construction; it should assume unipotent cusp stabilizers or justify the finite-holonomy descent; affects the proof.
- **Misprint** in Mok2012 at §2.2, printed p.14, line 604: the source says the logarithmic canonical twist is O(−D); it should be O(D), as in the Main Theorem and the displayed simple-pole frame; affects nothing.
- **Misprint** in Mok2012 at §2.2, printed p.20, lines 895–896: the source says u−χe^k takes value e^k where u vanishes and χ=1; it should take value −e^k, or use χe^k−u; affects nothing.
- **Misprint** in MilneSVI at Remark 3.13, printed p.39, lines 1727 and 1734: the source says two successive items are labelled (c); it should label the second (d); affects nothing.

## For the human reviewers

- none
