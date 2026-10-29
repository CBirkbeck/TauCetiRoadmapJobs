<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1109#issuecomment-6488383685 -->
Red team round 2 pass a (codex) of 2996d96

Verdict: needs_changes

1. **F01** (P2) The generalized monoidal tower need not be a scheme modification

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1025, “For quasi-excellent noetherian X the underlying morphism X′ → X is a projective modification.”

   **Claim:** This conclusion also applies to the paragraph’s explicitly admitted monoidally torsion-free fine log schemes, without log regularity.

   **Witness:** Take the log point over Q with characteristic P = ⟨(2,0),(1,1),(0,2)⟩ and every nonzero monomial mapping to zero. Pulling back the stated A₁ resolution gives P¹_Q over a point, not a modification.

   **Exact repair text:** “For a log regular fs source with quasi-excellent noetherian underlying scheme X, the underlying morphism X′ → X is a projective modification. For general monoidally torsion-free fine log schemes, only the saturated monoidal tower and its functoriality are asserted.” Add the log point as a negative-control Check.

   **Test of repair:** P is sharp fs with torsion-free group completion, but the log dimension equation is 0 ≠ 0 + 2. The strict map from this log point to the vertex of Spec Q[P] pulls the toric resolution back to its exceptional P¹. No dense open of Spec Q admits an isomorphism from P¹. The repaired geometric conclusion excludes this input; the monoidal conclusion retains it. The distinction is explicit in ilo14 lines 4849–4856 versus 4904–4908 and 4960–4971.

2. **F02** (P2) The non-proper dualizing construction already has an owner

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:132, “PA.5 extends the dualizing construction locally by complete intersections to non-proper curves over arbitrary bases”; also :1158.

   **Claim:** Extending the construction beyond proper curves belongs to this roadmap, consuming only StableReduction Layers 2–3.

   **Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:4288–4331 already owns relative dualizing pairs, affine construction, gluing and arbitrary base change for every flat locally finitely presented morphism, expressly including non-quasi-compact and non-quasi-separated schemes.

   **Exact repair text:** “Consume SchemeAndStackFoundations §2.20, RelativeDualizingComplex.exists, .unique and .baseChange, on the flat finitely presented curve C → S. In the nodal relative-dimension-one case identify its degree −1 cohomology with an invertible sheaf ω_{C/S}, using the local complete-intersection description; define ω_{(C,D)/S}=ω_{C/S}(D). Compare on proper curves with StableReduction Layer 2. PA.5 owns this nodal identification and its use in relative stability, not a second relative-dualizing construction.” Add §2.20 to the exact contract, PA.5.1 Needs and PA.5 dependencies, and adjust the scope claim accordingly.

   **Test of repair:** For C=Spec k[u,v]/(uv), the supplied complex is ω[1] and H⁻¹ is the free rank-one nodal dualizing module; on the normalization its generator has residues (1,−1). Arbitrary base change and the non-proper carrier are supplied. The remaining nodal comparison and twist keep the intended theorem’s generality. This citation is to main, not either open revision of SchemeAndStackFoundations.

3. **F03** (P3) A supplier declaration name has drifted

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:975, “`LogCrystalline.IsLogRegular.trivial_iff`”.

   **Claim:** This named declaration is the supplier's trivial-log specialization.

   **Witness:** The current CrystallineCohomology README, CR.5:log-algebra.4, states this specialization under “Log regular schemes”; its Suggested.lean contains only isocrystal decomposition and monodromy targets, and neither file contains the cited identifier.

   **Exact repair text:** Replace “CR.5:log-algebra.4, Log regular schemes, `LogCrystalline.IsLogRegular.trivial_iff`” with “CR.5:log-algebra.4, Log regular schemes, trivial-log specialization”.

   **Test of repair:** For the trivial log structure I=0 and characteristic rank=0; the dimension equation is dim O=dim O+0. Log regularity reduces exactly to regularity of O. This theorem remains supplied in prose, so no additional gap is needed.

4. **F04** (P1) Kummer étale source descent is an unowned proof input

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1093, “Kummer étale descent of log smoothness gives the quotient statement”.

   **Claim:** PA.4.6 may use descent of log smoothness along a surjective Kummer étale morphism of the source.

   **Witness:** CrystallineCohomology CR.5:log-algebra.3 provides the lifting definition, chart criterion and base-change stability, not source descent. LefschetzPencilsAndVanishingCycles §0.10 supplies the separated quotient conclusion, not this general descent theorem. No declared gap covers it.

   **Exact repair text:** Add to the CrystallineCohomology contract: “What CrystallineCohomology must provide (gap:kummer-etale-source-descent): For morphisms X′ → X → S of fs log schemes, if X′ → X is surjective Kummer étale and X′ → S is log smooth, then X → S is log smooth (ilo14, Exposé X, Theorem 1.11, p. 148; ilo14 line 6778).” Add the matching slug, supplier CrystallineCohomology, section CR.5:log-algebra.3, and that needs sentence to plan.json's gaps; cite the gap in PA.4.6's Needs.

   **Test of repair:** A prime-to-p root cover of the log affine line has characteristic map 1↦n, finite invertible cokernel Z/n, and the descended line is log smooth over the trivial log point. Identity uses n=1. Surjectivity cannot be omitted: the empty source over a trivially logged cusp has smooth composite but the cusp is not smooth. The exact statement is ilo14 lines 6778–6781; the published-source citation alone does not allocate its formal proof.

5. **F05** (P1) Rumely's cited route needs surface inputs not allocated here

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1640, “treats a normal projective relative curve using intersection numbers and the boundary Picard theorem”.

   **Claim:** The listed inputs suffice to perform Moret-Bailly's line-bundle adjustment on the normal arithmetic surface.

   **Witness:** moretbailly89 lines 321–334 and 406–422 first require positive Cartier multiples of Weil divisors, using local Picard torsion (Theorem 2.8). Global boundary Picard torsion is different. The cited supplier sections also omit the surface intersection pairing.

   **Exact repair text:** “After compactification, apply PA.0.11 to obtain a regular projective surface dominating the normal projective relative curve; replace the open curve by its inverse image. It remains surjective over B and has geometrically irreducible generic fibre. Use SchemeAndStackFoundations §3.4, Cartier–Weil comparison for locally factorial schemes, and §5.9, relative intersection pairing and its vertical negative-semidefinite matrix, to perform the line-bundle adjustment on this regular model. Clear rational denominators, then apply the boundary Picard theorem to trivialize a positive power on the thickened boundary. Compose the resulting integral point with the projective modification.” Add PA.0.11 and SchemeAndStackFoundations §5.9 to the exact contracts and Needs.

   **Test of repair:** On the normal A₁ surface over F₅, D=V(u,v) is not Cartier at the vertex while 2D=div(u). Its regular resolution makes every Weil divisor Cartier. For a two-component semistable fibre meeting twice, the intersection matrix is [[−2,2],[2,−2]], with kernel generated by the whole fibre and negative restriction [−2] to one boundary component. The supplied relative pairing provides this missing surface input. The resolution alternative preserves the general excellent-Dedekind hypotheses and is explicitly permitted in moretbailly89 lines 114–118; it uses an earlier target, not a new restriction on primes or bases.

## Verification of the previous findings

Locations in this table are in packages/AdicCoefficientsAndComparisonsPartII/README.md unless stated otherwise. Each quoted repair was read at this head; the repair report alone was not treated as evidence.

| Previous finding | Status | Repaired passage and location | Recomputed witness |
|---|---|---|---|
| 1a/F01 | repaired | :416, “an isomorphism to Y_red over the dense open complement of the pairwise intersections” | For k[x,y,ε]/ε², the map to Y has kernel (ε), while the comparison to Y_red is identity; generic residue degree remains 1. |
| 1a/F02 | repaired | :1546, “smooth with relative snc boundary over each field component k′ of S′” | k=F_p(t), k′=k(t^(1/p)): X′=Spec k′ is smooth over k′, degree 1 over X; over k its geometric ring has a nonzero p-nilpotent. |
| 1a/F03 | repaired | Suggested.lean:127 and :137 state `analytic_uniformization` and `analytic_uniformization_residue`; README:1298, “Both fields are complete with nontrivial ultrametric norms.” | In the Gauss field H(T)=K, degree 1, integer map identity. K=k permits x=0 and ε=1. Four native definitions suffice; all hypotheses survive the supplied elaborated signatures. |
| 1a/F04 | repaired | :1184, “Zero-dimensional components impose no positivity condition” | Identity A¹ fibre is one point; normalization of xy=0 has two points over the node. Each line bundle there is ample. Contracted P¹ with 3 versus 2 special points has degree 1 versus 0. |
| 1a/F05 | repaired | :1035, “Consume ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6” | The supplier provides `qeResolution` and regular functoriality. Q[u,v,w]/(uw−v²) has embedding dimension 3 and dimension 2 at the vertex; the torus is regular. The separate overreach to non-log-regular sources is S01. |
| 1a/F06 | repaired | :72, “What SchemeAndStackFoundations must provide (gap:normalization-finite-field-identification)” | The same slug occurs in plan.json. Cusp normalization has ring k[t] and marked fraction field k(t); pinned reducedness/integrality alone does not furnish this identification. |
| 1a/F07 | repaired | :961, “Construct this boundary log structure only after verifying that Z is nowhere dense.” | (Spec F₂,Spec F₂) fails the predicate before the supplier call; axes still give rank 2 and dimension equation 2=0+2. |
| 1a/F08 | repaired | :1067, “Put N = exponent(G)” | C₃ gives N=3 and Z[1/3,ζ₃]; C₂×C₂ gives N=2 and Z[1/2]; G=1 gives N=1 and Z. |
| 1a/F09 | repaired | :436, “D is closed. Every maximal point of Y₁ maps to a maximal point of Y_red” | On uw=v² times A¹ with Z=V(v,w), Z∩Reg omits the singular line; the full inverse image includes its exceptional specializations and has dimension ≤2. |
| 1a/F10 | repaired | :195/:251 cite ilo14 lines 1158, 6782–6787, 7288; :1057 cites 3705; :476/:534/:646 cite temkin10 lines 679,742,679 | These anchors now locate maximal domination, alteration conventions, the sign-action example, pointed modifications, and valuative points respectively. |
| 1a/F11 | repaired | :1675, “Its specified surjection O^(N+1) → O^(d+1) defines the projection to P^d” | R⊕I over Z[√−5] has nonzero determinant class and is excluded as a framed quotient to R². The identity matrix has zero kernel and degree-one projection for N=d. |
| 1b/F01 | repaired | :1057, “Exposé VIII, §1.2 … (ilo14 line 3705)” | At the origin the sign action has inertia 2; blow-up gives one exceptional P¹. Line 7194 is retained only for X 3.1.5. |
| 1b/F02 | repaired | :104/:977 use temkin17 line 119; :989 uses line 126 | Section 1.2.7 begins at 119, and 126 introduces the closed-boundary log structure; cusp geometric stalk has infinitely many order-two indecomposables. |
| 1b/F03 | repaired | :476/:534/:646 use temkin10 lines 679/742/679 | These locate §3.2 and the valuative-point definition. A DVR model has points and stalks (generic,K), (closed,R). |
| 1b/F04 | repaired | :112, “Through gap:log-blowup-universal-property” | Unit and invertible ideals give identity; the empty ideal gives empty Proj. The universal property is explicitly conditional on its declared supplier gap. |
| 1b/F05 | repaired | :573, “continuous for the constructible topologies, without a finite-type hypothesis on f” | For Spec Z_(p), preimage of {V:1/p∈V} is {Q}, clopen in the two-point patch space. PA.1.7 now cites PA.1.5. |
| 1b/F06 | repaired differently, correctly | :1025, “The same contraction rule applies to strict morphisms” | The strict torus open misses the cone vertex; pulled-back ideal is the unit ideal and that step contracts to identity. The previous proposed claim that a strict pullback is already contracted was false. |
| 1b/F07 | partly repaired; external issue settled | :1713, “MotivesAndAlgebraicCycles §0.5c, `pAlterationSupport`, uses the perfect-field separable alteration of §PA.6.3” | The outgoing interface is now stated. MotivesAndAlgebraicCycles remains earlier and its ownership/ordering repair is outside this package. The repair report’s reason is valid; this is not re-raised. |

## Computed statement register

The following register covers all 64 numbered targets, the six bold analytic notions in PA.5.2a, the four additional definitions in PA.5.2b, and the boundary Picard theorem: 75 README entries. “Pass” means that the displayed instances do not refute the statement, not a substitute for its eventual proof. Variables in each context column retain the section's stated hypotheses. Empty inputs are tested only where the carrier admits them; fields exclude the zero ring, and analytic headlines exclude trivial norms. No integer degree is obtained by using the zero finrank of an infinite extension.

| Statement | Context | Instances and computed values | Result/change |
|---|---|---|---|
| PA.0.1 | Scheme; primes only | Q: ∅; Z_(2): {2}; Z: all primes; Z[1/6]: primes ≥5; zero ring: empty spectrum and all primes units; F_p[t]: {p} | Both directions of prime/unit criterion pass |
| PA.0.2 | Noetherian source/target | G_m→A¹: generic→generic; origin→A¹: maximal→nonmaximal; A¹⊔point→A¹: dominant but extra maximal point maps closed; empty source: zero maximal points | Predicate true,false,false,true |
| PA.0.3 | Noetherian schemes | Cusp normalization: finite degree1; Frobenius: degree p; P¹→point: fibre dimension1; A¹⊔point→A¹: extra vertical component; identity: degree1 | First two and identity alterations; other two fail |
| PA.0.4 | Alteration; P primes; ℓ prime | p=2,3 Frobenius: degrees2,3, inseparable; Z[i]/Z: degree2 separable, e₂=2; identity: support(1)=∅; t² over Q: degree2 but char-set∅; degree0 excluded | Prime support and separability independent; pass |
| PA.0.5 | Finite type; local-isomorphism/projective factorization | Doubled plane has two origins and local chart embeddings into P²; one-origin blow-up has two centres for exceptional DVR, obstructing separated local-isomorphism target; identity has two identity factors | Nonseparated example true, its composite blow-up false |
| PA.0.6 | qcqs base; qc open U; finite type qs; flat fp on U | Bl₀A²→A²: fibre P¹ at0, points elsewhere; after base blow-up strict transform is identity with all fibres points. Zero module: transform0, flat and fp | Pass; generality uses declared factorization contract |
| PA.0.7 | Finite type qcqs; finite generic-point set | Doubled plane: identity modification degree1 gives pseudo-projectivity; A²: identity then A²⊂P²; empty X: empty factorization | No separation hypothesis added |
| PA.0.8 | Regular noetherian ambient | Axes codimensions1,1,2; origin codim2; nodal irreducible cubic tangent dimension2 versus dimension1; three lines triple codim2≠3; empty set has0 components | SNC true,false,false,false,true |
| PA.0.9 | Universal quantifier over alterations and nowhere dense boundaries | Point: finite Artinian rings reduce to fields of degrees1; empty base: only empty Y; non-Japanese DVR: A′ infinite over A, hypothetical regular proper alteration forces A′ finite; {2}⊂{2,3}: 2^n allowed in both | Projective/proper senses distinguished; pass |
| PA.0.10 | qe, dimension≤1 | DVR: closed point already codim1; cusp: k[t²,t³]⊂k[t], equal fraction field; nonreduced finite point: residue field degree1 | Projective degree-one alterations suffice |
| PA.0.11 | qe, dimension≤2 | Square-zero plane: kernel(ε), comparison to reduction identity; closed point on regular surface blows up to P¹ codim1; A₁ charts k[u,v/u], k[w,v/w] regular; plane⊔axis boundaries P¹⊔point | Repaired reduction passage passes |
| PA.0.12 | Separated qe, dimension≤3 | Affine complete threefold: projective clause applies; doubled zero section in A²_Z: dimension3, separation false; A₁×A¹: full inverse boundary closed, dimension≤2; regular empty-boundary case identity degree1 | Repaired closed boundary passes; proper/projective distinction retained |
| PA.1.1 | qcqs pointed scheme Spec K→X | Closed F_p-point of Spec Z: tight model Spec F_p, proper but not onto Z; generic blow-up of A²: tight degree1; G_m→A¹ not proper; identity tight iff marked point schematically dominant | Pass |
| PA.1.2 | Pointed models; cofiltered locally ringed limit | Spec K: one point/stalk K; DVR: two points/stalks K,R; affine line: finite-place DVRs plus trivial valuation, infinity omitted; lex valuation on k(x,y): rank2 nonnoetherian stalk | Limit not confused with one noetherian model |
| PA.1.3 | Valuation subring plus specified centre | Q over Z_(p): two pairs; F_p: one valuation/centre; P¹: includes infinity; doubled origin: t-adic ring has two distinct centres | Forgetting centre loses data exactly in last case |
| PA.1.4 | qcqs pointed scheme | Point limit: singleton compact; DVR limit: two compact points, stalks R,K; doubled line: two points over same t-adic ring, both retained | Valuative bijection counts centred pairs; pass |
| PA.1.5 | Compatible pointed map; K⊂L | Z[i]_(1+i)∩Q=Z_(2); primes 2±i both restrict to Z_(5); L restricts to K; successive intersections equal direct intersection elementwise | Correct contravariant field direction; patch continuity includes localization |
| PA.1.6 | Finite-type pointed morphism | Identity sends each open U to U; Q(i)/Q: locus with2 invertible maps to Q and Z_(p), p≠2; point→point sends singleton to singleton | Open in spectral and patch topologies; no injectivity claim |
| PA.1.7 | Absolute field valuations and centred image | Val_Q={Q,Z_(p)}; Val_Fq={Fq}; Z[1/p] removes Z_(p); Q(i)/Q has fibres1 at2,2 at5; localization Z_(p) patch preimage of 1/p-condition is {Q} | Both centre/image conventions pass |
| PA.1.8 | Schematically dominant affine point | Z⊂Q: both limits {Q,Z_(p)}; DVR⊂K: both {R,K}; dual numbers→k has kernel(ε), fails schematic dominance | Claimed homeomorphism agrees on eligible inputs |
| PA.2.1 | Algebraic extension; henselization | Q(i)/Q at2:(e,f)=(2,1), wild; at5:(1,1), unramified; Artin–Schreier at t=0: v(u)=−1/p,e=p; trivial valuation on purely inseparable degree p: e1, residue inseparable degree p; identity: degree1 | Tame locus not determined by e alone |
| PA.2.2 | S⊂Val_L or prime set P | Empty S/P: true; Q(i)/Q at P={3}:true, {2}:false; char(Val_Q)=all primes; F₂(t¹ᐟ²)/F₂(t),P∅:true but no map Spec L→Spec Q | Characteristic qualification prevents false identification |
| PA.2.3 | Algebraic towers/composita in fixed closure | Q⊂Q(i)⊂Q(i,√3) at3: e1 then2, total2 prime to3; at2 first factor wild; identity factors give degree1; base-changing a separable extension to itself admits identity factor | Tower intersections and compositum containment pass; converse containment not asserted |
| PA.2.4 | Finite extension | Q(i)/Q: derivative2i unit away from2, tame/unramified locus excludes place over2; identity locus whole space; inseparable degree p locus empty | Whole and empty loci open; finite-presentation route retains minimal polynomial |
| PA.2.5 | Finite extension; constructibly compact S | Q(i)/Q, all valuations: K′=L′=Q(i), degrees2 and1; empty/tame-only S: K′=K, degree1; purely inseparable degree p: K′=L, top degree1 | Unrestricted distillation allows inseparability |
| PA.2.6 | Same, finite separable extension | Q(i)/Q gives separable degrees2,1; Artin–Schreier gives separable degrees p,1 for p=2,3; purely inseparable Frobenius fails input | Separable conclusion not inferred from prime support |
| PA.3.1 | Finite group action; noetherian for fixed-locus iff | Sign action: inertia2 at0,1 elsewhere; Z[i] at2:(D,I)=(2,2), at3:(2,1), at5:(1,1); free S₃ on6 F₂-points: inertia1; Gal(F_p²/F_p): (2,1); doubled-plane fixed axis specializes from inertia2 to1 | Residue kernel essential; nonabelian and small-characteristic cases pass |
| PA.3.1 fixed-locus clause | Same target, noetherian iff | Swapped two F₃-points: fixed locus∅ closed, specialization true; glued Spec(∏F₃): all specializations identities, fixed locus dense proper open U, not closed | Extra row records why noetherianness cannot be dropped |
| PA.3.2 | Integral alterations; Galois field condition | Z[i]/Z: degree2, G=C₂, wild at2; invert2: tame; Frobenius p=2,3: pure degree p, group1, Galois alteration but not separable; cube-root2: degree3, Aut1, not Galois | Distinct carriers pass |
| PA.3.3 | Integral alteration, finite generic degree | Z[i]/Z wild set{2}; modification∅; Frobenius{p}; t² over Q wild∅ despite degree2; T³−T−2 discriminant−104, local degrees1+2=3 over2 | Bound2≤3 holds, divisibility2∣3 fails as intended |
| PA.3.4 | Universally Japanese noetherian base; finite Galois X-tame extension | Invert2 in Z[i]/Z: identity modification, tame; retain2: inertia2 not unit, input false; trivial field extension over cusp: normalization k[t], degree1 | Normalization contract explicitly conditional; no new ownership claim |
| PA.3.5 | Separable extension; full preimage of valuation set | Q(∛2)/Q away from2,3: discriminant−108 unit, degree6 closure unramified there; empty set: both sides true; at3 wild on both sides | Full prolongation set matters; pass |
| PA.3.6 | Integral universally Japanese noetherian base | Z[i]/Z distilled with base degree2/top degree1; F₃ Frobenius with base degree3/top1; tame open Z[1/2] needs base degree1 | Supports {2},{3},∅ respectively |
| PA.3.7 | Same plus separable original alteration | Quadratic number-field and Artin–Schreier examples give separable degrees2 or p followed by1; Frobenius excluded | Pass |
| PA.4.1 | Reduced locally noetherian X, closed Z, nowhere dense before log construction | Axes:2=0+2; trivial log:dim=dim+0; whole F₂ point nowhere dense=false; cusp geometric stalk has infinitely many order2 indecomposables; Zariski F₂ cusp has4 generators but x absent/2x present; A₁:dim2,embedding dimension3,rank2; origin inA² codim2 | Definition/tests pass; stale supplier identifier S03 |
| PA.4.2 | Log regular fs; coherent ideal; qe for projectivity | Axes blow-up: y=xv,boundary xv=0; unit/principal:identity degree1; empty ideal:Rees positive part0,Proj∅; empty⊔unit retains one of two points; A₁ ideal(u,w):v²=u²s, saturation z=v/u,ring k[u,z] | Stalkwise nonempty hypothesis separates modifications from deletions |
| PA.4.3 | Fine torsion-free characteristics; extra log-regular conclusion | Strict origin map:0→0,r0; projection:N→N²,cokernelZ,r1; square map in char3:cokernelZ/2,not free-factor; torus pullback deletes vertex step; trivial-log cusp stays singular; log point P:A₁ fan pullback gives P¹→point | S01: geometric modification needs log regularity |
| PA.4.4 | qe log regular; tame generically free inertia-specializing action | Sign action: blow-up chart y=xv, x↦−x,v↦v; exceptional stratum fixed, inertia2 invertible; old trivial-log stratum action nontrivial | Very tame output, no false log-smoothness of original map |
| PA.4.5 | Equivariant log smooth chart; inertia order invertible | G1:N1,Λ=Z; C₃:N3,Λ=Z[1/3,ζ₃]; C₂²:N2,Λ=Z[1/2]; rank-zero chart has characteristic0 and smooth A¹; axes characteristicN² | Repaired exponent convention passes |
| PA.4.6 | qe log regular; G trivial on base; tame generically free | Axes/sign action quotient uw=v², boundaryv=0, log smooth toric pair; G1:quotient and modification identities; char2 nontrivial inertia2 fails invertibility | Admissibility retained for quotient |
| PA.4.7 | Regular SNC pairs; intermediate component union | Axes→point: delete one branch, rank2→1; delete both, ordinary A² smooth; xy=π: both branches vertical, cannot delete either | Required inclusion of full vertical boundary prevents false converse |
| PA.4.8 | Log smooth regular SNC source; field/trait base | xy=π:1↦(1,1),cokernelZ; π=ut^p:exponents(p,1),gcd1,cokernel torsion0 for p2,3; rank0 point case smooth | Unit coordinates and horizontal/total boundary distinguished |
| PA.5.1 | Flat fp multipointed curves; nodal/étale conditions | A¹,empty marks:identity stable; uv=π:node has2 branches; cusp tangent double line not node; exceptional rational tail degree−1 unstable; identity P¹ contracts0 components despite degree−2; elliptic+tail degrees1,−1 | Relative stability correct; duplicate dualizing construction S02 |
| PA.5.2 | Semistable modification; relative ampleness over original curve | Identity A¹:point fibre ample; normalized node:two zero-dimensional fibres ample; contracted P¹ with3 special points degree1, with2 degree0; one-tail degree−1 | Iff true on all three signs; repaired proof handles0-dimensional components |
| PA.5.2a umbrella | Analytic one-dimensional extension | Gauss(E,F)=(0,1); irrational radius(1,0); empty-disc intersection(0,0) with positive distance r; finite extension also(0,0) but algebraic | The six notions below distinguish type4 from algebraic |
| PA.5.2b | Three uniformization branches, with their separate hypotheses | Gauss H(T)=K,degree1; T+c with norm(c)<1 still degree1; type3 T² gives e2, not unramified; trivially valued separably closed k and t-adic k(t):x=t,degree1; k=K:x0,ε1 | Analytic clause is genuinely statable; two Lean headlines below |
| PA.5.3 | Integral qcqs base; normal for uniqueness | Rank2 valuation ring:identity proper/finite degree1, positive-first-coordinate ideal has no least value; DVR identity degree1; P¹→point generic fibre dimension1 excluded | Nonnoetherian scope preserved |
| PA.5.4 | Normal altered base; actions on curve and base | Already semistable input:lift(g)=g; uniqueness gives lift(gh)=lift(g)lift(h); g=h=1 gives identity | Coherence derived from uniqueness, not extra choices |
| PA.5.5 | Semistable curve; log regular base; smooth away from W | uv=π:1↦(1,1),torsion0; uv=0 over trivial field base violates smooth-off-empty-W; A¹ with no marks has rank0 and smooth map | Vertical boundary and generic smoothness essential |
| PA.5.5a | Smooth integral generic curve; constants normalization | Q(∛2)⊗Q Q(∛2) factors degrees1,2; after constants extension both degree calculations2; S₅ factors2,3 of degree5 not {5}-numbers; E=F_p(u¹ᐟp),L=F_p(u)(T):degree p=p; inseparable constants instead yield ε^p=0 | Constants reduction repairs arbitrary-base-change degree error |
| PA.5.6 | Smooth generic curve/étale marks; universal resolvability | S=Spec Z_(2)⊔Spec Q,X=A¹_Q,P∅:charS{2},charX∅,identity degrees1; smooth curve with étale boundary over field:identities; empty X:base still resolved independently | Full char(X) variant retained |
| PA.6.1 | Maximally dominating ft qe; prime/universal-resolution hypotheses | Regular SNC identity diagram:degrees1,W′=Z′; A²,Z={0}:identity with axes leaves inverse image codim2, blow-up makes exceptional divisor codim1; characteristic0 forces support∅ | Cartier reduction supplies exact boundary |
| PA.6.2 | Same, simultaneous induction | Alteration of A² with point boundary: after blow-up preimage P¹ codim1; field base degree1; empty X has only empty alterations | No circular use of inheritance to prove its own induction |
| PA.6.3 | Perfect field; p∈P when positive characteristic | F₂/F₃,A¹:identity degree1=2⁰=3⁰,separable; Frobenius degree p inseparable and cannot witness separable output; characteristic0 all finite field extensions separable | Pass |
| PA.6.4 | Finite type over low-dimensional qe base | Dual-number Q-point:reduction degree1,kernelε; X/Z has base dimension1 regardlessdimX; Z_p[[u,v]] base dimension3 gives proper clause; regular empty boundary identity1 | Dimension restriction belongs to base |
| PA.6.5 | Maximally dominating finite type; stated base bounds | F_p(t)⊂k′=k(t¹ᐟp):X′ smooth overk′, geometric nilpotent overk; perfectfield permitsbaseidentity; doubledline has local-isomorphism factor but separationfalse | Repaired altered-field smoothness passes |
| PA.6.6 | Source refinement; compositum-relative generic degree | F=Q,E=L=Q(i):absolute degree2 but relative [L:FE]=1; F=E=L:both1; source char∅ admits only relative degree1 | Two distinct degrees not conflated |
| PA.6.7 | Separated ft over field; ℓ invertible | F₃,ℓ2:3^n odd; smooth A¹ with one boundary point:identity degree1; char0 degree1; F₂,ℓ2 input fails2≠0 | All allowed primes included |
| PA.6.8 | Excellent regular dimension1 base; flat separated ft X | xy=p over Z_(p):Σ={p},vertical exponents(1,1),gcd1,horizontalempty; smooth family Σempty; isolated vertical X is nonflat and excluded | Flatness and total/horizontal boundary retained |
| PA.6.9 | Integral separated variety; ℓ invertible | A¹ with closed point:identity degree1,SNCpoint; P¹ with empty boundary:empty; pure field extensiondegreep is prime toℓ≠p | Smoothness is over altered constant field |
| PA.6.10 | Excellent henselian DVR, residue characteristic≠2; integral projective flat model | Identity degree1; degree2 acts0 on Z/2; degree2m+1 acts1; char3 pure degree3 is odd and inseparable | No spurious separability assumption |
| PA.6.11 | Algebraically closed field; faithful finite group action | P¹,G1,boundary{0,∞}:identity; C₂ action t↦−t:invariantsk(t²),fixed-field extensiondegree1; swapping axes:intersection nonempty so notG-strict; blow-up separates strict transforms | G-strictness distinguished from SNC |
| PA.6.11a | Excellent Dedekind(T); surjective irreducible, geometrically irreducible generic fibre | A¹_R:zero section degree1; Spec Z[1/2] misses2 and has no integral multisection; conic x²+y²=−1 gets point(i,0) overZ[i],degree2; pure Frobenius base degreep not identity | Existence/equivalence pass; proof allocation S05 |
| PA.6.11b | Global Dedekind; smooth locus dense on fibres; framed surjections | R⊕I overZ[√−5]:determinant class nonzero,C₂; framed R² determinant0; N=d:identity matrix,kernel0,empty centre,degree1; two components:nonétale images dimension≤d−1<d | Repair supplies actual targetP^d |
| PA.6.12 | Integral flat separated ft over global Dedekind base | P¹_Z:identity regular,Σempty; nodal xy=p chart:2 branches with exponents1,1; vertical isolated component violatesflatness; dim0 finite extension uses degree>0 rather than identity | Proper compactification/semistable clauses survive |

| Additional README statement | Context | Instances and computed values | Result/change |
|---|---|---|---|
| PA.5.2a analytic fields/types | Complete nontrivial real-valued ultrametric fields; one-dimensional extension separately | Q_p and C((t)):complete,height1; Q with p-norm:incomplete; trivial norm:height0; Gauss:type2,(0,1); irrationalradius:type3,(1,0); nested-discs:type4,(0,0),distance r>0; algebraicextension:(0,0),not one-dimensional | All five Checks distinguish carrier/type conditions |
| PA.5.2a splitness | Every T; approximation in fixed completed algebraic closure | Algebraically closed constants,GaussT:infima1=1; T∈k:0=0; type4:r=r>0 unattained; unramified quadratic α overQ₃:infima1≠0 | Splitness not reduced to value-group equality |
| PA.5.2a stability | Every finite extension, including inseparable | Unramified quadratic:e·f=1·2=2; F₂((t¹ᐟ²)):2·1=2; F₃((t¹ᐟ³)):3·1=3; identity:1·1=1; char0 residue exponent1 does not witness defect | Quantifier over finite extensions retained |
| PA.5.2a generator types | Nonconstant z; finite henselian unramified/tame extension over H(z) | GaussT:degree1,e=f1; unramifiedconstantsdegree2:e1,f2; irrationalradiusT²:e2,f1,degree2, tame overQ₃,wild overQ₂; z0 excluded and K/k infinite | Unramified versus tame distinguished |
| PA.5.2a special cosets | p>1,s>0 | b0:inf0,split; a0,b=t⁻¹,s=ρ⁻¹:infρ⁻¹,critical/special; F₂,a1,b1,s1:inf1,special; a=t,b=t⁻¹:infρ⁻¹,critical only; a0,s1:infρ⁻¹>1,notcritical | Five calculations hold for p2,3 where specified |
| PA.5.2a uniformization hypothesis | One-dimensional; two alternative branches | Algebraicallyclosed types2,3 satisfyfirstbranch; type4distancesr=r; completed p-root tower:modp Frobenius onto but residueF_p has unramifieddegree2; completed tameclosure:groupZ_(p),1/(pℓ) absent | Deep ramification alone and tame closedness alone both fail |
| PA.5.2b completedRationalSubfield | Native NormedField; completeness used only in results | H(0)=H(1)=k forcompletek; GaussH(T)=K degree1; irrationalradiusH(T²):value-groupindex2,degree2 | Real closure body fixes object; not an algebraic closure |
| PA.5.2b analyticIntegerInclusion | Ultrametric norm; H subfield | H=K:1↦1,t↦t; unramifiedquadraticQ₃:e1,f2,étale; F₂((t²))⊂F₂((t)):t²↦t²,e2,notétale | Literal inclusion excludes zero/unrelated map |
| PA.5.2b finiteUnramifiedOverCompleted | Finite field degree plus étale integer inclusion | K=k,x0:degree1,true; quadraticconstant Gauss:degree2,e1,f2,true; irrationalradiusT²:e2,false at2and3; x0 inGauss:infinite degree,false | Finiteness is separate; no totalized-finrank workaround |
| PA.5.2b residueConstants | Generated residue subfield of constants | K=k:allK̃; Gauss:k̃⊊k̃(T̃); type3:allK̃=k̃; reductionkernelon k°=k°° | Correct embedded field, not an arbitrary isomorphic residue field |
| PA.6.11a boundary Picard theorem | Dedekind(T); horizontal quasi-finite or vertical curve components; nilpotents allowed | E/F₅:y²=x³+x+1 has8affine+1infinity=9points; Pic⁰(P¹)=0 but O(1)degree1 infiniteorder; relative surface genericsection infiniteorder liesoutsidehypotheses; square-zerothickening kernelF₅,classeskilledby45 | All four Checks pass; exponent may depend onclass |

### Suggested.lean register and context audit

All declarations are in namespace TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII, Layer PA.5, at one arbitrary type universe. There are no standing section variables: every binder below is explicit. I compared all six supplied elaborated signatures with both the declaration text and PA.5.2b. No needed binder was lost; no signature was changed. The prohibition on Lean execution takes precedence over requesting a new scratch elaboration.

| Declaration (line) | Explicit variable/instance context | Computed positive/negative cases | Acceptance/padding result |
|---|---|---|---|
| completedRationalSubfield (93) | K:Type u, NormedField K; k:Subfield K; x:K | Completeconstants:H0=k; Gauss:HT=K; irrationalradius:HT² index2 | Needed real-bodied definition, not a theorem or admitted data |
| analyticIntegerInclusion (98) | K:Type u, NormedField K, IsUltrametricDist K; H:Subfield K | Identity1↦1; quadraticQ₃:f2; inseparableF₂Laurent:e2 | Domain is comap H.subtype of norm valuation ring; target is K°; no unmentioned completeness needed for the definition |
| finiteUnramifiedOverCompleted (109) | K:Type u, NormedField K, IsUltrametricDist K; k; x; local algebra explicitly from inclusion | H=K gives finite1∧étaletrue; T² gives finite2∧étalefalse; constantcoordinateinGauss gives finitefalse | Real predicate on native fields/rings, no free Prop field |
| residueConstants (118) | K:Type u, NormedField K, IsUltrametricDist K; k | Gaussimage=k̃,proper in k̃(T̃); type3image=K̃; k=Kimage=K̃ | Generated subfield equals residue image, with quotient map fixed |
| analytic_uniformization (127) | NontriviallyNormedField K, IsUltrametricDist K, CompleteSpace K; k:Subfield K; IsAlgClosed k, CompleteSpace k; hk:∃a,1<norm(a); ∃y,Module.Finite H(y) K | k=K:x0,ε1,all H(x′)=k; Gauss:xT,ε1,degree1; x′0 hasdistance1 and isoutside strictball | Deep existence/perturbation theorem; no one-tactic or single-library-lemma reduction found |
| analytic_uniformization_residue (137) | Same context/hfinite; x:K°; transcendental residue over residueConstants; separable extension over generated residue intermediatefield | GaussxT:transcendental,sepdegree1,conclusiontrue; x=T^p in charp:transcendental but sepfalse and e1/f_insep=p; k=K or type3:transcendencefalse | Genuine residue-coordinate headline; separability hypothesis blocks counterexample |

The two theorem signatures have exactly two `sorry` bodies. The four definitions have real bodies. There is one `import Mathlib`, no Tau Ceti import needed by these six statements, no `lemma`, `set_option`, admitted example or padding theorem. All six names occur in the README, and none of their fully qualified names occurs in the other searched roadmap Lean files.

The headline inventory is PA.0.6–0.7 and 0.10–0.12; PA.1.4 and 1.6; PA.2.5–2.6; PA.3.6–3.7; PA.4.2–4.6; PA.5.2, 5.2b(i)–(iii), 5.3–5.4 and 5.6; PA.6.1–6.12 including 6.11a–b. The module docstring accounts for these groups and distinguishes the two statable analytic clauses from the missing geometric constructions. The boundary Picard theorem is recorded as an intermediate target. Native line-bundle classes and Euler degrees do exist (TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70 and :126); this review does not claim those carriers are missing. Its normal-surface proof route has the separate ownership defect S05. No further statable headline was identified by object searches at the pins.

## Dependency, ownership and locator register

The check was run read-only against the supplied merge order and content checkout, with `--movable`. Exact output:

```text
depcheck: 188 roadmaps, 1233 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This does not allocate proof inputs omitted from Needs; S04 and S05 address those omissions. PA.6.1–6.3 use simultaneous induction rather than an edge importing their own conclusion. No incoming edge to any named downstream consumer was added. The already-settled MotivesAndAlgebraicCycles issue is recorded in the previous-findings table.

| Cited roadmap/current copy | Sections/objects resolved | Result |
|---|---|---|
| SchemeAndStackFoundations, main | §0.9; §§0.16–0.18,0.20–0.22; §1.17; §§2.4,2.6,2.11; §§3.3–3.4,3.6; §§4.11–4.20 | Current headings and stated generalities read. `.isNagata` is a planned name at README:1334, not a missing pinned theorem. `regular_map_completion` occurs at :1404. Integral nonnoetherian alterations at :6038 differ correctly from PA.0's noetherian generalization. S02 points to the pre-existing §2.20 owner; S05 adds §5.9. |
| ResolutionOfSingularitiesCharacteristicZero, supplied current roadmap | §§7.5–7.6, qeResolution and regular functoriality | Reduced noetherian qe Q-schemes, regular centres, preservation of regular locus and contraction of empty steps match. |
| LocalFieldsRamificationPartII, packages/LocalFieldsRamificationPartII/design/README.md | GF.0, GF.1, GF.2, GF.5, GF.6 and their named subtargets | P-number includes positive degree; full/separable closedness distinct; henselization/prolongations, étale criterion, tower/compositum, perfection comparison, Abhyankar and composition inputs present. The maximal separable extension remains explicitly contracted as a gap. |
| CrystallineCohomology, current roadmap | CR.5:log-algebra.1–4 | Charts, fs products, log smoothness, regularity and Abhyankar inputs found; arbitrary closed-boundary log construction is a declared gap. S03 removes a vanished identifier; S04 supplies missing source descent. |
| LefschetzPencilsAndVanishingCycles, current roadmap | §0.10 | Separated absolute/relative modification, logarithmic actions, very tame quotient and regular log blow-up resolution found. Extra local quotient and blow-up universal properties are declared contracts, not assumed existing declarations. |
| ClassicalAdicEtaleCohomology, current roadmap | §2.4 | Integral projective pointed A-models versus valuation rings containing s(A), spectral centre maps; no irrelevant cohomological vanishing imported. |
| StableReduction, main | Layers2–4 | Proper pointed prestable/stable conventions distinguished from relative stable modification; projectivity, Proj, blow-ups and proper dualizing statements found. General non-proper construction has the earlier owner in S02. |
| EtaleCohomologyFoundations, main | F.0.A1 | Decomposition/inertia on a finite Galois normalization requires normal integral locally noetherian base; PA.3.1's general action extends and compares this rather than silently changing its context. |
| AdicCoefficientsAndComparisons, current roadmap | Layer5 | Existing comparison/alteration use is retained; this Part II owns degree-controlled alteration geometry rather than replacing the base roadmap. |
| MotivesAndAlgebraicCycles, current roadmap | §0.5c pAlterationSupport | Actual characteristic-p alteration use located. External ordering issue remains settled under repair report 1b/F07. |
| LogicAndDefinabilityInNumberTheoryPartII, design README | §2.1 | Odd-degree regular model consumption found at :491–507 under the old supplier alias PrimeToDegreeAlterations; this is an outgoing interface, not an unresolved supplier. |
| EtaleDualityAndPerverseSheavesPartII, design README | EQ.0, EQ.2, EQ.6 | Its scope and supplier table explicitly import this roadmap's alteration theory; these are outgoing interfaces. |

Ownership searches used both `roadmaps grep` and object searches across main, Completed, board packages and the provided sibling heads. Matches for Rumely in arithmetic dynamics concern resultants/potential theory, not this integral-point theorem. Relative dualizing pairs gave the actionable overlap S02. Valuation restriction, affine invariant quotients, residue degrees and ordinary normalization are already assigned to their pinned owners. The analytic uniformization pair is owned here: neither a matching declaration nor the theorem on completed rational subfields was found in the searched pinned libraries or sibling roadmaps. The general monoidal functorial comparison extends the supplied existence resolution; it does not import a later roadmap.

The six gap slugs agree between design/plan.json and the exact supplier contracts: finite-type-fp-factorization; maximal-separable-p-extension; closed-subset-log-structure; very-tame-local-quotient; log-blowup-universal-property; normalization-finite-field-identification. Each has a named earlier supplier and concrete carrier/hypotheses. The linked clauses in the log contracts are construction/comparison laws on one shared object. None is reported merely because the supplier has not implemented it. The tests distinguish their scope: empty/unit log ideals; separably closed imperfect fields; non-fine cusp log structures; and non-Nagata normalizations whose finiteness is deliberately not asserted.

Pinned library checks used Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. In particular:

- Mathlib/AlgebraicGeometry/Noetherian.lean:277 defines IsNoetherian using local noetherianness and compactness, with no separatedness field.
- Mathlib/AlgebraicGeometry/Normalization.lean:215, :344, :353, :372 and :436 supply affine comparison, reducedness/integrality and the integral-target universal property; they do not supply the newly contracted normal/function-field conclusion.
- Mathlib/Topology/Spectral/ConstructibleTopology.lean:160 has compact, quasi-sober, quasi-separated prespectral hypotheses. Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:105 needs local finite presentation; PA.1.6's model reduction retains it.
- Mathlib/RingTheory/Unramified/LocalStructure.lean:376 requires a finitely presented algebra and an étale prime; this is not an arbitrary unramified algebra theorem.
- Mathlib/Topology/Algebra/Valued/NormedValued.lean:41–52 defines the norm valuation with IsUltrametricDist; Mathlib/Topology/Algebra/Field.lean:60 is actual topological closure; Mathlib/RingTheory/Valuation/ValuationSubring.lean:854 is actual inverse image; Mathlib/RingTheory/Etale/Basic.lean:205 requires formal étaleness and finite presentation, not finite field degree.
- TauCeti/AlgebraicGeometry/ResidueDegree.lean:47 and :65 give the tower law and positivity/finite equivalence. TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean:67–85 retains finite-type hypotheses for finite projection; integrality/surjectivity alone do not imply that stronger conclusion.

| Source | Distinct explicit source/line-reference groups checked | Text/locator coverage |
|---|---:|---|
| temkin17 | 47 | Introduction prime supports and main statements; §2.1.1; §§3.1–3.3; §4.1, Theorem4.2.1 and all §4.3 variants, through line1121 and following proof. In particular lines43,71,94,108,119,126,149,219,249,645–1126. |
| ilo14 | 50 | II1.1.2; VI1.2–1.9 and3; VIII1.1–1.2,2.3,3.1.19,3.3–3.4,5.6.1; X1.1–1.2,1.11,2.1/2.4 and3.1–3.5. Anchors include1158,3050,3126,3263,3705,4071,4451,4761,4847,4910,4967,5863,6149,6778,6790,6985,7194,7271,7345,7486,7561,7655. |
| temkin10 | 24 | Theorems1.1/1.2/1.5 andCorollary1.6; analytic definitions; Lemma2.1.6; Theorems2.1.8/2.1.10 and their proof routes; §3.2; §§6.1–6.3, especially Assumption6.2.1 andTheorem6.3.1. |
| dejong96 | 3 | §7.1–7.16,Theorem7.3; §8.1–8.8,Theorem8.2. Printed pages87–92; lines1406–1611. |
| cp19 | 2 | Theorem1.1,Corollary1.2,Remark1.4; lines93–132; separated/proper versus affine-projective distinction. |
| cjs | 2 | Theorems0.1/0.3 andCorollary0.4; lines43,77–142; excellent versus qe distinction. |
| dp23 | 1 | Proof ofProposition3.4, lines374–389; odd degree and no claim of separability. |
| jannsen16 | 1 | Theorem2.11, lines1052–1059, and its restriction/corestriction use through1080. |
| moretbailly89 | 7 | Lemma1.3,Theorem1.7,§§1.9–1.10,Theorem2.3,§§2.4–2.6 and§3/Proposition3.8; lines42–117,175–242,291–444. Extra local-Picard input checked at321–334 forS05. |
| stacks | 13 tags | 037J Fields:1718;04KV Varieties:528;020H Varieties:886;0C45 Varieties:4034;0BBS Resolution:488;0BGL:1752;0BGP:1880;0BI4:1918;0815 More on Flatness:4197;081R:4250;05K0 More on Morphisms:6247;052A Morphisms:2282;0AVK:6419. |

The count is 150 distinct explicit line-reference groups, with repeated occurrences counted once per distinct group and the Stacks chapter/tag pairs counted separately. Version-specific pagination is that declared in the README, not assumed identical to publisher pagination. The source errors below are separated from package findings: several are already corrected in the roadmap's statements and tests.

## Verified sound

Read 1,734 README lines and all 151 Suggested.lean lines; audited 6 declarations, 75 README target/definition entries (plus a separate row for the fixed-locus equivalence), 205 explicitly labelled Check bullets, 150 locator groups in 10 source works, and citations to 12 roadmap documents. Rechecked all 18 previous findings individually. The concrete values and limitations are in the registers above.

The repaired distinctions survive the boundary tests: reduction versus generic isomorphism; smoothness over altered constants; relative versus absolute stability; arbitrary-rank versus analytic valuation carriers; full versus separable prime-closedness; arithmetic degree versus degree after extending constants; projective versus proper resolution; and ordinary versus saturated log blow-ups. The two Lean headlines name the actual analytic objects and do not follow by the one-tactic padding probe.

The read-only diff against origin/main changes only packages/AdicCoefficientsAndComparisonsPartII: 11 tracked files, 3,586 insertions and 8 deletions at the reviewed head. No forbidden command, computational algorithm, admitted data definition or option override was found in the deliverables. The reviewed README, Suggested.lean and package metadata were unchanged; only this report and scratch notes were written.

## Not verifiable

- No new Lean elaboration or build was run, as prohibited. Binder verification uses the supplied six elaborated signatures and the pinned source text; this report does not claim a fresh build.
- The six declared supplier gaps remain conditional contracts. This audit verifies their declarations, ownership and scope, not implementation. S04 identifies an additional contract that is currently absent.
- The mathematical tables are explicit adversarial tests and source comparisons, not formal proofs of every theorem. In particular, absence of a counterexample is not a proof of the general theorem.
- Ownership against open work is limited to the supplied checkouts and the permitted roadmap index searches. Unprovided open revisions were not adopted as suppliers. The external MotivesAndAlgebraicCycles ordering repair remains outside this package and is not re-raised.
- All ten cited works were available through the supplied legal cache, including the additional Stacks chapter extractions in the manifest. No new missing-reference request is needed. Source readings certify the cited versions; no claim is made that subsequent publications silently repair the errata below.

## Source issues

- **Error** in temkin17 at §3.1.7, printed p. 115, line 762: the source says injectivity of forgetting the centre for one fixed pointed scheme characterizes separatedness; it should be only the forward implication from separatedness, unless all valuative tests are quantified; affects a stated result.
- **Error** in temkin17 at §3.2.4, printed p. 116, lines 791–792: the source says P-tameness always identifies with tameness over the indicated localization of Z; it should be qualified by characteristic zero or positive characteristic belonging to P, so the structural point exists; affects a stated result.
- **Gap** in temkin17 at Lemma 3.2.10, printed p. 117, lines 823–832: the source says the chosen monic polynomial from an étale presentation is the minimal polynomial; it should be replaced by the minimal factor, with integrality and derivative invertibility justified; affects the proof.
- **Misprint** in temkin17 at Lemma 3.3.7, printed p. 120, line 963: the source says the forward implication is immediate; it should be the reverse implication, by passing to subextensions; affects the proof.
- **Misprint** in temkin17 at Lemma 3.3.7, printed p. 120, line 966: the source says restricted valuations on the conjugate fields belong to S′; it should be S after identification with L; affects the proof.
- **Misprint** in temkin17 at Lemma 3.3.7, printed p. 120, lines 967–968: the source says the compositum of the conjugates is L and concludes tameness of L; it should be L′ in both places; affects the proof.
- **Error** in temkin17 at §1.2.7, printed pp. 99–100, lines 140–146: the source says branch exponents alone give the stated logarithmic smoothness criterion; it should be a chart criterion retaining unit coordinates, as π=ut^p has invertible torsion test despite vertical exponent p; affects a stated result.
- **Gap** in temkin17 at Theorem 1.2.5 and §4.3.2, printed pp. 99 and 124, lines 108–117 and 1107–1117: the source says the cited threefold resolution supplies universal projective resolvability for arbitrary quasi-excellent threefolds; it should be qualified by the available separated proper resolution, with projectivity justified separately; affects the proof.
- **Misprint** in temkin17 at proof of Theorem 4.2.1, Step 10, printed p. 123, line 1071: the source says the composite morphism is log regular; it should be log smooth; affects the proof.
- **Misprint** in temkin17 at proof of Theorem 4.2.1, Step 10, printed p. 123, line 1073: the source says the final log-smooth map targets (X,S); it should be the base pair (S,W); affects the proof.
- **Error** in temkin10 at §1.2, printed p. 2, line 95: the source says the two residues on the normalization of a node are equal; it should be that their sum is zero, giving residues (1,−1) for a dualizing generator; affects a stated result.
- **Misprint** in ilo14 at Exposé X §2.6, Step 3, printed p. 155, lines 7131–7133: the source says unit rank μ and sharp rank ν yield Z^ν⊕N^μ; it should be Z^μ⊕N^ν with those preceding assignments; affects the proof.
- **Gap** in ilo14 at Exposé X Remark 3.3.4(ii), printed p. 159, lines 7320–7322: the source says the cited Cossart–Jannsen–Saito theorem supplies resolution for quasi-excellent surfaces; it should be supplemented by the quasi-excellent surface route, since that cited theorem assumes excellence; affects the proof.
- **Gap** in ilo14 at Exposé X proof of Theorem 3.5, Step 3, printed p. 163, lines 7530–7532: the source says a closed inverse-image subset contained in an SNC divisor is a subdivisor; it should be made Cartier first, then identified with a union of boundary components; affects the proof.
- **Error** in cjs at Theorem 0.3, printed p. 4, line 100: the source says every embedded-resolution centre lies in the singular locus of the strict transform; it should be allowed in the boundary nontransversality locus too, even when the curve is regular; affects a stated result.
- **Error** in cjs at Corollary 0.4, printed p. 5, lines 131–134: the source says every reduced closed subscheme of dimension at most two can become a divisor under a surjective modification; it should be required to contain no ambient irreducible component; affects a stated result.
- **Gap** in dejong96 at §8.6, printed p. 92, line 1599: the source says a Grassmannian quotient gives a target identified with P^d over the Dedekind base; it should be a projective bundle unless a frame or sufficient further base extension is supplied; affects the proof.
- **Error** in moretbailly89 at opening of §3, printed p. 168, line 295: the source says the relative-dimension-zero case is automatically an isomorphism; it should be handled by finite radicial extensions too, such as F_p[t]⊂F_p[t¹ᐟp]; affects the proof.
- **Error** in ilo14 at Exposé X Lemma 3.1.3, printed p. 156, lines 7177–7180: the source says specialization-closed fixed subschemes are closed without stating a finiteness hypothesis; it should be restricted to the noetherian setting or supplied with the required constructibility hypothesis; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2996d961a661e1a949406ed0e15585750903c7be", "job": "RT-AdicCoefficientsAndComparisonsPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
