# ArithmeticDynamics repair dispositions

Identifiers `Ann` and `Bnn` refer respectively to findings `Snn` in `packages/ArithmeticDynamics/reports/RT-ArithmeticDynamics~2a.md` and `packages/ArithmeticDynamics/reports/RT-ArithmeticDynamics~2b.md`. The two lists contain fourteen distinct findings; shared first-round status inventories are not new findings. No verdict below is a substitute for independent review.

## A01 (P1) — applied

Inverse conjugators → the declared left conjugators: z/s for z+c/z, z−1 for moving 1 to 0, and u·g(z/u) for scaling a germ. Added the c=4 and quadratic-germ witnesses and a proved Lean Check using native `Equiv.conj` and backward-orbit transport. Direct substitution gives z+1/z, z²+z−2 and z²/2; using the inverse scalings gives z+16/z and 2z².

## A02 (P2) — applied

Unqualified rational-point surjectivity → surjectivity on the actual carrier, with algebraically closed K in the rational-map specialization. Added `rationalSquare_two_boundary` in both files. For n≥1, x^(2^n)=2 would force the integer v₂(x) to equal 1/2^n; thus the rational backward orbit is {2}, while 2^(2^n) gives infinitely many forward values.

## A03 (P2) — applied

ℙ¹-only Lehmer predicates → all N≥1, number fields K and morphisms with f*O(1)=O(d), d≥2. Updated conjugacy, iteration, field-of-definition and specialization API; retained the conjectural status. Added a dimension-two power-map Check. Evidence: bijmst18 line 1934, Conjecture 16.2, p.39; the canonical-height carrier is §1.17's polarized construction.

## A04 (P3) — applied

Characteristic-free quadratic/cubic inertia examples → char(k)≠2 and char(k)≠3 respectively, with the inseparable cases as negative controls. Kept the characteristic-two Artin–Schreier example. The discriminants are 4u and −27u²; in the excluded characteristics they vanish. Evidence: juul-generic-iterates line 227 and line 235, Corollaries 2.8–2.9.

## A05 (P2) — applied

Rational base and rational substitutions → arbitrary smooth geometrically integral curves T and finite dominant maps of such curves. Added named curve specialization, marking-cover, base-change and conjugacy targets and the genus-two pullback Check. Updated §6.27's consumer convention and §6.50's dependencies. Evidence: bijmst18 line 1258 through line 1265, Conjecture 11.6, p.25.

## A06 (P2) — applied

Supporting general-curve context → `polynomialVariationDivisor`, `ingram_divisorHeightVariation` and `ingram_projectiveLineVariation`, with divisor-degree, iteration and finite-base-change API. The uniform bound covers algebraic parameters with absolute heights. The local proof now uses supplied Riemann–Roch. Added constant, infinite-section and genus-two Checks. Evidence: ingram-2011-variation line 48 through line 57 and line 72 through line 83.

## A07 (P2) — applied differently

Seven ℚ coordinate functions → functions over a field K. The inverse theorem explicitly binds (2:K)≠0 and t²≠1; the cleared cubic identity works in every characteristic with t+u≠0. Kept arithmetic exclusions over ℚ, separated smooth geometry from the identity, and added characteristic-2/3 controls. Evidence: morton92 line 228 through line 251 and line 848 through line 861.

## A08 (P3) — applied

Unnamed primary classification works → reference entries `bilu-tichy-2000` and `ritt-1920`, linked from §§6.23 and 6.25 with precise locators. Evidence: ghioca-tucker-zieve-2008 line 774 and line 800; legally fetched Bilu–Tichy Theorem 10.5, pp.285–286 and Ritt §IV, p.356. Manifest registration remains the maintainer's settled responsibility outside the two permitted package files.

## A09 (P2) — applied differently

Dickson existence/parameter-one identities as targets → Mathlib's native carrier and named proved identities. Also imported Tau Ceti's already proved general scaling theorem, rather than following the review's suggestion to rebuild it. Kept missing general-parameter evaluation and composition targets. Pins: Mathlib `Polynomial.dickson`, lines 63, 122, 183; Tau Ceti `Polynomial.dickson_sq_mul_eval_mul`, line 114.

## A10 (P2) — applied differently

Equal-degree necessity alone → general bounded-O_S-denominator equivalence, all five standard families, specific pairs, API and Checks; equal-degree necessity is a corollary. Retained residual arithmetic solvability. Corrected specific-pair parameter powers using the proof on p.286: the p.282 display interchanges them. Evidence: bilu-tichy-2000 line 1040, line 1085 through line 1097, line 956 versus line 1110.

## B01 (P3) — applied

GTZ Theorem 1.1 → Theorem 1.5 with α=1, β=0 in the Lean docstring; explicitly identified Theorem 1.1 as K=ℂ. The signature remains over every characteristic-zero field. Evidence: ghioca-tucker-zieve-2008 line 18 and line 94 through line 97.

## B02 (P3) — applied

Nonexistent SF.0/SF.5 keys → SchemeAndStackFoundations §0.3 for relative Proj, §0.9 `spreading_out_models` for spreading out, Layer 0 quasi-projective varieties for the DML carrier, and Layer 5 for intersection degrees. Updated Scope and layer dependencies. Main's §0.3 starts at line 550, §0.9 at line 824, its named spreading-out theorem at line 841, and Layer 5 at line 6475.

## B03 (P2) — applied

Missing Layer 5 headline → `stoll_X_sq_add_one_card_gal` on `Polynomial.Gal`, named in §5.65. It includes n=0, where the iterate is X and the group has order 1. Evidence: jones-arboreal-survey line 210 through line 217, Theorem 2.3 with k=1; the pinned polynomial-Galois carrier and `uniqueGalX` handle level zero.

## B04 (P3) — applied

Two `bounded-height-enumeration` Needs entries → the declared `gap:ed-bounded-height-candidates` with EffectiveDiophantineMethods ED.0 as supplier. The existing gaps-table contract is unchanged. No supplier target was invented, and this consistency repair requires no decision outside this package.

## Adversarial mathematics pass

The table records the mathematical checks performed here; exact polynomial computations and finite-field grids supplement the algebraic arguments and do not certify an arbitrary theorem merely because its Lean signature elaborates.

| Statement, definition or convention | Instances tried | Result | Change |
|---|---|---|---|
| Left conjugation, normal form, translation and germ scaling | c=4,s=2; f=z²−z−1, mark 1; g=z²,u=2 | Left conjugates are z+1/z, z²+z−2 and z²/2 | A01 |
| `forwardOrbit`, `IsPreperiodicPt`, finite-orbit equivalence | Empty carrier, id, successor, tail 1→0→−1 for z²−1 | Zeroth iterate and positive period distinguish the cases | None |
| Positive-iterate and bijective-semiconjugacy transport | k=1, k=2; k=0; noninjective maps | k>0 and bijectivity remain explicit | None |
| Quadratic tail and wandering point | z²−1 at 1 and 2 | 1 is not periodic; 2 strictly escapes after its first step | None |
| Group-power preperiodicity | d=0,1,2; trivial group; element of infinite order | d≥2 is essential; equality of two powers forces finite order | None |
| `tateLimit` and convergence/error/application/uniqueness | Zero height, a=2, a=1 with translation, stationary orbit, negative bound | Expansion denominator a−1 is guarded; negative error bounds are vacuous on a nonempty carrier | None |
| Zero Tate limit iff preperiodic | Finite orbit; forward-invariant Northcott set; no Northcott | Zero height bounds the orbit's original height; finite sublevels then force repetition | None |
| Elliptic Tate limit and real doubling | O, 2-torsion, arbitrary P; x=0 and x<0 | Native elliptic height uses the full x-height limit with 4ⁿ; real normalized terms are x | None |
| `backwardOrbit`, `exceptionalSet`, conjugacy | Id, integer translation, rational squaring at 2 | Finite backward orbit does not imply finite grand orbit without surjectivity | A02 |
| Complex-power exceptional set | d=1 versus d=2; 0,∞,1 | Only 0,∞ at d≥2; inverse roots of 1 have unbounded orders | None |
| `classicalFatou`, `classicalJulia` and uniform conjugacy | Id, constant, real doubling, complex powers inside/on/outside unit circle | Uniformity and d≥2 binders survive; local doubling destroys equicontinuity | None |
| `mortonThreeCycleEquation` | Four sign pairs, (0,0), swap, characteristics 2,3,5,7,11 | H is symmetric; sign pairs vanish; H(0,0)=−2 | Generalized K |
| Morton parameter and inverse coordinate functions | t=3,−3,0,±1; characteristics 2 and 3 | Inverse recovers the parameter for 2≠0,t²≠1; totalized poles give 0; characteristic 3 can give a fixed point | A07 |
| Morton rotation and trace | 3→−3→0→3; t=1 pole | Trace 0 at the three markings; pole guards cannot be omitted | Expanded existing proved Check |
| Morton cubic coordinates and equation | ζ=0, ζ=2; (−1,−1); characteristics 2 and 7 | Cleared residual equals (ζ−2)H; no division by 2 needed for the identity; characteristic 7 cubic is singular | Separated algebra and smooth geometry |
| Rational three-, four- and five-cycle conclusions | z²−29/16; c=0,−1; comparison with characteristic 3 | Arithmetic exclusions remain over ℚ, without extrapolation from formal coordinates | None |
| Relative/native height candidate adapters | ℚ and degree-two fields; B=0 | Absolute logarithmic bound needs exp([K:ℚ]B); native uses exp(B) | None |
| Discriminant iteration recursion | d=1,n=0; f=X²+1,n=0,1; nonmonic quadratic | Linear discriminant 1; quadratic first factor −4; next discriminant 512 | None |
| Inertia Checks | X²−u in char 2; X³−u in char 3; tame complements; X²+X−u in char 2 | Inseparable polynomials have zero discriminant; tame groups have orders 2 and 3 | A04 |
| Stoll headline | n=0,1,2,3; x²+1 versus x²−2 | Orders 1,2,8,128; all-level assertion comes from Stoll, not these computations | B03 |
| `IsFiniteUnionAP` and eventual periodicity | ∅, ℕ, {3,7}, evens∪{1}; residue modulus 0 | Zero steps retain finite sets; eventual period is positive | None |
| Powers are not a finite union of progressions | p=1,2,3 | p≥2 yields unbounded gaps; p=1 must remain excluded | None |
| Primitive-root transport | Degree-one extension; primitive generator in quadratic extension | Integral generator and root of its transported minimal polynomial determine the embedding | None |
| Lech–Cassels integral assembly | ℚ, empty marks, {0,1/6}; arbitrary lower prime bound | Marked denominators require finitely many excluded primes; zero marks cause no unit requirement | None |
| Ritt equal-iterate signature | n=1; monomial support s=0; −X² versus X²; −X³ versus X³ | Geometric-sum root-of-unity condition gives the correct parity | B01 fixes only GTZ attribution elsewhere |
| Synchronized affine intersection | Two translations, zero starting value, root-of-unity slopes | Infinite distinct common values excludes purely periodic coincidences | None |
| Polynomial common iterate | Equal polynomials; unequal degrees; finitely generated characteristic-zero coefficient fields | Equal degree and degree>1 remain explicit; GTZ 1.5 gives the stated specialization | B01 |
| Polynomial-line return times | Constant maps, vertical/horizontal lines, finite orbit, empty hitting set | Nonzero line equation and characteristic zero remain explicit; zero-step progressions cover finite sets | None |
| Higher-dimensional Lehmer | N=1,2; rational points; 2^(1/n); n=0 iterate | Height/field-degree scaling is correct; no unconditional conjecture introduced | A03 |
| General-curve DAO and specialization | T=ℙ¹; genus-two double cover; Legendre; constant z²+1 | Finite dominant cover preserves infinite PCF locus; non-isotriviality remains essential | A05 |
| Ingram divisor and comparison | Constant mark 2; P=∞; z²+t at 0; genus-two pullback | D=0,0,½[∞], [∞_X] respectively; O(1) compares with h_D on a general base | A06 |
| Fixed-denominator solution predicate | Δ=1; affine substitutions; variable Δ | Common nonzero Δ is necessary; affine changes can replace it by another fixed Δ | A10 |
| Standard pairs | X²,Y³; (X,X); X² and −X²−1; fifth-kind (3,4) | Unequal degrees and degree-one residuals retained; shape alone is insufficient | A10 |
| Specific pairs and their parameters | e=2; e=3,a=0; m=6,n=3,a=2 | e≥3 required; a=0 permitted; crossed powers give common D_e parameter a^(mn/e²) | A10; source misprint avoided |
| Dickson first-kind evaluation/composition/scaling | n=0,1,2; m=0; a=0; b=0; zero ring; char 2 | D₀=2; n>0 zero parameter gives Xⁿ; identities are polynomial identities over commutative rings | A09 |
| Ownership and direction | Main/Completed and ErdosProgressionPowers object searches; supplier sections | No competing Bilu–Tichy/Ingram/Morton target found; Dickson carrier and scaling imported from pins | No supplier ownership moves |

## Source and interface evidence

Legal source-service fetches supplied bijmst18, morton92, ingram-2011-variation, ghioca-tucker-zieve-2008, bilu-tichy-2000, ritt-1920, juul-generic-iterates and jones-arboreal-survey. Bilu–Tichy's printed p.282 was also inspected as an image: its specific-pair parameter powers disagree with its proof on p.286. The roadmap uses the crossed powers from that proof. The composition identity checks the shared parameter directly. The Lehmer and Ingram headline displays were also visually checked on their cited pages. Ritt p.356's exponents have imperfect OCR; GTZ Proposition 6.3 provides the unambiguous equal-iterate statement.

Mathlib was checked at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Relevant files were read at those commits on GitHub and in the materialized pinned dependencies. The Dickson scaling result is already general in its kind and coefficient ring, so its polynomial specialization is an import consequence. No manifest, toolchain, supplier folder or merge-order file was edited. Missing-text requests generated by unsuccessful initial URLs were resolved through legal copies; no text request remains pending.

## Checks and maintainer consequences

- `lake build TauCetiRoadmap.ArithmeticDynamics.Suggested`: final exit 0, `Build completed successfully (8981 jobs).` Only the intended theorem-target `sorry` warnings remain. The first four attempts exited 1 while fixing the new conjugation and small-characteristic example proofs; the fifth passed. All 19 examples are proved. The file has 620 lines, 15 real-bodied definitions and 40 named theorem declarations.
- Configured package gate against `origin/main`: final exit 0 after the commit. Its exact output is below. Earlier attempts exposed raw mathematical markup and four API-inventory names, which were repaired; the last pre-commit attempt failed solely with `dirty=2`.

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

- Configured dependency check using ArithmeticDynamics and the supplied merge order: exit 0, with exact output:

```text
depcheck: 2 roadmaps, 14 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `git diff --check` exited 0 without output. All declaration names occur in the README; no admitted data, admitted examples, extra Mathlib imports, options or machine paths were introduced. The exact-arithmetic polynomial and finite-field checks described in the table passed; they are not used to infer Stoll's all-level theorem from finite evidence.

The checked-out branch is `roadmap/arithmetic-dynamics`. The required commit is `85e78c07dcc361ead6505c970a1181deee483819`, with subject `ArithmeticDynamics: red-team repairs (generality, conjugation, native APIs, and headline signatures)`. It changes only `TauCetiRoadmap/ArithmeticDynamics/README.md` and `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean`. The final working tree is clean. Nothing was pushed and no Lean process remains running.

No Lean name was deleted. The seven Morton coordinate definitions and two identities now infer a coefficient field K; applications using an untyped numeral must specify K, and the inverse theorem has an additional explicit nonzero-two hypothesis. The rational arithmetic exclusion names retain their ℚ signatures. Added Lean names are `rationalSquare_two_boundary` and `stoll_X_sq_add_one_card_gal`. No other roadmap in the supplied main/sibling trees cites the changed Morton names.

The §6.25, §6.26 and §6.78 headings changed, and every internal consumer of their old headings/anchors was updated. The three supplier gaps are unchanged. No merge-order move is needed. Source-manifest registration, including Bilu–Tichy and Ritt, remains outside this package's authorized edits and needs maintainer handling; the settled earlier finding is not reopened.
