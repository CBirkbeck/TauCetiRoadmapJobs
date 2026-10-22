# SelmerIwasawaCohomologyPartII port

Branch: `roadmap/selmer-iwasawa-cohomology-part-ii`.
Head commit: `835984cdf7f29025c81ba64aea58bef0f609e110`.
Base: `a0af4de`; the initial working tree was clean.

Committed content is confined to `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md`, `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/Suggested.lean` and `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/metadata.toml`. The package, other roadmaps, dependency pins, merge order and tooling were read only. This report is the separately authorized package report. No push or GitHub write was made.

## Validation

The final targeted command was `lake build TauCetiRoadmap.SelmerIwasawaCohomologyPartII.Suggested` and exited 0. Its exact outcome line is:

```text
Build completed successfully (8982 jobs).
```

Warning count: **5**, all warnings that a declaration uses `sorry`, at lines 34, 41, 46, 52 and 83 of `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/Suggested.lean`. There were no errors or other warnings. All four examples are proved. The final Lean file is byte-for-byte identical to the accepted package's file.

A temporary type probe, built with the same authorized module-build command and then discarded from the target, checked `@` types of all seven named declarations and 28 library suppliers. The special-inert signatures retain both field structures, both number-field structures, the algebra, prime-norm assumptions and ideal arguments. The period retains its additive commutative monoid and finite source; finite target instances occur only in the fibre theorem. The probe also confirms the exact names of the five finite-sum suppliers, polynomial operations, PID decomposition, continuous-cohomology maps and low-degree Tau Ceti carriers. The final build was repeated after restoring the accepted Lean file. No Lean process remains running.

Full gate summary:

```text
gate SelmerIwasawaCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The initial gate had every content counter equal to zero and failed solely on `dirty=1` for the uncommitted new folder. The clean-tree gate above was run after the commit. `git diff --check` passed.

The required standalone dependency check exited 0 with this complete output:

```text
depcheck: 8 roadmaps, 69 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Independently checked every supplier heading: five suppliers are on main, and the other 19 precede SelmerIwasawaCohomologyPartII in the merge order. No ownership moved from a later roadmap.

## Draft pull request body

Build unitary arithmetic level raising over general CM extensions, integral congruence cohomology, diagonal Abel–Jacobi classes and two explicit reciprocity laws. Continuing SelmerIwasawaCohomology, the roadmap connects native unitary incidence geometry to rank-zero Selmer vanishing from a nonzero definite period and rank-one Selmer results from a nonzero diagonal regulator, retaining explicit uniform realised Frobenius span, coefficient, multiplicity and level hypotheses. The rank-(2,3) specialization retains all seven admissibility clauses; ramified coefficient fields and the nonproper domain remain in scope through exact supplier contracts.

AI assistance: Codex performed the port, supplier and duplication searches, mathematical self-review and validation.

## Dependencies that are still pull requests

The following are cited by roadmap name and section, with no pull-request numbers in the ported content:

- SelmerIwasawaCohomology.
- EulerSystemsAndKolyvaginSystems.
- SmoothRepresentationsOfLocalGroups.
- ArithmeticGaloisDuality.
- AutomorphicGaloisRepresentationsPartII.
- EndoscopicTransferAndUnitaryTraceComparison.
- IgusaVarietiesAndTorsionConcentration.
- PELModuli.
- ShimuraVarieties.
- LefschetzPencilsAndVanishingCycles.
- MotivesAndAlgebraicCycles.
- GlobalGaloisDeformations.
- ArithmeticGaloisRepresentations.
- LocalGaloisDeformationRings.
- IntegralHeckeAndGaloisDeterminants.
- ShimuraCompactifications.
- ReductiveGroupsPartII.
- HilbertModularVarietiesAndShimuraCurves.
- AdelicAlgebraicGroups.

The main-branch suppliers are EtaleCohomologyFoundations, StableReduction, ProfiniteCohomology, Chebotarev and SchemeAndStackFoundations. The downstream PeriodsAndSpecialValues paragraph creates no supplier edge.

## Port changes and reviewer corrections

1. Corrected the published LTXZZ reference from Invent. Math. 226 (2021), 107–419 to **228 (2022), 107–375**. The title page gives the corrected volume, year and pages (ltxzz-published line 5). The published mathematical locators, including the intersection convention for reflexive closure and the coefficient-prime bounds, were checked against the same cached legal text and retained. The read-only package's source manifest contains the old bibliographic metadata; it was not edited.
2. Deleted the generic **Product resolution ext** API item from §2.6: effective-Cartier lifting is the blowup universal property owned by StableReduction Layer 4. Scope and ownership and the exact StableReduction contract retain that supply; the Stacks reference and exceptional-point negative control retain its correct domain (stacks-blowup line 3750). The unitary product resolution, component closures, exceptional normal bundles, Chern relation, cycle statement and their Checks remain. This is a duplication deletion, not a loss of the mathematical interface.
3. Made the PI8/PII8 interface in §7.2 explicit. The package referred to these labels without defining their maps. Added the named target `auxiliaryFrobenius_heckeComparison`, the full and contracted coefficient-character ideals, every-degree quotient isomorphisms on the fixed original odd-rank cohomology modules, their congruence reductions, and simultaneous preservation of the prescribed Frobenius evaluations (ltxzz line 6617; ltxzz line 6856). Added the control Oλ²→Oλ for an omitted distinguishing operator. This uses the existing hecke-finite-support contract and adds no supplier or scope restriction.
4. Changed “seven independent clauses” in §1.6 to “seven clauses”: under the standing exceptional-set convention L2 already forces the unramifiedness part of L1. No logical independence assertion is needed; all seven clauses remain.
5. Preserved the accepted review's decisions and subsequent repairs: the 21 explicit supplier obligations, the separate §5.3 hypothesis domains, four resolved incidence composites, coefficient-kernel Hecke quotients, transpose test-module action, coefficient Frobenius twists in L5-1, quartic very-special controls, actual `d0` sign test, positive-loss primitive-kernel argument and both crystalline finite local conditions.

No mathematical narrowing or change to the rank conclusions was necessary in the remaining targets. The opening summary, all eight layers, every owned target, definition API, discriminating Checks, worked examples and supplier domains were retained. Proper-name capitalization and the corrected one-place sentence remain as in the accepted package.

## Lean-to-README moves and supplier replacements

Nothing moved from Lean to README in this port. Both real-bodied definitions, all five allowed theorem signatures and all four proved examples were kept. Native unitary models, regulators and Selmer endpoints were already fully specified as README targets on their intended carriers; no substitute carrier was introduced.

The import remains `import Mathlib` followed by `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree`, which exists at Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. The Tau Ceti import is actually used by the proved sign-action period example.

The accepted package had already replaced five generic period wrappers with `Finset.sum_add_distrib`, `Finset.mul_sum`, `map_sum`, `Equiv.sum_comp` and `Finset.sum_eq_zero`. Their files and elaborated types were verified, and those replacements were retained. The only additional duplication removal is the generic blowup-lifting item described above; the roadmap records supply only in Scope and ownership, with no removed-target stub.

## Duplication and source audit

Read the repository's normative writing guidance and contributing guidance, and main-branch roadmap examples including FinancialMathematics, RepresentationTheory and Completed/EffectiveBounds. Compared the summaries, ownership boundaries and relevant objects at all seven supplied open heads: QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics.

Searched every active and completed README on main and the 303 entries in the supplied open-roadmap inventory by mathematical object, then inspected candidate supplier sections. The broad sweep included inertness, Satake parameters, Fontaine–Laffaille conditions, weak semisimplicity, Gysin maps, blowups, Abel–Jacobi maps, Selmer conditions, regulators, Hochschild–Serre, nearby cycles, hermitian incidence, reflexive closure, realised Frobenius spans and scaled inverses. The seven supplied heads contain no competing native unitary diagonal-period or arithmetic level-raising target. Classical syntomic comparisons and curve integration do not supply the finite/adic ℓ-invertible nearby-cycle comparisons here. No progress-only revision of an existing roadmap was used as a new supplier.

| Mathematical object | Exact supply inspected | Port decision |
| --- | --- | --- |
| Prime ideals, norm and unramified rational prime | Mathlib `NumberField.inst_ringOfIntegersAlgebra`, `Ideal.absNorm`, `Ideal.map`, `Algebra.IsUnramifiedIn`, `CyclotomicField` in the files named in the README | Retain only the source-specific special-inert conjunction and boundary targets. `IsUnramifiedIn` quantifies over every upper prime. |
| Finite sums and source fibres | Mathlib finite-sum identities and `Fintype`/function carriers | Keep the native period definition and fibre-multiplicity milestone; retain supplier replacements for generic sum laws. |
| Polynomials, reflection and PID modules | Mathlib `Polynomial.eval`, `derivative`, `reflect`, `coeff_reflect`, `Module.torsion_by_prime_power_decomposition`, `Module.free_iff_isTorsionFree` | Use the exact existing carriers and finite/PID hypotheses. |
| Continuous cohomology and sign | Mathlib `TopRep.homogeneousCochains`, `continuousCohomology`, `ContinuousCohomology.cochainsMap` and maps; Tau Ceti `d0`, `d0_apply`, `H1`, `H1pi` and low-degree controls | Retain exact supply and the actual sign-action example, without claiming these are Bloch–Kato local conditions. |
| Rees algebras, blowup charts and universal lifting | Mathlib `reesAlgebra`, `mem_reesAlgebra_iff`; Tau Ceti `affineBlowupι` and its cover/base API; StableReduction Layer 4 | Delete the generic lifting target. Keep the two-factor unitary calculation and nontrivial exceptional bundle. |
| Arithmetic versus divisor Abel–Jacobi | Tau Ceti Weil-divisor Abel–Jacobi files, MotivesAndAlgebraicCycles §§7.16–7.18 | Formal divisor classes do not implement the arithmetic étale regulator. Retain its explicit supplier obligation. |
| Weak semisimplicity, finite conditions and bad-place annihilation | SelmerIwasawaCohomology §§0.12–0.13, 2.6–2.7, 4.8–4.11, 4.24–4.25 | Import these targets, including both H⁰ vanishings and crystalline coefficient pushout. |
| Exponents, restriction, realised detection and scaled inverses | EulerSystemsAndKolyvaginSystems §§1.2–1.3, 1.6, 1.11, 1.15, 4.4 | Keep the prime-field Hom condition, actual realised span premise and primitive-kernel conclusion. |
| Satake predicates and Hecke normalizations | SmoothRepresentationsOfLocalGroups §§SR.1.2, SR.4.1, SR.4.4 | Import the predicates/formulas. Read the even/odd formulas at the supplied head and recompute the numerical controls. |
| Rigidity and coefficient Fontaine–Laffaille theory | LocalGaloisDeformationRings §§1.6, 2.3, 2.12, 2.20 | Import exact predicates. Retain only the Satake-to-arithmetic-Frobenius specialization. |
| CM closure, torsor descent and orbit trace | PELModuli §§M0.25–M0.26, M4.7–M4.9 | Preserve the published intersection convention and trace without division by group order. |
| Multiplicities, genericity and transfer | AutomorphicGaloisRepresentationsPartII AG2.1b, AG2.5–AG2.7; IgusaVarietiesAndTorsionConcentration §IG.7.2; EndoscopicTransferAndUnitaryTraceComparison §§13.7–13.9 | Preserve the distinctions between compact ST/END, nonproper rational concentration, integral boundary vanishing and the broader transfer contract. |
| Nearby complex, geometry and duality | LefschetzPencilsAndVanishingCycles §§7a.7–7a.9; EtaleCohomologyFoundations; SchemeAndStackFoundations §2.15; ArithmeticGaloisDuality | Retain general suppliers and exact residual obligations. A rational weight sequence does not supply the required integral complex. |

The six legal cached sources were readable. Independently inspected the special-inert/admissibility definitions, the even coefficient bound, incidence/normal calculations, blowup and projective-bundle conventions, separate product-concentration domains, all four J-map composites, both explicit laws, the rank-one regulator domain, eventual-family conditions and Hilbert precursor hypotheses. Representative witnesses are ltxzz-published line 1542, line 1549, line 6408 and line 7345; ltxzz line 1871, line 3349, line 4118, line 5080, line 5931, line 6011, line 6037, line 6303, line 6400, line 6418 and line 6767; liu-tian line 1407, line 1477 and line 1496; stacks-projective line 3353, line 3361 and line 3479; stacks-blowup line 3750. The product exceptional bundle is checked by its local charts and Chern relation, not by adopting the preprint's incorrect trivial-product wording at ltxzz line 4759. No source passage was copied into the roadmap. Targeted public Mathlib/Zulip searches yielded no additional owner that changes these interfaces.

## Adversarial mathematics pass

Each row covers the indicated statement, subsidiary API and displayed identities. The native arithmetic domain is characteristic zero, CM quadratic, n≥2, m≥1 and finite exceptional supports. Rank zero, inseparable CM extensions, equal-characteristic arithmetic coefficient fields and infinite exceptional supports are outside that domain, rather than silent special cases. The much more general finite-period definition also permits zero coefficients, empty sources and characteristic two. “Retained” is a mathematical self-review result conditional on the stated suppliers, not a claim of completed geometric formalization.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Standing ranks, twists, degrees and weights | n=0,1,2,3,4,5; identity factor swap | n<2 is excluded. The two half twists sum to n, product dimension is 2n−1 and tensor weight is −1; n=2 gives ranks 2,3 and coefficient degree 3. | Retained. |
| Coefficient and kernel conventions | Ramified DVR π²=ℓ; m=0,1,2; zero module; unit ideal; field versus DVR | m≥1 is essential. The O-extended kernel kills πᵐ, whereas extending the bare integer kernel can kill π² instead of π. Quotient, localization and annihilator differ. | Retained. |
| Frobenius, polarization and cochain signs | Inert p=3; γ=(I,−1)c; sign action on ℤ | Tate scalars are 9 and 1/9, the GL component of γ² is −I, and the actual coboundary period is −2. | Retained; proved sign example checked. |
| Hecke/reciprocal conventions | Degrees 1,2; q=1 and q=3; both parities; odd example over ℚ | Reflection has the odd-degree minus sign; even Hecke values are 16 and 0, odd values 9/2 and 105/2. The rational odd example has 2 invertible. q=1 is outside raising-place exclusions. | Retained supplier formulas. |
| Haar and orbit-trace conventions | C₂ with 𝔽₂ coefficients; zero subgroup volume; two-point free orbit | A normalized convolution idempotent requires an invertible volume. Orbit trace of (1,1) is 1, total trace is 0. Source-subgroup normalization and counting multiplicity are necessary. | Retained. |
| Integral nearby-complex supplier | One, two and three branches; ℓ=p; nonproper punctured affine line | One branch has only degree 0; branch counts give the stated columns, ℓ=p is excluded, and nearby cohomology is not unrestricted generic-fibre cohomology. | Retained exact obligation. |
| Nearby parity filtration and monodromy supplier | Link generator 1; N=2 and N=3; nonsemisimple Frobenius | Monodromy maps to twist −1 and vanishes on F₀. The odd relative-dimension-two case needs the general integral contract, not the odd-dimensional parity contract. | Retained. |
| Rational concentration, H(N), boundary and regulator suppliers | F⁺=ℚ; ranks 2,3,4; reducible residual system; ℙ¹ | Rational cuspidal concentration, exact multiplicity and integral residual boundary vanishing have separate domains. An arbitrary point cycle on ℙ¹ has no such H¹ edge. | Retained distinct obligations. |
| Transfer and model suppliers | Small residue characteristic; transferable neat level outside S_FL domain; other places above p | Neither a small-level theorem nor smoothness alone gives integral descent or nonproper specialization. The explicit extensions remain required. | Retained. |
| §1.5 special-inert definition and transport/residue API | ℚ(i), p=2,3,5; zero ideal; norm p²; identity transport | Only p=3 is special in the Gaussian examples; its upper norm is 9. Norm 2 and split extension ideals are rejected by the two proved examples; prime norm excludes higher residue degree. | Retained all four boundary theorems. |
| §1.5 very-special/reflexive API and quartic targets | Quartic α²=−3+√2 at 17 and 103; trivial reflexive extension | The reflex-field intersection is ℚ(√7). At 17 the residue 3 is nonsquare and 7 is nonsquare; at 103 the residue 35 is nonsquare and 7=25². Thus the first place is special but not very special, the second very special. Discriminant 7168 excludes ramification at both. | Retained. |
| §1.6 admissibility: projections, basis and polarization API | ℓ=2,3; ξ=±1; identity scalar; basis conjugation; n=2; Σ⁺min containing the bad places | Small coefficient primes and the forbidden witnesses fail. Conjugation, lattice homothety and polarization units preserve the clauses; the tensor twist is 2. L2 forces unramifiedness in F on this domain. | Removed the independence wording; retained all seven clauses. |
| §1.6 prime-field Hom control | C₄₈ acting over 𝔽₄₉ with weights 7,6 | Adjoint weights 0,0,1,−1 admit no k-linear map to weights 7,6, but x↦x⁷ on weight 1 is a prime-field-linear equivariant map to weight 7. | Retained every coefficient twist. |
| §2.1 level datum: ext, reduction, ideals and level change | Empty versus infinite raising set; m=1,2; ramified O; absent support | Empty raising sets are valid; infinite exclusions and m=0 are not. Residual specialness need not lift to depth 2, and changing level requires its own P6. | Retained. |
| §2.2 basic correspondence and its base-change/uniformization API | N=2,3; empty basic index; field extension | Fibre dimensions 0,1 and codimensions 1,1 agree. The positive-dimensional fibre is not called finite; the index scheme is the finite étale object. | Retained. |
| §2.3 strata: charts, base change and generic fibre | xy=p; p inverted; p=3,N=3; identity level map | There are two reduced special branches and no singular generic link. The quartic link normals have degrees +16 and −16. | Retained. |
| §2.4 link cohomology and excess bundle | Minimal relative position; p+1 nonunit; torus orbit in characteristic two | Minimal fibre is ℙ⁰ with p+1 indexing points. Restriction isomorphism requires the degree unit, and orbit trace needs no division. | Retained. |
| §2.5 six maps and parity-specific ∇ | N=2,3; node basis vectors; p=3 | The zero-link convention avoids negative powers at N=2. Alternating restriction gives 1,−1. The odd matrix cancels its boundary with coefficients p+1 and (p+1)². | Retained. |
| §2.5 filtration, singular sequence and equivariance | Frobenius 4 on ℤ₃; link generator; p²−1 nonunit | Invariants are 0 and coinvariants ℤ/3. The singular exact sequence retains p²−1 invertible and twist −1. | Retained. |
| §2.6 resolution and component-closure definition | Empty centre; off-centre point; centre component; two node charts | Blowup is unchanged away from the centre. The ordinary strict transform of the centre component is empty; closure from the Cartier locus gives the intended resolved component. Each local chart has three branches. | Retained owned construction. |
| §2.6 projective bundle, sections and exceptional products | Geometric fibre ℙ¹; n=2,p=3 quartic; split normal bundle | η²+(a+b)η+ab=0, section product is zero, ρ!η=1 and ρ!(η²)=−(a+b). The ground section has self-intersection −16, excluding a trivial product. | Retained all normal/Chern data. |
| §2.6 cycle, coefficients and lifting boundary | Zero graph; identity map; exceptional geometric point | Graph pushforward and coefficient transport agree. Several exceptional points lift the same base point with zero image ideal; unrestricted uniqueness is false. | Generic lifting item deleted in favor of StableReduction; negative control retained. |
| §3.1 localizedBoundaryComparison | Reducible residual system; compact versus nonproper base | Residual irreducibility is needed for integral boundary exclusion; compactness is not silently assumed. | Retained. |
| §3.1 localizedIntertwiner | Unlocalized constituent with only target special-level invariants | Global intertwiner surjectivity fails; the P5 exclusion is used only on localized congruent support. | Retained. |
| §3.1 localizedIntegralConcentration | Zero complex; torsion middle term; derived reduction | Concentration modulo λ plus perfectness/derived reduction is what removes adjacent torsion and establishes integral freeness. | Retained supplier domains. |
| §3.2 oddTate_surjective and oddE2_concentration | N=3; missing H(N); missing A6.1.4 | Surjectivity has the weaker source domain. The separate E₂ concentration requires A6.1.4. | Retained separate hypotheses. |
| §3.2 oddFrobenius_comparison | Rank-one invariant factor; unipotent Frobenius; absent H(N) | Weak semisimplicity and coinvariant identification retain concentration, residual irreducibility and H(N). | Retained. |
| §3.3 even integral freeness | N=2; zero definite support; small coefficient prime; non-small transferable level | Nonzero support, rigidity, cyclotomic irreducibility and coefficient bound are explicit. Broader levels consume the oldform obligation. | Retained published bound. |
| §3.4 Frobenius exclusions | Simple versus doubled raising pair; p²=1 | Residual eigenvalues 1 and p² are excluded on the stated even domain; collisions are outside PI2. | Retained. |
| §3.5 even singular comparison | m=1,2; invariant/coinvariant distinction; vanishing ground quotient | Correct eigenspecialization kills λᵐ as well as Hecke eigenvalues; the Frobenius exclusions remove the extra ground term. | Retained. |
| §3.6 congruence Galois realization | Multiplicity 1 versus 2; zero support; c-conjugation | μ≥1 and existence of an isomorphism do not choose a canonical coordinate; the c and half twist remain. | Retained. |
| §3.7 special-level changes | Empty prime set; identity level; one local switch | The empty case is identity. Intertwining genericity, H(n₁) and cohomological genericity remain necessary. | Retained. |
| §4.1 diagonal datum and naturality API | n=2; incompatible levels; identity transport; refine only the source | Dimensions 1,2,3 give graph codimension 2. A source cover with unchanged target commutes but is not Cartesian. Exceptional set Ω⁺ must cover raising places. | Retained. |
| §4.2 graph cycle and class/pushforward API | Zero cycle; degree-two source cover; point graph | Values are 0, 2Δ and trace +1, respectively. Image indicators lose multiplicity. | Retained. |
| §4.3 projected AJ and add/edge/reduction API | n=2; zero cycle; ℙ¹ point; nonproper reducible residual system | Correct coefficient degree is 3 with twist 2; only concentrated geometric cohomology gives the edge identification. Integral and rational boundary inputs differ. | Retained. |
| §4.4 purity and finite Selmer membership | Inert p=3; w dividing ℓ; ℓ ramified in F; ramified coefficient field | Weight is −1. Crystalline membership uses unramified base/hyperspecial model hypotheses, while coefficient ramification remains allowed. Rational purity alone is not the torsion crystalline statement. | Retained. |
| §4.5 multiplicity realization | Reducible Galois factor; multiplicity two; nonzero tuple | H(N)'s antecedent must hold. L4 supplies it on the admissible domain; a nonzero coordinate is chosen, not canonical. | Retained. |
| §4.6 regulator naturality | Identity; degree-two trace; non-Cartesian refinement; coefficient extension | Trace has source degree 2. Pullback gives the whole fibre product, not a preferred graph without the additional Cartesian/component condition. | Retained. |
| §5.1 first datum, test modules and transpose theorem | Empty support; depth reduction; cyclic P over 𝔽₇; tensor roots over 𝔽₁₁ | Transpose action is necessary: same-action eigenvector gives a pairing defect 2. Factor specialness holds in the polynomial example while tensor root 3 occurs twice, so PI7 is independent. | Retained. |
| definiteDiagonalPeriod and fibre theorem | Singleton; empty source; two coincident points; unused target point; zero coefficients | Period values 1,0,2 and zero for unused fibres agree with finite source cardinality. No finite X,Y premise appears in the definition. | Retained exact Lean generality. |
| Period cancellation, characteristic two and sign examples | Values −1,1; two coincident ones over 𝔽₂; actual d0 at ±1 | Values 0,0,−2 disprove averaging, an image indicator and a converse nonzero-term implication. | All relevant proved controls retained. |
| §5.2 first geometric law | Zero cycle/test; one graph point; both rank parities | Source trace and actual legs give counting multiplicity; the special-map contracts retain their parity domains. | Retained. |
| §5.3 productNearbyCohomology_vanish | n=2; only A7.2.3; no H(N), rigidity or residual irreducibility | Factor degrees 1+2 give degree 3, using freeness to remove Tor. | Retained weaker hypothesis domain. |
| §5.3 productStrata_compactSupport_iso | Only A7.1.1; c≥3 empty strata | The empty comparison is the zero-module isomorphism; integral concentration is not assumed. | Retained weaker hypothesis domain. |
| §5.3 productWeightSequence_concentration, frobenius_exclusion, weaklySemisimple | Five E₁ columns; n=2; missing full hypotheses | Three E₂ positions and the Frobenius exclusion follow only with the full stated inputs; exceptional terms in E₁ are retained. | Retained. |
| §5.4 potential groups and boundary API | Unipotent Frobenius over 𝔽₃; π² differential; zero cycle; reduction | Invariants-to-coinvariants can be zero. The class π in coker π² has exponent 1; cokernels reduce compatibly while kernels need not. | Retained actual subquotients. |
| §5.4 four J-composites and ∇ | Class on Q°•; class on Q••; class on another component | Only the corresponding two projections contribute; all four weighted outputs have the common definite-function target. | Retained explicit domains and coefficients. |
| §5.5 first explicit reciprocity | p=3; zero test; singleton graph source | Scalar is 4φ₀(I°)φ₁(T°), and pairing uses transpose annihilators. | Retained. |
| §5.6 first exponent equality | Unit versus π scalar over A₅; zero class | Unit factors preserve exponent; nonunits can lower it, so PI2/PI4/PI5 are material. | Retained equality on its exact domain. |
| §6.1 second datum and correspondence API | One nonsplit raising place; two coincident fibres; 𝔽₁₉ polynomial control; m=0 | Ω⁺ includes the raising set; multiplicity is 2. Derivatives 11,13,4 verify PII4/PII7 while even intertwining fails. No PII5/PII6 is invented. | Retained distinct second-law domain. |
| §6.2 second geometric law | n=2,3; zero cycle; odd basic square | Correct target has degree 2r₀ and twist r₀. The odd product square uses Lemma 4.5.2, not the even-only Cartesian basic square. | Retained. |
| §6.3 odd special-fibre coinvariants | N=3; missing A7.3.2 or H(n₁) | Weak semisimplicity and coinvariant comparison keep all required premises. | Retained. |
| §6.4 second exponent bound | O/π²→O/π; zero class | Image exponent can decrease from 2 to 1; the source supports only the stated upper bound. | Retained inequality. |
| §7.1 polarized image lift | m=1 and higher; ξ²=1; simple eigenline; p=2,3 coefficients | Forbidden residual ξ is excluded, and prime-to-ℓ order lifts the free fixed line. Native admissibility excludes small ℓ. | Retained actual image/powering contract. |
| §7.2 actual Frobenius detection | Zero realised span; rank 1,2; c=0; 0<c<k; c≥k | Fixed coefficients alone do not imply detection. At c=0 an inverse gives a basis; at c≥k the zero lower bound permits C=0. | Retained substantive span premise. |
| §7.2 auxiliaryFrobenius_heckeComparison | T=Oλ[U], U=diag(0,1), φ(U)=0; omission to Oλ; reduction modulo λ; zero module and unchanged away-set | Full quotient is Oλ but the contracted quotient is Oλ², so the map is projection with nonzero kernel; zero modules and identity contractions give isomorphisms. | Stated PI8/PII8 and their source domains explicitly; added the failure Check. |
| §7.2 scaled inverse and primitive kernel | D=[[π,1],[0,π]], C=[[π,−1],[0,π]] over A₅ at residue characteristics 2,3,11 | Both products are π²I, det C is a nonunit, and t=(−1,π) has first evaluation 0 and second π² of exponent 3. A diagonalizing basis is not supplied. | Retained. |
| §7.3 rigidity from specialness | N=2,p=3,ℓ=11; doubled rank-four pair at ℓ=19; excluded place | Arithmetic roots are {5,1} once versus {4,17} twice. The second case fails specialness. Minimal and Fontaine–Laffaille projections are preserved. | Retained supplier specialization. |
| §7.3 one-/two-place annihilators | Empty base vertex; another place above p₁; arbitrary class with unramified coefficients | Each nondetecting place needs model/cycle specialization. Coefficient unramifiedness alone does not force nonsingularity of every H¹ class. | Retained all-place construction. |
| §7.3 local pairing and crystalline finite input | A₅ elements π,π²; nonperfect π-scaled pairing; K=ℚ₁₁ uniformizer Kummer class | Perfect pairing exponent is 2 versus 1 when scaled. A nonfinite Kummer argument can pair nontrivially with a finite unramified argument; both finite conditions are necessary for the different bound. | Retained both finite hypotheses and total loss 2c. |
| §7.4 eventual families and coefficient twists | CM/isogenous elliptic curves; no supercuspidal factor; F⁺=ℚ; nontrivial coefficient automorphism | These fail the respective family hypotheses. Frobenius twists preserve odd adjoint Jordan sizes; an even tensor block cannot be a split constituent. Eventual admissibility does not prove uniform span. | Retained only the two source families. |
| §8.1 rank zero | Hypothetical nonzero saturated rank-one lattice; zero period; ramified different | Nonzero period fixes finite mper. The growing pairing contradicts a bound independent of m beyond m₀+c+mper+mlat+mdif. Zero period supplies no premise. | Retained. |
| §8.2 rank one | Two-dimensional saturated lattice; nonunit scaled inverse; chosen nonzero coordinate | Actual AJ gives the lower bound. Primitive t kills the first-place term; second-place exponent grows past m₀+mper+2c+mlat+mdif. | Retained explicit uniform rank-two span. |
| §8.3 H(N)-free domains | n=2 over ℚ; n≥3 over ℚ; F⁺≠ℚ | H(2),H(3) are discharged; higher-rank rational-base H(N) remains conditional. Eventual rank results still require eventual span. | Retained exact domains. |
| §8.4 rank-(2,3) | Arbitrary CM base; delete L6 or L7 | Small rank removes H(2),H(3), not either admissibility clause or the relevant span hypothesis. | Retained all seven clauses. |
| §8.5 Hilbert precursor | Odd g=1,3; even g; missing LIInd or dimension equality | The twist is integral only on the odd-degree source domain; all residual and dimension hypotheses remain. This is not the unitary singular comparison. | Retained separate supplier obligation. |
| Downstream interfaces | L-value witness versus L-derivative alone; reverse dependency | The derivative-to-cycle implication is conjectural and not exported. The consumer supplies no premise here. | Retained direction and scope. |

## Outstanding supplier obligations

Acceptance remains conditional on the same 21 exact contracts. Their implementations are not asserted to exist merely because the roadmap is ported or the suggested signatures elaborate.

| Contract | Owner |
| --- | --- |
| integral-nearby-complex | LefschetzPencilsAndVanishingCycles |
| native-shimura | ShimuraVarieties |
| unitary-incidence | ReductiveGroupsPartII |
| nearby-weight | LefschetzPencilsAndVanishingCycles |
| automorphic-multiplicity | AutomorphicGaloisRepresentationsPartII |
| diagonal-concentration | AutomorphicGaloisRepresentationsPartII |
| boundary-cohomology | ShimuraCompactifications |
| rigid-r-equals-t | GlobalGaloisDeformations |
| old-form-dimension | EndoscopicTransferAndUnitaryTraceComparison |
| local-unitary-representations | EndoscopicTransferAndUnitaryTraceComparison |
| chow-abel-jacobi | MotivesAndAlgebraicCycles |
| hochshild-serre-adic | SchemeAndStackFoundations |
| purity-crystalline-regulator | ArithmeticGaloisDuality |
| unitary-special-compatibility | ShimuraVarieties |
| semistable-boundary | LefschetzPencilsAndVanishingCycles |
| polarized-image-lifting | ArithmeticGaloisRepresentations |
| hecke-finite-support | IntegralHeckeAndGaloisDeterminants |
| eventual-images | ArithmeticGaloisRepresentations |
| eventual-rigidity | GlobalGaloisDeformations |
| hilbert-precursor | HilbertModularVarietiesAndShimuraCurves |
| hermitian-local-global | AdelicAlgebraicGroups |

No unresolved port defect or source-access waiver remains. No suspicious instruction was followed from package, review, source or fetched text. Source and review text was used only as evidence.


Pull request: #1403 (roadmap/selmer-iwasawa-cohomology-part-ii at 835984c)
