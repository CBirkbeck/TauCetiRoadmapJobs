# Review of PadicLocalLanglandsForGL2QpPartII (package, round 2)

**Verdict:** needs changes

Twelve findings, five blocking (R01, R02, R03, R05, R11). The extension has the right scope and can be repaired without replanning it. The two declared supplier gaps remain legitimate contracts. The Lean file elaborates, but that does not test the false prose identities below.

## Prior findings, checked first

Locations in this table refer to `packages/PadicLocalLanglandsForGL2QpPartII/README.md`. The repair report marks all eight findings applied; none is marked not actionable.

| Prior finding | Repaired passage | Assessment this round |
| --- | --- | --- |
| F01, ownership of local analyticity and compact-support smoothness | Lines 468–470: “For every k ∈ ℤ the action of G on the strong dual … is locally analytic”; “H¹_dR,c(M^p_n) … is a smooth G-representation”. | **Partly repaired.** These are now targets, preceding their consumers. The extension to arbitrary finite-dimensional ρ is false (R02); new supplier locators and the tree Check also need repair (R04, R07). |
| F02, rational versus geometric spaces | Lines 642–643: “H_C(V)⊗_L O[M]^(G_ℚ_p)” and “H_C(V)⊗_L Ω¹[M]^(G_ℚ_p)”. | **Partly repaired.** The two rows now have the right rational forms. The added explanation tensors over the wrong field; two unchanged occurrences retain the old error (R01). Its cohomological prerequisite is not supplied (R05). |
| F03, nonexistent backticked declarations | Line 86: “the function-dual comparison … the de Rham comparison … with its filtration-preimage statement”. | **Repaired.** The 27 purported declaration names are gone. Section descriptions replace them. The new stale section names are separately covered by R04. |
| F04, stale hashes | Lines 61, 69: “declarations of the pinned Mathlib”; “The pinned Tau Ceti”. | **Repaired.** No stale pin hash remains in the roadmap. |
| F05, uniform versus local nilpotence | Line 302: “t is locally nilpotent, every element being killed by some power of t”. | **Repaired.** The new fourth Check computes the torsion order j of t⁻ʲe. A different, retained shell Check is false for semilinear Γ (R06). |
| F06, unipotent-fixed vectors | Line 362: “No nonzero vector of Π(V)^P-fin is fixed by the whole upper unipotent subgroup”. | **Repaired.** It is now a consequence of the Kirillov model with its own argument. The two scalar tests below also work at p = 2. |
| F07, premature nonvanishing | Line 171: “That the multiplicity spaces of M ∈ ΦNᵖ are nonzero at some level is a theorem of Layer 4”. | **Repaired.** Layer 0 now asserts just the central-character obstruction. Its misuse in later negative controls persists (R09). |
| F08, Scholze supplier locator | Line 118: “§5.4, Finite length of arithmetic Drinfeld cohomology”. | **Repaired.** Resolved at the supplied head, including the transfer from uniformiser-power coefficients to p-power coefficients. The ramified-coefficient Check nevertheless needs R08. |

## R01 (P1) — The repaired descent formula duplicates the coefficient field

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:645`: “((C⊗_ℚ_p V^∨)⊗̂_ℚ_p O[M]^(G_ℚ_p))^(G_ℚ_p)”. Related occurrences: lines 687 and 767.

**Claim:** This expression is Hom_L,G(V,O[M]) and is H_C(V)⊗_L O[M]^G. The paragraph makes the same coefficient choice for H¹.

**Witness:** Take quadratic L/ℚ_p, V = L and B = L with trivial action. The displayed rule gives L⊗_ℚ_p L, of L-dimension two; Hom_L,G(L,C⊗_ℚ_p L) has L-dimension one.

**Exact repair:** In the two expressions involving X = C⊗_ℚ_p V^∨ and the L-space B, use X⊗̂_L B, and tensor their cohomology over L. Keep C⊗_ℚ_p B in descent of a rational L-space: that different formula is correct. CDN20 Proposition 2.4, lines 822–850, tensors over L⊗F, hence over L here; CDN23 Lemme 5.5, lines 2411–2416, also tensors over L.

Apply the rational/geometric distinction consistently: at line 687 write W′_ℒ ∩ W′_ℒ′ = d(O[M]^G), and at line 767 use Ω¹[M]^G in the rational filtration-preimage sequence. Do not change the geometric diagram of §4.1 or the geometric sequence of §4.13. With the corrected tensor, L⊗_L L = L. For the intersection, a nonzero rational exact differential ω and c ∈ C moved by Galois give cω in dO[M] but not in the rational left side; d(O[M]^G) excludes it.

## R02 (P2) — Dimension at least two does not exclude character constituents

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:470`: “For a smooth finite-dimensional ρ of Ǧ with dim ρ ≥ 2, H^k_dR,c(M^p_n)^ρ = 0 for k ≠ 1”.

**Claim:** Dimension alone makes the component contribution vanish.

**Witness:** Set ρ = 1 ⊕ 1. Constants give a trivial constituent in H⁰_dR(M^p_0) and its dual H²_dR,c. Hom_Ǧ(1 ⊕ 1,1) = L², not zero.

**Exact repair:** Require ρ to be smooth absolutely irreducible of dimension at least two, or state the more general exact condition that none of its constituents factors through Nrd. Preserve the unrestricted smoothness assertion. Add ρ = 1 ⊕ 1 as a negative-control Check. The repaired condition excludes that witness, while an absolutely irreducible ρ of dimension at least two has zero multiplicity in the Nrd-action on components. DLB17 Proposition 3.6, line 783, supplies smoothness; the additional vanishing uses the component calculation, not dimension alone.

## R03 (P2) — The weighted preimage needs a specified determinant twist

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:1091`: “up to the twist by the power of x∘det that matches central characters”; line 1096: “The preimage is the dual of Π(Δ_(2,ℒ))”.

**Claim:** The k = 1 Check identifies the preimage with the untwisted strong dual, although the theorem leaves the twist unspecified.

**Witness:** For trivial central character of π, k = 1 and aI₂ with a = p, O(3)⊗det² has scalar a⁻³a⁴ = a. Π(Δ_(2,ℒ))′ has scalar a⁻¹.

**Exact repair:** State the preimage as Π(Δ_(k+1,ℒ))′_b ⊗ det^k, retaining the unramified δ_(k+1) already present inside Π(Δ_(k+1,ℒ)). Specify the corresponding twists in the proof route and the k = 1 Check. The correction gives a⁻ᵏa²ᵏ = aᵏ; at k = 0 it introduces no twist. It also gives (Sym^k)∨⊗det^k ≅ Sym^k on the algebraic quotient. These are the actions fixed in §2.4 and §7.1; see COLMEZ19POIDS Théorème 0.6, lines 215–236, and DLB17 Remarque 11.12, lines 2718–2725.

## R04 (P3) — Two supplier section names refer to superseded designs

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:100`: “ND.2 supplies”; “ND.3 supplies Frommer's theorem”; line 122: “Layer LR.0”. Also the Scope, Needs and Dependencies occurrences.

**Claim:** These are the identifiers of the supplied constructions at the suppliers' current package heads.

**Witness:** `packages/LocallyAnalyticDistributionsPartII/README.md:232` is §2.3 Frommer's theorem; line 213 is §2.2. `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:164` is §0.3. Neither file has ND.* or LR.0 identifiers.

**Exact repair:** Cite LocallyAnalyticDistributionsPartII §§2.2–2.3 for the closure and Frommer theorem, and LocallyAnalyticRepresentationsOfLocalGroups §§0.3 and 0.5 for the differentiated action and distribution-module action. The radius algebras are imported by the former package from PadicLocalLanglandsForGL2Qp §0.1, with its explicit radius-algebras contract at line 57; cite that ownership and retain its p-valuation/radius hypotheses instead of assigning the construction to ND.2. Resolve every occurrence, including lines 37, 458, 472, 512 and 558. The replacement identifiers exist and contain the stated inputs; no new duplicate construction is needed.

## R05 (P1) — The continuous Galois-cohomology prerequisite has no stated owner

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:645`: “PadicHodgeTheory §4.4 for the finiteness of H¹(G_ℚ_p, C⊗V^∨)”.

**Claim:** That section supplies finite-dimensional continuous H¹; the route additionally assumes strict cochain differentials to commute H¹ with a completed tensor and the Fréchet limit.

**Witness:** PR #1062, `TauCetiRoadmap/PadicHodgeTheory/README.md:894`, §4.4, supplies Sen modules, differential realisations and Wach modules. It states no such continuous H¹ theorem or strictness result. CDN20 lines 849–850 use the finiteness.

**Exact repair:** Give the continuous-cohomology input an owner. Either add here a target proving finite-dimensional, Hausdorff continuous H¹(G_ℚ_p,C⊗_ℚ_p V^∨), for every finite-dimensional continuous L-representation V, together with the strict model and limit argument needed by this route, from explicitly cited Tate–Sen inputs; or declare the precise missing cohomological comparison as a PadicHodgeTheory supplier gap in both required places. Do not describe §4.4 as already supplying it. Keep the tensor identity itself as this roadmap's target and make its hypotheses explicit. Test the supplied comparison on the unit and on its nontrivial log χ self-extension, whose Sen operator is respectively 0 and a nonzero nilpotent matrix: finite dimension of the Sen module alone is not a proof of the cochain assertion. This is a new prerequisite, not either of the two settled declared gaps.

## R06 (P3) — A constant shell value need not be Γ-equivariant

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:314`: “The function equal to a fixed nonzero x on p^jℤ_p^× for every j ≥ 0 … lies in LP”.

**Claim:** The proposed function belongs to LP for the arbitrary semilinear coefficient module of §1.4.

**Witness:** Take X = L_∞, t = 0, with its natural Γ-action, and x = ζ_(p^m) moved by σ_a. Then φ(a) = x but σ_aφ(1) = σ_ax ≠ x.

**Exact repair:** Set φ(p^j) = x for j ≥ 0, set it to zero for j < 0, and extend by φ(p^ja) = σ_ax. At p = 2 choose m ≥ 2. The two sides of Γ-equivariance are now both σ_(ab)x; support still has closure ℤ_p and meets infinitely many valuation shells, so it lies in LP and not LP_c.

## R07 (P3) — The tree displacement is two, not one

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:480`: “u(p⁻¹) moves the standard vertex to a neighbour”.

**Claim:** This unipotent moves the standard vertex by one edge.

**Witness:** Multiplying u(p⁻¹) by the homothety p gives the matrix ((p,1),(0,p)), with elementary divisors 1,p². Its vertex distance is 2. Its determinant valuation is even.

**Exact repair:** Replace “to a neighbour” by “to a vertex at distance two”, with the elementary-divisor computation as the Check. The conclusion that the ball has another centre, and U_i is not G-stable, survives. The computation gives distance two also at p = 2 and p = 3.

## R08 (P3) — Reduction modulo p is not reduction modulo the coefficient uniformiser

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:862`: “For k = 1 the pieces are duals of smooth k_L[G′]-modules of finite length”.

**Claim:** The O_L/p-coefficient pieces are k_L-vector spaces for every finite L/ℚ_p.

**Witness:** Let L = ℚ_p(ϖ), ϖ² = p. In O_L/p = O_L/ϖ², ϖ·1 ≠ 0; in k_L it is zero. The integral level-zero Steinberg sector retains this coefficient module.

**Exact repair:** Say that these are duals of finite-length smooth O_L/p[G′]-modules, with k_L-valued composition factors. Reduction modulo ϖ, not p, gives k_L coefficients. Keep ramified L allowed. For the witness the filtration 0 ⊂ ϖO_L/ϖ² ⊂ O_L/ϖ² has two k_L factors, exactly as the repaired Check says. The supplier's O_L/ϖ^a theorem already accommodates this.

## R09 (P3) — Excluded inputs do not make the intrinsic right sides vanish

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:547`: “both sides of (i) vanish”; line 583: “all terms in both rows vanish”; line 584: the level-zero Check; line 1131: “For V = 0 both sides vanish”.

**Claim:** Substituting an excluded type or V = 0 makes every displayed intrinsic period or representation term zero.

**Witness:** Twist a supercuspidal type by unramified χ(p) = 1+p. Its p-central geometric multiplicity is zero, but twisting is invertible and leaves Π^an/π and C⊗M_dR⊗LL(M)′ nonzero.

**Exact repair:** At lines 547 and 583 state that the hypotheses fail, and explicitly compare zero geometric multiplicity with the nonzero intrinsic right side. At level zero say there is no supercuspidal parameter in the theorem's domain, rather than zeroing every term after an invalid substitution. In §7.4 replace V = 0 by the zero Iwasawa class μ in the permitted rank-two V. All its specialisations are then zero, while the whole invariant space remains of D(Γ)-rank two. This tests a class in the theorem, not an unrelated representation.

## R10 (P3) — A nonzero H⁰ does not imply a nonzero cyclic H¹

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:200`: “the H¹(p^ℤ, H⁰) term … contributes … a summand”.

**Claim:** The special type Sp produces an extra summand from this term because its H⁰-multiplicity is nonzero.

**Witness:** At full level zero, the height components are indexed by ℤ and p shifts height by two. On H⁰ = ∏_(h∈ℤ)L, T−1 is surjective: solve f_(h+2)−f_h = a_h separately on each parity.

**Exact repair:** Replace the asserted nonzero summand by this calculation: H¹(p^ℤ,H⁰) = coker(T−1) = 0 at level zero, although H⁰[Sp] ≠ 0. Keep the proved supercuspidal scope if desired, without claiming this false obstruction to its extension. The recurrence also preserves boundedness for bounded a_h by the ultrametric inequality; it does not require an unbounded inverse. The corrected Check separates nonzero coefficients from nonzero group cohomology.

## R11 (P2) — The level-zero subgroup is undefined as written

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:53`: “trivial on 1+ϖ_D^nO_D”; line 169 uses its quotient, including n = 0. Related: lines 45, 183, 933.

**Claim:** The congruence subgroup formula defines levels for every n ≥ 0.

**Witness:** At n = 0, 1+O_D = O_D contains 0 = 1+(−1), so it is not a subgroup of D^×. At the true first transition O_D^×/(1+ϖ_DO_D) has order p²−1, not a p-power.

**Exact repair:** Define K_D(0) = O_D^× and K_D(n) = 1+ϖ_D^nO_D for n ≥ 1. Use K_D(n) in the type, quotient and transition formulas; likewise restrict the DLB congruence formula to r ≥ 1 and specify Σ₀ separately. In §5.6 restrict the p-power assertion to positive lower level, or simply say the finite group order is invertible in L. The repaired zero-level quotient D^×/O_D^× is ℤ, and its irreducibles over a splitting coefficient field are one-dimensional, so the claimed absence of supercuspidal types at zero is now meaningful. At p = 2, the first finite deck group has order 3; at p = 3 it has order 8.

## R12 (P3) — The module docstring omits the weighted headline

**Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:9`: “the weighted, Iwasawa, primitive and filtered derived consequences”; `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean:36` names Colmez weight change but not the weighted geometric theorem of §7.2.

**Claim:** The module docstring lists each unstatable headline and its missing carriers.

**Witness:** It lists §§2.3–2.4 and §§7.4–7.6, but not §7.2's BGG exact row and filtration-preimage realisation. Weight change alone contains neither the tower nor that geometric row.

**Exact repair:** Add a docstring item naming the weighted/BGG realisation of §7.2 and its missing rigid functions, weighted locally analytic actions, differential operator and period-line comparison. State no substitute theorem. The original first-cover consequence §7.3 can be identified there as the level-one specialisation. The pin audit below confirms that adding this explanation, rather than an ad hoc encoding, is the appropriate repair.

## Verified sound

**Extent of review.** Read the four package files, both previous reports, the two gap declarations in `design/plan.json`, the board-package index and the supplied citation/overlap leads. Reviewed all 51 numbered subsections, the conventions, examples and supplier contracts. Recomputed the repaired passages and searched the remaining text for their error patterns. The compact table below includes all 51 subsections, the 15 seeded targets and the headline theorems. Earlier computed examples are retained only after checking their formulas against the present text; in particular the earlier blanket conclusions about dimension ≥ 2, excluded types and V = 0 are superseded by R02 and R09. A row tests the stated instances; it is not a claim that examples prove the theorem.

**Principles and shape.** The base §6.9 remains the owner of the trivial-central-character comparison, its coordinate operator, surjectivity and injectivity. The added targets discharge its global hypotheses, refine the embedded dual, and extend the central-character range. No second correspondence or general tower construction is planned. No computational algorithm, copied source passage, sorry'd data or `set_option` was found. Mathematical layer names and the actual dependency chain determine the order: Kirillov machinery → embedded dual/covariance → realisation → multiplicities → integral evaluation → factorisation. The terminal consequences consume these results. Mentioning the sources' sections does not make their chapter order the build order. Each of the eight layers has Examples and Dependencies; the definitions have prose APIs and at least three Checks, with the defective Checks listed above. No own backticked Lean identifier remains unresolved. No pull-request number, machine path, date or HTML anchor appears in the roadmap or Lean module. The two main-roadmap shape comparisons were `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` and `TauCetiRoadmap/TensorProductCombinatorics/README.md`.

**Elaboration and padding.** Ran the required `lake env lean` on the package's absolute Suggested.lean path from the pinned content checkout: exit 0, no output and no warnings. No TauCeti import required a build. The file contains one `import Mathlib`, one module docstring and an empty namespace: zero definitions, zero instances, zero sorried theorems, zero examples. Thus the mandatory one-tactic probe covers 0/0 theorems and the own-declaration `#check @name` binder audit covers 0/0 declarations; neither is a sampled omission. A separate scratch file checking all ten cited Mathlib names and both de Rham period-ring definitions elaborated with exit 0. No Lean theorem is padding, and no statable headline was found omitted. R12 concerns the inventory of an unstatable headline.

The headline inventory is: global-hypothesis discharge (§3.1); all-type function/de Rham realisation (§3.3); irreducibility and weight change (§§2.3–2.4); Banach multiplicities (§§4.12–4.13); Galois socle (§4.14); arithmetic factorisation (§6.6); weighted/BGG realisation (§7.2, with the first-cover consequence §7.3); Iwasawa invariants (§7.4); infinitely primitivable functions (§7.5); filtered derived realisation (§7.6). The missing carriers stated in the docstring are real obstacles at these pins, not difficulty proving already statable statements. The partial-operator theorem §4.3 is a statable auxiliary result, not one of these end theorems; its absence is not a finding.

**Pinned declarations opened.** Paths here are relative to their pinned library repository. Mathlib revision is `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti revision is `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

| Declaration and pinned file | Definition/hypotheses actually read; consequence for this package |
| --- | --- |
| Bornology.IsVonNBounded, `Mathlib/Analysis/LocallyConvex/Bounded.lean:61` | Absorption of every zero-neighbourhood over a seminormed ring. Neither Hausdorffness nor local convexity is bundled. |
| NormedSpace.image_isVonNBounded_iff, same file:495 | Nontrivially normed field and seminormed target; a single real bound for the norm of an image. |
| WithSeminorms.isVonNBounded_iff_seminorm_bounded and image variant, `Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659`, :679 | The quantifiers are ∀i ∃r > 0. The bound may depend on the seminorm. |
| WithSeminorms.banach_steinhaus, `Mathlib/Analysis/LocallyConvex/Barrelled.lean:164` | Barrelled source is essential to this supplied uniform-boundedness statement. |
| Representation, `Mathlib/RepresentationTheory/Basic.lean:48` | A monoid homomorphism G →* End_L(V); it includes no topological continuity or local analyticity. |
| Submodule, `Mathlib/Algebra/Module/Submodule/Defs.lean:39`; LinearMap, `Mathlib/Algebra/Module/LinearMap/Defs.lean:84` | Algebraic subspace/semilinear-map carriers, not closed subspaces or continuous maps. |
| Module.finrank, `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; Module.Basis, `Mathlib/LinearAlgebra/Basis/Defs.lean:89` | finrank is Cardinal.toNat of rank, not a finiteness hypothesis. Basis bundles a linear equivalence with finitely supported coordinates. §4.3 explicitly assumes finite dimension. |
| BDeRhamPlus, BDeRham, `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, :88 | Period-ring constructions under their ring, prime, nonunit and completeness hypotheses; no Drinfeld tower, representation-valued D_dR functor or cohomology comparison. |
| TauCeti.LocallyAnalytic, `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45` | Algebraic Module.DirectLimit of analytic stages. The file explicitly does not equip this limit with the needed topology. It is not the locally analytic representation category in the headlines. |

Object searches for Drinfeld covers, Robba modules, Kirillov models, locally analytic representations, Banach representation functors and tower cohomology in both pins found no alternative native headline carriers. The Drinfeld hits for elliptic-curve level structures and categorical Drinfeld isomorphisms are different objects. Existing boundedness and elementary linear-algebra objects are cited, not redeclared.

**Sources.** All five works cited by this package occur exactly once in `sources.toml`; all five supplied legal extractions were readable. No locator is marked unverified in the package, and no extra source fetch was necessary. All 15 seeded targets were compared with the text, including the hypotheses and the distinctions between geometric and rational coefficients, special and supercuspidal types, and p-central versus full tower. Pages in the following table are the page labels of the recorded version, not an inferred pagination of a different edition.

| Seeded target | Text opened at its locator and page | Result of comparison |
| --- | --- | --- |
| §0.4 normalisation dictionary | DLB17 lines 184–196, 232–236, arXiv pp. 5–6; CDN20 lines 240–249 and 917–933, pp. 7, 23–24; CDN23 line 2447, p. 63 | Dual line versus line, Frobenius shift and central-character inverse are supported. |
| §1.3 P-finite/infinite slope | DLB17 Définition 7.4 and Remarque 7.5, lines 1473–1500, pp. 36–37; functions at lines 1522–1539 | Definition and trace condition match; the Banach p ≥ 5 restriction is not imposed on the general locally analytic definition. |
| §2.3 irreducibility | COLMEZ19POIDS Théorème 0.3(ii), line 179, p. 5; Remarque 0.2, lines 153–166, p. 4; Théorème 0.6(iii), lines 226–236, p. 6 | Nontrianguline quotient is the irreducible object; the full analytic representation has a smooth subrepresentation. |
| §4.6 period classification | CDN20 Proposition 2.5, lines 859–878, p. 22; Remarque 2.6 and Lemme 2.7, lines 889–913, p. 23 | Rank-two restriction and the special role of F = ℚ_p match. The proof's reversed 0/1 wording is corrected in the roadmap. |
| §4.7 line extension | CDN20 §2.1.4 and the line-extension diagram, lines 917–963, pp. 23–24 | Rational diagram and normalised evaluation supported; the intersection Check still needs R01. |
| §4.12 Banach multiplicities in differentials | CDN23 Proposition 5.7 and proof, lines 2424–2464, pp. 63–64 | Statement requires the p-central type condition, which the roadmap includes. Rational Ω in the proof needs R01. |
| §5.1 arithmetic completion | CDN23 §5.3.1, lines 2627–2639, p. 68; Proposition 5.16 and proof, lines 2635–2657, pp. 68–69 | Order colimit over finite fields, inverse limit in coefficients, then invert p matches. |
| §5.4 integral evaluation | CDN23 Proposition 5.21 and proof, lines 2716–2741, pp. 70–71 | Completion of the direct sum and the projective lifting step match; unrestricted product is not substituted. |
| §5.6 type/level/centre | CDN23 Remarque 5.23, lines 2762–2776, p. 72 | Finite type decomposition and inverse central character match. Zero-level group convention needs R11. |
| §6.1 interpolated Banach dual | CDN23 Définition 5.14, lines 2606–2614, pp. 67–68 | Lattice dual, limit and continuous Hom construction agree; arbitrary Prop-valued stand-ins are absent. |
| §6.3 PID rigidity | CDN23 Lemme 5.12 and proof, lines 2574–2595, pp. 66–67; footnote 32, lines 2861–2868, p. 74 | Infinitely many primes and joint action are retained. |
| §6.5 typed multiplicity | CDN23 Théorème 5.24(ii), lines 2779–2782, p. 72; proof lines 2837–2851 and footnote 32, p. 74 | p > 3 and joint E-action retained; local freeness is expressly made a target instead of silently inferred from fibres. |
| §7.3 original first cover | TEI90 Theorem 5, line 177, p. 73; Corollary 6, line 232, p. 75; equations lines 251–259, p. 75; Theorem 8, line 298, p. 77; DLB17 lines 2734–2781, pp. 65–66 | First ϖ_D-cover is distinguished from Σ₁. Base extension and three-line rigidity are retained. |
| §7.4 Iwasawa functions | DLB17 Théorème 1.9, line 434, p. 11, and proof lines 2787–2789, p. 66 | Rank two and exponential-image H¹_e condition supported; the V = 0 Check is invalid (R09). |
| §7.6 filtered derived realisation | DLB17 Proposition 12.2, lines 2815–2825, p. 67, including the filtration immediately preceding it | Shift [1], filtration line and nontrivial supercuspidal sector match. |

**Adversarial calculations.** Zero rings, equal-characteristic coefficients, arbitrary ranks and general local fields are not admitted by the finite extension L/ℚ_p or rank-two hypotheses; they are not silently substituted into those theorems. Actual admitted boundary cases include p = 2, ramified L, level zero, zero vector/class, zero type ring and reducible finite-dimensional ρ. Matrices w and u(b) test a noncommuting group action, in addition to its centre. “Retain” means no repair for the computation in that row; findings identify the affected clause rather than rejecting every theorem of the subsection.

| Statement | Instances tried | Computed sides/values | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: inverse pullback and Lie action | f = z; u(b), w | u(b)z = z−b; u⁺z = −1; a⁺z = −z; a⁻z = z; u⁻z = z²; wzw = z⁻¹ | Correct signs | Retain |
| §0.1 type and levels | χ(p)=1+p; n=0; p=2,3 | Central scalar (1+p)² ≠1 gives multiplicity 0. Literal 1+O_D contains 0. Correct first deck orders are 3,8 | Type obstruction correct; zero-level notation defective | R11 |
| §0.2 decomposition and cyclic descent | dim JL=2, multiplicity W=L; Sp at level zero | Hom_Ǧ(JL,JL)=L has dimension 1, whereas JL has dimension 2. Difference map f_(h+2)−f_h is onto, so cyclic H¹=0 despite H⁰≠0 | Evaluation correct; extra summand false | R10 |
| §0.3 period line | ℒ≠ℒ′; ℚ_p(1) | Distinct lines give distinct filtered objects; ranks 2 in both. φ=p⁻¹ becomes 1 under [1]; filtration jumps are −1,0 | Shift and parameter distinguish objects | Retain |
| §0.4 dictionary | ℒ=Le₁ in basis e₁,e₂ | e₁∧e₁=0, e₁∧e₂=det basis: line maps to Le₂*⊗det=ℒ^⊥⊗det. Filtration dimensions 2,1,0 | Correct line/annihilator convention | Retain |
| §1.1 unfiltered equation | two period lines; local weight {0,1} model | Both localise to L_n((t))²; their modifications have quotient rank 1 over L_n and satisfy tN⊂D⊂N. The unfiltered N is the same | Not a duplicate of a filtered object | Retain |
| §1.2 polynomial injectivity | trivial rank-one equation; weight {0,1} | ∇1=0, so P=X is noninjective outside the hypothesis. (∇−1)(tx)=t²∂x inside the stated route | Nontriangulinity needed | Retain |
| §1.3 infinite slope | v=0; nonzero trivial vector, p=2,3 | Trace power gives 0 on zero, p^(nk)v≠0 otherwise; at n=k=1 it is 2v or 3v | Correct | Retain |
| §1.4 locally polynomial functions | t⁻ʲe; x=ζ_(p^m); infinitely many shells | tʲt⁻ʲe=0 but t^(j−1)t⁻ʲe≠0 in the quotient. Constant shell gives ζ versus ζ^a. Equivariant extension gives σ_(ab)x on both sides | Local nilpotence fixed; shell Check false | R06 |
| §1.5 Lie/Casimir formulas | weights 0,1; noncommuting t,∂ | ∂t−t∂=1; ∇(∇−1)=t²∂²; u⁻=−t∂²; Casimir ((0−1)²−1)/2=0 | Correct | Retain |
| §1.6 residue pairing | t⁻¹dt paired with 1 and t; k=2 | Residues 1 and 0. Orthogonal exponent is 1, not k=2: te pairs to zero although te∉t²N⁺ | Roadmap corrects source exponent | Retain |
| §1.7 duality and unipotent invariants | single shell; bx∈ℤ_p then bx=p⁻¹ | Pairing sum has one term. Fixedness gives tφ=0 then (ζ_p−1)φ=0. At p=2, ζ₂−1=−2≠0, hence φ=0 | Repaired claim holds on its Kirillov domain | Retain |
| §2.1 embedded dual | two distinct lines; two charts | Both images are the same subspace E⊂tN⊠ℙ¹, rather than merely abstractly isomorphic; zero section has chart coordinates (0,0). No t-adic separation of the full Robba ring is assumed | Uses fixed-radius gap | Retain contract |
| §2.2 homographic covariance | w,u(b),aI₂ | w gives ∂⁻¹ and −∂²u⁺; u(b) gives ∂−b; aI₂ gives a⁻²a²u⁺=u⁺ | Matches inverse pullback, including noncentral matrices | Retain |
| §2.3 irreducibility | Π^an versus quotient; k=1 | Π^an contains π≠0 with quotient≠0. Π(M,−1)⊗det has central factor a⁻²a²=1 | Quotient, not full Π^an, is the headline | Retain |
| §2.4 weight change | k=0,1,2; det Δ(p)=p⁻¹ | Casimir −1/2,0,3/2; modified determinant at k=1 is 1, at k=2 is p; δ₂(p)²=p⁻¹ restores 1 | Nonétale modification is not a Galois carrier | Retain |
| §3.1 new analytic/smooth targets | δ_x on z; ker u⁺ in O′ and Ω¹′; ρ=1²; u(p⁻¹) | u⁺δ_x(z)=1. a⁺ on ker u⁺ is −1 in O′, 0 in Ω¹′. Hom(1²,1)=L². Tree distance=2 | Analytic route coherent; vanishing and Check wrong | R02, R04, R07 |
| §3.1 global inputs | π(f)_p=π⊗ξdet; finite-order global centre | Central character is ξ²; if ξ(p)² has finite order then ξ(p) does too. Twisting by ξ⁻¹ gives π; weight-two eigensystem has dimension 2 | Unramified twist removal specified | Retain |
| §3.2 line-independent Kirillov embedding | h=0; h locally constant nonzero on one shell | h′=0 in both cases, and u⁺h=th=0 in the t-torsion quotient; one nonzero valuation coordinate survives in the target | Kernel distinguished from the whole Kirillov space | Retain |
| §3.3 all-type realisation | nonsquare quadratic centre at p=7; forbidden unramified twist | A quadratic character of μ₆ is not a square of a character of μ₆ (squares have order dividing 3). The theorem covers it. Forbidden twist: geometric side 0, intrinsic quotient ≠0 | Generality is valuable; excluded-input Check wrong | R09 |
| §4.1 fundamental diagram | n=0; forbidden central character; slope 1/2 | No supercuspidal type in corrected level-zero domain. For excluded twist, geometric multiplicities 0, intrinsic C⊗M_dR⊗LL′≠0. At slope 1/2, the φ=1 obstruction used in the route is 0 | Domain must not be confused with vanishing of every term | R09, R11 |
| §4.2 special types | δ_a−δ_b; (z−a)/(z−b); scalar cI₂ | Total mass 1−1=0; residues +1,−1. Scalar δ(c²) on the representation, inverse on its dual; δ(p)²=1 in the central quotient | Correct | Retain |
| §4.3 partial operator | d=0; S=0; d=2,Ae₁=e₂ | Empty spectrum on 0; arbitrary prescribed diagonal extension for S=0. Companion trace λ₁+λ₂, determinant λ₁λ₂ versus wrong −λ₁λ₂ | Statement and corrected signs pass | Retain |
| §4.4 period Hom | V=0; V=L; quadratic F/ℚ_p | Hom from 0 is 0; H_C(L)=L⊗F, of L-dimension 2 when [F:ℚ_p]=2, not dimension 1 | General F coefficient algebra retained | Retain |
| §4.5 Galois multiplicities | V=L; quadratic coefficient L; V=0 | Wrong tensor has L-dimension 2 versus correct 1 for B=L. Corrected rows at V=0 have every term 0 | Repair introduced coefficient duplication; cochain input missing | R01, R05 |
| §4.6 rank-two classification | character; allowed V; degree-two F with labelled weights (0,0),(1,1) | Character Hom to irreducible rank-two period type is 0; allowed Hom dimension 1. Total weights 0+0+1+1=2 but not uniform {0,1} at both embeddings | F=ℚ_p restriction essential | Retain |
| §4.7 line extension | normalising generator by a; two lines; cω | Evaluation scales a·a⁻¹=1. Rational preimages intersect in rational exact forms; G(cω)≠cω for ω≠0 rational and moved c | Definition sound, intersection uses wrong ambient form | R01 |
| §4.8 bounded vectors | trivial action; n·x=pⁿx; seminorm i·q_i | Trivial orbit bound ‖x‖; p⁻ⁿ‖x‖→∞ as n→−∞; fixed vector has individual bounds i but no uniform bound in i | Quantifier order matches pin | Retain |
| §4.9 bounded étale classes | z on Ω; constants; supercuspidal sector | Norm of z−b on a fixed vertex affinoid grows like ‖b‖. Constants have bounded orbit. Hom_Ǧ(irreducible dim≥2,Nrd-character)=0 | Tower application has proper-component models via supplier §7.2 | Retain |
| §4.10 bounded dual/completion | Π=L; St^sm | (L′)^b=L; bounded smooth Steinberg dual=(St^cont)′. Norm of each dual orbit is constant under an isometric Banach action | No arbitrary nonunitary completion substituted | Retain |
| §4.11 occurrence | character; V₁⊕V₂ for distinct period lines; nonsplit quotient extension | Character Hom=0; two permitted summands yield length 2; quotient V→V₁ gives nonzero map by composition | Quotient condition, not semisimplicity | Retain |
| §4.12 differential multiplicity | dim JL=d; second line; forbidden twist | Allowed dimension d; second-line Hom=0; forbidden twist gives 0 although d>0 | Headline correct; rational proof row needs repair | R01 |
| §4.13 étale Banach multiplicity | same allowed Π, dim JL=d | Intersection X⁺_st∩(C⊗ℒ) has L-dimension 2; result dimension 2d versus d in differentials | Galois factor and direction correct | Retain |
| §4.14 Galois socle | irreducible dim3; δ=1 special; forbidden twist | Multiplicities 0, (St^cont)′, 0 respectively; allowed rank-two branch Π(V)′⊗JL | Includes characters and all primes in the first route | Retain |
| §5.1 arithmetic completion | inverse system O/p^k; smooth character of infinite order | L⊗lim O/p^k=L; lim(L⊗O/p^k)=0. Stabiliser modulo p^k is open; intersection of stabilisers need not be open | Completion order and almost smoothness correct | Retain |
| §5.2 saturation | pH⊂H; ramified ϖ²=p | x∉pH but px∈pH. In O/ϖ², ϖ·1≠0; in k_L it is 0 | Saturation test correct; coefficient Check false | R08 |
| §5.3 block multiplicity and handedness | f·e; different block; Y⊗JL | (f·e)(x)=f(e x)=evaluation(f⊗e x); other-block Hom=0; multiplicity of Y⊗JL is Y, not Y⊗JL | Balanced evaluation and multiplicity distinguished | Retain these identities |
| §5.4 completed evaluation | sequence with block i coefficient p^i; all-ones sequence | First has at most k nonzero reductions modulo p^k, infinitely many integrally; second has infinitely many modulo p | Restricted completion, neither direct sum nor product | Retain |
| §5.5 finite generation | absent block; rank-r compact test module over O | Residual dimension 0 gives module 0; O^r/ϖ has dimension r and needs r generators | Correct dual and compact Nakayama input | Retain |
| §5.6 level/centre | special δ; lower levels 0,1 | δ(Nrd a)=δ(a²); multiplicity character δ(a)^−2. First deck order p²−1; positive congruence transitions have p-power order | Inverse correct; level-zero averaging Check wrong | R11 |
| §6.1 interpolated dual | zero coefficient algebra; rescale lattice by p; closed point | Zero input gives 0; T and pT give the same rational representation after inverting p; closed-point construction gives Π(ρ_x)′ | Construction uses real supplied objects | Retain |
| §6.2 special convention | M=Sp, Steinberg block; other block | Galois factor has dimension 1; Steinberg factor (St^cont)′; other-block term 0 | Rank-one special convention is explicit | Retain |
| §6.3 PID rigidity | A=L[T]; lattice comparison diag(1,T); a DVR | At T=0 the comparison drops rank 2→1, yielding a proper stable line forbidden by absolute irreducibility. A DVR has one nonzero prime; χ≡1 gives identical reduction but different characters | Infinite-prime and irreducibility conditions discriminate | Retain |
| §6.4 annihilator | N=L[T]/T²; empty type ring | T kills every closed fibre but T·1≠0 in N. For R_type=0 the annihilator is (1), forcing m=0 | Fibre-only proof excluded | Retain |
| §6.5 typed structure | R=L; scalar action on continuous dual | Ř=Hom_L(L,L)=L; (rℓ)(s)=ℓ(rs); formula reduces to m_B(Π(ρ_x)′)⊗ρ_x with rank-two Galois factor | Joint action and locally-free target retained | Retain |
| §6.6 factorisation | closed permitted point; special point; block sequence p^i | Factors Π(ρ_x)′⊗ρ_x⊗JL; special term (St^cont)′⊗1⊗1; finite support mod p^k, not infinite product | Correct end theorem at p>3 | Retain |
| §7.1 automorphy twist | g,g′; k=0; aI₂ | Product factor equals (aa′+bc′)−(ca′+dc′)∂; k=0 factor 1; central factor a⁻ᵏ | Cocycle agrees with gg′, not reversed product | Retain |
| §7.2 BGG and preimage | k=0,1; a=p | k=0 is de Rham row; k=1 differential is d²/dz². Middle central scalar p, claimed untwisted dual p⁻¹; det twist contributes p² | Exact row correct; preimage Check false | R03, R12 |
| §7.3 first cover/three lines | p=2,3; y=ϖ_K y′; diag(1,c) | p=2 gives y′³=z−z² with ∂/∂z=1 mod2; p=3 has p−1=2 factors of degree4. diag(1,c) fixes two coordinate lines, fixes their sum line only if c=1 | Model and three-line correction pass | Retain |
| §7.4 Iwasawa invariant space | zero class in allowed V; replacing V by0 | Zero class has all specialisations 0; whole function-invariant module has rank2. Substitution V=0 gives rank0 on the cohomological side but leaves the fixed-π side rank2 | Headline supported; Check invalid | R09 |
| §7.5 primitivable functions | Σ₀=Ω⊔Ω; f=(1,−1) | jth primitive (z^j/j!,−z^j/j!) differentiates j times to f. f is not diagonal pullback; it lies in H⁰_dR·O(Ω) | Corrected target includes components | Retain |
| §7.6 filtered derived realisation | chosen period line; trivial ρ excluded | Shift puts H¹ in degree0; Hom has dimension2 with Fil⁰ dimension1, Fil¹ dimension0. Trivial ρ would retain H⁰≠0 | Filtration and exclusion agree | Retain |
| §7.7 boundary sheaf | empty open; disjoint union; cofinal balls | Sections over ∅=0; sections over U₁⊔U₂ are product; shifting ball indices i→i+c leaves the same germ quotient | Definition distinguishes germs from global functions | Retain |

**Ownership and supplier resolution at the supplied heads.** Used `roadmaps show` and `roadmaps grep` for the open-head/main audit, and read the board-package index before resolving the three board-only suppliers. The citation resolver's sole lead, ProetaleCohomologyOfPAdicCurvesAndTowers §7.5, is a false missing-owner lead: that package is present and states the diagram. The searches were by objects as well as names: P-finite Kirillov vectors, homographic covariance, weight change, Drinfeld functions, the Galois socle, interpolated Banach duals and boundary-function sheaves. Unrelated P-finite group/cohomology hits were discarded after reading their context. No duplicate ownership of this package's new comparisons was identified. The distinctions below explain why the retained refinements belong here.

For open roadmaps, file references in this table are `TauCetiRoadmap/<roadmap>/README.md` at the indicated pull-request head; for board-only suppliers, they are `packages/<roadmap>/README.md`. Line numbers are those of the file, excluding the tool's added display banner.

| Supplier | Resolved sections and witnesses | Ownership/convention result |
| --- | --- | --- |
| PadicLocalLanglandsForGL2Qp, PR #1312 | §0.1 at line 205; §§0.2, 1.1–1.7, 2.5, 2.7, 3.1–3.8, 3.11; §4.1k at 1300, §4.2a at 1416, §4.9 at 1614, §4.11 at 1657; §§5.1–5.8, §5.12 at 2013, §6.7, §6.9 at 2312 | Owns correspondence, categories, analytic quotient, blocks, type rings and conditional comparison. §6.9 has trivial central character and explicit global hypotheses. Embedded equality, covariance and their all-type extension here are additional targets. p ≥ 5 on its Banach P-finite input is kept distinct from the general definition here. |
| EndoscopicTransferAndUnitaryTraceComparison, PR #999 | §§12.4, 12.5, 12.7, 12.14, 12.19 at lines 4623, 4652, 4704, 4860, 4962 | Tower, actions, central quotient and arithmetic descent are imported. Scalar a has Nrd(a)=a²; diagonal centre trivial forces the multiplicity's inverse central character. The positive-level formula does not define n=0 (R11). |
| ProetaleCohomologyOfPAdicCurvesAndTowers, board | §§0.3–0.4 at lines 172–204; §§6.2, 6.5, 6.9 at 657, 693, 741; §§7.1–7.5 at 777, 789, 801, 813, 826 | Owns general F tower geometry, half-plane cohomology, multiplicity diagram, components and semistable models. This package specialises the diagram at F=ℚ_p and takes Galois/Banach multiplicities. §7.2 constructs models from proper cocompact quotients, providing the tower setting needed by the bounded-function argument. No separate tower or general fundamental diagram is owned here. |
| LocallyAnalyticDistributions, PR #854 | §§0.0, 0.2, 0.3 at lines 891, 1081, 1344 | General locally convex limits, strictness and strong duals are supplied. These do not by themselves prove strictness of the particular Galois cochain complex (R05). |
| LocallyAnalyticDistributionsPartII, board | §§2.2–2.3 at lines 213, 232; radius-algebras contract at line 57 | Closure/Frommer results exist, radius construction is assigned to the base roadmap. Old ND identifiers need replacement (R04), not a duplicate Frommer target here. |
| LocallyAnalyticRepresentationsOfLocalGroups, board | §§0.3 and 0.5 at lines 164, 209 | Supplies differentiated action and distribution action. Old LR.0 identifier needs replacement. The tower-specific analyticity and compact-support smoothness remain this package's targets. |
| PhiGammaModulesAndIwasawaCohomology, PR #1310 | §§2.4, 5.4, 5.6a, 5.7 at lines 1158, 2345, 2453, 2494; all-level/generation statements following line 2518 | Supplies 1−φ, differential equation and exponential-image/generation criteria. Its opposite printed Hodge-weight convention is translated to {0,1}. Geometric nontriangulinity after coefficient extension is retained in the contract; the GL₂ involution is not attributed to this supplier. |
| PadicHodgeTheory, PR #1062 | §§3.3, 4.4, 5.1–5.4, 8.1 at lines 682, 894, 982, 999, 1016, 1044, 1378 | Period, Sen and differential carriers exist; the additional cohomology assertion attributed to §4.4 does not (R05). |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | §§RD.1.73 and RD.2.43 at lines 4055, 5283, including the nontrianguline application | Residue pairing, perfectness and the bijectivity application are owned there; this package imports them. |
| GL2AutomorphicRepresentationsAndTransfer, PR #931 | R16.1.8 at line 716; R16.3; R17.3.1 at 1703 and R17.3.5 at 1750 | Full local finite-character prescription, rank-two parameters, global transfer and strong multiplicity one exist. Full local prescription matters for cancelling the unramified twist. |
| CompletedCohomologyAndLocalGlobalCompatibility, PR #1270 | §§2.7, 4.9, 6.4 at lines 935, 1719, 2275 | Classical quaternionic forms, definite local–global compatibility and globalisation exist. Residual absolute irreducibility at p and the initial unramified twist are retained. This package constructs the nonzero map into tower functions, not another completed-cohomology theory. |
| HilbertModularVarietiesAndShimuraCurves, PR #1005 | R18.5.3, R18.5.16, R18.5.21 at lines 1817, 2343, 2552; R18.4.24a, R18.4.25, R18.3.29 at 3937, 3993, 4014 | Formal half-plane model, all-level uniformisation, semistable comparison and rank-two eigensystem realisation exist. The contragredient Galois representation and opposite weight convention are expressly translated. |
| LocalGaloisDeformationRings, PR #923 | §3.8 at line 2367 | Owns the fixed Weil–Deligne quotient comparison, not this cohomological factorisation. |
| SmoothRepresentationsOfLocalGroups, PR #1688 | SR.0 and SR.2; cuspidal-splitting at line 2744 | Smooth categories supplied; projective/injective splitting is printed for complex coefficients. The declared characteristic-zero coefficient extension is therefore a genuine gap. |
| ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PR #1757 | §5.4 at line 754 | Arithmetic finite length for p>2 and uniformiser-power coefficients, plus the geometric finite-dimensional Hom input. No second proof is planned here. The coefficient translation is valid; R08 is its erroneous residual-field Check. |

The supplied overlap snapshot reports no other pull request changing this roadmap, no dropped cited identifiers and no identifiers defined only by an open revision. Its five closest roadmaps (#1312, #1270, #1757, #1062, #1310) were checked in the table above. The live overlaps command could not resolve this not-yet-indexed package; it does not supersede that supplied snapshot. No dropped-id, conflicting-head or two-owner overlap finding is supported by the available evidence. Roadmap and pinned-library searches do not replace reading the positive supplier matches; those matches were opened as listed.

**Declared gaps.** `fixed-radius-divisibility` and `cuspidal-projectivity-coefficients` occur under the named suppliers in the README and under the same slugs in `packages/PadicLocalLanglandsForGL2QpPartII/design/plan.json`. Each asks for one specific statement with hypotheses, neither has supplier `none`, and neither duplicates an available input. The first demands control inside a fixed-radius lattice on both charts, rather than false separation in the full Robba ring. The second extends the complex cuspidal splitting theorem to a characteristic-zero coefficient field with fixed central character. They are not findings and do not explain away R05.

**Dependency check.** Ran the prescribed movable dependency check against the supplied order and content checkout. Output:

    depcheck: 236 roadmaps, 2148 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. Read every Needs line and supplier contract as well: the stale internal locators in R04 and missing asserted input in R05 are not detected by a roadmap-level graph check. No forbidden supplier or later-roadmap dependency was identified in this package.

## Not verifiable

- Published pagination of versions other than those recorded in the manifest was not independently checked. DLB17 was read as arXiv v2, CDN20 and COLMEZ19POIDS as the recorded author copies, CDN23 as the recorded HAL copy, and TEI90 as the published Numdam scan. The package cites theorem numbers and extraction lines of these versions; the source table reports those page labels explicitly. No cited source text was inaccessible, and no missing-reference request was necessary.
- Ownership outside the supplied main checkout, available board packages and indexed open heads was not checked. The supplied tools and overlap snapshot were used; no unprovided pull-request checkout was sought. The current package itself is not yet a name accepted by the live overlap command.
- This is a roadmap review. The heavy representations, rigid spaces and comparisons have no implementations at the pins, so their analytic conclusions cannot be verified by Lean execution. The source and adversarial checks above are the evidence; an empty acceptance file does not certify those mathematical statements.

## Source issues

Page labels below refer to the recorded copies specified in the manifest; no claim about a different edition's pagination is implied.

- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii), p. 4 (line 163): the source says the negative-weight quotient occurs without a character twist; it should be twisted by x^k to match Théorème 0.6(iii); affects a stated result.
- **Error** in DLB17 at Proposition 7.7(b), arXiv p. 38 (line 1569): the source says the unfiltered differential lattice has orthogonal t^kN⁺; it should be tN⁺, independently of the weight gap; affects a stated result.
- **Misprint** in CDN20 at proof of Lemme 2.18, p. 30 (line 1186): the source says all companion-column coefficients are positive elementary symmetric functions; it should use alternating signs, giving determinant λ₁λ₂ in dimension two; affects the proof.
- **Misprint** in CDN20 at proof of Proposition 2.5, p. 22 (lines 875–876): the source says isomorphic versus nonisomorphic irreducible period modules give dimensions zero versus one; it should give one versus zero; affects the proof.
- **Gap** in DLB17 at Remarque 11.13, arXiv p. 66 (lines 2776–2781): the source says two filtration lines determine the comparison up to scalar; it should use three distinct lines or another scalar-rigidity argument; affects the proof.
- **Error** in DLB17 at Théorème 1.10, arXiv p. 11 (line 447): the source says infinitely primitivable functions are pulled back from the half-plane; it should allow locally constant component coefficients multiplying those pullbacks; affects a stated result.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8, HAL pp. 63–65 (lines 2424–2473): the source says level at most n suffices for nonzero multiplicity in the central quotient; it should also require trivial action of p on the type; affects a stated result.
- **Misprint** in CDN23 at Théorème 5.15, HAL p. 68 (line 2624): the source says the coefficient dual is the continuous dual of itself; it should be the continuous L-dual of the coefficient ring R; affects a stated result.
- **Gap** in CDN23 at proof of Théorème 5.24(ii), HAL p. 74 (lines 2837–2851): the source says the relevant dual modules are finite locally free over the PID factors; it should justify local freeness before applying the rigidity comparison; affects the proof.
