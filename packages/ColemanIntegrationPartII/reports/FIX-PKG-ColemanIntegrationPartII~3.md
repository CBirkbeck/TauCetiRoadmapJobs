# ColemanIntegrationPartII repair report

## F01 (P2) — applied

Unassigned formal residue and point-expansion prerequisites → explicit ownership and supplier contracts for AlgebraicCurves Layers 5/9 and FormalLaurentPuiseux L1–L3. Section 2.0 retains analytic finite-map and comparison adapters, using `annulusResidue_laurentSeries`. Sections 2.1–2.3 import formal calculus for the logarithmic extension and indices. Direct proper-residue consumers now name AlgebraicCurves. Mathematical generality and logarithmic/index targets are retained.

## F02 (P3) — applied

Generic characteristic-p warning → concrete ZMod 2 negative control in the README and two additional conjuncts in an existing proved Lean example. For F=(single 2 1,0), `differential F = 0`, but F differs from every scalar pair, detected by coefficient 2. The characteristic-zero theorem hypotheses and the two-example limit are unchanged.

## Verification evidence

| Finding | Evidence read | Conclusion |
| --- | --- | --- |
| F01: completion and geometric residue ownership | `TauCetiRoadmap/AlgebraicCurves/README.md`, Layer 5 completion milestone, lines 643–651; Layer 9 local expansions and comparison, lines 887–911 | General completions, point expansions, residue-field trace and the proper residue theorem have an existing owner. Characteristic zero supplies perfectness and separability for the consumed geometric theorem. |
| F01: formal calculus ownership | `TauCetiRoadmap/FormalLaurentPuiseux/README.md`, L1 substitutions; L2, lines 114–138; L3, lines 142–163 | Substitution, the chain rule, scalar kernel, integration by parts, residue transport and residue-zero primitives are imported. The logarithmic polynomial extension and indices remain additional constructions. |
| F01: analytic/formal residue comparison | ColemanIntegration L0.11, `annulusResidue_laurentSeries`, read at `acaaf506f3822fc5c8211345cb48f6b1cb00656c` | Agreement for convergent meromorphic germs with finitely many negative powers is supplied. The retained adapter connects geometric point charts to that theorem. |
| F01: logarithmic extension and index formulas | besser2017 line 402, Definition 3.1, p. 9; besser2017 line 421, Definition 3.2, p. 9; besser-dejeu2012 line 2232, §7, pp. 355–356; besser-dejeu2012 line 2529, Lemma 8.1, p. 361 | The new extension and index contracts remain supported. Formal substitutions and analytic finite maps keep distinct carriers and their positive-degree hypotheses. |
| F02: singleton differentiation | Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/RingTheory/LaurentSeries.lean:132`, `:150`, `:176`: `hasseDeriv_coeff`, `hasseDeriv_single`, `derivative` | Differentiating z² gives 2z, which is zero over ZMod 2. The proof unfolds the real `differential` body and computes with these identities. |
| F02: exclusion of scalars | Same Mathlib pin, `Mathlib/RingTheory/HahnSeries/Basic.lean:202`, `:206`: `coeff_single_same`, `coeff_single_of_ne` | Coefficient 2 of z² is 1; coefficient 2 of every scalar singleton is 0. Applying that coefficient to a supposed pair equality is a contradiction. |

The main-branch AlgebraicCurves, FormalLaurentPuiseux and JacobianChallenge roadmaps were read for ownership and shape. The open ErdosProgressionPowers head `42053a57c08415a9ec0808d442eb654702586215` and ArithmeticDynamics head `85e78c07dcc361ead6505c970a1181deee483819` were checked for overlap. ArithmeticDynamics §3.58 consumes the two EffectiveDiophantineMethods contracts already named in this package; neither sibling owns or supplies this local index theory. The oversized ArithmeticDynamics README was read from the locally available Git object at its verified open head.

The library object search was followed by reads at the pins, rather than treating default-branch results as pinned declarations. In particular, the newer Tau Ceti function-field differential-residue file returned 404 at the Tau Ceti pin; it was not claimed as an available declaration. The pinned restricted-series norm supplies only the ambient analytic carrier, and the pinned Mathlib `logDeriv` is an ordinary derivative quotient, not a logarithmic-function extension or local index.

All six manifest source entries have readable certified cached texts. No additional work was cited and no source acquisition or missing-reference request was necessary. The endpoint checks also used besser2017 line 503 and line 738, besser-zerbes2017 line 88 and line 108, besser-dejeu2012 line 2277, line 2430, line 2591 and line 2769, colmez1998 line 246, line 2996, line 3147 and line 3399, besser2005 line 355, and vologodsky2001 line 51 and line 1806. These are locators, not copied source passages.

## Adversarial mathematics pass

Each subsection row covers its definitions, named API, hypotheses and conventions. These are mathematical calculations and source/signature inspections, not completed formal proofs. “Unchanged” means that the listed instances revealed no additional defect requiring a repair.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: fields, orientations, branches, traces | Characteristic zero versus characteristic 2; ramification e=2; reversed node; quadratic trace | Fields exclude the zero ring; branch increment 2 gives 2/e; the node expressions both give 4; Tr(1)=2 | F02 makes the formal characteristic-2 boundary explicit |
| §1.1 `LengthCochains` and bridges | Empty graph; isolated vertex; loop; length 1/2; endpoint values 2,5 | C¹=0 for no edges; loop divergence cancels; pairing of 2,3 is 12; d gives −3, opposite the supplied coboundary | Unchanged |
| §1.2 harmonic decomposition and projection | Tree; disconnected isolated vertices; triangle (3,0,0); characteristic 3 | Triangle harmonic part (1,1,1); separate component constants; characteristic-3 exact/harmonic intersection shows why CharZero is required | Unchanged |
| §1.3 metric subdivision | Jump 10 split into lengths 2/5,3/5; identity; tree attachment | Jumps 4,6 sum to 10; energy is 40+60=100; attached tree has zero current | Unchanged |
| §2.0 analytic residue transport and germ adapter | z=t²; reversal z=t⁻¹; quadratic point; infinite negative tail | Residues 2,−1; trace 2; infinite negative support cannot enter the formal carrier | F01 imports the foundations and retains the adapters |
| §2.1 logarithmic space, differential and polynomial inclusion | Scalar 2; L; z⁻²; L²; z² over ZMod 2 | Values dL=z⁻¹ and primitive −z⁻¹; coefficient 2 excludes X²; in characteristic 2 a non-scalar has zero differential | F01 prerequisite imports; F02 proved-example conjuncts |
| §2.1a general analytic coefficients | ℚ₂; ℚ₃; residue characteristic zero; closed boundary | Division by 2 or 3 is legal in the field; interior-radius margins absorb denominator growth; closed-boundary primitive convergence is not asserted | Unchanged |
| §2.2 double index and uniqueness | (1,L), (L,1), (z,z⁻¹), (L,L); two scalar shifts | Values 1,−1,−1,0; shift is a Res(dG)−b Res(dF); Laurent integration by parts gives alternation | F01 imports formal integration by parts |
| §2.3 index transport | Degree 2; identity; reversal; coefficient embedding | Multipliers 2,1,−1; trace commutes with coefficients without becoming multiplicative | F01 imports formal transport |
| §3.0a component cover | Smooth model; node; self-node; pole at node | Smooth case uses supplied Coleman domains; self-node requires subdivision; separated support excludes a pole on the overlap | Unchanged |
| §3.0b full analytic Coleman coefficients | Transcendental geometric-series coefficient; scalar; log; disc indicator | Full analytic coefficients exceed finite tensor sums; scalar kernel and continuation exclude unrelated disc indicators | Unchanged |
| §3.0c Čech comparison, cup, χ, N and φ | Smooth positive genus; coboundary; diag(1,q); residue field 𝔽₄ | Proper cohomology survives when χ=N=0; coboundary maps to zero; Nφ=qN; identity coefficient lift over 𝔽₄ uses a power of 4 | Unchanged |
| §3.1 wide-open double pairing | Zero form; rational core; proper second-kind cup value 1 | End-residue cancellation removes global constants; rational value 0 and second-kind value 1 distinguish the pairing | F01 names the proper residue supplier |
| §3.1a reciprocity and Frobenius spectrum | Analytic exact; dlog z; degree-two boundary over 𝔽₃ | Radical cases give 0; boundary eigenvalue −3 squares to 9; reciprocal 1/3 remains absent | Unchanged |
| §3.2 harmonic primitive data | Bridge jump 2; single component; cycle | Component shift kills the bridge jump; a cycle period survives; connectedness gives one common scalar ambiguity | Unchanged |
| §3.3 graph correction | c=2,d=3,rη=5,rω=7; reversal; one component shift | Correction −11 survives reversal; arbitrary component shifts need not preserve either side separately | Unchanged |
| §3.4 corrected pairing | ℙ¹ with empty boundary; proper cup value 1; total coboundary | Values 0 and 1; coboundaries vanish; inserted length in N cancels the inverse length in the graph product | Unchanged |
| §3.5 operator identities | N=0; symplectic plane; identity substituted for φ | diag(1,q) scales by q; monodromy terms cancel 1−1; identity fails for q≥2 and nonzero pairing | Unchanged |
| §4.0 geometric abelian logarithm | Dimension 0; torsion point; small nonzero tangent; transcendental elliptic j | Values 0,0,v; arbitrary ℂ_p-defined varieties need the geometric theorem, beyond extension of finite-model points | Unchanged |
| §4.0a abelian primitives and finite differences | Invariant form; df; zero variety; quadratic average | Logarithm and f give the required based primitives; normalized trace divides by 2, valid also over ℚ₂ | Unchanged |
| §4.0b Albanese reduction and descended logarithmic forms | Point; A¹; G_m; quadratic poles over ℚ₃; transcendental pole over an overfield | Exact dt and logarithmic dt/t differ; traced quadratic form is included; finite algebraic generators cannot create a transcendental pole | Unchanged |
| §4.0c natural integration and closed-field descent | Equal endpoints; A¹ dt; G_m dlog; completed unramified field; nonclosed ℚ̄_p | Values 0,b−a,T; compactness is unnecessary for closed-field descent; nonclosed ℚ̄_p has the wrong completed fixed field | Unchanged |
| §4.0d natural reciprocity and projection | Nonzero constant f; f=0; (t−a)/(t−b) with dt; degree-two map | Constant case vanishes; zero f excluded; infinity residue a−b; finite-map multiplicity 2 retained | F01 names the proper residue supplier |
| §4.0e Jacobian differential/topology bridge | Genus 0; multiplicative elliptic reduction; noncompact K× | Trivial genus-zero value; proper Jacobian remains compact in bad reduction; valuation on K× is the excluded noncompact counterexample | Unchanged |
| §4.1 logarithmic residues and exactness | xy=π with f=x; nonzero constant; f=0 | Residue 1 equals ord_head−ord_tail=−d(ord); constants give 0; zero f excluded | Unchanged |
| §4.2 smooth-residue identification | Tree; cycle; df and dlog f; Tate valuations 1/3,2/3 | Tree jumps vanish; cycles survive; valuation corrections −1/3,−2/3 rule out constant agreement on the whole annulus | Unchanged |
| §4.3 annular valuation formula | F_tail=2,c=6,t=1/3; reversal; quadratic refinement | Both orientations give 4; refined jumps 3+3 give 6 | Unchanged |
| §4.4 global point-sum | Empty Z; holomorphic pair; second-kind cup value 1; graph cycle | Holomorphic value 0; second-kind value 1; graph correction cannot be discarded | Unchanged |
| §5.1 labelled primitive data | Three L functions; three zero functions; G=0,H=L | Half squares obey product identities; opposite constants remain possible at zero; pair (1,0) fails while (1,−1) passes | Unchanged |
| §5.2 local triple characterization | (1,1;L), (z,z;z⁻²), (z,z⁻¹;L), three L functions | Values 1,−2,1,0; the last uses nonzero 3, also in ℚ₃ | Unchanged |
| §5.3 primitive-choice laws | F=L,G=0,H=L; shifts 1 and 2; unused pair | Changes −1 and −2; unused F,G pair has no effect; a zero function does not erase labelled choices | Unchanged |
| §5.4 simple-pole normalization | (2+L,3;L); half squares; parameter u=az | Value 6; pure-log value 0; constant term shifts by −δ while transported full expression agrees | Unchanged |
| §5.5 triple transport | Degree 2; identity; reversal; untransported primitive shift | Multipliers 2,1,−1; changing one pulled-back primitive introduces the stated residue error | Unchanged |
| §6.0 actual-form symbol relations | Analytic coefficient; nonzero symbol; G dC | Analytic coefficient has zero symbol; nonzero symbol excludes a zero actual product; constant C gives zero form | Unchanged |
| §6.1 global triple end-sum | Zero data; rational core; positive-genus B_U(F,H)=1 with G=1 | Values 0,0,1; value 1 excludes descent through three differential classes | Unchanged |
| §6.2 global choice and constant laws | Global versus single-end shift; G increased by 2 | Global residue changes sum to 0; single-end change can be −1; adding 2 can add 2 to the value | Unchanged |
| §6.3 Frobenius vanishing | Zero eigenclasses; q=2; quadratic residue extension; arbitrary F with G=1 | Reciprocal functional eigenvalue 1/q is excluded; both eigenclass hypotheses matter; extension uses the specified iterate | Unchanged |
| §6.4 actual Coleman-form pairing | 1·dH; G dC; two presentations of d(GH) | Values B_U(F,H),0; equal actual forms agree by the relation theorem | Unchanged |
| §7.0 Tate differential/charts | q=p³; n=1,2; q=1; p=2 | Final gluing subtracts log q and preserves dz/z; flags retain short cycles; q=1 excluded by positive valuation | Unchanged |
| §7.1 branch transport and affine specialization | Zero ring; arbitrary commutative ring; slopes 0,1,1/2; equal branches | Distributivity gives the scalar identity; branch increment 2 gives 0,2,1; no domain assumption needed for this scalar carrier | Unchanged |
| §7.2 proper holomorphic integration | ℙ¹; elliptic curve; G_m | Proper values have zero branch slope; nonproper dlog from 1 to p has slope 1 | Unchanged |
| §7.3 trace and averaging | Identity extension; ramified quadratic at p=2; α²=π; equal endpoints | Tr(α)=0, Tr(α²)=2π; base values trace to degree times themselves; averaging needs division by degree | Unchanged |
| §7.4 degree-zero divisor integral | Empty support; b−a; quadratic point minus 2[0]; degree 1 error | Values 0,I(a,b),π for t dt; wrong degree leaves basepoint dependence | Unchanged |
| §7.5 traced local/end indices | Rational point; quadratic point; empty sum; trace of products | Identity trace or trace 2; infinity contribution −2 cancels; separate input traces give the wrong product | Unchanged |
| §7.6 realization descent | Good reduction; ramified splitting; common refinement; quadratic constant field | Intrinsic single integral identifies realizations; scalar 1 over quadratic constants traces to 2; unrelated triple choices remain excluded | Unchanged |
| §7.7 Tate normalization | q=p³, log(p)=1; q multiplication; branch change; n=1,2 | F=log z−ν_p(z), jump −1; period and branch differences are both 0; positive n justifies division | Unchanged |

For the fourteen Lean theorem targets, explicit declaration binders retain every needed field, characteristic-zero or commutative-ring hypothesis. The formal primitive is obtained by applying the imported Laurent primitive theorem to w−Res(w)z⁻¹ and adjoining Res(w)L. Residue detects the log coefficient, and the Laurent scalar kernel gives the degree-one kernel. Coefficients 0 and 1 give polynomial injectivity. Laurent integration by parts and decomposition into Laurent plus kL give the five double-index identities and uniqueness. Ring distributivity and homomorphism laws give the four affine specialization identities. None assumes its own conclusion. Their signatures were unchanged.

## Check outcomes

- **Elaborate `Suggested.lean`: not available.** No Lean command or process was started. Neither successful elaboration nor an elaborated `#check @name` result is claimed. The added example is proved in source, with no admission, and its tactic script was inspected against the pinned singleton APIs.
- **Dependency direction:** the prescribed command exited 0. Its complete output was:

```text
depcheck: 3 roadmaps, 19 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The three-roadmap scope is recorded literally. The two additional suppliers are on main; no merge-order change or supplier gap is needed.

- **README/Lean agreement:** all 20 declaration names occur in the README. The new ZMod 2 Check is mirrored inside the second logarithmic-functions example, alongside the retained polynomial inclusion checks. No declaration was added, deleted or renamed.
- **Lean form:** 250 lines; one `import Mathlib`; six real-bodied definitions/abbreviations; fourteen admitted theorem targets; six proved example blocks. The logarithmic-functions/differential examples remain two blocks. No admitted data/example, `set_option`, `lemma`, `True` placeholder or evaluation/axiom-printing command occurs.
- **README structure:** all 45 numbered subsections retain at least three Checks, with seven layers in the same order. No new target or layer was introduced.
- **TOML:** `metadata.toml` and `sources.toml` parse successfully; both are unchanged. All six source statuses remain certified.
- **Diff:** `git diff --check` passed. Edits are confined to `packages/ColemanIntegrationPartII/README.md`, `packages/ColemanIntegrationPartII/Suggested.lean` and this required report. No tooling, merge-order file, sibling roadmap, commit or GitHub write was made.

## Maintainer notes

Both findings are locally actionable and applied; none requires a human ownership decision. Consumers keep the same index and logarithmic-function names and theorem hypotheses. `residueTransport_germ` remains the README name for the analytic comparison adapter; general point completions and formal residue calculus are now explicitly consumed from their owners. No ownership moved to a later roadmap, and no consumer receives a new dependency on either open sibling. Fresh independent review remains necessary; this report does not certify the future proofs or Lean elaboration.
