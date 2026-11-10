# Review of ShimuraVarietiesPartII (package, round 2)

**Verdict:** needs changes

Five findings: three P2 and two P3; no P1. All eight requested repairs from the preceding package review were applied. The new findings concern present supplier contents, one incorrect library inventory claim, and one surviving internal design identifier. The 15 sampled source statements are supported at their stated locators. The actual Lean file elaborates successfully and declares nothing.

## R01 (P2) — Obsolete reductive-group identifiers and incorrect quotient ownership

**Location.** `packages/ShimuraVarietiesPartII/README.md:98`: “RG3.0/conjugacy-quotient … RG3.1/finite-fibre-algebraicity”. Also lines 9, 11, 31, 100–110 and the corresponding Needs, proof sketches and downstream paragraph, especially §§4.5, 4.9, 4.13 and 7.2–7.6.

**Claim.** These are supplied target identifiers of ReductiveGroupsPartIII, and that roadmap owns the construction of Conj(G).

**Witness.** PR #2131, `TauCetiRoadmap/ReductiveGroupsPartIII/README.md:57`, assigns Conj to ArithmeticGaloisRepresentations §1.11; its current §§0.5–0.7, 1.2–1.3, 2.3 and 3.5 replace the cited design identifiers. No RG3.* identifiers or former-numbering map remain.

**Exact repair.** Resolve the objects as follows, throughout the scope, conventions, contracts, Needs, sketches and downstream paragraph:

| Existing citation | Citation at the actual owner/head |
|---|---|
| RG3.0/conjugacy-quotient | ArithmeticGaloisRepresentations §1.11, **Reductive quotients over fields and DVRs**; PR #856, `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1436`, with the conjugation specialization at line 1455 |
| RG3.0/character-separation | ReductiveGroupsPartIII §0.5, line 445 |
| RG3.0/faithful-quotient-finite | ReductiveGroupsPartIII §0.6, line 469 |
| RG3.0/orthogonal-outer-action | ReductiveGroupsPartIII §0.7, line 495 |
| RG3.1/degree-one-residue-descent | ReductiveGroupsPartIII §1.2, line 579 |
| RG3.1/finite-fibre-algebraicity | ReductiveGroupsPartIII §1.3, line 608 |
| RG3.2/elliptic-maximal-torus | ReductiveGroupsPartIII §2.3, line 831 |
| RG3.3/cyclic-torus-and-neatness | ReductiveGroupsPartIII §3.5, line 1079 |
| downstream Layer RG3.5 | ReductiveGroupsPartIII Layer 5, especially §§5.5–5.8, beginning line 1557 |

All ReductiveGroupsPartIII line numbers in this table refer to PR #2131's README. Update the section descriptions of its declared gaps in both the README and `design/plan.json`'s gaps list. Preserve the missing stable-centralizer, R-smoothness, stabilizer-immersion, outer-quotient dimension and compact-quotient obligations; renumbering does not establish those obligations. Describe the new Layer 2 obligations as new supplier targets rather than pretending that §2.3 already proves them.

**Repair test.** Conj(G_m)=G_m and χ is the identity, supplied by the conjugation specialization of ArithmeticGaloisRepresentations §1.11. For the faithful embedding t↦diag(t,t⁻¹), t=2 and t=1/2 both give trace 5/2: the map is finite but not injective, exactly the distinction made by the actual §§0.5–0.6. For diag(2,4), §3.5 supplies the one-dimensional cyclic closure diag(t,t²); the additional stable-centralizer contract remains separate. These replacement citations resolve the objects actually used by §§7.2, 7.5 and 4.9.

This is new drift since the preceding review, which resolved the board design before PR #2131 existed. It does not re-raise the settled claim about an alleged reciprocal dependency on the arithmetic application: the present §5.5 explicitly takes an auxiliary group's common Frobenius conclusion as input, and is not needed here.

## R02 (P2) — Finite normalizations do not supply the lattice-chain Siegel moduli model

**Location.** `packages/ShimuraVarietiesPartII/README.md:198`: “use the induced lattice or lattice-chain Siegel level”; line 200 cites PELModuli §§M4.5–M4.6, M6.1–M6.4. At line 401, §1.6 explicitly requires “the normalized Hodge closure in that chain-level Siegel model”. The same supplier claim appears at lines 3, 9 and 68.

**Claim.** The cited PEL sections provide the ambient chain-level integral Siegel moduli scheme needed for the strict local-model comparison.

**Witness.** PR #966, `TauCetiRoadmap/PELModuli/README.md:3298` (§M4.5), provides a finite normalization over the good-level model and explicitly excludes a moduli interpretation or universal p-level structure. KPZ line 3258 instead requires the parahoric Siegel moduli scheme.

**Why this matters.** Take p=3, an algebraically closed residue field, and a superspecial principally polarized abelian surface A=E², for E: y²=x³−x. Over F₃ this E has 4 points and trace 0. Its Frobenius kernel is α_p². Fix H₂=ker(F_A). The rank-p subgroups H₁⊂H₂ are the lines in a two-dimensional vector space, parametrized by P¹; they give the polarized Iwahori flags with this fixed A and H₂. Thus the forgetful fibre of the chain moduli problem has dimension at least one. A finite normalization over the hyperspecial Siegel model has zero-dimensional fibres. They cannot be interchanged in §1.6. The single-lattice hyperspecial identity example does not detect this difference.

**Exact repair.** Keep the existing PEL normalization and universal single-abelian-scheme imports in their actual scope. Add the missing Siegel lattice-chain moduli prerequisite to the supplier contracts and to `design/plan.json`'s gaps, then consume it in §0.1 and consequently §§1.6–1.7. Respect the existing owner: `packages/PELModuliPartII/README.md:279` already assigns the general multichain moduli representability problem to ShimuraCompactifications Layer 7 under `gap:bad-prime-projectivity`. This package should declare its needed Siegel specialization of that contract, not construct a second general PEL theory.

The needed sentence should specify odd p, a self-dual periodic symplectic lattice chain, its stabilizer level, neat compatible prime-to-p level, the representing integral Siegel moduli scheme with its universal polarized chain, its generic Siegel variety and compatible tame-level maps. Do not replace this with finiteness over the single-lattice model. Update the summary and scope's claim that PELModuli already supplies this entire input. ShimuraCompactifications PR #1053, `TauCetiRoadmap/ShimuraCompactifications/README.md:2646` (§7.19), only supplies normalizations too; its scope explicitly excludes constructing parahoric moduli, so this must be a declared supplier obligation.

**Repair test.** The added contract represents the P¹-family of flags above; the finite-normalization import continues to have zero-dimensional fibres. At hyperspecial level the chain reduces to the usual single-lattice object, retaining the original GL₂ identity-normalization Check. Include the genus-two flag family as a negative-control Check for substituting the wrong ambient model.

## R03 (P3) — The pinned library already has the conjugation coaction

**Location.** `packages/ShimuraVarietiesPartII/Suggested.lean:19`: “but no conjugation coaction”; the same inventory claim appears in `packages/ShimuraVarietiesPartII/README.md:48`.

**Claim.** Tau Ceti at the pin lacks a conjugation coaction on the Hopf-algebra carrier.

**Witness.** At the pin, `TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean:66` defines `TauCeti.HopfAlgebra.conjugationAlgHom` with a real body; line 107 proves its evaluation is g x g⁻¹. Lines 176 and 248 supply the action identities.

**Exact repair.** Acknowledge and cite this native coaction in the library contract. Remove its alleged absence from the Lean module docstring. Retain the actual absent integral Shimura models, tower local systems and constructed reductive quotient API as the reasons the headlines cannot be stated. No replacement theorem or additional Lean import is needed in this declaration-free file.

**Repair test.** For g=diag(2,1), x=[[1,1],[0,1]], its evaluation is [[1,2],[0,1]], whereas g⁻¹xg has upper-right entry 1/2. The pinned evaluation theorem implements the former. For an abelian group both conjugation and its coaction are the trivial action, so testing only G_m would miss the distinction.

F07's requested hash/line repair is complete; this is a separate factual error in the inventory, not a claim that the hash repair failed.

## R04 (P2) — The special-point route omits the supplied specialness and cocharacter-adjustment theorems

**Location.** `packages/ShimuraVarietiesPartII/README.md:890`: “Import the rational Newton witness and global torus approximation”; line 892 imports BunGAndNewtonStrata §§1.34, 1.37 and only the elliptic-global-torus target of ReductiveGroupsPartIII.

**Claim.** These imports suffice to produce the global special pair with the required local acceptable class in §4.5's proposed proof.

**Witness.** PR #1241, `TauCetiRoadmap/BunGAndNewtonStrata/README.md:961` (§1.39), proves transferred-torus specialness beyond §1.37’s definition and basic elliptic case. PR #2131, `TauCetiRoadmap/ReductiveGroupsPartIII/README.md:883` (§2.5), separately adjusts the real Hodge cocharacter while retaining the p-adic pair.

**Exact repair.** Add BunGAndNewtonStrata §1.39, including its rational transfer and rational Newton hypotheses, to the contract and §4.5's Needs. Add ReductiveGroupsPartIII §2.5 to that contract and Needs alongside the renumbered §2.3. The proof sketch should first obtain the local special pair by §1.39, approximate its torus by §2.3, and use §2.5 to match its prescribed cocharacter with a member of X without losing the p-adic conjugacy. Reflect both inputs in Layer 4 Dependencies. These theorems are already owned and supplied; no new gap or local re-proof is needed.

**Repair test.** For GL₂, a nonsplit unramified quadratic torus averages the cocharacter (0,−1) to (−1/2,−1/2), whereas the ordinary class has (0,−1) and requires a split local torus. Merely choosing an elliptic real torus does not supply that local specialness. Even after a torus is chosen, the two Hodge cocharacters have values diag(2,1) and diag(1,2) at 2; equality of their geometric Weyl orbit is not equality of the prescribed cocharacter. The two added targets respectively supply these missing steps. HT lines 653–655 and 659–683 use exactly them in Proposition 1.2.5, which §4.5 cites.

## R05 (P3) — A surviving internal design identifier obscures the acyclic proof route

**Location.** `packages/ShimuraVarietiesPartII/README.md:1006`: “It uses no common Frobenius class from SV2.7.”

**Claim.** SV2.7 is an identifiable target of this roadmap.

**Witness.** The README's targets use §§0.1–7.6. Its common rational Frobenius theorem is §7.6 at line 1334; no SV2.7 target or old-to-new numbering exists in the roadmap text.

**Exact repair.** Replace “SV2.7” with “§7.6”. This retains the useful assertion that the auxiliary-prime rank comparison is proved before the final independence theorem. Tested against §4.12's Needs and the §4.13 → §5.10 → §7.4 → §7.6 chain: no new edge is introduced.

## Previous findings: repair verification

Each entry was checked against the repaired package and the supplier or source at the permitted version. The quoted snippets are the repaired package's words.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01 | Repaired | README:80, “§§2.10–2.11 … §§3.13–3.17 … §§4.3–4.4 and 4.12 … §§6.4–6.5”. These targets exist at FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII PR #1843; no TD.* citations remain. |
| F02 | Repaired | README:88, “§§3.1 and 7.6 … §3.4 … §3.7 … §5.5”. GeometricSatakeAndFusionPartII PR #1836 contains these objects and §1.4; the gap's plan section agrees. No LM.* citations remain. |
| F03 | Repaired | README:174, “No excellence hypothesis is assumed of the discrete valuation ring.” NeronModelsAndSemistableAbelianVarieties §§5.1–5.2 at PR #852 retain that generality. The redundant arbitrary-dvr-good-reduction gap is absent from both files. |
| F04 | Repaired | README:90, “prove that the μ-admissible set has a unique maximal element”. The same narrowed obligation occurs in the plan. Smoothness is separately imported from §3.7, which applies more generally than this gap. |
| F05 | Repaired | README:170, “as the direct sum of the companions of its irreducible constituents, with one common finite coefficient extension”. The plan agrees; GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2 already supply constant twists and irreducible companions. |
| F06 | Repaired | README:114, “§0.6 and §0.8”; line 146, “§§3.4–3.8”; line 180, “Layer 7”; line 184, “§§0.1–0.2 and §0.12”. All four corrected suppliers resolve at their present heads. |
| F07 | Repaired | README:44, “At 1b1ccf4b088b32fa3f23f2de1127433254a81e1e”; line 48, “At 2fd255d997f47c0b5d834ee416c7015d55444ce5”. Both match the manifest; declaration lines are 112, 95, 74, 63, 71. R03 separately corrects the coaction inventory. |
| F08 | Repaired | README:245, “HT, §2.1.1–2.1.2, p.21”; line 435, “KPZ, Theorem 7.1.3(1), p.73”. Line 142 cites MotivesAndAlgebraicCycles §6.3 without the unrecorded Deligne–Milne citation. The KPZ manifest entry includes §1.8. |

The repair-pattern sweep found no TD.*, LM.*, B2.*, IG.* or Layer C5 residue, no repeated excellent-DVR restriction, and no renewed request for the already supplied smooth local-model open or irreducible companion theorem. It did find the independent RG3.* drift and SV2.7 residue reported above. The earlier review's computed Frobenius, multiplier, centralizer and conjugated-level examples were recomputed; its nonnumerical summaries were not used as substitutes for inspecting the corresponding targets.

## Verified sound

### Coverage, shape and principles

Read the four package inputs, the previous package review and repair, all 63 numbered targets, all 71 Needs lines, all layer examples/dependencies, and the 20 supplier contracts in the plan and README. There are 26 definition/construction sections; each has an API and at least three Checks (0.1 and 4.3 have four). There are eight mathematically named layers, each ending with Examples and Dependencies. The main-branch ReductiveGroupsPartII and SchemeAndStackFoundations roadmaps were read for house shape.

No re-planning of ShimuraVarieties was found: the boundary at its generic canonical tower is explicit. No algorithm, copied source paragraph, sorry'd data, set_option, free Prop stand-in or route-specific good-prime workaround was found. Odd p is the scope of the cited general integral-model theorem; the package includes ramified and exceptional abelian-type cases within it. Arbitrary tame level is retained through stacks, rather than discarded. The final common-class theorem deliberately has the strongly acceptable hypotheses of KZ, not the generality of the integral-model existence theorem.

The layers are organized around the construction and final Frobenius theorem, not named for source chapters. The use of tensor descent, very-good local geometry, auxiliary covers, component descent, isogeny groups, lifts and curves is explained by the stated dependencies. In particular Layer 4 uses component transport from Layer 3, and Layer 5 uses the all-prime comparison of Layer 4. No additional source-ordering defect was found.

The backtick sweep found only imported library names, notation, formulas and Suggested.lean. It found zero purported new Lean declaration names. The internal unbackticked SV2.7 residue is R05. Metadata is the single math.NT topic entry. All five cited works have exactly one manifest entry, with their legal cached text and version/pagination identified. There are no explicitly unverified locators left to add to the seeded sample.

### Source sample: exact text, hypotheses and pages

The page numbers below are printed pages of the versions specified in the package. Every listed passage was opened; none was inferred merely from a bibliography or a previous review. The mathematical paraphrases are supported, subject to the supplier-contract findings above.

| Target | Locator and source lines inspected | Hypotheses/conclusion checked |
|---|---|---|
| 0.2 | KZ §§4.1.1, 4.1.5, pp.28–30; lines 1248–1250, 1299–1303 | Quotient by a neat normal tame refinement, retaining stack stabilizers; arbitrary K^p. |
| 0.6 | HT Proposition 1.3.12, Corollary 1.3.13, p.19, lines 856–884; Appendix A.4–A.7, pp.38–39, especially lines 1794–1807 | Global crystalline defining tensors and Rep(G) functor. The generated-category group need only be a subgroup; the package corrects the source's stronger identification. |
| 1.3 | KZ Proposition 4.1.9(3), pp.31–32, lines 1361–1391; setup lines 1272–1275 | Same Siegel point plus all crystalline tensors, good connected-fixer normalization, neat level and corrected very-good hypothesis. |
| 2.1 | KZ Definition 4.2.2, p.34, lines 1481–1490 | Hodge type, prescribed split restriction-of-scalars derived factors, induced central torus and very-special parahoric. No extra fundamental-group condition is inserted into this definition. |
| 2.2 | KPZ §7.2.3, pp.77–78, lines 3380–3423; Proposition 7.2.19(2), p.83, line 3675 | The auxiliary CM field splits at every prescribed p-place; the composite reflex field splits over the target p-place. |
| 2.3 | KPZ Proposition 7.2.10, pp.79–80, lines 3489–3530 | Nonexceptional adjoint-simple case, fundamental symplectic representations, self-dual lattice, quasi-tame factors and torsion-free coinvariants; not the exceptional cover assertion. |
| 2.6 | KZ Proposition 4.2.3 and Lemma 4.2.4, pp.34–35, lines 1491–1523; KPZ Proposition 7.2.19, p.83, lines 3682–3683 | Strong auxiliary cover, split reflex extension and torsion-free inertia coinvariants. The printed KZ torsion slip is not copied. |
| 4.2 | HT Lemma 1.3.9, p.18, lines 818–820 | Both the Newton inequality and equality of the integral Kottwitz invariant, with inverse Hodge-cocharacter convention. |
| 4.4 | HT Theorem 1.3.14(1),(3), pp.19–20, lines 885–906 | Closed bounded-Newton loci, locally closed strata and closure containment in the downward order; no converse closure equality. |
| 4.6 | KZ Definition 4.4.3 with preceding assumption, p.43, lines 1883–1885; HT §1.3.15, p.20, lines 909–916 | Actual ordinary class must exist; the maximum of an inner-form acceptable set is not substituted. |
| 4.13 | HT Corollary 2.1.9, p.24, lines 1095–1105 | Neat/stabilized Frobenius powers, all realizations including finite-period crystalline centralizers, and the independent coarse Noot input. |
| 5.4 | KZ Proposition 4.3.6 and setup, p.40, lines 1751–1777 | A suitable self-dual lattice with the integral fixer map, compatible levels, and a strongly acceptable target. “Any embedding” does not remove suitability. |
| 5.8 | KZ Theorem 4.1.11, Remark 4.1.12, pp.32–33, lines 1410–1413 and following remark | Ordinary special Hodge point, corrected pointwise very-goodness, finite extension of the completed unramified field, entire I_x(Q) action; no uniqueness or unramified-lift claim. |
| 5.10 | KZ Corollary 4.4.13 and proof, p.46, lines 2032–2055 | The exact finite-field q-Frobenius, semisimplicity and rationality, with ellipticity at the real place. |
| 7.4 | KZ Proposition 5.3.5 and its proof, pp.53–54, lines 2370–2425 | Algebraicity, one coefficient number field, every representation, companions on the same-field curve and induction from ordinary points through KR strata. |

Also checked the repaired pro-level locator KPZ Theorem 7.1.3(1), lines 3191–3236; the separate broader chain-level theorem KPZ 7.1.8, lines 3254–3270; the connected-reduction corollary, lines 3768–3780; and the published correction paragraphs, lines 3783–3847. HT lines 648–683 support the extra inputs in R04. KP lines 2982–3000 and 3091–3112 support the star-product and fixer distinctions. K17 lines 1381–1394 support the compact-quotient/full-rank argument and show why compactness is modulo the scalar centre.

### Computed adversarial table

These rows cover all 15 sampled targets, the seven headline theorems, and every finding's mathematical witness. They record actual values, including negative controls. A computed special case is not offered as a proof of the general theorem. The remaining numbered targets were inspected as well; their working ledger has 63 rows. No claim of acceptance is being inferred from a successful sorry build.

| Statement | Instances tried | Computed values on each side | Result and change |
|---|---|---|---|
| Conventions; 0.3, 7.1 | E: y²=x³+x/F₅; full GL₂ level 9→3 | Affine counts 1,0,1,1,0, plus ∞ give 4; H¹ polynomial T²−2T+5; V polynomial T²−(2/5)T+1/5. Full kernel order 3⁴=81, determinant-one kernel 3³=27. | Correct inversion and multiplier; no replacement by a fixed-determinant tower. |
| Conventions; finite-period norm | ζ of order 24, σ=5; the elliptic example over F₂₅ | ζσ(ζ)=ζ⁶, while ζ²≠ζ⁶. H¹ trace 2²−2·5=−6, V polynomial T²+(6/25)T+1/25. | Correct twisted norm and field-extension power. |
| 0.1, 1.6; R02 | Superspecial E² at p=3, H₂=ker F=α_p² | Lines H₁⊂H₂ form P¹, dimension 1; a finite normalization fibre has dimension 0. | Distinct integral models; declare the chain-moduli input. |
| 0.2 | Neat trivial quotient; elliptic involution at non-neat level | [S/1]=S; elliptic inertia contains ±1, order 2; coarse inertia is 1. | Quotient stack keeps the missing automorphism. |
| 0.6 | Constant ordinary elliptic family | D slopes (0,1), determinant slope 1; horizontal geometric monodromy 1, Frobenius slope torus dimension 1, not GL₂ dimension 4. | Rep(G) restriction through H works; H=G is unnecessary. |
| 1.3 | Hyperspecial Siegel identity; unmarked nodal normalization as control | Identity normalization has one point above a point; normalization of a node has two above the node before branch marking. Tensor frame U over k[ε]/ε² gives (Ue₁U⁻¹)₁₂=−ε versus (e₁)₁₂=0. | The source requires agreement of tensors selecting a branch; equality of unmarked fibres alone is insufficient. The square-zero test checks the frame law, not a new geometric-point example. |
| 1.4, 1.9 | GL₂ hyperspecial versus Iwahori | dim S=1, dim frame=5, dim local model=1, q relative dimension 4. In k[[u,v]]/(uv), u,v≠0 but uv=0; two branches versus integral P¹. | Full frame torsor and filtration map have different roles; very-special integrality is not asserted at crossings. |
| 1.7, 1.8 | Identity; blowup of A¹ along (p,t); full level versus Tate curve | Generic fibres of blowup and A¹ coincide; special components 2 versus 1. Full tame level has inertia matrix 1; a Tate curve has a nonzero unipotent off-diagonal character. | Canonical integral comparison needs its extra conditions; pro-level good reduction does not imply a finite-level extension theorem. |
| 2.1 | Split-at-p CM torus; GSp | Torus derived π₁=0, induced split Zᶜ has character lattice Z; GSp's Zᶜ=μ₂ has character group Z/2 and is not a torus. | Strong acceptability separates these examples. |
| 2.2 | Auxiliary Q(i), p=5 versus p=3 | X²+1 has roots 2,3 mod 5 and none mod 3; completion degrees 1+1 versus 2. | The splitting requirement is substantive at every prescribed place. |
| 2.3 | Nonexceptional GL₂-derived factor versus exceptional type A | π₁(SL₂)=0; π₁(PGL₃)=Z/3 at p=3; replacing the latter with its simply connected cover gives π₁=0. | The nonexceptional theorem is not used as the exceptional theorem. |
| 2.6 | Split CM auxiliary torus | Inertia coinvariants Z² have torsion subgroup 0; the relevant split reflex completion has degree 1. | Torsion-free, not torsion; same local field retained. |
| 3.6 | Iwahori GL₂ and j=diag(p,1) | A lower entry c=p becomes c/p=1, which fails the original Iwahori condition. For j=1 it stays p. | Correct conjugated-level gluing. |
| 3.8, 3.9, 3.10 | Abelian-type modular curve; split GU(1,1); connected versus C₂ frame group | Smooth curve/local model dimensions 1/1; Iwahori special fibre has two components. GU adjoint frame dimension 1+3=4 versus full frame 1+5=6. H¹(F_q,connected smooth)=1; H¹(F_q,C₂)=C₂. | General model existence does not promise smoothness; connected adjoint reduction is needed for same-field frames. |
| 4.2 | Ordinary/basic GL₂; trivial class | V slopes (0,−1) and (−1/2,−1/2) have κ=−1 and first dominant partial sums 0 and −1/2. The trivial class has κ=0, not −1. | Newton inequality alone is not admissibility. |
| 4.4 | Ordinary→supersingular specialization | First dominant partial sum 0→−1/2; total −1→−1. Reverse strict inequality would be false. | Correct downward containment, no equality of closures asserted. |
| 4.5; R04 | Split versus nonsplit local torus; two Hodge cocharacters | Averages (0,−1) versus (−1/2,−1/2); cocharacter values at 2 are diag(2,1) versus diag(1,2). | Cite existing local specialness and real-cocharacter-adjustment theorems. |
| 4.6 | Ordinary elliptic versus a division inner form | D ordinary slopes (0,1), basic (1/2,1/2). The proposed inner-form ordinary transfer would require (1/2,−1/2), each multiplicity 1, incompatible with denominator 2. | Actual ordinary-class existence cannot be replaced by existence of a maximum. |
| 4.7 | Smooth modular curve component versus nodal crossing | Ordinary open has dimension 1; supersingular subset dimension 0. Crossing has two local branches and is not locally integral. | Density keeps its ordinary-existence, rational-witness and local-integrality premises. |
| 4.9, 4.12, 4.13 | Supersingular matrix [[0,−1],[5,0]], then its square | D square=−5I; V square=−(1/5)I. One-period ordinary centralizer of this nonscalar matrix has dimension 2; stabilized scalar centralizer and quaternion-unit group both have dimension 4. | Finite-period centralizer is distinguished from J_b; stabilization matters. R05 only repairs a reference. |
| 4.13 | Ordinary CM E/F₅ | End⁰(E)=Q(i); I_x=Res Q(i)/Q G_m, dimension 2 and rank 2; every realization has the same two-dimensional centralizer. | All-prime tensor comparison has the expected ranks and dimensions. |
| 5.2, 5.6 | Two symplectic planes; identical CM data matched by norm | diag(2,1) gives AᵀJA=2J, diag(3,1) gives 3J. Norm-matched T×T has dimension 3; projection has kernel dimension 1 and target dimension 2. | Common multiplier and projection tensors are necessary; no arbitrary product substitution. |
| 5.4 | Identity Hodge embedding; Zarhin enlargement | Identity generic and integral maps both identity. E⁸ has dimension 8; E×E∨ has dimension 2. | Suitability of lattice/fixer map and the actual enlargement remain explicit. |
| 5.8, 5.9 | Ordinary CM elliptic point | D splits into slopes 0 and 1; rational scalar p⁻¹ acts as a quasi-isogeny but is not an integral automorphism. I_x has dimension 2, not just the cyclic Frobenius subgroup. | Entire rational isogeny action retained; finite lift extension allowed. |
| 5.10 | E/F₅ and γ=(1−2i)/5 | tr γ=2/5, Nm γ=1/5; dual polynomial T²−2T+5. The norm-one real torus is compact modulo the scalar centre. | Rational ordinary Frobenius and the H₁/H¹ conversion agree. |
| 6.1, 6.3 | Split GU(1,1) hyperspecial curve; zero-dimensional CM datum | Minuscule local model P¹ has one KR stratum, but Newton strata number two. Marked curve point has degree 1 and retains q; degree m would give qᵐ. In dimension zero, constant A¹→an ordinary point has nonempty ordinary preimage A¹. | Top KR is not the ordinary induction base; same-field and zero-dimensional cases are consistent. |
| 7.4 | Standard, determinant and trivial representations of the CM example, ℓ=3,7 | Both standard polynomials T²−(2/5)T+1/5; determinant polynomials T−1/5; trivial polynomials T−1. A direct sum needs the compositum E₁E₂ of its companion coefficient fields. | Representation-wise statement, including trivial representation, consistent; semisimple companion gap is minimal. |
| 7.5; R01 | t↦diag(t,t⁻¹), t=2,1/2 | Both traces 5/2, but the character t gives 2 and 1/2. | Finiteness of one faithful quotient map is not separation; all characters supply the latter. |
| 7.6 | CM quotient coordinates; one-local-field negative control | Rational point coordinates (2/5,1/5) at all ℓ≠5. Q(i) embeds in Q₅ but not Q₃. In S₃, an order-two subgroup misses the class of 3-cycles. | Almost-all local rationality is the descent input; one local realization is insufficient. |
| R03 | Nonabelian conjugation | g=diag(2,1), x unipotent upper entry 1: gxg⁻¹ has upper entry 2, g⁻¹xg has 1/2. | Pinned coaction exists with the correct orientation. |

Standing hypotheses were checked in the prose: finite-type affine groups, smooth geometrically connected reductive fibres, odd prime p, finite residue fields, ℓ≠p, neat level where a scheme is used, and the declared full-fixer/connected distinction. The zero ring is not a residue field, q=1 is not an allowed finite-field cardinality, p=2 is outside the stated theorem, and division by q is legitimate since q≥3. Rank-zero or empty tensor data cannot silently certify a faithful positive-dimensional Hodge embedding. The torus cases give genuine zero-dimensional tests. No unbound Lean section hypotheses exist because there are no declarations.

### Pinned declarations and headline coverage

Opened the following actual declarations at the manifest pins, rather than relying on the resolver's names:

| Declaration | File and line | What it does and does not supply |
|---|---|---|
| WittVector.Isocrystal | `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` | A module with semilinear Frobenius equivalence; no finite-dimensionality, G-structure or family. |
| WittVector.Isocrystal.frobenius | `Mathlib/RingTheory/WittVector/Isocrystal.lean:124` | The Frobenius-semilinear equivalence of that class. |
| TauCeti.AlgebraicGeometry.AbelianVariety | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group object; no polarization field. |
| TauCeti.AlgebraicGeometry.AbelianVariety.End | `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:74` | Additive endomorphism carrier with composition multiplication. |
| Matrix.transpose_mul_J_mul_eq_det_smul | `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:63` | Rank-two block identity with [Unique l], over a commutative ring; already proved, used only as a Check. |
| TauCeti.reductiveCommHopfAlgProperty | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71` | Finite-type smooth geometrically connected reductive group carrier over a field. |
| TauCeti.HopfAlgebra.conjugationAlgHom | `TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean:66` | The existing coaction overlooked by R03. Its evaluation theorem is at line 107. |

Object searches covered Shimura models/data, abelian-scheme Hodge tensors, parahoric/building/local-model carriers, Newton stratifications, isogeny groups and conjugacy quotients in both pinned libraries. They did not reveal native integral Shimura models or the special-fibre/tower carriers needed for the package's headlines. The existing group, isocrystal, endomorphism and coaction carriers do not encode those geometric objects through a few simple definitions.

| Headline from the summary/scope | README | Lean module docstring | Missing carrier at pins |
|---|---|---|---|
| Common rational Frobenius class | 7.6 | lines 13–20 | Integral Shimura model, tower local systems and constructed conjugacy quotient API; correct the coaction clause by R03. |
| Integral models of abelian type | 3.8 | lines 21–23 | Shimura data, parahoric integral models and local models. |
| Ordinary special lifts with isogeny action | 5.9 | lines 24–26 | Ordinary integral Shimura points and tensor-isogeny group. |
| Rational ordinary Frobenius | 5.10 | lines 27–28 | Those ordinary points and their realization local systems. |
| Tate comparison with tensors | 4.13 | lines 29–31 | Canonical Shimura tensors, I_x and finite-period crystalline comparison group. |
| Density of the ordinary locus | 4.7 | lines 32–34 | Universal G-isocrystal on the special fibre and Newton strata. |
| Curves over the original field | 6.3 | lines 35–36 | Integral Shimura models and KR strata. |

The other deep intermediate assertions named in the summary (the local-model diagram, adapted branches, henselian comparison, canonical integral model and DVR extension) lack the same integral Shimura/local-model carriers; no statable native theorem was omitted in their place. There is no padding and no weakened headline stand-in.

**Actual elaboration.** Ran `lake env lean` on `packages/ShimuraVarietiesPartII/Suggested.lean` from the pinned content checkout: exit 0, no output, no warnings. The file has one `import Mathlib`, one module docstring, the required namespace, and zero declarations. Therefore the exhaustive one-tactic probe has zero sorried theorems to try; the `#check @name` signature comparison also has zero declarations to inspect. No TauCeti import required a targeted build. The preflight signatures.md error concerning an identifier `of` is not reproduced by elaborating the delivered 41-line file and is not a package finding.

### Supplier order, gaps and duplication

The prescribed dependency check returned:

```text
depcheck: 236 roadmaps, 2157 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The separate citation resolver's four RG3 numbering leads are real, as R01 records; a successful graph check does not certify the contents of a supplier section.

Read the supplied board-package index before searching ownership. Read the overlap report: it reports no competing change to this roadmap, no dropped cited identifier in an open revision, and no identifier supplied only by an open revision. The closest open roadmaps were inspected by scope and object: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (#1843), GeometricSatakeAndFusionPartII (#1836), ReductiveGroupsPartIII (#2131), BunGAndNewtonStrata (#1241), and IgusaVarietiesAndTorsionConcentration (#1090). Used roadmaps show and object-oriented roadmaps grep, together with the board packages and main checkout. Generic adapted p-divisible deformations, generic local models and curves, B(G) invariant theory, and PEL Newton strata are imported; this package's specializations are on its normalized Hodge models. No duplicate fully qualified Lean name is possible because its Lean file declares nothing.

The present ReductiveGroupsPartIII scope defers Conj to ArithmeticGaloisRepresentations and separates its conditional arithmetic application from the geometric theorem here. R01 corrects the citation, not the mathematical direction of supply. R02 identifies a missing contract for an object already assigned to ShimuraCompactifications by the PELModuliPartII package. R04 identifies two existing generic input theorems that must be cited, not rebuilt. No additional ownership collision was found in the supplied closest heads or the object searches.

The cross-roadmap audit resolved these sections at their current permitted copies; exceptions to what they actually supply are precisely R01, R02 and R04:

| Supplier/version | Resolved sections and object checked |
|---|---|
| ShimuraVarieties, PR #933 | 4.5, 5.6, 6.3–6.6, 8.1: toric canonical models, CM reduction, generic component groups/descent and canonical tower. |
| ShimuraData, PR #1038 | Layers 1, 4: Mumford–Tate theory and connected Hodge lifts; the four additional cover/multiplier/form contracts remain declared. |
| PELModuli, PR #966 | M4.5–M4.6 and M6.1–M6.4: finite normalizations and polarized abelian realizations; not the chain-moduli representability used in R02. |
| AbelianSchemesAndArithmeticModuli, PR #849 | A4.1, A4.3, A4.8–A4.9, A6.7, A6.14, A6.20–A6.22, A6.28–A6.29: products, polarizations, effectivity, Serre–Tate, realizations, Rosati, Frobenius and torsor twisting. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, PR #879 | R07.2, particularly .6, .7, .12, .14, .20: contravariant crystalline/Dieudonné comparison; étale F=σ, multiplicative F=pσ. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, PR #1843 | 2.10–2.11, 3.13–3.17, 4.3–4.4, 4.12, 6.4–6.5: corrected embeddings, frames and full rational ordinary action. |
| GeometricSatakeAndFusion, PR #1235 | Layer GS0: Schubert indices and geometry. |
| GeometricSatakeAndFusionPartII, PR #1836 | 1.4, 3.1, 3.4, 3.7, 5.5, 7.6: normal local models, special-fibre comparison, maximal-orbit smoothness and same-field curves. General normal models use 7.6, not just the tame polynomial presentation of 1.4. |
| ReductiveGroupsPartII, main | RG2.0, RG2.1, RG2.3: algebraic groups/root data, full fixers, connected parahorics, very-special points and Lang. |
| ReductiveGroupsPartIII, PR #2131 | Actual replacements listed in R01; §2.5 is the additional R04 input. |
| BunGAndNewtonStrata, PR #1241 | 0.6, 0.8, 1.16, 1.22–1.26, 1.28–1.29, 1.34, 1.37, 2.16: point/family invariants, finite twisted norm centralizer, acceptability and ordinary conjugacy. §1.39 supplies R04's missing existence step. |
| HeckeStacksAndLocalShtukas, PR #1252 | HS2, particularly HS2.1, HS2.10–HS2.11, HS2.13: generic local towers, universal torsors and adjoint comparison. Integral full-fixer completions and general connected reduction remain declared gaps. |
| CrystallineCohomology, PR #857 | CR.7.1, CR.7.3: coefficient/descent and relative crystalline comparisons; not the two newly requested specialized transport/descent conclusions. |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | RD.3.43, RD.5.116: Newton semicontinuity and relative Zarhin enlargement. |
| PadicHodgeTheory, PR #1062 | 5.5: general-residue-field tensor torsor and integral Kottwitz difference κ(b)−μ^natural, with rational neutralization. |
| MotivesAndAlgebraicCycles, PR #1313 | Layer 6, §6.3: tensor reconstruction and image/subquotient criterion, used instead of an uncatalogued external citation. |
| AutomorphicBundles, PR #1069 | 3.4–3.8: Betti, étale and de Rham coefficient functors, their comparisons and Hecke coherence; dualizing distinguishes H¹ from the standard tower representation. |
| SchemeAndStackFoundations, main | 1.17–1.23: quotient stacks, presentations and descent. |
| AlgebraicModuliForArithmeticGeometry, PR #853 | Layers 1, 4, 6: parameter spaces, stack framework and algebraic approximation. Prescribed-point finite-field Bertini and rational-point stack presentation are explicitly additional contracts. |
| ArithmeticGaloisRepresentations, PR #856 | 5.1, 5.13: number-field and curve Chebotarev; Layer 6 is named for the independent coarse Noot contract. The actual quotient owner is §1.11 as in R01. |
| GlobalShtukasAndFunctionFieldLanglands, PR #1490 | 6.1–6.2: constant twists and irreducible companions on smooth curves; semisimple common coefficient extension remains the narrowed contract. |
| NeronModelsAndSemistableAbelianVarieties, PR #852 | 5.1–5.2: henselian criterion and descent to an arbitrary DVR, without excellence. |
| ShimuraCompactifications, PR #1053 | Layer 7: integral compactifications in its stated scope; Hodge component specialization is explicitly a new contract, and chain moduli are not already provided. |
| IgusaVarietiesAndTorsionConcentration, PR #1090 | 0.1–0.2, 0.12: PEL Newton invariants and strata, compared only on the common hyperspecial Siegel case. |

The README has exactly the same 20 gap slugs as `design/plan.json`; all have named suppliers. Their hypotheses and missing conclusions were compared with the cited supplier scopes, including the narrowed local-model and companion contracts. No additional redundant gap was found. In particular §§3.5 and 0.7 of the current ReductiveGroupsPartIII supply the cyclic closure and selected outer quotient, respectively, but do not state the extra stable-centralizer and centralizer-dimension results requested here. R01 changes their locators, not their status. R02 requires an additional declared contract. Acceptance after repair will remain conditional on fulfillment of the declared supplier contracts; this needs-changes review does not mark them as fulfilled.

## Not verifiable

- No cited source was unreadable: all five manifest texts were opened legally from the cache, and the complete seeded sample was checked. No reference request or manifest change was necessary.
- KZ was checked as arXiv:2103.09945v2, HT as the identified author PDF, and K17 as the identified author manuscript. Their published-version numbering was not independently collated; the package explicitly cites the versions actually read. KP and KPZ were checked in their published versions.
- The future proofs of the 20 declared supplier contracts are not present results. Their precise ownership and scope can be reviewed, but this review cannot certify those future implementations.
- The source theorems' full proofs were not formally verified. The report checks their statements and cited proof steps, arithmetic counterexamples and interfaces; successful Lean elaboration of a declaration-free file supplies no mathematical truth certificate.

The source-image check also resolved an extraction trap: KZ §5.1.3, p.47 (KZ lines 2091–2096), actually prints barred F in all three occurrences in its semisimple-class assertion. The extraction drops those bars. The source correctly asserts the geometric classification; it is not an erratum. The README’s geometric-versus-rational convention is correct and requires no change. KZ p.34 and HT p.19 were also inspected as rendered pages to check their alleged slips.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), printed p.34: the source says inertia coinvariants are torsion; it should be torsion-free, consistent with Lemma 4.2.4 and KPZ Proposition 7.2.19; affects a stated result.
- **Gap** in HT at the proof of Corollary 1.3.13, printed p.19: the source says the category generated by the crystalline realization has the full tensor-stabilizer group; it should be a subgroup, with restriction of representations giving the required functor; affects the proof.
- **Error** in HT at §1.3.15 and Corollary 1.3.16, printed p.20: the source says the ordinary Newton class is available without a separate existence premise; it should be assumed to exist, or guaranteed by a condition such as quasi-splitness; affects a stated result.
- **Error** in KP at the proof of Theorem 4.2.7, printed p.187: the source says the relevant action map has the stronger torsor property; it should be a smooth action map, with the frame projection carrying the torsor property; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.
- **Gap** in KP at Lemma 3.1.17, printed p.169: the source says the logarithmic limit follows using its auxiliary topology; it should be justified using p-adic completeness and shifted logarithmic tails; affects the proof; corrected in print at KPZ §7.3.1(2), pp.85–86.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, printed pp.202–203: the source says the component pieces can use one fixed parahoric level; it should be the conjugated level jK_p°j⁻¹ for the j-piece; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.
- **Gap** in KP at the display-based local-model theorem, Theorem 4.2.7, printed p.186: the source says good embedding hypotheses justify the tensor-compatible first-order comparison; it should be very-good embedding hypotheses for that proof; affects the proof; corrected in print at KPZ Remark 7.1.4(1), p.73.
