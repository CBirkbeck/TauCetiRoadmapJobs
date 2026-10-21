<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/139#issuecomment-6327945105 -->
Red team round 1 pass a (codex) of 17d85a4

Verdict: needs_changes

1. **F01** (P1) Three prerequisite roadmaps are unowned, undeclared gaps

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:72–80: “do not exist yet”.

   **Claim:** NumericalPicardAndContractionDescent, GenusOneFibrationsAndRationalEllipticSurfaces and EverywhereGoodReductionAndLowDegreeHodgeNumbers supply numerical descent, essentially all genus-one surface infrastructure and Fontaine’s obstruction.

   **Witness:** None of these three names occurs in merge-order/ORDER.txt or the supplied main/sibling roadmap trees. The package has neither design/plan.json nor matching `gap:<slug>` contracts. §§2.19, 3.13 and 4.1 consume these missing inputs.

   **Exact repair text:** Replace the three fictitious supplied interfaces with owned prerequisite targets, or precise Part II supplier contracts recorded under both `## Exact supplier contracts` and the plan’s `gaps` list. For numerical descent require the relative numerical local system and labelled contraction descent with their hypotheses; for genus-one geometry separate the construction, local comparison, rank formula and completeness contracts; for good reduction state Fontaine’s exact smooth-proper local-model theorem. Cite each owned target from its consumers. Do not call an absent roadmap an existing supplier.

2. **F02** (P1) SchemeAndStackFoundations is cited for the wrong layers and absent differential theorems

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:59–68: “SF.1: coherent cohomology” and “Also supply DI21 Theorem 6.1”.

   **Claim:** SF.0 supplies algebraic spaces, SF.1 supplies coherent duality, and SF.4 supplies the particular DI21 one-obstruction and differential nonlifting theorems.

   **Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:2105, 3437, 4275 and 5291 instead place algebraic spaces in §§1.3–1.9, coherent cohomology in §2.6, duality in §2.20 and smooth deformations in §4.6. DI21’s specialized theorems are absent.

   **Exact repair text:** “Use SchemeAndStackFoundations §§1.3–1.9 for algebraic spaces, §2.6 for coherent cohomology, §2.20 for duality, §§4.1–4.6 for deformation foundations and §§5.9–5.10 for surface intersections.” Replace every affected `SF.0`/`SF.1` citation accordingly. Add separately owned targets or matching declared Part II gaps for DI21 Proposition 3.3/Corollary 3.4 and Theorem 6.1, with their exact hypotheses, before §§8.3–8.4 consume them. Generic deformation foundations are not these theorems.

3. **F03** (P2) The pointed-curve ownership boundary is stale

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:13, 53, 700: “Layer D only covers pointed smooth curves”.

   **Claim:** JacobianChallenge supplies no surface Picard representability and only a pointed smooth-curve Picard constructor.

   **Witness:** TauCetiRoadmap/JacobianChallenge/README.md:254–287 specifies its “Projective Picard representability” target for every projective geometrically integral scheme over a field, then specializes it to the standing curve. The cited restriction is false at the supplied main version.

   **Exact repair text:** “JacobianChallenge Layer D supplies projective Picard representability for geometrically integral projective schemes over a field, including projective Enriques surfaces. General proper-flat algebraic-space families over arbitrary bases, their base-change comparison and Picard flatness require the separate relative surface-Picard interface.” Cite the existing field theorem in the field specialization; retain only the genuinely missing relative extension as a declared contract.

4. **F04** (P2) The K3 supplier contract ignores the supplied current sibling

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:72, 80, 1161: “K3SurfacesAndSymplecticBoundedness ... do not exist yet”.

   **Claim:** The K3 predicate and its projectivity/cohomology interfaces are a hypothetical, unsectioned supplier contract.

   **Witness:** TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:197–234 already specifies §1.1 `AlgebraicGeometry.IsK3`, §1.2 field-extension invariance and §1.3 projectivity at the supplied sibling head.

   **Exact repair text:** “K3SurfacesAndSymplecticBoundedness §1.1 (`AlgebraicGeometry.IsK3`), §1.2 (`isK3_iso_and_fieldExtension_iff`) and §1.3 (`IsK3.projective`) supply the shared unpolarized K3 interface.” Remove this roadmap from the nonexistent-suppliers sentence and add these precise citations to §3.10’s Needs. Resolve the shared genus-one foundations with the sibling’s SchemeAndStackFoundations Part II §genus-one-fibrations contract, rather than assigning the same foundations a second owner. Re-run the direction check after the ownership/order is established; absence from ORDER alone is not the finding.

5. **F05** (P1) The supplier/consumer contract creates a WeilConjectures cycle

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:120, 148, 2049: “WeilConjectures ... takes the Enriques invariants of Layer 0”.

   **Claim:** WeilConjectures WC.7 supplies the cohomology and general count to §§0.1, 0.3 and 3.1, while WC.7 consumes this roadmap’s Enriques invariants.

   **Witness:** The displayed Needs put §§0.1/0.3 after WC.7; the downstream paragraph puts WC.7 after §§0.1/0.3. merge-order/ORDER.txt:97 places WeilConjectures among the earlier suppliers.

   **Exact repair text:** “WeilConjectures WC.7 supplies the general constant-numerical-Picard surface count. This roadmap proves the Enriques invariants in Layer 0 and applies that general theorem in §3.1. WeilConjectures does not depend on this roadmap.” Remove WeilConjectures from `## Downstream consumers`; keep the Enriques instance owned here. Record the general count’s actual current supplier target, or declare the missing contract precisely if it is absent.

6. **F06** (P1) Easy discriminant headline statements are missing from Lean

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean:121–147 and packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1707–1737.

   **Claim:** The Layer 6 milestones include two order-four discriminant groups, each with two nonzero isotropic spinor classes, but Lean stops at determinants, evenness and basis pairings.

   **Witness:** TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Group.lean:109 defines `L.DiscriminantGroup`; Discriminant/Quadratic.lean:123 defines its quadratic map. Both matrices, lattices and evenness propositions are already retained in Suggested.lean.

   **Exact repair text:** Add and list in §§6.2–6.3 the two native-carrier headline theorems. For each `L` equal to `firstLattice` or `secondLattice`, state `Nonempty (L.DiscriminantGroup ≃+ (ZMod 2 × ZMod 2))` and `Nat.card {x : L.DiscriminantGroup // L.discriminantQuadraticMap hL x = 0} = 3`, using the corresponding evenness theorem `hL`. These include zero and exactly two nonzero isotropic classes; no invented geometric carrier is needed.

7. **F07** (P2) Two admitted targets merely restate an existing Gram API

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean:133–147; packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1675–1677.

   **Claim:** `firstLattice_basis_pairing` and `secondLattice_basis_pairing` are new admitted milestones.

   **Witness:** TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:295–298 proves `IntegralLattice.integralForm_ofGramMatrix_apply` for every basis and symmetric integral matrix, with exactly these conclusions after unfolding the two definitions.

   **Exact repair text:** Delete the two admitted wrapper theorems and their interface bullets. State instead: “Basis-pairing recovery is supplied by `TauCeti.IntegralLattice.integralForm_ofGramMatrix_apply` (Basic.lean:295); specialize it in the proved examples.” Keep the two concrete lattice definitions and their genuinely new discriminant milestones.

8. **F08** (P3) Lattice Checks omit their native-carrier mirrors and exceed the example contract

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1701; packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean:158–203.

   **Claim:** The native-lattice Checks test the last basis vector’s square and the two fork entries, while the Lean examples test only the extra edge and generic constructor formulas.

   **Witness:** Suggested.lean:158 and 164 merely reuse `ofGramMatrix_carrier`; line 185 restates `discriminantQuadraticMap_mk`. Lines 191 and 196 mention no roadmap definition. The promised native basis-(9,9), (5,6), (5,7) checks are absent.

   **Exact repair text:** Replace the two carrier-equality examples and the generic quadratic-map example with at most two proved examples per concrete lattice, bundling the (8,3), (9,9), (5,6) and (5,7) pairings. Replace the standalone AddCircle arithmetic with evaluations on explicit dual representatives of these lattices. Keep all examples discriminating and tied to a retained roadmap definition; move any unproved boundary assertion to a named README/Lean theorem target.

9. **F09** (P3) The biconductrix negative control is false without a witness

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:508: “Replacing O_{2C} by O_{C_red} changes the invariant”.

   **Claim:** Replacing the doubled Cartier subscheme by the reduced support changes the cohomological invariant.

   **Witness:** The immediately preceding Check sets C=0. Then both subschemes are empty and both H¹ groups vanish. Thus the stated replacement need not change the invariant.

   **Exact repair text:** “On an exceptional surface of type T₂,₃,₇, H¹(O_{2C})≠0, whereas the reduced conductrix is a tree of rational curves and H¹(O_{C_red})=0 (ESB21 Theorem 1.1 and Proposition 2.8(3); existence is recorded at ESB21 line 64). For C=0 both groups vanish.” Give each of `Conductrix`, `Biconductrix` and `IsExceptional` three discriminating Checks, rather than counting one shared three-item list for all three definitions.

10. **F10** (P2) The full reducibility theorem is replaced by a route-specific restriction

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:17 and 634–644: “specified at the narrower strength used in Layer 6”.

   **Claim:** Only classical Enriques fibrations with generic Pic⁰ of order two receive the reducibility theorem needed to produce a two-section in a prescribed coset.

   **Witness:** Lang1983 lines 757–762 states the general positive-square effective-divisor decomposition, without a classical-type or generic-Pic⁰-order restriction, and its numerical-lattice counterpart. The README expressly declines this general theory.

   **Exact repair text:** Add before §1.26: “For every geometric Enriques surface and effective divisor D with D²>0, there are nonzero effective divisors D₁,D₂ with D linearly equivalent to D₁+D₂ and D₁²,D₂²≥0 (Lang1983, Theorem 4.1, printed p. 62).” Add the numerical target: “For L=U⊕E₈(−1), h²>0, d²>0 and d·h>0 imply d=d₁+d₂ for nonzero dᵢ with dᵢ²≥0 and dᵢ·h>0 (Theorem 4.2).” Retain §1.26 as the separately proved coset-preserving application, with an explicit derivation preserving the generic class; do not substitute the application for the general theorem.

11. **F11** (P2) The quasielliptic exclusion is narrowed below its primary source

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:532–538: “cannot have a simple III* or II* fibre”.

   **Claim:** Only simple III*/II* fibres are excluded from nonexceptional quasielliptic fibrations, and the Check explicitly withholds the multiple case.

   **Witness:** ESB21 lines 458–460, Proposition 3.16, treats a quasielliptic fibre of either multiplicity, simple or double. Its second sentence only restricts the exceptional surface’s finer type when the fibre is simple.

   **Exact repair text:** “On a nonexceptional geometric Enriques surface in characteristic two, a quasielliptic fibration has no fibre of type III* or II*, whether simple or multiple (ESB21, Proposition 3.16, pp. 12–13).” Replace the Check by separate simple and double forbidden cases. Keep §1.20’s special-bisection requirement for its general genus-one, including elliptic, assertion.

12. **F12** (P3) The package lacks the required source manifest

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/sources.toml (absent); README.md:2051–2077.

   **Claim:** The package cites dated manuscript versions and older foundational works without recording their source identities, acquisition status or verified locators in a manifest.

   **Witness:** The committed package contains only README.md, Suggested.lean, metadata.toml and review.json. No sources.toml records even SCH23, ESB21, DI21, MMV22, Fontaine, Stacks or the cited Lang1983 theorem.

   **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one entry for every directly cited work, version-specific locators and `cited_for` targets. Obtain URL, acquisition time, hash, licence class and status through the sources service. SCH23 is arXiv:2004.07025v3 (manuscript 19 July 2022); DI21 is arXiv:1906.04616v2 (manuscript 4 January 2021). Include the older foundations actually invoked, and record unavailable works as unresolved or explicitly uncertified according to the service; never invent a hash or silently certify an unread text.

13. **F13** (P3) The declared pins are not the supplied pins

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:14–15, 39, 47, 51; Suggested.lean:8.

   **Claim:** Representative signatures use Mathlib 082e2d37 and Tau Ceti f7904748, and named native APIs exist only in a newer library outside the Lean pin.

   **Witness:** lake-manifest.json:8 and 18 pins Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a. The named square-class and Cartier-duality objects are present at those pins.

   **Exact repair text:** Replace the obsolete hashes with the manifest’s actual revisions and remove “newer than the Lean pin”. List native declarations and their files under the exact pinned contracts. For dyadic units cite `TauCeti.exists_eq_neg_one_pow_mul_five_pow_mul_sq` and `TauCeti.isSquare_coe_iff_mem_unitsPrincipal_three` in `TauCeti/NumberTheory/Padics/SerreSigns.lean`, then state only the new representative/twisting adapter here.

14. **F14** (P2) The auxiliary Jacobian count is called an actual fibre point count too early

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1353–1368: “Fibre counts of the Jacobian match” and “Write n_a for the number of F₂-points of the fibre”.

   **Claim:** Before proving constant Picard of J, the table’s additive expression 2r+1 is presented as its actual residue-field fibre count.

   **Witness:** SCH23arxiv lines 1155–1158 explicitly separates the auxiliary n_a from the still-unknown count of J_a. The component-descent proof is Theorem 9.4, which consumes Σn_a=25 and corresponds to §4.11.

   **Exact repair text:** “Define n_a as the auxiliary quantity attached to the Jacobian’s fibre type and geometric component count by the displayed table. At this stage prove n_a=#Y_a(F₂), hence Σn_a=25. After §4.11 establishes constant Picard and the labelled component descent for J, deduce n_a=#J_a(F₂).” Rename §4.10 “The auxiliary Jacobian count equals the Enriques fibre count”; do not use §4.11’s graph conclusion inside its own input.

15. **F15** (P3) Process instructions and an absent-name catalogue remain in the deliverable

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1596; Suggested.lean:221–234.

   **Claim:** The README says “never publish an unconditional eight-case reduction”; the Lean file ends with a catalogue of definitions and milestones it does not declare.

   **Witness:** README.md:1596 gives a publication instruction. Suggested.lean:223–233 lists absent names and prose milestones after all declarations, although the module docstring already identifies README.md as the nonexhaustive specification.

   **Exact repair text:** Replace README.md:1596 by “The eight-case reduction depends on the fourteen-case completeness theorem and the three exclusions in §5.7.” Delete Suggested.lean:221–234. Preserve the mathematical hypotheses and the standard module docstring.


16. **F16** (P1) Characteristic-zero lifting is an unowned input to deformation flatness

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1995: “retain the Enriques characteristic-zero formal-lifting assertion”.

   **Claim:** The exceptional/supersingular miniversal ring is W(k)-flat because its relation is not associated to 2; characteristic-zero lifting is invoked to establish that extra fact.

   **Witness:** DI21arxiv lines 494–525 separates regularity from characteristic-zero lifting. The ring W(k)[[t₁,…,t₁₂]]/(2) satisfies the stated regularity, tangent-dimension and non-W₂-lifting conditions but is not W-flat. No earlier target proves the additional Enriques lifting input.

   **Exact repair text:** Add before §8.4 an owned target: “Every geometric Enriques surface in positive characteristic admits a smooth proper lift over a finite extension of W(k); in particular its miniversal deformation formally lifts to characteristic zero.” Give its independent proof and supplier inputs, using Cossec–Dolgachev–Liedtke, Enriques Surfaces I, 19 April 2024 manuscript, Theorem 5.11.5, printed pp. 610–611 (CDL2024 lines 28665–28689), or its primary sources. Add that target to §8.4’s Needs. Corollary 3.4 is then applied to a proved hypothesis, rather than supplying it.

17. **F17** (P1) The type-classification proof points forward to its own consumer

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:364–366, 1161–1163: “from the canonical cover theorem”.

   **Claim:** §1.12 derives the ordinary étale fundamental group from the canonical-cover theorem, while the actual étale-K3-cover target §3.10 lists §1.12 as an input. §§1.13–1.14 similarly invoke the later local-cover theory.

   **Witness:** §3.10 Needs includes §1.12; §1.12’s proof invokes the canonical-cover theorem only stated in §3.10. The K3 sibling’s §1.1–§1.3 contract defines K3/projectivity but contains no theorem computing the étale fundamental group.

   **Exact repair text:** Keep the three Picard-type definitions and Cartier-dual identifications before the cover constructions. Move their fundamental-group consequences to separate later targets after the local and étale canonical-cover theorems. State and own the needed simply-connectedness/classification argument, or declare a precise earlier supplier gap; a degree-two torsor and the K3 predicate alone are not a proof of that argument. Make the Needs edges target-specific so no cover theorem consumes its own fundamental-group corollary.

18. **F18** (P3) The family Checks include an impossible-family control

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:682–688: “A Z-family restricts to a Z/4-family”.

   **Claim:** The three Checks discriminate the `EnriquesFamily` definition.

   **Witness:** The mod-four Check assumes the family whose nonexistence is §8.7. The last Check only describes the constructor’s chosen carrier. Neither supplies an actual positive or negative family, so replacing the geometric-fibre predicate by a wrong one is undetected.

   **Exact repair text:** Replace the three Checks by: “For an actual geometric Enriques Y/k, the constant family Y×Spec(k[t]) satisfies EnriquesFamily.” “Its restriction to Spec(k[t]/(t²)) is an Enriques family over a nonreduced base.” “The smooth proper family P² over k[t] fails EnriquesFamily because its geometric second Betti number is one.” Keep the algebraic-space carrier requirement in the definition, not as one of the three discriminating Checks. These geometric examples stay README targets until their carriers exist.

19. **F19** (P3) Numerical constancy and splitness have no negative controls

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:832–838.

   **Claim:** The three displayed group-scheme Checks test `ConstantNum`, `ConstantPicard` and `SplitPicard` independently.

   **Witness:** All three displayed groups have constant numerical quotient and a split extension. Replacing either `ConstantNum` or `SplitPicard` by the constant predicate True passes every displayed Check. Only `ConstantPicard` has a negative case.

   **Exact repair text:** Add group-extension controls at the same level as these existing Checks: “Over R, descend Z¹⁰ using complex conjugation acting by −1 on its first generator; this numerical local system is not constant.” “Descend Z¹⁰⊕Z/2 using σ(e₁)=e₁+τ, σ(τ)=τ and σ(eᵢ)=eᵢ for i>1. Its quotient is constant Z¹⁰, but no invariant lift of e₁ exists, so the extension is nonsplit.” State the predicates on the actual extension before their Enriques specialization, and give each definition three discriminating Checks. Do not claim these abstract group schemes are realized by Enriques families without a separate realization proof.

## Verified sound

Read all 2,077 README lines and all 236 Lean lines, plus the repository rules. Inventoried 112 numbered targets, 81 named non-test README interfaces and 68 explicit Check bullets (58 named), with the additional Examples paragraphs and native-lattice paragraph also examined. Read all 35 Lean declarations: six real-bodied definitions, fifteen theorems (thirteen admitted), and fourteen proved examples. The per-declaration table below records their complete variable/instance context; there are no section variables whose hypotheses can silently disappear.

Checked 75 source locators against accessible text, including locators used for proposed repairs. The dated SCH23 and DI21 manuscripts match the fetched arXiv versions. Checked the one cited sibling roadmap, K3SurfacesAndSymplecticBoundedness, against its supplied head: three concrete interfaces in §§1.1–1.3 and its shared genus-one supplier contract. Searched all six other supplied sibling heads for overlapping ownership; none is cited directly by this package. Main-roadmap checks covered SchemeAndStackFoundations, IntegralLattices (active and completed), AlgebraicVectorBundles, JacobianChallenge and LocalFieldsRamification. The three unavailable named supplier artifacts are recorded below rather than presumed absent.

The numerical verification used exact rational arithmetic, exhaustive finite tuples and the pinned declaration bodies, not a Lean build. Both Gram matrices are symmetric with even diagonal, determinant −4, rank eight modulo two, inverse denominator dividing two, and discriminant quadratic values 0,0,0,1/2. The generating isotropic incidence pairs are {0,7}/{1,8} and {0,8}/{1,7} for both matrices. The first inverse gives (C₈*+nR*+F*)²=2n. The I₄* incidence equation has fifteen solutions in six orbits of sizes 1,2,2,2,4,4; the III* equation has six solutions in four orbits of sizes 1,1,2,2. Every entry is at most two because all weights are positive, so the Lean `Fin 3` bound is exact. All eighteen displayed candidate fibre triples have point-count sum 25. These calculations establish no geometric realization.

All eight dyadic representative products obey the stated twist identity and are nonzero. Valuation parity and the four odd unit residues modulo eight give the eight square classes; x=0 is correctly excluded. The Hensel inequality is strict at two. The model z²−z−1 has unit discriminant five and irreducible separable reduction. The four global twists retain the distinction between Z/2 and μ₂ before and after inverting two.

The source-error corrections already present were checked: the tangent Euler characteristic is −10; the generic order-two quotient is Pic⁰ rather than full Pic; Tsen is used over algebraically closed constants; terminal-vertex arguments are supplemented for cycles and IV; the second lattice exclusion uses the independent opposite-tip branch; the final geometric argument uses the partner theorem in every characteristic. The final two nonexistence targets explicitly retain both additional classification obligations. They are not certified here as completed proofs.

The commit diff contains only the package’s README.md, Suggested.lean, metadata.toml and review.json (2,322 inserted lines). The Lean file uses one `import Mathlib` and one existing Tau Ceti module, no `set_option`, no sorry-valued data, no `lemma` declaration and no forced geometric headline on invented carriers. All retained Lean names occur in the README. No executable classification algorithm is proposed. The review changed only its report and scratch notes; it did not build Lean, modify source files, or post anything.

The requested dependency command produced exit status 1 and exactly:

```text
NOT IN ORDER: EnriquesSurfacesAndIntegralNonexistence (insert it after its last supplier)
depcheck: 8 roadmaps, 53 edges, 1 problem(s)
```

There is no tool-reported UPWARD or CYCLE line. A separate scan of all 360 explicit internal Needs edges found no forward or self reference. Absence from ORDER is not raised as a finding. The explicit supplier/consumer cycle in R05 and the internal proof cycle in R17 are not captured by that output. No ownership or merge-order move was performed during this read-only review; the proposed ownership repairs are R01, R04, R05 and R16–R17.

The following tables distinguish direct arithmetic checks, source-supported statements, dependency defects and unavailable evidence. “None” in the Change column means no additional local defect was found; it does not discharge a missing supplier inherited from an earlier target. README line numbers in the tables refer to packages/EnriquesSurfacesAndIntegralNonexistence/README.md; Lean line numbers refer to packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean.

### Statement-by-statement adversarial pass

| Statement (README location) | Instances tried | Result | Change |
|---|---|---|---|
| §0.1 Geometric Enriques surfaces (line 92) | Empty surface, K3 b₂=22, abelian b₂=6; inseparable base extension | The geometric conjunction rejects the controls; projectivity is a theorem | R02,R05 |
| §0.2 Numerically trivial Picard group of an Enriques surface (line 124) | μ₂ and α₂ over characteristic two versus constant Z/2 | Length two differs from geometric-point cardinality; canonical generator statement matches | R02 |
| §0.3 Enriques numerical and cohomological invariants (line 140) | Classical h¹=h²=0; ordinary/supersingular h¹=h²=1 | Rank ten and b₁=b₃=0 match the source | R02,R05 |
| §0.4 The Enriques numerical lattice (line 152) | Signature (1,9); U basis norms zero and mutual pairing one | Even unimodular identification matches; definite rank-16 uniqueness is not asserted | R02 |
| §1.1 Half-fibre (line 178) | Double additive fibre; reduced support; rational base point; field extension | Multiplicities and factor two retained | None |
| §1.2 (−2)-curve and two-section on an Enriques surface (line 212) | Partner half-fibre square zero; degree-four horizontal curve; conjugate roots | Geometric integrality and exact degree two distinguish the definitions | None |
| §1.3 Curves of canonical type on an Enriques surface induce genus-one fibrations (line 248) | Full fibre versus half-fibre; nonprimitive support | Statement matches the cited Enriques linear-system result; foundational text partly unread | R01; source limit |
| §1.4 Nef primitive isotropic half-fibres (line 260) | D=0; 2F; nef primitive F; effective root | Zero excluded; primitivity excludes 2F; square excludes root | None |
| §1.5 Nef reduction by nodal reflections (line 272) | D=0; nef D; root with square −2 | Zero gives zero; nef fixed; negative square is outside the hypothesis | None |
| §1.6 Existence of genus-one fibrations (line 284) | Characteristic two, quasielliptic case, no initially nef representative | Proof correctly needs reflections and effectivity beyond lattice isometry | R01 |
| §1.7 Double fibres (line 296) | Classical two tame fibres; nonclassical wild fibre | Multiplicity is the coefficient gcd, not reduced-support multiplicity | None |
| §1.8 Integral two-sections (line 308) | Rational bisection versus square-zero partner; extra-special type | Both branches retained; partner-only argument would be insufficient | Source limit |
| §1.9 Classical Enriques criteria (line 320) | Characteristic two classical/ordinary/supersingular; characteristic zero | Existential equivalences match; no unsupported universal converse | None |
| §1.10 Tame double fibres and canonical bundle (line 332) | Two half-fibres exchanged; characteristic not two | ω=F₁−F₂ is compatible with order two; both double fibres retained | None |
| §1.11 Characteristic-two tame half-fibre types (line 344) | Ordinary/supersingular elliptic and multiplicative half-fibres in characteristic two | Tame nontrivial 2-torsion excludes supersingular and semistable reductions | R01 |
| §1.12 Ordinary Enriques surfaces (line 356) | μ₂ versus Z/2 versus α₂ | Dual and trivial ω match; fundamental-group proof is forward | R17 |
| §1.13 Classical Enriques surfaces (line 384) | Z/2 versus μ₂; local cover in characteristic two | Exact order two and Cartier dual match; cover dependency unresolved | R17 |
| §1.14 Supersingular Enriques surfaces (line 412) | α₂ self-duality; μ₂ and Z/2 negative cases | Trivial ω matches; simply-connectedness argument is unowned | R17 |
| §1.15 K3-like canonical covering (line 440) | μ₂/α₂ local cover versus ordinary étale cover | Radicial finite flat cover is distinguished from smooth K3 | R17 |
| §1.16 Cohomology of the K3-like cover (line 470) | Local cover versus smooth ordinary cover | Cohomology (1,0,1) and nonempty singular locus match the source | R02 |
| §1.17 Conductrix and exceptionality (line 482) | C=0; doubled divisor versus its reduction; ordinary type | Empty control refutes the universal replacement Check | R09 |
| §1.18 Special double-fibre characterization of exceptionality (line 516) | Special double IV*, III*, II*; missing bisection | Specialness is retained in the iff; source matches | None |
| §1.19 Nonexceptional quasielliptic restriction (line 528) | Simple and double quasielliptic III*/II* | Source excludes both multiplicities, not only simple fibres | R11 |
| §1.20 Nonexceptional multiple exceptional-type restriction (line 544) | Elliptic versus quasielliptic; double fibre without special bisection | Hypothesis of specialness is necessary in the general genus-one assertion | None |
| §1.21 The extra-special affine E₈ type (line 556) | Entire T₂,₃,₇; extra vertex; cycle | Ten vertices and arm lengths 1,2,6 are correct; subgraph is not enough | None |
| §1.22 Extra-special E₈ surfaces are exceptional (line 586) | Entire graph versus contained exceptional graph | Whole-graph assumption implies the needed contained configuration | None |
| §1.23 Every half-fibre has a partner (Cossec–Dolgachev) (line 598) | Extra-special E₈; characteristics zero, two and three | Extension statement matches MMV; old foundational locator not certified | Source limit |
| §1.24 Partner genus-one fibration (line 610) | Nonexceptional characteristic two; extra-special excluded | F·F′=1 yields full-fibre intersection four | None |
| §1.25 Intersection of distinct genus-one fibrations (line 622) | Same pencil versus distinct pencils; primitive isotropic classes | Same pencil excluded; equality of numerical rays forces same complete pencil | None |
| §1.26 Enriques reducibility theorem (as used) (line 634) | Nonclassical surface; positive-square effective divisor; prescribed Pic⁰ coset | The general reducibility theorem has been omitted | R10 |
| §2.1 Family of Enriques surfaces (line 664) | Empty base; constant family; hypothetical Z-family; P² family | Smoothness criterion is valid; mod-four Check is vacuous | R18 |
| §2.2 Relative Picard representability (line 694) | Projective surface over a field versus arbitrary affine family | Existing field representability is broader than claimed | R03; supplier limit |
| §2.3 Relative numerical invariants (line 706) | Nonreduced base; connected α₂/μ₂ versus étale torsion | Rank-two flat torsion and rank-ten numerical quotient match source | Supplier limit |
| §2.4 Family of canonical coverings (line 718) | Trivial torsor; classical local versus ordinary étale fibre | Canonical edge class is required, not arbitrary torsor data | R02 |
| §2.5 Canonical-cover obstruction (line 748) | Zero obstruction; torsor difference; no section | Exact-sequence direction and obstruction group match | R02 |
| §2.6 Injective pullback criterion for a canonical cover (line 760) | Injective H² pullback without vanishing of H² | Exactness kills the obstruction under the stated injectivity | None |
| §2.7 Section criterion for a canonical cover (line 772) | Section and identity pullback | Pullback has a retraction, giving the preceding injectivity | None |
| §2.8 Étale Picard torsion criterion for a canonical cover (line 784) | Étale Pic^τ; Pic(S)=0; inverse dualizing summand | Multiplication has domain ω⁻²; a chosen trivialization is retained | None |
| §2.9 Twisting of canonical coverings (line 800) | Identity twist; inverse twist; two canonical edge classes | Action on torsor isomorphism classes is free and transitive | None |
| §2.10 Constant and split Picard schemes (line 812) | Split μ₂ and α₂ extensions; nonconstant and nonsplit étale extensions | Iff is correct; Checks never reject numerical constancy or splitness | R19 |
| §2.11 Canonical covers with constant Picard (line 844) | Units 1 and a nonsquare; nonzero Brauer group | Cover existence uses Pic(R)=0, not full Brauer vanishing | None |
| §2.12 Canonical bundle order (line 856) | Field-valued specialization; connected Pic^τ negative case | Constant full Picard forces exact-order-two canonical bundle | None |
| §2.13 Descent of numerical classes (line 868) | Nonregular affine R; full cohomological H² versus Azumaya subgroup | Whole H² condition retained; ambiguity by ω has order two | R02 |
| §2.14 Descent of (-2)-curves (line 884) | Nonsplit conic versus root with descended degree-one class | Unimodularity plus line-bundle descent splits the conic | None |
| §2.15 Descent of genus-one fibrations (line 896) | Twisted P¹ base; Brauer obstruction | Line-bundle descent and complete pencil retain required hypotheses | R01 |
| §2.16 Rational tame double fibres (line 908) | Classical two half-fibres; individually rational versus conjugate fibres | Full Picard descent yields two rational tame fibres | None |
| §2.17 Existence over the residue field (line 920) | Unpointed generic curve; no preselected pencil | Existence follows after geometric pencil and descent | R01 |
| §2.18 Finite-field specialization of Picard descent (line 932) | Finite field; α₂/μ₂ Picard torsion | Brauer vanishing alone does not replace full Picard constancy | None |
| §2.19 Split genus-one fibre graphs over finite fields (line 944) | Nonsplit I₁/I₂ nodes; reducible fibre at nonrational point | Labelled intersection graph can descend without individual node branches | R01 |
| §2.20 No I₀* fibre over F₂ with constant Num (line 956) | Four attachments to P¹(F₂); comparison with F₃ | Four distinct points exceed three; field F₂ is essential | R01 |
| §3.1 Finite-field Enriques point count from Num (line 991) | q=2, r=1 and r=2; r=0; nonconstant Num | Counts 25 and 57; r≥1 and constant Num retained | R05; supplier limit |
| §3.2 Numerical constancy over the integers (line 1003) | Connected étale Z-domain; disconnected finite étale algebra | Minkowski applies to each domain factor, not the entire product | R02 |
| §3.3 Local projectivity of Enriques families (line 1015) | Noetherian local base; no Brauer vanishing; local Z₂ model | Section and doubling lift an ample class; local-base ampleness argument valid | R01,R02 |
| §3.4 Canonical cover over Z₂ before Picard constancy (line 1027) | Hypothetical Pic^τ=μ₂ over Z; residue point at two | Dual group is étale Z/2, not μ₂; section is obtained first | R01 |
| §3.5 Canonical-cover twists supported at two (line 1039) | Units ±1, ±2; square 4; nonunit 5 | Four global Kummer twists; 5 cannot define the required base torsor | None |
| §3.6 Dyadic representatives (line 1071) | All eight exponent triples; x=0; odd residues 1,3,5,7 mod 8 | Nonzero assumption is essential to uniqueness; representatives correct | R13 |
| §3.7 Global twist (line 1103) | All four global twists and all eight products | d·g=5^b·(2^a)² exactly over Q | None |
| §3.8 Dyadic difference class of canonical covers (line 1131) | Equal covers; nontrivial difference; integral versus Q₂ torsors | Difference is unique on Q₂; no integral μ₂ identification used | None |
| §3.9 Removing the ramified part of the difference (line 1143) | All eight classes; residual class 1 or 5 | Exactly one global twist removes e,a; z²−z−1 is étale at two | None |
| §3.10 Étale canonical covers are K3 surfaces (line 1155) | Ordinary characteristic two; classical characteristic not two; local cover excluded | Étale connected cover has the K3 invariants; supplier name drifts | R04,R17 |
| §3.11 Canonical-cover compatibility at two (line 1167) | Ramified local difference; four twists; algebraic space versus scheme | Twisting logic matches; Fontaine text unavailable | R01; source limit |
| §3.12 Splitting of Z/2-extensions of a constant lattice over Spec Z (line 1179) | Rank n=0,1; nontrivial étale torsor over base | Zero rank is harmless; lifting each generator uses H¹=0 | None |
| §3.13 Constant Picard scheme over Z (line 1191) | Both Oort–Tate branches; split numerical quotient alone | Pic^τ=μ₂ must be excluded before full Picard constancy | R01; supplier/source limits |
| §4.1 Jacobian of an Enriques genus-one fibration (line 1219) | Smooth unpointed genus-one curve; regular nonsmooth quasielliptic curve | Regular compactification is retained in the quasielliptic case | R01,R03 |
| §4.2 Rationality of the Enriques Jacobian (line 1249) | Elliptic and quasielliptic Jacobians; imperfect ground field | Geometric rationality matches source; general criterion lacks an owner | R01 |
| §4.3 Matching geometric Kodaira types (line 1261) | Multiple versus simple fibre; geometric versus residue-field Kodaira type | Corrected comparison cited; primary corrected text unread | R01; source limit |
| §4.4 Simple-fibre identification (line 1273) | I_n cycles; IV triangle; I₁ and nonsplit I₂; smooth fibre | Three-point argument avoids assuming a terminal vertex in every graph | R01 |
| §4.5 Nonrational fibres (line 1289) | Closed point with residue degree two | Reducibility would force a rational base point | R01 |
| §4.6 Excluded I₀* (line 1301) | Jacobian I₀*; matching Enriques type | Reduces to four rational attachments, not a new fibre classification | R01 |
| §4.7 Semistable graph descent (line 1313) | Split component graph with nonsplit nodes | Does not claim all semistable fibres are split curves | R01 |
| §4.8 At most one semistable or supersingular rational fibre (line 1325) | Two tame doubles; ordinary versus supersingular smooth fibres | At least two rational fibres are tame; at most one exceptional category remains | None |
| §4.9 Descent of all Mordell–Weil sections (line 1337) | Brauer of F₂(t) versus F̄₂(t); square-zero bisection | Tsen is only used over algebraically closed constants | R01 |
| §4.10 Fibre counts of the Jacobian match the Enriques surface (line 1353) | Additive nonsplit Jacobian graph before constant Picard | Auxiliary count is confused with actual Jacobian count | R14 |
| §4.11 Constant Picard of the Jacobian (line 1376) | Unimodular graph argument; E₇/E₈ terminals; IV triangle | Named criterion is requested from a nonexistent owner | R01,R14 |
| §5.1 Elliptic configurations on constant-Picard Enriques surfaces (line 1404) | Fourteen candidates; additional nonsplit triples; no realization inference | All candidate counts are 25; completeness is an explicit additional input | R01; proof limit |
| §5.2 Quasielliptic component sum (line 1433) | Component ranks 1,2,7,8,9; quasielliptic Mordell–Weil rank zero | Sum eleven follows from the stated rank formula | R01 |
| §5.3 Quasielliptic configurations (line 1445) | Unordered triples from allowed ranks with sum eleven | Exactly four labelled triples; both rank-nine fibre types counted | None |
| §5.4 Forced multiple fibres (line 1468) | Semistable or supersingular competing fibre; multiplicity one/two | Conditional restriction matches source; quasielliptic source is stronger | R11 |
| §5.5 Simple III* preliminary restriction (line 1480) | Simple III*; quasielliptic case; E₄+I₂ versus E₄+E₄ | Only elliptic III*+E₄+E₄ survives the stated inputs | None |
| §5.6 Excluded rational two-section for exceptional-type half-fibres (line 1492) | Missing rational bisection on a double exceptional-type fibre | Local exceptionality criterion applies without completeness | None |
| §5.7 Three additional configuration exclusions (line 1504) | Each of the three extra nonsplit triples | Explicit new proof targets; not certified by the cited older table | Proof limit |
| §5.8 Partner fibration over F₂ (line 1518) | F₂ descent; extra-special E₈ obstruction | Nonexceptionality removes the unique-fibration exception | None |
| §5.9 Elimination of I₈ (line 1530) | I₈ with III; partner completions I₃ and I₇ | Conditional graph proof matches source; full intersections retained | R01 |
| §5.10 Elimination of II* (line 1542) | Multiple II*; partner II* | Intersection-one versus at-least-two contradiction checks | None |
| §5.11 No multiple I₄* (line 1554) | Multiple I₄*; disjoint terminal branch | Forces I₀* and four rational attachments | None |
| §5.12 Elimination of IV* (line 1566) | IV* partner IV* versus III*; four points on a root curve | Both completions and distinct rational-point contradiction retained | None |
| §5.13 Elimination of IV (line 1578) | IV+I₁*+E₅; extra IV+IV*+E₃ branch | Extra branch uses the earlier IV* exclusion; no missing source branch copied | None |
| §5.14 The eight residual configurations (line 1590) | Fourteen elliptic plus four quasielliptic candidates | Eight residual entries are explicitly conditional on both proof obligations | R15; proof limit |
| §5.15 Multiplicity restrictions in the residual table (line 1617) | I₁* versus I₄*; split/nonsplit semistable fibres | Multiplicity flags agree with the surviving table | None |
| §6.1 The two integral Gram models (line 1645) | Both full matrices; zeros, fork and extra edge; mod-two ranks | Symmetric even matrices, determinant −4 and mod-two rank eight | R07,R08 |
| §6.2 First ten-curve lattice discriminant (line 1707) | Four discriminant residues; norms −1 and −2; zero class | Group (Z/2)² and q-values 0,0,0,1/2 verified | R06,R08 |
| §6.3 Second ten-curve lattice discriminant (line 1731) | D₈(−1)⊕U; half-fibre pairing one | Same discriminant type; degree-zero quotient separated from degree part | R06 |
| §6.4 Generic degree-zero Picard quotient (line 1741) | Infinite generic Pic versus order-two Pic⁰; degree of T=2 | Corrected finite quotient and infinite degree summand agree | R01 |
| §6.5 Two-section of square zero or minus two (line 1753) | Squares −2 and zero; nontrivial prescribed generic coset | Both branches retained; general reducibility input missing | R10 |
| §6.6 Incidences of the generating two-section (line 1765) | Fifteen incidence vectors; spinor classes; marked versus unmarked swaps | Four spinor terminal pairs; two marked branches retained | None |
| §6.7 Square-zero two-section calculation (line 1785) | n=0,1,2; R* isotropic; cross terms nonzero | Norm is 2n, not a quadratic expression in n | R08 |
| §6.8 First forbidden ten-curve configuration (line 1809) | Generating root versus square-zero half-fibre; E₂/cuspidal half-fibre | Point budget is two smooth rational points; third intersection contradiction matches | None |
| §6.9 The independent opposite-tip argument (line 1821) | Opposite-tip incidence; partner I₄* versus III* | Uses first exclusion only, before the second exclusion | None |
| §6.10 Second forbidden ten-curve configuration (line 1833) | Intersection length two not two distinct nodes; marked pair {1,8} | Original graph relabelling invokes independent §6.9, avoiding circularity | None |
| §6.11 Six I₄* half-fibre incidence cases (line 1847) | All Fin(3)^9 vectors; terminal and interior hits | 15 solutions, six symmetry orbits; finite bound follows from positive weights | None |
| §6.12 Elimination of I₄* (line 1861) | All six incidence orbits | Proof dependencies use two earlier exclusions and independent branch | None |
| §7.1 Elimination of multiple III* (line 1889) | Multiple III*; I₂* completion | Half-fibre contradiction 1=2 has the correct normalization | None |
| §7.2 Four simple III* half-fibre cases (line 1901) | All Fin(3)^8 vectors; diagram reversal | 6 solutions, four orbits with sizes 2,1,2,1 | None |
| §7.3 Elimination of simple III* (line 1915) | All four simple III* incidence cases | Uses completed no-I₄* and no-multiple-III* results, with full-fibre bound four | None |
| §7.4 Final two-configuration impossibility (line 1927) | Characteristic zero, two, three; both restricted configurations | General partner theorem replaces the source’s characteristic-two-only invocation | None |
| §8.1 Tangent cohomology of Enriques surfaces (line 1953) | Exceptional classical, supersingular and ordinary types | Triples (1,12,1)/(0,10,0) give χ=−10, not +10 | R02 |
| §8.2 Supersingular Enriques surfaces do not lift to W₂ (line 1965) | α₂; trivial versus exact-order-two canonical bundle | Uses group-scheme nonlifting, not DI’s exact-order-two differential criterion | Supplier limit |
| §8.3 Characteristic-two Enriques lifting criterion (line 1977) | Exceptional classical; supersingular; unobstructed ordinary/classical | Three branches retain different hypotheses; DI input is not supplied | R02 |
| §8.4 Miniversal Enriques deformation ring (line 1989) | Unobstructed W[[10]]; regular k[[12]] countermodel | Dimensions correct; W-flatness needs independent characteristic-zero lift | R16 |
| §8.5 Exceptional fibres do not lift modulo four (line 2001) | Algebraic-space lift over Z/4; nilpotent scheme thickening | Scheme comparison and W₂ base extension match the intended obstruction | R02 |
| §8.6 No nonexceptional constant-Picard Enriques surface over F₂ (line 2013) | Constant Num alone versus constant full Picard; conditional classification | Final implication is conditional as stated; no independent proof of new exclusions claimed | R01; proof limit |
| §8.7 No Enriques surface over the integers (line 2025) | Flat proper fp versus merely proper; local schemes at every prime | All required family hypotheses retained; endpoint inherits supplier/proof limitations | R01; source/proof limits |

### Lean declaration and binder audit

| Declaration | Line | Layer | Full binder/instance context | Result |
|---|---|---|---|---|
| dyadicRepresentative | 28 | 3 | No section variables or instances; `def dyadicRepresentative (e a b : Fin 2) : ℚ ` | All finite exponent values checked; nonzero denominators and signs correct |
| globalTwist | 32 | 3 | No section variables or instances; `def globalTwist (e a : Fin 2) : ℚ ` | All finite exponent values checked; nonzero denominators and signs correct |
| dyadicRepresentative_nonzero | 35 | 3 | No section variables or instances; `theorem dyadicRepresentative_nonzero (e a b : Fin 2) :     dyadicRepresentative e a b ≠ 0 ` | All finite exponent values checked; nonzero denominators and signs correct |
| dyadicRepresentative_decomposition | 39 | 3 | No section variables or instances; `theorem dyadicRepresentative_decomposition (e a b : Fin 2) :     dyadicRepresentative e a b = globalTwist e a * 5 ^ b.val ` | All finite exponent values checked; nonzero denominators and signs correct |
| globalTwist_nonzero | 43 | 3 | No section variables or instances; `theorem globalTwist_nonzero (e a : Fin 2) : globalTwist e a ≠ 0 ` | All finite exponent values checked; nonzero denominators and signs correct |
| globalTwist_removes_ramified_part | 46 | 3 | No section variables or instances; `theorem globalTwist_removes_ramified_part (e a b : Fin 2) :     dyadicRepresentative e a b * globalTwist e a =       5 ^ b.val * (2 ^ a.val : ℚ) ^ 2 ` | All finite exponent values checked; nonzero denominators and signs correct |
| dyadic_square_classes | 51 | 3 | No section variables or instances; `theorem dyadic_square_classes (x : ℚ_[2]) (hx : x ≠ 0) :     ∃! t : Fin 2 × Fin 2 × Fin 2,       IsSquare (x / (dyadicRepresentative t.1 t.2.1 t.2.2 : ℚ_[2])) ` | Valuation parity plus residues mod 8; x=0 explicitly excluded; no binder drop |
| example 1 | 56 | 3 | No section variables or instances; `example : dyadicRepresentative 1 0 0 = -1 ∧     dyadicRepresentative 0 1 0 = 2 ∧ dyadicRepresentative 0 0 1 = 5 ` | Values and native pairing substitution verified; proved source inspected, not elaborated |
| example 2 | 61 | 3 | No section variables or instances; `example : dyadicRepresentative 1 1 1 = -10 ` | Values and native pairing substitution verified; proved source inspected, not elaborated |
| example 3 | 64 | 3 | No section variables or instances; `example : globalTwist 0 0 = 1 ∧ globalTwist 1 0 = -1 ` | Values and native pairing substitution verified; proved source inspected, not elaborated |
| example 4 | 67 | 3 | No section variables or instances; `example : globalTwist 0 1 = 2 ∧ globalTwist 1 1 = -2 ` | Values and native pairing substitution verified; proved source inspected, not elaborated |
| firstGram | 76 | 6 | No section variables or instances; `def firstGram : Matrix (Fin 10) (Fin 10) ℤ ` | All 100 entries checked against stated edge/diagonal convention |
| secondGram | 89 | 6 | No section variables or instances; `def secondGram : Matrix (Fin 10) (Fin 10) ℤ ` | All 100 entries checked against stated edge/diagonal convention |
| firstGram_symmetric | 102 | 6 | No section variables or instances; `theorem firstGram_symmetric : firstGram.IsSymm ` | All matrix entries symmetric; proof source inspected |
| secondGram_symmetric | 108 | 6 | No section variables or instances; `theorem secondGram_symmetric : secondGram.IsSymm ` | All matrix entries symmetric; proof source inspected |
| firstLattice | 114 | 6 | No section variables or instances; `noncomputable def firstLattice : IntegralLattice (Fin 10 → ℚ) ` | Real native Gram constructor; no geometric hypothesis or nondegeneracy smuggled in |
| secondLattice | 118 | 6 | No section variables or instances; `noncomputable def secondLattice : IntegralLattice (Fin 10 → ℚ) ` | Real native Gram constructor; no geometric hypothesis or nondegeneracy smuggled in |
| firstGram_determinant | 122 | 6 | No section variables or instances; `theorem firstGram_determinant : firstGram.det = -4 ` | Exact rational elimination gives −4 |
| secondGram_determinant | 125 | 6 | No section variables or instances; `theorem secondGram_determinant : secondGram.det = -4 ` | Exact rational elimination gives −4 |
| firstLattice_even | 128 | 6 | No section variables or instances; `theorem firstLattice_even : firstLattice.IsEven ` | Even diagonal and symmetric cross terms imply every integral norm is even |
| secondLattice_even | 131 | 6 | No section variables or instances; `theorem secondLattice_even : secondLattice.IsEven ` | Even diagonal and symmetric cross terms imply every integral norm is even |
| firstLattice_basis_pairing | 134 | 6 | No section variables or instances; `theorem firstLattice_basis_pairing (i j : Fin 10) :     firstLattice.integralForm       (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))         firstGram firstGram_symmetric i)       (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))         firstGram firstGram_symmetric j) = firstGram i j ` | True specialization of pinned theorem; delete admitted duplicate (R07) |
| secondLattice_basis_pairing | 142 | 6 | No section variables or instances; `theorem secondLattice_basis_pairing (i j : Fin 10) :     secondLattice.integralForm       (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))         secondGram secondGram_symmetric i)       (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))         secondGram secondGram_symmetric j) = secondGram i j ` | True specialization of pinned theorem; delete admitted duplicate (R07) |
| example 5 | 150 | 6 | No section variables or instances; `example : firstGram 8 3 = 1 ∧ firstGram 8 9 = 1 ∧ firstGram 9 9 = 0 ` | Values and native pairing substitution verified; proved source inspected, not elaborated |
| example 6 | 153 | 6 | No section variables or instances; `example : secondGram 8 8 = 0 ∧ secondGram 8 9 = 1 ∧ secondGram 8 3 = 0 ` | Values and native pairing substitution verified; proved source inspected, not elaborated |
| example 7 | 156 | 6 | No section variables or instances; `example : secondGram 5 6 = 1 ∧ secondGram 5 7 = 1 ` | Values and native pairing substitution verified; proved source inspected, not elaborated |
| example 8 | 159 | 6 | No section variables or instances; `example : firstLattice.carrier =     Submodule.span ℤ (Set.range (Pi.basisFun ℚ (Fin 10))) ` | True generic library identity, not discriminating (R08) |
| example 9 | 164 | 6 | No section variables or instances; `example : secondLattice.carrier =     Submodule.span ℤ (Set.range (Pi.basisFun ℚ (Fin 10))) ` | True generic library identity, not discriminating (R08) |
| example 10 | 169 | 6 | No section variables or instances; `example : firstLattice.integralForm     (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))       firstGram firstGram_symmetric 8)     (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))       firstGram firstGram_symmetric 3) = 1 ` | Values and native pairing substitution verified; proved source inspected, not elaborated |
| example 11 | 177 | 6 | No section variables or instances; `example : secondLattice.integralForm     (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))       secondGram secondGram_symmetric 8)     (IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ (Fin 10))       secondGram secondGram_symmetric 3) = 0 ` | Values and native pairing substitution verified; proved source inspected, not elaborated |
| example 12 | 185 | 6 | No section variables or instances; `example (x : firstLattice.dualCarrier) :     firstLattice.discriminantQuadraticMap firstLattice_even (Submodule.Quotient.mk x) =       ((firstLattice.form x x / 2 : ℚ) : AddCircle (1 : ℚ)) ` | True generic library identity, not discriminating (R08) |
| example 13 | 191 | 6 | No section variables or instances; `example : ((-2 / 2 : ℚ) : AddCircle (1 : ℚ)) = 0 ` | True arithmetic, unrelated to retained definitions (R08) |
| example 14 | 196 | 6 | No section variables or instances; `example : ((-1 / 2 : ℚ) : AddCircle (1 : ℚ)) ≠ 0 ` | True arithmetic, unrelated to retained definitions (R08) |
| i4Star_incidence_count | 206 | 6 | No section variables or instances; `theorem i4Star_incidence_count :     (Finset.univ.filter (fun a : Fin 9 → Fin 3 =>       ∑ i : Fin 9, (![1, 1, 2, 2, 2, 2, 2, 1, 1] i : ℕ) * (a i).val = 2)).card =       15 ` | Exhaustive finite enumeration verified; Fin 3 bound is exact |
| iiiStar_incidence_count | 214 | 7 | No section variables or instances; `theorem iiiStar_incidence_count :     (Finset.univ.filter (fun a : Fin 8 → Fin 3 =>       ∑ i : Fin 8, (![1, 2, 2, 3, 4, 3, 2, 1] i : ℕ) * (a i).val = 2)).card =       6 ` | Exhaustive finite enumeration verified; Fin 3 bound is exact |

### Named README interfaces

Every interface is audited at its parent target’s standing hypotheses; the two unbulleted incidence names are included. No bold mathematical target lies outside this inventory and the numbered-target table.

| API | README line | Section/context | Result/change |
|---|---|---|---|
| `IsEnriques` | 102 | §0.1, full standing context in target table | R02,R05 |
| `IsEnriques.baseChange` | 104 | §0.1, full standing context in target table | R02,R05 |
| `IsEnriques.iso` | 106 | §0.1, full standing context in target table | R02,R05 |
| `IsEnriques.projective` | 108 | §0.1, full standing context in target table | R02,R05 |
| `isEnriques_iff` | 110 | §0.1, full standing context in target table | R02,R05 |
| `HalfFibre` | 188 | §1.1, full standing context in target table | None |
| `HalfFibre.baseChange` | 190 | §1.1, full standing context in target table | None |
| `HalfFibre.square` | 192 | §1.1, full standing context in target table | None |
| `HalfFibre.intersection_fibre` | 194 | §1.1, full standing context in target table | None |
| `HalfFibre.ext` | 196 | §1.1, full standing context in target table | None |
| `HalfFibre.twice_eq_fibre` | 198 | §1.1, full standing context in target table | None |
| `IsMinusTwoCurve` | 222 | §1.2, full standing context in target table | None |
| `IsTwoSection` | 224 | §1.2, full standing context in target table | None |
| `twoSection_half_degree` | 226 | §1.2, full standing context in target table | None |
| `minusTwoCurve_baseChange` | 228 | §1.2, full standing context in target table | None |
| `isTwoSection_iff_intersection` | 230 | §1.2, full standing context in target table | None |
| `OrdinaryType` | 366 | §1.12, full standing context in target table | R17 |
| `ordinary_dual` | 368 | §1.12, full standing context in target table | R17 |
| `ordinary_baseChange` | 370 | §1.12, full standing context in target table | R17 |
| `ClassicalType` | 394 | §1.13, full standing context in target table | R17 |
| `classical_dual` | 396 | §1.13, full standing context in target table | R17 |
| `classical_baseChange` | 398 | §1.13, full standing context in target table | R17 |
| `SupersingularType` | 422 | §1.14, full standing context in target table | R17 |
| `supersingular_dual` | 424 | §1.14, full standing context in target table | R17 |
| `supersingular_baseChange` | 426 | §1.14, full standing context in target table | R17 |
| `K3LikeCover` | 450 | §1.15, full standing context in target table | R17 |
| `K3LikeCover.baseChange` | 452 | §1.15, full standing context in target table | R17 |
| `K3LikeCover.degree` | 454 | §1.15, full standing context in target table | R17 |
| `K3LikeCover.radicial` | 456 | §1.15, full standing context in target table | R17 |
| `Conductrix` | 492 | §1.17, full standing context in target table | R09 |
| `conductrix_normalization` | 494 | §1.17, full standing context in target table | R09 |
| `Biconductrix` | 496 | §1.17, full standing context in target table | R09 |
| `IsExceptional` | 498 | §1.17, full standing context in target table | R09 |
| `conductrix_unique` | 500 | §1.17, full standing context in target table | R09 |
| `biconductrix_eq_twice` | 502 | §1.17, full standing context in target table | R09 |
| `IsExtraSpecialE8` | 566 | §1.21, full standing context in target table | None |
| `extraSpecialE8_iso` | 568 | §1.21, full standing context in target table | None |
| `extraSpecialE8_curve_count` | 570 | §1.21, full standing context in target table | None |
| `extraSpecialE8_no_cycle` | 572 | §1.21, full standing context in target table | None |
| `EnriquesFamily` | 674 | §2.1, full standing context in target table | R18 |
| `EnriquesFamily.baseChange` | 676 | §2.1, full standing context in target table | R18 |
| `EnriquesFamily.iso` | 678 | §2.1, full standing context in target table | R18 |
| `EnriquesFamily.smooth` | 680 | §2.1, full standing context in target table | R18 |
| `CanonicalCoverFamily` | 728 | §2.4, full standing context in target table | R02 |
| `canonicalSection_baseChange` | 730 | §2.4, full standing context in target table | R02 |
| `canonicalFamily_baseChange` | 732 | §2.4, full standing context in target table | R02 |
| `canonicalFamily_iso` | 734 | §2.4, full standing context in target table | R02 |
| `ConstantNum` | 822 | §2.10, full standing context in target table | R19 |
| `ConstantPicard` | 824 | §2.10, full standing context in target table | R19 |
| `SplitPicard` | 826 | §2.10, full standing context in target table | R19 |
| `constantPicard_implies` | 828 | §2.10, full standing context in target table | R19 |
| `constantPicard_iff_split_etale_constantNum` | 830 | §2.10, full standing context in target table | R19 |
| `fourGlobalCanonicalTwists` | 1049 | §3.5, full standing context in target table | None |
| `fourGlobalCanonicalTwists_group` | 1051 | §3.5, full standing context in target table | None |
| `fourGlobalCanonicalTwists_exhaustive` | 1053 | §3.5, full standing context in target table | None |
| `fourGlobalCanonicalTwists_canonical` | 1055 | §3.5, full standing context in target table | None |
| `dyadicRepresentative` | 1081 | §3.6, full standing context in target table | R13 |
| `dyadicRepresentative_nonzero` | 1083 | §3.6, full standing context in target table | R13 |
| `dyadicRepresentative_decomposition` | 1085 | §3.6, full standing context in target table | R13 |
| `dyadic_square_classes` | 1087 | §3.6, full standing context in target table | R13 |
| `globalTwist` | 1113 | §3.7, full standing context in target table | None |
| `globalTwist_nonzero` | 1115 | §3.7, full standing context in target table | None |
| `globalTwist_removes_ramified_part` | 1117 | §3.7, full standing context in target table | None |
| `enriquesJacobian` | 1229 | §4.1, full standing context in target table | R01,R03 |
| `enriquesJacobian_zero` | 1231 | §4.1, full standing context in target table | R01,R03 |
| `enriquesJacobian_generic` | 1233 | §4.1, full standing context in target table | R01,R03 |
| `enriquesJacobian_iso` | 1235 | §4.1, full standing context in target table | R01,R03 |
| `firstGram` | 1655 | §6.1, full standing context in target table | R07,R08 |
| `secondGram` | 1657 | §6.1, full standing context in target table | R07,R08 |
| `firstLattice` | 1659 | §6.1, full standing context in target table | R07,R08 |
| `secondLattice` | 1661 | §6.1, full standing context in target table | R07,R08 |
| `firstGram_symmetric` | 1663 | §6.1, full standing context in target table | R07,R08 |
| `secondGram_symmetric` | 1665 | §6.1, full standing context in target table | R07,R08 |
| `firstGram_determinant` | 1667 | §6.1, full standing context in target table | R07,R08 |
| `secondGram_determinant` | 1669 | §6.1, full standing context in target table | R07,R08 |
| `firstLattice_even` | 1671 | §6.1, full standing context in target table | R07,R08 |
| `secondLattice_even` | 1673 | §6.1, full standing context in target table | R07,R08 |
| `firstLattice_basis_pairing` | 1675 | §6.1, full standing context in target table | R07,R08 |
| `secondLattice_basis_pairing` | 1677 | §6.1, full standing context in target table | R07,R08 |
| `i4Star_incidence_count` | 1851 | §6.11, no geometric hypotheses | Arithmetic verified |
| `iiiStar_incidence_count` | 1905 | §7.2, no geometric hypotheses | Arithmetic verified |

### Source locator audit

`SCH23arxiv` is the dated SCH23 manuscript; `DI21arxiv` is the dated DI21 manuscript. `CDL2024` is the later author-hosted book edition used only for the proposed characteristic-zero-lifting repair. A checked locator establishes what the text says, not the truth of a stronger new assertion.

| Source and locator | Extraction witness | Target / result |
|---|---|---|
| SCH23arxiv, §4 definition and numerical invariants | SCH23arxiv line 504 | 0.1–0.4 |
| SCH23arxiv, Proposition 4.1 | SCH23arxiv line 520 | 1.1–1.8 |
| SCH23arxiv, Proposition 4.2 | SCH23arxiv line 526 | 1.9–1.10 |
| SCH23arxiv, Lemma 4.3 | SCH23arxiv line 534 | 1.11 |
| SCH23arxiv, §4 types and local canonical covers | SCH23arxiv line 543 | 1.12–1.17 |
| SCH23arxiv, Proposition 4.4 | SCH23arxiv line 571 | 1.18–1.24 |
| SCH23arxiv, Theorem 5.1 | SCH23arxiv line 594 | 8.7 |
| SCH23arxiv, Theorem 5.2 | SCH23arxiv line 599 | 8.3–8.5 |
| SCH23arxiv, Proposition 5.3 | SCH23arxiv line 607 | 2.2–2.3 |
| SCH23arxiv, Leray row in §5 | SCH23arxiv line 624 | 2.4–2.5 |
| SCH23arxiv, Proposition 5.4 | SCH23arxiv line 629 | 2.6–2.11 |
| SCH23arxiv, Proposition 5.5 | SCH23arxiv line 659 | 3.2–3.13; added four-twist repair not attributed to source |
| SCH23arxiv, Theorem 5.6 | SCH23arxiv line 718 | 2.12–2.18 |
| SCH23arxiv, Theorem 2.1 | SCH23arxiv line 349 | 2.19 |
| SCH23arxiv, Proposition 3.1 | SCH23arxiv line 451 | 2.19 |
| SCH23arxiv, Proposition 3.2 | SCH23arxiv line 468 | 2.20 and singular-fibre point counts |
| SCH23arxiv, Proposition 6.2 | SCH23arxiv line 829 | 4.1–4.2 |
| SCH23arxiv, Corollary 7.2 | SCH23arxiv line 942 | general surface count; source’s F_p notation not copied |
| SCH23arxiv, Corollary 7.3 | SCH23arxiv line 948 | 3.1 |
| SCH23arxiv, Proposition 8.1 | SCH23arxiv line 974 | local elliptic torsor comparison contract |
| SCH23arxiv, Corollary 8.2 | SCH23arxiv line 1026 | finite-field local counts |
| SCH23arxiv, Corollary 8.3 | SCH23arxiv line 1032 | 4.10 smooth multiple reduction |
| SCH23arxiv, Theorem 9.1 | SCH23arxiv line 1076 | 4.11 |
| SCH23arxiv, Proposition 9.2 | SCH23arxiv line 1084 | 4.3–4.4; primary LLR remains unread |
| SCH23arxiv, Proposition 9.3 | SCH23arxiv line 1105 | 4.5–4.9; Tsen correction retained |
| SCH23arxiv, Auxiliary count in §9 | SCH23arxiv line 1144 | 4.10; R14 |
| SCH23arxiv, Theorem 9.4 | SCH23arxiv line 1162 | rational-Jacobian supplier criterion |
| SCH23arxiv, Theorem 10.4 | SCH23arxiv line 1306 | 5.1, eight nonzero-j cases; not fourteen-case completeness |
| SCH23arxiv, Theorem 10.5 | SCH23arxiv line 1397 | 5.1, three zero-j cases |
| SCH23arxiv, Proposition 11.1 | SCH23arxiv line 1451 | 5.2–5.6 |
| SCH23arxiv, Proposition 11.2 | SCH23arxiv line 1517 | 5.9 |
| SCH23arxiv, Proposition 11.3 | SCH23arxiv line 1596 | 5.10–5.13 |
| SCH23arxiv, Proposition 11.4 | SCH23arxiv line 1700 | 5.14–5.15 |
| SCH23arxiv, Proposition 12.1 | SCH23arxiv line 1716 | 6.9, 6.11–6.12 |
| SCH23arxiv, Proposition 12.2 | SCH23arxiv line 1817 | 6.5–6.8 |
| SCH23arxiv, Matrix (14) | SCH23arxiv line 1841 | 6.2, 6.7; entries independently calculated |
| SCH23arxiv, Proposition 12.3 | SCH23arxiv line 1908 | 6.3–6.4, 6.10; Pic⁰ correction retained |
| SCH23arxiv, Matrix (16) | SCH23arxiv line 1933 | 6.3; entries independently calculated |
| SCH23arxiv, Proposition 13.1 | SCH23arxiv line 1981 | 7.1 |
| SCH23arxiv, Proposition 13.2 | SCH23arxiv line 2024 | 7.2–7.3 |
| SCH23arxiv, Proposition 14.1 | SCH23arxiv line 2121 | 7.4; arbitrary-characteristic correction retained |
| SCH23arxiv, Theorem 15.1 | SCH23arxiv line 2210 | 8.6–8.7 |
| ESB21, Theorem 1.1 | ESB21 line 42 | exceptional configurations |
| ESB21, Theorem 1.2 | ESB21 line 54 | exceptional classical vector fields |
| ESB21, Theorem 1.3 | ESB21 line 75 | exceptional examples/classification |
| ESB21, Lemma 2.3 | ESB21 line 146 | 1.17 conductor |
| ESB21, Exceptionality definition in §2 | ESB21 line 188 | 1.17 |
| ESB21, Proposition 2.8 | ESB21 line 203 | 8.1 and conductrix properties |
| ESB21, Proposition 3.16 | ESB21 line 458 | 1.19; stronger source, R11 |
| ESB21, Theorem 4.2 | ESB21 line 479 | 1.18, 1.20 |
| ESB21, Corollary 4.3 | ESB21 line 517 | 1.22 |
| MMV22, Definition 1.1 | MMV22 line 20 | 1.21 entire graph |
| MMV22, Theorem 1.2 | MMV22 line 33 | 1.23 extension statement |
| MMV22, Remark 1.5 | MMV22 line 53 | 1.23 unique-fibration characteristic-two exception |
| MMV22, Lemma 2.1 | MMV22 line 101 | 1.4 |
| MMV22, Lemma 2.2 | MMV22 line 104 | 1.7–1.11 |
| MMV22, Lemma 2.3 | MMV22 line 118 | 1.5 |
| MMV22, Lemma 2.4 | MMV22 line 125 | component-rank bound |
| DI21arxiv, Proposition 3.3 | DI21arxiv line 494 | 8.4 regularity, not automatic flatness |
| DI21arxiv, Corollary 3.4 | DI21arxiv line 511 | 8.4 extra flatness condition |
| DI21arxiv, Proposition 4.2 | DI21arxiv line 677 | 8.2 group obstruction |
| DI21arxiv, Theorem 4.3 | DI21arxiv line 724 | 8.2 Picard flatness/nonlifting |
| DI21arxiv, Theorem 6.1 | DI21arxiv line 854 | 8.3 exact-order-two differential criterion |
| DI21arxiv, Proposition 7.1 | DI21arxiv line 1014 | 8.1 tangent table; χ sign corrected |
| DI21arxiv, Theorem 7.2 | DI21arxiv line 1026 | 8.3–8.4 |
| Lang1983, Theorem 4.1 | Lang1983 line 757 | general reducibility needed by R10 |
| Lang1983, Theorem 4.2 | Lang1983 line 760 | general numerical decomposition needed by R10 |
| Stacks0D24, Lemma 99.11.3 (0D27) | Stacks0D24 line 1251 | Picard descent |
| Stacks0D24, Lemma 99.11.4 (0D28) | Stacks0D24 line 1276 | section splitting |
| Stacks0D24, Proposition 99.11.8 (0D2C) | Stacks0D24 line 1359 | relative Picard representability |
| Stacks0D3D, Lemma 74.13.2 | Stacks0D3D line 1008 | local projectivity via relative ampleness |
| Stacks0EMV, Lemma 68.11.4 (0BBP) | Stacks0EMV line 1251 | étale residue-field neighbourhood |
| Stacks0H74, Lemma 15.13.3 | Stacks0H74 line 1784 | smooth Henselian lifting |
| CDL2024, Theorem 5.11.4 | CDL2024 line 28636 | additional review source for R16 |
| CDL2024, Theorem 5.11.5 | CDL2024 line 28665 | additional review source for R16 |

## Not verifiable

- **Fontaine, preprint 91-02, Theorem 1 and Remark (a).** The author scan timed out through the sources service; its bibliographic search found no readable legal copy. The exact local-model hypothesis and primary Hodge-obstruction text remain unread. This is a source limitation in addition to R01’s ownership defect.
- **Bombieri–Mumford 1977, Theorem 3 and Proposition 11.** The legal author scan timed out and the service’s bibliographic search failed. The formulations quoted by SCH23 were checked, but their foundational proofs and original hypotheses were not certified.
- **Cossec–Dolgachev–Liedtke 2021 draft, Theorem 6.1.10.** MMV22 line 33 confirms the historical cross-reference and lines 307–308 identify its version. The legally fetched April 2024 edition has different numbering and no Chapter 6. That later text does not certify the old locator. The three unresolved texts are consolidated in the job’s `needs-references.toml`; no unavailable work was silently certified.
- **Cossec–Dolgachev 1989, Chapter III/Theorem 3.4.1 and Chapter V inputs.** The service returned `uncertified` for the paywalled book. Its cited locators are retained without a missing-text request, as instructed. A later edition or secondary quotation is not claimed to verify this edition’s pages.
- **Liu–Lorenzini–Raynaud 2004, Theorem 6.6, and the 2018 correction.** Both service fetches returned `uncertified` paywalled citations. SCH23 Proposition 9.2 was read, but it cannot certify the corrected primary theorem’s exact hypotheses. These settled acquisition statuses are not added to the missing-text request.
- **Current supplier artifacts for WeilConjectures, AlgebraicModuliForArithmeticGeometry and FiniteFlatGroupsAndIntegralPadicHodgeTheory.** Their names occur in ORDER, but their current README target definitions were not present in the supplied main/sibling trees. WC.7, the A0 surface-Picard extension and R07.1 could therefore not be checked against the asserted current signatures. This is distinct from the three explicitly nonexistent owners in R01.
- **New classification proof obligations.** SCH23 has eleven elliptic entries, not the requested fourteen-case completeness proof. It does not prove the three extra Enriques exclusions of §5.7. Their counts and conditional downstream use were checked; no independent proof of these additional results was produced in this pass. The latter are explicitly owned local targets, so their absence from SCH23 alone is not a finding.
- **Lean elaboration and complete geometric proofs.** No Lean command was run, as required by the read-only brief. Existing instance declarations and signatures were inspected, and all finite arithmetic assertions were independently checked. This is not a claim that the file was elaborated at the supplied pins or that the admitted geometry was formally proved. Diagram labels and matrices were checked against the line-numbered extraction and stated incidence data; PDF figures were not separately rendered because a renderer was unavailable.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "17d85a447860d7b712e6f7bbade7925f136accfd", "job": "RT-EnriquesSurfacesAndIntegralNonexistence~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
