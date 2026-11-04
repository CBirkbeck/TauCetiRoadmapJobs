# Review of TangentialBordism (pull request #942 at bb3149f)

**Verdict:** accepted

This is an incremental re-review of the 60 lines changed since 0f021fa (43 insertions, 17 deletions, all in `TauCetiRoadmap/TangentialBordism/README.md`; `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read). The changed passages are 5.6 (umkehr derivation and its supplier sections), 6.1 (Miller locator), 6.2 (Thom locator and the pair extension's inputs), 9.4 (Borel–Hirzebruch locator and sign conversion) and 10.2 (closed fibre, action and numerability hypotheses, Führing locator, two Checks). No finding of this report; both previous findings are repaired and the repairs introduced no new defect.

## Previous findings

- R01 — repaired: `README.md:2339–2343` now requires “a closed smooth fibre F (compact with empty boundary), a specified G-action by smooth diffeomorphisms continuous in the C∞ topology, a chosen compatible G-equivariant vertical tangential structure, and numerable principal G-bundles”; `:2379` adds the F=I negative control (two boundary points, four edges of I×I); `:2363–2365` cite Führing §3, p.359 and Proposition 3.4, p.362, which I reopened (`fuhring2022 line 175`, line 332; page markers 5 and 8 carry printed pages 359 and 362). The S¹ Check at `:2378` now states the end coefficients +1 and −1. For other structure groups the smooth representatives are an explicit input (`:2350–2352`), not a claim.
- R02 — repaired: 6.1 cites Miller, Chapter 1, Theorems 12.3–12.4, pp.32–34 (`:1431–1432`; `miller line 1239`, line 1261, page markers 37–39 carry printed pages 32–34); 6.2 attributes the point statement and the two-manifold comparison to Thom IV.10 and Corollary IV.11, p.77 (`:1462–1465`; `thom1954 line 2528`, line 2538, printed folio 77 at line 2545) and states the pair extension's three inputs (`:1465–1468`); 9.4 cites Borel–Hirzebruch I §15.5, equation (13), p.519 with q=k+1 and u=−c₂ (`:2262–2264`; `borelhirzebruch1958 line 2417`, page marker 63 carries printed page 519); 5.6 now derives the umkehr explicitly from the graph embedding with its ranks and degrees (`:1357–1365`) and names G4.3, G5.1–G5.3 in its `*Needs:*` line.

## Verified sound

### The changed passages

**5.6 (`README.md:1357–1365`, `:1390`, `:1395`).** The graph embedding i=(g,j):N^d→P^e×ℝ^r has normal rank (e+r)−d=r+e−d, and ν_i⊕TN≅i*T(P×ℝ^r)=g*TP⊕ε^r has rank (r+e−d)+d=e+r on both sides. The Thom space of the trivial ε^r over closed P is Σ^r P₊, so the collapse Σ^r P₊→Th(ν_i) exists; suspension adds r and the Mξ Thom isomorphism (GeneralizedCohomology G4.3, the homological module form) subtracts r+e−d, leaving n+d−e, the stated target degree. The ξ-orientation of ν_i comes from the assumed stable ξ-normal data on g*TP−TN plus the trivial block, so the stated hypothesis is exactly what the derivation uses. The three supplier sections exist on main at 9c6e95d: G4.3 is the orientation-data/Thom-isomorphism item of `TauCetiRoadmap/GeneralizedCohomology/README.md` (under “## G4”, item 3, which states the cohomological and homological module Thom isomorphisms); G5.1 is Spanier–Whitehead duality for finite spectra; G5.2 the geometric duality adapter with the unframed collapse and the stabilized embedding/normal comparison; G5.3 the compatible numerable bundle diagrams (under “## G5”, items 1–3). B5.1, B5.4b and B1.6 are this README's own labels (`:977`, `:1188`, `:242`).

**6.1 (`:1428–1432`).** Miller's Theorem 12.3 (H*MO is a free A-module) and Theorem 12.4 (the map to the wedge of suspended HF₂ is a weak equivalence) are at the cited pages; the multiplicities are the degrees of a free basis, which the subsection computes, and no ring-level splitting is attributed to the source (Miller's own additive/multiplicative distinction is at `miller line 1370`).

**6.2 (`:1455–1468`).** Thom's Théorème IV.10 says a closed manifold with all Stiefel–Whitney numbers zero bounds mod 2, and Corollaire IV.11 that two closed manifolds with equal numbers are cobordant mod 2; both are on printed p.77. The README attributes exactly those two statements to Thom and owns the pair extension, with the inputs B5.4 (comparison with the spectral theory), B4.4 (the additive splitting, which turns ΩO_n(X,A) into ⊕_d H_(n−d)(X,A;F₂), a finite sum since n−d≥0) and AlgebraicTopology Stage 6 item 1, which constructs absolute and relative singular cochains and proves the universal-coefficient sequence over a PID (`TauCetiRoadmap/AlgebraicTopology/README.md`, Stage 6 item 1); over the field F₂ its Ext term vanishes, so H^m(X,A;F₂)≅Hom(H_m(X,A;F₂),F₂) for every pair and the stated absence of a finite-dimensionality assumption is right. The sentence that point characteristic numbers do not detect cycles over X is a correct restriction (witness in the table).

**9.4 (`:2259–2266`).** Borel–Hirzebruch's (13) reads p(P_(q−1)(K))=(1+u)^(2q)(1+4u)^(−1) with u the degree-four generator x₁²; with q=k+1 this is the README's formula, and p₁=(2q−4)u (their 15.6) gives 2u at k=2, agreeing with StringOrientation S1.5. The sign conversion is forced: the tautological quaternionic line, as a complex rank-two bundle, has Chern roots ±x₁, so c₂=−x₁²=−u.

**10.2 (`:2339–2381`).** Führing §3 (p.359) takes F a smooth closed manifold and a fibre bundle whose vertical tangent bundle is X-oriented; Proposition 3.4 (p.362) identifies the MG-transfer with pulling back the bundle along a cycle, which is the README's “actual total-space cycle”. With ∂F=∅ the boundary of P×_G F over a cycle with boundary is (P|∂M)×_G F, of dimension dim ∂M+dim F, so the parameter map lands in A; with ∂F≠∅ there is the extra term P×_G ∂F, which is what the F=I Check exhibits. The hypotheses now listed (closed fibre, specified smooth action continuous for the C∞ topology, compatible vertical structure, numerable principal bundle, smooth representatives from CharacteristicClasses C1.4 for compact Lie G and as input otherwise) are the ones the construction uses. C1.4 on main states smooth representatives for continuous reductions to compact G over smooth bases, including relative homotopy versions (`TauCetiRoadmap/CharacteristicClasses/README.md`, C1 item 4).

### Gate, dependency direction and the Lean acceptance test

The worker's gate at this head reports every scanner at zero and a passing targeted build; I reran the gate (all counts zero, `OK`) and the dependency check with `--movable`:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The outside-folder diff against `origin/main` is empty; the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`. The four new supplier citations (GeneralizedCohomology G4.3, G5.1–G5.3; AlgebraicTopology Stage 6; CharacteristicClasses C1.3–C1.4) are all to roadmaps on main, hence earlier in supply. No supplier gap is declared and none is needed by the changed passages.

I built the two imported Tau Ceti modules and elaborated `Suggested.lean` with `lake env lean`: exit 0, the only output the four `sorry` warnings at lines 93, 102, 111 and 129. A scratch file importing the module and running `#check @name` on all nine declarations elaborated; every binder is present in the elaborated types: `FiniteDimensional (ZMod 2) V` and the nondegeneracy hypothesis on the Arf definition and its three theorems, `Fintype V` and `finrank = 2*m` on the Gauss-sum theorem, `finrank = 2*m` on the Lagrangian criterion, and `T2Space`, `SecondCountableTopology`, the half-space charted space, `IsManifold … ∞` and the oriented atlas on the parallelization theorem. Nothing changed in the file since 0f021fa, so the previous report's padding probes (16 one-tactic attempts, none closing a headline) stand; I re-read the file and confirm no sorry'd data, no `set_option`, no foreign import, no admitted example.

### Seeded sample

Of the fifteen seeded targets, two fall in the changed passages and were rechecked against the texts: 6.2 (Thom IV.10 and IV.11, p.77) and 9.4 (Borel–Hirzebruch (13), p.519), as above. The other thirteen (1.1, 2.1, 2.3, 2.7, 3.1, 4.1, 4.2, 5.2, 5.5, 6.3, 6.4, 6.6, 9.1) are untouched by the diff; their verification stands as recorded in the previous report, PRREVIEW-TangentialBordism~4, under its seeded source audit. No README locator is flagged as unverified. The citation scanner's single lead (`TauCeti.DivisionOctonionReal` at `README.md:149`) is unchanged and was resolved by the previous report as a planned LieHighestWeight Layer 8 object, not a claimed pinned declaration.

### Ownership

The diff adds no construction, carrier or comparison; it adds hypotheses, locators and a derivation to existing targets. The ownership searches of the previous report therefore stand. Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial mathematics table

Rows marked “r4” are carried forward from PRREVIEW-TangentialBordism~4 for statements the diff leaves untouched, with the values that report computed. The other rows were computed in this review for the changed statements.

| Statement / target | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| 5.6 graph-embedding ranks | (d,e,r)=(0,1,1),(0,1,2),(2,2,5),(1,3,3),(1,3,4) | normal rank r+e−d = 2,3,5,5,6; shift r−rank = −1,−1,0,−2,−2; d−e = −1,−1,0,−2,−2 | Pass, new |
| 5.6 virtual normal identification | same triples | rank(ν_i)+rank(TN) = (r+e−d)+d = e+r = rank(g*TP⊕ε^r) | Pass, new |
| 5.6 stabilization Check | r→r+1 | suspension r+1, rank r+1+e−d; difference d−e unchanged | Pass, new |
| 5.6 point into oriented circle | d=0,e=1,n=1 | shift −1; degree-one cycle has one positive preimage point | Pass, new |
| 6.1 locator and multiplicities | printed pp.32–34; degrees 0–4 | page markers 37,38,39 minus 5 = 32,33,34; multiplicities 1,0,1,0,2 | Pass, new locator; values r4 |
| 6.2 field duality without finiteness | X = infinite wedge of circles, A=∅ | H₁ = ⊕F₂ of infinite rank, H¹ = ΠF₂ = Hom(H₁,F₂); a class on finitely many circles pairs nonzero with its dual class | Pass, new |
| 6.2 why a field | RP² with ℤ versus F₂ | Hom(H₁(RP²;ℤ),ℤ)=0 fails to see ℤ/2; over F₂, H¹(RP²;F₂)=F₂ pairs nonzero | Pass, new (negative control for the coefficient choice) |
| 6.2 point numbers do not detect over X | identity cycle S¹→S¹, n=1 | all point Stiefel–Whitney numbers 0 (S¹ bounds); joint number ⟨f*a,[S¹]⟩=1 for a the generator | Pass, new |
| 6.2 Thom locator | IV.10, IV.11 | source line 2528 (bounds mod 2), line 2538 (equal numbers ⇒ cobordant); printed folio 77 at line 2545 | Pass, new |
| 9.4 Borel–Hirzebruch conversion | q=k+1, k=1,2,3 | coefficients of (1+u)^(2k+2)(1+4u)^(−1): (1,0), (1,2,7), (1,4,12,8); p₁=(2q−4)u = 0,2u,4u | Pass, new |
| 9.4 sign conversion | tautological line as complex 2-bundle | Chern roots ±x₁, c₂=−x₁²=−u; S1.5's p₁(HP²)=2u recovered | Pass, new |
| 9.4 HP² signature | p₁=2u, p₂=7u² | (7·7−4)/45 = 45/45 = 1 | Pass, r4 |
| 10.2 closed-fibre boundary formula | F=S¹, base I, G=1 | ∂(I×S¹) = {1}×S¹ − {0}×S¹, coefficients (+1,−1), sum 0; dim = 1+1−1 = dim ∂I + dim S¹ | Pass, new |
| 10.2 interval-fibre exclusion | F=I, G=1, base pt, A=∅ | total boundary 2 points, no map to ∅; ∂(I×I) has 4 edges versus 2 for I×S¹ | Excluded by the closed-fibre hypothesis, new |
| 10.2 Führing hypotheses | §3 p.359, Prop. 3.4 p.362 | F closed (line 175); transfer = pullback bundle over the cycle (line 332–339) | Pass, new |
| 10.2 empty fibre | F=∅ | total space ∅, transfer 0; consistent with “empty base sends 0 to 0” | Pass, new |
| Conventions: tangent/normal inverse | Oriented point; TS²⊕ε¹ | class 0 inverse 0; [TS²]−2=0 | Pass, r4 |
| Conventions: boundary/cylinder | Positive I; I×positive point | ∂I=[1]−[0]; total coefficient 0 | Pass, r4 |
| 1.1 full polarization / symplectic basis | q=xy; q=x² on F₂¹ | polar ranks 2 versus 0 | Pass, r4 |
| 1.1 basis-independence headline | m=0,1,2, all bases | Arf distributions (1,0),(3,1),(10,6); same value on every basis | Pass, r4 |
| 1.1 Gauss-sum headline | zero form, H, A, 4-dimensional forms | sums 1,+2,−2,±4 = signed 2^m | Pass, r4 |
| 1.1 zero-Lagrangian headline | 21 forms, all m-planes | exists exactly for the 1,3,10 Arf-zero refinements | Pass, r4 |
| 1.1 zero-count formula | m=0,1,2 | 1; 3/1; 10/6 = 2^(2m−1)±2^(m−1) | Pass, r4 |
| 1.1 sum/classification | A⊕A | Arf 0; Gauss (−2)²=4 = H⊕H | Pass, r4 |
| 2.1 fixed-face transversality | f(t)=t fixed at 0; f(t)=1+t | face rank 0<codim 1 excluded; second misses Z | Pass, r4 |
| 2.1 tubes/neatness/rounding | I⊂I×ℝ; quadrant corner | normal rank 1; rounding changes no exterior face | Pass, r4 |
| 2.1 doubles/compact neighbourhoods | I; ∅; [−1,1]⊂ℝ | doubles S¹, ∅; [−2,2] | Pass, r4 |
| 2.2 zero-dimensional orientation | ±pt | two rays, one empty basis | Pass, r4 |
| 2.2 product/permutation sign | two lines; point×line | −1, +1 | Pass, r4 |
| 2.2 half-space orientation | I endpoints; dimension 3 | signs +,−; determinant +1 | Pass, r4 |
| 2.3 quotient adapters | ℤ on ℝ; irrational flow on T² | S¹ Hausdorff; dense orbits not Hausdorff | Pass, r4 |
| 2.3 disc/sphere bundle | ranks 1 and 0 over pt | ∂D¹=S⁰ (2 points); D⁰=pt, empty sphere | Pass, r4 |
| 2.3 finite support | compact interval into disjoint components | image in one component; compact discrete image finite | Pass, r4 |
| 2.4 collared witnesses | I×M; reversed; empty M | boundary M−M=0; reversal flips signs | Pass, r4 |
| 2.5 relative-cycle face | (I,∂I)→(I,∂I); →(pt,∅) | second impossible | Pass, r4 |
| 2.6 small representatives | ∅; one labelled point | cardinalities 0,1; stable class 0,1 | Pass, r4 |
| 2.7 quartic | degree 4 in CP³ | χ=24, p₁=−48, σ=−16, Â=2 | Pass, r4 |
| 2.7 orientation reversal | quartic reversed | p₁=+48, σ=+16, Â=−2, χ=24 | Pass, r4 |
| 2.7 elliptic fibre | E(1), F=3H−ΣE_i | F²=0; χ=12; σ=−8; c₁=F | Pass, r4 |
| 3.1 quotient/group inverse | O points; SO signed points | 1+1=0 in F₂; +1−1=0, +1+1=2≠0 | Pass, r4 |
| 3.2 external product | signed points; degrees 1,1 | (+)(−)=−; swap sign −1 | Pass, r4 |
| 3.2 intersection restriction | two lines in RP² | 1 mod 2; no SO orientation | Pass, r4 |
| 3.3 connecting map / ∂² | (I,∂I); square | ∂[I]=[1]−[0]; corners cancel | Pass, r4 |
| 3.3 excision/additivity | (X,X); two points | 0; F₂² or ℤ² | Pass, r4 |
| 3.4 orientation map | pt, ∅, signed points over x,y | 1,0,(1,0),(0,1) | Pass, r4 |
| 4.1 signed diagonal | edge [0,1] | ∂(−e⊗e)=AW−T·AW | Pass, r4 |
| 4.1 integral cup-one identity | c of degree 2 | all terms degree 5 | Pass, r4 |
| 4.1 Sq unit/instability/top square | a∈H¹(RP∞), 1 | Sq¹a=a², Sq²a=0; Sq⁰1=1 | Pass, r4 |
| 4.1 Cartan/Adem | a²; Sq¹Sq¹a | Sq¹a²=0, Sq²a²=a⁴; Sq¹Sq¹a=0 | Pass, r4 |
| 4.2 simple system | F₂[a], exponents 3,4 | a³ decomposable, a⁴ new | Pass, r4 |
| 4.2 transgression | path-loop K(F₂,2) | d₂:(0,1)→(2,0) | Pass, r4 |
| 4.2 dual Steenrod degrees | ξ₁,ξ₂ | degrees 1,3; middle term degree 3 | Pass, r4 |
| 4.2 Adams differential | (1,2), r=2 | target (3,3), stem 1→0 | Pass, r4 |
| 4.2 completion restriction | Prüfer 2-group; ℤ | 0 versus π₁=ℤ₂; ℤ₂ both | Pass, r4 |
| 4.3 Wu relation | RP² | v=1+a; Sq(v)=1+a+a²=w | Pass, r4 |
| 4.3 Thom relation | trivial line; tautological | SqU=U; Sq¹U=aU | Pass, r4 |
| 4.3 homotopy invariance limit | S² | w₂=0; stable tangent trivial | Pass, r4 |
| 4.4 odd operations | p=3, degree-2 y | P¹y=y³; β²y=0; P²y=0 | Pass, r4 |
| 4.4 odd simple system | F₃[y], 4,9 | y⁴ decomposable, y⁹ new | Pass, r4 |
| 4.4 Kudo signs/degrees | p=3, τx=ι₂ | τy=2βι₂; degrees 8,7 | Pass, r4 |
| 4.4 Milnor operation conventions | p=3, i=0 | ξ₁ degree 4, τ₀ degree 1; Q₁ degree 5 | Pass, r4 |
| 5.1 collapse/normal rank | framed point in ℝ; ∅ | degrees +1, 0; rank 1 | Pass, r4 |
| 5.1 stabilization | trivial normal line | rank 2; S¹→S², degree +1 | Pass, r4 |
| 5.2 finite embedding dependence | a+,b+,a−,b− orderings | reduced words of length 4 versus 0; both abelianize to 0 | Pass, r4 |
| 5.2 low-rank carrier | n=k=0; rank 1 | ℝ⁰ holds 0 or 1 point; π₁S¹=ℤ | Pass, r4 |
| 5.3 inverse | degree-one and constant maps | +pt and ∅; degrees 1,0 | Pass, r4 |
| 5.4a absolute transformation | X={x,y}, n=0 | (1,0),(0,1) to the two summands | Pass, r4 |
| 5.4b relative construction | (I,∂I) | I/∂I=S¹; generator +1; boundary +1−1 | Pass, r4 |
| 5.4c stable comparison | pt; stabilized commutator | imported isomorphism; commutator 0 both sides | Pass, r4 |
| 5.5 framed/ordinary comparison | +pt; η³ | 1↦1; 12ν↦0 in ΩSpin₃ | Pass, r4 |
| 5.6 identity umkehr | id_N | shift 0; M×_N N≅M | Pass, r4 |
| 5.6 orientation and relative guard | lines in RP²; f(t)=t fixed at 0 | O count 1, no SO orientation; rank 0 fails | Pass, r4 |
| 5.7 AHSS | pt; total degree 0; two components | only p=0; only (0,0); two copies of Ω₀ | Pass, r4 |
| 6.1 mod-two detection setup | π₀MO=F₂ | 2·1=0; 2 null through the unit | Pass, r4 |
| 6.2 joint characteristic numbers | RP², S²; x-,y-points | (1,1),(0,0); 1_x evaluates 1,0 | Pass, r4 |
| 6.2 degenerate parameter pairs | (pt,pt); ∅ | both 0 | Pass, r4 |
| 6.3 unoriented generators | RP², RP⁴, degree 3 | s₂=1, s₄=1; degree 3=2²−1 excluded | Pass, r4 |
| 6.3 real hypersurface exception | H_ℝ(2,4); H_ℝ(1,2) | binom(6,2)=15=1; Klein bottle s₂=0 | Pass, r4 |
| 6.4 odd Spin/SO equivalence | π₄ at p=3 | factor 16, a unit in ℤ_(3) not ℤ_(2) | Pass, r4 |
| 6.4 stable/fixed-rank distinction | oriented 2-planes | Euler class in degree 2 only unstably | Pass, r4 |
| 6.5 rational rank | degrees 4,8 | partitions 1,2 | Pass, r4 |
| 6.5 complex hypersurface | H_ℂ(2,3); H_ℂ(1,1) | s₂=−10; excluded CP¹ gives +2 | Pass, r4 |
| 6.5 incidence convention | v=w=(1,i,0) | bilinear 0; Hermitian 2 | Pass, r4 |
| 6.5 binomial gcd | N=2..12 | 2,3,2,5,1,7,2,3,1,11,1 | Pass, r4 |
| 6.6 Wall lift | RP²; oriented pt | H¹(RP²;ℤ)=0; 1−ρ=2 | Pass, r4 |
| 6.6 two derivations | σ₄ | ∂₂σ₄=σ₂, ∂₂²σ₄=1; ∂₁²=0 | Pass, r4 |
| 6.6 torsion multiplication | Y₆,Y₅ | δ(Y₆Y₅)=Y₅²≠0 | Pass, r4 |
| 6.6 pullback free quotient | degree 4 | Y₂²↔h₄; ℤ onto F₂ | Pass, r4 |
| 7.1 ABS/Dirac normalization | +pt; circle; K3 | 1, η, 2u²; quaternionic index 1 | Pass, r4 |
| 7.1 real Clifford signs | tangent/external units | squares −1, +1 | Pass, r4 |
| 7.2 low connective comparison | degrees 0–7 | ℤ,ℤ/2,ℤ/2,0,ℤ,0,0,0 both; K3 to the generator | Pass, r4 |
| 7.2 first excluded degree | degree 8 | ranks 2 versus 1; HP² in the kernel | Pass, r4 |
| 8.1 surface refinement | standard torus | q(a+b)=q(a)+q(b)+a·b, both cases | Pass, r4 |
| 8.2 filling criterion | genus 0,1,2 | 1,3,10 of 1,4,16 | Pass, r4 |
| 8.2 handle/Lagrangian | A⊕A | diagonal q-zero 2-plane; A has none | Pass, r4 |
| 8.3 Spin three-manifolds | T³; S³ | ΩSpin₃=0; 12ν≠0 forgets to 0 | Pass, r4 |
| 8.4 coefficient tables | degrees 0–4 | O,SO,Spin tables as listed | Pass, r4 |
| 8.4 parallelization headline | ℝ³, half-space, ∅, S³ | det +1; empty vacuous; Lie frame rank 3 | Pass, r4 |
| 8.4 orientability guard | RP²×ℝ | w₁=a≠0; no frame | Pass, r4 |
| 8.4 obstruction dimensions | BS³, 3-complex | first obstruction in H⁴=0 | Pass, r4 |
| 8.5 real projective filling | n=1,2 | ∂D²=RP¹; S³/±1=RP³ | Pass, r4 |
| 8.5 complex projective filling | n=1,2 | dimensions 3,7 / 2,6; fibre S² | Pass, r4 |
| 8.5 twistor orientation | q=1 | determinant −4 relative to (j,k) | Pass, r4 |
| 9.1 idempotent chart | v=(1,0,0),(1,1,0) | P²=P, trace 1 | Pass, r4 |
| 9.1 excluded wrong model | 0; identity | traces 0,3 excluded | Pass, r4 |
| 9.1 chart denominators/cells | origin; frame | 1>0; traces sum 3; cells 0,8,16, χ=3 | Pass, r4 |
| 9.2 compact type/isotropy | F₄/Spin(9) | 52−36=16 | Pass, r4 |
| 9.2 Clifford relations | nine generators on O² | 81 anticommutators 2δI₁₆ | Pass, r4 |
| 9.2 Clifford volume | C₀…C₈; flip C₈ | −I₁₆ versus +I₁₆ | Pass, r4 |
| 9.3 normal Bott/sign | OP¹⊂OP² | e(ν)=u, ∫u=1; reversed −1 excluded | Pass, r4 |
| 9.3 OP² imported data | p₂=6u, p₄=39u² | signature 1; Euler 3; one String lift | Pass, r4 |
| 9.4 obstruction table | RP²,CP²,HP²,OP² | w₁=a; w₂=h; λ=u; H⁴=0 | Pass, r4 |
| 10.1 realization low range | degree 0; C₃ even | 1 realized; H_even>0(C₃;ℤ)=0 | Pass, r4 |
| 10.1 degree-seven obstruction | lens-space product | coefficient 2 in F₃, nonzero | Pass, r4 |
| 10.2 product/base change | trivial bundle; id pullback | M×F both sides; dim M+dim F | Pass, r4 (now under the closed-fibre hypothesis) |
| 10.3 O/SO orientation kernels | RP², CP² | nonzero generators; target 0 | Pass, r4 |
| 10.3 semidirect action | conjugation, scalar i | degree +1; i↦−i | Pass, r4 |
| 10.3 degree-five torsion | Dold P(1,2) | ∫w₂w₃=1 | Pass, r4 |
| 10.4 Spin isotropy descent | two quaternionic blocks | 1+1=0 in π₁SO₈ | Pass, r4 |
| 10.4 PSC contraction input | HP² round metric | scalar ≥56>0, actual 128 | Pass, r4 |
| 10.4 BG generators / adjoint | x₁=1 | (1,0,0,0); w₈=w₁₂=1 with corrections | Pass, r4 |
| 10.4 Sq¹ table | exact polynomials | all four differences 0 | Pass, r4 |
| 10.4 Sq² table | same | all four differences 0 | Pass, r4 |
| 10.4 BH free basis/relation | fibre over basepoint | 1,u₄,u₄²; rank 3 | Pass, r4 |
| 10.4 vertical w and Gysin | HP² fibre | π!u₄²=1, others 0 | Pass, r4 |
| 10.4 KO Pontryagin definition | ℓ_ℝ; zero bundle | π₁=[ℓ_ℝ]−2; π₀=1 | Pass, r4 |
| 10.4 cover index | ∅, (2), (3) | k=0,8,10 | Pass, r4 |
| 10.4 A(1) Ext/KO normalization | a² versus h₀²b; η³ | (6,14) both; a²=4b, η³=0 | Pass, r4 |
| 10.4 shifted polynomial summand | f=1 in t₁₂F₂[t₂,t₃] | Sq²t₁₂=t₂t₁₂ | Pass, r4 |
| 10.4 Newton family | n=2,3 | −10; −28,−28 | Pass, r4 |
| 10.4 Newton gcd | n=2..8 | 10,28,6,22,26,4,34 | Pass, r4 |
| 10.4 point kernel / low range | n<8; n=8 | 0; HP² nonzero in degree 8 | Pass, r4 |

The new rows also exclude the plausible wrong models for the changed statements: a Thom isomorphism applied with the wrong rank (any rank other than r+e−d breaks the stated shift for the point-into-circle instance), integer instead of field coefficients in 6.2 (RP² row), the inverse quaternionic sign (c₂=+u would give p(HP²)=1−2u+7u², contradicting S1.5), and a fibre with boundary in 10.2 (the I-fibre row).

## Not verifiable

The changed passages cite only Miller, Thom, Borel–Hirzebruch I and Führing, all of which were read at the cited places. The texts the previous report could not read legally are untouched by this diff and remain as recorded there: Lee (Springer paywall), Milnor 1960 (JSTOR), Atiyah–Bott–Shapiro (Elsevier), Anderson–Brown–Peterson (JSTOR), McCleary, Stong (publisher page), Gompf–Stipsicz (AMS), Stolz 1992 (JSTOR) and the Mathlib proposal 31350. No new text was requested and no `sources.toml` exists for this roadmap; nothing was edited.

## Source issues

- none
