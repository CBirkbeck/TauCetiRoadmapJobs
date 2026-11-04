# Review of PadicHodgeRegulators (pull request #1498 at c1443be)

**Verdict:** accepted

## R01 (P3) — Replace the nonexistent Berger theorem locator in §1.7

**Location:** TauCetiRoadmap/PadicHodgeRegulators/README.md:579: “See Berger2003 Proof of Theorem II.2, p. 11”.

**Claim:** This locator supports the general finite-extension exponential/trace compatibilities consumed by the repaired §1.9.

**Witness:** Berger2003 line 572 identifies Lemma II.2, printed p.113, about a cyclotomic differential operator on ψ-zero functions. Its proof at lines 575–591 is not a theorem about arbitrary finite extensions and de Rham representations.

**Exact repair:** Replace that citation by BK1990 Corollary 3.8.4, p.355, and Definition 3.10, p.359, explaining that restriction/corestriction compatibility follows by naturality of these connecting maps under the supplied restriction and trace maps. Keep Rubin2000 Appendix B, Corollary 5.2, p.157, for Shapiro; cite Corollary 5.3(ii), pp.157–158, for rational finite-extension descent used in §1.9. Changing “Theorem” to “Lemma” alone would not fix the attribution.

**Repair test:** For degree 5, trace sends a base scalar a to5a, and rational descent divides by5, recovering a. For degree 1 both maps are identity. Boundary naturality supplies the required arbitrary-degree argument without restricting to the cyclotomic tower. The mathematical target is retained; this is a nonblocking locator note.

## Previous findings

- R01 — repaired: README:13,57,2517,2537,2558,2702 assign equivariant B-pair realization and cohomology comparison to PhiGammaModulesAndIwasawaCohomology §§1.6,3.9, including positive-period/localization arrows and connecting maps. PadicHodgeTheory §4.5 supplies the sign adapter.
- R02 — repaired: README:607–624 states the logarithm and local-condition theorem for every abelian variety over finite K/ℚₚ, with completed rational Kummer source, finite-extension descent, and Tate-curve, isogeny, quotient and torsion checks.

## Verified sound

:robot: Independent AI incremental re-review of 43 changed lines since 09a5b3a. Both previous blocking findings are repaired. There are zero P1/P2 findings and one nonblocking P3 locator note. This folder is ready for human final approval, conditional on its four active declared syntomic supplier contracts.

Only README.md changed; Suggested.lean is unchanged. I reviewed the altered ownership, supplier, §1.9 and §9.30a passages and their immediate dependencies and consumers. Unchanged rows below carry explicit attribution to [the previous report][prior], rather than being represented as freshly recomputed. The repository-root README writing checklist and CONTRIBUTING were read; shape was compared with the main PadicMeasuresIwasawaAlgebras and Completed/LocalFieldsRamification roadmaps.

**Gate and elaboration.** The supplied head-specific gate passes all checks, including build. The independently rerun gate, targeted build and direct elaboration also pass. The targeted build finishes successfully (8976 jobs); direct elaboration has exactly three intended sorry warnings at Suggested.lean:43,81,102. No tracked worktree changes or outside-folder PR changes were found. No new shortcut, option override, sorry-bodied data, algorithm or re-planning was introduced.

The independent dependency command returned:

    depcheck: 204 roadmaps, 1498 edges, 0 problem(s)

There were no UPWARD, CYCLE or moved lines.

**Seven signatures and padding.** A scratch copy elaborated all seven #check @name signatures and nine one-tactic failure probes: simp, rfl and infer_instance on each admitted theorem. None closed a theorem. Four definitions have real bodies. The signatures retain p>3 and s>0 in residueDilogValue_spans; both constraint theorems retain field/domain, distinct-point, nonzero-factor and exact evaluation-kernel assumptions, only at indices in J. They match README §§5.1–5.5,9.1,9.7–9.11. No dropped binder or signature repair results. The previous object-based single-library-lemma audit is carried forward for these unchanged statements.

**Headline coverage.** The end results remain normalized syntomic/étale/Bloch–Kato comparisons (§§4.2–4.7), completed local K₃ lattice isomorphism and root generation (§§5.7–5.9), global regulator functoriality (§§6.1–6.6), curve and family formulas (§§7.4–7.11), Perrin–Riou interpolation/reciprocity/determinant (§§8.13–8.19), Coleman images and integral finite cokernel (§§9.26–9.29), de Rham interpolation/crystalline comparison (§§9.30a–9.36), and the arbitrary-reduction abelian logarithm (§1.9). The three statable deep ingredients remain residueDilogValue_spans, constraint_basis_and_determinant and evaluationConstraints_coordinate_image. The module docstring names the remaining families and missing completed K-group, continuous period-cohomology, syntomic, Robba/Wach and distribution carriers. Searches at the pins found no native Bloch–Kato, Herr, Robba or Raynaud carriers making the repaired arithmetic headlines statable.

**Source checks.** Five texts were reopened: BK1990, Rubin2000, Berger2003, Nakamura2014 and RJ2018. Nakamura2014 was fetched through the source service as arXiv:1201.6475v2, whose numbering and p.27 agree with the citation.

| Target | Source evidence opened | Result |
|---|---|---|
| §1.9, prior R02 | BK1990 line 845–880, Example 3.10.1 and (3.10.2), pp.359–360; line 885–904, Example 3.11, (3.11.1)–(3.11.2), p.361 | Arbitrary abelian varieties, formal logarithm/Kummer diagram, three local conditions, crystalline fixed-space vanishing and semistable descent are supported. |
| §1.9 completion/descent | Rubin2000 line 906–922, I §6.4(9), p.16; line 6862–6882, Appendix B Corollary 5.3(ii), pp.157–158 | Completed Kummer carrier and rational descent without a prime-to-p degree restriction. |
| Seed §1.5, input to §1.9 | BK1990 line 685–694, Proposition 3.8, p.354; line 716–744, Corollary 3.8.4 and (3.8.5), pp.355–356 | Dimension and dual-annihilator formulas support the repaired equalities. |
| Seed §1.7, input to §1.9 | Berger2003 line 572–591, Lemma II.2, p.113; Rubin2000 line 6854–6882, Appendix B Corollaries5.2–5.3, pp.157–158; BK1990 line 840–844, Definition3.10, p.359 | R01 corrects the attribution; boundary naturality and rational restriction/trace support the descent route. |
| §9.30a, prior R01 | Nakamura2014 line 455–474, §2.2, p.12; line 983–1005, Theorem 2.21 and proof, p.27 | Four functorial identifications compare entire exact sequences and connecting maps. Source coordinates are γ-first. |
| §9.30a interpolation dependency | RJ2018 line 1030–1076, §IB9 and Theorem I.10, pp.908–909 | Dual exponential normalization and corrected Gamma factor survive supplier reassignment. |
| Seed §9.33, using §9.30a | RJ2018 line 1269–1302, (3), Theorem I.15 and Lemma I.17, p.914 | General de Rham domain and conductor threshold retained. Inverse-character correction remains necessary by the Gauss computation below. |

Of this round's 15 seeded targets, §§1.5,1.7,9.33 are in the changed dependency closure and were reopened. The other 12 (§§2.1,6.1,6.8,7.2,7.5,8.1,8.2,8.7,8.10,8.14,9.15,9.16) are unchanged and have carried computed rows below. No added locator is marked unverified.

**Suppliers and ownership.** Roadmap CLI searches covered indexed main/open roadmaps, with board-package and pinned-library object searches. The following changed or directly implicated contracts were opened at their available heads; line numbers exclude the CLI header.

| Object | Resolved README and line | Contract checked |
|---|---|---|
| Potential semistability | TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1719 | §3.10 supplies finite separable semistabilization; the route may pass to a Galois closure. |
| Raynaud extension/lattice | Same README:1842,1909 | §§3.13–3.14 retain full [Y→G] and polarized positivity, not only the semiabelian term. |
| Periods, Weil bounds, descent | Same README:3024,3116,3150,3243 | §5.3 retains normalized monodromy, good-abelian Frobenius and eigenvalue separation, full dual realization and finite-extension descent, including p=2 and ramification. |
| Hodge/tangent realization | TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1899 | §A4.3 supplies Hodge sequence, natural pullback and duality; tangent quotient has dimension g. |
| Elliptic specialization | TauCetiRoadmap/SelmerIwasawaCohomology/README.md:2329 | §4.26 already covers arbitrary reduction; the repaired target extends it to abelian varieties. |
| Equivariant B-pairs | TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1026 | §1.6 includes Galois action, positive lattice, localization-compatible equivalence, tensor/restriction/trace. |
| Signed complexes/torsion | Same README:1374,1400,1470,1520 | §§3.1–3.2,3.4–3.4a supply φ-first complex, φ/ψ sign, rational torsion adapter and field comparison. |
| Cohomology comparison | Same README:1871,1884 | §3.9 compares B-pair/Herr routes through the localized period roof with cups/restriction/trace. The repair explicitly retains localization, positive-period arrows and connecting maps. |
| Specialization/differential lattice | Same README:2288,2453 | §5.3 specializes at η to D(η⁻¹); §5.6a is representation-only. General de Rham extension remains owned here. |
| Localization/positive lattice/sign | TauCetiRoadmap/PadicHodgeTheory/README.md:838,934,949 | §§4.2,4.5 supply thresholded localization and positive realization; sign adapter swaps degree 1 and negates degree 2. Obsolete herrBPairDerived claim is gone. |
| General modification | Same README:999 | §5.2 constructs filtered-module modification with finite descent and its local lattices, enabling N_rig(D). |

Ownership move recorded: TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:5293, §9.5, still describes proving the general abelian point comparison there while citing the former good-reduction §1.9 here. The general comparison now belongs to this earlier roadmap's §1.9; that later paragraph should consume it. This records the prescribed move of a prerequisite from a later consumer to its earlier owner. No upward supplier edge is added here. The changed scope and downstream paragraphs consistently identify this owner; no edit to the separately reviewed consumer was made.

The two automatic resolver leads are unchanged: FontaineBPR1994 is a source ID; KTheoryQ.dvr_localization_iso is the ColemanIntegration target resolved in [R1][prior], not a claimed pinned declaration. Neither is a newly introduced citation.

**Pinned declarations reopened.** Pins remain Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Four named Mathlib declarations and the finite-field carrier were read:

| Declaration | File and line at pin | Content checked |
|---|---|---|
| Submodule.comap | Mathlib/Algebra/Module/Submodule/Map.lean:171 | Actual inverse-image carrier and closure. |
| LinearEquiv.symm_apply_apply | Mathlib/Algebra/Module/Equiv/Defs.lean:358 | Inverse reconstruction; no arithmetic identification follows from it alone. |
| LinearEquiv.finrank_eq | Mathlib/LinearAlgebra/Dimension/Finrank.lean:115 | Dimension invariance under an actual equivalence. |
| GaloisField.finrank | Mathlib/FieldTheory/Finite/GaloisField.lean:80 | Nonzero-degree hypothesis, supplied by hs. |
| GaloisField | Mathlib/FieldTheory/Finite/GaloisField.lean:69 | Splitting field of X^(p^n)−X with native field/algebra structures. |

The other nine named declarations audited in [R1][prior] and the unchanged headline ownership audit are carried forward. This repair adds no Lean declaration or substitute carrier.

The four active gap slugs at README:96–102 match packages/PadicHodgeRegulators/design/plan.json: dagger-syntomic-filtration, rigid-negative-weights, normalized-syntomic-boundary and semistable-period-descent. They retain named owners and precise domains. The fifth plan entry, completed-bloch-comparison, remains discharged by the supplier targets resolved in [R1][prior]. None of the 43 changed lines alters these contracts.

**Adversarial table.** There are 14 fresh rows and 120 carried rows. Together they cover changed mathematical assertions, all seeded targets, all three Lean headlines and the target of R01. Finite computations are review evidence, not proofs of the eventual library.

| Statement | Instances tried | Values computed on both sides / wrong model | Result; change |
|---|---|---|---|
| §1.9 completed Kummer source | Zero abelian variety; torsion point; P=exp(v) | Completed rational source and tangent space are0 in dimension0; torsion maps to0 under κ and log; log_BK κ(exp(v))=v=log_A(exp(v)). | Pass; completion is explicit. |
| §1.9 local conditions and crystalline fixed space | Tate E₅/ℚ₅, φ(e₁)=e₁/5, φ(e₀)=e₀, N(e₀)=e₁ | Nφ(e₀)=e₁=5φN(e₀); kerN=ℚ₅e₁; fixed part0 since1/5≠1. Dimensions of H_e,H_f,H_g are(1,1,1), and dimH¹=2. | Pass; retaining e₀ in kerN would falsely give fixed dimension1. |
| §1.9 bad-reduction logarithm | E₅, representatives6 and30 of the same point | log₅6=5−25/2=55 mod125; ord₅6=0, ord₅30=1, log₅5=0; both corrected logarithms and log_BK κ give55. | Pass; previous R02 repaired. |
| §1.9 all-prime scope | Tate E₂,[5]; Tate E₃,[4] | log₂5=4−16/2=28 mod32; log₃4=3−9/2+27/3=21 mod27. In each case kerN has φ=1/p, fixed dimension0, local-condition dimensions(1,1,1). | Pass; no odd-prime restriction. |
| §1.9 isogeny naturality | [2] on E₅; identity | log₅36=110 mod125=2·55; identity gives55=1·55. | Pass at bad reduction. |
| §1.9 quotient naturality | E₅×E₅→E₅, ([6],[36]) | Tangent projection sends(55,110) to55; logarithm of projected point is55. Summation gives40 mod125 and is the wrong map. | Pass. |
| §1.9 differential pairing | π*ω_E=2ω_f, AJ value a=55 | Pairing and adjusted logarithm give2a=110 mod125; omitting c_π gives55. | Pass; minimal-differential scalar not assumed. |
| §1.9 finite-extension descent using §1.7 | Degree5 and identity; tangent value55 | Trace of55 is275; rational multiplication by1/5 recovers55. Identity trace is55. Integral averaging mod5 cannot divide by5. | Pass; p-power degrees retained. |
| §1.9 homological Hodge quotient | g=0,1,2 | dimH¹_dR=0,2,4; homological Fil⁰ dimensions0,1,2; quotient dimensions0,1,2=dimLie(A). | Pass; actual supplied maps identify the spaces. |
| §9.30a differential realization | Unit; Tate twist E(1); zero module | Unit has D_dR=E=Fil⁰; twist has D_dR=E·t⁻¹e₁ and Fil⁰=0; zero has dimension0 on both B-pair/differential routes. | Pass; supplied positive lattice and action retained. |
| §9.30a sign adapter | φ=2,γ=3,x=1; vector(1,0) | d⁰1=(1,2), d¹d⁰1=0; transposed(2,1) gives3. Our d¹(1,0)=2; source differential after swap gives−2, matching degree-two negation. | Pass; previous R01 repaired with actual owner. |
| §9.30a exponential/dual comparison | D=D_rig(ℚ₅), cyclotomic and unramified classes | exp=0 since D_dR/Fil⁰=0; exp*(0,logχ(γ))=1 and exp*(c,0)=0 on both routes. Missing adapter interchanges these values. | Pass; all four period terms and connecting maps retained. |
| §9.30a torsion/trace contract | C₂ acting by±1 overℚ₂; quadratic field trace | (1+s)/2 acts by1 on trivial line and0 on sign line; trace∘restriction on1 gives2, identity degree gives1. Integralℤ₂ averaging unavailable. | Pass; rational §3.4 adapter. |
| §9.33 dependence on §9.30a | (1−φ)z=(1+T)⁶−(1+T), θ=η⁻¹κ | Both overlap charts giveθ(6)−1=η(6)⁻¹ζ₅⁻¹−1; printed direct-character label givesη(6)⁻¹ζ₅−1 in one chart. Primitive modulus5 gives normalized Gauss value1, imprimitive modulus25 gives0. | Pass; inverse character and conductor unchanged. |

Unchanged rows, with their original computed values and explicit prior attribution:

| Statement | Instances tried | Values computed on both sides / wrong model | Result; change |
|---|---|---|---|
| Conventions: Tate period and reciprocity | p=5, twists 0,1,2; ordered Kummer/logχ | φ(d_r)=1,1/5,1/25; quotient dimensions 0,1,1. Pairings (κ(6),logχ) and reverse are log₅6 and −log₅6; log₅6≡55 mod125. | Retain. Evidence carried from [R1][prior]. |
| Fundamental/finite period complexes | V=Q₅ and V=Q₅(2) | (1−φ,can) is x↦(0,0) in weight 0 and x↦(24x/25,x) in weight 2; finite H¹ dimensions 1 and 1. | Retain; no integral rescaling. Evidence carried from [R1][prior]. |
| Rigid/dagger filtration | A¹ compactified in P¹; G_m; point weight 0 | H¹(F¹)=0 on A¹ versus K[x]dx for stupid truncation; (1−φ/5)dlog t=0 on G_m; point H⁰,H¹=(Q₅,Q₅) at weight 0. | Retain the filtration and gap. Evidence carried from [R1][prior]. |
| Divided/undivided arrows | p=5,r=2; reduction mod5 | Both composites have scalar25; mod5 scalar0 is not1. Fib(0) on F₅ has H⁰=H¹=F₅ while Fib(id) has both0. | Retain. Evidence carried from [R1][prior]. |
| Period lattice conversion | (p,r)=(2,2),(3,6),(5,2) | EN/CN generators 1/8 and1/4; 1/162 and1/27; 1 and1. Multipliers2,6,1 give equality. | Retain. Evidence carried from [R1][prior]. |
| Unramified algebra / root convention | F₂; Q₅(ζ₅); empty product | Tame roots over F₂ have order1; ramified degree 4 but residue degree 1; empty algebra rank0. | Retain; no full-root assertion at2. Evidence carried from [R1][prior]. |
| Completed versus integral K₃ | Q₂,Q₃,Q₅; empty product | Completed groups Z₂⊕Z/8, Z₃⊕Z/3, Z₅, and0; torsion maps to0 in the rational target. | Retain. Evidence carried from [R1][prior]. |
| 0.1 | Q₅(2),Q₅,Q₅(−1) | Quotients have dimensions1,0,0; φ on the first is1/25. Opposite numerical weight without filtration transport gives the wrong quotient. | Retain. Evidence carried from [R1][prior]. |
| 1.1 | Tate twists r=0,1,2 over Q₅ | (dim H_e,dim H_f,dim H_g,dim H¹)=(0,1,1,2),(1,1,2,2),(1,1,1,1). | Retain; e,f,g remain distinct. Evidence carried from [R1][prior]. |
| 1.2 | V=Q₅(1); unit6 and uniformizer5 | exp(log₅6·d₁)=κ(6); valuation of κ(6)=0, of κ(5)=1. Thus κ(5) is outside exp image. | Retain. Evidence carried from [R1][prior]. |
| 1.3 | V=Q₅(2) and V=Q₅ | log(exp(d₂))=d₂; trivial representation has tangent quotient0 and ordinary exp domain0. Quotient-log kernel correction remains necessary in general. | Retain. Evidence carried from [R1][prior]. |
| 1.4 | V=Q₅, cyclotomic and unramified classes | exp*(logχ)=1; exp*(unramified class)=0; ordered adjunction on κ(6) gives log₅6 on both sides. | Retain. Evidence carried from [R1][prior]. |
| 1.5 | r=0,1,2 | dim t=(0,1,1), dim H⁰=(1,0,0), dim H_f=(1,1,1); sum formula gives1 each time. | Retain. Evidence carried from [R1][prior]. |
| 1.6 | V=Q₅(1), dual Q₅ | Unit Kummer line pairs to0 with unramified line and nontrivially with logχ; valuation direction pairs nontrivially with unramified line. | Retain both annihilator directions. Evidence carried from [R1][prior]. |
| 1.7 | Unramified quadratic extension; input6 | Norm6=36; trace(log₅6)=2log₅6=log₅36; cor∘res has scalar2, identity extension scalar1. | Mathematics retained; locator note R01. Evidence carried from [R1][prior]. |
| 1.8 | r=1,2,−1 | H_g dimensions2,1,0; uniformizer is allowed only in the first H_g, while H_f at r=1 is the unit line. | Retain. Evidence carried from [R1][prior]. |
| 1.10 | L=Q₅,r=2,a=1; p=3,r=2 | (1−1/25)⁻¹=25/24, so lattice image25Z₅ and index25; Q₃ weight2 has Z/3 torsion and is outside2≤r≤p−2. | Retain. Evidence carried from [R1][prior]. |
| 1.11 | Q₅×Q₅; empty algebra | Independent (κ(6),0),(0,κ(6)) give dimension2 versus diagonal dimension1; empty source/target0. | Retain. Evidence carried from [R1][prior]. |
| 2.1 | γ↦γ² | Log normalizer doubles while generator-division contribution halves; product multiplier2·(1/2)=1. | Retain. Evidence carried from [R1][prior]. |
| 2.2 | ε↦ε², p=5 | t and v₁ multiply by2, d₁ unchanged; derivative multiplies by1/2, derivative⊗v₁ unchanged. | Retain. Evidence carried from [R1][prior]. |
| 2.3 | Order-four η, η(γ)=i | Inverse twist evaluates γ as −iγ; direct convention gives iγ. Specialization lands in D(η⁻¹), whereas RJ's integral at η lands in D(η). | Retain. Evidence carried from [R1][prior]. |
| 2.4 | f=1+π and f₆=((1+π)⁶−1)/π | Δf=1, giving the nonzero Tate-root Iwasawa class although rational finite-level classes=0; Δf₆(0)=5/2. Negative lift reverses the class. | Retain positive cocycle conversion. Evidence carried from [R1][prior]. |
| 3.1 | Roots of unity; z=0,1; two factors | log ζ=0 so D(ζ)=Li₂ζ; specified total values at0,1 are0; product evaluation (D(a),D(b)) keeps two coordinates. | Retain. Evidence carried from [R1][prior]. |
| 3.2 | F₂₅ with a²=2 | Arithmetic Frobenius sends a↦a⁵=−a; scalar extension preserves the value while Frobenius conjugates it. Identity square has multiplier1. | Retain. Evidence carried from [R1][prior]. |
| 3.3 | Imaginary quadratic field split at p; torsion Bloch class | Embedding values form (d,−d); torsion maps to(0,0). An unmarked scalar sum would give0 and lose both coordinates. | Retain. Evidence carried from [R1][prior]. |
| 3.4 | Weights1,2,3 | Ordinary Chern/character multipliers1,−1,2; raw-symbol character multipliers−1,1,−2, hence ordinary multipliers−1,−1,−4. | Retain. Evidence carried from [R1][prior]. |
| 3.5 | Local root of unity, unit6 and nonunit5; global Q | log ζ=0, log₅6≡55 mod125≠0, log₅5=0; Q has unit rank0 and rr₅=0. | Retain unit-domain restriction. Evidence carried from [R1][prior]. |
| 3.6 | Quadratic scalar unit6, identity extension | log Norm6=log36=2log6=Tr log6; identity gives log6. | Retain. Evidence carried from [R1][prior]. |
| 4.1 | n=1,2,3; F₃ coefficients mod2 at n=3 | c_n/ch_n=1,−1,2; multiplier2 becomes0 mod2 although edge group has order2. | Retain separate Chern maps. Evidence carried from [R1][prior]. |
| 4.2 | Point, weight1 unit6; weight2 normalized coordinate a | exp(log6)=κ(6); log_BK(r_et,ch)=a=r_syn. Using c₂ instead changes a to−a. | Retain. Evidence carried from [R1][prior]. |
| 4.3 | Raw weight-two root class | Character coordinate Li₂ζ; ordinary Chern coordinate −Li₂ζ. They differ by−1, not an unspecified unit. | Retain. Evidence carried from [R1][prior]. |
| 4.4 | Weight3 raw symbol | Character gives−2Li₃; ordinary c₃ gives−4Li₃ by multiplier2. | Retain. Evidence carried from [R1][prior]. |
| 4.5 | p=5,n=2,σ=1 | Gros factor1−1/25=24/25; normalized input25 gives24, not25. | Retain. Evidence carried from [R1][prior]. |
| 4.6 | p=5,r=2; divided boundary value a | Undivided value25a; p⁻²δ_U=a=δ_D. At mod5 the factor25 is0, so no integral inverse. | Retain conditional boundary contract. Evidence carried from [R1][prior]. |
| 4.7 | Q(i), root i; zero/doubled class | de Jeu complex value P₂(i)=iD_BW(i)≠0; Borel value−2P₂(i); doubling gives2P₂(i), excluding arbitrary rescaling. | Retain universal calibration route. Evidence carried from [R1][prior]. |
| 5.1 | p=5,n=2; n=0 | Polynomial X+4X²+4X³+X⁴; at0,1,2,3,4 gives0,0,1,3,0. At n=0 coefficients all1. | Retain polynomial, not merely function. Evidence carried from [R1][prior]. |
| 5.2 | F₅, admissible2,3,4; junk input1 | f-values1,4,0; total division at1 gives0 but1 is excluded from spanning domain. | Retain. Evidence carried from [R1][prior]. |
| 5.3 | p=5,ζ=ω(2) | f(2)=1, so 25⁻¹D(ζ⁵)≡1 mod5; ζ⁵=ζ here. Omitting25 changes the residue to0. | Retain. Evidence carried from [R1][prior]. |
| 5.4 | Same special unit; ramified ζ₅ | D(ω(2))≡25 mod125, valuation2. ζ₅−1 has valuation1/4, so it fails the special-unit hypothesis. | Retain. Evidence carried from [R1][prior]. |
| 5.5 / residueDilogValue_spans | F₃,F₅,F₇,F₁₁,F₂₅ | Admissible F₃ values{0}, ranks(0,0); F₅ values{1,4,0}, ranks(1,1); F₇ values3,1,4,6,0, ranks(1,1); F₁₁ ranks(1,1). In F₂₅, f(a)=4+2a, value/difference ranks(2,2). | Retain p>3 and s>0. Evidence carried from [R1][prior]. |
| 5.6 | Root order4 at p=5; inversion | Denominator4 is a unit mod5 with inverse4; inversion negates the Bloch/regulator class. Root1 gives0. | Retain coefficient-localized classes. Evidence carried from [R1][prior]. |
| 5.7 | Root generator and zero class | D_p([ζ])=Li₂ζ by fixed −c₂·log_BK∘c₂ normalization; zero gives0; raw ordinary Chern sign alone gives the opposite value. | Retain. Evidence carried from [R1][prior]. |
| 5.8 | Q₅, Q₂₅×Q₅; Q₃ excluded | Target lattices25Z₅ and25Z₅³ have ranks1,3; source at3 has nonzero order3 torsion and cannot embed into a torsion-free lattice. | Retain full stated range. Evidence carried from [R1][prior]. |
| 5.9 | F₅; residue degree 2 plus degree 1 | Root residues span dimension1; in product the independent component lifts span2+1=3, so Nakayama gives generation of rank3 lattice. Empty product gives0. | Retain. Evidence carried from [R1][prior]. |
| 6.1 | Totally real F and imaginary quadratic F | Rational K₃ ranks r₂=0 and1; global regulator source dimensions0 and1, with no claimed positive-rank injectivity. | Retain. Evidence carried from [R1][prior]. |
| 6.2 | Class represented by ξ and 2ξ; torsion relation | Additivity gives D(2ξ)=2D(ξ); a torsion relation evaluates to0 in the characteristic-zero target. | Retain. Evidence carried from [R1][prior]. |
| 6.3 | Degree-two extension on restricted class | Transfer/regulator gives2D(ξ)=Tr(D(ξ)); identity degree 1 givesD(ξ). | Retain. Evidence carried from [R1][prior]. |
| 6.4 | F₂₅ root a | φ(a)=−a; Frobenius applied twice gives a and twice-transformed regulator returns its initial value. | Retain. Evidence carried from [R1][prior]. |
| 6.5 | Torsion ξ and denominator N prime to5 | D(ξ)=0; D(N⁻¹ξ)=N⁻¹D(ξ), N=2 gives multiplier1/2. A denominator5 does not preserve25O. | Retain. Evidence carried from [R1][prior]. |
| 6.6 | Root Frobenius and norm compatibility | On a root ζ, both exported values are Li₂(ζ⁵)=φLi₂ζ; degree-two trace of scalar a is2a. | Retain. Evidence carried from [R1][prior]. |
| 6.7 | Q-linear map Q²→Qₚ, (a,b)↦a+αb with α∉Q | Q-kernel0; after tensoring with Qₚ, vector(−α,1) maps to0. Strong injectivity implies rational injectivity; converse fails. | Retain two predicates. Evidence carried from [R1][prior]. |
| 6.8 | Cubic X³−X²+1 mod5 | (X−2)(X²+X+2); three root rows (2,4,4),(1,3,2),(2,3,3) have determinant3 mod5; combination(1,3,1) gives(2,1,3). | Retain corrected exponent2. Evidence carried from [R1][prior]. |
| 7.1 | p=5,weight2,Frobenius scalar2 | η_can=(1−2/25)η_norm=(23/25)η_norm; inverse factor25/23. At η_norm=25, η_can=23. | Retain both coordinates. Evidence carried from [R1][prior]. |
| 7.2 | One boundary logarithmic class with φ=5 | Weight-two operator1−φ/25 acts by4/5, inverse5/4; this differs from the proper H¹ factor23/25 in the preceding test. | Retain. Evidence carried from [R1][prior]. |
| 7.3 | Symbol {f,1}; Steinberg {f,1−f} | Both K₂ classes=0, hence regulator0; tame symbol at a simple zero of f is g(P)⁻¹ under the stated convention. | Retain full tame kernel. Evidence carried from [R1][prior]. |
| 7.4 | Symbol {f,1}; constant g=c, holomorphic ω | Both sides0 in first case. Second gives log(c)·Σ ord_P(f)F_ω(P)=0 on a principal divisor, agreeing with decomposable regulator pairing. | Retain normalized pairing. Evidence carried from [R1][prior]. |
| 7.5 | c₂-character sign conversion and zero class | log_BK(ch_et ξ)=r_syn ξ; ordinary c₂ gives−r_syn ξ; zero maps to0 on both sides. | Retain. Evidence carried from [R1][prior]. |
| 7.6 | Finite étale cover degree 2 and identity | f_*f*ξ=2ξ and Tr(f*r)=2r; identity givesξ,r. | Retain projection formula. Evidence carried from [R1][prior]. |
| 7.7 | Smooth proper semistable curve with N=0 versus N≠0 | At N=0, kerN is full and graph correction0; a vector v with Nv≠0 is excluded as test form, not as regulator class. | Retain arbitrary-reduction descent contract. Evidence carried from [R1][prior]. |
| 7.8 | Base point and tame symbol {t,c} | Relative connection on a constant period is0; at t=0 the tame value is c⁻¹, so a nontrivial residue cannot be silently admitted to the tame kernel. | Retain. Evidence carried from [R1][prior]. |
| 7.9 | Identity fibre specialization; nonsplit quadratic point | Identity sends a↦a; trace of1 from the quadratic residue field is2, not1. | Retain Frobenius-compatible specialization. Evidence carried from [R1][prior]. |
| 7.10 | Change boundary by a; two-term monodromy | w↦w+a, y↦y+Na leaves ρ=y−Nw unchanged; z↦z−I(a) leaves β=z+Iw unchanged. For N(a,b)=(b,0), λ=2, ρ=(0,1), the displayed transport gives Δβ=(−2,−2). | Retain coordinates; algebraic test is not a realizability claim. Evidence carried from [R1][prior]. |
| 7.11 | One loop c=2,index3; two parallel edges; quadratic trace | Half of two oriented loop contributions is6; parallel contribution2·3−2·5=−4. Tr(α²)=2π while (Trα)²=0 when α²=π, proving trace must follow the full index. | Retain loop and trace terms. Evidence carried from [R1][prior]. |
| 8.1 | Φ=[[2,1],[0,3]],a=−5,b=6 | P=−(Φ−5I)/6=[[1/2,−1/6],[0,1/3]]. For b=0 the formula is not licensed. | Retain. Evidence carried from [R1][prior]. |
| 8.2 | Same nonsymmetric Φ | ΦP=PΦ=I; ΦPᵀ=[[5/6,1/3],[−1/2,1]]≠I. | Retain both inverse identities. Evidence carried from [R1][prior]. |
| 8.3 | Same Φ | 1+a+b=2; Q=(Φ−4I)/2=[[-1,1/2],[0,−1/2]]. Eigenvalue1 would make the denominator0. | Retain. Evidence carried from [R1][prior]. |
| 8.4 | Same Φ | Q(I−Φ)=(I−Φ)Q=I. At Φ=I the left factor I−Φ=0 cannot have inverse. | Retain nonvanishing hypothesis. Evidence carried from [R1][prior]. |
| 8.5 | Same Φ,p=5; scalar Φ=−1 | Q(I−P/5)=[[-9/10,13/30],[0,−7/15]], also the quadratic formula; scalar−1 gives3/5. | Retain. Evidence carried from [R1][prior]. |
| 8.6 | Γ*(j),j=0,−1,−2,−3 | Values1,−1,1/2,−1/6; Γ*(1),Γ*(2),Γ*(3)=1,1,2. | Retain leading coefficient convention. Evidence carried from [R1][prior]. |
| 8.7 | ℓ_i(χ^j),i=0,1;j=3 | Values3 and2; their product6. Replacing log denominator by1 changes these values by logχ(γ). | Retain. Evidence carried from [R1][prior]. |
| 8.8 | Rank-one Tate class from f₆ | L=(1−φ)(Δf₆v₁); χ²-value−70/3·d₁, nonzero. A zero regulator fails. | Retain actual Iwasawa input. Evidence carried from [R1][prior]. |
| 8.9 | Frobenius eigenline α=p⁻ʲ versus other eigenline | (1−pʲφ) has scalar0 versus1−pʲα≠0; obstruction occurs exactly on the first line. | Retain full derivative obstruction. Evidence carried from [R1][prior]. |
| 8.10 | h=1,2,3 on a monomial weight j=4 | ∇_h multiplies by4,12,24 respectively; h-step recursion contributes the next factor3 then2. | Retain. Evidence carried from [R1][prior]. |
| 8.11 | h↦h+1 at j=4,h=2 | Numerator and normalizing product both acquire factor2; quotient unchanged. At j=h the factor0 prohibits numerical division without the analytic identity. | Retain. Evidence carried from [R1][prior]. |
| 8.12 | Twist byχ and byχ² | Scalar algebra variable γ becomes χ(γ)⁻¹γ and χ(γ)⁻²γ; iterated twists multiply toχ(γ)⁻²γ. | Retain meromorphic extension. Evidence carried from [R1][prior]. |
| 8.13 | p=5, conductor5²; j=0 and−2, α=1/5 | Γ*(1)·5²·α²=1 and Γ*(−1)·5⁻²·α²=−1/625, before the same Gauss/period factor. Dropping conductor/Frobenius factors changes both. | Retain each branch's BK-map domain. Evidence carried from [R1][prior]. |
| 8.14 | Scalar α=2,p=5,j=0 | (1−α)/(1−1/(5α))=−10/9; clearing denominator gives (9/10)(−10/9)=−1. | Retain. Evidence carried from [R1][prior]. |
| 8.15 | α=1 and α=1/5 at j=0 | First Euler numerator0; second case denominator0. Cleared equality is meaningful; a formal inverse at denominator0 is not. | Retain cleared statement. Evidence carried from [R1][prior]. |
| 8.16 | Direct sum of slopes1 and3; projection to first quotient | Projected bound uses1; whole module bound3. Zero projection has value0 but does not determine the required slope bound for nonzero quotients. | Retain quotient-wise hypothesis. Evidence carried from [R1][prior]. |
| 8.17 | Scalar coefficient extension and zero map | Extension sends L(z)↦1⊗L(z); zero sends both sides0; lattice multiplication by5 yields5L(z), not a unit basis change. | Retain. Evidence carried from [R1][prior]. |
| 8.18 | j=2, ordered Tate pairing1 | σ₋₁(χ²)=1, ℓ₀(χ²)=2, hence positive formula2. Degree-zero transpose adds0 signs; degree-one transpose adds−1, correcting printed value−2. | Retain source correction. Evidence carried from [R1][prior]. |
| 8.19 | Weights(0,2),(1,1),empty; χ³ | Determinants up to units evaluate as ℓ₀ℓ₁=6, ℓ₀²=9, empty product1. Maximum weight alone would conflate6 and9. | Retain multiplicities. Evidence carried from [R1][prior]. |
| 8.20 | Row L=(2,3); linear functional(v₁,v₂)↦v₁+2v₂ | Projected value8; functional twice as large gives16. Specifying the functional excludes arbitrary scalar normalization. | Retain. Evidence carried from [R1][prior]. |
| 8.21 | f₆=6+15π+20π²+⋯ at p=5 | Δf₆(0)=5/2; ∂Δf₆(0)=40/6−(15/6)²+15/6=35/12; Col moment−35/3; L moment−70/3. | Retain factor2 and signs. Evidence carried from [R1][prior]. |
| 8.22 | Split α=1, nonsplit α=−1 at5 | Trivial Euler factors0/(4/5)=0 and2/(6/5)=5/3. | Retain distinction. Evidence carried from [R1][prior]. |
| 9.1 / evaluationConstraints | R=Q[X],d=2,V₀=span(1,0) | Row(1,X) has value(1,0)∈V₀; row(0,1) has value(0,1)∉V₀; multiplying first row byX gives(0,0) at0. | Retain native submodule closure. Evidence carried from [R1][prior]. |
| 9.2 | Vanishing at0,5; repeated point0 | X(X−5) is divisible by both distinct factors; X vanishes twice at the repeated point but X² does not divideX. | Retain distinctness. Evidence carried from [R1][prior]. |
| 9.3 | One line constraint; dual numbers excluded | Basis diag(1,X), determinantX. In Q[ε]/ε², ε·ε=0, so (ε) is not free rank1. | Retain domain/nonzero factor. Evidence carried from [R1][prior]. |
| 9.4 | Old basis(X), new point5 versus0 | Evaluation5 has inverse1/5; evaluation0 is singular. Empty old basis specializes with determinant1. | Retain separation at new point. Evidence carried from [R1][prior]. |
| 9.7 / constraint_basis_and_determinant | Transverse lines at0,5 | Basis rows(X−5,0),(0,X) satisfy the two lines; determinantX(X−5), one codimension at each point. Empty J givesI. | Retain. Evidence carried from [R1][prior]. |
| 9.8 | Same basis, first row scaled by2; d=0 | DeterminantsX(X−5) and2X(X−5) generate the same ideal in Q[X]; d=0 gives1. | Retain Associated, not literal equality. Evidence carried from [R1][prior]. |
| 9.9 / coordinateImageGenerator | Transverse lines; empty J | Coordinate generators X−5 andX; empty product1. Evaluation of X−5 at0 is−5≠0 and at5 is0. | Retain. Evidence carried from [R1][prior]. |
| 9.10 | Nodes0,5 | Lagrange functions1−X/5 andX/5 have evaluations(1,0),(0,1). Thus prescribed allowed coordinate values have an explicit polynomial lift. | Retain. Evidence carried from [R1][prior]. |
| 9.11 / evaluationConstraints_coordinate_image | Transverse lines and diagonal condition at0 | First coordinate r=X−5 is realized by(r,0); r=1 is not divisible and not realized. Diagonal condition has both coordinate imagesR although row(1,0) fails. | Retain both directions; projections do not identify whole image. Evidence carried from [R1][prior]. |
| 9.12 | Basis vectors and c=(5,7) | J(b₁)=(1,0),J(b₂)=(0,1); J(5b₁+7b₂)=(5,7). Zero map fails both basis values. | Retain arithmetic J∘(1−φ). Evidence carried from [R1][prior]. |
| 9.14 | M=[[1,2],[3,4]] | detM=−2; row expansion uses its rows, not columns. Rank0 matrix has determinant1. | Retain. Evidence carried from [R1][prior]. |
| 9.15 | Same M,c=(5,7) | cM=(26,38); cMᵀ=(19,43). | Retain row convention. Evidence carried from [R1][prior]. |
| 9.16 | Same coordinate equivalence | J⁻¹(5,7)=5b₁+7b₂ and regulator row(26,38). Plain equivalence reconstruction is supplied by Mathlib; identification with1−φ is additional. | Retain. Evidence carried from [R1][prior]. |
| 9.17 | U=diag(2,1),c=(6,7) | New coordinates cU⁻¹=(3,7); new matrix UM cancels it: (cU⁻¹)(UM)=cM. Wrong cU gives(12,7). | Retain. Evidence carried from [R1][prior]. |
| 9.18 | e₁=2,e₂=3; c=(7,11) | New coordinates(29,32), determinant1−6=−5; invertible over Q₅ but not Z₅. e₁=5,e₂=10 gives−49, a unit. | Retain unit determinant requirement. Evidence carried from [R1][prior]. |
| 9.19 | Original slope r=7/11 with preceding shear | (1+3r)·29=(r+2)·32=928/11; original relation7=r·11. | Retain transformed line. Evidence carried from [R1][prior]. |
| 9.20 | Z₂, forbidden slope−2, e₁=4,e₂=2 | r+e₁=2≠0,1+e₂r=−3≠0,det=−7 unit. In Z₅,e₁=1,e₂=−4 gives det5 nonunit despite nonzero. | Retain maximal-ideal choice. Evidence carried from [R1][prior]. |
| 9.21 | A line avoiding both coordinate axes | Each coordinate projection has imageE although the joint line has dimension1<2; shearing does not imply joint surjectivity. | Retain coordinate-only conclusion. Evidence carried from [R1][prior]. |
| 9.22 | Flag dims1,2 and transverse filtration line | Intersection dimensions give codimensions1,0; taking the flag line equal to the forbidden filtration line changes first intersection from0 to1. | Retain noncritical transversality. Evidence carried from [R1][prior]. |
| 9.23 | Saturated line in rank2; nonsaturated pR·e₁ | Quotient by R·e₁ is free rank1; quotient by pR·e₁ has nonzero R/p torsion. | Retain saturation. Evidence carried from [R1][prior]. |
| 9.24 | Weights0,2; empty module | Logarithmic matrix divisors1 and n₂; determinant n₂. Rank0 gives unit1. | Retain divisor multiplicity, not just determinant. Evidence carried from [R1][prior]. |
| 9.25 | Rank2, one allowed line and full space | Specialization codimensions1 and0; replacing the line by its inverse-coordinate image preserves dimension1 but changes the membership test. | Retain actual transported subspaces. Evidence carried from [R1][prior]. |
| 9.26 | F(0)=G(0) | Image is proper: (1,0) fails since1≠0, but both coordinate projections are allR via(r,r). | Retain joint constraint theorem. Evidence carried from [R1][prior]. |
| 9.27 | Weights0,2 and1,1 | Regulator divisors (1,ℓ₀ℓ₁) and(ℓ₀,ℓ₀); atχ³ their products6 and9. | Retain. Evidence carried from [R1][prior]. |
| 9.28 | p=5,k=2,a_p=0; (Col₁,Col₂)=(1,2) at0 | Correct relation (2−a_p)Col₂−(p−1)Col₁=4−4=0; printed transposed relation gives2−8=−6. | Retain corrected coordinate order. Evidence carried from [R1][prior]. |
| 9.29 | p=5,h=9,P₀=[[0,−5⁹],[1,5]]; ideal(ϖ,X) | P₀ mod5=[[0,0],[1,0]], square0; φ²M⊂𝔪M gives φ²ⁿM⊂𝔪ⁿM. O[[X]]/(ϖ,X) has length1, not0; φ=1 gives constant iterates1 and no convergence. | Retain broader contraction proof and finite-cokernel conclusion. Evidence carried from [R1][prior]. |
| 9.30 | c=(1,0), U⁻¹=[[1,1],[0,1]] | New row(1,1) changes second kernel membership from true to false; unit rescaling of a coordinate keeps its zero set. | Retain dependence on chosen basis. Evidence carried from [R1][prior]. |
| 9.30a: differential module | D=R_E(1); nonétale φ=5⁻¹ᐟ²,γ=1 | N=t⁻¹D and ∂e₁=t⁻¹e₁∉D; nonétale module has dimD_dR=1, slope−1/2 and Herr dimensions(0,1,0). | Retain arbitrary de Rham scope. Evidence carried from [R1][prior]. |
| 9.30a: interpolation factors | h=3,j=0 in(i); h=1,j=1,2 in(ii) | Γ*(−2)⁻¹=2; corrected factors1,1 versus printed−1,2. | Retain correction. Evidence carried from [R1][prior]. |
| 9.31 | p=5,c=2,3; p=2,c=2,3 | Distance valuations1/20 and1; N=1 at5 gives bound1/25 so overlap; N=2 gives1/5 so separation. At2,N=3 gives bound1 and strict balls separate. | Retain conductor strata. Evidence carried from [R1][prior]. |
| 9.32 | z=(1+T)^6, k=0,1,−1 | κ(∂)z=z,6z,z/6 respectively; ∂(z/6)=z. On constants∂=0, so no global inverse. | Retain ψ-zero domain. Evidence carried from [R1][prior]. |
| 9.33 | z=Σ(φʳ((1+T)^6−(1+T))) | (1−φ)z=(1+T)^6−(1+T); both overlap charts give η(6)⁻¹ζ₅⁻¹−1. Printed labeling gives η(6)⁻¹ζ₅−1 in one chart, unequal. Conductor5 Gauss normalization1 becomes0 at imprimitive modulus25. | Retain inverse-character chart label. Evidence carried from [R1][prior]. |
| 9.34 | j=−1,−2,0; trivial representation | Γ*(j+1)=1,−1,1; conductor powers1,p⁻ⁿ,pⁿ. At−1 uniformizer valuation1 lies outside exp image; at−2 exponential is bijective. | Retain sufficiently-negative condition. Evidence carried from [R1][prior]. |
| 9.35 | φ(d)=2d, (1−φ)z=(1+T)d | Global Amice value=d; conductor n chart value2⁻ⁿd versus2⁻ⁿ⁻¹d at n+1. For negative slope α, same valuesα⁻ⁿd andα⁻ⁿ⁻¹d differ. | Retain chart comparison; global extension belongs to Amice object. Evidence carried from [R1][prior]. |
| 9.36 | Split/nonsplit multiplicative at5 | Augmentation Euler factors0 and5/3; only split case forces0. Rescaling differential by a unit preserves integral containment; by5 may lose integral normalization. | Retain containment, not equality. Evidence carried from [R1][prior]. |

## Not verifiable

No source needed for this incremental repair was inaccessible. No missing-reference request remains. Untouched source locators, declarations and statements retain explicitly attributed prior evidence; this is not a fresh full review of all 113 numbered subsections.

The four active CohomologyComparisonsPartII gaps remain conditional supplier obligations, not completed constructions. Positive-rank global p-adic K₃ injectivity remains conjectural. The later GrossZagierAndArithmeticHeights ownership paragraph noted above is outside this folder's verdict.

## Source issues

These two previously recorded issues were rechecked in the dependency closure; no additional source error was found. Other source issues remain recorded in [R1][prior].

- **Misprint** in RJ2018 at Theorem I.10(ii), p.909 (RJ2018 line 1069): the source says the coefficient is Γ*(1−j−h)⁻¹; it should be Γ*(1+j−h)⁻¹=1/(j−h)!; affects a stated result.
- **Error** in RJ2018 at equation (3) and Theorem I.15, p.914 (RJ2018 line 1271–1287): the source says the displayed Gauss-sum chart is evaluated at ηκ; it should be evaluated at η⁻¹κ for that η-weighted sum; affects a stated result.

[prior]: packages/PadicHodgeRegulators/reports/PRREVIEW-PadicHodgeRegulators~1.md
