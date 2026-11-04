# Review of NoncommutativeAndEquivariantIwasawa (pull request #1307 at 625faa1)

**Verdict:** needs changes

## R01 (P2) — Retain total evenness in the Artin interpolation construction

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:3303`, §6.26a: “for every totally real `F`, finite set `S` as above and `χ∈R_p(Gal(F̄/F))` with open kernel”.

**Claim:** Greenberg's construction gives the indicated multiplicative meromorphic interpolation for every virtual finite-image character of the absolute Galois group of a totally real base.

**Witness:** Take F=ℚ, p=3, χ the odd quadratic character modulo 3. B₂(1/3)=B₂(2/3)=−1/18, hence L(−1,χ)=0. All even-r interpolation values vanish; a multiplicative inverse for −χ cannot exist.

Even positive integers are dense in ℤ₃. Thus the claimed analytic/meromorphic function for χ must be identically zero. The representation-ring identity χ+(−χ)=0 would require L_p(χ)L_p(−χ)=L_p(0)=1, which is impossible. This is a defect in the explicitly quantified absolute-Galois construction; the earlier restriction to characters of the totally real extension K/k would have avoided it.

Greenberg imposes that the field cut out by the character is totally real: `greenberg-artin line 145` and `greenberg-artin line 163`, §2, printed pp.80–81. His character-addition law is multiplication of functions (`greenberg-artin line 174`).

**Repair:** Define this construction on the virtual-character group of the maximal totally real quotient, equivalently on combinations of totally even actual Artin characters. State the law explicitly as L_p(χ+ψ)=L_p(χ)L_p(ψ). Retain the full nonabelian Brauer-induction construction on that domain. For virtual characters, formulate interpolation at regular points (or as a meromorphic identity), rather than assuming every specialization is a scalar.

**Retest:** χ above has χ(c)=−1 and is excluded by the repaired domain; every character of the fixed totally real K/k is still admitted. For the admitted trivial character at p=3,r=2,S={∞,3}, the value is (1−3)ζ(−1)=1/6, so its negative has value 6 and their product is 1. At S={∞,3,7},r=1, the positive trivial character has value (1−ω⁻¹(7))L(0,ω⁻¹)=0·(1/3)=0; the negative character has a pole, explaining the regular-point qualification. Add these as negative and positive Checks.

## Verified sound

This is an AI-assisted review. I read the normative README and CONTRIBUTING, the complete target README and Lean file, the previous review and the 151-line repair diff. I used the main-branch PadicMeasuresIwasawaAlgebras, LFunctions and ClassicalArithmeticCompletion roadmaps for shape and ownership comparisons. The requested head matches, the outside-folder diff is empty, and no pull-request file was changed. There is one repairable blocking finding, P2; no P1 or P3 finding is reported.

The previous three findings were checked individually before the full pass:

| Previous finding | Passage at this head | Disposition and witness |
|---|---|---|
| R01: supplier cycle through AdelicImagesAndModularCurves | README:13: “the closed matrix-subgroup Lie algebra and openness criterion (§0.13a), and the local non-CM and CM elliptic image theorems (§4.0)” | Partly repaired across the two roadmaps; repaired in this folder: the common prefix is owned here and the outgoing Adelic supplier edge is gone. The independent graph has zero problems. The later Adelic text still needs the consumer-side ownership adjustment described below. |
| R02: duplicate Dedekind continuation/residue | README:74: “Consume `dedekindZetaC`”; README:124: “transport this equality after multiplication” | Repaired. LFunctions' named germ, uniqueness and residue contracts are imported. For ℚ, residue 1 becomes 4/5 after deleting 5 on both sides. The actual supplier heading is Layer 3; the previous review's Layer 4 label was inaccurate. |
| R03: unspecified CM measure normalization | README §4.3: “a Néron differential `ω` for `E`”; “The full ray-class Coleman map is injective with image `J`”; “the normalized value … is 1” | Repaired. The displayed Katz equation, periods, Gauss/Euler factors, Coleman source and target, completed coefficient ring and ideal contraction distinguish ν from 2ν. Their ideals agree at p=5; their normalized nonzero moments are 1 and 2. |

The worker gate at this head passes all counters, including build, depcheck, outside-folder, stray-files, sorry-data, imports, undeclared README names and set_option. Independent dependency checking returned exactly:

```text
depcheck: 205 roadmaps, 1641 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. I checked the Needs lines against the stated local order, including F.1 → 0.10 → F.2 → 0.13 → 0.13a → 0.11 → 0.12, and the separation of the off-route §§6.23, 6.25a, 6.26 from the main-conjecture route. No declared supplier gaps are present. The citation resolver reported no unresolved roadmap citations or names; its output explicitly did not certify the pinned libraries, so the pin checks below were performed separately.

Independent `lake env lean` elaboration of Suggested.lean succeeded with exactly seven sorry warnings. A scratch copy with `#check @name` for all 13 declarations also elaborated. All seven theorem types retain their needed prime/profinite/coefficient hypotheses. The canonical and saturated Ore statements retain closed normal H and a topological multiplicative quotient equivalence with ℤ_p; the elliptic statements retain a number field, actual Tate module, basis and the geometric-endomorphism hypotheses. The CM statement additionally retains commutation with every geometric endomorphism.

The two definitions flagged for lost binders, canonicalSet and saturatedSet, have real bodies that make sense on the more general completed-group-algebra carrier. Compactness, Hausdorffness, total disconnectedness and the coefficient DVR conditions are explicitly retained where their Ore theorems use them. No signature change is required. The dimension definition's Nat.log is interpreted as dimension only on a uniform group; no claim identifies its junk values with dimensions of arbitrary groups.

Each of the seven sorried theorems was tried with the one-tactic candidates simp, rfl, infer_instance and assumption in a scratch copy. None closed. Object searches at the pins did not locate a single library result giving any of their full conclusions. The six real definitions support the seven substantive theorems; no padding, sorry'd data, free Prop stand-in, set_option or computational algorithm was identified.

The explicit end-theorem inventory is §§1.7, 2.15, 3.6, 6.15, 6.30, 6.34, 6.36, 7.13, 7.14 and 7.18. Further deep targets are §§0.4, 0.11, 0.12, 1.10 and 4.0, the normalized CM comparison §4.3, conditional §6.35, and annihilation §7.23. The seven statable locality/global-dimension/Ore/local-image theorems are present. The module docstring names the missing K₁, relative K₀, Picard determinant, characteristic-evaluation, arithmetic-complex, congruence, zeta, period/Bockstein and noncommutative Fitting carriers for the remaining headlines. No weakened substitute was found. The GL₂, Stark, global zeta and local epsilon conjectures are explicitly distinguished from proved targets.

Pinned checks used Mathlib 6b7abb3 and Tau Ceti a91d3aa. The following 16 inventory entries were opened or their declarations and enclosing hypotheses inspected at those pins:

| Pinned file and line | Declaration and mathematical scope |
|---|---|
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68` | IsProP quantifies over open-normal quotients. It does not include compactness or Hausdorffness. |
| `TauCeti/Topology/Algebra/Group/Generation.lean:73` | IsTopologicallyFinitelyGenerated uses a finite set with dense generated subgroup. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | completedGroupAlgebra is the compatible-family inverse limit, without analyticity built into its carrier. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Map.lean:92` | completedGroupAlgebra.map uses a continuous group homomorphism. |
| `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean:265` | projectiveDimension has codomain WithBot ℕ∞. Zero-object bottom does not replace the supremum over all modules. |
| `Mathlib/RingTheory/OreLocalization/OreSet.lean:50` | OreSet requires cancellation and a left common-denominator law; S.op supplies the right-sided assertion. |
| `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean:330` | of_mul_of retains the factor-set scalar over a commutative semiring. |
| `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean:339` | isUnit_of uses the inverse carry, not the bare inverse group basis element. |
| `TauCeti/RingTheory/FittingIdeal/Basic.lean:343` | fittingIdeal, with the minors comparison at 349, is the commutative invariant. It is not a noncommutative reduced-norm invariant. |
| `TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean:58` | nonempty_linearEquiv_of_projective_of_tensorRat requires finite projective modules, not arbitrary lattices. |
| `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49` | dedekindZeta, its residue constant at 56 and right-hand limit at 77 do not themselves supply the complex continuation. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71` | tateModuleGaloisRepresentation is the actual action on the native Tate module. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:131` | continuous_tateModuleGaloisRepresentation_apply supplies continuity of that action. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52` | det_tateModuleGaloisRepresentation uses a separably closed extension and nonzero prime in that field. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Ring.lean:98` | The point-map additive/ring structure supplies actual endomorphisms, rather than arbitrary matrices standing for them. |
| `TauCeti/RepresentationTheory/Induction/Monomial.lean:81` | exists_character_eq_indClassFun_of_isNilpotent and the representation version at 129 retain algebraic closedness, characteristic zero and finite nilpotent G. |

The ownership search used the roadmap service, main, the supplied sibling heads and board package files, by objects including completed and twisted group algebras, relative triples, determinants, Akashi series, local elliptic images, Katz measures, Bocksteins, Robba rings and Fitting invariants. A focused namespace/theorem search returned only this folder for its newly declared names; capped broad searches were not used to infer absence.

The moved closed-matrix and local elliptic-image prefix belongs here because importing the later Adelic construction recreated the previously witnessed cycle. Its statements cover every prime and both CM and non-CM cases. This records the ownership move required by the previous repair, rather than introducing a later supplier. At the supplied Adelic head, `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1222` still claims the local matrix theory and §4.2 still constructs local non-CM openness. That consumer has not yet adopted the move. This review does not claim that its source file already imports the prefix, and does not request an out-of-folder edit in this package.

The following supplier groups were resolved against main for existing roadmaps and the available heads for new roadmaps. Locations refer to their README files; the section statements, not search-name matches alone, were compared:

| Supplier | Resolved contract and representative location |
|---|---|
| LFunctions | Layer 3, `TauCetiRoadmap/LFunctions/README.md:795`–824: continued Dedekind function, germ uniqueness and the residue comparison. |
| AlgebraicKTheory | §§2.2, 3.2–3.3, `TauCetiRoadmap/AlgebraicKTheory/README.md:298`, 355, 372: automorphisms, relative triples and boundary. Fullness is needed for the stronger stable-isomorphism criterion, not the claimed K₀ exactness. Balanced tensors are consumed through its forwarding contract to ClassicalArithmeticCompletion §7.8. |
| GeneralAlgebraicKTheory | §§3.14, 4.6, 4.16–4.17, 5.7, 5.11, 6.3, 6.9, 6.19, 8.1, 8.7, 10.6; representative lines 645, 899, 915, 1408, 1696, 2197. The inverse-transpose/inversion adapters preserve the unit K₁ class; exactness at K₁ does not assume fullness. |
| PadicMeasuresIwasawaAlgebras | §§1.7, 3.1–3.3, 4.2, 4.6, 5.1–5.2 at 909, 982, 1978, 2058, 2124, 2409, 2710, 3172, 3367. Finite-free coefficient comparison includes ramification; its determinant is commutative. |
| ProfiniteProPGroups / ProfiniteArithmetic | Completed roadmaps, Layer 9 prerequisites at 1721–1806 and the lower-p-series/padicPow contracts respectively. The latter's lines 18–19 and 83–85 point to the native power and lower-series objects; no new power operation is claimed here. |
| ProfiniteCohomology / ClassFieldTheory | Cohomology Layers 5–8, 10–12 at 960, 1060, 1168, 1265, 1549, 1739, 2091; class-field Layer 5 and Layers 10–13 at 920, 1552, 1683, 1724, 1799. F.2–F.4 supply the stated compact/noncommutative extensions. |
| DerivedModuleAlgebra | §§0.2, 1.T.1, 1.1.1, 1.E.0 at 626, 1403, 1666, 2049: derived operations, inverse systems and associative-ring perfectness. Commutative internal Hom is not substituted for a general noncommutative tensor. |
| IntegralIwasawaTheory | §§2.0, 2.2, 2.4–2.6, 4.1, 6.0–6.3, 7.1–7.3, 8.3, 9.3, 9.7, 10.0–10.2, 11.2, 11.5, 12.1; representative lines 274, 308, 381, 705, 760, 1019, 1145, 1275, 1304, 1463, 1525, 1587. The noncommutative extension and Hyp_p^T extension are distinguished from supplied abelian/all-layer torsion-free results. |
| ClassicalArithmeticCompletion | Main forwarding contracts at 263–273, local-constant adapters §§7.13, 7.30; finite logarithm/norm/descent §§7.10, 7.14, 7.21, 7.27, 7.46–7.47, 7.60, 7.62–7.63, 7.73, 7.80, 7.101, 7.109. These forward the arithmetic function theory and own finite group-ring inputs, not the completed Iwasawa logarithm. |
| RepresentationTheory/InductionRestriction and SemisimpleAlgebras | InductionRestriction Layers 5–6 (Clifford and Artin/Brauer), including its native-declaration inventory at 183–184; SemisimpleAlgebras' opening contract distinguishes existing Wedderburn existence from assembly APIs. |
| IntegralHeckeAndGaloisDeterminants | §0.6, reduced norm at 1072; ordinary Hilbert theory §2.3 at 2904. Reduced norm is descended matrix determinant, not the determinant of the regular representation. |
| PadicPeriodRings | §§1.5, 4.1–4.3 at 216, 416, 448, 469. The fundamental exact sequence supplies underlying exactness; finite-field continuous sections/connecting maps belong to this consumer. |
| SmoothRepresentationsOfLocalGroups | SR.5.2 raw WD at 4432, operations at 4518 and Frobenius semisimplification at 4624. Arithmetic Frobenius has degree one; the relation is r(w)Nr(w)⁻¹=q^{deg w}N. |
| ImaginaryQuadraticClassNumber / PerfectoidSpaces | H3.1–H3.2 at 83–98 supply CM reciprocity and Siegel functions; P3.8 at 8478 supplies the field tilt/Galois comparison. |
| HilbertModularForms / PeriodsAndSpecialValues | Receiver passages at Hilbert lines 61–66, 99–107 and Periods line 178 import F.5 and §2.7 here. They are consumers, not an upward supply for these constructions. |

The new one-prime/two-variable rational-CM unit tower is distinguished from the ring-class elliptic-unit application in EllipticCurvePeriodsAndModularParametrizations. Likewise the shared finite Selmer carrier and ordinary Hilbert carrier are imported before their specified extensions. The README retains APIs, discriminating Checks, Examples and Dependencies; the seven Lean targets agree in coefficient generality with the prose. The zero ring, equal-characteristic coefficient DVRs, non-Hausdorff/noncompact ambient groups and p=2 on the odd logarithmic branch are excluded by explicit hypotheses, not by silently chosen examples.

The seeded sample has 15 targets. No README locator is explicitly marked unverified. Source certification below concerns the stated passage and its hypotheses, not a proof of every planned extension:

| Target | Read text, locator and comparison |
|---|---|
| 3.4 Akashi | `cfksv line 311` and 558–601, Lemma 3.1 p.171, (37)–(40) pp.177–178: bounded alternating product, torsion homology and coefficient norm. The roadmap retains no-p-torsion/boundedness. |
| 3.12 total quotient | `kakde line 1382`–1420, Lemma 37 proof pp.31–32; `nickel line 321`–339, Example 2.7 pp.7–8: central finite-dimensional semisimple total quotient, not the canonical localization or merely p-inversion. |
| 4.5 dual complex | `kakde line 437`–465, §2.3 p.11: degrees −1,0, perfection and derived base change. `witte-noncommutative line 257`–284 and 342–364, Definition 3.1/Proposition 3.2 pp.6–7 and Proposition 3.7 p.8, support the adic inverse-limit route. No finite global dimension is assumed. |
| 5.2 GL₂ conjecture | `cfksv line 1630`–1641, Conjecture 5.8 p.204: conditional formulation and equality modulo integral K₁, not an unconditional existence theorem. |
| 6.9 additive maps | `kakde line 1600`–1770, Definitions 55–57, Theorem 58, Lemmas 60/62 pp.37–40: generator projection, trace, conjugation and trace-ideal conditions. The η₁ and strict-inclusion corrections are necessary. |
| 6.16 injectivity | `kakde line 2917`–2919, Corollary 90 p.65: conclusion is stated; the printed corollary supplies no expanded general-group/coefficient argument. The roadmap states those reductions separately and does not use the main conjecture to prove its prerequisite. |
| 6.19 partial ζ and Δ | `kakde line 3055`–3094, §6.3 (15)–(16), pp.69–70: truncated values and smoothed difference, with translated test function and norm factor. |
| 6.26 auxiliary extension | `kakde line 3870`–3907, §6.13.1 and Lemma 118, pp.86–87: enlargement and trace-ideal bound. The intermediate equality at 3904 is false; the roadmap's corrected factor still gives the required divisibility. |
| 6.26a completed logarithm | `ritter-weiss-2011 line 120`–184, D1/Remark B pp.4–5; 750–799 Lemma h p.19; 920–1052 Lemmas i–k pp.22–25: completed determinant, relative logarithm, torsion correction and restriction. `greenberg-artin line 143`–175, §2 pp.80–81, supplies R01's missing total-evenness condition. RW II's Theorem 8/Proposition 11 remain uncertified. |
| 6.34 Kakde main theorem | `kakde line 524`–541, Theorem 11 p.13: odd p, admissible totally real tower, μ=0, boundary sign and uniqueness in K′₁. |
| 6.36 abelian minus | `gambheera-popescu line 213`–230 and 1625–1668, Hyp_p^T and Theorems 6.28/6.30 pp.33–34; 1793–1810, Proposition 7.10 p.37: Fitting identity and square presentation without μ=0, with a distinct μ-dependent Tate-module comparison. |
| 7.10 Tate descent | `burns-venjakob line 893`–1015, Lemma 5.1 pp.21–24: actual representation, field/local disjointness, Leopoldt, Bockstein/logarithm and multiplicity. The roadmap separates the finite Teichmüller factor and does not assign a representation space to a negative virtual character. |
| 7.15 epsilon | `burns-venjakob line 1180`–1230, §6.1/Conjecture 6.1 pp.28–29; `loeffler-venjakob-zerbes line 187`–277, Propositions 2.3.2–2.3.4 and §2.4 pp.4–6: inverse crystalline/arithmetic Frobenius, Gauss sum, reciprocal Gamma factor, period power and determinant target. |
| 7.17 height | `burns-venjakob line 1327`–1397, Propositions 6.4/6.6 pp.31–33; `nekovar line 13565`–13603 and 13850–13857, §§11.2.8–11.3.1 pp.363–364 and Theorem 11.3.9 p.370: Bockstein convention, duality, nondegeneracy and classical-height hypotheses. The unshifted rank is −h. |
| 7.21 maximal Fitting | `nickel line 391`–478, Example 2.11, Theorem 2.13, Definition 2.14/Lemma 2.17 pp.9–11: presentation dependence, maximal invariant and epimorphism monotonicity. `nickel line 655`–664 supports the separate denominator-corrected annihilation target. |

For the repaired CM construction I additionally read `bouganis-venjakob-cm line 208`–243 and 269–328 (Theorem 2.3, Corollary 2.5, Theorem 2.7, pp.6–9), and `agboola-howard line 625`–657, 849–910 (Theorems 2.1.1, 2.2.1 and Coleman image J, pp.1016–1023). They fix periods, primitive/depleted factors and the completed coefficient setting. The local-image source was checked at `serre-images line 1619`–1643 and 1697–1736, Theorems 3 and 5 and their corollaries, printed pp.299–302, with the OCR limitation below.

The adversarial table uses R=O[[T]], Γ=ℤ_p and C_f=[R —f→ R] in degrees −1,0. “Retain” means these computed instances do not refute the target; it does not turn a conjecture into a theorem. The table retains the 15 sampled targets, the headline inventory, and controls supporting the finding, prior repairs and source issues.


| Statement | Instances tried | Values on the compared sides | Result / change |
|---|---|---|---|
| Conventions; F.0 relative boundary | C_T; its shift; ℤ→𝔽₅ | [C_T]=[R/T], ch(C_T)=T⁻¹, ∂ch=−[R/T]; shifting negates both classes. δ(2)≠0, δ(4)=0 in C₂. | ∂=−δ. |
| Dedekind germ comparison | ℚ, then delete ℓ=5 | Res ζ=1; deleted residue=4/5 for the supplied Artin germ and LFunctions' continuation. | Repaired: import and transport the existing theorem. |
| 0.4 radicals/locality, Lean iwasawa_isLocal_iff_pro_p | G=1, C_p, C₂ with odd p | O local; k[C_p]=k[ε]/ε^p has radical (ε); O[C₂]=O×O has two maximal ideals. Locality truth values true,true,false match pro-p. | all-profinite criterion. |
| 0.11 Brumer; Lean brumer_gldim | G=1, ℤ_p, C_p | Integral/residual dimensions 1/0, 2/1, ∞/∞ respectively; d+1/d gives 1/0,2/1 only in the admitted cases. | no-p-torsion. Left/right agree in these controls. |
| 0.12 rational dimension; Lean rationalIwasawa_gldim | G=1, C_p, ℤ_p | Fraction-field scalar extensions have dimensions 0,0,1. ℚ_p[C_p] is semisimple despite integral p-torsion; Frac(O[[T]]) would instead have dimension 0. | bounded-denominator scalar extension, with p-torsion allowed. |
| 0.13a closed matrix Lie algebra/openness | Diagonal torus, SL₂, GL₂; 1+5M₂(ℤ₅) | Lie dimensions 2,3,4; only dimension 4 gives openness in GL₂. The congruence subgroup reduces to 1 modulo 5 but has Lie algebra gl₂. | full Lie criterion; mod-p surjectivity is not required. |
| 1.7 canonical Ore theorem; Lean canonicalSet_oreSet | Γ; C_p×Γ, central T | In the commutative control choose t=s,w=r, giving tr=ws=sr. T is regular even in O[C_p][[T]]. | both Ore sides; no blanket no-p-torsion condition. |
| 1.10 saturatedSet; Lean saturatedSet_oreSet | O=ℤ_p; π²=p | In one variable S* contains every nonzero element for O=ℤ_p. For ramified O, π is not pⁿs with s∈S, but π becomes invertible after inverting p. | equality of localizations, not equality of p- and π-saturated sets. |
| 2.15 boundary with p-torsion | C_T over O[C_p][[T]] | Perfect C_T has boundary ∂T=[coker T] even though k[C_p]-modules can have infinite projective dimension. | perfect-complex model; do not demand regularity. |
| 3.4 Akashi series | k[[X,Y]], H generated by X | H₀=k[[Y]], higher homology 0; over ℤ_p[[Y]] its characteristic factor is p. | integral coefficient factor. |
| 3.6 Euler characteristic formula | R/(T−p); finite k; ramification degree 2 | First: H₀=k,H₁=0, χ=p and f(0)=−p gives inverse p-adic size p. Finite k: H₀=H₁=k, χ=1. A uniformizer π gives absolute-value exponent 2 when [K:ℚ_p]=2. | coefficient norm and finiteness of both homology groups. |
| 3.12 total quotient | C₂×Γ, p odd | Quotient algebra F×F has two idempotent components, not one field. | semisimple algebra. |
| 4.0 non-CM openness; Lean elliptic_nonCM_openImage | Non-CM elliptic curve over a number field; primes 2 and 3 | Geometric endomorphism ring ℤ; local Lie dimension 4 and finite index in GL₂(ℤ_p). The CM control has dimension 2, hence is not open in GL₂. | every prime and non-CM hypothesis. |
| 4.0 CM openness; Lean elliptic_CM_openImage | y²=x³−x over ℚ(i); p=5 split and p=3 inert | Cartan dimension 2 in both cases: diagonal algebra ℚ₅² versus field ℚ₃(i). Over ℚ complex conjugation sends i to −i and does not commute with it. | openness in the centralizer and hDefined; no good-prime restriction. |
| 4.3 two-variable CM measure | μ and 2μ at p=5 | Ideals (μ)=(2μ), quotient modules equal, μ-invariants equal; normalized nonzero values have ratios 1 and 2. | Repaired: the exact interpolation equation now excludes the rescaling. |
| 4.3 Coleman image and coefficient descent | J=(S−a,T−b); ideals (5),(S) under unramified completion | Quotient by J has codimension 2 and characteristic ideal (1); quotient by (S) has divisor (S). Extension/contraction returns (5),(S), with μ=1,0. | image J and descent of ideals, not an assumed scalar retraction. |
| 4.3 periods, Gauss sum and unit exponents | k=4,j=0; quartic η modulo 5; levels (1+i),(1+i)(3) | Factorial 6, i⁴=1; changing ζ to ζ⁻¹ multiplies the Gauss sum by η(−1)=−1. Root-of-unity counts 4,1 give exponent 4. | fixed periods and inverse-root convention. |
| 4.5 dual Galois complex | H⁻¹=X_Σ,H⁰=ℤ_p; C_p×Γ | [C]=[ℤ_p]−[X_Σ], ∂ζ=[X_Σ]−[ℤ_p]; p-torsion does not prevent a perfect complex model. | shift and perfectness at complex level. |
| 5.2 GL₂ main conjecture | ξ versus uξ | Same boundary/coset; evaluations differ by uⁿ with p-adic absolute value 1. | quotient by integral K₁, not literal equality. |
| 6.9 additive congruences | C_p; identity and nonidentity classes | β at trivial subgroup multiplies identity coefficient by p; cyclic component retains the nonidentity class. Double-counting would give p² instead of p. | η₁=id and correct multiplicities. |
| 6.15 K′₁ congruence theorem | G=Γ; product coefficient algebra | θ is identity on the abelian unit group; each coefficient component has its own units and retained abelianized-group factor. | K′₁, not an unjustified K₁ isomorphism. |
| 6.16 coefficient descent | O=ℤ₅[ζ₃] | O⊗ℤ₅O≅O×O, rank 4 over ℤ₅; it is not the matrix algebra M₂(O), rank 8. | étale product descent. |
| 6.19 Δ-values | ε=0; smoothing element u=1; ℚ,p=3,k=2 | Δ=0 in the first two cases; unsmoothed truncated special value is 1/6. | smoothing factor in the defining difference. |
| 6.24 Möbius divisibility | C₃² and coefficient 2 | 2⁹−4·2³+3·2=486=54·9. | the full subgroup lattice. |
| 6.26 auxiliary trace bound | H̃=C₉, G=C₉, P=⟨(a,b³)⟩ | i_P=1, card(P)=9, card(⟨b³⟩)=3: intermediate scalar 9·3/9=3, not 9. Required p·i_P²=3 still holds. | corrected index calculation. |
| 6.26a Artin interpolation domain | ℚ,p=3, odd χ mod 3 and −χ | B₂(1/3)=B₂(2/3)=−1/18; L(−1,χ)=0 and all even-r values vanish. Multiplicativity would require 0·L_p(−χ)=1. | R01: require totally even characters. |
| 6.26a virtual interpolation at an endpoint | Totally even −1; S={∞,3,7}, r=1 and 2 | At r=1 positive-character value 0·(1/3)=0, so its inverse has a pole. At r=2 value −1 and inverse −1, product 1. | R01: retain regular-point/meromorphic qualification. |
| 6.26a relative logarithm and torsion | Abelian G; commutator unit; scalar root ζ≠1 | Abelian relative ideal a=0 gives map 1→0. A commutator has Det=1; a scalar ζ survives abelianization and fails the relative condition. | the relative ideal, not full determinant torsion-freeness. |
| 6.26a cyclotomic reductions | Twist by ω² at p>3; coefficient p⁻¹ | ω² is not the trivial character; p⁻¹ becomes integral only after multiplying by p. | finite Teichmüller and denominator factors. |
| 6.30 Ritter–Weiss main theorem | Abelian Γ, μ=0 | Boundary and interpolation reduce to the normalized abelian element; multiplying by a unit preserves boundary but changes values. | both conditions and μ=0; no unconditional extrapolation. |
| 6.34 Kakde main theorem | Cyclotomic Γ under odd p, μ=0 | ∂ζ=[X_Σ]−[ℤ_p]; normalized abelian specialization has exactly the prescribed values. | odd p and μ-zero assumptions. |
| 6.35 conditional uniqueness | Cyclic degree-3 case | For the abelian C₃ control, SK₁(ℚ₃[C₃])=1, so the determinant kernel has size 1; the general theorem retains its separate vanishing hypothesis. | the conditional theorem, not unconditional SK₁ vanishing. |
| 6.36 abelian minus theorem | C₃ character and dual; ℚ(ζ₃), p=3 without smoothing | χ(g)=ζ₃, χ∨(g)=ζ₃⁻¹; an unsmoothed value can be 1/3, not integral. | dual and smoothing hypotheses; do not infer all-prime integrality without them. |
| 7.10 Tate descent | ℚ, trivial representation; two copies | Bockstein scalar=−log_p(u)/c_γ; two copies square the determinant and double the order. A virtual negative copy is not a representation space. | multiplicities and representation domain. |
| 7.13 Tate leading interpolation | Formal nonzero values c=5, log=7, L=11 | B=−7/5, inverse characteristic trivialization=−5/7; ζ-leading scalar 77 and sign −1 yield 55, then divide by c to get 11. | signs and period factor. |
| 7.14 rational-character induction | C₃ at p=7 | Individual χ takes ζ₃-values and is not ℚ-valued; χ+χ̄=regular−1 is rational. | rationality hypothesis of this theorem. |
| 7.15 epsilon/Gamma normalization | Integers 3,−1,−2; Tate lines | Γ*(3)=2, Γ*(−1)=−1, Γ*(−2)=1/2; Γ-factors for ℚ_p(−2) and ℚ_p(3) multiply to 1. | reciprocal and sign conventions. |
| 7.17 cyclotomic height | Rank zero; rank-one zero Bockstein; shifted torsion complex | Empty determinant=1; rank-one zero determinant=0 and fails semisimplicity. Moving R/T from degree 2 by a shift changes order −1 to +1. | height nondegeneracy and correct shift. |
| 7.18 critical-motive interpolation | Two copies with Γ-factor 1/6; height scalar 7, arithmetic scalar 11 | Inverse Γ-factor for two copies=36, not 6; shifted height contribution gives −77 in the stated two-term convention. | determinant multiplicities and shifts. |
| 7.21 maximal noncommutative Fitting invariant | Presentation minors with determinants 15,24; zero module | The exhibited presentation gives (15,24)=3ℤ₃, while its zero cokernel has maximal invariant ℤ₃; hence presentation invariance fails before maximizing. | maximal presentation-independent invariant. |
| 7.23 annihilation | ℤ_p/pⁿ; S₃ at p=3 | Fitt=Ann=(pⁿ); multiplying the nonintegral N/3 by denominator 3 gives integral N. | denominator ideal in annihilation. |

The full pass recorded 171 computed rows; the 41 retained here include the 15 seeded targets, all seven Lean theorem statements, the other headline theorems, and the target affected by R01. Conditional theorem rows test their signs, hypotheses and compatibility; they do not claim numerical verification of a general main conjecture. The nontrivial and degenerate controls were recomputed, including the 486 Möbius sum, the intermediate auxiliary trace multiplier 3 rather than 9, and R01's Bernoulli values.

## Not verifiable

- Ritter–Weiss, *Toward equivariant Iwasawa theory II* (2004), Theorem 8 and Proposition 11: the sources service classified the publisher/DOI access as uncertified; the Augsburg institutional record supplied metadata without article text. I did not certify those locators. The readable 2011 diagram and Greenberg text support the comparisons explicitly identified above, not a claim to have read the 2004 proof.
- Deligne's *Les constantes des équations fonctionnelles des fonctions L*, §5, printed p.548: the legal scan was retrieved, but its extracted equations (5.2)–(5.4) are incomplete. I did not reconstruct the missing formula from OCR. The §7.15 checks instead use the readable Burns–Venjakob and Loeffler–Venjakob–Zerbes formulas.
- Serre's local-image text was available as OCR. The theorem statements, hypotheses and CM corollary at the listed lines are readable; the detailed non-CM proof is not independently text-certified here. The Lean statements and Lie-dimension controls were checked independently.
- Source certification is the passage inventory above. The previous review's unverified textbook and other unsampled proof inputs are not promoted to verified by this review. In particular this report does not claim a new reading of Rubin's monograph, de Shalit's book or the full finite-character nonvanishing proof.
- Ownership against open receiver roadmaps whose files were not supplied—PadicHodgeTheory, PhiGammaModulesAndIwasawaCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology and NeronModelsAndSemistableAbelianVarieties—was not checked. They are named consumers, not missing suppliers. Available sibling heads and board package texts were searched; an index mention alone was not treated as ownership evidence.

No source manifest was edited. The Agboola–Howard retrieval request was resolved from its publisher open archive. The review is complete with the stated limitations and is not parked for missing text.

## Source issues

- **Error** in kakde at Lemma 37 and coefficient convention, arXiv v3 printed p.31: the source says central denominators are the complement of pR even for product coefficient rings; it should be the product of the regular denominator sets of the factors; affects a stated result.
- **Misprint** in kakde at Definition 55, arXiv v3 printed p.37: the source says the order-p character average describes the generator projection for every cyclic subgroup; it should be restricted to nontrivial cyclic subgroups, with η₁ the identity; affects nothing.
- **Misprint** in kakde at Definition 57(A1), arXiv v3 printed p.37: the source says the cyclic-upper-subgroup trace condition forces zero also at equality; it should be imposed only for strict inclusion; affects nothing.
- **Gap** in kakde at Corollary 90, arXiv v3 printed p.65: the source says general compact-group integral-to-localized K′₁ injectivity follows at this point without supplying its reductions; it should include elementary reductions and the inverse-limit argument beyond the dimension-one pro-p case; affects the proof.
- **Error** in kakde at Lemma 118, arXiv v3 printed p.87: the source says the intermediate trace multiplier equals |H̃|i_P; it should be (|H̃|/|P′|)|⟨h⟩|i_P², preserving the claimed divisibility; affects the proof.
- **Misprint** in burns-venjakob at §5.1, arXiv v2 printed p.21: the source says the full cyclotomic character factors through Γ; it should separate its finite Teichmüller part from the principal-unit character on Γ; affects nothing.
- **Misprint** in burns-venjakob at §6.1, arXiv v2 printed p.28: the source says Gamma-star at the negated index equals the Gamma value or residue at the original index; it should use the original index on both sides; affects nothing.
- **Error** in burns-venjakob at Proposition 6.6, arXiv v2 printed p.32: the source says the unshifted Selmer order is the positive Selmer rank; it should be the negative rank, with positive rank belonging to the shifted complex; affects a stated result.
