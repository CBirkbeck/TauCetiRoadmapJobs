<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13089#issuecomment-6861308256 -->
Red team round 2 pass a (codex) of 2d195d5

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The repaired conjugation statement still includes the zero vector

   **Location:** packages/NonordinaryCMSpecialValues/README.md:630, “every `ϑ` satisfies `ϑ† = ε_ϑ ϑ` for a unique `ε_ϑ` with `|ε_ϑ| = 1`”; also line 636.

   **Claim:** Membership in a one-dimensional eigenspace determines this scalar uniquely, including for its zero element.

   **Witness:** Put `ϑ = 0`. Both `ε = 1` and `ε = −1` have modulus one and satisfy `0† = ε·0 = 0`. Cancelling `ϑ` in line 636 is invalid here.

   **Exact repair text:** “For every nonzero `ϑ` in a one-dimensional eigenspace, there is a unique `ε_ϑ ∈ ℂ` such that `ϑ† = ε_ϑ ϑ`; involutivity gives `|ε_ϑ| = 1`. For `ϑ = 0` every scalar satisfies the equality, so no scalar is selected.” Apply the nonzero hypothesis to the API and the scalar-change Check as well. The zero-vector witness now has exactly the explicitly stated nonuniqueness. Round 1a/F01 is partly repaired: higher multiplicity is handled, but its proposed nonzero hypothesis was omitted.

2. **F02** (P2) The infinity-type docstring asserts a false equivalence

   **Location:** packages/NonordinaryCMSpecialValues/Suggested.lean:75, “Equivalently (Jia, Property 1), `φ((n)) = κ_K(n) n` on rational integers prime to the conductor.”

   **Claim:** The rational-principal law alone characterises `IsEquivariantTypeOneZero`.

   **Witness:** For the Gaussian curve character `φ`, put `ψ = φ³/N`. Then `ψ((n)) = κ_K(n)n`, but `ψ((3+2i)) = (3+2i)³/13 ≠ 3+2i`; its infinity type is `(2,−1)`.

   **Exact repair text:** “Among Hecke characters already of ideal infinity type `(1,0)` for `ι`, conjugation equivariance is equivalent to `φ((n)) = κ_K(n)n` on rational integers prime to the conductor (Jia, Property 1).” The README already retains this hypothesis at line 134. For the witness, `(3+2i)−1 = 2+2i` is divisible by the Gaussian curve conductor; the cubed character has conductor dividing it. The square `(3+2i)² = 5+12i` differs from `13`, so it is excluded by the repaired type hypothesis. The Lean definition itself is unchanged.

3. **F03** (P2) Semilocal splitting uses the later CM Lubin–Tate identification

   **Location:** packages/NonordinaryCMSpecialValues/README.md:510, “combine with §3.2 and the local torsion ramification”; lines 520 and 531 close the dependency loop.

   **Claim:** The product decompositions into copies of `Φ_n` are proved before the CM formal group and its division fields have been identified with the supplied Lubin–Tate tower.

   **Witness:** §3.3 uses local torsion ramification; §3.4 needs §3.3; §3.5 needs §3.4 and first proves that the CM torsion completion is the Lubin–Tate division field. TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:943 treats Lubin–Tate fields, not these CM fields.

   **Exact repair text:** “§3.3 proves only that `pO_K` splits completely in `H` and in the prime-to-`p` ring-class fields, using the principal Artin class of `(p)`. §3.4 uses this splitting to compute Frobenius. §3.5 identifies the CM torsion completions with the Lubin–Tate fields. After §3.5, §3.6 proves the semilocal product decompositions and their Kummer, evaluation, augmentation and corestriction comparisons, using §§3.2–3.5.” Move the semilocal API and its Checks to §3.6 and update consumers of that part. For `p = 5`, the local degree `24` is then established before the product contains `h_K` copies of that field; the splitting calculation uses only the trivial ideal class of `(5)`. This preserves all targets and removes the cycle.

4. **F04** (P3) Partial summation is attributed to the wrong supplier layer

   **Location:** packages/NonordinaryCMSpecialValues/README.md:124, “Layer 5 (polynomial bounds for ideal counts and partial summation)”; also the supplier list at line 30 and the analytic dependencies at lines 868 and 914.

   **Claim:** ArithmeticDirichletSeries Layer 5 supplies partial summation.

   **Witness:** Completed/ArithmeticDirichletSeries/README.md:237 supplies ideal-count bounds. Its line 257, Layer 6, target 6.1, supplies Abel summation and the norm-indexed/Stieltjes extensions.

   **Exact repair text:** “ArithmeticDirichletSeries Layer 3 (local factors and Euler products), Layer 5 (ideal-count bounds), and Layer 6, target 6.1 (Abel summation and its norm-indexed extensions).” Add Layer 6, target 6.1 to the scope supplier list and the needs of §6.2 and Layer 6. For a cutoff containing one ideal of norm 2, partial summation yields the boundary term `f(2)`; the cited target 6.1 retains that term. This changes the locator, not the average or its normalisation.

## Earlier findings: verification at this head

The identifiers below are those of the two supplied round-one reports. The round-one repair report marks none of these thirteen IDs “not actionable in this package.” References in this table are to packages/NonordinaryCMSpecialValues/README.md unless identified otherwise.

| Earlier ID | Status | Repaired passage and location | Retested witness |
|---|---|---|---|
| 1a/F01 | Partly repaired; S01 | Line 630: “on a one-dimensional eigenspace”; line 640 supplies the higher-multiplicity negative control. | Independent fixed vectors give `(u+iv)†=u−iv`, which is not proportional to `u+iv`. That case is excluded. Zero still permits both scalars `1` and `−1`. |
| 1a/F02 | Repaired | Line 553: “defined in §4.4”; the definition of `b_ℓ` is now at line 682, after the pairings and their nonvanishing at lines 668–679. | A zero pairing would make its valuation infinite; the primitive nonzero eigenvector has nonzero self-pairing before the invariant is formed. §5.2 now needs §4.4. |
| 1a/F03 | Repaired, subject to the settled KATO99 source limitation | Line 390: “potentially good reduction”; it introduces `K'' = K'(E[N])` with `N ≥ 3` prime to `p`, then proves and descends the identity. | For `K=ℚ(i)`, modulus 7, a 7-division coordinate has valuation `1/48`, outside `(1/12)ℤ`; good reduction over the original ray field is no longer asserted. Prime-to-p torsion kills finite inertia over the enlarged field. |
| 1a/F04 | Repaired as a lattice identification | Line 46: “together with an identification of its restriction to `G_H` with `T_pE ⊗_{O_Φ} R`”; line 380 supplies the integral Betti comparison. | Replacing `T` by `p⁻¹T` replaces its dual by `pT∨`; the primitive Betti vector then leaves that dual. The new identified lattice excludes this replacement. This does not itself constitute an independent proof of the full integrality theorem. |
| 1a/F05 | Repaired | Line 863 explicitly gives `M(2,1/2)=1` for `P=∅` and allows eventual threshold `Q=2`. | The sole pair is `(0,0)`. With no allowed prime divisors, the only positive supported integer is `q=1`, so the eventual assertion is vacuous after 2. |
| 1a/F06 | Repaired | Lines 68, 520: CM §4.1 is applied to “`E` over `H`, whose character is `φ ∘ N_{H/K}`”; line 878 uses quadratic automorphic induction. | `K=ℚ(√−23)`, `h_K=3`, inert `p=5`: the norm of the chosen prime of H is `(5)`, giving Frobenius `−5`. No curve over K or all-prime curve factorisation is assumed. |
| 1a/F07 | Repaired | Lines 187–188 distinguish ramified local-component evaluation and conductor cancellation; line 903 explicitly says the four order-5 characters alone “asserts nothing.” | A cancelled conductor gives a factor `7/8`, not 1. Orders `5^(2k−1)` and `5^(2k)` give infinitely many conductors of opposite parity, so an almost-all assertion now has an infinite test family. |
| 1b/F01 | Repaired | Lines 68, 111 and 878 replace CM §4.2 by CM §4.1 and GL2 R17.4.16/R16.2.13/R16.6.1/R16.5.3. | For a general finite anticyclotomic twist, induction has central character `κ_K²=1`, infinity component `D₂`, and shift `1/2`; the newform has `L_f(s)=L_η(s)`. |
| 1b/F02 | Repaired | Line 549 describes the layer by the value theorem it needs; §§4.2–4.4 combine analytic and integral material within each mathematical construction. | §4.2 uses Finis §§2 and 3; §4.3 uses §§2 and 3; §4.4 uses Yang and Finis §§2 and 3. There is no longer an analytic-section/integral-section sequence matching the source. |
| 1b/F03 | Repaired | Line 74: “AL.1.6.1 The normalized-distribution epsilon comparison.” | The current supplier states `W_H=ε(1/2)=∏ε_v` there; AL.1.6.2 supplies continuation. Changing the additive character negates the two example local factors but leaves their product 1. |
| 1b/F04 | Repaired | Line 276 permits every finite anticyclotomic `ν` unramified at p; Suggested.lean:170–173 has `hν`, `hνac`, `hνv`, without an odd-order hypothesis. | A nontrivial order-two genus character of `ℚ(√−15)` at inert 7 is allowed. Its value on rational ideles is 1; the local parity factor remains `(-1)^c`. Odd order remains only where the separate auxiliary argument uses it. |
| 1b/F05 | Repaired | Line 846 names `factPrime`. | The local instance sends `p : Nat.Primes` to `Fact p.Prime` using `p.prop`; it introduces no missing arithmetic hypothesis. |
| 1b/F06 | Repaired for the reported omission | Line 30 now names “ArithmeticDirichletSeries Layers 3 and 5.” | §0.3 can import the infinite Euler product from Layer 3. The separate attribution of partial summation to Layer 5 is still inaccurate; S04 supplies the correct locator. |

## Verified sound

Read all 938 README lines and all 185 Suggested.lean lines, the two repository rules documents, both earlier reviews and their repair report. The declaration inventory below contains **11 actual declarations: seven definitions, one local instance and three theorems**. The target ledger covers **44 numbered sections**, including the additional construction blocks within §§2.4 and 4.2–4.4, and all **52 Checks blocks**. Six bold convention paragraphs are included separately. References and “Checks” labels are not counted as mathematical targets.

The source inventory contains 13 works: 11 readable cached texts and two settled exceptions. The source table records 32 directly inspected locator groups; repeated citations to one proposition are not counted as independent verifications. The supplier audit below resolves 17 named supplier roadmaps, the relevant native APIs, and the two declared gap contracts. S01–S04 are the exceptions to the positive verification recorded here.

The headline inventory is: Kato's elliptic-unit reciprocity and the integral BKO class; CM torsion/Lubin–Tate comparison, disjointness and semilocal splitting; Finis's weight-one theorem; the canonical almost-all unit theorem and nontrivial unit witness; Rohrlich's two counts; Jia's average and almost-all nonvanishing; the parity dichotomy and its root-number inputs. The three Lean theorems state the two counts and the dichotomy. The module docstring names the other headline groups and their missing carriers. The count bounds are not consequences of the counting definition or a single pinned theorem. The dichotomy is not algebra on free scalar/function hypotheses: it names native Hecke characters and their Euler products. No padding theorem was found.

### Lean declaration and context ledger

`NF` below means `{K : Type*} [Field K] [NumberField K]`; `CM` adds `[IsCMField K]`. The central-value section has no hidden variable assumptions beyond NF. The three theorem conclusions retain all required hypotheses in the supplied elaborated-signature transcript. The local prime instance was checked directly in the source. I did not run Lean: the read-only/no-build instruction takes precedence over the generic request to elaborate scratch signatures. The transcript's two prose-as-declaration extraction errors are not errors in this Lean file.

| Declaration; section; location in Suggested.lean | Variables and instances actually used | Instances and computed values | Result / change |
|---|---|---|---|
| `conductorModulus`; 0.3; 58 | NF, `χ : HeckeCharacter K` | Trivial χ: finite conductor is the unit ideal, infinite set `∅`. A ramified χ retains its nonunit finite conductor. Zero ideal excluded by `finiteConductor_ne_bot`. | Real definition, no missing binder. |
| `IsAnticyclotomic`; 0.2; 66 | CM, χ; pairs of conductor-prime fractional ideals with membership relation | χ=1 gives `1=1⁻¹`; χ of order 5 gives `ζ⁻¹` at the conjugate ideal; a nonzero real norm twist gives `N(a)^t ≠ N(a)^(-t)`. Genus characters have `±1=(±1)⁻¹`. | Correct finite-character predicate on the intended quadratic fields. The relation is conjugation of ideals, not equality. |
| `IsEquivariantTypeOneZero`; 0.1; 76 | CM, embedding ι, φ; principal units congruent to 1 and conjugate ideals | Gaussian φ gives `φ((3+2i))=3+2i`, conjugate `3−2i`; χ=1 fails at that principal element. `φ³/N` gives `(-9+46i)/13`, while its rational-principal law agrees with φ. | Definition sound; docstring needs S02. |
| `IsPAnticyclotomic`; 0.2; 87 | CM, natural p, finite prime v, χ; finite order and `orderOf χ=p^n` explicit | χ=1 has order `1=p⁰`, conductor 0. At p=5, tower orders 5,25 have conductors 2,3 when p∤h. At p=3 with h divisible by 3, an unramified order-3 character has conductor 0. | The theorem later supplies primality/inertness; no illicit order/conductor identification. |
| `eulerFactor`; 0.3; 94 | NF, η, chosen local units ϖ, v, s | At q=7, η(ϖ)=−1, s=1: `1/(1+1/7)=7/8`; using inverse uniformizer would instead alter the coefficient. At positive conductor: exactly 1. At conductor cancellation: `7/8`, not 1. | Used with the theorem's explicit uniformizer valuation hypothesis. |
| `HasCentralValue`; 0.3; 104 | NF, η, ϖ, z; entire F and actual `HasProd` on Re(s)>3/2 | Two eligible entire continuations coincide on an open half-plane and hence at 1. For the trivial character, the pole precludes this entire witness. Wrong parity yields z=0; correct parity admits nonzero z outside a finite set. | No arbitrary analytic stand-in: F is tied to the actual Euler factors. |
| `factPrime`; 6.1; 118 | `p : Nat.Primes`; no outer variables | p=2 gives `Fact (Nat.Prime 2)`; p=3 gives the corresponding fact; p=1 has no input in `Nat.Primes`. | Necessary local instance, not a theorem used as padding. |
| `rohrlichCount`; 6.1; 122 | P finite, α β over all prime indices, q natural, t real | P=∅,t=1/2: count1; t=1: count9; t<0: count0. P={5},α₅=5,β₅=0,t=1: q=5 count6, q=25 count0. | Bounded integer rectangle is finite; `ncard` is honest. q=0 with P nonempty forces a nonzero element into the zero ideal, giving count0. |
| `rohrlichCount_eq_zero`; 6.1; 131 | P,α,β, algebraicity at p∈P, nonzero direction, c<1/2 | P={5},α=1,β=0,q=25,c=1/4: `t=√5`; nonzero v divisible by25 cannot satisfy `|v|≤√5`, so count0. P=∅: Q=2 removes q=1. | Matches README; threshold may depend on the fixed directions and c, not q. |
| `rohrlichCount_lt`; 6.1; 141 | Same direction hypotheses; `1/2<d<3/5`, `5d/2−1<s<1/2` | d=11/20,s=7/16: `5d/2−1=3/8<7/16<1/2`. Rational direction (1,0), q=25: count0 `<25^(7/16)`. At d=3/5 the requested interval is empty, and strict hd' excludes it. | The source proof gives this open parameter range. |
| `centralValue_parity_dichotomy`; 6.5; 167 | NF, CM, quadratic extension, ι,φ,ν,p prime and p≠2, prime ideal v=(p), φ type/equivariance/unramifiedness, ν finite/anti/unramified, ϖ of valuation exp(−1) | K=ℚ(√−7),p=5: orders1,5,25,125 give c=0,2,3,4 and signs+,+,−,+. c=3 gives value0; infinitely many even conductors give nonzero values apart from finitely many. p=3 is allowed; p=2,split/ramified p are excluded by explicit binders. | Matches arbitrary class-number README. No omitted Noetherian/topological/finite-dimensional assumption is needed on these native carriers. |

### README target computation ledger

Locations in this table are sections of packages/NonordinaryCMSpecialValues/README.md. A successful finite computation is a negative-control test, not a proof of the general theorem. General statements were also compared with their sources and suppliers. Formula blocks inside a numbered target get separate rows where their normalisation differs.

| Statement / block | Instances and values on the two sides | Result / change |
|---|---|---|
| Conventions: fields and embeddings | NumberField has characteristic0, finite degree and is nontrivial. For quadratic CM, degree2 and maximal real degree1. Residue fields F₂/F₃ are permitted in §§2.1–2.6; outside, p odd; BKO sections p≥5,p∤h. | Zero rings, inseparable number fields and arbitrary non-Noetherian bases are not admitted instances. |
| Conventions: characters | At x=3+2i congruent to1, ideal value x and archimedean value x⁻¹ multiply to1. Norm on the ideal is13. | Arithmetic Artin and inverse archimedean convention agree with the pinned principal-ideal theorem. |
| Conventions: L-functions | Weight1 gives `|η(v)|=√q`, so at s=1 the deleted parameter has size1/√q<1. At q=25 this is1/5. | No zero denominator at the centre; q=1 cannot be a finite-prime norm. |
| Conventions: indices | Orders1,l,l² correspond to layers0,1,2 and conductors0,2,3. For an unramified order3 class character, order3 but conductor0. | Class-number caveat retained. |
| Conventions: torsion/periods | p=5: Φ₀ degree24, Φ₁ degree600; π=-5. For Q_n=(-1)^nP_n, `[-p]Q_(n+1)=Q_n`. | No shifted first layer or wrong Tate-basis sign. |
| Conventions: duals/twists | Scalar action a on T becomes a⁻¹ on T∨; theta inverse has Kummer class `−κ(theta)`. `[g]` evaluates to ζ, not ζ⁻¹. | Both pairings and direct character evaluation retain these signs. |
| 0.1 Type and conjugation | Gaussian principal x=3+2i gives x, conjugate 3−2i and product13. At rational inert7, `κ(7)7=−7`. ψ=φ³/N fails the principal type condition. | Sound; S02 affects only the Lean gloss. |
| 0.2 Anticyclotomic family | Trivial character: order1,c0. K=ℚ(√−31),p3: an order3 class character has c0. Local pro-p quotient gives characters of every sufficiently deep conductor, both parities infinitely often. | No vacuous almost-all quantifier or odd-order restriction on the fixed ν. |
| 0.3 Euler factors and continuation | Unramified value−1 at norm7 gives7/8, while the wrong sign gives7/6. Ramified character factor1 even though its uniformizer component is nonzero. Cancelling ramification restores7/8. | Three discriminating cases; finite deletions preserve zero/nonzero. |
| 0.4 Period datum | Scaling Ω alone by2 changes L/Ω to half; scaling ω and Ω together leaves per(ω)/Ω fixed. Scaling Ω byp lowers valuation by1. A nonprincipal ideal lattice over ℚ(√−5) cannot equal ΩO_K. | Integral normalisation excludes arbitrary rescaling. |
| 0.5 Auxiliary split prime | For K=ℚ(√−7),p5: l23 splits and5∤22; l11 splits but5∣10; l13 is inert. | Distinguishes split condition and congruence exclusion. Chebotarev supplies infinitely many choices. |
| 0.6 Auxiliary characters | l23: order23 gives degree23 layer and conductor23²; trivial has conductor1; evaluation at a generator gives ζ₂₃ rather than its inverse. | Layer and conductor indices agree with 0.2 and BKO. |
| 1.1 Canonical root sign | `(2/7)=(2/23)=+1`, `(2/11)=(2/19)=−1`. Under additive-character reversal the pair `(i,−i)` becomes `(−i,i)`; both products1. | Formula scoped to odd D; no assertion `(2/D)` for even D. |
| 1.2 Auxiliary root invariance | ν=1 gives W=W. At split auxiliary primes, inverse local Gauss contributions multiply to1. An arbitrary order-two genus twist can give a nontrivial value on the conductor/different and is outside the auxiliary odd-order argument. | No transfer of the auxiliary invariance claim to all finite twists. |
| 1.3 Conductor sign | c0 and c2 multiply W by1; c3 multiplies by−1. Order3 unramified class character uses c0, not the order index1. A quadratic fixed ν unramified at p is allowed. | Correct conductor convention and generality. |
| 1.4 Forced zeros | W=-1 gives `Λ(1)=−Λ(1)`, hence2Λ(1)=0 and Λ(1)=0 in ℂ. W=+1 gives the tautology Λ(1)=Λ(1), not nonvanishing. | No false converse. |
| 2.1 CM theta refinement | a=(5) has N(a)=25; divisor degree25−25=0. Norm through [5] pushes it to zero, whereas the proposed target divisor is nonzero; this is excluded by coprimality. [2] permutes E[5]. | Necessary kernel/coprimality condition present. Ideals (2+i),(2−i) have equal norms but different kernels. |
| 2.2 Canonical pair and standard unit | In ℚ(i), modulus3 separates all units; modulus2 identifies1 and−1 and is excluded. Inverting theta negates its logarithm. At the displayed trivial-character example, `24·L′(0)=−12 log3`, with theta giving the opposite sign. | Unit and theta conventions distinguished. |
| 2.3 Smoothing and rational class | Inverting a unit negates the rational Kummer class; the smoothing operator acts on that class with the same sign. The initial p-power bound uses n≥2 at p2, n≥1 at p7. | No integral conclusion obtained merely by inverting a smoothing factor. |
| 2.4 Rational realisation and period | r2, principal9: the descent scalar is `81/81=1`; omitting inverse character gives81². H¹ of the curve has rank2; its selected de Rham line has rank1, not the full rank2 space. | Kato's inverse-action realisation retained. |
| 2.4 Integral Betti comparison | For K=ℚ(√−7), y=1/√−7 gives a degree1 lattice comparison; y=5/√−7 gives degree25, prime to p when p≠5. Rescaling the dual byp excludes a primitive γ. | Repair addresses the formerly arbitrary lattice. |
| 2.5 Height-one law and good reduction | Split p5 has connected/étale component dimensions1,0, each coefficient-height1; total dimension1. Ramified/inert cases use connected formal components. ξ=8,α=1,ν=7 gives ξ−ν=1, whereas ξ+ν=15. | Translation sign and étale exception correct. Good-reduction descent is the repaired route, not the source's false universal assertion. |
| 2.5 Differential/level factors | Scaling ω byu multiplies the order-r differential byu⁻ʳ and its r-fold tensor byuʳ: product1. r1 gives `(r−1)!=1`; r2 still1; r3 gives2. | No missing factorial or r0 instance; r≥1 is explicit. |
| 2.6 Kato reciprocity | A theta zero of order24 has dlog leading24/z and next derivative−24/z². At inert p5, deleting the primitive factor multiplies by6/5. At split5 the two factors give8/5, not4/5 or6/5; ramified-at-p factor1. | Theta sign `(-1)^(r−1)` and inverse-unit sign `(-1)^r` pass the two-term test. |
| 2.7 Integral class | Smoothing residue α(ᾱ−1) at α=2 is2, a p-unit; at α=1 it is0. Ω↦−Ω sends γ,z to−γ,−z. Once p is already in the modulus, successive norm levels have no new Euler factor. | Fixed lattice and projected smoothing test consistent. Full integrality is a substantive target, not certified by this residue calculation alone. |
| 2.8 Direct-character reciprocity | Generator of order25 evaluates toζ₂₅, notζ₂₅⁻¹. A wrong-sign c3 character has both central value and the corresponding regulator coordinate0. An already ramified deleted auxiliary prime contributes1. | Direct character convention preserved. |
| 2.9 Kummer twist | For g acting on T by a, `g(x⊗t)=gx⊗at`; identifying by t makes the map semilinear by a⁻¹. For a=2 mod7 these scalars are2 and4, not equal. Rank0 T gives0 on both inverse-limit sides. | Covered by the declared character-twist gap; finite-S completion retained. |
| 2.10 Period changes | `(ω,Ω)↦(2ω,2Ω)` gives unchanged γ; Ω↦−Ω alone gives−γ; a p-unit changes valuations by0, p changes them by−1. | No unjustified invariance under nonunit period changes. |
| 3.1 Towers/compositum | n0 gives E[p], local degree p²−1; r1 means l-layer degree l and conductor l². p5,n1 gives24·25=600. | Matches both local and ring-class indexing. |
| 3.2 Disjointness | p47,l23: l divides p²−1=2208, so degree-coprimality cannot prove disjointness. Different ramification supports and p∤h force the intersection degree1. | The proof uses ramification, not a false coprime-degree claim. |
| 3.3 Splitting/semilocal | `(p)` is principal in the relevant order, Artin class1. With h2, augmentation `(x,y)↦x+y` differs from one-place projection x. At p5 each local factor should have degree24. | Mathematics consistent; the construction order needs S03. |
| 3.4 Frobenius | At p7 on y²=x³−x over ℚ(i), eigenvalues−7,−7 give polynomial `(X+7)²`, trace−14 and norm49. For h3,p5 the norm of a prime of H is still(5), giving−5. | No class-number-one assumption or sign reversal. |
| 3.5 Honda/Lubin–Tate | p5: a₂₅=−10 gives point count36 and parameter−5; parameter+5 would give count16. Degrees24,600 are divisible by cyclotomic degrees4,20. | Identity and marked differential/basis comparisons agree with the supplier; no height-two assertion at split primes. |
| 4.1 Local μ and Finis character | A prime-to-ℓ root of unity differing from1 has v_ℓ(ζ−1)=0; a primitive ℓ-th root gives1/(ℓ−1). λ=φ̄/N has infinity value i at z=i, while the reversed type gives−i. | Correct finite-order/local and infinity conventions. `b_ℓ` is only forward-referenced here. |
| 4.2 Theta spaces and normalised pairing | K=ℚ(√−7),d25,a=O: dimension175. At b=(1/5)O dimension7; primitive dimension168. The trace composed with inclusion multiplies by index25; its adjoint is trace/25. | Corrects Finis's unnormalised-adjoint claim. |
| 4.2 Primitive/global theta families | d5 is square-free: dimension35 and full space primitive. For d25 the excluded trace contribution has dimension7, leaving168. A compatible family has finitely many ideal-class components, not independent values on infinitely many ideals. | Rank and global carrier distinguished. |
| 4.2 Arithmetic and integral lattices | If θ has a unit torsion value at ℓ5, θ is normalised; 5θ is integral but not normalised; θ/5 fails integrality. The lattice sandwich has denominator rDN(a), so at an ℓ dividing that integer it is not automatically equality. | Three discriminating lattice tests; zero is integral but not normalised. |
| 4.3 Shintani operator and spectrum | Split2 example: `E(b⁻¹)E(b)=2`; multiplication by `(1/2)²` gives1/2=`λ((2))`. For principal z, F*(z)=z⁻¹ and its inverse factorisation gives z. | No missing γ normalisation or principal inverse. Primitive multiplicity1; full multiplicity may exceed1. |
| 4.3 Dagger | u,v fixed and independent: `(u+iv)†=u−iv`, not proportional. For a nonzero line vector, replacing θ by iθ changes ε to−ε. At θ0 both ε±1 work. | Higher multiplicity repaired; S01 fixes zero. |
| 4.4 Evaluation functional | h1 gives one class term; h3 gives a sum of three terms. Scaling θ by5 multiplies l(θ) by5, and its squared value by25. | Functional is linear on the actual class-component space. |
| 4.4 Yang central-value formula | The displayed D7,k1 case has constant √7/π. Multiplying θ by5 multiplies both sides of the squared-value identity by25. | Primary theorem and Finis specialisation located; OCR limitation on the full constant recorded below. |
| 4.4 Bilinear/Hermitian pairings | For scalar i, a complex-bilinear pairing gives iB, whereas changing the conjugate-linear slot of a Hermitian pairing gives−iH. On the nonzero one-dimensional eigenspace, B(θ,θ) is a unit-modulus scalar times positive H(θ,θ), hence nonzero. | Nonzero denominator established before taking its valuation. |
| 4.4 Pairing invariant b_ℓ | Scaling the lattice byℓ increases its pairing minimum by2, so b_ℓ decreases by2; v_ℓ(D)/4 contributes1/4 at a ramified discriminant prime of valuation1. At an unramified inert character the correction is0. | Sign and lattice dependence are explicit. |
| 4.4 Arithmetic valuation formula | With v(pairing)=3/4 and v(product)=1, subtraction gives1/4, not7/4. Ω↦ℓΩ lowers normalised-value valuation by1. Scaling θ byℓ adds1 to v(l) and2 to the pairing, which cancel. | Denominator, factor2 and period convention agree. |
| 4.5 Torsion density | A torsion point is a coset of the zero subgroup; the diagonal in E² is a dimension1 subgroup; a curve of genus≥2 in an abelian surface is not an elliptic subgroup translate. | Includes dimension0 and positive-dimensional subgroup cases. Primary BOXALL92 remains waived. |
| 4.6 Mod-ℓ nonvanishing | A normalised θ has at least one value of valuation0; ℓθ loses this property. Tower prime≠ℓ is retained. Exceptional ℓ3,K=ℚ(√−3) is not promoted to the unexceptional lower-bound assertion. | Uniform threshold is over the specified eigenspaces; no same-prime substitution. |
| 4.7 Finis theorem | Inert unramified λ_ℓ has b=0; away inert unramified places μ=0, so the formula gives valuation0 almost always. Positive μ or b contributes the displayed positive correction. | Both split/nonsplit valuation-prime forms retained, with the exceptional lower-bound case stated. |
| 5.1 Finis family conversion | At inert5, λ((5))=−1/5; wrong multiplication by N gives−125. At s0 the correct inverse Euler denominator is6/5, while the wrong family at its shifted wrong point gives3126. | λ=φ̄ν/N has centre0 corresponding to φ̄ν at1. |
| 5.2 Inert corrections | Canonical conductor supported at ramified primes, ν supported at split l: every inert q in the μ-sum is unramified, yielding μ=0; at inert p also b=0. | No hidden ordinary hypothesis. |
| 5.3 Deleted auxiliary factors | Nontrivial ν is ramified at l, so both primitive factors are1. ν=1 need not give1. Deleting inert p5 instead contributes6/5. | Nontriviality and the precise deletion set are necessary. |
| 5.4 Almost-all units | Finis's value becomes `b+Σμ=0+0=0`; a wrong-sign value would be0 with infinite valuation, excluded by W=+1. Multiplying the fixed period by a p-unit preserves0. | Correct unit conclusion in the stated canonical sign-positive family. |
| 5.5 Unit witness | Exact-order l^r families have unbounded r; removing finitely many characters and the trivial one leaves a nonempty set at arbitrarily large conductor. At a surviving character, valuation0 rather than merely finite. | Witness does not rely on a finite order-l sample or signed decomposition. |
| 5.6 Unramified coefficient field | Class order d prime to p: derivative of X^d−u at a unit root is a unit. Roots of unity of order l^r, l≠p, are unramified. If p∣d the derivative is divisible byp, so the argument no longer applies. | p∤h hypothesis retained; algebraicity alone is not claimed to imply unramifiedness. |
| 5.7 Scalar-to-tensor kernel | Totally ramified F and unramified U have intersectionΦ, so multiplication is injective; if F=U is a nontrivial extension, `a⊗1−1⊗a` is nonzero and maps to0. At p5, degree F/Φ24 is allowed. | Precise linear-disjointness hypothesis and coefficient embedding retained. |
| 6.1 Count | P={5},α5,β0,t1: q5 gives6, q25 gives0. P=∅,t1/2 gives1, not0. d11/20,s7/16 gives admissible interval3/8<7/16<1/2. | Repaired boundary and source-misprint controls discriminate the intended count. |
| 6.2 Average | K=ℚ(√−7), deleted support{5,7}: κ(5)=−1,κ(7)=0, correction `(1+1/5)·1=6/5`; limit is `(12/5)L(1,κ)≠0`. Tail cutoff is e⁻ˣ→0, whereas eˣ→∞. | Formula and sign pass; partial-summation supplier locator needs S04. |
| 6.3 Galois vanishing | σ fixing K with ζ₂₅↦ζ₂₅² preserves order25,c3 and the zero value. σ=id fixes everything. Complex conjugation sends i to−i and is not in Aut(ℂ/ℚ(i)). | Algebraic critical normalisation, not an arbitrary action on transcendental periods, is transported. |
| 6.4 Almost-all nonvanishing | If one Galois orbit vanishes, its finite average is0; beyond the threshold it approaches a nonzero constant and cannot be0. Wrong-sign characters remain zero; a nonzero finite Euler correction preserves nonzero. | Does not assert derivative nonvanishing or remove the sign condition. |
| 6.5 Dichotomy | Orders1,5,25,125: c0,2,3,4 and signs+,+,−,+; wrong sign gives0, correct sign has finitely many exceptions in an infinite family. p3 is allowed. Reversing ε would force infinitely many actual zeros into the finite-exception set. | Sign determined, with no class-number restriction and no finite-family vacuity. |

The trivial group tests for norm/evaluation give the identity map and a one-term sum; the empty Euler-deletion set gives product1. No theorem here is about arbitrary nonabelian groups: its Galois groups are explicitly abelian class-field or Lubin–Tate groups, so S₃ and Q₈ do not instantiate them. The source's finite-theta translations use a genuinely noncommutative Heisenberg construction, not a claim that all groups are commutative. Rank-zero coefficient twists give zero on both sides; elliptic Tate modules themselves have prescribed positive rank. Nonreduced test bases belong to the imported theta-unit/finite-flat foundations, whose stated finite locally free and invertibility hypotheses are retained; the local application bases are integer rings of local number fields. No target in this package quantifies over arbitrary covers, fans, non-quasi-separated schemes, or zero-polynomial degrees.

### Suppliers, ownership and dependency direction

The supplier paths in this table have the form TauCetiRoadmap/NAME/README.md, except the four explicitly archived suppliers under Completed/. Sections were read at main or the supplied open head, not inferred from the names in this package. The row for ArithmeticDirichletSeries records S04 rather than treating the incorrect contract as verified.

| Supplier | Resolved sections / hypothesis comparison |
|---|---|
| ComplexMultiplicationAndExplicitReciprocity | §§1.2, 2.2, 3.2, 4.1 and 4.3 exist. §4.1 permits a CM variety over a number field k, hence E/H; the Frobenius identity is used at good primes. §4.2's narrower analytic comparison is no longer consumed. Canonical Gross existence excludes D=3 and the unsupported discriminant classes. |
| AutomorphicLFunctionsAndLocalFactors | AL.1.1.1, 1.3.1, 1.3.4–1.3.5, 1.5.2, 1.6.1–1.6.2, 5.1.1, 5.3.2 resolve. The product formula belongs to 1.6.1. Its positive archimedean additive character gives i for angular weight ±1, whereas Rohrlich's reversed character gives −i; the README explicitly converts all local factors, preserving the global product. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | §§2.1–2.4, 4.3–4.4 resolve. The generic tower is for a specified Lubin–Tate module; it does not by itself identify CM torsion completions. Degree `(q−1)q^(m−1)` uses m≥1 and primitive points. At m=1,q25 the degree24 agrees; m=0 or the point0 does not give that degree. S03 concerns the placement of the application. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1.8–1.9 and R07.1.12–1.14 resolve. The henselian/mixed-characteristic Tate-module result includes étale components; formal-group comparison uses the connected part over the complete Noetherian integer ring. Dimension0 for an étale component is retained. |
| SelmerIwasawaCohomology | §§0.8–0.11, 3.6–3.7 resolve. Kummer uses completion generally and tensor product only in the finite-S finitely generated situation. §3.7 supplies cyclotomic twists; arbitrary finite-free character twisting is correctly declared as a gap. |
| PadicHodgeRegulators | §§1.4, 1.7, 1.11 resolve: exp* lands in Fil⁰, kernel H¹_g, with semilocal and restriction/corestriction comparisons. The package does not replace Fil⁰ by all D_dR or the kernel by H¹_f. |
| ModularSymbolsPadicLFunctions | §§1.2 and 4.3 resolve. They transport algebraic critical coordinates with chosen periods, not the transcendental period under an arbitrary automorphism. |
| GL2AutomorphicRepresentationsAndTransfer | R16.2.13, R16.5.3, R16.6.1 and R17.4.16 resolve. Conjugate inducing characters have the same induction; angular exponent −1 gives D₂. The central character and `s+1/2` shift in §6.3 match these targets. |
| DiophantineApproximationAndTranscendence | Main §§2.1 and 2.3, lines 859 and 941: independent algebraic forms at finitely many places and Ridout approximation. The two-variable forms have a nonzero direction; the product inequality excludes a zero local linear form. The package owns the subsequent lattice counting argument. |
| PadicFamilies | §4.0.1 contains the integer-index theta unit, norm/base-change/isogeny law and normalised q-expansion. The package adds the CM ideal refinement and comparison at a=(c), rather than a second construction of the integer-index unit. |
| NeronModelsAndSemistableAbelianVarieties | §§5.1 and 5.1a exist. Potential good reduction follows from finite inertia; killing its action on m-torsion, m≥3 prime to residue characteristic, gives good reduction. This is exactly the new extension in §2.5. |
| Completed/GlobalNumberFields | Layers 9–11, lines 508, 531 and 571: continuous Hecke characters, separate finite-order and algebraic-infinity-type notions, orders/Picard groups. A native character is not automatically unitary, algebraic or finite order. |
| ClassFieldTheory | Layer 13, particularly the ring-class paragraph at line 2122, is for arbitrary orders and uses invertible proper ideals. A prime-to-conductor principal ideal generated by p has trivial Artin class. The package owns the specific anticyclotomic quotients/comparison, not class-field existence. |
| Completed/Chebotarev | Layer 10, line 410: infinitely many primes in each Frobenius class after finite exclusions. This supplies the auxiliary split prime, including the extra congruence condition. |
| Completed/LocalFieldsRamification | Layers 2–3, lines 576 and 724: unramified fields, arithmetic Frobenius, maximal unramified subextension and ramification. The field-intersection argument uses finite local number-field extensions, not arbitrary valued extensions with inseparable residue field. |
| EllipticCurves | Layers 1–3 resolve: differential/formal group, torsion and Weil pairing with invertible torsion order, Tate representation and finite-field Frobenius. The application uses auxiliary Tate prime different from residue characteristic when invoking faithfulness. |
| Completed/ArithmeticDirichletSeries | Layer 3, line 190 supplies the Euler product; Layer 5, line 237 supplies counts. Abel summation is Layer 6, target 6.1, line 257: S04. |

Both gap slugs occur verbatim in design/plan.json:1894–1903 and README:76,103, with the same named suppliers and sections. Neither has supplier `none`. The FQ contract fixes the character restriction, trace additive character, central point and Δ; the twist contract fixes the tower-factorisation hypothesis, finite free coefficients, diagonal action and norm/localisation compatibility. These are single comparisons with required naturality, not bundles of unrelated missing theories. The supplied cyclotomic twist does not supply the general character twist. The epsilon-factor formulas alone do not supply FQ. Neither gap is raised as a defect, and no later owner is introduced as a supplier.

Object searches used `roadmaps grep` for elliptic units, canonical CM pairs, Shintani/theta constructions, height-one reciprocity and the Rohrlich count, and the supplied sibling checkouts and board packages. The closest scopes were also read:

- NoncommutativeAndEquivariantIwasawa §4.3 uses E/ℚ and ordinary split p≥5, with its own Siegel-function normalisation. It does not state this all-prime canonical-pair reciprocity. This package's comparison to its scope is accurate.
- ModularIwasawaMainConjecturesPartII explicitly consumes this package's §§2.1–2.6; its tower modules and main-conjecture consequences are distinct targets. The settled earlier ownership decision is not re-raised.
- KatoEulerSystems owns modular Beilinson–Kato classes, Siegel units and their modular reciprocity; its cyclotomic central-value nonvanishing is not Jia's anticyclotomic count/average theorem.
- AnticyclotomicLocalUnits explicitly consumes NCM.0–NCM.5 and owns the signed quotient, projection and Coleman derivatives excluded here. No reverse supply edge was found.
- ModularIwasawaMainConjectures owns the modular formulation dictionaries and ordinary/signed main-conjecture comparisons, not Finis's weight-one theorem.
- Main LFunctions and Completed/GlobalNumberFields own analytic continuation and native Hecke/class-field carriers, respectively. This package imports their available interfaces through its stated suppliers and only defines simple predicates for its acceptance test.

The open #2290 is another checkout of this same roadmap, not a second owner under a different mathematical title or a copy already on main. Its older text still includes the unrestricted dagger statement, broader Finis weight scope, local FQ ownership and generic twist ownership which the present package has changed. The package must update that open roadmap head before merge; these versions must not be treated as two independently mergeable roadmap additions. The overlap index reports no dropped supplier IDs, and the present README preserves the NCM aliases consumed by AnticyclotomicLocalUnits. The same fully qualified Lean names found by the name search occur only in that older checkout of this roadmap, not in an independent sibling namespace.

Pinned API checks included:

- TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70,80: `HeckeCharacter` is a continuous monoid homomorphism to ℂˣ; `IsFiniteOrder` is separate. FiniteComponent.lean:85,181,254,270 supplies the local component, conductor exponent and nonzero conductor. No implicit finite order is available from the carrier.
- TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120,155,200: conductor-prime ideal character, uniformizer comparison and inverse archimedean principal law. The uniformizer has valuation `WithZero.exp (-1)`, as in the theorem.
- TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111,155,178,214,222,251: ring-class field, ramification, Artin, Frobenius, degree and splitting. The splitting theorem really requires a prime ideal prime to the conductor and a generator belonging to the order.
- Mathlib/Algebra/MonoidAlgebra/Basic.lean:231,250: `lift` and `lift_single` give `b • F a`; no inverse character. Mathlib/RingTheory/LinearDisjoint.lean:233 identifies injectivity of the actual multiplication map. Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412 requires a nontrivial Dirichlet character (and the surrounding nonzero-modulus instance).

No near-match in the supplied library search record proves one of the three headline theorems. Grepping the relevant pinned arithmetic objects did not find native CM attachment, the required CM-coefficient period/dual-exponential package, or Finis's theta/invariant carriers. Existing general Galois cohomology and modular-form L-functions do not supply these missing attachments merely by having a similar name.

The required dependency command was run read-only with this package name, head, supplied content and order. Its complete output was:

```text
depcheck: 239 roadmaps, 2171 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This is a roadmap-level check; it does not eliminate S03's internal section cycle. The base-to-head diff changes ten files, all inside packages/NonordinaryCMSpecialValues/. Suggested.lean has one `import Mathlib`, two existing individual TauCeti imports, no `lemma`, no `set_option`, no admitted data and exactly three admitted theorem proofs. No computational algorithm or process narrative was found in the README or module/declaration docstrings. No source file was copied into the package.

### Source and expression audit

The following 32 groups identify the source passages inspected against the corresponding package claims. A group may contain multiple numbered equations or adjacent propositions. “Verified” here means the cited passage supports the stated construction or theorem at the retained hypotheses, subject to the explicit errata and the limitations below; it is not certification of the entire source's proof.

| # | Source / locator / line | Package comparison |
|---|---|---|
| 1 | BKO21 §2, pp.947–949, lines 227–301 | π=-p, tame layer, order/conductor convention and the inverse Tate twist. |
| 2 | BKO21 §3.0.2, pp.951–952, lines 388–434 | Auxiliary l, integral period, fixed Tate lattice, direct-character regulator and twist. |
| 3 | BKO21 Proposition 3.3, p.953, lines 475–488 | Parity sign uses conductor exponent n+1, and the direct character is not inverted in the sum. |
| 4 | BKO21 Theorem 3.4 proof, pp.953–954, lines 490–513 | Canonical-conductor support, inert corrections0, almost-all unit values; the local signed projection is outside this package. |
| 5 | KATO04 Proposition 1.3, pp.121–122, lines 212–239 | Theta divisor/norm, complex formula, and prime-to-c isogeny restriction. |
| 6 | KATO04 §15.3, pp.251–252, lines 5211–5241 | Rigidified canonical CM pair and ray-field reciprocity. |
| 7 | KATO04 §15.4, p.252, lines 5242–5259 | Ideal-index refinement and cocycle; the omitted isogeny restriction is corrected here. |
| 8 | KATO04 §§15.5–15.6, pp.253–256, lines 5263–5348 | Standard unit is inverse theta, smoothing and rational zeta element. |
| 9 | KATO04 §§15.7–15.8, pp.256–257, lines 5383–5456 | Realisation, inverse action, de Rham and Betti period maps. |
| 10 | KATO04 Proposition 15.9 and proof, pp.257–260, lines 5457–5571 | Rational reciprocity, height-one law invocation, translation and good-reduction problems. KATO99 itself remains uncertified. |
| 11 | FINIS06 §1/Theorem 1.1, pp.768–769, lines 61–122 | Type k+j=-1, local μ/b terms, split versus nonsplit range and exceptional lower bound. |
| 12 | FINIS06 §2, equations (3)–(5), pp.771–772, lines 180–251 | Theta automorphy, scalar product, primitive trace kernels; adjoint needs the index correction. |
| 13 | FINIS06 §2 Shintani theory, pp.773–774, lines 252–295 | Normalising γ, principal inverse, representation/spectrum. |
| 14 | FINIS06 Proposition 2.2/Corollary 2.3, pp.777–778, lines 470–504 | Primitive spectrum and character correspondence. |
| 15 | FINIS06 Proposition 2.4 and surrounding Yang comparison, pp.778–780, lines 505–580 | Squared evaluation formula, norm and archimedean factors; primary Yang theorem located separately. |
| 16 | FINIS06 Lemma 3.1, pp.782–783, lines 642–691 | Arithmetic translated values and rigidified line-bundle sections. |
| 17 | FINIS06 Lemma 3.3, pp.784–785, lines 692–737 | Integral lattice sandwich, including nonunit denominator. |
| 18 | FINIS06 Proposition 3.4, pp.786–787, lines 765–849 | Arithmetic pairing, standard basis and discriminant normalisation. |
| 19 | FINIS06 Lemma 3.5, p.787, lines 854–861 | Dagger intertwining; the unrestricted proportionality is false in multiplicity greater than one. |
| 20 | FINIS06 Proposition 3.6/equation (13), p.787, lines 862–879 | Pairing in the denominator and algebraic Yang formula; cross-check with Proposition 2.4 and the period scaling. |
| 21 | FINIS06 equation (14)/Proposition 3.7/(15), pp.788–789, lines 882–940 | Negative minimum, local invariant, Gauss factor and valuation formula. |
| 22 | FINIS06 proof of Theorem 1.1, pp.793–795, lines 1134–1216 | D^(1/4) value normalisation, local corrections and weight-one conclusion. |
| 23 | FINIS06 Theorem 4.1, p.795, lines 1217–1238; Lemma 4.5, p.805, lines 1571–1608 | Uniform mod-ℓ nonvanishing target and torsion-subvariety input. The separate Boxall primary text is waived. |
| 24 | JIA24 Theorem 1/Property 1, pp.2–4, lines 66–163 | General class number, type hypothesis for rational-principal equivalence, and the printed inverse-power error. |
| 25 | JIA24 §2, equations (2.13)–(2.29), pp.5–7, lines 220–330; tail (2.43), p.10, line 486 | Galois average, conductor support, nonzero rational main term and negative exponential cutoff. |
| 26 | JIA24 §4/Proposition 5, pp.18–20, lines 870–940 | Modulus qℤ_p and box q^c; two transcription errors independently compared with Rohrlich. |
| 27 | ROHRLICH84 §3, Propositions 1–2 and proof, pp.401–407, lines 763–845,896–1011 | Nonzero p-adic forms, eventual thresholds and full open d,s range. |
| 28 | ROHRLICH-NOTES Propositions 1.5–1.6, pp.14–15, lines 650–708; Lecture 2 §§5.1–5.2 and §7.1, lines 1592–1728,1840–1856 | Odd/even discriminants, local Gauss factors, canonical additive character and reversal to the supplier convention. |
| 29 | GREENBERG83 pp.246–247, lines 253–335 | Odd auxiliary twist and supersingular conductor parity, with the class-number-one source setting kept distinct from the general local proof. |
| 30 | RUBIN87 Lemma 3.1 and §3, pp.409–410, lines 191–227; AH05 Proposition 3.1/Remark 3.2, p.4, lines 138–152 | Frobenius−p, local CM/Lubin–Tate comparison and the explicit warning about trivial-character/order-index parity. |
| 31 | QUEYRUT74 theorem/local formula, p.135, lines 86–97 | Finite-order global anticyclotomic root number and trace-character local formula. General local FQ remains the declared supplier contract. |
| 32 | YANG97 Theorem 2.6/(2.19), p.43, lines 691–702; Theorem 2.15, p.48, lines 862–878 | Primary theta-lift central-value theorem and chosen local vectors. OCR identifies the hypotheses and theorem; the full coefficient in (2.19) is not cleanly recoverable. |

For the wording check, each group was compared at its relevant statement or construction passage, not treated as permission to reuse surrounding exposition. Five additional prose comparisons were made: README:46 against BKO21 lines 409–413 (identified dual lattice); README:390 against KATO04 lines 5478–5503 (good-reduction route); README:463 against BKO21 lines 404–411 (period changes); README:720 against FINIS06 lines 1217–1238 (uniform nonvanishing); and Suggested.lean:154–165 against JIA24 lines 66–100 (parity/nonvanishing docstring). These add mathematical hypotheses or reorganise the argument; no copied sentence, clause-by-clause paraphrase, figure, table, exercise list or external Lean formalisation was identified. Mathematical formulas and unavoidable terminology were not counted as borrowed expression.

Counting author-and-locator introductions in the README body, excluding the bibliography and source-ID line annotations, gives 120 citation occurrences: FINIS06 40, KATO04 27, BKO21 26, JIA24 10, ROHRLICH-NOTES 4, ROHRLICH84 4, GREENBERG83 2, RUBIN87 2, and one each for AH05, YANG97, QUEYRUT74, KATO99 and BOXALL92. This occurrence count differs from the 32 inspection groups above.

The largest source's actual contents headings are FINIS06 §1 Introduction, §2 theta functions/operators/L-values (line 166), §3 integral theta functions/main theorem (line 624), and §4 characteristic-ℓ nonvanishing (line 1217). The current mapping is §4.1↔source §1, §4.2↔source §§2+3, §4.3↔source §§2+3, §4.4↔source §§2+3 and Yang §2, §§4.5–4.6↔source §4, §4.7↔source §§1+3. It is not a one-to-one run of source sections. The needs lines force spaces/lattices before the representation, the pairings before their invariant, and mod-ℓ nonvanishing before the final almost-all valuation theorem. Kato/BKO supply a separate reciprocity branch and Rohrlich/Jia a separate counting/average branch. No source-arrangement finding remains after the round-one repair.

## Not verifiable

- KATO99, Theorem 4.3.1: settled `uncertified`; the primary text was not available. KATO04 line 5495 verifies the invocation, not every hypothesis of the original theorem. The repaired extension/descent route is arithmetically consistent, but its application of that exact general reciprocity theorem remains uncertified.
- BOXALL92, Theorem 1: settled `waived`; FINIS06's use and the stated torsion-density input were checked, not the unavailable primary text. No new source request was made for either settled work.
- YANG97 equation (2.19) and some KATO04 displayed formulas are damaged in the cached extraction. Their theorem locations and surrounding hypotheses were readable. The explicit scalar was cross-checked through Finis and the package's scaling equations, but not independently transcribed from a clean primary image.
- The JIA24 manifest explicitly cites arXiv v1; its published Acta Arithmetica version was not read. The review does not certify that the published text retains or corrects the v1 misprints.
- No Lean build or new elaboration was run. The worker's signature transcript and the pinned declarations were inspected; its two extraction errors came from parsing prose, so this review does not treat the transcript as an independently clean build log.
- The full integral BKO family, beyond the fixed-lattice comparison and the tested projected smoothing factor, was not reconstructed from an integral proof. BKO21 lines 414–416 state the family and invoke Kato's rational reciprocity. A projection's unit smoothing factor alone does not prove full-module integrality; this report does not promote that test into such a proof or infer a counterexample from it.

## Source issues

- **Error** in KATO04 at (15.4.2), printed p.252, line 5254: the source says isogeny norm preserves the ideal-index theta function without a kernel restriction; it should be restricted to isogenies with kernel disjoint from the indexing torsion; affects a stated result.
- **Misprint** in KATO04 at the proof of Proposition 15.9, printed p.258, lines 5490–5491: the source says translate by plus ν after defining ν=ξ−α; it should be translation by minus ν to evaluate at α; affects the proof.
- **Error** in KATO04 at the proof of Proposition 15.9, printed p.258, lines 5492–5494: the source says the canonical CM pair has good reduction everywhere over the indicated ray field; it should first pass to a field killing finite inertia and justify descent; affects the proof.
- **Error** in FINIS06 at the trace-operator paragraph, printed p.772, lines 238–240: the source says the unnormalised trace is adjoint to inclusion for its normalised inner products; it should divide the trace by the lattice index; affects a stated result.
- **Error** in FINIS06 at Lemma 3.5(4), printed p.787, lines 860–861: the source says every Shintani eigenfunction is proportional to its dagger; it should assert dagger stability and restrict proportionality to one-dimensional eigenspaces; affects a stated result.
- **Misprint** in YANG97 at (2.28), printed p.47, line 847: the source says the intertwining factor has exponent one third; it should have exponent one half; affects the proof; corrected in print at FINIS06, printed p.779, footnote 4, line 554.
- **Misprint** in JIA24 at the rational-principal law before (2.1), preprint p.4, line 155: the source says the principal value contains n inverse; it should contain n for ideal infinity type (1,0); affects a stated result.
- **Misprint** in JIA24 at (2.43), preprint p.10, line 486: the source says the tail is bounded using a positive exponential; it should use the negative exponential cutoff; affects the proof.
- **Misprint** in JIA24 at §4, condition (1), preprint p.18, line 875: the source says the congruence modulus is ℤ_p; it should be qℤ_p; affects a stated result.
- **Misprint** in JIA24 at (4.9), preprint p.20, line 936: the source says the box bound is q inverse; it should be q to the power c; affects the proof.

Source independence: 37 passage comparisons across 11 readable sources; no copied exposition or reused source arrangement identified. Largest share FINIS06, 40 of 120 locator occurrences; its contents were readable and the repaired arrangement is independent. KATO99 and BOXALL92 remain settled unread primary texts; Yang's coefficient OCR limitation is recorded above.

## For the human reviewers

- KATO99 is settled uncertified and BOXALL92 settled waived in packages/NonordinaryCMSpecialValues/sources.toml. Their primary wording was not compared; no renewed access request is made.
- YANG97 line 698 has damaged coefficient OCR. The theorem and hypotheses are identifiable, but the exact primary scalar remains unverified against a clean image.
- JIA24 is read as arXiv v1; packages/NonordinaryCMSpecialValues/sources.toml explicitly says the published 2026 version was not read. The source errata above refer only to that preprint.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2d195d5f650205c8a889419c9ed7b4ab2aff484c", "job": "RT-NonordinaryCMSpecialValues~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
