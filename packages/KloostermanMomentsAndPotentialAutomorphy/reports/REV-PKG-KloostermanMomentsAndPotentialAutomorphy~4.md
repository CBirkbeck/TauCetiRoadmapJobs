<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13156#issuecomment-6785176204 -->
Review (codex) of 422f350

Verdict: needs_changes

1. **F01** (P1) The de Rham fibre does not acquire a universal weight shift

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1069`, §3.6: “`M^H` forgets to `M` and has weight `nk`; the degree-one de Rham fibre has weight `nk + 1`.”

   **Claim:** For every rank `r = n + 1 ≥ 2` and exponent `k ≥ 1`, the degree-one fibre associated with this pure inverse-Fourier Hodge module is pure of weight `nk + 1`.

   **Witness:** At `r=2,k=2`, the exponential fibre has weight `2`. Fourier cohomology instead has one class of type `(2,2)`, weight `4`; neither has the asserted weight `3` (FSY lines 1426–1439).

   The distinction matters. The supplier defines the exponential fibre by `ω(N)=H¹_dR(A¹,N⊗E^θ)` and its filtration by `W_j ω(ΠN)=ω(W_jN)`: see `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:616` (§6.4) and `:634` (§6.5). A pure input of weight `nk` therefore gives exponential weight `nk`, without a shift. Here its dimension is `k+1=3`, the rank of `Sym² K̃l₂`.

   If the sentence instead intends `H¹(A¹_t,FT M^H)`, the conclusion still fails. FSY Proposition 4.20, printed pp.33–34, gives `P₀` of dimension `k−2` and weight `k−1`, and `P₁` of dimension one and weight `k`, with `gr coker N=P₀(−1)⊕P₁(−1)`. For `k=2`, these dimensions are `0,1`; the surviving summand is `ℚ(−2)`, weight `4`. The supplier's §11.3 (`packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:931`) requires smoothness at the input origin to conclude weight `w+1`. This input is singular there. The package's own §6.4, `README.md:1518`, correctly lists `(2,2)` and `(3,3)` in full cover cohomology; the latter is the constant-quotient contribution already distinguished by the repaired §3.6.

   **Exact repair:** Replace the last API bullet by: “`M^H` forgets to `M` and is pure of weight `nk`. Its exponential de Rham fibre `ω(M^H) ≅ ω(ΠM^H)`, with the filtration of MixedHodgeModulesAndIrregularHodgeTheory §§6.4–6.5, is pure of exponential weight `nk`. This fibre is distinct from `H¹(A¹_t,FT M^H)`; the latter's rank-two weights are computed in §6.4.” Add §§6.4–6.5 to this target's supplier needs and add the negative-control Check `r=2,k=2`: exponential fibre dimension `3`, weight `2`; Fourier cohomology dimension `1`, type `(2,2)`, weight `4`. The replacement gives `2=2` and `4=2+2` on the refuting instance and does not weaken the existing all-rank construction. No change to Suggested.lean is needed.

One P1 finding remains. All five findings of round 3 are repaired. The four headline theorems elaborate, the padding probes fail to discharge them, and the dependency check reports no problems. The mathematical error below is in the prose, not an elaboration failure.

## Verified sound

### Previous findings, individually rechecked

The repair report marks all five applied, with none marked not actionable. The changed passages, their added Checks and the other occurrences of the same patterns were reread. Quotations below are from the package, not from source texts.

| Previous finding | Repaired passage | Verification and status |
|---|---|---|
| F01: unweighted closed points | `README.md:236`: `r·χ(U) − Σ [κ(z):F]·Irr_z(E)`; the paragraph specifies geometrically connected `C`, nonempty `Z`, and `χ(U)=2−2g−Σ[κ(z):F]`. | **Repaired.** For `P¹_Q` minus the degree-two point `x²+1`, `χ=0`, `Irr=1`, degree `2`: index `−2`; after splitting, two contributions `−1−1=−2`. The former expression gives `−1`. The other index uses have rational boundary points. |
| F02: Fourier localization on an irregular input | `README.md:1060`: “§6.6 applied to the regular holonomic input `M` gives `FT ΠM ≅ (FT M)(∗0)`”. | **Repaired.** The added Gauss–Manin argument at :1054 supplies regularity, including infinity, before using localization. At `r=2,k=1`, `M` is regular of rank `1`; its transform has two slope-one factors and irregularity `2`. The supplier now applies to the former. |
| F03: constant quotient called an exponential structure | `README.md:1085`: “pure of weight `2k + 1` as a mixed Hodge module on `𝔸¹`, being `a^*V[1]` for a constant variation `V` of weight `2k`.” | **Repaired.** At `k=1`: module weight `3`, variation weight `2`, Fourier-cohomology weight `4`; `RΓ=Q(−1)[1]≠0` and `ΠM′=0`. The category claim is fixed. The separate surviving weight-shift assertion is R01. |
| F04: open resolution confused with its proper closure | `README.md:1684`–:1706 separately constructs `π : K′ → K` and `π̄ : K̄′ → K̄`, with `K̄′ ∖ K′ ≅ D`. | **Repaired.** For `k=4`, the open compact-support group has `dim gr²H³_c=1`; the smooth proper closure has `gr²H³=0`. Uses in §§7.4,8.4,9.1 retain the distinction. Smoothness is only asserted over `Q`; the positive bad-prime strata remain. |
| F05: Euler product applied to a function nonzero at zero | `README.md:2165`: “applied to `f = LSeries.term (eulerCoeff L) s`”. | **Repaired.** For `L(p)=1,s=0`, raw coefficient at `0` is `1` and raw sum `2`; `LSeries.term … 0=0`, series `1`, Euler product `1`. The revised route supplies normalization, multiplicativity and norm summability. |

### Principles, shape, and scope

Read all 58 numbered targets, their 58 Needs lines, and all 12 layer dependency paragraphs. The retained mathematical scope includes arbitrary characteristic in the finite-field targets, all characteristic-zero ranks `r≥2` for connections, odd bad primes including higher thickness, and the separate prime-two arithmetic branch. The existential even functional equation retains the missing prime-two factor; it does not silently discard that place. No computational algorithm, copied source passage, re-planning of an existing roadmap, forbidden supplier, upward dependency, or cycle was found.

The README has the required summary, ownership, conventions, supplier contracts, build explanation, layers, Examples, Dependencies and references. Definitions retain APIs and at least three Checks. The organisation follows the mathematical constructions: finite-field and characteristic-zero branches meet at the hypersurface comparison; explicit rank-two computations feed the Hodge, integral and arithmetic branches. No source-chapter heading or assertion of following a source's arrangement was found. Compared its shape with `TauCetiRoadmap/TensorProductCombinatorics/README.md` and `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` on main. No process narrative, machine path, HTML anchor, pull-request number or date was found in the roadmap text. Metadata remains `topic = "math.NT"`.

This pass relies on the round-3 adversarial table only for untouched statements whose rows actually give computed values. The repaired contracts and §§2.3,3.6,7.3,7.4,8.4,9.1,10.4 were re-examined, along with all 15 seeded targets and every headline. The table below records the sample, headlines, changed cases and R01; it does not replace the full prior computed table with a claim that an elaboration proves truth.

### Seeded source checks

All 15 sampled locators were read in the cached legal texts. FSY is arXiv:1810.06454v5; XZ is arXiv:1910.13391v2. The manifest's version-specific numbering agrees with these texts. No newly flagged unverified locator required fetching. All four cited works have one manifest key each; the Serre text is arXiv:1708.00046v3. The settled Saito entry remains uncertified.

| Sample | Text and locator read | Hypotheses and conclusion verified |
|---|---|---|
| §1.3 Monodromy groups | XZ lines 105–140, §1.1.2, (1.1.2.3), p.3 | Weight-zero normalization; even rank symplectic, odd rank and odd characteristic special linear; odd rank at two orthogonal except rank seven, where `G₂` occurs. Arithmetic and geometric groups agree. |
| §2.1 Kloosterman connections | FSY lines 425–505, Proposition 2.4, Lemma 2.5, pp.10–12 | Rank `n+1≥2`, characteristic zero, exponential direct image and cyclic equation; the geometric and scalar-horizontal signs are distinguished. |
| §2.5 Differential Galois groups | FSY lines 524–533, Proposition 2.7 and proof, p.12 | `SL_r` for odd rank and `Sp_r` for even rank; irreducibility of symmetric powers. Algebraic closure/base extension is retained. |
| §3.1 Tensor potentials | FSY lines 536–564, (2.8)–(2.9), pp.13–14; lines 893–904, (3.9), p.21 | `nk` torus variables, base coordinate, cyclic-cover substitution and deck action. |
| §3.5 Exponential de Rham realization | FSY lines 613–677, Proposition 2.13, Corollary 2.15, pp.14–16 | `k≥1`; concentration in degree one; separate `S_k` and `S_k×μ_r` projectors; middle pairing and twist. |
| §4.3 Hypersurface realization | FSY lines 891–947, Theorem 3.8, pp.21–22 | `nk≥2`; compact cohomology in degree `nk−1`, twist `(−1)`, weight and character projector. Ordinary cohomology uses supports unless smoothness permits purity. |
| §5.5 Dimensions | FSY lines 1230–1285, Proposition 4.12, (4.13), pp.29–30 | Ordinary, middle and cover dimensions; exceptional subtraction when `4` divides `k`; `k≥1`. |
| §5.6 Explicit bases | FSY lines 1287–1328, Proposition 4.14, Lemmas 4.15 and 4.17, pp.30–32 | Odd determinant and even kernel; quotient dimensions and the cover basis; no claimed basis below the stated range. |
| §6.1 Signed-permutation fan | FSY lines 1496–1534, (4.22)–(4.23), pp.35–36 | Rays, signed chambers, chart monomials and divisor coefficients. The added polytope/projectivity argument is explicitly supported by the declared toric contract. |
| §7.2 Arithmetic quadratic singularities | FSY lines 1751–1784 and 1971–1982, §§5.1.2–5.1.4, pp.41–45 | Odd and even orbit labels and quadratic parts. Higher valuations are preserved; the `k=9,p=3` case is not called unit thickness. The characteristic-two branch keeps its different local model. |
| §8.1 Middle moment polynomial and weights | FSY lines 1668–1731, §5.1.1, (5.1)–(5.4), pp.39–40 | Separate odd/even/prime-two formulas, weight `k+1`, unit constant coefficient and reciprocal pairing. The source's pairing-exponent slip is corrected in the roadmap. |
| §8.5 Odd Euler factors/conductor | FSY lines 1798–1830 and 1942–1968, (5.7), (5.13)–(5.14), pp.42,44–45 | Parity of valuations, Legendre character, prime-two factor, tame conductor and square-free parts rather than radicals. |
| §10.2 Gamma factors | FSY lines 2336–2399, Corollary 5.30, pp.52–53 | Hodge indices, real places and the constant `π^{d(d+1)/4}` separating the standard recipe from the paper's normalization. |
| §11.1 Potential automorphy | FSY lines 2560–2650, Theorem 5.38, Corollary 5.39, pp.56–58 | Purity, regularity, odd essential self-duality, semisimplification and one totally real extension for the system. Positive rank is retained; rank zero is handled separately. |
| §11.5 Even functional equation | FSY lines 105–146, Theorems 1.2–1.3, pp.3–4 | Positive even `k`, existential conductor exponent, rational polynomial with constant coefficient one, sign `±1`, and continuation. Conjectural explicit prime-two data are not asserted. |

### Adversarial computations

The finite-field rows were recomputed using exact arithmetic in `F₂,F₄,F₈,F₁₆`, their field traces, the unit sums, the symmetric-trace recurrence and the exponential-series coefficient recurrence. These are small review calculations, not proposed roadmap algorithms. In every row the entries are actual values or dimensions, rather than an assertion that a case was checked.

| Statement | Instances | Computed values on the two sides / negative control | Result and change |
|---|---|---|---|
| §§0.1–0.3 trace sign and symmetric powers | `F₂,a=1`; `k=0,1,2,3` | Raw `Kl=1`, sheaf trace `−1`, determinant `2`; `h_k=1,−1,−1,3`, whereas ordinary powers give `1,−1,1,−1`. | Correct; no change. |
| §0.4 and integer-polynomial headline | `p=2,k=3`, extension degrees `1,2,3,4` | Moments `3,−17,63,−257`; exponential coefficients `1,3,−4,0,0`; `(1−T)(1+4T)=1+3T−4T²`; degree `2=(3+1)/2`. | Correct. |
| Same headline, nontrivial even case | `p=2,k=12`, extension degrees `1,2,3,4` | Moments `−1,−8193,−1,−33554433`; coefficients `1,−1,−4096,4096,0`; `(1−T)(1−4096T²)`; degree `3=⌊14/4⌋`. | Correct. |
| Excluded zeroth moment | `p=2,k=0` | Moments `1,3,7,15`; series starts `1+T+2T²+4T³+8T⁴`; exact expression `(1−T)/(1−2T)`, not a polynomial. | `0<k` is necessary and present. |
| §1.3 monodromy | `(r,p)=(2,2),(3,3),(3,2),(7,2)` | Groups `Sp₂,SL₃,SO₃,G₂`; dimensions `3,8,3,14`; wrongly using `SO₇` gives `21` instead of `14`. | Exceptional characteristic retained. |
| §2.1 cyclic/horizontal equations | ranks `2,3` | Cyclic `θ^r e=z e`; horizontal scalar equations give `θ²y=zy`, `θ³y=−zy`. | Signs distinguished. |
| §2.3 index repair | degree-two closed point on `P¹_Q` | `χ=0`, weighted irregularity `2`, index `−2`; split calculation `−1−1=−2`; unweighted result `−1`. | F01 repaired. |
| §2.5 differential Galois | ranks `2,3`; symmetric square | `dim Sym²=3,6`; both irreducible for `Sp₂,SL₃`; the wrong `SO₃` model splits its six-dimensional symmetric square as `1+5`. | Correct. |
| §3.1 tensor potentials | `r=3,k=2` | `nk=4`, total dimension `5`; deck-scaled term acquires `ζ·ζ⁻¹=1`, whereas the wrong action gives `ζ²≠1`. | Correct. |
| §3.5 de Rham realization | `r=2,k=3`; parity at `k=6,7` | Cover full/middle dimensions `4,3`; descended `2,1`; pairing sign `+1` at `k=3,7`, `−1` at `k=6`; middle dimensions `3` at `k=7`, `2` at `k=6`. | Projectors and parity correct. |
| §3.6 regularity/localization | `r=2,k=1` | Ranks `(G,M,ΠM,M′)=(2,1,2,1)`; `FTM` slopes `(1,1)`, irregularity `2`, versus regular input irregularity `0`. | F02 repaired. |
| §3.6 constant quotient | `r=2,k=1` | `M′` module/variation/Fourier weights `3,2,4`; `RΓ=Q(−1)[1]≠0`; `ΠM′=0`. | F03 repaired. |
| §3.6 disputed fibre weight | `r=2,k=2` | Claimed `nk+1=3`; exponential fibre dimension/weight `(3,2)`; Fourier `H¹` dimension/weight `(1,4)` from `P₀=0,P₁(−1)=Q(−2)`. | **False; R01**, exact replacement tested. |
| §4.3 hypersurface realization | `r=2,k=3` | Hypersurface degree `nk−1=2`; weight `2`; twist `(−1)` gives weight `4`, type `(2,2)`, dimension `1`, matching middle moment. | Correct. |
| §5.5 dimensions | `k=1,…,8` | Full: `1,1,2,2,3,3,4,4`; middle: `0,0,1,0,2,2,3,2`; cover full: `2,2,4,4,6,6,8,8`; cover middle: `1,0,3,2,5,4,7,6`. | Formula and independent residue/irregularity counts agree. |
| §5.6 basis calculation | `k=1,3` odd; `k=2` even | Odd determinants `−z,9z²`, equal `(k!!)^2(−z)^((k+1)/2)`; even relation `u₂−zu₀` maps to `2zu₁−2zu₁=0`. | Correct; zero determinant at even `k` is handled. |
| §6.1 fan | `k=1,2,3` | Rays `2,8,26=3^k−1`; maximal cones `2,8,48=2^k k!`; primitive chamber determinant `1`. Support coefficients `(1)`, `(2,3)`, `(3,5,6)`; lattice-point counts `3,21,251`. | Complete regular fan, correct divisor signs. |
| §§6.4,6.6 Hodge headlines | `k=2,3,5,6` | Cover `k=2`: `(2,2),(3,3)`, weights `4,6`, middle `0`; descended middle `k=3`: `(2,2)`; `k=5`: `(2,4),(4,2)`; `k=6`: `(2,5),(5,2)`, dimensions `1,2,2`. | Correct here; exposes R01 elsewhere. |
| §7.2 arithmetic singularities | `k=9,p=3`; `k=6,p=3` | Odd labels `a=1,3`: constants `6,18`, valuations `1,2`, ramified-uniformizer valuations `2,4`; even labels `b=0,2` give two orbits, constants `0,12`. | Higher thickness and positive even bad-prime orbit retained. |
| §§7.3,7.4,8.4,9.1 open/proper repair | `k=4`; `k=6,p=3` | Open `dim gr²H³_c=1`; proper `dim gr²H³=0`; `b=2` singular orbit survives the horizontal `b=0` blow-up at `k=6,p=3`. | F04 repaired; no false all-prime smoothness. |
| §8.1 and root-weight headline | `p=2,k=3,5,8` | Middle polynomials `1+4T`, `1−4T+64T²` have root norms `1/4,1/8`; `k=8` gives `Z=(1−T)(1−16T)`, remaining root norm `1/16`, the even weight-8 boundary branch. | Correct. |
| §8.1 reciprocal pairing | `p=2,k=3` | Eigenvalue `−4`; correct involution `2⁴/(−4)=−4`; the source's half exponent would give `2²/(−4)=−1`. | Roadmap already correct. |
| §8.2 prime-two degree | even `2≤k≤500` | All 250 cases satisfy `1+a_k+b_k+deg M_k=⌊(k+2)/4⌋`; e.g. `k=8`: `2=2`, `k=12`: `3=3`. | No truncated-subtraction failure in the asserted domain. |
| §8.5 Euler/conductor | `k=9,p=3`; `k=5,p=2` | `Θ⁺₃={3}`, `Θ⁻₃={1}`; Legendre symbol `(+1)`, extra eigenvalue `3⁵=243`; `N₉=105`, radical-product alternative `315`. For `k=5,p=2`, inverse coefficients start `1,−4,64`, reciprocal `1,4,−48`, product coefficients `1,0,0`. | Correct. |
| §10.2 gamma normalization | dimensions `0,1,2`; `d=1,s=3` | Standard/paper ratios `1,√π,π^(3/2)`; at `d=1,s=3`, standard `π⁻¹`, paper `π^(−3/2)`. | Constant is correctly retained and cancels in reflection. |
| §10.4 Euler adapter | constant local factors, `s=0` | Raw zero term `1`, raw sum `2`; `LSeries.term` zero term `0`, L-series `1`, Euler product `1`. | F05 repaired. |
| §11.1 potential automorphy | `k=1,3,5,6` | Ranks `0,1,2,2`; Hodge sets for `k=5,6` are `{2,4}`, `{2,5}`, both cardinality `2`; similitude parity is even orthogonal at odd `k`, odd symplectic at even `k`. | Rank-zero case separated; regularity/polarization match supplier. |
| §11.4 odd functional-equation headline | `k=1`; `k=3` | At `k=1`: `d=0,N=1,L=1,Λ=1`, both sides `1`; at `k=3`, weight `4` gives reflection `5−s`, centre `5/2`, matching `k+2−s`. | Correct family statement; the theorem is not just this boundary case. |
| §11.5 even functional-equation headline | `k=2,4,6` | At `k=2,4`: `r=0,P=1,ε=1,Λ=1`, both sides `1`; at `k=6`: `d=2,N′=3`, centre `4`, reflection `8−s`. | Correct; sign and prime-two data remain existential in general. |

The domain checks also covered zero coefficients and total-function values: finite fields exclude the zero ring and `q=1`; projector denominators are characteristic zero; `m=0` is explicitly removed from the logarithmic series coefficient; `k=0` is excluded from the headlines; every formal Euler factor has constant coefficient one, so formal inversion is legitimate. The polynomial equality forces `Q(0)=1`, excluding the vacuous zero-polynomial roots case. Complex powers in the analytic half-plane use positive prime/conductor bases. The inherited checks on the nonabelian symmetric projectors, geometric versus arithmetic Frobenius, nonreduced zero loci and singular compactifications were retained; none justifies the rejected weight shift.

### Lean acceptance test and headline coverage

Ran `lake env lean` on the unchanged `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean` from the pinned content checkout: exit `0`, with exactly four `declaration uses 'sorry'` warnings, at lines 90,109,191,206. There is one `import Mathlib`, no Tau Ceti import needing an object build, no `set_option`, no sorry'd data, no admitted example and no free placeholder proposition.

A scratch copy tested every one of the four sorried theorems with `simp`, `rfl` and `infer_instance`, each guarded by `fail_if_success (solve | …)`. None closed. The copy elaborated successfully with only the four expected sorry warnings. All 21 declarations were then queried with `#check @name`; the 17 definitions and four theorem signatures preserve their required binders. In particular the finite-field definitions retain `[Field F] [Finite F]`, the moment theorems retain `[Fact p.Prime]` and `0<k`, and the functional equations retain `Odd k` or `Even k` with `0<k`. No file change was required.

| Headline from the README | Acceptance-test treatment |
|---|---|
| Integer polynomiality and exact degree | `momentSeries_eq_intPolynomial`, line 109; actual moment series, integer coefficients, `P(0)=1`, exact `momentDegree`. |
| Weights of the nontrivial roots | `momentSeries_weights`, line 90; actual series and reciprocal weight norms, even boundary branch retained. |
| Odd meromorphic continuation and functional equation | `oddMoment_functionalEquation`, line 191; actual Euler coefficients, convergence on `Re(s)>(k+3)/2`, normal-form meromorphic continuation and reflection. |
| Even meromorphic continuation and functional equation | `evenMoment_functionalEquation`, line 206; actual odd-prime Euler coefficients, with existential prime-two factor, exponent and sign. |
| Explicit Hodge numbers, middle motive and hypersurface comparison | Named in the module docstring with missing connection-cohomology, exponential-Hodge and Nori carriers. The pinned rational Hodge carrier alone cannot state these geometric identifications. |
| Monodromy and differential Galois groups | Named in the docstring; lisse-sheaf monodromy and differential Galois carriers are absent. |
| Local Galois structure, regular polarized systems and potential automorphy | Named in the docstring; the required geometric Galois realizations and automorphic representation carriers are absent. |

All 21 local identifiers appear in the README; its backticked identifiers attributed to this roadmap resolve to these declarations. No statable headline was replaced by arbitrary data or by a theorem containing its conclusion as a hypothesis. No padding declaration was found. The existing Euler-product and Gamma lemmas do not prove the asserted moment continuation, degree or weights.

### Pinned-library audit by object

Opened the following definitions or lemmas at the pins, rather than assuming their names supply the required mathematics. Paths in this table are relative to their respective library repositories.

| Object and declaration | Pinned file and line | What the native carrier/law supplies, and its limit |
|---|---|---|
| `AddChar`, composition, value in `C` | `Mathlib/Algebra/Group/AddChar.lean:72`, :242, :354 | Additive-to-multiplicative character; trivial characters remain allowed in the raw definition. Nontriviality comes from the canonical finite-field character on positive extension degrees. |
| `ZMod.stdAddChar` | `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83` | Positive `2πi` sign. |
| `GaloisField` and cardinality | `Mathlib/FieldTheory/Finite/GaloisField.lean:68`, :117 | Splitting-field carrier; cardinality theorem requires nonzero extension degree. The logarithmic-series zero coefficient avoids using it at degree zero. |
| Field trace | `Mathlib/RingTheory/Trace/Defs.lean:70`; `Mathlib/FieldTheory/Finite/Trace.lean:37`, :49 | Native algebra trace and finite-field trace properties, not an ad hoc character carrier. |
| `SymmetricPower`, `MvPolynomial.hsymm`, Chebyshev `U` | `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53`; `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312`; `Mathlib/RingTheory/Polynomial/Chebyshev.lean:263` | Existing quotient and polynomial constructions; none is the two-variable Kloosterman-moment theorem. |
| `PowerSeries.exp`, substitution | `Mathlib/RingTheory/PowerSeries/Exp.lean:50`; `Mathlib/RingTheory/PowerSeries/Substitution.lean:158` | Formal exponential and substitution; the substituted logarithm has zero constant coefficient. |
| Polynomial roots | `Mathlib/Algebra/Polynomial/Roots.lean:56` | Zero polynomial has empty root multiset; the headline's equality gives constant coefficient one. |
| `LSeries.term`, `LSeries`, summability | `Mathlib/NumberTheory/LSeries/Basic.lean:74`, :164, :178 | Index zero is forced to zero; convergence is a separate predicate, retained in both headlines. |
| Euler product | `Mathlib/NumberTheory/EulerProduct/Basic.lean:225` | Requires value zero at `0`, value one at `1`, coprime multiplicativity and norm summability. The revised §10.4 uses the right function. |
| Norm summability and complex powers | `Mathlib/Analysis/Normed/Module/FiniteDimension.lean:605`; `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:202` | `summable_norm_iff` on finite-dimensional real/complex targets; `Complex.natCast_mul_natCast_cpow` for the multiplicativity step. |
| `MeromorphicNFOn` | `Mathlib/Analysis/Meromorphic/NormalForm.lean:632` | Pointwise normal-form meromorphicity; no functional equation is included. |
| `Complex.Gamma`, `Complex.Gammaℝ` | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:287`; `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:46` | The paper's finite Gamma product is a genuine specialization; the standard normalization differs by the recorded constant. |
| Legendre symbol and valuation | `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109`; `Mathlib/NumberTheory/PadicValNat.lean:21` | Total functions; the arithmetic theorems restrict to primes and positive orbit labels. |
| Rational mixed Hodge structures and strictness | `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`; `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, :131 | Existing filtered rational Hodge carrier; finite dimensionality/graded polarizability are imposed by the roadmap, not inferred from the bare structure. |
| Tate structure | `TauCeti/Geometry/Hodge/Tate/Basic.lean:93` | Weight `−2m` for twist `m`; `(−1)` raises weight by two. |
| Gauss and Jacobi sums | `Mathlib/NumberTheory/GaussSum.lean:72`; `Mathlib/NumberTheory/JacobiSum/Basic.lean:48` | Multiplicative/additive Gauss sum and two-multiplicative-character Jacobi sum; neither defines the Kloosterman reciprocal-variable sum. |

The library-match leads for all 21 declarations were examined by object. Character L-series Euler products (`Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean:114`) concern a supplied Dirichlet character, not the moment coefficients; Gamma meromorphicity does not continue the moment L-series. Searches of both pins found no Kloosterman-moment, Nori-motive, irregular-Hodge or differential-Galois implementation supplying these headlines. No existing fully qualified library declaration is redeclared.

### Resolved suppliers, ownership and overlap

The board package index was read before resolving the missing-roadmap lead. Supplier reads used main where appropriate and the supplied open heads for new roadmaps. The one resolver lead, MixedHodgeModulesAndIrregularHodgeTheory §2.1, is a false positive: `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:212` contains that target, and the package precedes this consumer in the merge order. Its §§6.4–6.5 and §11.3 also provide the decisive witness for R01.

The resolution ledger groups repeated citations; all section ranges listed below exist in the versions read. A path `TauCetiRoadmap/<Name>/README.md` denotes that supplier's roadmap file; the pull-request number identifies the inspected open head, not a proposed roadmap dependency by number.

| Supplier and cited sections | File witness and result |
|---|---|
| CongruenceSpectralGap §§4.2a–4.2b | Open #1504, `TauCetiRoadmap/CongruenceSpectralGap/README.md:647`, :677. Raw unit sums, general sheaf constructor, Swan/index and bound belong there. This package specializes the scalar sum for a native acceptance test and owns its moments and additional normalized monodromy. |
| PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a,6.53,6.94–6.98,7.20–7.22 including 7.21a | Open #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12731`, :12751, :13643, :14317, :14342, :14370, :14389. Formal modules, the weighted index and the rigid comparison interfaces are present; geometric/filtered input hypotheses are discharged here. Higher thickness remains a declared extension contract. |
| ComplexComparisonPartII §§C5.1,C5.6–C5.7; FormalConnectionsOpers F2.2 | Open #848, `TauCetiRoadmap/ComplexComparisonPartII/README.md:2982`, :4438, :4563; #1056, `TauCetiRoadmap/FormalConnectionsOpers/README.md:707`. Ordinary operators, symbols/PBW, regular singular and logarithmic comparison are supplied, rather than rebuilt. |
| SpringerResolutionAndCharacteristicCycles §§8.1–8.4,9.1–9.7 | Open #1828, `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:834`, :966, :1077. Good filtrations, holonomic operations, intermediate extension and regular-holonomic subquotients exist with the needed characteristic-zero hypotheses. |
| MixedHodgeModulesAndIrregularHodgeTheory §§2.1–2.5,4.3,4.6,5.1–5.4,6.1–6.6,7.1,7.5–7.6,8.1–8.2,9.1–9.5,10.1–10.2,11.2–11.6,12.1–12.8 | Board `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:212`, :403, :441, :480, :568, :616, :634, :652, :672, :725, :757, :796, :873, :921, :983, :1085. All cited targets exist. General carriers and operations stay with that supplier. The broader irregular stationary-phase statement is separately declared as a gap. |
| EtaleCohomologyFoundations F.0.4,F.2.1–F.2.7,F.4.5,F.5–F.7,F.10.1–F.10.2b | Main `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:248`, :504, :1041, :1179, :1200, :1239, :907, :940, :1108. Finite/rational coefficients, base change, compact supports, duality, smooth purity, blow-ups and Frobenius descent; finite-type, invertibility and smooth-pair hypotheses retained. |
| InverseGaloisAndArithmeticFundamentalGroups IG.0.T3; EtaleDualityAndPerverseSheaves §§2.3,2.8,3.3 | #850 `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:568`; #1040 `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:1661`, :2333, :3220. Rational trace and rational perverse operations resolved. |
| DeligneWeightsAndPurity §§0.16,0.18,7.12,7.15,8.14,8.19,8.24 | #929 `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:810`, :837, :2256, :2310, :2564, :2720, :2868. Pairing weights, proper purity, monodromy and SNC boundary weights resolved; the package's singular-fibre boundary target is a distinct necessary variant. |
| SchemeAndStackFoundations §§2.11,4.11,4.13,4.17; ShimuraCompactifications §§0.16–0.18 | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3797`, :5822, :5947, :6391; #1053 `TauCetiRoadmap/ShimuraCompactifications/README.md:752`, :780, :803. Strict transforms, regularity, SNC, arbitrary-base toric schemes and properness resolved. |
| AnalyticToricGeometryPartII §§0.3,0.5 | #1647 `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:168`, :210. Character sections and line bundles present; the stronger projective embedding is the declared gap. |
| LefschetzPencilsAndVanishingCycles §§2.1–2.8, LPV.2 Examples,6.6 | #873 `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1493`, :2082, :2198, :2300, :3463. The quadratic-character/variation statement retains the valuation of the local constant; the regular-total-space specialization is not misapplied to arbitrary thickness. The characteristic-two isolated-singularity branch is separate. |
| MotivesAndAlgebraicCycles Layer 5 and §2.7 | #1313 `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:437`, :992–1091. Nori category, tensor/projector and realizations resolved. Weight filtration and the global orthogonal-root theorem are declared extensions, not supplied theorems asserted to exist. |
| ArithmeticGaloisRepresentations §§1.7,2.5–2.7,3.3,5.3,7.4 | #856 `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1172`, :2083, :2189, :2268, :2872, :3515, :4651. Full WD local factors retain `(ker N)^I`; polarization after semisimplification is the separate declared contract. |
| CohomologyComparisons §§2.13,3.4–3.5,4.3–4.4; PadicHodgeTheory §§3.2,5.1–5.3 | #1064 `TauCetiRoadmap/CohomologyComparisons/README.md:436`, :641, :663, :774, :790; #1062 `TauCetiRoadmap/PadicHodgeTheory/README.md:667`, :984, :1001, :1018. Actual period comparisons and `D_pst` resolved. The opposite Hodge–Tate sign is expressly translated in the conventions. |
| PotentialModularityAndCompatibleSystems §§1.5–1.6,1.15; ModularityAndLanglandsExtensions §§2.42,2.43,2.49 | #1075 `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:189`, :212, :382; #1180 `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1472`, :1490, :1570. Weak/strict compatibility, common potential-automorphy extension and analytic conclusions resolved. |
| AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6 | #1006 `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1818`, :2149, :2300, :2453, :3226. Full coefficient-prime comparison retains its extremely-regular irreducibility premise; ModularityAndLanglandsExtensions §2.43 is named to discharge it. No circular appeal to this package's potential automorphy is needed. |

The overlap report has no other head changing this roadmap, no cited dropped id and no cited id defined only by an open revision. The five vocabulary neighbours were inspected: #1002 owns the rigid foundations; #873 owns general vanishing cycles; #1504 owns raw sums and the sheaf constructor; #2132 `TauCetiRoadmap/FourierDeligneTransform/README.md` owns finite-field Fourier–Deligne transformation; #1006 owns general automorphic Galois compatibility. None owns the moment-motive construction claimed here. Object searches across main and the available open heads also found CharacterSumsOverFiniteFields #1712, whose `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:53` assigns untwisted all-rank sums to CongruenceSpectralGap and whose Layer 5 concerns twisted finite-ring sums; it does not own symmetric-power moment motives. The companion `packages/KloostermanSheavesAndBesselIsocrystals/README.md:70` imports scalar monodromy and connections from this package, retaining reductive-group Bessel constructions. There is no reverse supplier edge or fully qualified Lean-name collision. Ownership against unnamed/unprovided open-head files is not asserted.

The exact dependency command requested in the brief was run with this README, the board merge order, `--movable`, and the pinned content checkout. Its complete output was:

```text
depcheck: 236 roadmaps, 2153 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

### Declared supplier contracts

All six slugs occur both in `design/plan.json` and under the README's Exact supplier contracts, with named earlier suppliers. None requests an object found already implemented at the pins or already promised in the cited supplier section at the required generality. They are precise extensions of a single interface, not unowned prerequisites.

| Slug | Supplier and missing interface |
|---|---|
| `higher-thickness-picard-lefschetz` | PadicDifferentialEquationsAndRigidCohomology RD.7.20: `Q−u(√−p)^(2e)`, arbitrary `e≥1`, resolution and compatible rigid-to-de Rham map. The `k=9,p=3` valuation-four witness makes the extension necessary. |
| `irregular-stationary-phase` | MixedHodgeModulesAndIrregularHodgeTheory §11.5: inverse Fourier singularities/vanishing cycles from slope-one exponential factors, with the fixed positive kernel sign. The present regular-input theorem does not supply this converse. |
| `nori-weight-filtration` | MotivesAndAlgebraicCycles Layer 5: functorial exhaustive finite filtration, strictness, Tate/projector compatibility and realization agreement. Existing realizations alone do not produce it on motives. |
| `orthogonal-motive-root-number` | MotivesAndAlgebraicCycles §2.7: Saito's global sign for the stated even-weight orthogonal geometric summands and boundary kernels. |
| `semisimplification-similitude-form` | ArithmeticGaloisRepresentations §7.4: compatible nondegenerate same-type form on characteristic-zero semisimplification; Serre Theorem 4.2.1, lines 380–385. |
| `toric-polytope-projective-embedding` | AnalyticToricGeometryPartII §0.5: the stated character sections give a closed immersion for a full-dimensional lattice polytope with regular normal fan over every commutative base ring. Existing line-bundle/global-section targets do not assert this immersion. |

These contracts cause no finding. They do not cure R01, which contradicts an interface already stated by its supplier.

## Not verifiable

- `Saito-orthogonal`, *The sign of the functional equation of the L-function of an orthogonal motive* (1995): the full text remains legally unavailable and the manifest records it as uncertified. The settled locator and declared supplier contract are retained; no new source request was made. The odd global-root-number proof was checked for its ownership and stated hypotheses, but not certified against this unavailable text.
- Ownership against open pull requests for which no readable head was provided is not claimed. The supplied head index, relevant available heads, main, board packages and the overlap leads were checked as described above.

## Source issues

These are issues in the read source versions, not additional package findings. The roadmap already corrects or explicitly contracts for them.

- **Misprint** in FSY at §5.1.1, printed p.40 (FSY line 1731): the source says reciprocal eigenvalues pair using p^((k+1)/2); it should use p^(k+1); affects nothing.
- **Misprint** in FSY at §3.2.1, printed p.23 (FSY line 987): the source says the single Kloosterman sheaf uses an nk-dimensional torus; it should use dimension n before taking tensor powers; affects nothing.
- **Misprint** in FSY at proof of Proposition 4.20, printed p.33 (FSY line 1408): the source says the primitive piece is indexed by k; it should be indexed by k−1 for the rank-k monodromy block; affects nothing.
- **Misprint** in FSY at §5.1.2, printed p.41 (FSY line 1761): the source says the chart derivative is nonzero on the coordinate divisor; it should restrict also to the hypersurface, where it equals −1/z₁; affects nothing.
- **Gap** in FSY at proof of Proposition 5.23, printed p.50 (FSY lines 2249–2254): the source says every local quadratic model has unit thickness after the quadratic extension; it should handle higher thickness, including constant 18 at k=9,p=3 with uniformizer valuation four; affects the proof.
- **Error** in XZ at §2.1.5, printed p.10 (XZ line 489): the source says exp(π(t−t^p)) is horizontal in the displayed Frobenius-to-original direction; it should use exp(π(t^p−t)) for the displayed positive-sign connections; affects a stated result.
- **Misprint** in FSY at Corollary 5.30, printed p.52 (FSY lines 2336–2362): the source says its gamma expression equals the standard Hodge recipe; it should include the constant π^{d(d+1)/4}, already √π at d=1; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p.63 (FSY line 2876): the source says derived restriction has perverse degree zero; it should be the divisor's shifted constant object shifted by [1], with perverse cohomology in degree −1; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p.71 (FSY line 3222): the source says the composite direct-image functor vanishes; it should say the geometric composite is constant at zero, whose direct image need not vanish; affects the proof.
- **Error** in FSY at Remark 5.41, printed p.59 (FSY line 2676): the source says the local determinant uses the full semistable period module; it should retain the monodromy kernel and inertia/descent invariants; affects the proof.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, printed p.10 (Serre-orthogonal line 393): the source says isotropy of S means vanishing on all pairs in E; it should require vanishing on pairs in S; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "422f3503ccfb92790e90605af06bf7d5dda639b7", "job": "REV-PKG-KloostermanMomentsAndPotentialAutomorphy~4", "model": "gpt-6-astra", "worker": "chris-30"} -->
