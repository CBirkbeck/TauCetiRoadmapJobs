<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13156#issuecomment-6786860637 -->
Review (codex) of 7157e2c

Verdict: needs_changes

1. **F01** (P2) The summary identifies middle polynomials with the wrong local factors

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:6`: “the middle factors are the Euler factors of a motive `M_k` over `ℚ`”.

   **Claim:** The finite-field middle factors describe the motive's Euler factors at every prime in the stated all-prime scope.

   **Witness:** At `k=6,p=3`, §8.1 gives `M₆(3;T)=1`, whereas §8.6 gives inverse Euler factor `1+27T` (`packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1856`, `:2014`; FSY line 2156, equation (5.22)).

   This fails even if “Euler factors” means inverse Euler polynomials. The actual local factor is `(1+27T)⁻¹`. Independently summing over `F₃,F₉,F₂₇` gives sixth symmetric moments `26,−730,19682`; the exponential-series coefficients are `1,26,−27,0`, agreeing with `Z₆(3;T)=(1−T)(1+27T)`. The weight-six boundary contribution is retained in the motive's inertia-invariant Euler polynomial although its finite-field middle polynomial is `1`.

   **Exact repair:** Replace the quoted identification by: “the middle cohomology defines a motive `M_k` over `ℚ`; its Euler factors are determined from the middle polynomials and the bad-prime corrections in Layer 8, with the even prime-two factor established in Layer 11”. Continue with its weight and Hodge-number assertions. Retain all primes and the existing explicit formulas; restricting the roadmap to good primes is not a repair. On the refuting instance this says `L₆(3;T)⁻¹=M₆(3;T)(1+27T)=1+27T`, which agrees with both direct summation and §8.6.

2. **F02** (P2) Rank-two quotient purity precedes its necessary monodromy input

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1053`: “pure of weight `2k + 1` when `r = 2`”. Its Needs at `:1126` names the Hodge supplier only through §§11.1–11.4. The specialized assertion recurs at `:1117`.

   **Claim:** §3.6 supplies the exact rank-two weight of the constant quotient, before the local structure of §5.4.

   **Witness:** FSY lines 762–767 derive this weight from the single infinity Jordan block of Corollary 4.10. That block is owned by §5.4 (`packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1381`), whose Needs at `:1395` already includes §3.6.

   The general weight bound in §3.6 is supported by its existing inputs. The stronger purity assertion also needs the infinity monodromy and the primitive-part comparison of `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:963` (§11.6), which is absent from this target's Needs. Merely adding §5.4 to §3.6 would create an internal cycle. The cross-roadmap dependency checker cannot detect this missing internal edge.

   **Exact repair:** Keep the construction, regularity, exact sequence, pure subobject of weight `nk`, lower bound `weights(M′^H)≥nk+1`, and the repaired exponential-fibre/Fourier-cohomology distinction in §3.6. Move its specialized assertion `weight(M′^H)=2k+1` and its module/variation-weight explanation to a corollary after the infinity-block calculation in §5.4. Give that corollary separate Needs: §3.6, the preceding §5.4 local-structure theorem, and MixedHodgeModulesAndIrregularHodgeTheory §11.6. Attribute the earlier illustrative rank-two quotient computations to this later corollary; they must not serve as inputs to the construction. Update the Layer 5 supplier list accordingly. §6.4 already consumes §5.4.

   **Repair test:** At `k=1,2,3`, the block of `ΠM` has length `k+1=2,3,4`, centred at weight `k`. Its top primitive has weight `2k=2,4,6`; the constant Hodge module has weight `2k+1=3,5,7`, and its Fourier contribution has weight `2k+2=4,6,8`. The general earlier bounds are respectively `≥2,≥3,≥4`. Thus the moved corollary recovers the same values, while the order becomes general §3.6 → local §5.4 → quotient-purity corollary → §6.4, with no reverse edge. This is a dependency repair, not a claim that the specialized mathematical statement is false.

## Verified sound

### Previous review, finding by finding

The preceding review has one finding, F01. Its repair report marks it applied, not “not actionable”. I checked the repaired passages and their new dependencies against the supplier and source, then searched the rest of the package for the same weight-shift error.

| Previous finding | Repaired passage | Computation and status |
|---|---|---|
| F01: universal shift of the exponential fibre | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1073`: “it is pure of exponential weight `nk`: a pure input gives its own weight, with no shift”. | **Repaired.** At `r=2,k=2`, the fibre has dimension `3`, weight `2`; Fourier cohomology has dimension `1`, weight `4`, not `3`. |
| F01, Fourier-cohomology alternative | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1083`: “`gr^W_{nk+1+i}H¹(𝔸¹_t, FT M^H) ≅ P_i(−1)`”. | **Repaired.** At `k=2`, `(dim P₀,dim P₁)=(0,1)`, giving weight `4`; at `k=3`, `(3,0)`, giving weight `4`. For zero nearby space both `N=0` and purity are vacuous, consistently. |
| F01, dependent classicality route | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1162`–`:1183` computes the lowest piece and compares its dimension with middle cohomology by stationary phase. | **Repaired.** At `k=2,3,4`, Fourier dimensions `1,3,3` minus higher primitive dimensions `1,0,1` give middle dimensions `0,3,2`, exactly the cover formula. |

The changed scope and supplier clauses now include Fourier cohomology (§11.1), exponential weights (§§6.4–6.5), and the already declared irregular-stationary-phase contract. The added `k≥1` excludes the punctual `k=0` example, for which `H⁰(FT δ₀)=C`. The exact-sequence dimensions for `k=1,2,3,4` are `1+1=2`, `1+1=2`, `3+1=4`, `3+1=4`. None of these repairs reintroduces the former shift.

The five older repaired patterns reported in round 4 were also checked in their current uses: degree-weighted closed points (`−2`, not `−1`, for the degree-two puncture); localization on regular `M`, not irregular `FT M`; the constant quotient outside the exponential subcategory (`ΠM′=0`); separate open and proper resolutions (`dim gr²H³_c=1` versus `dim gr²H³=0` at `k=4`); and the Euler product applied to `LSeries.term` (`f(0)=0`). No recurrence was found. R02 concerns the location of the specialized quotient-purity proof, not the repaired category or fibre statements.

### Coverage, principles and shape

Read all **58 numbered targets**, their API bullets and Checks, all **58 Needs lines**, all **12 layer dependency paragraphs**, the conventions and supplier contracts, and all 21 Lean declarations. Untouched sections previously summarized without computed rows were reviewed afresh. A complete target-level working ledger records computed discriminants; the table below selects the seeded sample, headlines, changed passages and findings for this report.

The package keeps finite characteristic two, arbitrary characteristic-zero ranks `r≥2`, positive symmetric powers, inseparable cyclic factors, odd bad primes of higher thickness, and the existential even prime-two factor. It does not replace these with a good-prime-only route. Rank zero is handled separately when applying positive-rank automorphy. No algorithmic target, sorry'd data, stand-in predicate, copied source passage, forbidden supplier, or re-planning of an existing roadmap was found. The organization follows the needed geometry: the finite-field and connection branches meet through the hypersurfaces, and the rank-two calculations feed the Hodge and arithmetic branches. The misplaced specialized claim is R02; no source-chapter heading or instruction to follow a source's exposition was found.

The README has the required heading, summary, scope, conventions, exact contracts, build explanation, layer Examples and Dependencies, downstream consumers and references. Definitions have APIs and at least three Checks. Compared shape with `TauCetiRoadmap/TensorProductCombinatorics/README.md:1` and `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md:1` on main. No process dates, PR numbers, job references, HTML anchors, machine paths or LaTeX delimiters occur in the roadmap prose. Metadata is `topic = "math.NT"`.

### Seeded source checks

The legal cached texts were read at all **15 sampled locators**. FSY is arXiv:1810.06454v5, XZ is arXiv:1910.13391v2, and Serre-orthogonal is arXiv:1708.00046v3. The manifest records their version-specific numbering, one key per work. The fourth work, Saito-orthogonal, remains settled as uncertified; its original text was not read. There were no other author-flagged unverified locators, no missing manifest work and no new fetch or manifest edit.

| Target | Source locator read | Support and scope |
|---|---|---|
| §0.2 Kloosterman sums and moments | FSY lines 60–79, (1.1), printed p.2 | Unit-parameter sum, negative trace sign and symmetric eigenvalue sum; nontrivial additive character retained. |
| §0.3 Generating series | FSY lines 80–101, (1.2)–(1.5), pp.2–3 | Positive extension degrees, positive sign in the exponential, polynomiality for positive `k`; no polynomial claim at `k=0`. |
| §2.1 Connections | FSY lines 425–505, Proposition 2.4 and Lemma 2.5, pp.10–12 | Rank `n+1`, exponential direct image and cyclic presentation. Characteristic-zero descent uses the displayed rational relative complex; scalar-horizontal and cyclic-module signs differ as stated. |
| §2.2 Cyclic cover | FSY lines 429–440, p.10; lines 893–904, (3.9), p.21 | `z=t^r`, substitution `x=ty`, inverse deck action on `y`, and invariants. Characteristic zero ensures the cover is étale. |
| §3.3 Tensor Thom–Sebastiani | FSY lines 565–612, Proposition 2.10 and Corollary 2.11, pp.13–14 | Relative degree `nk`, the Koszul permutation character, and tensor-to-convolution identification. |
| §3.6 Inverse Fourier objects | FSY lines 678–767, (2.17)–(2.23), Proposition 2.21 and Lemma 2.24, pp.16–18; lines 2912–2942, Remark A.6 and (A.8)–(A.9), p.64; lines 3256–3270, Corollary A.31, p.72 | General construction and repaired weights supported. Source explicitly uses the later infinity block for the specialized quotient weight: R02. |
| §5.1 Rank-two frame | FSY lines 1075–1093 and 1131–1139, (4.1)–(4.5), pp.26–27 | Cyclic basis, determinant and symmetric-power coefficients; no division by a possibly zero coefficient. |
| §5.6 Explicit bases | FSY lines 1287–1328, Proposition 4.14, Lemmas 4.15 and 4.17, pp.30–32 | Separate odd determinant and even kernel; ordinary and cover index ranges. |
| §6.3 Newton weights | FSY lines 1474–1495, §4.3.1, p.35 | Supporting hyperplane, cone, odd nondegeneracy and degrees `2j,j`. Even balanced critical points excluded from the nondegenerate branch. |
| §6.5 Hodge filtration on bases | FSY lines 1456–1471, Proposition 4.21, p.34; lines 1510–1645, proof in §§4.3.2–4.3.3, pp.35–38 | Odd full formula; even upper-filtration range; factor two in pullback, then symmetry for the remaining Hodge numbers. |
| §7.2 Arithmetic quadratic singularities | FSY lines 1771–1784, §5.1.3, p.41; lines 1870–1873, p.43; lines 1971–1982, §5.1.4, p.45 | Odd/even orbit labels, quadratic forms, characteristic-two exception; the roadmap correctly retains higher valuations omitted in a later source proof. |
| §7.4 Galois realizations | FSY lines 1732–1739, (5.5), p.40; lines 1840–1869, (5.9), pp.42–43; lines 2030–2051, (5.19)–(5.20), p.46 | Boundary kernels, projected compact-support image, Tate twist, and the distinction between open resolution and proper closure. |
| §8.1 Middle polynomial and weights | FSY lines 1668–1731, (5.1)–(5.4), pp.39–40 | Purity of middle image, boundary weights, all-prime cases and full exponent `k+1` in reciprocal pairing. Source exponent slip is corrected here. |
| §8.6 Even Euler factors/conductor | FSY lines 1983–1994, Theorem 5.17, p.45; lines 2153–2192, (5.22), pp.48–49 | Odd-prime inertia invariants, monodromy rank, extra weight-`k` factors and conductor. The formulas contradict the summary, as R01 records. |
| §11.3 Odd root number | FSY lines 2654–2657, §5.3.3, p.58 | FSY invokes Saito for the orthogonal even-weight motive. The roadmap supplies the geometric projector/boundary-kernel setting through its declared contract. Direct certification of Saito is unavailable and remains settled. |

### Adversarial computations

Finite-field rows were independently recomputed with exact field arithmetic, trace characters, the symmetric-trace recurrence and `n c_n=Σ_{j=1}^n m_j c_{n−j}`. For `F₃,F₉,F₂₇`, conjugate character contributions were combined exactly, not rounded numerically. Geometric rows compute the relevant ranks, weights, twists, local equations or filtrations; they are not claims that finite examples prove the theorems.

| Statement | Instances | Values computed on both sides / wrong model | Result; change |
|---|---|---|---|
| §§0.1–0.2 symmetric trace and sign | `F₂,a=1,k=0,1,2,3`; `F₃` | Raw sum `1`, trace `−1`, determinant `2`; symmetric traces `1,−1,−1,3` versus powers `1,−1,1,−1`. Over `F₃` raw sums `−1,2` give first moment `−1`. | Correct. |
| §0.2 character and parameter domains | trivial character over `F₅`; parameter zero | First moment `−(5−1)²=−16`, not nontrivial-character value `−1`; at zero the eliminated sum is `−1`, whereas the product-fibre sum is `0`. | Hypotheses/comparison domain correct. |
| §0.3 and integrality/degree headline | `p=2,k=3` | Moments `3,−17,63,−257`; coefficients `1,3,−4,0,0`; product `(1−T)(1+4T)` gives exactly these; degree `2=(3+1)/2`. | Correct. |
| Same headline, even case | `p=2,k=12` | Moments `−1,−8193,−1,−33554433`; coefficients `1,−1,−4096,4096,0`; `(1−T)(1−4096T²)`; degree `3=⌊14/4⌋`. | Correct. |
| Zeroth-moment exclusion | `p=2,k=0` | Moments `1,3,7,15`; coefficients `1,1,2,4,8`; `(1−T)/(1−2T)`, not a polynomial. | `k>0` retained. |
| §2.1 connection signs | ranks `2,3` | Cyclic equation `θ^r e=ze`; scalar horizontal equation has `+z` for rank two, `−z` for rank three. | Correct. |
| §2.2 cyclic cover | `r=3` | `ty` transforms by `ζζ⁻¹=1`; wrong deck action gives `ζ²≠1`; `dz/z=3dt/t`. | Correct. |
| §2.3 index convention | degree-two puncture on `P¹_Q` | `χ=0`, weighted irregularity `2`, index `−2`; after splitting `−1−1=−2`; unweighted formula `−1`. | Older repair remains correct. |
| §3.3 tensor signs/shifts | `(r,k)=(2,2),(3,2)` | Relative degrees `2,4`, total degrees `3,5`; swaps of factors give signs `−1,+1`. | Correct. |
| §3.6 regularity/localization | `r=2,k=1` | Ranks `(G,M,ΠM,M′)=(2,1,2,1)`; `M` irregularity `0`, transform slopes `1,1` and irregularity `2`. | Localization input correct. |
| §3.6 repaired fibre/Fourier weights | `r=2,k=2,3` | Fibre dimensions/weights `(3,2),(4,3)`; Fourier dimensions/weights `(1,4),(3,4)`. Formula `P_i(−1)` gives `2+1+1=4`, `3+1+0=4`. | F01 repaired. |
| §3.6 exact sequence and excluded input | `k=2,3`; `k=0` | Fourier dimensions `1+1=2`, `3+1=4`; quotient weights `6≥4`, `8≥5`. At zero `H⁰(FTδ₀)=C`, dimension `1`, not `0`. | Added hypotheses sufficient. |
| §3.6 specialized quotient purity | `k=1,2,3` | Infinity blocks length `2,3,4`; primitive weights `2,4,6`; module weights `3,5,7`; Fourier weights `4,6,8`. | Values correct; move proof after block input, R02. |
| §4.1 repaired middle-weight route | cover `k=2,3,4` | Fourier dimensions `1,3,3`; high primitives `1,0,1`; middle dimensions `0,3,2`, matching `k−2,k,k−2`. | Correct. |
| §4.3 twist / §7.4 realization | `k=3`; `k=6` | Hypersurface degree/weight `2,2`, twist `(−1)` gives weight `4`, type `(2,2)`, rank `1`. At `k=6`, rank `2`, alternating pairing multiplier `p⁷`. | Correct. |
| §5.1 frame | `k=2` | `θu₀=2u₁`, `θu₁=u₂+zu₀`, `θu₂=2zu₁`; rank `3`, not tensor-square rank `4`. | Correct. |
| §5.6 bases | odd `k=1,3`; even `k=2` | Determinants `−z,9z²`, matching `(k!!)^2(−z)^((k+1)/2)`; even kernel `θ(u₂−zu₀)=2zu₁−2zu₁=0`. | Correct. |
| §6.1 fan / projective contract | `k=1,2,3` | Rays `2,8,26=3^k−1`; cones `2,8,48=2^k k!`; supports `(1),(2,3),(3,5,6)`; `k=1` gives three sections and the conic embedding. | Correct, conditional on declared toric contract. |
| §6.3 Newton degrees | monomials `x,z/x`; `k=1,2` | Weights `2·0+1=1`, `2·1−1=1`; `deg z=2`, `deg t=1`. At `k=2`, `(x₁,x₂,z)=(1,−1,1)` makes all logarithmic derivatives zero; at `k=1` none exists. | Odd/even distinction correct. |
| §6.5 explicit filtration | `k=3`, ordinary basis `j=0,1` | `F⁴` dimension `1`, `F²` dimension `2`, `F⁵` dimension `0`; pullback is `2t^{2j}dt/t`, not `t^jdt/t`. | Correct. |
| Hodge headline §§6.4,6.6 | `k=2,3,5,6,8` | Cover `k=2`: `(2,2),(3,3)` weights `4,6`. Descended middle `k=3`: `(2,2)`; `k=5`: `(2,4),(4,2)`; `k=6`: `(2,5),(5,2)`; `k=8`: `(2,7),(7,2)`. | Correct; even min-bound excludes spurious `(4,5),(5,4)`. |
| §7.2 arithmetic thickness | `k=9,p=3,a=1,3` | Constants `6,18`, valuations `1,2`; over `Q₃(√−3)` uniformizer exponents `2,4`, not uniformly `2`. | Higher-thickness contract necessary and present. |
| §§7.3–7.4 open/proper distinction | `k=4`; `k=6,p=3` | Open `dim gr²H³_c=1`; smooth proper `dim gr²H³=0`; positive orbit `b=2` survives horizontal `b=0` resolution. | Older repair remains correct. |
| §8.1 and root-weight headline | `p=2,k=3,5,8` | Middle polynomials `1+4T`, `1−4T+64T²` have root norms `1/4,1/8`; `k=8` gives `Z=(1−T)(1−16T)`, remaining norm `1/16`, weight-eight branch. | Correct. |
| §8.1 reciprocal pairing | `p=2,k=3` | Eigenvalue `−4`; `2⁴/(−4)=−4`; source's half exponent would give `−1`. | Corrected source slip not repeated. |
| Summary and §8.6 | `k=6,p=3` | Direct moments `26,−730,19682` give `Z=1+26T−27T²`; middle polynomial `1`; inverse Euler polynomial `1+27T`; linear coefficients `0≠27`. | Summary false as an all-prime identification; R01. |
| §§8.3,8.5 local correction | `k=9,p=3` | `Θ⁺={3}`, `Θ⁻={1}`; extra eigenvalue `243`; dimensions `V=4`, invariants `3`, middle `2`. Conductor `105`; radical-product alternative `315`. | Correct. |
| §§8.4,8.6 monodromy | `k=6,p=3`; `k=4` | `dim V=2`, `dim U=1`, `dim V^I=1`, `rank N=1`, `N²=0`; at `k=4`, dividing by `(1−T)(1−p²T)` leaves `1`. | Correct; does not discard `N`. |
| §10.2 normalization | dimensions `0,1,2`; `d=1,s=3` | Standard/paper ratios `1,√π,π^(3/2)`; values `π⁻¹` versus `π^(−3/2)`. | Nonzero constant retained. |
| §10.4 Euler adapter | constant local series; `s=0` | Raw coefficient at zero `1`, raw sum `2`; `LSeries.term` at zero `0`, series `1`, product `1`. Normalized `1+T−T²` gives evaluated product `1` at `s=0` but prime coefficients `1`, hence nonsummability. | Correct hypotheses; old repair retained. |
| §11.1 regular/polarized headline | `k=1,3,5,6` | Ranks `0,1,2,2`; Hodge sets `{2}`, `{2,4}`, `{2,5}` distinct; orthogonal even-weight and symplectic odd-weight branches have correct parity. | Positive-rank theorem and zero case separated. |
| §11.2 coefficient prime | `p=2,k=3,5` | `Z₃` valuations `0,0,2`; `Z₅=1−5T+68T²−64T³` valuations `0,0,2,6`; equal to `n(n−1)` on displayed coefficients. | Full coefficient-prime supplier used, not just away-prime compatibility. |
| §11.3 odd root number | `k=3`; `k=1` | Quadratic Gauss sum `i√3`; normalized root `i√3/(i√3)=1`; empty-product root `1`. | Consistent with FSY; Saito remains uncertified. |
| Odd functional-equation headline | `k=1,3` | At `k=1`: `d=0,N=1,L=1,Λ=1`, both sides `1`. At `k=3`: weight `4`, reflection `5−s`, centre `5/2`. | Correct family signature. |
| Even functional-equation headline | `k=2,4,6` | At `k=2,4`: `r=0,P=1,ε=1,Λ=1`, both sides `1`. At `k=6`: `d=2,N′=3`, reflection `8−s`, centre `4`. | Correct existential prime-two completion. |

### Pinned-library and duplication audit

Used the open-roadmap `list`, `grep` and `show` tools, read the board-package index, and searched objects rather than just the proposed names. The native search for Kloosterman, Nori, exponential mixed Hodge structures, irregular Hodge filtrations and potential automorphy found no native construction under those descriptions. Nearby generic APIs were opened and compared; absence is not inferred from the near-match service alone.

The following pinned declarations were opened. Paths beginning `Mathlib/` and `TauCeti/` refer to the corresponding pinned library repositories.

| Native object or declaration | File and line at the pin | What it supplies / distinction retained |
|---|---|---|
| `AddChar`, composition, orthogonality | `Mathlib/Algebra/Group/AddChar.lean:72`, `:242`, `:354` | A multiplicative-valued character of an additive group; trivial character is constant one. Orthogonality's domain hypothesis is retained. |
| `ZMod.stdAddChar` | `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83` | Positive `2πi` convention; the trace adapter composes it, not a negative character. |
| `GaloisField`, cardinality | `Mathlib/FieldTheory/Finite/GaloisField.lean:68`, `:117` | Splitting-field carrier; cardinality formula requires nonzero extension degree. The log-series zero term avoids relying on degree zero. |
| `Algebra.trace`, finite-field trace | `Mathlib/RingTheory/Trace/Defs.lean:70`; `Mathlib/FieldTheory/Finite/Trace.lean:37`, `:49` | Native trace, nondegeneracy and sum of Frobenius powers. |
| `SymmetricPower` | `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53` | Quotient of tensor power by permutation relations; no connection on that quotient. §2.4 supplies the connection. |
| `MvPolynomial.hsymm`, `Polynomial.Chebyshev.U` | `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312`; `Mathlib/RingTheory/Polynomial/Chebyshev.lean:263` | Complete homogeneous polynomials and second-kind Chebyshev recurrence, cited rather than redeveloped. The two-scalar trace specialization remains needed. |
| `PowerSeries.exp`, substitution, roots | `Mathlib/RingTheory/PowerSeries/Exp.lean:50`; `Mathlib/RingTheory/PowerSeries/Substitution.lean:158`; `Mathlib/Algebra/Polynomial/Roots.lean:56` | Native series and polynomial carriers. Constant coefficient one excludes the zero-polynomial root convention from the headline. |
| `LSeries.term`, `LSeries`, `LSeriesSummable` | `Mathlib/NumberTheory/LSeries/Basic.lean:74`, `:164`, `:178` | Term zero is zero; summability is of these terms, not the raw expression at zero. |
| `EulerProduct.eulerProduct_tprod` | `Mathlib/NumberTheory/EulerProduct/Basic.lean:225` | Requires zero value at zero, value one at one, coprime multiplicativity and norm summability. The corrected adapter supplies all four. |
| `summable_norm_iff`; complex power multiplication | `Mathlib/Analysis/Normed/Module/FiniteDimension.lean:605`; `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:202` | Finite-dimensional real normed-space hypothesis holds for `C`; natural-base complex power identity has the intended convention. |
| `MeromorphicNFOn`, `Complex.Gamma`, `Gammaℝ` | `Mathlib/Analysis/Meromorphic/NormalForm.lean:632`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:287`; `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:46` | Normal-form values support reflection at every point; `paperGamma` is explicitly distinguished from the standard normalization. |
| `legendreSym`, `padicValNat` | `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109`; `Mathlib/Data/Nat/PadicValNat.lean:21` | Legendre argument order and natural valuation defaults. Relevant `a` is positive, `p` prime; no junk zero valuation is used in the odd local correction. |
| `gaussSum`, `jacobiSum` | `Mathlib/NumberTheory/GaussSum.lean:72`; `Mathlib/NumberTheory/JacobiSum/Basic.lean:48` | One multiplicative/one additive character, respectively two multiplicative characters. Neither is the reciprocal-variable Kloosterman moment construction. |
| Primitive Dirichlet functional equation; gamma meromorphy | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:291`; `Mathlib/Analysis/Meromorphic/Complex.lean:22` | The former is for primitive characters, the latter only for Gamma. Neither proves a whole moment-family headline in one `exact`. |
| `TauCeti.Hodge.MixedHodgeStructure` | `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` | Integral/rational/complex models and finite exhaustive filtrations; finite dimension and graded polarizability are additional conditions, as the README says. |
| Strictness of `F` and `WQ`; `tate` | `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, `:131`; `TauCeti/Geometry/Hodge/Tate/Basic.lean:93` | Strict images and Tate weight `−2m`; twisting by `(−1)` raises weight by two. |

The raw finite-field hyper-Kloosterman sum belongs to CongruenceSpectralGap §4.2a, and character-sum refinements to CharacterSumsOverFiniteFields. The actual sheaf belongs to CongruenceSpectralGap §4.2b; rigid Kloosterman objects and their comparison statements belong to PadicDifferentialEquationsAndRigidCohomology. This package's simple total rank-two sum is justified as the elementary definition required to state its headlines without importing an unmerged roadmap, and its unit-parameter comparison is explicit. The new objects here are the moments, characteristic-zero connections and their particular hypersurface/filtration/local-factor calculations, not another generic Fourier or Hodge theory. No fully qualified Lean declaration collides with an owner found at the pins or readable roadmap heads.

### Supplier resolution and ownership against open work

All supplier section citations were resolved afresh. The table groups repeated citations; file references are the supplying README, with a representative exact location and the full consumed section range. The CLI's prefixed display header is not counted in these file line numbers. Main-roadmap suppliers were checked on main; new roadmap suppliers were checked at the available heads. MixedHodgeModulesAndIrregularHodgeTheory was read from the supplied board package.

| Supplier / head | Resolved README location and sections | Contract comparison |
|---|---|---|
| CongruenceSpectralGap, PR #1504 | `TauCetiRoadmap/CongruenceSpectralGap/README.md:647`, §§4.2a–4.2b | Raw unit-parameter sum; signed all-characteristic sheaf; purity and curve index. |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12729`, §§RD.6.52a–6.53, RD.6.94–6.98, RD.7.20–7.22 including 7.21a | Degree-weighted index; rigid objects; actual geometric/filtered hypotheses of moment comparison. Higher thickness remains a declared contract. |
| ComplexComparisonPartII, PR #848 | `TauCetiRoadmap/ComplexComparisonPartII/README.md:2982`, §§C5.1, C5.6–C5.7 | Ordinary differential operators and regular/logarithmic comparison. |
| FormalConnectionsOpers, PR #1056 | `TauCetiRoadmap/FormalConnectionsOpers/README.md:707`, F2.2 | Filtered symbols/PBW; not a second sheaf of differential operators. |
| SpringerResolutionAndCharacteristicCycles, PR #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:832`, §§8.1–8.4, 9.1–9.7 | Coherent/holonomic modules, shifts, duality, intermediate extension and characteristic-zero regularity/descent. |
| MixedHodgeModulesAndIrregularHodgeTheory, board | `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:616`, §§2.1–2.5, 4.3, 4.6, 5.1–5.4, 6.1–6.6, 7.1, 7.5–7.6, 8.1–8.2, 9.1–9.5, 10.1–10.2, 11.1–11.6, 12.1–12.8 | Fourier sign, exponential weights, classicality, pair cohomology and Newton/logarithmic filtration. §11.6 supplies the missing generic input for R02. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:248`, §§F.0.4, F.2.1–F.2.7, F.4.5, F.5–F.7, F.10.1–F.10.2b | Universal-homeomorphism invariance; supports, rational realization, purity, blow-ups and geometric Frobenius. |
| InverseGaloisAndArithmeticFundamentalGroups, PR #850 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:566`, §IG.0.T3 | Rational trace formula, every finite extension. |
| EtaleDualityAndPerverseSheaves, PR #1040 | `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:1659`, §§2.3, 2.8, 3.3 | Intermediate extension and rational coefficient extension. |
| DeligneWeightsAndPurity, PR #929 | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:808`, §§0.16, 0.18, 7.12, 7.15, 8.14, 8.19, 8.24 | Multiplier `p^{k+1}`, pure middle image, smooth-proper purity and boundary spectral sequence. Smoothness conditions are retained. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3795`, §§2.11, 4.11, 4.13, 4.17 | Finite quotient descent, blow-ups, regularity and strict normal crossings. |
| ShimuraCompactifications, PR #1053 | `TauCetiRoadmap/ShimuraCompactifications/README.md:750`, §§0.16–0.18 | Toric schemes over rings, properness criterion and integral boundary. |
| AnalyticToricGeometryPartII, PR #1647 | `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:166`, §§0.3, 0.5 | Monomial sections and line bundles; polytope projective embedding is an explicit additional contract. |
| LefschetzPencilsAndVanishingCycles, PR #873 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1491`, §§2.1–2.8, 6.6 | Quadratic forms, ordinary points and vanishing cycles. §2.7 retains valuation parity for `Q=b`; §2.8's regular-total-space specialization is not silently generalized. |
| MotivesAndAlgebraicCycles, PR #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:435`, §2.7 and Layer 5 (§§5.3–5.9) | Nori pair motives, projectors and realizations. Weight filtration and orthogonal root number are declared additions. |
| ArithmeticGaloisRepresentations, PR #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1170`, §§1.7, 2.5–2.7, 3.3, 5.3, 7.4 | Local factors/constants, purity of filtered WD representations, conductors and semisimple reconstruction; form on semisimplification is a declared addition. |
| CohomologyComparisons, PR #1064 | `TauCetiRoadmap/CohomologyComparisons/README.md:434`, §§2.13, 3.4–3.5, 4.3–4.4 | Equivariant Betti/de Rham and proper smooth/semistable comparisons. |
| PadicHodgeTheory, PR #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:665`, §§3.2, 5.1–5.3 | Filtration sign, potential semistability, weak admissibility, and WD with both inertia and `N`. |
| PotentialModularityAndCompatibleSystems, PR #1075 | `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:95`, §§1.1, 1.5–1.6, 1.15 | Compatible systems, strict away-prime compatibility and L-function operations. Not misused for coefficient-prime comparison. |
| ModularityAndLanglandsExtensions, PR #1180 | `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1470`, §§2.42–2.43, 2.49 | Regular pure polarized potential automorphy, universal extreme-regular irreducibility input and strict purity/functional equations. |
| AutomorphicGaloisRepresentationsPartII, PR #1006 | `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1818`, AG2.5–AG2.6 | Full polarized away/coefficient-prime comparison. Its `ExtremelyRegularIrreducibility n` premise is explicitly supplied by ModularityAndLanglandsExtensions §2.43 in the consumer's §11.2. |

The automatic unresolved-citation lead for MixedHodgeModulesAndIrregularHodgeTheory is not a missing supplier: its board README is present, its §§6.4–6.5 and 11.1–11.6 were opened, and the merge-order check resolves its position. No missing-section finding is inferred from that lead.

The overlap report contains no conflicting head, dropped cited id, only-open-revision id or removed id needing an old-to-new map. Its five closest roadmaps were checked by scope and object: the rigid construction in PR #1002, quadratic degeneration machinery in PR #873, raw sums/sheaves in PR #1504, Fourier–Deligne operations in PR #2132 (`TauCetiRoadmap/FourierDeligneTransform/README.md:18` explicitly assigns Kloosterman sheaves to CongruenceSpectralGap), and automorphic local comparison in PR #1006. CharacterSumsOverFiniteFields PR #1712 (`TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:29`) was also compared. No new double ownership or mutual handoff was found. Generic tensor symmetric powers and Hodge structures remain native; this package owns their particular connections and moment realizations.

The dependency check was run with the prescribed `gate --depcheck`, name, merge-order, movable and content arguments. Output:

```text
depcheck: 236 roadmaps, 2153 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This verifies inter-roadmap order; R02 records the separate internal proof dependency not expressed in that graph.

### Declared supplier gaps

All six slugs occur in both `packages/KloostermanMomentsAndPotentialAutomorphy/design/plan.json` and the README's exact supplier contracts, with named earlier suppliers. Their hypotheses and requested conclusions are precise. The multi-part compatibility clauses belong to one comparison construction, not unrelated bundled requests. The current supplier texts and pins do not already provide the missing strengthening. These are contracts, not findings; this review does not reopen them.

| Slug | README location | Missing strengthening / discriminant |
|---|---|---|
| `higher-thickness-picard-lefschetz` | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:248` | Unit thickness to every positive thickness; `k=9,p=3,a=3` gives uniformizer exponent `4`, outside the existing exponent-`2` theorem. |
| `irregular-stationary-phase` | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:294` | Slope-one irregular input; rank-two factors `E^{±2t}` lie outside regular-input stationary phase. |
| `toric-polytope-projective-embedding` | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:342` | Closed immersion from lattice sections over every commutative ring, beyond existence of the line bundle; interval `[-1,1]` gives the conic. |
| `nori-weight-filtration` | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:363` | Strict realization-compatible weights on the Nori objects and idempotent images, beyond an unfiltered realization. Twist `(−1)` changes weight `2` to `4`. |
| `orthogonal-motive-root-number` | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:368` | Root number for the projected boundary-kernel motives, beyond their étale realization; `k=3` yields `+1`. |
| `semisimplification-similitude-form` | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:383` | Preservation of the symmetric/alternating compatible form, beyond existence of a semisimplification; odd/even `k` retain opposite pairing parity. |

### Headline coverage, elaboration and padding

The README's end theorems and major intermediate headlines are accounted for as follows.

| Headline | Acceptance-test treatment |
|---|---|
| Integer polynomial, constant term and exact degree | `momentSeries_eq_intPolynomial`, `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean:109` |
| Reciprocal-root weights including even boundary weights | `momentSeries_weights`, `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean:90` |
| Odd completed functional equation and continuation | `oddMoment_functionalEquation`, `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean:191` |
| Even completed functional equation with existential factor/conductor/sign at two | `evenMoment_functionalEquation`, `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean:206` |
| Hodge-number tables and filtered de Rham realization | Named in module docstring; connection cohomology and irregular/exponential Hodge carriers unavailable at pins. |
| Sheaf monodromy and connection differential Galois groups | Named in module docstring; corresponding sheaf/connection constructions unavailable at pins. |
| Classicality, moment hypersurface realization and Nori motive | Named in module docstring; exponential cohomology and Nori-motive carriers unavailable at pins. |
| Local Galois realizations, regular polarized system and potential automorphy | Named in module docstring; actual moment realizations and automorphic-system carriers unavailable at pins. |

No statable summary headline is omitted or forced through a free predicate. The 17 definitions are genuine elementary native-carrier adapters needed by the four headlines. All 21 declaration names occur in the README; all backticked names attributed to this roadmap resolve to those declarations. Mathematical notations such as `M_k` are not presented as additional Lean declarations.

Ran `lake env lean` on the original `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean` from the pinned content checkout using its absolute argument, as required. **Exit 0**, exactly four warnings, each “declaration uses `sorry`”, at lines **90, 109, 191, 206**. No other warning or error. There is only `import Mathlib`; no Tau Ceti object build was needed. No `set_option`, `lemma`, admitted example, sorry'd definition/instance or arbitrary data placeholder occurs.

A separate scratch copy appended `#check @name` for **all 21 declarations** and elaborated successfully. Compared every elaborated type with its definition and README: the finite-field prime instances, positive `k`, odd/even hypotheses, native finite-field/additive-character binders, and polynomial constant-term conditions are retained. No missing section binder or generality mismatch was found; nothing was changed.

Every one of the **four** admitted theorems was probed in a scratch copy with closing `simp`, `rfl` and `infer_instance`, each guarded by `fail_if_success` and followed by the original `sorry`. The closing-simp probe used `solve | simp`, so mere progress did not count as a proof. The copy elaborated with only four sorry warnings, proving none of those tactics closed a headline. The exact-single-library-lemma alternatives were checked by opening the relevant near matches: primitive Dirichlet functional equations, gamma meromorphy, generic Euler products, polynomial carriers and symmetric tensor powers do not have these moment-family conclusions. No declaration merely computes a Check or boundary case. **No padding finding.**

## Not verifiable

- **Saito-orthogonal, main theorem**, cited through FSY §5.3.3, printed p.58: the original article remains paywalled and its manifest status is settled `uncertified`. FSY's invocation was read; the original theorem's complete hypotheses were not independently certified. No new source request is made.
- The six declared future supplier additions are not claimed implemented today. Their declarations, ownership, precision and current absence were checked; eventual formal proofs are outside this package review.

All other seeded source passages were readable. The original Lean file, signature copy and padding-probe copy completed; no Lean process was left running.

## Source issues

These are issues in the source texts, not additional package findings. The roadmap already corrects or explicitly contracts for them.

- **Misprint** in FSY at proof following (5.4), printed p.40, FSY line 1731: the source says the pairing involution uses the half-weight exponent; it should be `α↦p^{k+1}/α`; affects a stated result.
- **Misprint** in FSY at §3.2.2 before Theorem 3.12, printed p.23, FSY line 987: the source says the single-sheaf Fourier presentation uses a torus of dimension `nk`; it should be dimension `n` before taking the kth tensor power; affects the proof.
- **Misprint** in FSY at proof of Proposition 4.20, printed p.33, FSY line 1408: the source says the rank-k infinity block is generated by primitive `P_k`; it should be `P_{k−1}`, yielding weights `0,2,…,2k−2`; affects the proof.
- **Misprint** in FSY at §5.1.2, printed p.41, FSY line 1761: the source says the derivative never vanishes on the entire boundary chart; it should be nonvanishing on the boundary intersection with the hypersurface, where it equals `−1/z₁`; affects the proof.
- **Error** in FSY at proof of Proposition 5.23, printed p.50, FSY lines 2249–2256: the source says every quadratic point has unit thickness after the quadratic base change; it should allow exponent `2e`, since `k=9,p=3,a=3` has `e=2`; affects the proof.
- **Error** in XZ at §2.1.5(i), printed p.10, XZ line 489: the source says `exp(π(t−t^p))` maps the Frobenius pullback to the connection `d+πdt`; it should use its inverse for that arrow, since horizontality requires logarithmic derivative `π(pt^{p−1}−1)`; affects a stated result.
- **Error** in FSY at Corollary 5.30, printed p.52, FSY lines 2336–2362: the source says the displayed gamma product equals the preceding standard recipe; it should include the constant `π^{d(d+1)/4}` to equal that recipe; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p.63, FSY line 2876: the source says unshifted divisor restriction is perverse degree zero; it should shift restriction by `−1`, since `i*Q_U[dim U]=Q_D[dim D][1]`; affects a stated result.
- **Misprint** in FSY at proof of Theorem A.24, printed p.71, FSY line 3222: the source says the composite pushforward along the zero locus is zero; it should say the underlying map is constant zero, so its pushforward is supported at zero; affects the proof.
- **Error** in FSY at Remark 5.41, printed p.59, FSY line 2676: the source says the inertia-invariant Euler determinant equals the determinant on the full semistable period module; it should retain `ker N` and descent invariants before taking the determinant; affects the proof.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, printed p.10, Serre-orthogonal line 393: the source says isotropy requires vanishing on every pair from the ambient module; it should require pairs from the chosen isotropic submodule; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7157e2c1a92d91fd764daac57293fef575bc25f8", "job": "REV-PKG-KloostermanMomentsAndPotentialAutomorphy~5", "model": "gpt-6-astra", "worker": "chris-4"} -->
