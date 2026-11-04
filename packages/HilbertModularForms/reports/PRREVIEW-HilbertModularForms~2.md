# Review of HilbertModularForms (pull request #1724 at 89b7310)

**Verdict:** needs changes

This review is of the two files in `TauCetiRoadmap/HilbertModularForms/` at the specified head. There are 12 findings: four P1, five P2, and three P3. The supplied gate passes; the independent dependency check and direct Lean elaboration also pass. Those checks do not establish the mathematical identities below. No pull-request file was changed.

The comparison with the previous review was done first. In this table, locations are in `TauCetiRoadmap/HilbertModularForms/README.md` unless `Suggested.lean` is specified. “Repaired” addresses the previous witness, not every other assertion in that section.

| Previous finding | Current passage and disposition |
|---|---|
| R01, constants lost by positive coefficients | **Partly repaired.** Lines 507–509 retain “the standard constant term of each component”; `Suggested.lean:399` pairs constants with coefficients. The rejection test still excludes the constant form: new R04. |
| R02, zero level | **Repaired.** Line 667 says “Every assertion here has nonzero level”; `Suggested.lean:433` explicitly binds `h𝔫 : 𝔫 ≠ ⊥`. |
| R03, representative transport | **Repaired for the stated transport.** Line 483 inserts “N(α_c)⁻¹”; line 520 tests coefficient invariance. Its adelic counterpart still needs the correction in new R02. |
| R04, extra bad-prime coset | **Repaired.** Line 772 requires “(α_{11}) + 𝔫 = 𝒪_F”; the bad-prime Check at 856 removes the extra term. |
| R05, lattice rank | **Repaired.** Line 356 specifies rank “2n” over ℤ. |
| R06, Siegel objects | **Repaired against the former witnesses.** Lines 598–600 use the projective image and cusp coordinates. The zero-function compact-superlevel assertion has a separate defect, new R05. |
| R07, Eisenstein bound | **Repaired.** Lines 731–734 use the divisor-sum bound and an ε allowance in weight two; line 640 explicitly disclaims the false global boundedness used before. |
| R08, self-twist uniqueness | **Repaired.** Line 1347 says “modulo the self-twist group”; lines 1374–1375 retain both elements of the identity fibre. |
| R09, CM coefficient field | **Repaired.** Lines 1394–1397 use “norm-fibre sums” and only containment in the individual-value field. New R01 concerns the infinity-type sign instead. |
| R10, doubled split-prime lift | **Repaired.** Line 1484 says “each of” the two split operators; each eigenvalue is b(p), not their sum. |
| R11, norm-character subtraction | **Repaired.** Line 1547 subtracts the trace on the actual norm-character subspace. |
| R12, parallel foundations re-planned | **Repaired.** Lines 98–104 consume §F.5, including both integral lattices; the retained formulas extend to nonparallel weights and have a required comparison. |
| R13, inadequate adelic suppliers | **Repaired at the citation level.** Lines 129–132 name AL.2.2 and R17.4.16 and distinguish the ℚ-only adapter. New R02 is a convention mismatch in the proposed Hilbert adapter. |
| R14, rationality supplier | **Repaired against the cited absence/overclaim.** Lines 1114–1121 name §§11.9, 11.18, 12.17–12.19 and own the extra integral-lattice construction. Field base change is not treated as integral flatness. |
| R15, potential versus actual modularity | **Repaired as a conditional interface.** Line 1634 assumes an explicit modularity witness over F; lines 1637–1641 require all local factors. The real-quadratic existence statement now cites Freitas–Le Hung–Siksek, Theorem 1. |
| R16, failing gate | **Repaired.** The gate at this head reports all counters zero and `OK`; direct elaboration also succeeds. |
| R17, non-occurring eigensystems | **Repaired.** Line 997 restricts to an eigensystem “occurring in a nonzero cusp form.” |
| R18, ramified character space | **Repaired in scope.** §2.7 adds finite nebentypus; §9.1 permits the central character ψχ² and conductor change. |
| R19, L-card constants | **Repaired.** Lines 1278–1280 include “2ⁿ Q^(−w/4)”. |
| R20, archimedean sign | **Repaired.** Line 1247 uses the sum of the individual weights in the exponent of i. |
| R21, Atkin–Lehner adjoint norm | **Repaired.** Line 908 uses the central action with no extra norm multiplier. |
| R22, recovering signs | **Repaired.** Line 1178 limits the non-recovery assertion to the single bad-prime coefficient. |
| R23, unspecified operators/integral | **Repaired against the former absence.** §5.6 specifies matrices, component changes and a nonprincipal control; §8.2 gives the Mellin integrand and its unit quotient. |
| R24, missing convergence headline | **Partly repaired.** `Suggested.lean:449` adds cusp-form convergence. The general-form assertion at README 1209 is still absent: new R06. |
| R25, padding | **Partly repaired.** The API catalogue is gone and the retained algebraic helper proofs support real definitions. The unused `LFunction` definition remains: new R12. |
| R26, target shape | **Partly repaired.** The main headings and namespace are corrected, but missing API/Check lists and claim-level locators remain: new R10. |
| R27, source manifest | **Not repaired.** No `sources.toml` is present: new R11. |
| R28, squarefull-level parity | **Not repaired.** Lines 1535–1537 repeat the assertion about even degree: new R07. |
| R29, library overclaims | **Not repaired.** Lines 453–454 still assign an n-torus theorem to `AddCircle`; line 723 still cites a residue constant as a pole theorem: new R09. |

No supplied repair report marks any of these outstanding findings “not actionable in this package.”

## R01 (P1) — The CM infinity-type sign inverts the required ideal character

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1381`: “n_τ + n_{τ̄} = k₀ - 1”.

**Claim:** With Tau Ceti's `HeckeCharacter.IsAlgebraic` and `AlgebraicInfinityType`, the displayed norm-fibre sums are coefficients of a weight-k newform. These are idelic infinity exponents; the ideal character has the inverse principal-value convention.

**Witness:** At norm 5 in the stated weight-two CM example, the inverse inducing character has values 1/(−1±2i). Their sum is −2/5 and product 1/5; weight two requires determinant 5.

The pinned identity is `HeckeCharacter.idealCharacter_apply_toPrincipalIdeal_eq_embeddingCharacter_inv`, `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:270`. The embedding monomial is defined with positive exponents at `TauCeti/NumberTheory/NumberField/Global/InfinityType/Basic.lean:287`. Taking the inverse of the usual character of y²=x³−x gives exactly the currently admitted exponent pair (1,0), with unequal conjugate characters, at every CM pair above ℚ(√5). Its nonintegral coefficient also contradicts §7.5.

**Repair:** For these native idelic exponents replace the sum condition by `n_τ + n_{τ̄} = 1 - k₀`, retaining the absolute-difference condition, and propagate this convention through the induction and central-character comparison. Add the norm-5 Check with both characters. With exponents (−1,0), the values are −1±2i, their sum is −2, and their product is 5. Do not change the pinned ideal-character convention.

## R02 (P1) — The adelic Hecke comparison reverses central scalars

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:981`: “S_𝔭 to K₀(𝔫) π_𝔭 K₀(𝔫)”. See also the defining formula at 966.

**Claim:** The stated adelization identifies the arithmetic classical operators with positive finite double cosets acting by right translation.

**Witness:** Take F=ℚ(√5), parallel weight four, and the prime (2), norm 4. Finite scalar 2 becomes infinite scalar 1/2, so Φ scales by 1/16. Section 5.2 gives S_(2)=16.

Choose a nonzero weight-four form and evaluate where it is nonzero. The finite scalar adele equals rational 2 times the adele with infinite component 1/2. Left rational invariance and §0.3 force the value 1/16, independently of any Satake choices. The supplier's ordinary right translation does not reverse this scalar. Weight two hides the defect because both scalars equal 1. The raw component formula also omits the factor needed to respect §2.3's normalized representative transport.

**Repair:** A consistent choice retaining the arithmetic slash is to use `Ψ_f(g)=N(rep(c)) (f_c ∣_k g_∞)(i)` in the displayed decomposition, compare classical operators with the **inverse** finite double cosets, and explicitly translate those operators to the supplier's positive-generator coordinates before asserting R16.4.4 compatibility. Check all component factors from §5.1 in that translation. For the witness, the inverse finite scalar gives infinite scalar 2 and hence 16=16. Under `rep′=α rep`, the factor N(rep′) cancels the N(α)⁻¹ in §2.3. Another convention is possible, but it must give both these equalities and amend the claimed shared coordinates.

## R03 (P1) — The Petersson formula has the opposite complex linearity from native L²

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:651`: “the restriction of the L² inner product”. The integral at 646 conjugates g.

**Claim:** The integral linear in f is the pinned Mathlib inner product on the same ordered pair (f,g).

**Witness:** Normalize a nonzero cusp form h to norm 1 and set f=i h, g=h. The displayed integral is i; Mathlib's L² inner product is −i.

`MeasureTheory.L2.inner_def`, `Mathlib/MeasureTheory/Function/L2Space.lean:136`, integrates the pointwise native inner product, which is conjugate-linear in its first argument. This affects the claimed identification, even though norms and orthogonality agree.

**Repair:** Conjugate f instead of g in §3.4, and use the native convention consistently in subsequent adjoint and kernel formulas. The witness then reads −i=−i. Alternatively state explicitly that the displayed convention is the native inner product with its arguments reversed and adjust every comparison accordingly.

## R04 (P1) — The rejection test rules out the roadmap's own constant form

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1803`: “a(μ) ≠ 0 at a μ that is not totally positive cannot exist”.

**Claim:** Every coefficient outside the strictly positive cone vanishes, including the coefficient at zero.

**Witness:** The next bullet admits f=1 in weight zero. It has a(0)=1, whereas 0 is not totally positive. Thus that bullet directly refutes this rejection test.

**Repair:** Add `μ ≠ 0`, exactly as in `Suggested.lean:312`. Test the two cases separately: μ=0 for f=1 is retained with value 1; a nonzero mixed-sign exponent is rejected. The corrected test agrees with Koecher's `{0} ∪ {μ ≫ 0}` support and full-expansion injectivity.

## R05 (P2) — The compact superlevel argument needs a nonzero form

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:629`: “a compact set that varies with f”.

**Claim:** The union of cusp Siegel sets intersected with `{φ_f ≥ sup φ_f / 2}` is compact for every cusp form.

**Witness:** For f=0, φ_f=0 and sup φ_f/2=0. The intersection is the whole union of Siegel sets, containing the unbounded cusp ray y=(t,…,t).

**Repair:** Apply the positive-superlevel compactness argument only after assuming f≠0 and proving sup φ_f>0. Handle f=0 separately with coefficient-bound constant C=0 and a chosen point attaining its maximum. Then the zero case gives 0≤0 without the false compactness assertion.

## R06 (P2) — General-form absolute convergence is statable but omitted

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1209` promises convergence for a general form; `TauCetiRoadmap/HilbertModularForms/Suggested.lean:449` only states it for cusp forms.

**Claim:** The module states the statable L-series headlines. The general-form bound and its convergence theorem already use the same native coefficient and `LSeriesSummable` carriers.

**Witness:** A scratch theorem with the existing binders, no cusp hypothesis, and `(k.top : ℝ)+1 < s.re` elaborates successfully. A weight-four Eisenstein form at s=6 is covered by the README but excluded by the existing theorem.

**Repair:** Add that general-form convergence signature, with degree greater than one and nonzero level explicitly bound. Keep the sharper cusp threshold. On weight four, the general threshold is 5<6; the cusp threshold is 3<6. No new carrier, stand-in or sorry'd definition is needed. The scratch probe tests statability, not a completed proof.

## R07 (P2) — Squarefull level does not force indefinite quaternions in even degree

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1536`: “even-degree F at squarefull level use an indefinite algebra”.

**Claim:** The preceding parity obstruction explains this assertion. It implies the opposite when the finite discriminant is the unit ideal.

**Witness:** For n=2 and 𝔇=1, n+ω(𝔇)=2 is even. A quaternion algebra ramified at both real places and nowhere finite exists, with Eichler orders at squarefull levels.

**Repair:** Delete the computational assertion. State the mathematical alternatives: 𝔇=1 is permitted in every even degree, independently of whether the level is squarefull; odd degree requires an odd number of finite ramified places for a totally definite algebra. Recheck n=2,𝔇=1 (allowed) and n=3,𝔇=1 (forbidden). Dembélé–Voight's definite construction in Example 6.3 is consistent with the first case (`dembele-voight` line 1357).

## R08 (P2) — Roots alone do not define the base-change Euler polynomial

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1411`: “the polynomial whose roots are the r-th powers of the roots”.

**Claim:** This determines `h^{(r)}` and hence the equality defining base change. It does not specify its scalar normalization.

**Witness:** For h=1−3T+2T² and r=2, both 1−5T+4T² and T²−5T/4+1/4 have roots 1 and 1/4, with the same multiplicities. Only the first has constant term 1.

**Repair:** Restrict the operation to Euler polynomials with h(0)=1 and prescribe `h^{(r)}(0)=1`, retaining degree and multiplicities; equivalently consume the supplier's `det(1−A^r T)` directly. For the witness this uniquely gives 1−5T+4T². Degree-zero input gives 1. Remove the false claim at 1430 that `Suggested.lean` contains `powRoots`; it does not.

## R09 (P2) — The Fourier and zeta prerequisites still overstate the pinned APIs

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:453`: “hasSum_fourier_series_L2 … on the n-torus”; and 723: “its pole (NumberField.dedekindZeta_residue)”.

**Claim:** The named declarations supply a product-torus analytic Fourier theorem and complex meromorphic continuation at the zeta pole.

**Witness:** `Mathlib/Analysis/Fourier/AddCircle.lean:433` quantifies over one `AddCircle T`, with L² convergence. `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:56` defines a real number; it is not a complex continuation theorem.

**Repair:** Own the product/lattice Fourier comparison and the upgrade to absolute, locally uniform holomorphic convergence as explicit subtargets of §2.1, using the circle theorem only at its actual generality. For §4.2 cite `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` in `TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158`, with its half-plane and residue hypotheses; cite the L-functions supplier for any further continuation used. For a real quadratic field this theorem supplies a holomorphic remainder on Re(s)>1/2, which really contains the required neighborhood of 1. An L² equality on a circle still cannot serve as a pointwise identity on a two-torus.

## R10 (P3) — Definitions still lack the required APIs, discriminating Checks and local locators

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:345`: “The discriminating examples are the Checks in §§0.1–0.4”.

**Claim:** Those sections provide the required Checks. They have no Check lists. Numerous definitions later in the file also put several laws in prose without an API list, and references to whole chapters do not identify the individual claimed theorem.

**Witness:** §§0.1–0.4 define the action, holomorphy, weights and two slash normalizations but contain zero `Checks` blocks. §0.2's several-variable Cauchy estimates have no exact source locator.

**Repair:** Give each definition its API list and at least three discriminating Checks; attach a precise theorem/section/page or pinned declaration to each theorem, including the seeded targets. Replace the dangling Examples sentence with actual examples. A scalar 2 in weight four must give arithmetic factor 16 and unitary factor 1 over ℚ(√5); an identity-only Check would miss R02. Also correct §10.2's quaternionic classical-weight citation from §1.1 to §1.3: the supplier's §1.1 constructs locally analytic weights, whereas §1.3 gives the algebraic determinant twist and dual convention.

## R11 (P3) — The cited works still have no source manifest

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1843`, “References”; the folder contains no `sources.toml`.

**Claim:** The references are sufficient source records. The required source identity, version, locator and legal-fetch metadata are absent.

**Witness:** The folder contains README, Suggested.lean and roadmap metadata, but no source manifest. The README cites both numbered published results and an arXiv work without recording the version actually checked.

**Repair:** Add the required `tauceti-roadmap-sources/v1` manifest, one persistent key per work. Record the legal fetch and the actual version/locator, and mark inaccessible texts honestly. Reuse the source identifiers in this report; do not copy source texts into the repository. This review requested all cited works without modifying the pull request's manifest.

## R12 (P3) — The unused LFunction wrapper is not needed by an acceptance theorem

**Location:** `TauCetiRoadmap/HilbertModularForms/Suggested.lean:443`: “def LFunction”.

**Claim:** This definition is needed to state a retained headline. No theorem or other definition uses it; the convergence theorem directly names `LSeriesSummable (normCoeff F (coeff F f))`.

**Witness:** Removing the three-line wrapper leaves every retained declaration's type and body unchanged. Its body merely applies the native LSeries to the already-defined coefficients.

**Repair:** Delete it from `Suggested.lean`. Keep the L-function definition and its API in the README. It should return to the acceptance file only when a retained headline actually needs it.

## Verified sound

The findings above are failures of specific assertions, not a claim that the remaining targets have been formally proved. The following records the completed checks and their limits.

### Gate, signatures and scope

- The head matches `89b73103b4e3ee268f38eb89ba0f0ea0774b405b`. The diff outside this roadmap folder is empty. The working tree remains unchanged.
- The supplied gate reports all scanner, dependency, metadata and targeted-build counters zero, ending `OK`. No stray file, sorry'd data, `set_option`, forbidden import, process PR number, copied source file or outside-folder edit was reported.
- The independently executed dependency check printed exactly:

```text
depcheck: 204 roadmaps, 1600 edges, 0 problem(s)
```

- Direct `lake env lean` elaboration of the acceptance module succeeded with exactly 11 `sorry` warnings and no other diagnostics. All five individual Tau Ceti imports resolve at the pins.
- A scratch copy printed `#check @name` for all 50 declarations, and I compared the resulting signatures with the definitions and README. The 24 heuristic dropped-binder alerts do not establish defects: pure matrix operations, the half-space and weights legitimately omit number-field or total-reality hypotheses; analytic operations retain them. All applicable admitted finite-dimensionality, Koecher, coefficient and convergence statements explicitly retain degree/nonzero-level assumptions. No additional lost-binder finding was identified.
- Each of the 11 admitted theorems was tried with the single tactic `simp` on a scratch copy. None closed. Reading the definitions also found no admitted conclusion simply assumed as a hypothesis. This does not make the unused definition in R12 necessary.
- The 9 citation-resolver alerts are LMFDB knowl/database identifiers, not missing Lean declarations. They were not promoted to mathematical findings.

### Computed adversarial table

The 99 computed rows cover all 56 numbered targets, each sampled target, each acceptance theorem, and each mathematical finding. Where a theorem has several independent formulas, they have separate rows. “Pass” means the displayed calculation agrees; it is not a substitute for a proof in arbitrary degree or level. “Conditional” identifies a numerical consequence under the stated existence/modularity hypotheses. The indicated repairs are requests; no roadmap edits were made.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Ambient field hypotheses | zero ring and degree-zero field | Field excludes 0=1; [F:ℚ]≥1; total reality gives at least one real place | Empty weight index and rank-zero field cases are outside the carrier |
| Ideal indexing | zero ideal, unit ideal | zeroExtend(f)(0)=0; normCoeff(f)(0)=0; N(O)=1 | Zero is excluded from the ideal series; the unit contributes c(O), not 0/0 |
| 0.1 domain/action | z=i; identity; translation by 1 | 1·i=i; (1 1;0 1)·i=1+i, both imaginary parts 1 | Pass |
| 0.1 positivity restriction | diag(2,1), diag(−1,1) | Möbius imaginary parts 2 and −1; determinants 2 and −1 | Positive group includes the first and excludes the second |
| 0.2 holomorphy | coordinate z and conjugate coordinate | ∂̄z=0; ∂̄conj(z)=1 | Pass; a continuous-only carrier would admit the wrong example |
| 0.2 trace exponential | two coordinates, μ=1, z=(i,i) | exp(2πi·2i)=exp(−4π); product exp(−2π)²=exp(−4π) | Pass |
| 0.3 scalar slash | F=ℚ(√5), k=(4,4), scalar 2 | N(2)²=4²=16; each local factor 2⁶/2⁴=4, product 16 | Pass |
| 0.3 multiplication order | translation T and inversion S, z=i | (TS)·i=1+i, (ST)·i=(−1+i)/2 | Distinguishes right slash order; not interchangeable |
| 0.4 unitary conversion | same scalar 2, weight four | unitary factor 1; N(det(2I))^1=16; arithmetic factor 16 | Pass |
| 1.1 lattice rank | quadratic F, L=O⊕O | rank over O=2, rank over ℤ=4=2·2 | Previous R05 repaired |
| 1.2 congruence carrier | det-one matrices diag(1/2,2) and identity | first diagonal entry 1/2∉O, hence excluded; identity entries integral, hence included | Pass; source knowl omits this distinction |
| 1.2 level and Borel | level (2), identity and S | lower-left entries 0∈(2), 1∉(2) | Pass |
| 1.3 conjugation | b′=2b, D=diag(1,2) | D(a b;c d)D⁻¹=(a b/2;2c d); upper lattice halves, lower lattice doubles | Pass |
| 1.4 cusp equivalence | standard group, S·∞ | S·∞=0, so ∞ and 0 lie in the same full-level cusp orbit | Pass; cannot identify cusps with the narrow component set in general |
| 1.4 level cusps | prime level and ∞,0 | a matrix in Γ₀(p) sending ∞ to 0 would have a=0 and unit determinant −bc with p dividing c, impossible | Two inequivalent cusps; discriminates level from component count |
| 1.5 representative transport | b′=2b, quadratic field | N(2)=4; transport prefactor 1/4 | Pass; raw slash alone misses factor 4 |
| 2.1 Fourier coefficient | constant 1; μ=0 and μ≠0 | normalized constant mean=1; nonzero character mean tends to 0 | Pass |
| 2.1 exponent lattice | b=2O | dual of (1/2)O is 2d⁻¹, not (1/2)d⁻¹ | Pass by trace pairing; product-torus proof still needed, R09 |
| 2.1 absolute Fourier headline | f=1, k=0 | only μ=0 contributes: sum=1=f(z) | Pass; no growth-at-cusps condition needed for this constant control |
| 2.2 Koecher headline | μ=0; nonzero mixed-sign μ | a₀(1)=1 allowed; mixed-sign coefficient of an actual modular form must be 0 | Pass in theorem; rejection test fails, R04 |
| 2.2 degree restriction | degree one, weak form j | coefficient of q⁻¹ is 1; degree hypothesis 1<1 is false | Correct exclusion |
| 2.3 parity | F=ℚ(√5), norm −1 unit, odd k₀ | scalar factor (−1)^(k₀−2)=−1; invariance gives f=−f, hence f=0 | Pass |
| 2.3 coefficient-preserving transport | k=(2,2), b′=2b | raw slash multiplies Fourier amplitudes by 4; 1/N(2)=1/4 restores the original value | Pass |
| 2.4 normalized coefficient | k=(2,4), k₀=4 | m=(1,0); for μ=(u,v), c=a·u; replacing μ by εμ multiplies a by ε₁⁻¹ and u by ε₁ | Product unchanged |
| 2.4 full-expansion injectivity | zero tuple and constant-one tuple | positive coefficients both 0; standard constants 0 versus 1 | Repaired pair separates them |
| 2.4 cusp coefficient injectivity | constant one versus zero | constant one has cusp constant 1 and is excluded; zero has coefficient 0 and constant 0 | Correct domain; no weight-zero counterexample |
| 2.5 nonparallel constants headline | positive unit ε, weights (2,4) | unit constant multiplier ε₁^(−1)≠1 for ε₁≠1; a₀=ε₁⁻¹a₀ forces a₀=0 | Pass |
| 2.6 cuspidality | zero form and constant one | all slashed box means for zero are 0; identity mean of 1 is 1 | Correctly includes zero and excludes constant one |
| 2.7 finite nebentypus | χ quadratic; χ of order three | χ²=1 in first case; χ²=χ⁻¹≠1 in second | Character space must change in the second case; now allowed |
| 3.1 Siegel height | balanced y=(t,t) | y₁/y₂=1 for all t; N(y)=t²→∞ | Unit-shape reduction does not bound radial height |
| 3.1 projectivization | scalar units ε^r I | all act as the identity on z; their projective image has cardinality 1 | Repairs former infinite central-overlap counterexample |
| 3.2 invariant measure | scalar dilation z↦2z in two coordinates | Jacobian 2⁴=16; product y_w² denominator scales by 2⁴=16 | Ratio 1, as required |
| 3.3 Hecke coefficient bound headline | norm-4 coefficient −3, k₀=2 | 3≤C·4; C=1 suffices for this coefficient | Pass as numerical control, not a global constant proof |
| 3.3 zero superlevel | f=0 | sup/2=0; {φ≥0}=whole domain; cusp-ray height=t² unbounded | Fails, R05 |
| 3.3 normalized exponent | k=(2,4), μ=(u,v) | coefficient estimate u¹v² times normalization u¹ equals (uv)² | k₀/2=2 agrees |
| 3.3 general growth | weight-four divisor sum at norm q=4 | σ₃(p)=1+4³=65; q⁴=256 | Consistent with general O(N(m)^k), not cusp O(N(m)^(k/2)) |
| 3.4 native complex inner product | f=ih, g=h, norm h=1 | roadmap i; native −i | Fails, R03 |
| 3.4 scalar invariance | k=(4,4), scalar 2 | norm square factor 16²=256; N(det)^2=16²=256 | Pass independently of conjugation convention |
| 3.5 cusp finite-dimensional headline | F=ℚ(√5), level norm 31, k=2 | dimension 1, not 0; source example has one normalized eigensystem | Pass on example |
| 3.5 modular/tuple finite dimension | full level, k=0, narrow class number 1 | constants give dimension 1; one-component product still dimension 1 | Pass |
| 3.5 negative-weight theorem | unit level versus zero level, k=−2 | unit level: constant 1 fails inversion law; zero level upper-triangular unit law gives factor 1 | Nonzero-level binder retains the required exclusion |
| 4.1 cusp-normalized Eisenstein | chosen cusp κ, distinct κ′ | prescribed constants δκκ=1, δκκ′=0; zero series would have 0,0 | Nonvacuous normalization; general existence source not certified |
| 4.1 convergence margin | even weights k=4 and k=2 | strict inequality k>2 is true and false respectively | Weight two requires separate limit construction |
| 4.2 Hecke trick | n=2 versus n=1 | s^(n−1)=s→0 versus 1; classical correction −3/(πy)≠0 | Correct dimension distinction; analytic source not certified |
| 4.3 direct sum | normalized Eisenstein E and cusp h | cusp constants of E+h and h are 1 and 0; intersection requires constant 0 | Compatible with direct sum and cusp normalization |
| 4.3 weight-two estimate | m=p₁⋯pᵣ squarefree | σ₁(m)/Nm=∏(1+1/Npᵢ), not a uniform constant; N(m)^ε supplies slack | Previous fixed-linear-bound error removed |
| 5.1 coset counts | q=4 good; q=31 bad | good q+1=5; bad q=31, not 32 | Pass |
| 5.1 prime powers | q=4, m=p² good | divisor sum 1+4+16=21 versus cyclic-only count 16+4=20 | Noncyclic sublattice retained |
| 5.2 central operator | scalar 2, k₀=4 over quadratic F | S_(2)=N(2)²=16 | Pass classically; contradicts §6.3, R02 |
| 5.2 narrow sign | F=ℚ(√6), a=√6, k₀=2 | N(a)=−6, sign²=+1 | Nontrivial sign eigenspace vanishes in this even weight |
| 5.3 Hecke recurrence | q=4, k₀=2, ψ=1, c(p)=−3 | c(p²)=9−4=5; c(p³)=−15+12=−3 | Pass |
| 5.4 coefficient action | normalized f, m=1, good p | c(1,T_p f)=c(p,f)+0=c(p,f) | Checks normalization at unit ideal |
| 5.4 bad-prime action | Steinberg newform, c(p)=−1 | c(1,U_p f)=−1; c(p,U_p f)=1; the erroneous extra norm-31 term would give 32 | Repaired unit condition prevents extra coset |
| 5.5 adjoint scaling | q=4, k₀=4, ψ=1 | normalized central action is 4⁻²·16=1; T_p*=T_p, not T_p/16 | Correctly uses the normalized central action; native pairing comparison needs R03 |
| 5.5 diagonalization scope | p³-old space from an unramified newform, basis g,Vg,V²g,V³g | charpoly(U)=X²(X²−a_pX+q^(k−1)); dim ker U=1, zero algebraic multiplicity=2 | Bad U need not diagonalize; roadmap correctly restricts this theorem to good operators |
| 5.6 Fricke square | principal q=4, k₀=4 | raw slash by W²=−πI contributes N(π)²=16; normalized W contributes square 1 | Normalization distinguishes raw from normalized operator |
| 5.6 normalized adjoint | normalized scalar character 1 | W²=1 gives W*=W; spurious q^(k₀−2) would give 16W | Previous R21 repaired |
| 6.1 double coset components | narrow class number 1 | one component; determinant of identity has class 1 | Pass; ordinary versus narrow ray positivity remains explicit |
| 6.2 representative normalization | b′=2b | raw Φ′/Φ=1/4 under the chosen transport; multiplying by N(b′)/N(b)=4 restores 1 | R02 repair needed |
| 6.3 scalar Hecke compatibility | finite 2I, weight four | right translation gives 1/16; claimed classical S gives 16 | Fails, R02 |
| 6.4 multiplicity one | zero eigensystem versus an occurring normalized eigenline | zero function has c(1)=0; normalized form has c(1)=1 | “Occurring in nonzero cusp form” rules out vacuous zero witness |
| 7.1 old space | unit level | no proper ideal divisor; sum of images=0 | Pass |
| 7.1 degeneracy | V_p of normalized g | c(1,V_p g)=0; c(p,V_p g)=c(1,g)=1 | Correct direction and zero-extension convention |
| 7.2 normalization/new line | f, 2f, 0 | c(1)=1,2,0 respectively | Only f is normalized; no arbitrary rescaling ambiguity |
| 7.3 oldform decomposition | g and g+aV_pg | coefficients at 1 both 1, coefficient at p changes from c(p,g) to c(p,g)+a | Good eigensystem does not specify an individual old vector |
| 7.4 all-prime eigenvalues | same good new line, normalized coefficient | at p² with q=4 and c(p)=−3, eigenvalue 5 by recurrence | Compatible with good-prime recurrence and normalization |
| 7.5 coefficient field/orbit | t²=3, coefficient −2t | conjugates −2√3 and +2√3; field degree and orbit size both 2 | Pass |
| 7.5 integrality | same coefficient −2t | minimal polynomial X²−12 is monic integral | Pass; R01's inverse CM values fail this test |
| 7.6 squarefull bad prime | trivial character, exponent ≥2 | local Euler factor 1, c(p)=0, and c(pʳ)=0 for r>0 | Pass under stated newform/local hypotheses |
| 7.7 Steinberg sign | norm 31, k₀=2, c(p)=−1 | c(p)=−ε_p·31⁰ gives ε_p=+1 | Correct sign and exponent |
| 7.7 single-coefficient limitation | squarefull p | c(p)=0 independent of possible ± local signs | Zero coefficient alone cannot recover the sign |
| 8.1 Euler polynomial | c(p)=−3, q=4, k₀=2 | 1+3T+4T²; reciprocal starts 1−3T+5T² | Matches the recurrence |
| 8.1 cusp convergence headline | k₀=2, Re(s)=3 | threshold k₀/2+1=2<3 | Present in Lean |
| 8.1 general convergence headline | k₀=4 Eisenstein, Re(s)=6 | threshold k₀+1=5<6; no cusp hypothesis available | Missing statable theorem, R06 |
| 8.2 Mellin normalization | μ=1, s=1 | ∫₀∞ exp(−2πy)dy=1/(2π)=(2π)^−1 Γ(1) | Fixes the 2π factor |
| 8.2 archimedean sign | weights (2,4) | i^(2+4)=−1; former i^(2·4)=+1 | Previous R20 repaired |
| 8.3 card normalization | n=2, motivic weight w=1 | Γ_C factors contribute 2²=4; translating Q exponent adds Q^−1/4 | Displayed factor 4Q^−1/4 agrees |
| 9.1 twisting | quadratic χ(p)=−1, c(p)=4 | new coefficient −4; central multiplier χ(p)²=1 | Pass |
| 9.1 general finite character | χ(p)=ζ₃ | coefficient 4ζ₃; determinant multiplier ζ₃²≠1 | New §2.7 is necessary and now supplied |
| 9.2 CM/self-twist | inert p and split p | inert: 0=(−1)0; split: c=1·c | Both (id,1) and (id,χ_CM) occur; quotient formulation repaired |
| 9.2 non-CM control | inert prime with c(p)=4 | twist would give −4, whereas 4≠−4 | Rejects the proposed CM field |
| 9.3 infinity-type sign | weight-two inverse inducing character | sum −2/5, product 1/5 versus required determinant 5 | Fails, R01 |
| 9.3 norm-fibre field | correct values −1±2i | sum −2∈ℚ; individual values generate ℚ(i) | Field containment repaired; equality would be false |
| 9.4 polynomial normalization | h=(1−T)(1−2T), r=2 | normalized answer 1−5T+4T²; same roots also give T²−5T/4+1/4 | Underdetermined until R08 |
| 9.4 Satake power sum | s=3,e=2,r=2 | roots 1,2 give 1²+2²=5=3²−2·2 | Pass |
| 9.4 inert base change | b(2)²=−5, χ₂=−1 | c((2))=−5−2(−2)=−1 | Pass |
| 9.5 descent obstruction | conjugate prime coefficients 4,−4 | Galois invariance would require 4=−4 | Correctly rejects base change |
| 9.6 split lift | b(5)=−3 | each of c(p₅),c(p₅′)=−3; their sum=−6 is a different operator | Previous R10 repaired |
| 9.6 inert lift | b(2)²=−5, k=2 | b(2)²+2·2=−1 | Matches Zagier (95b) |
| 9.6 ramified lift | b(29)=−3+2t, t²=−5 | b(29)+conj(b(29))=−6; product=9+20=29 | Correct trace and determinant |
| 10.1 D-new | D=1 | no additional prime-new conditions; D-new space equals entire cusp space | Necessary unit-discriminant control |
| 10.2 quaternion parity | n=2,D=1; n=3,D=1 | total ramified-place counts 2 and 3 | First permitted, second forbidden; R07 |
| 10.3 Brandt trace | source norm-13 example | total trace 36 minus norm-character trace 28 equals cusp trace 8 | Repaired subtraction, not just one degree term |
| 10.3 nontrivial norm character | degree q+1=5, χ(p)=−1 | its trace contribution −5, not +5 | Actual norm-subspace trace required |
| 11.1 invariants | ℚ(√5), norm-31 example | degree 2, discriminant 5, weight (2,2), coefficient degree 1, level norm 31 | Agrees with intrinsic fields; external label ordering is separate |
| 11.1 field versus level bad primes | same example | field-discriminant prime set {5}; level support lies over 31 | Correctly distinguishes the two columns |
| 11.2 label | `2.2.5.1-31.1-a` | intrinsic prefix (2,2,5), level norm 31, orbit degree 1 | Suffix/index treated as external ordering, not canonical arithmetic |
| 11.3 elliptic interface | source curve at residue field of size 9 | #E=8 gives a_p=9+1−8=2; Hilbert coefficient is 2 | Conditional compatibility passes; FLHS supplies real-quadratic modularity |
| README rejection test | f=1, μ=0 | a(0)=1 and positivity false | Contradiction, R04 |

### Headline coverage

The README's end results are Fourier expansion and Koecher; nonparallel cuspidality and expansion injectivity; the coefficient bound and finite dimensionality; cusp–Eisenstein decomposition; the Hecke-equivariant classical–adelic dictionary; old/new decomposition, multiplicity one, algebraicity and coefficient-field/Galois-orbit identification; absolute convergence, Euler product, functional equation and L-card; twisting, CM induction, base change and Doi–Naganuma; Jacquet–Langlands and Brandt traces; and the modularity-to-elliptic-local-factor interface.

The acceptance file has 11 admitted statements: Fourier expansion, Koecher, vanishing of nonparallel constant terms, full-expansion injectivity, cusp coefficient injectivity, the coefficient bound, three finite-dimensionality statements, negative-weight vanishing, and cusp convergence. Their actual function/submodule carriers occur in their conclusions. The module docstring names the omitted Eisenstein, adelic, Hecke/newform, functional-equation/card, character and transfer constructions and their missing carriers. Those omissions are not replaced by free predicates or arbitrary linear operators. The exception is the statable general-form convergence theorem in R06. The extra wrapper in R12 is not used by a headline.

### Pinned libraries and ownership

I opened the declarations below at the pinned checkouts, not a newer library. Paths here are relative to the corresponding library root.

| Library location | Actual object checked and limit |
|---|---|
| `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:74` | `denom_cocycle`; matrix order and nonreal-point hypothesis |
| `Mathlib/NumberTheory/ModularForms/SlashActions.lean:137` | `ModularForm.slash_def`; determinant exponent k−1, hence central scalar exponent k−2 |
| `Mathlib/RingTheory/DedekindDomain/Different.lean:379` and 532 | `FractionalIdeal.dual_inv` and `coeIdeal_differentIdeal`; explain b·d⁻¹ for the dual of b⁻¹ |
| `Mathlib/Analysis/Fourier/AddCircle.lean:433` | One-circle L² Fourier expansion, not the claimed product/local-uniform theorem |
| `Mathlib/MeasureTheory/Function/L2Space.lean:136` and 276 | Integral of native pointwise inner products; first argument conjugated |
| `Mathlib/Analysis/Normed/Module/FiniteDimension.lean:467` | `FiniteDimensional.of_isCompact_closedBall₀`; a normed-space compact-ball criterion, not Montel by itself |
| `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:56` and 78 | Residue constant and real one-sided limit; neither is the complex continuation used in Hecke's trick |
| `TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158` | Holomorphic remainder on Re(s)>1−1/[F:ℚ] |
| `TauCeti/NumberTheory/NumberField/TotallyPositive.lean:71` and 315 | Real-place positivity and norm positivity; zero is excluded in the totally real setting |
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83`, 96 and 106 | Quotient carrier, canonical map and surjectivity; no representative normalization is supplied automatically |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/Basic.lean:79` and 170 | Functions on nonzero integral ideals and zero extension; the zero ideal is not an Euler-product index |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/NormCoeff.lean:101` | Linear norm-fibre sum; does not assert a particular Hilbert form's convergence |
| `TauCeti/NumberTheory/NumberField/Global/InfinityType/Basic.lean:273` and 287 | Integer embedding exponents and their positive-power monomial |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120`, 155 and 270 | Ideal values from finite uniformizers; inverse archimedean principal-value law |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:134` and `Newforms/Satake.lean:91` | Classical `dirichletLift` and Satake parameters, not Hilbert newforms |

Ownership searches used the roadmap index by object as well as name, the supplied sibling checkouts, the main repository, the board package index and both pinned libraries. An exact namespace search returned only this roadmap. No competing native Hilbert tuple/newform carrier was found at the pins. The board index's five other packages do not claim these analytic Hilbert objects; that index alone is not a full mathematical audit of their unavailable package heads.

The following supplier groups were resolved and their relevant passages read. Existing completed roadmaps were checked on main. The open-head texts were used for new roadmap folders. These are contracts for future proofs, not assertions that the corresponding code already exists.

| Supplier and locator | What is actually supplied / ownership conclusion |
|---|---|
| `NoncommutativeAndEquivariantIwasawa`, §F.5, README 2287 | Parallel k≥2 analytic forms, all components/cusps, coefficient normalization, two distinct integral lattices and Hecke actions. The present nonparallel extension and its comparison are distinct work. |
| `Completed/GlobalNumberFields/README.md`, Layers 2, 4, 7, 9–10; Layer 10 at 531 | Moduli, finite ideles, narrow ray quotient, characters and infinity types. The sign convention agrees with the pinned inverse principal-value identity, hence R01. |
| `ModularForms`, Layers 2(a), 4, 7–8 | Classical Hecke/newform and coefficient-field objects; Hilbert base change consumes the ℚ source rather than redeclaring it. |
| `Completed/ArithmeticDirichletSeries/README.md`, Layers 0–3 and ideal-counting layer | Ideal coefficient functions, norm regrouping and Euler products. It does not establish growth of Hilbert coefficients. |
| `LFunctions`, Layer 0 (README 386), Layer 3 | Shared arithmetic card, normalization translation and Dedekind analytic theory; retain the factor 2ⁿQ^(−w/4). |
| `GL2AutomorphicRepresentationsAndTransfer`, R16.1.3, R16.1.6, R16.2–3, R16.4.3–4 | Compact levels, finite-level functions, local theory, multiplicity one and shared eigensystems. Its positive double-coset convention must be translated: R02. |
| Same supplier, R17.3.1, 3.3, 3.5, 3.9 | Global Jacquet–Langlands, split Hecke comparison, multiplicity one and definite algebraic weights, with the norm-character part excluded. |
| Same supplier, R17.4.1, 4.3–5, 4.8, 4.16 | Satake power sums, local/global cyclic and solvable base change, cuspidality criteria, and general quadratic induction. The Euler polynomial is `det(1−A^rT)`, supporting R08's repair. |
| `AutomorphicLFunctionsAndLocalFactors`, AL.2.2 | General local newvectors; the Hilbert comparison is not delegated to the ℚ-only classical adapter. |
| `AutomorphicGaloisRepresentations`, §§3.10, 3.15–3.16 | Regular Hilbert Galois representations and CM induction/virtual reducibility, with their weight hypotheses and idelic conventions. |
| `AutomorphicBundles`, §§11.9, 11.18, 12.17–12.19 | Geometric/analytic comparison, field rational structures/base change, Hilbert expansions, expansion principle and cusp criterion. Its integral statements retain prime-to-p level and component hypotheses; this README now owns its additional integral-lattice theorem. |
| `HilbertModularVarietiesAndShimuraCurves`, H1.10, H3.6, H3.8, H5.2 | Component/moduli comparison and Hecke isogenies; H5.2's real-quadratic cusp setting is not a theorem about arbitrary Hilbert levels. The general analytic cusp target stays here. |
| `QuaternionicModularForms`, §§0.1, 0.3, 1.3, 2.1, 3.1 | Orders/class sets, algebraic weights, coefficient spaces and Hecke action. §1.1 is the wrong locator for the classical weight in §10.2; see R10. |
| `AdelicAlgebraicGroups`, §4.2 (README 4149 onward) | Strong approximation for the norm-one group, here SL₂, with the noncompact-place hypotheses; it is not an unconditional approximation theorem for GL₂. |
| `Completed/NumberFieldArithmetic/README.md:1210` and 2140 | Ramified support (§4.3), intrinsic label prefix (§8.1); no canonical database index is supplied. |
| `ClassFieldTheory`, Layer 12 | The quadratic extension/character dictionary, with norm-index hypotheses; not an extra construction of Hilbert forms. |
| `PotentialModularityAndCompatibleSystems`, §5.1 | Potential modularity after extension. §11.3 now assumes actual modularity over F rather than silently deriving it from this contract. |

The supplied open siblings were also distinguished by object: `HilbertModularSurfaces` consumes this roadmap's groups, Koecher and cusp spaces; `HilbertModularVarietiesAndShimuraCurvesPartII` concerns modularity/geometry interfaces; `QuaternionArithmetic` owns quaternion arithmetic and points to the modular-form dictionaries; `BianchiModularForms` explicitly leaves the totally real analytic side here. None supplies the missing n-variable holomorphic Fourier bridge by merely mentioning Fourier expansions. No upward edge or cycle was reported by the mechanical check. The new findings concern the contents and conventions of otherwise downward citations.

### Seeded source checks

All 15 seeded targets were read. No additional target explicitly marked “unverified” was found in the README. All cited works were requested through the sources service, including works cited outside the sample. Legal accessible texts were read at the following locators; inaccessible ones are separated below. A source supporting only a special case was not used to certify a general theorem.

| Seeded target | Text/locator examined and outcome |
|---|---|
| 0.1 domain/action | `dembele-voight` line 213, §2, printed p.5, gives the coordinate Möbius action; the pinned action/cocycle supplies the native comparison. |
| 0.2 holomorphy | Product open-set definition and pinned carriers inspected. No readable source at an exact locator was supplied for the full several-variable Cauchy-estimate package; not certified. |
| 0.3 slash | `dembele-voight` line 281, (2.4), printed p.6, verifies parallel weight two; line 1981, §7, printed p.40, gives the determinant exponent m+k−1. Scalar calculations above check the roadmap's normalization. |
| 1.3 commensurability/conjugation | Explicit conjugation computed above. Garrett/Freitag locators are not readable here; the full finiteness proof is not source-certified. |
| 1.4 cusps | `dembele-voight` line 290, p.6, gives the cusp action, not the whole arbitrary-class/level classification. Van der Geer's cited chapter was unavailable. |
| 2.4 normalized coefficients | `dembele-voight` lines 306–309, p.6, contain the inverse-different slip recorded below; lines 2112–2115, p.42, give the component normalization context. Shimura §2, pp.637–651 was not readable, so its full nonparallel theorem is not certified. |
| 2.6 cusp forms | `dembele-voight` lines 290–305, p.6, and 2106–2111, p.42, support the cusp/constant-term setting. The all-cusp criterion also resolves to AutomorphicBundles §12.19. |
| 3.1 Siegel sets | Freitag Chapter I is only a broad, paywalled locator. Projective and radial controls were computed; source theorem number/hypotheses not certified. |
| 3.3 Hecke bound | Normalization exponents computed explicitly; zero-form counterexample found. Freitag's broad chapter reference does not certify the proposed proof. |
| 4.1 Eisenstein series | Boundary constant normalization inspected; the cited Freitag/van der Geer text was not readable. General existence and cusp independence not certified from a substitute source. |
| 5.3 relations | Recurrences computed above. Shimura Theorem 3.24 could not be read; the resolver's book-review result was rejected as the wrong text. |
| 7.5 coefficient field/orbits | `dembele-voight` §2, printed pp.6–7, supports the algebraic eigensystem context; integral/nonparallel generality is instead the explicit local target plus bundle contracts. Shimura's precise rationality theorem remains unread. |
| 9.2 CM predicate | `mf.cm` line 90 supplies the self-twist definition, not the induced-representation equivalence. That equivalence resolves to the named automorphic/Galois suppliers; inert coefficient and identity-fibre controls are above. |
| 9.6 Doi–Naganuma | `zagier1975` lines 1184–1221, equations (93)–(97), printed p.32; lines 1245–1248, Theorem 5, p.33; lines 1593–1599, Appendix 1, p.42. Prime discriminant, class number one, even weight, normalized eigenform and conjugate coefficients were retained. The split/inert/ramified calculations agree. The extra universal assertion that b(D) is never real was not certified by these locators. |
| 11.1 invariants | `mf.hilbert` lines 90–102; `mf.hilbert.dimension`, `mf.hilbert.eigenvalue`, `mf.hilbert.level_norm`, `mf.hilbert.weight_vector`, `mf.hilbert.label`, each at line 90 onward; `lmfdb-hilbert_modular_form-py` lines 149–150, 448–450, 463 and 493; `lmfdb-hmf_data_format_new-txt` lines 23–32 and 41–67. These support the displayed data semantics, not a proof of Ramanujan or database completeness. |

Additional readable controls: `dembele-voight` lines 1357–1372 (Example 6.3, p.28) supplies the norm-31 cusp example; lines 2191–2230 (Example 8.1, p.44) supply the Brandt trace example. `freitas-lehung-siksek` lines 87–88, arXiv:1310.7088v4, Theorem 1, p.2, states real-quadratic elliptic-curve modularity. The version read is the version now cited in the README.

## Not verifiable

These limitations are recorded without inferring the contents of unavailable texts. The unresolved-source request was consolidated once; successful LMFDB fetches were removed from the missing-text list.

- **Uncertified publisher texts:** Freitag, *Hilbert Modular Forms*, Chapter I; Doi–Naganuma, *On the functional equation of certain Dirichlet series*; Miyake, *Modular Forms*, §§4.5–4.6. The service reached paywalled publisher records. They are not new requests to bypass those restrictions. Zagier's open author copy verifies the specific Doi–Naganuma sample described above, not every assertion from the original paper.
- **No readable full text returned:** van der Geer, Chapters I and VI; Garrett, Chapters 1–2; Shimura 1978, §2 and §4, DOI 10.1215/S0012-7094-78-04529-5; Shimura 1971, Theorem 3.24; Diamond–Shurman, Proposition 5.8.5; Atkin–Li's twist-level result. Bibliographic resolution and legal publisher/repository discovery were attempted through the service. The Euclid landing page exposed no readable paper; the Shimura-book resolver returned a review rather than the book. These six works remain in the consolidated request.
- **Challenge pages instead of knowls:** `mf.base_change`, `nf.narrow_class_group`, `dq.mf.hilbert.reliability`, `rcs.cande.mf.hilbert`, and the top knowls for `2.2.24.1-1.1-a` and `2.2.40.1-1.1-a`. The institutionally classified fetch returned only a challenge response. Their mathematical text, data-completeness assertions and specific top-page values were not certified. No access-control bypass was attempted.
- The source references do not certify every intermediate analytic estimate merely by naming Chapter I. In particular the full Siegel/reduction, Eisenstein-limit and several-variable normal-family arguments need the exact locators and explicit subtargets requested in R09–R10. Numeric controls above test formulas; they do not prove these existence theorems.
- The claim in §9.6 that every b(D) is nonreal was not located in the readable cited passages. The example −3+2√−5 is nonreal, but one example does not establish the universal claim.
- Ownership against the supplied open roadmap files was checked. The board index was inspected, but unavailable package-head contents were not certified by that index alone. No finding asserts an object is absent from an unread package.

## Source issues

- **Misprint** in dembele-voight at §2, following (2.4), printed p.6 (`dembele-voight` line 288): the source says the slash-invariance condition is equivalent to equation (3.3); it should be equation (2.2); affects nothing.
- **Misprint** in dembele-voight at §2, following (2.5), printed p.6 (`dembele-voight` line 307): the source says the ideal index is νd⁻¹ with ν in d; it should be νd with ν in d⁻¹, matching the preceding Fourier exponent lattice; affects a stated result.
- **Error** in dembele-voight at §2, Hecke operators, printed p.6 (`dembele-voight` line 310): the source says all ideal-indexed Hecke operators are diagonalizable on the full level space; it should be restricted to operators away from the level; affects a stated result.
- **Misprint** in dembele-voight at Example 7.26, Fourier expansion, printed p.42 (`dembele-voight` line 2104): the source says the exponent lattice is ad⁻¹ for a group with translation lattice a; it should be a⁻¹d⁻¹, the trace-dual of that translation lattice; affects a stated result.
- **Misprint** in dembele-voight at Example 7.26, ideal coefficients, printed p.42 (`dembele-voight` lines 2113–2114): the source says n=νad⁻¹ with ν integral indexes the Fourier coefficient; it should be n=(ν)ad with ν totally positive in a⁻¹d⁻¹, matching the trace-dual lattice; affects a stated result.
- **Error** in lmfdb-hilbert at the congruence-group display, web page (`lmfdb-hilbert` line 95): the source says off-diagonal lattice conditions and unit determinant define the group without diagonal integrality; it should be required that both diagonal entries lie in the integers of F; affects a stated result.
- **Error** in mf.hilbert.q_expansion at the opening paragraph, web page (`mf.hilbert.q_expansion` line 90): the source says the cusps are indexed by the strict class group; it should be the components that are so indexed, with a separate cusp set for each level component; affects a stated result.
