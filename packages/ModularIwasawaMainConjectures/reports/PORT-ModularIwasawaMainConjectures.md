# Port report: ModularIwasawaMainConjectures

- Branch: `roadmap/modular-iwasawa-main-conjectures`.
- Head commit: `5990eb1f409fc70a1552000d8721982e225edafb`.
- Starting commit: `b41e47b`; starting `git status --short` was empty.
- Changed content: `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md`, `TauCetiRoadmap/ModularIwasawaMainConjectures/Suggested.lean`, `TauCetiRoadmap/ModularIwasawaMainConjectures/metadata.toml` only.
- The normative writing checklist and contribution rules were read in the repository-root `README.md` and `CONTRIBUTING.md`; the parent-relative paths in the supplied instructions do not exist in this checkout.
- Models inspected: `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`, `TauCetiRoadmap/LocalGaloisGroups/README.md` and `Completed/OrthogonalL2Bases/README.md`.

## Validation

Command: `lake build TauCetiRoadmap.ModularIwasawaMainConjectures.Suggested`.

Exact module outcome:

```text
⚠ [8983/8983] Built TauCetiRoadmap.ModularIwasawaMainConjectures.Suggested (3.7s)
Build completed successfully (8983 jobs).
```

Exit status 0. Warning count: **3**, all `declaration uses sorry`, at `Suggested.lean` lines 47, 59 and 69. No other warnings or errors. The file is byte-for-byte identical to the accepted package, so no further build was needed after prose-only changes.

All four declarations were placed in one scratch file followed by explicit `#check @...` commands and elaborated together. Exit status 0, with the same three sorry warnings. The quotient definition retains the coefficient-ring/module binders; the unipotent theorem retains the domain/DVR, square-zero and primitive-image assumptions; the subgroup theorem retains primality, `5 ≤ p`, closedness and reduction surjectivity; the transcendence theorem retains primality, the unit parameter, norm bound and algebraic-j assumption. Each elaborated type agrees with the README. No binder changed.

Final push gate:

```text
gate ModularIwasawaMainConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The pre-commit gate had all content checks zero and failed only because the three added files were uncommitted. The final invocation above is against the clean commit. `git diff --check` and the staged whitespace check passed.

Exact dependency-direction output with the supplied order and `--movable`:

```text
depcheck: 47 roadmaps, 526 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Neither tooling nor the merge order was edited.

## Draft pull request body

Build the ordinary, cohomological and signed formulations of the cyclotomic main conjecture for modular forms and their families, with the lattice, period, Coleman-image and Euler-factor comparisons needed to pass between them. The roadmap combines the independently owned Euler-system and automorphic bounds, transports the results to elliptic curves, and develops cyclotomic heights, leading terms and rank-zero consequences while retaining integral corrections and the precise hypotheses of each theorem.

AI assistance: port, source and supplier checks, mathematical instance audit and Lean validation by Codex (OpenAI, GPT-6). The accepted package credits Claude (Anthropic) and Codex (OpenAI).

## Supplier roadmaps still in pull requests

Direct mathematical suppliers with new roadmap folders in the supplied open-head index or supplied checkout:

- AlgebraicModularFormsAndSerreWeights.
- ArithmeticGaloisDuality.
- ArithmeticGaloisRepresentations.
- AutomorphicGaloisRepresentations.
- CrystallineCohomology.
- DirichletPadicLFunctions.
- EllipticCurveModularity.
- EulerSystemsAndKolyvaginSystems.
- GrossZagierAndArithmeticHeights.
- ModularSymbolsPadicLFunctions.
- NeronModelsAndSemistableAbelianVarieties.
- PadicFamilies.
- PadicHodgeRegulators.
- PadicHodgeTheory.
- PhiGammaModulesAndIwasawaCohomology.
- SelmerIwasawaCohomology.
- SerreWeightAndLevelOptimisation.

SelmerIwasawaCohomologyPartII is an open ownership neighbour, not an input to the explicit sigma-height construction. HeegnerPointEulerSystems is an open downstream consumer, not a supplier. KatoEulerSystems and AutomorphicCongruences are earlier board-package suppliers, without content-repository roadmap heads in the index; their exact source branches were read. Main-branch suppliers include PadicMeasuresIwasawaAlgebras, SchemeAndStackFoundations and the foundational arithmetic roadmaps identified under Scope and ownership.

## What moved from Lean to the README

Nothing. `Suggested.lean` already satisfies the acceptance-file form: one `import Mathlib`, one used Tau Ceti module, one simple definition and three admitted headline theorems. There is no sorry'd data, API padding, example catalogue or option override. All four declarations, both imports and the module docstring were retained. `metadata.toml` is unchanged and has the single key `topic = "math.NT"`.

The README retains the seven layers, every target and API item, every existing Check, all worked examples and the opening Summary. It adds the quotient definition's prose API and further discriminating Checks; it does not introduce extra Lean declarations to mirror them. Every layer still ends with Examples and Dependencies.

## Supplier replacements, ownership and duplication

The object sweep used `roadmaps list`, `roadmaps grep` and `roadmaps show` over main and the indexed open heads, the board packages, the supplied sibling checkouts, and the pinned Mathlib/Tau Ceti sources. Searches were by mathematical object: genuine unipotence and integral cokernels, closed SL₂ subgroup lifting, p-adic Mahler–Manin, sigma heights and Schneider leading terms, exceptional-zero families, canonical/Kato periods, Coleman images and global flat duality.

The retained algebraic quotient theorem is a primitive square-zero rank-two statement over every DVR, not a new coinvariants functor. ArithmeticGaloisRepresentations §6.4a supplies abstract Frattini detection, but does not identify the mod-p quotient of SL₂ as a detecting quotient; §3.6 owns that p≥5 arithmetic matrix-group theorem. The retained transcendence headline is the p-adic theorem on the native Tate curve; DiophantineApproximationAndTranscendence §5.6 states a complex algebraic-independence theorem. Generic Nekovář/Bockstein heights in NoncommutativeAndEquivariantIwasawa are distinct from the explicit elliptic sigma height and Schneider-specific flat realization here; no comparison to a generic Nekovář height is promised.

Two generic algebra restatements were replaced by supplier applications: determinant base change in §0.6 and characteristic-ideal coefficient base change in §5.2 now refer to PadicMeasuresIwasawaAlgebras §§5.1 and 4.6. The arithmetic compatibility statements remain. Their ownership is recorded only in Scope and ownership. No theorem was deleted from Lean.

The accepted repairs importing Tate-parameter existence from PadicHodgeTheory §9.3 and the away-p multiplicative inertia criterion from ArithmeticGaloisRepresentations §6.3 were verified and preserved. No second Tate construction or residual-inertia theorem was added. No notion moved down from a later roadmap.

AutomorphicCongruences has independently stated endpoints in its source branch. Blanket extension references were replaced by §1.11 (Skinner–Urban), §2.21 (ordinary Fouquet–Wan), §§3.4 and 3.7–3.9 (lines and universal zeta), §§4.3 and 4.5–4.6 (family, pointwise and specialization), and §§7.9–7.10 (BCS). Its integral §7.10 retains correction-unit assumptions beyond BCS Theorem 1.1.2(b), so the accepted full-range contract remains explicit; the full BCS headline was not narrowed to that supplier's conditional variant.

All supplied open-head folders were included in the ownership search. No additional open pull request without supplied files was fetched. Ownership against unnamed open work outside the index was not checked. The unavailable named board designs have not been treated as supplying declarations.

## Citation and pin evidence

The actual worktree pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; both dependency checkouts were checked against the manifest. No pin changed.

- Mathlib `Representation.invariants` and `Representation.invariants_eq_top`: `Mathlib/RepresentationTheory/Invariants.lean` lines 73 and 85. The definition requires fixed vectors, not continuity or finite dimension.
- Mathlib `ContRepresentation`: `Mathlib/RepresentationTheory/Continuous/Basic.lean` line 54. Its operators are continuous linear maps; continuity of the orbit map is not a structure field.
- Mathlib `CuspForm.rank_eq_zero_of_weight_lt_twelve`: `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean` line 155.
- Tau Ceti `tateCurveAt`: `TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Specialization.lean` line 70. This is the one Tau Ceti import actually used by Lean.
- Tau Ceti completed group algebra: `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` line 145; coefficient/group maps in `Map.lean` lines 92 and 143; power-series coordinate in `PowerSeries.lean` lines 350, 368 and 374; tame product in `Prod.lean` line 345. The coordinate is over ℤ_p, so the general O-coefficient interface remains a roadmap supplier contract.

Supplier source identifiers used below: KatoRoadmap is `packages/KatoEulerSystems/README.md` on `import/explorer-kato-euler-systems`, blob `fecb7486719a3944b0a000701e624a502cfd5a6e`; ACRoadmap is `packages/AutomorphicCongruences/README.md` on `import/explorer-automorphic-congruences`, blob `f7bf38fc6c4db0dd7bfef8574cbea65fdfd81bd4`. RegulatorRoadmap is the supplied `TauCetiRoadmap/PadicHodgeRegulators/README.md` head `1a3728e`; HeightRoadmap is `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` at `648f059`.

| Supplier | Exact sections verified | Evidence |
| --- | --- | --- |
| KatoEulerSystems | §§2.2,4.2–4.3,5.1–5.2,5.4,6.2–6.4,6.6,7.2,7.4,7.6,7.9 | KatoRoadmap line 734; KatoRoadmap line 1158; KatoRoadmap line 1231; KatoRoadmap line 1415; KatoRoadmap line 1455; KatoRoadmap line 1515; KatoRoadmap line 1680; KatoRoadmap line 1711; KatoRoadmap line 1738; KatoRoadmap line 1800; KatoRoadmap line 1887; KatoRoadmap line 1969; KatoRoadmap line 2036; KatoRoadmap line 2115 |
| AutomorphicCongruences | §§1.11,2.21,3.4,3.7–3.9,4.3,4.5–4.6,7.9–7.10 | ACRoadmap line 625; ACRoadmap line 1065; ACRoadmap line 1187; ACRoadmap line 1270; ACRoadmap line 1302; ACRoadmap line 1320; ACRoadmap line 1430; ACRoadmap line 1462; ACRoadmap line 1478; ACRoadmap line 2095; ACRoadmap line 2112 |
| PadicHodgeRegulators | §§8.8,8.22,9.12,9.14–9.15,9.17–9.21,9.26,9.29–9.30 | RegulatorRoadmap line 1697; RegulatorRoadmap line 1933; RegulatorRoadmap line 2113; RegulatorRoadmap line 2131; RegulatorRoadmap line 2149; RegulatorRoadmap line 2179; RegulatorRoadmap line 2243; RegulatorRoadmap line 2324; RegulatorRoadmap line 2379; RegulatorRoadmap line 2417 |
| GrossZagierAndArithmeticHeights | §§3.5,3.7,3.10 | HeightRoadmap line 1169; HeightRoadmap line 1226; HeightRoadmap line 1268 |

Every other cited supplier section was checked in the main copy when present, otherwise at the indexed new-roadmap head. This includes all cited local-condition, duality, control and structure sections of SelmerIwasawaCohomology; the odd-prime control, family period and representation sections of PadicFamilies; the four cited modular-symbol sections; the crystalline/Wach and Steinberg sections of AutomorphicGaloisRepresentations; the local logarithm; Néron models and component groups; the two crystalline comparison sections; the three level-lowering/weight sections; EllipticCurveModularity R29.4–R29.6; and the named main-branch arithmetic foundations.

The final citation resolver flags AutomorphicCongruences §1.11, KatoEulerSystems §2.2 and PadicHodgeRegulators §8.8 as absent. These are index-coverage leads, not missing citations: the first two were read at the exact board source branches above, and the third at the supplied head. It flags no Lean name. Its header uses cached main `ae2562c` and says it has no pinned Lake packages; main/pin verification for this port therefore used the actual `b41e47b` worktree and manifest checkouts directly, not that header.

## Mathematical and editorial fixes

1. **Formal-group sigma oddness.** “Odd t+…” could be read as an odd power series in t, contradicting the existing a₁t²/2 coefficient. The characterization now says σ_p(−P)=−σ_p(P) under the formal-group inverse. The new 14a1 Check computes t(−P)=−t−t²+O(t³), giving −t−t²/2 after composition, while substituting −t gives −t+t²/2. Evidence: SW line 720; SW line 728; MST line 132. The [Stein–Wuthrich sigma discussion](https://wstein.org/papers/mcom2649-iwasawa-alg.pdf) gives the group-inverse condition and nonzero quadratic coefficient.
2. **Local semistability.** The Manin p-unit explanatory hypothesis now says E semistable at p, rather than globally semistable. This matches HeightRoadmap line 1226 and preserves the source's broader local range.
3. **Arbitrary-conductor rank-zero implication.** §5.4(3) no longer relies on source-reported context about an uncited proof in Wan's thesis. It states the explicit p>3, good ordinary, residual-irreducibility range and derives nonvanishing from §3.4's rational BCS equality, the Kummer sequence and augmentation control. At (X), p is a unit, so X_Γ of rank zero forces X_(X)=0 by Nakayama. The added model R/(p) has augmentation quotient ℤ/p and characteristic value p≠0, exhibiting why rational equality suffices. Evidence: BCS line 59; SkinnerConverse line 44; the ordinary control contract of SelmerIwasawaCohomology §3.11. The [BCS theorem](https://arxiv.org/abs/2405.00270v2) supplies the arbitrary-conductor rational input.
4. **Interpolation uniqueness.** Specified infinitely many distinct finite-order characters, excluding repetitions as a uniqueness premise. This uses bounded Iwasawa series and Weierstrass preparation, not arbitrary analytic functions.
5. **Native quotient API.** Added conjugacy invariance, the distinction between free integral rank one and rational rank one, and coefficient extension to the prose API of HasRankOneCoinvariants. Added O=F₂[[t]], zero-module and zero-ring controls without adding Lean padding.
6. **Small-prime lifting witness.** Added explicit enumeration of determinant-one lifts: all 125 lifts of the standard unipotent modulo 5 have fifth power I+5N modulo 25, while the 27 lifts modulo 3 have cubes I,I+3N,I+6N modulo 9. This supplements the existing binary tetrahedral counterexample. LSTX line 19 records Serre's rank-two theorem with ℓ≥5; it is not their higher-dimensional Theorem 1.
7. **Exact supplier repair and generic duplication.** Applied the replacements and ownership changes described above. No arithmetic theorem's full source range was narrowed to a supplier's weaker integral variant.
8. **Unsupported absence wording.** Replaced the unneeded statement that Mathlib lacks the local Iwasawa logarithm by a positive citation of DirichletPadicLFunctions §0.6. The supplier interface, normalization and target mathematics are unchanged.

The source, layer, hypothesis, API and Check audit retains the accepted p=2 Kato length formulation, actual integral unipotence, the p-adic period defect, the fractional Coleman image, the strict/inertia split at multiplicative p, the unit-root Frobenius correction, Werner's height correction, and the extra coordinate logarithm at split leading terms. No source passages were copied into the roadmap.

## Unresolved supplier extensions

These are the accepted package's mathematical extension contracts, not elaboration or gate failures. Their precise statements remain in Exact supplier contracts and their consumers' Needs lines. Their suppliers are earlier in the merge order.

| Contract | Supplier and outstanding mathematics |
| --- | --- |
| modular-zeta-extensions | KatoEulerSystems: pass from the supplied strict-kernel bound with a free rank-one quotient to the general cohomological and ordinary integral bounds in that range, retaining local degree-two terms. Its printed §7.2 still uses the full SL₂ image for the integral assertion. |
| central-critical-specialization | KatoEulerSystems: vanishing-central-value placement and discrete Bloch–Kato specialization/control, beyond its nonvanishing-value finiteness theorem. |
| signed-regulators | PadicHodgeRegulators: Kobayashi multipliers, integral a_p=0 images, and the general-weight ordinary integral Coleman image. The existing rational image and elliptic map are cited directly. |
| automorphic-endpoints | AutomorphicCongruences: full BCS integral endpoint under (Im), beyond the extra correction-unit assumptions of its §7.10. Its ordinary, universal-zeta, family, pointwise and rational BCS endpoints now have exact existing section citations. |
| manin-period-comparison | GrossZagierAndArithmeticHeights: saturated optimal homology-to-modular-symbol canonical-period comparison, including primes dividing the X₁→X₀ degree. Existing Manin constant and isogeny results are cited directly. |
| approximant-period-units | PadicFamilies: verify the perfect integral coefficient pairing and saturation at the approximating weights; otherwise retain fractional period corrections. |
| general-exceptional-zero-families | PadicFamilies: all-odd-prime rational exceptional-zero family/period/eigenvalue comparison, including reducible residual points. |
| global-flat-duality | ArithmeticGaloisDuality: Artin–Mazur flat duality over the rings of integers in the cyclotomic tower, with Néron component errors. Its étale/lattice duality after p-inversion is not this result. |

HeegnerPointEulerSystems requests a GL₂-type integral rank-zero interface stronger than the elliptic leading-term formula here. That consumer request is not silently claimed fulfilled. The source issues in Hida's auxiliary lemma/addendum concern the downstream Katz μ proof, not a target or proof input here. Primary Serre and Jones texts remain the accepted manifest's uncertified citations; the relevant endpoints are also stated in LSTX and Stein–Wuthrich, respectively. No new reference request was required. No suspicious instruction requesting credentials, execution of fetched code, external edits or communication was encountered.

No worker-created Lean, source-fetch or rendering process remains running. No push, issue, comment or pull-request write was performed.


## Adversarial mathematics pass

These are instance checks, not proofs of the admitted theorems. O is a nonzero DVR and R=O[[X]] unless a row specifies otherwise. Arithmetic values were independently recomputed by finite point counts, integer polynomial products and finite matrix enumeration. A row concerning an arithmetic theorem tests its hypotheses and normalization, rather than inferring the theorem from a numerical example. Statements repeated in several sections are identified once with all their uses.

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Continuous-action convention | trivial group; discrete group acting on a discrete finite module | identity operator sends v to v; every orbit map into a finite discrete module is continuous | Per-operator continuity and action continuity remain separate requirements | None |
| Cyclotomic generator and tame splitting | p=2,3,7 | generators 5,4,8; tame orders 2,2,6; 2 is not a 2-adic unit, while 2 and 6 are units at 3 and 7 | Dyadic integral idempotents cannot be used | None |
| Algebraic localization | R=O[[X]], f=ϖ | (ϖ)R[1/ϖ]=(1), but (ϖ)≠(1) over R | Rational equality forgets μ | None |
| Cohomological determinant and Tate twist | weight two, trivial character | det V_f=κ⁻¹; twisting both dimensions by κ gives κ⁻¹κ²=κ | T is homological after the stated twist | None |
| Ordinary subline versus quotient | local pair 1,κ⁻¹ before twist | after twisting by κ the characters are κ,1; quotient is unramified, subline ramified | Correct direction | None |
| Scalar dual and contragredient dual | tame scalar 2 over F₇ | precomposition scalar 2, inverse precomposition scalar 4, product 8=1 modulo 7 | Inversion must reach both ideals | None |
| Untwisted dual versus Tate dual | T=ℤ₅(1), element with κ=2 | untwisted dual has scalar 3 modulo 5 and no fixed vector; Tate dual has scalar 1 and all vectors fixed | H⁰ hypotheses concern the untwisted dual | None |
| Cohomological versus differential periods | m=0,1 | denominators −2πiΩ=P and (−2πi)²Ω=(−2πi)P | Exponent drops by one on changing period notation | None |
| Inverse determinant sign | degree-(1,2) complex O→ϖ²O; z=ϖ²e with H²=0 | valuations +2 and −2 respectively; equal contributions give 0 | Inverse determinant and zeta direction agree | None |
| Primitive Euler normalization | E_dual=2, z_prim=1 | z_Σ=2 and E_dual⁻¹z_Σ=1 | Euler correction is inverted in the primitive zeta map | None |
| Signed label convention | a_p=0, indices 1 and 2 | index 1 gives minus, index 2 plus; at a nontrivial tame character second image is (X), first R | Labels and images must both be retained | None |
| Analytic coordinate convention | T=κ(γ)^(s−1)−1 and inverse coordinate | derivatives at 1 are l and −l, where l=log κ(γ); leading coefficients differ by (−1)^r | Sign is a unit; l has valuation 1 at odd p | None |
| ModularIwasawaDatum.T | weight-two elliptic datum; coefficient extension | determinant twist changes κ⁻¹ to κ; rank 2 remains 2 after extension | Tate-lattice comparison uses the inverse-image lattice | None |
| ModularIwasawaDatum.residual | T=O² | T/ϖT=F², dimension 2 | Carries the chosen action | None |
| Residual semisimplification independence | upper triangular pairs with diagonal 1,ω and extension entries 0,1 | both semisimplifications are 1⊕ω although matrices differ | Does not identify extension classes | None |
| ModularIwasawaDatum.changeLattice | ϖO⊂O in rank one | induced L/ϖO→L/O is onto, kernel O/ϖO | Direction and finite kernel correct | None |
| ModularIwasawaDatum.extendCoefficients | ramification e=2, p=uϖ² | rank-two lattice extends to rank 2; ideal (p) becomes (ϖ²), valuation 2 | Faithfully flat extension allows ramification | None |
| ModularIwasawaDatum.ordinaryLine | E=11a1,p=7; 14a1,p=5 | a₇=−2≡5 is a unit; a₅=0 is not; quotient characters as above | Good ordinary and supersingular cases separated | None |
| ModularIwasawaDatum.cyclotomicIdentification | γ; p=2 tame sign | γ↦1+X, γ−1↦X; (1±δ)/2 has nonintegral coefficients at 2 | No dyadic integral product decomposition | None |
| OrdinarySelmer.mem_iff | unramified quotient α=1 and α≠1 | A⁻/(α−1)A⁻=A⁻ in first case and 0 in second | Inertia and strict kernels differ at split multiplicative p | None |
| OrdinarySelmer.dual | M=F₇ with tame scalar 2 | scalar-dual action is 2, contragredient action 4 | Transport of supplier convention explicit | None |
| OrdinarySelmer.dual_fg | model X=0,R,R/(X) | numbers of generators 0,1,1; R has rank 1 and is not torsion | Finite generation is not torsion | None |
| OrdinarySelmer.relax | empty added set; local term R/(E) | char kernel 1 in empty case; char X^Σ=E·char X^Σ′ in one-prime case | Keeps torsion, H⁰ and ramification-set hypotheses | None |
| OrdinarySelmer.changeLattice | finite-index lattice map; model R/(p) | R/(p) is infinite but killed by p; tensor with R[1/p] is 0 | Bounded p-power error need not be finite | None |
| OrdinarySelmer.extendCoefficients | zero module and R/(ϖ) | base changes are 0 and R′/(ϖ); characteristic ideals 1 and (ϖ)R′ | Correct base-change scope | None |
| OrdinarySelmer.etaComponent | M=F₇ with tame character δ↦2 | scalar dual still has character 2; coefficient twist by η⁻¹ multiplies 2 by 4 to 1 | Twist and dual convention agree | None |
| Ordinary structure: finite generation | X=R⊕R/(X) | generated by 2 elements, rank 1 | Does not smuggle torsion into definition | None |
| Ordinary structure: torsion theorem | 11a1,p7 | good ordinary trace −2; local torsion at 11 divides 50, prime to 7 | Fits source torsion range | None |
| Ordinary structure: no finite submodule | R/(X) versus R/(ϖ,X) | first is O, no finite nonzero submodule; second is F, finite | Local and structure hypotheses remain essential | None |
| Ordinary structure: Fitting equals characteristic | R/(X²) versus R/(ϖ,X) | first Fitt=char=(X²); second Fitt=(ϖ,X), char=R | No finite submodule cannot be omitted | None |
| Ordinary structure: lattice independence | T and ϖT under irreducibility | scalar multiplication gives equivariant isomorphism, index ϖ² as sublattices but isomorphic actions | Integral independence uses homothety, not arbitrary isogeny | None |
| ordinaryPadicL | 11a1,p7 | trivial normalized value modulo 7 is (1−3)²/5=5 | Nonzero integral value | None |
| ordinaryPadicL_interpolation | weight two; primitive conductor p² | m=0 and 0!=1; n=0 factor (1−α⁻¹)², n=2 factor α⁻² | Primitive conductor and boundary case agree | None |
| ordinaryPadicL_unique | nonzero bounded R-series versus zero | nonzero distinguished polynomial has finite degree and finitely many torsion-character zeros; infinitely many distinct zeros force zero difference | Characters must be distinct | Clarified distinct finite-order characters |
| ordinaryPadicL_period_unit | period scaled by 2 or ϖ at odd p | L becomes L/2 with same ideal, or L/ϖ with valuation lower by 1 | Unit and rational period changes differ | None |
| ordinaryPadicL_depleted | Σ empty; one split factor at 11 with γ₁₁=2 | products 1 and 21/22; wrong argument gives 9/11 | Analytic Euler factor matches algebraic one | None |
| ordinaryPadicL_extendCoefficients | e=2 ramified extension | coefficients unchanged as elements; valuation of p changes from 1 to 2 | Equality uses the specified embedding | None |
| ordinaryPadicL_ne_zero | 11a1,p7 | value modulo 7 is 5≠0 | Numerical witness agrees with nonvanishing theorem | None |
| IMC | X=R/(X²), L=X² versus X³ | ideals (X²)=(X²), while (X²)≠(X³) | Definition detects a one-unit height-one length error | None |
| IMC_rational | X=R/(pX), L=X | ideals agree after p-inversion, differ integrally by p | Correct rational proposition | None |
| IMC.toRational | X=R/(pX), L=pX | both localized ideals are (X) | Implication correct | None |
| IMC.iff_divisibilities | (X²),(X²); (X²),(X³) | first has two inclusions; second has only (X³)⊂(X²) | Both directions necessary | None |
| IMC.greenberg_instance | trivial tame component, weight two | r_V=0 and projected char equality is (L_f); other tame components are not imposed | Correct projection | None |
| iwasawaH1 | rank-one model R; dyadic coefficients | ranks 1 rationally; no integral tame idempotents at p2 | Integral freeness retains oddness and irreducibility | None |
| iwasawaH2 | zero module and R/(X²) | ranks 0,0 and lengths 0,2 at (X) | Torsion allows nonzero H² | None |
| fundamentalLine | H¹=Re,H²=0,z=e | trivialized fractional lattice R | Rank-one Betti factor and cochain signs retained | None |
| fundamentalLine.triv | z=e,Xe,ϖ⁻¹e with H²=0 | fractional lattices R,X⁻¹R,ϖR | Rational zeta element need not be integral | None |
| fundamentalLine.changeLattice | scale lattice and compatible zeta source by c | numerator and source determinants both scale by c, ratio c/c=1 | Canonical arithmetic comparison, not arbitrary zeta rescaling | None |
| fundamentalLine.baseChange | two-term [R→aR], specialize a to 0 | derived tensor has H¹=S,H²=S; specializing only the cokernel loses H¹ | Uses supplier determinant theorem with arithmetic compatibility | Generic algebra referred to supplier |
| fundamentalLine.divisor | z=ϖ⁻¹e, H²=0; clear d=ϖ,ϖ² | 0−0+1=1 and 0−1+2=1 | Denominator independence computed | None |
| fundamentalLine.sigmaPartial | Euler scalar 2 | z_Σ=2,z_prim=1; inverse factor sends 2 to 1 | Local lines accompany nonunit Euler factors | None |
| KMC | H¹=Re,Z=XRe | KMC iff char H²=(X); H²=0 gives 1≠X | Not asserted for arbitrary zeta data | None |
| KMC_rational | z=pe,H²=0 | integral quotient char=(p), rational quotient 0 with char 1 | Containment and rationalization distinguished | None |
| KMC.iff_triv | H²=R/(X²),z=X²e | divisor 2−2=0, fractional lattice R | Both sides true; z=Xe gives divisor 1 and both false | None |
| KMC.iff_reverse_divisibility | ideals (X²)⊂(X) | forward Kato bound holds, reverse fails; equality case (X²),(X²) has both | Reverse direction must be supplied | None |
| KMC.changeLattice | homothety cT and compatible source cγ | two scale factors cancel, c/c=1 | Irreducibility sufficient for integral lattice comparison | None |
| Dyadic KMC | p2, prime not containing 2 | error killed by 2 becomes 0 after localization; at a prime over 2 it need not vanish | No integral claim at primes containing 2 | None |
| HasRankOneCoinvariants | standard unipotent, identity, upper-right ϖ | quotients O,O²,O⊕F | First true, others false | Added equal-characteristic and zero-ring controls |
| hasRankOneCoinvariants_of_unipotent | O=F₂[[t]], upper-right 1 versus t | N²=0 in both; primitive image only for 1; quotients O and O⊕F₂ | Full DVR statement includes equal characteristic 2 | None |
| Coinvariant invariance under conjugacy | exchange e₁,e₂ | image line changes Oe₁→Oe₂; quotient O→O | Invariant under change of basis | API stated explicitly |
| Coinvariant torsion-free rank one | upper-right ϖ | rational dimension 1, integral torsion F≠0 | Converse from rational rank is false | API stated explicitly |
| Coinvariant coefficient extension | upper-right 1; ramification e=2 | quotient O⊗O′=O′, torsion length remains 0 | Uses actual quotient equivalence | API stated explicitly |
| Coinvariant degenerate rings | zero module over O≠0; zero ring | 0≄O in first case; 0≃0 in second | Definition has honest zero-ring behavior, theorem excludes it via domain | Check added |
| Arbitrary residual-unipotent lift | g=[[1,1],[ϖ,1+ϖ]] | det g=1; det(g−1)=−ϖ; N²≠0; cokernel F | Reduction alone insufficient | None |
| Zeta basis/characteristic criterion | H¹=Re,z=Xe,H²=R/(X) | length 1=1 and trivialized lattice R | Freeness, integral containment and suitability retained | None |
| Iwasawa suitability | classical λ,ψ=λ; z(ψ)=0 negative model | identity ring map sends z to z≠0; zero map gives determinant 0 | Nonvanishing and direction A→O needed | None |
| katoPadicZeta_scale | a=ϖ,b=1; a=b=ϖ | factors ϖ⁻¹ and 1 | Direction of de Rham scaling correct | None |
| katoPadicZeta_canonical | canonical orientations ± | functions L and −L generate same ideal | Sign affects values, not ideal | None |
| katoPeriodDefect | f=ω_B versus f=ϖω_B | defect classes 1 and ϖ | Good-pair lattice fixed, not chosen up to rescaling | None |
| katoPadicZeta_homothety | c=ϖ | a⁻¹b=ϖ⁻¹ϖ=1 | Homothety cancels | None |
| katoPadicZeta_goodPair | f=ϖω_B; unit changes w=2,w⁺=1 | good function ϖL/2, ideal (ϖL) | Retains defect and unit | None |
| KatoPeriodDefectUnit | u_p=1,ϖ | valuations 0,1 | Predicate discriminates required integral normalization | None |
| Sign-dependent period change | b⁺=1,b⁻=ϖ | plus factor 1, minus factor ϖ | Not uniform across signs | None |
| kmc_iff_char_eq_defect_mul | defect ϖ, L=X | KMC gives char=(ϖX), IMC requires (X) | Integral equivalence needs defect unit | None |
| katoPeriodDefectUnit_of_IMC_KMC | (uX)=(X), X≠0 | cancel X, obtaining (u)=(1); u=ϖ fails | Nonzero analytic function needed | None |
| kmc_iff_ordinary_two | p2 localized away from 2 | length of 2-killed error 0; at (2) could be 1 | Restricted comparison correct | None |
| Four-term length identity | lengths a=1,b=3,d=2 | exactness gives x=b−a+d=4; x=b iff d=a | Both directions of KMC/ordinary equivalence tested | None |
| SignedSelmer.localCondition | zero kernel and full kernel | annihilators full local H¹ and 0 | Definition starts from the specified Bloch–Kato Selmer group | None |
| SignedSelmer.dual | finite module F; zero module | dual cardinalities #F and 1, respectively | Finite generation, not torsion, is part of basic interface | None |
| SignedSelmer.poitouTate | H¹=R, image I=XR, z_i=X² | I/(z_i)=R/(X), length 1 | Correct image quotient rather than ambient quotient | None |
| SignedSelmer.changeBasis | B=[[1,0],[1,1]] on coordinate columns | (1,0) becomes (1,−1); second kernels differ | Inverse matrix convention correct | None |
| SignedSelmer.etaComponent | p5, trivial versus nontrivial η | sum δ acts by 4 versus 0 | Tame component is retained | None |
| SignedSelmer.ordinary_case | rational multiplier ū=2; integral multiplier ϖ negative control | rational ideals same; integral scalar ϖ changes μ by 1 | Rational unit comparison alone does not give integral image | None |
| SMC | I=XR,L=X² | corrected char=(X), ambient char=(X²) | Wrong numerator detected | None |
| SMC_rational | I=ϖR,L=ϖX | corrected char=(X), ambient (ϖX); both become (X) after inversion | Integral image carries μ | None |
| SMC.of_image_eq_top | I=R,L=X² | quotient R/(X²), char=(X²) | Simplification valid with actual full image | None |
| SMC.changeBasis | integral shear with indices satisfying nonvanishing; zero-coordinate negative model | nonzero coordinate X gives torsion cokernel; coordinate 0 gives rank-one cokernel | Equivalence restricted to allowed indices | None |
| SMC.kobayashi_form | a_p=0 elliptic basis | kernels numbered 1=minus,2=plus | Principal ideal comparison needs separate multiplier units | None |
| Signed reformulation of KMC | four-term lengths 1,3,4,2 | 1−3+4−2=0; KMC length equality 1=2 fails and SMC equality 4=3 fails | Length equivalence works in both directions | None |
| Signed theorem restrictions | 14a1,p5; second index nontrivial η | a₅=0 passes A; η=1 allowed; nontrivial η excluded for i=2 | Does not enlarge theorem to every component | None |
| ResidualHyp.irred | trivial F₇²; 11a1,p7 | trivial representation has fixed lines; Frobenius discriminant −4=3 mod7 is nonsquare | Correct positive/negative cases | None |
| Odd irreducibility to absolute irreducibility | complex conjugation at odd p | eigenvalues 1,−1 are distinct over F; an irreducible nonsplit-torus image would force scalar involution | Separates absolute and ordinary irreducibility | None |
| DistinctCharacters | F₇×, characters 1,ω; 1,1 | generator 3 gives values (1,3) and (1,1) | Correct, symmetric in the pair | None |
| IsRamifiedAt | scalar −1 over F₇; identity inertia | −1=6≠1; trivial subgroup gives 1 | Ramification depends on actual restriction | None |
| FWAuxiliaryCondition | independent diagonal F₇××F₇× characters; trivial I; D=I=ker fst | dimensions (1,0),(2,0),(1,1) | Both fixed-space conditions needed | None |
| ResidualHyp.fwExplicit | 14a1 at 2,p13; split 11a1 at 11,p7; split direct sum | μ values −1,1; ramification valuations 6,5 prime to p; direct-sum inertia image 1 | Extension and ramification both retained | None |
| LocalExclusion | pairs (1,ω),(ω,1),(1,ω²) on F₇× | at 3: (1,3),(3,1),(1,2), with ω³=6≠1 | First two excluded, third allowed | None |
| ScalarExclusion | (1,1),(1,ω) | identical values (1,1) fail; (1,3) pass | Differs from LocalExclusion | None |
| HasRankOneImage | full GL₂(O), trivial action, identity subgroup | standard unipotent quotient O; latter quotients O² | Integral witness cannot be replaced by residual dimensions | None |
| not_fwAuxiliary_bot | trivial I on F₇² | dim W^I=2≠1 | Correct | None |
| fwAuxiliary_independentCharacters | D=F₇××F₇×, I=ker fst | invariant dimensions 1 and 0 | Correct | None |
| not_hasRankOneCoinvariants_id | identity on O² | quotient O², rank 2≠1 | Nontrivial coefficient ring necessary | None |
| not_hasRankOneCoinvariants_upper_uniformizer | upper-right ϖ | quotient O⊕F, nonzero torsion F | Correct | None |
| hasRankOneImage_fullAutomorphismGroup | upper-right 1 in GL₂(O) | determinant 1, quotient O | Correct even in equal characteristic | None |
| FWAuxiliaryCondition.isRamifiedAt | trivial inertia negative control | invariants dimension 2 contradicts required 1 | Implication holds | None |
| localExclusion_one_iff | ω=1 | excluded pairs are exactly (χ,χ); distinct pair (1,2) passes both sides | Both directions agree | None |
| ResidualHyp.fwAux_iff_nonsplit_weight_two | cohomological invariant line, μ=±1 | D-invariant dimensions 1 for +1,0 for −1 | Weight-two restriction necessary | None |
| ResidualHyp.suAux_im | 11a1 at 11,p7 | v₁₁Δ=5, 7∤5, actual inertia unipotent primitive, quotient ℤ₇ | Cyclotomic kernel contains away-p inertia | None |
| Imported multiplicative inertia criterion | 11a1 at 11,p7,p5; 14a1 at 2,p13,p3 | divisibilities 7∤5,5∣5,13∤6,3∣6 give ramified,unramified,ramified,unramified | Split and nonsplit cases match supplier | None |
| Multiplicative-hypothesis negative control | ramified quadratic twist of 11a1 at 11,p5 | v(j)=−5 still divisible by 5, but inertia scalar −1=4 mod5≠1 | Additive potentially multiplicative case excluded | None |
| ResidualHyp.locExc_ordinary_weight_two | 11a1,p7; any elliptic ordinary p3 | ā₇²=4≠1; F₃×={±1}, so ā₃²=1 | p3 ordinary local exclusion always fails | None |
| Residual dimensions on nonabelian group | S₃ standard 2D representation over F₅; cyclic subgroup C₃ | fixed vectors both {(0,0,0)}, dimension 0; trivial subgroup fixes all 25 vectors, dimension 2 | Fixed-subspace definitions do not assume abelian groups | None |
| Rank-one inertia application | unipotent with coefficient 1,ϖ; non-unipotent lift | cokernels O,O⊕F,F | Characteristic-zero unipotence is essential | None |
| Euler local factors | split 11; good-reduction prime | degrees 1 and 2; split evaluation 21/22 versus wrong 9/11 | Coinvariant and inverse-Frobenius conventions explicit | None |
| IMC.iff_of_sigma | empty difference; one nonzero Euler factor E | char kernel 1 or (E); equality EJ=EL implies J=L in the domain | Requires common larger torsion dual and H⁰=0 | None |
| IMC.iff_extendCoefficients | ramified e=2 extension | valuations 1→2 on both sides, and 1≠2 remains 2≠4 | Faithful flatness reflects equality | None |
| Skinner–Urban assembly | 11a1,p7 and 14a1,p13 | k=2 satisfies congruence; a₇=−2,a₁₃=−4; auxiliary valuations 5,6 prime to p | Retains all residual and source-range hypotheses | Exact supplier §1.11 |
| Product separation in ordinary assembly | defects d₁,d₂≥0 with d₁+d₂≤0 | only pair (0,0); without individual bounds pair (1,−1) has sum 0 | Both Euler-system inclusions required | None |
| Fouquet–Wan ordinary theorem | 14a1,p13 at 2 versus 11a1,p7 at 11 | D-invariant dimensions 0 versus 1; traces −4 versus −2 are units | Only first meets this theorem's auxiliary condition | Exact supplier §2.21 |
| Ordinary theorem period transfer | u=1 versus ϖ, L=X | char=(X) versus (ϖX), rational ideals both (X) | Does not assume period unit in general weight | None |
| hidaApproximant | p3,M2 versus M1 | tower levels ≥6 versus 3; first has auxiliary prime 2, second none | Small prime is included in actual range | None |
| hidaApproximant_lattice | p=uϖ², precision m=1 | mod p means mod ϖ²; mod ϖ is weaker by one exponent | Full lattice and ordinary-line congruence retained | None |
| hidaApproximant_periodComparison | C=O versus (ϖ) | corrected generator X versus ϖX, μ differs by 1 | Unit assertion conditional on perfect pairing and saturation | None |
| hidaApproximant_padicL | X,2X at odd p; precision p^m | (X,p^m)=(2X,p^m), but coefficient differences 1≠0 mod p^m | Equality of ideals does not choose congruent generators | None |
| hidaApproximant_residual | isomorphic mod p^m lattices | further reduction mod ϖ gives same 2D representation and same inertia matrix | Ramification and irreducibility survive | None |
| Characteristic-three coefficient warning | F₉× generator ζ | ζ has order 8, ζ² has order 4≠1 | F₃-specific square computation cannot be generalized | None |
| Skinner multiplicative theorem | N6,p3; N11,p11 | required Σ contains {2} in first case, empty set allowed in second; neither includes p | Correct imprimitive convention | None |
| Fitting congruence argument | ideals (X),(X+p^m) for increasing m | reductions agree at precision m; fixed distinct ideals (X),(X+p) fail at precision m=2 | All precisions, not one, determine closed ideals | None |
| FW convention adapter, KMC.fw_form | weight two and central twist | T(f)=T_pE dual; twisting by one restores determinant κ | Correct cohomological/homological distinction | None |
| FW residual restriction argument | odd p, induced index-two image | diagonal/antidiagonal image has no nontrivial order-p unipotent; auxiliary unipotent has order p | Forces irreducibility on the quadratic subgroup | None |
| FW pointwise theorem | 14a1,p5; 11a1,p7 | a₅=0,nonsplit auxiliary 2; ordinary p7 and trivial μ at 11 with ā₇²=4 | Both meet Theorem 5.1, unlike narrower introductory formulation | Exact supplier §4.5 |
| Ordinary pointwise consequence | 11a1,p7 | defect unit, char=(L); hypothetical u=ϖ gives (ϖL) | Integral form remains conditional on defect in general weight | None |
| Signed pointwise consequence | 14a1,p5 | A holds since a₅=0; mod5 image full, p5 lifting allowed | η=1 only follows from this pointwise endpoint | None |
| Elliptic inverse-image lattice | degree-p isogeny with image pO⊕O | original image index p, inverse image of target lattice removes that index | Rational isomorphism not assumed integral on original lattice | None |
| Optimal period comparison | 11a1,p7; p5 isogeny | Manin factor 1 is a unit at 7; period factor 5 has valuation 1 at 5 | Isogeny discrepancy retained | None |
| Manin-constant p-unit range | optimal curve good at odd p but bad elsewhere | local semistability condition holds at p regardless of other primes | Does not require global semistability | Corrected local hypothesis |
| Weight-two parabolic H¹ at p3 | X₀(19), two elliptic points of order 3 | Hom(C₃,ℤ₃)=0 while Hom(C₃,F₃)=F₃; a₃(19a1)=−2 | Integral comparison survives, torsion coefficients need corrections | None |
| Odd-prime sign splitting | swap on ℤ_(2)² | eigenvectors (1,1),(1,−1) span determinant −2, index 2 | p2 is not included in integral ± splitting | None |
| ModularIwasawaDatum.ofEllipticCurve | 11a1,p7 | chosen lattice has rank 2 and determinant κ; ordinary quotient rank 1 | Constructor occurs after modular isogeny | None |
| mazurSwinnertonDyerL | 11a1,p7; split multiplicative p11 | trivial values (1−α⁻¹)²/5 and 0 | Good and multiplicative Euler exponents differ | None |
| mazurSwinnertonDyerL_trivial_character | good, nonsplit, split | factors (1−α⁻¹)²,2,0 | Single factor at multiplicative primes | None |
| mazurSwinnertonDyerL_twist | p3, measure δ₁−δ₋₁ | trivial branch pushforward 0; odd-character integral 1−(−1)=2 | Must evaluate the correct tame branch | None |
| mazurSwinnertonDyerL_mem_Lambda | irreducible 11a1,p7; reducible p5 | first meets hypothesis; rational 5-torsion gives invariant line in second | Integrality theorem not applied at Eisenstein prime | None |
| mazurSwinnertonDyerL_isogeny | period ratio Ω/Ω′=5 | L′=5L, v₅ increases 1; ratio inverse would decrease 1 | Direction fixed | None |
| mazurSwinnertonDyerL_eq_form | differential period P=2Ω_E | elliptic analytic value equals 2 times form value | Coefficient embedding and differential period used | None |
| mazurSwinnertonDyerL_analytic | s=1,2 | integrands 1 and ⟨x⟩; first derivative log⟨x⟩ | Center is s=1 | None |
| katoPeriodDefect_elliptic | good ω_E versus 7ω_E at p7 | first gives unit defect; latter divides function by 7 and is not good | Goodness is stronger than integrality | None |
| OrdinarySelmer.ofEllipticCurve | ordinary local Kummer subgroup; split multiplicative comparison | good ordinary local extra quotient 0; split inertia/strict quotient L/O | Keeps distinct multiplicative condition | None |
| MazurMC | X=R/(L), L≠0 | char=(L), torsion rank 0 | Exact Tate lattice and Néron periods enter proposition | None |
| MazurMC_rational | char=(pL) | after p-inversion (pL)=(L), integral ideals differ | μ invisible rationally | None |
| MazurMC.iff_IMC | period ratio unit 2 versus p | ideal (2L)=(L), but (pL)≠(L) | Integral equivalence needs unit period ratio | None |
| MazurMC.isogeny | degree 5,p7; degree 5,p5 | 5 is invertible at 7 and not at 5 | Prime-to-p restriction retained | None |
| MazurMC.toRational | equal integral ideals (pX) | localized ideals both (X) | Correct | None |
| BCS rational transport | 11a1,p7; p3 negative range | p7>3 and a₇ unit; 3>3 false | No extra Steinberg hypothesis | Exact supplier §7.9 |
| BCS integral transport | primitive unipotent versus upper-right p | quotient ℤ_p versus ℤ_p⊕F_p | Full source endpoint still requires the declared supplier extension beyond its correction-unit version | Exact §7.10 and residual contract retained |
| sl2Zp_closedSubgroup_eq_top | determinant-one lifts modulo 25 and 9 | 125 lifts at p5 all have x⁵=I+5N; 27 lifts at p3 give cubes I,I+3N,I+6N | The lifting proof's nonzero congruence step fails at 3 | Computed Check added |
| Serre small-prime counterexample | binary tetrahedral group at p3 | finite subgroup order 24=3(3²−1)=#SL₂(F₃), versus infinite SL₂(ℤ₃) | Closedness does not repair p3; p≥5 required | None |
| GL₂ and cyclotomic-kernel image | full determinant and full SL₂ | determinant kernel SL₂; standard unipotent lies there and gives quotient ℤ_p | Weil-pairing determinant needed | None |
| Crystalline Frobenius convention | 11a1,p7 | F roots valuations 0,1; φ=F/7 roots −1,0; α≡5,α⁻¹≡3 | Unit-root line is α-line of F, α/7-line of φ | None |
| Katz E₂ correction | 11a1, a₁=0,a₂=−1 | b₂=−4; c=(−4−E₂)/12; using −E₂/12 changes c by 1/3 | Correction coefficient E₂−b₂ used | None |
| canonicalSigma differential equation | e₂=−12c, formal coordinate z=log_E | −D²log(exp(e₂z²/24)σ)=x−e₂/12=x+c | Sign and denominator 24 correct | None |
| canonicalSigma oddness | 14a1,a₁=1 | σ(t)=t+t²/2; t(−P)=−t−t²; σ(t(−P))=−t−t²/2, while σ(−t)=−t+t²/2 | Oddness is on the formal group | Clarification and negative Check added |
| Sigma/differential rescaling | ω↦2ω | log_E² scales 4; e₂ scales 1/4; product invariant; wrong weight scales 16 | C⁻² normalization retained | None |
| cyclotomicHeight domain and extension | O,torsion; m=2 and m=4 | assigned heights 0,0; h(2P)/4=h(4P)/16 | No 0/0 at identity | None |
| cyclotomicHeight_smul | quadratic h(P)=a, m=0,1,2 | values 0,a,4a | Torsion and extension agree | None |
| cyclotomicHeight_model | ω scaling 2 and coordinate rescaling | corrected exponential unchanged, logarithm of unit differential factor cancels normalization | Height remains same, not multiplied by 4 | None |
| cyclotomicHeightPairing | h(P)=a,h(2P)=4a | ½(4a−2a)=a; torsion variable gives 0 | Pairing diagonal equals quadratic height | None |
| padicRegulator | ranks 0,1,2 | determinants 1,a,ab−c²; basis exchange determinant −1 contributes square 1 | Empty determinant and basis invariance correct | None |
| padicRegulator_rank_zero | empty basis | determinant 1, not torsion factor 1/25 | Separate MTT regulator convention retained | None |
| normalizedRegulator | rank 1, v_p(l)=1 | Reg_γ=a/l, valuation v(a)−1 | Cannot replace with Reg_p up to a unit | None |
| HeightNondegenerate | matrices [1], [0], diag(1,0) | determinants 1,0,0 | Genuine property, not imposed by definition | None |
| tateParameter_transcendental_of_isAlgebraic_j | q=p,p²,−2 at p2 | norms p⁻¹,p⁻²,1/2; all q algebraic, hence J(q) transcendental by theorem | Does not apply algebraic-j antecedent to these q | None |
| Mahler–Manin domain exclusions | q=0,1 | zero not a unit; norm 1 fails strict inequality | No junk-value counterexample | None |
| tateParameter_transcendental | global E with split multiplicative reduction | J(q_E)=j(E)∈ℚ; assuming q_E algebraic would give both algebraic and transcendental j | Correct contrapositive | None |
| tateParameter_log_ne_zero | q=ζp^n in ℚ_p; dyadic q=−2 | log=0; all such q algebraic; log₂(−2)=0 | Transcendental global Tate parameter excluded from log kernel | None |
| Split multiplicative height correction | u=v=1+p; u=1 | corrections l²/log q_E and 0; first valuation 2−v(log q_E) | Omitting correction changes regulator | None |
| Flat arithmetic complex | zero abelian variety | H_i=0 for every i, product characteristic series 1, order 0 | Derived limits and H⁰ retained | None |
| Flat generic-fibre maps | zero class; identity tower map | 0↦0; class c maps to c on both routes | Correct variance and tower compatibility | None |
| Flat H⁰ | rational point of order p | contributes ℤ/p rather than 0 | Ordinary reduction does not annihilate H⁰ | None |
| Flat local component errors | nonsplit I₆ at 2 for 14a1 | arithmetic order 2, geometric order 6 | Use arithmetic Tamagawa factor | None |
| Flat cohomology versus point space | pairing diag(1,0), point line first coordinate | point determinant 1, full determinant 0 | T_pSha quotient must vanish before inference | None |
| Global flat duality contract | A=0; μ₅ over ℤ₅ | groups zero for A=0; μ₅ is not étale and component c₁₁=5 matters for 11a1 | Étale duality after p-inversion is insufficient | None |
| schneiderAlgebraicHeight | torsion nP=0 | n·h(P,Q)=0 in ℚ_p, hence h(P,Q)=0 | Pairing defined before nondegeneracy | None |
| schneiderAnalyticHeight | zero abelian variety; rank-one nonzero pairing a | value 0 in rank zero, a on chosen pair | Poincaré biextension and local splittings fix the pairing | None |
| Schneider isogeny functoriality | φ=[2] | h(2P,Q)=2h(P,Q)=h(P,2Q) | Dual isogeny on second variable | None |
| Schneider character rescaling | κ↦κ² | height a↦2a, rank-two determinant d↦4d | Unit rescaling has correct rank exponent | None |
| schneiderMultiplicativeHeightComparison | u=v=1+p and lift u q^a | correction l²/log q; new raw log l+a log q changes numerator | Requires descent law; formal lifts unique by valuation 0 | None |
| schneiderHeight_sign | ranks 0,1,2 | regulator signs 1,−1,+1 | Exact heights differ by −1 | None |
| schneiderHeight_eq | rank one; corrected multiplicative local pairing | determinant changes by sign −1; omitted square quotient gives different value | Comparison uses Werner-corrected height | None |
| leadingTerm_T_to_s | F(T)=aT^r, r=0,1,2 | coefficients a,al,al²; inverse coordinate gives a,−al,al² | Sign and nonunit logarithm both accounted for | None |
| schneiderFlatGaloisComparison | split multiplicative local correction; 11a1,p5 H⁰ | local dual R/(X), char=(X); finite H⁰ of order 5 has char 1 but order 5 | Finite-layer cardinality is not characteristic ideal | None |
| schneider_leading_term_abelianVariety | A=0; A=E | leading value 1; two torsion factors become #E_tors² | General abelian target specializes correctly | None |
| schneider_order_ge_rank | rank zero example, characteristic unit | ord=0≥0 | Larger order allowed for degenerate height | None |
| schneider_order_eq_iff | abstract Reg=0 versus Reg=1 with finite Sha | first equality case excluded, second predicts order r | Nondegeneracy and Sha finiteness are separate | None |
| schneider_leading_term | 11a1,p7; anomalous p5 | at p7 total valuation 0; at p5 ε valuation 2, c₁₁ valuation 1, torsion square −2, giving net 1 before Sha/regulator | Tamagawa and torsion exponents retained | None |
| Local ordinary multiplier | 11a1,p5 | #Ẽ(F₅)=5, v=1; ε=(1−α⁻¹)² has v=2 | Squared reduction factor matches ε up to a unit | None |
| schneider_leading_term_split | rank zero | Reg=1, factor ℒ/l≠0; strict order 0 while analytic order 1 | Exceptional factor belongs to inertia/strict comparison | None |
| greenberg_rank_zero | 11a1,p7 | c₁₁=5 unit, torsion p-part 1, analytic value mod7=5 | Formula forces Sha[7∞] order 1 when MMC supplied | None |
| Strict/inertia characteristic relation | split multiplicative exact sequence | char X_in=(X)char X_strict; orders differ by exactly 1 | No unconditional identification of the two Selmer groups | None |
| FW family base | O[[X₁,X₂,X₃]]; dual-number coefficient quotient | regular base dimension 4; quotient ε²=0 is nonreduced and need not have a fraction field | No main conjecture over arbitrary singular quotient inferred | None |
| Family admissible Σ | 14a1,p5 | residual inertia at 2 nontrivial since 5∤6; Σ=∅ cannot contain p or 2 | Admissibility hypotheses meaningful | None |
| Universal zeta specialization | empty Σ∖{p}; one Euler factor 2 | factors 1,2; z_Σ=2z_prim in second case | Universal construction and specialization are distinct inputs | Exact supplier §§3.7–3.9 |
| FW family endpoint | classical trivialized line R and finite free algebra of rank d | determinant norm of scalar a is a^d, not a | Restriction-of-scalars norm retained | Exact supplier §4.3 |
| FW derived specialization | [R→aR] with a↦0 | H¹=S,H²=S; alternating determinant cancels, unlike single cokernel | Tor terms cannot be dropped | None |
| Signed crystalline consequence | 14a1,p5; ordinary locally split representation | a₅=0 passes A; locally split form fails A′ | Hypothesis intersection retained | None |
| Coleman-image simplification | a_p=0,p5 | sum δ acts as 4 on trivial η,0 otherwise; images R and XR | Full image valid only on specified components | None |
| LLZ assumptions B–D | k=2,a_p=0 | j-range 1≤j≤−1 empty; floor 0; v(0)=∞>0; p≥1 true | Weight-two zero-slope boundary correct | None |
| pollackMultiplierUnit | a=p·u, u unit | v_p(a)=1, rationally invertible; principal ideals differ by p | Distinct integral hypothesis | None |
| kobayashi_corrected_iff_signed | I=R,z=X, multiplier p | map R/XR→pR/pXR is an R-isomorphism; chars both (X), ambient principal ideals (X),(pX) differ | Corrected comparison needs no ambient unit | None |
| Pollack kernel identification | multiplier p in rational target | p·c=0 iff c=0, so kernels identical | Nonzero multiplier, not integral unit, suffices | None |
| Changing Σ application | Σ=Σ′ | local direct sum 0 and characteristic ideal 1 | Reuses the earlier theorem | None |
| Coefficient invariance | O′/O ramification e=2 | μ=1 becomes 2 on both sides; (ϖ) extends to uniformizer square up to unit | Generic theorem is supplied; arithmetic transport owned here | Removed generic restatement |
| associated_of_eq_away_of_mu_eq | f=p,g=1; f=2X,g=X at odd p | rational ideals equal in first case but μ 1≠0; second μ 0=0 and unit ratio 2 | μ hypothesis detects missing p-power | None |
| μ/λ consequences | f=pX² and g=2pX² | μ 1=1, λ 2=2, ratio 2 unit | Integral IMC gives both invariants | None |
| Ordinary augmentation control | finite kernel/cokernel; local L/O negative model | finite errors corank 0; L/O corank 1 | Good ordinary proof excludes unbounded local correction | None |
| Rank-zero p-converse (ordinary) | 11a1,p7 | interpolation mod7=5≠0; Selmer corank 0 | Agrees with nonvanishing | None |
| Rank-zero p-converse (multiplicative) | split multiplicative with L(E,1)≠0 | analytic value 0 but derivative ℒ·L/Ω≠0 | Ordinary interpolation proof cannot be reused directly | None |
| Bloch–Kato rank-zero iff | vanishing z-specialization versus nonzero finite specialization | first gives X dividing both characteristic ideals; second gives a nonzero H¹_f vector | Needs the explicit central-critical comparison contract | None |
| Arbitrary-conductor rank-zero consequence | X=R/(p), X_Γ=ℤ/p | rank X_Γ=0; char value p≠0; localized module at (X) is 0 | Rational BCS suffices for nonvanishing | Supplied explicit proof route and p>3/irreducibility hypotheses |
| tateLInvariant | local q=p; q=p^n u | values 0 and log(u)/n, n>0 | No global nonvanishing for arbitrary local Tate curve | None |
| tateLInvariant_def | log(q)=21,ord(q)=14 formal ratio test | ℒ=3/2; 14·3/2=21 | Denominator is positive, nonzero | None |
| tateLInvariant_ne_zero | global E/ℚ versus local q=p | global log q_E≠0 from transcendence; local value 0 | Global hypothesis retained | None |
| tateLInvariant_isogeny | commensurable parameters, scale both by 7 | 21/14=3/2; scaling only denominator gives 3/14 | Both directions and denominator scaling correct | None |
| tateLInvariant_ofForm | weight two split multiplicative | a_p=1 and the assigned invariant is log(q_E)/ord(q_E) | Not defined here for nonsplit a_p=−1 | None |
| MTT exact proposition | 11a1,p7,r0,Sha order 1 | regulator 1/25, Tamagawa product 5, predicted value (1−α⁻¹)²/5 | Torsion denominator appears once | None |
| MTT_p proposition | multiply exact predicted value by 2 at odd p | p-valuations unchanged, exact values differ by factor 2 | Unit statement distinct from exact identity | None |
| MTT.order_lower_bound | ranks 0,1 and split ranks 0,1 | bounds 0,1 and 1,2 | Split case adds exactly one | None |
| MTT_p.rank_zero_iff_BSD_p | α≠1, r0 | cancel nonzero ε from L_p(1)=εL/Ω and predicted coefficient | Does not require ε to be a unit | None |
| Greenberg–Stevens derivative | 11a1,p11 | derivative ℒ₁₁/5, nonzero; ordinary p7 value already nonzero | Endpoint includes reducible residual cases through explicit family contract | None |
| MTT.exceptional_rank_zero | r0,α=1 | both formulas have common nonzero factor ℒ; exact versus p-unit ratios match their BSD versions | Cancels only after logarithm nonvanishing | None |
| Split coordinate conversion in BSD | r0, s-leading coefficient ℒA | T-leading coefficient ℒA/l; omitting l⁻¹ changes valuation by 1 | Same convention as Schneider and height dictionary | None |
| MMC to p-adic BSD | rank 1, Reg_p=a | T-coefficient εa/l·A; s-coefficient εaA | Logarithm absorbed once by regulator conversion | None |
| Converse under MMC | degenerate height Reg=0 | order strictly exceeds r by Schneider; ord=r excludes this | Correct use of iff | None |
| Modular Greenberg instance | p7, tame quotient order 3 | 3 invertible at 7; trivial idempotent isolates one component | Whole tame-family conjecture is not one cyclotomic component | None |
| Modular CPR/Panchishkin interpolation | m=0,1 | denominators P and (−2πi)P, unit-root factors as in §0.4 | Period and Tate-dual conventions agree | None |
| Verified 11a1 model | primes 2,3,5,7,13 | traces −2,−1,1,−2,4; Δ=−161051=−11⁵ | Numerical Checks reproduced | None |
| Verified 14a1 model | primes 2,3,5,7,13 | traces −1,−2,0,1,−4; Δ=−21952=−2⁶7³ | Numerical Checks reproduced | None |
| Frobenius irreducibility witnesses | 11a1,p7; 14a1,p5,p13 | discriminants 3 mod7,2 mod5,5 mod13, all nonsquares | Detect irreducibility, not local ramification | None |
| Higher-weight eta product | coefficients through q²⁵ | a₂=−4,a₃=2,a₄=8,a₅=−5,a₆=−8,a₇=6,a₁₁=32,a₁₃=−38,a₂₅=25 | Independently multiplied integer products | None |
| Higher-weight Hecke relations | n4,6,25 | (−4)²−8=8; (−4)·2=−8; (−5)²=25 | Match eta coefficients | None |
| Higher-weight ordinary/distinguished conditions | k4,p7 | a₇=6 unit; inertia exponent −3 nonzero modulo 6; 4≠2 mod6 | FW ordinary theorem, not SU weight congruence | None |
| etaProduct_residualRamifiedAtFive | assume unramified at 5 | discriminant −16=5 mod7 nonsquare; lowered weight 4; dimension S₄(level1)=0 | Level lowering contradicts existence | None |
| Higher-weight decomposition invariant | μ(5)=−1,p7 | −5⁻¹=−3=4 mod7≠1 | D-invariants vanish after ramification proved | None |
| Higher-weight p13 diagnostics | ℓ2,3,7,11 | a_ℓ mod13=9,2,6,6, equal to 1+ℓ³; 5⁴−1=624=48·13 | Finite trace agreement does not prove reducibility | None |
| Mazur-principle range | q5,coefficient primes7,3,2 | 5≠1 mod7; ℓ3 fails ℓ≥5; 5=1 mod2 | Every level-lowering range retained | None |
| Serre-weight necessity | level-one weights4,12 | dim S₄=0; Δ∈S₁₂ nonzero | Some unspecified weight would not give contradiction | None |
| Anticyclotomic formulation input | inert prime; trivial tame projection | Frobenius in anticyclotomic ℤ_p-extension is identity at inert primes, unlike generic cyclotomic image | Shared dual conventions do not transfer local factor formulas blindly | None |
| Anticyclotomic coefficient extension | rational ideals (p),(1) | become equal after p-inversion although unequal integrally | No integral descent inferred | None |
| Eisenstein formulation | 11a1,p5 | a₅=1, rational 5-torsion gives stable line | Names actual Tate lattice, not a homothety class forced by irreducibility | None |
| eisenstein_imprimitive_change | split Cartan E[5]=1⊕ω | untwisted dual p-torsion ω⁻¹⊕1 has invariant dimension 1; hypothesis H⁰=0 fails | Rational torsion alone would not decide untwisted H⁰ | None |
| eisenstein_isogeny_transfer | degree5 at p7 versus p5 | unit degree at 7, nonunit at 5; period p-part may change at 5 | Transfer only asserted prime to p | None |
| kobayashiFormulation_iff_signed | 14a1,p5 on trivial η | both images R because 4 is a unit; actual-image quotient matches principal LLZ function | Pollack principal comparison keeps multiplier-unit condition | None |
| Supersingular p3 boundary | a₃=0 versus ±3 | first fits a_p=0 dictionary, latter two do not | No unsupported p3 plus/minus identification | None |
| Multiplicative anticyclotomic interface | α=1 and −1 | inertia/strict quotient L/O and 0, respectively | Good ordinary interface not substituted at multiplicative p | None |
| Supersingular twist range | discriminant prime to Np but with a supersingular prime factor | coprimality passes, ordinary-support condition fails | Both downstream hypotheses retained | None |
| Downstream trivial-character elliptic-unit factor | θ=1, factor X versus p | μ(X)=0,λ(X)=1; μ(p)=1,λ(p)=0 | Augmentation factor is not a uniformizer | None |
| Downstream Katz μ input | rational ideals (p),(1) | same after p-inversion, different μ | Rational interpolation cannot prove integral μ=0 | None |

All four Lean declarations were elaborated together with explicit `#check @...` commands. The quotient definition retains its coefficient-ring and module binders. The three theorems retain the DVR/domain and primitive square-zero assumptions, the prime/5≤p/closedness/surjectivity assumptions, and the unit parameter/norm/algebraic-j assumptions, respectively. No binder was repaired or lost, and no theorem was substituted for an unavailable arithmetic carrier.


Pull request: #1499 (roadmap/modular-iwasawa-main-conjectures at 5990eb1)
