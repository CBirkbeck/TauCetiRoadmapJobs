# Review of EllipticCurveModularity (pull request #1018 at ed342f3)

**Verdict:** needs changes

## R01 (P1) — Resolve the modular-curve supplier against its actual sections

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:254`, repeated at lines 1286, 1499, 1551, 1594 and 1703. The contract says “§16.8 the nonconstant Abel–Jacobi composite”.

**Claim:** The named sections supply the Γ₀ quotient, its differential comparison, oldform factors and the nonconstant composite used in the geometric implications.

**Witness:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4174` is §16.5, the Γ₀ quotient; line 4200 is §16.6, oldforms; line 4219 is §16.7, the composite. There is no §16.8.

**Repair:** Repoint each consumption by content: dimension/Tate realization to §16.3 (line 4138), differentials to §16.4 (4157), Γ₀ quotient to §16.5 (4174), oldforms to §16.6 (4200), and nonconstancy to §16.7 (4219). Correct the supplier contract and every repeated dependency, including the decomposition proof. These sections were opened at the indexed new-roadmap head `82d96e2` and contain the needed interfaces. At level 22, the corrected oldform supplier supplies two level-11 copies, giving dimension 2 and Tate dimension 4; the present §16.7 citation instead points to nonconstancy. The severity follows the specified rule for a prerequisite asserted to come from a nonexistent section, not a claim that the underlying mathematics is false.

## R02 (P1) — Resolve the residual-attachment and weight suppliers

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:243` and line 835, with related references at lines 63 and 230. The text names “§R15.5A.2” and “Layer R15.6, S-type and modularity predicates”.

**Claim:** These locations provide the classical representation and the shared residual attachment used by the curve-level predicate and Serre witnesses.

**Witness:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1383`, 1418 and 1585 contain §§6.1, 6.2 and 7.5. The cited §R15.5A.2 and `target-s-type-arises-from-and-modular` anchor do not exist there.

**Repair:** Cite §§6.1–6.2 for the classical representation and §7.5 for S-type/modularity predicates, linking to its actual heading. Repoint weight two to §4.9 (line 1112) and eigenvalue lifting to §5.10 (1296). Describe the residual predicate as the planned §7.5 interface, not as an existing `TauCeti.ResidualModularity.ArisesFrom` declaration: that fully qualified name is absent from the pins and the supplier acceptance file. Retain the finite-field, single coefficient-map, basis-change and semisimplification conditions: these are present in §7.5, so no new supplier gap is needed. As a test, the order-5 representation of 11a1 has semisimplification `1 ⊕ χ̄₅`; its Frobenius at 2 has trace 3 and determinant 2. The corrected predicate compares that full polynomial and does not identify arbitrary nonsplit lattices. This is supplier drift under the review's P1 rule.

## R03 (P2) — State the statable 15-isogeny classification

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:574` and `TauCetiRoadmap/EllipticCurveModularity/Suggested.lean:14`. The README requires “Prove this four-value conclusion for every E”.

**Claim:** This finite classification is a substantial result owned in R29.1, including the rational-point calculation on X₀(15), but the acceptance file neither states it nor identifies an obstacle to stating it.

**Witness:** The existing `HasRationalCyclicSubgroup`, native `WeierstrassCurve.j`, and `Finset ℚ` suffice. A scratch copy with the following signature elaborated with only the expected `sorry` warning.

```lean
theorem fifteen_isogeny_j (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (h3 : HasRationalCyclicSubgroup E 3)
    (h5 : HasRationalCyclicSubgroup E 5) :
    E.j ∈ ({-25/2, -349938025/8, -121945/32, 46969655/32768} : Finset ℚ) := sorry
```

**Repair:** Add this headline, with the chosen roadmap name in both files and a mathematical docstring. It needs no modular-curve stand-in. Keep the semistability exclusion as a consequence/Check rather than replacing the full classification with it. The model `y²=x³−x²−8x+112` gives `c₄=400`, `Δ=−5120000`, hence `j=−25/2`; it satisfies the full conclusion and refutes an unconditional exclusion. The two Hauptmodul existence signatures also elaborate using the existing predicate; the absence of a modular-curve carrier is not an obstacle to those arithmetic statements either.

## R04 (P2) — Give elliptic coefficient summability one owner

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:1858` and `TauCetiRoadmap/EllipticCurveModularity/Suggested.lean:124`.

**Claim:** R29.6 owns and plans absolute convergence of the native elliptic L-series for real part greater than 3/2.

**Witness:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:649` and `Suggested.lean:253`, at the supplied open head, plan the same native theorem over every number field. Taking `K=ℚ` gives this statement after unfolding `lCoeff`.

**Repair:** Assign this general convergence result to a single earlier owner and cite it from the consumer. A direction-preserving resolution is to own the number-field theorem here, using the native number-field L-function, and have EllipticCurvePeriodsAndModularParametrizations import it; record that boundary in scope. Keep the rational divisor bound as its ℚ specialization. Do not add a dependency on the latter roadmap: it already consumes R29.3–R29.6 (its README lines 57 and 145), so that would introduce a cycle. At `K=ℚ`, `s=7/4`, both theorem conclusions are literally the same summability proposition. Generalization must use ideal norm fibres: over `ℚ(√17)`, 2 splits, so base change of 11a1 has coefficient at norm 2 equal to `−2−2=−4`, rather than the rational coefficient `−2`. This tests both the overlap and the required generality of the repair. The other roadmap is not yet listed in the order; its placement after suppliers is not itself a finding.

## R05 (P3) — Correct the 15-isogeny source locations

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:585` and line 589: “§19.1, p. 91”.

**Claim:** The linked DDT text and the stated supplementary-table page let the reader verify the four-value classification.

**Witness:** The DDT URL returns HTTP 404. The linked supplementary PDF puts §19.1 and the four values on printed page 93 (`gjlario` lines 2890–2920), not 91.

**Repair:** Link the legally readable DDT copy at [William Stein's academic site](https://wstein.org/edu/2011/581g/misc/Darmon-Diamond-Taylor-Fermats_Last_Theorem.pdf), and change the table locator to §19.1, p. 93. DDT §3.6, Theorem 3.48, p. 102 supplies the four noncuspidal points; the supplementary table supplies their j-values. Evaluating its first model gives `−25/2`, so the repaired locator reaches the actual arithmetic witness. The two errors inside that table are recorded under Source issues; they do not invalidate its displayed j-values.

## R06 (P3) — Remove the three gate-rejected HTML anchors

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:549`, 823 and 1302.

**Claim:** The README contains raw anchor tags for the small-isogeny, residual-attachment and conductor sections.

**Witness:** Both the supplied gate and the rerun report `residue=3`, at exactly these three lines.

**Repair:** Delete the tags and use the Markdown heading anchors, updating links that refer to them. This removes all three reported residue instances. No mathematical target needs to be removed.

## R07 (P3) — Use the required layer-heading delimiter

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:489`, 784, 1006, 1249, 1464 and 1598.

**Claim:** All six layer headings use a period after the identifier, for example “Layer R29.1. Exceptional primes and the residual conductor”.

**Witness:** Both gate runs report `layer-ids=6`; each diagnostic requires `Layer N: title`.

**Repair:** Replace the identifier's trailing period with a colon in all six headings, retaining their identifiers and titles. For example, use `## Layer R29.1: Exceptional primes and the residual conductor`. This addresses all six reported instances; rerun the gate after R06 and R07.

## R08 (P3) — Use the roadmap namespace and module-docstring form

**Location:** `TauCetiRoadmap/EllipticCurveModularity/Suggested.lean:8`, 39 and 156; `TauCetiRoadmap/EllipticCurveModularity/README.md:378`.

**Claim:** The acceptance file declares its targets in `TauCeti.EllipticCurve.Modularity` and titles itself “headline statements”.

**Witness:** The required namespace is `TauCetiRoadmap.EllipticCurveModularity`; the required module title ends “target signatures”. The current opening and closing namespace are the library namespace instead.

**Repair:** Move the declarations into the required roadmap namespace, update the README's namespace sentence, and use the prescribed module title and pinned-API description. The file's internal references are relative, so no mathematical signature changes are needed. All eighteen elaborated declarations were inspected; this repair preserves their binders, including every theorem's ellipticity assumption.

## R09 (P3) — Remove the invented exemption for undeclared Lean names

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:383`, with examples at lines 901, 1186 and 1652.

**Claim:** “Other interface names in this README specify mathematical targets without asserting that their Lean declarations exist.”

**Witness:** Own names such as `serreWitness_trace`, `newformOf` and `rationalTateMap_surjective` appear in backticks but are absent from the complete eighteen-declaration Lean file.

**Repair:** Delete the exemption. Describe these intended APIs in mathematical prose without backticked prospective declaration names. Keep names for actual acceptance declarations and exact supplied declarations. Do not fill the Lean file with API padding to satisfy the naming rule. Checking these three examples against the declaration list gives three absent names before the repair and no declaration claim after conversion to prose.

## Verified sound

The review covered the whole README and Lean file, not only the diff. The worktree stayed at the requested head and remained clean; there are no changes outside this roadmap folder in the PR diff. Main context was checked at `6cfa9b1c`; Mathlib and Tau Ceti were checked at the manifest pins `6b7abb3` and `a91d3aa`. No `set_option`, sorry-defined data, admitted examples, computational algorithm target, or good-primes-only end theorem was found. Elliptic curves with geometric CM, bad primes 2 and 3, and arbitrary positive geometric levels remain in scope. Main's EllipticCurves roadmap leaves modularity to this roadmap, so this is not a re-plan requiring rejection.

**Build and gate.** The four imported Tau Ceti modules were built successfully before direct elaboration. `lake env lean` on the original Suggested file exited 0 with exactly ten `sorry` warnings. A scratch copy with `#check @name` for all eighteen declarations also elaborated: eight definitions/abbreviations and ten theorems. The ellipticity instances are present in every theorem that needs them; the reduction predicates and attachment predicate intentionally accept native Weierstrass curves, but their mathematical comparison theorems retain nonsingularity. Nothing was changed in the signatures. The ten `rfl`/`simp`/`infer_instance` padding probes all failed to close their targets; reading the pinned definitions revealed no single-library-lemma replacement. No padding finding is made.

The gate still fails, despite the passing build:

```text
set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0
residue=3 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
round-labels=0 long-fences=0 layer-ids=6 target-ids=0 depcheck=0 metadata=0
stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The supplied gate also records `build=0`. R06 and R07 cover every failing gate rule. The required dependency command, run with the supplied merge order, movable placement and main content, returned:

```text
depcheck: 208 roadmaps, 1475 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no declared gap. Mechanical direction is sound; it does not validate section contents, which is why R01 and R02 remain blocking.

**Headline coverage.** The README's main/deep outputs are rational endomorphisms; exceptional-prime finiteness and residual irreducibility/conductor; the small-isogeny classification; finite-flat weight two and exact-level Serre witnesses; an exact newform from infinitely many congruences; rational coefficients; Tate, conductor and all-local-factor comparisons; quotient isogenies and modular parametrisations; rational Tate absolute irreducibility and quotient-map surjectivity; exhaustive Γ₀ decomposition and its converse; the three modularity formulations and unconditional existence; coefficient summability; and completed analytic continuation/functional equation. The ten Lean theorems cover rational endomorphisms, finiteness, rational coefficients, all local factors, all coefficients, full rational Tate-image span, summability, conditional completion, modularity and unconditional completion. The module docstring identifies the missing conductor, Serre-weight/residual-attachment and modular-geometry carriers for the remaining main comparisons. R03 identifies a deep arithmetic classification that does not need those missing carriers. Simple Hauptmodul signatures also passed scratch elaboration. No geometric carrier was replaced by a free predicate or a sorry-defined object.

**Adversarial calculations.** The following table has 89 rows recording instances and values, including negative controls. “Pass” means the stated computation agrees with the target; it does not claim a finite collection of examples proves a universal theorem. Model invariants, finite-field point counts, polynomial remainders and valuations were independently recomputed. Rows using modular-form dimensions, quotient degrees or the newform identification state those supplied inputs explicitly. The API laws and conventions are tested along with the named milestones. Findings about locators/form use literal counts rather than fictitious numerical proofs.

| Statement / location | Instances tried | Values on the two sides; excluded wrong model | Result / change |
| --- | --- | --- | --- |
| Nonsingularity and j convention, README 85; native j | 11a1 and the singular equation y²=x³ | 11a1: c₄=496, Δ=−161051, j=−122023936/161051; c₄³/Δ has that value. Singular model: Δ=0 and totalized j=0, but IsElliptic is false. | Pass; nonsingularity retained. |
| GQ and identity action, Lean 44 | Identity; complex conjugation on ℚ(i) | Identity fixes i; conjugation sends i to −i and squares to identity. Fixed rational scalars stay a=a. | Pass; unfolded native action. |
| Arithmetic Frobenius/determinant convention | 11a1 at 2, auxiliary r≠2 | #E(𝔽₂)=5; a₂=3−5=−2; trace −2, determinant 2, characteristic polynomial X²+2X+2. Geometric inverse has determinant 1/2 instead. | Pass; arithmetic convention distinguished. |
| lCoeff, Lean 47; normalization | n=0,1,2 for 11a1 | a₀=0, a₁=1, a₂=−2; native arithmetic function has the same three values. | Pass; zero index not treated as an Euler factor. |
| Fourier coeff, Lean 65 | Normalized level-11 form; zero cusp form | q-expansion begins q−2q²−q³; coefficients 0,1,−2 at 0,1,2. Zero form has a₁=0 and fails Newform normalization. | Pass; normalization excludes scaling and zero. |
| Good-reduction predicate, Lean 50 | 11a1 at 2 and 11; 32a2 at 3 | Minimal Δ valuations 0,5,0; good-reduction values true,false,true. A nonminimal integral presentation must first be minimized. | Pass. |
| Multiplicative-reduction predicate, Lean 54 | 11a1 at 11; y²=x³−x at 2 | v₁₁(c₄)=0, v₁₁(Δ)=5: multiplicative true. At 2, c₄=48, Δ=64: additive, multiplicative false. | Pass. |
| Rational endomorphism ring, README 496 / Lean 84 | Identity, zero, [−2] | Differential scalars 1,0,−2; degrees 1,0,4. Integer multiplication gives the same scalars/degrees. Degree alone cannot distinguish ±2. | Pass. |
| Endomorphism addition, composition, uniqueness | [2]+[−3], [2]∘[−3] | Scalars −1 and −6; degrees 1 and 36. Zero differential of [n] means n=0 in ℚ. | Pass; no Faltings needed. |
| Geometric CM control for endomorphisms | E:y²=x³−x | Geometric [i] has differential i, not in ℚ; conjugation takes it to [−i]. Rational End is ℤ, geometric End contains ℤ[i]. | Pass. |
| Cyclic-subgroup predicate, README 523 / Lean 58 | p=0,1; 11a1 p=5 | Finite subgroup cardinality ≥1, so p=0 false; zero subgroup has cardinality 1, so p=1 true; rational order-5 point gives a stable subgroup of size 5. | Pass; applications require primality. |
| Stability versus a rational generator | 162b1, p=7 | f(x)=x³−3x²+3 has no rational root; x(2P)=x²−2x, its third iterate is x modulo f; ψ₇ remainder 0 while ψ₃ remainder −54+54x−9x² is nonzero. #E(𝔽₅)=6 excludes rational 7-torsion. | Pass; stable kernel need not have rational generator. |
| Hauptmodul relation for 3-isogenies | u=−3,−27,0 | Nonzero u give both sides 0 at j=0; u=0 gives left 0 and right 729. | Pass; j=0 retained, cusp excluded. |
| Hauptmodul relation for 5-isogenies | 11a1 with v=−1/11; v=0 | jv=(v²+10v+5)³=122023936/1771561; v=0 gives 0 versus 125. | Pass; source Table 1 matches. |
| j=0 boundary of 5-relation | v²+10v+5=0 over ℚ | Discriminant 80 is not a rational square; there is no rational v. For the 3-relation, u=−3 gives j=0. | Pass; two isogeny cases differ. |
| 11a1 lacks a rational 3-isogeny | Frobenius at 2 modulo 3 | X²+2X+2 has values 2,2,1 on 0,1,2; no root. | Pass. |
| Four-value 15-isogeny classification | The four supplementary-table models | j values −25/2, −349938025/8, −121945/32, 46969655/32768; each belongs to the displayed four-element set. First model c₄³/Δ=64000000/(−5120000)=−25/2. | Pass mathematically; add signature, R03. |
| Semistability-at-5 exclusion | Same four j-values | Their v₅ values are 2,2,1,1; good nonzero j has value in 3ℕ and multiplicative j has negative value. Neither condition includes these four. | Pass; additive counterexample retained. |
| Exceptional set, Lean 69 | Nonprimes 0,1,4; primes 2,3,5 | Nonprime membership false despite 0≤5; membership of 2,3,5 true. Existential primality guard excludes junk inputs. | Pass. |
| Exceptional valuation clause | 11a1 versus 11a2 and 11a3 | v₁₁(j) is −5,−1,−1 respectively; 5 divides only −5. All three still have a rational 5-isogeny. | Pass; clauses distinguished. |
| Exceptional bad-reduction clause | 11a1 p=11 | Bad reduction true; v₁₁(j)=−5 and 11∤5. Bad reduction alone is sufficient for membership. | Pass. |
| Exceptional independent controls | 26b1, 274a1, 162b1 at p=7 | v₂(j)=−7,−7,−3; valuation clause true,true,false. Order-7 kernel present for 26b1/162b1; 274a1 Frobenius at 3 has discriminant 6 mod 7, a nonsquare. | Pass; each independent clause exercised. |
| Exceptional finiteness, Lean 89 | 11a1; general nonzero multiplicative valuation | 11a1 has Σ={2,3,5,11}; the valuation −5 contributes just prime 5. Multiplicative v(j)<0 excludes value 0, whose divisors would include every prime. | Pass; CM not excluded. |
| Residual irreducibility outside Σ | 11a1 p=7; p=5 | At 3, a₃=−1 and discriminant 1−12=−11≡3 mod 7; squares are 0,1,2,4, so no invariant line. At 5 a stable kernel exists and 5∈Σ. | Pass. |
| Absolute irreducibility via oddness | Complex conjugation, p=7 and p=2 | At 7 eigenvalues 1,6 have determinant 6=−1 and distinct eigenspaces; at 2 they coincide (1,1), so that argument fails. | Pass; small primes excluded from this argument. |
| Residual conductor divides elliptic conductor | 11a1 p=5,7,11 | N_E=11; residual prime-to-p conductors 1,11,1 respectively; all divide 11. For p=5 the split residual characters are unramified at 11. | Pass. |
| Residual conductor equality criterion | 11a1 p=7 versus p=5 | At 7 good reduction and 7∤5 give 11=11; at 5 the multiplicative valuation is divisible by 5 and conductor drops to 1≠11. | Pass; equality not claimed at every p. |
| Model invariants used in Checks | 11a1, 11a2, 11a3 | (Δ,c₄,c₆)=(−161051,496,20008), (−11,375376,229985128), (−11,16,−152). Direct invariant formulas reproduce each. | Pass. |
| Model invariants used in Checks | 26b1,274a1,162b1 | (Δ,c₄,c₆)=(−1664,129,−2241), (−17536,337,−8281), (−648,225,−3537). Computed j agrees with each c₄³/Δ. | Pass. |
| CM and nonsplit model controls | 32a2 and 37a1 | (Δ,c₄,c₆)=(64,48,0) and (37,48,−216); j=1728 and 110592/37. At 37, −c₆≡31 is a nonsquare, hence nonsplit. | Pass. |
| Finite-flat torsion, R29.2 | Good reduction 11a1 at 7; n=0 excluded | Rank of E[7] is 7²=49; rank of E[7²] is 7⁴=2401. Multiplication by zero has positive-dimensional kernel, not that finite-flat conclusion. | Pass; supplier R07.6.1 includes n≠0. |
| Weight-two criterion | E[7]; determinant exponent modulo 6 | det=χ̄₇, finite flat, so weight 2. Weights 2 and 8 have equal determinant exponent modulo 6, but the finite-flat recipe selects 2. | Pass; determinant congruence alone insufficient. |
| Curve residual attachment | 11a1 p=3, Frobenius at 2 | Elliptic trace −2≡1 and det 2; attached form gives 1,2. Trivial two-dimensional representation gives trace 2,det 1, hence fails. | Pass; supplier citation R02. |
| Residual comparison retains semisimplification | 11-isogeny class p=5 | Semisimple trace at 2 is 1+2=3≡−2, determinant 2. Split and nonsplit extensions share this polynomial but need not be isomorphic. | Pass; no false lattice identification. |
| ArisesFrom basis independence / torsion transport | Diagonal action diag(1,2) over 𝔽₅; swapped basis | Trace 3, determinant 2 before and after conjugation; matrix entries differ. | Pass; one coefficient map retained. |
| ArisesFromLevel | Level-11 newform; its oldform at level 22 | Primitive level is 11 in the first case. Same good eigenvalues at 22 do not make an oldform a Newform 22 2. | Pass; primitive carrier excludes wrong ambient level. |
| SerreWitness and its selected family | 11a1 p=7 | Weight 2, level 11, character 1; at 2 trace −2≡5 mod 7, determinant 2. This is nonempty witness data, not a residual-modularity hypothesis. | Pass; supplier existence is unconditional. |
| Witness trace and prime accessor | a₂(F)−a₂(E) for 11a1 | Difference −2−(−2)=0 lies in every chosen coefficient prime, norm 0. Element 2 at characteristic 3 gives reduction 2≠0. | Pass; reduction data discriminate. |
| Finite coefficient-field extension/descent | Order-3 eigenvalue over 𝔽₄ | 𝔽₄× has size 3, 𝔽₂× size 1; a nontrivial order-3 value cannot descend to 𝔽₂. Extension to 𝔽₁₆ preserves it. | Pass; no automatic descent to 𝔽_p. |
| Root-of-unity reduction | ζ=−1, m=2, p=3 or 2 | At 3, ζ maps to 2≠1; at 2 it maps to 1 although ζ≠1. | Pass; prime-to-order condition essential. |
| Character triviality for arbitrary finite groups | S₃ sign at p=5; trivial group | Sign of a transposition maps to 4≠1, so hypothesis fails; trivial group has one value 1 and character 1. | Pass; no hidden abelian-group assumption. |
| Level-unit group cardinality | N=1,2,11 | φ(N)=1,1,10; unit groups have those sizes. N=0 is excluded by positive level (φ(0)=0 would not count ℤ×). | Pass. |
| Integer norm vanishing | α=√2 in ℚ(√2); α=0 | Norm −2 has only prime divisor 2; norm 0 is divisible by every prime. Repeated characteristic 2 does not force √2=0. | Pass. |
| Integer divisor form | α=6; α=0 | Positive divisors of 6 are {1,2,3,6}, four values; every positive natural divides 0. | Pass; infinitely many distinct divisors needed. |
| Infinite finite-fibre principle | ℕ→{0,1}, n↦n mod 2; empty target | Both fibres {2n},{2n+1} are infinite; no function ℕ→∅ exists. | Pass; imported lemma, not a new Lean target. |
| Finite newform range | Level 11 weight 2; scalar multiples | One normalized newform in the supplied one-dimensional space; scalar multiples 2f,3f have first coefficients 2,3 and are not normalized. | Pass; dimension alone does not count vectors. |
| Attachment predicate, Lean 77 | 11a1 and its level-11 form; 2F | Character 1 and matching a₂=−2,a₃=−1; 2F has a₁=2 and is excluded by the Newform carrier. | Pass. |
| Cross-level uniqueness | f at 11, its oldform f at 22 | Good coefficients agree; primitive levels would have to satisfy 11=22, false. The oldform fails the newform hypothesis, as required. | Pass; uses stronger supplier, not fixed-level lemma. |
| Isogeny invariance of attachment | 11a1,11a2,11a3 | At 2,3,5 all three have #E=5,5,5, hence traces −2,−1,1. Discriminants differ, so coefficients do not depend on a chosen minimal equation. | Pass; Faltings/Tate route supplies all good primes. |
| Quadratic-twist Check, README 1219 | 11a1 and its twist by −1 at 3 and 7 | Original point counts 5,10 give traces −1,−2; twist counts 3,6 give traces 1,2. The character values are −1 at both primes, so χa equals 1,2. | Pass; equality is asserted away from twist ramification. |
| Infinite congruences to exact form | Fixed difference 2 versus 0 | 2 reduces to zero only at characteristic 2; 0 reduces to zero at every characteristic. The form/field must be fixed before this test. | Pass; finite-fibre step precedes norm. |
| Rationality of coefficients, Lean 97 | 11a1 versus level-23 orbit control | Attached coefficients −2,−1,2 are integers. At level 23, a₂=(−1±√5)/2 has sum −1 and product −1, and is not rational. | Pass; full Galois conjugation argument needed. |
| Choice of newformOf and uniqueness | 11a1 and its rational isogeny class | Selected primitive level 11 and first coefficient 1 in all three cases; λ choices of isogeny change the map, not the form. | Pass; prospective name formatting R09. |
| Rational Tate comparison | Attached 11a1, r≠2 | Both spaces have dimension 2; at 2 both polynomials are X²+2X+2. A degree-two coefficient-field factor would have rational dimension 4, not 2. | Pass; compare appropriate component first. |
| Elliptic conductor specialization | 11a1 and 32a2 | N=11 versus abs(Δ)=11⁵ for 11a1; N=32 versus abs(Δ)=64 for y²=x³−x. Ideal (11) has positive rational generator 11, not −11. | Pass; not the discriminant or radical in general. |
| Semistable conductor product | 11a1; 32a2 negative control | Product of bad primes for 11a1 is 11=N. For 32a2 it is 2≠32; additive reduction excludes this instance. | Pass; wild exponent retained. |
| Level equals conductor | 11a1 attached primitive form; old level 22 | 11=11 for primitive level and conductor; 22≠11 for old ambient level. | Pass; Newform hypothesis essential. |
| Good local polynomial, Lean 104 | 11a1 at 2 | P(T)=1+2T+2T² on both arithmetic and newform sides. Reciprocal convention would instead be T²+2T+2. | Pass. |
| Split/nonsplit/additive local polynomials | 11a1 at 11; 37a1 at 37; 32a2 at 2 | P=1−T,1+T,1 respectively. Wrong universal quadratic term gives nonzero T² coefficients where required coefficient is 0. | Pass; all bad primes included. |
| Dual and Frobenius convention at bad places | Split Tate curve at ℓ=11 | Arithmetic action on Tate invariants has eigenvalue 11; geometric action on dual invariants has eigenvalue 1. Euler factor uses 1−T, not 1−11T. | Pass; supplier conventions agree. |
| Completion/valuation transport | Rational prime 11, uniformizer 11 | Under the supplied completion equivalence, v₁₁(11)=1 and residue cardinality=11 on both sides; 11 is not transported to a unit. | Pass. |
| Prime-power coefficient recurrence | 11a1 at 2 | a₄=a₂²−2=4−2=2; split at 11 gives a₁₂₁=1²=1; additive 32a2 at 2 gives a₄=0. | Pass. |
| All coefficient comparison, Lean 110 | n=0,1,4,6,121, 11a1 | Elliptic coefficients 0,1,2,2,1; newform Euler recurrence gives the same values, with a₆=a₂a₃=2. | Pass; n=0 explicitly harmless. |
| Quotient isogeny and dimension | Rational level-11 form; degree-two level-23 coefficient field | Quotient dimensions 1 and 2 respectively. Only first can be isogenous to an elliptic curve without extracting a constituent. | Pass; R01 fixes supplied location. |
| Γ₀ versus Γ₁ quotient | Supplied level-11 models 11a1 and 11a3 | j values −122023936/161051 and −4096/11 are unequal although the curves are isogenous. | Pass; no equality of models inferred. |
| Parametrisation and differential normalization | φ followed by [−2] | If φ*ω=c·2πif(z)dz, new multiplier is −2c; new degree is 4 deg φ. Positive degree alone does not determine the sign. | Pass; c≠0 required. |
| Cusp normalization / nonconstancy | φ(∞)=O; constant map | Normalized map sends cusp to O. Constant map has degree 0 and differential 0, so is excluded; translations can preserve differential but fail cusp value. | Pass. |
| Parametrisation degree checks | Supplied optimal maps to 11a1,11a3,37a1 | Degrees 1,5,2; composing [n] gives n²,5n²,2n² respectively. At n=0 degree becomes 0 and nonconstancy fails. | Pass on the supplied optimal-degree inputs. |
| Rational Tate image span, Lean 117 | Dimension 2; CM over ℚ versus CM field | Full End has dimension 4. For y²=x³−x and r=5, restriction to ℚ(i) preserves two CM lines (diagonal algebra dimension 2); conjugation over ℚ swaps them. | Pass; base field cannot be enlarged silently. |
| Semisimplicity in scalar-commutant argument | Upper-triangular 2×2 algebra over ℚ | Dimension 3, commutant scalars of dimension 1, yet an invariant line remains. Semisimplicity excludes this countermodel; the full semisimple action spans dimension 4. | Pass; Faltings hypothesis not omitted. |
| Rational Tate surjectivity | [5]:E→E at r=5; E×E→E | Rational matrices 5I₂ and [I₂ 0] have rank 2. Integral 5I₂ has cokernel (ℤ/5)² of size 25; rationalization removes it. | Pass; disconnected kernel allowed. |
| Rational Tate zero-dimensional boundary | A→0 and identity on E | Target dimensions 0 and 2; ranks 0 and 2 give surjectivity in both cases. Zero E→E has rank 0<2 and fails the morphism hypothesis. | Pass. |
| Exhaustive Γ₀ decomposition | N′=1,22, with supplied cusp dimensions | Empty product dimension 0=dim J₀(1); two level-11 copies at 22 have dimension 2=dim J₀(22) and Tate dimension 4. One copy would give 1 and 2. | Pass; wrong supplier locator R01. |
| Divisor multiplicity including q dividing M | N′=Mq² | d(N′/M)=d(q²)=3, with indices 1,q,q²; this is 3 both when q divides M and when it does not. | Pass; not just two degeneracy maps. |
| Quotient-to-newform converse | J₀(22)→11a1 | Source Tate dimension 4, target 2; some old factor maps nontrivially, giving primitive level 11 dividing 22. Equality of geometric and primitive levels is not asserted. | Pass. |
| Constituent/coefficient embedding step | Level 23, K_f=ℚ(√5) | Rational Tate dimension 4=2×2; two algebraic-closure constituents of dimension 2; conjugate a₂ values (−1±√5)/2. A rational elliptic quotient would force rational coefficients, which these fail. | Pass; cannot identify whole four-dimensional module with E. |
| Three modularity formulations | 11a1; geometric level 22 | Attached primitive level 11, quotient at 11, nonconstant parametrisation at 11; level-22 quotient is also allowed and recovers level 11. | Pass; no forced equality at arbitrary geometric level. |
| All-prime residual modularity after attachment | 11a1 p=2,3,5 | At p=5 reduction can be reducible (1⊕χ̄₅), yet attachment remains; p=2,3 need no outside-Σ hypothesis at this stage. At p=3/Frob2 the compared polynomial is X²+2X+2. | Pass; existence and conditional comparison are separate. |
| Unconditional modularity, Lean 142 | 11a1 and CM curve y²=x³−x | Primitive levels 11 and 32; first coefficients 1 and 1. CM not discarded, additive conductor 32 retained. | Pass on standard named newform inputs. |
| Elliptic coefficient majorant | 11a1 n=1,4,121; 32a2 n=4 | Absolute coefficients 1,2,1,0 versus d(n)√n values 1,6,33,6. | Pass. |
| Summability, Lean 124 | s=7/4; boundary s=3/2 | σ−1/2=5/4>1 in first case; at boundary it is 1, so the majorant argument gives no convergence. For n=4, convolution √· with itself is 2+2+2=6. | Pass; ownership R04. |
| Number-field overlap / repaired generality | K=ℚ and K=ℚ(√17), base change of 11a1 | At ℚ, both proposed summability statements coincide; at split norm 2 the quadratic-field coefficient is −4 versus −2 over ℚ. | R04; use norm fibres for general field. |
| Conditional entire completion, Lean 132 | s=2 and central s=1 | At 2, completion multiplier is N/(4π²), since Γ(2)=1. At 1 the equation with w=−1 gives Λ(1)=−Λ(1), hence 0; w=1 imposes no vanishing. | Pass; literal series equality only in stated half-plane. |
| Fricke/functional-equation sign | Weight 2, Fricke eigenvalues ±1 | i²=−1, so Fricke +1 gives root number −1 and Fricke −1 gives +1. | Pass; agrees with ModularForms Layer 7 convention. |
| Unconditional completion, Lean 149 | 11a1,37a1 standard signs | Signs +1,−1; the second forces Λ(1)=0 while the first does not. Same N is used for attached form and multiplier; negative or zero N excluded. | Pass. |
| Real-multiplication boundary | Degree-one and degree-two coefficient fields | Dimensions [K:ℚ]=1 and 2; elliptic Tate dimension 2 versus abelian-surface dimension 4. The second is explicitly outside this roadmap's elliptic target. | Pass; no missing elliptic hypothesis hidden here. |
| Supplier repair R01 | Oldform and composite headings | Existing section numbers 16.6 and 16.7; alleged 16.8 has zero occurrences as a section. Level-22 multiplicity is 2. | Correct citations. |
| Supplier repair R02 | Residual predicate and weight headings | Existing §7.5 and §4.9; alleged R15.5A.2 section and old predicate anchor absent. Residual trace/determinant remain 3,2 in order-5 control. | Correct citations. |
| Gate and acceptance-form findings R05–R09 | Literal locators, tags, headings, names | Table printed page 93≠91; 3 raw tags; 6 malformed layer delimiters; 18 declarations in wrong namespace; 3 illustrated own names absent. | Apply reported form repairs. |

**Source sample and legal-text checks.** The eight seeded draws contain the label R29.1 twice; both refer to the same layer, which was read in full. There are no additional locator claims marked unverified in the README. Sources below were obtained through the sources service; source IDs and extraction line numbers identify the passages without copying them. This review changes no source manifest.

| Sample / source | Exact text opened and hypotheses checked | Outcome |
| --- | --- | --- |
| Hauptmodul relations — `barrios` | Theorem 2.3 and Table 1, printed p. 6, lines 250–259. Characteristic zero, cyclic n-isogeny, genus-zero X₀(n); use n=3,5 and the dual isogeny when selecting the table's second j-map. | Supports both necessary relations, including special j. The nonzero affine parameters exclude cusps. |
| 15-isogeny boundary — `ddt`, `gjlario` | DDT §3.6, Theorem 3.48/proof, p. 102, lines 3769–3780; supplementary §19.1, p. 93, lines 2890–2920. | Four noncuspidal rational points and displayed j-values support the claim; local 5-adic exclusion follows from the recomputed valuations. R05 fixes locator/access. |
| R29.1, both draws — `serre` | §4.6, Theorem 4 and Lemma 5, p. 207, lines 1255–1277; norm/finiteness passage p. 208, lines 1292–1307. | Finiteness, residual irreducibility and conductor criterion agree. Theorem 4's original modularity input is conjectural; the README explicitly replaces it by ClassicalSerreModularity. |
| R29.1 local formula — `ddt` | §2.4, Propositions 2.12–2.13, pp. 57–58, lines 2151–2180. | Multiplicative conductor drop depends on divisibility of v(Δ); small residual characteristics require the stated exclusions. |
| Curve-level residual attachment — `serre`, `deligneserre` | Serre §3.3 p. 198, line 858 onward, and §4.6 p. 207; Deligne–Serre Lemma 6.11 p. 522, lines 574–583. Exact modern predicate read in weight supplier §7.5. | Classical text motivates congruences; shared finite-field predicate owns the definition. Eigenvalue lifting does not lift a prescribed eigenvector. R02 concerns the citation, not a failure of this distinction. |
| Finite-flat weight two — `serre` | Proposition 4, §2.8 pp. 189–190, lines 479–486; elliptic Proposition 5, §2.9, line 568 onward. | Finite flatness plus cyclotomic determinant is retained; determinant congruence alone does not select weight 2. |
| Conductor specialization/comparison — `serre1970`, `brumerkramer`, `carayol` | Serre §2.4, pp. 9–10, lines 255–278; Brumer–Kramer §6, (6.1), p. 243, lines 550–559; Carayol Theorem A/§0.8 Corollaire pp. 410–411, lines 85–110. | Arithmetic conductor, tame plus Swan exponent, and full local comparison support the statement; auxiliary coefficient prime differs from the place being compared. Varying it covers every place. |
| Exhaustive Γ₀ decomposition — `cremona`, `ribetstein`, `milne` | Cremona §2.7 and Lemma 2.7.1, p. 26, lines 1294–1318; Ribet–Stein §3.6 p. 40, line 1820 onward, and Conrad Appendix Theorem 5.14 p. 73, lines 3172–3185; Milne 2022 Proposition 12.1 p. 19, lines 755–766. | Divisor multiplicities, dimension [K_f:ℚ], rank-two coefficient-field Tate factors and Poincaré complements support the assembly. They must be combined with the actual Γ₀ supplier; source alone is not an ownership contract. |
| Elliptic coefficient summability — `cremona` and pinned Hasse theorem | Cremona §2.6, (2.6.1)–(2.6.2), p. 25, lines 1233–1243; native Hasse bound and Mathlib convolution. | Recurrence and d(n)√n proof give strict half-plane >3/2 independently of modularity. Silverman's cited text is uncertified as recorded below. |
| Global theorem input — `kw` | Theorems 1.2 and 9.1, author pp. 2–3 and 18–19, lines 76–90 and 782–843, including hypothesis (H) and its modularity-lifting role. | The README names the lifting input and imports the unconditional modern supplier; it does not treat Serre 1987 as an unconditional proof. |
| Faltings inputs — `faltings` | §5, Satz 3–4 p. 360, lines 469–472; Korollar 1–2 p. 361, lines 499–514. | Semisimplicity, End/Hom comparison and isogeny criteria have number-field hypotheses; this roadmap uses them over ℚ. |

Thirteen distinct works were readable: `barrios`, `ddt`, `gjlario`, `serre`, `deligneserre`, `serre1970`, `brumerkramer`, `carayol`, `cremona`, `ribetstein`, `milne`, `kw`, and `faltings`. The supplementary table's factored j-values were checked against the README's expanded fractions, not treated as a list of CM curves. The two initially failed DDT/Faltings URLs were resolved by legal academic copies; they are not pending missing-text requests.

**Pinned declarations opened.** The following 23 entries record the library interfaces inspected. File names below are relative to their respective library repositories. These are existing inputs, not proposed reimplementations.

| Library / file and line | Declaration or native fact inspected; practical limit |
| --- | --- |
| Mathlib `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366`, 388 | `IsElliptic` is invertibility of Δ; `j` is the native quotient c₄³/Δ. A totalized j value alone does not impose nonsingularity. |
| Mathlib `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:299` | Native minimal model used by the two local predicates. |
| Mathlib `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43`, 79 | Four-branch `localPolynomial` and Euler-product `LFunction`, with native L-series directly following it. General residue cardinality is a natural cardinal; the rational p-adic instances here have finite residue fields. |
| Mathlib `Mathlib/NumberTheory/ModularForms/Basic.lean:80` | `CuspForm` includes holomorphy and vanishing at the cusps, not normalization or newness. |
| Mathlib `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:62` | `IsPrimitiveRoot` requires the power-one law and divisibility of every exponent yielding 1; exact order is not merely a power-one equation. |
| Mathlib `Mathlib/Data/Nat/Totient.lean:37`, 111 | `Nat.totient` and `ZMod.card_units_eq_totient`; the latter needs a nonzero modulus. Positive levels supply it. |
| Mathlib `Mathlib/Data/Fintype/Pigeonhole.lean:86` | `Finite.exists_infinite_fiber`, requiring an infinite source and finite target. |
| Mathlib `Mathlib/NumberTheory/NumberField/Basic.lean:101` | `NumberField.RingOfIntegers` is the integral closure of ℤ; the finite number-field hypothesis supplies the finite integral structure used by the norm argument. |
| Mathlib `Mathlib/RingTheory/Norm/Basic.lean:93` | `Algebra.norm_eq_zero_iff`, with finite free algebra/domain hypotheses; not a theorem for arbitrary quotient rings. |
| Mathlib `Mathlib/Algebra/Order/Group/Unbundled/Int.lean:83` | `Int.eq_zero_of_abs_lt_dvd`; strict size and divisibility give the final integer contradiction. |
| Mathlib `Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean:109`, 144, 155, 181, 193 | Prime correspondence, `adicCompletion.padicEquiv`, integer-ring equivalence and inclusion/inverse compatibility; these identify the native local factors. |
| Mathlib `Mathlib/NumberTheory/LSeries/Convolution.lean:61`, 81, 163 | Native convolution, divisor formula and `LSeriesSummable.convolution`; both factors must already be summable. |
| Mathlib `Mathlib/NumberTheory/LSeries/Deriv.lean:160` | `LSeries_analyticOnNhd` on the appropriate convergence half-plane. |
| Tau Ceti `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` and `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83` | Native abelian variety and its additive/multiplicative endomorphism ring; dimension one is explicit in Lean 84. |
| Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:47`, 64 | `pointGaloisAction` and `torsionGaloisAction`; no new action carrier needed. |
| Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71`, 131 | Native integral representation and continuity theorem. |
| Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean:73` | `nonempty_linearEquiv_tateModule`; separably closed field and nonzero prime hypotheses retained. |
| Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52` | Cyclotomic determinant; no arbitrary rank-two representation substituted. |
| Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:65` | `WeierstrassCurve.hasse_bound` over a finite field for a nonsingular curve. |
| Tau Ceti `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | `HeckeRing.GL2.Newform` has normalization, newness and good Hecke eigenform structure; bad-operator eigenstructure is supplied separately. |
| Tau Ceti `TauCeti/NumberTheory/ModularForms/Newforms/FullEigenform.lean:126`, 131, 135 | Full eigenform adapter with unchanged cusp form and character. |
| Tau Ceti `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:120` | Fixed-level, fixed-character `eq_of_forall_notMem_eigenvalue_eq`; it does not replace the cross-level prime-index theorem. |
| Tau Ceti `TauCeti/NumberTheory/ModularForms/Newforms/OrthogonalBasis.lean:260`, 271 | `Newform.basis` and `Finite (Newform N k)`, which justify finite witness range. |

**Citation-scanner leads.** All seven leads were resolved by reading: three names (`IsNewformOf.coeff_int`, `IsNewformOf.localPolynomial_eq`, `IsNewformOf.exists_entire_completed_LSeries`) are declared here at Lean lines 97, 104 and 132; `ContinuousRep.IsAbsolutelyIrreducible` is a planned input in ArithmeticGaloisRepresentations §1.7 (README line 1110); `TauCeti.ResidualModularity.ArisesFrom` is not an existing declaration there: the mathematical predicate is planned in the weight supplier’s §7.5, while its acceptance file states `ResidualModularity.residual_attachment` in the roadmap namespace. R02 requires citing the planned interface accurately. The two `ArisesFrom.of_*` names are this roadmap's prospective targets, covered by R09, not missing pinned library theorems. The scanner's zero unresolved roadmap names does not validate the stale section numbers in R01/R02.

**Ownership and supplier resolution.** The supplier service returns a provenance header before each file; all supplier line numbers here exclude that header. The new-roadmap heads read were ModularCurvesPartII `82d96e2`, AlgebraicModularFormsAndSerreWeights `7e28cb1`, ArithmeticGaloisRepresentations `2194655`, NeronModelsAndSemistableAbelianVarieties `8986e52`, FiniteFlatGroupsAndIntegralPadicHodgeTheory `b4c015e`, ClassicalSerreModularity `6c79d1c`, SerreWeightAndLevelOptimisation `5999164`, AutomorphicGaloisRepresentations `d72821d`, FaltingsFinitenessAndIsogenyTheorems `b83ebd4`, and AbelianSchemesAndArithmeticModuli `e77dd51`. These are new folders, eligible earlier suppliers, rather than revisions used in place of main. Main supplied the existing EllipticCurves, ModularForms, AlgebraicCurves, JacobianChallenge and semisimple-algebra roadmaps. Object-based searches used the roadmap service against main and the supplied open heads, together with the board packages and pinned source trees. They included native Tate actions, endomorphisms, rational Tate surjectivity, modular-quotient decomposition, rational cyclic subgroups, Hauptmodul relations, the four j-values and elliptic L-series summability. No duplicate fully qualified Lean name was found for this file. The identified construction overlap is R04. EllipticCurveModularityPartII treats further isogeny classifications; EllipticCurveModularityWild3Adic explicitly retains this roadmap's ownership of modularity and supplies a different wild-descent route. Neither supplies a permissible upward prerequisite for this roadmap. The general Γ₀ factor assembly and rational surjectivity deductions are owned here; their constituent geometry and additive Tate functor are already supplied below.

| Resolved supplier (14 families) | Content read and location in `TauCetiRoadmap/<supplier>/README.md` |
| --- | --- |
| EllipticCurves | Layers 1–4: isogenies/differentials, torsion, Hasse/local reduction/Tate curve; Layer 6 descent supplies the small rational-point calculation's background. Modularity remains outside these layers. |
| ModularForms | Layer 4 (line 532) newforms/finite range; Layer 5 (657) cross-level uniqueness; Layer 7 (708) analytic continuation; Layer 8G (935) Galois conjugation; Layer 10 dimension formulas. The stronger cross-level theorem is explicitly a target there. |
| ArithmeticGaloisRepresentations | §1.7 (1110) oddness/absolute-irreducibility interface; Layer 3 conductor; §5.3 (3193) semisimple recognition; §§6.1–6.3 (3631 onward) native elliptic residual/Tate representations, determinants and local comparison. |
| NeronModelsAndSemistableAbelianVarieties | §5.3a (3312) conductor; §§5.3g–i (3471,3495,3516) residual and full Euler comparisons; §§6.5–6.6 (3992,4020) equation/scheme reduction. Wild terms at 2 and 3 retained. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | §R07.6.1 (8299): torsion of good-reduction abelian schemes, finite locally free rank p² for elliptic p-torsion. |
| AlgebraicModularFormsAndSerreWeights | §§4.9,5.10,6.1–6.2,7.5 (1112,1296,1383,1418,1585). Mathematical inputs exist; stale numbering/anchor is R02. |
| ClassicalSerreModularity | §R27.6 (850), especially finite-flat weight-two export (871): continuous odd absolutely irreducible, cyclotomic determinant, p≥5, exact residual conductor and trivial character. |
| SerreWeightAndLevelOptimisation | §4.8 (1161): finite-flat weight-two optimization for an already modular residual representation, distinct from unconditional witness existence. |
| AutomorphicGaloisRepresentations | §1.5 (1134), §§6.1–6.2 (2480,2496), §6.4: coefficient-field Tate realization, semisimple residual comparison and full conductor/local factors with coefficient-prime restrictions. |
| FaltingsFinitenessAndIsogenyTheorems | §§R28.4.5–7 (1870,1898,1921), §§R28.6.1–6, including finite isogeny class (2766) and cyclic Hom under End=ℤ (2787). |
| ModularCurvesPartII | §§3.9 (1150),5.6 (1737),7.1–7.4 (2243–2342),16.2–16.7 (4119–4219),17.3 (4291). Rational level structures, isogeny dictionary, differentials, quotients and cusp map exist; R01 fixes the mismatched numbered imports. |
| AbelianSchemesAndArithmeticModuli | A4.1 (1821) additive Tate functor; A6.5 (2904) Poincaré complement, over the original field. Rational surjectivity here is deduced from them, not assumed from a missing exactness theorem. |
| RepresentationTheory/SemisimpleAlgebras | Layer 3 (233): density over the endomorphism division ring with finite-dimensional/faithful hypotheses. Used after Faltings semisimplicity, not as a scalar-commutant-only argument. |
| AlgebraicCurves; JacobianChallenge | AlgebraicCurves Layers 6 (653) and 12 (1085) supply curve/function-field degree; JacobianChallenge Layer F (448) the Abel–Jacobi universal property. |

The dependency scan does not treat the stated downstream consumers as inputs. No movement of a mathematical target has been performed in this read-only review; R04 describes the ownership move needed to avoid a future cycle. R01/R02 are repaired by existing earlier suppliers and need no undeclared gap.

## Not verifiable

- **Silverman, The Arithmetic of Elliptic Curves, second edition** (2009; DOI 10.1007/978-0-387-09494-6), including III.4–5, III.9, V.1.1 and the local-reduction references. The sources service reached the publisher's paywalled record and classified it uncertified. No text was obtained or bypass attempted. The endomorphism and reduction computations were checked independently, and the pinned Hasse declaration was opened; these do not certify the book's precise numbering or wording.
- **Miyake, Modular Forms**, Theorem 4.6.19 (DOI 10.1007/3-540-29593-3). The service classified the publisher record uncertified. The exact newform–newform contract was checked in ModularForms Layer 5, including its distinction from the pinned fixed-level theorem; the book's own statement was not read.
- The finite tests above do not prove the universal theorems. In particular, the optimal parametrisation degrees and named low-level cusp-space/newform data are explicit supplied inputs in the corresponding table rows, not newly proved classification results. No acceptance is inferred from a `sorry` build.

There is no outstanding legal-text request: the inaccessible books remain uncertified, and alternate legal copies resolved the initially missing DDT and Faltings links. This review is complete with those source limitations recorded.

## Source issues

- **Error** in gjlario at §19.1, printed p. 93 (`gjlario` line 2902): the source says the four noncuspidal rational points of X₀(15) are CM points; it should be non-CM points, since their rational j-invariants are nonintegral whereas CM j-invariants are algebraic integers; affects nothing.
- **Misprint** in gjlario at §19.1, signatures table, printed p. 93 (`gjlario` line 2916): the source says the third curve column is E₇; it should be E₅, matching the graph and model immediately above; affects nothing.
- **Misprint** in cremona at §2.7, paragraph after Lemma 2.7.1, printed p. 26 (`cremona` line 1317): the source says all oldclass members in case (1) have the same W_q eigenvalue; it should be W_l, as the preceding formula and following parenthesis specify; affects nothing.
