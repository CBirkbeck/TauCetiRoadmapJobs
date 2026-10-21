<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/110#issuecomment-6312453529 -->
Red team round 1 pass a (codex) of 538903f

Verdict: needs_changes

1. **F01** (P2) Arbitrary CN endpoint choices do not support the claimed lattice products

   **Location:** `packages/CohomologyComparisonsPartII/README.md:421,439–441`: “All maps are … compatible with cup products through the corresponding coefficient product maps.”

   **Claim:** The independently specified inclusive CN decompositions support the actual lattice product for every pair of weights.

   **Witness:** At p=2 choose a_c(1)=1 and a_c(2)=1, both allowed. Then L_CN(1)=2⁻¹Z₂(1), L_CN(2)=2⁻¹Z₂(2), but (1/2)(1/2)=1/4 is outside the target lattice. CN line 969–971 permits these endpoints.

   **Exact repair text:** Add to §4.1 and qualify §4.2: “For CN products use exponents a_r,a_s,a_(r+s) satisfying a_(r+s)≥a_r+a_s. Ordinary multiplication then maps L_CN(r;a_r)⊗L_CN(s;a_s) into L_CN(r+s;a_(r+s)). The floor convention satisfies this inequality. For arbitrary endpoint choices, first transport into such compatible lattices and record the scalar and error change; no unrescaled coefficient product is asserted otherwise.” Add the displayed p=2 counterexample as a negative-control Check and a proved coordinate-lattice example.

2. **F02** (P3) The finite-level lattice failure has no Lean mirror

   **Location:** `packages/CohomologyComparisonsPartII/README.md:434–435`; `packages/CohomologyComparisonsPartII/Suggested.lean:86–92`: “at n=1 its reduction is zero, not an isomorphism.”

   **Claim:** The Checks test that lattice inclusion can become zero after reduction, including the endpoint adapter.

   **Witness:** The Lean example only computes four spans and the equality 4⁻¹=2·8⁻¹. It contains no quotient, induced map, kernel, or non-isomorphism assertion. The existing `enLattice` and `cnLattice` supply the needed carriers.

   **Exact repair text:** Extend the existing lattice example, within the two-example limit, to prove that the map induced by `cnLattice 2 2 ≤ enLattice 2 2` on quotients by twice each lattice is zero, while both quotients are nonzero. Identify the generator coordinates explicitly so this tests the roadmap’s lattices. Similarly test the endpoint inclusion `cnLattice 2 0 → cnLattice 2 1` modulo 2, or combine it with the same proved coefficient-reduction calculation.

3. **F03** (P3) Every tested value of the second semistable differential is zero

   **Location:** `packages/CohomologyComparisonsPartII/Suggested.lean:139–167`; `packages/CohomologyComparisonsPartII/README.md:546–554`.

   **Claim:** The examples discriminate the lower Frobenius exponent and the adapter’s sign and factor for `semistableD1`.

   **Witness:** Replace `semistableD1` by the constant-zero function: all five D1 equalities in the examples remain true, including the scaled and zero-index cases. No example evaluates either summand of D1 to a nonzero value.

   **Exact repair text:** Add to the existing rank-two example and the README Checks, with φ=diag(1,2) and Ne₁=e₀: “D1(2,0)(e₁,0,0)=e₀; D1(2,0)(0,0,e₀)=e₀; D1(2,1)(0,0,e₁)=e₁; after replacing N by −N/2, D1(2,0)(e₁,0,0)=−e₀/2.” Prove these conjunctions in the existing example. These test the N term, lower exponent, subtraction sign and ramification scalar independently.

4. **F04** (P1) The Koszul-to-continuous-cohomology bridge is unowned

   **Location:** `packages/CohomologyComparisonsPartII/README.md:80,146,477–479`: “General Koszul complexes, their signs, maps and tensor rules”.

   **Claim:** DerivedModuleAlgebra §0.K.1 and the listed local-period contracts supply the Koszul inputs needed to reach continuous Galois cohomology.

   **Witness:** `TauCetiRoadmap/DerivedModuleAlgebra/README.md:518–537` supplies scalar-sequence Koszul complexes. CN line 1880 and line 1922 require a twisted arithmetic-direction map; CN line 1933–1942 separately proves λ:Kos(Γ_R,M)≃RΓ_cont(Γ_R,M). No listed contract requests λ.

   **Exact repair text:** Replace the general-carrier attribution by: “DerivedModuleAlgebra §0.K.1 supplies scalar Koszul complexes. QWittVectors §1.7 `CommutingEndomorphisms.koszulComplex` supplies the commuting-module-action cochain complexes. The arithmetic semidirect-product totalization and its continuous-cohomology comparison are supplied by `gap:local-period-koszul-resolution`.” Add that gap to the README under PadicHodgeTheory, to `design/plan.json`’s `gaps`, and to §4.4’s prerequisites, with supplier `PadicHodgeTheory`, section “CN §4.2, pp. 39–41, CN line 1824–1942”, and needs: “For the CN chart group Γ_R and its period coefficient modules M=S(r), with S=A_R, A_R^[u,v] or A_R^(0,v]+, and their finite reductions, supply the twisted Koszul totalization of CN §4.2 and the natural quasi-isomorphism λ:Kos(Γ_R,M)≃RΓ_cont(Γ_R,M), compatible with coefficient maps, Frobenius and reduction, using the commuting-endomorphism carrier of QWittVectors §1.7 for the Γ′_R directions.” Include the resulting φ-fibre comparison in this contract’s API.

   This is an additional prerequisite, not a rejection of any declared comparison gap. The Artin–Schreier and inflation/decompletion statements currently requested by `local-period-galois` already start with continuous cohomology and do not supply λ. The existing sibling target is `TauCetiRoadmap/QWittVectors/README.md:228`; import it instead of planning the commuting-action construction again.

5. **F05** (P2) The continuous-differential comparison omits its general acyclicity form

   **Location:** `packages/CohomologyComparisonsPartII/README.md:650–654`: “such that every relative rigid cohomology sheaf is coherent”.

   **Claim:** Coherence is the hypothesis of the only exported relative continuous-differential comparison.

   **Witness:** AM line 639–645 assumes Hʲ(S_K^an,Rⁱu_rig j†O)=0 for every i≥0,j>0; coherence is explicitly only a sufficient example. The README proof itself uses this vanishing, not finiteness of those sheaves.

   **Exact repair text:** Replace the main §6.5 hypothesis by “For every i≥0 and j>0, Hʲ(S_K^an,Rⁱu_rig j†O)=0.” Keep the smooth affine hypotheses on U and S and the existing conditional Frobenius compatibility. Export the same comparison under this hypothesis, then add `RelativeCohomology.continuousDifferentialComparison_ofCoherent`: “If all relative rigid cohomology sheaves are coherent, the affine coefficient-vanishing contract supplies the preceding hypothesis.” Carry both targets and their respective prerequisites in the subsection. This retains the source’s general theorem and the currently stated coherent corollary.

6. **F06** (P3) The fibre-coordinate tests never exercise the first differential

   **Location:** `packages/CohomologyComparisonsPartII/README.md:240–242`; `packages/CohomologyComparisonsPartII/Suggested.lean:29–42`.

   **Claim:** The three coordinate Checks discriminate the degreewise fibre differential.

   **Witness:** Replacing its first coordinate d_A(a) by zero passes both concrete evaluations and the general zero-input example. The third Check repeats `fiberCoordinatesDifferential_zero`, so there are only two discriminating Checks and neither tests d_A.

   **Exact repair text:** Replace the zero-input Check by: “With d_A=id, d_B=2·id and f=3·id on ℚ, `fiberCoordinatesDifferential d_A d_B f (2,5)=(2,−4)`.” Replace the second proved example by this computation, or add it to the first example while keeping at most two examples for the definition. Keep the zero formula as API, not as the third discriminating Check.

7. **F07** (P3) `enLattice` has only two definition Checks

   **Location:** `packages/CohomologyComparisonsPartII/README.md:425,433–435`; `packages/CohomologyComparisonsPartII/Suggested.lean:78–92`.

   **Claim:** The listed Checks cover each of the two coordinate-lattice definitions.

   **Witness:** `enLattice` occurs only at weight zero and at p=2,r=2. The endpoint Check and the other two computed spans test `cnLattice` exclusively. There is no third EN Check.

   **Exact repair text:** Add: “At p=3,r=4, a=2 and the EN generator is 1/18, but `enLattice 3 4 = cnLattice 3 2` because 2 is a 3-adic unit. Thus a nontrivial factorial coordinate need not give a strict lattice inclusion.” Prove this conjunction in the existing lattice examples. It complements the strict inclusion at p=2 and the weight-zero unit case without adding a third example declaration.

## Verified sound

Coverage: all 816 README lines and all 169 Lean lines read. The inventories cover 33 numbered mathematical subsections, 172 distinct named target/API entries (175 occurrences, including the imported monoidal-exactness predicate), all 93 bold items, and all 113 named Checks. The bold items include 32 gap contracts and 35 Check headings. All 15 Lean declarations were read: five real-bodied definitions, four admitted theorem signatures and six proved examples. The mathematical evaluations below were checked by hand; no Lean execution was performed.

All 212 distinct source-line locator strings were inspected in their surrounding text across the 23 certified cached works. This verifies the locations and context, not every strengthening of their conclusions: R01, R04 and R05 identify substantive qualifications. The 14 pinned Lean source files have URLs at the manifest commits; their extracted contents also match the corresponding locally available library files. The exact-category, abelian Ext, mapping-cone, isocrystal, period-ring, scalar-action and product-map carrier boundaries agree with the cited declarations. Object searches found syntomic algebra predicates, not an existing log-syntomic cohomology implementation.

The three supplied sibling folders were searched for ownership. The package makes zero explicit supplier citations to those three roadmaps; the relevant QWittVectors §1.7 omission is R04. Current main supplier sections in AdicSpacesPartIV, RigidAnalyticGeometry, EnhancedDerivedSheaves, EtaleCohomologyFoundations, DerivedModuleAlgebra and GrothendieckEulerForms were inspected, including the scalar-Koszul and exact-Yoneda boundaries. No contrary ownership result was found in the two other supplied siblings. The 32 declared gap slugs and needs agree between the README and design registry, and none has supplier `none`. Their absence from unavailable supplier packages is not a finding.

The prescribed dependency check exited successfully:

```text
depcheck: 4 roadmaps, 30 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The proposed QWittVectors and PadicHodgeTheory inputs in R04 are earlier suppliers, so the repair introduces no upward edge. No target move from a later owner is required. The small graph reported by the tool does not certify the content of unavailable suppliers.

The head matches 538903f. The comparison with origin/main contains eight changed files, all inside `packages/CohomologyComparisonsPartII`; the whitespace check passed. Suggested.lean has one `import Mathlib`, appropriate namespaces and layer ordering, declaration docstrings, and no `set_option`, admitted data, admitted examples, `lemma` declarations, forbidden diagnostic commands or empty propositions. All nine named Lean declarations occur in the README. No computational algorithm target or pull-request number was found in the README or Lean docstrings. The prior repair reports were read; none of R01–R07 re-raises a finding settled as not actionable.

The four theorem signatures are mathematically valid on their explicit binders. The remaining geometric headlines require carriers absent from this file; no forced surrogate headline or additional demonstrably easy missing geometric headline was identified.

### Declaration/context and adversarial table

In this table, every module is an additive commutative group with its displayed module instance. All binders are local to the declaration; no standing hypothesis silently disappears from a `sorry` statement. Carrier universes are independent `Type*` universes.

| Declaration / line | Layer and variable/instance context | Instances tried / result | Change |
|---|---|---|---|
| `FilFMIC.fiberCoordinatesDifferential` / 20 | 1; four independent `Type*` carriers, each additive group and Q-module; Q-linear dA,dB,f; pair x | Zero spaces; first and second basis inputs; dA=id,dB=2id,f=3id: value (2,−4) at (2,5). Definition has correct signs. | R06 tests |
| `example` / 29 | 1; Q in all four carriers, dA=0,dB=id,f=2id | Values (0,2),(0,−1) correct; neither exercises dA. | R06 |
| `example` / 37 | 1; same general carriers/maps as definition | Zero input gives zero; also passes if first component is deleted. | R06 |
| `Syntomic.enLattice` / 52 | 4; p,r natural; `[Fact p.Prime]`; span over `PadicInt p` in `Padic p` | r=0; p=2,r=2; p=3,r=4. Denominator nonzero; spans correct. | R07 tests |
| `Syntomic.cnLattice` / 60 | 4; p,a natural; `[Fact p.Prime]`; same padic modules | a=0,1,2; both allowed weight-one exponents at p=2. No unprovided Tate action claimed. | R01,R02 tests |
| `Syntomic.cnLattice_le_enLattice` / 65 | 4; p,r natural; prime instance explicit | EN generator multiplied by integral a! gives CN generator. Includes a=0 and p=2. | None to theorem |
| `Syntomic.modifiedLattice_generator` / 71 | 4; p,r natural; prime instance explicit | Nonzero p and factorial in Qp permit cancellation; p=2,r=2 gives 1/4=2/8. | None to theorem |
| `example` / 79 | 4; arbitrary prime p; r=a=0 | Both spans generated by 1. | None |
| `example` / 86 | 4; p=2, r=2, a=2,1,0 | Four spans and factorial identity correct; quotient maps untested. | R02,R07 |
| `ClassicalSyntomic.semistableD0` / 103 | 5; p,r natural; independent Q-modules D,E; Q-linear phi,N,iota; x:D | r=0,1; rank zero; rank-two block; p=0 remains a defined coordinate function. | None to definition |
| `ClassicalSyntomic.semistableD1` / 111 | 5; p,r natural; same D,E; phi,N; y:D×E×D | r=0 gives lower operator 1−p phi; nonzero tests in R03 distinguish both summands. | R03 tests |
| `ClassicalSyntomic.semistable_d_squared` / 118 | 5; p,r natural, prime instance; Q-modules D,E; phi,N,iota; explicit h:N phi=p phi N; x:D | D1D0=−p^(−r)N phi x+p^(1−r)phi N x=0. Valid at r=0 and on rank-zero modules. | None |
| `ClassicalSyntomic.semistable_baseConvention_differentials` / 129 | 5; p,r,e natural; Q-modules D,E; phi,N,iota; x,a,c:D,b:E; no prime/monodromy assumption | Linearity gives both identities for scalar −1/e, including e=0. Only the separately stated equivalence requires e≠0. | None to theorem |
| `example` / 140 | 5; general p,r, Q-modules D,E, phi,N,iota | Both zero-input results correct but nondiscriminating alone. | R03 |
| `example` / 150 | 5; D=E=Q²; phi=diag(1,2); N(e1)=e0; iota=id | r=0,1 and e=2,0 values correct; every evaluated D1 value is zero. | R03 |

### README adversarial pass

Each row covers the named milestone and its associated API in the indicated subsection. The per-target inventory records each of the 175 occurrences separately. “None” means no additional defect established under the explicitly declared contracts, not a certification of an unavailable supplier implementation.

| Statements | Instances tried | Result | Change |
|---|---|---|---|
| §1.1 milestone and component API | Zero coefficient; generic-only component; nonhorizontal morphism | Realization faithfulness correctly distinguished; conditional on coefficient contract | None |
| §1.2 milestone and component API | Tate weights 0,1,−1; identity pullback; inverse dual | Tensor and filtration signs consistent | None |
| §1.3 milestone and component API | Split extension; strict versus underlying exact sequence; degree zero | Uses exact-category Ext contract, not arbitrary abelian Ext | None |
| §1.4 milestone and component API | Coordinate vectors (1,0),(0,1),(2,5); zero coefficient | Fibre sign consistent; first differential untested | R06 |
| §1.5 milestone and component API | i=0; split 1-extension; identity coefficient map | Connecting evaluation and its source unit consistent | None |
| §1.6 milestone and component API | F⁰H=0; split extension; failure without vanishing | Unique lift and injection use the actual filtration hypothesis | None |
| §2.1 milestone and component API | Empty special fibre; identity map; ramified coefficient extension | Distinct K and K0 retained; geometric coherence conditional on contracts | None |
| §2.2 milestone and component API | Point; zero realization; semilinear Frobenius | Two-equation fibre and Qp linearity consistent | None |
| §2.3 milestone and component API | K=K0; specialization zero; odd cohomological degree | Elimination uses bc=id, not invertibility of specialization | None |
| §3.1 milestone and component API | r=0,p−1,p; n=1; p=2; higher lifts | Division performed before finite reduction | None |
| §3.2 milestone and component API | Weight zero; n=1; syntomic versus etale sites | Kernel identification restricted to the syntomic site | None |
| §3.3 milestone and component API | r=0; p=2,r=1,n=1; cup weights added | Composite scalars and nonmultiplicativity warning consistent | None |
| §3.4 milestone and component API | n=1; tail towers; trivial and boundary logs | Derived limit and arithmetic-pair restrictions retained | None |
| §4.1 milestone and component API | p=2,r=0,1,2; p=3,r=4; mod-p inclusion | Arbitrary endpoint products fail; EN test count and reduction mirrors deficient | R01,R02,R07 |
| §4.2 milestone and component API | Trivial-log Zp; weight zero; incompatible endpoint choices | Generic trivial-log locus correct; product claim needs compatible exponents | R01 |
| §4.3 milestone and component API | p=2,r=0,1; p=3,r=1,2; Cartier on Gm | Exact range and divided source agree with EN; Cartier coefficient rule retained | None |
| §4.4 milestone and component API | p=2 positive weight; xy=pi^h with h>1; q>r | Bounds retain source qualifications; continuous-cohomology bridge unowned | R04 |
| §4.5 milestone and component API | Empty generic or closed restriction; r=0; reduction | Recollement uses the declared topos contract | None |
| §5.1 milestone and component API | Zero cohomology; rank-one N=0; non-Cartier multiplicity chart | Cartier type retained; classical monodromy relation consistent | None |
| §5.2 milestone and component API | Rank-two phi=diag(1,2); r=0,1; e=0,1,2 | Four Lean identities true; D1 checks admit a zero replacement | R03 |
| §5.3 milestone and component API | Identity realization; geometric base extension; q>r | Period truncations and supplier ownership retained | None |
| §6.1 milestone and component API | Point family; nonproper family; failed comparison isomorphism | Datum does not assert unjustified finiteness | None |
| §6.2 milestone and component API | Zero cohomology; failed algebraic finiteness; identity base change | Independent algebraic hypotheses explicit; promotion uses actual datum | None |
| §6.3 milestone and component API | Empty vertical boundary; Gm compactification; bad relative crossing | Both total and relative normal crossings and log integrality retained | None |
| §6.4 milestone and component API | P1 family; open curve; missing good compactification | Finiteness supplied only on contracted geometric domains | None |
| §6.5 milestone and component API | Affine identity; nonaffine positive-genus curve; acyclic coefficients | General source acyclicity form omitted | R05 |
| §6.6 milestone and component API | Gm with residues 1,−1; nonsplit degree-two boundary; empty boundary | Trace and twist −1 consistent; affineness excludes missing-boundary proper curve | None |
| §6.7 milestone and component API | n=0; split extension; H1(Gm)(2) | Tate filtration removes lift ambiguity; residue twist retained | None |
| §7.1 milestone and component API | Residue 0,1; sigma(t)=t^p+p; arbitrary lift t=p | Frobenius-compatible lift, not arbitrary lift, required | None |
| §7.2 milestone and component API | Rank zero; empty special fibre; finite residue field t^p−t | Algebraic closedness and finite-projective hypothesis used | None |
| §7.3 milestone and component API | Point identity; split extension; t=p wrong lift | Differential-form pullback distinguished from cotangent-fibre evaluation | None |
| §7.4 milestone and component API | Horizontal versus vertical log point in weight one; Gm | H1 dimensions 1 versus 2 correctly prevent false identification | None |
| §7.5 milestone and component API | n=0; curve n=1,r=2; split extension; missing filtered vanishing | Positive connecting sign and both hypercohomology vanishings retained | None |

## Not verifiable

- Lean elaboration and tactic execution: prohibited by this read-only review brief. The report certifies the manual signature and arithmetic audit, not a fresh build. No process was left running.
- Accepted sections unavailable in the supplied inputs: CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology and PadicHodgeTheory. Their declared extension contracts were checked against their named sources, but current implementation names and the base §4.5 monodromy convention could not be independently certified. In particular, the adapter is algebraically correct for the stated convention; the unavailable base text remains conditional.
- Fine details lost in OCR: some BesserI fibre diagrams and TsujiNearby displayed formulas are incomplete in the cached extraction. The Besser fibre signs were cross-checked against AM equations (3.11)–(3.12) and the explicit cone calculation. Tsuji's theorem locations and prose hypotheses were checked; damaged displayed symbols are not independently certified from OCR alone.
- BesserII remains the manifest's settled `uncertified` entry. It is not used to establish a finding or a needed producer target here. No new missing-reference request is outstanding.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "538903f6e09e879f57ca6377395285ef6b17a79f", "job": "RT-CohomologyComparisonsPartII~1a", "model": "gpt-6-astra", "worker": "chris-1"} -->
