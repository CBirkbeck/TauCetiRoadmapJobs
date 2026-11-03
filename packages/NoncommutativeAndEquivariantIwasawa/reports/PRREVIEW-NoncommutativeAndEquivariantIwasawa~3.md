# Review of NoncommutativeAndEquivariantIwasawa (pull request #1307 at 6716eea)

**Verdict:** needs changes

## R01 (P1) — Break the open-image supplier cycle

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:38`, “AdelicImagesAndModularCurves, Layer 4”; also the proof at 2030 and its Needs at 2075.

**Claim:** The closed matrix-group Lie algebra and elliptic open-image theorems can be consumed from AdelicImagesAndModularCurves before this roadmap's arithmetic constructions.

**Witness:** The explicit supplier path is NoncommutativeAndEquivariantIwasawa → AdelicImagesAndModularCurves → HyperellipticCurves → PeriodsAndSpecialValues → NoncommutativeAndEquivariantIwasawa. The dependency gate reports CYCLE, not merely a movable position.

The edges are independently visible in `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1885`, `TauCetiRoadmap/HyperellipticCurves/README.md:109`, and `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:178`. The last imports this roadmap's §§2.7, F.3 and 7.9. A second return path runs through PeriodsAndSpecialValues line 106 and `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:634`, which consumes this roadmap's §0.1. 
**Repair:** Move ownership of the needed generic closed-matrix-subgroup Lie algebra, non-CM open-image theorem and CM-image theorem to this earlier roadmap, or to an existing earlier owner that actually supplies them. Make AdelicImagesAndModularCurves consume that common prefix. Remove this roadmap's dependency on the later Adelic construction; retain the full statements and the sufficiently-small-subgroup condition. Reordering alone cannot repair a directed cycle. On the witnessed graph, removing the outgoing Adelic supplier edge breaks both displayed return paths. Re-run the dependency check after the ownership change. On the mathematical negative control, ℤ_p acting through C_p on ℚ_p(ζ_p) still requires shrinking to pℤ_p: invariant dimensions change from 0 versus p−1 to p−1 versus p−1.

## R02 (P2) — Import the existing Dedekind germ and residue theorem

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:124`, “For the trivial character before deleting Euler factors construct dedekindZeta_complexGerm”.

**Claim:** A new target must identify the continued Dedekind function with Mathlib on Re(s)>1 and prove that its complex residue is Mathlib's residue constant.

**Witness:** `TauCetiRoadmap/LFunctions/README.md:795–824` already supplies dedekindZetaC, its pole order, tendsto_sub_one_mul_dedekindZetaC, and eventuallyEq_of_meromorphic_of_eqOn_halfPlane, with precisely this Mathlib residue comparison.

The LFunctions copy is main, and its residue statement explicitly uses agreement on Re(s)>1 to transport Mathlib's one-sided limit. This is the same object and comparison, not a missing complex-analytic upgrade to the raw pinned Dirichlet series.

**Repair:** Add LFunctions Layer 4 and those named continuation, germ-uniqueness and residue targets to the supplier contract. Delete the repeated continuation/residue construction. Retain, if needed, a precisely stated transport identifying the already supplied Artin trivial-character germ with that named continuation. On K=ℚ both constructions have residue 1; deleting a prime ℓ gives 1−ℓ⁻¹ on both sides. This transport preserves the required Layer 7 normalization without assigning the same theorem twice.

## R03 (P2) — State the normalized CM interpolation contract

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2038`, “the two-variable 𝔭-adic L-function, which interpolates the Hecke L-values”.

**Claim:** The relative Lubin–Tate Coleman construction specifies the two-variable element μ_χ, its quotient presentation and its interpolation at infinity types (k,j).

**Witness:** Over ℤ₅[[S,T]], μ and 2μ generate the same ideal and quotient and have the same μ-invariant. At any nonzero interpolation value their normalized values differ by the factor 2.

The paragraph specifies an infinity-type range but no interpolation equation, complex/p-adic period choices, Euler factors, or explicit source and target for the extended Coleman map and its descent from the completed unramified coefficient ring. Its ideal-level laws and three Checks do not distinguish the unit rescaling above. The cyclotomic supplier does distinguish its sign and moments (`TauCetiRoadmap/IntegralIwasawaTheory/README.md:855–870`); “extend” alone does not specify the new two-variable normalization. The accessible one-variable CM source explicitly fixes both periods before its interpolation equation: schneps-1987 lines 51–82, printed pp.20–21. This finding concerns a missing statement, not a claim that Rubin's or Schneps's theorem is false.

**Repair:** Specify the Coleman map's actual domain, completed coefficient algebra, codomain and descent map. Fix the CM differential/period choices and state the interpolation equation, including the primitive or imprimitive L-function, factorial and Euler factors and the character range, at an exact source locator. State the ideal comparison separately. Add a nonzero interpolation Check: after division by the stated right-hand side the chosen μ_χ gives 1, whereas 2μ_χ gives 2. The existing quotient/μ-vanishing Checks then remain valid but no longer stand in for normalization.

## Verified sound

I read the standing README and CONTRIBUTING requirements, the whole target README and Lean file, and main-branch roadmap shape examples. This is a new folder, not a replacement for an existing roadmap. The requested head was checked, the outside-folder diff is empty, and no pull-request file was changed. There are three repairable findings: one P1 and two P2.

The seven previous findings were compared individually before the full pass:

| Previous finding | Current passage | Disposition |
|---|---|---|
| R01, relative K-theory owner | README 32–33 and 102–104: “the relative group K₀(T) of triples” from AlgebraicKTheory §§3.2–3.3; GeneralAlgebraicKTheory §4.17 supplies exactness “without a fullness hypothesis”. | Repaired. Both supplier passages were reopened. For ℤ→𝔽₅, δ(2) is the nonzero class of C₂ and δ(4)=0; ∂=−δ preserves this kernel. |
| R02, assumed known CM inputs | README 2038: “construct the elliptic units”; 2049: “Theorem (Rubin's two-variable main conjecture)”; 2067: “Theorem (Schneps's two-variable μ-vanishing)”. | Partly repaired. These are now owned targets, including every finite-character cyclotomic line. The normalized measure construction remains incomplete as R03 explains. |
| R03, open image and rational comparison | README §0.13a and 2030: “Choose an open normal subgroup U … small enough”. | Partly repaired. The comparison and shrinking are supplied; the new open-image supplier produces R01's cycle. |
| R04, HTML anchors | README §0.1 uses its generated heading anchor; the gate has residue=0. | Repaired; the 145 forbidden anchors are gone. |
| R05, undeclared API names | README 7 distinguishes the eleven Lean declarations; §0.7 describes valuation API facts in prose. | Repaired for the reported undeclared-name issue; readme-ids-missing=0. |
| R06, namespace and layer comments | Suggested.lean 32: “namespace TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa”; layer comments at 41 and 117. | Repaired; all eleven elaborated names use that namespace. |
| R07, Coates–Howson attribution | README §4.3 now cites “Coates–Schneider–Sujatha, Links between cyclotomic and GL₂ Iwasawa theory”. | Repaired. Lemma 2.5, p.192 and Proposition 2.13, pp.197–198, equation (25), were checked against coates-schneider-sujatha-links lines 441–449 for the μ formula. Its hypotheses remain explicit. |

The worker gate has build=0, outside-folder=0, stray-files=0 and all text/form counters zero, but depcheck=1 and FAIL. Independent dependency checking returned exactly:

```text
CYCLE among: AdelicImagesAndModularCurves, HyperellipticCurves, K3SurfacesAndSymplecticBoundedness, NoncommutativeAndEquivariantIwasawa, PeriodsAndSpecialValues
depcheck: 205 roadmaps, 1628 edges, 1 problem(s)
```

I read the Needs lines as mathematical inputs, including the explicit local order F.1, 0.10, F.2, 0.13, 0.13a, 0.11, 0.12. The resolver's one lead at README 686 is not a missing ProfiniteCohomology section: F.2 denotes this roadmap's compact-homology foundation, as the contract at 112 explicitly explains. There are no declared supplier gaps to excuse R01 or to certify an unavailable contract.

Independent `lake env lean` elaboration succeeded with exactly five sorry warnings. The eleven `#check @name` signatures were elaborated again and compared with the README. The two flagged binder losses occur in canonicalSet and saturatedSet; their real bodies make sense on the more general native carrier. All five theorem uses retain the prime, profinite and finite-free coefficient-DVR hypotheses, and the Ore statements retain closed normal H and a topological quotient isomorphism with ℤ_p. No signature repair is needed. No sorry'd data, arbitrary Prop stand-in, set_option, or computational algorithm was found.

The five sorried theorems were each tried with simp, rfl and infer_instance in scratch copies: all fifteen attempts failed. Object searches found no single pinned theorem supplying any of these five conclusions. The six real definitions support substantive locality, global-dimension and Ore statements. None was identified as padding. The duplicate namespace search found no matching declaration namespace in main, the available sibling checkouts or board package Lean files.

The headline inventory is §§1.7, 2.15, 3.6, 6.15, 6.30, 6.34, 6.36, 7.13, 7.14 and 7.18, with deep algebra results §§0.4, 0.11, 0.12 and 1.10, conditional §6.35 and annihilation §7.23. The five algebra theorems that can be expressed on the pins are stated. The module docstring names the missing ring K₁/relative K₀, characteristic-element evaluation, arithmetic-complex, congruence, zeta, Picard determinant, Bockstein, period and noncommutative Fitting carriers for the later headlines. It states no weaker substitutes for them.

Pinned checks used Mathlib 6b7abb3 and Tau Ceti a91d3aa. These are concrete declarations opened at those pins:

| Pinned file and line | Object and scope checked |
|---|---|
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68` | IsProP tests all open-normal quotients; it does not itself include compactness or Hausdorffness. |
| `TauCeti/Topology/Algebra/Group/Generation.lean:73` | Topological finite generation is dense generation by a finite set. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | completedGroupAlgebra is an actual compatible-family inverse limit, with no analytic hypothesis built into the carrier. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Map.lean:92` | The induced map uses a continuous group homomorphism. |
| `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean:265` | projectiveDimension takes values in WithBot ℕ∞; the zero object convention does not erase the dimension of the whole module category. |
| `Mathlib/RingTheory/OreLocalization/OreSet.lean:50` | OreSet requires cancellation and a left common-denominator law; the opposite submonoid supplies the other side. |
| `Mathlib/RingTheory/OreLocalization/Ring.lean:133` | universalHom requires actual unit images for denominators. |
| `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean:330` and 339 | of_mul_of retains the factor set; isUnit_of includes the inverse carry. Coefficients are a commutative semiring, not just a field. |
| `TauCeti/RingTheory/FittingIdeal/Basic.lean:343` and 349 | fittingIdeal and fittingIdeal_eq_minorsIdeal_ker are commutative finite-presentation constructions. They do not supply a noncommutative reduced-norm invariant. |
| `TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean:58` | nonempty_linearEquiv_of_projective_of_tensorRat requires finite projective modules; it is not the G₀ theorem for all lattices. |
| `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49`, 56 and 77 | Raw dedekindZeta, its residue constant and its real right-hand residue limit; these alone are not a complex continuation. LFunctions owns that continuation and comparison. |

Object searches covered the roadmap service, main, supplied heads, board packages and pins. Completed/twisted algebras and commutative Fitting ideals are correctly imported. PeriodsAndSpecialValues assigns the noncommutative determinant here; HilbertModularForms imports F.5's parallel-weight prefix. The ring-class/one-prime elliptic-unit construction in EllipticCurvePeriodsAndModularParametrizations differs from this rational-CM two-variable target; the overlap alone is not an identical construction. R02 is an actual duplicate. Capped searches were not used to infer absence.

Resolved supplier passages (line numbers refer to each roadmap's README):

| Supplier | Resolved sections and representative locations |
|---|---|
| AlgebraicKTheory | §2.2 at 298, §3.2 at 346, §3.3 at 363: automorphisms, triples and boundary. The boundary requires summand-density, not fullness; the stronger equality criterion requires fullness. |
| GeneralAlgebraicKTheory | §§4.16–4.17 at 899–929, §6.19 at 1408, §8.7 at 1696, §10.6 at 2197: split-exact comparison, exactness at K₁ without fullness, complex comparison, fibre components and Morita. |
| PadicMeasuresIwasawaAlgebras | §1.7 at 909 and 982–990, §4.2 at 2409, §4.6 at 2710, §5.1 at 3172, §5.2 at 3367: finite-free coefficients including ramification, characteristic ideals, commutative determinants and compact Nakayama. |
| ProfiniteCohomology / ClassFieldTheory | Cohomology Layers 5–8 and 10–12 at 960, 1060, 1168, 1265, 1549, 1739, 2091; class-field Layer 5 at 920 and Layers 10–13 at 1552, 1683, 1724, 1799. The compact O-coefficient extensions are distinguished from the supplied finite/discrete constructions. |
| DerivedModuleAlgebra | §0.2 at 626, §1.T.1 at 1403, §1.1.1 at 1666, §1.E.0 at 2049. In particular, general associative-ring perfect complexes are supplied; commutative tensor notation is not silently used as a noncommutative scalar tensor. |
| IntegralIwasawaTheory | Head 5d2ed25: §2.0 at 274, §§7.1–7.3 at 829, 855, 875, §9.3 at 1145, §§10.0–10.2 at 1304, 1320, 1336. Ordinary/Tate support and the inverse action on completed coefficients are retained. The tower contract is abelian; F.3–F.4 state their noncommutative extension. |
| PadicPeriodRings | Head 2362d7e: §§4.1–4.3 at 416, 448, 469. Period functors are covariant; N=eN_p, N_pφ=pφN_p. The fundamental sequence is supplied, but finite-field continuous sections and connecting maps are explicitly left to the consumer. |
| SmoothRepresentationsOfLocalGroups | Head fa1d0be: raw WD parameters at 4432, operations at 4518, Frobenius semisimplification at 4624. Arithmetic Frobenius has degree one and r(w)Nr(w)⁻¹=q^{deg w}N. F.6 preserves that convention. |
| IntegralHeckeAndGaloisDeterminants | Head 3a71153: §0.6, reduced-norm target at 1072. It descends the determinant from matrix splittings; the Iwasawa total quotient is a new instantiation. |
| ImaginaryQuadraticClassNumber / LFunctions | H3.1–H3.2 at 83–98 supply CM reciprocity and Siegel functions. LFunctions Layer 4 at 795–824 supplies R02's missing deferral; its later layers supply finite-order Hecke functions and Grössencharacters. |
| ClassicalArithmeticCompletion | On-main forwarding contracts at 263–273, local-constant adapters §§7.13 and 7.30 at 14623 and 15080. These forward Artin/Hecke and epsilon theory; they are not claims of pinned-library implementation. |
| PerfectoidSpaces | P3.8 at 8478–8508 supplies the tilt/finite-extension Galois comparison used in F.6's field-of-norms branch. |
| HilbertModularForms / PeriodsAndSpecialValues | Hilbert README 61–66 and 99–107 imports this F.5; Periods README 178–180 imports this §2.7. These citations run towards consumers, except for the cycle in R01. |

The seeded source sample has fifteen targets. All ten principal sample texts were available legally through the sources service and the cited passages were read. No README locator was explicitly flagged unverified. Source support means support for the stated theorem and hypotheses, with the indicated adaptations; it is not a claim to have proved every planned generalization.

| Sample | Source text and exact locator | Result of comparison |
|---|---|---|
| 0.4 | lazard lines 2093–2111, II.2.2.2, pp.59–60; cfksv lines 138–145, p.166; ardakov-brown lines 346–355, §4.1, p.9 | Finite-quotient radicals and analytic semilocality agree. The all-profinite locality extension is separately stated with a quotient/inverse-limit route; it is not attributed to the analytic theorem alone. |
| 0.11 | venjakob-2002 lines 203–213, 750–759, 782–790, Theorems 3.26/3.29, pp.5,18–19; cfksv lines 410–416, p.174; witte-noncommutative lines 240–284, Definition 3.1/Proposition 3.2, pp.6–7 | No-p-torsion is retained for integral/residual global dimension. The O-coefficient extension is a proof target, not a quotation of a ℤ_p-only statement. The two textbook prerequisites remain uncertified. |
| 1.2 | cfksv lines 151–179, Lemma 2.1 and equation (5), pp.166–167 | Central procyclic subgroup is in G/J, not asserted in arbitrary G itself. |
| 1.5 | cfksv lines 180–193, Lemma 2.2, p.167 | The right-module criterion matches; both left and right criteria are retained. |
| 1.13 | cfksv lines 280–308, §3, p.170 | The p-primary quotient condition and S*-torsion category agree. |
| 2.1 | cfksv lines 957–968, Lemma 4.1, pp.187–188; 1035–1049 | Complete-ideal reduction and the ideal chain used for K₀ agree. |
| 2.6 | cfksv lines 970–1022, Proposition 4.2/Lemma 4.3, pp.188–189 | S-local semilocality is distinguished from S*-localization; the counterexample is retained. The inverse-polynomial typo is corrected. |
| 4.2a | venjakob-2002 lines 836–866, Definition 3.32, Remark 3.33, Proposition 3.34, p.21 onward | μ counts graded p-primary ranks; pseudo-nullity uses grade, not just μ=0. |
| 4.7 | kakde lines 398–465, Lemma 9 and equation (1), pp.10–11; burns-venjakob lines 1277–1298, Lemma 6.2, p.30 | Perfectness, S-torsion and derived arithmetic base change are separate assertions. Quotient-group notation retains the Galois/normality condition; derived tensor terms are not discarded. |
| 6.15 | kakde lines 1572–1599, Theorems 52–53/Remark 54, p.36, proofs 2892–2916, p.65 | K′₁ and Φ^G, the coefficient components and the retained group factor agree. |
| 6.25a | lim lines 262–283, Theorem 3.5 and proof, arXiv v3 p.8 | The finite p-extension μ-zero implication is supported by the proof and its Iwasawa input. Published p.343 was not independently certified. |
| 6.26 | kakde lines 3870–3907, auxiliary extension and Lemma 118, pp.86–87 | The trace-ideal bound survives; the intermediate index equality needs the correction already written in the roadmap. See the computed C₉ example below. |
| 6.28 | ritter-weiss-2011 lines 76–100 and 201–467, Propositions 5–6 and §2, pp.3–10; ritter-weiss-congruences-ii lines 152–211, 222–245, 291–368, 382–403 | The algebraic congruence and finite-level conductor argument are distinguished; the roadmap's fixed smoothing element is additional necessary uniformity, not automatic from a conductor depending on ε. |
| 7.5 | burns-venjakob lines 435–518, Proposition 3.8, Lemma 3.9 and Remark 3.10, pp.11–12 | Leading coefficients, semisimplicity and the characteristic-element sign agree; the proof's basis step needs the repair described below. |
| 7.11 | burns-venjakob lines 1016–1067, equation (19), Conjecture 5.2 and Remarks 5.3–5.4, pp.24–25 | It remains a conjecture. The regulator determinant is divided by only under the explicit Leopoldt/isomorphism hypothesis. |

The following adversarial table records computed values, not merely “checked” labels. Here R=O[[T]], Γ=ℤ_p, C_f=[R —f→ R] in degrees −1,0, and k is the residue field; p is prime unless an excluded input is explicitly described. “Retain” means the displayed tests do not refute the target; it does not certify an unavailable source or prove the general theorem. Definition/API rows test the construction and its stated functorial laws together; separately stated theorems and additional foundation stages have their own rows.

| Statement | Instances tried | Values on the compared sides | Result / change |
|---|---|---|---|
| Conventions; F.0 relative boundary | C_T; its shift; ℤ→𝔽₅ | [C_T]=[R/T], ch(C_T)=T⁻¹, ∂ch=−[R/T]; shifting negates both classes. δ(2)≠0, δ(4)=0 in C₂. | Retain ∂=−δ. |
| Dedekind germ comparison | ℚ, then delete ℓ=5 | Res ζ=1; deleted residue=4/5 for both the proposed construction and LFunctions' continuation. | R02: import the existing theorem. |
| 0.1 uniformity and closed powers | 1, ℤ_p, C_p, D₈ at p=2; power exponent 0 | Dimensions 0,1; C_p successive indices p,1. D₈ has nontrivial commutator but fourth powers 1. Zeroth powers generate 1. | Retain torsion-free and fourth-power conditions; log-index is used as dimension only on uniform groups. |
| 0.2 analytic group predicate | Finite G; ℤ_p; ∏ℕ C_p | Open uniform subgroup 1 gives dimension 0; ℤ_p gives 1; infinite product has no finitely generated open subgroup. | Retain profinite ambient hypotheses. |
| 0.3 finite-coset freeness | S₃×ℤ₅ over ℤ₅; ℤ_p over pℤ_p | Ranks 6 and p on both sides; (12)(123)≠(123)(12), so left/right representatives cannot be interchanged without conversion. | Retain both bases, including ramified O. |
| 0.4 radicals/locality, Lean iwasawa_isLocal_iff_pro_p | G=1, C_p, C₂ with odd p | O local; k[C_p]=k[ε]/ε^p has radical (ε); O[C₂]=O×O has two maximal ideals. Locality truth values true,true,false match pro-p. | Retain all-profinite criterion. |
| 0.5 complete filtrations | O[[T]]; ramified π²=p | π-adic/maximal grading has generators π̄,T̄; replacing π by p leaves nonzero nilpotent π modulo p. | Retain uniformizer and separated-complete hypotheses. |
| 0.6 ordered coordinates | ℤ_p² modulo pⁿ; nonabelian uniform group | Number of coordinates p^{2n}; ordered products distinguish ab from ba by the commutator. | Retain coordinates as a parametrization, not a group homomorphism. |
| 0.7 valuation, saturation, analytic converse | Coordinate generator at odd p and p=2 | Values 1→2 under p-power at odd p; 2→3 at 2. Value 1 at 2 fails strict >1/(p−1). Saturation can add p⁻¹ℤ_p. | Retain the stricter dyadic choice and actual saturation. |
| 0.8 Iwasawa series | Integral coefficients; coefficients π⁻ⁿ | Integral coefficients have lower bound 0; v_π(π⁻ⁿ)=−n has no lower bound. | Retain bounded-denominator distinction. |
| 0.9 integral grading | [a,b]=b^p, odd p | In degree two AB−BA=PB≠0; a universally commutative polynomial grading would give 0. | Retain extra commutator hypothesis. |
| F.1 noetherianity and grade | G=1; zero module; M=(π,T)⊂O[[T]] | j_O(k)=1, j_k(k)=0, j(0)=∞; j(M)=j(M/πM)=0, but reduction of Hom has cokernel k. | Retain grade equality and exact Ext sequence, not degreewise isomorphisms. |
| 0.10 Auslander condition | R/T; k[C_p] | Hom_R(R/T,R)=0 and Ext¹=R/T; k[C_p] is self-injective with infinite global dimension. | Retain the separation between the Ext condition and finite global dimension. |
| 0.11 Brumer; Lean brumer_gldim | G=1, ℤ_p, C_p | Integral/residual dimensions 1/0, 2/1, ∞/∞ respectively; d+1/d gives 1/0,2/1 only in the admitted cases. | Retain no-p-torsion. Left/right agree in these controls. |
| 0.12 rational dimension; Lean rationalIwasawa_gldim | G=1, C_p, ℤ_p | Fraction-field scalar extensions have dimensions 0,0,1. ℚ_p[C_p] is semisimple despite integral p-torsion; Frac(O[[T]]) would instead have dimension 0. | Retain bounded-denominator scalar extension, with p-torsion allowed. |
| F.2 compact tensors and completed homology | O^ℕ modulo π^s; Γ with trivial and regular coefficients | Reduction=(O/π^s)^ℕ; H₀(Γ,O)=H₁(Γ,O)=O; regular coefficients give H₀=O,H₁=0. | Retain completed tensor and derived homology, not underived invariants. |
| 0.13 exterior cohomology | ℤ_p²; C_p over k | Dimensions 1,2,1 for ℤ_p², including p=2; C_p has nonzero cohomology in all degrees. | Retain uniformity and exterior squares=0 at 2. |
| 0.13a rational comparison | ℤ_p acting through C_p on ℚ_p(ζ_p), then pℤ_p | Group/Lie H⁰ dimensions 0/(p−1), then (p−1)/(p−1). | Retain smallness; R01 concerns the separate matrix/open-image supplier. |
| 0.13a Lie vanishing | sl₂ standard module versus trivial module | Casimir on standard module=3/2, so cohomology=0; trivial coefficients have H³=ℚ_p. | Retain the specified representation, not merely its Lie algebra. |
| 0.14 diagonal twist | Rank m free module, rank n representation; inverse twist | Underlying rank mn; twisting back restores the original action and rank m. | Retain diagonal action and dual/inverse convention. |
| 0.15 rational homology | Γ acts trivially or by a≠1 on ℚ_p | Differential 0 gives H₀=H₁=ℚ_p; differential a−1 invertible gives both 0. | Retain rational coefficients and actual action. |
| 1.1 canonicalSet definition | H=1, G=Γ; s=T,p | R/RT=O is finite over O; R/Rp has infinitely many residual T-powers and is not finite. Membership true/false. | Retain left ideal Rs and finite generation over O[[H]]. |
| 1.2 central procyclic subgroup | G/J=C_p×Γ | Central Γ has finite index p; it does not remove the finite p-torsion factor. | Retain finite index, not equality with Γ. |
| 1.3 finite quotient algebra | Γ and C_p×Γ after residual central localization | k((T)) has dimension 1; k((T))[C_p] has dimension p and ε^p=0. | Retain finite-dimensional algebra, not a field/domain assertion. |
| 1.4 left membership criterion | s=T versus p in O[[T]], O=ℤ_p | Residual T acts injectively on k((T)); residual p=0 has kernel the whole field. Quotients over O are finite/infinite respectively. | Both directions give true/false consistently. |
| 1.5 right membership criterion | Same s=T,p; opposite ring | Right multiplication has kernel 0/whole field, exactly as left multiplication here; residual invertibility true/false. | Retain right criterion as well as the left one. |
| 1.6 S-torsion/finiteness | R/T; R/p; zero | S-torsion and O-finiteness are true/true, false/false, true/true. | Retain finite generation over R. |
| 1.7 canonical Ore theorem; Lean canonicalSet_oreSet | Γ; C_p×Γ, central T | In the commutative control choose t=s,w=r, giving tr=ws=sr. T is regular even in O[C_p][[T]]. | Retain both Ore sides; no blanket no-p-torsion condition. |
| 1.8 augmentation radical | k[C_p]→k; trivial group | Kernel=(ε), ε^p=0; trivial-group kernel=0. | Retain nilpotent finite-quotient kernel. |
| 1.9 prime-radical description | ℤ_p[[T]]; M₂(k) negative control | S=R\pR; in M₂(k), e₁₂²=0 but prime radical=0. | Retain prime radical, not the set of nilpotent elements. |
| 1.10 saturatedSet; Lean saturatedSet_oreSet | O=ℤ_p; π²=p | In one variable S* contains every nonzero element for O=ℤ_p. For ramified O, π is not pⁿs with s∈S, but π becomes invertible after inverting p. | Retain equality of localizations, not equality of p- and π-saturated sets. |
| 1.11 localization/flatness | R=ℤ_p[[T]], H=1 | R_S=R_(p): T is a unit, p is not; R_{S*}=Frac(R), both are units. | Retain the distinction. |
| 1.12 localization kernel | ℤ/n→ℚ⊗ℤ/n; zero | Localized module=0 and kernel=all ℤ/n; zero maps to zero with kernel zero. | Retain torsion kernel formula. |
| 1.13 M_H(G) | R/T, R/p, R | Quotient by p-primary torsion is O,0,R; O-finiteness true,true,false matches S*-torsion. | Retain p-primary quotient. |
| 1.14 S-acyclic perfect category | C_T; free R[0]; C_T over O[C_p][[T]] | Localization cohomology 0; R_S≠0; C_T remains a finite-free perfect complex with localized cohomology 0. | Retain complex perfectness rather than perfectness of arbitrary cohomology modules. |
| 2.1 complete-ideal K₀ invariance | O→k; O[C₂]→k[C₂], p odd; I=0 | K₀ maps ℤ→ℤ and ℤ²→ℤ² identically; I=0 is identity. | Retain completeness condition. |
| 2.2 finite-quotient detection | Γ→1 | Both projective rank groups are ℤ, map n↦n. | Retain the projective K₀ comparison. |
| 2.3 character detection | C₃ at p=7; S₃ regular representation | Pairing χ with χ∨ gives multiplicity 1, pairing with χ gives 0 when χ²≠1; S₃ multiplicities 1,1,2. | Retain contragredient and dimensions. |
| 2.4 homology class | H=1; C_p with k coefficients | Alternating class for H=1 is [M]; C_p has infinitely many nonzero H_i and no finite alternating sum. | Retain boundedness hypotheses. |
| 2.5 twisting K₀ | Trivial representation of dimension n | [M⊗Oⁿ]=n[M]; n=0 gives 0. | Retain actual representation twist. |
| 2.6 semilocality | ℤ_p[[U,V]] localized at (p,U), then invert p | First localization is local; after p⁻¹ the distinct ideals (U−ap), a∈ℤ_p, give infinitely many maximal ideals. | Retain “S* need not be semilocal”. |
| 2.7 Picard determinant/characteristic map | C_T; rank-one acyclic complex with trivialization u | ch(C_T)=T⁻¹; changing the acyclic trivialization by u changes its K₁ class by u, not necessarily 1. | Retain trivialization data and inverse convention. |
| 2.8 relative perfect class | C_T and C_T[1] | Relative classes +[R/T] and −[R/T]; Euler classes 0 in K₀(R) in both cases. | Retain sign and the nontrivial relative class. |
| 2.9 localization comparison | C_T; matrices s=diag(T,1), r=e₁₂ | C_T becomes acyclic; sr=Te₁₂ whereas rs=e₁₂. | Retain noncommutative Ore denominator ordering. |
| 2.10 boundary sequence | T,T⁻¹; ℤ→𝔽₅ | ∂T=[R/T], ∂T⁻¹=−[R/T]; δ2 nonzero, δ4 zero. | Retain sign and image/kernel rather than a zero boundary. |
| 2.11 surjectivity without p-torsion | Γ; module R/T | [R/T] maps to 0 in K₀(R), and is ∂T. | Retain surjectivity route through rank-zero image. |
| 2.12 characteristic elements | ξ and uξ, u integral unit | Boundaries equal; at rank n evaluation changes by uⁿ. | Retain ambiguity modulo integral K₁. |
| 2.13 unit representatives | Nodal ring localized away from x+y; semilocal control | K₀ of the local node maps diagonally ℤ→ℤ² after separating branches, not onto; semilocal K₁ is represented by units. | Retain semilocal hypothesis. |
| 2.14 class of p-primary finite module | k as R/(p,T) | Exact sequence R/p —T→ R/p →k gives [k]=[R/p]−[R/p]=0. | Retain relation; this is a README Check, not Lean padding. |
| 2.15 boundary with p-torsion | C_T over O[C_p][[T]] | Perfect C_T has boundary ∂T=[coker T] even though k[C_p]-modules can have infinite projective dimension. | Retain perfect-complex model; do not demand regularity. |
| 3.1 twist homomorphism | g∈G; scalar p; rank n | det twist(g)=detρ(g)·ḡⁿ; scalar p goes to pI_n and determinant pⁿ. | Retain matrix target and scalar behavior. |
| 3.2 extension of twist | T in the Γ case | T is nonunit integrally and unit in the total quotient; extending to localization requires the latter. | Retain unit-image proof. |
| 3.3 evaluation | Direct sum with cancelling zero and pole | Separate evaluations can be 0 and ∞; the combined rational expression has finite leading ratio −4/7 in the README's a=4,b=7 example. | Retain rational-function evaluation before specialization. |
| 3.4 Akashi series | k[[X,Y]], H generated by X | H₀=k[[Y]], higher homology 0; over ℤ_p[[Y]] its characteristic factor is p. | Retain integral coefficient factor. |
| 3.5 evaluation–Akashi comparison | Nontrivial C₃ character χ, p=7 | χ⊗χ∨ has invariant rank 1; χ⊗χ has invariant rank 0. | Retain dual character. |
| 3.6 Euler characteristic formula | R/(T−p); finite k; ramification degree 2 | First: H₀=k,H₁=0, χ=p and f(0)=−p gives inverse p-adic size p. Finite k: H₀=H₁=k, χ=1. A uniformizer π gives absolute-value exponent 2 when [K:ℚ_p]=2. | Retain coefficient norm and finiteness of both homology groups. |
| 3.7 finiteness of Euler characteristic | k[[X,Y]], pass to p^aH | H₀=k[[X,Y]]/(X^{p^a}) has infinite cardinality, while higher H_i vanish. | Retain finite H₀ condition, not higher vanishing alone. |
| 3.8 Artin formalism | Δ=1; C₂ | Identity case leaves χ unchanged; C₂ induction multiplies the trivial and sign-character factors. | Retain multiplicities. |
| 3.9 X₁(11) calculation | The two fourth-power examples | (5¹⁶/5⁴)^{1/4}=5³; (5⁸/5⁴)^{1/4}=5. Valuation sums −1/2+3/2+2=3 and −3/2+5/2=1. | Retain exact exponents. |
| 3.10 integrality conjecture | Constant p⁻¹; character γ↦a | Constant p⁻¹ is regular but nonintegral; twisting T gives a(1+T)−1, not a⁻¹(1+T)−1. | Retain as conjecture, with correct twist. |
| 3.11 finite SK₁/K′₁ and continuity | C₃,p=7; C₂,p=5 | ℤ₇[C₃]=ℤ₇³ gives SK₁=1; ℤ₅[C₂]=ℤ₅² has prime-to-5 torsion μ₄² of order 16, not 8. | Retain coefficient components; continuity is a separate target. |
| 3.12 total quotient | C₂×Γ, p odd | Quotient algebra F×F has two idempotent components, not one field. | Retain semisimple algebra. |
| 3.13 reduced norm | diag(a,b)∈M₂(F) | Nrd=ab; determinant of left multiplication=(ab)². | Retain reduced norm, not regular-representation determinant. |
| 3.14 transfer | C₂; scalar u | Evaluation of induced object is product of two character evaluations; scalar transfer is u². | Retain index and induction convention. |
| F.3 arithmetic duality | Real place, p=2, trivial ℤ₂; p odd | Complete Tate cohomology is ℤ/2 in even degrees and 0 in odd degrees; at odd p all Tate groups vanish. Ordinary H⁰=ℤ₂ does not equal Tate H⁰. | Retain ordinary/Tate comparison and shifts 2 locally,3 globally. |
| F.4 Selmer mapping fibres | All local maps full; all zero; C_T mod T | Fibres are global cochains/compact support respectively. C_T⊗ᴸR/(T) has O in degrees −1 and 0, whereas underived coker has only O in degree 0. | Retain actual local maps and derived specialization. |
| 4.1 elliptic Selmer carrier | X₁(11),p=5; GL₂(ℤ₃) | #E(𝔽₅)=5, a₅=1, ordinary; rational 5-torsion gives nonzero finite error. GL₂(ℤ₃) contains order-3 elements. | Retain p≥5 and finite errors, not zero errors. |
| 4.2 M_H and Mazur propositions | X=R/p; X=R | X/X(p)=0 versus R; finiteness over O is true versus false. | Retain conjectural status and the p-primary quotient. |
| 4.2a noncommutative μ/pseudo-nullity | R/pⁿ; restriction of index r; G=1 | μ=n and restricted μ=rn; a finite O-module at G=1 has grade 1, not ≥2. Zero has μ=0 and grade ∞. | Retain grade definition and dimension-zero exception. |
| 4.3 control/μ criterion | X=0; X_f finite over Λ(H) | μ formula gives 0=0+0; higher correction terms have μ=0 in the stated finite-over-H case. | Retain CSS hypotheses and corrected attribution. |
| 4.3 elliptic H-cohomology | Standard sl₂; CM weights +1,−1 | Casimir=3/2, respectively invertible weights; rational cohomology vanishes. Trivial sl₂ coefficients instead have H³=ℚ_p. | Mathematical route retained; repair supplier cycle R01. |
| 4.3 elliptic-unit norm | ζ₁₅³=ζ₅, prime 3 | Norm(ζ₁₅−1)=(ζ₅−1)/(ζ₅²−1); using Fr₃ instead of its inverse gives denominator ζ₅³−1. | Retain inverse Frobenius. |
| 4.3 two-variable CM measure | μ and 2μ at p=5 | Ideals (μ)=(2μ), quotient modules equal, μ-invariants equal; normalized nonzero values have ratios 1 and 2. | R03: add actual interpolation and period normalization. |
| 4.3 Rubin finite-character nonvanishing | f=S; f=Φ_p(σ) | S has μ=0 but π₁(S)=0. For Φ_p, π₁(f)=p, π_ψ(f)=0 at order-p ψ; σ^p-coinvariants have rank p−1. | Retain all finite characters; ideal equality alone is insufficient. |
| 4.3 Schneps specialization | f=T−p∈ℤ_p[[S,T]] | Two-variable μ=0; specialization T=0 is −p with one-variable μ=1. | Retain distinct μ assertions. |
| 4.4 weak Leopoldt/admissibility | Cyclotomic overfield; finite field outside tower hypothesis | Cyclotomic weak-Leopoldt H² vanishes in the stated limit; a finite field is not an extension containing its infinite cyclotomic tower. | Retain tower, finite ramification and μ hypotheses separately. |
| 4.5 dual Galois complex | H⁻¹=X_Σ,H⁰=ℤ_p; C_p×Γ | [C]=[ℤ_p]−[X_Σ], ∂ζ=[X_Σ]−[ℤ_p]; p-torsion does not prevent a perfect complex model. | Retain shift and perfectness at complex level. |
| 4.6 compact support/duality | Add one unramified prime; zero coefficients | Added cone supplies det(1−Frob·T), not its inverse by fiat; zero coefficients give identity determinant 1. | Retain duality shift −3 and Euler cone. |
| 4.7 perfection/torsion/base change | C_T; free R; specialization T=0 | C_T is perfect and S-acyclic; free R is perfect but not S-torsion. Derived specialization of C_T has two O terms. | Retain all three distinct conditions. |
| 4.8 real dyadic correction | Real ℤ₂ versus no real places | Tate terms ℤ/2 recur in every even degree; empty real-place sum=0. | Retain unbounded correction, not a finite ordinary truncation. |
| 5.1 normalized GL₂ interpolation | Rank n twist by unit u; X₁(11),χ=1 | Scalar changes by uⁿ; removed factor at 11 is 1−1/11=10/11. | Retain deleted Euler factors and fixed periods. |
| 5.2 GL₂ main conjecture | ξ versus uξ | Same boundary/coset; evaluations differ by uⁿ with p-adic absolute value 1. | Retain quotient by integral K₁, not literal equality. |
| 5.3 consequences | Finite Euler-characteristic specialization; scalar unit ambiguity | abs_p(uⁿ)=1, so Euler size is unchanged although value changes. | Retain conditional implication; no existence inferred. |
| 5.4 coefficient/example calculation | X₁(11),p=5 | Coefficient extension has unramified degree 5; fourth-root Euler values are 5³ and 5 as in §3.9. | Retain degree and exponents. |
| 5.5 totally real main conjecture | Γ, characteristic element 1/T | ∂(1/T)=−[ℤ_p], matching −[C] when C has H⁰=ℤ_p. | Retain sign. |
| 5.6 localized interpolation | A pole F=T⁻¹ | Ordinary value at T=0 is not finite; order=−1 and leading coefficient=1. | Retain localization/leading-value distinction. |
| 5.7 functoriality | Identity; index-two induction | Identity sends ζ to ζ; induction multiplies trivial/sign evaluations. | Retain actual norm/restriction maps. |
| 5.8 abelian comparison | ζ versus (1+p)ζ | Same principal ideal and boundary; evaluations differ by 1+p. | Retain normalized abelian input, not ideal equality alone. |
| F.5 Hilbert forms and cusp lattices | p=5, weight 5; ℚ(√6), p=3, weight 6 | The README's cusp constants 626/3 and 4/15 have 5-adic valuations 0 and −1; −438383/12 has 3-adic valuation −1. | Retain all-cusp versus standard-component integrality. |
| F.5 saturation/families | Ideal (p,T); denominator δ specializing to 0 | (p,T) has rank 1 and is torsion-free but not free. δ=0 cannot be divided out even when a generic first coefficient is 1. | Retain flatness/saturation and actual denominator condition. |
| F.5 Hecke detection | Constants differing by 2; level operator U₇ | Difference 2 survives the level-operator test; omitting the level operator loses that constraint. | Retain good and level-dividing Hecke operators. |
| 6.1 equivariant abelian adapters | ℚ,p=3,k=2; C₃,p=5; S₃ | L_Σ(−1)=1/6, Eisenstein constant 1/12, unlike untruncated −1/24. ℤ₅[C₃] has ranks 1+2=3, not 1+2+2; S₃ block dimensions sum 1+1+4=6. | Retain Euler truncation, Galois character orbits and matrix blocks. |
| 6.2 Burns–Kato patching | Patch f and ζ with equal boundary | u=ζ/f has boundary 0; multiplying f by u gives ζ exactly. | Retain integral correction, not equality from boundary alone. |
| 6.3 reduction to dimension one | Identity quotient; Γ | Identity quotient preserves the element and boundary; Γ has dimension 1 and requires no further quotient. | Retain compatibility in the inverse system. |
| 6.4 character descent | S₃,p=5 | Irreducible dimensions 1,1,2; scalar a in the degree-2 block has determinant a². | Retain character dimensions. |
| 6.5 K′₁ components | C₂,p=5 | Coefficient algebra ℤ₅² has torsion μ₄², order 16, not 8. | Retain componentwise torsion. |
| 6.6 elementary reduction | C₃,p=5; semilinear unramified coefficients | Nontrivial C₃ characters form one degree-2 orbit, not two independent ℤ₅ factors; coefficient Frobenius can act nontrivially on roots of unity. | Retain Galois orbit descent. |
| 6.7 twisted presentation | p=3, carry 1+2=3 | Product carry is γ³; inverse basis factor requires γ⁻³. Identity carry=1. | Retain native twisted algebra and inverse carry. |
| 6.8 multiplicative congruences | C₃, x=1+3g; group generator g | Norm x=28; α(x)=1+(9g+27g²)/28. Norm g=1 for odd p, but −1 for C₂. | Retain odd-prime hypotheses and norm direction. |
| 6.9 additive congruences | C_p; identity and nonidentity classes | β at trivial subgroup multiplies identity coefficient by p; cyclic component retains the nonidentity class. Double-counting would give p² instead of p. | Retain η₁=id and correct multiplicities. |
| 6.10 additive inverse | C_p and coefficient r at identity | Summation contributes pr, normalization divides by p, yielding r; no extra p remains. | Retain the stated inverse normalization. |
| 6.11 logarithm | ℤ₃ and ℤ₂ principal units | log(1+3ℤ₃)=3ℤ₃; log(1+2ℤ₂)=4ℤ₂, not 2ℤ₂. Finite p-power group elements have logarithm 0. | Retain odd p where used. |
| 6.12 integral logarithm | Central γ; scalar 1+p | L(γ)=0 although γ has infinite order; L(1+p)=(1−1/p)log(1+p). | Retain Frobenius correction and nontrivial kernel. |
| 6.13 norm/log compatibility | Scalar 1+pr in degree p extension | Norm=(1+pr)^p; log norm=p log(1+pr), matching additive trace. | Retain trace factor p. |
| 6.14 multiplicative exact sequence | Unramified quadratic coefficients at p=3; central γ | On μ₈ the coefficient norm is ζ↦ζ⁴, not ζ; Lγ=0 while the group-factor map retains γ. | Retain Frobenius action and group factor. |
| 6.15 K′₁ congruence theorem | G=Γ; product coefficient algebra | θ is identity on the abelian unit group; each coefficient component has its own units and retained abelianized-group factor. | Retain K′₁, not an unjustified K₁ isomorphism. |
| 6.16 coefficient descent | O=ℤ₅[ζ₃] | O⊗ℤ₅O≅O×O, rank 4 over ℤ₅; it is not the matrix algebra M₂(O), rank 8. | Retain étale product descent. |
| 6.17 monomial induction | Q₈; degree-p Heisenberg representation | The degree-2 Q₈ representation is induced from a C₄ character; degree-p Heisenberg representation comes from index p. | Retain character induction with dimensions. |
| 6.18 conjugation/norm relations | Conjugate subgroup; identity norm | Conjugation preserves evaluated class; index-one norm is x, not x^p. | Retain actual subgroup indices. |
| 6.19 Δ-values | ε=0; smoothing element u=1; ℚ,p=3,k=2 | Δ=0 in the first two cases; unsmoothed truncated special value is 1/6. | Retain smoothing factor in the defining difference. |
| 6.20 pseudomeasures | u=1 versus a generator | (1−u)λ=0 at u=1 for every λ, so that one equality determines nothing; a nontrivial denominator recovers λ in the localization. | Retain enough smoothing elements. |
| 6.21 trace ideals | C_p-action: fixed orbit versus free orbit | Trace of a fixed basis vector is p times it; a free orbit sum has coefficient 1 on each orbit element. | Retain orbit stabilizers. |
| 6.22 Hilbert restriction/operator | diag(p,1) versus diag(1,p) modulo p | Images are the second versus first coordinate lines; the two degeneracy maps differ. Index-one operator is identity. | Retain matrix/slash direction and cusp data. |
| 6.23 cyclic detection limits | C_{p²}×C_p | Maximal cyclic subgroups have index p; transfer images in the first factor lie in pC_{p²} and miss its generator. | Retain the enlarged auxiliary construction. |
| 6.24 Möbius divisibility | C₃² and coefficient 2 | 2⁹−4·2³+3·2=486=54·9. | Retain the full subgroup lattice. |
| 6.25 analytic congruence/uniform conductor | C_p; conductor neighborhoods pⁿℤ_p | Möbius coefficients are 1,−1; ⋂ₙpⁿℤ_p={0}. A choice depending on each conductor need not supply one fixed nontrivial smoothing element. | Retain the fixed element and unit-idele argument. |
| 6.25a μ under finite p-extension | C_p with trivial ℤ_p coefficients | H₁(C_p,ℤ_p)=C_p, H₂=0: finite error terms, not zero in all positive degrees. | Retain finite-error argument for μ-zero; no unproved equality of modules. |
| 6.26 auxiliary trace bound | H̃=C₉, G=C₉, P=⟨(a,b³)⟩ | i_P=1, card(P)=9, card(⟨b³⟩)=3: actual scalar 9·3/9=3, not 9. Required p·i_P²=3 still holds. | Retain corrected index calculation. |
| 6.26a cyclotomic reductions | Twist by ω² at p>3; coefficient p⁻¹ | ω² is not the trivial character; p⁻¹ becomes integral only after multiplying by p. | Retain finite Teichmüller and denominator factors. |
| 6.27 logarithmic congruence | γ and scalar 1+p | Lγ=0; scalar value=(1−1/p)log(1+p), as in §6.12. | Retain same normalization across layers. |
| 6.28 algebraic Möbius–Wall | C_p; C₃²; C_{p²} | Fixed-orbit trace=p; subgroup Möbius sum for C₃² is 1−4+3=0; top Möbius value for C_{p²} is 0. | Retain all subgroups and trace ideal. |
| 6.29 logarithmic lifting | A logarithmic preimage multiplied by a root of unity | Logarithms agree because log ζ=0; the elements need not agree. | Retain torsion ambiguity until its separate control. |
| 6.30 Ritter–Weiss main theorem | Abelian Γ, μ=0 | Boundary and interpolation reduce to the normalized abelian element; multiplying by a unit preserves boundary but changes values. | Retain both conditions and μ=0; no unconditional extrapolation. |
| 6.31 descent of trace congruences | Fixed orbit of stabilizer p^a; free orbit | Trace coefficient p^a versus 1; reduction modulo pⁿ preserves the actual stabilizer factor. | Retain finite-level descent. |
| 6.32 multiplicative congruence | Trivial subgroup P=1 | The relevant quotient is ζ₁^p/φ(ζ₁); replacing it by a nontrivial-subgroup α expression changes its exponent. | Retain the separate P=1 case. |
| 6.33 M1–M4 criterion | Abelian Γ; reduction modulo p | M4 reduces to x^p≡φ(x) mod p; identity norm and restriction reduce to x=x. | Retain all four conditions on actual units. |
| 6.34 Kakde main theorem | Cyclotomic Γ under odd p, μ=0 | ∂ζ=[X_Σ]−[ℤ_p]; normalized abelian specialization has exactly the prescribed values. | Retain odd p and μ-zero assumptions. |
| 6.35 conditional uniqueness | Cyclic degree-3 case | For the abelian C₃ control, SK₁(ℚ₃[C₃])=1, so the determinant kernel has size 1; the general theorem retains its separate vanishing hypothesis. | Retain the conditional theorem, not unconditional SK₁ vanishing. |
| 6.36 abelian minus theorem | C₃ character and dual; ℚ(ζ₃), p=3 without smoothing | χ(g)=ζ₃, χ∨(g)=ζ₃⁻¹; an unsmoothed value can be 1/3, not integral. | Retain dual and smoothing hypotheses; do not infer all-prime integrality without them. |
| 7.1 Bockstein | C_T; complex with differential [[T,1],[0,T]] | Bockstein for C_T is −1 in the stated convention. Second cokernel=R/T², whose first-order Bockstein is 0. | Retain semisimplicity test, not torsion alone. |
| 7.2 order/semisimple complexes | C_T, C_T[1], acyclic complex | Orders −1,+1,0; R/T² is not semisimple at T. | Retain shifts and actual Bockstein acyclicity. |
| 7.3 trivialization | C_{pT}; direct sum | Bockstein=−p, leading characteristic coefficient=1/p; direct-sum trivializations multiply. | Retain inverse determinant convention. |
| 7.4 characteristic leading term | f(0)≠0; shifted C_f | Characteristic leading coefficient=1/f(0); shift gives f(0). | Retain actual nonzero constant hypothesis. |
| 7.5 characteristic-series coefficient | F=3T⁻²(1+T); C_T | Order −2 and leading coefficient 3; C_T gives order −1, coefficient 1. | Retain leading coefficient rather than value at 0. |
| 7.6 inverse characteristic convention | C_T versus T | Characteristic map gives T⁻¹, order −1; positive-boundary module element T has order +1. | Retain explicit distinction. |
| 7.7 change of generator/derivative | F=T; γ replaced by γ² | First derivative scales by c; in T′=(1+T)²−1, T has leading coefficient 1/2 and T⁻¹ coefficient 2. | Retain generator factor and inverse behavior. |
| 7.8 generalized Euler characteristic | C_{pT} | Additive length=1, multiplicative Euler value=p, characteristic leading value=p⁻¹, order=−1. | Retain inverse relation. |
| 7.9 global zeta proposition | Unit motive; real place; SK₁ ambiguity | RΓ_c has Euler rank 1 in the stated normalization while ordinary RΓ has rank 0; real plus rank=1. Determinants alone leave SK₁ ambiguity. | Retain actual complexes and conjectural status. |
| 7.10 Tate descent | ℚ, trivial representation; two copies | Bockstein scalar=−log_p(u)/c_γ; two copies square the determinant and double the order. A virtual negative copy is not a representation space. | Retain multiplicities and representation domain. |
| 7.11 Stark at s=1 | ℚ; real quadratic regulator | Rank-zero regulator determinant=1, residue factor=1−1/p (2/3 at p=3). Nontrivial regulator factor is log_p ε/log ε; a zero p-adic regulator cannot be divided by. | Retain Leopoldt hypothesis and conjectural assertion. |
| 7.12 deleted Euler factors | ℚ,p=3, delete ℓ=5 | (1−1/3)(1−1/5)=8/15. | Retain both factors. |
| 7.13 Tate leading interpolation | Formal nonzero values c=5, log=7, L=11 | B=−7/5, inverse characteristic trivialization=−5/7; ζ-leading scalar 77 and sign −1 yield 55, then divide by c to get 11. | Retain signs and period factor. |
| 7.14 rational-character induction | C₃ at p=7 | Individual χ takes ζ₃-values and is not ℚ-valued; χ+χ̄=regular−1 is rational. | Retain rationality hypothesis of this theorem. |
| F.6 period boundary/exponential | V=0, ℚ_p, ℚ_p(1) | Zero gives zero; ℚ_p has tangent 0 and H¹_e=0 but H¹_f dimension 1; ℚ_p(1) exponential image is units, missing the uniformizer line. | Retain H_e rather than H_f. |
| F.6 arbitrary-representation image | Nonsplit reverse-Tate extension | D_dR=Fil⁰ has dimension 1, so exp=0; Q_V contains an invariant line injecting into H¹_e. Thus im exp=0 while H¹_e≠0. | Retain de Rham hypothesis for equality with H_e. |
| F.6 naturality | Inclusion/quotient of the reverse-Tate extension | Source and middle tangent maps are zero, quotient tangent is nonzero; the tangent sequence is not right exact. | Retain naturality without assuming exactness. |
| F.6 field Robba/étale stage | Rank-one φ(e)=pe; rank zero | Frobenius slope 1, hence not étale; rank-zero object has no slopes and zero module. | Retain étale lattice condition. |
| F.6 residue and overconvergence | φ(e)=se in characteristic p; b=u^p+Σpⁿu^{−pⁿ} | Rank-one equation x^{p−1}=s⁻¹; at p=2 exponent=1. For fixed ρ<1, abs(p)ⁿρ^{−pⁿ}→∞, so b is not overconvergent. | Retain ramification and annulus conditions. |
| F.6 slope/local-monodromy stage | π²=p, φ(e)=πe; diagonal slopes 0,1 | p-normalized slope=1/2, not 1; diagonal object is not pure. | Retain normalized valuation and slope filtration. |
| F.6 logarithmic horizontal sections | ∇e₂=e₁ du/u | e₂−log(u)e₁ is horizontal; e₂ alone has derivative e₁du/u. | Retain logarithmic extension and sign. |
| F.6 embedded differential lattice | V=ℚ_p(r) | Generator t⁻ʳ gives φ=p⁻ʳ; WD arithmetic Frobenius is pʳ under the stated conversion. | Retain covariant period convention and Frobenius inversion. |
| F.6 semistable WD realization | Tate curve; ramified extension of index 2 | N≠0,N²=0. With e=2 and N_K=5, N_p=5/2; after index-2 extension N_{K′}=10 but N_p remains 5/2. | Retain absolute N_p and arithmetic relation. |
| F.6 filtered descent | Rank-one object over a finite descent field | Descended rank stays 1, not [E:K]; filtration is on K-scalars while crystalline Frobenius is on K₀-scalars. | Retain scalar fields and descent action. |
| 7.15 epsilon/Gamma normalization | Integers 3,−1,−2; Tate lines | Γ*(3)=2, Γ*(−1)=−1, Γ*(−2)=1/2; Γ-factors for ℚ_p(−2) and ℚ_p(3) multiply to 1. | Retain reciprocal and sign conventions. |
| 7.16 finite/Greenberg complexes | Tate curve; ℚ_p(1) | For Tate curve φ_cris=p⁻¹ gives B1 factor (1−p⁻¹)²≠0 while the C1 test fails; for ℚ_p(1), H¹ dimension 2 versus finite part dimension 1. | Retain distinct B/C conditions. |
| 7.17 cyclotomic height | Rank zero; rank-one zero Bockstein; shifted torsion complex | Empty determinant=1; rank-one zero determinant=0 and fails semisimplicity. Moving R/T from degree 2 by a shift changes order −1 to +1. | Retain height nondegeneracy and correct shift. |
| 7.18 critical-motive interpolation | Two copies with Γ-factor 1/6; height scalar 7, arithmetic scalar 11 | Inverse Γ-factor for two copies=36, not 6; shifted height contribution gives −77 in the stated two-term convention. | Retain determinant multiplicities and shifts. |
| 7.19 Fitting orders | M₂(ℤ₃); ℚ_p[C_p]; ℤ_p[[T]] | Reduced norm is det; rational C_p group algebra is semisimple even when p divides group order; ℤ_p[[T]] has dimension 2, not DVR dimension 1. | Retain order/base hypotheses. |
| 7.20 integrality/denominator ideals | Commutative order; ℤ₃[S₃] | Commutative case has H=I=R; the S₃ example has reduced-norm element N/3 outside the integral centre. | Retain denominator correction. |
| 7.21 maximal noncommutative Fitting invariant | Presentation minors with determinants 15,24; zero module | Generated ideal (15,24)=3ℤ₃, not ℤ₃; zero module has unit maximal Fitting invariant. | Retain maximal presentation-independent invariant. |
| 7.22 characteristic/Fitting comparison | R/T | Fitting ideal=(T); characteristic element in the inverse convention is T⁻¹. | Retain boundary-sign conversion. |
| 7.23 annihilation | ℤ_p/pⁿ; S₃ at p=3 | Fitt=Ann=(pⁿ); multiplying the nonintegral N/3 by denominator 3 gives integral N. | Retain denominator ideal in annihilation. |
| 7.24 exceptional factor | E(T)=−T, g(0)=a≠0; g=Tu | Product has order 1, leading coefficient −a; second case order 2, leading coefficient −u(0). | Retain exceptional order as well as leading scalar. |

There are 163 computed rows above. The tests do not prove the conditional main conjectures. The source-proof basis issue has the additional concrete witness I=⟨e₁+e₂,Te₂⟩⊂R² over a DVR: TR²⊂I, neither e₁ nor e₂ belongs to I, but I≠TR². Choosing a basis adapted to I/TR² repairs that step and retains the semisimple two-term theorem.

## Not verifiable

The bibliography availability inventory is 55 readable works, 12 uncertified works and 10 unreadable works, counting the previous inventory by lifetime source key and the additional retrieval attempts. Availability does not certify every passage in these works. All fifteen seeded targets were checked against the readable passages listed above. Lim's published p.343 and RW5's published pagination were not certified from their retrieved preprints; the available preprint theorem/proposition locators were used instead.

The ten unreadable texts and attempts are preserved together in the scratch needs-references file. No manifest or roadmap file was changed, and the review is not parked on them:

| Source | Needed passage | Legal places tried / limitation |
|---|---|---|
| yager | Two-variable interpolation and Coleman map, pp.411–449 | DOI/JSTOR landing page and official Annals page; no readable article returned. R03 can be repaired only by specifying, not guessing, the formula. |
| rubin-euler-systems | III.2–III.3, pp.35–40 | Publisher DOI and Rubin's hosted manuscript; the latter request returned no result before termination. The new Euler-system proof route is not text-certified here. |
| cartan-eilenberg | Chapter XIII | Sources-service title search; no legal text retrieved. |
| kedlaya-differential-equations | Proposition 19.1.5, Corollary 19.1.6, pp.315–316 | Sources-service title search; no legal text retrieved. |
| rw4 | Proposition 9 | Title search and DOI at International Press; landing page only. |
| coates-sujatha-2000 | Galois-cohomology finiteness used in §4.3 | TIFR/Narosa title search; no text retrieved. The explicit Lie-algebra route was checked separately. |
| wiles | Theorems 1.3–1.4, totally real main conjecture | DOI/JSTOR landing page; no article returned. The named IntegralIwasawaTheory contract is distinct evidence, not a reading of Wiles. |
| platonov-rapinchuk-rapinchuk | §1.4.3, p.33, Theorem 1.23, p.34 | Cambridge DOI landing page; no book text returned. |
| hida-1988 | §§1–3 | Institutional Heidelberg copy attempted through the sources service; request timed out. |
| bourbaki | Commutative Algebra VII.4.8, Proposition 18 | Sources-service title search; no legal text retrieved. |

The twelve settled uncertified works are schneider, deligne-constantes, berger-differential, deligne-ribet, nsw, ribes-zalesskii, wiles-1988, serre-cohomological-dimension, rubin-1991, de-shalit, coates-sujatha-1999 and rw3. Their cited locators remain uncertified, and they were not re-added as missing requests. RW5 and RW8 now have legal readable copies; the initial RW5 title-search result was a different paper and was discarded before relying on it.

Ownership against the open receiver roadmaps PadicHodgeTheory, PhiGammaModulesAndIwasawaCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology and NeronModelsAndSemistableAbelianVarieties was not checked: their heads were not among the supplied sibling files and they are absent from this main checkout. Search-index mentions do not certify their contracts. This limitation is not reported as a missing supplier: F.6 names them as consumers. Likewise, no assertion of a globally exhaustive absence of competing work follows from a capped search.

## Source issues

- **Misprint** in cfksv at Lemma 4.3, printed p.188: the source says the first two powers in the inverse polynomial are both n−1; it should be n−1 followed by n−2; affects the proof.
- **Error** in kakde at Lemma 118, arXiv v3 printed p.87: the source says the auxiliary subgroup index is always |H̃|i_P; it should be (|H̃|/|P′|)|⟨h⟩|i_P², which still satisfies the required bound; affects the proof.
- **Gap** in burns-venjakob at Lemma 3.9, arXiv v2 printed p.12: the source says coordinatewise membership in an arbitrary basis determines the image diagonal; it should be preceded by a basis choice adapted to the image modulo T; affects the proof.
- **Gap** in burns-venjakob after equation (19), arXiv v2 printed p.24: the source says the p-adic logarithm factorization induces an isomorphism; it should require Leopoldt's nonvanishing regulator condition before asserting invertibility and dividing by its determinant; affects a stated result.
