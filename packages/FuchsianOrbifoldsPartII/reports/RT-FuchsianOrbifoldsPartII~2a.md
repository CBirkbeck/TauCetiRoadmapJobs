<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1236#issuecomment-6426242271 -->
Red team round 2 pass a (codex) of 5d5e082

Verdict: accepted

No new package finding. The acceptance is conditional on the four declared supplier contracts, as permitted by the brief.

## Round-one findings: repair verification

| Earlier finding | Status | Repaired passage and location | Independent witness |
| --- | --- | --- | --- |
| Pass a F01: point-removal input attributed to arc-removal supplier | Repaired | packages/FuchsianOrbifoldsPartII/README.md:103: “Removal of isolated lifted cone points is not an L4 input”; packages/FuchsianOrbifoldsPartII/README.md:51 and :536 name `Complex.differentiableOn_update_limUnder_of_bddAbove`. packages/FuchsianOrbifoldsPartII/README.md:532 supplies bounded Cayley-disc coordinates. | Mathlib/Analysis/Complex/RemovableSingularity.lean:100 requires neighborhood, punctured holomorphy and bounded norm. The punctured-disc identity has norm <1 and extends with value 0. Open mapping excludes a unit-circle value for a nonconstant extension. |
| Pass b F01: three independent contracts bundled in one gap | Repaired | packages/FuchsianOrbifoldsPartII/README.md:79, :81, :83 respectively say “every narrow class has a primitive reduced minus period”, “corresponding to multiplication by the least unit ε_D>1 of norm +1”, and “including the √D sign correction for a negative leading coefficient”. | `packages/FuchsianOrbifoldsPartII/design/plan.json` has matching slugs, needs, supplier and section. The fourth gap is unchanged. Consumer lines 291, 355, 369, 584, 682, 698 and 726 use the corresponding contracts. |
| Pass b F02: missing locators in §§3.1–3.3 | Repaired | packages/FuchsianOrbifoldsPartII/README.md:496: “the source does not double”; :528: “the lift through the double replaces the source's nearest-boundary-point argument”; :546: “the height normalization replaces the source's ordering”. | DIT16 line 164 concerns genuine boundary geodesics; lines 387–405 concern class recovery and selected-lift distances. All three locations are now explicit and distinguish the roadmap's new proof routes from what the source proves. |

The repair report marks no finding “not actionable in this package”. No settled finding is re-raised. The new point-removal passage retains the needed local nonconstancy, supplied by the two inverse covering lifts. The split gaps retain the standing positive fundamental discriminant and primitive-period hypotheses. These repairs introduce no mathematical error in the reviewed targets.

The repair report itself has an incorrect numerical verification: for [4,4], `(T⁴S)²=[[15,−4],[4,−1]]`, of trace **14**, not 194. Its eigenvalue is `(2+√3)²=7+4√3`, with eigenvalue plus inverse equal to 14. The exclusion of this repeated period from the primitive Pell contract remains correct; neither reviewed target file contains the incorrect number.

## Verified sound

Dependency gate, run on the unchanged packages/FuchsianOrbifoldsPartII/README.md:

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Head is 5d5e082. The base-to-head diff touches only `packages/FuchsianOrbifoldsPartII/`.


All 819 README lines and 103 Suggested.lean lines were read. The inventory is **8 Lean declarations** (3 definitions, 5 theorems), **28 numbered target sections**, **28 target locator blocks** checked against the three cached legal texts, **60 Check bullets** in 18 blocks evaluated below, and **12 roadmap supplier contracts** resolved at eligible versions. There are no bold mathematical target titles: bold text marks the summary, Checks and reference keys; the 28 numbered headings are the target inventory.

The two library hashes match `lake-manifest.json`. All eight own Lean names occur in the README. The only imports are `Mathlib` and the existing Tau Ceti projective-action module. There are no section variables to lose, arbitrary topology/measure parameters, admitted data, empty condition fields, `lemma`, `set_option`, executable algorithms, pull-request numbers or process history in the two reviewed files. The supplied elaborated signatures were compared individually with the source and README; no binder or generality change is needed.

**Lean declaration/context and adversarial table.** Every declaration is in `TauCetiRoadmap.FuchsianOrbifoldsPartII`. All instance arguments are the native ones inherited from ℕ, ℤ, ℝ, their projective matrix groups, UpperHalfPlane and its invariant volume. There is no `variable` or `include` block.

| Declaration; section; location in `packages/FuchsianOrbifoldsPartII/Suggested.lean` | Complete explicit context | Computed instances, including both sides | Result; change |
| --- | --- | --- | --- |
| AdmissibleCycle; Layer 1; 34 | n : List ℕ | [], [0], [1], [2], [2,2] → false; [3], [3,2], [4,4] → true. The last has length 2 and sum 8 although not primitive. | Matches §1.1; none |
| cycleGroup; Layer 1; 39 | n : List ℕ; Subgroup PSL₂(ℤ) | [] generates {1}, hence ⊥. [0] generates ⟨S⟩. [1] generates ⟨S,T⟩. [3,6] gives T⁹, S, [[3,−10],[1,−3]], whose square is −I before passage to PSL. | Total raw definition matches prose; none |
| cyclePolygon; Layer 1; 49 | n : List ℕ; Set UpperHalfPlane | [] gives x=0,y≥1, not ℍ. [3,2] has centres 0,3,5, width 5, gaps of lengths 1,0. At y=2, each squared distance is ≥4≥1. k=length includes centre m; no out-of-range access. | Matches §1.2; none |
| cyclePolygon_fundamentalDomain; Layer 1; 56 | n; hn : AdmissibleCycle n | [4]: T⁴(i)=4+i, both on boundary; ties have area 0. [] polygon has area 0 and cannot cover ℍ, but hn=false. At [3,2], tangency is at height 0, outside ℍ. | Native a.e. fundamental domain fits the closed polygon; none |
| cycleGroup_presentation; Layer 1; 65 | n; hn; ∃ marked multiplicative equivalence ℤ*(C₂)^*length ≃ Γ(n) | [4]: +1↦T⁴, sending i↦4+i, whereas −1 sends i↦−4+i. [4,4]: SS₁=[[-1,4],[4,−17]], S₁S=[[-17,−4],[−4,−1]], unequal up to sign. | Nonabelian marked presentation retained; none |
| cycleGroup_cuspStabilizer; Layer 1; 81 | n; hn; equality of ambient subgroups | [4] gives 4ℤ=4ℤ; [4,4] gives 8ℤ=8ℤ, despite maximal-height set 4ℤ+i. The full stabilizer, not its inclusion alone, is asserted. | Both inclusion directions have substantive normal-form content; none |
| cycleGroup_infiniteIndex; Layer 1; 88 | n; hn; natural-valued index | [4]: positive-width shallow strip has area ∞; finite index d would give dπ/3<∞. Native infinite index is 0. [1] instead has index 1 and hn=false. | No zero-finite-index interpretation; none |
| cycleGroup_conj_iff_isRotated; Layer 3; 97 | n,n′; hn,hn′; ∃ φ : PSL₂(ℝ); injective subgroup images | [3,6]/[6,3]: translate centres by −3 modulo 9 → {0,6}; both sides true. [4]/[4,4]: widths 4≠8; both false. [3,4,5]/[5,4,3]: equal width 12 and trace 48 but cyclic gaps differ; both false. | Repetitions and orientation handled; none |

The five admitted theorems do not restate their definitions or follow from one pinned lemma without proving new geometric hypotheses. The presentation needs ping-pong domains and markings; the full cusp equality needs a normal form; infinite index needs the infinite-area argument; conjugacy needs cusp and elliptic-height normalization. No padding declaration is present.

**README target table.** Each row covers the target, its API and its proof route. Numerical probes supplement, rather than replace, the mathematical argument. The following Check table records every displayed Check separately.

| Target and README location | Instances and values on each side | Result; change |
| --- | --- | --- |
| §0.1 limit set, 123 | {1} and ⟨S⟩: finite orbits, Λ=∅. ⟨T⁴⟩: Λ={∞}. diag(2,1/2): Λ={0,∞}; conjugating by T gives {1,∞}. Modular group: Λ=entire ideal circle. Cayley(iy)=(y−1)/(y+1)→1. | Basepoint independence, closedness, endpoint inclusion and first/second-kind distinction agree; none |
| §0.2 hull and core, 152 | With complementary interval through ∞ and endpoints −1,1, retained half-plane is x²+y²≤1: i/2 gives 1/4≤1, 2i gives 4>1. S exchanges sides, so its boundary fixed point cannot be a core-boundary cone. Modular hull is ℍ, boundary count 0. | Away-side convention, nonempty interior and half-disc charts agree; none |
| §0.3 geometric finiteness, 180 | Modular core: s=1,t=0, area π/3. Γ([4]): s=t=1, core area π, full area ∞. Cyclic parabolic: one limit point and area-zero hull, excluded. Finite triangle signature (0;2,3,7;0;0) has area π/21. | Torsion and both kinds covered; finite generation retained; none |
| §0.4 signature and B, 194 | (0;2,3;1;0) → π/3; (0;2 repeated ℓ;1;1) → πℓ; pants → 2π; punctured sphere → −2π, excluded. Doubling pants gives genus 2 and B=4π=2·2π. | Capped genus, cone multiplicity and +s,+t signs agree; none |
| §0.5 Gauss–Bonnet, 221 | ℓ=1,2,5 gives cone defects 1/2,1,5/2 and B=π,2π,5π. Triangle defects 1/2+2/3+6/7 give 2π/42=π/21. Boundary representatives cancel, actual circles remain. | Area is positive/finite on the stated signatures; none |
| §0.6 primitive boundary, 235 | T⁴S has trace 4, eigenvalues 2±√3, length 2log(2+√3). Its square has trace 14 and twice the length. T has trace 2 and one ideal fixed point, hence no axis. | Primitive funnel, cusp and repeated traversal distinguished; none |
| §1.1 cycle group, 259 | []: m=0, Γ=1; [0]: Γ=C₂; [1]: Γ=PSL₂(ℤ); all three inadmissible. [3,2] admissible with m=5. Sₖ²=−I in SL and 1 in PSL, Sℓ=T^mS₀T^−m. | Totality, projective orders and primitive specialization agree; none |
| §1.2 polygon, 293 | [4]: free interval (1,3), length 2. [3,2]: lengths 1,0; tangent at 4+i0. [3,6]: i,3+i,9+i on circles; T⁹i=9+i. For Y>1 every unit-disc exclusion is automatic. | Closed/measurable convex region and split side pairings agree; none |
| §1.3 tiling/presentation, 321 | [4]: ℤ*C₂, one cusp and one funnel. [4,4]: ℤ*C₂*C₂, width 8; factors do not commute. In [3,2], S₁ sends ideal tangency 4 to 2, a free-interval endpoint, rather than closing a new cusp cycle. | Normal form and topology agree, including digit 2 and repeated lists; none |
| §1.4 rotation, 341 | [3,6]→[6,3]: {0,3}−3 mod 9={0,6}; adding 3 instead gives {3,6}. T⁻³ is integral, so π_mod(T⁻³z)=π_mod(z). r=0 gives identity conjugacy. | Sign and over-M comparison agree in both directions; none |
| §1.5 Pell word/endpoints, 357 | [3,6] gives [[17,−3],[6,−1]], det 1, trace 16. Roots (3±√7)/2; 6w−1=8+3√7>1, derivative (8+3√7)⁻²<1. Endpoint pairs ≈(.177,2.823),(3.354,8.646) satisfy the displayed inequalities. | Attracting direction and minimal norm-one unit use declared contract; none |
| §1.6 second kind/index, 371 | [4]: point 2 lies in free interval and outside Λ; shallow-strip integral contains ∫₀^εy⁻²dy=∞. Modular area π/3 gives finite-index contradiction. T⁴ fixes ∞ and S moves ∞ to 0; further translates supply >2 limit points. | Second kind proved independently of infinite index; none |
| §2.1 finite cuts, 395 | [4]: z=1/2+√3 i/2, γz=7/2+√3 i/2, final crossing is the endpoint. [3,6]: first crossing 5/2+√3 i/2, S₁γz=17/2+√3 i/2, then T⁻⁹S₂ returns z. | Ordered finite arcs, one primitive traversal and left-side orientation agree; none |
| §2.2 arithmetic comparison, 423 | D28 principal: area 2π versus π/3 downstairs. Retained circle radii √7/2,√7 have maximum heights <3. At 3/2+6i/5, Ford inequalities hold but 36/25<7/4 excludes the core. | Proper map counts overlapping sheets; height-one cutoff rejected; none |
| §2.3 lift spacing, 453 | V(0)=0; V(2)=1.762747…, cosh=3; V(4)=2.887271…, cosh=9. V(−2)<0 whereas arcosh(3)>0, explaining x≥0. In Γ([4]), dist_quot(i,4+i)=0 while lift distance V(4)>0. | Total arsinh definition and comparison domains agree; none |
| §3.1 double, 490 | (0;2;1;1) doubles to (0;2,2;2;0), area 2π. Pants doubles to genus 2, area 4π. At t=0 there are two components, excluded. Reflection squared is identity. | Signature, completeness and marked cone multiplicity agree; none |
| §3.2 conformal lift, 522 | Identity equivalence has identity based lift. In u↦u², a lifted loop projects to twice the meridian, giving subgroup 2ℤ. Inverse punctured lifts extend with value 0 at the cone lift. Im(az+b)=a Im z with a>0. | Range inclusion comes from meridian powers, and half stabilizers recover original groups; none |
| §3.3 maximal elliptics, 538 | S(3+i)=−3/10+i/10. Equality denominator 1 forces (c,d)=±(0,1) or (±1,∓Nₖ); denominator 0 would force c=d=0, contradicting det 1. [4,4] highest set 4ℤ+i but cusp width 8. | Exact subgroup equality cases and nonidentity fixed-point witness agree; none |
| §3.4 rigidity, 564 | Affine lift scales maximal height 1 to a, so a=1; cusp widths then match. [3,6]/[6,3] both true; [4]/[4,4] both false. Reversed [3,4,5] has same trace 48 and width 12 but different cyclic gaps. | Both iff directions retain orientation; arithmetic conclusion conditional on invariant gap; none |
| §4.1 modular convention, 596 | i included though not in fdo; −1/2+2i included and +1/2+2i excluded. Difference has area 0. μ(∅)=μ({π(i)})=0, μ(M)=π/3. Discrete deleted lift set permits compact-path detours. | Half-open convention, nullity and regular-locus path connectedness agree; none |
| §4.2 pushforward, 628 | D28 principal ν(M)=2π, exceeding μ_mod(M)=π/3. Reciprocal D5 has ℓ=1,m=3 and ν=3μ_mod, total π. Borel empty preimage gives ν(∅)=0. | Pushforward counts sheets; integral-map hypotheses retained; none |
| §4.3 probability, 656 | D28 family {I,J}: L=7, total mass 7π, normalized weights 2/7,5/7; empty family has mass 0, excluded. Disjoint masses πL,πR give weights L/(L+R),R/(L+R). | Positive denominator and native square cosets agree; none |
| §4.4 complementarity, 684 | D12: π+2π=9·π/3; widths 4+5=9. D28: 2π+5π=21·π/3; widths 9+12=21. At A=ι(A), equation is 2ν_A=6ℓ_Aμ_mod. | Oriented multiplicities cancel, including reciprocal/retraced arcs; none |
| §4.5 exact covering, 700 | In additive C₄ with J=2, ι exchanges 0,2 and fixes 1,3; each square coset is stable. In C₂,J=1, singleton genera swap. D12 has prime 3; D136=6²+10² has no prime ≡3 mod4. | Whole-group/genus/singleton cases separated; no negative-unit overclaim; none |
| §4.6 small discriminants, 714 | D12 words [[4,−1],[1,0]], [[5,−3],[2,−1]], det 1, trace 4. D28 words [[17,−3],[6,−1]], [[23,−18],[9,−7]], det 1, trace 16. Norms of 1+√3,3+√7,2+√7 are −2,+2,−3. | Periods, labels, minimal units, areas and degrees agree; none |
| §5.1 truncation/form, 738 | F=1 gives α=0. Local F=y gives α=dz/2, top integral −m/2. Constant tail mass at width 4,height 2 is 4/2=2. Translation preserves y and therefore the truncation height. | Compactness uses cutoff above retained arcs; boundary sign agrees; none |
| §5.2 flux-only Stokes, 766 | dα=−(F_xx+F_yy)dx∧dy/2=(λ/2)F dμ. F=1,λ=0: I=πℓ, both sides 0. Harmonic mean a₀+a₁Y has flux −ia₁/2; limit 0 forces a₁=0 and tail a₀/Y₀. | Finite improper limit proved in both eigenvalue branches; no L¹ overclaim; none |
| §5.3 completed endpoint, 782 | Opposite Laurent residues ±√y/(2ε) cancel; limit √y(log y+2c_Λ), λ/2=1/8. n=±1,±2 yield coefficients 4,8 multiplying √yK₀cos. Tail m(2logY+4+2c)/√Y→0 and flux −im(1+(logY+c)/2)/(2√Y)→0. | Normalization, C¹ exponential bounds, L¹ and endpoint distinction agree; none |

**Every displayed README Check.** Locations are in `packages/FuchsianOrbifoldsPartII/README.md`. Every row passes as stated; no change is requested.

| Check line | Computed values / distinguishing negative control |
| --- | --- |
| 34 | S(i)=i, S(2i)=i/2, S²=1 projectively but −I integrally; {0,3}−3 mod 9={0,6}. |
| 35 | Modular signature gives 2π(1/6)=π/3; one-cone bordered signature gives 2π(1/2)=π; paired-side contribution is 0. |
| 36 | α_log y=dz/(2y); lower/top integrals 1/2,−1/4 sum to 1/4=(1/2)·area(rectangle). At y=2, Δ(y²)=−8 versus inverse-square −1/2. |
| 37 | D12 norms 1,−2 distinguish I,J. D8: (1+√2)²=3+2√2, norm 1; length is twice its logarithm. |
| 144 | T^{4j}i=4j+i tends to the same ideal ∞ for j→±∞; Λ has cardinality 1. |
| 145 | diag(2,1/2) acts by z↦4z; forward/backward limits are ∞,0, giving cardinality 2 despite infinite group. |
| 146 | Modular parabolic fixed points ℚ∪{∞} are dense; closed Λ equals the full ideal circle. |
| 172 | C(PSL₂ℤ)=ℍ; quotient core equals M, genuine boundary count 0. |
| 173 | Endpoints −1,1 give inside x²+y²≤1; i/2 satisfies 1/4≤1, 2i violates 4≤1. |
| 174 | Two vertical representatives are one paired seam, adding 0 to t. |
| 213 | −2+1+(1−1/2)+(1−1/3)=1/6; multiply by 2π gives π/3. |
| 214 | −2+1+1+ℓ/2=ℓ/2; area πℓ, including π for ℓ=1. |
| 215 | Pants: −2+3=1, area 2π. Once-punctured sphere: −2+1=−1, area expression −2π, not realizable here. |
| 282 | [4] has one half-turn, sum 4 and positive translation T⁴. |
| 283 | [3,6] has length 2, sum 9 and centres 0,3; generators S,T³ST⁻³,T⁹. |
| 284 | [2] has no digit >2; T²S has trace 2, double root 1. [2,2] also has trace 2. |
| 285 | [] has sum 0 and group 1; [4,4] has sum 8, two factors, word square [[15,−4],[4,−1]], trace 14. |
| 313 | [4]: endpoints 0+1,4−1 are 1,3; length 2. |
| 314 | [3,2]: second interval (4,4)=∅; open discs centred 3,5 meet only at the excluded height-zero tangent. |
| 315 | i,3+i,9+i have distance 1 from their centres; T⁹i=9+i, so endpoint lifts give one orbit. |
| 333 | Positive generator T⁴ sends i to 4+i; inverse sends it to −4+i. |
| 334 | [[3,−10],[1,−3]] fixes 3+i and squares to −I; the other factor S fixes i. |
| 335 | SS₁=[[-1,4],[4,−17]], S₁S=[[-17,−4],[−4,−1]]; neither matrix equals the other's positive or negative. |
| 415 | [4]: γ(1/2+√3 i/2)=7/2+√3 i/2, already on the last circle; no strict final interior crossing. |
| 416 | [3,6]: γz≈2.822580645+0.027936303i; next retained crossing is 2.5+0.866025404i and S₁γz=8.5+0.866025404i. |
| 417 | [3,2]: first retained endpoints 5/6+√11 i/6 and 13/6+√11 i/6; second runs from 23/6+√11 i/6 to 25/6+√11 i/6, not an empty arc. |
| 444 | [4] has 1 cone and [3,2] has 2, while both words have trace 4 and length 2log(2+√3). |
| 445 | D28 principal area 2π is six times π/3, impossible for an area-preserving embedding into M. |
| 446 | Width-m strip modulo its two vertical edges yields one cusp, adds 1 to s and 0 to t. |
| 447 | First circle height √7/2≈1.3229; second √7≈2.6458; 3 exceeds both. At (1.5,1.2), 1.44<1.75 excludes the core though both relevant Ford distances squared equal 3.69. |
| 472 | 2arsinh(0)=0, excluding an additive nonzero offset. |
| 473 | V(2)=1.762747174>0 and cosh(V(2))=3; half that distance gives cosh=√2 instead. |
| 474 | T⁴i=4+i gives quotient distance 0; lift distance 2arsinh 2≈2.887270950. |
| 514 | Doubling (0;2^ℓ;1;1) gives g=0, 2ℓ cones, 2 cusps, t=0. |
| 515 | Pants χ=−1; double χ=−2, genus 2 and area 4π. |
| 516 | t=0 means no gluing locus, leaving exactly 2 connected components. |
| 558 | S(3+i)=−3/10+i/10; heights of i,3+i are 1 and transformed height is 1/10. |
| 559 | Identity fixes 2i, whose height 2>1; nonidentity witness excludes it. |
| 560 | {0,4}+8ℤ=4ℤ, whereas the full translation subgroup is 8ℤ. |
| 578 | Subtracting 3 from {0,3} modulo 9 gives {0,6}; [3,6] rotates to [6,3]. |
| 579 | Highest point sets both equal 4ℤ+i, but full positive cusp periods are 4 and 8; a=1 cannot identify them. |
| 580 | Widths both 12, traces both 48; rotations of [3,4,5] are [3,4,5],[4,5,3],[5,3,4], excluding [5,4,3]. |
| 618 | At i, re=0,norm²=1: left closed clause true, open-domain clause false. |
| 619 | At −1/2+2i left clause true; at +1/2+2i strict right endpoint fails. |
| 620 | Both elliptic endpoints have norm²=1; left retained, right rejected. A positive-real-part point on the circle fails the strict norm inequality. |
| 621 | Empty set and countable-orbit singleton preimages have area 0; total mass π/3>0. |
| 622 | Boundary area difference is 0. A finite set of cone lifts on a compact path can be bypassed by small arcs; a separating curve has two sides instead. |
| 648 | D28 principal mass π·2=2π, while every image subset has modular area ≤π/3. |
| 649 | Empty preimage gives 0; full preimage has mass πℓ>0. |
| 650 | D5 reciprocal class: ℓ=1, ν=3μ_mod, mass 3·π/3=π. Image area alone loses factor 3. |
| 676 | D28: equal weighting gives denominators 4π and 10π; period weighting gives common denominator 7π and weights 2/7,5/7. |
| 677 | Empty S has L=0 and summed mass 0; totalized normalization still has mass 0≠1. |
| 678 | For covered S, density 3L divided by πL is 3/π; set area a gives 3a/π. |
| 758 | ∂z(1)=0, α=0 and every boundary contribution 0; F dz would be nonzero. |
| 759 | ∂z(y)=−i/2, α=dz/2, right-to-left top integral −m/2. |
| 760 | ∫₀ᵐ∫_Y^∞y⁻²dy dx=m/Y; m=4,Y=2 gives 2, not 1/2. |
| 796 | Laurent coefficients +√y/2 and −√y/2 cancel; expansion of y^{±ε} leaves √y log y. |
| 797 | Derivative is (1+(logY+c)/2)/√Y; multiply by −im/2 for flux. Integrating the mean against y⁻² gives m(2logY+4+2c)/√Y. Both tend to 0; λ/2=1/8. |
| 798 | Cusp-form mean and its derivative are 0. For t≠0 both sides scale by the same finite Λ(1+2it); at t=0 its residue is nonzero and scalar evaluation cannot replace continuation. |
| 799 | σ₀(1)=1,σ₀(2)=2; paired coefficients are 4,8, full-width integrals 0 and differentiated cosine factors −2π,−4π. |

Additional boundary applicability: zero rings, characteristic-p coefficients, inseparable extensions and arbitrary topologies are not admitted by these fixed ℤ/ℝ/ℂ carriers. Empty lists and families, cyclic groups, nonabelian cycle groups, zero eigenvalue, cone order two, identity maps and totalized reciprocals are tested above. Finite S₃ and Q₈ are not orientation-preserving finite subgroups of PSL₂(ℝ); the nonabelian controls instead use actual subgroups generated by the displayed half-turns. The arithmetic hypotheses exclude D=1, square discriminants and nonfundamental D=9. The supplier's two-square criterion permits nonprimitive coordinates: D8=2²+2² and D136=6²+10².

**Headlines and acceptance-file coverage.** The headlines are the general finite-area Nielsen core and bordered Gauss–Bonnet (§§0.3,0.5); the Ford fundamental domain, marked free product, full cusp subgroup and infinite index (§§1.3,1.6); primitive finite-arc partition and arithmetic core comparison (§§2.1–2.2); reflected double, conformal lift, class recovery and raw-list conjugacy (§§3.1–3.4); complementary and family/genus covering (§§4.4–4.5); improper Stokes and the completed endpoint (§§5.2–5.3). All five statable raw-list headlines are present. The module docstring names each other family and its missing geometric carrier. No free scalar identity or arbitrary predicate stands in for one of them. Arithmetic signature, primitive length and integrable Stokes away from the endpoint are imported results, not missing local headlines.

**Resolved supplier contracts and ownership.**

| Supplier, eligible version | Sections checked and precise boundary of supply |
| --- | --- |
| `TauCetiRoadmap/FuchsianOrbifolds/README.md`, main | Layers 0–6: effective action, free/cone quotients, polygons, cusp data, cofinite signature, topological genus and level-one quotient. Layer 2 item 4 requires finite covolume; the package explicitly does not use that converse for its infinite-area polygon. |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md`, indexed new-roadmap head | §§0.27–0.28, 1.14–1.15, 2.17–2.18, 4.17a, 4.18, 4.20. Fourier factor 2√y and scalar completion agree. §4.17a supplies arithmetic surfaces/area/length/cusp structure; the four additional contracts remain explicitly declared. |
| `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md`, indexed new-roadmap head | §2.1 supplies signature, full oriented boundary period, and absolutely integrable Stokes with vanishing flux. This package constructs the flux-only limit and completed endpoint. |
| `TauCetiRoadmap/CongruenceSpectralGap/README.md`, supplied head | §0.1 supplies the quotient pushforward, independence and level-one mass π/3, on the effective action. |
| `TauCetiRoadmap/IntegralLattices/README.md`, main | B2–B3 supply the oriented form/ideal map and composition; B5 was additionally inspected for ownership. At D12, Q=[1,0,−3] and −Q have the same unoriented ideal but land in I,J under the sign clause. B5 does not state the required primitive minus-period/Pell-word adapter. |
| `TauCetiRoadmap/GlobalNumberFields/README.md`, main | Layer 11 supplies invertible proper ideals, Pic/NarrowPic and maximal-order comparison. No use is made of all proper ideals being invertible in arbitrary orders. |
| `TauCetiRoadmap/MultiquadraticPartII/README.md` and `Suggested.lean:108`, supplied head | §§2.3–2.4, 3.1–3.2. The named J-square theorem carries squarefree quadratic presentation, positive radicand and prime-discriminant factorization. These hypotheses are retained in the package. |
| `TauCetiRoadmap/ComplexCurveModuli/README.md`, main | D0.1, D0.4 and D6.2 read, including the complete D0.4 paragraph and geodesic-cut metric paragraph. Smooth compact bordered doubling and reflection are supplied; the package adds cusped marked orbifolds and their polygon/lift comparison. |
| `TauCetiRoadmap/ConformalMapping/README.md`, main | L2 supplies disc automorphisms/Schwarz–Pick; L4 supplies analytic-arc reflection and arc removability. Isolated-point removal is correctly assigned to Mathlib after repair. |
| `TauCetiRoadmap/AlgebraicTopology/README.md`, main | Stages 1,7 supply van Kampen and finite-CW Euler/gluing laws. The package constructs the finite-type exhaustion, rather than attributing surface classification to van Kampen. |
| `TauCetiRoadmap/DifferentialGeometry/README.md`, main | §§5.3,5.5,5.6.3: compact-support C¹ Stokes, corners, planar/orientation comparison. The package inserts a cutoff and uses real/imaginary parts; its rectangle gives 1/4 with outward-first orientation. |
| `Completed/UniversalCovers/README.md`, main | Stage 2 requires compatible basepoints and fundamental-group range inclusion; the package proves the latter using cone-meridian powers. |

The ownership search used the required `roadmaps grep` over indexed heads and main, direct searches of main/Completed and board packages, the supplied sibling checkouts, and both pinned libraries. No other owner of the general Fuchsian limit-set/core, raw admissible-cycle classification, orbifold double/rigidity, complementary measures or flux-only endpoint was found. Arithmetic surfaces and ordinary Stokes are already assigned to the suppliers above. The library's flow/curve omega-limit sets and Nielsen–Schreier theory are different objects. Searches for all own acceptance-file names found no duplicate fully qualified declaration in another readable roadmap. No target needs to move between owners.

All four gap needs sentences exactly match `packages/FuchsianOrbifoldsPartII/design/plan.json` and the README, name AutomorphicSpectralTheory §4.17a, and retain the standing arithmetic hypotheses. They ask separately for a complete period invariant, a primitive attracting Pell word, compatibility of label dictionaries, and parametrized orientation reversal. The first includes existence as part of its complete-invariant contract; it does not bundle an independent geometric construction. No gap has supplier `none` or asks to reconstruct a native carrier.

The direct pin audit includes `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean:42` and :67; `Measure.lean:44`; `MoebiusAction.lean:471`; `Mathlib/NumberTheory/Modular.lean:370`; group closure, coproduct and index declarations; the ping-pong hypotheses in `Mathlib/GroupTheory/CoprodI.lean:903`; `Mathlib/Topology/Algebra/ConstMulAction.lean:599`; map/integral-map declarations; quotient-measure equality at `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630`; the zeta declarations at `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:84`, :89 and :110; point-removability at `Mathlib/Analysis/Complex/RemovableSingularity.lean:100`; and the based lift at `Mathlib/Topology/Homotopy/Lifting.lean:499`. The open-mapping step also has the local connected-set version `Complex.AnalyticOnNhd.is_constant_or_isOpen` in `Mathlib/Analysis/Complex/OpenMapping.lean:164`.

Tau Ceti's projective action and invariant-measure instances, faithful integral embedding, ideal-circle action, properness, cyclic stabilizers, geodesic lines, convex polygon area, modular-domain null-boundary comparison, finite-width cusp area, covolume/index formulas, native narrow-class carrier/finiteness/square law and over-base deck conjugation were read at the pin. In particular `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:114` defines cofiniteness by discreteness and finite covolume, without finite generation; `TauCeti/MeasureTheory/Group/FundamentalDomain.lean:322` retains countability and a fundamental domain; `TauCeti/AlgebraicTopology/UniversalCover/Deck/Conjugation.lean:129` requires an actual over-base homeomorphism. None is falsely treated as a preconstructed Nielsen core.

The citation resolver found no unresolved roadmap citation or own Lean name. It does not inspect external library names in its environment, so the direct pin audit was performed separately. There is no new missing-reference request: all three cited works are available in the supplied legal cache. LU23's perfection/nowhere-density sentence is read in its stated second-kind context; it is not a newly discovered source error.

## Not verifiable

- No Lean command was run, as required by the brief. The supplied eight elaborated signatures were compared with the source and README, but this pass independently certifies neither elaboration nor the admitted proofs.
- The four precise AutomorphicSpectralTheory gaps are supplier obligations. Their declarations, minimality and consistency were checked; their eventual implementation cannot be certified now.
- Ownership against open pull requests whose checkouts were not supplied was not independently checked. Indexed `roadmaps grep` results were used as ownership leads; no unprovided checkout was obtained or audited. Existing roadmaps were consumed at main rather than their open revisions.
- Source verification used the supplied line-numbered extractions. The drawings in DIT16 Figures 1–7 were not visually inspected; the matrices, circle equations and crossings were recomputed directly. The extracted notation does not reliably distinguish the conjugated differential/wedge order in the source's Lemma 2 proof, so the earlier pass-b allegation of two cancelling sign slips there is not independently certified here. The package's own differential and orientation calculation is correct.
- No search for subsequently published corrections was performed. The errata below concern the supplied versions. All directly cited works were legally readable; no missing-text request is needed.

## Source issues

- **Error** in DIT16 at §2, Nielsen-region paragraph, printed p.952 (DIT16 line 153): the source says to take the half-plane above every complementary-interval geodesic; it should be the half-plane away from the complementary interval, including when that interval contains infinity; affects a stated result.
- **Gap** in DIT16 at proof of Theorem 1, printed p.958 (DIT16 line 364): the source says ideal endpoint inequalities ensure the finite cutting arc reaches the next circle; it should be justified by controlling the finite endpoint, including equality at the final crossing; affects the proof.
- **Gap** in DIT16 at proof of Theorem 1, printed p.959 (DIT16 line 390): the source says the ordered successive-lift distances are conformal invariants; it should be justified by a compatible conformal lift and identification of the selected normalized lifts; affects the proof.
- **Misprint** in DIT16 at §5, Laplacian display, printed p.961 (DIT16 line 511): the source says to multiply Euclidean second derivatives by minus the inverse square of height; it should be minus the square of height, consistently with equation (7.10); affects a stated result.
- **Misprint** in DIT16 at equation (5.4), printed p.962 (DIT16 line 522): the source says the functional equation's right side has only the spectral argument; it should be the completed Eisenstein series with the same spatial argument z retained; affects nothing.
- **Gap** in DIT16 at Lemma 2, final limit passage, printed p.972 (DIT16 line 1051): the source says vanishing horizontal flux permits passage to the area integral; it should be a specified height-truncated integral, with existence justified separately at zero eigenvalue, or an integral under an additional integrability hypothesis; affects the proof.
- **Error** in LU23 at §3.1, Dirichlet-boundary paragraph, printed p.194 (LU23 line 223): the source says two domain points are congruent exactly when both are on the boundary; it should be that distinct congruent representatives lie on the boundary, without asserting the converse for arbitrary boundary points; affects a stated result.
- **Misprint** in LU23 at §3.1, parabolic paragraph, printed p.194 (LU23 line 240): the source says parabolic transformations are infinite-order elliptic transformations; it should be that parabolic transformations have one ideal fixed point and form a separate isometry type; affects nothing.
- **Misprint** in SERIES05 at the Fuchsian paragraph after Proposition 4.60, printed p.33 (SERIES05 line 1143): the source says geometric finiteness is equivalent to finite area of the Nielsen region; it should be finite area of the quotient Nielsen region, or of a fundamental region in it; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5d5e0828253445f887b287a7fb2bb5a2c675e7a1", "job": "RT-FuchsianOrbifoldsPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
