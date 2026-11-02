# Review of DiophantineApproximationAndTranscendencePartII (pull request #1693 at 24c0576)

**Verdict:** accepted

## R01 (P3) — Restore the identifiers of the declared gaps

**Location:** TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/README.md:69 and :73. The contract begins “The required energy/equilibrium extension”.

**Claim:** The mathematical contract survives the port, but neither declared gap identifier occurs in this README. The brief requires the exact supplier-contract marker so intake can match the README to the plan. This is a registration defect, not a new objection to the already declared supplier obligation.

**Witness:** packages/DiophantineApproximationAndTranscendencePartII/README.md:69 contains `gap:complex-logarithmic-equilibrium`; :73 names `DiophantineApproximationAndTranscendencePartII/G1`. Searching the reviewed README for either identifier returns no match.

**Repair:** Restore the prefix “What ClassicalArithmeticCompletion must provide (gap:complex-logarithmic-equilibrium):” before the unchanged needs sentence. Restore a sentence naming G1 and saying that it concerns a replacement general compact-set theorem, supplies no prerequisite to Layers 0–5, and is distinct from the energy contract. The corresponding identifiers already exist in packages/DiophantineApproximationAndTranscendencePartII/design/plan.json; no new gap or mathematical claim is needed. This restores the two exact matches while preserving the counterexample’s numerator 0, denominator log 2 and rank at least 1.

The earlier FIX-PKG report’s F01 marked G1 “not actionable in this package”: the frozen design reserves its removal to a maintainer. That reason remains valid. I do **not** re-raise the unowned-gap finding or purport to release that scope obligation. Acceptance here preserves that settled human decision and is conditional on the named energy/equilibrium supplier contract.

## R02 (P3) — Make the lowest-jet Check satisfy integrality

**Location:** TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/README.md:281: “For F=x₁−x₂, χ=t+t²/2”.

**Claim:** This is presented as the positive Check for §1.3, whose hypothesis requires the entire substituted series to be integral. The computed lowest terms are correct, but the example does not test that implication under its hypotheses.

**Witness:** F(χ(t₁),χ(t₂))=t₁−t₂+(t₁²−t₂²)/2; its degree-two coefficients are 1/2 and −1/2, so the integrality premise fails.

**Repair:** Replace χ=t+t²/2 in this Check by χ=t+t². Then the pullback is t₁−t₂+t₁²−t₂², with all coefficients integral. For the unchanged φ=2z+z², the lowest part remains 2z₁−2z₂ and the coefficient lower bound is 2=2¹. Retain the non-tangent negative controls in the next bullet.

## Verified sound

This is an independent AI review of the complete two-file folder at the specified head. There are **2 P3 findings and 0 P1/P2 findings**. The acceptance applies to the specified arithmetic-algebraization scope, with the existing supplier contract and settled G1 scope decision just described; it is not an approval or merge.

I read all **35 numbered targets**, their APIs, Checks, proof routes, conventions and dependencies; checked all **15 seeded source targets** against the legal cached texts; independently elaborated the Lean file and all **6 declaration signatures**; and tried the one-tactic probes on both admitted theorems. The table below has **104 computed rows**, including all numbered targets, the headline results, the definition APIs, supplier normalizations and both findings. Tests are counterexample searches, not substitutes for proofs.

**Gate and file scope.** The supplied head gate reports every scanner, dependency, metadata, stray-file, outside-folder and targeted-build check passing. HEAD is 24c0576776dc4a07a775b22d302e00e5dcf4c0a4. The requested outside-folder diff is empty; the worktree is clean. Direct `lake env lean` elaboration succeeds, with exactly two “declaration uses sorry” warnings at Suggested.lean:54 and :74. There are no Tau Ceti imports requiring a preliminary module build. No PR file was changed.

The independent dependency command produced exactly:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every local *Needs:* edge was read, including the independent Jensen and damping routes. The external graph is one-way: the five named roadmap suppliers precede this work or are on main. No owner was moved. The citation resolver reported no unresolved roadmap or local Lean names; its output explicitly excludes pinned library validation, which I performed separately below.

**Headline coverage.** The end results are §2.1 integrated arithmetic rank, §2.2 arithmetic algebraicity, §4.5 finite W rank, §4.6 field structure and W/V comparison, §4.7 integral-coordinate finiteness, and §5.1 centred capacity rank. The two statable arithmetic theorems occur in Suggested.lean:54 and :74. Its module docstring, lines 12–17, names the remaining four and identifies the absent scalar-equation/full-meromorphic-basis carrier and arithmetic holonomic ring. The other two analytic routes prove the same rank theorem. The open-disc criterion is obtained by shrinking that theorem’s data. The auxiliary, denominator, discrepancy and coefficient results are supporting library targets, not missing substitutes for the advertised end theorems.

Four real-bodied definitions support those two signatures. No sorry-valued data, set_option, extra carrier, admitted example, arithmetic boundary theorem or API padding occurs. The scratch proof alternatives `solve | simp | rfl | infer_instance | assumption` fail on both theorem conclusions. Object searches found no pinned theorem providing either arithmetic result in one application. The powers argument for algebraicity is substantive, not a hypothesis containing its conclusion.

A fresh scratch file with `#check @name` for each of the six declarations elaborated successfully. I compared the output with README §§0.1–0.2,2.1–2.2: nonconstant p, the Laurent equality fixing pSeries, χ₀=0, χ₁=1, integral pullbacks, neighbourhood analyticity, φ(0)=0, strict expansion, germ equalities and the actual ℚ(p)-linear independence all survive. No section binder dropped; no repair to a signature is needed. In particular, native totalized integration cannot make the headline numerator arbitrary: analytic g makes its positive logarithm continuous and integrable.

**Source sample.** CDT25 numbering is the published author offprint, journal pages 627–702. BB11 is arXiv v2; Saff10 is arXiv v1 with printed journal pagination. These are the three entries in the existing package source manifest. There are no extra unverified locators flagged in the reviewed README. None of the three works needed another fetch.

| Seeded target | Text and locator read | What the source supports / adjustment checked |
|---|---|---|
| 0.1 Integral coefficient lattices | CDT25 line 574 and line 595, proof of Lemma 2.1.2, pp.637–638 | Ordinary rescaling versus the stronger normalized tangent lattice; constant terms cannot be repaired by variable scaling. The native-preimage/subring API is the roadmap’s specialization. |
| 0.4 Eisenstein denominators | BB11 line 26, §1 p.1; line 543, Theorem 6.1 pp.10–11; line 764, §8 p.14 | A scalar and an exponential denominator scale, plus a finite coefficient field. Integral a₀ allows absorbing the scalar into the variable scale. Puiseux is reduced to the univariate theorem. The tail exponent misprint is not copied. |
| 0.5 Uniform inverse denominators | CDT25 line 576 through line 603, proof of Lemma 2.1.2, pp.637–638 | Normalization of the ramified rational coordinate, binomial denominator estimate, M=c²N⁴M₁², inverse lattice and independence from f. Nonzero p′(0) is not assumed. |
| 1.1 Separate variables | CDT25 line 604 through line 613, p.638 | Independence over ℚ(p), followed by nonvanishing of the auxiliary sum. The README replaces analytic specialization by finite coefficient functionals and their tensor product, which works formally over ℚ. |
| 1.3 Lowest integral jet | CDT25 line 620 through line 634, (2.2.1)–(2.2.3), pp.638–639 | Tangent substitution leaves the lowest coefficients integral; φ contributes a^β; the normalized multiplier contributes constant 1. R02 concerns only its positive Check. |
| 2.1 Integrated rank | CDT25 line 440 through line 458, Theorem 2.0.1 p.635; line 711 through line 729, Lemma 2.3.1 pp.639–640 | Same nonconstant rational p, arithmetic tangent coordinate, common holomorphic germs, strict derivative bound, ℚ(p)-independence, probability mean and factor e. |
| 2.4 Lexicographic coefficient | CDT25 line 936 through line 972, Lemma 2.4.2 p.642 | Least lexicographic support, not lowest total order. The README explicitly adds the almost-everywhere slice and negative-part integrability argument. |
| 2.5 Averaging route | CDT25 line 973 through line 1017, §2.4.6 pp.642–643 | Lower coefficient a^β times a nonzero integer, β≥α, upper mean bound and α,d,κ order of limits. |
| 3.5 Positive-log variation | CDT25 line 1088 through line 1107, pp.644–645; line 1245, §2.5.14 p.647 | Finite variation of the cutoff logarithm is precisely what Koksma uses. The explicit 1-Lipschitz complex radial map proves the README’s complex-valued extension and avoids assuming the cutoff is C¹. |
| 3.9 Damping | CDT25 line 1235 through line 1359, §§2.5.14–2.5.25 pp.647–648 | Good/bad discrepancy regions, degree M damping, Cauchy coefficient bounds and a surviving leading coefficient. Ceiling rather than floor makes cancellation exact; its cost is o(α) for fixed d. |
| 4.2 Ring closure | CDT25 line 467 through line 485, Definition 2.0.4 pp.635–636 | The source calls H a ring and a polynomial-module algebra and defines “trivial” local monodromy by full meromorphic bases. The README owns the missing differential-module closure proof; p may have poles in U. |
| 4.4 Pole clearing | CDT25 line 502 through line 510, proof of Corollary 2.0.5 p.636 | Rational polynomials in p clear every local basis at finitely many algebraic singularities. Integer scaling preserves arithmetic integrality; the common nonzero factor preserves independence. |
| 4.6 Fields and V bounds | CDT25 line 473 and line 489 through line 510, pp.635–636 | V is the ℚ(x)-span. The unrestricted printed numerical bound is false; the README instead derives the W bound and correct scalar-extension factor. The finite-domain field argument was checked separately. |
| 4.8 V counterexample | CDT25 line 492 through line 501, (2.0.6)–(2.0.7), p.636 | The explicit inverse coordinate meets the printed hypotheses and yields degree 4 against B≤3.59337311886. This is a demonstrated correction, not a claim that the source proves the corrected wording. |
| 5.2 Compact counterexample | CDT25 line 1364 through line 1381, §2.5.27/(2.5.28), p.649 | The source allows this translated disc and positive denominator. The README’s entire map gives numerator 0 and rank≥1. Saff10 line 387, Example 1.10 p.173, verifies its translated-disc capacity. |

Additional source checks cover CDT25 line 145 (radius threshold), line 169 and line 242 (open-disc and modular benchmarks), line 519 (multiplier bound), line 706 (powers), line 1063 (Fekete equality), line 1082 (circular arcs), line 1110 (Erdős–Turán), line 1134 (energy gap), and Saff10 line 272 through line 395 (truncation, minimization, positive-capacity uniqueness, diameter comparison and disc equilibrium). The energy contract describes one coherent missing API; none of its hypotheses or normalizations is left to interpretation. General real weighted equilibrium in RandomMatrices §9.2 is not this compact-complex theorem.

**Computed adversarial pass.** “Keep” means the tested instance and proof-route audit found no defect in that statement. “Excluded” is an explicit negative control, not a claim that the theorem applies. The table distinguishes numerical tests of supporting analytic formulas from data satisfying every arithmetic premise.

| Statement | Instances tried | Values on each side / discriminant | Result | Change |
|---|---|---|---|---|
| Conventions: Taylor normalization | F=x², n=0,1,2 | Derivatives (0,0,2); Taylor coefficients (0,0,2/2!)=(0,0,1) | Consistent | Keep |
| Conventions: parameter measure | g=2z on unit circle | J=log 2; unnormalized arclength integral=2π log 2 | Probability convention fixed | Keep |
| Conventions: Vandermonde orientation | (1,−1), d=2 | Product 2; native determinant −2; sign (−1)¹; norms 2=2 | Consistent across Layers 1,3 | Keep |
| Conventions: strict denominator | λ=1 and λ=2 | log λ=0 and log 2>0; native division by 0 would return 0 | λ=1 excluded | Keep |
| Conventions: totalized log | G=1−z | G(1)=0, native log 0=0; zero-set Haar mass 0; mean log norm=0 | Totalization harmless only a.e. | Keep |
| Supplier gap / R01 | unit circle; radius-2 circle; point | Minimum energies 0,−log 2,+∞; capacities 1,2,0; 2 plan IDs versus 0 README matches | Mathematics coherent; labels lost | Restore exact identifiers |
| §0.1 lattice definition | Σ(x/2)^n; constant 1/2; zero | At M=2 coefficients all 1; at M=1 linear coefficient 1/2; constant remains 1/2; zero coefficients all 0 | Separates membership/nonmembership | Keep |
| §0.1 coefficient and rescale equivalences | f=1+x/2, M=2 | M⁰a₀=1 and M¹a₁=1; rescale gives 1+x, integral lift same coefficients | Both directions agree | Keep |
| §0.1 subring API | f=1+x/2, h=x/2, M=2 | Rescaled sum 1+2x, product x+x², negation −1−x; zero and one integral | Closed, nontrivial | Keep |
| §0.1 divisibility API | M=2 divides N=6; f=1+x/2 | Scaled coefficients (1,1) become (1,3), multiplying degree n by 3^n | Correct direction | Keep |
| §0.1 constants API | c=2,1/2; M=1,4 | Degree-zero values remain 2,1/2 at both scales | Exactly integral constants | Keep |
| §0.1 tangent definition and equivalence | χ=t+t²/4; χ=t/2 | Ordinary M=2 quadratic=1; normalized M=2 quadratic=1/2; normalized M=4 quadratic=1; t/2 keeps slope 1/2 | Stronger lattice, slope guard essential | Keep |
| §0.2 Uniformizes definition | f=x, φ=2z, F=x, g=2z; wrong g=−2z | F∘φ=2z versus −2z; Taylor linear coefficient 1; germs differ for all small nonzero z | Positive and negative examples | Keep |
| §0.2 value and germ uniqueness API | f with a₀=1; square-root branches ±√(1−4x) | Germ values +1 versus −1 at zero | Wrong branch excluded | Keep |
| §0.2 ring operations API | f=x, h=x², φ=2z | Realizations 2z,4z²; sum 2z+4z²; product 8z³; constants 0,1 map to 0,1 | Identities agree | Keep |
| §0.2 shrinking API | φ=2z, r=3/4 and 1/4 | New derivatives 3/2 and 1/2; realization of x² becomes (9/4)z² and (1/4)z² | Relation preserved, expansion may fail | Keep |
| §0.2 Taylor substitution API | f=x², φ=2z+z² | Formal and analytic pullbacks both 4z²+4z³+z⁴ | Substitution direction correct | Keep |
| §0.2 common radius API | family 1/(1−x),1/(1−2x), identity chart | Radii 1 and 1/2; common radius 1/4 works; radius 3/4 fails second germ | Finite-family minimum needed | Keep |
| §0.2 pole Check | f=1/(1−x), φ=2z | Candidate realization 1/(1−2z) has pole at z=1/2 | Closed-disc hypothesis fails | Keep |
| §0.2 positiveLogMean definition and constants | g=0,1/2,1,2 | J=0,0,0,log 2; raw log(1/2)=−log 2 | Cutoff is discriminating | Keep |
| §0.2 positivity, finiteness, rotation API | g=2z, rotations e^(iθ)z | Boundary modulus 2 before/after; J=log 2≥0 finite | Correct | Keep |
| §0.2 rationalFunctionField definition/closure | p=x,x²,0,2 | Fields ℚ(x),ℚ(x²),ℚ,ℚ; extension dimensions 1,2,infinite,infinite | No false finite-degree interpretation | Keep |
| §0.2 generated-field minimality | p=x² | Contains x² and x⁻²; ℚ-linear span of x² lacks 1 and x⁻² | Field closure excludes wrong span | Keep |
| §0.2 affine invariance API | p=x², a=2,b=3 | p=(2p+3−3)/2; both generated fields ℚ(x²); a=0 gives ℚ | Nonzero a essential | Keep |
| §0.3 polynomial criterion | 1+x²; Σx^n at R=1 | Coefficients for n≥3 are 0 versus 1 forever; r=3/2 gives C(2/3)^n→0 | Strict R>1 necessary | Keep |
| §0.4 scalar Eisenstein | f=1/2; f=√(1−4u) | c=2,M=1 gives coefficient 1; latter starts 1,−2,−2,−4 with c=M=1 | Constant scalar and infinite series both covered | Keep |
| §0.4 absorbing c; Puiseux | n=0,1,2; f=√x/2, u=√x | For n≥1, (cM)^n a_n=c^(n−1)(cM^n a_n); with M=2, f=u/2 becomes t | Integral a₀ handles n=0; ramification N=2>0 | Keep |
| §0.4 finite coefficient field and tail route | f=√(1−4x), N=1 | b=1, g=(f−1)/x; P=Y²−1+4x yields Q=2Y+4+xY²; Q(0,Y)=2Y+4 | Nonzero linear tail equation and field ℚ | Keep |
| §0.5 inverse denominators | p=x; p=x²; χ=t | M=1 gives χ(Mt)/M=t; p′(0)=1 versus 0 | Ramified p is allowed | Keep |
| §0.5 uniform nonintegral inverse | p=x+x⁴/32, χ=p⁻¹ | χ₄=−1/32, χ₇=1/256; M=4 gives −2,16; p(4x)/4=x+2x⁴ | Tangent integral inverse over ℤ | Keep |
| §0.5 inverse compositions and consequence | same p,χ; f=p | Degree 4: −1/32+1/32=0; degree 7: 1/256−4/32²=0; f(4x)=4x+8x⁴ | Both inverse directions and rescale implication | Keep |
| §1.1 independence | p=x,f₁=1,D=2,d=1,2 | 1,x matrix det 1; d=2 gives 1,x₁,x₂,x₁x₂, coefficient matrix det 1 | Tensor argument sound | Keep |
| §1.1 weaker-scalar negative control | f₁=1,f₂=p,D=2 | p·f₁−1·f₂=0 with coefficients (1,−1) | ℚ-independence insufficient | Keep |
| §1.2 constraint count and Siegel surplus | d=2,α=3; d=1,κ=1/2,m=1 | Six monomials, binomial(4,2)=6 versus box 9; D/α→3, rows/surplus→1/2 | Correct count and ratio | Keep |
| §1.2 cofinal-d constant | κ=1/2, d≥log 3; m≥1 | (1+1/κ)^(1/d)≤e and d/(d!)^(1/d)≤e, so dD/α≤e²+o(1) | C independent of κ,d on stated cofinal range | Keep |
| §1.3 lowest jet / R02 | F=x₁−x₂, original χ=t+t²/2, φ=2z+z² | Pullback degree-two coefficients ±1/2; lowest coefficients ±1 then ±2 | Check misses full integrality premise | Use χ=t+t² |
| §1.3 repaired jet and h multiplier | χ=t+t²; h=1+z; D=0,1 | Pullback coefficients ±1 integral; φ-lowest coefficients ±2; multiplier constant 1 in both cases | 2≥λ¹=2 under full premises | R02 repair tested |
| §1.3 non-tangent controls | F=x/2; χ=t/2,2t | Pullbacks t/4,t; original coefficient 1/2<1 | Slope 1 is indispensable | Keep |
| §1.4 multiplier definition and API | (h,g)=(1,2z),(1,1),(1+z,0) | Sup pairs (1,2),(1,1),(2,0); A=log 2,0,log 2 | Finite; normalization yields A≥0 | Keep |
| §1.4 exp equivalence | h=1+z,g=0,a=log 2 and 0 | At log 2 both suprema≤2 and A≤log 2; at 0, 2≤1 and A≤0 both false | Both directions discriminate | Keep |
| §1.4 extrapolation and §1.5 multiplier rank | p=x,χ=t,φ=2z,f=1,h=1 | Limiting coefficient inequality log 2≤e log 2; rank 1≤e | Correct e and logarithm | Keep |
| §1.5 zeros in multiplier | g=2z,h=1−2z | h(0)=1; h(1/2)=0; sup norms 3,6; A=log 6; 1≤e log 6/log 2 | Zero-free hypothesis unnecessary | Keep |
| §2.1 mean_rank_bound | p=x,χ=t,φ=Rz,R>1; m=1 and 0 | J=log R; RHS=e; inequalities 1≤e and 0≤e | Lean/prose agree, empty family harmless | Keep |
| §2.1 nonconstant/regularity guards | p=0; p=x⁻¹ | Constant p has J=0 and is excluded; x⁻¹ Laurent coefficient at −1 is 1, impossible for pSeries | No bogus scalar field or Taylor representative | Keep |
| §2.1 quotient normalization input | g=i and g=1,h=1 | J=0,A=0; magnitude reconstruction=1 but g=i needs phase i | Phase retained by supplier | Keep |
| §2.2 arithmetic_algebraicity | f=√(1−4x), p=x,χ=t, φ=(1−e^(8z))/4 | u=e^(4z), λ=2; f²−(1−4x)=0, degree 2; f not rational | Algebraicity, not rationality | Keep |
| §2.2 powers argument | f=0,1; hypothetical transcendental f | Relations Y, Y−1; transcendental powers of length m have rank m, which cannot satisfy m≤fixed B for m>⌊B⌋+1 | No tautological hypothesis | Keep |
| §2.3 open-disc criterion | λ=2,r=3/4; φ=z,lacunary Σx^(2^k) | Shrunk derivative 3/2>1; identity derivative 1, coefficients 0/1, infinitely many dyadic singularities | Strict boundary negative control | Keep |
| §2.3 binomial example | m=2 and 3 | m=2 coefficients 1,−2,−2,−4; m=3 coefficients 1,−3,−9,−45; φ′(0)=−M/m² | Integral coefficients and derivative normalization | Keep |
| §2.4 lexicographic coefficient | 3z₁²z₂; z₂^100+z₁; 1−z | First: log coefficient=log 3=mean; second: least exponent (0,100), total order 1, log coefficient=mean=0; last: 0=0 | Lex order and null zeros distinguished | Keep |
| §2.4 excluded zero germ | G=0 | No c≠0 or least support exponent exists; zero set mass 1 | Nonzero premise essential | Keep |
| §2.5 averaging route | z₂^100+z₁ under φ=2z; arithmetic p=x example | Least coefficient becomes 2^100, log=100 log 2; mean likewise 100 log 2; final rank 1≤e | β may exceed total order | Keep |
| §3.1 discrepancy definition | singleton; antipodal; (1,1,−1); empty | D=1,1/2,2/3,0; unguarded empty expression has sup ℓ=1 | Multiplicity and empty guard correct | Keep |
| §3.1 rotated-star identity | singleton at angle 1/2 | Fixed-cut D*=1/2; supremum over cuts=1=D_circ | Circle is not one fixed star discrepancy | Keep |
| §3.1 nonempty bounds | regular d-gon; d coincident points | D=1/d and 1 respectively; for d=2, 1/2≤D≤1 | Sharp endpoints | Keep |
| §3.1 permutation/rotation API | (1,1,−1) and (−1,1,1), rotated by i | Atom masses 2/3,1/3 in each; D=2/3 in each | Preserved | Keep |
| §3.1 repetition/empirical API | antipodal pair and doubled pair | Masses (1/2,1/2) in both; D=1/2 in both | Cardinality does not fake equidistribution | Keep |
| §3.1 Haar characterization | Haar; δ₁ | Arc mass ℓ gives discrepancy 0; point arc shrinking to 1 gives supremum 1 | Wrong atomic model excluded | Keep |
| §3.2 weak continuity | (δ_exp(i/n)+δ_exp(−i/n))/2 | n=1: D=0.681690113816; n=2: 0.840845056908; limit D=1=D(δ₁) | Atomic limit handled | Keep |
| §3.2 Haar limit | regular d-gons | d=2,4,8 discrepancies 1/2,1/4,1/8→0 | Correct | Keep |
| §3.3 Koksma and C¹ identity | g(z)=Re z, singleton at 1; g=c | Error 1, variation 4, bound 4·1; constant error 0, bound 0 | Angular normalization correct | Keep |
| §3.3 actual jump values | g=indicator of {1}, singleton at 1 | Variation 2 on [0,1], Haar integral 0, sample 1; 1≤2·1 | BV need not be continuous | Keep |
| §3.4 Erdős–Turán | regular d-gon,K=d−1,d≥2; singleton,K=1 | Fourier means 0 below d, RHS=3/d versus D=1/d; singleton RHS=9/2 versus 1 | Constant 3 retained | Keep |
| §3.5 positive-log variation | h=1−z,0,z,2z | Variations 2 log 2=1.38629436112,0,0,0; at h=0 cutoff value 0 | No logarithmic singularity | Keep |
| §3.5 Lipschitz and derivative conventions | radial values 0,1,2; Re z | Positive logs 0,0,log 2; log 2≤2−1; variation 4 versus arclength-derivative mean 2/π | Factor 2π and cutoff handled | Keep |
| §3.6 Fekete bound/equality | d=1; (1,−1),(1,1),(1,i) | Norms 1,2,0,√2 versus maxima 1,2,2,2; equality exactly for singleton/antipodal polygon | Both directions tested | Keep |
| §3.6 Hermitian convention | rows (1,1),(1,i) | Inner products 1+i and reversed 1−i, both nonzero; norm product 2, determinant norm √2 | Conjugation fixed | Keep |
| §3.7 energy and equality | Haar,δ₁,uniform antipodal | Energies 0,+∞,+∞; antipodal off-diagonal-only value −(log 2)/2 is not energy | Diagonal cannot be discarded | Keep, conditional on supplier |
| §3.7 capacity limit | regular d-gon | Finite diameter d^(1/(d−1)); d=2 gives 2, d→∞ gives 1; −log 1=0 | Correct energy sign | Keep |
| §3.8 gap | collision; regular d-gon with fixed ε | V=0<e^(−cd²); polygon D=1/d<ε eventually, V=d^(d/2)>1 | No contradictory positive-product case | Keep |
| §3.8 truncated product energy | antipodal,d=2,cutoff A>0 | Integral A/2−(log 2)/2; off-diagonal part −(log 2)/2; difference A/d=A/2 | Correct finite diagonal term | Keep |
| §3.9 damping coefficient | d=2,F=x₁−x₂,φ=2z,M=1 | H=2(z₁−z₂)², coefficients (2,−4,2); selected 2=λ^β with β=1 | Extra Vandermonde degree not in λ exponent | Keep |
| §3.9 ceiling cancellation | S=1,D=3,c=1,d=2 | M=ceil(3/2)=2; dDS−c d²M=6−8=−2≤0; floor would leave +2 | Ceiling proof valid | Keep |
| §3.9 exponent zero | S=0,M=0,collision | V=0 but V⁰=1; no division by S and no zero damping factor | Analytic algebra convention correct | Keep |
| §3.10 order of limits | κ=1/2; d=2 and d→∞ | Factor 3^(1/d)→1; factorial factor→e; log 2/2>0 but log d/d→0 | Remainder only vanishes after dimension limit | Keep |
| §4.1 H definition | χ=t; f=1,1/(1−x),exp x | Integral coefficients for first two; exp coefficient 2=1/2; annihilators D,(1−x)D−1,D−1 | Arithmetic condition discriminates | Keep |
| §4.1 zero/one and existential operator API | f=0,1,x² | 0 killed by order-0 operator 1 or D; 1 killed by D; x² killed by D³ with jet (0,0,2) | Not tied to a chosen/minimal operator | Keep |
| §4.1 restriction API | f=exp(x/(1−x)), χ=L/(1+L), L=−log(1−t) | Pullback 1/(1−t), integral; essential singularity at 1; in small U avoiding 1 but not in H(ℂ,χ,ℤ) | Correct inclusion direction | Keep |
| §4.1 coefficient descent | √2((1−x)D−1); rational exp coefficients | Rational basis component recovers (1−x)D−1; exp equation coefficient rank 1, kernel (−1,1) over both fields | Order/degree bounds preserved | Keep |
| §4.1 descent negative control | exp(√2x) | Algebraic-field order 1; rational order 2 via D²−2; no rational order-1 relation | Rational coefficients essential | Keep |
| §4.1 local basis versus monodromy | exp(1/(x−α)) | Loop multiplier 1, but Laurent series has infinitely many negative powers | Meromorphic premise excludes it | Keep |
| §4.2 sum/product closure | f=g=1/(1−x) | Sum 2/(1−x) killed by (1−x)D−1; product (1−x)⁻² killed by (1−x)D−2; pole orders 1,2 | Full local bases retained | Keep |
| §4.2 cancellation/subquotient | f=1,g=−1; f=g=x | Sum 0 has order 0 despite direct-sum cyclic order 1; product x² has basis x² and value 0 at singular point | No false evaluation isomorphism | Keep |
| §4.2 rational multiplier | χ=t, f=1, p=x,0,1/(1−x),1/2 | Products x,0,Σxⁿ,1/2; first three integral, last constant nonintegral | Poles in U allowed; integral pullback retained | Keep |
| §4.2 ℤ[p]/ℤ[x]-algebra API | p=x,χ=t; p=1/(1−x) | 2+3p gives 2+3x or 2+3Σxⁿ; constant 1/2 unavailable | Correct scalar ring | Keep |
| §4.3 W and V definitions/API | H includes 1; p=x² | 1∈W, x⁻¹∈V; ℚ(x)/ℚ(x²) degree 2; scalar span of {1} over these fields differs | Laurent ambient and scalars matter | Keep |
| §4.3 inclusion and span-of-span API | model H=ℤ[x],p=x² | W=ℚ(x²)+xℚ(x²)=ℚ(x); V=ℚ(x); products reduce using x²=p | V=ℚ(x)W and algebra closure | Keep |
| §4.3 integral χ equality | χ=t,p=x² after finiteness | x∈H⊂W; field closure supplies x⁻¹, so W contains ℚ(x); W=V | Uses field theorem, not premature inversion | Keep |
| §4.3 constant p exclusion | p=0 or 2 | Generated field ℚ, extension ℚ(x)/ℚ infinite; native finrank=0 | Nonconstant premise excludes junk rank interpretation | Keep |
| §4.4 rational pole clearing | f=1/(1−x),p=x,q=1−t; q=i(1−t) | Products 1 and i; integer pullback preserved only by rational-integral choice | Scalar discipline tested | Keep |
| §4.4 conjugate singularities | f=1/(1−2x²),q=1−2t² | q(p)f=1; roots ±1/√2; extra conjugate zero harmless | No Galois-saturated U required | Keep |
| §4.4 independence through clearing | f₁=1,f₂=√(1−4x), q≠0 | q a+q b f₂=0 implies a+b f₂=0, hence a=b=0; determinant of scaling on rank 2 is q²≠0 | Common factor injective | Keep |
| §4.5 corrected W rank | U=ℂ,p=x,χ=t,φ=2z | B=e; 1≤dim W≤e implies integer dim≤2 | Correct field and nonzero lower rank | Keep |
| §4.6 finite fields and scalar bounds | W=k, extension F/k degree n=4 | V=F; dim_F V=1=dim_k W; dim_k V=4=4·1 | Factor n is indispensable in general | Keep |
| §4.6 integral-coordinate case | p=x²,χ=t,U=ℂ,φ=2z | W=V; scalar degree n=2; J=log 4; B=2e, consistent with dim_k V≥2 | Equality of spans does not equate base fields | Keep |
| §4.7 qualitative finiteness | U=ℂ; U=unit disc; U=ℂ∖{1} | φ=2z has λ=2; disc maps have λ≤1; 1−exp(2z) avoids 1 and has derivative −2 | Hyperbolic radius not used on parabolic cases | Keep |
| §4.8 V counterexample | p=x+x⁴/32,χ=p⁻¹,φ=2z | Scalar degree 4; J≤log(5/2); B≤3.59337311886<4; 125/8<16 | Printed source bound refuted; W bound survives | Keep |
| §5.1 centred capacity | r=1/2,φ=4z,p=x,χ=t | cap=1/2; derivative product 2; denominator log 2; numerator log 2; B=e | Rescaling exact | Keep, conditional on supplier |
| §5.1 boundary denominator | r=1/2,φ=2z | Product 1; log 2+log(1/2)=0 | Positive denominator premise fails | Keep |
| §5.2 compact obstruction | K=closedDisc(1/2,1/4),φ=8z exp(−20z) | Re z≥1/4, norm z≤3/4; norm φ≤6e⁻⁵=0.0404276819945<1; numerator 0; denominator log 2; rank≥1 | False unrestricted formula would say 1≤0 | Keep |
| Supplier Hadamard conventions | columns (2,0),(0,3); (1,0),(1,1); empty | Determinant/product 6=6; 1<√2; 1=1 | Matches SuccessiveMinima and Layer 3 | Keep |
| Supplier polydisc normalization | G=z₁z₂, coefficient (1,1) | Cauchy contour integral coefficient factor (2πi)²=−4π²; normalized coefficient 1 | No extra 2πi factor | Keep |
| Supplier capacity affine law | radius-2 disc; [0,1]; singleton | δ₂=4 versus capacity 2; segment capacity 1/4 versus diameter 1; point capacity 0 | No diameter/capacity confusion | Keep |
| Worked modular benchmark | λ(q)/16=q−8q²+44q³; F coefficients 1,4,36 | Composite q coefficient 4; q² coefficient −32+36=4; theta-square coefficients 4,4 | Normalization 16 verified | Keep |

**Pinned library audit.** The reviewed manifest pins Mathlib to f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti to 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. These are the PR pins, not the older pins mentioned in package repair history. I opened the following definitions/theorems and their surrounding binders. The table accounts for **32 named declarations** (HasSubst and BoundedVariationOn included) in 23 files.

| Native declarations opened | Repository-relative file and line | Contract checked |
|---|---|---|
| PowerSeries.coeff; PowerSeries.coeff_rescale | Mathlib/RingTheory/PowerSeries/Basic.lean:76,583 | Coefficient map; factor a^n including n=0. |
| PowerSeries.HasSubst; PowerSeries.subst; PowerSeries.substAlgHom | Mathlib/RingTheory/PowerSeries/Substitution.lean:39,157,170 | Nilpotent constant, hence zero over the fields here; inner series is the first argument; no convergence assertion. |
| PowerSeries.substInv; PowerSeries.subst_substInv_right; PowerSeries.subst_substInv_left | Mathlib/RingTheory/PowerSeries/Substitution.lean:456,510,542 | Commutative ring, invertible linear coefficient; zero constant appears in the inverse identities, not as an automatic fact about arbitrary input. |
| RatFunc.coeToLaurentSeries | Mathlib/RingTheory/LaurentSeries.lean:391 | Coercion is the field algebra map into Laurent series. |
| RatFunc.liftAlgebra | Mathlib/FieldTheory/RatFunc/Basic.lean:756 | Scoped algebra instance uses faithful polynomial scalar action. |
| IntermediateField.adjoin | Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:34 | Subfield closure of base image and generators; neither mere linear span nor finite-dimensionality. |
| RatFunc.finrank_eq_max_natDegree | Mathlib/FieldTheory/RatFunc/IntermediateField.lean:162 | Reduced numerator/denominator degrees; constant case handled by infinite-extension finrank zero. |
| IsAlgebraic.exists_integral_multiple | Mathlib/RingTheory/Algebraic/Integral.lean:146 | One nonzero base scalar for one algebraic element; it does not assert a uniform exponential denominator scale. |
| Int.Matrix.exists_ne_zero_int_vec_norm_le | Mathlib/NumberTheory/SiegelsLemma.lean:155 | Positive row cardinality strictly below column cardinality; nonzero integral kernel vector and row/surplus exponent. |
| fieldOfFiniteDimensional | Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:521 | Finite-dimensional algebra, commutative domain, field base; rules out the zero ring. |
| Stirling.factorial_isEquivalent_stirling | Mathlib/Analysis/SpecialFunctions/Stirling.lean:246 | Full asymptotic equivalent; taking logarithms/roots derives d/(d!)^(1/d)→e. |
| Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le | Mathlib/Analysis/Complex/Liouville.lean:42 | Complete target, positive radius, DiffContOnCl, boundary norm bound; includes n!. |
| AnalyticOnNhd.circleAverage_log_norm | Mathlib/Analysis/Complex/JensenFormula.lean:375 | Nonzero radius, analyticity near closed ball, nonzero central value; remove the zero order before applying. |
| Real.circleAverage | Mathlib/MeasureTheory/Integral/CircleAverage.lean:55 | (2π)⁻¹ times angular interval integral. Definition itself does not imply integrability. |
| Matrix.det_vandermonde | Mathlib/LinearAlgebra/Vandermonde.lean:219 | Product of v_j−v_i, opposite the roadmap’s order for each pair. |
| InnerProductSpace.gramSchmidtOrthonormalBasis_det | Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean:374 | Determinant as product of diagonal inner products, with the full-dimensional basis hypotheses. |
| eVariationOn; BoundedVariationOn; LipschitzWith.comp_boundedVariationOn | Mathlib/Topology/EMetricSpace/BoundedVariation.lean:60,65,1256 | Supremum of finite monotone partition sums; finite variation need not be continuous; composition retains actual sampled values. |
| isCompact_setOfPred_finiteMeasure_le_of_isCompact | Mathlib/MeasureTheory/Measure/Prokhorov.lean:183 | Hausdorff Borel space, compact support and bounded mass; the circle supplies these. |
| MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto | Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:365 | Weak convergence tested by bounded continuous real functions. |
| MeasureTheory.ProbabilityMeasure.continuous_prod | Mathlib/MeasureTheory/Measure/FiniteMeasureProd.lean:144 | Second-countable pseudometrizable factors with measurable opens. |
| MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto | Mathlib/MeasureTheory/Measure/Portmanteau.lean:353 | Measurable opens, outer approximation by closed sets, limit-null frontier. Mesh endpoints avoid limit atoms. |
| TauCeti.Probability.empiricalMeasureOfFintype; TauCeti.Probability.integral_empiricalMeasureOfFintype | TauCeti/Probability/Process/EmpiricalMeasure.lean:54,100 | Nonempty finite indices; repetitions retained; strongly measurable integrand and complete real normed target for the integral. |
| DifferentiableOn.torusIntegral_prod_sub_inv_smul | TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:116 | Finite coordinate polydisc; point in its interior; differentiability on its closure; factor (2πi)^n. |
| TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin | TauCeti/Analysis/Calculus/MetricVariation.lean:276 | C¹ curve on a closed real interval, complete real normed target, within derivative. |

Object searches included substitutions/inverses, integral coefficients and scalar clearing, rational-function extension degree, algebraic power-series denominators, holonomic differential equations, logarithmic energy, circle discrepancy, Vandermonde products, empirical measures and variation. The existing inverse, single-element scalar-clearing and degree APIs are cited rather than re-planned. The two arithmetic headline conclusions are not supplied by those declarations. The four local definitions are permitted specializations/bundles on native carriers. No borrowed fully qualified declaration name was found in the main and supplied sibling roadmap files.

**Resolved roadmap ownership.** The main content checkout used by the resolver is fa41b37. Main-branch DiophantineApproximationAndTranscendence, SuccessiveMinima and ClassicalArithmeticCompletion supplied the comparison of roadmap shape as well as the ownership checks. I used the roadmap service for object searches and for the two open supplier texts, and also searched the board packages. Index hits for unrelated Eisenstein modular forms and subadditive Fekete results are not the same objects.

| Owner and location read | Exact imported object and verification |
|---|---|
| TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:227,358,1844,2972,3012,3078, on main | §§0.2–0.3,2.8,5.1–5.3 exist at the cited locators. In §5.1 the polynomial-coefficient D-finite predicate, finite derivative span, closure, ordinary complex jets and positive-radius initial-value theorem supply the stated inputs. Rational-coefficient annihilator descent is explicitly owned here in §4.1, not incorrectly attributed to that parent. |
| TauCetiRoadmap/ConformalMappingPartII/README.md:140,165,185,191,197,217, at the supplied open head | §§0.1–0.6 provide monic scalar equations, solution germs and jets, continuation, simply connected global solutions, full punctured meromorphic bases and simultaneous algebraic pole clearing. The last explicitly allows adjoining conjugate zeros through minimal polynomials. |
| TauCetiRoadmap/ConformalMappingPartII/README.md:292,313, at the supplied open head | §§1.3–1.4 give the pointed hyperbolic radius and derivative extremality. Radius-2 disc gives 2, inverse map derivative 1/2. The consumer correctly avoids totalized radius on parabolic domains. |
| TauCetiRoadmap/ConformalMappingPartII/README.md:561,567,573, at the supplied open head | §§3.5–3.7 retain reconstruction phase, radial smoothing and normalized logarithmic quotient bounds. These supply §2.1’s route without creating a backward edge from the supplier. |
| TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:3087,3133,3143, at the supplied open head | §2.7 has strict initial intervals, empty value 0, actual-value BV Koksma, and Erdős–Turán with constant 3. Rotation changes Fourier means by a unit scalar. The new circle supremum over cuts is an adapter. |
| TauCetiRoadmap/SuccessiveMinima/README.md:171,173,188, on main | §0.1 targets 0.1.1 and 0.1.2 are the coordinate and Hermitian Gram–Hadamard inequalities, allowing dependent/empty families. The retained circle theorem adds the regular-polygon equality analysis. |
| TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:12458,12493,13054, on main | §§6.18–6.19,6.40 specify finite Fekete diameters, monic Chebyshev norms, common limit, affine covariance, disc/segment/finite-set values. They do not provide the requested general complex logarithmic-energy minimization theorem. It remains the declared named supplier extension, not a nonexistent completed theorem. |
| TauCetiRoadmap/RandomMatrices/README.md:1110,1138, on main | §§9.2–9.4 concern weighted logarithmic energy of real-line beta gases with confining V. Their carrier and hypotheses do not furnish the unweighted arbitrary compact-complex/circle contract. No duplicated circle-equilibrium theorem was found there. |
| packages/ModularFormsPartII/design/README.md:21,664,684 | The board design consumes the corrected ℚ(λ)-span W rank theorem. It is a downstream arithmetic application, not a second owner or a supplier. |

For the two open suppliers I read the actual indicated head files, not a remembered version or an unrelated revision of a roadmap on main. The supplied sibling checkouts and main/package searches revealed no competing owner of the arithmetic coefficient/germ interface, normalized inverse denominators, arithmetic rank theorem, W/V comparison, or corrected compact obstruction. The mathematical content of unrelated open PRs for which the brief supplied no checkout was not reviewed; index search hits alone were not used as ownership evidence.

The potential-theory contract is precise: nonempty compact sets, extended diagonal, bounded-below truncations, weak lower semicontinuity, a minimizer, positive-capacity uniqueness, capacity comparison and affine-compatible circle/disc measures. These are related parts of the same equilibrium interface. It asks for no duplicate of the already owned finite-diameter construction, only its identification with the new energy minimum. R01 requests its exact registration marker. G1 is not an input to any of the three proofs, the W theorem or the centred rescaling theorem.

**Shape.** The required summary, scope, conventions, supplier contracts, build paragraph, layer order, Examples/Dependencies endings, downstream discussion and references are present. Definitions of the lattices, germs, positive mean, generated field, multiplier bound, discrepancy, H, W and V have supporting APIs and at least three discriminating Checks, allowing the shared §0.2 and §4.3 blocks. R02 is the one positive example that fails its intended premise. The six Lean names all occur in the README, and the own-name backticks introduce no absent declarations. No copied source passage, executable algorithm, route-specific “good cases only” shortcut or restatement of the parent roadmap was found. The centred result is accompanied by an explicit refutation of the purported unrestricted formula, rather than silently narrowing a valid general theorem.

## Not verifiable

- No cited source text was inaccessible: CDT25, BB11 and Saff10 were all read legally from the supplied cache. The BB11 tail exponent and CDT25 Vandermonde sign were also inspected on rendered pages of the cached PDFs to distinguish genuine print errors from extraction artifacts.
- A valid replacement for the arbitrary-compact theorem in G1 is not specified. This review verifies the obstruction and centred theorem, not such a replacement. The settled maintainer scope decision remains outstanding; it is not silently discharged by this accepted verdict.
- The declared complex-logarithmic-equilibrium extension is a supplier contract, not a theorem implemented at these pins. Acceptance is conditional on that declared contract. No absent implementation was represented as verified.
- This is a review of the stated mathematical interfaces and proof routes, not a completed formal proof of the sorried headline theorems. Open-PR ownership beyond the supplied readable checkouts was not certified.

## Source issues

- **Misprint** in BB11 at §1, printed p.1, BB11 line 40: the source says the tail uses exponents N−k; it should be k−N, so its k=N+1 term has degree one; affects the proof.
- **Misprint** in CDT25 at (2.5.2), printed p.644, CDT25 line 1050: the source says the product of z_i−z_j equals the displayed Vandermonde determinant; it should be multiplied by (−1)^(d(d−1)/2); affects nothing.
- **Error** in CDT25 at (2.3.2), printed p.640, CDT25 line 771: the source says real-logarithmic boundary data reconstruct G as a complex quotient without phase; it should include G(0)/abs(G(0)), as G=i shows; affects the proof.
- **Misprint** in CDT25 at the proof of Lemma 2.3.1, printed p.641, CDT25 line 820: the source says sup abs(h) is at most the positive logarithmic mean; it should bound sup log abs(h), since h=g=1 gives 1 versus 0; affects the proof.
- **Error** in CDT25 at the proof of Lemma 2.5.9, printed p.646, CDT25 line 1190: the source says every compact set has a unique minimizing probability; it should assume positive capacity for uniqueness, since two-point sets have many infinite-energy minimizers; affects nothing.
- **Error** in CDT25 at Corollary 2.0.5, (2.0.7), printed p.636, CDT25 line 498: the source says the unrestricted ℚ(p)-dimension of V satisfies B; it should bound W, or insert the scalar-degree factor for V; affects a stated result.
- **Error** in CDT25 at §2.5.27, (2.5.28), printed p.649, CDT25 line 1377: the source says arbitrary compact sampling with positive denominator bounds rank; it should restrict to justified base-point geometry, since the translated disc yields 1≤0; affects a stated result.
