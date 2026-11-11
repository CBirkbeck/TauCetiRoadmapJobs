<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12984#issuecomment-6789770081 -->
Review (codex) of 4aa0b02

Verdict: needs_changes

1. **F01** (P2) Specify the normalized Euler/monodromy comparison

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:441`, §4.2: “correspond to `N`, `can` and `var` up to the factor `−2πi`”. Compare the explicit definition of `N` at line 48 and the three Checks at lines 452–454.

   **Claim:** The stated factor fixes the comparison of the left-module Euler operator with the normalized nilpotent monodromy used throughout the roadmap. It does not: `−2πi` converts the nilpotent residue to `log T_u`, whereas this roadmap defines `N = (2πi)⁻¹ log T_u`. The remaining sign must be fixed, including which variation map carries it. All three existing §4.2 Checks have zero nilpotent residue and cannot distinguish these choices.

   **Witness:** Set `Ae₁=e₀`, `Ae₀=0`, and `∇=d+A dx/x`. Then `T=I−2πiA`, `log T=−2πiA`, but `Ne₁=−e₀`. The proposed factor gives `−2πi e₀`, not `−e₀`.

   This is a regular singular, quasi-unipotent rank-two example on a punctured algebraic line. It satisfies §4.2's hypotheses. On `gr⁽V⁾₀`, `x∂_x` acts as `A`. More generally, if `A_α=x∂_x+α` on `gr⁽V⁾_α`, the nilpotent part satisfies `log T_u=−2πiA_α` and `N=−A_α`. The supplier's sign is explicit at `TauCetiRoadmap/ComplexComparisonPartII/README.md:4464` (§C5.6, PR #848). Sai88 Proposition 3.4.12, pp. 924–925, Sai88 lines 2411–2432, uses right-module conventions; it does not license leaving their conversion unspecified.

   **Exact repair:** Replace the “up to” clause by explicit equations for both `log T_u` and normalized `N`. Choose and state comparison isomorphisms under which `can=∂_x` and normalized `var=−x`, with its Tate target; then `var can=−x∂_x=N` on `gr⁽V⁾₀`, and `can var=−∂_x x=−(x∂_x+1)=N` on `gr⁽V⁾₁`. An equivalent simultaneous rescaling is permissible only if specified explicitly. Keep topological `var_top can=T−1` separate. Add the rank-two residue above as a Check and reconcile §§1.4 and 5.3 with these equations. On the witness the repaired composite sends `e₁` to `−e₀`, exactly the normalized logarithm; the old zero-residue Checks still give zero. No narrowing to semisimple monodromy is acceptable.

2. **F02** (P1) A Hilbert series is not the numerical volume

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:1114`, §12.5 proof route: “the Hilbert series of the quotient by a regular sequence of elements of degree one is `n!` times the normalized volume”.

   **Claim:** The graded quotient's Hilbert series equals the scalar volume expression. Only its total dimension, obtained by evaluating the finite Hilbert series at one, equals that scalar.

   **Witness:** For `φ=x²`, `Δ=[0,2]`, `h(m)=m/2`. The quotient is `ℂ[x]/(2x²)`, with Hilbert series `1+t^(1/2)`, not `2`; its total dimension is `2=1!·vol([0,2])`.

   This is a full-dimensional Newton-nondegenerate polynomial: the only face away from zero is `{2}`, with Euler polynomial `2x²`, nowhere zero on `ℂ×`. Thus the witness is inside the theorem's domain. Degree-one here is Newton degree, not ordinary polynomial degree. The defect is in the proof assertion; the dimension conclusion of §12.5(c), and the Lean theorem in §12.6, survive this example.

   **Exact repair:** Write `H_Q(t)=(1−t)^n H_grR(t)` for the Newton-graded quotient, interpreted with rational exponents, and `dim Q=H_Q(1)=lim_(t→1)(1−t)^n H_grR(t)=n!·vol(Δ)`. Equivalently clear grading denominators: for common denominator `e`, use `(1−s^e)^n` and take the limit at `s=1`. Add `φ=x²` as the distinguishing Check. Here `H_grR(t)=1/(1−t^(1/2))`, so multiplication by `1−t` gives `1+t^(1/2)` and evaluation gives 2. Preserve the general rational grading and all full-dimensional nondegenerate inputs.

3. **F03** (P1) The normal-semigroup Cohen–Macaulay input has no owner

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:1114`, §12.5: “is Cohen–Macaulay by Hochster's theorem (recalled in AS line 617)”; the Needs list contains §12.4, AnalyticToricGeometry Layer 0 item 6, and SchemeAndStackFoundations §0.17.

   **Claim:** These dependencies supply the normal affine semigroup ring's Cohen–Macaulay property used before the Newton associated-graded comparison. They do not. §12.5(a) targets the Newton associated-graded ring, and the proof explicitly uses the ungraded normal-semigroup theorem to reach it. A source citation is not an owner of that intermediate theorem.

   **Witness:** `Completed/AnalyticToricGeometry/README.md:230` supplies dual semigroups and Gordan finite generation. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1310` supplies depth/CM interfaces, not normal-semigroup CM. AS line 617 invokes an external theorem for its special Cayley cone.

   The full supplier subsections were read. AnalyticToricGeometryPartII §§0.1–0.3 at PR #1647, `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:117`, `:143`, `:166`, supply invariant divisors and monomial sections, not this theorem. Searches by “Hochster”, semigroups, normal monoid algebras and Cohen–Macaulay objects in the pinned libraries, main, the supplied board index and indexed open roadmap heads found no owner of the required general theorem. The big Cohen–Macaulay/direct-summand work is a different theorem. In particular, normality alone cannot be replaced by the generic depth definitions at §0.17.

   **Exact repair:** Declare a supplier gap owned by the earlier toric supplier AnalyticToricGeometryPartII §0.3, for example `gap:normal-semigroup-cohen-macaulay`, in both the README's supplier subsection and the plan's top-level `gaps`. Its single contract should be: for every field `k` and every finitely generated additive submonoid `S` of a finite-rank free abelian group, saturated in its generated group, the monoid algebra `k[S]` is Cohen–Macaulay. Add the gap to §12.5's Needs and the layer summary. This keeps the general theorem and assigns the currently invoked input without duplicating Gordan's lemma. It supplies `ℂ[C_Δ∩ℤ^n]` because this lattice cone monoid is saturated and finitely generated. Checks of the proposed contract give depth/dimension `0/0` for `S={0}`, `1/1` for `S=ℕ` and `S=ℤ`, and `2/2` for `S=ℕ²`; it includes the cone algebra `ℂ[x]` in R02. The existing six gaps must remain intact. No main roadmap or merge-order file needs editing in this package repair.

Three findings: two P1 and one P2; three blocking. The four findings of round 3 are repaired. The acceptance test elaborates with only its expected `sorry` warning, and the dependency check has no problems. The findings concern the README, not the truth or elaboration of its Lean headline. No roadmap, Lean, metadata, plan or source-manifest file was changed by this review.

## Verified sound

### Previous findings checked first

All quoted repaired passages below are from `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`. The repair report marked all four applied; none was marked not actionable, so there is no re-raised settled finding.

| Previous finding | Repaired passage and fresh computation | Status |
|---|---|---|
| F01, dual weights | Line 552: “weights `≤ w` to weights `≥ −w`”. `Dℚ(−1)=ℚ(1)` has weight `−2≥−2`; the reverse has `2≤2`. Lines 559–560 also test `ℚ[−1]`: degree 1, bound −1, dual degree −1 with bound 1. | Repaired. |
| F02, relative compactification | Line 180: “a dense compactification `X ⊂ X̄ → Y`”. Lines 105–107 import EtaleCohomologyFoundations G.1–G.2. For `G_m→A¹`, take `X̄=A¹`, `p=id`; restricted fibre cardinalities are 0 at zero and 1 elsewhere. Maps `P¹→A¹` are constant. | Repaired; §1.2 line 191 and the dependency summary also include the supplier. |
| F03, faithfulness dependency | Line 690: “`FT E = δ_0 ⊗ V`”, followed by the constant inverse transform and `RΓ=V[1]`. For `E=0`, `V=0`; for the ambient constant rank-one module, `V=ℚ` and `RΓ=ℚ[1]≠0`, so it is excluded from EMHS. The unit has fibre rank 1. | Repaired; no forward reliance on §6.6. |
| F03, repeated pattern in §7.3 | Line 762 cites “Sab05 §8.4, p. 206”. The actual Theorem 8.4.1, Sab05 lines 8497–8508, was read, not merely its contents heading. | Repaired; it supplies strict specializability without making §7.4 a prerequisite. |
| F04, zero polynomial | Line 1093: “For `n ≥ 1`”. With `n=0`, the affine span of `{0}` is all of `ℝ⁰`, volume 1, and cohomology dimension 1. For `n=1`, untwisted dimensions are 1,1; for `n=2`, 1,2,1. | Repaired without excluding the point from the headline. |

The changed and added paragraphs in scope, contracts, §§1.1–1.2, §5.2, §6.5, §7.3, §12.4 and their dependency summaries were read in full. The two changed manifest locators, Sai88 (0.9), p. 852, and Sai90 Remark 4.6(1), p. 328, were checked at Sai88 lines 138–140 and Sai90 lines 3656–3662. The repeated-pattern search covered all other compactifications, Fourier-extension comparisons, forward proof dependencies, weight shifts, zero-dimensional Newton claims and supplier contracts. R01 results from extending the normalization tests to a nonzero nilpotent residue; R02–R03 result from reading the graded-acyclicity proof rather than testing only its numerical conclusion.

### Principles, shape and completeness

The package builds general rational/complex Hodge-module and exponential theory, not a restricted route to Kloosterman examples. It does not re-plan a same-named roadmap on main. The scope imports differential operators/PBW, holonomic operations, point mixed Hodge structures, formal differential equations and toric carriers from their owners. No computational algorithm, good-prime restriction, copied passage detected in the compared source text, sorry'd data, `set_option`, forbidden supplier, or cyclic inter-roadmap supply was found. R03 is the outstanding unowned proof input.

Main's ResolutionOfSingularitiesCharacteristicZero, EnhancedDerivedSheaves and SchemeAndStackFoundations were read for shape. The current package has 12 mathematical layers, 64 numbered target subsections, 65 Needs occurrences, 28 API blocks, 65 Checks blocks, and 12 each of Examples and Dependencies subsections. The 27 definition/construction subsections have 28 definition blocks because §12.4 has two. Every such block has at least three Checks. Every numbered target has a locator and dependencies. Existing §4.2 Checks do not detect its missing scalar convention; R01 supplies that missing discrimination.

The layer organization is mathematical: Betti/RH, Fourier operations, variations, Hodge modules, their operations, exponential objects, irregular filtration, classical embedding, pair cohomology, the `tg` criterion, Fourier costalks, and logarithmic/Newton comparisons. The Needs lines force the principal order. No layer is named after a source's chapter or says that its source's exposition is the plan. Parallel early prerequisites do not establish a copied source ordering. No machine paths, dates, review or pull-request narrative, HTML anchors, LaTeX delimiters or implementation/process residue occur in the README or Lean file. Metadata remains consistent with the algebraic-geometric scope.

All owned backticked identifiers resolve to the 13 declarations in Suggested.lean. Mathematical notation in code spans was distinguished from claimed Lean names. Imported identifiers were resolved against the named main/head/pin, not guessed from spelling. No fully qualified declaration name duplicates another readable roadmap's declaration.

### Headline coverage and Lean verification

The summary's headline families and their representation are:

| README target | Suggested.lean disposition |
|---|---|
| Regular Riemann–Hilbert, §1.5; Zucker, §3.4 | Named in the module docstring. Missing geometric regular holonomic/constructible carriers and variation/weighted L² complexes. |
| Strict support and extension, §4.4; polarized projective direct image, §4.5; mixed abelianness/strictness, §4.7; weights, §5.2 | Named as Saito's structure theorems. Filtered geometric D-modules, perverse realizations and Hodge modules are missing at the pins. Point abelianness is imported, not a substitute. |
| Projector, exponential tensor, weights and faithful fibre, §§6.2–6.5 | Named in the docstring; mixed Hodge modules on a line and convolution are missing. |
| Irregular E₁-degeneration and bifiltered strictness, §§7.5–7.6 | Named; require Deligne filtration, Hodge modules and polarized twistor carriers. |
| Classical `tg` criterion/zero locus, §§10.1–10.2; Fourier costalk/Hodge numbers, §§11.2–11.3; infinity weights, §11.6 | Named; require the exponential cohomology of pairs and its Hodge structures. |
| Model independence, §12.3; Newton concentration/volume, §12.6; Newton–Hodge comparison, §12.7; filtered Künneth/duality, §12.9 | §12.6 is the actual theorem at line 146. The others are named as not statable because their irregular filtration/comparison carriers are absent. |

The carrier searches included Hodge modules, holonomic/regular D-modules, twistor objects, irregular filtrations and twisted algebraic de Rham complexes, not merely the proposed names. Native point Hodge structures and analytic exterior derivatives do not state these geometric headlines. No statable headline was found missing or replaced by a stand-in.

Suggested.lean has exactly 12 definitions/abbreviations with real bodies and one admitted theorem. It imports only `Mathlib`, has the specified namespace, one module docstring, a Layer 12 comment and a mathematical docstring for each declaration. All 12 definitions are used to state the retained Laurent/Koszul/Newton theorem. There is no free predicate encoding the missing geometry, admitted example or extra boundary theorem.

The prescribed elaboration, `lake env lean <Suggested.lean>`, was run from the pinned content checkout with the package's absolute filename supplied to the command. It exited 0. The only diagnostic was:

```text
Suggested.lean:146:8: warning: declaration uses `sorry`
```

A scratch copy with `#check @name` for all 13 declarations also elaborated. Each type was compared with §§12.4 and 12.6. No binder disappeared; there are no surrounding section variables. In particular the theorem explicitly binds both `hfull : affineSpan ℝ (newtonPolytope φ) = ⊤` and `hnd : IsNewtonNondegenerate φ`. Its concentration, finite-dimensionality and real-valued volume equality have the README's generality, including `n=0`.

The one-tactic probe covered every admitted theorem, hence the sole theorem, not a sample. On a scratch copy `rfl`, a closing `simp`, and `infer_instance` all failed. The inspected near-matches provide no single library lemma for an `exact` proof: polynomial derivations have nonnegative exponents, LaurentPolynomial is one-variable infrastructure, and a finite-rank lemma presupposes a dimension calculation. The statement is a general deep theorem, not a Check or boundary computation. No padding deletion is needed. All Lean processes completed; no library build or pin update was performed.

### Computed adversarial record

For unchanged material I used the previous review's actual computed rows, not its assurances. Its table covers all 64 numbered targets in grouped rows. The whole current text was also read, and every repaired passage, the seeded sample, all headline families and all new findings received the fresh computations below. These are tests of signs, hypotheses and definitions, not a claim that examples prove general theorems. Dimensions are over the stated coefficient field; `K=Πδ₀ℚ`.

| Statement | Instances | Values on the two sides | Result / change |
|---|---|---|---|
| §§1.1–1.2 compactification and compact supports | `G_m→A¹`; proper identity; empty source | `P¹→A¹` has constant coordinate, incompatible with `x`; relative `A¹→A¹` has one-point fibres, restricted cardinalities 0/1. Identity shift 0; empty compact supports 0. | F02 repaired. |
| §1.1 controlled lift | `ρ=x²+y²`, rotation/dilation | `dρ(−y,x)=0`; `dρ(x,y)=2ρ≠0` off the origin. | Supplier control condition discriminates. |
| §§1.3–1.5, Betti cycles | `f=t`, `f=t²`, skyscraper | For `t`, nearby/vanishing dimensions 1/0. For `t²`, full nearby rank 2 versus unipotent rank 1. For delta, nearby/vanishing dimensions 0/1. | Full nearby space and perverse shifts retained. |
| §1.5 regular RH | `O`, delta, `E^x` | `pDR(O)=ℂ[1]`, `pDR(δ₀)=ℂ₀`; `E^x` has analytic solution rank 1 but irregularity 1 at infinity. | Algebraic regularity at infinity cannot be dropped. |
| §§2.1–2.3 Fourier sign/convolution | `δ_a`, `O`, `f=0,x,x²` | `FTδ_a=E^{at}`, `FT²δ_a=δ_{−a}`, `FT O=δ₀`; affine-line twisted dimensions `(H⁰,H¹)` are `(1,0),(0,0),(0,1)`. `δ_a⋆δ_b=δ_(a+b)`. | Plus exponential and reflection agree. |
| §2.4 extension choice | trivial connection on `G_m` | Output ranks of `j⁺FT(j_!*O)` and `j⁺FT(j_+O)` are 0 and 1. | Previous repair's distinction remains necessary. |
| §§3.1–3.3 mixed variations/full limit | `ℚ(1)`; moving line; `T=−1`; Legendre block | Weight/filtration of `ℚ(1)` are −2 and jump −1. Derivative of `(1,t)` is `(0,1)`, outside its line. For `T=−1`, full rank 1 versus eigenvalue-one rank 0; Legendre has graded dimensions 1 at weights 0 and 2. | Flatness, full eigenvalue space and mixed limit discriminate. |
| §3.3 relative monodromy | `Ne₁=e₀`, original weights 0 and 1 | Candidate `M=W` has `N(M₁)=ℚe₀`, but `M_(−1)=0`. | Mere fibrewise MHS does not imply admissibility. |
| §3.4 Zucker | constant system on genus-g proper curve | `dim H¹=2g`, weight 1; at `g=0`, both H¹ spaces have dimension 0. | Correct specialization; primary source waived. |
| §4.1 Rees strictness | identity from filtration starting at 1 to one starting at 0 | `uF₀=0`, `im(u)∩F₀=ℂ`; filtered cokernel 0, but Rees cokernel `ℂ[z]/(z)` has torsion dimension 1. Equal filtrations give torsion 0. | Correct cokernel detects non-strictness. |
| §4.2 V indexing | `O`, delta, residue `a∉ℤ` | `x∂δ=−δ`, so delta starts at index 1; O gives nearby/vanishing ranks 1/0. Kummer jump `−a−k` gives eigenvalue `exp(−2πia)`. | Indexing passes; does not test nilpotent scalar. |
| §4.2 normalized Euler comparison | `Ae₁=e₀`, `A²=0` | `log T e₁=−2πi e₀`; `Ne₁=−e₀`; Euler action `Ae₁=e₀`. | R01: require `N=−A`, with explicit can/var normalization. |
| §§4.3–4.4 strict support | trivial rank-one variation on `G_m`, point | Middle extension has weight 1 and no punctual quotient; `j_*` has extra punctual `ℚ(−1)` of weight 2. Point `ℚ(m)` weight `−2m`. | Strict support excludes the larger extension. |
| §4.5 projective direct image | `P¹→pt`, identity | Input weight 1; degrees −1,1 have weights 0,2. Lefschetz twists the degree-1 `ℚ(−1)` to `ℚ`, matching degree −1. Identity has only degree 0. | Degree and Tate normalization pass. |
| §§4.6–4.7 abelianness/strictness | projection `ℚ(0)⊕ℚ(1)→ℚ(1)`; zero | Graded ranks 1,1 map to 0,1; weight/Hodge intersections of dimension 1 map onto the dimension-1 target. Zero kernels and cokernels have rank 0. | No claim that mixed extensions split. |
| §§5.1–5.2 weights | `G_m→pt`, `ℚ(±1)`, `ℚ[−1]` | H¹ and H¹_c weights 2 and 0 versus bound 1. Dual weights 2→−2 and −2→2. Derived bound −1 becomes 1, with cohomology degree 1→−1. | F01 repaired; one-sided operation bounds consistent. |
| §§1.4,5.3 normalized variation | `T=I+2πiB`, `B²=0` | `var_top can=2πiB`; normalized composite `B`; with residue `A=−B`, `N=−A=B`. | These correct conventions require the explicit §4.2 translation in R01. |
| §5.4 pure costalk | constant curve, delta, one size-2 Jordan block | Constant costalk is `ℚ(−1)` in degree 1, stalk `ℚ` in degree −1. Delta costalk is V in degree 0. Size-2 block has cokernel dimension `2−1=1`. | Costalk, not stalk; nonzero N retained. |
| §5.5 divisor localization | smooth point in A¹; nodal divisor `xy=0` | Smooth `i*` gives `ℚ[1]`. Node costalk has ranks 2,1 in degrees 0,1; false smooth formula gives ranks 1,0. | Reduced-divisor exact sequence and smooth-only purity distinguished. |
| §5.6 rigidity | constant rank r, rank 0, Kummer variation | Evaluation `H⁰(X,ℚ^r)→ℚ^r` has rank r, kernel/cokernel 0; rank-0 case is 0→0. Kummer transport has nonzero off-diagonal part. | Connectedness/admissibility and constant local system used. |
| §§6.1–6.2 exponential category/projector | constant, delta, K | Constant has `RΓ=ℚ[1]≠0`, projector 0; delta projects to K; `RΓ(K)=0`, `ΠK=K≠0`. | EMHS is not defined by absence of point support. |
| §6.3 exponential tensor | K,K; translated deltas; zero | `K⊗_E K=K`, fibre dimension `1·1=1`; parameters add `a+b`; zero input gives rank 0. | Correct projected unit and exact tensor. |
| §§6.4–6.6 weights and faithful fibre | K, ambient constant, translated projected delta | K exponential weight 0, ambient weights 0/1, fibre rank 1. Ambient constant fibre rank 0 but `RΓ≠0`; projected translate has Fourier rank 1. | F03's direct faithfulness argument passes. |
| §7.1 Deligne filtration | classical `ℚ(−1)`; infinity coordinate | `dim F¹=1`, `dim F^(1+ε)=0`; `d(1/x)/dx=−x⁻²`, so operator `∂_x−x⁻²`, not plus. | Rational endpoint and pole sign agree with ESY. |
| §§7.2–7.3 specialization/metric lattice | `τ=z` or `−z`; growth exponent 0 or 1/2 at cutoff 1/4 | Operators become `d+df` or `d−df`; growth lattices `tO` or `O`. Canonical zero-residue lattice is `tO`. | Deligne type excludes the metric rescaling. |
| §§7.3–7.5 twistor strictness/E₁ | constant harmonic triple on P¹; exponential twist of constant; delta | Twistor weights in degrees −1,1 are −1,1, versus Hodge weights 0,2. Free Rees lines have z-torsion 0. Twisted constant has all cohomology 0; delta has one graded line, all spectral differentials 0. | Actual Sab05 §8.4 theorem supports repaired input. |
| §7.6 bifiltered strictness | classical projection to `ℚ(1)` | `W_(−2)∩F^(−1)` has source/target rank 1/1; `W_(−2)∩F⁰` rank 0/0. | Tests intersections, not separate strictness alone. |
| §§8.1–8.2 classical embedding | `Iℚ(m)`, projected `δ_a`, a≠0 | Classical weight `−2m`, jump `−m`; translated Fourier connection `E^{at}(*0)` has slope 1 at infinity rather than 0. | Proper classical subcategory. |
| §§9.1–9.3 pair/product/duality | point; `(G_m,x)`; product of two | Point dimension 1 in degree 0. Torus line ordinary/compact degree-1 lines have jumps 1/0; product ordinary dimension 1 in degree 2, jump 2. Dual target in dimension 1 is `ℚ(−1)`. | Product degrees and opposite exponential pairing pass. |
| §§9.4–9.6 middle/lowest weight | k=0,1,2 torus sums | Compact→ordinary map is identity on `ℚ` for k=0; for k=1,2 its image is 0 because source/target pure weights differ. At k=2 `2!·vol=2·(1/2)=1`. | Zero-dimensional exception retained. |
| §§10.1–10.2 `tg` and support | g=0,1,x; nodal zero locus | g=1 gives all groups 0; g=x on A¹ gives one `ℚ(−1)` in degree 2; g=0 gives ordinary Hʳ(V), compact H_c^(r−2)(V)(−1). Node supports ranks 2,1 in degrees 2,3. | General support cohomology, not only smooth divisors. |
| §§11.1–11.2 Fourier costalk | constant, `δ₀V`, K, `δ_a` with a≠0 | Constant gives `ℚ(−1)` in degree 1 on both sides; delta gives V in degree 0; K gives ranks 1,1 and weights 0,2; translated delta gives 0. | Input-origin costalk and pair shift j+1 pass. |
| §11.3 pure Fourier Hodge numbers | constant weight-1 module; size-2 block; delta | Smooth case: `gr¹_Firr` rank 1 equals generic `gr⁰_F` rank 1, weight 2. Singular block costalk rank 1 versus generic rank 2. Delta has H⁰≠0 and violates hypothesis. | Smoothness retained for rank formula, punctual exclusion retained. |
| §§11.4–11.6 correction/infinity | `δ₀`; Jordan lengths 1,3 | Correction for δ is constant weight 1. Primitive top weights `w−1,w+1`; correction weights `w+2,w+4`. For K nearby infinity is weight 0, N=0. | No two-weight truncation. |
| §§12.1–12.3 logarithmic model | point; `(G_m,x)`; `(A¹,x²)`; blow-up of z/x | Filtration jumps 0,1 (compact 0),1/2. Blow-up charts give z′ and 1/x′, exceptional pole multiplicity 0. `H*(P¹,O(−1))=0`, whereas `H¹(P¹,O(−2))` has rank 1. | Correct multiplicity/horizontal boundary and vanishing range. |
| §12.4 actual Euler/differential bodies | n=0,1,2; `φ=x`; `ω=xy`, φ=0 | n=0 ring ℂ, differential 0. `D(x^m)=m x^m+x^(m+1)`. In dimension 2, `d²xy=xy−xy=0`; all-plus sign would give `2xy`. | Native linear-map definitions determine intended differential. |
| §12.4 forms/cycles/boundaries/top quotient | q=0, q>n, n=0 | No p∈ℕ satisfies p+1=0, so degree-zero boundaries 0. Above n forms/cycles 0. At n=0 the sum of Euler images is 0, quotient ℂ. | No truncated-subtraction or empty-index junk. |
| §12.4 polytope/nondegeneracy | x; x+x⁻¹; `(x+y)²`; empty face | Intervals `[0,1]`, `[-1,1]`, gauges m and abs(m); at (1,−1), both face Euler derivatives of `(x+y)²` equal 0. Empty face excluded explicitly; whole face contains 0. | Nonzero-coordinate clause protects negative powers. |
| §12.4 section cutoff/zero polynomial | n=0,a=−1,0; n=1,φ=0 | At a=−1 span dimension 0 versus divisor sections 1; at a=0 both 1. Point polytope is full only for n=0. | Nonnegative cutoff and repaired F04 pass. |
| §12.5 regular sequence/Hilbert series | x, x², degenerate square, n=0 | x quotient dimension 1; x² series `1+t^(1/2)` and dimension 2; degenerate square derivatives share x+y; empty Koszul complex is ℂ in degree 0. | R02 separates series from dimension; R03 supplies CM input. |
| §12.6 Lean headline | n=0; x; x+x⁻¹; x with unused coordinate | Dimensions/volumes `1=0!·1`, `1=1!·1`, `2=1!·2`. Unused coordinate gives H¹=H²=ℂ and affine span strictly smaller than ℝ². | Full-dimensionality negative control; general signature passes. |
| §§12.7–12.8 Newton–Hodge/boundary | x; x+x⁻¹; x+y+1/(xy) | Jumps for x: 1, dimension 1; interval example jumps 0,1, total 2; triangle volume 3/2, predicted dimension `2!·3/2=3`. x has origin on boundary; other two contain it in interior. | Convenience not imposed on general comparison. |
| §12.9 filtered Künneth/duality | two quadratic pairs; `(G_m,x)` | Quadratic jumps add `1/2+1/2=1`. Compact λ≤0 gives annihilator 0=`F^(>1−λ)`; λ>0 gives annihilator ℂ on both sides. | Strict endpoint and dual exponential sign agree. |

The zero object gives zero maps and zero graded dimensions throughout categorical statements. Positive characteristic, arbitrary infinite-dimensional variations and the zero ring are outside the stated complex/rational finite-dimensional hypotheses, not silently treated as valid examples. The Laurent theorem itself genuinely includes every natural n. Every denominator used in nilpotent logarithm normalization is a nonzero characteristic-zero scalar; the polynomial quotient `log(T)/(T−1)` is interpreted by its nilpotent polynomial, not by division by a potentially zero operator. No conclusion-as-hypothesis, arbitrary stand-in object or vacuous headline occurs in Lean.

### Seeded source sample and changed locators

The manifest has 21 works: 14 certified, six settled uncertified, one waived. The existing keys and recorded versions were used; no work was renamed, fetched by hand, newly requested or added. Every work cited in the package has a manifest entry. No additional author-flagged unverified locator was found beyond the settled unavailable works. Page references below are printed pages of the recorded version, not PDF page positions.

| Seeded target | Text/locator inspected | Conclusion |
|---|---|---|
| 1.4 Betti cycles | Dimca §4.2, Definitions 4.2.1/4.2.4, Propositions 4.2.8–4.2.11, Remark 4.2.12, pp. 103–110; Theorem 5.2.21, p. 139 | Primary text settled uncertified; not claimed read. Supplier §1.7 and the computed t/t²/delta examples checked. |
| 2.2 Fourier–Laplace | FSY §2.1, Proposition 2.4 and proof, pp. 10–11, FSY lines 441–462; Appendix A.1, p. 61, FSY lines 2773–2790 | Appendix supplies general Weyl-algebra convention; special Proposition 2.4 alone is not counted as the general theorem. Kernel sign and inversion match. |
| 3.2 full limit | Schmid Theorem 6.16 and §6; SZ §2 | Both settled uncertified. Read ShimuraVarieties §§3.5b.1–3.5b.2 and canonical-extension supplier; computed all-eigenvalue and rank-two tests. No claim of direct certification of these primary locators. |
| 4.2 rational V | Sai88 §§3.1–3.2, pp. 902–908, Sai88 lines 1752–1885; Proposition 3.4.12/proof, pp. 924–925, Sai88 lines 2411–2442; Kash76 unavailable | Rational jumps/shift ranges and cycle theorem are supported; explicit left/normalized translation needs R01. OCR around the comparison formulas is imperfect; the operator identification and hypotheses are legible. |
| 4.5 projective images | Sai88 Theorem 5.3.1, p. 977, Sai88 lines 4017–4026 | Projectivity, polarizability, strictness, shifted purity and Lefschetz are retained. |
| 5.4 pure costalk | FSY Example A.2, pp. 62–63, FSY lines 2848–2871; Corollary A.31 proof, p. 72 | Strict-support splitting and cokernel of unipotent N supported; smooth rank formula is not generalized to singular input. |
| 5.5 divisor localization | FSY Example A.3, p. 63, FSY lines 2872–2885; Sai90 §4.4, pp. 321–323 | Source's inverse-image shift is corrected in the package. Smoothness is retained only for purity, not for the reduced-divisor first sequence. |
| 5.6 rigidity | Sai90 §4.4, pp. 321–323, Sai90 lines 3430–3465; SZ §4 | Adjunction and faithful realization support the package's evaluation proof. The fixed-part text in SZ was not read. |
| 6.1 exponential structures | KS Definition 7, p. 31, KS lines 1109–1113 and preceding construction; FSY Appendix A.3, p. 64, FSY lines 2898–2909 | Vanishing global cohomology and exponential subcategory agree. |
| 6.3 tensor | KS Proposition 4/proof, pp. 36–37, KS lines 1278–1305; FSY Appendix A.3, p. 64, FSY lines 2922–2928 | Projected convolution and exponential unit supported; no assertion about unprojected tensor on all MHM. |
| 7.1 Deligne filtration | ESY (3.1.1), pp. 22–23, ESY lines 1150–1175 | Floor/index convention, rational filtration and coefficient operator at infinity agree. |
| 9.4 middle/lowest weight | FSY Proposition A.19/proof, pp. 66–67, FSY lines 3024–3047 | Both ordinary and compact weight bounds, duality and middle-image purity supported under the stated smooth/pure hypotheses. |
| 11.2 costalk | FSY Theorem A.30/proof, p. 71, FSY lines 3241–3253 | The theorem and degree convention agree; package correctly uses the input origin despite source's coordinate label. |
| 11.3 pure Fourier numbers | FSY Corollary A.31/proof, p. 72, FSY lines 3256–3277 | Punctual exclusion, cokernel formula, smooth-case weight w+1 and Hodge shift supported. |
| 12.5 graded acyclicity | AS (4.3), p. 69, AS lines 442–445; Yu Theorem 4.1(ii), p. 27, Yu lines 1408 and 1442; AS p. 75, lines 610–626 | Secondary sources support the acyclicity claim and cite Kou. Kou's primary proof remains uncertified. AS line 617 is a special-cone invocation, not ownership/proof of general semigroup CM; R03. R02 is independently refuted. |

Additional changed locator checks: Sai88 (0.9), p. 852, lines 138–140 and Sai90 Remark 4.6(1), p. 328, lines 3656–3662 agree with weight negation; Sab05 Theorem 8.4.1, §8.4, p. 206, lines 8497–8508 supports the repaired twistor input. The headline concentration/volume was also compared with AS Theorem 1.4, p. 57, lines 100–103, Theorem 4.1, p. 67, lines 395–398, Theorem 4.13, p. 73, lines 569–573, Theorem 5.1, p. 74, lines 583–590, and Yu Theorem 4.1, lines 1397–1416. The cone-to-Laurent distinction and r=0 specialization are retained. Settled unavailable sources are listed below, rather than silently certified.

### Pinned library and duplication audit

Pins read from the content manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following bodies/types were opened, not inferred from search-result names. Paths in this table are library-relative.

| Pinned file and line | Declaration / distinction used |
|---|---|
| `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | `DerivedCategory` is localization at quasi-isomorphisms; it supplies neither geometric constructibility nor perversity. |
| `Mathlib/Algebra/Polynomial/Derivative.lean:47`, `:228` | `Polynomial.derivative`, `derivative_mul`: formal polynomial derivative and Leibniz rule, not the Laurent concentration theorem. |
| `Mathlib/RingTheory/PowerSeries/Basic.lean:57`; `Mathlib/RingTheory/LaurentSeries.lean:101` | PowerSeries and LaurentSeries are their stated multivariate/Hahn specializations. |
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64`, `:69`; `Mathlib/Algebra/MonoidAlgebra/Module.lean:73` | Native monoid-algebra structure has finite-support coefficients; additive `coeffLinearEquiv` comes from the corresponding additive declaration. |
| `Mathlib/LinearAlgebra/Finsupp/LSum.lean:96`; `Mathlib/LinearAlgebra/Finsupp/Defs.lean:87` | `Finsupp.lsum`, `Finsupp.lsingle` assemble the diagonal integer-exponent operator on native carriers. |
| `Mathlib/Algebra/Module/LinearMap/Defs.lean:1018`; `Mathlib/Algebra/Module/Pi.lean:87`, `:115` | `LinearMap.mulLeft`, `pi`, `proj` have the required linear-map types. |
| `Mathlib/Analysis/Convex/Hull.lean:48`; `Mathlib/LinearAlgebra/AffineSpace/AffineSubspace/Defs.lean:537` | `convexHull`, `affineSpan`: actual Δ and full-dimensionality condition. |
| `Mathlib/Analysis/Convex/Exposed.lean:55` | `IsExposed` requires a maximizer functional only when the subset is nonempty; the functional can be zero. Thus empty and whole-set faces need the explicit exclusions in Lean. |
| `Mathlib/MeasureTheory/Constructions/Pi.lean:349`, `:660` | `volume_pi_eq_dirac`, `volume_pi`: empty product is a Dirac mass; volume of the point is 1, not 0. |
| `Mathlib/Algebra/MvPolynomial/Derivation.lean:39`, `:114`; `Mathlib/Algebra/Polynomial/Laurent.lean:85` | Polynomial derivation constructor uses natural exponents; LaurentPolynomial is `AddMonoidAlgebra R ℤ`. Neither is the multivariate twisted complex's concentration result. The retained LaurentRing is a specialization, not a duplicate new ring construction. |
| `Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean:143` | `of_finrank_eq_succ` requires a finite-rank value; it cannot establish the headline's unknown dimension. |
| `TauCeti/Geometry/Hodge/Structure.lean:62` | `HodgeStructureOn`: weight decomposition/conjugation, no finite-dimensionality or rational model. Package adds those conditions. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`; `Mixed/Morphism.lean:77` in the same directory | `MixedHodgeStructure` has integral, rational and complex models and finite filtrations; Hom preserves rational W and complex F. Finite filtrations do not imply finite-dimensional vector spaces. |
| `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:88`, `:110`, `:131` | `range_inf_iSup_deligneSplittingFamily_eq_map_iSup`, `range_inf_F_eq_map_F`, `range_inf_WQ_eq_map_WQ`; arbitrary sums of Deligne pieces include the intersection region for W∩F. Imported, not re-proposed as point targets. |
| `TauCeti/Geometry/Hodge/Mixed/Category.lean:56`; `Mixed/Abelian.lean:33` | `MixedHodgeStructureCat`, its abelian instance; point category already exists, geometric MHM does not follow from it. |
| `TauCeti/Geometry/Hodge/Polarization.lean:72`, `:159`, `:221` | `IsPolarization`, `Polarization`, `IsPolarizable` use an integral form. The package's rational form is not silently identified with a form on an arbitrary integral lattice; positive integral scaling is used when a lattice exists. |
| `TauCeti/Geometry/Hodge/Tate/Basic.lean:93`, `:102`; `Tate/Twist.lean:63` | `tate`, `tate_F`, `HodgeStructureOn.tateTwist`: weight −2m, cutoff −m, F shift by +m. |
| `TauCeti/AlgebraicTopology/LocalCoefficient.lean:46` | `LocalCoefficientSystem` is a fundamental-groupoid functor to ModuleCat, without finite-dimensional values imposed. The declared dictionary gap restricts to the correct full subcategory. |

Object searches also covered toric semigroup/normality/CM interfaces, as described in R03. No native geometric Hodge-module carrier was confused with point Hodge structures, nor a formal-series use of “holonomic” with the required D-module category. Source/interface results already owned elsewhere were left as imports. This package owns the rational geometric Hodge-module, exponential, irregular-filtration and Newton comparison layers extending those inputs, not a second pure-Hodge, PBW or toric-foundation library.

### Current supplier heads, gaps and overlaps

All Needs lines and supplier citations were read. The board package index was inspected before absence claims. Supplier sections were resolved on main or the supplied indexed open heads; the table records the sections actually opened. Paths are repository-relative; open-head line numbers refer to the README itself, excluding the tool's metadata header.

| Supplier | Resolved file/section and contract |
|---|---|
| ComplexComparisonPartII, PR #848 | `TauCetiRoadmap/ComplexComparisonPartII/README.md:996` C−1.1; `:2982` C5.1, differential operators at `:3083`; `:4438` C5.6, residue convention `:4464`; `:4680` C6.0; `:4741` C6.1. Arbitrary-ring compact-support theory starts at `:4780`; finite-stalk local-system dictionary is a separate clause. |
| FormalConnectionsOpers | `TauCetiRoadmap/FormalConnectionsOpers/README.md:707`, F2.2, PBW/symbols with projective tangent module; comparison at `:734`. |
| SpringerResolutionAndCharacteristicCycles, PR #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:855`, `:869`, `:891`, `:907` for §§8.2–8.5; `:964`, `:990`, `:1016`, `:1038`, `:1051`, `:1075` for §§9.1,9.2,9.4–9.7. Transfer shift, Kashiwara, finite length, middle extension and regular stability clauses match; missing general cases remain declared gaps. |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12729`, RD.6.52a; `:12749`, RD.6.53. Characteristic-zero formal normal form/good lattices and curve Euler index, including residue-degree factors, apply over ℂ. |
| ShimuraData; ShimuraVarieties, PR #933 | `TauCetiRoadmap/ShimuraData/README.md:355`, `:386`, `:417`, §§3.1–3.3; `TauCetiRoadmap/ShimuraVarieties/README.md:962`, `:974`, §§3.5b.1–3.5b.2. Pure variations and unipotent-cover limits; quasi-unipotent rational monodromy yields a stable lattice via its integral cyclotomic characteristic polynomial. Full-eigenvalue descent is the kept variant here. |
| LefschetzPencilsAndVanishingCycles, PR #873 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1093`, `:1146`, `:1220`, `:1279`, `:2410`, §§1.3–1.5,1.7,3.4. Relative monodromy existence is not inferred from uniqueness; normalized variation and primitive decompositions imported. |
| ResolutionOfSingularitiesCharacteristicZero, main | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:791`, `:801`, `:893`, §§5.1,5.2,6.2. Absolute SNC completion has smooth quasi-projective input. §1.5 at `:130` is the characteristic-zero smooth blow-up case. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57`, `:105`, G.1–G.2; `Suggested.lean:33`, `:65`, `:155`, Compactification, DenseCompactification, nagataCompactification. Actual Lean hypotheses are qcqs base and separated finite-type map. |
| StratifiedSpacesAndTameTopology, PR #1519 | `TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md:936`, `:957`, §§7.2–7.3: finite Whitney stratifications/Nash strata with the stated differentiability hypotheses. |
| AlgebraicTopologyPartII, PR #1694 | `TauCetiRoadmap/AlgebraicTopologyPartII/README.md:1539`, `:1571`, `:1596`, `:1617`, `:1647`, §§16.1a–16.1e: control data, controlled fields and proper isotopy. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, `:441`, `:455`, `:492`, `:580`, §§0.1–0.4,E1.4: enhanced module-sheaf constructions and derived functors, not geometric perverse hearts. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1310`, `:3420`, `:3554`, `:4104`, `:4452`, `:4917`, `:5820`, `:6389`, `:7109`, §§0.17,2.2,2.6,2.18,2.20,3.3,4.11,4.17,5.5. Depth/CM, cohomology, duality, curves, blow-ups/SNC and normal bundle. The semigroup CM theorem is the exception R03. |
| AlgebraicCurves, main | `TauCetiRoadmap/AlgebraicCurves/README.md:1099`, Layer 9; `:1468`, Layer 12. Differential/local-field comparison and regular projective model. Over ℂ the perfect-field specialization is smooth; no arbitrary-field regular=smooth assertion imported. |
| SchemeKTheoryOperations, PR #1229 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1971`, §5.7; vanishing clause at `:1979`. Exceptional projectivized conormal, normal O(−1), and range `1≤μ≤c−1` supplied. |
| AnalyticToricGeometry, completed; AnalyticToricGeometryPartII, PR #1647 | `Completed/AnalyticToricGeometry/README.md:186`, Layer 0, especially item 6 at `:230`; `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:117`, `:143`, `:166`, §§0.1–0.3. Lattices/cones/fans/semigroups, invariant divisors and monomial sections. Not the missing general CM theorem. |

The six existing gap slugs occur identically in the plan and README: `holonomic-specializability`, `regular-holonomic-stability`, `rational-complex-local-system-dictionary`, `toric-normal-fan`, `toric-rounded-vanishing`, `blowup-exceptional-divisor`. Each has a named supplier, precise domain and related compatibility clauses. Their absence from the supplier today is not a finding. The stability gap excludes regular duality/smooth pullback/intermediate extension already supplied; the dictionary gap does not duplicate finite-ring finite-stalk equivalence; the blow-up gap asks for arbitrary-field smoothness and does not duplicate the exceptional projective bundle or its vanishing. The toric gaps concern normal fans/refinement and rounded nef-divisor vanishing beyond monomial section descriptions. No existing gap has supplier `none` or requests the same already-supplied construction. R03 asks for an additional declared contract, not for treating any of these six as a defect.

The overlap record has no conflicting head changing this roadmap, dropped cited id, or id defined only by an open revision. Its five nearest vocabulary neighbors were opened. Lefschetz and ComplexComparison supply the explicitly imported foundations. PadicDifferentialEquations supplies formal normal forms/index, not geometric mixed Hodge modules. EtaleDualityAndPerverseSheaves, PR #1040, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:7`, has the finite/adic étale coefficient setting; it is not a second owner of rational Betti Hodge realization. SheafConvolutionOnAbelianVarieties, PR #1809, `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:7`, owns abelian-variety convolution/Fourier–Mellin/Fourier–Mukai structures, not the additive-line exponential Fourier theory here. Its §§0.4,0.9,1.5,4.3 at lines 275,399,520,744 were compared for ownership. No mutual supply or duplicate owned object was found in those scopes.

The downstream old ids `H.1/operations` and `H.1/weight-bounds` at `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md:13`, PR #1644, resolve through this package's former-numbering map at README lines 143–172 to §§5.1–5.2. The map preserves old-to-new citation meaning. These are consumers, not upward suppliers. No numbering repair is needed.

The exact prescribed dependency check completed successfully. Full output:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. `roadmaps resolve` found no unresolved roadmap citation/name; its external-library limitation was compensated by opening the pinned files above. Ownership checks used the provided indexed heads and board index, not a search for unprovided checkouts. No change to the merge order or tooling was made.

## Not verifiable

These are settled source-access limitations, not new requests and not disguised passes. No entry was added to needs-references.

- Dimca: settled uncertified. Could not read the cited §4.2 and Theorem 5.2.21 text for seeded §1.4, nor its other perverse/RH locators. Supplier and example checks do not certify that text.
- Schmid: settled uncertified. Theorem 6.16/§6 for seeded §3.2 was not directly read.
- SZ: settled uncertified. Limit/admissibility/fixed-part text in §§1–4, including seeded §§3.2 and 5.6, was not directly read.
- Kash76: settled uncertified. The primary b-function reference in seeded §4.2 was not directly read; Sai88's accessible filtration/cycle statements were read.
- Kou: settled uncertified. Théorème 2.8 and §2 proof for seeded §12.5 were not directly read. AS/Yu certify their own secondary statements, not the inaccessible proof or every intermediate claim attributed to it.
- Verdier: settled uncertified. Theorems 3.3/5.1 remain unavailable for the repaired stratification/compactification discussion; the actual topology and Nagata suppliers were read.
- Zucker: waived. The L² theorem was checked on the constant curve specialization and against the roadmap's hypotheses, but its primary text was not read.

The AS extraction omits parts of the displayed dimension formula in Theorem 4.13. Its surrounding argument and the readable formula in Yu Theorem 4.1(iii) were compared; no fresh visual certification of that damaged AS display is claimed.

Sai88 is OCR text. In Proposition 3.4.12 the operator-identification sentence and assumptions are readable, while some displayed comparison maps are degraded. R01 relies on the independently computed residue identity and the readable supplier convention, not on reconstructing illegible OCR symbols. No new inaccessible source is needed to verify the three findings.

## Source issues

- **Misprint** in FSY at Appendix A.2, printed p. 62, FSY line 2832: the source says duality twists the smooth constant perverse object by minus its dimension; it should be plus its dimension; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p. 63, FSY line 2876: the source says divisor inverse image of the shifted constant object is perverse in degree zero; it should be the divisor constant perverse object shifted by one; affects a stated result.
- **Misprint** in FSY at Theorem A.30, printed p. 71, FSY line 3241: the source says the costalk inclusion is into the output t-line; it should be into the input τ-line carrying M; affects a stated result.
- **Misprint** in AS at §4 filtration definition, printed p. 68, AS line 424: the source says the monomial-weight bound in form degree l is k/e minus l; it should be k/e plus l, as also identified in Yu line 1443; affects the proof.
- **Misprint** in FSY at Appendix A.2, printed p. 61, FSY line 2800: the source says left-to-right filtration uses the index p minus the dimension; it should be p plus the dimension; affects a stated result.
- **Error** in Yu at §4(a), printed p. 26, Yu lines 1377–1378: the source says convenience makes the Laurent-polynomial map proper; it should assert exhaustiveness, since x+x⁻¹+y+y⁻¹ has a positive-dimensional affine zero fibre; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4aa0b024fa03c43ff840a1e53e727a324b7c04db", "job": "REV-PKG-MixedHodgeModulesAndIrregularHodgeTheory~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
