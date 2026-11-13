<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13156#issuecomment-6862760396 -->
Review (codex) of a6ab0f9

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) State the trace-character tower law with the correctly directed map

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:502`: “for `m ∣ m′` its composition with the inclusion `𝔽_{p^m} → 𝔽_{p^{m′}}` relates to `traceChar p m′` through the transitivity of the trace”.

   **Claim:** The API promises compatibility of the trace characters in a finite-field tower. As written, the character just named has domain the smaller field, so it cannot be precomposed with the displayed inclusion into the larger field. “Relates to” also leaves the intended equality unspecified. This is an API precision defect, not a claim that the Lean definition or a headline theorem is false.

   **Witness:** For `𝔽₄/𝔽₂`, `Tr(1)=1+1²=0`, so `ψ₂(ι(1))=1`, whereas `ψ₁(1)=−1`. `Algebra.trace_trace` composes with the relative trace in the opposite direction (`Mathlib/RingTheory/Trace/Defs.lean:137`).

   **Exact repair:** Retain the nontriviality assertion and replace the tower clause by the following prose:

   For positive `m,m′` with `m ∣ m′`, choose an `𝔽_p`-algebra embedding `ι : 𝔽_{p^m} → 𝔽_{p^{m′}}`, and write `ψ_m` for the trace character and `Tr_ι : 𝔽_{p^{m′}} → 𝔽_{p^m}` for the relative field trace. Then `ψ_{m′} = ψ_m ∘ Tr_ι`. Consequently `ψ_{m′}(ι(x)) = ψ_m(x)^{m′/m}` for every `x ∈ 𝔽_{p^m}`. These follow from Mathlib `Algebra.trace_trace` and `Algebra.trace_algebraMap`.

   Add those two imported declarations to the Mathlib contract and this subsection's Needs. Add the negative-control Check: over `𝔽₄/𝔽₂`, restriction of the larger trace character is trivial, while the smaller trace character is nontrivial; at `1` the restriction formula gives `1 = (−1)²`. Thus compatibility is through relative trace, not unchanged restriction. No additional Lean theorem is wanted.

   **Repair test:** The identity tower has degree `1` and gives `ψ_m(x)=ψ_m(x)`. For `𝔽₄/𝔽₂` the two proposed equalities give `1=ψ₁(0)=1` and `1=(−1)²`. For `𝔽₉/𝔽₃` at `1`, they give `ζ₃²=ψ₁(2)` and `ζ₃²=ψ₁(1)²`. The two pinned trace lemmas have finite-free/scalar-tower hypotheses, all satisfied by these finite extensions. The existing Lean docstring's compatibility claim is valid with this precise interpretation.

One P3 finding; no P1 or P2 findings. The two preceding findings are repaired. The four Lean headline statements elaborate, with only their four `sorry` warnings. The remaining repair is an exact, correctly typed trace-character API statement; it requires no change to the mathematical scope or Lean definitions.

## Verified sound

### Previous findings and repair regression checks

Read the preceding review and repair report first. Neither preceding finding was marked not actionable. The following quotes are from the repaired package, not from the repair report.

| Preceding finding | Repaired passage and location | Verification and status |
|---|---|---|
| F01: summary confused middle factors with motive Euler factors | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:8`: “except at the odd primes with `p² ≤ k` for odd `k` and at the odd primes `p ≤ k/2` and at `2` for even `k`” | **Repaired.** For `k=6,p=3`, `M=1` but inverse Euler polynomial `1+27T`. For `k=9,p=3`, `M=1+54T+59049T²`, and the inverse Euler polynomial is `M(1−243T)`. Both distinctions appear in Layer 8 and the revised summary. |
| F02: exact quotient weight preceded its monodromy input | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1061`: “with weights `≥ nk + 1`”; `:1460`: “pure of weight `2k + 1`” | **Repaired.** §3.6 keeps only the general bound. New §5.7 proves the exact rank-two weight after §5.4, with the primitive-part input of MixedHodgeModulesAndIrregularHodgeTheory §9.6. At `k=1,2,3`, module weights are `3,5,7` and Fourier weights `4,6,8`. |
| F02: dependent use and renumbered supplier | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1626`: “§§3.6, 4.1, 5.4–5.5, 5.7”; §5.7 Needs at `:1486` names supplier §9.6 | **Repaired.** The order is §3.6 → §5.4 → §5.7 → §6.4. The current supplier has §9.6 at `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md:1018`; it keeps every primitive part. There is no reverse edge. |

The exceptional-prime thresholds were checked separately: for odd `p,k`, the smallest odd `a` with odd `v_p(a)` is `p`, so `Θ⁺_p` is nonempty exactly when `p²≤k`; `Θ⁺₂` is empty. For even `k` and odd `p`, the correction multiplicity is positive exactly when `⌊k/(2p)⌋≥1`, equivalently `p≤k/2`. The exact finite-field calculations below verify both new summary examples. The current MHM head, rather than the older board copy used in the preceding review, was used to resolve the changed citations.

Searched the rest of the package for both repaired patterns. No further all-prime equality of middle and Euler factors, or premature exact weight for the constant quotient, was found. Older computed witnesses were also retained only where applicable: degree-weighted irregularity at a non-rational puncture; localization of regular input rather than its irregular Fourier transform; exponential versus ambient weights; open versus proper resolution; and the zero term of an L-series.

### Coverage, principles and shape

Read all **59 numbered targets**, their statements, API bullets and Checks, **59 Needs lines**, **12 layer dependency paragraphs**, conventions, contracts and all **21 Lean declarations**. Untouched material summarized without numerical evidence in the previous review was read afresh; its earlier computed rows were used only for the instances they actually recorded. The report table below covers every seeded target, all headlines, the new target and the finding, with additional regression cases.

All 59 targets have at least three Checks; the actual count ranges from three to eight. Definitions retain prose APIs. Every layer has Examples and Dependencies. Shape was compared with `TauCetiRoadmap/TensorProductCombinatorics/README.md:1` and `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md:1` on main. Apart from R01, the promised interfaces have mathematical domains and hypotheses. The README has the prescribed summary, scope, conventions, exact contracts, build explanation, downstream consumers and references. Metadata is `math.NT`.

No good-prime restriction, forbidden supplier, algorithmic target, sorry'd data, free placeholder predicate, `set_option`, Lean `lemma`, admitted example, process date, PR number, HTML anchor, machine path or LaTeX delimiter was found in the package's mathematical text. Characteristic two, inseparable factors, arbitrary characteristic-zero rank, higher-thickness odd-prime points and the existential even factor at two remain within scope. Rank zero is separated from positive-rank automorphy. The finite-field and characteristic-zero branches are distinct until the hypersurface comparison. No existing roadmap on main with this name was found; this is not a second copy or a re-plan.

### Seeded source verification

Read all **15 seeded targets** against their locators in the legal cached texts. The versioned references are FSY arXiv:1810.06454v5, XZ arXiv:1910.13391v2 and Serre-orthogonal arXiv:1708.00046v3. The four cited works each have one manifest key. The manifest's Saito entry is settled `uncertified`; there were no other author-flagged unreadable or unverified locators. No source fetch or manifest edit was necessary.

| Seeded target | Locator and source lines read | Result, hypotheses and conventions |
|---|---|---|
| §1.4 Cohomology of the moments | FSY (1.5), p.5, FSY line 196; §3.2.1, pp.23–24, FSY lines 989–1009 | Rank two and positive symmetric exponent give the determinant of compact H¹. In odd rank at characteristic two the full-degree complex is retained; the source warns of invariant vectors. |
| §2.2 The cyclic cover | FSY §2.1, p.10, FSY lines 429–440; (3.9), p.21, FSY lines 893–904 | `z=t^r`, `x=ty`, inverse scalar action on `y`; characteristic zero and rank `r≥2`. The group-scheme action does not require rational roots of unity. |
| §2.4 Symmetric powers | FSY Proposition 2.7 and preceding construction, p.12, FSY lines 506–533 | Characteristic-zero symmetric connection on the native tensor quotient, rank `binomial(r+k−1,k)`, descent and invariant comparison. No integral averaging is asserted. |
| §3.1 Tensor potentials | FSY (2.8)–(2.9), p.13, FSY lines 536–564; (3.9), p.21 | The `nk` variables and shared base parameter give `f_{r,k}`; after the cover the potential is `t g_{r,k}`. |
| §3.6 Inverse Fourier objects | FSY (2.17)–(2.23), Proposition 2.21 and Lemma 2.24, pp.16–18, FSY lines 678–767; Remark A.6, p.64, lines 2912–2942; Corollary A.31, p.72, lines 3256–3270 | Constant quotient and lower bound supported. The exponential fibre has the input weight; Fourier cohomology uses primitive parts with twist `(−1)`. Exact rank-two quotient weight is now later. |
| §4.1 Classicality | FSY Theorem 3.2 and proof, pp.19–21, FSY lines 805–886 | Ordinary, compact and middle cohomology; rational classical Hodge structures; lowest-weight image and parity of the pairing. The rank/dimension comparison uses the stated stationary-phase contract. |
| §4.3 Hypersurface realization | FSY Theorem 3.8, pp.21–23, FSY lines 891–947; Example A.27, pp.70–71, lines 3208–3225 | `nk≥2` retained. Compact cohomology and cohomology with supports work for a singular hypersurface; the ordinary-cohomology formula requires smoothness. Degree `nk−1` and twist `(−1)` agree. |
| §5.2 Formal decomposition | FSY Proposition 4.6 and Lemma 4.7, pp.27–28, FSY lines 1141–1188 | Exponential factors `2(k−2j)t`, the regular factor and ramified descent, including even `k`. |
| §5.6 Explicit bases | FSY Proposition 4.14, Lemmas 4.15 and 4.17, pp.30–32, FSY lines 1287–1375 | Odd determinant and even leading-operator kernel are distinct; ordinary and cover basis ranges agree. |
| §6.5 Filtration on bases | FSY Proposition 4.21, p.34, FSY lines 1456–1471; proof pp.35–38, lines 1510–1647 | Odd full range, even restricted range, degree-two pullback and subsequent strict-invariant argument. No division by a vanishing coefficient. |
| §7.4 Galois realizations | FSY (5.5), p.40, FSY lines 1732–1739; (5.9), pp.42–43, lines 1840–1869; (5.19)–(5.20), p.46, lines 1983–2051 | Compact-support weight piece, finite-group projector, boundary kernel and Tate twist; open resolution is distinguished from proper closure. |
| §8.4 Even local structure | FSY Theorem 5.17 and proof, pp.45–48, FSY lines 1983–1994 and 2030–2056; local factors pp.48–49, lines 2153–2192 | Odd residue prime, nonzero monodromy, quotient description of `U`, and the extra quotient when `4∣k`. It is not asserted to split. |
| §10.1 Odd determinants | FSY proof of Corollary 5.30, pp.52–53, FSY lines 2363–2398 | Quadratic determinant character, exponent `(1−k²)/4`, real/imaginary sign and the middle Hodge line's sign. |
| §11.2 Semisimplification | FSY Lemma 5.40, p.58, FSY lines 2629–2653; Remark 5.41, p.59, lines 2660–2679 | The graded WD object must be pure. Both `N` and inertia are retained. The coefficient-prime comparison is separately supplied; the source's full-period determinant shortcut is not repeated. |
| §11.5 Even functional equation | FSY Theorem 1.3, p.4, FSY lines 142–159; proof pp.57–58, lines 2604–2657 | Meromorphic continuation, rational polynomial factor at two, nonnegative conductor exponent and sign, without claiming explicit values. Positive even `k` retained. |

### Adversarial computations

Small finite fields were independently evaluated using polynomial arithmetic, the field trace, exact character counts, the symmetric-trace recurrence and `n c_n = Σ_{j=1}^n m_j c_{n−j}`. The `p=3` character contributions were combined exactly using `1+ζ₃+ζ₃²=0`. Geometric entries compute dimensions, weights, signs, local equations or filtration indices. Such examples test the statements and conventions; they do not replace the general proofs.

| Statement | Instances | Computed values on both sides / excluded model | Result; change |
|---|---|---|---|
| §0.1 symmetric trace | `t=3,d=2,k=2`; repeated roots | `h₂=9−2=7=4+2+1`, unlike `t²=9`; `h₃(2,1)=4=4·1³`. In the zero ring both sides are zero. | Sound; none. |
| §0.2 trace sign and domain | `F₂,a=1`; `F₃,a=1,2`; zero parameter | Raw sums `1`; `−1,2`. Frobenius traces `−1`; `1,−2`, first moments `−1`. At `a=0` over F₂, eliminated sum `−1`, product-fibre sum `0`. | Correct unit-domain comparison. |
| §0.2 tower API, R01 | `F₄/F₂`; `F₉/F₃`; identity | At `1`, restriction values `1`, `ζ₃²`, `ψ_m(1)`; smaller character values `−1`, `ζ₃`, `ψ_m(1)`. Relative-trace values are `ψ₁(0)=1`, `ψ₁(2)=ζ₃²`, `ψ_m(1)`. | State the trace law and restriction power; R01. |
| §0.2 nontriviality | trivial character on F₅ | Four terms each `1` give raw sum `4`; first moment `4·(−4)=−16`, versus `−1` for nontrivial character. | Nontrivial-character hypothesis necessary. |
| §§0.3,8.2 polynomial headline | `p=2,k=3` | Moments `3,−17,63,−257`; coefficients `1,3,−4,0,0`; `(1−T)(1+4T)`; degree `2=(3+1)/2`. | Sound; none. |
| Same headline, even | `p=2,k=12` | Moments `−1,−8193,−1,−33554433`; coefficients `1,−1,−4096,4096,0`; degree `3=⌊14/4⌋`. | Sound; none. |
| Positive-exponent hypothesis | `p=2,k=0` | Moments `1,3,7,15`; coefficients `1,1,2,4,8`; `(1−T)/(1−2T)` is not a polynomial. | Excluded by both Lean polynomial headlines. |
| §1.4 cohomological sign and weights | `p=2,k=3` | `m₁=3`, so trace on compact H¹ is `−3=1+(−4)`; determinant `1+3T−4T²`; weights `0,4`. | Sound; none. |
| §§1.3,2.5 monodromy boundary | rank 2; rank 3 in characteristic 2 | `Sp₂=SL₂`, standard dimension `2`; `SO₃` has an invariant quadratic in Sym², dimension `1`, whereas the defining representation has dimension `3`. | No false universal H¹ concentration. |
| §2.2 cover convention | `r=3` | `ty` has deck multiplier `ζζ⁻¹=1`, not `ζ²`; `dz/z=3dt/t`. | Sound; none. |
| §2.3 curve index | degree-two puncture on `P¹_Q`, rank one, irregularity one there | `χ=2−2=0`; weighted term `2`, index `−2`; after splitting, `−1−1=−2`. Unweighted alternative gives `−1`. | Degree retained. |
| §2.4 symmetric connection | ranks 2 and 3, `k=2` | Ranks `3=binomial(3,2)`, `6=binomial(4,2)`, versus tensor ranks `4,9`; rank-two derivative coefficients `2,1,2`. | Native quotient plus connection, not tensor power. |
| §2.6 Bessel sign | `r=3,λ=1`; Dwork arrow | Cyclic solution starts `1+x+…`; horizontal column solution `1−x+…`. Horizontality requires `dlog h=π(pt^{p−1}−1)dt`, opposite to the printed XZ multiplier. | Dictionary distinguishes both signs. |
| §3.1 tensor potential | `(r,k,t,y)=(3,2,2,1)` | `z=8,x=2`; each summand `2+2+8/4=6`; tensor potential `12`; `t g=2·6=12`. | Sound; none. |
| §§3.2–3.3 projector and Koszul sign | `(r,k)=(2,2),(3,2)`; `S₃` | Swap characters `−1,+1`; relative degrees `2,4`, total degrees `3,5`. In the S₃ sign projector every coefficient in `e²` is `6/36=1/6` with the character sign, matching `e`. | Nonabelian averaging and shift correct. |
| §3.6 exponential fibre versus Fourier cohomology | `r=2,k=2,3` | Fibre dimension/weight `(3,2),(4,3)`; Fourier dimension/weight `(1,4),(3,4)`. Primitive formula gives `2+1+1=4`, `3+1+0=4`. | Earlier repair persists. |
| §3.6 exact sequence | `k=1,2,3`; excluded `k=0` | Fourier dimensions `1+1=2`, `1+1=2`, `3+1=4`; at zero `H⁰(FTδ₀)=C` has dimension `1`, not `0`. | Positive exponent excludes punctual counterexample. |
| §4.1 classical middle image | cover `k=2,3,4` | Fourier dimensions `1,3,3` minus higher primitive dimensions `1,0,1` yield `0,3,2`, matching `k−2,k,k−2`. | Sound under declared stationary phase. |
| §4.3 hypersurface realization | `r=2,k=3`; excluded `k=1` | Degree/weight `2,2`, then twist gives weight `4`, rank `1`, type `(2,2)`. At `k=1` invariant H⁰ of two points has rank `1` but middle Kl₂ rank is `0`, so `nk≥2` matters. | Hypothesis retained; M₁ separately zero. |
| §§4.2–4.5 singular and inseparable tests | `r=2,k=2`; `r=p=2` | Numerator `(y₁+y₂)(1+y₁y₂)` is singular at `(1,−1)`; at `p=2` the degree-two map has separable degree `1`, not `2`. | Supports and universal-homeomorphism branches retained. |
| §5.2 formal decomposition | `k=2,3,4` | Exponents for k2: `−4,0,4`; k3: `−6,−2,2,6`. Irregularities (before cover, after cover) are `(1,2)`, `(2,4)`; descended regular monodromy k2 `−1`, k4 `+1`. | Sound; none. |
| §§5.3–5.5 local blocks/dimensions | `k=1,2,3,4,5,6,8` | Infinity block lengths of `M`: `1,2,3,4`; of `ΠM`: `2,3,4,5`. Middle dimensions respectively `0,0,1,0,2,2,2`. | Sound; none. |
| §5.6 bases | `k=1,3`; even leading operator k2 | Odd determinants `−z,9z²`; leading operator on `u₂−zu₀` gives `2zu₁−2zu₁=0`. The full connection additionally differentiates `z`, so this is not a horizontal section. | Correct leading/full distinction. |
| New §5.7 exact quotient weight | `k=1,2,3` | `P_{k−1}` weights `0,2,4`; after `(−1)`, variation weights `2,4,6`; module weights `3,5,7`; Fourier types `(2,2),(3,3),(4,4)`. | F02 repaired; inputs precede use. |
| §6.1 fan/projectivity | `k=1,2,3` | Rays `2,8,26=3^k−1`; maximal cones `2,8,48=2^k k!`; k1 section count `3`, giving the conic map. | Conditional projective-embedding contract is precise. |
| §§6.2–6.3 blow-ups/Newton weights | `Q/u` near quadratic point; `x,z/x` | First exceptional order `2−1=1`, second `0`; Newton degrees `1`, `2−1=1`; `deg z=2`, `deg t=1`. Even k2 has critical point `(1,−1,1)`, odd k1 none. | Odd/even hypotheses distinguish the models. |
| §6.5 filtration on bases | `k=3,j=0,1` | `dim F⁴=1`, `dim F²=2`, `dim F⁵=0`; pullback `2t^{2j}dt/t`, not `t^jdt/t`. | Sound; none. |
| Hodge headline §§6.4,6.6 | `k=2,3,5,6,8` | Cover k2 types `(2,2),(3,3)`; descended middle k3 `(2,2)`; k5 `(2,4),(4,2)`; k6 `(2,5),(5,2)`; k8 `(2,7),(7,2)`. Dimensions `1,2,2,2` match d. | No spurious central even Hodge pair. |
| §7.1 boundary geometry | nodal cubic; square-zero base | Nodal H¹ has dimension `1`, weight `0`, not pure weight `1`. In `A[x,y]/(xy)` over `A=F_p[ε]/ε²`, ε survives while the geometric fibre is reduced. | Singular-fibre localization and geometric reducedness kept distinct. |
| §7.2 thickness | `k=9,p=3,a=1,3` | Local constants `6,18`, valuations `1,2`; uniformizer exponents over `Q₃(√−3)` are `2,4`. | Higher-thickness contract needed and present. |
| §§7.3–7.4 realization | `k=4`; `k=6,p=3` | Open `dim gr²H³_c=1`; smooth proper `dim gr²H³=0`; positive orbit `b=2` remains after resolving the horizontal `b=0` orbit. | Open/proper repair persists. |
| Root-weight headline §8.1 | `p=2,k=3,5,8` | Middle polynomials `1+4T`, `1−4T+64T²` have root norms `1/4,1/8`; k8 `Z=(1−T)(1−16T)`, remaining norm `1/16`. | Both permitted weight branches exercised. |
| §8.1 pairing involution | `p=2,k=3` | Eigenvalue `−4`; `2⁴/(−4)=−4`, whereas half exponent gives `−1`. | Source slip corrected. |
| Revised summary / even factor §8.6 | `k=6,p=3` | Moments `26,−730,19682`; coefficients `1,26,−27,0`; `M=1`, inverse Euler polynomial `1+27T`. | F01 repaired. |
| Revised summary / odd factor §8.5 | `k=9,p=3` | Moments `53,115181,−9408475`; Z coefficients `1,53,58995,−59049`; `M=1+54T+59049T²`; extra factor `1−243T`; `Θ⁺={3}`, `Θ⁻={1}`. | F01 repaired; correction has weight 10. |
| §8.4 even monodromy | `k=6,p=3`; `k=2` | `(dim V,dim U,dim V^I,rank N)=(2,1,1,1)` and `N²=0`; at k2 all dimensions `0`. | Quotient description and zero case sound. |
| §§8.5–8.6 conductors | odd `k=1,3,5,7,9`; even k6,8 | Odd conductors `1,3,15,105,105`; the erroneous radical-product value at k9 is `315`. Even odd-parts `3,3`. | Valuation parity retained. |
| §§9.1–9.2 comparison/polarization | `k=3,5,6` | Hodge jumps `{2}`, `{2,4}`, `{2,5}`; supplier HT signs are their negatives. Pairing parity `+,+,−`; multipliers at conjugation `+,+,−`. | Regular and polarized; no convention mismatch. |
| §10.1 determinant | `k=1,3,5,7` | Quadratic radicands `1,−3,−15,105`; cyclotomic exponents `0,−2,−6,−12`; k7 `det(c)=1=(−1)·ε`, hence middle sign ε=`−1`. | Rank zero and parity agree. |
| §10.2 gamma normalization | d0,1,2; d1,s3 | Standard/paper ratios `1,√π,π^(3/2)`; at d1,s3 factors `π⁻¹`, `π^(−3/2)`. | Nonzero normalization constant retained. |
| §10.3 local epsilon conventions | k3 infinity; k6,p3 | Infinity factor `i`; normalized quadratic Gauss contribution `(i√3)/(i√3)=1`; even local multiplicities `u=1,v=0` give positive local sign. | Signs consistent with geometric Frobenius. |
| §10.4 Euler adapter | every local series 1; `s=0` | Raw coefficient at n0 is `1`, raw sum `2`; LSeries.term at n0 is `0`, L-series and Euler product both `1`. For normalized `1+T−T²`, evaluation at 1 gives `1` but prime coefficients `1` are not summable. | Normalization and absolute summability are necessary and present. |
| §11.1 potential automorphy headline | k1,3,5,6 | Ranks `0,1,2,2`; positive rank Hodge multisets above have no repetitions; zero system gives empty isobaric sum. | No spurious cuspidality assertion for a sum. |
| §11.2 purity hypothesis and local factor | `F=diag(a,pa)`, `N(e₂)=e₁`, a=`−27`, p3 | `FNF⁻¹=N/3`; ker-N polynomial `1+27T`, full polynomial `(1+27T)(1+81T)`. Discarding N changes the factor; its two-character graded is not pure of one weight. | The actual pure-graded hypothesis excludes this countermodel. |
| §11.2 coefficient-prime valuation corollary | p2,k3,5 | Coefficient valuations `0,0,2` and `0,0,2,6`; match `n(n−1)` on all displayed nonzero coefficients. | Full coefficient-prime supplier used. |
| §11.4 odd functional-equation headline | k1; k3 | k1 `d=0,N=1,Λ=1`, reflection gives `1=1`; k3 weight4, reflection `5−s`, centre `5/2`; convergence boundary `(3+3)/2=3`. | No wrong reflection or zero-rank obstruction. |
| §11.5 even functional-equation headline | k2,4; k6 | k2,4 choose `r=0,P=1,ε=1,Λ=1`; k6 weight7, reflection `8−s`, centre4, convergence boundary `9/2`. | Existential dyadic data, not an asserted conjectural formula. |

### Library and declaration audit

Opened the following declarations at the pins, not at online Mathlib head. The short native formulas quoted here identify precisely the carriers and conventions used.

| Pinned file and line | Declaration and checked content |
|---|---|
| `Mathlib/Algebra/Group/AddChar.lean:72`, `:242`, `:354` | `AddChar`, `compAddMonoidHom`, `sum_eq_ite`: additive-to-multiplicative law, composition and orthogonality; trivial character is constant one. |
| `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83` | `ZMod.stdAddChar`, with exponent `2πij/N`. |
| `Mathlib/FieldTheory/Finite/GaloisField.lean:68`, `:117` | `GaloisField` is a splitting field; `card` requires nonzero extension degree. Series use positive degrees; degree zero is explicitly excluded from cardinality arguments. |
| `Mathlib/RingTheory/Trace/Defs.lean:70`, `:110`, `:137` | `trace` is trace of left multiplication; trace of an included scalar is degree times the scalar; transitivity composes relative traces. R01 gives the correct application. |
| `Mathlib/FieldTheory/Finite/Trace.lean:37`, `:49` | `trace_to_zmod_nondegenerate`; `algebraMap_trace_eq_sum_pow`: finite fields and their actual algebra structures. |
| `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53` | `SymmetricPower` is the quotient by permutation relations, with no connection attached. |
| `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312`; `Mathlib/RingTheory/Polynomial/Chebyshev.lean:263` | `hsymm` sums degree-n monomials; `U` has recurrence `2X·U_(n+1)−U_n`. Neither supplies the moment theorems. |
| `Mathlib/RingTheory/PowerSeries/Exp.lean:50`; `Mathlib/RingTheory/PowerSeries/Substitution.lean:158`; `Mathlib/Algebra/Polynomial/Roots.lean:56` | Exponential coefficients `1/n!`, actual substitution, roots with multiplicities. The series substituted here has constant term zero; the theorem's factor has constant term one, excluding the zero-polynomial empty-root loophole. |
| `Mathlib/NumberTheory/LSeries/Basic.lean:74`, `:164`, `:178` | `term f s 0=0`; `LSeries=∑' n,term f s n`; summability is of these terms. |
| `Mathlib/NumberTheory/EulerProduct/Basic.lean:225` | `eulerProduct_tprod` requires norm summability, zero value at zero, unit at one and coprime multiplicativity. The README applies it to the terms. |
| `Mathlib/Analysis/Normed/Module/FiniteDimension.lean:605`; `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:202` | `summable_norm_iff` requires finite dimension over R; `Complex.natCast_mul_natCast_cpow` has the correct positive-natural-base convention. |
| `Mathlib/Analysis/Meromorphic/NormalForm.lean:632`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:287`; `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:46` | `MeromorphicNFOn`, Gamma and standard `Gammaℝ`. Normal form permits the reflection equality at poles as a pointwise statement. |
| `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109`; `Mathlib/Data/Nat/PadicValNat.lean:21` | Legendre argument order and total valuation defaults; the theta sets require odd positive a, so zero's default is unused. |
| `Mathlib/NumberTheory/GaussSum.lean:72`; `Mathlib/NumberTheory/JacobiSum/Basic.lean:48` | Gauss sums have one multiplicative and one additive character; Jacobi sums two multiplicative characters. Neither defines these moments. |
| `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:291`; `Mathlib/Analysis/Meromorphic/Complex.lean:22` | Primitive Dirichlet functional equation and Gamma meromorphy are insufficient for either whole moment-family functional equation. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` | Native mixed Hodge structure includes integral/rational/complex models and finite exhaustive filtrations. It does not itself impose finite-dimensional graded polarizability; the README adds those conditions. |
| `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, `:131`; `TauCeti/Geometry/Hodge/Tate/Basic.lean:93` | Strict image identities for F and WQ; `tate m` has weight `−2m`. |

Object searches of both pinned libraries found no Kloosterman moment, Nori motive, exponential mixed Hodge, irregular Hodge or differential-Galois carrier supplying an omitted headline. The native symmetric module, representation symmetric power and Hodge carriers are not mistaken for connections or their cohomology. Reviewed the near-match leads by their objects: ordinary gamma/Dirichlet/Euler-product results and polynomial identities have different conclusions. No retained headline is a single native lemma under a renamed notation.

### Supplier resolution, overlaps and supply direction

Read the board package index before searching for missing owners. Used `roadmaps show` and object searches with `roadmaps grep` at the available heads. All consumed roadmap citations were resolved afresh. The following records the supplying file and representative line, together with the consumed range. CLI display headers are excluded from line numbers.

| Supplier / available head | File and sections resolved | Contract check |
|---|---|---|
| CongruenceSpectralGap #1504 | `TauCetiRoadmap/CongruenceSpectralGap/README.md:647`, §§4.2a–4.2b | Unit-parameter raw sums; all-characteristic sheaf, trace sign, purity, curve index. |
| PadicDifferentialEquationsAndRigidCohomology #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12803`, §§RD.6.52a–6.53, 6.94–6.98, 7.20–7.22 including 7.21a | Formal index has residue degrees; moment comparisons retain geometric and filtered premises. Its broader all-prime construction is consumed at odd primes in rank two. |
| ComplexComparisonPartII #848 | `TauCetiRoadmap/ComplexComparisonPartII/README.md:2982`, C5.1, C5.6–C5.7 | Ordinary operators and regular/logarithmic de Rham interfaces. |
| FormalConnectionsOpers #1056 | `TauCetiRoadmap/FormalConnectionsOpers/README.md:707`, F2.2 | Symbols and filtered PBW, on the existing operator sheaf. |
| SpringerResolutionAndCharacteristicCycles #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:832`, §§8.1–8.4, 9.1–9.7 | Coherence, holonomicity, finite length, transfer shifts, duality and intermediate extension over characteristic-zero fields. |
| MixedHodgeModulesAndIrregularHodgeTheory #2279 | `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md:273`, §§2.1–2.5, 4.3, 4.6, 5.1–5.4, 6.1–6.7, 7.1, 7.5–7.7, 8.1–8.5, 8.7–8.8, 9.1–9.6, 10.1–10.8 | Current numbering, Fourier sign, strict bifiltration, classicality, zero-locus comparison, primitive weights and Newton/logarithmic inputs. §9.6 is at line1018. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:248`, F.0.4, F.2.1–F.2.7, F.4.5, F.5–F.7, F.10.1–F.10.2b | Supports, topological invariance, rational realization, purity and blow-ups; geometric Frobenius multiplies Q_l(1) by q⁻¹. |
| InverseGaloisAndArithmeticFundamentalGroups #850 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:566`, IG.0.T3 | Rational constructible trace formula for every finite extension. |
| EtaleDualityAndPerverseSheaves #1040 | `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:1659`, §§2.3, 2.8, 3.3 | Intermediate extension and rational coefficient extension. |
| DeligneWeightsAndPurity #929 | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:808`, §§0.16, 0.18, 7.12, 7.15, 8.14, 8.19, 8.24 | Pairing multiplier, exact weights, middle-image purity; spectral sequence restricted to smooth proper compactification. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4707`, §2.11; §§4.11, 4.13, 4.17 and Layer0 | Artin–Schreier, modifications, strict transforms, regularity, SNC and scheme constructions. |
| ShimuraCompactifications #1053 | `TauCetiRoadmap/ShimuraCompactifications/README.md:750`, §§0.16–0.18 | Toric schemes over arbitrary rings, support criterion and geometrically reduced flat boundary. |
| AnalyticToricGeometryPartII #1647 | `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:166`, §§0.3, 0.5 | Sections and line bundles; projective embedding is still the declared extra contract. |
| LefschetzPencilsAndVanishingCycles #873 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1491`, §§2.1–2.8, Layer2 examples, §6.6 | Quadratic forms, discriminants, ordinary degenerations and the separate nonordinary characteristic-two concentration theorem. |
| MotivesAndAlgebraicCycles #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:435`, §2.7, §§5.3–5.9 | Nori pairs, tensor structure, projectors, realizations; the two missing enhancements are declared. |
| ArithmeticGaloisRepresentations #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1170`, §§1.7, 2.5–2.7, 3.3, 5.3, 7.4 | Semisimplification, purity from pure graded, local constants, conductors and polarization. |
| CohomologyComparisons #1064 | `TauCetiRoadmap/CohomologyComparisons/README.md:434`, §§2.13, 3.4–3.5, 4.3–4.4 | Filtered de Rham, proper smooth crystalline and proper semistable comparisons, including agreement of actual maps. |
| PadicHodgeTheory #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:665`, §§3.2, 5.1–5.3 | HT sign adapter, supplied potential semistability, weak admissibility and exact potentially semistable WD realization. |
| PotentialModularityAndCompatibleSystems #1075 | `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:95`, §§1.1, 1.5–1.6, 1.15 | Weak systems, polarization, regularity, purity and archimedean recipe; away-coefficient strictness is not promoted without another input. |
| ModularityAndLanglandsExtensions #1180 | `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1470`, §§2.42–2.43, 2.49 | Simultaneous potential automorphy, density-one irreducibility discharging the universal premise, strict purity and functional equations. |
| AutomorphicGaloisRepresentationsPartII #1006 | `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1818`, AG2.5–AG2.6, especially line3226 | Full away-prime compatibility and totally real polarized coefficient-prime descent. The extreme-regular irreducibility premise is supplied explicitly, rather than assumed for these Hodge sets. |

The automatic citation resolver reported no unresolved roadmap citations or Lean names. Its native-library lookup was unavailable on that invocation, so its success was not used as evidence for native declarations; those were opened separately as above. The overlap data show no dropped cited id, only-open-revision id, conflicting head, or lost target requiring an old-to-new map. Main and the board index were also searched; no second copy was found.

The five closest scopes were read. MHM #2279 explicitly assigns the Kloosterman connections, particular polytopes, bases and Jordan blocks to this roadmap (`TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md:38`). KloostermanSheavesAndBesselIsocrystals #2289 consumes its normalized scalar objects and sign dictionary (`TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:79`, `:240`); its reductive-group Bessel construction and companions are different objects. PadicDifferentialEquationsAndRigidCohomology #1002 owns rigid Kloosterman objects (`TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:128`), while this package discharges its geometric moment hypotheses. LefschetzPencilsAndVanishingCycles #873 owns generic degeneration machinery. PotentialAutomorphyDworkMotivesPartII #2291 owns the Dwork pencil and its switching/hypergeometric motives (`TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md:7`), not the Kloosterman moment motive.

Further object searches distinguished the all-rank raw sum of CongruenceSpectralGap from the twisted finite-ring sums of CharacterSumsOverFiniteFields #1712 (`TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:49`, `:1528`) and integer-modulus/metaplectic variants. The elementary total rank-two sum retained in Suggested.lean is explicitly an adapter required to state the headlines; it is not another foundational construction. No duplicate fully qualified declaration or mutual ownership handoff was found.

Overlap check: read MixedHodgeModulesAndIrregularHodgeTheory, KloostermanSheavesAndBesselIsocrystals, PadicDifferentialEquationsAndRigidCohomology, LefschetzPencilsAndVanishingCycles, PotentialAutomorphyDworkMotivesPartII (the other two closest-roadmap lists are empty); generic exponential/Hodge machinery belongs to MHM, reductive-group Bessel objects to KloostermanSheavesAndBesselIsocrystals, rigid objects to PadicDifferentialEquationsAndRigidCohomology, quadratic vanishing cycles to LefschetzPencilsAndVanishingCycles, Dwork switching motives to PotentialAutomorphyDworkMotivesPartII, and the particular Kloosterman connections and moment calculations to this roadmap.

Ran the prescribed `gate --depcheck` with the specified name, order, movable and content arguments. Its complete output was:

```text
depcheck: 240 roadmaps, 2194 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The internal repaired order was checked separately; this mechanical result alone does not certify internal proof order.

### Declared supplier contracts

All six slugs occur in both `packages/KloostermanMomentsAndPotentialAutomorphy/design/plan.json` and the README exact supplier contracts, with named earlier suppliers. Their hypotheses and compatibility requirements specify one coherent missing result each. Searches of the pins and supplier heads did not find the requested strengthening already provided. They are contracts, not findings.

| Slug | README line | Missing strengthening and test |
|---|---|---|
| `higher-thickness-picard-lefschetz` | 254 | Every positive thickness, beyond RD.7.20's exponent two; k9,p3,a3 has exponent four. |
| `irregular-stationary-phase` | 303 | Slope-one exponential factors rather than the regular-input result; `E^{2t}` has slope one and is not regular at infinity. |
| `nori-weight-filtration` | 372 | Strict weights on Nori motives and projectors, beyond unfiltered realization; twist raises weight two to four. |
| `orthogonal-motive-root-number` | 377 | Root number for orthogonal projected boundary-kernel motives; realization alone supplies no root-number theorem. |
| `semisimplification-similitude-form` | 392 | Compatible nondegenerate form on semisimplification, beyond the representation's existence. Serre Theorem4.2.1 applies to the twisted involution as stated. |
| `toric-polytope-projective-embedding` | 351 | Closed immersion from polytope characters over arbitrary rings, beyond the supplied line bundle; interval `[-1,1]` gives three sections and the conic. |

### Headline coverage, signatures and padding

| README headline | Suggested.lean treatment |
|---|---|
| Integer polynomial, constant term and degree | `momentSeries_eq_intPolynomial`, line109 |
| Root weights, including even boundary weights | `momentSeries_weights`, line90 |
| Odd meromorphic continuation and functional equation | `oddMoment_functionalEquation`, line191 |
| Even continuation and functional equation with dyadic data | `evenMoment_functionalEquation`, line206 |
| Explicit Hodge numbers | Named in module docstring: missing connection cohomology and exponential/irregular Hodge carriers. |
| Sheaf monodromy and differential Galois groups | Named in module docstring: missing corresponding geometric sheaf/connection constructions. |
| Classicality, hypersurface comparison and Nori motive | Named in module docstring: missing exponential pair cohomology and Nori motives. |
| Bad-prime realizations, regular polarized systems and potential automorphy | Named in module docstring: missing actual geometric Galois realizations and automorphic representations. |

No statable summary headline is absent or replaced with a stand-in. The 17 definitions have actual elementary bodies on native carriers and support these four theorems. All 21 declared names occur in the README; mathematical notation is not presented as additional undeclared Lean names.

Ran `lake env lean` on the original `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean` from the pinned content checkout, using the required absolute command argument. **Exit 0; only four warnings**, all “declaration uses `sorry`”, at lines90,109,191,206. Only `import Mathlib` occurs, so no Tau Ceti object build was required.

A scratch copy appended `#check @name` for every one of the 21 declarations and elaborated successfully. Every elaborated type was compared with its README statement: prime instances, finite-field carriers, positive exponents, odd/even hypotheses, polynomial constant term and the quantifier order for the analytic continuation remain present. No section binder was lost. No input file was changed.

Every one of the four admitted theorems was tested with closing `simp`, `rfl` and `infer_instance` on a scratch copy, each guarded by `fail_if_success`. The simp probe was `solve | simp`, so mere progress did not count as closure. The copy elaborated with only the four sorry warnings: none closed. Exact-single-lemma alternatives were checked against the native near matches listed above, whose types concern different objects. None of the four is a boundary case, a computed Check or a restatement of a definition. **No padding finding.**

### Wording, arrangement and reuse

Compared each of the 15 sampled passages with the source at its locator, and seven additional passages: §0.1's recurrence API, §0.2's sum definition, §2.6's Bessel/Dwork dictionary, new §5.7's weight argument, §9.2's form on semisimplification, §10.2's gamma normalization and the odd-functional-equation Lean docstring. These additional comparisons used FSY lines60–131, 762–767, 1403–1411, 2336–2398, XZ lines480–495, and Serre-orthogonal lines364–421. No copied expressive sentence, clause-by-clause paraphrase, translated passage, copied table or figure was found. Shared formulas, names and necessary hypotheses were distinguished from source expression. The small examples are used as discriminating computations, not copied numerical tables.

Counted named source citations before References, excluding the one convention-only mention: **FSY 95, XZ 6, Serre-orthogonal 1, Saito-orthogonal 1**, repeated occurrences counted. FSY has the largest share. Its contents were opened at FSY lines14–51. The source's §§2–5 and appendix were compared with the twelve roadmap layers. The appendix's general machinery is supplied elsewhere; the source's finite-field branch is brought forward; source §4 is separated into formal/basis and Hodge work; source §5.1 is separated into integral geometry, local representations and comparison-hypothesis discharge. This is not a one-to-one chapter plan.

The mathematical dependencies force the common part of the order: §3.3 needs §2.4; §4.1 needs §3.6; §5.4 uses that inverse transform; §5.7 needs §5.4; §6.4 needs §5.7; §7.4 needs the hypersurface and boundary geometry; §8.3 needs §7.4; §9.2 assembles Layer8 and the comparisons; §10.4 uses the explicit Euler and gamma factors; §11.4 uses potential automorphy and local transport. The finite-field Layer1 and connection Layers2–3 remain independent until §4.5. No heading is named after a source chapter and no instruction says to follow its exposition.

Source independence: 22 passages compared with 3 readable sources, no expressive copying or source-table reuse found; largest share FSY, 95 of 103 named locator occurrences; contents compared with FSY: independent mathematical organization with the shared order forced by the listed dependencies. Saito's original text was not available and was not compared.

## Not verifiable

- **Saito-orthogonal, main theorem**, cited through FSY §5.3.3, p.58: the original article remains settled `uncertified`. FSY's invocation at lines2654–2657 was read; the original theorem's complete hypotheses were not independently certified. No new request is made.
- The six declared supplier additions are future proof obligations. Their declarations, ownership, precision and nonduplication were checked; this review does not certify their eventual implementations.

All 15 seeded passages were readable. The original Lean elaboration and scratch signature/padding probes completed; no Lean process was left running.

## Source issues

These concern the sources, not further package findings. The package corrects the mathematical slips it uses or declares the required strengthened supplier contract.

- **Misprint** in FSY at §3.2.1, printed p.23, FSY line 987: the source says the single-sheaf Fourier presentation uses a torus of dimension `nk`; it should use dimension `n` before the kth tensor power; affects the proof.
- **Misprint** in FSY at proof of Proposition 4.20, printed p.33, FSY line 1408: the source says the rank-k infinity block uses primitive `P_k`; it should use `P_{k−1}`, giving weights `0,2,…,2k−2`; affects the proof.
- **Misprint** in FSY at the paragraph following (5.4), printed p.40, FSY line 1731: the source says reciprocal eigenvalues pair using the half-weight exponent; it should use `α↦p^{k+1}/α`; affects a stated result.
- **Misprint** in FSY at §5.1.2, printed p.41, FSY line 1761: the source says the derivative is nonzero on the whole boundary divisor; it should assert nonvanishing on its intersection with the hypersurface, where the derivative is `−1/z₁`; affects the proof.
- **Error** in FSY at proof of Proposition 5.23, printed p.50, FSY lines 2249–2256: the source says every quadratic point has unit thickness after the quadratic base change; it should allow exponent `2e`, since `k=9,p=3,a=3` gives `e=2`; affects the proof.
- **Error** in FSY at Corollary 5.30, printed p.52, FSY lines 2350–2362: the source says its displayed gamma product equals the standard recipe; it should include the factor `π^{d(d+1)/4}` for that equality; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p.63, FSY line 2876: the source says unshifted divisor restriction is perverse degree zero; it should shift restriction by `−1`, since the restricted constant perverse complex is `ℚ_D[dim D][1]`; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p.71, FSY line 3222: the source says the composite pushforward is zero; it should say its geometric map is constant zero and its pushforward is supported at zero; affects the proof.
- **Error** in FSY at Remark 5.41, printed p.59, FSY line 2676: the source says the inertia-invariant Euler determinant equals the full semistable-period determinant; it should retain the monodromy kernel and descent invariants; affects the proof.
- **Error** in XZ at §2.1.5(i), printed p.10, XZ line 489: the source says `exp(π(t−t^p))` gives `F*E→E` for `d+πdt`; it should use the inverse multiplier for that direction, whose logarithmic derivative is `π(pt^{p−1}−1)`; affects a stated result.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, printed p.10, Serre-orthogonal line 393: the source says isotropy means vanishing on every pair in the ambient module; it should mean pairs in the selected submodule; affects nothing.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, printed p.10, Serre-orthogonal line 394: the source says stability of the orthogonal follows from (4.2.2); it should cite the original compatibility condition (4.1.1); affects nothing.
- **Misprint** in Serre-orthogonal at proof of Lemma 4.2.4(ii), printed p.10, Serre-orthogonal line 411: the source says the isotropic subspace has half the dimension of `M`; it should say half the dimension of `M⊥`; affects nothing.

## For the human reviewers

- Saito-orthogonal is settled `uncertified` in `packages/KloostermanMomentsAndPotentialAutomorphy/sources.toml`; the original article was not read. Only FSY's invocation and the explicit supplier contract were checked.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a6ab0f9566b10cca361a398a40a05a696deca403", "job": "REV-PKG-KloostermanMomentsAndPotentialAutomorphy~6", "model": "gpt-6-astra", "worker": "chris-30"} -->
