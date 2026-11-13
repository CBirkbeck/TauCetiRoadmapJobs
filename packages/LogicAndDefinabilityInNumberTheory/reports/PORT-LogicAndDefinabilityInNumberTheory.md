# PORT-LogicAndDefinabilityInNumberTheory

- **Branch:** `roadmap/logic-and-definability-in-number-theory`, created from main at `45f58db`.
- **Head commit:** `a5468073` "LogicAndDefinabilityInNumberTheory: roadmap (README, Suggested.lean, metadata)". It touches only `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/{README.md,Suggested.lean,metadata.toml}` (3 files, 2148 insertions).
- **Build:** `lake build TauCetiRoadmap.LogicAndDefinabilityInNumberTheory.Suggested` printed `Build completed successfully (18248 jobs).` There are 12 warnings, all `declaration uses `sorry`` (one per headline theorem), and no other warning.
- **Gate:** `gate LogicAndDefinabilityInNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (run as prescribed, after the last edit):

```
depcheck: 223 roadmaps, 1981 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.
- **Citations:** `roadmaps resolve` on the committed README found no cross-roadmap citation and no Lean name that exists nowhere. Separately, I checked all 35 links to other roadmap READMEs, and their 29 heading anchors, against the current headings: on main for main roadmaps, at the open heads for the others. All of them resolve. The unlinked section citations also exist where they are cited: ReductiveGroupsPartII RG2.3.7; Chebotarev Layer 14; ClassFieldTheory Layers 5 and 10–13; GlobalQuadraticForms §§4.2, 4.3, 5.5 and 6.1 and its section and name map; AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15 and B2.18; AdelicAlgebraicGroups §2.4 with both named items.

## Package source

The board checkout's `packages/LogicAndDefinabilityInNumberTheory/` contains only `sources.toml` and the review reports. There is no `README.md`, `Suggested.lean`, `metadata.toml` or `review.json`. Following the board's package index, I read the package at the head of its board pull request, `5082d6d`. That head is the FIX ~11 commit. The last review, `REV-PKG-LogicAndDefinabilityInNumberTheory~10` at `475c9e3`, returned needs_changes with two P3 findings and nothing blocking. FIX ~11 applied both, and I confirmed both repairs are in the ported text:

- the supplier contract names `TauCeti.finite_setOf_absMulHeight₁_le`;
- the §6.1 citation of van den Dries–Miller reads "§2, pp.7–9 (revised author copy)".

No `review.json` exists. I kept the decisions of the review series: the Layer 7 hypotheses, the Shimura, abelian and stratified ownership split, and the declared gap `neron-pairing-perfect-finite-residue`. I applied its non-blocking notes as they appear at `5082d6d`.

## Draft pull request body

This roadmap builds the logical and definability tools that turn arithmetic descriptions into transferable statements, integrals and counting estimates. It starts from Mathlib's first-order semantics, valuation rings, polynomial functions and computability, and builds:

- interpretations on definable quotients;
- the Denef–Pas language with relative elimination, Ax–Kochen–Ershov transfer and the Ax–Kochen theorem for ring sentences;
- p-adic and motivic integration, through Igusa–Denef rationality, Cluckers–Loeser pushforwards, specialization and transfer, gauge measures and Néron point counts;
- the full Matiyasevich–Robinson–Davis–Putnam theorem with Hilbert's tenth problem over ℤ;
- Koenigsmann's universal definition of ℤ in ℚ with its one- and two-universal-variable forms, and Colliot-Thélène–Van Geel's Diophantine nonpowers over number fields;
- in o-minimal geometry: connected components, definable paths, definable Remmert–Stein and Chow for singular quasi-projective varieties, and the Pila–Wilkie and bounded-degree counting theorems, which it derives from the supplied semirational block theorem.

It ends with the Pila–Zannier reductions of André–Oort for A_g, of André's CM-pair theorem and of the mixed André–Oort conjecture, each stated with its functional-transcendence and Galois-orbit inputs as named hypotheses. Tau Ceti wants one owner for these transfer, integration, Diophantine and counting interfaces: arithmetic statistics, local densities, unlikely intersections and Shimura-variety arguments all consume them. General o-minimal theory and R_an,exp stay with ShimuraVarieties, and block counting stays with AbelianSchemesAndArithmeticModuliPartII.

## Roadmaps this one depends on that are still pull requests

Suppliers named in the supplier contracts and *Needs:* lines, all earlier in the merge order:

- ShimuraVarieties (§§3.4b–3.4e, 3.5a, 3.5d, 3.6)
- AbelianSchemesAndArithmeticModuliPartII (B2.6, B2.7, B2.14, B2.15, B2.18)
- AdelicAlgebraicGroups (§2.4)
- NeronModelsAndSemistableAbelianVarieties (§§2.5, 4.6)
- MotivesAndAlgebraicCycles (§4.20)
- HeightsRationalPointsAndObstructions (§§2.16b, 2.17, 2.20, 2.21)
- WeilConjectures (§5.29)

Named only in Scope and ownership, as owners of neighbouring material that is not consumed:

- StratifiedSpacesAndTameTopology (§§4.1, 7.1)
- ComplexComparisonPartII (Layer C4)

Every other supplier is on main: SchemeAndStackFoundations, ReductiveGroupsPartII, QuadraticFormInvariants, GlobalQuadraticForms, DiophantineApproximationAndTranscendence, DifferentialGeometry, ResolutionOfSingularitiesCharacteristicZero, ClassFieldTheory, and the completed Chebotarev and RealAlgebraicGeometry.

No cited id is changed by an open revision. The overlaps tool does not know this roadmap, because it is neither on main nor in a roadmap pull request. TopologicalMirrorSymmetryForHitchinSystems, a later open roadmap, cites §§2.5, 2.7–2.9, 2.11 and 2.12; none of them was renumbered.

## What moved from the Lean to the README

Nothing moved. The package's `Suggested.lean` already met the acceptance-test rules: twelve headline theorems, no sorry'd data, no padding, no `set_option`, and a docstring naming each headline that is not statable and the carrier it lacks. I did not move any headline out of it. I added none either: every other result I considered needs a carrier that is absent at the pins, or is a basic lemma rather than a headline. For example, non-model-completeness of Th(ℚ) is a corollary in Koenigsmann's outlook section and not one of this roadmap's end theorems.

Lean changes:

- **Supplier repair:** `rationalIntegers` is deleted. Its body `{x | ∃ z : ℤ, (z : ℚ) = x}` is Mathlib's `Set.range ((↑) : ℤ → ℚ)`, which the four statements now use directly.
- **Supplier repair:** `rationalTupleHeight` is deleted. It was the coordinatewise maximum of max(|num|, den), which is Mathlib's `Height.mulHeight₁` on ℚ (`Rat.mulHeight₁_eq_max`). `pila_wilkie` now bounds `∀ i, Height.mulHeight₁ (x i) ≤ T`. For T ≥ 1 this defines the same set, including n = 0.
- **Header:** `module`, `public import` and `@[expose] public section`, as on main. Without it, Lake printed a second, non-`sorry` warning ("imports `Mathlib` … designed for use with the module system"). The import lines are still exactly Mathlib and `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic`, which exists at the pin.
- **Docstrings:** `universal_integers` now cites Koenigsmann Theorem 1, p.74, and Proposition 18, p.86 (checked in the version of record). `pila_wilkie` now describes the height through `Height.mulHeight₁`.

**Signature check.** I appended `#check @name` for all 16 declarations and 43 library names the README cites to a copy of the file, elaborated it once in a build, and then restored the clean file. Every elaborated type matches its README statement. The file has no `variable` block, so no binder is lost. The only changes are the two replacements above. All 43 library names elaborate at Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, including `Rat.mulHeight₁_eq_max`, `FirstOrder.Ring.compatibleRingOfRing`, `FirstOrder.Language.presburger.mul_not_definable`, `MvPolynomial.funext_set` (needs `IsDomain`) and `Poly.induction` (cases proj, const, −, ·). I grepped the ten Tau Ceti names the README cites at the pin, with their namespaces: `TauCeti.isSemialgebraic_iff_definable_real`, `TauCeti.semialgebraicDim`, `TauCeti.HasSemialgebraicProjections`, `TauCeti.IsSemialgebraic`, `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds`, `TauCeti.finite_setOf_absMulHeight₁_le`, `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite` and the three `Algebra.GrothendieckAddGroup` names.

## Supplier replacements and duplication removals

1. **Lean:** the two deletions above. The README follows them: §4.17, Conventions, §6.12 (which now states that no tuple-height definition is introduced) and §6.14.
2. **R_an,exp:** ShimuraVarieties §3.5a, at its head, constructs the language and structure of R_an,exp on ℝ (polynomial maps, restricted analytic functions on the closed cube, the exponential, strict order) together with the finite-atlas and overlap calculus in that structure. The package's §6.2 built that language a second time. §6.2 now takes R_an,exp from §3.5a and defines R_alg, R_an and R_exp as reducts to sublanguages. It keeps the globally subanalytic description of R_an, which no other roadmap owns: RealAnalyticGeometry on main excludes subanalytic sets, and StratifiedSpacesAndTameTopology lists them as out of scope. Its API bullet and the cube Check were rewritten to match. §6.6 now says in one clause that it generalizes §3.5a's atlas calculus to an arbitrary o-minimal expansion and to corners. Both sections add §3.5a to their *Needs:* lines. The Scope entry for ShimuraVarieties records the split.
3. **Scope:** a new entry says that ComplexComparisonPartII Layer C4 owns the classical Remmert–Stein extension and Chow theorems, and that §§6.8–6.9 are the definable forms. That roadmap puts definable Chow outside its own scope.

Sweep by object, using `roadmaps grep` and `roadmaps show` against main and all 449 open roadmap pull requests in the index of 2026-11-13. No other owner was found for:

- MRDP, Hilbert's tenth problem and Diophantine sets: only bibliography hits.
- Denef–Pas, angular components, Ax–Kochen, Presburger and Macintyre cells: the "angular component" hits elsewhere are unrelated.
- Cluckers–Loeser motivic integration and Igusa zeta functions: the Igusa hits are Igusa varieties.
- Koenigsmann's ℤ in ℚ, and normic bundles.
- Gauge-form measures beyond AdelicAlgebraicGroups §2.4: AlgebraicModuliForArithmeticGeometry cites Groechenig–Wyss–Ziegler only for gerbes.
- Pila–Wilkie, which appears elsewhere only in AbelianSchemesAndArithmeticModuliPartII, its declared block owner.
- André–Oort: ComplexMultiplicationAndExplicitReciprocityPartII excludes it; ArithmeticDynamics has only the dynamical analogue.
- General model completeness: K3BlochGroups proves real-closed-field quantifier elimination and model completeness for that one theory and defines no general predicate.
- Definable components, paths and fibre bounds: not in StratifiedSpacesAndTameTopology or ShimuraVarieties. §3.4c proves only that cells are definably connected.

## Fixes from reading the README as an upstream reviewer

1. The Chebotarev supplier contract said "Section 4.30 applies this to the auxiliary cyclic extensions". §4.30 does not use Chebotarev; §4.29(d) chooses the auxiliary primes a, b with it. The contract now says so.
2. Four sentences read as process narrative or deferral and were made definite:
   - "The missing work here is …" now says which sections build the material (§§4.1–4.15).
   - "… must still be proved here" now names the targets (§§0.1–0.2, §4.31).
   - "Computable encodings and the MRDP simulation remain separate work" now reads "are §§4.10–4.15".
   - "removed set" now reads "exceptional analytic set".
3. I checked one attribution and kept it. "Koenigsmann's explicit polynomial" of §4.33 is right: on p.75 Koenigsmann modifies Poonen's ∀²∃⁷ definition to bring the degree from 9244 down to 8, and the displayed formula on p.79 matches `twoUniversalIntegerPolynomial` term by term.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `ax_kochen_ring` | φ = ∃x, x²+1=0 at p=2, 3, 5; φ = ⊥ | ℚ₂: −1≡7 mod 8, unit squares ≡1, false; 𝔽₂((t)): x=1, true; p=3: (−1/3)=−1, both false; p=5: 2²=4≡−1, both true; ⊥ false in both | N≥2 forced at p=2; eventual statement holds | none |
| §1.5 Check, O=ℤ[i] | completions at 2±i over 5; p=13 | i≡2 mod (2−i), i≡−2≡3 mod (2+i); 1+ι = 3 (nonsquare mod 5), 4=2²; p=13: ι=±5, 1+ι ∈ {6, 9}, squares {1,3,4,9,10,12} | field isomorphism of residue fields is not enough; O-algebra condition needed | none |
| §1.2 angular component | π′=επ; x=π; x=t³(2+t) | ac′(x)=res(ε)^(−ord x)·ac(x); ac′(π)=res(ε)⁻¹; ac=2, ord=3, factor res(ε)⁻³ | as stated | none |
| `igusa_poincare_rationality` | n=0; m=0 with f=c, v(c)=k; f=0 | m⁰=⊤, O/⊤ has one point, count 1; N_n=1 for n≤k and 0 after (a polynomial); f=0: ∑ q^(mn)Tⁿ = 1/(1−q^m T); kernel (p^k) of ℤ_p→O impossible under CharZero | rational in every case; O is a ring of integers | none |
| §2.6 TZ=1+(T−1)A | f=0; f=1; f=x at q=2 | 0 = 1−1; T = 1+(T−1); (1/2)T/(1−T/2) on both sides | holds | none |
| §2.5 Checks | x=πu, q=3; diag(π,π²); s(a²+tb²)=b²+ta² on 𝔽₂((t)) | 1/3 (inverse gives 3); 1/27; s∘s=id, s(O)=O; quotients t along t^(2n), t⁻¹ along t^(2n+1) | holds; s is nowhere differentiable | none |
| §2.10 Checks | Φ=ℤ/3 with σ=−1; S₃ on 𝔽₃³/diag; Tate curve | Φ^G=ker 2=0, (σ−1)Φ=Φ, quotient 0; M^G=0 (a transposition forces equal coordinates), (M*)^G={(x,x,x)}, order 3; n(q−1) on both sides | cyclicity needed; holds | none |
| §5.4 product map | general q; q=2 | q²(1−q⁻¹)²(1/(1−q⁻¹)²−1) = q²−(q−1)² = 2q−1; q=2: 3 = #{(0,0),(0,1),(1,0)} | holds | none |
| §§3.3–3.4 | L−2 at q=3/2; 1−L⁻¹ at q=1; even ray | −1/2; 0 (q=1 excluded); ∑ q^(−2n) = (1−q⁻²)⁻¹ | holds | none |
| §§4.1, 4.5, 4.8 | X₀−2X₁ at (1,3); swap at (2,5); X(X−1) at 2; u−v−1 collapsed | −5; 3 on both sides; 2; root (1,0), collapsed value −1 | holds | none |
| `Set.range ((↑) : ℤ → ℚ)` in four headlines | t = 0, −7, 1/2 | 0=↑0 and −7=↑(−7) are members; 1/2 is not | same set as the deleted definition | replacement |
| §4.24 R̃ | x=0; x=1/3 with S={3} | ¬∃y, 0·y=1, so 0∈R̃; x⁻¹=3∈3ℤ_(3)=Jac(R), so 1/3∉R̃, matching 1/3∉ℤ_(3) | R̃ = ⋃ℤ_(ℓ) | none |
| `forall_exists_rational_undecidable` route | integer root of P; P(a,z)=2; z_i=1/2 | product (−1)·∏g≠0, never 0; w=1/2; some u gives g(1/2,u)=0 | the ∀∃ family defines the complement | none |
| `two_universal_integer_formula` | a=−1; a=0; comparison with Koenigsmann p.79; degree | u=(1,0,0,0) makes a+A=0; u=0; both quadratic norms agree term by term; a²b²u₃⁸ has coefficient 1 (degree 12), existential degree 8 | holds | none |
| §4.21 Checks | R³₃, R³₅, R⁷₇, R¹₁,₃ | Δ(−1,−3)={3,∞}, Δ(2,−3)={2,3} → ℤ_(3); Δ(−1,−5)={2,∞}, Δ(2,−5)={2,5} → ℤ_(2); Δ(−1,−7)={7,∞}, Δ(−2,7)={2,7} → ℤ_(7); (−2,3)₃=1, Δ=∅ → ℚ | holds | none |
| §4.20 dyadic row | (6,15) with (1,1,1) and (1,1,0) | −6−15+90=69≡5 mod 8; −21≡3 mod 8 | README right, source table misprinted | none |
| §4.26 Check | p=697 | 697=17·41, 697≡1 and 41≡1 mod 8; 1/17 ∈ ℤ_(41) | union, not intersection | none |
| `nonpowers_diophantine` | ℚ with r=2: −1, 4; r=3: 2, −8; x=0 | −1 is not a square, 4=2²; v₂(2)=1, −8=(−2)³; x≠0 conjunct | agrees with the Checks | none |
| `IsOMinimalExpansion` | ℤ, (0,1), ℚ, ∅; empty language | frontier ℤ (infinite), {0,1}, ℝ, ∅; order not definable | predicate rejects ℤ, ℚ and the empty language | none |
| §6.2 (changed) | R_alg reduct; BKT cube | polynomial maps with order define exactly the semialgebraic sets; e^x on [0,1] vs e^((y+1)/2) on [−1,1]: x=0 gives 1 and 1, x=1 gives e and e | the reducts are well defined; the cube conventions agree | R_an,exp taken from ShimuraVarieties §3.5a |
| §§6.4–6.5 Checks | {xy=1}; [0,∞); {\|x\|<1, x≠t}; sin(2πkx)>0 | 2 components; 1 component with 2 cells; 2 components for \|t\|<1, else 1; k intervals (j/k,(2j+1)/(2k)) | holds | none |
| `algebraicPart` | (0,1); {0}; n=0 with X={()} | (0,1); ∅; ∅ (subsets of a singleton are subsingletons) | holds | none |
| `pila_wilkie` (changed height) | (−3/4); (0); n=0 | mulHeight₁ = max(3,4) = 4; 1; the coordinate bound is vacuous and the old height of () was 1 ≤ T | same counted set for T≥1; count ≤1 ≤ C T^ε | height replaced |
| `bounded_degree_counting` | π; √2 with k=1, 2 at T=2 | H(π)=1 and `minpoly ℚ π`=0 of degree 0, excluded only by `IsAlgebraic`; H(√2)=√2, degree 2: admitted at k=2, excluded at k=1; 2⁻²·2 = 0.5 ≤ 2 ≤ 2√3 | holds | none |
| §6.17 | lifts ≥ cD^δ, blocks ≤ C′(CD^A)^ε | with Aε<δ the ratio grows like D^(δ−Aε) | some lift lies in a positive-dimensional block | none |
| §7.1 Check (g=1) | D=−3: (1,1,1); D=−4: (1,0,1); general reduced form | \|D\| ≥ 3a²; Re τ=−1/2 has height 2 ≤ 3; τ=i; H(Re τ) ≤ 2a ≤ \|D\| | k₁=2, a₁=1 suffice | none |
| §7.5 Check | j₁=1; diagonal | 1 is not among the 13 rational CM j-invariants; Φ₁=j₁−j₂ | holds | none |
| §2.4 negative control | φ=ab−c on F | constant c′ integrable on F iff c′=0; multiplication is not Presburger-definable (`mul_not_definable` on ℕ) | the integrability locus is not definable | none |
| Chebotarev contract | §4.29(d), §4.30 | §4.30 never invokes Chebotarev; §4.29(d) chooses a, b by it | wrong section number | fixed |

Context: `Suggested.lean` has no `variable` or `include` block. Every hypothesis is in its declaration's own signature, as the `#check` output confirms. Generality: README and Lean agree for §2.6 (every finite extension of ℚ_p, which is the same as a characteristic-zero DVR finite over ℤ_p), §4.30 (number field, r>1) and §§6.14 and 6.16 (any `IsOMinimalExpansion`, any definable family).

## Unresolved

- **Gap `neron-pairing-perfect-finite-residue`** is kept as the design declares it, in the form main already uses ("What X must provide (gap:…)", as in FlagVarieties). NeronModelsAndSemistableAbelianVarieties §4.6, at its head, still says "Perfectness beyond the semistable case is not asserted". §2.10(c), and so §2.11, rely on perfectness of Grothendieck's pairing over a finite residue field without semistability. Until that roadmap adds it, or this roadmap takes it as a target, this is the one gap.
- **Layer 7 hypotheses.** Layer 7 keeps its inputs as named hypotheses, as the review series decided. ShimuraVarieties §3.6 now owns an R_an,exp comparison for torsion-free arithmetic Hermitian quotients. That could later discharge (I-def) at a torsion-free level; I did not re-plan it.
- **Mathlib source links.** The References section cites Mathlib source files at commit `6b7abb3c` as sources. Every declaration the README uses was checked at the pin `1b1ccf4b`.
- **Topic.** `metadata.toml` keeps topic `math.NT`, as in the package. `math.LO` is arguable for a roadmap centred on MRDP, AKE and o-minimality.
- **Untrusted text.** Nothing in the reviews, fix reports, other roadmaps or fetched sources asked for any action outside this job. No passage was suspicious.


Pull request: #2276 (roadmap/logic-and-definability-in-number-theory at a546807)
