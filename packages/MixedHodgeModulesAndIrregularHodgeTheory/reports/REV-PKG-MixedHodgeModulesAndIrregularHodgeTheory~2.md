# Review of MixedHodgeModulesAndIrregularHodgeTheory (package, round 2)

**Verdict:** needs changes

Eleven findings: five P1, four P2 and two P3; nine blocking. The package files were not changed. The six previous findings were checked first, including their source passages and the changed proof routes. The Lean acceptance test elaborates with only its expected `sorry` warning. That does not establish the prose identities or supplier contracts below.

## R01 (P1) — Constant Fourier corrections survive restriction

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:273`, §2.4: “changes `FT` by a constant module, invisible after output restriction.”

**Claim:** Replacing the input extension by the middle extension leaves the Fourier transform on the output torus unchanged.

**Witness:** Input `O_{G_m}`: `j_!*O=O`, whose Fourier transform restricts to zero. From `0→O→O(*0)→δ₀→0`, Fourier transformation and restriction give `j^+FT(j_+O)=O_{G_m}`, of rank one.

**Repair:** Delete the invisibility assertion. State that the comparison kernels and cokernels are constant connections after Fourier transformation, and generally survive restriction to the output torus. Keep the specified `j_+` in the definition. Add the computed negative control above: output ranks are respectively 1 and 0. This also agrees with §6.6, where Fourier localization kills punctual modules, not constant connections. The comparison between `j_!` and `j_+` likewise cannot be replaced by an asserted canonical isomorphism after restriction.

## R02 (P1) — Rees of the cokernel is not cokernel of the Rees map

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:371`, §4.1: “strict exactly when the Rees module of its cokernel has no `z`-torsion.”

**Claim:** Torsion freeness of the Rees module of the filtered cokernel detects strictness.

**Witness:** Identity `u:ℂ→ℂ`, source filtration starting at 1 and target at 0: `u(F₀)=0≠ℂ=im(u)∩F₀`. Its filtered cokernel and its Rees module are zero, hence torsion free.

**Repair:** Replace the criterion by torsion freeness of `coker(R_F u:R_F M→R_F N)`. In the same example this cokernel is `ℂ[z]/zℂ[z]`, with nonzero `z`-torsion; for equal starting filtrations it is zero and the map is strict. The corrected criterion distinguishes the two examples. Keep the existing shifted-identity Check, but compute both cokernels explicitly. Sai88 §2.1 and ESY §2.1 concern the graded Rees-module category; they do not identify these two cokernels for a nonstrict map.

## R03 (P1) — Springer supplier identifiers and ownership have changed

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:72`, also lines 24, 192, 214, 232, 266, 371, 405, 423, 433 and 482: “Layer D: differential-operators … Layer H: transfer-and-duality”.

**Claim:** The cited lettered layers and targets supply the differential-operator and holonomic interfaces.

**Witness:** SpringerResolutionAndCharacteristicCycles PR #1828, `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:832`, has §§8–9, not Layers D/H; line 834 imports operators from ComplexComparisonPartII C5.1 and PBW from FormalConnectionsOpers F2.2. No former-numbering map occurs.

**Repair:** Resolve every occurrence to its actual owner. Operators: ComplexComparisonPartII C5.1 (`README.md:3083`); PBW: FormalConnectionsOpers F2.2 (`README.md:707`, especially 731–738). Springer §§8.2–8.5 supply Noetherianity, good filtrations, existence/comparison and characteristic varieties; §§9.1, 9.2, 9.4, 9.5, 9.6, 9.7 supply transfers, Kashiwara, holonomicity, length, middle extension and regularity. Update scope, contracts, Needs and dependency summaries consistently, and the section locators of the two Springer gaps in the plan's permitted `gaps` field. Keep the genuine missing specializability/stability requirements declared as gaps.

The replacement contracts reproduce `[∂,x]=1`, `gr D_{A¹}=ℂ[x,ξ]`, the closed-point module `ℂ[∂]δ` with `x∂δ=−δ`, and the inverse-image shift `dim Y−dim Y′`; no convention change is required. Both actual foundational owners precede this package. This is supplier drift, not a claim that a declared gap must already be filled.

## R04 (P1) — The stratification supplier no longer owns the cited layers

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:100`, also lines 31, 130 and 206: “Layer 5 (§5.2 Whitney's condition (b) …); Layer 8”.

**Claim:** StratifiedSpacesAndTameTopology Layers 5 and 8 supply control data, isotopy and Whitney strata.

**Witness:** PR #1519, `TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md:612`, calls Layer 5 manifolds with corners; Whitney strata are §§7.2–7.3 at lines 936, 957. Control data and isotopy are imported from AlgebraicTopologyPartII §16.1.

**Repair:** Cite StratifiedSpacesAndTameTopology §§7.2–7.3 for definable/Nash Whitney strata, and AlgebraicTopologyPartII §§16.1a–16.1e for condition (b), tubes, existence of control data, controlled lifts and the first isotopy lemma. PR #1694 has those exact headings at `TauCetiRoadmap/AlgebraicTopologyPartII/README.md:1539`, 1571, 1596, 1617 and 1647. Add that exact supplier contract and update §1.1's Needs and the dependency summary. No old-to-new map in #1519 repairs the present citations.

The actual isotopy statement retains properness and a controlled submersion. On the punctured plane, rotation has `d(x²+y²)(−y,x)=0`, whereas radial dilation has derivative `2(x²+y²)≠0`; the corrected supplier distinguishes the required control condition. AlgebraicTopologyPartII precedes this package in the order.

## R05 (P2) — The local-system dictionary is imported at unsupported coefficients

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:80` and §3.1 line 305: “§C6.1 (local systems and the dictionary with `TauCeti.LocalCoefficientSystem` … this roadmap uses it with the rings `ℚ` and `ℂ`)”.

**Claim:** C6.1 supplies the native-functor/sheaf local-system dictionary for the rational and complex coefficients used here.

**Witness:** ComplexComparisonPartII PR #848, `TauCetiRoadmap/ComplexComparisonPartII/README.md:4744`, assumes a finite commutative coefficient ring and finite stalks for this dictionary. The arbitrary-ring clause at lines 4796–4797 applies to compact supports instead.

**Repair:** Split the two contracts. Keep the arbitrary-ring compact-support import. Declare precisely the missing sheaf/native-functor dictionary for finite-dimensional rational and complex local systems, on locally path-connected semilocally simply connected spaces, with stalk and transport compatibility, under the existing dictionary owner C6.1; or cite an actual earlier owner supplying this coefficient generality. C5.6's regular-singular complex connection correspondence alone does not establish the rational native-functor dictionary. Do not replace rational coefficients by finite rings.

Test: on a point the required rank-one object has stalk `ℚ` (respectively `ℂ`), of vector-space dimension 1 but infinite cardinality. It satisfies the intended corrected contract and is outside the cited finite-ring/finite-stalk contract. The pinned `TauCeti.LocalCoefficientSystem` accepts arbitrary rings; that carrier does not itself give the sheaf equivalence.

## R06 (P2) — Two supplier gaps include results already supplied

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:110`, line 76 and §12.2 line 1002; corresponding entries of `design/plan.json`: “the identification … `P(N_{Z/X}) = Proj(Sym(I/I²))` … normal line … `O_E(−1)`”.

**Claim:** All the exceptional-divisor identification/signs are missing, and §12.2 must prove the negative-twist vanishing; regular holonomic duality is also requested as missing.

**Witness:** SchemeKTheoryOperations PR #1229, `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1975`, identifies the exceptional projective bundle and signs; line 1979 supplies `Rp′_*(O(−i)⊗Lp′*G)=0`, `1≤i≤d−1`. Springer PR #1828, `README.md:1079`, supplies regular duality.

**Repair:** Import SchemeKTheoryOperations §5.7 for the exceptional bundle, `O(−E)|_E=O_E(1)`, normal line and negative-twist vanishing; it is earlier in the merge order. Remove the duplicate proof target in §12.2, retaining its application to the filtered comparison and its Checks. Narrow `gap:blowup-exceptional-divisor` to the remaining smoothness assertion if no earlier smoothness theorem is cited. Update the same slug's `needs` in `plan.json`. Likewise import regular holonomic duality and smooth pullback from Springer §9.7 and narrow the stability gap to the missing general operations/comparisons; do not re-request the supplied cases as missing.

For the exceptional fibre over the origin of `A²`, §5.7 gives `P¹`, normal degree −1 and `RΓ(O(−1))=0`; taking `G=O_Z` gives exactly the input used in §12.2. At codimension 3 it gives vanishing for `O_{P²}(−1)` and `O_{P²}(−2)`. These are the same objects, not merely analogous results. The previous repair's assertion that no open roadmap states the identification is refuted by #1229. Its original unowned-import defect was addressed by a declared contract, but the new contract is not minimal. This finding does not object to the absence of genuinely missing supplier work.

## R07 (P2) — The harmonic-bundle construction drops Deligne type

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:701`, §7.3: “the minimal extension of a tame harmonic bundle on a punctured curve … is a polarizable regular twistor `D`-module”.

**Claim:** Sab05 Theorem 5.0.1 and its proof provide the assertion for every tame harmonic bundle with its given metric.

**Witness:** Sab05 lines 5351–5352 define Deligne type by equality of the metric's parabolic filtration and the canonical filtration. Lines 5402–5411 construct the extension and its converse with this condition explicitly imposed.

**Repair:** State the cited construction for tame harmonic bundles of Deligne type, define this condition, and state the precise Hodge-metric specialization used for pure Hodge modules. If the general tame-metric extension is retained as an additional target, give its distinct extension notion and a source/proof route supporting that generality; it is not the cited Sab05 construction.

Discriminating test: the trivial flat line on `ℂ×` with flat-frame norm `|t|^a`, `a∉ℤ`, is harmonic and tame; its growth filtration jumps at `a+ℤ`, whereas the canonical filtration for zero residue jumps at `ℤ`. For `a=0` the filtrations agree. The corrected hypothesis accepts the latter and excludes the former from the cited construction. A metric-free minimal extension of the underlying connection must not be silently identified with extension of the given harmonic data.

## R08 (P1) — Twistor weights are conflated with Hodge-module weights

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:701`, API line 705 and Check line 713: “the trivial twistor triple … degrees `−1` and `1` of weights `0` and `2`”.

**Claim:** The Sab05 harmonic construction preserves Saito's Hodge-module weight, and the unmodified trivial triple on `P¹` has Hodge-module weight 1.

**Witness:** Sab05 lines 2009–2012 and 5403–5407 give the harmonic triple weight 0. Theorem 6.1.1, lines 6405–6408, with line 1834 gives direct-image weights `0+j`; at `j=−1,1` these are −1 and 1.

**Repair:** Specify the twistor normalization separately from the Hodge-module normalization of §4.3. One concrete repair sufficient for §7.4 is to use Sab05's weight-zero harmonic triple, retain strictness of its projective direct image, delete the unsupported weight-preservation assertion, and give the trivial triple's twistor weights −1 and 1. Keep the Hodge-module calculation `pℚ_{P¹}` of weight 1 and direct-image Hodge weights 0 and 2 in §4.5. Alternatively explicitly construct and verify a normalization changing the triple, including any half Tate twist, before claiming preservation; it cannot still be the unmodified trivial triple.

The two-term test fixes the distinction: the source uses shifted de Rham degrees (Sab05 lines 596–597, 804), so the nonzero degrees really are −1 and 1. A twistor twist `(−1/2)` raises weight by 1 (Sab05 lines 1380–1382); it changes the object and is not presently specified. Neither §7.4's strictness nor the main irregular-degeneration theorem requires the erroneous equality of these two weight conventions.

## R09 (P3) — Correct the definition and strictness locators

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:305`, 371 and 717: “Kash86, §1.4 and §1.9”; “ESY, §2.2”; “Proposition 6.10 … pp. 35–36”.

**Claim:** These locators identify, respectively, the VMHS definition, the Rees construction, and the full strictness proof in the recorded versions.

**Witness:** Kash86 §1.6, lines 78–85, defines VMHS; §1.4 is the point definition and §1.9 admissibility. ESY lines 944–960 put Rees modules in §2.1. Sab10 lines 1554–1605 place Proposition 6.10 across pp. 36–37.

**Repair:** Cite Kash86 §1.6, printed p. 993, for §3.1, preserving §1.4 only for fibres and §1.9 for admissibility. Cite ESY §2.1, p. 18, for the Rees construction. In §7.4 cite Sab10 Proposition 6.10 and proof, pp. 36–37, and extend the §6 range through p. 37, using the manifest's arXiv v3 numbering. Theorem 6.1 at pp. 31–32 is correct. Test by opening each stated locator: each repaired location now contains the relevant definition/formula, rather than its neighboring construction.

## R10 (P2) — The monomial-section identity needs a nonnegative cutoff

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:1046`, §12.4: “the span of the `x^m` with `h(m) ≤ a` is `H⁰(X_Σ, O(⌊aP⌋))`”.

**Claim:** The identity is stated without a range for `a`.

**Witness:** In dimension 0, with any constant polynomial, `Δ={0}`, `h(0)=0`, `X_Σ=pt`, `P=0`. At `a=−1` the left side is zero; the right side is `H⁰(pt,O)=ℂ`.

**Repair:** State `a≥0` (rational for the rational Newton filtration) and retain the restriction to lattice points in the cone where the gauge is defined. Add this negative-cutoff Check, including `n=0`. At `a=0` both sides are `ℂ`; at `a=−1` the identity is deliberately not asserted. This is exactly the range `a=q−λ≥0` used by the filtered complex, whose terms were already defined to vanish when `q<λ`. Do not exclude the zero-dimensional torus from the headline theorem.

## R11 (P3) — Consumers still cite the discarded lettered numbering

**Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:480` and 497, the new §§5.1–5.2; no former-numbering map occurs in the README.

**Claim:** The new numeric organization is usable by existing named consumers without a compatibility map.

**Witness:** EllAdicHomotopyTypesAndWeights PR #1644, `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md:13`, cites `H.1/operations` and `H.1/weight-bounds`. `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:223` cites the former Layers D, F, H.0–H.1, E, I, C, P, G, T and N.

**Repair:** Add an explicitly labelled former-numbering map. In particular `H.1/operations→§5.1`, `H.1/weight-bounds→§5.2`; F→Layer 2, H.0's Hodge-module targets→Layer 4 (its curve-L² target→§3.4), H.1→Layer 5, E→6, I→7, C→8, P→9, G→10, T→11, N→12. Map individual shifted targets where a layer has gained targets. Former D's formal classification/index targets now point to PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a–RD.6.53, not new duplicate targets here. The old headings can be verified in this package's `design/README.md:202`, 286, 452 and 674 onward. Following the two explicit #1644 citations through this map reaches exactly the operations and weight-bound statements required. No consumer files need be edited in this package.

## Verified sound

### Previous findings, checked before the new pass

| Earlier finding | Repaired passage and independent check | Status |
|---|---|---|
| F01 exceptional-divisor prerequisite | README line 110 now says “What SchemeAndStackFoundations must provide (gap:blowup-exceptional-divisor)”; §12.2 says “over an affine open … `E` is `P^{c−1}_A`”. The slug and full contract occur in `design/plan.json`. On `Bl₀A²`, normal degree −1 and `H^•(P¹,O(−1))=0` are correct. | Partly repaired: no longer an undeclared import; R06 finds existing ownership that makes the new contract nonminimal. |
| F02 strict-support locator | README line 423 now cites “Sai90, Theorem 3.21, p. 303”. Sai90 line 2769 gives the extension equivalence with variation weight `w−dim Z`; the accompanying Sai88 strictness/semisimplicity locators were opened. | Repaired. |
| F03 Laurent/cone locator | README §12.6 and both Lean docstrings now cite “Theorem 4.13 and Theorem 5.1 with `r = 0` and `a = 0`”, distinguishing Theorem 4.1. AS lines 569–590 and the rendered formula pages agree. | Repaired. |
| F04 missing Needs | §§3.1, 3.3 and 12.4 now each have a `*Needs:*` line. There are 64 target sections and 64 target Needs lines. | Repaired as a shape issue; R05 checks the new §3.1 citation's coefficient scope, and R10 checks the Newton API. |
| F05 manifest | `Kou` now has “Polyèdres de Newton et nombres de Milnor”; all 21 entries have `cited_for`, including Sai88, Sai90, Kash86, AS and Zucker. TOML parses. | Repaired. |
| F06 downstream claim | README line 1117 says SheafConvolutionOnAbelianVarieties “needs, in its §§0.4, 0.9, 1.5 and 4.3, the equivalence”. PR #1809 has those sections at README lines 275, 399, 520 and 744 and still requests the holonomic comparison. | Repaired: this is a mathematical need, no longer a claim that the consumer already cites this package. |

No previous finding was marked “not actionable in this package”; none is being re-raised against a settled exemption. The search for repaired patterns covered all supplier contracts, every Needs line, all 21 source entries, the three downstream bullets, and the other uses of Rees, Fourier restriction, Tate signs and exceptional divisors.

### Principles, shape and acceptance-test coverage

The package develops a general rational Hodge and exponential theory; it does not impose a Kloosterman-only route, good-prime restriction or computational algorithm. No existing main-roadmap folder with this name was found. Existing point Hodge theory, monodromy theory, formal curve classification, and basic algebraic operators are treated as imports, subject to R03–R06. No copied source passage was detected in the compared texts. No executable algorithm or new API catalogue occurs in the Lean file.

The README has the required opening, scope, conventions, contracts and build guide, twelve layers, twelve Examples subsections and twelve Dependencies subsections. Its 27 definition/construction sections contain 28 API/Checks blocks, because §12.4 has two definitions; each has at least three Checks. These counts do not certify the correctness of the offending Checks in R01, R02 and R08. Every target has a locator and a Needs line, although R09 repairs specific locators. No machine paths, pull-request numbers, HTML anchors, workflow narrative, LaTeX delimiters or `set_option` occur in the deliverable README/Lean. Two examples of main-roadmap shape were read in ResolutionOfSingularitiesCharacteristicZero and EnhancedDerivedSheaves, with SchemeAndStackFoundations also used throughout the supplier audit.

The summary's end theorems are: Saito's projective direct-image and abelianness/strictness theorems (§§4.5, 4.7); irregular `E₁`-degeneration and bifiltered realization (§§7.5–7.6); classicality of `tg` (§10.1); Fourier costalk and pure Hodge-number formulas (§§11.2–11.3); infinity weights of the projector (§11.6); Laurent concentration/volume (§12.6); Newton–Hodge comparison (§12.7). The additional major interfaces are regular Riemann–Hilbert, Zucker, strict-support extension, weight bounds, the exponential projector/tensor/fibre and the logarithmic independence and filtered Künneth/duality results. The Lean module docstring names the missing carriers for these groups of headlines. The Laurent concentration/volume theorem is statable and is stated. The others require genuine regular holonomic/perverse/Hodge-module, VMHS, Deligne-filtration or twistor carriers absent from the pins; they have not been replaced by arbitrary predicates or algebraic stand-ins.

`Suggested.lean` has 13 declarations: twelve definitions/abbreviations with real bodies and one theorem. All thirteen elaborated types were checked with `#check @name` in a scratch copy and compared with §12.4/§12.6; no hypotheses disappeared. The theorem explicitly binds `hfull` and `hnd`; there is no section-variable block. Its natural-degree coboundaries use `p+1=q`, so degree zero has no spurious predecessor. The only import is `import Mathlib`. No sorry'd data, `lemma`, admitted example, options or duplicate fully qualified name was found.

The actual acceptance-test elaboration, run from the pinned content checkout with the prescribed `lake env lean` command, exited 0 and emitted only:

```text
Suggested.lean:146:8: warning: declaration uses `sorry`
```

All admitted declarations were tested for padding: there is exactly one. In a scratch copy, `rfl`, `simp`, and `infer_instance` each failed to close `twistedDeRham_concentration_finrank`. The last branch reports that the conjunction is not a typeclass goal. The pinned near-matches below do not supply a single-lemma `exact` proof. This is the general AS concentration theorem, not a definition, small-value computation or README Check. No padding deletion is requested.

### Computed adversarial record

The earlier review's computed rows were reused only for unchanged targets they actually instantiated. All sampled targets were re-read at their sources; the changed material and sections previously only summarized received a fresh pass. The following compact table records the seeded sample, all end-theorem families, every mathematical finding, and the additional definition/convention tests. `K=j_!pℚ_{G_m}`; all unspecified vector-space dimensions are over `ℂ`. A passing example is evidence for a normalization or hypothesis, not a proof of the general theorem.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| §1.1 algebraic stratification | `x↦x²`; proper identity | Over `G_m`, derivative `2x≠0`; origin maps point to point; identity fibres are points. Real axis in `ℂ` is not a complex algebraic stratum. | Statement consistent; actual control supplier corrected by R04. |
| §§1.2–1.3 Betti and perverse conventions | `A¹`, point, node `xy=0` | `H⁰(A¹)=ℚ`, `H²_c(A¹)=ℚ`; `i₀^!ℚ=ℚ[−2]` versus stalk `ℚ`; perverse constant is `ℚ[1]`, not `ℚ`; node constant stalk rank 1 versus normalization rank 2. | Retain. |
| §1.4 shifted cycles | `f=t`, `t²`, punctual object | `pψ_t pℚ=ℚ`, `pφ_t pℚ=0`; `t²` has nearby eigenvalues `1,−1`; punctual object has nearby 0 and vanishing fibre `V`. | Retain all eigenvalues and shift −1. |
| §1.5 regular RH | trivial connection, delta, `E^t` | `pDR(O_{A¹})=ℂ[1]`, `pDR(δ₀)=ℂ₀`; analytic `E^t` has rank-one constant solutions but irregular pole order 2 at infinity, so is excluded algebraically. | Boundary regularity essential; R03 repairs input ownership. |
| §2.1 exponentials | `f=0,t,t²`; opposite twist | Operators `∂`, `∂+1`, `∂+2t`; on `ℂ[t]`, cohomology dimensions `(1,0)`, `(0,0)`, `(0,1)`; `E^f⊗E^{−f}` has differential `d`. | Positive sign correct. |
| §§2.2, 2.5 Fourier and duality | `δ_a`, `O`, Kummer exponent `α` | `FTδ_a=E^{at}`, `FTO=δ₀`; square sends `a→−a`; `τ∂_τ−α` transforms to `−(t∂_t+1+α)`; dual of `E^{at}` is `E^{−at}`. | Retain sign involution. |
| §2.3 convolution | two deltas; `O⋆O` | `δ_a⋆δ_b=δ_{a+b}`; `O⋆O=O[1]`; transformed derived tensor has `Tor₀(δ₀,δ₀)=0`, `Tor₁=δ₀`, hence `δ₀[1]`. | Derived tensor and negative constant cohomology necessary. |
| §2.4 extension comparison | input `O_{G_m}` | `j^+FT(j_!*O)=0`; `j^+FT(j_+O)=O_{G_m}`, ranks 0 and 1. Constant output restriction remains rank 1. | Fails; R01. |
| §3.1 variation and polarization | constant `ℚ(1)`; nonflat weight line | Weight −2; `F^{−1}=ℂ`, `F⁰=0`; positivity factor `i^{2(−1)−(−2)}=1`. Line `ℂ(1,t)` varies inside a constant rank-two system and is not flat. | Definition discriminates; R05/R09 repair supplier/locator. |
| §3.2 full limiting space | constant, rank-one `T=−1`, unipotent size 2 | `N=0` for constant; eigenvalue-one subspace for `T=−1` is 0 while full nearby rank is 1; a weight-one size-two degeneration has weights 0,2. | Retain full nearby space. |
| §3.3 admissibility | `Ne₁=e₀`, `W₀=ℚe₀`, `W₁=ℚ²` | Induced N on each `gr^W` is 0, forcing relative centres 0,1; then `N(M₁)⊄M_{−1}=0`. Constant variation has `N=0`, relative filtration `M=W`. | First example excluded, second admitted. |
| §3.4 Zucker | constant system on genus-g projective curve; rank-two Legendre | Constant `dim H¹=2g`, weight 1; Legendre parabolic Euler characteristic `−2+1+1+0=0`, with `H⁰=H²=0`, so `H¹=0`. | Checks consistent; primary text waived. |
| §4.1 strictness | shifted identity on a line | At step 0, `uF₀=0` but `im u∩F₀=ℂ`; `R(coker u)=0`, `coker(Ru)=ℂ[z]/(z)`. | Fails as written; R02. |
| §4.1 side change | constant curve and punctual V | `F_{−1}ω=ω`, `F_{−2}ω=0`; `F_{p+1}(i_+V)/∂=F_pV`. Opposite side-change sign starts ω at +1. | Package sign correct; FSY source slip recorded below. |
| §4.2 V-filtration | `x^k`, Kummer `x^ke`, delta | Euler eigenvalues `k`, `k+a`, `−1−k`; increasing indices `−k`, `−a−k`, `1+k`; delta contributes zero nearby cycles, one vanishing line. | Retain. |
| §4.3 pure Hodge modules | constant on curve; Tate point | Weights `1` and `−2m`; nearby constant weight `1−1=0`. An unpolarizable weight-one rank-four rational torus structure satisfies opposition but fails polarization. | No vacuous pure-triple definition. |
| §4.4 strict support | trivial versus monodromy −1 on punctured line | Trivial middle extension `pℚ_{A¹}`; `j_*` additionally has `δ₀ℚ(−1)`. For `T=−1`, kernel and cokernel of `T−1` both 0, hence all three extensions agree. | Correct repaired locator. |
| §4.5 projective direct image | `P¹→pt`, `Bl₀A²→A²` | Degrees −1,1 have weights 0,2; blow-up gives `pℚ_{A²}⊕δ₀ℚ(−1)`, both weight 2; Lefschetz twist makes weight `2−2=0` on the right. | Retain projectivity and twist. |
| §§4.6–4.7 mixed and strict | nonsplit Kummer extension; `δ₀ℚ↪K` | `Ext¹(ℚ,ℚ(1))=ℂ/(2πiℚ)≠0`; `W₀K=δ₀ℚ`, so image and intersection both equal that line, despite nonsplitting. | Mixed category is not asserted semisimple. |
| §5.1 operations | `pℚ_{A¹}`, diagonal tensor | Dual `pℚ(1)` has weight −1, versus erroneous twist −1 giving weight 3; `Δ^*(ℚ[2d])=pℚ[d]`. | Hodge tensor distinct from unshifted O-tensor. |
| §5.2 weights | `G_m→pt`, `P¹→pt` | Middle ordinary weight 2≥1, compact weight 0≤1; proper case weights exactly `1+j`. | Nonproper purity correctly not claimed. |
| §5.3 cycles and N | constant curve; residue block R with R²=0 | Nearby weight 0, vanishing 0; `T=exp(−2πiR)=1−2πiR`, so `(2πi)⁻¹log T=−R`. | Sign agrees with C5.6 and normalized variation. |
| §5.4 pure costalk | constant curve, punctual V, size-two Jordan block | `i^!pℚ=ℚ(−1)[−1]` versus `i^*pℚ=ℚ[1]`; punctual costalk V; `dim coker N=1` for rank-two N of rank 1. | Smooth and singular formulas distinguished. |
| §5.5 divisor sequence | origin in line; node in plane | Kernel in `j_!pℚ→pℚ` is `δ₀ℚ`; node complement retracts to `(S¹)²`, giving local supported ranks 2,1 in consecutive relevant degrees instead of a single rank-one smooth-divisor term. | Smoothness retained for ordinary purity. |
| §5.6 rigidity | constant local system `ℚ^r` on connected smooth X | `H⁰(X,L)=ℚ^r`, evaluation is identity on every fibre; on disconnected two-point X it is `ℚ^{2r}→ℚ^r`, not an isomorphism. | Connectedness is used. |
| §6.1 exponential category | K, constant, delta | `RΓ(K)=fib(ℚ→ℚ)[1]=0`; `RΓ(pℚ)=ℚ[1]≠0`; `RΓ(δ₀)=ℚ≠0`. | Acyclicity is derived, not absence of punctual subobjects. |
| §6.2 projector | delta, constant, K | `Πδ₀=K`, `Πpℚ=0`, `ΠK=K`; maps from constants to an acyclic object have Hom 0 by adjunction. | Idempotent reflector and unit direction correct. |
| §6.3 exponential tensor | K and projected deltas | `K⊗_E K=K`; `Πδ_a⊗_EΠδ_b=Πδ_{a+b}`; underlying fibres `ℂ⊗ℂ=ℂ`. | Unit is K, not δ₀ in EMHS. |
| §6.4 exponential weights | K; constant presentation addition | Ambient graded weights of K: 0,1; exponential filtration: one weight 0. Adding a constant to a presentation adds zero after Π at every weight. | Presentation independence consistent; KS error adjudicated. |
| §§6.5–6.6 fibre and localization | constant, delta, K | `∂+1` bijective on polynomials, giving fibre 0 for constant; `ωδ_a=ℂ`; `FTK=O(*0)`, fibre at 1 is ℂ; `δ₀(*0)=0` but `O(*0)≠0`. | Also refutes R01's invisibility. |
| §7.1 Deligne filtration | `δ₀ℚ(−1)`; infinity coordinate | `F¹=ℂ`, `F^{1+ε}=0`; derivative of `e^{1/x}` is `−x⁻²e^{1/x}`. | Rational ceiling and exponential sign correct. |
| §7.2 specialization | `τ=z`; `x=θ⁻¹` | `z∂_θ+τ=−zx²∂_x+τ`; quotient `τ=z` produces `z(∂_θ+1)`, whereas `τ=1` gives `z∂_θ+1`. | Correct specialization; α=0 retained. |
| §7.3 tame input | trivial flat line, norm `\|t\|^a` | Canonical jumps ℤ; metric jumps `a+ℤ`. At a=0 they coincide, at a=1/2 they do not. | R07 adds the source's missing condition. |
| §7.3 weights | unmodified trivial triple on P¹ | Fibre twistor bundle O has degree/weight 0; direct-image weights −1,1. README claims 0,2, the Saito weights of `pℚ_{P¹}`. | Fails; R08 separates conventions. |
| §7.4 pure strictness | delta V and constant on A¹ | Delta gives inclusions `F^pV↪V`, kernels 0; constant has zero twisted hypercohomology, so every injected filtered group is 0. | Source supports strictness; page repair R09. |
| §7.5 mixed E₁ | `0→δ₀ℚ→K→pℚ→0` | Twisted fibres form `0→ℂ→ℂ→0`; at λ≤0 both nonzero filtered terms are ℂ, at λ>0 both 0; connecting maps are 0. | Nontrivial ambient extension does not obstruct strict fibre. |
| §7.6 bifiltered strictness | `δ₀ℚ→K`; `pℚ→j_*pℚ` | First fibre map identity, weight/Hodge jump 0; second `0→ℂ`, image and every image/intersection both 0. At a point use Deligne-piece bidegrees `r≥p,r+s≤n`. | Strong intersection equation, not two separate strictness claims. |
| §§8.1–8.2 classical embedding | Tate lines, translated delta | `I(ℚ)=K`, weight 0; `I(ℚ(m))` jump −m; for a≠0, `φ_{θ,1}Πδ_a=0` while its fibre has dimension 1. | Integral jumps alone do not imply classicality. |
| §9.1 pair definitions | point; `(A¹,0)`; `(A¹,t)` | Point `H⁰=H⁰_c=I(V)`; zero function on line has ordinary degree 0 and compact degree 2 with twist −1; identity function gives all 0. | Shift `r−d` correct. |
| §9.2 fibre normalization | punctual coefficient inside d-fold | Unshifted de Rham class occurs in degree d; `r−d=0` selects the same punctual perverse direct image. On `(G_m,x)`, both fibres have dimension 1. | Supported coefficients keep ambient d. |
| §9.3 Künneth/duality | two `(G_m,x)`; same versus opposite sign | Product ordinary `I(ℚ(−2))`, compact `I(ℚ)`; opposite-sign pairing targets `I(ℚ(−1))`; same-sign cup targets `H²_c(G_m,2x)=0`. | Dual exponential sign indispensable. |
| §9.4 lowest-weight criterion | `(G_m,x)`; `(A¹,x²)` | First: `gr₁H¹_c=gr₁H¹=0`, middle=`W₁H¹=0`. Second: each central group is a one-dimensional weight-one object and map is an isomorphism. | Both sides of iff agree in zero and nonzero cases; source proof also read. |
| §9.5 divisor sequences | zero in A¹; singular node | Compact boundary gives `H¹_c(G_m,x)=I(ℚ)`; ordinary boundary gives `H¹=I(ℚ(−1))`; node requires ranks 2,1 of supported cohomology. | Singular divisor not substituted into smooth formula. |
| §9.6 torus sums | k=0,1,2 | k=0: dimension 1, comparison identity; k=1: jumps 1 and 0, comparison 0; k=2: jumps 2 and 0, dimension `2!·(1/2)=1`, comparison 0. | Boundary k=0 expressly separated. |
| §10.1 classicality of tg | g=0,1,x | g=0: classical ordinary `H^r(V)`, compact `H_c^{r−2}(V)(−1)`; g=1: all zero; g=x on A¹: one classical degree-two line of twist −1. | No assumption that every zero locus is a smooth divisor. |
| §10.2 zero locus | g=x; g=xy; g=0 | Smooth point: degree-two `ℚ(−1)`; node: `H²_Z(A²)=ℚ(−1)²`, `H³_Z=ℚ(−2)`; g=0: support all V, no codimension-one shift. | Ordinary supported cohomology essential. |
| §11.1 Fourier classicality | delta, constant, translated delta | `FTδ₀=O`: H⁰ dimension 1; `FTO=δ₀`: H¹ dimension 1; `FTδ_a=E^{at}`, a≠0: all 0. | Allowed degrees 0,1 agree. |
| §11.2 costalk comparison | K and smooth constant | `FTK=O(*0)` has H⁰=H¹=ℂ; `i₀^!K` has ℚ and ℚ(−1) in degrees 0,1. Smooth constant has only costalk degree 1, twist −1. | Costalk, not stalk. |
| §11.3 pure Hodge numbers | smooth constant; unipotent block 2 | Smooth Hodge jump 0 becomes Fourier degree-one jump 1; singular size-two block has `dim coker N=1`, generic rank 2. | Smooth-point hypothesis retained. |
| §11.4 projector correction | δ₀ and nontrivial Kummer system | `Πδ₀=K` has quotient pℚ weight 1; Kummer monodromy −1 has zero global cohomology and correction 0. | Pure correction need not vanish. |
| §11.5 stationary phase | O and δ_a | `φ_{0,1}FTO=ℂ=ψ_{∞,1}O`; `φ_{0,1}FTδ_a=0=ψ_{∞,1}δ_a`. For δ₀, original finite vanishing cycles are ℂ, so comparing those would be wrong. | Source comparison and orientation agree. |
| §11.6 infinity weights | δ₀; blocks of lengths 1 and 3 | For δ₀, ψ∞K is a line of weight 0, N=0, correction pℚ weight 1. For original nearby blocks 1,3, primitive tops have weights `w−1,w+1`; corrected constant pieces weights `w+2,w+4`. | All primitive parts retained; centres w and w−1 distinct. |
| §12.1 pole-order complex | point; `(G_m,x)`; `(A¹,x²)` | Point F⁰=ℂ, F^{>0}=0; `(G_m,x)` ordinary jump 1 and compact jump 0; `x²` pole multiplicity 2 allows jump 1/2. Compact horizontal divisor differs from full boundary. | Formula agrees with Yu and ESY. |
| §12.2 filtered blow-up | c=2,μ=1; c=3,μ=1,2; μ=c=2 | Cohomology of `O_{P¹}(−1)`, `O_{P²}(−1)`, `O_{P²}(−2)` is 0; `H¹(P¹,O(−2))=ℂ`; opposite sign gives `H⁰(P¹,O(1))=ℂ²`. | Mathematics sound, ownership R06. |
| §12.3 model/Deligne comparison | point; torus line; quadratic affine line | Both models give jumps 0; ordinary 1/compact 0; and 1/2 respectively. | Keeps rational, not rounded, filtration. |
| §12.4 Euler and complex definitions | n=0,1,2; φ=x; all-positive signs | n=0: ring ℂ, differential 0, top quotient ℂ. n=1: `D(x^m)=mx^m+x^{m+1}`. n=2,φ=0,ω=xy: correct d²=0; all-positive d²=2xy. | Real definitions identify intended complex. |
| §12.4 Newton definitions | φ=x, x+x⁻¹, (x+y)²; empty face | Polytopes `[0,1]`, `[-1,1]`; heights m on nonnegative cone and absolute value m. At `(x,y)=(1,−1)`, both edge Euler derivatives of `(x+y)²` are 0. Empty face is explicitly excluded. | Full dimensionality and face nondegeneracy discriminate. |
| §12.4 monomial-section cutoff | n=0,a=−1,0 | At −1: span=0, section space=ℂ. At 0: span=ℂ=section space. | Fails unrestricted cutoff; R10. |
| §12.5 graded acyclicity | φ=x; (x+y)²; n=0 | First graded derivative x is regular, quotient dimension 1; degenerate edge shares factor x+y, so sequence not regular; n=0 Koszul complex ℂ in degree 0. | CM/regular-sequence step not bypassed. |
| §12.6 Lean headline | n=0; x on G_m; x+x⁻¹; x on `(G_m)²` | n=0: `1=0!·1`; x: `dim H¹=1=1!·1`; x+x⁻¹: `dim H¹=2=1!·2`; unused second variable: `dim H¹=dim H²=1`, full-dimensionality false. | General theorem, correct zero-dimensional volume. |
| §12.6 junk degrees/degenerate φ | q=0, q>n; φ=0,n=1 | Coboundaries at 0 are 0 by empty `p+1=0`; forms above n are 0; for φ=0, `dim H⁰=dim H¹=1`, Δ={0} not full dimensional. | No natural-subtraction or finrank-zero loophole; finite dimension explicit. |
| §12.7 Newton=irregular | x on G_m; convenient x+x⁻¹ | Cone complex for x has top class 1 of gauge 0 and filtration jump 1, matching irregular. Convenient interval gives two graded classes/jumps 0,1, total dimension 2. | Convenience not imposed on comparison theorem. |
| §12.8 boundary correction | x; x+x⁻¹; x+y+1/(xy) | Nonconvenient x has nonisomorphic compact/ordinary Tate lines; convenient interval gives dimension 2; triangle has area 3/2, hence dimension 3 and weight 2. | Correct hypotheses distinguish failure. |
| §12.9 filtered product/duality | quadratic pair squared; torus line | Quadratic jumps add `1/2+1/2=1`. For torus line λ≤0 gives annihilator 0=`F^{>1−λ}`; λ>0 gives annihilator ℂ=`F^{>1−λ}`. | Strict inequality at jumps is correct. |

The coefficient universe is finite-dimensional rational/complex Hodge data, not arbitrary positive-characteristic or zero-ring Hodge theory. Such inputs are excluded by the standing field hypothesis; they were not silently treated as positive tests. The torus signatures keep arbitrary `n:ℕ`, including 0, and nonzero torus coordinates, so negative powers are never evaluated at zero in the nondegeneracy condition.

### Seeded source verification

All fifteen requested targets were opened against the supplied legal text extractions. Formula pages obscured by extraction were also inspected visually for AS, FSY and MT. The source versions are those recorded in the manifest; no new source was fetched and no manifest entry was rewritten.

| Target | Text and locator actually read | Outcome |
|---|---|---|
| 2.1 | FSY Appendix A.1 pp.60–61, lines 2768–2773; (A.7)–(A.8), p.64, lines 2930–2936; ESY §§2.1–2.3, lines 944–982 and 1065–1094 | Exponential sign, pullback and opposite dual exponential supported. |
| 3.1 | Kash86 §§1.4,1.6,1.9, printed pp.992–994, lines 61–85,103–109 | Definition supported at §1.6, not the listed locator: R09. SZ remains uncertified. |
| 4.1 | Sai88 §1.1 pp.861–864, lines 456–568; §2.1 pp.876 onward, lines 947–967; ESY §2.1 p.18, lines 944–960 | Cubes/Rees constructions supported; strictness sentence fails R02; neighboring ESY locator corrected by R09. |
| 5.1 | Sai90 §§4.2–4.5 pp.315–325, lines 3217–3519 and 3563–3565; FSY A.2 pp.61–63, lines 2792–2843 | Algebraic derived operations and correct dual Tate twist supported. |
| 5.4 | FSY Example A.2 pp.62–63, lines 2848–2871; Corollary A.31 p.72, lines 3256–3277 | Pure curve costalk and smooth-point hypothesis supported. |
| 6.2 | KS §4.2 pp.30–31, lines 1078–1113; §4.4 p.34, lines 1204–1210; FSY (A.5) p.63, lines 2897–2909 | Projector, image, exactness and constants supported. |
| 9.1 | FSY (A.14) p.65, lines 2981–2993; pair definition, Example A.15 and Definition A.18 p.66, lines 2996–3023 | Coefficient degree `r−d`, ordinary/compact/image definitions supported. |
| 9.5 | FSY Example A.20 and (A.21) p.67, lines 3048–3060 | Compact reduced-divisor sequence and smooth ordinary purity distinguished. |
| 9.6 | FSY Example A.22/(A.23) pp.67–68, lines 3061–3085 | Torus-sum Tate weights and degrees supported; k=0 evaluated independently. |
| 10.2 | FSY Example A.27 pp.70–71, lines 3208–3225 | Compact zero-locus shift and ordinary supported cohomology supported; source's zero-map wording corrected below. |
| 11.1 | FSY Lemma A.28/Notation A.29 p.71, lines 3226–3240 | Classicality and degree range supported. |
| 11.5 | MT Lemma A.4 and proof p.39, lines 2102–2136 | Eigenvalue-one stationary phase uses infinity nearby cycles; Fourier signs checked. |
| 11.6 | MT Lemma A.2 p.36, lines 2004–2016; Proposition A.3 pp.37–38, lines 2046–2099; complete proof pp.39–40, lines 2102–2177 | No constant subobject, weight centre and every primitive correction supported. The cyclic presentation slip is not copied into the README. |
| 12.1 | Yu §1(a–b) pp.4–6, lines 163–232; Corollary 1.3 p.8, lines 334–343; compact definition pp.12–13, lines 591–617; ESY (1.2.1) p.5 | Cutoff, floor divisor and horizontal compact twist supported. Yu's separately named logarithmic subcomplex at lines 347–357 is distinguished. |
| 12.7 | Yu Proposition 4.3 p.27, lines 1423–1436; Proposition 4.4 and Lemma 4.5 pp.29–31, lines 1533–1662; Theorem 4.6 p.31, lines 1663–1670 | Filtered toric comparison supports nondegenerate full-dimensional case without convenience. |

Additional repaired/previously uncomputed source checks: Sai90 Theorem 3.21 (line 2769); Sai88 strict-support/strictness statements (lines 3347–3478, 3740–3809), projective Theorem 5.3.1 (4017–4026); AS Theorems 4.13/5.1 (569–590); Sab05 §§2.2,4.1,5.2 and Theorem 6.1.1 (2009–2012, 4430–4456, 5351–5411, 6405–6408); Sab10 Theorem 6.1/Proposition 6.10 (1360–1370,1554–1605); ESY §3.3 strictness (1269–1310); FSY A.19's weight criterion; CY Theorem 1's constant-coefficient filtered product (lines 24–61). The Sab05 readings produce R07–R08 rather than an unqualified soundness claim.

### Pinned library and duplication audit

The following actual declaration bodies/types were opened at the supplied pins. Paths in this table are library-relative.

| Objects | Pinned locations and scope checked |
|---|---|
| Derived category | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`: localization carrier, no constructibility or perversity. |
| Formal derivative/series | `Mathlib/Algebra/Polynomial/Derivative.lean:47`, 228; `Mathlib/RingTheory/PowerSeries/Basic.lean:57`; `Mathlib/RingTheory/LaurentSeries.lean:101`. |
| Laurent carrier and linear maps | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64` (`coeff : M →₀ R`); `Module.lean:73` additive coefficient equivalence; `Mathlib/LinearAlgebra/Finsupp/LSum.lean:96`, `Defs.lean:87`; `Mathlib/Algebra/Module/LinearMap/Defs.lean:1018`; `Mathlib/Algebra/Module/Pi.lean:87`, 115. |
| Newton geometry/measure | `Mathlib/Analysis/Convex/Hull.lean:48`; `Mathlib/LinearAlgebra/AffineSpace/AffineSubspace/Defs.lean:537`; `Mathlib/Analysis/Convex/Exposed.lean:55` permits the empty face and zero functional; `Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean:359`; `Mathlib/MeasureTheory/Constructions/Pi.lean:349`, 660 gives empty-product Dirac volume and product volume. |
| Pure/mixed Hodge carriers | `TauCeti/Geometry/Hodge/Structure.lean:62`; `Mixed/Basic.lean:72`; `Mixed/Morphism.lean:77`. Neither pure carrier nor the mixed carrier imposes finite-dimensionality: the README adds it. Morphisms are rational maps with complexified filtration compatibility. |
| Strictness/category | `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:88`, 110, 131; `Mixed/Category.lean:56`; `Mixed/Abelian.lean:33`. These already supply point abelianness and the Deligne-piece intersection theorem; the package imports them. |
| Polarization/Tate | `TauCeti/Geometry/Hodge/Polarization.lean:72`, 159, 221; `Tate/Basic.lean:93`, 102; `Tate/Twist.lean:63`. Integral bilinear form, parity and positivity checked; rational forms need the README's rational model/scaling clause. Tate weight shift is −2m, filtration shift p+m. |
| Native local coefficients | `TauCeti/AlgebraicTopology/LocalCoefficient.lean:46`: fundamental-groupoid functor to modules over any ring; not itself a theorem identifying sheaves with these functors. |
| Near matches for the sole theorem | `Mathlib/Algebra/Polynomial/Laurent.lean:85` and `TauCeti/Algebra/Polynomial/Laurent/Derivative.lean:60`, 83,177 are univariate Laurent operations; `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61`,79 and `Derivation.lean:114` concern nonnegative exponents. `Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:58`,73 is the weighted homogeneous Euler identity, not face-acyclicity. |
| Other near matches | `Mathlib/RingTheory/Kaehler/Polynomial.lean:63`,72 gives a polynomial differential basis; `Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean:73`,229,235 is analytic exterior differentiation; `Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean:140`,143,173 does not prove finite-dimensionality or volume for this quotient. |

Searches were by objects as well as names: Laurent/Euler derivations, twisted complexes, Newton faces, regular holonomic and perverse categories, mixed Hodge modules, irregular filtrations, twistor modules, exceptional projective bundles and negative twists. No pinned theorem duplicates the AS acceptance target, and no readable sibling declares its fully qualified name. Ordinary monoid-algebra specialization is not a new competing carrier. Library-search hits were treated as leads and compared against these pinned declarations.

The board package index was read before conclusions about absence. The local Kloosterman package was found and read even though `roadmaps show` does not list it on main or at an open roadmap head. Ownership was checked against main, local packages and the accessible open-head index. The closest open roadmaps were compared by scope: SheafConvolutionOnAbelianVarieties #1809 owns proper abelian addition/Fourier–Mukai–Mellin, not this affine-line exponential category; EtaleDualityAndPerverseSheaves #1040 owns finite/adic étale coefficients, not the rational Betti category here; PadicDifferentialEquationsAndRigidCohomology #1002 supplies formal curves and consumes Hodge information; ComplexComparisonPartII #848 stops at regular-singular connections and its specified topological coefficient contracts; LefschetzPencilsAndVanishingCycles #873 supplies abstract monodromy and étale cycles, not Betti Hodge-module cycles. The explicit overlapping exceptional geometry is R06. Kloosterman-specific connections, polytopes and Jordan blocks remain in `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:19` onward.

The supplied overlap file reports no shared-folder or dropped-id conflicts for this not-yet-ported package. A direct overlap lookup cannot identify a main/open roadmap under this package's name. Those limitations do not override the directly verified stale suppliers R03–R04 or the broken consumer numbering R11. No conflicting second open head changing this roadmap was identified.

### Resolved supplier citations and direction

All supplier subsections and all 64 Needs lines were read. The following index records the actual sections inspected; findings above mark the exceptions. Open-head line numbers below refer to `TauCetiRoadmap/<name>/README.md`; completed-main locations use `Completed/<name>/README.md` where applicable.

| Supplier | Actual section locations inspected / result |
|---|---|
| ComplexComparisonPartII #848 | C-1.1 line 996; C5.6 line 4438; C6.0 line 4680; C6.1 line 4741. Analytification, separated locally compact topology, logarithmic residue convention and compact supports agree. Finite local-system coefficients require R05. C5.1 line 3083 is the operator owner for R03. |
| FormalConnectionsOpers | F2.2 line 707, ordinary-symbol/PBW paragraphs 731 onward; smooth characteristic-zero comparison with projective tangent module. Correct earlier owner for R03. |
| SpringerResolutionAndCharacteristicCycles #1828 | §§8.1–8.5 lines 832,855,869,891,907; §§9.1,9.2,9.4–9.7 lines 964,990,1016,1038,1051,1075. Transfers and signs match; lettered references fail R03, and supplied regular duality narrows R06's gap. |
| PadicDifferentialEquationsAndRigidCohomology #1002 | RD.6.52a line 12729; RD.6.53 line 12749: finite constant extension/ramification, slopes and index over characteristic zero. For E^x on G_m, Euler characteristic `0−1=−1`, hence H¹ rank 1. |
| ShimuraData #1038 | §§3.1,3.2,3.3 lines 355,386,417: pure variation, morphisms and parallel rational polarization. Mixed variation remains this roadmap's extension. |
| ShimuraVarieties #933 | §§3.5b.1–3.5b.2 lines 962,974: integral-lattice hypothesis retained. On a punctured disc, quasi-unipotent rational T has cyclotomic characteristic polynomial and a T-stable lattice, so the one-variable use is legitimate. |
| LefschetzPencilsAndVanishingCycles #873 | §§1.3,1.4,1.5,1.7 lines 1093,1146,1220,1279; §3.4 line 2410. Relative existence is not inferred from uniqueness; the Tate and logarithmic variation conventions agree. |
| ResolutionOfSingularitiesCharacteristicZero, main | §§5.1,5.2 lines 791,801; §6.2 line 893: nonzero-at-generic-points principalization, reduced embedded resolution, smooth quasi-projective SNC compactification. No nonreduced smoothness inferred. |
| StratifiedSpacesAndTameTopology #1519 / AlgebraicTopologyPartII #1694 | §§7.2–7.3 lines 936,957 / §§16.1a–e lines 1539–1647. See R04 for the ownership move. |
| EnhancedDerivedSheaves, main | §§0.1–0.4 lines 429,441,455,492; E1.4 line 580. Module-sheaf enhancements and derived operations are supplied; algebraic constructibility is added here. |
| SchemeAndStackFoundations, main | §§0.17,2.2,2.6,2.18,2.20,3.3,4.11,4.17,5.5 at lines 1310,3420,3554,4104,4452,4917,5820,6389,7109. Normal/conormal convention and projective-space vanishing agree. Section 5.5 alone is not an existing exceptional-divisor identification. |
| AlgebraicCurves, completed main | Layers 9 and 12, lines 1099 and 1468: Laurent expansion/differential and smooth projective model interfaces. |
| AnalyticToricGeometry, completed main / PartII #1647 | Layer 0, line 186, items 1–9; PartII §§0.1–0.3 lines 117,143,166. Monomial inequality `⟨m,vρ⟩+aρ≥0` matches the pole-divisor convention. Normal-fan/refinement and rounded-nef vanishing are still declared contracts. |
| SchemeKTheoryOperations #1229 | §5.7, lines 1971–1983: exact exceptional geometry and negative-twist derived vanishing, producing R06. |
| Downstream readers | SheafConvolution #1809: §§0.4,0.9,1.5,4.3 and its gap at line 121; EllAdicHomotopyTypesAndWeights #1644: scope line 13; local Kloosterman package: contracts lines 221–249. Mathematical uses exist; former IDs need R11. |

The five declared gap slugs occur in both README and `design/plan.json`, with named suppliers and precise mathematical hypotheses. `holonomic-specializability` still asks for the good V-lattice/graph/rational-root theorem beyond the generic mention of b-functions; `toric-normal-fan` and `toric-rounded-vanishing` have definite statements absent from the inspected toric sections. The normal-ray sign gives divisor coefficients `−min⟨u,vρ⟩`; for Δ=[0,1] the two coefficients are 0 and 1, recovering the interval. The rounded-nef test on P¹ with coefficients 1/2 and −1/2 gives floor divisor of degree −1 and H¹=0, while zero divisor gives H⁰=ℂ and H¹=0. The regular-stability and exceptional contracts need the minimality repairs of R06, and the Springer section locators need R03. None has supplier `none`.

The prescribed dependency check was run without changing the merge order. Its complete result was:

```text
depcheck: 234 roadmaps, 2118 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or `moved:` line. Relevant earlier positions in `merge-order/ORDER.txt` are SchemeKTheoryOperations 37, ComplexComparisonPartII 40, FormalConnectionsOpers 41, AlgebraicTopologyPartII 228 and SpringerResolutionAndCharacteristicCycles 258; this package is at 261. The check establishes direction, not section existence, and therefore does not discharge R03–R05. No forbidden supplier was found in this package's Needs or contracts. Downstream mentions are not used as supplier edges.

## Not verifiable

- Zucker, cited for §3.4, is waived. Its Theorem 4.8, Theorem 7.12, Corollary 7.13 and Proposition 8.2 were not independently read. The numerical consistency checks above are not a certification of that text.
- The six uncertified works remain settled as such: Dimca (Betti operations/perversity/RH), Schmid (nilpotent orbit), SZ (VMHS/admissibility/fixed part), Verdier (algebraic map stratifications), Kash76 (b-functions), Kou (graded acyclicity). Their recorded locators were not guessed, and no new request for them was made. Available Kash86, Sai88/Sai90 and AS passages were used only for the statements they actually contain.
- No unseen or unindexed pull-request head was inspected. The current open-head index, supplied overlap data, local board packages and main checkout define the ownership audit's scope. The absent direct overlap result for this package is explained above; the actual cross-head witnesses were nevertheless opened.

The earlier report's unadjudicated KS ambient-weight remark is no longer in this list: the proof and the explicit object K were checked, as recorded below. There are no newly missing texts requiring a source request.

## Source issues

- **Misprint** in FSY at Appendix A.2, printed p. 61 (FSY line 2800): the source says side change uses the increasing filtration shifted by minus the dimension; it should use `F_p(right)=ω⊗F_{p+d}(left)`; affects a stated result.
- **Misprint** in FSY at Appendix A.2, printed p. 62 (FSY line 2832): the source says the dual constant Hodge module has twist minus the dimension; it should have twist plus the dimension, hence weight minus the dimension; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p. 63 (FSY line 2876): the source says the restricted constant perverse object contributes in degree zero; it should contribute in degree minus one, with restriction `pℚ_D[1]`; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p. 71 (FSY line 3222): the source says the composite pushforward is the zero map; it should say the composite function is zero and its pushforward factors through the point; affects the proof.
- **Error** in Yu at §4(a), printed p. 26 (Yu line 1377): the source says convenience makes the Laurent polynomial map proper; it should assert exhaustiveness of the Newton filtration, without properness of that map; affects nothing.
- **Misprint** in Yu at the footnote to Theorem 4.1, printed p. 27 (Yu line 1442): the source cites AS Theorem 4.1 for Laurent-ring cohomology; it should distinguish the cone-algebra theorem from Laurent Theorem 4.13 or Theorem 5.1 with zero auxiliary variables; affects nothing.
- **Misprint** in MT at the discussion before Proposition A.3, printed p. 37 (MT line 2033): the source presents `ℂ[∂,∂⁻¹]` with relation `t∂+1`; it should use relation `t∂`, since `t=−d/d∂` kills `∂·∂⁻¹`; affects the proof.
- **Error** in KS at the proof of Proposition 3, §4.4, printed p. 35 (KS lines 1250–1255): the source assigns the projector of weight-n pure input ambient weights n and n−1; it should retain weight n and allow higher constant correction weights, as K has weights 0 and 1; affects the proof.
