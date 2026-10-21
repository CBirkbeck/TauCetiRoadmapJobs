# Repair report: CohomologyComparisonsPartII

## F01 (P1) — applied

Rigid coherence plus bijective comparison → independent algebraic finiteness, actual Hodge-filtration and connection hypotheses in §6.2. §6.1 retains its full domain; §6.4 establishes all hypotheses on both geometric domains. Corrected relative-hodge and propagated hypotheses through §§6.6–6.7,7.5. Added the all-prime D(pt−1) negative control. Evidence: AM line 131–150, AM line 451–505, AM line 627–630; pole-order proof in the Check.

## F02 (P1) — applied differently

Unspecified rigid Gysin input → gap:rigid-gysin, owned by PadicDifferentialEquationsAndRigidCohomology and required in §6.6. Includes twist, Frobenius, comparison, trace and scalar extension. The general sequence retains H²(U); affineness gives §6.6’s final zero. Added the empty-boundary P¹ control: H²(U)=K0(−1). Evidence: AM line 595–607. The suggested unrestricted short sequence would fail for empty boundary.

## F03 (P2) — applied

Three bundled gaps → separate proper HK, arithmetic-pair deformation, coefficient realization, two geometric rigid finiteness and thirteen CN intermediate obligations. Each needs sentence states its domain and output; CN obligations carry numbered inputs. Updated prerequisite keys, supplier summaries and source records. Owners unchanged. Evidence: HK line 698–770; NN line 1341–1388; AM line 510–585; CN line 1453–1588, CN line 1998–2751.

## F04 (P3) — applied

Implicit de Rham carrier floor → exact global BDeRhamPlus and BDeRham declarations, file and binders under From Mathlib. The period-rings gap extends these carriers with filtration, comparison and fundamental-sequence mathematics. Legally fetched and recorded the pinned source as MathlibBDeRhamReview. Evidence: MathlibBDeRhamReview line 55–56, MathlibBDeRhamReview line 79–95. No reconstruction target added.

## F05 (P3) — applied

General h-descent/period locators → NN Proposition 3.18, p. 33 for the classical-pair equivalence, retaining the separate period locators. Updated §5.3, rational-descent, References and the existing NN manifest entry. Evidence: NN line 1688–1691 states the canonical quasi-isomorphisms on fine log-smooth Cartier-type arithmetic pairs for every r≥0.

## F06 (P3) — applied

Deleted the sentence describing the design’s production stage. Mathematical scope and the representative-signature policy remain. No Suggested.lean exists in this package, so no Lean signature, binder or example required editing; the allowed edit scope excludes creating one.

## Adversarial mathematics pass

The table covers each target’s statement, named API and defining conventions. “Consistent” records the mathematical checks below, not a formal proof or acceptance of the design. Geometric theorems with missing supplier sections remain conditional on their declared gaps.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Base and AM conventions | Zero ring; equal characteristic; empty chart; π²=p at p=2,3 | DVR/field hypotheses exclude zero bases and equal characteristic; empty coordinate rings remain allowed. The modulo-p Frobenius obstruction on ramified V is valid. | None. |
| Fibre and twist conventions | Map 2:Q→Q; zero map; O(1)⊗O(−1); φe1=p e1, Ne1=e0 | Fibre differential squares to zero; connecting image is +(0,b); twists cancel; Nφ=pφN fixes the lower exponent r−1. | None. |
| 1.1 FilFMIC | Zero/unit objects; nonhorizontal multiplier t; generic-only Spec(K) | The multiplier fails horizontality. Generic-only completion is zero, so only the de Rham realization is faithful. Finite locally free graded pieces imply projective realizations. | None. |
| 1.2 Tensor, dual and pullback | Twists −1,0,1; zero tensor factor; identity map; noncommuting lifts | Frobenius exponents and filtration jumps add; inverse-transpose gives the dual. Noncommuting lifts require coefficient transport. | Split coefficient transport from geometric finiteness. |
| 1.3 Strict exactness and Ext | Split extension; zero module; identity between different filtrations | Underlying exactness alone admits a nonstrict map; exactness on each filtration step gives the intended exact structure. Abelian Ext is insufficient. | Supplier key updated; exact-yoneda retained. |
| 1.4 Coefficient fibre | Point O(0), O(1), zero; d²(a,b) | O(0) gives Q_p in degrees 0,1; O(1) only degree 1. Transversality and horizontality make the displayed differential a chain differential. | None. |
| 1.5 Evaluation | i=0; split extension; Φe=e−h; disconnected base | Identity evaluates to 1; split class to zero; nonsplit point representative is +(0,h). No claim that all unit cohomology is Q_p. | None. |
| 1.6 Canonical projections | F⁰H=0; Φe=e+a h; split extension with F⁰H≠0 | Strictness gives the unique lift exactly under the vanishing; the remainder is −a h. Without vanishing the lifts differ. | None. |
| 2.1 Specialization | Integral point; empty scheme; generic-only scheme | Specialization is respectively identity, zero, and K→0. It need not be an equivalence. | None. |
| 2.2 Rigid fibre | V=Z_p, r=0,1,2; empty special fibre | At r=0 the diagonal kernel and first-component cokernel are Q_p. Positive weight has zero kernel and one-dimensional cokernel; generic-only fibre is F^rDR. | None. |
| 2.3 Products/descent/elimination | Point; G_m; zero complex; noninvertible specialization | Eliminating the identity component never inverts specialization. φ(dlog t)=p dlog t fixes the weight-one normalization. | None. |
| 3.1 Divided PD coefficients | r=0; p=2,r=1; n=1 | Higher-level division avoids nonuniqueness modulo p; r≤p−1 equality does not enlarge the exact period range. | None. |
| 3.2 Integral fibres | Weight zero; zero A[0]→B[0]; empty scheme | The fibre retains H¹=B, which an ordinary kernel loses. The syntomic-site kernel identification is scoped correctly. | None. |
| 3.3 Error maps/products | r=0; multiplication p on Z/p²; odd classes at p=2 | Both composites are p^r; killed kernel/cokernel does not imply invertibility. No division by 2 or multiplicative τ is needed. | None. |
| 3.4 Completion/rationalization | Weight zero; nonexact inverse limit; rational p^r | Rlim remains necessary; p^(−r)τ is the rational inverse of ω; quotient component vanishes at weight zero. | None. |
| 4.1 Tate lattices | r=0; p=2,r=2,n=1; r=p−1 | EN/CN generators 1/8 and 1/4 give inclusion coordinate 2, zero modulo 2. Endpoint choices differ by one p. Denominators are nonzero in Q_p. | Existing period-ring carriers cited. |
| 4.2 Periods | Unit; weight zero; horizontal boundary; nonproper scheme | Maps preserve the unit; trivial-log locus removes horizontal boundary. Nearby-cycle global sections cannot be identified with arbitrary generic cohomology. | Period-ring carrier contract clarified. |
| 4.3 Exact range | p=2,r=0,1; p=3,r=1,2 | Exact divided comparison permits only r≤p−2 and the ordinary lattice. The undivided map cannot inherit integral exactness through ω. | None. |
| 4.4 Bounded comparison | xy=π^h, h>1; p=2; q>r; roots inequality | Ramified base-change charts remain admitted; only q≤r is bounded. At p=2 retain dimension dependence. Radii satisfy pu=v, including u=3/4,v=3/2. | Thirteen independently specified CN inputs replace the bundle. |
| 4.5 Gluing | Empty closed part; identity generic inclusion; weight-zero unit | Open direct image remains when the closed part is empty; the generic restriction and unit agree. | None. |
| 5.1 Proper HK | Rank one N=0; rank-two N; non-Cartier thickening | Properness and Cartier type are essential. The positive exponential sends e1 to e1+log(u)e0. Non-Cartier Frobenius need not be invertible. | Proper HK contract separated. |
| 5.2 Total fibre | r=0; zero complexes; rank-two datum; nonproper interior | N(1−φ/p^r)=(1−φ/p^(r−1))N; at r=0 the lower arrow is 1−pφ. Proper cohomology alone does not supply the enhanced pair triangle. | Arithmetic-pair deformation gap separated. |
| 5.3 h-adapter | Identity presentation; p=2; r=0; pair versus general variety | Classical-pair map needs the precise pair theorem; general periods stay truncated even rationally. | Added Proposition 3.18 locator. |
| 6.1 Unpromoted datum | Identity; empty family; P¹; U=D(pt−1) | All four data exist. P¹ has H²=O(−1). The open immersion has nonfinite algebraic H⁰ although its rigid realization is the unit. | Removed geometric finiteness input from this full-domain construction. |
| 6.2 Promotion | Identity/zero; c=0; nonfree Hodge graded piece; D(pt−1) at every p | The dagger inverse converges on 1<ρ<p; algebraic denominators have unbounded pole order. Thus AM Assumption 2.20 cannot imply algebraic finiteness. Explicit hypotheses suffice directly by 1.1. | Added independent actual-module hypotheses and negative-control Check. |
| 6.3 Compactification | Constant G_m; empty horizontal divisor; colliding sections | Both total and relative normal-crossings conditions matter; collision at t=0 violates the latter. No existence assertion for every family follows. | None. |
| 6.4 Sufficient domains | Constant genus 0 and 1 curves; G_m; p=2 | Proper ranks are 1,2g,1; G_m has unit and O(−1). Proper/logarithmic algebraic realization supplies finiteness separately from rigid coherence. | All §6.2 algebraic conclusions made explicit in both domains and APIs. |
| 6.5 Affine acyclicity | Dagger affine line; G_m; proper elliptic curve | Integration of overconvergent affine-line forms stays overconvergent; dlog survives on G_m. Proper elliptic H¹(O) excludes the unrestricted smooth case. | None. |
| 6.6 Residues | P¹ with 0,∞; nonsplit finite étale boundary; empty boundary | Residues are 1,−1 and Gysin is componentwise trace; target Frobenius acquires p. Empty boundary on P¹ retains H²(U), so the general sequence cannot end prematurely. | New rigid-gysin gap and empty-boundary Check; full §6.2 hypotheses retained. |
| 6.7 Extension projections | Split extension; n=0; G_m,n=1 | Split projections vanish. H¹(G_m)(2)=O(1), with residue landing in boundary twist 1; vanishing hypotheses give unique coordinates. | Propagated independent algebraic conditions. |
| 7.1 Frobenius points | Residue 0,1; Teichmüller lift; t=p; σ(t)=t^p+p | Teichmüller lifts commute; t=p fails for t^p. For the perturbed lift the fixed value is p modulo p², including p=2. | Coefficient key updated. |
| 7.2 Section detection | Rank zero; constant 1; finite residue F_p | Reduction and Nullstellensatz detect sections over algebraically closed k. The section t^p−t vanishes at the finite Teichmüller set but is nonzero. | None. |
| 7.3 Specialization | Identity point; split extension; t=p | Actual extension pullback respects evaluation. Pullback of a relative differential to the point is zero; cotangent-fibre evaluation is different. Wrong Frobenius points do not give the asserted representative. | Coefficient key updated. |
| 7.4 Horizontal-log comparison | Point r=0,1; G_m; added vertical log | Horizontal-log point has H¹=Q_p at weight 1; canonical vertical log gives the three-term semistable complex with H¹=Q_p². No identification across these log structures is made. | None. |
| 7.5 Absolute value | Curve n=1,r=2; split extension; missing filtered vanishing | F²Ω•=0 on a curve gives the connecting isomorphism with positive fibre sign. Without the two filtered hypercohomology vanishings an inverse need not exist. | Family specialization retains all corrected §6.2 conditions. |
| Supplier carriers and new gaps | Characteristic-p R; nonunit p; empty boundary; proper versus nonproper; n=1 | BDeRham carriers can degenerate for characteristic-p R, so no field/filtration theorem is inferred from their existence. General Gysin retains H²(U). Derived reduction of a p^a cohomology-error bound permits p^(2a). | No carrier reconstructed; domain-specific intermediate contracts retained. |

## Verification outcomes

- Dependency check: exit 0. Exact output:

  ```text
  candidate: CohomologyComparisonsPartII is not in the merge order yet; checked as if placed after CohomologyComparisons (the intake inserts it when its design is accepted)
  depcheck: 3 roadmaps, 12 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line. The candidate and order arguments were `packages/CohomologyComparisonsPartII/design/README.md` and `merge-order/ORDER.txt`.
- JSON/TOML parse: PASS; 33 targets, 27 unique gaps, 14 sources, 104 Checks.
- README/plan statements, hypotheses, API, Checks, gap needs/sections and bidirectional neededBy: PASS.
- All target prerequisites point earlier; definition Checks ≥3; obsolete gap keys and stage sentence absent: PASS.
- Machine-path scan and authorized-file diff: PASS. `git diff --check`: exit 0, no output.
- Lean elaboration: NOT RUN. No Suggested.lean exists and the brief authorizes no executable Lean invocation. No build result is claimed.
- Source access: the new pinned Mathlib source was fetched through the sources service under its open-repository licence, then read at the pinned commit. Its initial licence-class lookup failed; the successful certified fetch resolved that entry. No missing text remains. Existing operator-held/open texts were read from the supplied cache; BesserII remains the settled uncertified consumer-context citation.

## Maintainer consequences

The edited deliverables are `packages/CohomologyComparisonsPartII/design/README.md`, `packages/CohomologyComparisonsPartII/design/plan.json` and `packages/CohomologyComparisonsPartII/sources.toml`, together with this required report. No target, layer or theorem/API name was added, deleted or renamed. Two new Check names are `RelativeCohomology.filteredFrobeniusRealization_genericDivisor` and `RelativeCohomology.residueSequence_emptyBoundaryControl`.

The internal gap keys `hyodo-kato-inputs`, `relative-rigid` and `local-period-analysis` were replaced. Their replacement keys and consumers are explicit in the plan: proper HK serves §5.1, enhanced deformation serves §5.2, coefficient realization serves its previous coefficient consumers, geometric rigid finiteness serves §6.4, and each CN input serves §4.4. `rigid-gysin` serves §6.6. Supplier ownership and merge direction did not move.

CohomologyComparisons must supply relative-hodge on the stated geometric domains, rather than on every family satisfying AM Assumption 2.20. Consumers using §6.2, §6.6, §6.7 or the family part of §7.5 must establish the additional algebraic hypotheses; §6.4 provides geometric sufficient targets. Implementing another roadmap’s missing supplier theorem remains outside this package. These declarations record gaps and do not claim accepted supplier sections or implementations.

For form, read GrothendieckEulerForms and RigidAnalyticGeometry on main, and checked the relevant AdicSpacesPartIV sections. The absent base and rigid/crystalline supplier sections remain explicit gaps. Read the scope of the open ErdosProgressionPowers and ArithmeticDynamics roadmaps at their identified heads; neither owns an interface needed by these repairs. The pins match the content manifest. The cached cone, isocrystal, abelian Ext and Tau Ceti declarations confirm the existing carrier boundaries; the new period-ring citation adds no duplicate construction. No fetched text was treated as an instruction. No commit, push or GitHub write was performed.
