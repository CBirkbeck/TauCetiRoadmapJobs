<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6782041802 -->
Review (codex) of aec2c9b

Verdict: needs_changes

1. **F01** (P1) Forgetting coefficient structure does not preserve purity

   **Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:2111–2113`: “the underlying object over `K` is a sum of copies of one irreducible overconvergent F-isocrystal, which is `ι`-pure”. The false input is also requested at line 312 and in the plan's `irreducible-iota-purity` contract.

   **Claim.** Irreducibility over the finite coefficient field K suffices for purity of all K-linear Frobenius eigenvalues, so the finite L-model in MS.6.9 can be treated by forgetting L.

   **Witness.** On `Spec 𝔽₃`, take `K=ℚ₃` and `F=[[0,1],[1,1]]`. Its polynomial `T²−T−1` is irreducible modulo 3, but its complex roots have magnitudes `(1+√5)/2` and `(√5−1)/2`, which differ.

   The polynomial takes values `2,2,1` at `0,1,2` modulo 3. Thus the rank-two object is irreducible over ℚ₃; F is invertible, with determinant −1. Its two complex absolute values are approximately `1.618033988749895` and `0.6180339887498948`, giving weights approximately `0.876035758971885` and `−0.876035758971885`. No common real weight exists. The same example can be made constant on the smooth geometrically connected curve `A¹_𝔽₃`.

   This is precisely a possible forgotten finite model: put `L=ℚ₃(√5)` and let F act by multiplication by `a=(1+√5)/2` on the L-line. It is absolutely irreducible as an L-object. Forgetting L produces the rank-two counterexample. AE line 153–163 defines the algebraically closed coefficient category; AE line 539–553, Theorem 2.7, printed page 13, does not assert purity of every irreducible finite-K object. The source has no corresponding error.

   **Exact repair.** Retain MS.6.9(a) over `Q̄_p`. Replace its coefficient-forgetting purity argument by purity for an absolutely irreducible finite L-model, measured using the L-linear Frobenius and the chosen embedding of L into `Q̄_p` and then ℂ. Synchronize the same supplier-gap slug in the README and `design/plan.json`: for smooth connected X over `𝔽_q`, finite `L/K`, and a K-object with an L-action that stays irreducible after every finite coefficient extension of L, request purity of its L-linear Frobenius for each chosen embedding. Apply that contract directly. Do not require the forgotten K-object to be absolutely irreducible: that would wrongly exclude legitimate L-models. Add the quadratic example as a negative-control Check for forgetting coefficients.

   **Retest of repair.** The L-linear spectrum is the singleton `{a}` and has the single weight `2 log₃|ι(a)|`. After forgetting L, the spectrum is `{a,1−a}`, with the two unequal magnitudes above. The repaired input proves exactly what the Q̄ₚ target needs and makes no false purity assertion about the forgotten object. This finding does not object to waiting for a declared gap; it objects to false mathematics expressly used in the target's proof route.

2. **F02** (P3) The Lefschetz definition lacks a third discriminating Check

   **Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1894–1895`: “Separate witnesses for `M†` and `N†` do not give one curve on which both stay irreducible; proofs must allow two curves.”

   **Claim.** This bullet serves as the third Check for MS.6.1. It gives no instance or computed outcome. The other two bullets only test successful witnesses, and neither rejects the plausible wrong definition that requires the curve's image to contain α but omits the specified residue-field point.

   **Witness.** Let `X=A¹_𝔽ₚ`, `α=0`, and M be the unit. The curve `C=A¹_(𝔽_(p²))`, with `x↦s`, has irreducible rank-one pullback and image containing α, but its fibre there is `Spec 𝔽_(p²)`, with no `𝔽ₚ`-point.

   **Exact repair.** Replace or supplement the methodological bullet with this failed-candidate Check; the two-witness observation can remain as prose. State that C is smooth and connected over `𝔽ₚ`, its pulled-back coefficient object has rank 1, and the number of `k(α)`-rational lifts of α is 0. Therefore this candidate is not an LC witness. Do not assert that LC itself fails: the identity curve X still witnesses it.

   **Retest of repair.** For the identity candidate the lift count is 1 and the restriction has rank 1. For the quadratic-constant candidate the lift count is 0 while the rank is still 1. The weakened image-only condition accepts both; the stated definition rejects the second. This supplies the missing discriminating test without changing the correct definition or its source locator.

Two findings: one P1 and one P3. All twelve findings from round 2 are repaired. The new blocking finding concerns a false finite-coefficient input to the weight argument, not the absence of a declared supplier contract. The headline theorem over algebraically closed coefficients can be retained. No mathematical package file or manifest entry was changed.

## Verified sound

### Earlier findings, checked before the new pass

All locations in this table refer to `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md` unless another file is named. No previous repair was marked not actionable; no settled non-actionable finding is re-raised.

| Round-2 finding | Repaired passage checked | Disposition and verification |
| --- | --- | --- |
| R01 generic coefficient comparison | Line 320: “inducing `k(t) ⊆ k(t)^alg` on residue fields”; MS.0.4 cites the new request | **Repaired.** The new named gap agrees with the plan. RD.0.54 is no longer used for this comparison. DAD line 511 and KED04 line 346 distinguish rational and complete residue fields. |
| R02 empty PBQ sum | Lines 672–680 and 1065: “nonempty” in the finite-sum hypotheses | **Repaired.** Empty sum rank 0, PBQ false; one and two unit lines have ranks 1 and 2 and sole bounded slope 0. The added internal-sum example is distinguished from a direct sum. |
| R03 numerical zero slopes | Line 488: “`M† ≠ 0`”; line 1248: “`N† ≠ 0`”; line 1482: “`P ≠ 0`” | **Repaired.** Zero injections no longer force incompatible numerical slopes. Lines 142–145 give zero extremal objects without inventing a numerical slope of zero. |
| R04 slope normalization | Lines 130–150: “`λ_RD/v_π(q)` here”; lines 1399–1400 distinguish iteration from renormalization | **Repaired.** Raw `(0,2)` becomes `(0,1)` for q=p²; iteration gives `(0,4)/(4)=(0,1)`. Ramification index 2 gives `4/4=1`. |
| R05 finite projective affine objects | Lines 122–129: “finite projective” over smooth affine dagger algebras | **Repaired.** The elliptic torsion-line Check at 1017–1026 allows local rank 1 without a global basis. Local-field and bounded-disc freeness is separately scoped. |
| R06 composition direction | Line 2221: “`π_m^*(h ∘ Top(g′)⁻¹)`” | **Repaired.** Labelled line maps g′=2 and h=3 give endomorphism 3/2, inverse 2/3, and recovered map 3. |
| R07 zero-factor implication | Line 712: “forward implication” | **Repaired.** For M=unit and U=0, the two PBQ truth values are true and false; forward fails and reverse is vacuous. |
| R08 connected constants | Lines 1838–1845: “geometrically connected” qualifies the K-valued Check; the quadratic constants example gives “`K₂ → K₂`” | **Repaired.** Connected projective plane and line over quadratic constants have dimensions 2=2, not 1=1. The general theorem was preserved. |
| R09 coefficient endomorphisms | Lines 2095–2101: “`Q̄_p × Q̄_p`” and “`a ↦ (a, a)`”; lines 2187–2191 use nonzero alternative scalars | **Repaired.** Diagonal has kernel 0 but misses (1,0); scalars 1 and 2 are invertible, 0 is not. The separate purity defect is R01 above. |
| R10 pins | Lines 184 and 210 give `1b1ccf4b…` and `2fd255d9…` | **Repaired.** Full hashes agree with the content checkout's manifest. |
| R11 native bounded/open-disc carriers | Lines 212–226 cite `PowerSeries.HasGaussNorm.subring` and `PowerSeries.OnOpenDisc.subring`; `Suggested.lean:8–16` separates rings from differential coefficient structures | **Repaired.** Coefficient suprema of ΣXⁿ and Σp⁻ⁿXⁿ are 1 and ∞. Neither existing ring supplies the missing isocrystal theory. |
| R12 manifest target drift | `sources.toml`: TSU “MS.5.7”, DAD “MS.5.1-MS.5.8”, KED05 “MS.5.6”, AE “MS.5.8” | **Repaired.** All explicit cited targets and the range resolve in the README. Source keys and retrieval evidence were preserved. |

### Principles and shape

Read the 2,383-line README, all 68 numbered targets and their 68 Needs lines, the Lean file, metadata, source manifest, and the plan's gap entries. The roadmap extends its parent with PBQ filtrations, saturation, reconstruction and minimal-slope results; it does not rebuild the parent's analytic or isocrystal foundations. There is no route-specific restriction of the general theorems. The congruence condition in the Legendre example is confined to that example. No computational algorithm, copied source passage, sorry'd data, `set_option`, process narrative, machine path, HTML anchor or forbidden supplier was found in the mathematical package files.

The seven layers have mathematical names and end in Examples and Dependencies. Their order is justified by bounded quotients feeding PBQ, saturation feeding reconstruction, and coefficient and Lefschetz inputs feeding finite-field results. No claim to follow a source's organization or source-chapter heading occurs. The two main-branch shape comparisons were `TauCetiRoadmap/AlgebraicCurves/README.md` and `TauCetiRoadmap/RigidAnalyticGeometry/README.md`.

There are 18 definition/API blocks. Their Check-bullet counts in order are `3,5,4,4,3,3,3,3,3,3,3,3,3,3,3,3,4,3`. R02 distinguishes a bullet count from an actual discriminating Check. Every target has a locator. Backticked mathematical notation is not mistaken for a claim to declare a Lean identifier; no new backticked declaration name attributed to this roadmap is absent from its Lean file.

The earlier report has a numerical adversarial row for every one of the 68 targets. Those rows were used only for text unaffected by the repairs. Repaired passages, their new Checks, their conventions, and the sampled and headline targets were re-evaluated below. The old real-weight example alone did not test finite coefficient descent; the new quadratic example exposes that omission. Prose-only assurances in the earlier review were not used as mathematical evidence.

### Computed adversarial table

Here `L_s` denotes a constant slope-s line; `Log` has basis e₁,e₂, connection `∇e₂=e₁ dt/t`, and Frobenius `F(e₁)=q⁻¹e₁`, `F(e₂)=e₂`. Examples test assertions and distinguish wrong models; they do not replace proofs of the deep targets.

| Statement or changed passage | Instances | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Conventions: raw and normalized slopes | q=p², F=diag(1,p²), ramification e=1 | Raw `(0,2)`; normalized `(0,1)`; squared raw `(0,4)`, denominator 4, normalized `(0,1)` | Prior R04 repaired |
| Same convention, ramification and twists | e=2; F=p²; K=ℚₚ(√p), F=√p; Tate O(1) | `4/4=1`; `1/2`; Tate slope −1, whereas additive raw twist +1 changes normalized slope by `1/v_π(q)` | Distinct conventions retained |
| Coefficients and nonzero hypotheses | q=1, zero ring, equal-characteristic K | q=pˢ with s≥1 gives q≥2; mixed-characteristic field has 0≠1; characteristic-p field fails coefficient assumptions | Excluded, not silently evaluated |
| MS.0.1 / new generic gap | k=𝔽ₚ; Σt^(n!) | Rational residue field k(t) differs from k((t)); factorial-gap coefficients have arbitrarily long zero runs between 1's, contrary to any fixed-order rational recurrence | Correct new contract; no replacement by completion |
| Native bounded/open-disc carriers | ΣXⁿ; Σp⁻ⁿXⁿ; log(1+X) | Coefficient suprema `1,∞,∞`; radii `1,1/p,1`; log coefficient norm at pʳ is pʳ | Existing rings correctly acknowledged |
| MS.0.2 generic solutions | zero, unit, Log, F=a line | Solution dimensions `0,1,2`; bounded dimensions `0,1,1`; line's solution eigenvalue a⁻¹ versus module eigenvalue a | No duality-sign mismatch |
| MS.0.4 nonzero injection and opposite bound | unit→unit²; zero→L₀ and zero→L₁ | `rank 1≤2`, maximum 0=0; zero would demand maxima both 0 and 1 but is now excluded | Prior R03 repaired |
| MS.0.5 bounded quotient | zero, unit, Log | `(rank kernel,rank quotient)=(0,0),(0,1),(1,1)` | Nonzero quotient asserted only for nonzero input |
| MS.0.7 bounded splitting headline | L₁⊕L₀ and Log | Split rank `1+1=2`; Log coefficients at pʳ have norms pʳ→∞ and dt/t has no primitive in E | Both directions distinguished |
| MS.0.9 PBQ definition | zero, unit, split L₁⊕L₀, Log | Bounded slope sets `∅,{0},{1,0},{0}`; PBQ `F,T,F,T` | No zero-object vacuity |
| MS.0.10 / MS.2.4 nonempty sums | empty, one unit, two independent units | Ranks `0,1,2`; PBQ `F,T,T`; all nonempty slopes 0 | Prior R02 repaired |
| New internal-sum Check | Ee₁ and Log inside Log | Internal sum=Log, bounded slope set `{0}`, PBQ true; external Ee₁⊕Log has bounded slopes `{−1,0}`, PBQ false | Does not confuse internal and direct sums |
| MS.0.11 tensor Check | M=unit, U=0 or unit | Tensor ranks `0,1`; PBQ pairs `(T,F),(T,T)`; failed implication T→F, reverse F→T | Prior R07 repaired |
| MS.1.1 PBQ filtration headline | zero; L₁⊕L₀ | Lengths 0,2; grade maxima `(1,0)` but nested maxima `(1,1)` | Correct grade indexing |
| MS.1.6 growth definition / MS.1.8 headline | Log, λ=−1,0,1; p=2,3 | Growth-space dimensions `(0,1,2)` equal shifted-slope dimensions `(0,1,2)`; `pʳ/(pʳ+1)^λ` unbounded for λ<1 | Shift and small-prime checks pass |
| MS.2.1 / affine convention | Nontrivial order-two line on `(y²=x³−x)\{∞}` over 𝔽₅ | Local rank 1; Picard class nonzero of order 2; quadratic finite-monodromy eigenspace has rank 1, not a chosen global basis | Finite-projective repair retains this object |
| MS.2.2 boundary distinction | Σpⁿx^(pⁿ) | At origin coefficient norms p⁻ⁿ are bounded; at infinity p⁻ⁿρ^(−pⁿ)→∞ for ρ<1 | All required boundary conditions matter |
| MS.2.5 curve PBQ headline | Split slopes 1,0; irreducible line | Filtration lengths 2,1; grade ranks `(1,1),(1)`; grade slopes `(1,0),(0)` | General curve realization retained |
| MS.2.6 finite étale transfer | y↦yᵖ−y | Derivative −1, degree p; unit pullback rank 1, pushforward rank p, all slopes 0 | Wild boundary allowed |
| MS.2.8 Legendre gap | p=5, eigenvalues −3±4i | Complex magnitudes 5; neither eigenvalue 1; untwisted fixed dimension 0, selected eigenspace dimension 1, selected twisted eigenvalue 1 | Earlier extension repair remains sound |
| MS.3.1 / MS.3.4 saturation | zero, line, L₁⊕L₀ | Top-map kernel ranks `0,0,1`; saturated quotient ranks `0,1,1` | Zero carrier retained without numerical slope |
| MS.3.2 quasi-saturation | E†→E²; `(a,b)↦a+αb`, α∉E† | First E-span rank 1<2; second E†-map injective but E-linearization has rank-one kernel | Correct carrier distinction |
| MS.3.3 repaired numerical source | zero injection; L₁⊕L₀→L₀ | Zero source now excluded; split projection has source maximum 1 versus target 0 and kernel rank 1 | Injectivity hypothesis discriminates |
| MS.3.7 local reconstruction headline | Log versus unit | Top ranks 1=1 but total ranks 2≠1; Log has saturation kernel rank 1 | Saturation prevents false reconstruction |
| MS.3.9 iteration | F=q, then Fᵃ=qᵃ | Raw valuation v(q)→a v(q); normalized slope `1→1` | Prior R04 repaired throughout |
| MS.4.2 curve rank headline | Unit identity; split projection; zero quotient | Identity ranks 1=1; split has section kernel rank 1; zero quotient has no numerical slope and is excluded | Prior R03 repaired |
| MS.4.6 specified-map headline | Unit line with h=2; h=0 | Unique required lift is scalar 2; scalar 0 has rank 0 and is not an isomorphism | Nonzero/iso hypotheses retained |
| MS.4.8 minimal-slope headline | O(1), dual, scalar 2 | Slopes −1 and 1; scalar under dual and double dual `2→2→2`; direction reverses twice | Dual formulation agrees |
| MS.5.1–MS.5.2 hull | Zero; ordinary line in irreducible rank-two object | Hull ranks 0 and 2; first-step ranks 0 and 1 on both sides | Hull is not identified with first step |
| MS.5.3 Frobenius induction | n=2, N=L₀⊕L₁ | Induced whole rank 4; induced first-step rank 2 | Correct first-step formula |
| MS.5.5 generic comparison | Extendable line in split module | Hull rank=first-step rank=1; generic residue k(t), completed local residue k((t)) | New gap supplies the missing bridge |
| MS.5.7 curve minimal-slope headline | Ordinary line; already extendable line | First-step ranks 1=1 although ordinary hull rank 2; extendable hull rank 1=1 | Curve-rank proof avoids deleted affine comparison |
| Deleted compactness route | A₁⊂W⟨u⟩ | `(pu)^j∉pA₁` but norms p⁻ʲ→0; positive lower bound would be >0, actual infimum 0 | Deletion remains justified |
| MS.5.8 docile headline / constants | ℙ² and a line over 𝔽ₚ² viewed over 𝔽ₚ | Horizontal constants K₂→K₂; K-dimensions 2=2 | Prior R08 repaired without narrowing theorem |
| Same theorem: docility control | Nontrivial Dwork object on A², restriction x=0 | Horizontal dimensions 0→1 | Wild non-docile object is correctly excluded |
| MS.6.1 sampled definition | Identity curve at degree-two closed α | Residue map k(α)→k(α) identity, relative degree 1; rank-one pullback rank 1 | Correct successful witness |
| MS.6.1 negative witness | C=A¹_𝔽ₚ²→A¹_𝔽ₚ, α=0 | Image contains α; pullback rank 1; fibre Spec 𝔽ₚ² has 0 𝔽ₚ-points, versus identity fibre with 1 | R02: add this Check |
| MS.6.5 coefficient rank | [L:K]=2, coefficient rank 1; scalar extension degree 2 | Forgotten ranks 2 and 4; normalized ranks `2/2=4/4=1` | Coefficient structure must be retained |
| MS.6.6 trace and duality | Point with F=2, n=2; affine-line unit | Trace 2²=4 on both point expressions; dual eigenvalues 1,q multiply to q | Normalizations agree |
| MS.6.7 averaging | Order-two swap on (2,4); p=2 allowed | Average (3,3); projector trace 1 versus identity trace 2; projected two-slot trace 2 versus unprojected 4; 2≠0 in characteristic zero | Denominator and projection both necessary |
| MS.6.8 endomorphism Check | Fold from two points to one | Q̄ₚ→Q̄ₚ² diagonal; kernel 0; (1,0) not in image | Prior R09 repaired |
| MS.6.9 real weights | Point over 𝔽₃, F=2 | w=2 log₃2; 3^(w/2)=2; w not integral | Real-weight convention correct |
| MS.6.9 forgotten finite model | F companion to T²−T−1 over ℚ₃ | Mod-3 values `(2,2,1)`; complex magnitudes `(1.618…,0.618…)`; unequal weights `(0.876…,-0.876…)` | R01: false finite-K purity input |
| Repaired MS.6.9 route | L=ℚ₃(√5), F=a on L-line | L-linear eigenvalue set `{a}`; weight `2 log₃|ι(a)|`; 3^(w/2)=|ι(a)| | Coefficient-linear repair passes refuting instance |
| MS.6.10 fibrewise criterion | Equal and unequal eigenvalue lines | Equal gives `(1−t)⁻¹` pole at 1; unequal a,b gives distinct factors `1−at`, `1−bt`; lower weights have modulus <qᵈ | Pole cannot be cancelled under stated bounds |
| MS.6.11 and MS.6.14 composites | Labelled lines g′=2, h=3 | Correct endomorphism 3/2, inverse 2/3; composing with g′ gives 3 | Prior R06 repaired; both arrow directions checked |
| MS.6.12 specified scalar | c=1, c′=2, zero control | 1 and 2 invertible; only 1 induces the specified identity; 0 has rank 0 | Prior R09 repaired |
| MS.6.13 finite-field headline | Rank-one curve case | Top rank 1=whole rank 1; h=a≠0 lifts to a and inverse a⁻¹ | Hypotheses discriminate from zero map |

### Supplier direction and citation resolution

The prescribed dependency command completed with exactly:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The parent precedes this package in the order. The citation-resolution tool reported no missing roadmap citation or backticked name; its warning that it did not inspect external Lean packages was compensated by the direct pinned-file checks below.

All 71 distinct explicit parent RD identifiers were resolved against the current new-roadmap head, pull request #1002. This parent is not on main; using its new-roadmap head is permitted. Representative groups of resolved citations and their content are recorded here; line numbers refer to `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`, excluding the display header from `roadmaps show`.

| Supplied object | Resolved sections and file lines | Interface checked |
| --- | --- | --- |
| Coefficient rings and local embeddings | RD.0.1:673, 0.9:910, 0.17:1120, 0.26:1370, 0.34:1559, 0.35:1597, 0.36:1630, 0.48:1976, 0.53:2120 | Bounded/completed distinction; generic rational-residue comparison is now an explicit extension contract |
| Frobenius and differential structure | RD.0.37:1670, 0.38:1695, 0.39:1716, 0.42:1794, 1.13:2537, 1.22:2779, 1.25:2853, 1.27:2921 | Derivation, horizontal Frobenius and lift-change assumptions |
| Slopes and reverse filtration | RD.1.32:3030, 1.35:3094, 1.36:3131, 1.37:3162, 1.39:3203, 1.40:3223, 1.41:3247, 1.72:4033 | Raw vπ convention, scalar extension, reverse grades; package's explicit rescaling is necessary |
| Taylor/solution comparisons | RD.1.43:3282, 1.44:3324, 1.45:3346, 2.22:4693, 2.28:4893 | Analytic hypotheses and logarithmic extension boundary |
| Isocrystal categories | RD.3.15:5957, 3.16:5973, 3.19:6048, 3.22:6133, 3.25:6219, 3.29:6331, 3.31:6378, 3.32:6404, 3.34:6474, 3.37:6604 | Finite-projective affine realization, exactness, duals and Tate sign |
| Transport and gluing | RD.3.38:6641, 3.39:6663, 3.40:6690, 3.41:6708, 3.45:6824, 3.47:6879, 3.48:6913, 5.8c:8846 | Finite étale transport, slope opens and descent; perfect-base unit-root extension declared |
| Curve and docile prerequisites | RD.5.2:8665, 5.4:8693, 5.7:8756, 5.8:8780, 5.29:9309, 5.100:10886, 5.103:10995, 5.112:11227 | Local full faithfulness, curves, nilpotent residues, dense-open full faithfulness and subquotients |
| Cohomology, trace and duality | RD.4.19:7541, 5.89:10638, 6.2:11440, 6.4:11506, 6.23:11961, 6.28:12056, 6.42:12392, 6.47:12563, 6.57:12830, 6.59:12893, 6.60:12923 | Compact support, dimension, trace, twists and Legendre interface |
| Weights and unit-root boundaries | RD.6.61:12938, 6.77:13286, 6.82:13385, 6.85:13454 | Finite-field scope and coefficient-linear extension; R01 concerns the stronger assertion made here |
| Affinoid acyclicity | `TauCetiRoadmap/RigidAnalyticGeometry/README.md:434`, Layer 5, on main | Finite-cover Čech exactness and Tate acyclicity |
| Curve models | `TauCetiRoadmap/AlgebraicCurves/README.md:478,1468`, Layers 2 and 12, on main | Dedekind local rings and projective regular completion; perfect base gives smoothness |

Nine gap slugs, each owned by the parent, match exactly between the plan and README. They request genuine extensions rather than re-owning the package's PBQ or hull theory: extended-log-robba-growth; dejong-disc-robba-submodules; unit-root-correspondence-perfect-base; legendre-kummer-extension; irreducible-iota-purity; lefschetz-curves-irreducibility; docile-curve-restriction; coefficient-linear-weil-ii; dejong-generic-affine-line-comparison. Their absence from the supplier is not a finding. Eight have precise applicable statements; the purity statement requires the coefficient correction in R01. Related assertions in each contract serve one defined interface, rather than a collection of unrelated prerequisites.

### Duplication and ownership

Read the board-package index before drawing ownership conclusions. Its three entries concern AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. Searches by object used `roadmaps grep` over main and the 439 indexed open heads: PBQ, pure bounded quotient, dagger hull, quasi-saturation, Lefschetz condition, logarithmic growth, completed generic field and coefficient-linear trace. A final narrow coefficient/hull search had no matches. Broad unrelated bounded-quotient hits were not treated as duplicate mathematics.

The closest heads were read by scope: parent #1002; #879 `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:53–94` (finite groups, integral Dieudonné theory); #1062 `TauCetiRoadmap/PadicHodgeTheory/README.md:8–21` (period comparisons); #1205 `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:8–28` (bundle/isocrystal classification); #857 `TauCetiRoadmap/CrystallineCohomology/README.md:51–94` (crystalline and log-crystalline foundations). None owns the package's PBQ/saturation/reconstruction results. #1725 `TauCetiRoadmap/SatoTateGroups/README.md:888–901` uses Lefschetz condition for a centralizer condition, not MS.6.1.

The supplied overlap facts have no conflicting head changing this roadmap, no dropped cited identifier, and no dependency on numbering defined only by an open revision. The package has no Lean declarations, hence no duplicate fully qualified declaration name. Ownership of the new objects remains here; the analytic rings and isocrystal foundations are cited from their earlier owners.

### Pinned library checks and Lean acceptance file

Manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Each cited declaration was opened, not inferred from a search result.

| Declaration | File at the pin | What its actual definition or hypotheses provide |
| --- | --- | --- |
| `LinearMap.quotKerEquivRange` | `Mathlib/LinearAlgebra/Isomorphisms.lean:39` | Ring, additive groups and modules; quotient by kernel identifies the range |
| `Representation.averageMap`, `averageMap_invariant`, `averageMap_id` | `Mathlib/RepresentationTheory/Invariants.lean:126,131,137` | Finite group and invertible cardinality from line 121; not averaging over an arbitrary infinite group |
| `LinearMap.trace`, `trace_one` | `Mathlib/LinearAlgebra/Trace.lean:75,190` | Total trace definition; finite free assumptions at line 168 for trace of identity |
| `Padic.norm_p_pow` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:881` | Prime p and natural powers, norm p⁻ⁿ |
| `FixedPoints.subfield` | `Mathlib/FieldTheory/Fixed.lean:103` | Fixed subfield of a monoid action by ring endomorphisms; no unjustified finiteness assumption |
| `WittVector.Isocrystal`, `isocrystal_classification` | `Mathlib/RingTheory/WittVector/Isocrystal.lean:112,179` | Module with Frobenius-semilinear equivalence; classification has rank-one and algebraically closed residue hypotheses; structure has no connection or finite-dimensionality field |
| `PowerSeries.derivative` | `Mathlib/RingTheory/PowerSeries/Derivative.lean:50` | Formal derivative, not a compatible Frobenius/differential-module structure |
| `PowerSeries.HasGaussNorm.subring` | `TauCeti/RingTheory/PowerSeries/Bounded.lean:63,81` | Positive-radius ultrametric normed-ring carrier; radius-one membership means bounded coefficient norms |
| `PowerSeries.OnOpenDisc.subring` | `TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean:295` | Open-disc convergence carrier, not the Amice field or an isocrystal category |

Object searches in both pinned libraries found no differential-module/PBQ, dagger-hull or overconvergent-F-isocrystal theory that duplicates the targets. A Witt-vector isocrystal is not a scheme isocrystal with connection; Amice transforms of measures are not the Amice coefficient field. The already available rings are cited, not redeclared.

Ran the prescribed `lake env lean` elaboration of the package's `Suggested.lean` from the content checkout: **exit 0, no output and no warnings**. No Tau Ceti object file had to be built. There is one `import Mathlib`, one module docstring, the required namespace, and **zero declarations**. Consequently the exhaustive one-tactic padding probe has zero cases, and the exhaustive `#check @name` binder comparison has zero cases; no hidden section-variable loss is possible. No replacement theorem, free predicate or artificial encoding was introduced.

The README headlines and Lean docstring were matched individually:

| Headline | Docstring lines | Why a few simple definitions at the pins do not suffice |
| --- | --- | --- |
| Specified-map curve theorem MS.4.6 | 18–20 | Scheme F-isocrystal categories, maximal-slope quotients and their maps are missing |
| Minimal-slope dual MS.4.8 | 21–22 | Same categories and minimal-slope subobject are missing |
| Curve minimal-slope property MS.5.7 | 23–25 | Dagger-extendable Fⁿ-isocrystals and dagger hulls are missing |
| Curve PBQ filtration MS.2.5 and rank theorem MS.4.2 | 26–28 | Completed generic differential coefficient field and maximally bounded quotient are missing |
| Bounded splitting MS.0.7; PBQ filtration MS.1.1; growth comparison MS.1.8; local reconstruction MS.3.7 | 29–32 | Amice/Robba fields with compatible Frobenius and connection, generic solutions and slope theory are missing |
| Finite-field theorems MS.6.13–MS.6.14 | 33–35 | Q̄ₚ scheme F-isocrystals, Frobenius fibres, weights and Lefschetz curves are missing |
| Docile Lefschetz theorem MS.5.8 | 36–37 | Overconvergent coefficients and docility along a normal-crossings boundary are missing |

The native bounded/open-disc rings do not make any of these headlines statable without heavy new constructions. No statable headline was omitted, and no padding was found.

### Source verification

The seeded sample is MS.6.1, **Lefschetz condition**. TSU line 1456–1463, §6.3, condition (LC), printed page 28, has the separated finite-type base, closed point, irreducible object, smooth curve, map, residue-field rational point and irreducible pullback used at README:1872–1876. The connected-witness formulation selects the component carrying the nonzero irreducible restriction and the marked point. The locator and statement are correct; R02 concerns its tests.

Seven accessible source keys and two settled uncertified keys occur in the nine-entry manifest, with no duplicate work key. No additional source was required or fetched. No accessible author-flagged unverified locator remains. The repaired generic input was checked in DAD line 511–559 and line 568–581, Definitions 4.2.4–4.2.5 and proof of Lemma 4.2.7, printed pages 14–15, and KED04 line 85–99 and line 346–347, Proposition 4.1: the latter uses completed Laurent residue coefficients, justifying the new declared extension.

Other source passages reopened include OHK line 1300–1327 (bounded quotient and a misprint), line 1925–1944 (Proposition 7.5 and Theorem 7.6, growth shift and solvability); TSU line 808–907 (zero objects, PBQ and filtration grades), line 1019–1070 (finite étale transfer and gluing), line 1111–1146 (Legendre cohomology), line 1435–1463 (specified-map theorem and LC), line 1554–1570 and line 1663–1770 (coefficients, fibres and trace), line 1863–1877 and line 1936–1952 (specified maps and finite-field headlines); AE line 153–199, line 509–553 (coefficient categories, docile restriction and purity). AE Corollary 2.4 with Remark 2.5 retains perfect-base generality; geometric connectedness is not added to the general docile theorem.

## Not verifiable

- DEJONG98 Proposition 6.4 and TSU98 Theorems 4.2.6 and 7.2.3 remain settled `uncertified` sources. Their texts were not opened, no new request was made, and their stated supplier contracts were evaluated as contracts rather than falsely certified source quotations.
- DAD locators were checked in the manifest's arXiv v4, explicitly used by the README. Published-journal numbering was not independently certified.
- Ownership was checked against the supplied main checkout and the indexed 439 open heads. Unlisted pull requests and inaccessible board branches were not independently sought. Reading the board index does not certify the contents of such inaccessible branches.
- The numerical checks and source comparisons do not constitute formal proofs of the unformalized deep theorems. The empty Lean file elaborates but cannot test those future constructions.

## Source issues

- **Misprint** in TSU at notation, printed page 1: the source says R is a complete discrete valuation field whose fraction field is K; it should be a complete discrete valuation ring; affects nothing.
- **Error** in TSU at §2.1, printed page 4: the source says the coefficient supremum is a finite Gauss norm on the whole Robba ring; it should be restricted to bounded elements, since coefficients p^(−⌊√n⌋) give infinite supremum; affects a stated result.
- **Misprint** in TSU at Definition 2.1(2), printed page 5: the source says the bounded-disc lattice is over a ring indexed by an undefined α; it should be over the stated K[[t]]₀; affects nothing.
- **Misprint** in TSU at proof of Proposition 2.9, printed page 8: the source says the growth criterion is Lemma 2.5(4); it should be Lemma 2.6(4); affects nothing.
- **Misprint** in TSU at Proposition 2.11, printed page 9: the source says the two filtration lengths agree using an undefined s; it should be the length of the displayed opposite filtration; affects nothing.
- **Misprint** in TSU at proof of Proposition 2.11, printed page 9: the source says Lemma 2.9 supplies the coefficient assertion; it should be Proposition 2.9; affects nothing.
- **Misprint** in TSU at proof of the maximal-slope comparison, printed page 10: the source says a trivial module is a tensor power of the coefficient field; it should be a direct sum with the specified rank; affects the proof.
- **Gap** in TSU at proof of Proposition 3.7, printed page 14: the source says solvability gives boundedness; it should be separate duality arguments for solvable and bounded modules, since the logarithmic module is solvable but unbounded; affects the proof.
- **Misprint** in TSU at Theorem 3.12 and Definition 3.13, printed page 15: the source says the bounded quotient is nonzero for every solvable module; it should be restricted to nonzero input modules; affects a stated result.
- **Misprint** in TSU at Proposition 3.18, printed page 16: the source says tensoring with any unit-root factor preserves PBQ equivalently; it should be restricted to nonzero unit-root factors; affects a stated result.
- **Misprint** in TSU at Theorem 3.19, printed pages 16–17: the source says decreasing maxima and the bounded-quotient sum use nested filtration terms; it should be successive grades in both assertions; affects a stated result.
- **Misprint** in TSU at proof of Theorem 3.19, printed page 16: the source says Proposition 3.10 gives the splitting; it should be Theorem 3.10; affects nothing.
- **Misprint** in TSU at Proposition 3.24, printed page 18: the source says a module's rank equals a solution space; it should be the dimension of that space; affects a stated result.
- **Misprint** in TSU at Remark 3.25, printed page 18: the source says the connection is evaluated on the y-derivative in an x-series formula; it should be the x-derivative; affects nothing.
- **Misprint** in TSU at Lemma 3.31, printed page 19: the source says the pushforward object's source is C and the pullback object's source is C′; it should be C′ for pushforward and C for pullback; affects a stated result.
- **Gap** in TSU at proof of Lemma 3.31, printed page 19: the source says part (1) concludes the assumed PBQ assertion and part (2) cites the same lemma; it should be an independent finite-étale transfer argument proving the required pullback assertion first; affects the proof.
- **Gap** in TSU at proof of Lemma 3.33, printed page 20: the source says the unit-root gluing lemma applies directly to any rank-one coefficient; it should be preceded by a constant coefficient extension and twist making that rank-one coefficient unit-root; affects the proof.
- **Misprint** in TSU at §3.9, printed page 21: the source says the support-forgetting map has ordinary rigid cohomology as both source and target; it should be compactly supported cohomology as its source; affects nothing.
- **Misprint** in TSU at Theorem 6.4, printed page 27: the source says the graded reconstruction uses saturations of nested PBQ terms; it should be saturations of successive PBQ grades; affects a stated result.
- **Misprint** in TSU at Theorem 6.4, printed page 27: the source says the bounded-quotient comparison ends in a generic-fibre expression and is overconvergent; it should be the displayed convergent bounded quotient on the curve; affects a stated result.
- **Misprint** in TSU at proof of Corollary 6.8, printed page 29: the source says the intermediate isomorphism ends at the source object's restriction; it should be the other object's restriction; affects nothing.
- **Gap** in TSU at Proposition 7.4, printed page 30: the source says the K-linear dual is the coefficient-linear dual via the displayed extended pairing; it should be justified by the nondegenerate finite-field-extension trace pairing and the coefficient-action summand; affects the proof.
- **Misprint** in TSU at Proposition 7.5, printed page 30: the source says extension from L₁ to L₂ equals extension from L₁ through L₂ to L₃; it should be extension from L₁ to L₃ on the left; affects nothing.
- **Error** in TSU at Lemma 7.11(1),(3), printed page 33: the source says finite and algebraically closed coefficient fibres are isomorphic as finite L-spaces and traces finite over K; it should be a scalar-extension comparison with traces taken on the finite model; affects a stated result.
- **Error** in TSU at proof of Lemma 7.11(3), printed page 33: the source says L⊗ₖL splits over the embeddings for arbitrary finite L/K; it should be split after extension to an algebraic closure, or assume L/K is Galois; affects the proof.
- **Misprint** in TSU at proof of Proposition 7.12, printed page 34: the source says a scalar Frobenius twist multiplies the n-th iterate trace by λ; it should be λⁿ; affects the proof.
- **Error** in TSU at Definition 7.14 and Theorem 7.18, printed pages 34 and 37: the source says weights are integers and all irreducibles are pure; it should be real weights, since Frobenius 2 over 𝔽₃ has nonintegral weight 2 log₃2; affects a stated result.
- **Misprint** in TSU at proof of Proposition 7.15(2), printed page 35: the source says the lifting map has the wrong target and uses the inverse comparison in its composite; it should be an endomorphism lift composed with the comparison; affects the proof.
- **Misprint** in TSU at proof of Lemma A.1(2), printed page 38: the source says the fixed field and completed field have the same valuation ring; it should be the same value group; affects the proof.
- **Misprint** in TSU at Appendix A, tube notation, printed page 39: the source says a tube is the specialization image of the closed subscheme; it should be its inverse image under specialization; affects nothing.
- **Misprint** in OHK at Proposition 5.9, printed page 26: the source says boundedness means the zero-growth kernel is the whole module; it should be zero, making the bounded quotient the whole module; affects a stated result.
- **Misprint** in DAD at Theorem 4.2.6(i), printed page 14: the source says reverse grade i is indexed one place too low; it should be completed as `S_(m+1−i)/S_(m−i)`; affects a stated result.
- **Gap** in DAD at proof of Proposition 4.2.12, printed page 17: the source says compactness gives a positive lower norm bound outside pQ and bounded quotient torsion; it should be justified by another argument, since both steps fail for A₁⊂W⟨u⟩; affects the proof.

The source errors above are distinct from package findings: the README already corrects or avoids them. In particular, TSU line 1867–1877 already projects to a direct summand in its descent argument; the package's explanation of the m² error is not evidence that this projector is missing from the source. No published correction was established in this review.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "aec2c9bebdb3b0f7aa6fd3213f9173008ff30090", "job": "REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~3", "model": "gpt-6-astra", "worker": "chris-9"} -->
