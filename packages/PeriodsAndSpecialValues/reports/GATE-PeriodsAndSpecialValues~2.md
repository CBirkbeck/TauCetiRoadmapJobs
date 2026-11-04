# PeriodsAndSpecialValues: human-review responses

## H01 (CBirkbeck) — applied differently

The unrestricted equality with the shared regular completion is replaced by the trace-based real-place comparison in `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:445`: equality is asserted for even rank, odd rank congruent to 1 modulo 4, or a base field without real places, while the geometric Hodge formula retains all ranks and multiplicities and the shared completion retains its existing owner. The new Checks at lines 461–462 give the Sym² discrepancy 1/(4π⁴) versus 1/(2π⁴) at s=3 and the agreeing rank-five multiplicities (3,2); Deligne line 685 and Deligne line 691 fix the Hodge-block normalization, and PotentialModularityAndCompatibleSystems §1.15 at head 29f6025 supplies the incompatible determinant multiplicities.

## H02 (CBirkbeck) — applied

The unavailable semistable-model import is replaced throughout by the general construction target PS.8.16a in `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1875`, with N>1, every perfect residue field of characteristic prime to N, the symmetry group scheme, projective equivariant blowups, charts, log structure, flat coefficient base change and unit specialization; PS.8.17 now consumes that target at line 1905. Qian line 177, Qian line 183, Qian line 190, Qian line 339 and Qian line 362 support the construction and its unchanged punctured locus; unit specialization pulls back the constructed model rather than invoking a false arbitrary-base-change law for blowups, and `TauCetiRoadmap/PeriodsAndSpecialValues/Suggested.lean:23` identifies the missing carriers instead of inserting a stand-in theorem.

## H03 (CBirkbeck) — applied

The claim that PS.1 owns an empty rank-zero extension is replaced by reuse of PotentialModularityAndCompatibleSystems §1.7's rankZeroSystem in `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:25`, the supplier contract at line 148, the zero-motive adapter at line 405, its Needs line 437 and layer dependencies at line 652. That supplier's lines 260–262 already give the zero members, empty Hodge data, local polynomial and factor 1 and transport API; PS.1 retains the motivic identification and empty-product equalities.

## H04 (CBirkbeck) — applied

The unqualified “proved abelian case” reference is replaced in `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:826` by the exact restriction r≤0 over ℤ[1/2][G], with the explicit observation that coefficient, restriction and Morita transports preserve the twist. The j≥2 leading-term assertions remain predicates: BF line 1723 records the group-ring theorem only for integral twists less than 1, and no duality/functional-equation transport to j has been added.

## H05 (CBirkbeck) — answered

EllipticIntegrals Milestones 1 and 3 are direct prerequisites, as already stated in `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:26` and its contract at line 154; its open roadmap is #1333, author jayyswan, head 64db17e, and the live description of #1496 at a8421e8 omits it from both dependency lists. The worker should add #1333 to the direct prerequisites, the merge-order block before this roadmap, and the other-author prerequisite list; PR metadata is outside the authorized edits and has been left for the worker.

**Ownership and source evidence.**

- Main was checked at c44faf6, and open roadmap content at the indexed heads, including the supplied sibling checkouts; searches covered the objects, rather than only local declaration names, across main, open roadmaps and board packages. PotentialAutomorphyDworkMotivesPartII has a board design at `packages/PotentialAutomorphyDworkMotivesPartII/design/README.md`, but no roadmap on main or in the open inventory: an ORDER entry and a design do not supply an importable roadmap contract. Its planned universal-model target cannot fill the dependency, so PS.8.16a owns the necessary general construction here.
- ModularityAndLanglandsExtensions §2.10 states semistable models of individual negative-valuation fibres after finite ramified extension, together with the log comparison. It supplies neither this universal W(k)[T,U±1] modification nor its unit-specialization interface; it has not been made a supplier. StableReduction Layer 4 on main supplies the generic blowup/projectivity/flat-base-change theory; SchemeAndStackFoundations §§1.17, 1.23 and 4.11 on main supplies quotients, modifications and strict transforms; CrystallineCohomology CR.5:log-algebra.2–.4 supplies integral log morphisms, the chart criterion and divisorial log structures.
- The shared compatible-system and rank-zero objects remain owned by SmallRamificationAndAbelianVarietyBaseCases §5.0d, AutomorphicGaloisRepresentationsPartII AG2.P and PotentialModularityAndCompatibleSystems §§1.6–1.7, 1.15. EllipticIntegrals Milestones 1 and 3 own the canonical integrals and Legendre relation. No declaration was added under another roadmap's namespace.
- All cross-roadmap references were resolved against their main versions or indexed new-roadmap heads; the two initial legendreK/legendreEc leads are planned EllipticIntegrals declarations, not claims that the functions exist at the pins. The repaired source locators were read in the certified local Deligne, Qian and BF texts; no new work or manifest key was needed. BG remains settled as uncertified, and Tate-legal remains waived; no missing reference was requested.
- The two checkouts use the same Mathlib pin 6b7abb3 and Tau Ceti pin a91d3aa. `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45` and line 53 define the two Gamma factors, line 124 gives duplication, and `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:447` identifies the zero values of total Gamma. These definitions include total values at poles, not meromorphic cancellation; the comparison therefore retains its explicit analytic convention. The pinned libraries have affine blowup machinery but no reciprocal-Dwork family, equivariant model or log-cohomology carrier that states the new geometric headline.

**Elaborated signatures.** One scratch file containing `#check @name` for each of all 38 declarations was elaborated successfully and every resulting type was compared with its README statement. No signature changed and no section hypothesis was lost: the real parameter range and N>0, both prime instances, positivity/admissibility premises and the explicit Module.Finite assertion are all present; the Lean edit changes only the module docstring.

**Adversarial mathematics pass.** The following are explicit computations and negative controls for every added mathematical assertion and every retained Lean declaration. Finite examples test conventions and hypotheses; the admitted general theorems remain proof obligations.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| PS.1.1 zero-motive adapter | rank 0 over ℚ and ℚ(i), then coefficient extension | Q=P=1; local and finite functions 1; discriminant exponent 0 gives conductor 1 in both fields | Shared zero family has the required values and transports | Cite §1.7 throughout; remove ownership of a second zero extension |
| PS.1.2 exchanged-pair trace and determinant | infinity matrix [[0,1],[1,0]], then two copies | trace 0, determinant −1; sum trace 0, determinant +1 | r pairs contribute trace 0 and determinant (−1)^r | Add the trace-based derivation |
| PS.1.2 odd-rank multiplicities | unit rank 1; Sym²H¹ rank 3; Sym⁴H¹ rank 5; Sym⁶H¹ rank 7 | geometric/supplier d±: (1,0)/(1,0); (1,2)/(2,1); (3,2)/(3,2); (3,4)/(4,3) | Equality holds for r even; the multiplicities swap for r odd | Qualify every regular-completion equality |
| PS.1.2 regular even rank | elliptic H¹, rank 2, weight 1 | Γℝ(s−1/2)Γℝ(s+1/2)Γℂ(s)/Γℂ(s−1/2) cancels to Γℂ(s) | No middle line or missing determinant parity | Preserve the even-rank comparison |
| PS.1.2 rank-three value | Sym²H¹, s=3 | Γℂ(3)=1/(2π³); Γℝ(3)=1/(2π), Γℝ(2)=1/π; geometric 1/(4π⁴), supplier 1/(2π⁴) | Ratio 2, with finite product nonzero since 3>2 | Add negative-control Check |
| PS.1.2 rank-five value | Sym⁴H¹, s=4 | both factors Γℂ(4)Γℂ(3)Γℝ(2)=3/(8π⁸) | Odd rank itself is not the obstruction | Add positive-control Check |
| PS.1.2 Tate-twist covariance | Sym²H¹(1), weight 0, middle eigenvalue −1 | trace −1, determinant +1; geometric Γℂ(s+1)Γℝ(s+1), supplier Γℂ(s+1)Γℝ(s) | The same exchanged-pair parity persists under twists | Retain general Hodge factors and their twist law |
| PS.1.2 complex places and normalizations | one complex Hodge type (0,0); two ordered types (0,1),(1,0); empty realization | factors Γℂ(s), Γℂ(s)², 1; Deligne/BCGP ratios 2,4,1 | No real-place rank restriction when there are no real places | Preserve all ranks there and the 2^b bridge |
| PS.3.2a/PS.5.4 twist range | j=2,3 versus r=0,−1; proposed r=1−j | j=2,3 are outside r≤0; r=−1,−2 are inside, but coefficient/restriction/Morita transport keeps those twists −1,−2 | No positive-twist theorem follows from the stated transports | Replace the unqualified proved-case cross-reference |
| PS.8.16a reciprocal family and domain | N=2,p=3,T=0; N=3,p=3,T=0; N=1 | first equation −2X₁X₂=0 gives two reduced points; second equation is 0=0 and gives all ℙ²; N=1 excluded | p∤N and N>1 are necessary for the stated object | State the full source domain |
| PS.8.16a symmetry group | N=2,3,5; diagonal ζ; tuple (ζ,1,1) for N=3 | H₀ orders 1,3,125; diagonal acts trivially in projective space; forbidden tuple multiplies product by ζ while fixing the power sum | Product-one quotient, rather than all scalings, preserves the family | Define the acting group and its domain |
| PS.8.16a modification versus unchanged family | N=5,T=0,X=(0,0,1,−1,0) | product 0, power sum 0, defining polynomial 0, all coordinate and T derivatives 0 | The original total space is singular here | Include the iterated blowup target and singular control |
| PS.8.16a equivariant centres and projectivity | identity coefficient base change; each coordinate-scaling action | D and D_i remain zero loci of unit multiples of their equations; each centre maps to itself; identity base change returns the same Rees algebra and blowup | Actions lift through the finite projective blowup sequence | State the construction and flat-base-change API |
| PS.8.16a charts and reduced boundary | r=1,2; compare xy=T with xy=T² | Z₁=TU eliminates Z₁; at T=0, xy=0 has ideals (x)∩(y)=(xy); xy=T² has all first derivatives zero at its origin | Specified chart excludes multiplicity and ramification changes | State charts and discriminating Checks |
| PS.8.16a log morphism | ℕ→ℕ and diagonal ℕ→ℕ² | group kernels 0 in both cases; group cokernels 0 and ℤ, with torsion 0; relative boundary has one and two branches | Standard diagonal maps are integral and the chart obstruction has no torsion | Cite CR.5:log-algebra for the log criterion |
| PS.8.16a flat versus arbitrary base change | Bl₀𝔸²→𝔸² pulled back to the origin | fibre ℙ¹; pulled-back ideal 0 on Spec k has Rees algebra k concentrated in degree 0 and Proj empty | Blowup construction does not commute with this nonflat base change | Add the negative control; unit specialization pulls back the constructed morphism |
| PS.8.16a DVR specialization | r=1 and 2, T=π,U=u∈O× | Z₁=uπ gives a smooth chart; xy=uπ gives reduced special fibre xy=0 and transverse branches | Proper projective model with strictly semistable charts | State the general DVR specialization |
| PS.8.17 quintic unit/parameter adapter | N=5,U=−5,T=λ; λ=±1/5; p=3,5 | equation −5φ=0; discriminant 1+3125λ⁵ gives 0 and 2; −5 is a 3-adic unit and a 5-adic nonunit; Z′₁=−Z₁/5 gives λ=Z′₁Z₂⋯Z_r | Sign, discriminant and coefficient hypotheses agree with the general model | Replace unavailable supplier by PS.8.16a |
| PS.8.17 invariant projector | N=5, p=3 and 5 | group order 125; v₃(125)=0 and v₅(125)=3 | Integral invariant projector exists only in the asserted scope | Retain odd p≠5 for the cohomological comparison |
| Suggested docstring: missing model carrier | pinned scheme and affine-blowup APIs | native schemes and affine blowup charts exist; reciprocal-family/model/log-cohomology carriers needed by the headline have 0 declarations at these pins | A scalar matrix identity cannot express the geometric theorem | Add the semistable-model headline to the not-statable list |
| legendreRadicand | λ=0,1/2,1; u=0,1 | D₀(1)=4; D_(1/2)(0)=1,D_(1/2)(1)=2; D₁(1)=0 | Positive in the stated domain; singular endpoint excluded | Signature unchanged |
| legendreIntegrand | λ=0 and 1/2; u=0,1/2,1 | f₀(1/2)=8/5; f_(1/2)(0)=2, f_(1/2)(1/2)=8/√17, f_(1/2)(1)=√2 | Positive branch and coefficient 2 fixed | Signature unchanged |
| legendreK | λ=0,1/4; compare correct and wrong modulus | K₀=π/2; at t=1/2, λ=1/4 radicand 45/64, while modulus λ would give 189/256 | Parameter adapter agrees with modulus √λ, not λ | Signature unchanged |
| legendreMidpoint | λ=0,N=0,1; λ=1/2,N=1 | sums 0,8/5,8/√17 | Total N=0 value is 0 and is outside the error theorem | Signature unchanged |
| legendre_substitution | λ=1/2, transformed radicand and midpoint | D=1+u⁴; transformed midpoint integrand 8/√17; both period integrals have value approximately 1.854074677 | Substitution uses the same positive branch | Signature unchanged |
| legendre_midpoint_error | λ=1/2,N=1; N=0; λ=1 | actual error approximately 0.086210323; bound 4√2 approximately 5.656854249; excluded inputs have zero denominator or panel count | All nonvanishing binders retained | Signature unchanged |
| quarticA | n=0,1,2 | factorial quotients 1,24,2520 | Empty and first coefficients agree | Signature unchanged |
| quarticG | n=0,1,2 | harmonic differences give 0,104,12276 | Factor 4 and harmonic indexing agree | Signature unchanged |
| quarticW0 | z=0 and first two coefficients | value 1; coefficients 24 and 2520 | Normalized holomorphic period fixed | Signature unchanged |
| quartic_symmetric_square | coefficients z⁰,z¹,z² | ₂F₁ coefficients 1,12,1188; square gives 1,24,2·1188+144=2520 | Squaring is essential | Signature unchanged |
| quarticMirrorCoordinate | coefficients z¹,z²,z³ | g/w₀ starts 104z+9780z²; q starts z+104z²+(9780+104²/2)z³=z+104z²+15188z³ | Zero constant term makes substitution valid | Signature unchanged |
| quarticMirror_integral | inverse coefficients through degree 3 | inverse q−104q²+6444q³; compositions have quadratic coefficient 104−104=0 and cubic coefficient 15188−21632+6444=0 | Both inverse laws and integer witnesses agree | Signature unchanged |
| dworkSeries | p=0,1,2,3 | p=0 gives exp(z) under total rational inverse; p=1 gives exp(2z); p=2 starts 1+z+z²; p=3 starts 1+z+z²/2 | Only primes enter convergence theorems; total definition has a real body | Signature unchanged |
| dworkCoeff | p=2,3,5; n=0,2,3,p | B₀=1; B₂=1 at p=2 and 1/2 at p=3,5; B₃=2/3 at p=2,1/2 at p=3; B₅=5/24 at p=5 | z^p/p normalization and index shifts agree | Signature unchanged |
| dworkPairWeight | n=0,1,2,3,4,5 | weights 0,0,0,1/2,1,35/24 | Strict unordered pairs; first two weighted summands vanish | Signature unchanged |
| dworkSigma0_summable | p=2,3, then asymptotic lower bound | p=2 first terms 1,1,4/3; p=3 first terms 1,1/2,1; lower-bound linear slopes 1/4 and 2/9 dominate logarithmic loss | Includes both small primes and tends to zero p-adically | Signature unchanged |
| dworkSigma2_summable | p=2,3,n=1,2,3 | weighted terms 0,0,2/3 at p=2 and 0,0,1/2 at p=3; harmonic valuation loss at most 2log_p(n), leaving slopes 1/4 and 2/9 | Starting sum at n=1 agrees with n≥3 | Signature unchanged |
| PositiveIndex | [],[0],[1],[2,1] | true,false,true,true | Positivity distinguishes junk exponent 0 | Signature unchanged |
| Admissible | [],[1],[1,2],[2,1],[0] | true,false,false,true,false | Empty value allowed; divergent leading exponent excluded | Signature unchanged |
| DescendingTuple | empty index; two positions (2,1),(1,2),(1,0) | empty carrier has one tuple; two-position predicates true,false,false | Both strict order and positivity are imposed | Signature unchanged |
| mzvTerm | empty tuple; k=[2,1], tuple (2,1) | empty product 1; nonempty product 1/(2²·1)=1/4 | No zero denominator enters a valid tuple | Signature unchanged |
| multipleZeta | [],[2],[1] | values 1,π²/6,0 for the total nonsummable [1] sum; [1] has no convergent analytic interpretation | Empty normalization and total-sum caveat agree | Signature unchanged |
| mzv_summable_iff | [],[1],[2],[2,1] | summability/admissibility pairs true/true,false/false,true/true,true/true | Both directions tested; positivity binder retained | Signature unchanged |
| mzv_allTwo | m=0,1,2 | 1=π⁰/1!, ζ(2)=π²/3!, ζ(2,2)=π⁴/5! | Empty and nonempty cases agree | Signature unchanged |
| mzvEncode | [],[2,1],[0],[1] | empty word,011,1,1 | Natural subtraction identifies junk zero with one; inverse claims must require positivity | Signature unchanged |
| mzvDecodeAux | pending=2, words empty,1,01 | decoded [],[3],[4] | Pending zeros are counted; trailing zeros discarded | Signature unchanged |
| mzvDecode | 011,00,empty | [2,1],[],[] | Invalid trailing-zero words are not in the claimed bijection | Signature unchanged |
| shuffles | empty with 01; 01 with 01 | singleton [01]; 0011 occurs 4 times,0101 occurs 2 times | Multiplicity is retained | Signature unchanged |
| stuffles | empty with [2]; [2] with [2] | singleton [[2]]; [2,2] twice and [4] once | Merge and duplicate terms retained | Signature unchanged |
| mzv_stuffle | k=l=[2]; empty unit | π⁴/36=2π⁴/120+π⁴/90; 1·ζ(k)=ζ(k) | Admissibility and multiplicities agree | Signature unchanged |
| mzv_shuffle | k=l=[2]; empty unit | π⁴/36=2π⁴/120+4π⁴/360; 1·ζ(k)=ζ(k) | Decode gives [2,2] and [3,1], with coefficients 2 and 4 | Signature unchanged |
| zagierCoeff | (a,b)=(0,0),(1,0),(0,1) | coefficient lists [1], [−2,9/2], [3,−11/2] | Descending-word reversal and signs agree | Signature unchanged |
| oneThree | (a,b)=(0,0),(1,0),(0,1) | [3],[2,3],[3,2] | The location of 3 is fixed | Signature unchanged |
| zagier_evaluation | (a,b)=(0,0),(1,0),(0,1) | ζ(3)=ζ(3)·1; ζ(2,3)=−2ζ(3)ζ(2)+9ζ(5)/2; ζ(3,2)=3ζ(3)ζ(2)−11ζ(5)/2 | Summation has no out-of-range subtraction: a+b−r≥0 | Signature unchanged |
| IsHoffman | [],[2,3],[1],[0] | true,true,false,false | Empty word is the weight-zero basis word | Signature unchanged |
| hoffmanDim | N=0,1,2,3,4,5,6 | 1,0,1,1,1,2,2 | Recurrence counts 2/3 words, including the empty word | Signature unchanged |
| numerical_spanning | k=[],[2],[3] | values 1,π²/6,ζ(3), each in the span of the same-weight Hoffman word itself | No independence premise is introduced | Signature unchanged |
| mzv_span_finrank_le | N=0,1,2,5 | dimensions/bounds 1≤1,0≤0,1≤1,≤2; finite generation retained explicitly | Weight-one span is zero; finrank alone would not certify finiteness | Signature unchanged |

**Validation.**

Commit: `a6514105` — `PeriodsAndSpecialValues: review repairs (completion parity, semistable ownership, rank-zero reuse and twist scope)`. Only `TauCetiRoadmap/PeriodsAndSpecialValues/README.md` and `TauCetiRoadmap/PeriodsAndSpecialValues/Suggested.lean` changed; the worktree is clean. No push or GitHub write was made.

Build command: `lake build TauCetiRoadmap.PeriodsAndSpecialValues.Suggested`.

Exact build outcome: exit 0; 13 expected `declaration uses sorry` warnings and no errors; `Build completed successfully (8976 jobs).`

Exact dependency-check output (exit 0; no UPWARD, CYCLE or moved line):

```text
depcheck: 48 roadmaps, 553 edges, 0 problem(s)
```

The initial gate found only the two uncommitted authorized files; after committing, the required gate exited 0 with the exact summary:

```text
gate PeriodsAndSpecialValues: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
