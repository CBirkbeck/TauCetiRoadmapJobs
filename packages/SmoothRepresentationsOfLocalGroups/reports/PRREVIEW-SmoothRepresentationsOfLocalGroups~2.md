# Review of SmoothRepresentationsOfLocalGroups (pull request #792 at 6008aed)

**Verdict:** needs changes

## R01 (P1) — Repoint the K-flat supplier contract to its actual owner

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:518`, also 1703 and 1713: “DerivedDeRhamCohomology … §0.2 supplies K-flat resolutions and derived tensor products”.

**Claim:** SR.0d imports this construction from that section.

**Witness:** DerivedDeRhamCohomology's indexed head starts Layer 0 at §0.18 and explicitly imports K-flat tensor from DerivedModuleAlgebra §0.2. The latter exists on main, at `TauCetiRoadmap/DerivedModuleAlgebra/README.md:628`.

**Repair:** Replace all three supplier citations by DerivedModuleAlgebra §0.2, retaining DGAInfinity for enriched Hom and EnhancedDerivedSheaves E1.2 for K-injectives. No new gap is necessary. The actual supplier covers arbitrary unbounded complexes over commutative rings: its test `F₂ ⊗ᴸ_ℤ F₂` has H⁰ = H⁻¹ = F₂, whereas underived tensor has H⁻¹ = 0. This supplies precisely the required operation, without narrowing coefficients.

## R02 (P2) — The Iwahori theorem assumes the geometry it should test

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean:402`: “(cell : DoubleCoset.DecompQuotient … ≃ (Fin n → k))”. README counterpart: 1505–1523.

**Claim:** `iwahoriBasis_index` is an acceptance signature for the residue-field Iwahori index formula.

**Witness:** Its group and subgroup are arbitrary; `n` is unrelated to affine length. Taking G = I = 1, n = 0 and k = F₂ yields 1 = 2⁰ without any Iwahori geometry.

**Repair:** Delete this stand-in from `Suggested.lean`. State the actual Iwahori formula on the split reductive group, residue field, Iwahori and affine Weyl element if those carriers can be supplied by a few real definitions; otherwise name that theorem and its missing carriers in the module docstring. Keep cardinality transport as README proof background. In the repaired statement the rank-one simple reflection must give q, while the identity gives 1; those are distinguished by the actual affine length, not a supplied equivalence that already fixes the answer.

## R03 (P2) — State the essentially AIG scalar-endomorphism theorem

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:3757–3763`: “Prove that every equivariant endomorphism is scalar”; “the endomorphism statement is specified here only”.

**Claim:** This is a substantive endpoint of the essentially AIG interface, but only its predicates are retained in Lean.

**Witness:** `Suggested.lean:1073–1093` already defines absolute irreducibility, genericity and essentially AIG; 1141 supplies the GLₙ character formula, and 1210 uses the native GLₙ and intertwining-map carriers for the analogous co-Whittaker theorem.

**Repair:** Add the actual GLₙ scalar-endomorphism signature with n ≥ 1, the nonarchimedean field, coefficient characteristic different from the residue characteristic, nondegenerate smooth Whittaker character, and the essentially AIG hypothesis. Use real character data as required by R05. Do not assert it for arbitrary subgroup/character data. Cite EH Lemma 3.2.3, pp.18–19, or the paragraph after Hel12 Lemma 3.4 (Hel12 line 230), rather than calling Lemma 3.4 itself the scalar theorem. The rank-one character has End = κ; the direct sum of two such characters has End = M₂(κ) and fails the AIG hypothesis, as required.

## R04 (P2) — The advertised library route to van Dantzig lacks the locally compact step

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:264–266,557–559`: the two pinned results are described as the “two halves of van Dantzig's theorem”.

**Claim:** Those results supply the compact-open subgroup theorem for locally compact G.

**Witness:** `Mathlib/Topology/Algebra/OpenSubgroup.lean:603` requires `[CompactSpace G]`; `Mathlib/Topology/Separation/Profinite.lean:76` is likewise in the compact-space section. Neither applies directly to the additive group of ℚ₂.

**Repair:** Keep the general van Dantzig target, but explicitly own the missing locally compact argument and provide its exact source locator. One route obtains a compact clopen identity neighbourhood C, then proves its translation stabilizer is an open subgroup contained in C and hence compact. Do not assume C already is a subgroup. For G = ℚ₂ and C = ℤ₂ the stabilizer is ℤ₂, while G is noncompact; for C = 2ℤ₂ it is 2ℤ₂. These instances retain the intended generality and expose the missing step.

## R05 (P3) — Remove admitted constructions from the acceptance file

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean:65,215,233,254,447,505,611,700,717,732,750,903,1141`.

**Claim:** The gate's `sorry-data` rule fails at 13 declarations, including `smoothPart`, the abelian and Grothendieck instances, the cocharacter decompositions and `genericCharacter`.

**Witness:** At line 447 the entire `IsGrothendieckAbelian` instance is admitted; at 215 the functor's maps and laws contain admissions. These are constructions on which subsequent statements depend, not sorried theorem signatures.

**Repair:** Give genuinely simple retained definitions complete real bodies. Move heavy constructions to README targets and list the resulting unstatable headlines, with their missing carriers, in the docstring; remove signatures depending on those constructions. This is a gate-blocking policy violation even though classified P3 under the requested gate severity rule. For the trivial group, the retained smooth-vector predicate must still give all vectors; for the integral regular representation of ℤ₂ it must give zero. Do not replace constructions by arbitrary data or unconstrained predicates.

## R06 (P3) — Remove the roadmap import and inventory the missing headline carriers

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean:12,17–19`: `import TauCetiRoadmap.ReductiveGroupsPartII.Suggested`.

**Claim:** This file is tested against another roadmap's admissions as well as the pinned libraries. The module docstring acknowledges that import but does not list the unstatable headline theorems.

**Witness:** The point topology used by the four reductive finiteness signatures and second adjointness comes from that imported roadmap; the stated import rule permits only Mathlib and used individual TauCeti modules.

**Repair:** Remove the import. Retain only signatures statable using the allowed imports and a few simple real definitions. Explicitly name the remaining headline results and missing carriers in the docstring, including reductive point topology where it is genuinely unavailable. Keep the README supplier contract. A clean scratch elaboration must succeed with no roadmap import; the current successful elaboration is not that test. Do not substitute an arbitrary topology for the point topology.

## R07 (P3) — Delete the 75 admitted examples

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean:88` and the other 74 examples identified by the gate.

**Claim:** These are README Checks presented as admitted Lean examples, not headline acceptance theorems.

**Witness:** The examples at 135 and 147 respectively assert admissibility and full smooth part for the zero representation. Both compute boundary cases, and neither tests anything while admitted.

**Repair:** Delete them from `Suggested.lean`; keep their mathematical statements as README Checks. Retain at most a handful of proved, nontrivial tests of kept definitions. In particular the zero module still has invariants 0 and smooth part 0 = ⊤; these values belong in the README, not a sorried example.

## R08 (P3) — Fix the 506 TeX syntax violations

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:159,173–174,180` and the remaining locations counted by `tex`.

**Claim:** TeX-style exponents, subscripts and sums occur outside code spans/blocks.

**Witness:** Line 159 contains `q^{1/2}` in prose; 173–174 use braced subscripts/exponents for the parabolic and modulus. The supplied gate reports `tex=506`.

**Repair:** Use Unicode or put the same mathematical notation inside code spans. Update fragment links if a heading changes. Preserve the sign tests: for the upper GL₂ Borel over ℚ₃, δ(diag(3,1)) = 1/3 and the Jacquet half twist is √3. This is a formatting repair, not a normalization change.

## R09 (P3) — Delete library wrappers and elementary formula padding

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean:433–440,782–785,855–867`.

**Claim:** The normalizer multiplication wrapper, pseudoroot inversion identity and formal reversal of the defined quartic occupy the headline acceptance file.

**Witness:** Line 440 is exactly `HeckeCosetModule.single_mul_single_of_mem_normalizer ℤ h.1`; the pinned theorem is at `TauCeti/NumberTheory/HeckeRing/Normalizer.lean:219`. Line 785 is a single `simp only` proof. The quartic theorem just reverses its defining coefficients.

**Repair:** Delete these declarations from `Suggested.lean`, and any definitions left there solely to support padding. In particular a standalone `Pseudoroot` or `CrossedCocycle`/`gauge` with only elementary examples does not satisfy the definition-only-for-a-headline rule. Cite the normalizer theorem in the supplier contract; keep the inversion and quartic computations in README Checks. With trivial level in S₃, the normalizer statement computes δ_(12) δ_(23) = δ_((12)(23)), coefficient 1, directly from the supplier. The supplier even permits the second element to be arbitrary. Reversal of coefficients (1,−4,6,−4,1) returns the same tuple; that does not test the GSp₄ Satake factorization.

## Verified sound

Read both target files in full, the normative repository README and CONTRIBUTING, and main-branch roadmap examples ProfiniteCohomology and RepresentationTheory/InductionRestriction. The scope is a new local smooth-representation library, not a rewrite of a roadmap on main. No computational algorithm, copied source passage, `set_option`, stray file, or change outside the four authorized roadmap folders was found. No pull-request worktree file was edited.

The worker's gate fails four rules: `tex=506`, `sorry-data=13`, `sorry-examples=75`, `imports=1`; all other reported counters, including `build`, are zero. Each failure is recorded separately above. Fresh `lake env lean` elaboration of `Suggested.lean` returned exit 0 with only `sorry` warnings. A scratch copy with `#check @name` for all **65 named declarations** also elaborated: the required topological-group, reductivity, compactness and coefficient assumptions in the headline signatures remain in scope. No silent loss of a required section hypothesis was identified. This checks types, not truth or the admissibility of imported data.

The one-tactic scratch probe tried `simp`, `rfl` and `infer_instance` on all **20 admitted named theorems**. None closed; `levi_oppositeCocharacter` reached the default heartbeat limit. No option override was used. The already proved normalizer wrapper and pseudoroot identity supply the positive one-line witnesses in R09. The 75 admitted examples were classified directly by their statements rather than treated as headline theorems.

The dependency command returned exactly:

```text
depcheck: 186 roadmaps, 1138 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every supplier section and `Needs` occurrence was read; R01 is section-level drift that this graph check does not detect. No undeclared supplier gap was treated as a declared contract.

Resolved cross-roadmap contracts include:

- ReductiveGroupsPartII RG2.0 point topology (`Suggested.lean:101,175`), RG2.1 valuation convention (`README.md:1796–1825`), RG2.2.4 lattice chains, RG2.3 levels, RG2.4 decomposition/index and adjoint modulus (`README.md:6308,6367`; `Suggested.lean:1556`), and RG2.5 dual/L-group. The valuation of a uniformizer is −1 in the supplier's apartment map; the normalized absolute value is q⁻¹ here. AdelicAlgebraicGroups `README.md:295–299` consumes the same modulus from RG2.4 rather than supplying it back to SR. IntegralHeckeAndGaloisDeterminants is a consumer, not an input.
- ProfiniteCohomology on main, layers 0, 1, 7 and 10 (`README.md:583,630,1168,1549`): discrete carrier, invariants, Shapiro and continuous cohomology. ProfiniteProPGroups is archived on main under `Completed/ProfiniteProPGroups`; its layer 1 supplies the supernatural-order vocabulary.
- RepresentationTheory/InductionRestriction on main, layers 0 and 3: algebraic induction, projection and finite Mackey; ModularForms on main, layer 2 (`README.md:383`): double-coset Hecke algebra. These are different from the general locally profinite function/measure comparison constructed here.
- ReductiveGroups on main, layers 3, 7 and 9: algebraic subgroups, relative structure and pinned integral groups; ClassFieldTheory layer 9 (`README.md:1505`): Weil group; LocalFieldsRamification layer 4: marked arithmetic Frobenius and tame presentation. Arithmetic Frobenius conjugates tame inertia by q, not q⁻¹.
- DGAInfinity layers 0–1 (`README.md:282`): the linear enriched Hom complex; EnhancedDerivedSheaves E1.2 (`README.md:538`): replacements for an arbitrary Grothendieck category. DerivedModuleAlgebra §0.2 supplies the K-flat input that R01 repoints.

Object searches used both pinned source trees, the roadmap-service index of main and open heads, the supplied sibling checkouts, and board package READMEs/plans. The key families searched were open stabilizers/smooth vectors, Hecke convolution and normalizer multiplication, induction/coinvariants, Whittaker/AIG/co-Whittaker, dg replacements, stable operators, Hall–Littlewood and finite-wild/crossed cocycles. No collision of this file's fully qualified declaration names was found in the searched roadmap files. The noncommutative crossed-cocycle carrier differs from the additive ring-valued `TauCeti.IsCrossedHom`; the general stable-operator predicate differs from the finite-length Fitting theorem. The library wrapper in R09 is an actual duplication. Search hits in consumers were not treated as suppliers or used to move ownership upward.

Pinned declarations opened (paths relative to the respective library repositories):

| Object | Pinned evidence and limitation |
|---|---|
| Compact subgroup basis | Mathlib `Topology/Algebra/OpenSubgroup.lean:603`; global compactness is required, R04. |
| Clopen basis | Mathlib `Topology/Separation/Profinite.lean:76`; compact Hausdorff totally disconnected space. |
| Coinvariants | Mathlib `RepresentationTheory/Coinvariants.lean:53,57,79,106,113`: span of ρ(g)v−v, quotient, class, lift and compatibility. No averaging or characteristic restriction. |
| Character twist | TauCeti `RepresentationTheory/CharacterTwist.lean:86,99,105,109`: action χ(g)ρ(g), trivial and composed twists. Whittaker uses χ⁻¹. |
| Smooth discrete carrier | TauCeti `RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:618`: full subcategory of topologized representations. It does not itself define the untopologized carrier used here. |
| Normalizer multiplication | TauCeti `NumberTheory/HeckeRing/Normalizer.lean:219`: any coefficient semiring; only the left element need normalize. |
| Fitting decomposition | Mathlib `RingTheory/Artinian/Module.lean:308`: Artinian section and Noetherian hypothesis; not arbitrary infinite products. |
| Existing crossed maps | TauCeti `Topology/Algebra/Group/CrossedHom.lean:77`: additive ring-valued identity with a unit-valued character, not arbitrary noncommutative H. |
| Dynamic Levi projection | TauCeti `Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean:101,119,167`: kernel, surjectivity and Levi splitting. |

The headline inventory is: smooth coreflection and exact invariants; Haar existence/uniqueness and Hecke-ring comparison; Iwahori presentations; the Grothendieck/derived smooth category and compact generation; induction adjunctions, geometric lemma and Casselman pairing; irreducible/uniform admissibility, finite length and Noetherianity; Bernstein decomposition/centre and second adjointness; tempered support and Langlands classification; integral/normalized/c-group Satake and GLₙ/unitary/GSp₄ formulas; derivative calculus, integral blocks/second adjointness, AIG and co-Whittaker scalar endomorphisms, universal domination/reconstruction and LLC families; finite-wild representability, quotient finiteness, excursion comparison and stable contracting operators. The Lean file states some of the early adjunctions and finiteness results and co-Whittaker scalars. R02, R03, R05 and R06 explain why it is not yet an acceptance test for this inventory. The many unstated headlines are not individually named with their missing carriers in its docstring.

Sampled source audit: **15 requested targets**, of which **12 have accessible source text or a directly computed Check** and **3 depend on unread Ber92**. The three unread items are smooth vectors, cuspidal representations and the Hecke decomposition; their numerical tests below are not substitutes for locator verification. No additional locator was explicitly labelled unverified in the README.

| Sample | Text read, hypotheses and outcome |
|---|---|
| Smooth vectors and smooth part | Ber92 Ch.I §1.1 p.7 unavailable; structural tests below only. |
| Pro-p Iwahori torus | BCGP lines 995–1039, §2.4.1 Prop.2.4.2, pp.20–21: positive products, inverted residue characteristic and chosen half modulus. The README distinguishes residue and coefficient primes. General-ring extension is separately owned. |
| “Check:” | README 1477: zero coefficient ring gives a one-element unit group, kernel the whole torus. Directly computed; no theorem citation needed for this counterexample. |
| Positive Klingen algebra | Pil lines 916–922, §5.1.4 p.21: the three displayed integral generators and polynomial algebra, without inverting U₀. |
| Compact derived generators | FS lines 824–838, Theorem I.5.1(iii), p.24: ℤℓ-algebra coefficients and the reductive local group. README explicitly owns its more general algebraic cofinal-unit-pro-order proof. |
| Cuspidal representations | Ber92 Definitions 14,16, pp.34,36 unavailable. |
| Hecke decomposition | Ber92 Theorems 9,13, pp.29,42 unavailable. |
| Integral/normalized Satake | TV lines 1200–1257, §7.2 pp.206–207: the integral and square-root forms. The README's explicit inverse dictionary is necessary. |
| Twist-sign Check | TV lines 1204–1213 and 1250–1257: computed GL₂ mismatch between the printed point action and raw transform; corrected inverse action tested below. |
| Canonical c-group | TV preprint-v1 lines 1376–1409, §§7.8–7.9 pp.29–31: characteristic ≠2 and cyclotomic graph; the source version is explicitly distinguished from publication. |
| Spherical descent | Les lines 951–1005 and 1050–1063, Lemmas 3.1–3.2 pp.23–25: unramified quadratic E/F, complex coefficients, normalized descent and extra determinant twists. |
| Mirabolic functors | EH lines 605–667, Definition 3.1.1, Remark 3.1.2, Propositions 3.1.3–3.1.4 pp.12–14: unnormalized functors and descent of functors, not of the quotient map. |
| Minimal-prime reconstruction | Hel12 lines 545–563, Lemma 6.4 p.13: reduced Noetherian base, diagonal image, uniqueness. README supplies the needed nonzero generic-fiber qualification omitted in the printed statement. |
| Segments | EH lines 1484–1518, §4.3 p.30; AKY lines 271–285 and 528–544, §2.1 p.7 and Lemma 2.9 p.14: ascending product, Z subrepresentation, L/Steinberg quotient; highest derivative shortens the right endpoint after the involution. |
| Crossed cocycles/gauge | DHKM2 lines 455–482, §2.1 pp.10–11, and §1.2: section of the semidirect product and twisted conjugation h c(γ) α(γ)(h)⁻¹. |

Additional reads: MS lines 3892–3918 verify the generic unlinked-segment classification and its relation to genericity; Stacks tag 079P lines 883–886 supplies functorial K-injectives in a Grothendieck category, and tag 070Y lines 4864–4871 says these compute right derived functors. The sources were fetched through the source service; the roadmap's manifest was not edited.

The following table records computed instances, not proofs of the general targets. “Retain” means the displayed instance agrees with the target; it does not certify an unread source. README line numbers identify each named target; API and convention checks are recorded with their owning target. Empty/rank-zero instances are supplemented by nonzero and negative controls where they distinguish the construction.

| Statement (README line) | Instances tried | Values on the two sides / distinguishing values | Result and change |
|---|---|---|---|
| van Dantzig (549) | ℚ₂, neighbourhoods ℤ₂ and 2ℤ₂; ℝ | Compact-open witnesses ℤ₂ and 2ℤ₂; ℚ₂ noncompact. In ℝ every open subgroup is ℝ, which is noncompact. | Target survives; repair route R04. |
| Smoothness (567) | ℤ₂ regular ℤ-module; trivial line | Stabilizer of δ₀ = {0}, not open; stabilizer of 1 in the line = ℤ₂, open. | Retain. |
| Smooth vectors/coreflection (587) | Same two representations; zero | Smooth part 0 versus the whole line; zero maps to zero. Inclusion Hom(line,line) and Hom(line,smooth part) both ℤ. | Retain mathematics; R05. |
| Smooth category (622) | Discrete C₂, trivial ℚ-line | All stabilizers open; equivariant endomorphisms = ℚ on both full-subcategory and ambient sides. | Retain. |
| Abelian category (645) | G = 1, multiplication by 2 on ℤ | Kernel 0, cokernel ℤ/2 in both categories; quotient remains smooth. | Retain; admitted instance R05. |
| Discrete comparison (663) | C₂ sign on discrete ℤ | Stabilizers are C₂ at 0 and 1 at nonzero vectors; action is continuous in the discrete topology. | Both predicates true. |
| Compact invariants (690) | C₂ regular ℚ-module, subgroups 1 and C₂ | Fixed dimensions 2 and 1; invariant generator (1,1); conjugation preserves the one-dimensional line. | Retain. |
| Unit pro-order (716) | ℤ₂ with ℚ, F₂, zero ring | Quotient order 2 is respectively a unit, a nonunit, and the sole element/unit. | True, false, true; zero-ring clause needed. |
| Averaging (752) | C₂ on ℚ² by swap | e(1,0) = (1/2,1/2); e²(1,0) has the same value; sign-line projector = 0. | Retain. |
| Exact invariants (778) | C₂ regular augmentation over ℚ and F₂ | Invariant sum maps to 2: surjects over ℚ, maps to 0 over F₂, whose target invariants have dimension 1. | Unit hypothesis discriminates. |
| Admissibility (794) | Compact ℤ₂, trivial ℚ and trivial ℚ^(ℕ) | Full fixed dimensions 1 and infinite; zero module dimension 0. | True, false, true. |
| Finite generation/local admissibility (829) | Trivial action on ⊕ℕℚ | Each vector spans a finite-dimensional submodule; full invariant space has infinite dimension; group-module generation needs infinitely many generators. | Locally admissible, neither admissible nor finitely generated. |
| Characters/twists (855) | Valuation character χ(ϖ) = 2 | Twisted line sends 1 to 2; inverse twist sends it to 1/2; two twists give 4. | Retain order. |
| Smooth dual (884) | C₂ sign line; zero | Dual sign = sign, double dual evaluation sends 1 to 1; dual of zero = 0. | Retain. |
| Coefficient change (912) | Swap representation over ℤ[1/2], extend to ℚ | Invariants generated by (1,1) on both sides; tensor generator maps to (1,1), not 0. | Retain averaging hypothesis. |
| Smooth centre (933) | G = 1, A = ℤ; C₂ over ℚ | Centre = ℤ in first case, ℚ×ℚ in second; scalar a acts as (a,a). | Ring/identity laws agree. |
| Compactly supported locally constant functions (978) | Discrete ℤ; δ₀ and constant 1 | Supports {0} and ℤ; only δ₀ has compact support. Zero has empty support. | Retain. |
| Open–closed sequence (1003) | X = {0,1}, U = {0} | A → A² → A is a↦(a,0), (a,b)↦b; kernel = A×0, composite = 0. | Exact. |
| A-valued Haar (1029) | ℤ₂, normalized ℚ-valued measure; F₂ coefficients | μ(ℤ₂)=1, μ(2ℤ₂)=1/2; F₂ normalization would require 1=2μ(2ℤ₂)=0. | Retain unit pro-order. |
| Integration (1060) | Discrete two-point support, counting measure | Integral of 2δ₀+3δ₁ is 5; refining support gives 2+3=5; empty support gives 0. | Retain. |
| Convolution (1092) | Discrete S₃, s=(12), t=(23) | δ_s*δ_t=δ_(123); δ_t*δ_s=δ_(132); coefficient at (123) is respectively 1 and 0; δ₁ is unit. | Noncommutative order retained. |
| Normalized idempotents (1123) | C₂, counting measure over ℚ | e=(δ₁+δ_s)/2; e²=(δ₁+δ_s)/2; raw sum squared is 2 times raw sum. | Normalization discriminates. |
| Permutation Hecke algebra (1152) | Valuation quotient ℤ, χ(1)=2 | Right operator at +1 gives 1/2; associated left inverse-double-coset operator gives 2. | Inverse convention retained. |
| Hecke-ring comparison (1203) | U=1 in S₃ | Endomorphism image of basis 1 reads inverse representative; products after inversion give st rather than ts. Coefficient of δ_st is 1. | Retain comparison, R09 wrapper deletion. |
| Local units (1236) | Finitely supported functions on ℕ with pointwise product | δ₀ fixes δ₀; δ₀+δ₁ fixes δ₀+δ₁; no finite-support element fixes every δ_n. | Local units exist, global unit does not. |
| Hecke-module equivalence (1268) | Finite C₂, ℚ coefficients | Integrated δ_s acts as the original involution; averaging acts (1,0)↦(1/2,1/2) in both models. | Retain. |
| Irreducible corners (1291) | ℚ[C₂], e=(1+s)/2 | e·trivial line dimension 1; e·sign line dimension 0. | Only nonzero fixed-space simples enter correspondence. |
| Centre via corners (1313) | C₂ over ℚ | Full centre ℚ×ℚ; trivial corner sees first coordinate, sign corner second. Their pair distinguishes (1,0) from (0,1). | Retain compatibility. |
| ℓ-adic separatedness (1345) | G=1, Λ=ℤℓ | ∩ℓⁿΛ=0; in ℚℓ, ℓⁿΛ=Λ and intersection=Λ. | Integral hypothesis discriminates. |
| Iwahori decomposition/positivity (1369) | Upper GL₂ Borel, z=diag(ϖ,1) | Conjugation sends upper entry x↦ϖx and lower entry y↦ϖ⁻¹y; intersections have index q on the contracting side. | Retain direction. |
| Positive Hecke homomorphism (1395) | GL₂ positive translations z,z² | Index degrees q and q²; product index q³; [z][z²]=[z³] in the positive algebra. | Retain. |
| Strongly positive localization (1449) | Torus positive monoid ℕ | A[t] localized at t = A[t,t⁻¹]; t·t⁻¹=1, while t⁻¹ is absent before localization. | Retain. |
| Pro-p Iwahori torus (1462) | G=Gm, residue size 3 | T(F)/T(O)₁ ≅ ℤ×F₃×; uniformizer maps to the nonidentity basis element at valuation 1; principal unit maps to 1. | Kernel exactly T(O)₁. |
| Seeded zero-ring Check (1477) | Same torus, A=0 | Unit group has one element; uniformizer and 1 have identical images; kernel is all T(F). | Negative control correct. |
| Positive Klingen algebra (1486) | ℓ=2; three diagonal generators | Diagonals (2,2,2,2), (4,2,2,1), (2,2,1,1) have paired products 4,4,2. (2,1,1,1) has paired products 2 and 1, so is excluded. | Form convention agrees with Pil. |
| Iwahori–Matsumoto (1505) | q=2, simple reflection s; identity | T_s²=T_s+2; sign eigenvalue −1 gives 1=−1+2; trivial eigenvalue 2 gives 4=2+2. Identity degree 1, simple-reflection degree 2. | Retain README; R02 Lean stand-in. |
| Bernstein presentation (1535) | Rank one, q=1 specialization | Cross relation reduces to T_sθ_x=θ_sxT_s; for x=1 in lattice ℤ, exponents 1 and −1 differ. | Algebraic boundary preserves Weyl action. |
| Iwahori centre (1558) | Rank-one Laurent lattice, inversion | x+x⁻¹ is fixed; x is not, since x≠x⁻¹ as Laurent monomials. | Centre must retain Weyl invariants. |
| Grothendieck property (1597) | G=1, module ℤ | Generator Hom(ℤ,M)=M; filtered union of finite-rank free summands is ⊕ℕℤ; inclusion kernels are 0. | Basic generator/colimit tests agree; R05. |
| Derived smooth category (1611) | G=1, [ℤ --1→ ℤ] | Both cohomology groups 0; its derived object is 0. ℤ[0] has H⁰=ℤ. | Acyclic localization discriminates. |
| K-injective replacement (1638) | Zero complex; ℚ[0] in Ab | Zero remains 0; ℚ is injective and identity replacement induces H⁰=ℚ on both sides. | Supplier resolved; general theorem is Stacks 079P. |
| Derived invariants (1660) | G=ℤ₂, A=F₂ | H⁰=F₂; H¹=Hom_cont(ℤ₂,F₂)=F₂, represented by reduction mod 2. | Derived functor cannot be underived invariants. |
| dg enhancement (1687) | Two complexes [ℤ --1→ ℤ] | Degree-one tensor differential (x,y)↦x−y; (0,1)↦−1; d²(1)=1−1=0. | Koszul sign correct; supplier R01. |
| Compact generation (1718) | G=1, A arbitrary; C₂, A=F₂ | RHom(A,A[n]) = A for n=0, 0 otherwise; Hom(A,⊕A)=⊕A. C₂-trivial F₂ is not projective: invariant augmentation image 0. | Unit pro-order separates failure. |
| Derived smooth duality (1735) | C₂ sign over ℚ; K=C₂ and K=1 | Dual sign line nonzero; K-fixed dual dimensions 0 and 1 equal duals of fixed-space dimensions 0 and 1. Hom_G(sign,ℚ)=0 is not the smooth dual. | Retain internal-Hom formulation. |
| Central Ext separation (1780) | ℚ[t,t⁻¹]-modules t=1 and t=2 | Central difference acts as 1−2=−1, invertible; Hom=Ext¹=0. For equal eigenvalue 1, Ext¹=ℚ. | Hypothesis discriminates. |
| Derived Hecke (1792) | G=U=C₂, S=F₂ | Ext⁰(F₂,F₂)=F₂ and Ext¹=F₂; ordinary Hecke has only degree zero. | Retain derived content. |
| Smooth induction (1841) | H=1 in finite C₂ | Ind of a line has dimension 2; right translation swaps the two coordinates. H=G gives dimension 1. | Retain. |
| Compact induction (1863) | H=1 in discrete ℤ | c-Ind A = ⊕ℤA; Ind A = ∏ℤA; constant 1 lies only in the latter for A≠0. | Support condition discriminates. |
| Frobenius adjunctions (1883) | H=1 in C₂, trivial line | Hom_G(Ind 1,1) and Hom_H(1,1) both dimension 1; evaluation sends a constant function to its value. | Both directions agree. |
| Induced invariants (1902) | H=1, K=C₂ versus K=1 | Double-coset counts 1 and 2; invariant dimensions of regular module 1 and 2. | Retain. |
| Induction exactness (1914) | H=1 in C₂, ℤ→ℤ/2 | Induced surjection ℤ²→(ℤ/2)² is coordinatewise onto; kernel (2ℤ)². | Open compact-induction case exact. |
| Induction in stages (1925) | 1≤C₂≤S₃ | Dimensions [S₃:C₂]·[C₂:1]=3·2=6=[S₃:1]; basis cosets identify six vectors. | Retain. |
| l-sheaf model (1939) | Finite quotient H\G with three points | Sections A³ and compact sections A³; stalk at a coset A; extension by zero of one stalk has support one point. | Retain. |
| Mackey filtration (1966) | H=K=⟨(12)⟩ in S₃ | H\G/H has cells of sizes 2 and 4; restricted 3-dimensional permutation module has summand dimensions 1+2=3. | Nonabelian test agrees. |
| Modulus/half (1983) | Upper GL₂ at diag(3,1), opposite Borel | δ=1/3, opposite δ=3; normalized induction half=1/√3, Jacquet half=√3. | Signs agree with RG2. |
| Jacquet module (2035) | N=1; sign action of C₂ over ℤ | Coinvariants V and ℤ/2 respectively; relation on 1 is −2. | Retain actual quotient. |
| Jacquet exactness (2059) | Trivial N; C₂ over F₂ as excluded averaging case | Trivial N preserves kernel/cokernel; F₂[C₂]→F₂ has invariant-sum image 0. | p-inversion is substantive. |
| Parabolic induction (2071) | P=G; upper GL₂ torus input | P=G returns σ; δ_B^(1/2)(diag(3,1))=1/√3 multiplies σ there. | Identity and half twist agree. |
| First adjointness (2093) | P=G, nonzero line | Both functors identity; Hom dimensions 1=1; unit sends 1↦1. | Retain direction R_P ⊣ I_P. |
| Induced contragredient (2108) | Torus χ(ϖ)=2 | Dual parameter 1/2; pairing 2·(1/2)=1. Zero stays zero. | Retain inverse. |
| Geometric lemma (2126) | GL₂, Borel, regular characters χ₁≠χ₂ | Two graded torus characters (χ₁,χ₂) and (χ₂,χ₁), each multiplicity 1; torus case has one cell. | Filtration, not automatic splitting. |
| Principal-series Jacquet (2145) | Parameters (2,3); repeated (2,2) | Distinct characters give two distinct graded lines; repeated parameters give two equal lines, total multiplicity 2. | Repetition does not imply split extension. |
| Canonical lifting (2159) | P=G; zero representation | Invariant-to-Jacquet map is identity on V^K; on zero its image and kernel are 0. | Boundary agrees; general proof is Casselman's. |
| Casselman pairing (2188) | Torus line χ and χ⁻¹ | Pairing of transported unit vectors is 2·(1/2)=1; pairing with zero is 0. | Nondegeneracy distinguishes zero pairing. |
| Iwahori–Jacquet comparison (2203) | Unramified GL₂ principal series | Iwahori invariants dimension 2; torus Jacquet invariants dimension 2. For GL₁ both are 1. | Retain. |
| Whittaker functionals (2221) | GL₂ trivial representation and Steinberg | Top Whittaker dimensions 0 and 1; scalar multiples of a nonzero functional form a line. | Genericity and uniqueness distinguished. |
| Compact representations (2290) | Finite C₂ regular complex representation | All matrix coefficients have finite support; decomposition 1⊕sign, both multiplicity 1. | Compact-support and semisimple tests agree. |
| Cuspidality (2319) | GL₁ character; trivial GL₂ representation | GL₁ has no proper parabolic, so all required Jacquets vanish vacuously; GL₂ trivial has Borel Jacquet a nonzero line. | Predicate agrees; Ber92 locator unverified. |
| Harish-Chandra compactness (2345) | GL₁ modulo its centre | G/Z is one point; coefficient support modulo centre is that compact point; proper Jacquet tests empty. | Boundary agrees; general theorem not proved by this test. |
| Jacquet subrepresentation (2363) | Torus character χ | Minimal Levi G; induction I_Gχ=χ; embedding is identity, image dimension 1. | Retain. |
| Irreducible admissibility (2373) | Unramified and ramified GL₁ characters | O×-fixed dimensions 1 and 0; at sufficiently small kernel subgroup both are 1. | Retain. |
| Compact-induction criterion (2398) | H=G=C₂, sign line | Outside-H intertwining tests empty; induced module is the sign line, dimension 1 and irreducible. H=1 yields reducible regular dimension 2. | Hypothesis on outside intertwiners matters. |
| Hecke decomposition (2422) | G=F×, K=O× | H₀=D=ℂ, Λ_Z=Λ=ℤ, C=ℂ[t,t⁻¹]; H₀DCH₀=C=H. | Torus computation agrees; Ber92 locator unverified. |
| Commutative-subalgebra bound (2444) | V=ℂ², diagonal algebra | With one generator diag(0,1), m=2,l=1: dim R=2=m¹. For l=3 the bound is 2^(7/4)>2. On a line both sides are 1. | Retain numerical bound. |
| Uniform admissibility (2453) | GL₁, fixed compact open K | Fixed dimensions range over {0,1}; uniform constant 1 works independently of χ. | Quantifier order preserved. |
| Fixed-level cuspidal components (2469) | GL₁ at K=O× | Unramified characters all lie in one inertial class; class count 1 despite infinitely many characters. | Finite classes, not finitely many characters. |
| G°/unramified characters (2505) | G=F× | G°=O×, quotient ℤ; character with value 2 sends ϖ² to 4 and units to 1. | Retain. |
| Finite length (2545) | G=1, ℂ²; ⊕ℕℂ | Length 2 and infinite; the latter has neither finite generation nor admissibility. | Both finite hypotheses retained. |
| Cuspidal support (2561) | GL₂ regular unramified principal series | Two inducing orderings (χ₁,χ₂),(χ₂,χ₁) have the same support orbit, size 2; GL₁ support is the character itself. | Conjugacy quotient needed. |
| Generic irreducibility (2591) | GL₂, unramified ratio z | Reducibility at z=q or q⁻¹; q=2 gives {2,1/2}; z=3 is outside these two points. | Proper exceptional locus. |
| Bernstein components (2605) | GL₁, characters χ and χ·unramified(2) | Same restriction to O×, hence one inertial class; different unit characters give two classes. | Exact and inertial supports differ. |
| Cuspidal splitting (2638) | Torus, fixed unit-character block | Projection of χ in block =χ; projection of distinct unit character =0; composing projector twice gives same 1/0 values. | Retain. |
| Bernstein decomposition (2670) | Sum of two torus characters in distinct blocks | Block components dimensions (1,1); reconstruct dimension 2; cross-block Hom=0. | Direct-sum support retained. |
| Noetherianity (2682) | Unramified torus block ℂ[t,t⁻¹] | Ideal (t−2) generated by one element; quotient dimension 1; ring has one generator as module over itself. | Representative finite-module case agrees. |
| Bernstein centre (2694) | Unramified GL₁ block | Centre ℂ[t,t⁻¹]; on χ(ϖ)=2, t acts as 2 and t⁻¹ as 1/2. | Evaluation identifies exact support. |
| Finite centre corners (2711) | Spherical GL₁ corner | Hecke algebra equals its centre, finite module rank 1. Zero corner rank 0. | Retain. |
| Universal unramified twist (2724) | GL₁ universal parameter X, specialize X=2 | ϖ acts by X before specialization and 2 afterward; ϖ⁻¹ specializes to 1/2. | Retain tautological direction. |
| Centre compatibilities (2752) | Product of two unramified tori | ℂ[x±¹]⊗ℂ[y±¹]=ℂ[x±¹,y±¹]; evaluation at (2,3) sends xy to 6 on both sides. | Retain tensor convention. |
| Square-integrable/tempered (2767) | Unitary GL₁ character; absolute-value character | Modulo centre is a point; unitary coefficient norm 1. At ϖ, absolute-value character norm q⁻¹≠1. | Real twist not tempered on the torus. |
| Casselman criterion (2791) | P=G; GL₂ Steinberg normalized Jacquet | No radical roots for P=G; Steinberg's Borel Jacquet character is δ_B^(1/2), value q⁻¹/² on diag(ϖ,1). | Strict inequality in contracting direction. |
| Tempered support (2817) | Unitary torus character | Levi G, discrete-series datum χ, inclusion and retraction identity; composite scalar 1. | Boundary agrees; source treats general input as hypothesis. |
| Langlands classification (2830) | Torus, real unramified weights 0 and 1 | Standard module is a line in both cases; parameter norms 1 and q⁻¹; only weight 0 tempered. | Retain tempered condition. |
| Iwahori block (2850) | GL₂ trivial and Steinberg | Iwahori-fixed dimensions 1 and 1; generator T_s acts by q and −1. | Distinct simple Hecke modules. |
| Nonsplit Iwahori components (2865) | Ramified norm-one torus, odd residue characteristic | Full bounded subgroup/connected parahoric index 2; trivial character and component-sign character differ on this quotient. | Connected and full fixers cannot be identified. |
| Steinberg (2893) | Semisimple rank 0; GL₂ | Rank 0 gives trivial line; GL₂ quotient of unnormalized Ind_B 1 by constants has Whittaker dimension 1, constants have 0. | Sub/quotient convention retained. |
| Regular isotypic quotient (2914) | C₂ regular ℂ-module | Trivial and sign isotypic dimensions each 1; respective endomorphism blocks ℂ and ℂ. | Multiplicities agree. |
| Stabilization (2955) | Identity and nilpotent 2×2 Jordan operator | Identity: ker=0, image=V for every power; nilpotent: T²=0, ker=V, image=0 from exponent 2. | Stable split has correct direction. |
| Smooth Jacquet lemma (2976) | P=G, arbitrary smooth V | Transition operator identity; stable image=V^K; Jacquet invariants=V^K. | Boundary agrees, no admissibility used. |
| Jacquet duality (2988) | Torus χ(ϖ)=2 | Both sides have character 1/2; opposite parabolic equals G. | Retain opposite convention. |
| Second-adjunction unit (3002) | P=G, identity object | Unit and counit identity; each triangle composite sends v↦v, not 0. | Nonzero triangle test. |
| Second adjointness (3036) | P=G; upper/opposite GL₂ at ϖ | Identity adjunction on torus; unnormalized right-adjoint extra δ_P value q⁻¹, not q. | Twist sign agrees with displayed normalized adjunction. |
| Satake transforms (3088) | GL₂, q=3, first double coset | Raw transform 3X₁+X₂; normalized √3(X₁+X₂); at (1,1): 4 and 2√3. | Retain both normalizations. |
| Twisted Weyl action (3115) | q=3, (x,y)=(2,5) | Correct s*(x,y)=(5/3,6); raw polynomial 11 before and 11 after. Applying s twice returns (2,5). | Action law and invariant agree. |
| Twist-sign Check (3137) | q=3, (1,1) | Correct inverse twist gives 3·(1/3)+3=4; printed opposite twist gives 3·3+1/3=28/3, versus original 4. | README correction necessary. |
| Satake isomorphism (3148) | Split torus and GL₂ identity | Torus transform sends δ_ϖ to X, product δ_ϖ² to X²; identity sends 1 to 1. | Ring and normalization tests agree. |
| Torus dictionary (3158) | GL₁, α=2 | Uniformizer maps to 2, its inverse to 1/2; arithmetic Frobenius parameter is 2 in the specified dictionary. | Inversion distinguishes geometric convention. |
| Frobenius invariants (3168) | Torus lattice ℤ, action −1; rank-two swap | Fixed character lattice 0 gives coordinate ring k; swap-fixed lattice ℤ(1,1) gives k[z±¹]. | Coinvariant torus, not naïve full torus. |
| Pseudoroot (3184) | GL₂, q=4 | x=(1/2,2), x²=(1/4,4); swap plus twist (1/4,4) fixes x. Multiply x by central 2: square becomes (1,16), wrong. | Both square and fixed-point laws needed; R09. |
| Spherical eigencharacters (3216) | GL₁ α=2; GL₂ swapped parameters | δ_ϖ eigenvalue 2; symmetric sum/products for (2,3) and (3,2) both 5 and 6. | Weyl orbit, not ordered pair. |
| c-group Satake (3231) | Torus; PGL₂; change √q to −√q | Torus root-sum sign=1; quotient removes scalar sign. For PGL₂ determinant of the c-group point equals q in both square-root choices. | Characteristic ≠2 and graph retained. |
| GLₙ generators (3256) | n=1; n=2 first/central coset | n=1 gives Laurent X; n=2 gives q^(1/2)e₁ and e₂; central inverse gives e₂⁻¹. | Polynomial plus central localization. |
| Hall–Littlewood (3269) | n=0,1,2; λ=0; t=−1 | Empty P=1; P_(−1)(X)=X⁻¹; universal P_(0,0)=1. Raw total division at t=−1 gives 0/0=0, not 1. | Universal specialization required. |
| Macdonald formula (3315) | GL₂(E), q_F=3, λ=(1,0) | q_E=9; normalized coefficient √9=3, so transform=3(X₁+X₂)=q_F P_(1,0). | q versus q² distinguished. |
| Spherical descent (3322) | a=1,b=2,q=3; a+b=n and M=G | Extra ξ substitution at all-one point gives (1/9,1/3,1/3). GL₂(E) δ_B(ϖ,1)=1/9, half=1/3; M=G half=1. | Retain E-absolute value and separate ξ twist. |
| Ordered unitary parameters (3361) | Rank 2, α=2; rank 3 | Eigenvalues (2,1/2); polynomial T²−(5/2)T+1. Rank 3 adds eigenvalue 1, giving zero at T=1. | Reciprocal pairing and middle eigenvalue retained. |
| Unitary genericity (3378) | P=T−1; P=(T−1)²; dual numbers | First derivative at 1 is 1 versus 0. With q=−1, first P(−q)=0. Nilpotent ε is nonzero but not a unit. | Unit tests stronger than nonvanishing. |
| Unitary trace coordinates (3406) | One pair x,x⁻¹, x=2 | μ=x+x⁻¹=5/2; replacing by x alone gives 2. | Both monomials necessary. |
| Unitary triangular Satake (3417) | Even rank 2, q=3 | S(T₁)=3μ+2; at x=1, μ=2, value 8. Leading coefficient 3, lower constant 2. | Retain lower terms. |
| Mixed-level counts (3434) | Even rank 2, q=3 | Isotropic-line count q+1=4; I=4T₀+T₁ gives transform 4+3μ+2=3(μ+2). | Count agrees with spherical identity. |
| Universal unitary coefficients (3448) | q=3 and q=−1 | d₀=1,d•₀=0; at 3 d₁=−20,d•₁=−3; at −1 d₁=0,d•₁=1. | No division by q+1 on evaluation. |
| Even unitary formulas (3470) | r=1,q=3 | R=4,T=−3; S(I)=3μ+6; 4R−I=10−3μ; R+4T=−8=−(9−1). | All three displayed sides agree. |
| Odd unitary formulas (3487) | r=1,q=3 | S(T₁)=9μ+2; I=28+T₁ gives 9μ+30; T=−20+T₁ gives 9μ−18. | Equals 9(μ+3+1/3) and 9(μ−2). |
| GSp₄ spin polynomial (3499) | q=2, roots (1,2,4,8) | Paired product 8; T₀=1,T₁=30,T₂=15; coefficients (1,−15,70,−120,64) equal ∏(1−αX). | Actual Satake factorization discriminates scalar-only padding. |
| GSp₄ monic comparison (3525) | Same parameters | Reversal gives (1,−15,70,−120,64) in descending degree; determinant 64=8². At X=0 monic polynomial value 64. | Reversal index 4, not dynamic degree. |
| Finite discrete cup comparison (3535) | C₂, F₂; degree-zero units | H⁰=F₂, H¹=F₂ on both models; degree-zero 1 cups with generator to generator. | Additive equivalence alone insufficient for this law. |
| Derived Satake (3554) | Torus, ℓ=2,q=3 | q≡1 mod2; finite residue torus C₂ has H¹(C₂,F₂)=F₂; degree-zero Satake monomial X unchanged. | Higher degree survives. |
| Unitary Iwahori centre (3571) | Rank-one inversion orbit | x+x⁻¹ central invariant, x not invariant; evaluating at 2 and 1/2 gives 5/2 in both cases. | Coefficient restrictions retained. |
| Whittaker coinvariants (3621) | C₂ trivial ℤ-line, sign ψ; ℚ extension | Relation −2 gives ℤ/2 with nonzero [1]; extending to ℚ gives 0; ψ-character line has quotient A. | Character nontriviality alone does not force zero. |
| Mirabolic derivatives (3658) | n=1; GL₂ trivial and Steinberg | D⁰=id; n=1 top derivative is original line; GL₂ top dimensions 0 and 1. | Unnormalized functors and n-range retained. |
| Derivative filtration (3709) | n=1; generic versus zero-top-derivative component | Φ⁺Φ⁻ part is 0 in rank 1, Ψ⁺Ψ⁻ is identity; derivative of zero is 0. | Boundary exact sequence 0→0→V→V→0. |
| Schwartz submodule (3724) | n=1 and V with zero top derivative | J(V)=V in rank 1; if V^(n)=0 then J(V)=0; tensoring rank-one J by A² gives A². | Image must be canonical injection, not arbitrary range. |
| Essentially AIG (3748) | Generic character line; two copies; zero | Socle dimensions 1,2,0; End rings κ,M₂(κ),0. Only first is AIG. | R03 missing signature. |
| Distinguished cuspidal types (3779) | GL₁ | No proper parabolic; chosen compact character η on O× has one-dimensional type space. Different η gives Hom dimension 0. | Rank-one coverage and intertwining tests. |
| Type projective construction (3860) | GL₁, trivial type over ℤℓ, ℓ≠p | c-Ind from O× has valuation basis indexed by ℤ; one type generator produces all basis translates; coinvariants at identity type rank 1. | Projectivity needs stated pro-order/type projective hypotheses. |
| Stable operator (3949) | T=2 on ℤ; identity; zero | For multiplication by 2, ker T^c=0 but range=2^cℤ≠ℤ; no stable invertible summand. Identity stable with I=M; zero stable with I=0,c=1. | Invertibility stronger than injectivity. |
| Integral second adjointness (3973) | GL₁; p=3,ℓ=2 | P=G gives identity adjunction. In W(k), any square root of 3 would reduce to 1 mod2, whose square is 1 mod4, not 3. | Unnormalized integral route avoids nonexistent half twist. |
| Integral blocks (4136) | GL₁ unit character η; unramified parameter x | Centre W(k)[x±¹] in the unramified block; x specializes to α; twisting by valuation character changes α, not η. | Inertial versus exact support distinguished. |
| Modular generic segments (4158) | q=2 mod5 | ν has order 4; singleton 1 and ν are linked, product reducible; singleton segments in distinct ν-orbits are unlinked. | Period length 4, not infinite. |
| Type-projective fibers (4194) | GL₁ projective unramified block | Specialization x↦α gives a character line; top derivative dimension 1; universal parameter x remains invertible. | Fiber and centre character agree. |
| Universal Whittaker projective (4217) | GL₁ and its unramified block | U=1, derivative identity; block projective W(k)[x±¹], Hom to fiber x=α is one-dimensional. | Block projection is substantive. |
| Co-Whittaker (4279) | A-line, A², zero; A=0 | Top derivative ranks 1,2,0 over nonzero A; only line passes. Over zero ring A=0 and the unique module meets the rank-one-isomorphism condition. | Zero-ring boundary consistent. |
| Universal domination (4322) | GL₁, A=W(k)[x±¹]/(x−α) | Universal base change equals A; canonical map onto the character line is identity, kernel 0. | Surjective map nonzero. |
| Minimal-prime reconstruction (4331) | A=k×k, both fibers k; dual numbers as excluded base | Diagonal image k×k=A; regular scalar action injective. For k[ε]/ε², sole reduced fiber kills ε, so image k≠A. | Reducedness and nonzero fibers discriminate. |
| Segments/Z versus L (4342) | GL₂ Δ=[−1/2,1/2]; two singleton segments 0,1 | Z(Δ)=1 with top derivative 0; L(Δ)=St with top derivative dimension 1. For ν×1, sub=ν^(1/2)St, quotient=ν^(1/2). | Ascending/descending orders differ as required. |
| Classical LLC normalization (4371) | Rank-one unramified Weil character α=2 | Monodromy 0; dual Frobenius 1/2. For rank-two N=[[0,1],[0,0]], dual N=−Nᵗ=[[0,0],[−1,0]]. | Dual sign retained. |
| Integral centre interpolation (4415) | Rank-one unramified family α | Frobenius trace α and centre variable evaluated at α coincide; determinant polynomial 1−αT. | Rank-one trace contract agrees. |
| LLC family (4439) | Rank-one reduced base A with unit α | Family is character line; minimal-prime fiber values are images of α, derivative rank 1. Nilpotent ε is invisible in reduced fiber test and excluded. | Reducedness retained. |
| Tensor endomorphisms (4481) | Co-Whittaker A-line, coefficient module A² | Hom_G(A,A²)=A²; map (a,b) sends 1↦(a,b). For zero coefficient module both sides 0. | Arbitrary-module tensor test agrees. |
| Ext/support orthogonality (4491) | Torus eigenvalues 1 and 2 over ℚ | Hom=Ext¹=0 since t−1 acts as 1 on second module; equal eigenvalues give Ext¹=ℚ. | Exact support, not merely inertial class. |
| Distinct-eigenvalue block (4507) | Residual eigenvalues 1,2 over F₃ | Difference 1 is a unit; at repeated (1,1) difference 0. Over F₂ the proposed 2 is not an eigenvalue unit. | Distinctness and invertibility discriminate. |
| Derived parahoric projector (4520) | Two distinct roots 1,2 over F₃ | Lagrange projector e₁=(T−2)/(1−2) has values (1,0); e₁² has same values. Repeated roots make denominator 0. | Localized projector only in distinct block. |
| Highest derivative adapter (4531) | Δ=[0,1] and singleton [0,0] | Right-end shortening yields [0,0] and empty segment; ranks drop 2→1 and 1→0. | Matches AKY involution convention. |
| Crossed cocycles (4576) | Γ=C₂ acting by inversion on ℚ×; c(s)=2 | c(s)α_s(c(s))=2·1/2=1=c(s²). Ordinary-hom condition would give 4=1, false. | Nontrivial action necessary. |
| Gauge action (4576) | Same action, trivial cocycle, h=2 | Gauged value cʰ(s)=2·1·(1/2)⁻¹=4; at identity value 1. Trivial action would give value 1. | Twisted conjugation retained. |
| Semidirect inverse (4576) | (2,s), inversion action | Inverse is (2,s), since 2·α_s(2)=1; componentwise guess (1/2,s) gives product 4. | Excludes wrong inverse. |
| Finite-wild discretization (4615) | Torus action trivial, q=3 | Relation Fr s Fr⁻¹=s³ becomes s²=1 in target; Fr parameter independent unit. | Arithmetic exponent 3, not 1/3. |
| Cocycle representability (4629) | Ĥ=Gm, q=3, no wild part | Coordinate algebra R[x±¹,s]/(s²−1); rank 2 over R[x±¹]. At char2 relation=(s−1)², nonreduced. | Scheme, not just geometric points. |
| ℓ-adic extension (4652) | Trivial cocycle; change generator by conjugation | Trivial cocycle sends all generators to 1 before and after change; associated section sends γ↦(1,γ). | Identity transport agrees; nontrivial gauge row fixes formula. |
| Wild strata (4665) | Wild quotient 1, Ĥ=GL₂ | One wild representation; centralizer GL₂, dimension 4. Scalar wild image likewise centralizer dimension 4. | No accidental maximal-torus centralizer. |
| Twisted quotient finiteness (4684) | Gm, inversion component | Twisted conjugation h·x=h²x; invariant Laurent exponents satisfy 2n=0 in ℤ, hence n=0, invariant ring R. | Integral invariant computation. |
| Tame torus isogeny (4695) | Torus Gm, q=3, trivial action | Isogeny t↦t² has kernel μ₂, degree 2; over F₂ kernel has one point but coordinate length 2. | Scheme-theoretic finiteness. |
| Finite Frobenius evaluation (4730) | Gm, q=3 | R[x±¹]→R[x±¹,s]/(s²−1) finite free rank 2, basis 1,s; q=2 gives rank 1. | General finite degree retained at small q. |
| Excursion algebra (4741) | Dual Gm, one loop, character f(z)=z | Evaluation at parameter α sends f to α; product of loops with values 2,3 sends f to 6; trivial loop gives 1. | Multiplicativity and unit agree. |
| Excursion/invariant comparison (4768) | Same torus, q=3 | Frobenius generator maps to x; tame generator to s with s²=1; relation s³=s holds on both sides. | Actual cocycle relation retained. |
| Z-finiteness (4786) | G=1, V=R²; V=⊕ℕR | Z_V scalar image R; first is finite over R, second is not for nonzero field R. | Centre image does not make arbitrary module finite. |
| Depth generators (4814) | GL₁ depth zero, K=O× | Generator c-Ind_K^G R has valuation basis ℤ; End ring R[t±¹], finite rank 1 over its centre. | Compact-invariant module criterion agrees. |
| Cuspidal descent/lattices (4826) | GL₁ unit-valued character versus α=ℓ | Unit-valued character preserves O-lattice O. Multiplication by ℓ has inverse ℓ⁻¹, so O is not stable under the whole group. | Integrality of central character matters. |
| Cuspidal projective embedding (4854) | GL₁ projective regular unramified block | Levi=G and induction identity; embedding P→P has kernel 0. Torsion quotient O/ℓ has nonzero ℓ-kernel and violates torsion-free input. | Retain torsion-free qualification. |
| Contracting operators (4874) | Uniform invertible and nilpotent factors; unbounded nilpotence | Identity direct limit M, zero direct limit 0. For ∏j ℚ[t]/tʲ, t^c≠0 for every c (factor j=c+1), though each factor is nilpotent. | Uniform stabilization exponent indispensable. |

Additional Lean-only checks: the uniform-product theorem has a single exponent c before the product index; for two factors T₁=id and T₂=0, c=1 yields stable image M₁×0 and kernel 0×M₂. The smooth-product invariant formula at K=G for two trivial lines gives A² on both sides, while the tuple of basepoints in the product of ℤ₂/2ⁿℤ₂ permutation modules has stabilizer ∩2ⁿℤ₂=0 and is not smooth. The `coindUnramifiedTwistEquiv` formula at a valuation n multiplies by χ(n): for χ(1)=2, the factors at n=1 and n=−1 are 2 and 1/2. These computations do not justify retaining admitted data.

The table has **170 rows covering all 166 named README targets**, plus the explicit zero-ring, twist-sign, gauge and inverse cases. Rational arithmetic, the quartic coefficient expansion and the two S₃ products were also recomputed in a scratch calculation.

README shape: the title/summary, ownership, conventions, supplier contracts, layer sequence, examples/dependencies and references are present. API and Check material is extensive, but much of it is paragraph-form rather than the requested bullet lists, and numerous Checks claim a Lean example. In implementing R07, remove those Lean-counterpart claims and preserve the mathematical Checks in prose/bullets. The mixed chronological layer labels SR.3a/SR.3/SR.2a reflect the stated proof dependency (uniform admissibility before second adjointness); no cycle was inferred merely from those labels.

## Not verifiable

- **Ber92:** the three seeded locators (smooth vectors p.7, cuspidality pp.34,36, Hecke decomposition pp.29,42) and other Bernstein lecture citations could not be read. The cited author host closed the connection; retry without `www` timed out. The table's special cases do not certify the lecture numbering or the general decomposition proof.
- **Ber87, BD84, BZ76:** the cited author copies likewise failed with connection closure and timeouts. In particular the second-adjointness manuscript, centre theorem locators and the commutative-subalgebra dimension bound were not source-certified.
- **BH06:** the source service encountered an arXiv-search rate limit and a paywalled Springer DOI prefix; no local text was supplied. Its paragraph/page locators and general-ring adaptations remain uncertified here.
- **Mac:** the service's arXiv search was rate-limited and the OUP DOI landing page returned 403. The universal Hall–Littlewood construction was tested in low rank, but the printed normalizer locator was not read. No conclusion about the equivalence of Leslie's displayed normalizer and Macdonald's unread display is certified.
- **He18:** source discovery reached a Cambridge landing page without a configured source licence class after an arXiv-search rate limit; no paper text was obtained. The Haar/Hecke locator remains unverified.
- **Bor76:** the lawful GDZ scan was fetched, but its extraction was image-only and OCR was unavailable. The Iwahori-category theorem was not read.
- **HM18 and Nak:** the source service marked the published links `uncertified` because they are paywalled. They are recorded here without requesting the same settled text again. The integral-centre interpolation/LLC-family and tensor-endomorphism locators were not verified against those publications.
- The unavailable works above are collected in the job's single missing-reference request, except the two settled paywalled entries. No source file or extracted passage was copied into the repository or this report.
- The general statements are not proved by the finite-instance table. In particular the table's rank-one checks of deep classification, integral type theory and finite-wild/derived theorems are consistency tests, not replacements for their proof routes. Sources outside the seeded sample were fetched and relevant passages consulted where needed for findings; this report does not certify every locator in the 4,973-line README. The full Lean file's elaboration does not remove these limits.

## Source issues

- **Misprint** in BCGP at §2.4.1, printed preprint page 20 (BCGP lines 1007–1008): the source says the Iwahori subgroups are kernels of reduction maps to B(k) and U(k); it should be preimages of B(k) and U(k) under reduction to G(k); affects a stated result.
- **Error** in TV at §7.2, equations (7.2.1) and (7.2.5), printed pages 206–207 (TV lines 1204–1213,1250–1257): the source says the raw transform is invariant under the displayed positive point twist in its uniformizer dictionary; it should be the inverse point twist, or an explicit inversion of the torus dictionary; affects a stated result.
- **Misprint** in Les at Lemma 3.1's preceding modulus display, printed page 23 (Les line 978): the source says the determinant modulus uses the F-absolute value for matrices over E; it should be the normalized E-absolute value, giving q⁻² on the GL₂ uniformizer diagonal; affects a stated result.
- **Error** in Hel12 at Lemma 6.4, printed page 13 (Hel12 lines 545–559): the source says arbitrary quotients of the generic universal fibers reconstruct a co-Whittaker family; it should be nonzero quotients with nonzero top derivative; zero quotients cannot have derivative rank one; affects a stated result.
- **Misprint** in Pil at §5.1.5, paragraph after Proposition 5.1.5.1, printed page 22 (Pil lines 951–953): the source says the ordered Hecke parameters satisfy αβ=γδ; it should be αδ=βγ, consistently with the antidiagonal form and §5.1.5's initial ordering; affects a stated result.
