# Review of ImplicitAtlases (pull request #974 at 7218354)

**Verdict:** needs changes

🤖 Independent AI review of the repaired head. Three findings: one P2 and two P3. The supplied gate passes (every check, including the targeted build). All six findings of the previous review are repaired (see the repair check below). This review changes no pull-request file.

## Repair check against the previous review

| Previous finding | Passage at this head | Status |
| --- | --- | --- |
| R01 (P2) local orientability before the rank-one sheaf | Conventions row "Orientation hypothesis" (`README.md:28`); §3.1 "For a locally orientable atlas construct the rank-one locally constant virtual orientation sheaf" (`README.md:439`); Layer 5 "Throughout this layer atlases are locally orientable" (`README.md:572`); the reflection atlas is the stated negative control in §1.1, §3.1 and §3.4 | Repaired. Computed below: stabilizer sign (−1)(+1) = −1 at 0, invariants 0 versus the rank-one fibre ℚ. |
| R02 (P2) invariance of domain re-planned | Scope: "AbelianSchemesAndArithmeticModuliPartII, §B2.9 … Layer 6 consumes it and proves only the cell-like-stratum consequences" (`README.md:33`); §6.2 `*Needs:*` cites §B2.9 (`README.md:708`) | Repaired. §B2.9 exists at the supplied open head (`TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1376`) with exactly the quoted statement; that roadmap is line 137 of the merge order, this one line 200. |
| R03 (P3) Lean file an interface catalogue | `Suggested.lean` is a module docstring and an empty namespace; the docstring names each unstatable headline and its missing carrier | Repaired (see headline inventory). |
| R04 (P3) negative-dimension boundary case in Lean | Deleted; the computation is §1.1 Check 3 (`README.md:317`) | Repaired. |
| R05 (P3) house form, APIs, Checks, `*Needs:*` | Every subsection has an API list, at least three Checks and a `*Needs:*` line; every layer ends with Examples and Dependencies (counted: 40 subsections, 3–5 Checks each) | Repaired. |
| R06 (P3) locators | Every target carries a Pardon theorem/definition and printed-page locator; the References entry lists them | Repaired; all locators verified below. No `sources.toml` exists, but none of the 125 roadmap folders on main has one, so its absence is not a defect of this folder. |

The previous review's source errata are confirmed independently below.

## R01 (P2) — The straight-line homotopy in §5.6 is not an implicit atlas with boundary

**Location:** `TauCetiRoadmap/ImplicitAtlases/README.md:655`, §5.6: "the straight-line homotopy is supported in a fixed relatively compact neighborhood, so its zero locus is compact", followed by the collar clause reserved for "the boundary version".

**Claim:** the cobordism B × [0, 1] with the straight-line homotopy s̃(b, t) = s(b) + t·Σλ_i σ_i(b) carries the zero-set atlas with boundary of §1.2 (dimension d + 1) whose boundary restrictions are the atlases of s and of the transverse final section, so that §5.2 applies.

**Witness:** B = ℝ, E the trivial line, s(x) = x², one frame section σ = −χ with χ ≡ 1 near 0, regular parameter λ = 1. Then s̃(x, t) = x² − tχ(x) and near (0, 0) its zero set is the parabola t = x². The empty-index regular locus is the surjective-linearization locus; ds̃(0, 0) = (0, −1) is surjective, so (0, 0) ∈ X̃_∅^reg. But (0, 0) ∈ ∂X̃_∅ = X̃_∅ ∩ {t = 0}, and X̃_∅ near it is a line with (0, 0) interior, not the half-space model that §1.2 requires at ∂X_J^reg. Moreover the boundary restriction at t = 0 has empty-index regular locus {(0, 0)} ≠ X_∅^reg = ∅ of the atlas of s, so the atlas of s is not the boundary restriction. This is the same tangency as the previous review's second erratum (Pardon, Definition 5.3.1 on a base with boundary, `pardon2016 line 1843`), now inside the roadmap's own route; Pardon's proof of Proposition 5.3.4 (`pardon2016 line 1912`) has the same gap.

**Repair:** replace the straight-line homotopy by s̃(b, t) = s(b) + ρ(t)·Σλ_i σ_i(b) with ρ smooth, ρ ≡ 0 near 0 and ρ ≡ 1 near 1. Tested on the witness: near t = 0 the zero set is {0} × [0, ε) with empty-index regular locus ∅ × [0, ε) = ∅, equal to the atlas of s; near t = 1 it is {±1} × (1 − ε, 1] with the transverse product model; the total zero locus still lies in (∪ supp σ_i) × [0, 1], which is compact. State that the boundary restrictions are then literally the two endpoint atlases, and add the parabola t = x² as the negative Check for the uncollared homotopy. Alternatively keep the straight-line homotopy and declare X̃_∅^reg to be X_∅^reg × [0, 1] ∪ (the surjective locus over (0, 1)); say which.

## R02 (P3) — Three supplier citations point to the wrong place or omit a pinned object

**Location:** `TauCetiRoadmap/ImplicitAtlases/README.md:151` (§0.4 `*Needs:*` "AlgebraicTopology Stages 2 and 6"), `README.md:242` (§0.10 second bullet), `README.md:54` (Mathlib contract: "Mathlib has no extension by zero, no K-sheaves and no colimit-over-covers Čech cohomology").

**Witness:** (a) The shuffle, Alexander–Whitney and Eilenberg–Zilber maps with their relative and local-coefficient APIs are AlgebraicTopology Stage 5 item 1 (`TauCetiRoadmap/AlgebraicTopology/README.md:852–857` on main); Stage 6 only consumes them for the cup/cross comparison (`README.md:1056`). (b) AlgebraicTopology Stage 6 already proves "for boundaryless m-manifold U, compact K ⊂ U and every module-valued local system L, H_i(U, U∖K; L) = 0 for i > m" by Hatcher Lemma 3.27 (`README.md:1244–1251`), for its second-countable Mathlib carriers (`README.md:1006–1008`); §0.10 restates it with the same route. (c) Mathlib at the pin has derived-functor sheaf cohomology `CategoryTheory.Sheaf.H` (Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56, an `Ext` against the constant sheaf), which the contract does not mention; the module docstring's "not statable" argument rests on the absence of cover-colimit Čech cohomology, and no target compares §0.7's Čech cohomology with this derived functor.

**Repair:** cite Stage 5 item 1 in §0.4 and the §0.4 `*Needs:*` line; in §0.10 cite AlgebraicTopology Stage 6 for the boundaryless second-countable case and own only the boundary (half-space) and non-second-countable extension; in the Mathlib contract name `CategoryTheory.Sheaf.H` and state either that no comparison with it is owned here or add the comparison on compact Hausdorff spaces as a §0.7 target.

## R03 (P3) — Two Checks state their computation imprecisely

**Location:** `TauCetiRoadmap/ImplicitAtlases/README.md:420` (§2.3 Check 2) and `README.md:385` (§2.1 Check 2).

**Witness:** §2.3 Check 2 says a total that "also placed" the (∅, α) complex in flag length 0 changes the Euler characteristic "by twice that complex's". Placing it in flag length 0 instead of 1 changes χ by 2·χ(C_∅α) (from −χ to +χ); adding a second copy while keeping the flag-length-1 copy changes it by χ(C_∅α). §2.1 Check 2 does not fix X_∅^reg. With X_∅^reg = ∅, the convention of §1.1 for the xⁿ charts, the t = 0 points fail the condition ψ_∅α(x) ∈ X_∅^reg, so D = ℝ × ℝ_>0 and Z_X is an open half-line; D ≅ ℝ × ℝ_≥0 requires X_∅^reg = X = {0}. Both give H_1(D, D∖Z_X) = ℤ, so §2.2 Check 2 is unaffected.

**Repair:** write "instead of" in §2.3 Check 2, and state X_∅^reg = X = {0} in §2.1 Check 2 (or give both values of D).

## Verified sound

**Gate and scope.** Head `7218354f49cdbf0e3d26a5aae2286b259eefa011`. The worker's gate reports every check passing. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only. No `set_option`, sorry'd data, free `Prop` placeholder, copied passage, computational algorithm, pull-request number or process word was found in the two reviewed files. No declared gaps were supplied.

**Dependency check**, run as instructed with `--movable`:

```text
depcheck: 200 roadmaps, 1319 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every `*Needs:*` line and supplier citation was read: AlgebraicTopology, CharacteristicClasses and DGAInfinity are on main; AbelianSchemesAndArithmeticModuliPartII is line 137 of the merge order (this roadmap is line 200), and §B2.9 exists at its supplied head with the cited statement.

**Ownership move recorded.** The previous head consumed TopologicalSheafCohomology (TS1–TS5) for K-sheaves, Čech cohomology, purity, extension by zero, finite quotients, closed-subset duality and interval diagrams. TopologicalSheafCohomology is line 283 of the merge order, later than this roadmap, so that citation was upward; this head states the notions as Layer 0 targets (§0.6–§0.11) and the Scope section declares the ownership. This is the repair the brief prescribes for an upward supplier, not a defect. Consequence for the project: TopologicalSheafCohomology at its open head (`TauCetiRoadmap/TopologicalSheafCohomology/README.md:31–155`, TS0–TS5) now plans the same objects and, being later, must import Layer 0 here; that is a finding for its review, not this one. Its `Suggested.lean` declares 14 K-presheaf and interval-diagram names; this roadmap's file declares none, so no fully qualified name collides.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/ImplicitAtlases/Suggested.lean`: exit 0, no output. The file has no declarations, so there is nothing to `#check`, no sorried theorem for the one-tactic probe and no padding. The single `import Mathlib` is the only import. Left no Lean process running.

**Headline inventory and statability.** Headlines named in the Summary and the docstring, with the carrier each lacks at the pins (checked by opening the pinned files):

| Headline | README | Why not statable at the pins |
| --- | --- | --- |
| Virtual/Čech comparison and partial purity | §3.2, §3.4 | Needs the Layer 1 atlas structure, the Layer 2 deformation spaces and flag total, and cover-colimit Čech cohomology with sheaf coefficients; Mathlib's `cechComplexFunctor` (Cech.lean:65) is one fixed cover and `Sheaf.H` (Basic.lean:56) is derived-functor cohomology, which the README does not compare with. |
| Virtual class and finite-subatlas independence | §4.3 | Needs the above and the weighted trace of §4.2. |
| Boundary law, cobordism, refinement, normalization, Euler comparison | §5.1–§5.6 | Needs the class, relative Čech cohomology of (X, ∂X) and the zero-set atlas. |
| Stratified quasi-isomorphism and product formula | §6.3, §6.5 | Needs stratified atlases, the stratified complex and the compact Čech external product. |
| Fiber-product identity | §7.3 | Needs fiber-product atlases, supported Čech cohomology with excision/tautness, and CharacteristicClasses §C2's Thom class. |

I agree that none is statable without a stand-in; invariance of domain is correctly attributed to §B2.9 and not stated here. The empty file is therefore the correct form.

**Sources and the seeded sample.** Pardon, arXiv:1309.2370v6, was fetched through the sources service (open repository); Hatcher's *Algebraic Topology*, author's online edition, through the author's page. Printed pages of Pardon v6 were mapped from the extraction's page markers. All fifteen sampled targets, and every other Pardon and Hatcher locator in the README (86 in the References entry), were opened; none is wrong.

| Sampled target | Locator and extraction line | What the source supports |
| --- | --- | --- |
| 0.9 Extension by zero, finite fibers, finite quotients | Def. A.3.5 p. 119 `pardon2016 line 5218`; Lemma A.4.7 p. 120 `line 5280`; Lemma A.4.8 p. 121 `line 5321`; Lemma A.4.9 p. 121 `line 5330` | j_! as sections vanishing near the complement; Ȟ_c(U; F) ≅ Ȟ_c(X; j_!F); proper finite fibres give pullback isomorphisms; finite quotient with Z[1/|Γ|]-module sheaf: all three maps isomorphisms, also with compact supports. Hypotheses agree. |
| 0.11 Finite interval diagrams and pure gluing | Defs A.7.1–A.7.2, Lemmas A.7.3–A.7.4, Def. A.7.5 and footnote 46, p. 128 `line 5609–5650`; Lemmas A.8.1–A.8.2 p. 129 `line 5657–5675` | Total ⊕_p ⊕_{s₀≺…≺s_p} A^{•+p}_{s₀,s_p}, alternating deletion differential; terminal-object and quasi-isomorphism lemmas; product map via subdivision of the product of nerves ("always a quasi-isomorphism" in the footnote only); gluing with the two cover conditions and the j_!j^*G ≅ H⁰F_IJ system. |
| 1.1 Implicit atlases | Def. 3.1.1 pp. 31–32 `line 1324–1351`; Example 2.3.2 p. 20 `line 834` | All ten axioms match item by item (footnote 15 notes axiom iv is redundant; keeping it is harmless). xⁿ and zⁿ examples. |
| 1.3 Smooth enhancement | Def. 3.1.3 p. 32 `line 1357` | Smooth structure on X_I^reg only; the four conditions, including local diffeomorphism over ψ⁻¹(X_I^reg), match. |
| 1.4 Subatlases, restrictions, reindexing | Remark 3.1.5 pp. 32–33 `line 1366`; finite subatlas by compactness, Def. 5.1.1 p. 41 `line 1729` | Finite-subset indexing pulls back only along injections; finite-sets-over-A needed otherwise. |
| 2.3 The virtual cochain complex | Def. 4.2.6 p. 36 `line 1527`; Def. A.7.2 p. 128; eq. (5.2.4) p. 43 `line 1811` | hocolim over 2^A with structure maps (#Γ_{J∖J'})⁻¹·(4.2.8); C_vir(K rel∂; ∅) = C_{d−•}(X, X∖K). |
| 3.2 Partial purity | Lemma 4.3.1 pp. 37–38 `line 1553`; Lemma 4.3.2 p. 38 `line 1591`; proof of Prop. 4.3.3 p. 38 `line 1614` | Locally orientable finite atlas; D a manifold with boundary of dimension d + m_A + #I, ∂ₓD a tame codimension-0 piece; duality, Künneth suspension, Lemma A.4.9 descent, Lemma A.4.7. The README's §0.10 duality, §0.9 descent and suspension are exactly these steps. |
| 3.3 Footprint conditions | proof of Prop. 4.3.3 p. 38 `line 1615–1617` | Both inclusions "follow from the axioms"; the README owns the derivation. |
| 4.1 The obstruction complex | Def. 4.2.4 p. 36 `line 1502` | C_{dim E_I+•}(E_I, E_I∖0; o^∨)^{Γ_I} with H = R in degree 0 and generator [E_I]; the README's B^k = C_{m−k} is Pardon's C^{−k}(E; B), stated as a convention. |
| 6.1 Cell-like stratified atlases | Defs 6.1.1–6.1.2 p. 47 `line 1976–1988`; Example 6.1.4 p. 47 `line 1995`; Def. 6.1.6 p. 48 `line 2023–2037` | Lower semicontinuity, cell-like pairs of dimension dim s, zero-fiber compatibility axiom (i), modified submersion axiom with s ↦ dim s + dim E_I. |
| 6.2 Normal lines and restricted atlases | Def. 6.1.6 and diagram (6.1.1) p. 48 `line 2038–2050`; Lemma 6.1.5 p. 47 `line 1998–2020` | o_s rank-one graded, odd coboundary, equivariant-compatible isomorphisms; restriction to ∂S (tensor o_ℝ) and to S^{≤s} (tensor o_s^∨); the five local consequences via invariance of domain. The Γ_I-triviality on o_s is the README's own strengthening, needed for local orientability of restricted atlases. |
| 6.3 The stratified virtual complex | Def. 6.2.2 pp. 49–50 `line 2100`; Prop. 6.2.3 p. 50 `line 2130` | Direct sum over strata tensored with o_s, codimension-1 pushforwards tensored with coboundaries; map (6.2.7); quasi-isomorphism for finite locally orientable atlases by dimension filtration and Corollary A.4.19. |
| 6.4 Product atlases | Def. 6.3.1 pp. 50–51 `line 2151`; Def. 6.3.2 p. 51 `line 2160` | Index set A₁ ⊔ A₂, products of thickenings and regular loci; chain map compatible with (4.2.12) and (4.2.14), associative, using commutativity (4.2.2). Product boundary ∂S₁×S₂ ∪ S₁×∂S₂ handled as stratified, as the README does. |
| 7.3 Supported Gysin map and fiber-product identity | §5 introduction p. 40 `line 1698–1702`; CharacteristicClasses §C2 item 1 (`TauCetiRoadmap/CharacteristicClasses/README.md:619`) | Pardon states the fiber-product formula as a desideratum and proves nothing; the README labels it a construction of this roadmap. The Thom class with local coefficients exists in C2 item 1. |
| 7.4 Application interface | no source; checked against consumers | AnalyticStableMaps, GromovWittenTheory, SymplecticFieldTheory, DGFloer and HamiltonianFloerOperations cite "ImplicitAtlases V0–V6/V7" and ComplexCurveModuli cites the division of labour; the labels "(V0)"–"(V7)" are kept in the layer headings. |

Further locators opened: Hatcher Lemma 3.27(b) on printed p. 236 (`hatcher2002 line 10255–10259`, under the page-245 marker); Convention A.0.1 `line 4931`; A.0.3 `line 4959`; A.1.1–A.1.2 `line 4969–4975`; A.1.4 `line 4992`; A.1.6 `line 5003`; A.1.8 `line 5027`; A.2.5 `line 5141`; A.2.11–A.2.12 `line 5176–5182`; A.3.3–A.3.4 `line 5205–5207`; A.3.6 `line 5224`; A.4.1–A.4.3 `line 5231–5258`; A.4.4–A.4.6 `line 5267–5274`; A.4.10 `line 5341`; A.4.11–A.4.14 `line 5361–5389`; A.4.15, A.4.18–A.4.19 `line 5404–5432`; A.4.20–A.4.21 `line 5444–5449`; A.5.1, A.5.3–A.5.5 `line 5460–5500`; A.6.1–A.6.4 `line 5523–5568`; Defs 4.1.1–4.1.3 and footnote 17 `line 1445–1464`; Def. 4.2.1 `line 1467`; Def. 4.2.5 `line 1507`; Def. 4.2.7 `line 1542`; Thm 4.3.4 `line 1623`; Prop. 4.4.2 `line 1646`; Lemmas 5.2.1–5.2.6 `line 1759–1806`; Def. 5.3.1 `line 1843`; Prop. 5.3.4 `line 1901`; Def. 5.4.2 `line 1942`; Remark 2.1.5 `line 543`; §2.3.3 `line 839–855`.

**Pinned objects.** Branch pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` (the README names main's pins `f6090c7` and `358314d`; every declaration below exists at the branch pin and was not renamed). Opened: `TopPair` (Mathlib/Topology/Category/TopPair.lean:31, an arrow in `TopCat` satisfying `isEmbedding`; no compactness) and `TopPair.ofSubset` (line 54); `Representation.invariants` (RepresentationTheory/Invariants.lean:73), `GroupAlgebra.average` (line 38, with `⅟(Fintype.card G : k)`), `Representation.averageMap` (line 126), `isProj_averageMap` (line 141); `CochainComplex.shiftFunctor` (Algebra/Homology/HomotopyCategory/Shift.lean:44, `K.X (i + n)` with `n.negOnePow • d`); `CategoryTheory.cechComplexFunctor` (Sites/SheafCohomology/Cech.lean:65, one fixed cover, ℕ-indexed); `TopCat.Sheaf` (Topology/Sheaves/Sheaf.lean:107); `TopCat.Presheaf.stalk` (Stalks.lean:82); `TopCat.Sheaf.pushforward` and `pullback` (Functors.lean:60, 89); `TopologicalSpace.Compacts` (Sets/Compacts.lean:37); `Topology.IsOpenEmbedding` (Defs/Induced.lean:153); `CategoryTheory.Sheaf.H` (Sites/SheafCohomology/Basic.lean:56, see R02). Tau Ceti: `TopPair.singularChainComplexFunctor` (AlgebraicTopology/Singular/Relative.lean:100); `TopPair.twistedChainComplex` (Singular/Twisted/Relative.lean:79, the cokernel of the twisted chain map of the pair, with the system pulled back to the subspace, as the README says); `TopCat.eilenbergZilberHomotopyEquiv` (Singular/EilenbergZilber.lean:76); `TauCeti.koszulBraidingSummand` (Algebra/Homology/Monoidal/Braiding.lean:91). The citation resolver reports no unresolved cross-roadmap citation and no unresolved Lean name.

**Cross-roadmap contracts resolved on main:** AlgebraicTopology Stage 2 (README line 326; local coefficient systems at line 382), Stage 3 (line 471; excision and Mayer–Vietoris with local coefficients, lines 487–491), Stage 5 item 1 (line 856, shuffle/Alexander–Whitney/Eilenberg–Zilber), Stage 6 (line 946; cochains, cup/cap with local coefficients at lines 1012 and 1056, orientation and duality at lines 1236–1262 on second-countable carriers at line 1007); CharacteristicClasses §C1.2b (line 419) and §C2 item 1 (line 619, the Thom class U_E with local coefficients and uniqueness), item 3 (line 657, transverse zero locus represents Euler); DGAInfinity Layer 0 (line 263, Koszul braiding on `CochainComplex (ModuleCat k) ℤ`). Open heads: AbelianSchemesAndArithmeticModuliPartII §B2.9 (line 1376). Ownership by object: `roadmaps grep` finds "homotopy K-sheaf" only in this pull request and TopologicalSheafCohomology (see the recorded move) and "implicit atlas" elsewhere only in consumers (DGFloer, SymplecticFieldTheory, AnalyticStableMaps, GromovWittenTheory, ComplexCurveModuli), none of which builds the engine. Ownership against open pull requests without supplied files was not checked beyond that index.

**Adversarial calculations.** One row per statement checked; values on both sides; a negative control where one exists.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| §0.1 group and obstruction products | I = ∅; ℤ/2 × ℤ/3; swap of ℝ ⊕ ℝ | |Γ_∅| = 1, m_∅ = 0; order 6, not 3; swap determinant −1, acts by −1 on o | Retain. |
| §0.2 orientation lines | E = 0, ℝ, ℝ², ℝ³ | o_0 = H_0(pt) = ℤ, sign +1; reflection on H_1(ℝ, ℝ∖0) = ℤ acts by −1, scaling by 2 acts by +1 (determinant model would give 2); −id on ℝ²: +1, on ℝ³: −1; swapping two odd lines: (−1)^{1·1} = −1 | Retain. |
| §0.3 invariants and averaging | ℤ/2 on ℚ by ±1; 𝔽₂[ℤ/2]; swapped 0-simplices with sign coefficients | Invariants ℚ, 0; over 𝔽₂ the invariant sequence 𝔽₂ → 𝔽₂(1+g) → 𝔽₂ has last map 1+g ↦ 0, not onto; a[σ₁] + b[σ₂] invariant iff b = −a, so ℚ; fixed simplex with sign −1: a = −a, so 0 | Retain; order-invertibility needed. |
| §0.4 relative chains and shuffle | (pt, ∅), (pt, pt), (ℝ, ℝ∖0); two 1-simplices | H_0 = ℚ, 0; H_1(ℝ, ℝ∖0) = ℤ, H_0 = 0; square = two triangles with opposite permutation signs, flip gives (−1)^{1·1} = −1 | Retain. |
| §0.5 parity and shift | (τ_A, r) = (1, 1), (0, 1); ℚ[0] shifted by 1; d = −1 | signs −1, +1; sits in degree −1; (−1)^{−1} = −1 in ℤ/2 while `Int.toNat` gives +1 | Retain. |
| §0.6 K-sheaf axioms | {a, b} discrete with ℤ-on-nonempty; functions K → ℤ on ℝ; K ↦ H_1(ℝ, ℝ∖K) | ℤ → ℤ⊕ℤ not onto, locally constant ℤ² is; third axiom fails at {0}: germ of indicator of ℚ∖{0} is a nonzero germ with value 0; values ℤ, ℤ, ℤ² and 0 → ℤ² → ℤ⊕ℤ → 0 exact | Retain; the compact-neighbourhood form of the third axiom is Lurie's and agrees with Pardon's through Lemma A.1.10. |
| §0.7 Čech on compact spaces | S¹ by two arcs; one-set cover; Warsaw circle; ∅ | ℤ² → ℤ², (a, b) ↦ (b−a, b−a): Ȟ⁰ = ℤ, Ȟ¹ = ℤ; one cover gives Ȟ¹ = 0; Ȟ¹(W) = ℤ versus singular 0; Ȟ(∅) = 0 | Retain colimit definition. |
| §0.8 purity | [0,1] with C_{1−•}(ℝ, ℝ∖K); ℤ in degree 1 on a point; finite discrete | stalks ℤ in degree 0, H⁰ = H_1(ℝ, ℝ∖[0,1]) = ℤ = Ȟ⁰([0,1]; o_ℝ); not pure, formula predicts 0 but H¹ = ℤ; ⊕ of n stalks, Ȟ^{>0} = 0 | Retain. |
| §0.9 j_! versus j_*, quotients | (0,1) ⊆ [0,1]; reflection and antipode on S¹ over ℚ; antipode over ℤ | j_!: ℤ in degree 1; j_*ℤ = ℤ constant, degree 0; reflection: Ȟ¹(interval) = 0 = invariants of the sign action on ℚ; antipode: ℚ = ℚ; over ℤ pullback is ×2, cokernel ℤ/2 | Retain invertibility hypothesis. |
| §0.10 duality and half-space model | M = ℝ with Z = {0}, ℝ; M = Z = [0,∞); K = {0} ⊆ [0,∞); H∖K for convex K ∋ p ∈ ∂H | ℤ at q = 0 and q = 1 matching Ȟ_c; Ȟ¹_c([0,∞); j_!ℤ) = ℤ while Ȟ_c([0,∞); ℤ) = 0; H_q([0,∞), (0,∞)) = 0 all q; radial push from p shows H∖K ≃ half-sphere, contractible | Retain; see R02(b) for the citation. |
| §0.10 lower bound used in §3.2 | D of dimension N = d + m_B + |I|; q ≤ −|I| − 2 | H_j(D, D∖Z) = 0 for j > N + 1 from H_j(D) = 0 (j > N) and the pair sequence; j = d + m_B − q > N + 1 iff q < −|I| − 1 | Retain; bound is safe, independent of duality. |
| §0.11 flag total | S = {0 < 1}, identity maps; zero maps; A = ∅ | ℚ → ℚ², x ↦ (−x, x): H⁻¹ = 0, H⁰ = ℚ; zero maps: H⁻¹ = ℚ, H⁰ = ℚ²; total = F_∅∅ | Retain. |
| §1.1 axioms on examples | manifold atlas; xⁿ on ℝ; d = −2, −1 with m = 1; ineffective ℤ/2 point; reflection atlas | V_∅ = X; Z_∅α = {0} = V_α, vacuous freeness; n = −1 impossible, n = 0 point chart; freeness fails iff X_∅^reg = X; reflection atlas passes all ten axioms (s(−x) = x²) | Retain. |
| §1.2 boundary restriction | [0,1], A = ∅; [0,1] with ∂X = ∅; d = 0, m = 0 | dimension 0 on two points; no open subset of ℝ models [0,1] at 0; 0-manifolds have empty boundary | Retain d − 1 without truncation. |
| §1.3 smooth enhancement | x^{1/3} on ℝ; exotic structures | not smooth at 0 for the standard structure, smooth for the global chart x ↦ x^{1/3}; two enhancements of one topological atlas | Retain: enhancement is data. |
| §1.4 subatlases | manifold atlas to ∅; xⁿ atlas to ∅; α, β ↦ γ | V_∅ = X covers; V_∅ = ∅ does not; repeated indices undefined | Retain. |
| §2.1 deformation space | s = x, B = I = J = {α}, d = 0; X_∅^reg = ∅ with I = ∅ | D ≅ ℝ × ℝ_≥0 (if X_∅^reg = X) or ℝ × ℝ_>0 (if ∅), dimension 2; Z_X = {e = 0} closed; D_{∅,α,α} = ∅ | Retain; R03 asks for the X_∅^reg value. |
| §2.2 partial complexes | B = ∅; s = x; weights | C_{d−q}(X, X∖pt): H⁰ = ℤ; D∖Z two contractible half-planes: H_1(D, D∖Z) = ℤ, H_2 = 0; (1/2)(1/|Γ_{J'∖I}|) = 1/|Γ_{J∖I}|, uniform w gives w² ≠ w | Retain. |
| §2.2 cone differential | symbolic (b, a) | D²(b, a) = (∂²b + ∂i_*a − i_*∂a, ∂²a) = 0; with +∂a: 2i_*∂a ≠ 0 | Retain. |
| §2.3 flag total for B = {α} | pairs (∅,∅), (∅,α), (α,α) | flags ∅, {α} in length 0, ∅ ≺ {α} in length 1 at degree −1; χ changes by 2χ(C_∅α) if moved, by χ(C_∅α) if duplicated | R03 wording. |
| §3.1 local orientability | reflection atlas; trivial action; simultaneous reflection with s = x; ℝP²; [0,1] boundary stalk | signs (−1)(+1) = −1, +1, (−1)(−1) = +1; invariant dimensions 0 versus 1; o_{ℝP²} nontrivial but locally orientable; j_! stalk 0, j_* stalk ℤ | Retain; R01 of the previous review repaired. |
| §3.2 H⁰ of partial complexes | s = x chart; K ∩ V_I ∩ V_J = ∅; Y = pt, k = 1 | H⁰(R_αα) = ℤ; 0; H¹_c(ℝ) = ℤ, H⁰_c(ℝ) = 0 | Retain. |
| §3.3 footprint inclusions | manifold atlas; extra chart X × ℝ with X_∅^reg = X or ∅ | equalities X = X; X ⊆ X; V_∅ ∩ V_α = ∅ ⊊ V_α = X (strict), atlas valid | Retain. |
| §3.4 comparison | manifold atlas; s = x on ℝ; reflection atlas | Poincaré duality H_{d−q}(X); H⁰_vir = ℚ = Ȟ⁰(pt); reflection sends the generator of H_1(D, D∖Z) to its negative, invariants 0 ≠ ℚ | Retain; comparison correctly not asserted. |
| §4.1 obstruction complex | B = ∅; ℤ/2 on ℝ by −1; −id on ℝ² | R with point generator; (−1)(−1) = +1 so invariants ℚ, without the dual twist 0; +1·+1 | Retain. |
| §4.2 cocone and trace weights | free ℤ/2 orbit over a regular point: [a] + [b] on D_{∅α} | via (∅,∅): weight 1/2 arrow sends to [pt], unweighted trace gives 1; via (α,α): unweighted trace gives 2; with weights 1/|Γ_J|: 1 and (1/2)·2 = 1 | Retain the README's weights; source erratum confirmed. |
| §4.2 ineffective ℤ/2 point | X = X_α = pt, E = 0, d = 0 | only (α,α) contributes, D = ℝ_≥0; κ is the plain pullback (identity on ℚ); weighted trace 1/2; class 1/2; unweighted gives 1, a second 1/|Γ| gives 1/4 | Retain; matches Pardon §2.3.3. |
| §4.2 reindexing sign | d = 1, q = 1, 2; d = −1, q = −1, 0 | ε_{q+1}/ε_q = (−1)^d with ε_d = 1: +1, −1; +1, −1 | Retain. |
| §4.2 no trace for K ≠ X | s = x, K = ∅ | pair (D, D); points (0, t, 0) have e = 0, cannot map to E∖0 | Retain. |
| §4.3 classes | xⁿ, zⁿ; d = −1 point; ∅ | 1 (odd), 0 (even), n; Ȟ⁻¹ = 0 so Φ = 0 on a nonempty base; Ȟ(∅) = 0 | Retain; no independence across unrelated atlases. |
| §4.3 subatlas comparison | add a trivial rank-one obstruction to the point atlas | generator 1 ⊗ [ℝ] ↦ 1; both traces 1 | Retain. |
| §5.1 boundary triangle | [0,1] manifold atlas; ∂X = ∅; inward-first | Ȟ⁰(X; o_rel∂) = 0, Ȟ¹ = ℚ, Ȟ⁰(∂X) = ℚ²; δ(a, b) = (b − a)η; identity triangle; (a, b) ↦ a − b | Retain the pinned convention. |
| §5.2 boundary law and concordance | [0,1]; cylinder; x³ + tx; x² versus x | [∂X](a, b) = b − a, pushforward to pt: −1 + 1 = 0; equal ends, reversed end negates; x(x² + t) = 0 iff x = 0 on t ≥ 0, classes 1 and 1; classes 0 ≠ 1 | Retain. |
| §5.3 shrinkings and unions | (−1, 1); (1, 2); two zⁿ copies | class 1 for odd n; footprints no longer cover; (n, n) | Retain. |
| §5.4 pushforward | S¹ → pt; zⁿ to any Y; identity | Ȟ¹(pt) = 0 so zero; n on Ȟ⁰; identity | Retain. |
| §5.5 realization | Y = pt; Warsaw circle; degree-k map | n ∈ H_0; Ȟ¹(W) = ℚ, H_1(W) = 0; k[S¹] by Hom(H¹, ℚ) = H_1 | Retain. |
| §5.6 Euler comparison and perturbation | sin θ on S¹; TS²; s = x on ℝ; universal section s + Σλ_iσ_i | signs +1, −1, Euler 0; signed count 2; pairing 1; zeros of s_{tλ} lie in (∪ supp σ_i) × [0,1], compact; transversality over U where σ span, outside U the section is s ≠ 0 | Retain the compactness and transversality steps. |
| §5.6 cobordism atlas | s = x², σ = −χ, s̃ = x² − tχ | zero set t = x² near (0,0); ds̃ = (0, −1) surjective; (0,0) ∈ X̃_∅^reg ∩ ∂, local model a line not a half-line; boundary restriction regular locus {(0,0)} ≠ ∅ | R01. With ρ(t) ≡ 0 near 0: zero set {0} × [0, ε), regular locus ∅: repaired. |
| §6.1 stratifications | x² − 1 with strata a, b; quadrant; collapsed edges; [0,1] | lower semicontinuous ℝ → {a, b} is constant, compatibility fails; on ℝ∖0 it holds; four faces cell-like; union of two rays is a line with the origin interior, not a manifold with boundary {0}; interval cell-like | Retain. |
| §6.2 incidences and equivariance | [0,1] faces; ℝ with {0}; quadrant corner paths; ℤ/2 reflecting ℝ | one incident top side; two; composite signs cancel (sum 0); normal line of {0} reflected by −1, no equivariant trivialization | Retain. |
| §6.3 stratified complex | S = pt; [0,1] three strata; Euler characteristic control | identity; C_vir([0,1] rel∂) ⊕ C_vir({0}) ⊗ o ⊕ C_vir({1}) ⊗ o has H⁰ = ℚ, H¹ = 0 like C_vir([0,1]); ℚ → ℚ with 0 and with id share χ = 0, different cohomology | Retain. |
| §6.4 products | zⁿ × z^m; ineffective point squared; [0,1]² | nm; group order 4, class 1/4; four edges with corner strata; stabilizer (Γ_I)_x × (Γ_J)_y acts factorwise so signs multiply | Retain. |
| §6.5 external product | S¹ × S¹; W × pt; swap in bidegree (1,1) | Ȟ¹ = ℚ ⊕ ℚ; Ȟ¹ = ℚ versus singular 0; sign −1 | Retain; finite nerves only, colimit after. |
| §7.1 fiber-product atlas | sin θ and 0 over ℝ; 1 − cos θ; d_X = d_Y = 0, n = 1, m_I = 1 | Z = {0, π}, d_Z = 0; tangential, no joint chart; chart dimension −1 + 1 = 0 while d_Z = −1 | Retain. |
| §7.2 deformation-pair inclusion | n = 1, q = d_Z + 1 and d_Z; n = 0; B = ∅ in the example | signs −1, +1; identity; C_{−q}(Z) → C_{1−q'}(S¹) with q' = q + 1 preserves homological degree −q | Retain. |
| §7.3 supported Gysin map | ν = x − y; ν = y − x; ū; i^*1 | i_!(1,0) = η (sin increasing at 0), i_!(0,1) = −η; both negated; ū = 0 since H¹(ℝ²) = 0, so cup with ū gives 0 ≠ η; i_!(1,1) = η − η = 0 = 1 ⌣ ū | Retain. |
| §7.3 projection formula and identity | b odd, n = 1; a = (a₀, a_π) | a_U ⌣ b ⌣ u = (−1)^{1·1} a_U ⌣ u ⌣ b; Φ_Z(a) = a₀ − a_π = Φ_{S¹}((a₀ − a_π)η) | Retain; general degrees remain a target, correctly labelled as this roadmap's construction. |
| §7.4 interface | manifold atlas; reflection atlas; x versus x² | fundamental class; rejected before orientation laws; classes 1 and 0 not compared | Retain. |

## Not verifiable

- The general proofs of §6.5 (rational Čech Künneth with rank-one local systems on arbitrary compact Hausdorff spaces) and §7.3 (supported Gysin map equal to H(ι_*) in all degrees) are constructions of this roadmap; the small-instance values above test their conventions, not the proofs. Pardon proves neither (`pardon2016 line 1698–1702`).
- Ownership against open pull requests was checked through the roadmap index (`roadmaps grep`) and the supplied sibling checkouts; it is an object-level search, not a reading of every open roadmap.
- Every cited text was read legally (arXiv; the author's page for Hatcher). No `needs-references.toml` entry was needed.

## Source issues

- **Error** in pardon2016 at Definition 4.2.6 and map (4.2.12), printed p. 36: the source says the chain-level trace is the unweighted obstruction pushforward on the flag-length-0 part; it should be weighted by 1/|Γ_J| on the (I, J) term, otherwise it is not compatible with the (#Γ_{J∖J'})⁻¹ structure maps (free ℤ/2 orbit: 1 versus 2); affects a stated result.
- **Error** in pardon2016 at Definition 5.3.1, printed p. 44: the source says the regular locus on a base with boundary is the ambient surjectivity locus; it should also require surjectivity on the boundary tangent space at boundary points, otherwise ∂X_I^reg is not the boundary of the local model (s(x) = x on [0, ∞), or the parabola t = x² of R01); affects a stated result.
- **Gap** in pardon2016 at Proposition 5.3.4 proof, printed p. 45: the source says choose a smooth family with compact zero set ending in a transverse section and that the atlas of s is a subatlas of the boundary restriction; it should construct the family with a collar near both ends so that the boundary restrictions and their regular loci are the endpoint atlases; affects the proof.
