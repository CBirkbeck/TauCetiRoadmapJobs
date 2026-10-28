# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 322ade4)

**Verdict:** needs changes

## R01 (P1) — Split the newform prerequisites to remove the local-factor cycle

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1597`, with lines 1984 and 2065. The newform target needs “AL.3's generic local Rankin–Selberg factor prefix”; the local-factor target needs “Generic finite-place newforms”.

**Claim:** The stated target dependencies are acyclic. They are not: `generic-local-newforms → rs-local-factor → generic-local-newforms`. There is also the path through `whittaker-model` and `rs-local-integrals`. The paragraph distinguishes a minimal-line prefix from later essential-vector and conductor comparisons, but the unqualified incoming edges still consume the composite target. This matters already for rank three; it is not resolved by the rank-two supplier.

**Witness:** README:1597,1984,2030,2065 give the closed dependency walk. For a spherical generic GL₃ representation, the fixed line can be constructed before the essential-vector integral, whereas the current target graph requires both first.

**Repair:** Give Whittaker uniqueness/realization, the minimal fixed line, and the essential-vector/conductor comparisons separate target names and separate Needs lists. Local integrals and their fractional-ideal generator use the representation/Whittaker prefix; the essential-vector and conductor comparisons then consume that generator. Point `whittaker-model` at uniqueness, not at the completed newform theorem. On the spherical GL₃ test the order becomes realization → factor → essential integral, with no return edge. Preserve the full newform theorem.

## R02 (P2) — The Hecke-function supplier is later than this roadmap

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:136`: “LFunctions, layers 0, 5–6 supplies primitive Hecke functions”.

**Claim:** LFunctions supplies the completion and comparison used here. The section exists, but this is an upward edge: positions 86 → 309. It is not an existing roadmap on main. Indirectly consuming it through ArithmeticGaloisRepresentations does not fix the direction.

**Witness:** The dependency check reports `UPWARD ... -> LFunctions (#309)` and refuses relocation because GanGrossPrasadUnitaryGroups at position 210 consumes this roadmap. That consumer's `README.md:175` explicitly imports AL.0–AL.5.

**Repair:** Move ownership of the needed primitive-Hecke comparison prefix to an earlier permitted supplier, or separate the later Hecke-identification extension from the independently constructed general character theory. Update both owners' contracts without duplicating the theory. Do not merely rename the edge as an AGR import. Retest the concrete chain Hecke comparison → AL.1 → GanGrossPrasad: each supplier must precede its consumer.

## R03 (P2) — Hadamard infrastructure is also an upward supplier

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1859`: “ZerosOfLFunctions, layer 0 and layer 5.1–5.6”.

**Claim:** The paired-product theorem consumes general Hadamard factorization from ZerosOfLFunctions. Its stated sections resolve, but the dependency runs from position 86 to 308. ZerosOfLFunctions is a new open roadmap, not a main-branch exception.

**Witness:** The checker reports `UPWARD ... -> ZerosOfLFunctions (#308)`. Its `README.md:978` states the nonzero-at-origin order-at-most-one Hadamard theorem used in the proof here.

**Repair:** Transfer the generic entire-function prefix to an earlier owner, with ZerosOfLFunctions importing it, or move the paired-product extension after its supplier while preserving the earlier automorphic-factor library. Do not re-plan the same Hadamard theorem here. Test the order on `f(z)=z²(1+z²)`: the imported theorem applies to `g=1+z²`, and the central-zero adapter stays with the paired specialization.

## R04 (P2) — Qualify the tensor Satake formula by unramifiedness

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2054`: “L(s,π×π′)=∏_{i,j}(1−α_iβ_jq^(−s))^(−1)”.

**Claim:** This API bullet is under the standing hypothesis “Generic irreducible inputs”, with no unramified qualification or definition of the α and β for this bullet. It cannot be a formula in the roots of the two individual standard factors at ramified places. The section's own third Check recognizes the obstruction.

**Witness:** Over ℚ₃ take π=π′ the nontrivial quadratic residue character, extended by χ(3)=1. Each standard factor is 1, so the proposed rootwise product is 1; χ²=1 gives the pair factor `(1−3^(−s))⁻¹`, equal to 3/2 at s=1.

**Repair:** Say “when both inputs are unramified, with their normalized Satake roots α_i and β_j”. Retain the general ramified fractional-ideal definition and make the existing ramified-character Check quantitative with the values 1 and 3/2 above. The unramified rank-one test α=β=1 still gives 3/2; the ramified test no longer falls under that bullet.

## R05 (P3) — Remove the raw-anchor residue rejected by the gate

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:295`: `<a id="pairing-annihilator"></a>`; 176 occurrences throughout the file.

**Claim:** This head passes the text gate. It does not: the recorded gate has `residue=176` and returns FAIL independently of the dependency errors.

**Witness:** The anchor at line 295 is one of the 176 raw HTML anchor lines; the recorded gate has all other text-scanner counts zero.

**Repair:** Replace raw anchors with the required numbered topic headings and update internal and supplier-facing fragment links to those headings. Repair the broken Gaussian Check at lines 712–714 during this conversion: its squared modulus has been split into separate bullets. Re-run the gate; the same annihilator section must remain reachable while `residue=0`.

## R06 (P3) — Put the acceptance test in its roadmap namespace

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/Suggested.lean:43`: `namespace TauCeti.AutomorphicLFunctions.AL0`; likewise lines 78, 257 and 362.

**Claim:** These are roadmap signatures. They currently allocate names in four library namespaces instead of `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`. The module also lacks the required layer section comments, and its helper `lastRowStabilizer` at line 308 is not named in the README.

**Witness:** The 33 elaborated signatures include `TauCeti.AutomorphicLFunctions.AL2.lastRowStabilizer`; a literal README search finds no occurrence of `lastRowStabilizer`.

**Repair:** Nest the retained namespaces under the required roadmap namespace, update the README's corresponding names, add layer comments in README order, and document the retained stabilizer helper in the level-subgroup definition. Re-elaborate the same 33 declarations: their mathematical binders should be unchanged, while all fully qualified names belong to this roadmap.

## R07 (P3) — The local Godement–Jacquet citations cover a narrower input class

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1629,1654`: Humphries §§2.3.2–2.4.3 is the locator for convergence and the standard factor for every irreducible admissible π.

**Claim:** The cited passage establishes that full generality, including local uniformity of all s-derivatives. In the cited text the integral is introduced for induced representations of Whittaker type, and the convergence sentence states sufficiently-right absolute convergence and meromorphic continuation; it does not state the derivative estimates.

**Witness:** `humphriesarch` lines 280–292 restrict the input and state the convergence assertion. The trivial representation of GL₂ is irreducible admissible but nongeneric, so it is a useful test of the extra generality promised here.

**Repair:** Keep the general irreducible-admissible target. Add an exact primary Godement–Jacquet local-theory locator for that class and state the domination/quotient argument giving the compact-uniform derivative assertion. Retain Humphries for its explicitly covered class and normalization formulas. Check the repaired route on the trivial GL₂ quotient as well as on a generic principal series.

## Verified sound

The review covered the two requested files at the specified head. There are **7 findings: 1 P1, 3 P2 and 3 P3**. No file in the pull request was changed. The outside-folder diff is empty. There is no previous review to reconcile. No algorithmic implementation, sorry-valued data, `set_option`, copied source passage, or route restricted to good primes was identified. The good-prime hypothesis of the stabilization formula is an explicit specialization alongside all-place local-factor theory.

**Build and signatures.** The two imported Tau Ceti Hecke-character modules were built first. Direct `lake env lean` elaboration of `Suggested.lean` succeeded with exactly 15 sorry warnings and no errors. A scratch copy with `#check @name` for all **33 declarations** elaborated successfully. The local-field hypotheses, Borel/Haar assumptions, finite real dimension, smoothness, admissibility, irreducibility, conductor-zero character and nonzero Whittaker functional survive in the relevant signatures. `genericNewform` uses `Fin (n+1)`, so its natural n covers precisely positive rank. The finite and archimedean zeta integrals retain the Haar modulus characterization; they do not quantify over an unrelated arbitrary absolute value. No lost binder was found. Scratch probes trying `simp`, `rfl` and `infer_instance` independently on each of the **15 theorems** closed none of them. Reading the pinned objects found no single matching library theorem that supplies these results. This is evidence against padding, not a proof of the admitted results.

**Headline inventory.** The statable headline families are: point-supported finite jets; Bessel order derivative and Laplace–Mellin identity; both local eigenline uniqueness theorems; both Tate local functional equations; general unitary Hecke continuation, balanced functional equation, poles and norm twists; paired Hadamard factorization and its two positivity results; the generic minimal newform line; GL₂ level existence, all-level dimensions and K₀ central-character action. All are represented. The docstring names the missing carriers for vector-space adelic Poisson; all-place Godement–Jacquet and Rankin–Selberg theory; ordinary/strong multiplicity one and converse theorems; Maass continuation and norm comparison; rational periods; arithmetic epsilon/root-number identification; curve reciprocity, shtukas, IC purity, essential cohomology and pure realization; cuspidal polynomial degree/reflection/RH; parameter comparisons; and automorphic stabilization/conductor interfaces. No further statable deep headline was identified as absent. Scalar Euler-correction algebra is not a replacement headline.

**Seeded source audit (15 targets).** “Verified” below means the stated locator was read and the indicated content checked; it does not certify an entire source proof. The README has no locator explicitly marked unverified. Sources were fetched through the source service; no manifest was changed.

| Seeded target | Locator actually inspected and outcome |
|---|---|
| Frequency periods from support containment | Mathlib `Analysis/Fourier/FourierTransform.lean:80` and `Algebra/Group/AddChar.lean`: the negative kernel and character multiplication give pointwise equality of integrands, without Haar invariance or integrability. Verified. |
| Local quasi-characters and conductor | Main ClassFieldTheory `Suggested.lean:2155,2159` supplies the least filtration depth and attainment. The archimedean classification attributed to Kudla (3.18),(3.20) remains uncertified; the pinned infinity-type formulas independently confirm the real/complex normalization. |
| Explicit local epsilon factors | ArithmeticGaloisRepresentations §2.7, standard evaluations and arithmetic constants, `README.md:2047–2199`; `cheneviertaibi2020` lines 560–595, §2.1 p.274 and footnote 6. Finite different powers, inverse character in the Gauss sum, and positive-character archimedean phases agree. |
| Archimedean standard epsilon | `cheneviertaibi2020` lines 560–595 gives 1 and I_w phases and the positive real character. The sign-character and complex angular cases also follow from the explicitly matched standard Gaussian evaluations. |
| Normalized-distribution epsilon comparison | ArithmeticGaloisRepresentations `README.md:2258–2308` supplies the finite Gauss product, unitary root number and conductor power. Its finite-sum identity is correctly distinguished from continuation. `deligne1973` lines 853–869, §3.11, supports the product/character independence. The primary global matrix-integral proof remains uncertified. |
| Matrix zeta convergence | `humphriesarch` lines 280–292, §§2.3.2 pp.5–6. Exponent and sufficiently-right half-plane verified; scope/derivative locator problem is R07. |
| Standard local factor | `humphriesarch` lines 294–383, §§2.4.1–2.4.3 pp.6–7. Principal generator and gamma shifts verified in its stated setting; general-input locator problem is R07. |
| Global standard L-function | `borel1979` lines 1091–1137, §14 pp.52–53, distinguishes the established standard GL_n theorem from conjectures for general r. The cited primary Godement–Jacquet Global Theory pp.136–184 was not readable. Rank-one poles were checked independently against the explicit completion. |
| Finite Maass adjoint function | `humphriesnordentoft` lines 1283–1335, §4.1.1, printed p.21, equations (4.2)–(4.5). Fourier coefficient conversion and the q=1 factor-two norm agree. The adjoint Euler polynomial follows by removing the scalar line from the standard self-pair. |
| Archimedean realization of holomorphic multiples | `jacquetarch` lines 427–470, Theorems 2.6–2.7 pp.9–10, and the pole-cleared strip condition at lines 230–240. Ordered induction, completed tensor input, and the equal/adjacent-rank K-finite distinction are retained. |
| Continuation and Rankin–Selberg poles | `cogdellfields` lines 3249–3289, Lecture 9 printed p.71 (physical p.75): poles at iσ and 1+iσ under the specified norm-twisted contragredience; unequal ranks give entire continuation. |
| Essential cohomology and local factors | `lafforgue2002` lines 9585–9643, VI.15 pp.167–168; lines 10203–10249, VI.20 pp.177–178; lines 10379–10412, VI.21 pp.180–181; lines 10574–10606, VI.22 pp.182–183. Negligibility, degree 2r−2, purity and truncation comparison match. The roadmap correctly requires arbitrary-level lower-rank inputs before the no-level specialization. |
| Open-disc zero–pole index | `yu2023` lines 2304–2342, §6.1/Corollary 6.1.2 p.43: open unit disc and multiplicity convention. Presentation independence is native divisor arithmetic, not an extra claim attributed to Yu. |
| Transport of local parameter comparisons | `borel1979` lines 889–957, §§12.1–12.2 pp.48–49: conditional parameterization distinguished from established cases. The README treats ramified equalities as inputs. Borel does not verify the particular modern Hilbert realization; that extra normalization is an assumed comparison, not established by this citation. |
| Ordinary GL₂ interpolation factor | `rodriguesjacintowilliams2025` lines 4583–4614, Appendix B, Theorem B.1 p.208: p-level form, one Euler factor, α^(−ν), critical range and slope bound. The second factor is the separately stated primitive/stabilized comparison, verified algebraically below; no p-adic measure theorem is inferred from it. |

**Pinned-library ownership evidence.** The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. File names below are relative to those libraries. The following bodies/signatures were opened, not inferred from their names:

| Pin file and line | What was verified, including its limit |
|---|---|
| `Mathlib/Analysis/Fourier/FourierTransform.lean:80,105` | Integral kernel ψ(−L(v,w)); right-translation covariance requires measurable addition and right-invariant measure. The definition itself has neither requirement. |
| `Mathlib/Analysis/Distribution/Support.lean:94` | `dsupport` is an intersection of closed vanishing complements, on a general FunLike carrier. It does not supply continuity or the finite-jet theorem; the retained tempered-distribution carrier supplies continuity. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:290,292` | Native reversed characteristic polynomial is det(1−XM); reversal/conjugacy/block formulas are library algebra, not new automorphic theory. |
| `Mathlib/Analysis/Meromorphic/Order.lean:466` | Multiplication adds native `WithTop ℤ` orders under meromorphic hypotheses, including infinite order. No custom order convention is needed. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean:179,184,191,199` | Character conductor is a least filtration depth; attainment, minimality and unramified iff zero are present. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/InfinityType.lean:218,226,234` | Complex exponent uses the ordinary complex modulus. `heckeArchFactor` divides it by two before using the arithmetic norm convention. |
| `TauCeti/Analysis/Fourier/AddCircle.lean:246` | The equivalence is for the additive circle and integer Fourier indices; it is not arbitrary local-field duality. |
| `TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158,216` | Pole subtraction gives continuation only in the stated half-plane; nonvanishing on Re(s)=1 assumes a compatible differentiable representative. The README retains those limits. |
| `TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean:114,122,137` | Bound Re(s)>k/2+1, width^(−s) comparison, and positive-weight entire extension. |
| `TauCeti/NumberTheory/ModularForms/LFunction/EulerProduct.lean:160` | Native newform Euler product includes bad primes through the zero-extended character and has the stated convergence bound. |

**Supplier and duplication audit.** Object searches used `roadmaps grep` for distributions, jets, Bessel order derivatives, eigenlines, newforms, Godement–Jacquet, Tate equations, Hadamard products, curve HN theory and essential cohomology; the relevant supplier sections were then opened. The 40 unresolved-name leads in the supplied citation report are predominantly this roadmap's own signatures or future supplier names, not evidence of 40 missing declarations. No collision of a retained fully qualified theorem name was found in the searched pins/main/open heads. `lastRowStabilizer` is the reverse README-name discrepancy in R06.

The following substantive contracts were resolved: SmoothRepresentationsOfLocalGroups SR.1.1, SR.2.3 `whittaker-functionals`, SR.5.1 `mirabolic-derivatives` and SR.5.3 `highest-derivative-adapter` (its README:2186 and 4716 explicitly distinguish GL₂ uniqueness and characteristic-zero derivative inputs from newvector applications); AutomorphicFormsOnReductiveGroups §§2.3–2.7,3.4–3.5,4.3,4.5,5.7–5.8,7.3; ArithmeticLocallySymmetricSpaces ALS.F.6–F.7 and ALS.5b.1/4/5 (README:920,991,4170,4296,4372); ArithmeticGaloisRepresentations §§2.4–2.7 and its standard-vector/root-number contracts; AdelicAlgebraicGroups §§0.1–0.4,2.2–2.3; ArithmeticGaloisDuality §R02.3.2 (README:2072); ReductiveGroupsPartII RG2.5.2 (README:6931); IntegralHeckeAndGaloisDeterminants §3a.1 (README:1661); EtaleCohomologyFoundations F.0–F.10 and §0.11 (README:1159,1169 for smooth trace and curve duality); and DeligneWeightsAndPurity §§0.17,1.7,1.10,6.4,7.15,8.9,8.11–8.12,10.1–10.3. In particular its §8.12 is proper purity for **pure input complexes**, not purity of arbitrary singular proper ordinary cohomology. The roadmap's nodal-curve negative control respects that distinction.

The main-branch ClassFieldTheory conductor statements and AlgebraicCurves layers 0,4,5,9,12 exist. Completed/RestrictedProducts and the main AlgebraicCurves and ClassFieldTheory READMEs were also used as shape references. The LFunctions layers 5–6 and ZerosOfLFunctions layer 5 contracts exist but have the ordering defects above. GlobalShtukasAndFunctionFieldLanglands at the supplied open head, `README.md:20,95,270`, expressly assigns the two-leg GL_r, HN, all-level rank-induction and essential-cohomology work to this roadmap; its extra G-bundle/multi-leg theory therefore is not a competing owner. GanGrossPrasadUnitaryGroups `README.md:175–181` is a consumer, not a supplier. FunctionFieldArithmetic's broader reductive-group arithmetic and downstream interpolation roadmaps do not justify importing their later constructions here. No move of ownership was performed by this read-only review.

**Dependency-check output.** Repository-relative path presentation below preserves every diagnostic and count:

```text
not movable: AutomorphicLFunctionsAndLocalFactors consumes LFunctions (#309) and is consumed by GanGrossPrasadUnitaryGroups (#210), which comes first: moving AutomorphicLFunctionsAndLocalFactors after LFunctions would put a supplier after a consumer, a cycle through AutomorphicLFunctionsAndLocalFactors
UPWARD: AutomorphicLFunctionsAndLocalFactors (#86) -> AlgebraicCurves (#238) at README lines [17, 2418, 2454, 2757]
UPWARD: AutomorphicLFunctionsAndLocalFactors (#86) -> ClassFieldTheory (#255) at README lines [53, 130, 957, 1549, 1580]
UPWARD: AutomorphicLFunctionsAndLocalFactors (#86) -> LFunctions (#309) at README lines [11, 13, 55, 56, 136, 1404]
UPWARD: AutomorphicLFunctionsAndLocalFactors (#86) -> ZerosOfLFunctions (#308) at README lines [57, 146, 1859, 1865, 1871]
depcheck: 164 roadmaps, 1177 edges, 4 problem(s)
```

The AlgebraicCurves and ClassFieldTheory UPWARD lines are false positives under this brief's explicit permission to consume main-branch roadmaps: both folders and the cited sections were confirmed on main. The other two lines are R02–R03. The “not movable” diagnostic is an order obstruction through an existing consumer; it does not independently prove a mathematical cycle in that consumer. R01 records the actual closed local-target dependency walk. The supplied full gate has `residue=176`, `depcheck=4`, `build=0` and all other failure counts zero; it is FAIL, so this is not an accepted verdict.

**Adversarial calculations.** Each row gives a named target or retained signature, an actual instance and computed values. “Pass” means that instance does not refute the statement; it is not a replacement for its proof. Excluded instances test hypotheses. Grouped API values in a row belong to that same definition. Lines refer to `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` unless marked Lean.

| Statement | Instances | Computed values on the two sides / controls | Result | Change |
|---|---|---|---|---|
|241 Archimedean Whittaker comparison|GL₁ trivial representation, functional ℓ(z)=2z|Orbit function at 1 is 2z; kernel 0 and image dimension 1. Zero functional gives image dimension 0.|Pass|retain nonzero/continuous functional.|
|251 Archimedean parameters|I₁ and I₀|I₁ has dimension 2 and Γ_C(s+1/2); I₀ splits into two lines, gamma Γ_R(s)Γ_R(s+1)=Γ_C(s).|Pass|I₀ excluded from irreducible branch.|
|261 Restricted tensor realizations|Two factors ℂ² with bases e₁,e₂|e₁⊗e₁+e₂⊗e₂ has coefficient matrix determinant 1, whereas a pure tensor has determinant 0; scaling a reference vector by 2 scales the map by 2.|Pass|no all-tensors-are-pure claim.|
|271 Isobaric sums|Two unramified characters, values 2 and 3|Product polynomial (1−2T)(1−3T)=1−5T+6T²; reversing constituents gives the same coefficients.|Pass|None from this test.|
|281 Finite-part rationality|Weight-two rational eigenform, q=2|C-algebraic coefficient a=1 lies in ℚ; unitary coefficient 1/√2 does not. Extending ℚ to ℚ(√2) preserves line dimension 1.|Pass|normalization essential.|
|297 Annihilator definition|Multiplication over 𝔽₂; trivial character; ℝ with U=ℤ|Nontrivial character: U=𝔽₂ gives annihilator {0}, U=0 gives 𝔽₂. Trivial character gives all W. Over ℝ, 1 lies in ℤ⊥ and 1/2 does not.|Pass|not generally an R-submodule.|
|322 Annihilator membership|U=ℤ inside ℝ|w=1: exp(2πiu)=1 for all integral u; w=1/2: u=1 gives −1≠1.|Pass|in both directions.|
|339 Closedness|Real pairing, U=ℤ|Annihilator is ℤ, a closed set; w_j=1+1/j lies outside for j>1 but tends to included point 1.|Pass|None from this test.|
|356 Openness|ℚ₃, U=ℤ₃, conductor-zero character|U⊥=ℤ₃ contains the open ball ℤ₃. For ℝ, U=ℝ gives {0}, not open, and joint local constancy fails.|Pass|continuity alone insufficient.|
|373 Vanishing from a period|𝔽₂, f=1, counting measure, u=w=1|Fourier sum 1+(−1)=0; phase is −1 and equation F=−F forces 0.|Pass|None from this test.|
|390 Support in period annihilator|Same 𝔽₂ test|Transform values (2,0), support {0}; full period subgroup has annihilator {0}.|Pass|None from this test.|
|407 Subgroup indicator|𝔽₂ counting measure, U=0 or all; ℝ with U=ℝ|Transforms (1,1) and (2,0), respectively. Infinite Lebesgue-volume U gives totalized integral 0 and μ.real(U)=0.|Pass|including totalization.|
|424 Coset indicator|ℤ/4, counting measure, f=δ₁, w=1|Transform exp(−2πi/4)=−i; stated phase times volume is −i·1.|Pass|opposite sign gives i.|
|441 Modulation|ℤ/4, f=δ₁, w=w₀=1|Modulated Fourier value i·(−i)=1; unmodulated value at w−w₀=0 is 1.|Pass|None from this test.|
|458 Frequency periods (sample)|ℤ/4, U={0,2}, f=δ₂, arbitrary mass μ({2})=3|At w=1 and w+2=3 the integrals are both −3; 2∈U⊥. μ need not be invariant.|Pass|None from this test.|
|475 Local constancy|ℚ₃, f=1_O; real Gaussian negative control|Finite transform 1_O has value 1 on O and 0 outside. Real Gaussian values at 0 and 1 are 1 and e^(−π), unequal on every neighborhood family.|Pass|local-constancy hypothesis needed.|
|492 Compact transform support|ℚ₃ lattice; zero f; U=0 over ℝ|Supports O, empty set, and unconstrained full dual ℝ respectively. O and empty set are compact; ℝ is not.|Pass|compact annihilator not inferred from openness alone.|
|509 Indicator inversion|q=3, different exponent d=2, U=P|μ(U)=3^(−2)=1/9; U⊥=P^(−3) has volume 9; double-transform scalar 1.|Pass|doubling one measure gives scalar 2 and violates hypothesis.|
|537 Standard character|Diagonal 1/3 over ℚ|Real phase e^(2πi/3), 3-adic phase e^(−2πi/3), other factors 1; product 1.|Pass|same-sign finite phase would not cancel.|
|561 Fractional-ideal trace annihilator|q=3, d=2, m=1|P^m dual is P^(−m−d)=P^(−3); second dual exponent −(−3)−2=1.|Pass|None from this test.|
|578 Self-dual additive measure|Same field; complex trace character|μ(O)=3^(−1)=1/3. Complex Gaussian e^(−2πabs(z)²) has dxdy integral 1/2 and self-dual-measure integral 1.|Pass|different and factor 2 retained.|
|602 Local additive duality map|ℚ₃ conductor-zero ψ, parameter a=0 or 1|a=0 gives constant character 1; a=1 evaluates on 1/3 to e^(−2πi/3)≠1.|Pass|zero map cannot be the equivalence.|
|627 Local self-duality|𝔽₂ finite quotient|Characters indexed by a=0,1 have value vectors (1,1),(1,−1); two distinct characters for two points.|Pass|on finite-level comparison.|
|647 Schwartz space/actions/distributions|Finite field; real δ₀; inverse scalar a=2|Finite test-space dimension 2 over 𝔽₂. Pullback fixes δ₀ evaluation; a Haar distribution scales by 2 over ℝ.|Pass|δ₀ and Haar not confused.|
|671 Finite Schwartz levels|ℚ₃, support 3^(−1)O, invariant by 3O|Quotient has 3²=9 cosets, test-space dimension 9; support O with O-periods has dimension 1.|Pass|None from this test.|
|688 Finite Fourier inversion|𝔽₂ with measure 1/√2 per point|δ₀ transforms to (1/√2,1/√2), then to (1,0); each matrix square is identity.|Pass|None from this test.|
|705 Archimedean Fourier comparison|f(x)=x e^(−πx²)|F⁺f=i f and F⁻f=−i f; two positive transforms give −f=f(−x).|Pass|mathematically; repair malformed complex Check in R05.|
|724 Local Fourier inversion|q=3, f=1_O, conductor zero|First transform 1_O, second 1_O, reflected function 1_O.|Pass|additive measure normalization fixed.|
|741 Finite jets; Lean pointSupported_finiteJet|T=δ₀ and T=δ′₀ on ℝ; E=0|δ₀ needs N=0. For f=x e^(−x²), δ′₀(f)=−1 despite f(0)=0; N=1 detects it. In dimension zero N=0 suffices.|Pass|higher jets are not evaluation alone.|
|760 Parameter-integral domination|∫₀¹ x^(s−1)dx|At s=1 integral 1; first s-derivative integral log x=−1 equals derivative of 1/s. At Re(s)=0 absolute integral diverges.|Pass|strict margin required.|
|800 Vector Poisson/compact estimates|Lattice ℤ and Gaussian e^(−πx²); zero-dimensional space|Both theta sums equal 1+2e^(−π)+2e^(−4π)+…; rank zero has one term of value 1 and covolume 1.|Pass|rank-zero convention meaningful.|
|822 Partial Fourier transform|Product of real Gaussians; skew factor x e^(−πx²)|Transform in second coordinate preserves first factor and Gaussian. Transform in first multiplies odd factor by i; doing both yields the same i factor.|Pass|chosen variable and sign fixed.|
|849 Bessel kernel; Lean BesselK|ν=1/2, c>0; symmetry|Substitution u=e^t gives cosh representation. K_(1/2)(c)=√(π/(2c))e^(−c)=K_(−1/2)(c).|Pass|no claim for c≤0.|
|874 Half-order derivative; Lean negativeEi/BesselHalfOrderDerivative|c=1, Ei(−2)=−∫₂∞ e^(−t)/t dt|Derivative is √(π/2)e·∫₂∞e^(−t)/t dt>0, matching the positive order derivative of cosh(νt) at ν=1/2.|Pass|sign; source scan not text-verifiable.|
|897 Bessel–Laplace Mellin; Lean BesselLaplaceMellin|m=t=1, s=2|K_(3/2) expansion gives integral 3/(32π²); gamma expression √π·Γ(4)Γ(1)/(Γ(3)(4π)^(5/2)) also 3/(32π²).|Pass|s=t would give endpoint divergence.|
|928 Quasi-characters/conductor (sample)|Trivial character, quadratic character of ℤ₃×, sign on ℝ|Conductors 0,1; norm twisting leaves them 0,1. sgn(−2)=−1=(−2)^(−1)·2; its unitary exponent is 0.|Pass|Kudla normal-form s differs from unitary exponent.|
|962 Local Tate integral; Lean localZetaIntegral|q=3, trivial χ, f=1_O, unit multiplicative volume, s=1|Sum Σ_(m≥0)3^(−m)=3/2; twisting χ by norm gives value 1/(1−3^(−2))=9/8 at s=1.|Pass|at s=0 series diverges.|
|999 Eigenspaces; Lean inverseScalar/archimedeanEigenSpace|δ₀, real Haar, δ′₀; a=2|Eigenvalues under inverse pullback are 1,2,1/2. Corresponding characters are 1, modulus, inverse scalar.|Pass|inverse convention distinguishes all three.|
|1039 Distributions on F×|Real d×x and χ(x)=abs(x), a=2|For inverse pullback, χ-weighted integral changes by factor χ(2)=2; trivial χ gives factor 1.|Pass|scalar multiple changes vector, not eigenline.|
|1056 Point-supported eigenvectors|Real δ₀ and δ′₀|At a=−1, δ₀ eigenvalue 1, δ′₀ eigenvalue −1; at a=2 derivative has eigenvalue 1/2.|Pass|parity and exponent both necessary.|
|1076 Unramified local theory|q=3, χ(ϖ)=1, f=1_O, ν=0|Z=L=1/(1−3^(−s)); normalized quotient 1. At s=1 both unnormalized values 3/2.|Pass|None from this test.|
|1093 Invariant distribution line|Trivial χ at s=0; real δ₀|Normalized zeta distribution specializes to a nonzero evaluation scalar; δ₀(a·f)=f(0) for every unit a.|Pass|invariant line, not divergent raw integral.|
|1110 Ramified local theory|Quadratic χ over ℚ₃, standard χ-inverse function on units|Angular integral of χ alone is 0; integral of χ·χ⁻¹ is 1. L=1 and standard Z=1.|Pass|constant test alone cannot characterize the line.|
|1127 Archimedean standard functions|Real trivial/odd; complex k=1 with conjugate test|Real integrals Γ_R(s), Γ_R(s+1). At complex s=1,k=0 raw Kudla integral 1 versus Γ_C(1)=1/π; wrong angular monomial gives 0.|Pass|π rescaling recorded.|
|1147 Local uniqueness; Lean finiteEigenSpace_finrank/archimedeanEigenSpace.finrank|ℚ₂ with trivial eigencharacter; real odd derivative character|δ₀(1_O)=δ₀(1_(2O))=1, whereas Haar values are1 and1/2 and have a different eigencharacter. Real δ′₀ has parity−1 and inverse-scalar eigenvalue1/2 at2.|Pass|exceptional eigencharacters; not inferred from finite-quotient dimension.|
|1171 Fourier action on eigencharacters|Real δ₀ with positive Fourier, Lebesgue measure|Fourier of δ₀ is integration; χ=1 becomes modulus. A second transform returns δ₀.|Pass|modulus twist required.|
|1191 Epsilon/gamma definition|Nonzero local factors L=3, Ldual=5, epsilon=2|Gamma=epsilon·Ldual/L=10/3; reversing quotient would give 6/5.|Pass|algebraic convention; values are normalization test, not asserted automorphic input.|
|1229 Tate local equation; Lean finite/archimedean FE|q=3 trivial χ, s=1/4; real fixed Gaussian|Finite Z=1/(1−3^(−1/4)), Zhat(3/4)=1/(1−3^(−3/4)); ratio is the stated gamma. Real ratio Γ_R(3/4)/Γ_R(1/4).|Pass|both initial integrals converge.|
|1251 Distributional equation|Real odd Gaussian, s=1/2|Zhat/Ldual=i while Z/L=1; epsilon i makes the two sides i.|Pass|positive-character sign pinned.|
|1268 Gauss sum|Quadratic character mod 3, negative standard ψ|Sum e^(−2πi/3)−e^(−4πi/3)=−i√3; normalized sum −i has modulus 1.|Pass|inverse/sign conventions visible.|
|1301 Explicit epsilon (sample)|q=3,c=1,χ(ϖ)=1; ν=0 or 1|At s=0 epsilon −i√3 or −3i; at s=1/2 both −i. Unramified c=ν=0 gives 1.|Pass|ν is not omitted.|
|1316 GL₂ parameter coordinates|Split real 1⊕sgn, discrete I₁, complex angular ±1|Gamma products Γ_R(s)Γ_R(s+1), Γ_C(s+1/2), Γ_C(s+1/2)² respectively; I₀ is split, not discrete.|Pass|None from this test.|
|1339 Canonical archimedean factors|Complex trivial line at s=1; weight-two discrete block at s=1/2|Γ_C(1)=1/π in both evaluations; raw complex Kudla factor is 1 in its measure.|Pass|no extra π in canonical factor.|
|1369 Archimedean epsilon (sample)|1,sgn,I₀,I₁,k=1,k=−1|Values 1,i,i,−1,i,i. For sgn double Fourier epsilon product i²=−1 equals χ(−1).|Pass|source sign issue recorded below.|
|1387 Global factorized eigenline|Two local one-dimensional lines; scalars i,−i|Tensor line dimension 1; tensor scalar i(−i)=1, not the sum 0.|Pass|fixing local normalizations still leaves scalar data.|
|1404 Hecke completion normalization|Odd character mod 4|A=4 and gamma Γ_R(s+1); balanced/unbalanced ratio 4^(s/2), equal to 2 at s=1.|Values agree|Repair supplier order (R02).|
|1440 Canonical rank-one comparison|K=ℚ, χ=1, standard tensor|Matrix and Tate integrals both Γ_R(s)ζ(s); residues at 0,1 are −1,+1.|Pass|equality initially on Re(s)>1 then as germs.|
|1476 Global distribution epsilon (sample)|Odd quadratic conductor 4 at s=1/2 and s=0|Local product (−i)i=1 at centre; at s=0 product 2. Formula W·4^(1/2−s) gives 1 and 2.|Pass|empty product also 1.|
|1507 Hecke continuation; Lean heckeContinuation|K=ℚ and χ=norm^(2i)|Poles −2i,1−2i, each order −1. For χ=1 poles 0,1; nontrivial imaginary twist is not entire.|Pass|unitary-nontrivial is not enough for entirety.|
|1515 Hecke factor definitions|Trivial ℚ character at p=3,s=1; odd conductor-4 character|Finite factor 3/2, real trivial factor Γ_R(1)=1, conductor scales 1 and 4. Complex exponent 2t contributes shift t.|Pass|native conductor/infinity-type carriers used.|
|1541 CM quadratic completion|Imaginary quadratic field with abs(D)=4, parity odd character|Completed gamma Γ_R(s+1), balance 4^(s/2); at s=0 gamma=1 and balance=1.|Pass|normalization.|
|1554 CM gamma logarithmic correction|s=0 in Γ_R(s+1)|Log derivative =−(γ+log(4π))/2; discriminant balance contributes log4/2 separately.|Pass|additive correction distinguished from gamma value.|
|1565 Quadratic orbital Tate comparison|Unramified standard local functions, q=3, local quadratic value1|Standard quotient Z(s)/L(s)=1; at s=1 L=3/2, at −s=−1 continued L=−1/2. Scaling a test by2 makes its normalized quotient2.|Pass|standard values and minus-s sign; full orbital proof not certified.|
|1591 Generic newforms; Lean genericNewform|Rank1 character c=2; spherical GL₃; nongeneric determinant GL₃|Ranks of fixed spaces below/at conductor are 0/1 for character; spherical minimal line dimension 1. Determinant representation has Whittaker functional dimension 0.|Values agree|Split dependencies (R01).|
|1601 Matrix zeta integral|n=1 and n=2|Determinant exponents s and s+1/2; n=1 reduces exactly to f(x)χ(x)abs(x)^s.|Pass|rank zero is outside n≥1.|
|1625 Matrix convergence (sample)|Rank-one χ=norm^(−2), f=1_O, q=3|At s=1 terms 3^m diverge; at s=3 sum 3/2. Threshold is Re(s)>2 for this input.|Pass|no universal zero threshold; locator R07.|
|1636 Standard factor (sample)|Rank1 trivial/ramified, real sign|At q=3,s=1 factors 3/2 and 1; sign gamma Γ_R(2)=1/π, unlike Γ_R(1)=1.|Pass|formulas; generality locator R07.|
|1661 Godement–Jacquet equation|Rank1 real odd test|Trace and transposed-trace pairings coincide; normalized transformed value i equals epsilon i times 1.|Pass|no transpose discrepancy survives rank1.|
|1678 Spherical matrix test|GL₂ unramified roots 2,3; T=1/10|Denominator (1−2/10)(1−3/10)=14/25; normalized test integral L=25/14.|Pass|None from this test.|
|1689 Real self-dual coefficients|Unitary roots e^(iθ),e^(−iθ), θ=π/3|Polynomial 1−T+T² has real coefficients; conjugation exchanges roots.|Pass|self-duality alone without unitary comparison is not used.|
|1700 GL₂ genericity criterion|q=2, roots 2 and1; roots1 and1|First a²=9 and ((q+1)²/q)·s=9: reducibility boundary. Second a²=4 versus 9/2: generic.|Pass|repeated roots need not be nongeneric.|
|1714 Level subgroups; Lean lastRowStabilizer/newformK1/newformLocalK1/k0/localK1|ℤ₃, level1, g=diag(1,2) versus diag(2,1)|Both are in K₀; first not in K₁, second in K₁. Level0 reduction mod unit ideal gives all GL₂(O).|Pass|identifies lower-last-row convention. R06 documents helper.|
|1732 Level existence; Lean newvectorLevelExists|Steinberg c=1; one-dimensional determinant representation|Steinberg has no level0 fixed vector, one at level1. Determinant representation is excluded by infinite dimension.|Pass|statement does not assert sphericality.|
|1746 Conductor; Lean conductorExponent|First nonzero fixed space at level4|Nat.find returns 4; levels0,1,2,3 have no nonzero invariant. Empty witness is excluded.|Pass|no arbitrary default conductor.|
|1768 Casselman dimension; Lean casselmanNewvector|Spherical c=0 and Steinberg c=1, n=0,1,2|Dimensions 1,2,3 and 0,1,2; formula n+1−c with natural subtraction gives exactly these values.|Pass|n=c−1 gives 0.|
|1768 K₀ action; Lean casselmanNewvector_k0_character|c>0, g=diag(1,u) and diag(u,1)|First acts by ω(u); second by 1 since it lies in K₁. At c=0 lower-right entry may be 0, so theorem requires c>0.|Pass|zero denominator avoided.|
|1778 Normalized Whittaker vector|One-dimensional line with λ(z)=2z|Unique value-one vector 1/2; replacing λ by3λ gives 1/6. Zero functional gives no value-one vector.|Pass|None from this test.|
|1809 Ramified matrix test|Rank1 ramified χ and standard supported-unit Φ|βΦ=1/vol(O×) on O×; integral1=L(s,χ). Outside units Φ=0.|Pass|inverse central character cancels χ.|
|1820 Satake bound|Unitary spherical GL₂ roots q^a,q^(−a), a=0 or 1/4|For q=4, largest moduli1,√2 are strictly below √q=2; endpoint a=1/2 gives2 and violates strict bound.|Pass|negative control on endpoint.|
|1834 Global standard function (sample)|Trivial rank1 ℚ, χ=norm^t, zero test|Residues −1,+1; poles translate to −t,1−t. For Φ=0 both residues and the integral are0.|Pass|n≥2 entirety not extended to rank1.|
|1853 Centered order|f=1+z², exp z, exp z²|At x=R, logs grow log(1+R²), R, R². First two fit every power1+ε; third fails ε=1/2.|Pass|growth; supplier order R03.|
|1861 Paired factorization; Lean PairedHadamardFactorization|f=z²(1+z²)|m=2,c=1,γ₀=1 and other γ=0 sentinels; at z=1 both sides2, at z=i both0; parity (−1)²=1.|Pass|central zero removed before generic Hadamard. R03.|
|1865 Nonnegative derivatives; Lean PairedHadamard_derivatives_nonnegative|f=1+z², x=0,1|At0 derivatives of orders0–3 are1,0,2,0; at1 they are2,2,2,0.|Pass|no strict positivity for polynomial tails.|
|1865 Strict derivatives; Lean PairedHadamard_derivatives_positive|f=sinh z, x=1|Even derivatives sinh1>0, odd derivatives cosh1>0; zeros ±iπn give Σ_(n≥1)(πn)^(−2)=1/6.|Pass|nonpolynomial hypothesis distinguishes previous row.|
|1879 Maass standard series|Level1, αβ=1, a_p=α+β|Coefficient recurrence gives a_(p²)=a_p²−1; for α=β=1 values a_p=2,a_(p²)=3.|Pass|unitary coefficient normalization.|
|1911 Maass functional equation|Reflection parity δ=0 or1|Root sign (−1)^δ is1 or−1; at centre odd case forces Λ=−Λ hence Λ=0.|Pass|even case imposes no zero.|
|1922 Finite Maass adjoint (sample)|Self-pair roots α,α⁻¹, α=1 at test place|Pair denominator (1−T)^4; remove ζ factor to get (1−T)^3. General adjoint roots α²,1,α⁻².|Pass|exactly one scalar line removed.|
|1932 Maass Petersson normalization|r=0 and r=log2/π, first coefficient1, level1|Γ_R(1)³=1 at r0; cosh(log2)=5/4. Norm factors are2L(1,ad) and(8/5)L(1,ad).|Pass|missing factor2 would halve both.|
|1960 Whittaker realization|ℓ≠0 rank1; GL₂ u(x) at x=1/3|W(1)=ℓ(v); W(u(x)g)=ψ(x)W(g). Opposite character replaces e^(−2πi/3) by e^(2πi/3).|Pass|formulas; dependency R01.|
|1989 Uniform Whittaker estimates|Real Gaussian-like decaying test; compact versus unbounded parameter|On parameter t∈[0,1], y^t e^(−y)≤(1+y)e^(−y); for unbounded t, evaluation at y=2 gives2^t e^(−2), unbounded.|Pass|compact parameter hypothesis matters.|
|2003 Unequal/equal local RS integrals|n=2,m=1,s=1, W=2,W′=3, determinant norm4; equal ranks Φ=5,norm2|Unequal integrand2·3·4^(1/2)=12; equal integrand2·3·5·2=60. Gap3 allows j=0,1,2, not3.|Pass|exponents and range.|
|2035 Local convergence/continuity|Rank-one unitary pair q=3, s=1|Geometric series Σ3^(−m)=3/2 converges on the claimed closed boundary; nonunitary product norm^(−2) gives divergent Σ3^m.|Pass|unitary hypothesis distinguishes boundary test.|
|2046 Local RS factor|Unramified roots(2,3) and5; ramified quadratic pair|Polynomial1−25T+150T²; at T=1/100 L=200/153. Ramified pair at q3,s1 gives3/2 versus product of separate-factor roots1.|Fails as unqualified|R04: add unramified hypothesis.|
|2073 Normalized induction factors|Two inducing characters2,3 paired with5|Product (1−10T)⁻¹(1−15T)⁻¹ equals denominator inverse1−25T+150T².|Pass|normalization fixes extra modulus powers.|
|2084 Local RS equation|Rank1 odd real character paired with trivial|Normalized positive Fourier scalar i; applying twice gives−1, equal to odd character at−1.|Pass|None from this test.|
|2095 Holomorphic multiples (sample)|h(s)=1 versus exp(−s²)|For the latter, abs(h(iy))=e^(y²); gamma decay only e^(−Cabs(y)) cannot make a strip bound. Constant multiplier leaves gamma-type decay.|Pass|excludes arbitrary entire multiplier.|
|2106 Unramified RS test|Rank1 q=3, α=β=1,s=1|Spherical integral Σ3^(−m)=3/2; Euler factor(1−1/3)⁻¹=3/2; normalized value1.|Pass|None from this test.|
|2120 Cuspidal Fourier expansion|GL₂ unipotent quotient, nonzero character|Integral of nontrivial character on compact quotient is0; constant term of a cusp form is0, while its nonzero Fourier coefficient can be1.|Pass|reconstruction does not keep the constant term.|
|2143 Global Whittaker factorization|Two nontrivial local values2,3 and all other reference values1|Pure tensor evaluation6; changing one reference value by2 changes scalar to12.|Pass|scalar choice retained.|
|2161 Ordinary multiplicity one|One irreducible cusp representation with two-dimensional level invariants|Embedding multiplicity1 can coexist with level dimension2; two independent embeddings would give multiplicity2 and violate theorem.|Pass|multiplicity is not level dimension.|
|2186 Mirabolic Eisenstein definition|n=2, norm(det g)=3, theta summand5, norm(a)=2, eta=1,s=1|Displayed integrand is3·5·2²=60; dropping n would give30.|Pass|theta value5 is not a unitary-character value.|
|2202 Theta–Mellin Check|n=2 with one nonzero lattice vector contribution a(t)|Mellin variable occurs as t^(2s); substitution u=t² has dt/t=du/(2u), giving factor1/2.|Pass|n=1 gives factor1.|
|2214 Mirabolic continuation/residues|n=1,2; trivial central character|Residue magnitudes κΦ̂(0)/n are κΦ̂(0), κΦ̂(0)/2; dual pole has opposite sign.|Pass|factor1/n; no assertion at totalized poles.|
|2227 Global RS unfolding|Pure tensor with local normalized integrals1 except two values2,3|Unfolded product6; rescaling one cusp test by2 makes both global integral and product12.|Pass|multilinearity test.|
|2241 RS poles (sample)|π₁=1,π₂=norm^(2i) on GL₁|Completed pair equals shifted rank-one function, poles −2i,1−2i; relation uses σ=−2. Untwisted self-pair poles0,1.|Pass|excludes an unshifted-only pole rule.|
|2252 Global RS equation|Self-dual unitary pair at centre|Conductor power N^(1/2−s)=1; twice applying the equation gives root-number product1.|Pass|normalization test.|
|2265 Boundary nonvanishing|ζ(1+it), t≠0; t=0|Boundary points t≠0 are nonzero; t0 is a simple pole, not a zero or finite-value assertion.|Pass|pole handled meromorphically.|
|2279 Strong multiplicity one|Distinct GL₁ finite-order characters|If they differ at a Frobenius value, local factors1−αT and1−βT differ with α≠β. Equal almost everywhere would contradict character density.|Pass|rank-one control; not a proof in higher rank.|
|2290 Isobaric multiplicity one|Sums with root multisets{2,3},{3,2},{1,6}|First two yield1−5T+6T²; third1−7T+6T². Determinant alone does not identify sums.|Pass|None from this test.|
|2304 Adjacent-rank normalized period|Unramified local test with integral L=3/2|Dividing by L gives1; scaling W by2 gives2. At centre determinant exponent removes the covariance mismatch.|Pass|nonzero denominator initially used then continuation.|
|2327 Central period factorization|Two local normalized factors2,3|Product6; replacement by1 at every unramified place leaves6. Zero selected local test gives global product0.|Pass|nonzero test choices matter.|
|2340 L-data|q=2,P=1−T,s=1; zero-polynomial negative control|Euler value2; P(0)=1. P=0 has constant0 and is excluded; q=1 violates q>1.|Pass|junk inverses do not define continuation.|
|2352 Finite-strip boundedness|e^(s²) and e^(−s²) on abs(Re s)≤1|First modulus≤e and decays vertically; second at s=it has modulus e^(t²), unbounded.|Pass|pointwise holomorphy not a strip bound.|
|2362 Pinned niceness|N=4 with balancing C(s)=4^(s/2)L(s)|Factor4^(s/2)4^(1/2−s)4^(−(1−s)/2)=1. Self-pair with simple pole fails entirety.|Pass|root/conductor must be specified.|
|2372 Eigensystem/RS data|Arithmetic roots2,3,q=4,h=1/2|Unitary roots1,3/2; dual roots1,2/3; dual polynomial1−(5/3)T+(2/3)T².|Pass|coefficientwise inverse gives wrong polynomial.|
|2387 Full-rank converse|n=2 and3; determinant GL₃|Twist ranks are{1} and{1,2}; determinant representation has Whittaker dimension0 and is excluded.|Pass|range/genericity controls; no numerical proof of converse.|
|2400 Reduced-rank converse|n=3,S empty; n=2 negative control|Allowed twist ranks{1}; n2 would give empty set and no information, but n≥3 excludes it. At nonempty S equality is only outside S.|Pass|scope.|
|2416 Curve additive analysis|X=ℙ¹ over 𝔽₂, differential dt|deg div(dt)=−2; integral-volume-one adelic quotient volume q^(g−1)=1/2. Product differential scaling q^(1−g)=2 makes self-dual quotient volume1.|Pass|two measures distinguished.|
|2422 Rank-one unramified reciprocity|Degree character with value ζ of order3|Geometric eigenvalue ζ gives polynomial1−ζT; arithmetic eigenvalue is ζ⁻¹≠ζ.|Pass|inverse Frobenius convention matters.|
|2428 Function-field local factors/converse|Rank1 unramified character q=2|Polynomial1−αT; tensor with inverse has1−T. Rank-one reciprocity supplies character instead of a vacuous rank-zero twist family.|Pass|None from this test.|
|2438 Ramified reciprocity|Artin–Schreier x²−x=t⁻¹ and x³−x=t⁻²|Swan conductors1,2; nontrivial rank-one Artin conductors2,3. Pole order divisible by p is outside the reduced-form hypothesis.|Pass|wild controls at2,3.|
|2448 Curve slopes/HN|ℙ¹, O(1)⊕O(−1), O² and line O(c)|Slope sequences(1,−1),(0,0),(c); determinants have degrees0,0,c. Nonzero destabilizing line has slope1>0.|Pass|no canonical splitting asserted.|
|2458 Polygon semicontinuity|Family with generic O² and special O(1)⊕O(−1)|At rank coordinate1 the polygon height rises0→1; at coordinate2 both heights0.|Pass|direction; reverse semicontinuity would fail.|
|2468 Bounded bundle loci|ℙ¹ degree0 bundles O(m)⊕O(−m)|Instability2m is unbounded as m→∞; fixed slope bound B allows only m≤B.|Pass|degree alone does not imply boundedness.|
|2476 Two-leg shtukas|Rank1 and2|Relative dimension2r−2 equals0 and2; modification length1 at each leg gives net degree change0.|Pass|arbitrary thickened base retained.|
|2482 Leg-in-level counting|Lower rank1, nonempty level D|A nontrivial rank-one conductor supported at D contributes at a leg in D; deleting that term gives0 where its character value is a nonzero root of unity.|Pass|need for ramified lower-rank input; full fixed-point calculation not independently reproduced.|
|2492 Normalized IC purity|Nodal rational curve versus smooth ℙ¹|Nodal ordinary H¹ has dimension1, weight0; its intersection H¹ has dimension0. Smooth curve IC=ℚℓ[1], pure weight1.|Pass|proper singular ordinary cohomology is not pure by itself.|
|2510 Shtuka IC/essential comparison|r=1 and2|Required essential degree0 or2 and weight0 or2. Boundary rank-one×rank-one constituent is negligible for r2.|Pass|degrees; generic scheme purity alone insufficient for descent.|
|2531 Ramified rank induction|Induction at r=2, lower rank1 with conductor at D|Lower-rank set includes ramified characters; restricting to D=0 loses nontrivial conductor examples of Artin conductor2.|Pass|full-level prerequisite; no good-places shortcut.|
|2539 Essential cohomology (sample)|r=1; r=2 external rank1×rank1 and rank2×rank2|Negligible ranks: none at r1; rank1 product negligible at r2; rank4 external product with irreducible rank2 directions not negligible.|Pass|total dimension is not the criterion.|
|2556 Pure realization|Rank1 finite-order degree character and unit-modulus transcendental twist|Finite-order eigenvalue ζ has algebraic absolute value1; transcendental b with abs(b)=1 retains fixed-embedding purity but is not an algebraic Weil number.|Pass|two purity claims distinguished.|
|2562 Tensor cohomological determinant|Constant line on ℙ¹ over 𝔽₂|H⁰ eigen1,H¹=0,H² eigen2; L(z)=1/((1−z)(1−2z)).|Pass|sign/duality; swapped H⁰/H² would move poles.|
|2567 Weight suite|ℙ⁰,ℙ¹,G_m,Spec 𝔽_(q²)|H²(ℙ⁰)=0; ℙ¹ H² eigenq. G_m H¹ eigenq,H_c¹ eigen1; extension point counts0 for odd degree,2 for even.|Pass|boundary, twist and component controls.|
|2621 Function-field pair Euler product|Rank1 pair valueα,β at degree2 place|Factor(1−αβ⁻¹z²)⁻¹; replacing z² by z changes linear coefficient0 toαβ⁻¹.|Pass|place-degree and dual convention.|
|2651 Cuspidal pair degree/poles|Self constant line, genus0, q=2,d=1; genus2,n=2,d=1|First degP=−2+2=0,Q=(1−z)(1−2z). Second degP=8+2=10,Q degree2.|Pass|nonexistent high-rank genus0 input not a negative degree example.|
|2662 Polynomial reflection|Genus1 self line, P(z)=1−az+qz²|qz²P(1/(qz))=qz²−az+1=P(z); eigenvalue pair productq. Genus0 P=1 gives1=1.|Pass|parity and factor q^(D/2).|
|2686 Open-disc index (sample)|z,1/z,z−1,z/z; q2 genus0 zeta ratio|Indices1,−1,0,0. L(z)/L(z/2)=(1−z/2)/(1−2z) has one inside pole and outside zero, index−1.|Pass|multiplicities, cancellation and boundary.|
|2714 Whittaker conductor shift|n=2,n_v=1|t=diag(ϖ⁻¹,1) conjugates u(x) to u(ϖ⁻¹x); new character ψ(ϖ⁻¹x) has conductor O. Global Σn_vdeg v=2g−2, equal−2 on ℙ¹.|Pass|direction and negative global degree.|
|2728 Rational periods/twists|E=ℚ; infinity vector scaled by2 or i; n1,n2|Period class unchanged by2, changed by i. Gauss exponent n(n−1)/2 equals0,1.|Pass|arbitrary infinity-vector change requires a∞.|
|2768 L-group determinant|Satake matrix diag(2,3), zero-dimensional r|Polynomial1−5T+6T²; dimension0 determinant and Euler factor1. Conjugation by swap leaves polynomial unchanged.|Pass|r dimension0 is harmless.|
|2792 Partial-product convergence|Trivial unitary GL₁ over ℚ; nonunitary norm^(−2) control|At s=2 product equals ζ(2)=π²/6; at s=1 it diverges. Norm^(−2) gives ζ(s−2), with threshold3, and is outside the unitary input.|Pass|sufficiently-right claim; no general-r continuation follows.|
|2806 Parameter transport (sample)|Rank1 geometric eigen2; classical weight2 at q4|Geometric polynomial1−2T versus arithmetic eigen1/2. Weight2 motivic shift1/2 scales a unitary root by2.|Pass|conditional arithmetic dictionary; no ramified correspondence constructed.|
|2819 Factor operations|Scalars2,3; noninvertible zero matrix control|Direct sum1−5T+6T²; tensor1−6T; dual scalar2 gives1−T/2; twist c3 sends1−2T to1−6T. Zero matrix has no dual operator.|Pass|dual requires invertibility.|
|2838 Exterior factors|diag(2,3), exterior degrees0,1,2,3|Operators have eigenvalues1;(2,3);6;empty. Polynomials1−T;1−5T+6T²;1−6T;1.|Pass|no transfer inferred from polynomial algebra.|
|2849 Motivic centre|n=1 and2 for weight2n−1|Weights1,3; unitary centre1/2 shifts to motivic centres1,2.|Pass|dimensions/purity do not identify factors.|
|2875 Finite Euler corrections|E(s)=1−3^(−s),s=0; L with simple pole|E has value0 and order1; multiplying a pole of order−1 gives order0, not necessarily a zero.|Pass|meromorphic order and no cancellation at value0.|
|2899 Correction leading term|E and E² at0|E′(0)=log3; (E²)″(0)=2(log3)². Leading coefficient of E² is(log3)², not twice that.|Pass|factorial convention.|
|2915 Complex period/stabilization dictionary|β=ε(p)p^(k+1)/α, p3,k0,j1,α=ε=χ=1|β=3; removed β-factor1−β·3^(−2)=2/3; first factor1−3=−2.|Pass|product−4/3 and inverse-character choice retained.|
|2931 Critical value/period|γ=2,F=6,N=3,C=γF|C=12 and C/(γN)=2=F/N. γ=0 would destroy division and is excluded.|Pass|conditional algebraicity; scalar test proves no period theorem.|
|2944 Central sign|Root number−1 and finite central value|Λ(1/2)=−Λ(1/2) forces0; root number+1 gives identityx=x, not vanishing.|Pass|one-way implication.|
|2958 Ordinary interpolation (sample)|p3,k=j=0,α=1; ramified χ; k0,j1; α=±i√3|Values0;1 with separate α^(−ν);−4/3; and2/3±2i/√3. Natural truncation would give0 in the third test.|Pass|refinement and integer exponent essential.|
|2984 Conductor/test-vector comparison|Unramified GL₂ twisted by ramified character of conductorν=1 or2|Standard factor1 and conductor2 or4; rank1 conductors1 or2. Twisting an already ramified representation is not covered.|Pass|all-place compatibility with explicit hypothesis.|

The table contains **152 rows**, including all 15 seeded targets, all 15 admitted theorems, definition normalizations and the additional curve/weight and interpolation targets. These are explicit tests and convention checks, not a claim that a finite sample proves every general statement.

## Not verifiable

- **Primary paywalled texts:** the source service returned `uncertified` for `godementjacquet1972` (including Global Theory pp.136–184), `kudla2004` (Chapter 6, especially local classification/eigenlines and normalization equations), `casselman1973` (Theorem 1 p.302 and proof pp.303–306), `jacquetlanglands1970` (§11 p.183), `bushnellhenniart2006` (§§7.2,9.11), and `serrelocal`. Their publishers/DOI routes were checked; no paywall was bypassed. They remain locator-only citations. Secondary open descriptions and explicit calculations do not certify these primary proof passages.
- **Image-only Clozel and Gross–Zagier:** the legal editor-hosted volume for `clozel1990` was also retrieved without usable OCR for the cited chapter. The linked legal copy for `grosszagier1986` was fetched, but its extraction supplies no readable formula text and OCR is unavailable. The Bessel identity was checked on the elementary half-integer instance above; its precise printed locator was not certified.
- **Gelbart–Shahidi:** the DOI and explicit AMS PDF endpoints were tried. The final publisher response was an HTML journal listing, not the article text (`gelbartshahidi` lines 700–702 identify the title). It does not certify the cited strip-bound proof. The missing-reference ledger retains this item; the review is finished without waiting for it.
- **Version and proof limits:** the recovered Raghuram arXiv v2 is available, but correspondence of every page locator to the README's author-revised manuscript was not certified. The seeded Lafforgue claims were checked at the indicated propositions; this review does not certify every step of the 200-page rank-induction proof. Borel's conditional local-parameter discussion is not a primary verification of the particular modern Hilbert normalization example.
- **Ownership access:** ownership was checked against the provided open heads and the roadmap index searches, with relevant hits opened as listed above. The board's package index exposed package names but no additional readable mathematical files for those entries; no unseen package content is certified. No unspecified open pull request was fetched individually to manufacture an ownership finding.

## Source issues

- **Error** in humphriesarch at §2.4.4, equation (2.18), printed p.8: the source gives negative powers of i for archimedean epsilon factors; it should give positive powers with its positive Fourier character, as the odd real Gaussian shows; affects a stated result.
- **Misprint** in yu2023 at equations (6.1.1)–(6.1.2), printed p.42: the Hom arguments are reversed relative to the displayed tensor sheaves; they should be Hom(F₂,F₁) for H⁰ and Hom(F₁,F₂) dual with twist −1 for H²; affects the proof.

For the first issue, `humphriesarch` lines 118–119 fix the positive character, lines 390–397 fix the positive Fourier equation, and lines 425–431 give the incompatible phases; the calculation F⁺(x exp(−πx²))=i x exp(−πx²) gives i rather than −i. The README already avoids that sign. For the second, `yu2023` lines 2278–2280 can be checked with two arithmetic rank-one sheaves of Frobenius values ζ and 1: F₁⊗F₂∨ has value ζ, while Hom(F₁,F₂) has ζ⁻¹. The self-pair degree and pole conclusion is unchanged.
