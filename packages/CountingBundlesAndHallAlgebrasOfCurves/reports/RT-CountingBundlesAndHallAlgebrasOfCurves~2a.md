<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/937#issuecomment-6399179496 -->
Red team round 2 pass a (codex) of 3e6c184

Verdict: needs_changes

1. **F01** (P3) Six definitions lack three discriminating Checks

   **Location:** packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:554–576: “A zero quotient forces `H_i=H_{i−1}`”; “The inverse image of the total-H cutoff is exactly the total-F cutoff”.

   **Claim:** Each definition needs at least three discriminating Checks. The same defect occurs at :482–484 (§2.1: two imported mass laws, one fibre example), :704–706 (§4.1: two coefficient definitions and one support observation), :1041 (§6.3: only the rank-one example), and :1263–1266 (§8.1: three general assertions and one numerical example). In §2.5 the first two bullets unpack the flag definition; the last gives no particular flag or cutoff value. In §2.6 the last bullet repeats the stated cartesian-square theorem.

   **Witness:** README.md:566 already states the cutoff equivalence repeated at :576. A cutoff imposed on every graded piece would pass the one-step and Jordan-block shape checks while failing the first flag example below.

   **Exact repair text:** Replace the §2.5 Checks by:

   - On P¹, the flag 0⊂O(−1)⊂O² with quotient O(1) has total minimum slope 0 and belongs to the cutoff at 0, although its first graded piece has slope −1.
   - The flag 0⊂O(1)⊂O(1)⊕O(−1) has total minimum slope −1 and fails the cutoff at 0, although its first graded piece has positive slope.
   - Over F₂, the flags with fixed total sheaf O² and graded pieces O,O form three subobjects. Their quotient by GL₂(F₂), of order 6, has groupoid mass 3/6=1/2.

   Replace the last §2.6 Check by these two Checks, retaining the existing zero-map and length-two-block Checks:

   - On F=O(−1)² over P¹, let θ send the second summand identically to the first and kill the first. Then H=O(−1), H₁=0, H₂=H, and both total-F and total-H cutoffs at 0 are false: their minimum slopes are −1.
   - At a rational point x, take F=k[t]/(t²) and θ=multiplication by t. Then H=k_x, H₁=0, H₂=k_x and α₂=(0,1); F and H have degrees 2 and 1 and minimum slope +∞, so both cutoffs at 0 are true.

   **Retest:** The first flag distinguishes a cutoff on the total sheaf from one on all graded pieces. The second rejects a cutoff on the first graded piece alone. The Jordan instances compute both directions of the cutoff equivalence, including torsion; the mass calculation tests the automorphism quotient.

   The other affected sections can be repaired with the following exact Check text (replace the weak bullets in §§2.1 and 4.1; append the indicated bullets in §§6.3 and 8.1):

   | Section | Exact repair text and computed retest |
   |---|---|
   | 2.1 | For Id:BS₃→BS₃ the homotopy fibre has mass 1, and Fubini gives 1/6=1·(1/6). For BC₂→BS₃ induced by a transposition subgroup the fibre is the three-element coset set, and 1/2=3·(1/6). For B(C₂×C₂)→BC₂ induced by projection the fibre is BC₂, and 1/4=(1/2)·(1/2). These distinguish homotopy fibres from inverse images of isomorphism classes. |
   | 4.1 | On P¹/F₂, evaluate the rank-one torsion factorization on O⊕k_x: the unique torsion subobject has Hall factor v and the substituted E₀ coefficient has factor v⁻¹, giving z on both sides; omitting the substitution gives vz. On O(1)⊕O(−1), E₂ has value 1 and E₂^{≥0} has value 0, whereas both have value 1 on O². On O(−1), E₁^{vec} evaluates to z⁻¹, its ≥0 restriction to 0, and its <0 restriction to z⁻¹. |
   | 6.3 | On P¹, the rank-two logarithmic coefficient is identically zero; both root-of-unity residues vanish and give count 0 in every degree. On E/F₂ with #E(F₂)=3, the rank-two coefficient is 3/(1−z); its differential residues at 1 and −1 are −3 and 0, giving count 3 in both degree classes. These accompany the existing rank-one sign check. |
   | 8.1 | At g=1,r=1,d=0 the prescribed least choices are d₁=2,l₁=2,d₂=7,l₂=7,C=14. Every proper dimension determinant is a nonzero even integer of absolute value at most 14 or an odd integer of absolute value at most 7; none vanishes modulo 11, so the sufficient bound is not necessary. At g=1,r=1,d=3 the choices are d₁=0,l₁=3,d₂=7,l₂=10,C=30. The vector (1,0) has determinant 10, which vanishes in characteristic 2; in characteristic 31 every proper determinant remains nonzero. These accompany the existing genus-two kernel check. |

## Earlier findings: repair verification

All locations in this table refer to packages/CountingBundlesAndHallAlgebrasOfCurves/README.md. The two first-round reports use separate F-number sequences; “a” and “b” disambiguate them. No earlier finding was marked not actionable in this package.

| Earlier finding | Status and repaired passage | Recomputed witness |
|---|---|---|
| a/F01, invariant positive representative | Repaired, :1460: “The representative need not be Weyl invariant before imposing the paired-coordinate relations.” The distinction remains in §§10.5 and 11.6. | At g=2,r=2 the top degree is 10, not divisible by 4. In the quotient, q⁵ has positive representatives α₁⁵α₂⁵ and α₃⁵α₄⁵. The repaired claim admits this invariant class. |
| a/F02, nilpotent fibre versus reduced core | Repaired, :1148: “Write Λ_sch=h⁻¹(0) and Λ=(Λ_sch)_red.” The same sentence asserts Lagrangianity only for Λ; :1156 separates nilpotent families from characteristic-coefficient vanishing. | In characteristic 2 the elliptic rank-two odd-degree scheme fibre has an a²=0 direction; its reduced support is Pic¹. A rank-one dual-number scalar ε is nilpotent but has nonzero characteristic coefficient −ε. Both controls remain at :1167–1168. |
| a/F03, duplicate two-chart and zero-level comparison | Repaired, :1172: “Use the smooth two-framing Quot chart Q₁₂ of EndoscopicTransferAndUnitaryTraceComparison §3.7.” Section 7.5 compares the supplied equivalence with natural duality. | The current supplier §3.7 constructs Q₁₂ and the zero-level cotangent comparison. This package imports them; its new central-level comparison remains its own target. |
| a/F04, insufficient Checks in six definitions | Repaired in the cited sections, :770–772, :966–968, :1536–1538, :1628–1631, :1667–1669, :1701–1704. Example: “The reversed product has value 0 because a line has no torsion subsheaf.” | §4.6: 3√2 versus 1. §5.9: H_(2)=1/(1−z²), coefficients 0,1. §10.1: one-box values (6,3) versus (6,4). §11.1: three flags give scalar endomorphisms; two permit splitting. §11.3: nonzero versus split extensions distinguish indecomposability. §11.5: Hall orders give 2 and 0; scalar primitiveness forces c=2c; (q−1)⁻¹ has no α=1 value. S01 concerns previously untreated sections. |
| a/F05, equal-slope HN type | Repaired, :784: “The putative two-step type ((1,0),(1,0)) is inadmissible because its slopes are equal; its HN stratum is empty.” | O² has one HN step; O(1)⊕O(−1) has two strictly decreasing steps. Their indicated strata each have one isomorphism class on P¹; the equal-slope two-step stratum has zero. |
| b/F01, injectivity versus bijectivity of frames | Repaired as a separate target, :1304: “prove Ext¹(L₁,F)=0, in every characteristic.” This precedes the use of Riemann–Roch for frame bijectivity. | The new genus-two example has l₁=9, h⁰=11, h¹=2. Its offending (8,29) subrepresentation has weight 9·29−47·8=−115 and is unstable. The repaired proof owes the explicit vanishing target instead of inferring surjectivity from injectivity. |
| b/F02, nonexistent small-characteristic supplier | Repaired, :111: “identify it with the GL_r Hitchin stack of §3.6 when the characteristic does not divide r!.” The plan has the same slug and restriction. | In characteristic 2, rank 2, §3.6 is not invoked; the all-field coherent carrier of §3.7 supplies the locally free open. |
| b/F03, §8.9 Checks | Repaired, :1393: “In the plethystic logarithm subtract 6²/2=18 and the second-Adams contribution (4·9/(4−1))/2=6”. | Elliptic F₂ rank-two slope-zero mass: 12+8+6+4=30; 30−18−6=6. Genus-two rank-one normalization at q=2 gives 2P(1), not 8P(1). Degree −1 gives ordinary coefficient 6 and positive-cutoff coefficient 0. |
| b/F04, zero slope versus positive-slope citation | Repaired, :1383: “extract z⁰ from the ordered HN integration product over τ∈[0,+∞)”. | All positive-category degrees are nonnegative; every strictly positive slope contributes positive degree. Extraction retains exactly slope zero, and commutes with the Adams substitutions in the logarithm. |

## Verified sound

Read all 1,775 README lines and all 101 Suggested.lean lines: 80 numbered target subsections, 5 Lean declarations, 85 Check blocks containing 195 bullets. The ledger below records computations for every numbered target, separately recording the native definitions and HN transport in §0.2 and the new frame-vanishing target. All 91 distinct cached source-line anchors were located and their surrounding statements compared, together with Weil II (3.5.1)–(3.5.3). The three locator-only works remain uncertified. The 20 named supplier-contract subsections and the additional ArtinAlgebras, CompactSupport, EllAdicRealization, TraceFormula and FrobeniusGeometry references were resolved. The eight declared gaps match the plan and README; acceptance remains conditional on those contracts.

The Check count is an audit count, not a claim that 195 independent numerical tests are present: S01 identifies six definitions whose stated Checks do not meet that requirement. The computed replacement checks are included above. No false target, lost Lean binder, padding theorem, namespace collision, or additional ownership defect was established.

### Declaration and instance ledger

There are no ambient `variable` blocks. I compared each supplied elaborated `@` signature with its actual declaration and the README; no binder changed or disappeared. The run used the supplied signature extraction, not a new Lean invocation. All three definitions have real bodies and are necessary for the degree-independence headline. The matrix headline has its native matrix subtype, not an unspecified nilpotence predicate.

| Declaration and README section | Complete variable/instance context | Instances and values computed | Result/change |
|---|---|---|---|
| bundleDegree, Suggested.lean:56; §0.2 | k:Type u, Field k; X:Scheme.{u}, X.Over(Spec k); implicit r:ℕ, E:FixedRank X r. No finite-field or curve assumption in this total definition. | P¹: O(1) gives 2−1=1; O(1)⊕O(−1) gives 2−2=0. Genus 2: O² gives −2−2(−1)=0. Rank zero gives 0. | Matches the explicitly totalized README definition; usual degree is claimed only on curves. |
| IsAbsolutelyIndecomposable, :63; §0.2 | Same k,X,Field,Over,r,E context; pullback along X×Spec(k̄)→X, then underlying module sheaf. | O has endomorphism ring k̄ and predicate true; O² has projector diag(1,0) and predicate false; zero is false because native Indecomposable excludes it. | Native predicate, correct pullback direction. |
| absIndecCount, :72; §0.2 | k,X,Field,Over; explicit r:ℕ,d:ℤ. Nat.card of the skeleton of the specified full subcategory. | P¹ ranks 0,1,2 give 0,1,0 at d=−1 and d=1. One F₃ line class contributes 1, versus stack mass 1/2. | No finiteness assertion for arbitrary X; finite-curve finiteness is §1.10. |
| nilpotent_matrix_count, :84; §1.4 | K:Type*, Field K, Finite K, n:ℕ. | F₂, n=0,1,2: 1,1,4 = 2⁰,2⁰,2². F₃,n=2: 9=3². Natural subtraction at n=0 gives exponent 0, correctly. | Deep count; not Matrix.card_GL_field or a one-tactic restatement. |
| absIndecCount_eq_of_degree, :94; §10.4 | k:Type u, Field k, X:Scheme.{u}, Over(Spec k), Finite k, IsProper, SmoothOfRelativeDimension 1, GeometricallyConnected; r:ℕ,d,d′:ℤ. | P¹, d=−1,d′=1: ranks 0,1,2 give 0=0,1=1,0=0. Elliptic F₂ example: ranks 1 and 2, degrees 0 and 1, give 3=3. | Proper smooth geometrically connected dimension-one schemes over a finite field are the intended curves. All hypotheses survive elaboration. |

The other headlines are the nilpotent exponential/Jordan masses; Green and spherical HN theorems; universal Hall form; partition residue formula; origin formula; canonical Higgs geometry and central deformation; all-characteristic Higgs count; purity/Poincaré formula; nilpotent-core trace/components; Mellit Laurent integrality; positivity; parabolic and slope-cut universality; and Euler Hall Hopf/Lie theory. Each appears in the module docstring with its missing carrier. None has been replaced by an arbitrary function or proposition. General decomposition, radicals, partitions and GL cardinality remain imported inputs.

### Computed README ledger

Here P means P_X(1), unless a formal reciprocal tuple is specified. E denotes the Euler form. Values are comparisons on the listed instances, not proofs of the general theorems. The last column gives the review result and requested change; “agrees” means the stated instance agrees, not that an admitted theorem was proved.

| Statement | Instances tried and values on each side | Result/change |
|---|---|---|
| Conventions | P¹: E(O,O(1))=2, E(O(1),O)=0. Formal q=2, α=(−1,−2): P=6, ψ₂P=0, ψ₂((q−1)⁻¹)=1/3. Elliptic F₄/F₆₄ counts: 9 and 81. | Signs, field-extension powers and coefficient Adams agree. |
| 0.1 coefficient ring and Adams | g=0: Q[q±1], not Q. g=1,a=3,q=2: a+q/a=11/3 after either reciprocal choice, whereas a changes 3→2/3. ψ₂ denominator: 1/3 versus incorrect 1. | Agrees; q=1 excluded from curve specialization/localization. |
| 0.2 degree | O(1) on P¹: 2−1=1; genus-two O²: −2+2=0; O(1)⊕O(−1): 2−2=0. | Agrees. |
| 0.2 absolute predicate | O: true; O²: false; zero: false. Rational torsion block stays indecomposable; a degree-two-point simple becomes two geometric summands. | Agrees; rank-zero bundles and torsion counts remain distinct. |
| 0.2 native count | A_P¹(0,d)=0, A_P¹(1,d)=1, A_P¹(2,d)=0. Over F₃ a line contributes count 1 and mass 1/2. | Agrees. |
| 0.2 decorated coherent counts | Rational length-d blocks on the elliptic F₂ curve: 3 for d>0; zero: 0. Degree-two-point simple: absolute indicator 0 despite ordinary indecomposability 1. | Agrees. |
| 0.2 field-extension HN comparison | O(2)⊕O(−1): slopes (2,−1) before/after extension. Degree-two torsion: one slope +∞ before/after splitting into two supports; zero: empty→empty. | Agrees; no claim for arbitrary nonflat family pullback. |
| 0.3 residues | h⁻¹: normalized 1, differential −1; h⁻²: normalized 0, differential −1; regular function: 0,0. | Agrees, including the higher-pole distinction. |
| 1.1 additive Hom transfer | M=O²,N=O on P¹: End(M)=M₂(k), Hom(M,N)=k² as a projective row module; its module endomorphism ring is k=End(N). M=O⊕O(1): Hom(M,O) dimension 1, Hom(M,O(1)) dimension 3, reverse off-diagonal Hom dimension 0 versus 2. Zero maps to 0. | Opposite-ring convention and projective summands agree. |
| 1.2 coherent Krull–Schmidt | Zero has 0 summands; line has 1; O⊕O(1) has 2. For k[t]/t², t is nilpotent/nonunit and 1+t is a unit; residue field k. | Agrees without Artinianity of Coh(X). |
| 1.3 radical and semisimple quotient | N=F₂[t]/t², M=N²: radical dimension 4, quotient M₂(F₂) cardinality 16; incorrect repeated-copy radical dimension would be 2. | Agrees. |
| 1.4 matrix count | F₂ dimensions 0,1,2: 1,1,4; F₃ dimension 2: 9. Corresponding F₂ GL cardinalities: 1,1,6. | Agrees; fields exclude zero ring and DVR countermodels. |
| 1.5 nilpotent/unit ratio | Zero 1/1=1; line/F₃ 1/2; O²/F₂ 4/6=2/3; dual-number block/F₂ 2/2=1. | Both radical fibres cancel. |
| 1.6 band neutrality and forms | G_m/F₃: neutral H² and one H¹ class. Constant C₂: neutral H² but 2 H¹ classes; constant S₃: neutral H² but 3 conjugacy classes in H¹. | Neutrality does not imply uniqueness without connectedness. |
| 1.7 Frobenius orbits | One orbit of length 2: fixed absolute summands 0 over k and 2 over k₂; descended class is 2α, not α. | Both directions and multiplicity agree. |
| 1.8 coprime implies absolute | Rank 2,degree 1: residue degree divides gcd(2,1)=1. A nonzero self-extension has a two-dimensional local endomorphism algebra with residue k. | Residue k does not mean End=k. |
| 1.9 HN bounds | Rank-one degrees −1,0,1 have ≥0 indicators 0,1,1. g=2,r=2,d=3 gives 3>r(r−1)(g−1)=2. g=1 gap bound 0; genus 0 handled separately. | Strict threshold and genus boundary agree. |
| 1.10 finiteness, twist, dual | P¹ rank-one counts 1 at all degrees; rank-two counts 0. Tensor O(1) changes degree by r; dual sends O(d) to O(−d) and negates/reverses HN slopes. | Agrees; finite HN bounds provide actual finiteness. |
| 2.1 fibre Fubini | Id:BS₃→BS₃ gives 1/6=1·1/6; BC₂→BS₃ gives 1/2=3·1/6; B(C₂²)→BC₂ gives 1/4=(1/2)². | Formula agrees; add the missing discriminating fibre Checks, S01. |
| 2.2 nilpotent pairs | Zero contributes 1; fixed line/F₃ contributes 1/2; Id on a line is excluded. Multiplication by t on k[t]/t² is nonzero and squares to 0. | Agrees. |
| 2.3 exponential identity | One absolute species at q=2: multiplicities 0,1,2 give 1,1,2/3; Exp has second coefficient 1/2+1/6=2/3. | Adams acts on q as required. |
| 2.4 Jordan class | θ=0 gives α₁=[F]. A length-two block has r₂=1 and total rank 2, not 1. Rational torsion block length 2 has α₂=(0,1), total (0,2). | Weighted rank and degree agree. |
| 2.5 flag groupoids | P¹: 0⊂O(−1)⊂O² passes total cutoff 0 despite first graded slope −1. 0⊂O(1)⊂O(1)⊕O(−1) fails total cutoff. O,O flags in O²/F₂ have mass 3/6=1/2. | Object agrees; replace definitional Checks, S01. |
| 2.6 Jordan functors | O(−1)² with one Jordan block: H=O(−1), H₁=0,H₂=H and cutoffs false=false. Torsion k[t]/t²: H=k_x, degrees 2 and 1, cutoffs true=true. | Agrees; S01 supplies actual cutoff controls. |
| 2.7 fibre exponents | One step: d=d′=d″=0, masses 1. α₂=[O] on P¹: d=d′=−1,d″=0, total mass 1/2 at q=2. α₁=O,α₂=O(1): E=2,reverse E=0, d=d′=−3,d″=0, mass 1/8. | Order and symmetric-form factor agree. |
| 3.1 Hall algebra | O²/F₂: δ_Oδ_O=3√2; Δ′δ_O²(O,O)=√2/2. Unit δ₀ gives factor 1. Reversing O,O(1) changes Euler exponent 2→0. | Agrees. |
| 3.2 Green compatibility | Same example: pairing (3√2)/6=√2/2, matching coproduct. Without automorphism denominator it would be 3√2. | Agrees. |
| 3.3 characteristics | Rank-two bundle plus rational length-one torsion: Hall factor v² times correction v⁻²=1. Negative torsion degree: 0; positive torsion degree bundle characteristic: 0. | Agrees. |
| 3.4 flags and pairing | Three O flags in O²/F₂ give mass 3/6=1/2; v⁻¹ times Green pairing v/2 is 1/2. | Agrees. |
| 4.1 Eisenstein distributions | O⊕k_x: torsion factor v times shift v⁻¹ gives z. O(1)⊕O(−1): full coefficient 1, positive coefficient 0. O(−1): evaluation z⁻¹, positive 0, negative z⁻¹. | Definitions agree; strengthen Checks, S01. |
| 4.2 Hecke commutation | r=0 product 1; r=1 argument q⁻¹ᐟ²z/w; r=2 arguments z/(qw),z/w. All constant terms 1. | Agrees. |
| 4.3 coproduct | r=0: E₀⊗E₀. Split (1,1),g=0: prefactor q⁻¹ᐟ² and arguments q¹ᐟ²z,q⁻¹ᐟ²z. | Agrees including zero-rank conventions. |
| 4.4 ordered residues | r=1 coefficient V₁⁻¹V₁=1, no residue. Rank-two simple normalized pole coefficient 1 versus differential −1. | Agrees; §0.13 of the current GlobalShtukas supplier includes the underlying Harder residual projection input. |
| 4.5 HN relation | P¹ O(1)⊕O(−1): lower-slope quotient-left factor has Euler value 3; the prefactor q⁻¹ᐟ² and shift q⁻¹ cancel q³ᐟ² to give 1. | Correct order and nonnegative endpoint. |
| 4.6 spherical algebra | O²/F₂: line-generator square 3√2 versus rank-two characteristic 1. κ(x): torsion generator 1; O: 0. O(m)⊕O(−m),m≥0: full characteristic always 1 on infinitely many classes. | Repaired Checks discriminate generators and completion. |
| 4.7 HN membership | P¹ types ((2,0)), ((1,1),(1,−1)): one class each; equal-slope two-step type: zero classes. | Earlier false Check repaired. |
| 4.8 generic form | Rank-one mass P/(q−1): at q=2 it is P; at q=3 it is P/2. Reciprocal coefficient normalization agrees with §0.1. | No second partition or character-ring carrier. |
| 4.9 universal truncated counts | P¹/F₂ nilpotent total series has T⁰ part 1+3z+… and T¹ part 1+4z+…; division by the torsion factor gives Tz coefficient 4−3=1. | Correct torsion cancellation. |
| 5.1 pairing series | Single rank: V_r∑(zw)^d. Positive expansion has coefficients V₁ for d≥0; negative expansion of −V₁/(1−zw) has coefficients V₁ for d<0. Wrong expansion has −V₁. Zero-rank bundle slot contributes 1. | Regional conventions agree. |
| 5.2 torsion factor | One rank-one slot: coefficient of first torsion degree is #X(k)/(q(q−1)); P¹/F₂ gives 3/2, not 3. | Rank-dependent q shift agrees. |
| 5.3 unrestricted pairing | Ranks (1,2) give shifts q⁻¹ and q¹ᐟ²; reversing order interchanges signs with ranks. Rank-one case returns V₁. | Agrees. |
| 5.4 regional expansion lemma | The two expansions of (1−z)⁻¹ both become the Laurent polynomial 1 after multiplication by 1−z. The opposite signed expansions rationalize to functions summing to 0. | Clearing a common denominator is valid; no arbitrary distribution product. |
| 5.5 rank-one shuffle pairing | s=1 gives ±V₁/(1−zw) in the two regions; s=2 has sign (−1)²=1. | No averaging factor appears. |
| 5.6 higher-rank block residue | r=1: no residue and prefactor 1. One rank-two block,g=2: a=−1/2,b=0 under the two displayed normalizations. | Ordered residues agree. |
| 5.7 Jordan sum | r₂=1 and degree component 1 gives T²z², not Tz. Rank-zero constant in T has torsion coefficients, including 3z on the elliptic F₂ example. | Weighted sizes agree. |
| 5.8 arm–leg product | λ=(1),(2),(1,1),(3): products respectively 1, ζ(q⁻¹z),1,ζ(q⁻¹z)ζ(q⁻¹z²). Left cell of (2): arm 1,leg 0; top cell of (1,1): arm 0,leg 1. | Only actual cells enter; no out-of-range subtraction. |
| 5.9 residue kernels | Formal g=1,q=2,P=6: one-box product 6/(1−z). H_(2)=1/(1−z²), coefficients at z,z² are 0,1 versus 1,1 for H_(1). Empty kernels both 1. | Repaired Checks agree. |
| 5.10 generic Jordan identity | On P¹/F₂, empty type supplies torsion constant 1+3z+…; single-box T coefficient before removing it is (1+3z)/(1−z)=1+4z+…. | Agrees with §4.9. |
| 6.1 universal generating identity | T⁰=1; T¹=P/((q−1)(1−z)). Multiplying Log by q−1 recovers P/(1−z). | Agrees. |
| 6.2 periodic extraction | (2+3z)/(1−z²): residues at 1,−1 are −5/2,+1/2. Negative Fourier sums give 2,3. In characteristic 2 the denominator is (1−z)². | Nonvanishing r hypothesis is necessary and present. |
| 6.3 partition residue formula | r=1: residue −P→count P. P¹,r=2: coefficient 0→count 0. Elliptic F₂,r=2: residues −3,0→count 3 in both degree classes. | Formula agrees; add two Checks, S01. |
| 6.4 rank-two formula | g=0,q=2: 1/3−1/12−1/4=0. Formal g=1,(-1,-2): P=6,U=15,V=0,S=5/6; bracket 5−4=1 and count 6. | Agrees. |
| 6.5 origin | Rank-one value 1; q⁻¹ has no regular origin value; α₁α₂ and q each give 0. | Uses local regularity, not evaluation of the Laurent ring. |
| 6.6 constant formula | g=2 ranks 1–4: 1,2,6,22. g=3 ranks 3,4: 15,95. A⁰₁=z^(g−1)/(1−z), differential residue −1→constant 1. | Both negative signs retained. |
| 7.1 positive Higgs category | Line: stable; L²,zero field: semistable but not stable. O(−1)⊂O²: subobject minimum −1 versus middle/quotient nonnegative. For torsion k_x: Ext dimensions 1,2,1 versus naive 1,1,0. Elliptic differential Id→η has coefficient +1 and acyclic complex. | Coherent derived comparison and exact-category distinction agree. |
| 7.2 duality/invariant subsheaf | With W=ke₁⊂k², invariance requires the lower-left matrix entry 0; entry 1 fails. The dual restriction criterion selects exactly the same subspace. | Direction of the maps agrees. |
| 7.3 stable coarse geometry | g=2,r=1: coarse dimension 4, stack 3, core 2. Characteristic 2 elliptic rank-two field aI: characteristic polynomial t²+a²; reduced core Pic¹ versus scheme thickening a²=0. Scalar ε over dual numbers is nilpotent but coefficient −ε≠0. | Repaired scheme/reduction distinction agrees. |
| 7.4 two-line chart | g=2,r=2,d=1 example: h⁰=1+8=9,h¹=0, but evaluation on the degree-two nonspecial factor has basepoints. Kernel rank 7,degree −46. | Frame isomorphism is not substituted for strong generation. |
| 7.5 cotangent exact sequence | Rank-one zero field: Ext¹(L,L)* has dimension g, yielding all H⁰(Ω). Zero cotangent vector has moment 0. | Coherent duality comparison uses supplied quotient. |
| 7.6 Kronecker moment | One arrow x=2,y=3 gives (6,−6). In characteristic 2,x=y=1 gives (1,1), total trace 0. y=0 gives (0,0); (1,0) is outside the effective image. | Signs and scalar-annihilator target agree. |
| 8.1 numerical frame choices | g=2,r=2,d=1: B=−3/2,d₁=5,l₁=9,d₂=24,l₂=47,C=423; kernel bound −16+24=8>3. g=1,r=1,d=0 gives (2,7),C=14, with p=11 still avoiding all proper determinants. | Bound agrees; S01 adds actual small-characteristic controls. |
| 8.2 King sign | (l₁,l₂)=(2,3): δ(1,1)=−1,δ(1,2)=1. Actual g=2,r=2,d=1 sublines of degrees 1 and 0 give section pairs (5,24),(4,23), hence δ=−19,+19 respectively. | Higher sheaf slope gives negative δ. |
| 8.3 nonzero central fibre | Indecomposable End dimension h: (q−1)q^(h−χ)/[(q−1)q^(h−1)]=q^(1−χ)=q^D. Proper projector pairs to a nonzero determinant when p>C. | Multiplicities and characteristic bound agree. |
| 8.4 smooth-open inclusion | Repaired bad frame has l₁=9,h⁰=11,h¹=2; the zero-cotangent invariant pair (8,29) has δ=−115. In elliptic rank one, h⁰=l₁=2,h¹=0. | Bad frame is excluded by semistability in the explicit control. |
| 8.4 new Ext¹-vanishing target | Same bad-frame instance: h¹=2, so it cannot be a semistable instance of the new target; good elliptic frame: h¹=0 and injective 2→2 is bijective. The §7.4 example has h¹=0 but bad evaluation. | Vanishing, injectivity and evaluation surjectivity are three distinct obligations. |
| 8.5 Higgs/King comparison | g=2,r=2,d=1: invariant subline degrees 1,0 have slopes above/below 1/2 and δ=−19,+19. | Two directions and slope determinant agree. |
| 8.6 central deformation | Rank-one fibres all have q^gP points; scaling back a nonzero parameter uses t⁻¹. Noncentral μ is changed by coadjoint action, so is not a quotient parameter. | Central-line restriction retained. |
| 8.7 affine strata/count equality | For base A¹ and relative affine rank a, total F_Q count Q^(a+1); zero fibre Q^a and each nonzero fibre Q^a, giving Q^a+(Q−1)Q^a=Q^(a+1). | Relative rank difference 1 and extension-field count agree. |
| 8.8 geometric Higgs count | Rank-one genus 2: q²P=q^D A. P¹ coprime rank one gives 1=1; higher coprime ranks give 0=0. | Sufficient large-characteristic route stays distinct from all-characteristic result. |
| 8.9 HN/DT normalization | Elliptic F₂ rank one: I=Ω=6. Rank two,slope zero: mass 30; logarithm 30−18−6=6. Genus 2 rank one,q=2: 2P, not 8P. Degree −1: Ω=6 but positive coefficient 0. Equal-slope self-Ext² dimension 1 versus strict-order dimension 0. | Repaired endpoints and normalizations agree. |
| 8.10 all-characteristic count | Elliptic F₂: A=3,Ω=6,coarse Higgs count 6,mass 6. Over F₄: A=9,Ω=36,coarse count 36,mass 12. | No good-prime restriction; scalar-gerbe factor q−1 retained. |
| 9.1 purity/BB | Rank-one genus 2: m=2,b=0,D=2, H_c^n=H^(n−4)(Pic)(−2). Elliptic characteristic-two rank two: m=1,b=0,D=1, same core cohomology for a²=0 fibre and its reduction. | Degree shift 2a and twist −a agree. |
| 9.2 positivity | g=2,r=2: 2D=10. A monic positive free-ring invariant would require a single invariant degree-10 monomial, impossible because its four exponents must agree. The quotient class q⁵ has positive representatives. | Repaired invariant-class statement survives the obstruction. |
| 9.3 compact Poincaré | Rank-one genus 1: t²(1−t)², dimensions 1,2,1 in degrees 2,3,4; genus 2: t⁴(1−t)⁴. Unsigned versions use 1+t. A point and two points have H⁰ dimensions 1 and 2, so unrelated fibres cannot be identified. | Signs and spread-out restriction agree. |
| 9.4 core traces/components | Rank-one genus 2: q²∏(1−α_j⁻¹)=P, top cohomology dimension 1. Two exchanged geometric components have dimension 2 but first Frobenius trace 0. | Reciprocal prefactor and dimension/trace distinction agree. |
| 10.1 Mellit kernel | Formal q=2,a=−1: H₁=3(z+1), values at 1,0 are 6,3. Reciprocal a=−2: 2(z+2), values 6,4. Actual elliptic F₂: H₁(1)=3. Empty partition Ω=1,Log=0. | Reciprocal invariance only after specialization; not a false Weil tuple. |
| 10.2 deformation | Empty partition factor 1. Constant sequence f_n=1 gives f_(n+1)(1,x)=1=f_n(qx), deformation constant term 1. | Elementary control agrees; full M20 comparison remains locator-only. |
| 10.3 integrality/poles | One-box H₁ is polynomial; 1/(1+z) is regular at 1 with value 1/2 but has a pole at −1. | Local regularity is not substituted for global Laurentness. |
| 10.4 degree independence | P¹ ranks 0,1,2: 0,1,0 in every degree. Elliptic curve: rank-one/two count P. Synthetic periodic sequence 2,3 has a forbidden −1 pole. | Native headline and pole argument agree. |
| 10.5 all-degree positivity | g=2,r=2,d=0,1: universal equality transfers origin value 2 to both; gcd(2,1)=1. | No identification of noncoprime stable moduli asserted. |
| 11.1 parabolic objects | O² on P¹ with fibre lines e₁,e₂,e₁+e₂: endomorphism dimension 1, hence absolute. Removing third flag leaves diagonal endomorphism algebra k² and a split object. Rank one: each admissible flag unique, count P. | Correct marked carrier and genuine indecomposability test. |
| 11.2 parabolic universality | No effective flag/rank one: ordinary count P. P¹ flags jumping at positions 1,2 give parabolic Euler values 0 in one order and 1 in the reverse. (q−1)⁻¹ has value 1 at q=2 and a pole at q=1. | Localized conclusion is distinguished from the integral conjecture. |
| 11.3 HN-refined counts | Nonzero extension 0→O(P)→E→O→0 in genus 2: Ext¹ dimension 1; μ=1/2, μ_min=0, cutoff ≥1/2 false. Split extension has same HN classes but absolute indicator false versus true. | Exact HN type does not determine indecomposability. |
| 11.4 slope-cut universality | Rank one,ν=0,degrees −1,0: lower counts 0,P. Dual upper counts at degrees 1,0: 0,P. | Lower/upper duality direction agrees. |
| 11.5 Euler Hall/Lie | Scalar primitive forces c=2c, hence c=0. On O(d+1)/P¹_C, torsion-degree-one times degree-d line has value 2; reversed order 0; bracket 2. (q−1)⁻¹ cannot specialize at α=1. | Repaired order and tensor-target restriction agree. |
| 11.6 conjectures | Rank-one origin/root multiplicity 1; one mark of length 1 adds no flag and gives P. An uncancelled q⁻¹ has no origin value. | Five conjectures remain conjectures; no arbitrary origin evaluation. |

### Supplier, ownership and dependency evidence

The content checkout and its origin/main agree at 98a9b7a. The pinned Mathlib revision is 6b7abb3c7686292736be2955bd3eb9ebf63b456a and the pinned Tau Ceti revision is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The supplied open-head files were used for ClassicalGroupsPartII, FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands, HabiroNahmSeries and QSeriesPartitionsAndMockModularForms. Other named supplier sections were resolved with the roadmap tool and read at their returned versions; the main version was used for SchemeAndStackFoundations and AlgebraicVectorBundles.

| Supplier citation resolved | Evidence and hypothesis comparison |
|---|---|
| AlgebraicVectorBundles L0A–L2B | TauCetiRoadmap/AlgebraicVectorBundles/README.md:215,228,254,269,290,306,340: module sheaves, finite locally free objects, determinant, relative Spec and geometric linear structure. Coherent Hom arguments here retain properness and finite presentation. |
| QuiverRepresentations Layers 1–2; ArtinAlgebras Layer 0 | TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md, Layers 1–2; TauCetiRoadmap/ArtinAlgebras/README.md:152–175. Existing quiver/module and categorical decomposition inputs are used; the coherent transfer is an application, not a new quiver carrier. |
| ClassicalGroupsPartII CG.0.4–0.5,2.4–2.6 | TauCetiRoadmap/ClassicalGroupsPartII/README.md:408,440,1116,1154,1172: multiplier t, reciprocal flips, full invariant ring and rational character isomorphism. The positive tensor subring is not substituted. |
| FunctionFieldArithmetic 0.2–0.3,5.1–5.4 | TauCetiRoadmap/FunctionFieldArithmetic/README.md:478,509,1702,1755,1783,1814: divisor of degree one need not be effective; Picard points and reciprocal zeta numerator use the exact constant field. |
| GlobalShtukasAndFunctionFieldLanglands 0.1,0.5–0.6,0.13 | TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:169,262,293,456: coherent HN, fixed-central-degree finiteness, three mass formulas. Its :462 owns the Harder residual projection and volume input, so the residue proof is not an unowned appeal to a name. |
| WeilConjectures WC.1, Finite groupoid mass | TauCetiRoadmap/WeilConjectures/README.md:336: finite automorphisms and finite isomorphism classes; action-groupoid mass is already owned. This package's additional construction is the homotopy fibre and its Fubini formula. |
| SchemeAndStackFoundations 1.18–1.21,2.6,2.18,2.20,3.3,3.6–3.7,4.1,4.5,4.14 | TauCetiRoadmap/SchemeAndStackFoundations/README.md:2745,2817,2843,2951,3437,3959,4275,4713,4905,4937,5066,5244,5706. Quot has Noetherian base; the intended curve charts have it. General coherent Ext duality and the degree-only generation estimate remain declared extensions. |
| AlgebraicModuliForArithmeticGeometry 1.3,4.19 | TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:578,7317. The current §4.19 is about affine-gerbe factorization, so the character-GIT input is correctly a declared continuation, not falsely claimed as already present. |
| EndoscopicTransferAndUnitaryTraceComparison 3.6–3.7 | TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md, §§3.6–3.7: §3.6 has the Weyl-order characteristic condition; §3.7 supplies coherent canonical Higgs objects over every field, good lines, Q₁₂, moment map and zero level. The package's comparisons respect that division. |
| AutomorphicSpectralTheory 6.22c,6.24 | TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3399,3437: geometric bundle Higgs HN and coprime stability; :3453 constructs the two-term bundle deformation complex and strict-slope obstruction vanishing. This does not already supply the coherent torsion-derived comparison or positive relative stability. |
| ReductiveGroupsPartII RG2.3.7 | TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201: Lang requires the whole group smooth, connected and finite type. The package uses it for the open unit group of a finite-dimensional algebra; disconnected C₂ is used only for neutrality, not H¹ uniqueness. |
| HabiroNahmSeries 5.1; HabiroCyclotomicCompletions 1.1 | TauCetiRoadmap/HabiroNahmSeries/README.md:1068–1070 supplies ordinary multivariate augmentation exp/log. TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:292–315 supplies simultaneous q,t substitutions and elementary plethystic Exp. The general complete λ-ring inverse Log remains a declared gap. |
| QSeriesPartitionsAndMockModularForms 2.4,3.5 | TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:303,482: q-binomial/Euler identities and partition adapters. Macdonald/HLV and regular-sequence deformation are explicitly declared extensions, not attributed to those existing statements. |
| DeligneWeightsAndPurity 0.10,0.12,0.16–0.18,1.7,7.12,7.15,8.8–8.11,10.5 | TauCetiRoadmap/DeligneWeightsAndPurity/README.md:940,962,1030,1044,1061,1240,2618,2678,2873,2885,2895,2907,3677. Rational coefficients, q>1, invertible Frobenius, proper smooth purity and separated compact-support operations are retained. The trace reconstruction does not infer arithmetic semisimplicity. |
| LefschetzPencilsAndVanishingCycles 5.11; ArithmeticStatisticsPartVIII 5.17 | TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:3163 supplies the pencil result; universal family density is explicitly an extension. TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:950,966,1002 supplies mod-ℓ monodromy, integral lifting and odd-degree-family monodromy, including the genus-one ℓ=3 exception. The package chooses ℓ≥5 and retains the varying q coordinate. |
| EtaleDualityAndPerverseSheaves 0.4,0.6–0.7 | TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:551,818,895: trace, rational duality and curve pairings. The general affine-bundle compact shift is named as an additional contract. Its sign matches A¹'s eigenvalue q in degree 2. |
| CohomologicalPointCounting combined endpoint; CompactSupport 6–8; EllAdicRealization 7–9; TraceFormula 11–12; FrobeniusGeometry | TauCetiRoadmap/CohomologicalPointCounting/README.md:44 and its named child roadmaps: localization, constructibility, compact realization, geometric Frobenius and point counting. The package uses a common spread-out and constant coefficients, not an identification of unrelated fibres. |
| ComplexComparisonPartII C6.3–C6.6 | TauCetiRoadmap/ComplexComparisonPartII/README.md:4168,4227,4268,4334: finite, compact, relative and adic comparison with uniform bounded constructible systems. The fixed complex Higgs space meets the separated finite-type conditions. |

Pinned declarations were read at the supplied revisions: Mathlib Matrix.card_GL_field (:120), IsArtinianRing.isNilpotent_jacobson_bot (:54), IsArtinianRing.isSemisimpleRing_iff_jacobson (:641), Finite.isDomain_to_isField (:176), Indecomposable (:1096), Skeleton (:74), ObjectProperty.FullSubcategory (:39), YoungDiagram/transpose; Tau Ceti FixedRank (:69), pullback (:104), eulerCharBelow (:105), InvertibleSheaf.trivial (:131), the two module Krull–Schmidt declarations (:154 and :266), armLength (:136) and legLength (:140), in the respective files named in the README contracts. In particular, eulerCharBelow does not itself assume finite cohomology, and the local-endomorphism theorem requires finite module length. The package supplies those hypotheses where needed.

Object searches covered decomposition/radicals, nilpotent matrices and centralizers, Jordan partitions, Higgs/coarse/Quot geometry, curve Hall and Euler Hall constructions, Adams series, BB strata and count invariants, using both the roadmap tool and the pinned/local sources. NilpotentOrbits N4 is a complex-matrix Jordan/orbit construction, not the finite-field cardinality theorem here. The minuscule BB maps in GeometricSatakeAndFusion and the supplied AdmissiblePairsAndPadicHodgeStructures head have different carriers, not the affine strata of these Higgs spaces. No second owner of the curve enumeration or the two Lean headlines was found. The exact-name search found no other declaration in the target namespace. The supplied sibling-head search included the open heads listed in the brief through the roadmap index; only object hits and cited supplier sections were read in detail. No additional unprovided checkout was independently acquired.

The eight gap slugs in design/plan.json occur identically under the appropriate README supplier headings, with the same needs sentences. Their hypotheses distinguish the requested extension from existing local-free-only duality, existential generation, restricted-characteristic Hitchin geometry, gerbe quotients, elementary series and pencil statements. The operations bundled in each contract specify one coherent interface; none has supplier `none` or an unnamed prerequisite.

Read-only dependency-check output:

```text
moved: CountingBundlesAndHallAlgebrasOfCurves moved in the merge order from #172 to #269, right after its last supplier ClassicalGroupsPartII (HabiroNahmSeries also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 52 roadmaps, 599 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The `moved:` result is permitted by the brief. Internal dependencies were also compared: origin regularity is proved through §6.3/§5.9, not by using the later positivity theorem; §10.5 consumes §9.2 and §10.4 in the correct direction. The separate frame-vanishing target is now explicit before the frame isomorphism argument.

The diff against origin/main changes nine files, all under packages/CountingBundlesAndHallAlgebrasOfCurves. Suggested.lean has one Mathlib import and three used pinned Tau Ceti module imports, two `theorem` declarations, no admitted data, no `lemma`, no `set_option`, no free-Prop stand-in and no computational algorithm. No process narrative or pull-request identifiers were found in the README or Lean docstrings. The only worktree addition made by this review is this report; scratch notes are outside the checkout.

## Not verifiable

- M20, Theorem 1.1, Proposition 3.1, Proposition 4.2, Corollaries 4.3/4.5, Definition/Lemma 5.1 and Theorem 5.2: settled locator-only source. The full curve deformation and Laurent-integrality proof could not be compared with its text. No renewed source request was made.
- FH58, Theorem 1, pp.499–503, and HES81, Theorem 5.7, pp.55–89: settled locator-only sources. Their applications were tested on the computed cases above; the primary proofs were not read.
- The general new Ext¹-vanishing theorem in §8.4 is a target, not an available proof. Its explicit bad-frame and good-frame controls were checked, and the previous circular dimension inference is removed. This is not a claim to have proved the target in full.
- No fresh Lean elaboration or build was run, as required by the read-only brief. The five provided elaborated signatures were compared individually. Thus no independent claim about a newly run build is made.
- Some PDF extraction typography is ambiguous, notably the Green-pairing fraction and an exponent in S16 Appendix A. No erratum is asserted merely from those ambiguous extractions. Local PDF renderers were unavailable.
- The roadmap index used by `resolve` advertises an older main hash than the supplied content checkout and says its library-name check has no pinned packages. Its “none missing” output was treated only as a lead; local pins and the supplied current files were used for the actual comparisons. No claimed absence rests on that index alone.

## Source issues

- **Misprint** in S16 at Corollary 1.4(i), p.301 (S16 line 191): the source says reciprocal evaluation has prefactor q^(2D); it should be q^D, as the rank-one Picard example shows; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(ii), p.301 (S16 line 194): the source says degree D cohomology counts components; it should be degree 2D for the D-dimensional core; affects a stated result.
- **Error** in S16 at Corollary 1.5, pp.301–302 (S16 line 198): the source says a nonnegative representative is invariant in the free polynomial ring; it should be an invariant quotient class admitting a nonnegative representative; affects a stated result.
- **Error** in S16 at Corollary 1.5, p.302 (S16 line 201): the source says the diagonal count is monic of degree 2D for every coprime rank and degree; it should exclude genus-zero ranks greater than one, whose count is zero; affects a stated result.
- **Misprint** in S16 at Corollary 1.9, p.305 (S16 line 445): the source says the constant is the positive differential-residue sum; it should be its negative, giving rank-one constant 1; affects a stated result.
- **Error** in S16 at Lemma 2.4, p.309 (S16 line 635): the source says a repeated summand contributes n copies of its radical; it should contribute the full n-by-n matrix radical, of dimension n² times the radical dimension; affects a stated result.
- **Error** in S16 at proof of Lemma 2.6, p.311 (S16 line 759): the source says the descended orbit sum has no proper Galois-stable submodule; it should exclude proper nonzero Galois-stable direct summands, since invariant proper subsheaves can exist; affects the proof.
- **Misprint** in S16 at §4.2, p.316 (S16 line 1010): the source says the torsion-factor correction is q^(−l/2); it should be q^(−rl/2), accounting for the bundle rank in the Euler twist; affects a stated result.
- **Misprint** in S16 at proof of Corollary 4.5, p.320 (S16 line 1205): the source says the first HN slope determines nonnegativity; it should be the smallest HN slope in the decreasing ordering used there; affects the proof.
- **Misprint** in S16 at §5.6, p.332 (S16 line 2047): the source says the total monomial uses the unweighted sum of Jordan classes; it should use the sum of i times the ith Jordan class; affects a stated result.
- **Misprint** in S16 at §5.7, p.334 (S16 line 2265): the source says the universal truncated coefficient specializes to the unrestricted count; it should specialize to the count with the same nonnegative HN cutoff; affects a stated result.
- **Error** in S16 at §6.2, p.337 (S16 line 2416): the source says the Higgs stack has dimension 2(g−1)r²; it should have stable-locus dimension 2(g−1)r²+1, retaining the scalar stabilizer; affects a stated result.
- **Gap** in S16 at §6.4, proof of Lemma 6.1, p.339 (S16 line 2500): the source says kernels of all presentations have finitely many HN types while allowing arbitrary source dimension; it should fix that dimension or bound minimum slopes instead of full HN types; affects the proof.
- **Error** in S16 at §6.4, p.339 (S16 line 2512): the source says the frame-isomorphism conditions suffice for the asserted two-line generated open; it should also require the restricted evaluation maps to be epimorphisms; affects the proof.
- **Misprint** in S16 at equation (6.6), p.343 (S16 line 2674): the source says the first dimension sum uses ker φ₂; it should use ker φ₁, from the split exact sequence (6.4); affects the proof.
- **Gap** in S16 at Lemma 6.4, p.345 (S16 line 2753): the source says an injective first frame is an isomorphism using its Euler dimension; it should first establish Ext¹(L₁,F)=0 on the semistable locus; affects the proof.
- **Error** in S16 at §6.8, pp.344–345 (S16 line 2761): the source says the ambient moment map descends through the whole character quotient; it should first restrict to the invariant central line and descend that parameter; affects the proof.
- **Error** in S16 at Lemma 6.5, p.345 (S16 line 2776): the source says the moment map is submersive onto the full Lie-algebra dual; it should use the annihilator of diagonal scalars, then base change to the central line; affects the proof.
- **Error** in S16 at §6.10 after (6.10), p.350 (S16 line 3017): the source says coefficients of A give multiplicities of unshifted Higgs eigenvalue monomials; it should include q^D and group monomials whose specialized eigenvalues coincide; affects the proof.
- **Misprint** in S16 at §6.11, p.351 (S16 line 3050): the source says every Hitchin-base coordinate has weight one; it should give weight i to the ith characteristic coefficient; affects the proof.
- **Error** in S16 at §6.11, p.351 (S16 line 3068): the source says every scaling-fixed component lies in the smooth locus of the nilpotent cone; it should derive tangent-weight dimensions from the weight-one symplectic pairing without that assertion; affects the proof.
- **Misprint** in S16 at equations (6.11)–(6.12), pp.351–352 (S16 line 3074 and S16 line 3080): the source says an affine rank-a fibre shifts cohomological degree by a; it should shift degree by 2a and twist by −a; affects a stated result.
- **Gap** in S16 at Theorem 7.1 and §7.2, p.353 (S16 line 3118 and S16 line 3123): the source says the parallel unmarked argument yields an unlocalized parabolic polynomial; it should supply an additional denominator-removal argument beyond the localized conclusion; affects the proof.
- **Error** in S16 at §8.3, p.354 (S16 line 3191): the source says all constructible Hall functions form an ordinary tensor-target Hopf algebra; it should first use product-space functions and prove tensor closure on the chosen subalgebra; affects a stated result.
- **Misprint** in S16 at Appendix B, p.357 (S16 line 3350): the source says the equidistribution reference is Deligne 1974, (3.5.3); it should cite Weil II, (3.5.3), p.211; affects the proof.
- **Misprint** in LIN15 at §1.2, p.6 (LIN15 line 317): the source says slopes are rational after allowing arbitrary real parabolic weights; it should allow real slopes or restrict the weights to rational numbers; affects a stated result.
- **Error** in LIN15 at Lemma 1.1, p.6 (LIN15 line 328): the source says the coherent parabolic category has enough injectives; it should use an ambient module or ind-category for injective resolutions; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3e6c1846d454d4b87c868ad06d69615f701ce883", "job": "RT-CountingBundlesAndHallAlgebrasOfCurves~2a", "model": "gpt-6-astra", "worker": "chris-23"} -->
