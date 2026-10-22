# Repair report: SelmerIwasawaCohomologyPartII

## F01 (P1) — not actionable in this package: the general integral filtered nearby-cycle theorem belongs to LefschetzPencilsAndVanishingCycles

Implicit integral input → explicit `gap:integral-nearby-complex` in the exact supplier contracts and the plan's top-level gaps. Its contract specifies hypotheses, graded complex, E₁, signs, tame operator, derived inertia, coefficient compatibility and nearby abutment. §§2.5, 2.6 and 5.3 consume it. Added odd-rank, nonproper and three-branch controls; retained `nearby-weight` unchanged.

The finding is correct. LefschetzPencilsAndVanishingCycles §7a.7 states its graded comparison over ℚ_ℓ, and §7a.8 uses ℚ_ℓ on E₁. Finite/adic stalks in §7a.7 explicitly do not determine the derived inertia action. The existing `nearby-weight` contract covers only relative dimension 2r−1, two components and specified parity vanishings. Neither N=3 (relative dimension 2) nor the resolved three-branch chart lies in that domain.

The native specializations are supported by ltxzz Construction 5.9.1 and Lemma 5.9.2, pp. 84–85 (ltxzz line 4023; ltxzz line 4063), and equation (5.27), pp. 98–99 (ltxzz line 4777). At n=2, blowing up (x,u) in xy=p, uv=p gives xtv=p and usy=p: three branches, hence five possible columns. Rationalization cannot retain integral torsion. The new contract supplies the general filtered object; the separate `nearby-weight` gap supplies the stronger parity-dependent cohomological filtration and inertia cokernel (ltxzz line 4122; ltxzz line 4136).

This package can declare and consume the missing input, but cannot make an earlier supplier state or prove it within the permitted files. That residual supplier obligation remains for the maintainer. Generic-fibre identification stays in `native-shimura`; no general cohomological weight-monodromy equality is requested. No supplier target has been invented or asserted to exist.

## F02 (P2) — applied

§5.3's common full-hypothesis statement → separately named nearby vanishing under A7.2.3 alone and support comparison under A7.1.1 alone, on Datum 5.1. Named the remaining full-hypothesis conclusions separately, retained their domains, and updated §5.4's consumers. Added hypothesis-domain, degree-three and empty-stratum Checks. Recorded Lemma 7.2.5 and Remark 7.2.6 explicitly in `sources.toml`.

Evidence: ltxzz line 5920 specifies concentration and freeness in A7.2.3; ltxzz line 5952 and ltxzz line 5953 identify the two conclusions; Remark 7.2.6, p. 123 (ltxzz line 6011), gives their separate weaker domains. The E₂, Frobenius-exclusion and weak-semisimplicity conclusions retain A7.1.1, A7.2.2–A7.2.4 and H(n),H(n+1), as in ltxzz line 5931. The weaker support comparison uses derived Künneth, not a new freeness premise.

## F03 (P3) — applied

Unspecified component restriction → four explicit composites. J°† and J°• project to Q°• then push to P°•; J•† and J•• project to Q•• then push to P••. Each names its product incidence map and definite-function target. Retained ∇'s four coefficients and made its map from the Frobenius-coinvariant potential target explicit. Added a component-projection Check.

Evidence: ltxzz Construction 5.11.7, pp. 104–105 (ltxzz line 5080; ltxzz line 5083; ltxzz line 5086; ltxzz line 5089), gives the four domains and targets separately. Its four summands have coefficients 1,(p+1)²,p+1,(p+1)³ (ltxzz line 5095). Remark 5.11.8 gives coinvariant factorization and the canonical map from the potential target (ltxzz line 5121). Construction 5.11.4, pp. 99–101 (ltxzz line 4793), identifies the product incidence operations. The reciprocity identity is unchanged.

## Source, ownership and pinned-library checks

All six manifest texts are available in the legal cache. The mathematical evidence above was read directly, including the surrounding hypotheses and printed page markers. Additional boundary checks used the published reflexive closure (ltxzz-published line 1542), deformation hypotheses D0–D4 (ltxzz-deformation line 1444), Hilbert level-raising clauses (liu-tian line 1477), projective-bundle relation (stacks-projective line 3479) and Cartier lifting (stacks-blowup line 3750). No source passage was copied into a deliverable. No new work or inaccessible text is needed, so no missing-reference request was added. `sources.toml` adds precise locators to the already certified `ltxzz` record; its version and access evidence are unchanged.

Read the house shape in `TauCetiRoadmap/StableReduction/README.md` and `TauCetiRoadmap/Chebotarev/README.md` on content main. Read LefschetzPencilsAndVanishingCycles §§7a.7–7a.9 at its open-roadmap head. Checked the open K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors and ErdosProgressionPowers scope statements, and the board's read-only ArithmeticDynamics counterpart. The remote ArithmeticDynamics head was identified, but its file fetch returned empty content; no mathematical inference here relies on that response. These siblings do not supply the native incidence maps or the required ℓ-invertible integral nearby complex. CohomologyComparisonsPartII's classical p-adic syntomic/HK comparisons have a different coefficient domain.

The content manifest pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. GitHub code searches were followed by reading files at those exact pins:

- `Mathlib/RingTheory/ReesAlgebra.lean`: `reesAlgebra` and `mem_reesAlgebra_iff` use a commutative ring and its ideal; they supply the chart algebra, not a nearby-cycle complex.
- `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean`: `affineBlowupι`, `opensRange_affineBlowupι`, `iSup_opensRange_affineBlowupι` and `affineBlowupι_toSpecZero` supply the chart maps used in the local boundary calculation.
- `Mathlib/Algebra/Homology/SpectralObject/SpectralSequence.lean`: `CategoryTheory.Abelian.SpectralObject.spectralSequence` constructs a sequence from an existing spectral object and spectral-sequence data; it does not construct the geometric filtered object required by F01.
- `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`: `TauCeti.ContCohomology.d0` has value g·m−m, agreeing with the sign-action control.

Recursive file-tree searches at both pins were untruncated. They locate no nearby-cycle or weight-spectral-sequence file; Tau Ceti's semistable filename concerns elliptic minimal models. These searches and the generic API reads give no existing geometric carrier on which the changed headlines can honestly be added to `Suggested.lean`. General blowups, abstract spectral sequences and the base Selmer library retain their earlier owners. No merge-order placement or ownership move was made.

## Adversarial mathematics pass

The table covers each numbered subsection's definitions, API assertions and displayed identities, including unchanged statements. Results are checks of the stated mathematical domains and declared contracts, not claims that future supplier implementations have been proved. All new geometric Checks remain in the README because their native carriers are unavailable at the pins.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Standing rank, coefficient, finiteness and universe conventions | n=0,1,2; m=0,1,2; ramified Oλ; equal characteristic; zero coefficients; infinite exclusions | n≥2 and m≥1 exclude invalid native data; λ-powers allow ramification; finite-period algebra permits zero coefficients; arbitrary carriers need no countability | None |
| Frobenius, polarization, twists and cochains | Inert p=3; (I,−1)c squared; rank-(2,3) tensor; sign action on ℤ | Scalars 9 and 1/9; square −I; tensor rank 6, twist 2, weight −1; coboundary −2 | None |
| Hecke, product order and torus trace | q=3 rank 2/3; odd n factor exchange; free two-point orbit with 𝔽₂ coefficients | Distinct parity formulas and factor labels retained; orbit trace 1 versus total trace 0 | None |
| §1.5 special/very-special predicates and four API assertions | ℚ(i), primes 2,3,5; base completion degree 2; identity transport | 3 accepted with residue size 9; 2,5 and degree-two completion rejected; published reflexive closure retained | None |
| §1.6 admissibility and four API assertions | ℓ=2,3; ξ=±1; identity scalar; homothety and basis change | Small primes and forbidden witnesses fail; all seven clauses and polarization invariance retained | None |
| §2.1 datum and four API assertions | Empty/infinite raising sets; m=0,1,2; compatible level change | Empty raising set allowed; infinite support/m=0 excluded; level change needs its own P6; ideal quotient, annihilator and localization stay distinct | None |
| §2.2 basic correspondence and three API assertions | N=2,3; empty source; residue extension | Fibre dimensions 0,1 and codimensions 1,1; empty source stays empty; tangent/normal domains retained | None |
| §2.3 strata and three API assertions | xy=p; invert p; p=3 quartic; branch exchange | Reduced node; smooth generic chart; normal degrees 16 and −16 | None |
| §2.4 cohomology, excess and trace | Minimal projective fibre; ℓ divides p+1; characteristic-two orbit | Fibre ℙ⁰; restriction isomorphism needs a unit; orbit trace avoids division | None |
| §2.5 filtered input and coefficients | N=2,3,4; Oλ and A_m; nonproper smooth punctured model | Odd N=3 lies outside the old parity gap; nearby H¹=L(−1) differs from generic H¹=0 | New integral-nearby-complex gap and Checks |
| §2.5 differential, matrices and parity maps | Restriction on (1,0),(0,1); N=2,3; p=3 | Values 1,−1; odd diagonal −16, even entry 4; odd boundary cancels; even balloon term survives | None |
| §2.5 monodromy and singular sequence | Link generator 1; F=4 on ℤ₃; p²−1 nonunit | Graded map has twist −1; invariants 0 versus coinvariants ℤ₃/3; singular sequence retains its unit premise | None |
| §2.6 component closures, lifting and graph | Centre itself; empty centre; exceptional-point maps; generic graph | Ordinary centre transform empty, resolved closure nonempty; Cartier lifting is sufficient; arbitrary exceptional lifts need not be unique | None |
| §2.6 bundle, Chern relation and exceptional products | Point fibre; trivial line sum; O_C⊕O_C(4); both sections | η²=0 only for trivial Chern classes; D₁ square −16; section product 0; ρ!η=1 and ρ!η²=−a−b | None |
| §2.6 semistable product sequence | n=2; xtv=p and usy=p; no fourfold point | Relative dimension 3, triple intersections and possible columns −2 through 2 | New gap use and five-column Check |
| §3.1 boundary comparison, intertwining and concentration | Unlocalized bad constituent; adjacent torsion; derived reduction | Intertwining requires localization; residual concentration uses derived reduction to give freeness; boundary conclusion has its separate irreducibility domain | None |
| §3.2 odd Tate cycles | N=3; omit H(N) or A6.1.4 | Surjectivity, concentration, and the stronger eigenvalue/coinvariant statements keep distinct domains | None |
| §3.3 even freeness | N=2; zero automorphic support; level outside S_FL restrictions | Nonzero support and full even hypotheses retained; broader permitted levels use declared old-form-dimension gap | None |
| §3.4 ground Frobenius exclusions | Distinguished Satake pair; eigenvalues 1 and p² | Removal of the distinguished pair is used, not an exclusion for arbitrary data | None |
| §3.5 even singular comparison | Modulo λ and λ²; invariants versus coinvariants | Uses actual congruence quotient and the even filtered inertia theorem | None |
| §3.6 congruence realization | Multiplicity 1 and 2; change of lattice | μ≥1 and c-conjugation/twist retained; existence gives no canonical coordinate | None |
| §3.7 odd level changes | Empty P; two distinct rational supports; omit genericity | Identity for empty P; all-degree comparison retains intertwining, cohomological genericity and H(n₁) | None |
| §4.1 diagonal datum and three API assertions | n=2; missing level inclusion; source-only refinement; identity | Dimensions 1,2,3; absent inclusion gives no map; compatible square need not be Cartesian | None |
| §4.2 graph cycle and three API assertions | Zero cycle; degree-2 cover; point graph | Additivity; pushforward 2Δ; point trace 1 | None |
| §4.3 projected regulator and three API assertions | n=2; zero class; ℙ¹ point; nonproper reducible residual system | Target H¹ of H³(2); no edge on arbitrary cycles; rational and integral boundary hypotheses remain separate | None |
| §4.4 purity and finite membership | Weight −1; ramification in F; ramified coefficient field | Local finite comparison uses L1–L2; coefficient ramification is allowed and is not ramification of F | None |
| §4.5 multiplicity and conjugation | Reducible attached factor; μ=2 nonzero tuple | H(N)'s irreducibility antecedent is needed; nonzero tuple has a nonzero chosen coordinate | None |
| §4.6 regulator naturality | Degree-2 cover; non-Cartesian refinement; coefficient extension | Trace multiplies by source degree; pullback retains the whole inverse image | None |
| §5.1 datum, test pairing and finite period | Tensor specialness versus factor specialness; zero quotient; double/empty source; cancellation; 𝔽₂ | PI7 independent of individual conditions; source multiplicities 2,0 retained; nonzero summand need not give nonzero period | None |
| §5.2 first geometric law | p=3; graph fibre of multiplicity 1; exchange factor order | Both Hecke directions and (p+1)² retained; graph sums count the actual source | None |
| §5.3 nearby vanishing | A7.2.3 only; n=2 factor degrees 1 and 2 | Product middle degree 3; Künneth freeness kills Tor without rigidity, residual irreducibility, genericity or H(N) | Separate weaker target and Check |
| §5.3 support comparison | A7.1.1 only; Q(c)=∅ for c≥3; no A7.2.3 | Boundary vanishing and derived comparisons suffice; empty comparison is 0→0 | Separate weaker target and Checks |
| §5.3 E₂, exclusion and weak semisimplicity | Five-column E₁; drop PI7; omit even freeness | Three-position E₂ and exclusions require the full retained assumptions; no unconditional E₂ degeneration inferred | Named targets; new filtered input |
| §5.4 potential source/target and boundary API | Unipotent F over 𝔽₃; differential π²; zero cycle; reduction | Invariant-to-coinvariant map can be zero; class of π in coker π² has exponent 1; reduced kernels need not commute | None |
| §5.4 four resolved composites and ∇ | Class on Q°•; class on Q••; class on another component; four function targets | First pair versus last pair distinguished by direct-summand projections; Hecke-weighted outputs all land at the °,° level | Explicit composites and Check |
| §5.5 first explicit law | p=3; zero function; congruence quotients | Coefficient p+1 and both eigenvalues retained; actual quotient used | None |
| §5.6 first exponent equality | Unit multiplier; zero; multiplication by π | Equality uses unit Hecke factors; a nonunit can lower exponent | None |
| §6.1 second datum and three API assertions | Double fibre; m=0; absence of first-law rigidity | Function value 2; m≥1; second law retains its own hypotheses | None |
| §6.2 second geometric law | Zero class; ranks 2 and 3 | Degree/twist 2r₀,r₀ and both correspondence legs agree | None |
| §6.3 odd special-fibre coinvariants | N=3; omit A7.3.2 or H(n₁); unipotent action | Concentration, multiplicity and weak semisimplicity are required for the asserted comparison | None |
| §6.4 second exponent bound | O/π²→O/π; zero cycle | Exponents 2→1 allow strict inequality; absolute degree-2n class remains distinct from singular regulator | None |
| §7.1 image lifting | m=1,2; ξ²=1; simple fixed line | Unit and prime-to-ℓ premises indispensable; no arbitrary fixed-line lift asserted | None |
| §7.2 detection | Zero realized span; c=0; c≥k; triangular D and C over A₅ | Explicit span premise prevents vacuity; scaled inverse gives a basis only at loss 0 | None |
| §7.2 primitive kernel | D=[[π,1],[0,π]], t=(−1,π) | D₁t=0 and D₂t=π²; primitive pair need not be a basis | None |
| §7.3 annihilators and rigidity | Empty vertex; two places; N=2,p=3 modulo 11; doubled pair at N=4 modulo 19 | Rigidity uses the simple pair exactly once; two-place bound loses 2c; old minimal/FL conditions retained | None |
| §7.3 pairings and nondetecting places | Perfect versus π-scaled A₅ pairing; uniformizer Kummer class; other place over p₁ | Perfect exponent 2 versus 1; both ℓ-adic arguments must be finite; other places require native specialization | None |
| §7.4 eventual families | CM/isogenous elliptic factors; F⁺=ℚ; missing supercuspidal place | Outside-family cases excluded; eventual admissibility supplies no uniform realized-span premise | None |
| §8.1 rank zero | Hypothetical rank-one lattice; arbitrarily large m; ramified Oλ | Contradiction retains m₀,c,mper,mlat,mdif, independent of m | None |
| §8.2 rank one | Nonzero regulator; hypothetical rank-two lattice; positive loss | Lower bound from membership; primitive-kernel argument retains total loss 2c and both crystalline local conditions | None |
| §§8.3–8.4 multiplicity removal and rank-(2,3) | n=2 over ℚ; larger ranks over ℚ or F⁺≠ℚ; ℓ=2,3 | H(N) removal only on stated domain; L1–L7 and span premises remain | None |
| §8.5 Hilbert precursor | g=1,3; even g; absent LIInd/dimension equality | Odd-degree hypotheses and unramified H¹ target retained | None |
| Downstream interfaces | Definite period; derivative alone | Period and regulator witnesses remain separate; no derivative-to-cycle theorem inferred | None |
| Lean `definiteDiagonalPeriod` | Empty source; arbitrary target types; double fibre; zero monoid | Finite sum requires only source finiteness and counts multiplicities | None |
| Lean add/smul/map theorems | Torsion monoid; zero/noncommutative semiring; coefficient reduction | Sum laws hold under explicit binders; no multiplication commutativity or characteristic-zero assumption introduced | None |
| Lean reindex/fiber/exists-ne-zero theorems | Boolean swap; empty types; multiplicity 2; signed cancellation | Source equivalence preserves sum; fibres partition source; nonzero sum implies a nonzero summand only | None |
| Two proved Lean examples | Singleton/double/empty ℤ; signed Boolean sum; double fibre in ZMod 2 | Values 1,2,0 and 0,0 agree; scripts inspected statically | None; elaboration unavailable |

## Check outcomes and maintainer notes

- **Elaborate `Suggested.lean`: not available.** No Lean command was supplied or run. No elaborated-type inspection or successful build is claimed. Its 95 lines, explicit binders, seven named declarations and two proved examples are unchanged; the repaired geometric statements have no Lean counterparts to alter.
- **Dependency direction: passed, exit status 0.** The requested gate returned exactly:

```text
depcheck: 7 roadmaps, 63 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Direct comparison of supplier-contract names with `merge-order/ORDER.txt` also puts every listed supplier present there before this package. The small gate graph is not claimed to certify the scope of every mathematical input.

- **Structured files: passed.** `metadata.toml` and `sources.toml` parse; `design/plan.json` parses. Structural comparison with the starting plan confirms that only the top-level `gaps` list changed, with one insertion and all twenty previous entries unchanged. All twenty-one slugs and suppliers match the README; the new entry's `needs` equals its exact contract line.
- **Lean/README static agreement: passed.** Every existing Lean name occurs in the README. One `import Mathlib`, one real-bodied definition, six theorem signatures and two proved examples; no `set_option`, admitted data or admitted example. `Suggested.lean` and `metadata.toml` are byte-for-byte unchanged.
- **Scope and whitespace: passed.** `git diff --check` reports no errors. Changes are confined to this package's permitted README, source manifest, top-level plan gaps and this requested report. No tooling, merge-order, other package, content checkout or pull-request text was edited. No commit, push or network write was performed. No machine path appears in the deliverables.

LefschetzPencilsAndVanishingCycles remains the owner of the newly declared general prerequisite. This report does not count that obligation as implemented. The five new README target names are `productNearbyCohomology_vanish`, `productStrata_compactSupport_iso`, `productWeightSequence_concentration`, `productWeightSequence_frobenius_exclusion` and `productStrata_weaklySemisimple`; §5.4 cites them with their respective domains. Existing Lean names, J-labels, ∇, reciprocity formulas and downstream endpoints have not been renamed or narrowed. Fresh independent review remains necessary.
