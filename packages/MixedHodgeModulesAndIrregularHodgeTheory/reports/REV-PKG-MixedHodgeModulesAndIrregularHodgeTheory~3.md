<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12984#issuecomment-6781975933 -->
Review (codex) of 7d6c1f3

Verdict: needs_changes

1. **F01** (P2) Negate the bound when dualizing weights

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:547`, §5.2: “`D` exchanges the two”.

   **Claim:** Following the two classes defined at the same bound `w`, this asserts their interchange without specifying the necessary replacement of `w` by `−w`.

   **Witness:** On a point, `ℚ(−1)` has weight 2 and belongs to weights `≤2`. Its dual `ℚ(1)` has weight −2, hence does not belong to weights `≥2`.

   **Repair:** State explicitly that `D` sends weights `≤w` to weights `≥−w`, and weights `≥w` to weights `≤−w`. Add the two Tate-line computations as a Check. For the displayed instance the corrected conclusion is `−2≥−2`; starting instead with `ℚ(1)` and `w=−2` gives `2≤2`. This agrees with the package's existing duality normalization at lines 45 and 542. The operation bounds in Sai90 (4.5.1)–(4.5.2), p. 324, Sai90 lines 3513–3519, do not justify retaining the same numerical bound under duality.

2. **F02** (P2) Relative compactification is not projective completion of the source

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:175`, §1.1: “inside a projective compactification”; “ResolutionOfSingularitiesCharacteristicZero §6.2 for the compactification”. The associated Check is at line 180.

   **Claim:** The stated arbitrary separated algebraic map has the relative compactification required by the proof through the cited absolute smooth quasi-projective compactification. The Check uses `P¹⊃G_m` for `G_m→A¹`.

   **Witness:** Every morphism `P¹→A¹` is constant, since `Γ(P¹,O)=ℂ`; none restricts to `x↦x` on `G_m`. Thus this `P¹` is not a compactification over `A¹`.

   **Repair:** Keep the general separated-variety statement. Import relative compactification objects and existence from main's `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57` (§G.1) and line 105 (§G.2), adding the contract and Needs citation. Apply compatible stratification to a proper extension `X̄→Y` and its boundary, without asserting that an arbitrary source has a projective completion over the base. ResolutionOfSingularitiesCharacteristicZero §6.2, `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:893`, only supplies an absolute SNC completion for a smooth quasi-projective variety.

   Replace the inclusion Check by `G_m↪A¹` followed by `id:A¹→A¹`. The second map is proper and has point fibres; the original inclusion has empty fibre over 0 and a point over every nonzero value. Both restrictions are locally trivial over their respective strata. Lack of properness prevents applying the proper-map theorem directly; it does not make the empty-fibre restriction nontrivial. The repair therefore passes the instance that refutes the proposed `P¹` extension. EtaleCohomologyFoundations is on main and is an allowed earlier supplier.

3. **F03** (P3) The fibre-functor proof uses an unlisted later target

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:683`, §6.5: “faithfulness by the Fourier description 6.6”. Its Needs line and the layer summary at line 714 omit 6.6.

   **Claim:** The listed inputs and numerical order suffice for the stated proof route of faithfulness.

   **Witness:** The route explicitly invokes §6.6, which is stated at line 700, after §6.5. Neither dependency list contains this edge. This is a missing build dependency, not an inter-roadmap cycle.

   **Repair:** Remove this forward dependency by giving the direct argument from §§2.2, 2.4, 6.1 and 6.2: zero fibre forces the Fourier connection on `G_m` to have rank zero; the transform is then supported at 0, so its inverse transform is constant; an object of `EMHS` that is constant is zero. List these inputs in §6.5 and its dependency summary. The tests distinguish the required domains: the ambient constant module is nonzero with fibre 0 but is not in `EMHS`; the exponential unit `K` is in `EMHS` and has fibre dimension 1. No numbering change or duplicate Fourier-localization target is necessary.

4. **F04** (P3) The zero-polynomial Check forgets the zero-dimensional torus

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:1086`, §12.4: “Here `Δ(0) = {0}` is not full dimensional”.

   **Claim:** This holds for the arbitrary natural number `n` of the subsection.

   **Witness:** For `n=0`, `ℝ⁰={0}`, so `affineSpan ℝ {0}=⊤`. The complex is `ℂ` in degree 0, and its dimension is `1=0!·volume({0})`.

   **Repair:** Qualify the non-full-dimensional assertion by `n≥1`; explicitly retain the point case for `n=0`. The latter is already correctly included in §12.6 at line 1123 and in `Suggested.lean`. For `n=1`, the excluded example still has `dim H⁰=dim H¹=1`, while for `n=0` the headline hypotheses hold and its conclusion is true. Do not exclude `n=0` from the theorem.

Four findings: two P2 and two P3; two blocking. All eleven findings of round 2 were checked first and their repairs are applied. The acceptance test elaborates, with only its expected `sorry` warning. No package implementation, README, metadata, plan or source-manifest entry was changed in this review.

## Verified sound

### Previous findings, checked before this round's new pass

All locations below are in `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`. Quoted fragments identify the repairs; the numerical tests were recomputed. No previous finding was marked not actionable, and none is re-raised against an exemption.

| Round-2 finding | Repaired passage and witness | Status |
|---|---|---|
| R01 Fourier restriction | Line 319: “generally survive restriction to `G_m`”. Line 325 retains the specified input extension: `j⁺FT(j₊O)=O` has rank 1, whereas `j⁺FT(j_!*O)=0` has rank 0. | Repaired. |
| R02 Rees cokernel | Line 419: “`coker(R_F u : R_F M → R_F N)` has no `z`-torsion”. For the identity from filtration starting at 1 to filtration starting at 0, this is `ℂ[z]/(z)`, whereas the Rees module of the filtered cokernel is 0. | Repaired. |
| R03 Springer ownership | Lines 24, 72 and 86 name “ComplexComparisonPartII §C5.1”, “FormalConnectionsOpers §F2.2”, and Springer's numerical §§8–9. The actual open heads contain these statements. `[∂,x]=1`, `gr D=ℂ[x,ξ]`, and `x∂δ=−δ` agree. | Repaired. |
| R04 stratification suppliers | Lines 106 and 110 name “§§7.2–7.3” and “§§16.1a–16.1e”. Their heads provide Nash/Whitney strata and control/isotopy respectively. Rotation has `dρ(−y,x)=0`, dilation has `dρ(x,y)=2ρ`. | Repaired; the independently discovered relative-compactification defect is R02 above. |
| R05 rational/complex dictionary | Line 82: “gap:rational-complex-local-system-dictionary”, with finite-dimensional values and stalk/transport compatibility. The same slug occurs in the plan. A point has stalk `ℚ` of dimension 1 but infinite cardinality, outside the existing finite-ring contract. | Repaired. |
| R06 duplicated gap content | Line 124 imports “SchemeKTheoryOperations §5.7”; line 120 requests only “the smoothness of `X̃` over that field”. Line 76 excludes already supplied regular duality, smooth pullback and middle extension from the missing stability cases. Exceptional normal degree is −1 and `RΓ(P¹,O(−1))=0`. | Repaired. The remaining arbitrary-field smoothness contract is broader than ResolutionOfSingularitiesCharacteristicZero §1.5, whose characteristic-zero specialization was also inspected. |
| R07 Deligne type | Line 749 restricts the harmonic construction to “Deligne type” and identifies the metric growth and canonical filtrations. At cutoff `b=1/4`, the flat line with norm exponent `a=1/2` has lattice `O`, whereas exponent 0 has lattice `tO`. | Repaired. |
| R08 twistor weights | Lines 749 and 762 separate the “weight-zero” harmonic triple from the Hodge module. On `P¹`, degrees −1 and 1 have twistor weights −1 and 1; the Hodge-module pushforward has weights 0 and 2. | Repaired. |
| R09 locators | Line 352: “Kash86, §1.6, p. 993”; line 419: “ESY, §2.1, p. 18”; line 766: “pp. 36–37” for Sab10 Proposition 6.10 and proof. Each repaired location was opened. | Repaired. |
| R10 cutoff | Line 1095 specifies “rational `a ≥ 0`”. At `n=0,a=−1`, the monomial span is 0 and the divisor section space is `ℂ`; at `a=0` both are `ℂ`. The negative value is now excluded. | Repaired. |
| R11 numbering | Lines 138–167 contain “Former-numbering map”; `H.1/operations→5.1`, `H.1/weight-bounds→5.2`. Following the citations at `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md:13`, PR #1644, reaches the intended targets. | Repaired. |

The repeated-pattern search covered every supplier contract and Needs line, all other Fourier-extension and Rees claims, Tate/duality and twistor weights, the Newton cutoff and dimension-zero examples, the complete source manifest, and downstream numbering. In particular it found R01 and R04 rather than assuming that neighboring repaired conventions made them correct.

### Principles, shape and headline coverage

The scope is general rational/complex Hodge and exponential theory. There is no arithmetic good-prime restriction, Kloosterman-specific substitute, executable algorithm, copied source passage detected in the compared text, sorry'd data, or `set_option`. This is not a replacement of a same-named main roadmap. The main roadmap shapes in ResolutionOfSingularitiesCharacteristicZero and EnhancedDerivedSheaves were read, with SchemeAndStackFoundations also used for comparison. The layers are named by their mathematics and their dependency lines force the principal order; the text does not adopt a source's chapter arrangement. R03 identifies a local exception in the advertised build order.

Counts from the current README: 12 layers; 64 numbered target subsections; 65 Needs occurrences; 12 Examples and 12 Dependencies subsections; 28 API blocks and 65 Checks blocks. The 27 definition/construction subsections have 28 API/Checks blocks because §12.4 defines two groups of objects. Each definition's block has at least three Checks. Every target has a source locator and a Needs line. The extra Needs/Checks block is associated with the split constructions, not an unnumbered missing target. All hypotheses are read with the standing separated finite-type complex-variety convention; smooth quasi-projectivity is imposed for Hodge modules. No process dates, machine paths, pull-request numbers, HTML anchors or LaTeX delimiters occur in the README or Lean file.

The summary's end theorems are Saito projective direct image and abelianness (§§4.5, 4.7), irregular `E₁` degeneration and bifiltered strictness (§§7.5–7.6), the `tg` criterion (§10.1), Fourier costalk and Hodge numbers (§§11.2–11.3), infinity weights of the projector (§11.6), and Newton concentration/volume and Hodge comparison (§§12.6–12.7). The other deep interfaces are regular Riemann–Hilbert (§1.5), Zucker (§3.4), strict-support extension (§4.4), weight bounds (§5.2), the exponential projector/tensor/fibre (Layer 6), model independence (§12.3), and filtered Künneth/duality (§12.9).

The module docstring names all these groups, including missing regular holonomic, constructible/perverse, Hodge-module, variation, Deligne-filtration and twistor carriers. Object searches at the pins found no carrier that makes those missing geometric statements available through a few simple definitions. They are not replaced by free predicates. The statable Laurent concentration/volume theorem is present, with its real Laurent/Koszul/Newton definitions. No other statable headline was identified as absent.

There are 13 Lean declarations: 12 definitions/abbreviations and one theorem. Every owned backticked identifier in the README resolves to these declarations; conventional mathematical symbols and explicitly imported names were distinguished from proposed Lean names. All 13 signatures were elaborated again using `#check @name` in a scratch copy and compared with §§12.4 and 12.6. No section binder disappeared; the sole theorem explicitly binds full dimensionality and nondegeneracy. The definitions have real bodies and native carriers, and their maps have specified source and target. There is no extra theorem, admitted example, data axiom, or library-root Tau Ceti import.

The prescribed `lake env lean` elaboration from the pinned content checkout exited 0. Its only diagnostic was:

```text
Suggested.lean:146:8: warning: declaration uses `sorry`
```

All admitted theorems were probed, not sampled: there is exactly one. In a scratch copy, `rfl`, closing `simp`, and `infer_instance` all failed to close `twistedDeRham_concentration_finrank`. The inspected library near-matches do not give a one-lemma `exact` proof. The conjunction includes general concentration, finite-dimensionality and Newton volume, so it is not a boundary computation or a restatement of a definition. No padding deletion is requested. The file stayed unchanged, and no Lean process was left running.

### Computed adversarial record

The round-2 report has actual computed rows across all 64 target subsections. For unchanged material, only those rows were inherited; its general assurances were not treated as tests. This round re-read the whole package and independently checked all changed material, the current sample, all headline families and every new finding. The compact table below records those checks and the acceptance-test definitions. It does not claim that testing examples proves the general theorems. Unless otherwise indicated, dimensions are over `ℂ`, `K=Πδ₀ℚ`, and the field and finiteness restrictions are those of the README.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| 1.1 map strata and relative compactification | `xy:A²→A¹`; `G_m→A¹` | Nonzero fibre of `xy` is `ℂ×`; zero fibre is two crossing lines. `Γ(P¹,O)=ℂ` permits only constant maps to `A¹`, versus required restriction `x`. Relative model `A¹→A¹` has one-point fibres. | Stratification test passes; compactification repair R02. |
| 1.1 control data | `ρ=x²+y²`, rotation and radial dilation | `dρ(−y,x)=−2xy+2xy=0`; `dρ(x,y)=2(x²+y²)≠0` off 0. | Repaired control condition discriminates. |
| 1.2–1.5 Betti shifts and RH | point, `A¹`, delta, exponential `E^x` | `pDR(O)=ℂ[1]`; `pDR(δ₀)=ℂ₀`; `i₀^!ℚ=ℚ[−2]`. `E^x` has constant analytic solutions but pole order 2 at infinity, so fails algebraic regularity. | Degree and regular-at-infinity hypotheses retained. |
| 2.1–2.3 exponential/Fourier signs | `f=0,x,x²`; deltas | On `ℂ[x]`, cohomology dimensions are `(1,0),(0,0),(0,1)` respectively. `FTδ_a=E^{at}`, `FT O=δ₀`, `FT²δ_a=δ_{−a}`; `δ_a⋆δ_b=δ_{a+b}`. | Positive exponential, inversion and additive convolution agree. |
| 2.4 repaired extension comparison | trivial connection on `G_m` | `j⁺FT(j_!*O)=0` versus `j⁺FT(j₊O)=O_{G_m}`; ranks 0 versus 1. | Constant corrections survive output restriction. |
| 3.1 VMHS and polarization | constant `ℚ(1)`; moving weight line | Weight −2; `F^{−1}=ℂ`, `F⁰=0`; polarization phase `i^{−2+2}=1`. The line `ℂ(1,t)` has derivative `(0,1)` outside itself, so is not a flat weight subobject. | Definition excludes the wrong model. |
| 3.1 coefficient dictionary | point with rank-one stalk | `dim_ℚ ℚ=1`, but `#ℚ` is infinite; likewise complex rank 1. | New gap, not finite-stalk supplier specialization. |
| 3.2–3.3 full nearby space/admissibility | `T=−1`; `Ne₁=e₀`, weights 0 and 1 | For `T=−1`, eigenvalue-one space has rank 0 but full nearby space rank 1. In the two-weight example `N(M₁)` contains `e₀` while `M_{−1}=0`; relative monodromy condition fails. | Full cycles and admissibility conditions essential. |
| 3.4 Zucker headline | constant system on genus-g proper curve | `dim H¹=2g`, pure weight 1; for a point-support/empty variation the spaces are 0. | Consistent; primary text waived. |
| 4.1 repaired Rees criterion | identity, source filtration starts 1, target starts 0 | `uF₀=0≠ℂ=im(u)∩F₀`; `R(coker u)=0`; `coker(Ru)=ℂ[z]/(z)`. Equal filtrations instead give cokernel 0 and strictness. | Correct cokernel now detects strictness. |
| 4.2 V convention | `O`, `δ₀`, Kummer residue `a` | `x∂δ=−δ`, so delta first occurs at index 1; nearby interval `[0,1)` gives 0. For `O`, nearby rank 1 and vanishing rank 0. Kummer jumps are `−a−k`. | Signs agree across supplier and target. |
| 4.3–4.4 strict support | trivial rank-one variation on `G_m`; point | Middle extension is `pℚ_{A¹}`, weight 1; `j_*` has an additional punctual quotient `ℚ(−1)` of weight 2. On a point `ℚ(m)` has weight `−2m`. | No boundary quotient in strict support; pure semisimplicity not asserted for mixed extensions. |
| 4.5 projective direct image | `P¹→pt`; identity | Nonzero degrees −1,1 have weights `1−1=0`, `1+1=2`; hard Lefschetz matches `ℚ→ℚ(−1)(1)=ℚ`. Identity contributes only degree 0. | Projective theorem and Tate shift agree. |
| 4.6–4.7 mixed abelianness | zero object; two equal-filtered Tate lines; nonsplit mixed extension | Zero kernels/cokernels have all graded dimensions 0. Projection of `ℚ(0)⊕ℚ(1)` preserves the individual dimensions 1 and 1 of its weight pieces; strictness does not split a nontrivial extension. | Point theorem imported, geometric extension owned here. |
| 5.1–5.2 operations/weights | `G_m→pt`, `P¹→pt`, Tate duals | `H¹(G_m)=ℚ(−1)` has weight 2; `H¹_c(G_m)=ℚ` weight 0, compared with bound 1. Duality sends weight 2 to −2, not to a weight ≥2. | One-sided pushforward bounds pass; R01 fixes dual bound. |
| 5.3 cycle normalization | unipotent block `T=exp(2πi N)` with `N²=0` | `T−1=2πi N`; dividing variation by the logarithmic factor yields `var∘can=N`, not `2πi N`. Supplier residue convention gives `N=−Res`. | Normalization retained. |
| 5.4–5.5 costalk/divisor shifts | smooth curve constant module | `i^*pℚ=ℚ[1]`, `i^!pℚ=ℚ(−1)[−1]`; ordinary and compact divisor boundary lines have weights 2 and 0. | Restriction is not perverse degree zero. |
| 5.6 rigidity | connected constant rank-r variation; nonconstant Kummer system | Evaluation `H⁰(X,ℚ^r)→ℚ^r` is identity of rank r, kernel/cokernel 0; Kummer transport has a nonzero off-diagonal entry, so it fails constant-monodromy hypothesis. | Both zero and positive ranks agree with counit proof. |
| 6.1–6.2 EMHS/projector | constant module, `δ₀`, `K` | `RΓ(pℚ_{A¹})=ℚ[1]≠0`; `Πpℚ=0`; `Πδ₀=K≠0`; `RΓ(K)=0`; `Π²δ₀=K`. | Projector and EMHS, not absence of punctual support, determine the category. |
| 6.3 exponential tensor | `K⊗_E K`; projected translated deltas | `K⊗_E K=K`, fibre dimensions `1·1=1`; translates at a,b convolve to translate at `a+b`. Zero input gives zero output. | Exact monoidal structure, with projector unit. |
| 6.4–6.6 weights/fibre/localization | `K`, constants, `δ_a` | `K` has exponential weight 0, ambient weights 0,1; fibre dimensions are 1,0,1 respectively. `FTK=O(*0)`, `FT O=δ₀` and `δ₀(*0)=0`. | Math consistent; proof-input list repaired by R03. |
| 7.1 rational Deligne filtration | classical Tate line; `θ=x⁻¹` | Classical `ℚ(−1)` has `F^λ=ℂ` for `λ≤1`, 0 for `λ>1`; exponential coefficient operator is `∂_x−x⁻²`, not plus. | Rational cutoff and infinity sign agree with ESY (3.1.1). |
| 7.2 filtered specialization | specialization `τ=z`; comparison `τ=−z` | The former produces `d+df`, the latter `d−df`; at a pole `1/x` the operators are `∂_x−x⁻²` and `∂_x+x⁻²`. | Specified sign distinguishes the constructions. |
| 7.3 repaired Deligne type | trivial flat line, norm exponent 0 or 1/2, cutoff 1/4 | Metric growth lattices are `tO` and `O` respectively; canonical zero-residue lattice at this cutoff is `tO`. | Exponent 0 passes; nonintegral rescaling fails Deligne type. |
| 7.3–7.4 twistor strictness | trivial harmonic triple on `P¹`; zero triple | Nonzero direct-image degrees −1,1 have twistor weights −1,1; Hodge weights are 0,2. Rees cohomology is a sum of free `ℂ[z]` lines, hence z-torsion 0. Zero triple gives 0. | Repaired weight distinction; strictness supported. |
| 7.5 E₁ degeneration | constant regular module before twist; `δ₀` | First has twisted cohomology 0 in all degrees; delta has one filtered line, so only one nonzero associated-graded piece and all spectral differentials 0. | Regular input required before exponential twisting. |
| 7.6 bifiltered strictness | `ℚ(0)⊕ℚ(1)` in classical embedding, projection to second summand | `W_{−2}∩F^{−1}` has dimension 1 and maps onto the target's dimension-1 intersection; `W_{−2}∩F⁰` is 0 on both sides. | Simultaneous, not merely separate, strictness tested. |
| 8.1–8.2 classical embedding | `I(ℚ(m))`; translated point with `a≠0` | `I(ℚ(m))` has weight `−2m`, jump `−m`; `FTΠδ_a=E^{at}(*0)` has exponential slope 1 at infinity, unlike classical localization of a trivial connection. | Classical subcategory is proper. |
| 9.1–9.3 pair/product/duality | point, `(G_m,x)`, product of two copies | Point has H⁰ dimension 1. Torus line has ordinary `I(ℚ(−1))`, compact `I(ℚ)` in degree 1. Product has degree-2 dimension 1 and ordinary jump 2. Opposite-sign pairing targets `ℚ(−1)` in dimension 1. | Degree, product and dual-exponential signs retained. |
| 9.4–9.6 weights and small tori | `(G_m,x)`; k=0,1,2 torus sums | At k=0 comparison is identity of `ℚ`; at k=1,2 compact/ordinary weights differ and comparison is 0. At k=2 volume is `1/2`, hence `2!·1/2=1`. | Explicit zero-dimensional distinction in §9.6 is correct. |
| 10.1 tg criterion | `g=0,1,x` | `g=0`: ordinary `H^r(V)`, compact `H_c^{r−2}(V)(−1)`; `g=1`: all 0; `g=x` on `A¹`: one degree-2 classical line `ℚ(−1)`. | Classicality includes constant and zero functions. |
| 10.2 zero locus | `g=x`, `xy`, 0 | Smooth zero point gives `ℚ(−1)` in degree 2. Node in `A²` has supported groups `H²_Z=ℚ(−1)²`, `H³_Z=ℚ(−2)`. Zero function has support all V. | Smooth-divisor purity cannot replace general supported cohomology. |
| 11.1–11.3 Fourier costalk/Hodge numbers | `K`, smooth constant, translated delta | `H⁰_dR FTK=H¹_dR FTK=ℂ`; `i₀^!K` has weights 0,2 in degrees 0,1. Smooth constant has only costalk degree 1 with Tate twist −1. `FTδ_a=E^{at}` has zero cohomology for `a≠0`. | Costalk and degree conventions agree. |
| 11.4–11.6 correction/infinity weights | `δ₀`; unipotent blocks of lengths 1 and 3 | `Πδ₀=K` has constant correction weight 1; nearby infinity is a weight-0 line with N=0. Primitive tops for lengths 1,3 have weights `w−1,w+1`; correction weights are `w+2,w+4`. | All primitive parts retained; no false two-weight bound imported from KS. |
| 12.1 logarithmic filtration | point; `(G_m,x)`; `(A¹,x²)` | Point jump 0; torus ordinary/compact jumps 1/0; quadratic pole multiplicity 2 permits jump 1/2. For torus compact support, horizontal twist is `−{0}`, not `−{0}−{∞}`. | Multiplicities and horizontal boundary essential. |
| 12.2 blow-up | `z/x` at origin; c=2,3 | Charts give `z′` and `1/x′`; exceptional pole multiplicity 0. `RΓ(P¹,O(−1))=0`; both `O_{P²}(−1),O_{P²}(−2)` have zero cohomology; `H¹(P¹,O(−2))=ℂ`. | Imported range `0<μ<c` and signs discriminate. |
| 12.3 model independence | point, torus line, quadratic affine line | Both logarithmic/Deligne descriptions have jumps respectively 0, 1 (compact 0), and 1/2. | Identification route avoids an undeclared weak-factorization theorem. |
| 12.4 Euler/differential definitions | n=0,1,2; `φ=x`; `φ=0,ω=xy` | n=0 gives ring `ℂ`, differential 0. In n=1, `D(x^m)=mx^m+x^{m+1}`. In n=2 correct signs give `d²xy=xy−xy=0`, all-positive signs give `2xy`. | Actual linear-map bodies encode the intended Koszul differential. |
| 12.4 forms/cycles/boundaries/top quotient | q=0, q>n; n=0 | `p+1=0` has no natural solution, so boundaries degree 0 are 0. Above n, forms and cycles are 0. Empty sum of Euler images at n=0 is 0, so top quotient is `ℂ`. | No natural-subtraction junk term or empty-family quotient error. |
| 12.4 lattice/face/nondegeneracy | `x`, `x+x⁻¹`, `(x+y)²`; empty face | Polytopes `[0,1]`, `[-1,1]`; gauges m on nonnegative cone, and `|m|`. At `(1,−1)` both edge Euler derivatives of `(x+y)²` vanish. Empty face and full face are excluded by explicit hypotheses. | Nonzero torus coordinates protect negative powers; degeneracy test rejects wrong model. |
| 12.4 monomial-section cutoff | n=0,a=−1,0; `φ=0` | At −1, span 0 versus section space `ℂ`; at 0 both `ℂ`. For n=0, `{0}` spans all `ℝ⁰`; for n=1 it does not span `ℝ`. | Repaired cutoff passes; R04 fixes dimension-zero prose. |
| 12.5 graded acyclicity | `φ=x`, `(x+y)²`, n=0 | First graded Euler element x is regular and quotient dimension 1; degenerate edge has common factor `x+y`; empty Koszul complex is `ℂ` in degree 0. | Full-dimensional nondegenerate regular-sequence argument retained. |
| 12.6 Lean concentration/volume | n=0; x; `x+x⁻¹`; x with unused second coordinate | Dimensions/volumes: `1=0!·1`, `1=1!·1`, `2=1!·2`. With unused coordinate, H¹ and H² both have dimension 1 and full dimensionality fails. | General headline holds on admissible examples; missing hypothesis negative control works. |
| 12.7 Newton–Hodge comparison | x and `x+x⁻¹` on torus | For x, cone top class has gauge 0 and Hodge jump 1; interval example has two classes with jumps 0,1, total dimension 2. | Convenience is not imposed on this theorem. |
| 12.8 convenient boundary | `x`; `x+x⁻¹`; `x+y+1/(xy)` | First is not convenient and has different compact/ordinary Tate lines. Interval gives dimension 2; triangle area `3/2` gives dimension `2!·3/2=3`. | Convenience distinguished from full dimensionality. |
| 12.9 filtered Künneth/duality | two quadratic pairs; `(G_m,x)` | Quadratic jumps add `1/2+1/2=1`. For torus compact filtration, λ≤0 gives annihilator 0=`F^{>1−λ}`; λ>0 gives annihilator `ℂ`=`F^{>1−λ}`. | Strict inequality at jumps and opposite exponential are correct. |

Zero objects and rank-zero vector spaces satisfy all relevant linear and categorical laws with zero maps and dimensions. Positive-characteristic fields, the zero ring and arbitrary infinite-dimensional Hodge objects are excluded by the stated coefficient/finite-dimensional hypotheses, not silently used as successful examples. The actual torus theorem allows every natural n, including 0. Denominators in specialization use the characteristic-zero field and the nilpotent polynomial normalization; nondegeneracy evaluates negative monomial powers only at nonzero coordinates. No arbitrary predicate or conclusion-as-hypothesis was found in the Lean statement.

### Source verification for the current seeded sample

The 21-entry manifest parses: 14 certified works, six settled uncertified works, and one waived work. All cited works are recorded under their existing keys. The recorded preprint versions were used (FSY v5, ESY v4, Yu v2, KS v2, MT v12, Sab10 v3, Sab05 v2); printed-page numbers, rather than extraction-page positions, were compared. No other unverified locator flag occurs in the README. No source needed fetching and the manifest was not rewritten.

| Sampled target | Locator/text inspected | Outcome |
|---|---|---|
| 1.1 | Verdier Théorème 3.3 and Corollaire 5.1; settled uncertified. Actual topology and compactification suppliers also opened. | Cannot certify the primary text. Independent test and supplier comparison give R02. |
| 1.5 | Kash84 §6 Main Theorem, pp. 353–355, Kash84 lines 1101–1170, especially 1146–1149; §7 proof. Dimca Theorems 5.3.1/5.3.3 remain uncertified. | Kashiwara supports analytic regular RH. The algebraic and perverse formulation also needs the stated comparison/algebraic-constructibility inputs; the analytic theorem alone was not counted as proof of every clause. |
| 3.1 | Kash86 §1.6, p. 993, Kash86 lines 78–85; §§1.8–1.9, lines 91–109. | Filtrations, flat weight pieces and Griffiths transversality agree. Rational structure and graded polarizability are explicit added conditions, not claimed to be automatic in the complex definition. |
| 4.4 | Sai90 Theorem 3.21, p. 303, Sai90 lines 2769–2776; Sai88 (5.1.5.3), p. 955, line 3347; §§5.1.8–5.1.10, pp. 957–958; Proposition 5.1.14; Corollary 5.2.13, p. 969, Sai88 lines 3791–3793. | Strict-support extension from a quasi-unipotent polarizable generic variation and pure semisimplicity supported. Variation weight is `w−dim Z`. |
| 5.2 | Sai90 (4.5.1)–(4.5.2), p. 324, Sai90 lines 3513–3519; FSY Proposition A.19 and proof, pp. 66–67, FSY lines 3024–3047. | Derived degree-adjusted operation bounds agree. The abbreviated duality sentence needs R01. |
| 5.6 | Sai90 §4.4, pp. 321–323, Sai90 lines 3430–3492, especially (4.4.2); SZ §4 is uncertified. | Adjunction and rational compatibility support the stated proof via evaluation and faithful realization. The separately cited fixed-part theorem in SZ was not read. |
| 6.3 | KS Definition 7, p. 31, KS lines 1109–1113; Proposition 4 and proof, pp. 36–37, KS lines 1278–1294; FSY Appendix A.3, p. 64, FSY lines 2922–2928. | Projector tensor, unit and convolution concentration supported. This is an exponential tensor, not ordinary unprojected convolution on all MHM. |
| 7.1 | ESY (3.1.1), pp. 22–23, ESY lines 1150–1175; Proposition 3.1.2. | Rational floor/index convention, `F,V` formula and `τ−z` specialization agree with the recorded version. |
| 7.4 | Sab10 Theorem 6.1, pp. 31–32, Sab10 lines 1360–1370; Proposition 6.10 and proof, pp. 36–37, lines 1554–1608; Sab05 Theorem 6.1.1, line 6405. | Twistor projective direct-image strictness supports the route. Source exponential `E^{−t}` becomes the package's `E^{+θ}` under `t=−θ`; no weight-preservation assertion is silently inserted. |
| 7.5 | ESY Theorem 3.3.1 and Corollary 3.3.2/proof, pp. 25–26, ESY lines 1266–1311; §3.4, lines 1312–1324; Theorem 1.2.2. | Pure case and extension to mixed inputs via strict/z-torsion-free exactness support degeneration, with a mixed Hodge module before twisting. |
| 7.6 | FSY Proposition A.10 and proof, p. 65, FSY lines 2949–2960. | Strictness for the pair of weight and irregular filtrations, including morphisms, supported; not just two unrelated strictness claims. |
| 10.1 | FSY Theorem A.24 and proof, pp. 68–70, FSY lines 3090–3207; Example A.27, lines 3208–3225. | Constant and coefficient variants supported, with arbitrary zero locus. No smoothness of the zero fibre or Newton condition is introduced. |
| 12.1 | Yu §1(a–c), pp. 4–8, Yu lines 180–235, 334–359; compact definition in §2, pp. 12–13, lines 591–617; ESY §1.2 and §1.7. | Degree cutoff, floor with actual multiplicities, λ≤0 comparison and horizontal compact twist supported. Yu's separately named logarithmic subcomplex is distinguished from the pole-order filtration used here. |
| 12.2 | Yu Proposition 4.4, p. 29, Yu lines 1533–1540; Lemma 4.5/proof, pp. 30–31, lines 1549–1662. | The specified indeterminacy blow-ups and local filtered comparison supported. Yu's actual charts are codimension two; the codimension-three Checks test the separately imported general exceptional-divisor vanishing, not a claimed new Yu blow-up theorem. |
| 12.6 | AS Theorem 4.13, p. 73, AS lines 569–573; Theorem 5.1/proof, p. 74, lines 583–590, with r=0 and a=0; Yu Theorem 4.1(iii), p. 27, Yu lines 1407–1412. | Laurent rather than cone cohomology, full dimensionality, nondegeneracy and `n!·volume` agree. AS's extracted displayed formula is incomplete; the adjoining proof and readable Yu formula independently fix it. The zero-dimensional value was also computed. |

Additional changed passages were checked at ESY §2.1, p. 18 (ESY lines 944–960), Sab05's Deligne growth definition and extension construction (Sab05 lines 5340–5352, 5402–5411), the Hodge Rees/harmonic comparison (Sab05 lines 992–1028), and the source errata below. These readings establish the repaired statements' actual conditions rather than relying on the repair report's assurances.

### Pins, duplicate objects and open work

The content manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches used these checkouts, not revision hashes mentioned by other roadmaps. The following declarations/types were opened; paths are library-relative.

| Object | Pinned location and comparison |
|---|---|
| Derived carrier | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`: localization of complexes; no algebraic constructibility or perverse condition. |
| Polynomial derivative and formal series | `Mathlib/Algebra/Polynomial/Derivative.lean:47`, 228; `Mathlib/RingTheory/PowerSeries/Basic.lean:57`; `Mathlib/RingTheory/LaurentSeries.lean:101`. These supply the named elementary inputs, not geometric D-modules. |
| Laurent ring and linear maps | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64` has `coeff : M →₀ R`; `Module.lean:73` gives the additive coefficient equivalence; `Mathlib/LinearAlgebra/Finsupp/LSum.lean:96`, `Defs.lean:87`; `Mathlib/Algebra/Module/LinearMap/Defs.lean:1018`; `Mathlib/Algebra/Module/Pi.lean:87`, 115. The specialization to `Fin n→ℤ` has the intended finite-support ring, including n=0. |
| Newton geometry and volume | `Mathlib/Analysis/Convex/Hull.lean:48`; `Mathlib/LinearAlgebra/AffineSpace/AffineSubspace/Defs.lean:537`; `Mathlib/Analysis/Convex/Exposed.lean:55`. The exposed-face predicate permits the empty face and the zero functional, so the explicit exclusions are necessary. `Mathlib/MeasureTheory/Constructions/Pi.lean:349`, 660 gives Dirac volume for the empty product and product volume otherwise. |
| Pure/mixed Hodge data | `TauCeti/Geometry/Hodge/Structure.lean:62`; `Mixed/Basic.lean:72`; `Mixed/Morphism.lean:77`. The native carriers do not themselves impose finite vector-space dimension. The package adds that condition and rational graded polarizability. |
| Strictness and abelianness | `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:88`, 110, 131; `Mixed/Category.lean:56`; `Mixed/Abelian.lean:33`. Point strictness for sums of Deligne pieces and the abelian category already exist and are imported. |
| Polarization and Tate normalization | `TauCeti/Geometry/Hodge/Polarization.lean:72`, 159, 221; `Tate/Basic.lean:93`, 102; `Tate/Twist.lean:63`. Integral polarization differs from the rational form until the explicit model/scaling clause is used; twists have weight shift −2m and filtration shift p+m. |
| Native local coefficients | `TauCeti/AlgebraicTopology/LocalCoefficient.lean:46`: a functor from the fundamental groupoid to module objects, for arbitrary ring coefficients. It does not itself contain the missing finite-dimensional rational/complex sheaf equivalence. |
| Near matches to the Lean theorem | `Mathlib/Algebra/Polynomial/Laurent.lean:85` is one-variable Laurent algebra; `Mathlib/Algebra/MvPolynomial/Derivation.lean:114` concerns polynomial derivations with nonnegative exponents; `Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean:229`, 235 is analytic exterior differentiation; `Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean:140` does not establish the twisted quotient's finite-dimensionality or volume. None is the concentration theorem. |

Object searches covered regular holonomic/perverse/Hodge-module carriers, twistor and irregular filtrations, Laurent/Euler operators, twisted complexes, Newton faces, exceptional bundles, their negative twists, and relative compactification. The supplied near-match and signature files were used only as leads. No duplicate fully qualified declaration in readable sibling roadmaps was found. The elementary Laurent specialization does not claim ownership of monoid algebra or general derivations.

The board package index was read. It lists the separate heads of AnalyticNumberTheory, LawrenceVenkateshMethod, and LogicAndDefinabilityInNumberTheory; no assertion of universal absence was made from this one checkout. The local KloostermanMomentsAndPotentialAutomorphy package is also present: its specialized connections, polytopes and moments do not duplicate this general theory.

The supplied overlap report records no other PR changing this folder, no dropped cited IDs and no IDs defined only in an open revision. The command's direct lookup of this board-only package cannot identify it as an already open/main roadmap; that is not evidence overriding the supplied head-index report. The five nearest readable open heads were checked by scope and mathematical objects:

- PR #873, `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1093` onward: abstract monodromy and étale cycles, supplying the linear monodromy input rather than Betti mixed Hodge modules.
- PR #1809, `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:7`, and §§0.4, 0.9, 1.5, 4.3 at lines 275, 399, 520, 744: abelian-variety convolution and Fourier–Mukai/Mellin applications; its regular-holonomic realization is an input, not a second general RH construction.
- PR #1040, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:7`, 19: finite/adic étale coefficients and their perverse operations. The rational/complex Betti category here is a different coefficient/geometric construction; generic derived/recollement inputs remain supplied.
- PR #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12729`, 12749: generic characteristic-zero formal classification and index, imported here rather than rebuilt.
- PR #848, `TauCetiRoadmap/ComplexComparisonPartII/README.md:4438`, 4741: regular-singular connections and coefficient-specific topology/dictionaries; it does not already supply arbitrary regular holonomic RH or the rational/complex dictionary gap.

The former-numbering map also resolves the currently read consumer at PR #1644, `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md:13`, and the older lettered imports in `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:223`. No new reciprocal supplier edge was found.

### Supplier resolution, gaps and direction

Every supplier subsection, cross-roadmap citation and Needs line was read. `roadmaps resolve` reports no unresolved roadmap/name lead; its library-name limitation was covered by direct pin inspection above. The resolved locations are recorded here so that a name match is not mistaken for a mathematical contract. Open-head paths are `TauCetiRoadmap/<Name>/README.md` unless noted otherwise.

| Supplier | Sections and actual locations checked |
|---|---|
| ComplexComparisonPartII #848 | C-1.1 line 996, C5.1 operator contract at 3083, C5.6 line 4438, C6.0 line 4680, C6.1 line 4741. Separated analytic topology and arbitrary-ring compact supports agree; the finite-ring dictionary is explicitly separated from the new gap. |
| FormalConnectionsOpers | F2.2 line 707 and its symbol/PBW paragraphs: projective tangent module and characteristic zero retained. |
| SpringerResolutionAndCharacteristicCycles #1828 | §§8.2–8.5 at 855, 869, 891, 907; §§9.1, 9.2, 9.4–9.7 at 964, 990, 1016, 1038, 1051, 1075. Transfer shift, Kashiwara, finite length, middle extension and regular duality agree. The two remaining declared gaps are not claimed already supplied. |
| PadicDifferentialEquationsAndRigidCohomology #1002 | RD.6.52a line 12729 and RD.6.53 line 12749. For `E^x` on `G_m`, index is `0−1=−1`, giving H¹ rank 1, consistent with the package. |
| ShimuraData / ShimuraVarieties #933 | Pure variation/morphisms/polarization §§3.1–3.3 at lines 355, 386, 417; degeneration/norm §§3.5b.1–2 at 962, 974. The integral-lattice hypothesis is preserved; quasi-unipotent rational one-variable T has cyclotomic characteristic polynomial and admits a stable lattice. |
| LefschetzPencilsAndVanishingCycles #873 | §§1.3, 1.4, 1.5, 1.7 at 1093, 1146, 1220, 1279; §3.4 at 2410. Relative existence is not inferred from uniqueness. The normalized `N=(2πi)⁻¹log T` is distinguished from topological `T−1`. |
| ResolutionOfSingularitiesCharacteristicZero, main | §§5.1, 5.2, 6.2 at 791, 801, 893. Principalization requires a nonzero ideal at generic points; SNC completion is smooth quasi-projective. §1.5 at 130, API at 140, also gives characteristic-zero permissible-blowup smoothness. R02 isolates the overuse of §6.2. |
| StratifiedSpacesAndTameTopology #1519 / AlgebraicTopologyPartII #1694 | §§7.2–7.3 at 936, 957 / §§16.1a–16.1e at 1539, 1571, 1596, 1617, 1647. Nash/Whitney existence and proper controlled isotopy are distinct imported inputs. |
| EnhancedDerivedSheaves, main | §§0.1–0.4 at 429, 441, 455, 492, and E1.4 at 580. Ringed-site enhancements supply the ambient functors; algebraic constructibility is the new condition here. |
| SchemeAndStackFoundations, main | §§0.17, 2.2, 2.6, 2.18, 2.20, 3.3, 4.11, 4.17, 5.5 at 1310, 3420, 3554, 4104, 4452, 4917, 5820, 6389, 7109. Normal/conormal and projective-space conventions agree. Missing arbitrary-field smooth blow-up is explicitly a contract. |
| SchemeKTheoryOperations #1229 | §5.7 at 1971, exceptional identification at 1975, negative-twist vanishing at 1979. Normal line `O_E(−1)` and `0<μ<c` vanishing now have one owner. |
| AlgebraicCurves, completed main | `Completed/AlgebraicCurves/README.md:1099`, 1468: Layers 9 and 12, Laurent expansion at a place and smooth projective curve model. |
| AnalyticToricGeometry, completed main / PartII #1647 | `Completed/AnalyticToricGeometry/README.md:186`, Layer 0 items 1–9; PartII §§0.1–0.3 at 117, 143, 166. Monomial inequality `⟨m,vρ⟩+aρ≥0` matches the Newton pole convention. |
| Relative compactification owner for R02 | Main `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57`, 105, 139: compactification objects, Nagata for separated finite-type maps over qcqs bases, coherent common refinements. This is the actual general prerequisite, not a new target for this package. |

All six declared gap slugs occur with named suppliers in both the README and the plan's `gaps` list. None has supplier `none`. Their statements are precise mathematical interfaces, not free conditions:

- `holonomic-specializability`: good V-lattice, nonzero Bernstein polynomial and the quasi-unipotent rational-root refinement. Generic holonomicity/characteristic variety is not this theorem.
- `regular-holonomic-stability`: the remaining derived operations and their comparisons; supplied duality, smooth pullback and middle extension are expressly excluded from the missing cases.
- `rational-complex-local-system-dictionary`: finite-dimensional values over ℚ or ℂ, with stalk/transport and pullback compatibility. The finite-ring contract does not provide it.
- `toric-normal-fan`: fan, regular complete refinement and precise divisor-polytope identification. For `[0,1]`, the two ray coefficients are 0 and 1, giving exactly that interval.
- `toric-rounded-vanishing`: nef torus-invariant rational divisor on a smooth complete toric variety. On `P¹`, coefficients `1/2,−1/2` round to degree −1 and H¹=0; degree −2 would instead have H¹ dimension 1 and is outside the tested nef rounding instance.
- `blowup-exceptional-divisor`: now only smoothness for arbitrary fields. The existing characteristic-zero permissible-centre result does give this package's complex instances (take empty boundary and the marked ideal `(I_Z,1)`), but does not duplicate the stated arbitrary-field contract. Exceptional identification and negative-twist vanishing have been removed from this gap and imported.

The prescribed dependency check exited 0, with complete output:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No forbidden roadmap is used as a supplier. This check establishes inter-roadmap direction; it does not detect the incorrect compactification contract or the local forward reference in R02–R03. The main-roadmap compactification owner proposed in R02 introduces no upward edge.

## Not verifiable

- Verdier, Théorème 3.3 and Corollaire 5.1 (§1.1 sample): settled uncertified, so the primary stratification text could not be read. Independent examples and supplied topology were checked, not substituted for certification.
- Dimca (Betti operations, perversity and algebraic RH), Schmid (nilpotent orbit), SZ (VMHS, admissibility and §5.6 fixed part), Kash76 (b-functions), and Kou (graded acyclicity): the other five settled uncertified works. Their unavailable texts were not guessed or requested again. Available Kash86, Saito, AS and Yu were used only for their actual content.
- Zucker, cited for §3.4: waived. Its Theorems 4.8 and 7.12, Corollary 7.13 and Proposition 8.2 were not independently read.
- The AS extraction drops parts of the displayed Theorem 4.13 dimension formula. The surrounding proof and the same concentration/volume formula in readable Yu Theorem 4.1(iii) were checked; this round does not claim a fresh visual transcription of that AS display.
- Ownership checks cover the supplied main checkout, board index/local packages and readable open-head index. No unseen or unindexed head was checked. The direct overlaps lookup cannot identify this board-only package; the supplied overlap file and the actual nearest heads were read instead.

There are no newly missing texts and no new source request. These limitations do not prevent the four concrete findings or the Lean and dependency checks above.

## Source issues

- **Misprint** in FSY at Appendix A.2, printed p. 61 (FSY line 2800): the source says side change shifts the increasing filtration by minus the dimension; it should use `F_p(right)=ω⊗F_{p+d}(left)`; affects a stated result.
- **Misprint** in FSY at Appendix A.2, printed p. 62 (FSY line 2832): the source says the dual constant Hodge module has twist minus the dimension; it should have twist plus the dimension and weight minus the dimension; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p. 63 (FSY line 2876): the source says restriction of the constant perverse object is concentrated in perverse degree zero; it should be `pℚ_D[1]`, in degree minus one; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p. 71 (FSY line 3222): the source says the composite pushforward is zero; it should say the composite function is zero, with pushforward factoring through the point; affects the proof.
- **Error** in Yu at §4(a), printed p. 26 (Yu line 1377): the source says convenience makes the Laurent polynomial map proper; it should assert exhaustiveness of the Newton filtration without claiming properness of the map; affects nothing.
- **Misprint** in Yu at the footnote to Theorem 4.1, printed p. 27 (Yu line 1442): the source cites AS Theorem 4.1 for Laurent cohomology; it should distinguish the cone theorem from Laurent Theorem 4.13 or Theorem 5.1 with zero auxiliary variables; affects nothing.
- **Misprint** in MT at the discussion before Proposition A.3, printed p. 37 (MT line 2033): the source presents the localized derivative module with relation `t∂+1`; it should use `t∂` on its cyclic generator `∂⁻¹`, since `t=−d/d∂`; affects the proof.
- **Error** in KS at the proof of Proposition 3, §4.4, printed p. 35 (KS lines 1250–1255): the source assigns ambient weights n and n−1 to the projector of pure input; it should retain weight n and permit higher constant corrections, as K has weights 0 and 1; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7d6c1f368e61b6849e9f55749d0802478ebf9a3d", "job": "REV-PKG-MixedHodgeModulesAndIrregularHodgeTheory~3", "model": "gpt-6-astra", "worker": "chris-3"} -->
