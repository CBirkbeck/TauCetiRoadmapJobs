# Repair report: CohomologyComparisonsPartII

## F01 (P2) — applied

Wrong full-domain `X_tr→X_K` → `U=X_tr∩X[1/p]→X[1/p]`, with coefficients on U and both projection comparisons updated in README and plan. Added `Syntomic.fontaineMessingPeriod_trivialLogPoint`. Structural V-morphisms identify this open with X×V K; canonical vertical log gives U=X_tr. Evidence: EN line 292–300, EN line 313–317, EN line 336–357. Trivial-log Spec(Z_p) has U=Spec(Q_p), not X_tr=Spec(Z_p).

## Verification and scope

The supplied review raises one new finding. Its historical F01–F06 entries describe completed repairs; they are not six additional requests. No supplier ownership, target signature, target prerequisite or existing declaration name changes here. The only design edits are the `nearby-cycle-inputs` detail and needs sentences and the new Check in §4.2, identically represented in `packages/CohomologyComparisonsPartII/design/README.md` and `packages/CohomologyComparisonsPartII/design/plan.json`.

EN §2.2, pp. 7–8, distinguishes the full trivial-log locus from its generic restriction at EN line 292–293 and supplies the projection/gluing comparisons at EN line 313–317 and EN line 336–357. Over W(k) the open is D(p). For a V-scheme, p=uπ^e implies D(p)=D(π)=X×V K. For a log morphism to canonical-log V, a point over the closed point receives the log element π with nonunit structural image; its log structure cannot be trivial. Hence U=X_tr on the unchanged domains of §§4.2–4.5. This proves that all three consumers of the gap still use the same maps.

Compared the shapes of `TauCetiRoadmap/GrothendieckEulerForms/README.md`, `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, and read EtaleCohomologyFoundations §§F.1/F.3a on main. Those sections provide the surrounding derived/trait vocabulary, not the log syntomic-étale contract; `gap:nearby-cycle-inputs` remains the declared missing supplier interface. Read the scope and searched the geometry/cohomology interfaces of ErdosProgressionPowers and ArithmeticDynamics; neither supplies this log-site theory. No prerequisite is reassigned or invented.

Verified the library pins against the content manifest and the available pinned checkouts: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched the objects as well as the design names and read the relevant pinned carriers. Cone coordinates remain an adapter to MathlibCone line 38–61; semilinear automorphisms remain MathlibPin line 77, MathlibPin line 117–143; exact-category structure, tensor exactness and opposite structure remain TauCetiExactReview line 245–267, TauCetiExactMonoidal line 48–57 and TauCetiExactOpposite line 150–155. The correction introduces notation for an open restriction, no competing carrier or library theorem.

All required texts are already represented by the source manifest and legally available cached extractions. `sources.toml` requires no change. Its settled uncertified BesserII entry is consumer context and supplies no premise to this correction. No reference request is outstanding.

## Adversarial mathematics pass

Each target row includes its defining conditions, named API and Checks. Results below record the instances and algebra inspected, not formal proofs or independent acceptance. Zero modules, empty schemes and identity maps are allowed; zero fields and equal-characteristic DVRs fail the standing hypotheses. Ramified classical inputs remain admitted even when the strong AM Frobenius-lift condition fails. Noncompact groups do not instantiate the specified profinite local-period groups; inseparable coefficient-field extensions are excluded by characteristic zero.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Base and scalar conventions | p=2,3; k=F_p; infinite perfect k; π²=p; zero ring | The AM modulo-p lift is impossible for π²=p: the difference has π-valuation 1. Classical producers impose no such lift. Fibres use Q_p-linearity. | None |
| Fibre signs and Tate conventions | Q —2→ Q; O(1)⊗O(−1); dlog t | Fibre differential is (da,f(a)−db); connecting representative is (0,b). Twists cancel and φ(dlog t)=p dlog t. | None |
| Generic and trivial-log conventions | Trivial-log and vertical-log Spec(Z_p); ramified V | Trivial-log X_tr includes the closed point; U does not. D(p)=D(π) with V-structure; vertical log excludes every closed-fibre point. | F01 |
| 1.1 FilFMIC and morphisms | Zero, unit, Φe=te on G_m, generic-only Spec(K) | Unit is horizontal; te is not, since dt≠0. Generic-only dagger realization is zero while the algebraic realization remains K. | None |
| 1.2 Tensor, dual and transport | Zero tensor factor; opposite twists; identity map; evaluation | Tensor filtration jumps and Frobenius exponents add. Dual evaluation cancels both; finite projective graded pieces preserve the hypotheses. | None |
| 1.3 Exact structure and Ext | Split extension; Ext¹(O,0); identity between different filtrations | Split classes are zero. The unequal-filtration identity fails strictness, so underlying exactness alone does not define a conflation. Tensor exactness uses locally split graded pieces. | None |
| 1.4 Connection fibre | O(0), O(1) at Z_p; zero object; multiplication 2 on Q | O(0) gives Q_p in degrees 0 and 1; O(1) only in degree 1. Multiplication 2 gives an acyclic fibre with positive f(a). | None |
| 1.5 Extension evaluation | Degree zero; split extension; Φe=e−h; disconnected base | Identity evaluates to 1, split to zero, and the displayed extension to (0,h). Using the distinguished 1 needs no connectedness assertion. | None |
| 1.6 Representatives and injectivity | Split extension; H=O(1), Φe=e+ah; H=O(0) | R=−ah. F⁰H=0 eliminates degree-zero coboundaries; without it the filtered lift can change by ch. | None |
| 2.1 Specialization diagram | Spec(V), empty scheme, Spec(K) over V | Specialization is id_K, zero, and K→0 respectively. No general specialization equivalence is inferred. | None |
| 2.2 Rigid syntomic fibre | Z_2 point, r=0,1; empty special fibre | At r=0, f(a,b)=(0,a−b). At r=1, f(a)=(a/2,a) has zero kernel and one-dimensional cokernel. Generic-only fibre is filtered de Rham. | None |
| 2.3 Products, descent and elimination | Identity bc; zero sp; G_m in weight 1; empty scheme | Eliminating the identity component requires no inverse to sp. (1−φ/p)dlog t=0. Empty cohomology and its products vanish. | None |
| 3.1 Divisible PD ideal | r=0; p=2,r=1; py=0 modulo p | Divisibility equality reaches p−1. The higher level is essential: division cannot be defined by an equation modulo p alone. | None |
| 3.2 Integral fibres and sites | r=0; zero A[0]→B[0]; empty scheme | The zero-map fibre retains H¹=B. Kernel replacement is confined to the syntomic site with the stated surjectivity. | None |
| 3.3 Error maps and cups | r=0; multiplication p on Z/p²; odd-degree products at p=2 | Composites are p^r; killed kernel/cokernel does not imply invertibility. No multiplicativity of τ is assumed. | None |
| 3.4 Completion and rational fibre | Horizontal point tower; r=0; tail direct-sum tower | Point completion is [Z_p→0 Z_p]. At r=0 the de Rham quotient vanishes. The tail tower has lim=0 but lim¹=product/direct sum. NN reduction assertions retain the arithmetic-pair domain. | None |
| 4.1 Modified lattices | p=2,r=2,n=1; r=0; r=p−1 | EN gives (1/8)Z_2(2), CN (1/4)Z_2(2); inclusion reduces to zero modulo 2. Alternative CN endpoints differ by p. Characteristic zero makes denominators nonzero. | None |
| 4.2 Period maps and supplier domain | Unit; r=0; nonproper scheme; trivial-log point | Closed nearby-cycle targets are retained. The wider supplier uses U=Spec(Q_p) at the horizontal point; vertical-log target inputs already have U=X_tr. | Added negative-control Check |
| 4.3 Small weights | p=2,r=0,1; p=3,r=1,2; t dlog t | Ranges are correct. Inverse Cartier gives [t^p dlog t], while [t dlog t]=[dt]=0. Undivided exactness does not follow from the p^r composites. | None |
| 4.4 Bounded comparison | xy=π^h with h>1; p=2,r=1; q>r | Ramified base-change charts remain included. Uniform n/X quantifiers and the p=2 dimension qualification remain separate; nothing is asserted above r. | None |
| 4.5 Gluing | Empty closed part; j′=id; r=0 | The open restriction is Rj′_*Λ, so empty closed part leaves that object. Under vertical log the repaired generic open and the target's X_K coincide. | Supplier notation corrected |
| 5.1 HK carrier and change law | Rank-one N=0; φ=diag(1,p), Ne1=e0; k[t]/t^m, m>1 | Nφ=pφN and e1↦e1+log(u)e0 agree. t↦t^p on the truncated polynomial carrier is not bijective; Cartier type is necessary. | None |
| 5.2 Total fibre | r=0; the two-dimensional HK datum; D=E=0 | N(1−φ/p^r)=(1−φ/p^(r−1))N makes d²=0. At r=0 the lower map is 1−pφ. Zero inputs give zero. | None |
| 5.3 Rational h-adapter | Identity refinement; p=2; r=0 | Identity transports identically. Rational periods retain τ≤r; rationalization alone does not remove truncation. | None |
| 6.1 Relative datum | Identity family; empty family; P¹_S | The data have respectively H⁰=O, all groups zero, and H²=O(−1). Construction of c does not assert arbitrary-open finiteness. | None |
| 6.2 Promotion | c=0 in rank one; bad Hodge graded piece; D(pt−1) over Z_p[t] | First two fail the stated hypotheses. Q_p[t,(pt−1)⁻¹] is not finite although its dagger realization is the base: independent algebraic conditions are necessary. | None |
| 6.3 Compactification predicate | Constant G_m family; no horizontal boundary; sections x=0,x=t | Constant examples qualify. At t=0 the colliding divisor has equation x²=0 in every characteristic and fails relative normal crossings. | None |
| 6.4 Geometric sufficiency | Constant curves, g=0 and g>0; G_m; p=2 | Proper ranks are 1,2g,1; G_m has H¹=O(−1). Algebraic Hodge and rigid finiteness remain distinct inputs. | None |
| 6.5 Affine acyclicity | Dagger A¹; dagger G_m; proper elliptic curve | Differential H¹ is 0 and K dlog t respectively; coherent H¹(O) on the proper elliptic curve is K. Affineness is indispensable. | None |
| 6.6 Residues and Ext | {0,∞}; quadratic étale boundary at p=2; empty boundary | Residues are (1,−1). The nonsplit rank-one trace-zero part has Frobenius −2. Proper empty-boundary H² survives and is outside the affine short sequence. | None |
| 6.7 Extension projections | n=0; G_m,n=1; split extension | Weight is n+1. G_m gives O(1) after twisting by 2, and the residue target twist drops by one. Split projections vanish. | None |
| 7.1 Point lifts | σ(t)=t^p at 0 and a; σ(t)=t^p+p | Compatible values are 0 and [a]. The perturbed zero lift is p modulo p², including at p=2; arbitrary t=p is incompatible with the unperturbed σ. | None |
| 7.2 Point detection | Zero module; constant 1; finite residue field | Zero rank is included. t^p−t vanishes at the finitely many Teichmüller points over F_p but is nonzero; algebraic closedness is essential. | None |
| 7.3 Specialization | Identity point; split extension; t=p; pullback of dt | Actual extension pullback preserves connecting evaluation. Differential pullback of a relative base form is zero; this differs from its cotangent-fibre value. The incompatible point fails the Frobenius equation. | None |
| 7.4 Horizontal log/rigid comparison | Point r=0,1; G_m; adding vertical log | At r=1 the horizontal point has H¹=Q_p; the vertical C_st point has H¹=Q_p². Their period contracts and producers remain distinct. | None |
| 7.5 Absolute extension value | Curve n=1,r=2; split extension; nonzero second filtered group | F² forms vanish on the curve. The connecting representative is (0,b). Both displayed filtered hypercohomology vanishings are needed for the isomorphism. | None |
| Crystalline supplier contracts | r=0; mod π versus mod p; proper versus arithmetic pair | `crystalline-inputs`, `crystalline-filtered-quotient`, `hyodo-kato-proper`, `arithmetic-pair-deformation` retain their distinct coefficient, properness and enhanced-domain hypotheses. | None |
| Rigid supplier contracts | Empty/generic-only input; horizontal versus vertical log; projective versus open family; nonsplit boundary | `rigid-realizations`, `rigid-log-crystalline`, `relative-rigid-coefficients`, `relative-rigid-projective-finiteness`, `relative-rigid-log-finiteness`, `rigid-gysin` retain their separate domains and trace/scalar compatibilities. | None |
| Period and nearby-cycle suppliers | r=0; p=2; horizontal point; ramified mod-p thickening | `period-rings` assigns no φ or N to B_dR. `nearby-cycle-cartier` and `nearby-cycle-graded` retain their restricted residue/weight domains. `nearby-cycle-inputs` needed the generic restriction. | F01 |
| Thirteen local-period contracts | r=0; p=2; identity field extension; ramified base-change chart | Radius inequalities, enough-roots hypotheses, finite-level exponents and dimension qualifications remain explicit. None is replaced by the desired all-weight conclusion. | None |
| Remaining supplier contracts | Split exact extensions; rank-zero realization; identity pair refinement; horizontal point | `exact-yoneda`, `relative-hodge`, `rational-descent`, `rigid-syntomic-etale-period` keep exact-category, geometric-finiteness, arithmetic-pair and horizontal-period requirements separate. | None |

## Check outcomes

- JSON and TOML parsing: PASS.
- Structural and agreement check: PASS; 7 layers, 33 targets, 121 API entries, 107 Checks, at least three Checks per target. Every API/Check name and every Check statement occurs in the README. All 53 internal target dependencies point backwards; all 31 gap details, needs and consumer incidence sets agree.
- Scope comparison against the original plan: PASS; only `nearby-cycle-inputs.detail`, `nearby-cycle-inputs.needs` and the single appended §4.2 Check differ. No target signature or prerequisite changed.
- Source availability: PASS; 21 records, 20 certified cached texts available, one settled uncertified consumer-context record. No new source or missing-source request.
- Lean elaboration: NOT RUN. This design has no `Suggested.lean`, and no Lean file is authorized for editing. The new Check involves log-site carriers absent from the pins; it remains a README/plan Check. There are no changed Lean binders or declarations to elaborate.
- `git diff --check`: PASS, exit 0.
- Prescribed dependency gate: PASS, exit 0. Exact output:

```text
candidate: CohomologyComparisonsPartII is not in the merge order yet; checked as if placed after CohomologyComparisons (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. EtaleCohomologyFoundations retains the existing supplier gap, now correctly formulated over its full W(k)-domain. No other roadmap needs a cited name changed, and no merge-order or ownership decision is requested. No commit or remote write was made.
