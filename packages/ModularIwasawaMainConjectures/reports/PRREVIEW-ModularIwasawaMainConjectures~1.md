# Review of ModularIwasawaMainConjectures (pull request #1499 at 7527d0f)

**Verdict:** needs changes

## R01 (P2) — Register the additional automorphic twist contracts

**Location:** `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:132`, “What AutomorphicCongruences must additionally provide (gap:tate-twisted-components)”; also lines 97 and 130 and §§2.1–2.3, 4.3, 5.4.

**Claim:** The ordinary, signed and central-critical consequences have declared supplier contracts for the required Tate-twisted main-conjecture equalities.

**Witness:** `packages/ModularIwasawaMainConjectures/design/plan.json:2` contains eight gaps, none named `tate-twisted-components`; its `central-critical-specialization` entry at line 10 names only KatoEulerSystems and requests reciprocity/control, not an AutomorphicCongruences equality.

The README correctly explains why the extra equality is necessary, but the intake cannot announce the new request to its owner from this plan. At p=5, k=2, the supplied untwisted component evaluates δ=−1 as +1; the component needed for T_pE evaluates it as −1. On Γ the required evaluation is 6⁻¹, rather than 1. Neither untwisted equality nor Kato's upper bound supplies the missing equality. In general weight the central-critical r=k/2 input is also distinct from r=1 and r=k−1.

**Repair:** Add matching, precise AutomorphicCongruences entries to the plan's top-level `gaps`: the r=1 and r=k−1 pointwise equalities and r=1 ordinary reverse bound of line 132, and an owner-specific central-critical equality contract for r=k/2. Keep Kato's existing reciprocity/control contract separate. Put each corresponding slug under that supplier in the README and use it in the affected Needs lines. This is registration of the stated conditional inputs, not a demand to implement the suppliers here. At p=5, k=2 the registered automorphic contract must supply the −1 tame component with the 6⁻¹ evaluation; at k=4 it must also cover r=2 separately. The prior findings about unpublished base suppliers are not re-raised.

## R02 (P2) — Remove the unrestricted period-unit claim from the recorded gap

**Location:** `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:140` and §3.1, especially line 1139; `packages/ModularIwasawaMainConjectures/design/plan.json:31`, “for an X₀(N)-optimal parametrization and every odd p … up to ℤ_(p)^×”.

**Claim:** The recorded `manin-period-comparison` contract asks for a unit comparison between the saturated absolute-cohomology line and the full-symbol line at every odd prime. The README instead retains a fractional ratio and restricts the unit conclusion to the non-Eisenstein range.

**Witness:** The README's own 11a1, p=5 Check gives c_φ=1 and unhalved symbol value 2/5. Its valuation is −1, whereas any integral full-symbol generator has integral values. Thus the two period lattices cannot differ by a 5-adic unit.

This is an overclaim in the declared prerequisite, not a defect in the repaired §3.1 formula. The supplier's existing Manin-constant theorem does not imply the requested full-symbol unit comparison: `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:1264` concerns c_φ, and c_φ=1 in this counterexample.

**Repair:** Reconcile the recorded gap with the README: request the nonzero fractional signed ratio, boundary indices and isogeny compatibility in general, and the unit comparison only with the stated irreducible-residual, odd good-ordinary or multiplicative hypotheses. Have the intake record that corrected contract; do not restore the unrestricted unit claim in the README. Test: 11a1 at 5 must retain v₅(r_E⁺)≤−1; 11a1 at 7 remains compatible with the non-Eisenstein unit comparison, since v₇(2/5)=0.

## R03 (P2) — Resolve the duplicate owner of Serre's lifting theorem

**Location:** `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:150` and line 1272; `TauCetiRoadmap/ModularIwasawaMainConjectures/Suggested.lean:62`. The scope says this lifting theorem “is stated as a target by no other roadmap”.

**Claim:** This roadmap owns the general closed-subgroup lifting theorem, in addition to its elliptic image application.

**Witness:** `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:763`, §2.2, states the identical theorem: p≥5, H closed in SL₂(ℤ_p), reduction equal to SL₂(𝔽_p), implies H=SL₂(ℤ_p).

This is the same object and theorem, not merely a related application. That open folder is new and eligible as a supplier. It is not yet in ORDER; applying the brief's placement rule puts it after its last listed supplier, EllipticCurveModularityPartII (line 179), before this roadmap (line 347). No upward citation is needed. The two Lean files do not collide on a fully qualified name, but the README targets still duplicate ownership.

**Repair:** Import precisely the SL₂ statement from AdelicImagesAndModularCurves §2.2, delete this duplicate theorem from Suggested.lean and its own-target claims, and retain here the elliptic deduction using the Weil-pairing determinant, the cyclotomic kernel, and the unipotent quotient. Update the scope, Needs and module docstring accordingly. Do not import the sibling's separate GL₂ formulation without its determinant hypotheses. The retained deduction still gives image SL₂ on the cyclotomic kernel and quotient ℤ₅ for u=[[1,1],[0,1]] at p=5; the p=3 negative control remains outside the imported theorem.

## Verified sound

The review covered both files at the specified head, all 51 numbered subsections, the 15 seeded source targets, the available supplier contracts, and the four Lean declarations. The findings above concern contract registration, an inconsistent prerequisite and duplicate ownership; they do not allege failure of the three Lean statements as mathematical assertions. Conditional supplier contracts were treated as contracts, not as missing implementations.

**Gate and elaboration.** The worker's gate at this head passes every check: text/form, import rules, README-name agreement, stray files, outside-folder edits, dependencies and targeted build. The outside-folder diff is empty. Independently, the exact dependency command for this README returned:

```text
depcheck: 204 roadmaps, 1497 edges, 0 problem(s)
```

There are no UPWARD or CYCLE lines. The auxiliary check of the not-yet-ordered AdelicImagesAndModularCurves prints NOT IN ORDER; that is not a finding, under the explicit placement rule. No merge-order file was changed.

The native Tate specialization module was built first. `lake env lean` on Suggested.lean then exited 0, with only the three expected sorry warnings. A scratch copy with `#check @...` for all four declarations also exited 0: the DVR, domain, square-zero and nonzero-reduction hypotheses; primality, p≥5, closedness and reduction-surjectivity; and the unit parameter, norm and algebraicity hypotheses all survive elaboration. There are no hidden section variables or sorry'd data.

A separate scratch copy tried `simp [HasRankOneCoinvariants]` on all three admitted theorems; each left a substantive goal. Reading the native definitions and the object-search results rules out `rfl`, `infer_instance` and an existing single-lemma proof at these pins. These are not padding. R03 is duplication of a planned deep theorem, not a one-tactic padding finding.

**Pinned objects opened.** Mathlib revision `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Relevant native definitions and theorem bodies inspected include:

| Declaration/object | File and line at the pin | What was verified |
| --- | --- | --- |
| Representation.invariants; invariants_eq_top | `Mathlib/RepresentationTheory/Invariants.lean:73`, line 85 | Fixed vectors for every group element; no continuity or finite-dimensionality is bundled. |
| ContRepresentation | `Mathlib/RepresentationTheory/Continuous/Basic.lean:54` | A monoid homomorphism to continuous linear endomorphisms. It does not impose continuity in the group variable. |
| tateCurveAt | `TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Specialization.lean:70` | Evaluates the native integral formal Tate curve at a unit of norm <1. |
| isUnit_tateCurveAt_Δ; isElliptic_tateCurveAt | same file, lines 96 and 104 | The discriminant is a unit: the headline does not exploit total division at a singular curve. |
| selmerGroup₂ | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104` | The finite two-descent object is not the cyclotomic p-primary Selmer group. |
| completedGroupAlgebra | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Native inverse-limit carrier, reused rather than reconstructed. |
| powerSeriesCoordinate; powerSeriesCoordinate_X; powerSeriesCoordinate_one_add_X | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/PowerSeries.lean:350`, lines 368 and 374 | ℤ_p coefficients and an infinite compact commutative pro-p group with a topological generator; not already an arbitrary-O result. |
| monoidAlgebraProdEquiv | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Prod.lean:345` | Finite tame-factor comparison. |
| CuspForm.rank_eq_zero_of_weight_lt_twelve | `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:155` | Rank of level-one cusp forms is zero for k<12; k=4 is admissible. |

Object searches across both pins distinguished Mahler expansions from Mahler–Manin transcendence, formal-group/Coleman-integration material from signed Coleman maps, and two-descent from Iwasawa Selmer theory. No existing pinned version of the three deep statements was found. The missing-carrier explanations in the module docstring are consistent with those searches.

**Ownership and resolved citations.** The main-roadmap shape comparisons used PadicMeasuresIwasawaAlgebras, EllipticCurves and completed ProfiniteProPGroups. Searches used `roadmaps grep`/`show`, the main tree, the named open checkouts and the board packages. The following substantive interfaces were opened and matched; line numbers from `roadmaps show` exclude its one-line provenance header:

| Supplier | Resolved location and content |
| --- | --- |
| PadicMeasuresIwasawaAlgebras | §4.6, `README.md:2710`, characteristic ideals and transport; §5.1, line 3172, perfect determinants and cochain parity. Generic algebra remains with this owner. |
| SelmerIwasawaCohomology | §§2.7–2.10, lines 489, 518, 562, 591, unramified/Greenberg conditions and contragredient duals; §2.12a, line 675, abelian Kummer/Sha; §3.3, line 1426, derived control; §3.7, line 1492, Tw_r(g)=κ(g)^−r g; §3.11, line 1582, actual localization-image errors; §3.14, line 1631, inverse determinant; §3.15, line 1656, étale/Galois and j_* comparison. |
| ModularSymbolsPadicLFunctions | §§0.4, 1.1–1.2, lines 671, 1323, 1380: full symbols, boundary correction and signed periods; §§2.5, 4.2–4.3, lines 1762, 2407, 2520: analytic functions, Pollack functions and depletion. |
| AutomorphicGaloisRepresentations | §5.1, ordinary saturated line and cohomological annihilator; §5.2, line 2406, crystalline/Wach quotient with p inverted; §6.4, line 2567, genuine Steinberg monodromy and the different invariant-line Frobenius factors. |
| ArithmeticGaloisRepresentations | §6.3, line 3870, Tate extension and multiplicative residual inertia criterion away from p. |
| PadicFamilies | §0.17, line 1008, cuspidal control at every odd prime; §1.4, line 1102, quotient periods and a conditional integral comparison; §§4.0.1–4.0.3, from line 2364, geometric zeta classes, reciprocity and bounds. The stronger unipotent integral bound remains the declared extension. |
| PadicHodgeRegulators | Open head §§8.8, 8.22, 9.12, 9.14–9.21, 9.26, 9.29–9.30; in particular `README.md:2458` retains finite cokernel, and line 2496 exports specified kernels, leaving global signed Selmer structures here. |
| GrossZagierAndArithmeticHeights | Open head §§3.5, 3.7, 3.10 at lines 1207, 1264, 1306: Manin coefficient, optimal semistable p-unit range, and isogeny transfer. None supplies an unrestricted full-symbol unit comparison. |
| EllipticCurveModularity | R29.4–R29.6, lines 1260, 1471, 1604: Tate realization, parametrization and modularity. Choosing the inverse-image integral Tate lattice here does not duplicate the rational comparison. |
| ArithmeticGaloisDuality | D7.6, line 6018: lattice/abelian-variety duality. Flat duality with p not inverted is explicitly the declared separate gap. |
| CrystallineCohomology | CR.2.3 and CR.3.4, lines 2450 and 3084: smooth-lift comparison and Frobenius. The normalization φ=F/p is explicitly made here. |
| ProfiniteProPGroups | Completed roadmap Layer 3, Frattini/Burnside discussion around line 478. This supplies the general pro-p input, not ownership of the specialized SL₂ lifting theorem. |
| AlgebraicModularFormsAndSerreWeights | Its introduction explicitly aliases R15.1–R15.5 to Layers 1–5. R15.4 is Layer 4's Serre-weight recipe; the resolver's missing-section warning is a false positive. |

The resolver's other two missing-roadmap warnings name KatoEulerSystems and AutomorphicCongruences. The README explicitly treats their numbered base interfaces as proposed conditional contracts; the earlier repair report's external-owner disposition is respected. R01 concerns the new, unregistered automorphic extensions, not those settled base interfaces.

The formal/complex sigma function in ModularCurvesPartII is different from the p-adic sigma height constructed here. The general Nekovář/Bockstein height in NoncommutativeAndEquivariantIwasawa is also a different construction; this roadmap expressly does not claim its comparison. DiophantineApproximationAndTranscendence's complex Nesterenko theorem is not the p-adic Mahler–Manin theorem. The specialized signed orthogonal conditions, corrected image quotients, period adapters and elliptic leading-term comparison therefore have identified ownership here. The remaining duplicate general lifting theorem is R03. No fully qualified declaration-name collision was found in the readable sibling Lean files.

**Seeded source audit.** All 15 targets were compared with the cached legal texts, using the cited preprint numbering rather than silently replacing it with published numbering. No additional README locator is explicitly marked unverified. Source errors found during this work are recorded below, separately from roadmap findings.

| Sample | Text, locator and extracted lines | Outcome and precise limit |
| --- | --- | --- |
| §0.2 ordinary Selmer/dual | SU §1.1, pp.1–2, lines 20–62; Skinner §2.3, pp.8–12, lines 310–366 | Strict/decomposition condition, unramified conditions away from p, lattice dependence and scalar dual match. Split multiplicative inertia versus strict conditions are distinguished. |
| §0.8 zeta basis/characteristic ideals | Kato 12.10, p.224, line 4165; FW Lemma 3.13, pp.26–27, lines 1472–1513 | Height-one equality and determinant signs match. The arbitrary residual-unipotent lift in FW's proof is not valid; this README correctly requires actual square-zero unipotence. |
| §0.13 signed reformulation | LLZ assumptions p.14, lines 804–807; Theorem 6.5 and Corollary 6.6, pp.43–44, lines 2520–2546; Kato 17.13, pp.279–280, lines 6305–6349 | Actual Coleman image, (A)/(A′), (E), and index-two trivial-character restriction retained. Local degree-two terms are retained until height-one localization. |
| §1.7 multiplicative theorem | Skinner Theorem A, pp.1–2, lines 20–60; §2.6, pp.17–18, lines 682–715 | Odd p, weight congruence, irreducibility and auxiliary ramification retained. Source-period congruence is distinct from the conditional full-symbol congruence. |
| §2.1 FW dictionary | FW §1.1.1 and Conjecture 1.5, pp.4–6, lines 155–250; Definition 3.3/Theorem 3.4, pp.23–24, lines 1341–1364; Proposition 3.28, p.35, lines 2000–2040 | Untwisted cohomological lattice, twisted Betti factor and inverse dual Euler correction are distinguished. Central-critical transport is conditional, not inferred from untwisted augmentation. |
| §2.3 pointwise consequences | FW Theorem 5.1, pp.68–69, lines 4016–4033; LLZ Corollary 6.6, line 2537; Kato 17.13, line 6305 | Pointwise source range matches; ordinary/trivial-signed consequences need the extra components identified in R01. Untwisted equality yields only the stated nontrivial signed component. |
| §3.1 elliptic lattices/periods | Colmez Theorem 0.20, p.258, lines 325–355; Skinner §3.3, p.25, lines 969–992, and footnote 6, lines 557–561 | Rational comparison and residual-irreducible unit range support the repaired README, not the old all-odd-prime gap in R02. |
| §3.3 Mazur's conjecture | BCS Conjecture 1.1.1 and Theorem 1.1.2, pp.1–2, lines 20–75 | Néron-normalized function, Tate lattice, torsion and integral versus rational forms match. No non-CM condition added to the general theorem. |
| §3.6 residual surjectivity | LSTX §1, p.1, lines 19–25; BCS Remark 1.1.3, p.2; LLZ (E), p.43 | The cited rank-two statement is the introductory Serre result, not LSTX's higher-dimensional Theorem 1. The p≥5 range and determinant argument are necessary. Ownership is R03. |
| §4.1 universal family | FW Theorem 3.6 and remark, p.24, lines 1372–1399; Theorem 5.2, p.69, lines 4034–4042 | Regular subring, residual exclusions and specified universal morphism retained. p=3 extension is explicitly in the supplier contract, not obtained by applying Nakamura's p≥5 theorem verbatim. |
| §4.2 specialization | FW Lemma 3.17, Definitions 3.18–3.19, Proposition 3.20, pp.31–32, lines 1772–1820; Definition 3.12, p.26, lines 1455–1459; Proposition 3.28, p.35 | Derived base change separated from primitive compatibility. Suitability over the regular base quantifies over all lifts; Euler factors need not be units. |
| §4.5 Kobayashi/Pollack | LLZ Proposition 5.10/Corollary 5.11, pp.35–36, lines 2070–2106; Corollaries 5.18/5.22, pp.38–40, lines 2247–2260 and 2304–2325 | 1=minus, 2=plus; multipliers initially rational units. Actual-image quotients transport integrally, while principal forms need the integral unit comparison. Kobayashi itself remains settled uncertified. |
| §5.3 μ/λ | SU §1.1, pp.1–2, lines 53–62; BCS Theorem 1.1.2/Remark 1.1.3, p.2 | These motivate the distinction; the displayed elementary algebra is independently verified by prime factorization in O[[X]], not attributed as a verbatim theorem of BCS. |
| §5.6 MTT | Colmez Conjecture 0.12/note 14, p.256, lines 223–257; Theorem 0.15, p.257, lines 274–290; SW Conjecture 5.1, p.1774, following line 939 | Torsion index in the regulator, full versus p-primary Sha, lower bound versus exact order, and s/T conversion are kept separate. |
| §5.9 Greenberg/CPR | RJW Conjecture 13.21, p.71, lines 4000–4035; Theorems B.1/B.4 and B.3(1), pp.79–81, lines 4400–4497 | Tame projection, Tate dual, ordinary domain and integral conjecture retained. General motivic conjectures are not claimed as theorems here. |

**Headline coverage.** The README's deep outcomes are the integral unipotent quotient; ordinary SU/FW and multiplicative main conjectures; the Kato/ordinary/signed and period-defect dictionaries; Hida approximation; FW pointwise/family equalities and specialization; elliptic rational/integral main conjectures and lifting; p-adic Mahler–Manin; cyclotomic heights and Schneider's abelian/elliptic leading terms; rank-zero converse; Greenberg–Stevens and p-adic BSD implications. The three presently statable headlines are the unipotent, lifting and Mahler–Manin statements, and all three are present. Every other family is named in the module docstring with its missing arithmetic carriers. There is no abstract-Prop stand-in or weakened scalar replacement. After R03, the lifting theorem becomes a supplier theorem rather than this roadmap's acceptance target.

**Computed adversarial pass (89 rows).** The following rows record values, not merely source agreement. Here R=O[[X]], π is a DVR uniformizer, length means length at the displayed height-one prime, and “conditional” means that the arithmetic theorem still uses its declared supplier contract. Algebraic models test the formula/convention; they are not presented as proofs of arithmetic main conjectures. The rows cover every numbered target, with additional rows for independent definitions and normalizations within a target.

| Statement | Instances tried | Values on the two sides / wrong model | Result and change |
| --- | --- | --- | --- |
| Conventions: tame algebra | p=2, O=ℤ₂, C₂ | a+bδ maps to (a+b,a−b); (1,0) has no integral preimage, since a=b=1/2. After inverting 2 it does. | The product assertion is correctly restricted to odd p. |
| Conventions: Γ generator | p=2 versus p=3 | κ(γ)=5≡1 mod 4, whereas 3≡3 mod 4; at p=3, 1+p=4 is admissible. | Dyadic choice retained. |
| Conventions: scalar/contragredient dual | F₇ line with δ=2; cyclic Γ acting by 8 on ℤ/49 | Scalar dual eigenvalue 2, contragredient 4; Γ inverse 8⁻¹=43 mod 49. Neither pair agrees. | Inversion on Γ is needed even on the trivial tame component. |
| Conventions: nonabelian negative control | S₃ with two noncommuting permutations g,h | Precomposition in the same direction gives φ∘h∘g, whereas action by gh gives φ∘g∘h; inverse precomposition reverses both orders. | Scalar convention is used only over the commutative Iwasawa algebra. |
| §0.1 datum and determinant twist | k=2, κ(g)=4 | det(V_f)=1/4; det(V_f⊗det⁻¹)=(1/4)·4²=4. Rank remains 2; zero/rank-one representations are excluded. | Homological/cohomological distinction survives. |
| §0.1 ordinary filtration | rank-two T with saturated T⁺=Oe₁; nonsaturated πOe₁ | T/T⁺=O; wrong quotient O⊕O/π has torsion. | Saturation is essential and supplied. |
| §0.2 ordinary local condition | unramified A⁻=L/O; α=1, α=−1 at odd p, α≠1 | A⁻/(α−1)A⁻=L/O when α=1; 0 for α=−1 and for every nonzero α−1, since multiplication is surjective on L/O. | Split correction retained; strict/inertia kernels are not universally equal. |
| §0.2 global/dual zero control | all coefficient groups zero; nonzero discrete ℤ/p | Kernel=0 and dual=0 in first case; dual of ℤ/p has p elements, not zero. | Definitions determine the actual kernel/dual, not a free parameter. |
| §0.3 structure, finite errors | R/(π,X) and R/(X) | First module has characteristic ideal R but nonzero Fitting ideal (π,X); second has both ideals (X). | Finite-submodule hypotheses cannot be dropped from Fitting comparisons. |
| §0.4 period convention | m=0,1, P=−2πiΩ | Denominators −2πiΩ=P and (−2πi)²Ω=(−2πi)P. Using exponent m with Ω loses −2πi. | Source normalization correction retained. |
| §0.4 primitive p-factor | elliptic α=−1 versus α=1 at multiplicative p | 1−α⁻¹=2 versus 0; good ordinary factor is (1−α⁻¹)². | Split exceptional zero is distinguished. |
| §0.4 tame projection | p=3, measure δ₁−δ₋₁ | Pushforward to Γ=0; integral against the odd character=1−(−1)=2. | Trivial branch cannot interpolate all tame characters. |
| §0.5 integral/rational propositions | X=R/(π), analytic element 1 | Integral ideals (π) and R differ; localized ideals both equal R. For X=0 and analytic unit, both equal R. | Rational equality does not imply integral equality. |
| §0.6 arithmetic complex and determinant | complex [R→ᵃR] in degrees 1,2, a=X² | H¹=0, H²=R/(X²); inverse determinant valuation +2, not −2. | Cochain parity matches supplier. |
| §0.6 Euler correction | E_dual=2, z_primitive=1 | z_Σ=2; E_dual⁻¹z_Σ=1. Multiplying again gives 4. | Direction of primitive correction fixed. |
| §0.7 KMC and twist | p=5,r=1; p=3,r=2 | Tw₁(X)=(X−5)/6; Tw₂(X)=(X−15)/16. Tw_r(e_χ)=e_(χωʳ). | Twist moves both the tame character and the Γ-coordinate. |
| §0.7 dyadic localization | O=ℤ₂, height-one prime containing 2 versus not containing 2 | 2 is noninvertible in the former and invertible in the latter; the idempotent (1+δ)/2 exists only in the latter. | Kato's p=2 restriction is retained. |
| §0.8 HasRankOneCoinvariants and headline | u=[[1,1],[0,1]]; u=[[1,π],[0,1]]; u=1 | Quotients O, O⊕O/π, O² respectively. Only the first is free rank one. | Definition separates primitive image, torsion and trivial action. |
| §0.8 residual-unipotent negative control | g=[[1,1],[π,1+π]] | det g=1, reduction nontrivial unipotent; det(g−1)=−π, and coker(g−1)=O/π, rank 0. | Actual (g−1)²=0 is needed. README repairs FW's proof step. |
| §0.8 coefficient generality | O=F₂[[π]] and a ramified mixed-characteristic DVR, same u | u−1 maps (x,y)↦(y,0); square=0; quotient projection (x,y)↦y has kernel Oe₁. Both quotients are O. | No completeness or mixed-characteristic restriction added to the Lean theorem. Zero ring is excluded by IsDomain. |
| §0.8 zeta basis equivalence | H¹=Re, z=X²e; H²=0 or R/(X²) | Zeta quotient length 2; degree-two lengths 0 and 2. Divisors −2 and 0 respectively. | Basis iff equal lengths; equality of both ideals, not one divisibility. |
| §0.8 denominator clearing | z=π⁻¹e, H²=0; clear by π or π² | With π: quotient length 0, correction +1; with π²: quotient length 1, correction +2. Both divisors equal 1. | Fractional zeta lattice has denominator-independent divisor. |
| §0.9 good-pair/period scaling | differential scale 2, Betti scale 3; c=π,d=π⁻¹ | Pair scaling 3/2; total period defect cd=1. With d=1 the defect is π. | Rational nonzero period ratios do not determine integral units. |
| §0.10 ordinary comparison | char(H²)=char(H¹/Z)=(X); analytic term uL | Equal cohomological lengths cancel; ordinary ideal becomes (uL). If u=π,L=X, this is (πX), not (X), but rationally equal. | Period-defect hypothesis retained. |
| §0.10 involution | f=X−7 | ι(f)=−(8X+7)/(1+X), associated to X+7/8; at X=7, f=0 but X+7/8=63/8. | Cannot silently omit ι from the natural dual sequence. |
| §0.11 signed kernels and basis | Col(z)=(1,0), U⁻¹=[[1,1],[0,1]] | Old second coordinate 0; new second coordinate 1. With a unit scalar multiple, both kernels agree. | Chosen Wach basis is part of the data. |
| §0.11 Tate orthogonality | perfect pairing O² with coordinate-one kernel Oe₂ | Orthogonal discrete line is the matching first-coordinate line; annihilator of 0 is the full dual and annihilator of the full module is 0. | Orthogonal local condition is not the Coleman kernel itself. |
| §0.12 actual-image quotient | I=XR,L=X²; I=πR,L=πX | Quotients have char (X) in both examples. Ambient quotients have char (X²) and (πX). | Image correction removes one X or one π, respectively. |
| §0.13 signed iff | height-one exact-sequence lengths a=2,b=5,d=2 | Length(X)=b−a+d=5; KMC says a=d, hence SMC says length(X)=b. If d=3, length(X)=6 and both equalities fail. | Both directions tested; finite local terms vanish only after localization. |
| §0.13 component restriction | p=5,k=2,η=1 versus η=ω | ω(−1)=−1; i=2 is allowed at η=1 only. Untwisted KMC reaches η=ω, not η=1. | No index-two conclusion from the wrong component. R01. |
| §1.1 residual predicates | split 11a1 at ℓ=11,p=7; nonsplit 14a1 at ℓ=2,p=13 | Inertia invariant dimension 1 in both; decomposition invariant dimension 1 versus 0. Valuations 5,6 are nonzero mod 7,13. | SU and FW auxiliary conditions are distinct. |
| §1.1 local exceptional condition | ordinary elliptic p=3 with a₃=±1; F₉ unit generator | a₃²=1 in F₃; generator of F₉× has square of order 4, not 1. | The p=3 elliptic obstruction is not an assertion about all characteristic-three fields. |
| §1.2 unipotent inertia | inertia entry a=1 versus a=π | Image Oe₁ versus πOe₁; quotient O versus O⊕O/π. | Residual ramification supplies the primitive entry; rank-one rational image alone is insufficient. |
| §1.3 SU assembly | corrected analytic ideals (c_fL_f),(c_gL_g), c_f=π,c_g=1 | Product has valuation v(L_f)+v(L_g)+1; dropping c_f loses 1. | Reverse and forward bounds use the same source periods. |
| §1.4 FW ordinary theorem | 11a1 split ℓ=11 versus 14a1 nonsplit ℓ=2 | D_ℓ-invariant dimensions 1 versus 0; FW1.6 fails versus holds. | No split-prime overclaim. |
| §1.5 ordinary Selmer form | cohomological equality, u_p=π versus u_p=1 | char X=(πL) versus (L); rationally the same. | Integral canonical conclusion remains conditional on the unit defect and R01. |
| §1.6 approximation, generators | p=3,m=1, ideals (3,X),(3,2X) | Ideals equal; coefficients of X in generators are 1 and 2, unequal mod 3. | Correctly compares ideals, not chosen generators. |
| §1.6 approximation, coefficients/periods | p=uπ²,m=1; source functions πX and πX, ratios π and 1 | Mod-p precision is mod π², not mod π; full-symbol ideals become (X,pᵐ) and (πX,pᵐ), unequal for large m. | Lattice precision and period corrections are independent inputs. |
| §1.6 small-prime level | p=3,M=2,r=1 versus M=1 | Levels 6 versus 3; Γ₁(6) is torsion-free while Γ₁(3) admits order-three torsion. Auxiliary q excludes M=1. | Small-prime control range matches the stated route. |
| §1.7 multiplicative endpoint | k=2, odd p; source ratio c=π | k−2=0 is divisible by p−1; resulting ideal is (πL), becoming (L) only with unit c. | Source-normalized theorem and canonical theorem are separated. |
| §2.1 FW/central-critical dictionary | k=2,κ(g)=4; p=5,r=1,δ=−1 | Determinants 1/4 and 4; pre-transport evaluation (−1,1/6) versus augmentation (1,1). | Not the same lattice, component or specialization. R01. |
| §2.1 Betti factor/equivariance | r=1,2; chosen coefficient basis | Betti signs + and −; κ(g)ʳ·κ(g)⁻ʳ=1 in the coefficient map. | Untwisted Betti factor cannot be retained at every twist. |
| §2.2 FW pointwise | 14a1,p=5; 11a1,p=7 | a₅=0 and nonsplit auxiliary ℓ=2; a₇=−2 with a₇²=4≠1 mod7 and split auxiliary ℓ=11. | First uses locally irreducible case with μ nontrivial; second locally reducible case permits μ=1. |
| §2.3 ordinary/signed consequences | p=5,k=2,δ=−1 | Untwisted theorem label gives +1; needed trivial T_pE label pulls back to −1. Index-one transported component has ω(−1)=−1. | Conditional equalities are mathematically distinguished; register R01. |
| §3.1 absolute versus full-symbol period | 11a1,p=5 and p=7, symbol 2/5,cφ=1 | v₅(2/5)=−1; v₇(2/5)=0. A unit Néron/full-symbol ratio would leave a nonintegral value at 5. | README negative control refutes old plan gap. R02. |
| §3.1 torsion coefficient boundary | Hom(C₃,ℤ₃) versus Hom(C₃,F₃) | First is 0; second has 3 elements. | Weight-two torsion-free parabolic comparison does not generalize to F₃ coefficients. |
| §3.2 elliptic analytic function | 11a1,p=7; multiplicative α=−1,1 | Trivial-character value (1−α⁻¹)²/5; multiplicative multipliers 2,0. | Néron normalization and exceptional branch agree with interpolation. |
| §3.3 MMC/isogeny | degree d prime to p versus d=p | Multiplication by d is an automorphism of T_pE in first case; multiplication by p on ℤ_p has quotient F_p in second. | Prime-to-p transfer valid; p-isogeny needs lattice and period corrections. |
| §3.4 BCS rational endpoint | ideals (pX),(X) | After inverting p both equal (X); integral μ values 1 and 0 differ. | Rational conclusion does not force an integral one. |
| §3.5 BCS integral endpoint | u=[[1,1],[0,1]] on T_pE | Quotient ℤ_p; π-entry variant gives ℤ_p⊕F_p. | Integral image condition is stronger than a rational rank-one condition. |
| §3.6 lifting headline | determinant-one lifts of [[1,1],[0,1]] mod p to mod p² | p=5: 125 lifts, every fifth power [[1,5],[0,1]]. p=3: 27 lifts, cubes have upper entries 0,3,6. | Primitive congruence-kernel step is nonzero at 5 and can vanish at 3. R03 concerns owner only. |
| §3.6 determinant condition | H=SL₂(ℤ₅) as a subgroup of GL₂ | Reduction contains SL₂(F₅), but determinant image {1}≠ℤ₅×. | The elliptic proof's surjective cyclotomic determinant cannot be omitted. |
| §3.7 sigma/Frobenius | 11a1,p=7,α≡5 mod7 | F roots α,7/α; φ roots α/7,α⁻¹ with valuations −1,0; α⁻¹≡3. The F-unit line is the φ-slope −1 line. | Correct normalization avoids the source's opposite eigenline. |
| §3.7 sigma differential correction | 11a1,b₂=−4; ω↦2ω | c=(−4−E₂)/12 versus wrong −E₂/12, difference 1/3. E₂ scales by 1/4, log² by 4, product unchanged. | b₂ correction and C⁻² scaling are essential. |
| §3.7 formal oddness | 14a1,a₁=1 | σ=t+t²/2+…; t(−P)=−t−t²+… gives −t−t²/2. Substituting −t gives −t+t²/2. | Formal inverse, not ordinary negation of t, is required. |
| §3.7 zero/torsion/extension | O; nP=0; 2P and 4P in H | h(O)=h(P_tors)=0; h(2P)/4=h(4P)/16. The affine quotient at O would be 0/0. | Total height assigns zero separately and does not divide at O. |
| §3.7 Mahler–Manin headline | q=p,p²,−2 at p=2; q=0,1 | Norms p⁻¹,p⁻²,1/2 and logarithms 0; algebraic q forces transcendental J. q=0 is not a unit; q=1 has norm 1. | Correct domain includes p=2 and excludes the two junk inputs. |
| §3.7 regulators | ranks 0,1,2; height scale 2; torsion order 5 | Empty determinant 1; determinants scale by 1,2,4. Colmez's rank-zero torsion-adjusted regulator is 1/25. | No duplicate torsion denominator; nondegeneracy is not built into definition. |
| §3.8 flat cohomology/duality | H=Q_p/Z_p, Z/p², and their mixed variant | Duals M=ℤ_p,Z/p²; (Div H)∨=ℤ_p,0; (H/Div H)∨=0,Z/p². Mixed free/torsion parts separate. | Free part is not identified with torsion. Zero abelian variety gives all groups 0. |
| §3.8 heights and isogeny | rank-one analytic value a; rank-two matrix diag(a,b); φ=[2] | Algebraic values −a and determinant ab; isogeny sides both 2h(P,Q). Character scale 2 multiplies rank-two determinant by 4. | Sign and bilinearity consistent. |
| §3.8 multiplicative correction | formal lifts u=v=1+p | Correction log_p(1+p)²/log_p(q_E), valuation 2−v_p(log_p q_E); at u=1 it is 0. | Omitting correction changes the height; q_E denominator is covered by transcendence. |
| §3.8 coordinate change | F(T)=aTʳ; T=κ(γ)ˢ⁻¹−1, l=log κ(γ) | s-leading coefficient alʳ; inverse coordinate multiplies by (−1)ʳ. For split rank0, T-coefficient is ℒA/l. | Extra split factor l⁻¹ is not absorbed into rank-zero regulator. |
| §3.9 Schneider abelian theorem | A=0; abstract pairing diag(1,0) with a one-dimensional point subspace | A=0: characteristic product 1, order0, determinant1. Restricted pairing determinant1 but full determinant0. | Sha/flat-space condition is necessary for the torsion deduction. |
| §3.9 elliptic leading terms | rank0 ordinary 11a1,p=7 with stated Sha=1; nonsplit fibre I₆ of 14a1 at2 | Leading value up to units (1−α⁻¹)²·5/25; arithmetic component size2 versus geometric6. | Uses arithmetic Tamagawa factors and stated finiteness/nondegeneracy. |
| §3.9 multiplicative order | split rank r=0; nonsplit rank0 | Orders 1 and 0 respectively; split T-coefficient ℒA/l versus nonsplit 2A. | Strict/inertia local distinction matches the exceptional zero. |
| §4.1 universal-family domain | 14a1,p=5,Σ empty; nonreduced ring O[ε]/ε² | Residual inertia at2 is nontrivial since 6≠0 mod5; Σ empty impossible. Nonzero ε has square0, so that ring is not the specified regular domain. | Admissible ramification and regular-base hypotheses exclude both wrong inputs. |
| §4.1 restriction of scalars | finite free algebra B=R⊕R, scalar map multiplication by a | Determinant over R is a², not a. | Restriction/norm is not identification of Frac B with Frac R. |
| §4.2 derived specialization | [R→ˣR], R→R/(X)=O | Specialized differential=0; cohomology O in both adjacent degrees, Tor₁^R(R/(X),O)=O. Alternating determinant factors cancel. | Ordinary tensor of H² alone misses the degree-one term. |
| §4.3 signed theorem | 14a1,p=5,k=2,a_p=0 | (A) true; k−1=1 gives ω on untwisted transport and 1 only with the extra twisted equality. | Intersects source ranges and remains conditional on R01. |
| §4.4 image removal | a_p=0, η=1 and η≠1 | Col₁ image R in both; Col₂ image R at η=1, XR at η≠1. For z=X², quotient lengths 2 versus1. | Cannot drop Col₂ image correction on a nontrivial component. |
| §4.5 signed labels/multipliers | a⁻=p, I=R,z=X | Multiplication gives I′=pR,z′=pX; both corrected quotients ≅R/(X). Ambient ideals (X),(pX) differ. | Corrected integral iff valid without multiplier-unit assumption; principal iff needs it. |
| §4.5 descent/twist | Δ=C₄,p=5; p=7,δ eigenvalue2,η(δ)=4 | Average idempotent values 1 on trivial,0 on quadratic; 2·4=1, while 2·2=4≠1. | Twist by η, not η⁻¹, selects the needed discrete component before dualizing. |
| §5.1 imprimitive factors | primitive generator X, removed Euler factor X−p; Σ empty | Imprimitive generator X(X−p), degree2; empty product1 leaves X unchanged. | Same nonzero factor multiplies both sides; no Frobenius factor at p is introduced. |
| §5.2 coefficient extension | ramification e=2 with p=uπ², series pX³ | μ_p=1,λ=3; μ_π=2,λ=3. | Coefficient extension scales μ by e, not λ; faithful flatness retains ideal equality. |
| §5.3 μ/λ lifting | f=π,g=1; f=πX²,g=2πX² at odd residue characteristic | First localized ideals agree but μ=1 versus0. Second μ=1,λ=2 on both and ratio2 is a unit. | Equal μ removes the remaining uniformizer exponent; zero series is excluded. |
| §5.4 rank-zero converse | 11a1, L(E,1)/Ω=1/5≠0; formal z=Xe versus z=e | Nonvanishing case has rank0; z=Xe specializes to0 and quotient has X-length1, while z=e specializes to nonzero e and quotient has X-length0. | Two proof branches genuinely differ; central-critical local/control input remains required by R01. |
| §5.5 L-invariant | formal Tate parameter q_E; wrong algebraic q=p | ord_p(q_E)>0 and log_p q_E≠0, so ℒ≠0; for q=p, ord=1 but log=0, hence ℒ=0. | Algebraicity of j plus Mahler–Manin excludes the wrong parameter. |
| §5.6 MTT exact/unit propositions | 11a1 rank0,torsion5,c₁₁=5,Sha=1 | R_MTT=1/25; predicted value (1−α⁻¹)²/5, matching interpolation. Dividing by torsion² again gives wrong denominator125. | Exact versus unit formula and torsion normalization agree. |
| §5.6 degenerate height | r=1, regulator0 | Leading coefficient prescribed at order r is0; actual order may exceed r. | Lower bound rather than exact order is correct without nondegeneracy. |
| §5.7 Greenberg–Stevens | L(E,1)≠0 versus 0, split p | Derivative ℒ·L(E,1)/Ω is nonzero versus0; first case order1, second gives no simple-zero conclusion. | Exact-order consequence has the needed nonvanishing. |
| §5.8 main-conjecture/BSD implication | height matrix diag(1,0) versus diag(1,1) | Determinants0 versus1; in the latter coefficient is nonzero and order equals rank (plus1 if split). | Does not infer nondegeneracy merely from the main conjecture. |
| §5.9 criticality | weights k=2 and k=4, homological representation and its Tate dual | Gamma factors at s=1 reduce to Γ(1)=1 and Γ(k−1)=1 or 2, respectively; neither has a pole, so both r-values are 0. | Criticality is checked on the Tate dual, not the untwisted linear dual. |
| §5.9 Greenberg projection | p=5, Gal(F∞⁺/Q∞)=C₂; rational test R/(p),analytic1 | Idempotent (1+c)/2 gives eigenvalues1,0. Rational ideals R=R, integral ideals (p)≠R. | Trivial projection is integral; other tame components and μ cannot be discarded. |
| §5.10 elliptic examples | Direct finite-field point counts | 11a1: #E(F₂)=5,#E(F₃)=5,#E(F₅)=5,#E(F₇)=10, so a₂=−2,a₃=−1,a₅=1,a₇=−2. 14a1: #E(F₃)=6,#E(F₅)=6,#E(F₁₃)=18, so a₃=−2,a₅=0,a₁₃=−4. | README coefficients agree. Discriminants compute to −11⁵ and −2⁶7³. |
| §5.11 higher-weight example | Expand q∏(1−qⁿ)⁴(1−q⁵ⁿ)⁴ through q¹³ | Coefficients 1,−4,2,8,−5,−8,6,0,−23,20,32,16,−38. At p7: discr at2=−16≡5 nonsquare; at5, −5⁻¹≡4≠1. | Arithmetic diagnostics agree; weight4≢2 mod6 excludes SU, while level-one weight4 rank=0 supports the ramification argument. |
| §6.1 anticyclotomic interface | inert ℓ, cyclotomic versus anticyclotomic tower; scalar π | Anticyclotomic Frobenius=1; cyclotomic Frobenius need not be1. (π) and (1) agree only after inverting π. | Does not transplant the cyclotomic local-factor theorem or claim integral descent. |
| §6.2 Eisenstein transfer | 11a1,p5; T=ℤ₅(1) | E[5] has rational line; after inverse cyclotomic twist an element ω=2 acts by3 on it. For T, untwisted dual invariants0, Tate-dual invariants Q₅/Z₅. | Rational torsion alone does not prove invariants of the untwisted dual; the extra split-Cartan calculation is needed. |
| §6.3 downstream transfers | p3,a₃=±3 versus a₃=0; split multiplicative α=1 | First has a₃≠0 and is outside the Pollack dictionary; latter has a₃=0. Split strict/inertia correction=L/O, not0. | Supersingular a_p=0 and multiplicative local-condition restrictions remain explicit. |
| Source-error control used in scope | F₅-plane x+y+z=0 | Plane has25 points; all three pair projections have25 points; ambient space125 points. Intersection z=0 has5 points, not25. | Refutes both printed Hida linear-algebra conclusions; not an error copied into a roadmap target. |

The small finite computations above were independently run in scratch, including all determinant-one lifts modulo 25 and 9, the seven elliptic point counts, discriminants, eta-product coefficients and the 25-point plane. The remaining table entries are direct module, determinant, character or power-series calculations. Non-compact groups, fields in place of DVRs, inseparable coefficient extensions and zero rings do not satisfy the corresponding arithmetic or Lean hypotheses; the equal-characteristic DVR and residue-field-two case of the unipotent theorem were tested explicitly. Nonreduced bases were tested against the regular-base family statement, not silently treated as admissible. The target's definitions have API prose and discriminating Checks; theorem-only sections with two Checks do not violate the three-Checks requirement for definitions.

## Not verifiable

- **BSDGP**, the primary Mahler–Manin paper: settled uncertified. Its locator is retained. The general p-adic statement was checked in the legally cached Waldschmidt exposition, Théorème 2, p.108 (line 116), with the ℂ/ℂ_p convention at p.106 (line 57); the original proof was not independently certified.
- **Kobayashi**: settled uncertified. The signed multiplier/kernel and image comparisons were checked in LLZ at the locators above; no claim is made to have opened Kobayashi's own Theorem 7.3 or integral image proof.
- **Silverman**: settled uncertified; **Serre** and **Jones**: settled waived. The local Tate-uniformization contract, LSTX's explicit report of Serre's rank-two result, and SW's multiplicative leading-term statement were checked. The underlying book passages and Jones proof are not independently certified.
- **src18**, exact typography of the general abelian leading coefficient in Theorems 2 and 2′, p.342: the cached OCR at lines 529–538 drops parts of the displayed fractions. The hypotheses, ranks, flat cohomology distinction and sign theorem were readable and checked (lines 320–332, 535–536, 1533); the elliptic formula was checked separately in SW Theorem 6.1. A local rendering attempt could not run with the available PDF libraries. No new mathematical objection is inferred from damaged OCR.
- The proposed KatoEulerSystems and AutomorphicCongruences base interfaces cannot be certified as completed published supplier specifications: the README explicitly makes their publication and implementation prerequisites. This is the settled external-owner condition, not a new finding. The eight registered gap outputs are likewise conditional mathematics to be supplied; this review does not certify their proofs. R01 and R02 identify the additional registration/scope corrections needed before those conditions are internally consistent.

No new source was requested, no settled reference was reopened, and no source text or manifest was modified. The report is not parked for an unavailable text.

## Source issues

- **Misprint** in SU at §1.1 interpolation formula, printed p.1 (line 27): the source says the denominator contains (−2πi)^m with its chosen periods; it should contain (−2πi)^(m+1); affects a stated result; corrected in print at Skinner §2.4, footnote 6, p.14 (lines 557–561).
- **Error** in FW at Lemma 3.13 proof, printed p.26 (line 1497): the source says a lift of a nontrivial residual unipotent has a free rank-one kernel for σ−1; it should require an actual primitive unipotent lift, since [[1,1],[π,1+π]]−1 has zero kernel; affects the proof.
- **Misprint** in FW at Proposition 3.16 proof, printed p.30 (line 1729): the source says the nonzero-specialization locus has positive codimension; it should be the zero-specialization locus, as its concluding sentence states; affects the proof.
- **Gap** in FW at Corollary 5.3 proof, printed p.69 (lines 4048–4061): the source says untwisted augmentation yields the central-critical Selmer conclusion; it should explicitly transport the tame component, Tate twist, Betti factor and local control before augmentation; affects the proof.
- **Error** in Hida at Lemma 3.17, printed p.95 (line 2555): the source says the listed surjective projections force N=Aᵐ; it should require stronger hypotheses, since the plane x+y+z=0 over F₅ has all those projections; affects a stated result.
- **Error** in HidaAdd at Lemma 0.2, printed p.1 (line 13): the source says either N=Aᵐ or the coordinate intersection satisfies the smaller projection hypotheses; it should exclude the same plane, whose intersection projects to a line; affects a stated result.
- **Error** in SW at §4.1 before equation (4.1), printed p.1770 (line 756): the source says use the α⁻¹-eigenline of φ=F/p; it should use the α-eigenline of F, equivalently the α/p-eigenline of φ; affects a stated result.
- **Error** in SW at §4.1 equation (4.1), printed p.1770 (line 758): the source says Katz E₂ equals −12a/b for the general Weierstrass equation; it should be E₂=b₂−12a/b, with E₂−b₂ as the sigma correction coefficient; affects a stated result.
- **Error** in SW at §4.2 Tate differential formula, printed p.1771 (line 810): the source says the weight-two value scales by C² when ψ*ω=C du/u; it should scale by C⁻²; affects a stated result.
- **Misprint** in SW at §4.4, printed p.1774 (line 936): the source says divide heights by κ(γ); it should say divide by log_p κ(γ), consistently with its regulator formula; affects a stated result.
- **Misprint** in RJW at §13.5.2, printed p.71 (line 3995): the source says the unramified case applies for n≥0; it should be n≤0, as the immediately preceding two-case formula specifies; affects nothing.
