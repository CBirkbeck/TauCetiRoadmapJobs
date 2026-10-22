<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/175#issuecomment-6331198707 -->
Red team round 1 pass a (codex) of 86b0104

Verdict: needs_changes

1. **F01** (P1) Continuous K-theory is incorrectly identified with connective K

   - **Location:** packages/RefinedTraceMethods/README.md:1867,1870: “Kcont(Mod_R)≃K(Perf(R))”.
   - **Claim:** The continuous extension of nonconnective K agrees with connective K on every module category; line 31 explicitly reserves K for connective K and IK for nonconnective K.
   - **Witness:** Use the ring R=k[x,y]/(xy(1−x−y)) already specified at README.md:1843: IK₋₁(R)=ℤ, whereas connective K₋₁(R)=0. The asserted equivalence fails in degree −1.
   - **Exact repair text:** Replace both occurrences by “Kcont(Mod_R)≃IK(Perf(R)). If R is regular noetherian, the supplied vanishing of negative K-groups also identifies this with K(Perf(R)).”

2. **F02** (P3) Supplier citations use pull-request URLs

   - **Location:** packages/RefinedTraceMethods/README.md:9,11,53,58–59: supplier hyperlinks contain `/pull/1044`, `/pull/894`, `/pull/896`, `/pull/1057`, `/pull/1065`, `/pull/1070`, and `/pull/1064`.
   - **Claim:** These are the permanent supplier references.
   - **Witness:** The URLs themselves contain pull-request numbers; the binding contract requires roadmap names and sections, without pull-request references in the README.
   - **Exact repair text:** Replace every supplier `/pull/<number>` hyperlink by the repository README path for the displayed roadmap name, retaining the named section/target locator. Cite open-roadmap suppliers by name and section in the same form.

3. **F03** (P3) Suggested.lean contains a forbidden catalogue and an undocumented example

   - **Location:** packages/RefinedTraceMethods/Suggested.lean:40,222–268: “Definitions whose carriers require … remain in the README”.
   - **Claim:** The final block enumerates the unimplemented constructions by layer; the identity example has no declaration docstring.
   - **Witness:** Lines 222–268 are a 47-line catalogue without a declaration. The example at line 40 is the only declaration without its own docstring.
   - **Exact repair text:** Delete the catalogue at lines 222–268; keep the carrier limitation in the module docstring. Add before line 40: `/-- The identity additive map of a Cartier structure commutes with both operators. -/`.

4. **F04** (P1) The ordinary trace presentation re-plans the pinned nodal algebra

   - **Location:** packages/RefinedTraceMethods/README.md:3810–3837 and Suggested.lean:166–204: “form P(A,ξ)=A[u,v]/(uv−ξ)”.
   - **Claim:** This package constructs the quotient, scalar and coordinate maps, relation, universal lift and extensionality as new API.
   - **Witness:** TauCeti/RingTheory/Node/Basic.lean:37,51,65,75,97,109,114,133 already supplies `TauCeti.NodeAlgebra`, `mk`, `coord`, `coord_zero_mul_coord_one`, `lift`, its coordinate formulas and `hom_ext`, over arbitrary commutative bases.
   - **Exact repair text:** “Use `TauCeti.NodeAlgebra A ξ` from `TauCeti.RingTheory.Node.Basic`, its `algebraMap`, `coord ξ 0`, `coord ξ 1`, `lift` and `hom_ext`. This target adds the grading and the two Laurent-polynomial specializations.” Delete the duplicate quotient/scalar/coordinate definitions, relation example and universal-lift target; import that individual Tau Ceti module and define the retained comparison maps with real bodies using `NodeAlgebra.lift` on its carrier.

5. **F05** (P3) Statable Checks lack proved Lean mirrors

   - **Location:** packages/RefinedTraceMethods/README.md:1475–1478,3217,3668–3669,3830–3833: `diagonalNumerator.degree_two`, `HighPowered.nineAndSixteen`, and the remaining listed boundary Checks.
   - **Claim:** These Checks test kept definitions, but Suggested.lean mirrors only selected parts.
   - **Witness:** Suggested.lean:40–86 has no zero Cartier/zero-morphism or F=V=id negative test; 117–128 omits degree two; 148–162 omits 9,16,8; 190 only repeats the quotient relation.
   - **Exact repair text:** “Combine the Cartier positive and negative boundary cases into the two permitted examples per definition; add the degree-two polynomial identity to `diagonalNumerator.small`; use one HighPowered example for 1,9,16 and one for rejection of 0,8,32. After adopting NodeAlgebra, test the retained maps at ξ=0 and ξ=1 and with a nonidentity coefficient endomorphism.” Prove these examples without admitted auxiliary data; do not add a third example for a kept definition.

6. **F06** (P2) The DGAInfinity character contract drops properness

   - **Location:** packages/RefinedTraceMethods/README.md:11,54,2095: “the Hattori–Stallings degree-zero character”.
   - **Claim:** DGAInfinity Layer 9 supplies the degree-zero character for all the ordinary algebras/perfect modules used here.
   - **Witness:** TauCetiRoadmap/DGAInfinity/README.md:580–587 constructs Chern characters for proper DG algebras, extending to categories through a specified compact generator. A=k[t] is not proper over k.
   - **Exact repair text:** “DGAInfinity Layer 9 supplies the Hochschild Chern character for proper DG algebras and its specified-generator category extension. The unrestricted ordinary degree-zero Dennis trace is constructed in §4.10 here; on the proper-algebra overlap it agrees with that supplied Chern character.” Apply this qualification also to the comparison at line 2095.

7. **F07** (P1) The finite-coefficient proof lacks its torsion-free base-change bridge

   - **Location:** packages/RefinedTraceMethods/README.md:3675–3683: “The p=2 supplier refinement is an explicit request.”
   - **Claim:** The cited comparisons directly provide the finite-coefficient TC⁻ result for all high-powered m.
   - **Witness:** m=16 qualifies, but R=ℤ/16 fails §6.9's 2-torsion-freeness. mw lines 1304–1322 first lift to ℤ₂{x}∞/x⁴ and prove a completed base-change equivalence. No declared gap records the asserted request.
   - **Exact repair text:** “Before the finite-coefficient comparison, construct for every prime p the compatible quotient tower over C=ℤ_p{x}∞, using even exponents at 2. Prove `(TC⁻((ku_C/xᵃ)/ku) ⊗_{ku_C} ku_p)^∧_(p,t) ≃ TC⁻((ku/pᵃ)/ku)`. Apply §6.9's quasi-regular-quotient theorem to the p-torsion-free C/xᵃ, then compare its completed base change with the supplied finite-coefficient q-Hodge pair. Cite MW 3.4–3.8.” Add this named bridge to `Needs`; remove the unspecified supplier request. Preserve the result at every prime.

8. **F08** (P2) Two internal prerequisites occur after their consumers

   - **Location:** packages/RefinedTraceMethods/README.md:753,3198: `§2.8 (THH relative to THH(ℤ) is Hochschild homology)` and `§6.14 (Étale algebras lift uniquely…)`.
   - **Claim:** The displayed order is a build order for §2.7 and the framed input in §6.10.
   - **Witness:** The consumed targets begin at README.md:795 and 3455 respectively. The second is already used by `SphericalLift.ofEtale` and the framed lift at 3177.
   - **Exact repair text:** Move the relative-Hochschild comparison before the Bökstedt refinement that consumes it. Move the general étale-lifting theorem to §6.1 before `SphericalLift.ofEtale`; leave its number-field application in §6.14. Update all section locators and preserve each theorem's own `Needs` line.

9. **F09** (P3) The graded Beilinson Check omits the weight shift

   - **Location:** packages/RefinedTraceMethods/README.md:4182: “Qₚ[−1] … matching π₁ of the K-theoretic square”.
   - **Claim:** The unshifted weight-one syntomic complex directly has the stated homotopy degree.
   - **Witness:** The convention at README.md:25 gives Hⁱ=π₋ᵢ. Thus Qₚ[−1] has π₋₁=Qₚ; the weight-one spectrum is shifted by [2], as the supplied gr¹TC=ℤₚ(1)[2] specifies at line 59.
   - **Exact repair text:** “The weight-one syntomic fiber is Qₚ[−1], with H¹=Qₚ. After the motivic weight shift [2], its spectrum is Qₚ[1], whose π₁=Qₚ agrees with the K-theoretic fiber.”

10. **F10** (P3) The required source manifest is absent

   - **Location:** packages/RefinedTraceMethods/ (bibliography at README.md:4194–4352).
   - **Claim:** The package contains its citation deliverables.
   - **Witness:** The folder has README.md, Suggested.lean, metadata.toml and review.json, but no sources.toml; the bibliography has 52 entries. Their texts, plus the separately cited NS arXiv version, were legally fetched during this audit.
   - **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1` and one entry for each cited work/version, recording its bibliography fields, actual target locators, cited-for targets, and the source service's provenance, hash, licence class and status. Include both NS versions where both are cited; include no local filesystem paths.

11. **F11** (P3) Stale process labels survive as mathematical references

   - **Location:** packages/RefinedTraceMethods/README.md:586,1401,2258,3435,3679: “LMMT item 49”, “CMM item 033”, “L.4”, “sourceIssues”, “separate HQ.3 request”.
   - **Claim:** These labels identify mathematical inputs or explain the target's scope.
   - **Witness:** The package has no L.4 section or sourceIssues definition. The other phrases describe requests rather than timeless theorem locators; the p=2 request has no declared gap.
   - **Exact repair text:** Delete “used in LMMT item 49”, “requested by CMM item 033” and “sourceIssues”. Replace “L.4” by “§2.14 (TR and genuine TC)”; replace the HQ.3 request by its stated HabiroCohomologyFoundations section contract. Resolve the p=2 text as in R07.

12. **F12** (P1) The p-complete embedding cannot be unital symmetric monoidal into all solid spectra

   - **Location:** packages/RefinedTraceMethods/README.md:2666,2680: “Sp^∧_p → Sp_■ … symmetric monoidal on bounded-below objects”.
   - **Claim:** The embedding preserves the tensor unit of the entire solid category.
   - **Witness:** The source unit is S_p^∧, whose image has π₀ at the point ℤ_p; the solid target unit S has π₀=ℤ. These are unequal even for p=2. w lines 461–462 repeat the same imprecise claim.
   - **Exact repair text:** “The functor is fully faithful into solid spectra and preserves tensor products on bounded-below objects. As a unital symmetric monoidal functor, its codomain is the bounded-below p-complete solid spectra, with unit the condensed p-completion of S. Into all solid spectra it is lax symmetric monoidal, with the completion unit map.” Add this unit comparison as a negative-control Check.

13. **F13** (P2) The Adams homotopy formula includes the wrong degree-zero carrier

   - **Location:** packages/RefinedTraceMethods/README.md:2534,2546: “π_{2i}(BU) ≅ K̃(S^{2i})”.
   - **Claim:** The stated identification and power formula have no restriction on i.
   - **Witness:** At i=0, BU is connected, so π₀BU is a point (the zero group), whereas K̃(S⁰)=ℤ. The degree-zero coefficient is carried by ℤ×BU.
   - **Exact repair text:** “For i≥1, π₂ᵢ(BU)≅K̃(S²ᵢ) and ψᵏ acts by kⁱ. On π₀(ℤ×BU)=ℤ, ψᵏ preserves rank and is the identity.” Carry these ranges into `BU.adams_homotopy` and add the rank-zero/degree-zero Check.

14. **F14** (P2) Arithmetic algebra statements omit commutativity

   - **Location:** packages/RefinedTraceMethods/README.md:3853,3865,3876,3920: “For ordinary perfectoid R-algebra A” and “For ordinary A … W(A)”.
   - **Claim:** The antisymmetrization, exterior algebra, cotangent and Witt formulas apply to ordinary algebras without specifying commutativity, after earlier layers explicitly allow associative algebras.
   - **Witness:** R=𝔽₂ and A=M₂(𝔽₂) give π₀THH(A)=A/[A,A]≅𝔽₂. There is no unital ring map M₂(𝔽₂)→𝔽₂ as demanded by the degree-zero algebra map. Pinned `WittVector` requires a commutative ring.
   - **Exact repair text:** “In §8.3, R is a commutative perfectoid ring and A is a commutative R-algebra.” In §8.5 retain the vanishing statement for connective associative ring spectra, but write “For an ordinary commutative ring A, π₋₁TC(A;ℤₚ)=coker(F−1:W(A)→W(A)).” Include M₂(𝔽₂) as the negative control for extending the algebra-valued antisymmetrization to associative inputs.

15. **F15** (P3) Several source locators misidentify items or pages

   - **Location:** packages/RefinedTraceMethods/README.md:225,1257,3522,3605,3779: “Definitions II.2.2–II.2.5”, “Lemmas 2.15–2.17”, “Lemmas 2.22–2.26”, “Lemmas 4.28–4.30”.
   - **Claim:** These ranges name the indicated definitions or lemmas; §1.3 locates Keller §2.2–2.4 on pp. 6–7.
   - **Witness:** ns line 1717: Proposition II.2.4; mw lines 674,698: paragraphs 2.15,2.17; mw line 869: Remark 2.24; bms line 1212: Remark 4.29; ke lines 234–245: §2.2 on printed p. 5.
   - **Exact repair text:** Use “NS Definitions II.2.2, II.2.3, II.2.5 and Proposition II.2.4”; “MW paragraphs 2.15 and 2.17 and Lemma 2.16, pp. 17–18”; “MW Lemmas 2.22, 2.23, 2.25, 2.26 and Remark 2.24”; “BMS Lemmas 4.28, 4.30 and Remark 4.29”. Change the Keller §2.2–2.4 page range to pp. 5–7. Do not count the explanatory paragraphs as additional theorem support.

16. **F16** (P3) Some nominal Checks merely repeat a defining property

   - **Location:** packages/RefinedTraceMethods/README.md:237,2685,3830–3832: `DerivedMixedComplex.not_abelian_derived`, `SolidSpectrum.product`, and the first three trace-presentation Checks.
   - **Claim:** These supply discriminating tests of the definitions.
   - **Witness:** The first repeats inversion of b-quasi-isomorphisms; the second repeats `SolidSpectrum.generator`; the trace Checks repeat the two generator prescriptions and uv=ξ at ξ=0. They do not independently distinguish the proposed construction.
   - **Exact repair text:** Replace `DerivedMixedComplex.not_abelian_derived` by the two-term complex k→ᶦᵈk: it is b-acyclic and becomes zero here, but viewed as a degree-zero object of the derived category of the abelian category of mixed complexes it is nonzero. Replace `SolidSpectrum.product` by the p-complete-unit comparison in R12. After R04, use ξ=1 to test the Laurent isomorphism and A=ℤ[z], ξ=z, φ(z)=z² to test that the Frobenius relation has z², not z, as coefficient; add proved Lean mirrors for the retained light algebra tests.

17. **F17** (P2) The Banach almost-module input does not define a ring in the stated generality

   - **Location:** packages/RefinedTraceMethods/README.md:2484: “Let A be a commutative Banach ring … Put I=A_<1.”
   - **Claim:** These hypotheses make the open unit ball a nonunital ring to which unitization and almost modules apply.
   - **Witness:** A=ℂ, T=1/4, with its positive compatible roots, satisfies the hypotheses. Both 3/4 and 3/4 have norm <1, but their sum 3/2 does not. s-ber lines 1944–1948 make the same implicit ring assumption.
   - **Exact repair text:** State the missing algebraic input explicitly: “Let I be the nonunital ring A_<1, assuming it is closed under addition, and let B be a unitization in which it is an ideal. Require the chosen roots to give I=colim(B, multiplication by T^(1/nᵢ−1/nᵢ₊₁)), with compatible maps into I; prove this input, for example, for uniform nonarchimedean Banach rings, where the norms of the chosen roots and their inverses converge to 1.” Retain the general Tor-unital/continuous-K theorem for every such I and B. Add ℂ with its usual norm as a negative-control Check; do not claim that roots alone supply this input for arbitrary Banach rings.

## Verified sound

Coverage: all 4,352 README lines and all 270 Lean lines read; **23 Lean declarations** (8 definitions/structures/abbreviations, 6 admitted theorem signatures, 9 proved examples); **208 bold target blocks**; **349 named Checks read and assessed**. The nine Lean proof bodies were inspected, not executed. The tables below record the mathematical instances used; “consistent” records absence of a counterexample in those instances, not certification of the entire proposed construction.

**Locators:** 244 numbered-result/paragraph records opened in NS (96), W (73), MW (34), BMS (23) and AMMN (18), and 202 additional numbered-result records in the other works checked for existence and item kind. These are locator records, not distinct theorems or full proof certifications; corrections are in R15. The 52 bibliography entries and the extra NS arXiv version yielded 53 legal source texts. Section-only citations, printed page ranges and extended construction arguments have the limits recorded below.

**Supplier/sibling checks:** eight distinct section contracts were inspected in four available main suppliers: GeneralizedCohomology G5.4; BordismFormalGroups F6.5; DGAInfinity Layers 6, 8 and 9; EnhancedDerivedSheaves E5:presentability.4, E5:spectra-comparison and E5:animation.4. NoncommutativeGeometry N1 was also read for ownership. All seven supplied open sibling heads were searched by object. The q-FV system in QWittVectors §§3.1–3.2 was inspected: its indexed q-composite laws are different from this package's single FV=p axiom. There are **zero direct supplier citations to those seven sibling heads** to validate; a reference to the base CohomologyComparisons is not a citation to CohomologyComparisonsPartII.

The following mathematical checks survived:

- The six Lean theorem signatures are mathematically true on their written carriers. In particular, scaling an additive approximate inverse g by its denominator n clears both Cartier operator defects and changes the composites to n². No primality assumption is needed for that argument.
- The FV-only example works also at p=2: FV(1,0)=0 while VF(1,0)=(0,1). The morphism predicate tests both operators, and the two structures on ℤ show why testing the composite is insufficient.
- N₀=1, N₁=x−y and N₂=(x−y)(x−qy). Shifting x gives the stated recurrence; shifting y instead does not. At q=1, N_d=(x−y)^d. The classical degree-two substitute has exactly the nonzero error (q−1)²xy stated in the Lean example. These checks distinguish the normalization and variable direction.
- HighPowered accepts 1,9,16,64 and rejects 0,3,8,32. For d>0, every nonzero exponent in d⁴ is a positive multiple of four, so the fourth-power cofinality statement holds. Positivity prevents Nat.factorization's zero convention from admitting 0.
- The coefficient quotient statements hold over arbitrary commutative rings, including the zero ring and ξ=0,1. The Frobenius assignment respects uv=ξ precisely because it also sends coefficients through φ. Their defect is duplicated ownership and insufficient tests, not false algebra.
- The README distinguishes T-equivariant and C_{p^∞}-equivariant uncompleted TC; HQ detects the difference in degree −2. It retains bounded-below hypotheses in the genuine/naive comparison, nonconnective K's idempotent-completion qualification in degree zero, the localized coefficient ring for stable Adams operations, and the odd-prime versus prime-two distinctions in the local q-Hodge comparisons.
- Pinned object searches found the named Mathlib additive, polynomial, Laurent-polynomial, factorization, derived-category and condensed carriers. `CategoryTheory.Tor` is a genuine pinned declaration. The nodal-algebra overlap is R04. No sorry-valued data, `set_option`, admitted example, `True` placeholder or `lemma` declaration occurs. The import is exactly `import Mathlib`. No additional spectral headline was forced onto a nonexistent carrier.

The read-only dependency gate returned exit status 1 and exactly:

```text
NOT IN ORDER: RefinedTraceMethods (insert it after its last supplier)
depcheck: 8 roadmaps, 63 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. Missing merge-order membership is not raised as a finding. The result covers the eight roadmaps the gate found; it cannot certify the unavailable supplier heads. The pull-request diff contains only the package's README.md, Suggested.lean, metadata.toml and review.json (4 files, 4,631 added lines). Candidate files were not changed, and no Lean build or elaboration was run.

### Lean declaration inventory and adversarial tests

All declaration locators below are in packages/RefinedTraceMethods/Suggested.lean. Universes are u and v. Layer 3 and Layers 6–7 have no standing variable block; their necessary binders are explicit. Layer 8 has `{A : Type u} [CommRing A]`, retained through the types involving A and its quotient.

| Line | Layer / declaration | Variables and instances in scope | Instances tried / result / change |
|---|---|---|---|
| 27 | 3 / CartierStructure | p:ℕ; M:Type u; AddCommGroup M | zero, ℤ, (Z/p)²; FV-only valid; R05 tests |
| 36 | 3 / IsMorphism | p; M:Type u,N:Type v; both AddCommGroup; c,d,f | identity, zero, unequal operator pairs; predicate valid; R05 |
| 40 | 3 / identity example | p; M:Type u; AddCommGroup M; c | identity commutes by composition; R03 docstring |
| 46 | 3 / operator negative example | concrete p=2, M=N=ℤ; standard instances | evaluation at 1 gives 2≠1; valid |
| 60 | 3 / isogeny_iff_underlying | p; M,N; AddCommGroup instances; c,d,f; hf:IsMorphism | zero groups, torsion groups, n=1,2; n·g argument valid |
| 71 | 3 / integer example | p:ℕ; standard ℤ additive structure | p=0,1,2,3; FV=p; valid |
| 79 | 3 / no-VF example | p:ℕ; Fact p.Prime; ZMod/product additive instances | p=2,3; VF(1,0)=(0,1)≠0; valid |
| 98 | 6 / diagonalNumerator | d:ℕ; MvPolynomial (Fin 3) ℤ | d=0,1,2; q=0,1; polynomial numerator valid |
| 105 | 6 / diagonalNumerator_shift | d:ℕ; same polynomial ring; fixed aeval scalars | d=0,1,2; polynomial recurrence valid |
| 112 | 6 / diagonalNumerator_one | d:ℕ; same polynomial ring | d=0,1,2; evaluation q=1 valid |
| 117 | 6 / small example | concrete d=0,1; polynomial instances | empty product and one factor; valid; R05 degree two |
| 122 | 6 / classical negative example | concrete polynomial ring and degree two | residual error (q−1)²xy; valid |
| 136 | 7 / HighPowered | m:ℕ; Nat.factorization | 0,1,3,8,9,16,32,64; correct predicate; R05 |
| 143 | 7 / fourthPower | d:ℕ; hd:0<d | d=1,2,3; prime exponents multiplied by 4; valid |
| 148 | 7 / 1-and-32 example | standard Nat arithmetic | 1 accepted, v₂(32)=5 rejected; valid |
| 161 | 7 / zero example | standard Nat arithmetic | 0<0 fails before factorization; valid |
| 168 | 8 / TracePresentation | A:Type u; CommRing A; ξ:A | zero ring, ξ=0,1; quotient valid; R04 duplicate |
| 177 | 8 / coeff | standing A,CommRing A; ξ:A | 0,1 map correctly; valid; R04 duplicate |
| 181 | 8 / u | standing A,CommRing A; ξ:A | quotient first coordinate; valid; R04 duplicate |
| 186 | 8 / v | standing A,CommRing A; ξ:A | quotient second coordinate; valid; R04 duplicate |
| 190 | 8 / uv example | standing A,CommRing A; ξ:A | defining ideal relation; true but nondiscriminating; R04,R16 |
| 200 | 8 / lift | standing A; B:Type v,CommRing B; ξ,f,a,b; ab=fξ | zero ring, identity, ξ=0,1; universal property valid; R04 duplicate |
| 209 | 8 / can_and_frobenius | standing A,CommRing A; ξ; φ:A→+*A | ξ=0,1; φ(z)=z²; both maps valid; R04 carrier/R05 tests |

### Bold-target adversarial table

All line numbers in this table refer to packages/RefinedTraceMethods/README.md. “Consistent” means only that the listed boundary tests did not produce another defect. Supplier availability and unconstructed coherent refinements remain subject to `Not verifiable`. Findings about the opening contracts, policy and source manifest apply independently of these target rows.

| Line / section | Target | Instances tried | Result | Change |
|---|---|---|---|---|
| 78 / 1.1 | Connes' cyclic category and cyclic objects. | n=0,1,2; A=k; zero algebra; nonunital matrix corner | Consistent | — |
| 107 / 1.1 | The cyclic bar construction of an algebra. | n=0,1,2; A=k; zero algebra; nonunital matrix corner | Consistent | — |
| 135 / 1.1 | The cyclic enhancement of supplied derived Hochschild chains. | n=0,1,2; A=k; zero algebra; nonunital matrix corner | Consistent | — |
| 165 / 1.2 | Connes' operator B. | B on degree 0/1; k[x]; B=0; two-term acyclic b-complex | Consistent | — |
| 191 / 1.2 | Mixed complexes. | B on degree 0/1; k[x]; B=0; two-term acyclic b-complex | Consistent | — |
| 221 / 1.3 | Derived category of mixed complexes. | k[0]; k→id k with B=0; nonunital matrix corner | Finding R16 | Apply R16 |
| 243 / 1.3 | Functorial precyclic mixed cone. | k[0]; k→id k with B=0; nonunital matrix corner | Consistent | — |
| 268 / 1.4 | Cyclic, negative cyclic and periodic cyclic homology. | k[0] with B=0; unbounded mixed complex; direct sum versus product | Consistent | — |
| 299 / 1.4 | Connes' SBI exact sequence. | k[0] with B=0; unbounded mixed complex; direct sum versus product | Consistent | — |
| 313 / 1.5 | The mixed-complex comparison compatibility. | A=k; k[x]; reduction and completion order | Consistent | — |
| 325 / 1.6 | Morita invariance of Hochschild and cyclic homology. | matrix sizes 1 and 2; k=F₂; nonunital corner; degree-one shuffle | Consistent | — |
| 337 / 1.6 | Shuffle and external products. | matrix sizes 1 and 2; k=F₂; nonunital corner; degree-one shuffle | Consistent | — |
| 370 / 1.7 | Hochschild homology of a commutative ring is its tensor with the circle. | A=k; polynomial algebra; zero commutative algebra | Consistent | — |
| 384 / 1.8 | Base change and flat base change for Hochschild homology. | identity base change; flat localization; Z→F₂ nonflat | Consistent | — |
| 396 / 1.8 | Étale base change (Weibel–Geller). | identity base change; flat localization; Z→F₂ nonflat | Consistent | — |
| 410 / 1.9 | The antisymmetrisation map and the HKR projection. | k[x,y], degree 2 in characteristic 2; degree 0; nonsmooth dual numbers | Consistent | — |
| 437 / 1.9 | The Hochschild–Kostant–Rosenberg theorem. | k[x,y], degree 2 in characteristic 2; degree 0; nonsmooth dual numbers | Consistent | — |
| 449 / 1.9 | Connes' operator is the de Rham differential under HKR. | k[x,y], degree 2 in characteristic 2; degree 0; nonsmooth dual numbers | Consistent | — |
| 463 / 1.10 | Cyclic homology of smooth algebras in characteristic zero. | Q; Q[x]; characteristic-p input excluded | Consistent | — |
| 477 / 1.11 | The derived HKR filtration. | F₂/Z; smooth polynomial ring; nonflat base change | Consistent | — |
| 489 / 1.11 | Hochschild homology of 𝔽_p over ℤ. | F₂/Z; smooth polynomial ring; nonflat base change | Consistent | — |
| 517 / 2.1 | Spectra with an action of a group. | trivial group; C₂; circle; zero spectrum | Consistent | — |
| 543 / 2.1 | Homotopy orbits and homotopy fixed points. | trivial group; C₂; circle; zero spectrum | Consistent | — |
| 572 / 2.2 | Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology. | C₂ with F₂ and rational coefficients; trivial group; induced object | Consistent | — |
| 586 / 2.3 | Tate endomorphisms in the finite-action Verdier quotient. | trivial group quotient; C₂-induced object; unit endomorphisms | Finding R11 | Apply R11 |
| 600 / 2.4 | Tate constructions at C_p: convergence, vanishing and p-completeness. | HF₂; rational spectrum; bounded-below versus unbounded input | Consistent | — |
| 612 / 2.4 | The Tate fixpoint lemma. | HF₂; rational spectrum; bounded-below versus unbounded input | Consistent | — |
| 626 / 2.5 | The Tate construction for a Kan complex and the dualizing spectrum. | point; empty Kan space; BG; circle dualizing shift | Consistent | — |
| 640 / 2.6 | Geometric realisation of cyclic objects and the circle action. | constant cyclic object; n=1 subdivision; degree-0 cyclic bar | Consistent | — |
| 665 / 2.6 | Edgewise subdivision and Tate constructions of realisations. | constant cyclic object; n=1 subdivision; degree-0 cyclic bar | Consistent | — |
| 679 / 2.7 | Topological Hochschild homology of an E_1-ring. | zero ring; sphere; F₂; perfect F₃-algebra | Consistent | — |
| 708 / 2.7 | The cyclotomic Frobenius of THH. | zero ring; sphere; F₂; perfect F₃-algebra | Consistent | — |
| 733 / 2.7 | Bökstedt periodicity. | zero ring; sphere; F₂; perfect F₃-algebra | Finding R08 | Apply R08 |
| 757 / 2.8 | THH relative to an E_∞-ring. | A=Z; A=F₂; base=unit; cyclic norm suspension | Consistent | — |
| 783 / 2.8 | Mixed complexes model complexes with circle action. | A=Z; A=F₂; base=unit; cyclic norm suspension | Consistent | — |
| 795 / 2.8 | THH relative to THH(ℤ) is Hochschild homology. | A=Z; A=F₂; base=unit; cyclic norm suspension | Finding R08 | Apply R08 |
| 807 / 2.8 | The norm sequence for cyclic homology. | A=Z; A=F₂; base=unit; cyclic norm suspension | Consistent | — |
| 819 / 2.8 | Circle and finite Tate constructions for HZ-module spectra. | A=Z; A=F₂; base=unit; cyclic norm suspension | Consistent | — |
| 833 / 2.9 | Lax equalizers of ∞-categories. | zero object; identity endofunctors; trivial Frobenius; mapping homotopy | Consistent | — |
| 862 / 2.9 | Cyclotomic spectra. | zero object; identity endofunctors; trivial Frobenius; mapping homotopy | Consistent | — |
| 889 / 2.9 | THH is symmetric monoidal; THH of E_∞-rings. | zero object; identity endofunctors; trivial Frobenius; mapping homotopy | Consistent | — |
| 903 / 2.10 | Negative topological cyclic and periodic topological cyclic homology. | zero spectrum; rational trivial action; p=2; completion order | Consistent | — |
| 930 / 2.10 | Topological cyclic homology. | zero spectrum; rational trivial action; p=2; completion order | Consistent | — |
| 956 / 2.10 | The Nikolaus–Scholze formula for TC. | zero spectrum; rational trivial action; p=2; completion order | Consistent | — |
| 968 / 2.10 | p-completion of TC. | zero spectrum; rational trivial action; p=2; completion order | Consistent | — |
| 980 / 2.10 | TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers. | zero spectrum; rational trivial action; p=2; completion order | Consistent | — |
| 994 / 2.11 | THH and TC of spherical group rings and loop spaces. | trivial monoid; trivial group; connected point; zero category | Consistent | — |
| 1006 / 2.11 | THH of spectral and stable ∞-categories. | trivial monoid; trivial group; connected point; zero category | Consistent | — |
| 1034 / 2.12 | Orthogonal spectra. | zero representation; trivial subgroup; C₂ sign representation | Consistent | — |
| 1060 / 2.12 | Genuine G-spectra, genuine and geometric fixed points. | zero representation; trivial subgroup; C₂ sign representation | Consistent | — |
| 1087 / 2.12 | Geometric fixed points via complete universes. | zero representation; trivial subgroup; C₂ sign representation | Consistent | — |
| 1114 / 2.13 | Borel-complete genuine spectra. | trivial subgroup; induced/free C₂-spectrum; sphere | Consistent | — |
| 1126 / 2.13 | Geometric fixed points as a localisation. | trivial subgroup; induced/free C₂-spectrum; sphere | Consistent | — |
| 1138 / 2.13 | Isotropy separation for cyclic p-groups. | trivial subgroup; induced/free C₂-spectrum; sphere | Consistent | — |
| 1152 / 2.14 | Genuine C_{p^∞}-spectra and F-genuine T-spectra. | n=0,1; trivial representation; C₂; commutative F₂ | Consistent | — |
| 1178 / 2.14 | Genuine cyclotomic spectra. | n=0,1; trivial representation; C₂; commutative F₂ | Consistent | — |
| 1204 / 2.14 | Orthogonal cyclotomic spectra model genuine ones. | n=0,1; trivial representation; C₂; commutative F₂ | Consistent | — |
| 1216 / 2.14 | TR and genuine TC. | n=0,1; trivial representation; C₂; commutative F₂ | Consistent | — |
| 1247 / 2.14 | Representation spheres and representation-graded TR. | n=0,1; trivial representation; C₂; commutative F₂ | Finding R15 | Apply R15 |
| 1282 / 2.15 | Coalgebras and fixed points of endofunctors. | zero object; identity endofunctor; bounded-below and unbounded distinction | Consistent | — |
| 1309 / 2.15 | Genuine cyclotomic spectra coreflect. | zero object; identity endofunctor; bounded-below and unbounded distinction | Consistent | — |
| 1321 / 2.15 | Genuine and naive cyclotomic spectra agree on bounded below objects. | zero object; identity endofunctor; bounded-below and unbounded distinction | Consistent | — |
| 1335 / 2.16 | The Bökstedt construction and classical THH. | sphere; HF₂; zero ring; finite subgroup C₂ | Consistent | — |
| 1361 / 2.16 | The two THH agree as cyclotomic spectra. | sphere; HF₂; zero ring; finite subgroup C₂ | Consistent | — |
| 1375 / 2.17 | The restriction pullback for genuine fixed points. | n=1 restriction; sphere; bounded-below zero object | Consistent | — |
| 1387 / 2.17 | Genuine and Nikolaus–Scholze TC agree on bounded below spectra. | n=1 restriction; sphere; bounded-below zero object | Consistent | — |
| 1401 / 2.18 | Hesselholt’s de Rham–Witt comparison for TR. | F₂; F₃[x]; smoothness versus dual numbers; n=1 | Finding R11 | Apply R11 |
| 1429 / 3.1 | Circle-equivariant p-typical cyclotomic spectra. | HQ with trivial action; zero Frobenius; sphere unit; p=2 | Consistent | — |
| 1458 / 3.2 | Classical p-typical Cartier modules. | zero group; Z with F=p,V=id; (Z/p)²; p=0,1,2,3 | Finding R05 | Apply R05 |
| 1484 / 3.2 | Topological Cartier modules. | zero group; Z with F=p,V=id; (Z/p)²; p=0,1,2,3 | Consistent | — |
| 1513 / 3.3 | Derived V-completeness. | V=id; V=p on Zp; V=0; Qp/Zp colimit | Consistent | — |
| 1540 / 3.4 | The cyclotomic t-structure. | THH(Fp); zero object; V-complete heart; nonfiltered heart | Consistent | — |
| 1566 / 3.4 | TR as V-complete topological Cartier modules. | THH(Fp); zero object; V-complete heart; nonfiltered heart | Consistent | — |
| 1578 / 3.4 | The derived V-complete Cartier heart. | THH(Fp); zero object; V-complete heart; nonfiltered heart | Consistent | — |
| 1592 / 3.5 | TR detects cyclotomic quasi-isogenies. | zero map; denominator n and n²; null Frobenius on bounded-below torsion | Consistent | — |
| 1604 / 3.5 | TR with a null cyclotomic Frobenius. | zero map; denominator n and n²; null Frobenius on bounded-below torsion | Consistent | — |
| 1618 / 3.6 | Positively graded cyclotomic spectra. | degree-zero-only object; positive grading; connectivity not increasing | Consistent | — |
| 1644 / 3.6 | Graded cyclotomic torsion and connective convergence. | degree-zero-only object; positive grading; connectivity not increasing | Consistent | — |
| 1672 / 4.1 | Relative dualizable presentable stable categories. | base Sp; Mod_k; zero category; compactly generated example | Consistent | — |
| 1697 / 4.2 | Ordered trace-class morphisms and the symmetric comparison. | identity on k; identity on countable direct sum; zero map; nonsymmetric ordering | Consistent | — |
| 1723 / 4.2 | Functoriality and preduals of trace-class maps. | identity on k; identity on countable direct sum; zero map; nonsymmetric ordering | Consistent | — |
| 1735 / 4.3 | E₁ rigidity extending the supplied symmetric notion. | finite-dimensional vector spaces; infinite-dimensional identity; zero object; compact unit | Consistent | — |
| 1758 / 4.3 | Nuclear objects. | finite-dimensional vector spaces; infinite-dimensional identity; zero object; compact unit | Consistent | — |
| 1781 / 4.3 | Trace-class generation criterion for rigidity. | finite-dimensional vector spaces; infinite-dimensional identity; zero object; compact unit | Consistent | — |
| 1791 / 4.3 | Closure and generation of nuclear objects. | finite-dimensional vector spaces; infinite-dimensional identity; zero object; compact unit | Consistent | — |
| 1803 / 4.4 | The continuous Calkin category. | compactly generated category; zero category; κ=ω versus uncountable κ | Consistent | — |
| 1826 / 4.4 | Accessible localizing invariants. | compactly generated category; zero category; κ=ω versus uncountable κ | Consistent | — |
| 1851 / 4.5 | Continuous extensions of localizing invariants. | Mod_k; zero category; triangle curve with IK₋₁=Z | Finding R01 | Apply R01 |
| 1874 / 4.5 | Uniqueness of continuous extension. | Mod_k; zero category; triangle curve with IK₋₁=Z | Finding R01 | Apply R01 |
| 1886 / 4.6 | The category of relative localizing motives. | base Sp; Perf(k); zero category; cardinal change | Consistent | — |
| 1911 / 4.7 | Nuclear E-modules. | base Mod_k; identity and zero module; ordered left/right duals | Consistent | — |
| 1934 / 4.7 | The nuclear resolution of length one. | base Mod_k; identity and zero module; ordered left/right duals | Consistent | — |
| 1959 / 4.8 | Enriched trace-class duality. | base Sp; zero category; finite-dimensional evaluation; noncompact unit excluded | Consistent | — |
| 1969 / 4.8 | Rigidity of relative localizing motives. | base Sp; zero category; finite-dimensional evaluation; noncompact unit excluded | Consistent | — |
| 1981 / 4.9 | Connective K-theory of small stable ∞-categories. | zero category; Perf(k); bounded free (k×k)-complexes; κ=ω | Consistent | — |
| 2005 / 4.9 | Nonconnective K-theory by the suspension construction. | zero category; Perf(k); bounded free (k×k)-complexes; κ=ω | Consistent | — |
| 2033 / 4.9 | Localizing and truncating invariants. | zero category; Perf(k); bounded free (k×k)-complexes; κ=ω | Consistent | — |
| 2061 / 4.10 | K-theory units of finitary invariants. | unit sphere; rank-one free module; k[t] not proper; zero category | Consistent | — |
| 2073 / 4.10 | The Dennis trace. | unit sphere; rank-one free module; k[t] not proper; zero category | Finding R06 | Apply R06 |
| 2101 / 4.11 | The cyclotomic trace. | unit trace; zero category; finite TC stage versus inverse limit | Consistent | — |
| 2127 / 4.11 | Uniqueness and multiplicativity of the trace. | unit trace; zero category; finite TC stage versus inverse limit | Consistent | — |
| 2141 / 4.12 | Relative K-theory, relative TC and K^inv. | identity map; nilpotent dual numbers; ideal (p) in Zp | Consistent | — |
| 2169 / 4.13 | THH with bimodule coefficients. | M=0; A=k,M=k; matrix Morita bimodule; identity endomorphism | Consistent | — |
| 2194 / 4.14 | Connective bimodules and square-zero extensions. | M=0; k[ε]/ε²; degree-zero M; Σ versus Ω derivative | Consistent | — |
| 2218 / 4.14 | Goodwillie derivatives. | M=0; k[ε]/ε²; degree-zero M; Σ versus Ω derivative | Consistent | — |
| 2250 / 4.15 | Stable K-theory is THH (Dundas–McCarthy). | M=0; A=k,M=k; first relative degree 1 | Finding R11 | Apply R11 |
| 2262 / 4.15 | Stable TC is THH, compatibly with the trace. | M=0; A=k,M=k; first relative degree 1 | Consistent | — |
| 2276 / 4.16 | Pseudo-extensible functors. | zero functor; identity split extension; bounded Postnikov truncation | Consistent | — |
| 2298 / 4.16 | Postnikov-convergent algebra functors. | zero functor; identity split extension; bounded Postnikov truncation | Consistent | — |
| 2320 / 4.16 | Infinitesimal sifted-colimit preservation. | zero functor; identity split extension; bounded Postnikov truncation | Consistent | — |
| 2342 / 4.16 | Convergence: from derivatives to nilpotent extensions. | zero functor; identity split extension; bounded Postnikov truncation | Consistent | — |
| 2356 / 4.17 | The Dundas–Goodwillie–McCarthy theorem. | nilpotent dual numbers; Zp→Fp nonnilpotent; finite coefficients; p=2 | Consistent | — |
| 2368 / 4.17 | Henselian rigidity of the trace with finite coefficients. | nilpotent dual numbers; Zp→Fp nonnilpotent; finite coefficients; p=2 | Consistent | — |
| 2394 / 4.17 | Goodwillie's rational theorem. | nilpotent dual numbers; Zp→Fp nonnilpotent; finite coefficients; p=2 | Consistent | — |
| 2408 / 4.18 | K^inv is truncating. | constant tower; Milnor lim¹; nilpotent versus locally nilpotent ideal; F-finite ring | Consistent | — |
| 2420 / 4.18 | The trace square for filtered towers. | constant tower; Milnor lim¹; nilpotent versus locally nilpotent ideal; F-finite ring | Consistent | — |
| 2432 / 4.18 | Continuity of K-theory modulo p. | constant tower; Milnor lim¹; nilpotent versus locally nilpotent ideal; F-finite ring | Consistent | — |
| 2444 / 4.18 | Truncating invariants: nil-invariance and excision. | constant tower; Milnor lim¹; nilpotent versus locally nilpotent ideal; F-finite ring | Consistent | — |
| 2458 / 4.19 | The TC assembly map for C_p. | p=2 (one summand); dual numbers; perfect locally nilpotent example | Consistent | — |
| 2470 / 4.19 | Low-degree tests: dual numbers and truncated polynomials. | p=2 (one summand); dual numbers; perfect locally nilpotent example | Consistent | — |
| 2484 / 4.20 | Continuous K-theory of almost modules. | I=0; nonarchimedean unit ball; C with T=1/4 and compatible roots | Finding R17 | Apply R17 |
| 2510 / 5.1 | Snaith construction of stable Adams operations. | k=1,2; conjugation k=−1 where allowed; Bott inverse; i=0,1 | Consistent | — |
| 2534 / 5.1 | Coherent stable lifts of the supplied Adams operations. | k=1,2; conjugation k=−1 where allowed; Bott inverse; i=0,1 | Finding R13 | Apply R13 |
| 2561 / 5.2 | Graded polynomial and Laurent HKR for ku and KU. | β⁰,β,β⁻¹; dβ degree 3; (dβ)²=0; relative unit | Consistent | — |
| 2573 / 5.2 | THH relative to ku and KU. | β⁰,β,β⁻¹; dβ degree 3; (dβ)²=0; relative unit | Consistent | — |
| 2587 / 5.3 | ku and KU with circle and cyclic-group actions. | p=2,3; circle versus C_p; βt=q−1; trivial action | Consistent | — |
| 2615 / 6.1 | Spherical lifts and the base hypotheses. | base Z; identity and polynomial/étale lift; ramified input excluded | Consistent | — |
| 2641 / 6.1 | Compatible local and global spherical lifts. | base Z; identity and polynomial/étale lift; ramified input excluded | Consistent | — |
| 2666 / 6.2 | Light condensed and solid spectra. | sphere unit versus S_p; discrete spectrum; countable sum/product; zero map | Finding R12, R16 | Apply R12, R16 |
| 2692 / 6.2 | Trace-class maps and nuclear modules. | sphere unit versus S_p; discrete spectrum; countable sum/product; zero map | Consistent | — |
| 2720 / 6.3 | Perfect even modules and the even site. | R; ΣR; Σ²R; zero module; odd even-sheaf weight | Consistent | — |
| 2745 / 6.3 | Homological evenness and even homotopy sheaves. | R; ΣR; Σ²R; zero module; odd even-sheaf weight | Consistent | — |
| 2772 / 6.4 | Even flat and solid even flat modules. | identity ring map; zero cofiber; R→0 excluded; left/right module order | Consistent | — |
| 2796 / 6.4 | Faithfully even flat ring maps. | identity ring map; zero cofiber; R→0 excluded; left/right module order | Consistent | — |
| 2818 / 6.4 | Solid duality assumption R. | identity ring map; zero cofiber; R→0 excluded; left/right module order | Consistent | — |
| 2842 / 6.5 | Even filtrations (Hahn–Raksit–Wilson and Pstrągowski). | already even spectrum; odd suspension; R=HZ; complete versus exhaustive filtration | Consistent | — |
| 2870 / 6.5 | The solid even filtration. | already even spectrum; odd suspension; R=HZ; complete versus exhaustive filtration | Consistent | — |
| 2898 / 6.6 | Synthetic finite cyclic fixed points and Tate. | n=1; zero object; induced object; circle norm shift | Consistent | — |
| 2928 / 6.6 | Even-filtered circle fixed points and Tate. | n=1; zero object; induced object; circle norm shift | Consistent | — |
| 2955 / 6.7 | Even filtrations on solid relative THH. | relative base=unit; polynomial lift; odd module excluded | Consistent | — |
| 2969 / 6.8 | The K(1)-local sphere and its Adams fixed points. | p=2 versus odd p; KU/KO; degree-zero connective cover; j versus j_p,0 | Consistent | — |
| 2997 / 6.8 | The connective image-of-J spectrum j. | p=2 versus odd p; KU/KO; degree-zero connective cover; j versus j_p,0 | Consistent | — |
| 3027 / 6.8 | Nikolaus's E_1 comparison at all primes. | p=2 versus odd p; KU/KO; degree-zero connective cover; j versus j_p,0 | Consistent | — |
| 3039 / 6.8 | THH(ℤ_p) and the image of J (Devalapurkar–Raksit). | p=2 versus odd p; KU/KO; degree-zero connective cover; j versus j_p,0 | Consistent | — |
| 3051 / 6.8 | Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku. | p=2 versus odd p; KU/KO; degree-zero connective cover; j versus j_p,0 | Consistent | — |
| 3065 / 6.9 | The comparison map ψ^0_R and the q-Hodge filtration. | p=2,3; identity q-Hodge comparison; torsion-free versus Z/16; regular quotient | Consistent | — |
| 3090 / 6.9 | The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8). | p=2,3; identity q-Hodge comparison; torsion-free versus Z/16; regular quotient | Consistent | — |
| 3102 / 6.9 | The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14). | p=2,3; identity q-Hodge comparison; torsion-free versus Z/16; regular quotient | Consistent | — |
| 3114 / 6.9 | q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17). | p=2,3; identity q-Hodge comparison; torsion-free versus Z/16; regular quotient | Consistent | — |
| 3128 / 6.10 | Global even filtrations by profinite and rational gluing. | dimension 0,1,2; q=1; p=2; x=y; x↦qx versus y↦qy | Consistent | — |
| 3153 / 6.10 | q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27). | dimension 0,1,2; q=1; p=2; x=y; x↦qx versus y↦qy | Consistent | — |
| 3165 / 6.10 | Completeness, multiplicativity and the graded comparison. | dimension 0,1,2; q=1; p=2; x=y; x↦qx versus y↦qy | Consistent | — |
| 3177 / 6.10 | Framed smooth inputs (Wagner Examples 6.7–6.8). | dimension 0,1,2; q=1; p=2; x=y; x↦qx versus y↦qy | Finding R08 | Apply R08 |
| 3200 / 6.10 | q-divided powers on the diagonal (Wagner Lemma 6.11). | dimension 0,1,2; q=1; p=2; x=y; x↦qx versus y↦qy | Finding R05 | Apply R05 |
| 3225 / 6.10 | The framed Čech resolution (Wagner 6.12 and Lemma 6.13). | dimension 0,1,2; q=1; p=2; x=y; x↦qx versus y↦qy | Consistent | — |
| 3248 / 6.10 | The framed comparison (Raksit; Wagner Theorem 6.10). | dimension 0,1,2; q=1; p=2; x=y; x↦qx versus y↦qy | Consistent | — |
| 3272 / 6.10 | The framed trace pair and its E∞-structure (Wagner Remark 6.14). | dimension 0,1,2; q=1; p=2; x=y; x↦qx versus y↦qy | Consistent | — |
| 3297 / 6.11 | Cyclonic spectra. | m=1; composites m=n=2; ψ¹; prime 2 coherence | Consistent | — |
| 3324 / 6.11 | Cyclonic ku and KU. | m=1; composites m=n=2; ψ¹; prime 2 coherence | Consistent | — |
| 3350 / 6.11 | Cyclonic Adams lift coherence. | m=1; composites m=n=2; ψ¹; prime 2 coherence | Consistent | — |
| 3377 / 6.12 | The invariants TC^{−(m)}. | m=1; Bott localization; zero input; completion before localization | Consistent | — |
| 3402 / 6.12 | Cyclonic even filtrations and the KU construction. | m=1; Bott localization; zero input; completion before localization | Consistent | — |
| 3429 / 6.13 | TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51). | m=1; étale algebra; p=2; completed versus uncompleted pair | Finding R11 | Apply R11 |
| 3441 / 6.13 | The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63). | m=1; étale algebra; p=2; completed versus uncompleted pair | Consistent | — |
| 3455 / 6.14 | Étale algebras lift uniquely to étale E_∞-algebras. | identity étale map; number field Q; discriminant divisibility; primes 2,3 | Finding R08 | Apply R08 |
| 3467 / 6.14 | The Habiro ring of a number field from KU (Wagner Corollary 6.15). | identity étale map; number field Q; discriminant divisibility; primes 2,3 | Consistent | — |
| 3497 / 7.1 | Rigidification of the target. | rigid target; zero invariant; rational versus sequential index; compact unit | Consistent | — |
| 3520 / 7.1 | The refined localizing invariant. | rigid target; zero invariant; rational versus sequential index; compact unit | Finding R15 | Apply R15 |
| 3532 / 7.2 | Killing an idempotent pro-algebra. | zero pro-algebra; unit pro-algebra; constant Z/p is not idempotent | Consistent | — |
| 3558 / 7.3 | Smooth and proper E-linear categories. | base E itself; zero category; smooth but nonproper polynomial algebra | Consistent | — |
| 3581 / 7.3 | Refined invariants of smooth proper categories. | base E itself; zero category; smooth but nonproper polynomial algebra | Consistent | — |
| 3591 / 7.3 | Base change in the refined construction. | base E itself; zero category; smooth but nonproper polynomial algebra | Consistent | — |
| 3603 / 7.4 | The refined localization cofiber. | zero localization; identity localization; smooth/proper base; power transition | Finding R15 | Apply R15 |
| 3615 / 7.5 | Circle fixed points and oriented completion. | trivial S¹-action; unit k; t-completion; zero module | Consistent | — |
| 3625 / 7.5 | Refined THH and TC⁻. | trivial S¹-action; unit k; t-completion; zero module | Consistent | — |
| 3651 / 7.6 | High-powered positive integers. | m=0,1,3,8,9,16,32,64; p=2; d=1,2,3 | Finding R05 | Apply R05 |
| 3675 / 7.6 | Finite-coefficient TC⁻ and q-Hodge complexes. | m=0,1,3,8,9,16,32,64; p=2; d=1,2,3 | Finding R07, R11 | Apply R07, R11 |
| 3687 / 7.7 | Filtered derived Hom of even spectra. | M=0; M=N=unit; odd Ext¹ degree; completed tensor with unit | Consistent | — |
| 3697 / 7.7 | The dual finite-coefficient TC⁻ spectra. | M=0; M=N=unit; odd Ext¹ degree; completed tensor with unit | Consistent | — |
| 3707 / 7.7 | The completed tensor filtration. | M=0; M=N=unit; odd Ext¹ degree; completed tensor with unit | Consistent | — |
| 3719 / 7.8 | Pro-idempotence of the finite-coefficient q-Hodge system. | m=1,16; constant Z/p fails idempotence; m³→m transition | Consistent | — |
| 3729 / 7.8 | Trace-class finite-coefficient transitions. | m=1,16; constant Z/p fails idempotence; m³→m transition | Consistent | — |
| 3741 / 7.9 | Refined TC⁻ of rational ku. | rational ku/KU; zero finite quotient at m=1; Bott inversion; Ext¹ shift | Consistent | — |
| 3751 / 7.9 | Refined TC⁻ of rational KU. | rational ku/KU; zero finite quotient at m=1; Bott inversion; Ext¹ shift | Consistent | — |
| 3777 / 8.1 | Flat and quasisyntomic descent for trace spectra. | identity cover; F₂; quasiregular quotient; uncompleted versus completed dR | Finding R15 | Apply R15 |
| 3787 / 8.1 | Even Hochschild homology on quasiregular covers. | identity cover; F₂; quasiregular quotient; uncompleted versus completed dR | Consistent | — |
| 3797 / 8.1 | Negative and periodic cyclic homology from derived de Rham. | identity cover; F₂; quasiregular quotient; uncompleted versus completed dR | Consistent | — |
| 3810 / 8.2 | The perfectoid trace coefficient presentation. | zero ring; ξ=0,1; Z[z],ξ=z,φ(z)=z²; scalar and coordinate order | Finding R04, R05, R16 | Apply R04, R05, R16 |
| 3843 / 8.3 | THH as a deformation of Hochschild homology. | A=R; F₂; M₂(F₂); smooth polynomial ring; exterior degree 2 | Consistent | — |
| 3853 / 8.3 | Antisymmetrization into THH. | A=R; F₂; M₂(F₂); smooth polynomial ring; exterior degree 2 | Finding R14 | Apply R14 |
| 3876 / 8.3 | The cotangent filtration of THH. | A=R; F₂; M₂(F₂); smooth polynomial ring; exterior degree 2 | Finding R14 | Apply R14 |
| 3888 / 8.4 | Nygaard agrees with the AΩ décalage filtration. | R=O_C; twist 0/1; φ on ξ; p=2 | Consistent | — |
| 3898 / 8.4 | The Segal comparison over O_C. | R=O_C; twist 0/1; φ on ξ; p=2 | Consistent | — |
| 3910 / 8.5 | Derived convergence of the trace spectral sequences. | zero ring; F₂; associative M₂(F₂); degree −2/−1; separated versus exhaustive | Consistent | — |
| 3920 / 8.5 | The TC-internal negative-degree calculation. | zero ring; F₂; associative M₂(F₂); degree −2/−1; separated versus exhaustive | Finding R14 | Apply R14 |
| 3932 / 8.6 | The p-adic Adams operations on traces. | a=1,−1; weight 0,1; p=2; unit condition | Consistent | — |
| 3958 / 8.7 | The even TC sheaf in characteristic p. | F₂; algebraic closure of F₂; weights 0,1; finite coefficient n=1 | Consistent | — |
| 3968 / 8.7 | Syntomic complexes from sheafified even K-groups. | F₂; algebraic closure of F₂; weights 0,1; finite coefficient n=1 | Consistent | — |
| 4006 / 8.8 | The coherent trace interface for Habiro cohomology. | étale identity; number-field discriminant; q=1; completed/uncompleted inputs | Consistent | — |
| 4034 / 9.1 | ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p. | HFp; HZ; HQ; completion before rationalization | Consistent | — |
| 4060 / 9.1 | THH(𝔽_p) versus ℤ with trivial cyclotomic structure. | HFp; HZ; HQ; completion before rationalization | Consistent | — |
| 4074 / 9.2 | From R ⊗_S 𝔽_p to R/p: a quasi-isogeny. | R=F₂ and Z; spectral versus ordinary reduction; nilpotent kernel | Consistent | — |
| 4088 / 9.3 | The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p). | R=Zp,Fp; map direction; spectral reduction; zero ring | Consistent | — |
| 4114 / 9.3 | The Beilinson square with the spectral reduction (AMMN Theorem 2.12). | R=Zp,Fp; map direction; spectral reduction; zero ring | Consistent | — |
| 4128 / 9.4 | The Beilinson fibre square (AMMN Corollary 3.9). | R=Zp; characteristic p; identity fiber; henselian versus nonhenselian | Consistent | — |
| 4140 / 9.4 | The K-theoretic Beilinson square (AMMN Theorem A). | R=Zp; characteristic p; identity fiber; henselian versus nonhenselian | Consistent | — |
| 4152 / 9.4 | The Beilinson fibre sequence and its shift dictionary. | R=Zp; characteristic p; identity fiber; henselian versus nonhenselian | Consistent | — |
| 4166 / 9.5 | Integral refinement of the graded Beilinson square. | weight i=0,1; p=2 truncation bound; Qp[−1] then weight shift [2] | Finding R09 | Apply R09 |

The line-by-line Check inventory is preserved in scratch notes as `checks.tsv`: all 349 entries have a disposition. Missing Lean mirrors and nondiscriminating tests are R05/R16; the weight-shift Check is R09. No test execution is implied by this inventory.

## Not verifiable

- **Current supplier contracts unavailable in the allowed checkouts.** No current README was located for AInfCohomology, CrystallineCohomology, DerivedDeRhamCohomology, GeneralAlgebraicKTheory, HabiroCohomologyFoundations, HabiroRings, K2SymbolsBrauer, KTheoryLowDegrees, PrismaticCohomology, PrismaticCohomologyPartII, PrismaticCohomologyPartIII, StableHomotopyKTheory, TopologicalKTheory or VStackSheavesAndLisseCategories. The base CohomologyComparisons mentioned in the prismatic contract was also unavailable. Their exact current names, numbered sections, hypotheses, exported declarations and reverse dependencies cannot be certified from the supplied material. This is a verification limit, not an allegation that these suppliers lack the targets.
- **Full coherent constructions.** The boundary audit does not establish existence or uniqueness of every proposed coherent enhancement, particularly the light solid spectral foundations cited through lectures, the framed Čech/derived-commutative multiplicative refinement and the global Adams gluing. Source theorem and paragraph locators were inspected; these extensions would require their full construction proofs. No unsupported counterexample is asserted for them.
- **Remaining source detail.** The numbered-locator inventory verifies existence and item kind, with statement openings and additional proof passages read where relied on above. It does not certify every printed page range or every section-only citation, nor reproduce complete proofs of all 208 targets. May is a bibliography-only background item. No missing legal text remains, so no reference request is needed.
- **Lean elaboration.** The six admitted signatures and nine proof scripts were checked by reading and mathematics only. No scratch `#check` execution or build was permitted by this read-only pass; the earlier review's build claim was not used as independent evidence.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "86b0104d77f78ceb0c709d9b05a0e6662fa29c4e", "job": "RT-RefinedTraceMethods~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
