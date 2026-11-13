<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6864739458 -->
Review (codex) of e98c49a

Verdict: needs_changes

1. **F01** (P3) Correct the missing-carrier inventory for curve completions

   **Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean:49`: “lack the weak and the `p`-adic completions of a lifted affine curve”.

   **Claim.** The new explanation for not stating MS.2.2, MS.2.3, MS.2.6, MS.2.7 and MS.2.9 includes these two ring constructions among the absent carriers.

   **Witness.** At the pinned Tau Ceti commit, `TauCeti/RingTheory/Dagger/WeakCompletion/Basic.lean:79` defines `piAdicCompletion`; :190 defines `weakCompletion` for every finite-type algebra; :229 supplies its structure map. Both instantiate on `Polynomial ℤ_[2]`.

   I checked the tracked file at commit `2fd255d997f47c0b5d834ee416c7015d55444ce5`, not a newer checkout. The weak completion is an actual subalgebra of the adic completion, with degree-growth membership and a map from the original algebra. A lifted smooth affine curve satisfies its finite-type hypothesis. Tensoring with the fraction field uses native algebra. The parent already acknowledges this carrier in `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:1838` (§RD.0.42, open #1002).

   **Exact repair.** In this bullet replace

   ```text
   lack the weak and the `p`-adic
     completions of a lifted affine curve, its completed generic field and its local fields with
     their embeddings,
   ```

   with

   ```text
   lack the completed generic field of a curve and its local fields with their
     embeddings,
   ```

   Keep the rest of the bullet, including the missing convergent and overconvergent coefficient categories. No surrogate theorem or new declaration is requested. This is an inaccurate account of the pins, not evidence that the five headline theorems are now statable.

   **Retest.** A scratch file importing `Mathlib` and `TauCeti.RingTheory.Dagger.WeakCompletion.Basic` elaborated `#check @TauCeti.Dagger.piAdicCompletion`, `#check @TauCeti.Dagger.weakCompletion`, `#check @TauCeti.Dagger.weakCompletion.of` and both specialisations to `ℤ₂[x]`. The types retain `[Algebra.FiniteType O S]` for the weak completion. The exact documentation repair above also elaborated in a separate scratch copy, exit 0, no warnings. The reviewed package was not edited.

## Verified sound

### Previous finding and change boundary

I first read round 6 and its round 7 repair, then compared the reviewed files against `b8e3dcb2`. The README, metadata and source manifest are unchanged; only six module-docstring bullets were added. The earlier mathematical table has computed values for each of the 69 numbered targets. Its unchanged rows may therefore be retained under this review's instructions; its assertions about the library were checked again, and its assertion that weak completions are absent was not retained.

| Previous finding | Repaired passage | Disposition |
| --- | --- | --- |
| F01 (P3), missing advertised headlines in the docstring | `Suggested.lean:38`: “The opposite slope rank bound (README MS.0.4”; :53: “Local graded recovery, the curve irreducibility criterion and curve graded recovery”; :62: “Lefschetz fibre reconstruction, the coefficient-linear trace formula” | **Repaired.** All 31 theorem entries in the overview now occur explicitly. The newly added explanation has the separate R01 defect above. |

The repair correctly preserves the connection-free generality of MS.0.4 and both its local and generic coefficient pairs. It correctly distinguishes the existing bounded-disc ring from its missing differential Frobenius-module theory. Its account of the MS.6.7 averaging step agrees with the native finite-group average. No previous finding was marked not actionable. There are no maintainer notes to adjudicate.

### Sampled sources and fresh adversarial checks

No author-flagged unverified locator occurs in the mathematical package. There are nine cited works and nine manifest keys. Seven cached texts are available; DEJONG98 and TSU98 remain settled uncertified references, not new source requests. No source fetch or manifest change was necessary.

| Sample | Locator actually read | Hypotheses and support |
| --- | --- | --- |
| PBQ, MS.0.9 | TSU Definition 3.16, p.16, TSU line 864; Definition 3.22, p.17, TSU line 920 | Purity belongs to the bounded quotient; bounded-disc and bounded-Robba PBQ are tested after extension to the Amice field. |
| PBQ convention | CT11 Definition 5.1, printed p.55, CT11 line 996; OHK Definition 5.10 and Lemma 5.11, p.27, OHK line 1336 and line 1343 | OHK expressly includes zero, at line 1341. The README expressly uses the nonzero convention, so there is no silently changed zero case. |
| Curve PBQ, MS.2.1 | TSU Definition 3.26, p.18, TSU line 991 | A generic realisation on an affine open with compatible lift; not purity of every fibre. |
| Lefschetz condition, MS.6.1 | TSU §6.3, condition (LC), p.28, TSU line 1456 | The separated finite-type setting, irreducibility, curve morphism and residue-field-rational lift are present. Passing to the component containing the lifted point permits the connected-curve formulation. |
| Coefficient Lefschetz input | AE §1.1, p.4, AE line 153; Theorem 3.10, p.17, AE line 747 | Coefficient extension is retained, and each selected closed point factors through the curve over its own residue field. Absolute coefficient irreducibility is the appropriate finite-model formulation. |

These fresh computations test both the definitions and their plausible wrong alternatives. Write `L_s` for the constant line of normalized slope `s`, and `J` for the logarithmic extension with slopes −1 and 0 and connection `∇e₂=e₁ dt/t`.

| Statement | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| MS.0.9 PBQ | 0; L₀; L₁ ⊕ L₀; J | Bounded quotient ranks 0,1,2,1; slope sets ∅,{0},{1,0},{0}; PBQ false,true,false,true | Nonzero convention and non-purity control agree; none |
| MS.0.10 quotient criterion | L₁ ⊕ L₀ → L₀; J → L₀ | Maximal slopes 1→0 versus 0→0; first source non-PBQ, second PBQ | Both directions discriminated; none |
| MS.0.11 tensor criterion | L₀ ⊗ 0; (L₁ ⊕ L₀) ⊗ L₀² | Ranks 1→0 and 2→4; PBQ true→false in excluded zero-factor case; bounded slopes (1,1,0,0) in second | Nonzero factor needed; none |
| MS.1.2 graded formula | L₁ ⊕ L₀; J | Bounded slopes (1,0) equal grade-top slopes (1,0); nested-top substitute (1,1) differs. J gives rank 1, slope 0 on both sides | Grade convention correct; none |
| MS.1.8 growth comparison | J, λ=−1,0,1; p=2,3 | Growth dimensions 0,1,2 equal shifted slope dimensions 0,1,2; logarithm coefficient at p^r has norm p^r | Shift and negative-index convention agree; none |
| MS.2.1 curve PBQ | Zero, unit, split constant object on a nonempty affine open | Generic bounded ranks 0,1,2 and PBQ false,true,false before and after restriction | Generic definition discriminates; none |
| MS.6.1 LC | Identity of A¹/F_p; A¹/F_(p²) → A¹/F_p, origin | Fibre rational-point counts 1 versus 0, while image contains origin in both; pullback rank 1 in both | Image-only substitute rejected; none |
| MS.6.6 trace | Point with Frobenius 2, n=1,2; A¹ with unit coefficients | Local/cohomological traces 2=2 and 4=4; #A¹(F_(q^n))=q^n equals compact-support trace q^n | Iteration and dual twist correct; none |
| MS.6.7 projected average | Order-two swap on K²; identity order-one action | Av(1,0)=(1/2,1/2)=TAv(1,0); Av for m=1 is identity; primitive projector trace 1, identity trace 2 | Native average is only one step of the geometric result; none |
| New docstring completion claim (R01) | O=ℤ₂, S=O[x], π=2; general finite-type O-algebra | Claimed absent ring carriers: 2; native carriers elaborated: 2. For x, degree bound c=1 with P₀=X and P_j=0 (j>0) satisfies 1≤1 and every truncation is x | Correct missing-carrier inventory as R01 |

### Headline coverage and retained computed evidence

The following inventory exhausts the 31 advertised theorem headlines. All are named as not statable, with their missing structures. The ring correction in R01 does not supply the missing generic/local comparisons or isocrystal categories.

| Headline results | Docstring lines | Missing structures |
| --- | --- | --- |
| MS.0.4 opposite slope bound | 38–41 | Both analytic Frobenius-field pairs and their slopes |
| MS.0.7 bounded splitting; MS.1.1 PBQ filtration; MS.1.8 growth/slopes; MS.3.7 local reconstruction | 29–32 | Analytic differential Frobenius modules, solutions and slopes |
| MS.1.2 bounded graded formula; MS.1.4–MS.1.5 descent | 42–45 | Bounded quotients, PBQ grades and modules over the bounded disc |
| MS.2.2–MS.2.3 intersections/gluing; MS.2.6 transport; MS.2.7 bounded quotient; MS.2.9 convergent PBQ filtration | 46–52 | Curve generic/local comparisons and coefficient categories; R01 removes the already-native ring completions |
| MS.2.5 curve PBQ; MS.4.2 curve rank theorem | 26–28 | Generic field and its bounded differential quotients |
| MS.3.6 local graded recovery; MS.4.3 irreducibility; MS.4.4 curve graded recovery | 53–56 | PBQ grades and saturation on the analytic coefficient categories |
| MS.4.6 specified-map theorem; MS.4.8 minimal-slope dual | 19–23 | Convergent/overconvergent categories and extremal slope pieces |
| MS.5.3 reductions; MS.5.5 generic minimal slopes; MS.5.6 affine-line reduction | 57–61 | Frobenius isocrystals, hulls and generic-pair modules |
| MS.5.7 minimal slopes on curves; MS.5.8 docile full faithfulness | 24–25, 36–37 | Dagger hulls and docile isocrystals |
| MS.6.3 fibre reconstruction; MS.6.6 coefficient trace; MS.6.7 projected average; MS.6.10 fibrewise criterion | 62–69 | Coefficient isocrystals, fibres, rigid cohomology and weights |
| MS.6.13–MS.6.14 finite-field theorems | 33–35 | Algebraic-closure coefficients and Lefschetz/weight structures |

The overview's remaining entries are definitions/constructions or the MS.2.8 example, not omitted theorem headlines. A finite-group averaging theorem on a bare representation would be padding, not a statement of MS.6.7 on its geometric carriers.

Below are the round-6 computed rows retained for the unchanged headline targets and the sampled definitions. These are explicitly inherited evidence, not a claim to have rerun every prior computation. Fresh computations appear above. The other 35 unchanged numbered targets retain their individually computed rows in `REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII_r6.md`; no section is inherited solely from an uncomputed assertion of soundness.

| Target | Instances | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| MS.0.4 | Unit into unit or unit square; split projection | Top/target ranks 1=1 or 1<2; maxima 0=0; split projection has maxima 1!=0 and dagger kernel rank 1 | Consistent; spanning needed for equality  None |
| MS.0.7 | Zero, line, split, J | Bounded-solution rank versus total rank 0=0,1=1,2=2,1<2; split class 0 versus J class nonzero | Consistent  None |
| MS.0.9 | Zero, unit, split, J | Bounded slope sets empty,{0},{1,0},{0}; PBQ false,true,false,true | Consistent, nonzero convention explicit  None |
| MS.1.1 | Zero, line, split | Filtration lengths 0,1,2; split grade maxima (1,0), nested maxima (1,1) | Consistent  None |
| MS.1.2 | Split; J | Both bounded quotient and sum of grade tops have slopes (1,0), rank2; for J both rank1, slope0; nested-top substitute gives (1,1) | Consistent  None |
| MS.1.4 | Split over bounded Robba field; irreducible line | Descended first step rank1 slope1; completed step rank1 slope1; line filtration length1 | Consistent  None |
| MS.1.5 | Constant disc line; CT11 rank3 example | Line filtration length1; CT11 slopes 0,1/2,1, first step span(e1,e3) rank2 max1, quotient rank1 slope1/2; bounded quotient has slopes1/2,1 and is not pure | Consistent  None |
| MS.1.8 | J at lambda=-1,0,1; p=2,3 | Both growth and shifted-slope dimensions 0,1,2; log coefficients at p^r have norms p^r | Consistent  None |
| MS.2.1 | Zero, unit, split on a curve | Generic bounded ranks0,1,2; PBQ false,true,false on any nonempty affine open | Consistent  None |
| MS.2.2 | G_m series sum p^n x^(p^n); 1/x on A1; nonfree line | Completed membership true, infinity-dagger membership false since p^(-n)r^(-p^n)->infinity; order_0(1/x)=-1 excludes interior; elliptic 2-torsion class nonzero, local rank1 | Consistent  None |
| MS.2.3 | Generic line slope1; rank0/full; diagonal in unit square | Twist multiplier q by q^(-1) gives slope0; glued ranks0,2; wedge kernel of e1 wedge(-) has rank1 | Consistent  None |
| MS.2.5 | Split and irreducible line | Grade maxima (1,0), filtration length2; line length1, max0 | Consistent  None |
| MS.2.6 | Degree-p Artin-Schreier cover; identity | Pullback unit rank1, pushforward rankp, all p slopes0; identity ranks1=1 | Consistent  None |
| MS.2.7 | Split; ordinary Legendre | Split bounded rank2=2; Legendre top rank1 slope1, dagger structure=false; at supersingular point slopes1/2,1/2 and global filtration hypothesis fails | Consistent  None |
| MS.2.9 | Unit, split, zero, Legendre unit-root kernel | Filtration lengths1,2,0,1; kernel generic/local rank1=1 and bounded slope0; no dagger structure asserted | Consistent  None |
| MS.3.6 | Split with grade maps scalars2,3 | Bounded map diag(2,3) lifts to the same two grade maps; lengths2=2, rank2=2; nested-top slopes1,1 would mismatch1,0 | Consistent  None |
| MS.3.7 | Unit map2; J versus unit | Unique lift2; J/unit top ranks1=1 but total ranks2!=1, excluded by failed saturation | Consistent  None |
| MS.4.2 | Legendre, unit identity, split projection, P=0 | Legendre P1 rank2 max1, convergent image rank1 slope1, top/target ranks1=1; unit maxima0=0 ranks1=1; split dagger kernel1; zero excluded | Repaired reference applies  None; prior repair verified |
| MS.4.3 | Unit, split, J | Irreducible=true,false,false; (PBQ,saturated,irreducible top)=(true,true,true),(false,false,true),(true,false,true) | Consistent  None |
| MS.4.4 | Split with scalar grade maps2,3 | Recovered overconvergent map diag(2,3), each top rank1=1; zero has empty sum rank0=0 | Consistent  None |
| MS.4.6 | Unit map2; J versus unit; proper curve | Unique lift2; J/unit ranks2!=1 excluded by saturation; proper irreducible filtered object's top rank equals full rank | Consistent  None |
| MS.4.8 | O(1), map2, dual twice | Slopes -1->1->-1; scalar2->2->2; lifted arrow has original direction | Consistent  None |
| MS.5.3 | n=1,2, ambient unit and N=0; n=2 split | Ambient first-step ranks1,2; subobject ranks0,0. Split induced slopes0,0,1,1, rank4, minimal step rank2=2; slope1 block polynomial T^2-q^2 | Consistent  None |
| MS.5.5 | Generic constant split M; N=L_0 or0 | Hull N=N, first-step ranks1=1 or0=0; slopes0=0; generic residue k(t), not k((t)) | Consistent  None |
| MS.5.6 | Artin-Schreier y^p-y, p=2,3; identity | Degree p, derivative -1, ramification index p at infinity; identity degree1 | Consistent; no tame assumption  None |
| MS.5.7 | Legendre unit-root line; proper curve; zero | Hull rank2, first-step rank1=rank N; proper hull=N; zero0=0 | Consistent  None |
| MS.5.8 | P2/F_(p^2) with line; Dwork on A2 restricted x=0 | H0 K-dimensions2=2; non-docile Dwork dimensions0!=1 | Consistent; docility essential  None |
| MS.6.1 | Identity curve; constant field extension curve at origin | Residue-rational lifts1 versus0; pullback ranks1 versus1; wrong image-only condition would accept second curve | Consistent  None |
| MS.6.3 | Equal constant lines and map2; distinct constant multipliers | Ranks1=1, fibre multipliers a=a; a!=b forces Frobenius-equivariant scalar0, excluded | Consistent  None |
| MS.6.6 | Point multiplier2, n=1,2; affine line unit | Traces2=2 and4=4; affine line compact-support F=q yields #A1(F_(q^n))=q^n; dual twist O(-1) multiplierq | Consistent  None |
| MS.6.7 | m=1,2, cyclic swap T | m=1 Av=id; m=2 Av(1,0)=(1/2,1/2)=TAv; primitive trace1, identity trace2, cyclic composites2 versus4 | Consistent  None |
| MS.6.10 | Equal unit lines on A1; unequal lines on a point | Hom weight0, L-function (1-qt)^(-1), pole at1/q; unequal eigenvalues a!=b violate fibre equality | Consistent  None |
| MS.6.13 | Equal rank-one objects, nonzero scalar2 | Top/full ranks1=1; equal weight difference0; induced map rank1 | Consistent  None |
| MS.6.14 | Labelled lines with g'=2,h=3 | h Top(g')^(-1)=3/2, inverse2/3, (3/2)2=3; wrong composite h Top(g') is not typed | Consistent  None |

The standing hypotheses exclude the zero coefficient ring, equal-characteristic coefficients and q=1. Zero modules are allowed with empty filtrations, B(0)=0 and no numerical maximal slope. The general statements retain p=2 and p=3; p≡1 mod4 is a condition on the Legendre–Kummer example only. The raw-to-normalized slope conversion gives v_π(p²)/v_π(p²)=1 both in the unramified case (2/2) and in ramification index two (4/4). Duality sends a line of slope −1 to slope 1 and back; the Tate convention remains O(1) of slope −1.

### Library and Lean checks

The manifest and both library HEADs match the advertised pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. I opened the following pinned declarations, including the surrounding binders:

| Declaration | File and line at the pin | Interface checked |
| --- | --- | --- |
| LinearMap.quotKerEquivRange | `Mathlib/LinearAlgebra/Isomorphisms.lean:39` | Module quotient by kernel to range, without analytic descent |
| Representation.averageMap, averageMap_invariant, averageMap_id | `Mathlib/RepresentationTheory/Invariants.lean:126`, :131, :137 | Finite group and invertible cardinality at :121 |
| LinearMap.trace, trace_one | `Mathlib/LinearAlgebra/Trace.lean:75`, :190 | Zero outside the finite-basis branch; finite/free context at :168 for the identity formula |
| Padic.norm_p_pow | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:881` | Natural powers, integer negative exponent on the real norm |
| FixedPoints.subfield | `Mathlib/FieldTheory/Fixed.lean:103` | Fixed subfield of a monoid action |
| WittVector.Isocrystal, isocrystal_classification | `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`, :179 | Semilinear equivalence, no connection or finite-rank field in the class; classification only in rank one over algebraically closed k |
| PowerSeries.derivative | `Mathlib/RingTheory/PowerSeries/Derivative.lean:50` | Formal derivation; no compatible Frobenius lift |
| PowerSeries.HasGaussNorm.subring, mem_subring_one_iff | `TauCeti/RingTheory/PowerSeries/Bounded.lean:63`, :81 | Weighted boundedness, positive radius; radius one gives bounded coefficients |
| PowerSeries.OnOpenDisc.subring | `TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean:295` | Series on the open disc; derivative stability also exists at :342 |
| TauCeti.Dagger.piAdicCompletion, weakCompletion, weakCompletion.of | `TauCeti/RingTheory/Dagger/WeakCompletion/Basic.lean:79`, :190, :229 | Native completion carriers and structure map; R01 |

The 14 library names referenced by the package resolve. Additional completion and derivative checks distinguish existing ring APIs from absent differential Frobenius structures. Object searches at the actual pins found no PBQ, Robba-field, dagger-hull or overconvergent-isocrystal carrier. Amice transforms of measures are not the Amice field. The weak-completion search did find the carrier above, invalidating that part of the repair's inventory.

The prescribed package `lake env lean` invocation from the content checkout exited **0, with no output and no warnings**. The file contains one `import Mathlib`, one module docstring and the correct empty namespace. There are **0 declarations, 0 sorried theorems, 0 examples, 0 sorried data and 0 set_option occurrences**. The exhaustive one-tactic padding inventory therefore has **0 entries**. The exhaustive `#check @name` inventory for package declarations also has **0 entries**: there is no signature or discarded section hypothesis to inspect. The separate completion witness did print and check its native signatures. No build was needed because its imported object's compiled file exists.

All own backticked expressions in the README are mathematical notation, while advertised library identifiers are attributed to suppliers; no missing own Lean declaration was found. The automatic resolver reported no unresolved roadmap citations or own Lean names; its disclaimer about not checking pinned libraries is covered by the manual checks above.

### Suppliers, gaps and order

I reopened every explicitly numbered parent citation at the readable head of **#1002**, including the statement, and read all **69 Needs paragraphs** and **seven layer dependency paragraphs**. The following inventory gives heading lines in `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md` (excluding the tool's presentation header):

- RD.0: RD.0.1:722, RD.0.9:957, RD.0.17:1166, RD.0.26:1413, RD.0.34:1602, RD.0.35:1639, RD.0.36:1672, RD.0.37:1712, RD.0.38:1737, RD.0.39:1758, RD.0.42:1836, RD.0.48:2015, RD.0.53:2159.
- RD.1: RD.1.13:2629, RD.1.22:2865, RD.1.25:2939, RD.1.27:3006, RD.1.32:3115, RD.1.35:3179, RD.1.36:3216, RD.1.37:3246, RD.1.39:3287, RD.1.40:3307, RD.1.41:3331, RD.1.43:3366, RD.1.44:3408, RD.1.45:3430, RD.1.72:4117.
- RD.2: RD.2.22:4770, RD.2.28:4969.
- RD.3: RD.3.15:6057, RD.3.16:6073, RD.3.19:6148, RD.3.22:6233, RD.3.25:6317, RD.3.29:6430, RD.3.31:6477, RD.3.32:6503, RD.3.33:6534, RD.3.34:6572, RD.3.37:6704, RD.3.38:6741, RD.3.39:6763, RD.3.40:6790, RD.3.41:6808, RD.3.45:6939, RD.3.47:6992, RD.3.48:7024.
- RD.4: RD.4.19:7642.
- RD.5: RD.5.2:8765, RD.5.4:8793, RD.5.7:8856, RD.5.8:8880, RD.5.8c:8946, RD.5.29:9405, RD.5.89:10727, RD.5.100:10972, RD.5.103:11081, RD.5.112:11313.
- RD.6: RD.6.2:11524, RD.6.4:11589, RD.6.23:12040, RD.6.28:12135, RD.6.42:12468, RD.6.47:12638, RD.6.57:12904, RD.6.59:12967, RD.6.60:12997, RD.6.61:13012, RD.6.77:13328, RD.6.82:13427, RD.6.85:13496.

All 72 cited IDs resolve. In particular RD.1.36 supplies fixed-slope subquotients, RD.3.34 the abelian convergent category, RD.3.37 restriction and exact realisation, and RD.5.8c étale descent on smooth schemes. Local complete residue fields and D'Addezio's residue k(t) are not conflated. The latter embeddings are expressly a gap, not an assertion that RD.0.53 already applies.

The other supplier sections were read on main: `TauCetiRoadmap/AlgebraicCurves/README.md:478` (Layer 2, affine Dedekind models/local intersections), :1468 (Layer 12, regular models and the perfect-field smooth completion), and `TauCetiRoadmap/RigidAnalyticGeometry/README.md:434` (Layer 5, finite-cover acyclicity). Their openings and layer layout also served as the requested house-shape comparison. No upward supplier, missing cited section, or new duplicate owned construction was found.

The nine `design/plan.json` needs strings occur byte-for-byte in the README's exact supplier contracts, with matching slugs and named parent supplier:

| Gap | What remains beyond the cited supplier |
| --- | --- |
| extended-log-robba-growth | Extended logarithmic embedding, multiplication injectivity and eigenvector growth beyond RD.0.34/RD.2.28 |
| dejong-disc-robba-submodules | Saturated submodule descent from bounded Robba to bounded disc beyond RD.5.4 morphism full faithfulness |
| unit-root-correspondence-perfect-base | General fixed coefficients over a perfect base beyond RD.3.48 and RD.6.61 |
| legendre-kummer-extension | Specified rank-two cohomology and extension eigenspace beyond the RD.6.47 Kummer object |
| irreducible-iota-purity | Absolute coefficient irreducibility and coefficient-linear purity in all smooth dimensions beyond RD.6.77 |
| lefschetz-curves-irreducibility | Curves through selected closed points preserving absolute coefficient irreducibility |
| docile-curve-restriction | H⁰ restriction beyond the logarithmic extension of RD.5.103 |
| coefficient-linear-weil-ii | Weight bound on the retained L-linear spectrum beyond K-linear RD.6.85 |
| dejong-generic-affine-line-comparison | Generic k(t) embeddings/injectivity beyond the complete-residue-field results |

Their hypotheses are precise, each construction/compatibility bundle describes one interface, and none is owned by `none`. No requested interface is already supplied in full by this package or the inspected pins/parent. They remain declared contracts, not defects. This needs-changes verdict concerns only R01; eventual acceptance remains conditional on these nine contracts.

The prescribed dependency check completed with exactly:

```text
depcheck: 240 roadmaps, 2176 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

### Ownership and overlap

I read the supplied board-package index and open-roadmap list before making absence claims. The main checkout has no second copy of this Part II. The supplied overlap report has no conflicting head, dropped ID or revision-only citation. Readable open heads were obtained with `roadmaps show`; object searches used `roadmaps grep` and searches of the actual pinned trees and available board READMEs.

The three closest-roadmap lists contain five candidates in the open-vocabulary list and none in the other two lists. Their scopes were read:

- **#1002 PadicDifferentialEquationsAndRigidCohomology**, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:50`: coefficient rings, ordinary slope theory, isocrystals, cohomology and weights are imported; Part II owns PBQ, saturation and minimal-slope reconstruction.
- **#2289 KloostermanSheavesAndBesselIsocrystals**, `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:25`: owns group-specific Kloosterman/Bessel constructions; :99–100 explicitly imports Part II MS.4.6.
- **#2265 CrystallineCohomologyPartII**, `TauCetiRoadmap/CrystallineCohomologyPartII/README.md:8`: owns singular Witt cohomology and its slope-below-one comparison, leaving rigid coefficients to the parent; this is not PBQ or dagger-hull ownership.
- **#879 FiniteFlatGroupsAndIntegralPadicHodgeTheory**, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:52`: owns integral/group-theoretic applications and classifications, not PBQ or minimal-slope reconstruction.
- **#1062 PadicHodgeTheory**, `TauCetiRoadmap/PadicHodgeTheory/README.md:7`: rational periods and comparisons; imports analytic carriers and ordinary isocrystals, not a second PBQ development.

The additional “Lefschetz condition” hits in #1725 SatoTateGroups at `TauCetiRoadmap/SatoTateGroups/README.md:888` concern compact-group centralizers. The available `packages/PurityForFlatCohomology/design/README.md:2169` concerns SGA 2 local Picard/Lefschetz conditions. Neither shares the curve-restriction predicate here. No same fully qualified Lean name can collide because this package declares none.

Overlap check: read PadicDifferentialEquationsAndRigidCohomology, KloostermanSheavesAndBesselIsocrystals, CrystallineCohomologyPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory; shared coefficient rings/isocrystal foundations belong to the parent and its named suppliers, Witt slope theory to CrystallineCohomology, integral classifications to FiniteFlatGroupsAndIntegralPadicHodgeTheory, and curve minimal-slope reconstruction to this Part II, explicitly consumed by KloostermanSheavesAndBesselIsocrystals; no second ownership found.

### Principles, shape and source independence

The unchanged roadmap extends its parent and identifies its stopping point. No route-specific narrowing of the general theorems, good-prime restriction on the library, computational algorithm, cycle, copied source passage, forbidden supplier, sorry'd data or set_option was found. The package's prose has no pull-request numbers, local machine paths, HTML anchors or review/job narrative. Metadata is `topic = "math.AG"`.

Counts checked mechanically: **69 numbered targets, seven layers, 20 definition/API blocks, 69 Needs paragraphs, seven Examples endings and seven Dependencies endings**. The definition Check counts in order are `3,5,4,4,3,3,3,5,3,3,3,3,3,3,3,3,3,4,3,4`. The unchanged per-target mathematical evidence is retained only where the previous table actually computed values, as stated above. All six added docstring bullets were inspected against their targets and the pinned carriers; R01 is the only requested repair.

For wording I compared **12 passage pairs across five sources**: MS.0.9 against TSU, CT11 and OHK; MS.2.1 against TSU; MS.6.1 against TSU; the coefficient Lefschetz contract against AE; and five further passages in distinct sections, MS.0.4 (TSU line 513), MS.1.2 (TSU line 878), MS.1.8 (OHK line 1933), MS.5.1 (DAD line 435), MS.6.6 (TSU line 1709), plus the added headline-docstring inventory against TSU's result/section inventory. These contain independently phrased specifications and proof routes, with shared standard terminology and forced formulas rather than copied prose or clause-by-clause reproduction. No source table, figure, exercise list or numerical dataset was reused. There is no package Lean declaration to compare with an external formalisation.

I recounted explicit author-attributed locator passages before References, counting a combined theorem/page citation once: TSU 100, DAD 17, OHK 12, CT11 7, AE 5, KED04 1, KED05 1, DEJONG98 1, TSU98 1; total 145. I read TSU's section inventory directly at TSU lines 191, 540, 1147, 1241, 1340 and 1506 and its subsection headings. The mathematical layout is not a one-to-one source-section copy: MS.0 combines opposite slopes, bounded modules and coefficient normalization; MS.1 adds CT11/OHK growth; MS.2 separates generic/local gluing and the convergent variant; MS.3 combines local and global saturation; MS.5 adds the DAD hull branch; MS.6 combines Lefschetz, coefficient traces, weights and AE inputs. The common progression is forced by the Needs edges: MS.1.1 uses MS.0.7/MS.0.10, MS.2.5 uses local descent and MS.2.3 gluing, MS.4.2 uses MS.2.9/MS.4.1, MS.4.6 uses MS.4.3/MS.4.4, and MS.6.3 uses curve reconstruction. No layer is named after a source chapter.

Source independence: 12 passages compared with 5 sources, no copied expression found; largest share TSU, 100 of 145 explicit locator passages; contents compared with TSU's complete section inventory: independent, with common ordering supported by the stated dependencies.

## Not verifiable

- DEJONG98 Proposition 6.4: settled uncertified/paywalled. Its contract and cited use were checked; its original text was not requested again.
- TSU98 Theorems 4.2.6 and 7.2.3: settled uncertified/paywalled. Its contract and use were checked; its original text was not requested again.
- Ownership against unavailable board-package branches is not claimed. Searches cover the readable indexed open-roadmap heads, main and available board files.
- A successful empty-signature Lean elaboration does not prove the README mathematics. The retained and fresh tables are computed adversarial evidence, not formal proofs of the general results.

## Source issues

The following issues were confirmed in the passages opened this round. They are already avoided by the package and are not additional package findings.

- **Misprint** in TSU at Proposition 3.18, printed page 16: the source says unit-root tensoring always preserves and reflects PBQ; it should require a nonzero tensor factor under its PBQ convention; affects a stated result.
- **Misprint** in TSU at Theorem 3.19(1)–(2), printed pages 16–17: the source says nested terms have decreasing maxima and their tops give the bounded quotient; it should use successive grades in both assertions; affects a stated result.
- **Misprint** in TSU at Lemma 3.31, printed page 19: the source says the pushed object starts on the base and the pulled object on the cover; it should interchange those starting curves; affects a stated result.
- **Gap** in TSU at proof of Lemma 3.31, printed page 19: the source says its pullback argument concludes PBQ of the original object and then cites itself; it should establish pullback using bounded-quotient base change; affects the proof.
- **Misprint** in TSU at proof of Corollary 6.8, printed page 29: the source says the intermediate curve isomorphism ends at the restriction of N; it should end at the restriction of M; affects the proof.
- **Error** in TSU at proof of Lemma 7.11(3), printed page 33: the source says L tensor L over K splits into copies of embedded L without normality; it should split after extending the second factor to the algebraic closure; affects the proof.
- **Misprint** in TSU at proof of Proposition 7.12, printed page 34: the source says twisting by lambda multiplies the nth Frobenius trace by lambda; it should multiply by lambda to the nth power; affects the proof.
- **Misprint** in DAD at proof of Lemma 4.1.4, printed page 12: the source says the induced hull sum equals its first slope step; it should apply the first-step operator to the initial sum; affects the proof.
- **Misprint** in OHK at Corollary 5.12, printed page 27: the source says every quotient of an arbitrary module is PBQ; it should assume the original module is PBQ; affects a stated result.

Source lines: TSU 872, 878, 1019, 1026, 1493, 1706, 1767; DAD 455; OHK 1350. Concrete controls are the zero tensor factor, split slopes (1,0), non-normal cubic coefficients, and the scalar 2 at n=2 (4 rather than 2).

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e98c49a6cdf92666303f8ca7e80fdf1e5112ce11", "job": "REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~7", "model": "gpt-6-astra", "worker": "chris-10"} -->
