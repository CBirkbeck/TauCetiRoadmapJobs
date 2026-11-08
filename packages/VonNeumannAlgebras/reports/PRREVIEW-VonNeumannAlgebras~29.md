# Review of VonNeumannAlgebras (pull request #1041 at a3fbf04)

**Verdict:** needs changes

The previous review's five content findings are repaired. The rebase finding is only partly repaired, and is carried as R02.

This round raises one new blocking finding, R01. BanachAlgebras on main now owns three things this roadmap also restates as its own: the regular L² action, the L¹ character correspondence, and Fourier uniqueness. This roadmap's scope still claims that BanachAlgebras consumes V11, and BanachAlgebras no longer does.

The P3 findings cover Checks, one self-contradictory Check, locators, attributions and layer order. All 19 Lean statements, including the five new headlines, survived the adversarial pass.

## Previous findings

- **R01 (branch not rebased): partly repaired.**
  - The README now names Tau Ceti's predicate in the contract and in the Layer 0 *Needs:* lines: "`NonUnitalStarAlgHom.IsNondegenerate` of a representation `π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)`" (`README.md:204–209`, `:344`, `:400`, `:439`).
  - The branch is not rebased, and `Suggested.lean:16–17` writes the predicate's body out "so that the file imports only Mathlib".
  - Carried as R02.
- **R02 (injective ⟺ hyperfinite and II₁/II∞ uniqueness): repaired.** `IsInjective`, `IsHyperfinite`, `IsTypeIIInfinity`, `isInjective_iff_isHyperfinite` and both uniqueness theorems are at `Suggested.lean:239–244` and `:318–364`. They are named at `README.md:3929`, `:4015`, `:4228`, `:4237` and `:4281`. The docstring's Layer 13 bullet is reduced to semidiscreteness and type III (`:57–65`).
- **R03 (Dye and Mackey–Gleason–Bunce–Wright): repaired.** `HasTypeITwoSummand`, `exists_unique_extension_of_finitelyAdditive` and `dye` are at `Suggested.lean:265–301`, with the normality remark at `:53–56` and `:288–290`. They are named at `README.md:3719–3723` and `:3774`.
- **R04 (missing locators in Layer 13): repaired.**
  - `README.md:3927–3928`: "Anantharaman–Popa, Definition 10.2.1 and Proposition 10.2.2, p. 161".
  - `:4281–4288`: Corollary 11.2.4, p. 188, for II∞. For IIIλ, "Haagerup 1989, the result restated on p. 265 and Theorem 6.1, p. 303", with Takesaki III, XVIII.1.1. For III₀, XVIII.2.1–2.9.
  - All three Anantharaman–Popa and Haagerup locators check out (see Sources below).
- **R05 (broken GlobalNumberFields link): repaired.** `README.md:59` now reads `../../Completed/GlobalNumberFields/README.md`, which resolves on main.
- **R06 (Layer 4 Checks): repaired.**
  - New Checks for normality, countable decomposability and faithfulness: `README.md:1176–1195`.
  - The cyclic/separating Checks have moved under V4.Normality: `:1287–1295`.
  - New Checks for V4.0.Fields (`:1365–1380`) and V4.0.Decomposition (`:1478–1489`).
  - I recomputed every value; see the table.

## R01 (P2) — BanachAlgebras owns the regular L² action, the L¹ characters and Fourier uniqueness; this roadmap restates them and claims BanachAlgebras consumes V11

**Location:**
- `README.md:64–68`: "[BanachAlgebras] and CStarAlgebras are consumers of this roadmap (BanachAlgebras A7 consumes V11's closed double-dual embedding; …), so nothing here is taken from either."
- `README.md:4472`, the same consumer claim.
- The restated targets: V8.RegularL2 (`:2138–2163`), V11.UnitizationCharacters (`:3356–3370`) and V11.FourierUniqueness (`:3374–3385`).

**Claim:** On main, BanachAlgebras' scope reads: "Layer 3 owns the Banach character/unitization comparison, including its commutative C*-specialization. Layer 7 owns the faithful regular L² action, L¹ semisimplicity for abelian groups, and Fourier uniqueness for L¹ functions and finite regular complex measures" (`TauCetiRoadmap/BanachAlgebras/README.md:29–33`).

Its targets cover what this roadmap states as its own:
- **A7.RegularL2** (`:1633–1650`) has λ(f), `‖λ(f)‖≤‖f‖₁`, `λ(f*)=λ(f)*`, nondegeneracy and faithfulness. This is V8.RegularL2.
- **§3.1** (`:784–797`) has the restriction bijection between the characters of `Unitization ℂ A` other than augmentation and those of A, and the one-point compactification. This is the first half of V11.UnitizationCharacters.
- **A7.CharactersAndUniqueness** (`:1739–1786`) has the correspondence `χ(L_x f₀)/χ(f₀)`, L¹ uniqueness and uniqueness for finite regular measures. This is the second half of V11.UnitizationCharacters and all of V11.FourierUniqueness.

BanachAlgebras' Downstream consumers (`:2043–2046`) lists "VonNeumannAlgebras V8.RegularL2 and V11.UnitizationCharacters/FourierUniqueness" as consumers of its §§7.3, 3.1 and 7.5. Meanwhile this README says BanachAlgebras consumes V11. Each roadmap names the other as the consumer, so these objects have two owners. The open OperatorAlgebraDynamics revision already takes the character correspondence and L¹ uniqueness from BanachAlgebras A7.

**Witness:** On main (`1d4e7ce`), `grep -n VonNeumann TauCetiRoadmap/BanachAlgebras/README.md` returns only `:2043`, the Downstream consumers line. BanachAlgebras' suppliers (`:69–172`) do not include this roadmap. An earlier revision of BanachAlgebras consumed V11's closed embedding at its `:997`; that citation is gone.

**Repair:**
1. Add a `From TauCetiRoadmap.BanachAlgebras` contract naming A7.IntegratedRepresentations and A7.RegularL2 (§7.3), §3.1's commutative C*-unitization comparison, and A7.CharactersAndUniqueness (§7.5).
2. In V8.RegularL2, consume A7.RegularL2 for the unitary action, λ(f), the norm bound, the involution law, nondegeneracy and faithfulness. Keep only the C*_r(G) closure, the discrete comparison and `λ(G)''=λ(L¹(G))''`.
3. In V11.UnitizationCharacters, consume §3.1 and A7.CharactersAndUniqueness. Keep only the step from characters of C*_r(G) to characters of L¹(G) through λ.
4. Replace V11.FourierUniqueness by a citation of A7.CharactersAndUniqueness. V11.DoubleDualEmbedding stays here, since BanachAlgebras excludes double duals and inversion (`:1764`).
5. Delete the consumer claims at `:64–66` and `:4472`, and list BanachAlgebras among the suppliers in the scope.

Control: BanachAlgebras consumes nothing from this roadmap, so the new supplier edge creates no cycle. On the instance `G=C₂`, `f=(1,i)`, BanachAlgebras' own Check (`:1665`) gives `‖λ(f)‖=√2<2=‖f‖₁`, the same strictness as V8.RegularL2's `√5<3` Check.

## R02 (P3) — The branch is still not rebased on main

**Location:**
- The branch as a whole.
- `README.md:197–217`, the From Tau Ceti contract for GNS, nondegeneracy, `VonNeumannAlgebra.adjoin` and the density theorem.
- `Suggested.lean:16–17` and `:90`, `:102`.

**Claim:** At the branch pin, Tau Ceti `a91d3aaf` has no `Analysis/CStarAlgebra/GNS.lean`, `Representation/Nondegenerate.lean`, `Analysis/VonNeumannAlgebra/Adjoin.lean` or `Density.lean`. Every declaration the contract cites from them is therefore absent at the pin the gate builds against. Git still sees both files as added on both sides, so the pull request cannot merge. Once rebased, the Layer 0 headlines restate the body of a pinned predicate instead of using it.

**Witness:**
- `git merge-tree --write-tree origin/main HEAD` reports `CONFLICT (add/add)` on `README.md` and `Suggested.lean`. The merge base is `350e970c`, and the pins are still Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`.
- At main's Tau Ceti pin `2fd255d9`, `Representation/Nondegenerate.lean:62` defines `IsNondegenerate π := Dense (Submodule.span ℂ (⋃ a, Set.range (π a)) : Set H)`.

**Repair:**
1. Rebase onto main, keeping this head's two files, so that the branch carries main's `lake-manifest.json`.
2. State `exists_faithful_nondegenerate_representation` and `exists_injective_nondegenerate_representation_lp` with `π.IsNondegenerate`, adding `import TauCeti.Analysis.CStarAlgebra.Representation.Nondegenerate`.
3. Delete the "written out" sentences at `Suggested.lean:16–17` and `README.md:339`.

Control: afterwards `git merge-tree` prints only a tree id, and the targeted build passes. All 17 names in the contract exist at `2fd255d9` (`GNS.lean:54, 62, 72, 86, 94, 99, 110`; `Nondegenerate.lean:62, 68, 82`; `Adjoin.lean:38, 49, 54, 59, 65, 74`; `Density.lean:128`).

## R03 (P3) — Several definitions have no Checks of their own

**Location:**
- **Layer 7:** V7.Index defines `[M:N]=dim_N L²(M)` (`README.md:2014–2017`). The Layer 7 Checks (`:2071–2077`) test only `dim_N`.
- **Layer 10:**
  - V10.TracialLp, noncommutative `Lᵖ(M,τ)` (`:2509–2532`), has no Checks.
  - V10.ModularTheory's natural cone and its pairing convention (`:2551–2553`) have no Check.
- **Layer 11:** the measured equivalence relations, the full group `[R]` with its uniform metric, and hyperfinite relations (`:3461–3477`) have no Checks.
- **Layer 12:** `Ct(M)` (`:3577–3587`), V12.J.Enriched (`:3840–3863`) and V12.J.CentralSplitting (`:3865–3877`) have no Checks.
- **Layer 13:**
  - Amenability of measured relations (`:4244–4247`) and the bicentralizer `B(M,φ)` (`:4355–4364`) have no Checks.
  - Semidiscreteness has one (`:4039–4041`).

**Claim:** Every definition needs at least three discriminating Checks. These have fewer, so a wrong normalisation would pass. Examples are a natural cone built with `Δ^(1/2)`, or an index computed over ℂ² instead of `L²(M₂)`.

**Witness:** `grep -n '^\*\*Checks' README.md` lists 38 blocks. None lies between `:2014` and `:2070`, between `:2509` and `:2605`, between `:3577` and `:3622`, between `:3840` and `:3889`, or between `:4244` and `:4452`.

**Repair:** add Checks such as these (values computed here):
- **`[M:N]`:**
  - `[M:M]=1`.
  - `[M⊗̄M₂:M⊗1]=4`, not 2.
  - For an outer period-2 automorphism σ of R, `[R:R^σ]=2`.
- **`Lᵖ`:**
  - On `L∞[0,1]` with `τ=∫`, `t^(−1/3)` lies in L² (`∫t^(−2/3)=3`) but not in L³ (`∫t^(−1)=∞`), and not in M.
  - On `M₂(ℂ)` with `tr/2`, `‖e₁₁‖_p=2^(−1/p)`, whereas the unnormalised trace gives 1.
- **Natural cone:**
  - For `φ=Tr(h·)`, `h=diag(2/3,1/3)` on `M₂(ℂ)`, `Ω=h^(1/2)` and `Δ^(1/4)(xΩ)=h^(1/4)xh^(1/4)`, so P is the positive matrices.
  - For the all-ones matrix x≥0, `xΩ=[[√(2/3),√(1/3)],[√(2/3),√(1/3)]]` is not self-adjoint, so the exponent 1/4 matters.
  - A "real pairing" convention would give all self-adjoint matrices.
- **`Ct`:** the two-sided tensor shift on `R=⊗_ℤM₂` sends `u_n` to `u_(n+1)` with `‖u_(n+1)−u_n‖₂=√2`, so it is not centrally trivial. Every `Ad(u)` is centrally trivial.
- **Bicentralizer:**
  - For a tracial φ, `B(M,φ)=Z(M)` (take constant sequences).
  - For `φ=Tr(h·)` on `M₂(ℂ)` with h non-scalar, `B(M,φ)` is the diagonal algebra, not ℂ. Triviality is therefore a type III₁ theorem, not a definition.
- **Amenable relations:** the trivial and the finite relations are amenable. The orbit relation of the Bernoulli shift of F₂ is not, since its regular algebra contains `L(F₂)` with an expectation.

## R04 (P3) — A V12.J.Maps Check says unitality is a hypothesis of Dye's theorem, contradicting V12.J.Dye and `dye`

**Location:** `README.md:3679–3680`: "The zero map preserves squares, adjoints and linearity but not the unit, so unitality is a separate hypothesis in Dye's theorem and in the normal-map API."

**Claim:** Dye's theorem as stated here has no unitality hypothesis. Its Φ is a bijection, and unitality is a conclusion.

**Witness:**
- `README.md:3775–3776`: "unitality and normality are automatic there, since α(1)=1".
- `Suggested.lean:289`: "`Φ` is unital because `α` preserves the top projection".
- Directly: for a surjective Jordan map, `Φ(x)=Φ(x∘1)=Φ(x)∘Φ(1)`. Taking `Φ(x)=1` gives `Φ(1)=1`. The zero map is not surjective onto `N≠0`.

**Repair:** end the Check with: "so unitality is a separate clause of the normal-map API for maps that are not surjective; for Dye's bijective Φ it follows from α(1)=1."

## R05 (P3) — Three locators do not support the claim they are attached to

**Location and witness:**
1. **`README.md:115–118`:** "a von Neumann algebra has separable predual exactly when it has a faithful normal representation on a separable Hilbert space (Anantharaman–Popa, Definition 2.6.6, p. 48)". anantharaman-popa line 2276 only *defines* "separable" that way. The phrase "separable predual" occurs nowhere in the text (grep: 0 hits).
2. **`README.md:4228–4230` and `Suggested.lean:338–339`:** `isInjective_iff_isHyperfinite` for all algebras with separable predual is located only by special cases. Theorem 11.1.3 (anantharaman-popa line 7702, p. 173) is the forward direction for finite algebras, in the finite-set L² form of Definition 11.1.1, not the sequential form.
3. **`README.md:4238–4240`:** "every infinite-dimensional factor subalgebra of R is isomorphic to R" has no locator. anantharaman-popa line 8358 (Remark 11.2.3, p. 188) states it.

**Repair:**
1. Say that the Lean statements use Anantharaman–Popa's separable von Neumann algebras (Definition 2.6.6). Keep the equivalence with separable predual only as a V4.Core target with a source.
2. Cite Takesaki III, XVI.1.9 and 1.22–1.23 (already at `README.md:4550–4551`) at the general claim and in the docstring. Say there that 11.1.3 is the forward direction for finite algebras.
3. Add Remark 11.2.3, p. 188.

## R06 (P3) — Three attributions do not match the pinned libraries or the cited roadmap's name

**Location and witness:**
1. **`README.md:2389`:** "Mathlib's weighted Bergman spaces (built here on `MeasureTheory.Lp` …)". The pinned Mathlib has no Bergman space; its only "Bergman" is an author's name in `CategoryTheory/Abelian/Refinements.lean:33`.
2. **`README.md:2742`:** lists `IsHeckeTriple` and "the ring `𝕋 ⊤ H ℂ`" among "Tau Ceti's Hecke-ring modules". Both are Mathlib's: `Mathlib/NumberTheory/HeckeRing/Defs.lean:75` (`class IsHeckeTriple`) and `:193` (`notation "𝕋" => HeckeRing`), as `README.md:2667` itself says. Neither appears in the From Mathlib contract (`:126–174`).
3. **`README.md:3414`:** "Dynamics D4". The roadmap is OperatorAlgebraDynamics, whose `README.md:50` reads "D4 uses V11's harmonic-analysis layer".

**Repair:**
1. Write "weighted Bergman spaces, built here on …".
2. Move `IsHeckeTriple` and `HeckeRing`/`𝕋` to the From Mathlib contract and to the Mathlib part of V10.Hecke's *Needs:* line.
3. Write "OperatorAlgebraDynamics D4".

## R07 (P3) — Four targets sit in a layer before their prerequisites, and three Dependencies lists omit layers

**Location and witness:**
1. **Layer 2 depends on Layer 4.** V2.AbelianClassification (`README.md:860`), V2.AbelianLocalizable (`:908`) and V2.AbelianRepresentationMultiplicity (`:945`) need V4.0.Multiplication or V4.Normality (`:903–906`, `:941`, `:967`). Layer 4 needs Layer 2 (`:1422`, V2.BorelCalculus). So Layer 2's Dependencies (`:998–1000`) cite V4 while Layer 4's (`:1500`) read "Layers 0–3": a coarse 2⇄4 cycle.
2. **Layer 7 depends on Layer 8.** V7.GroupApplications (`:2054`) needs V8.SubgroupCosets (`:2067`), and V8.SubgroupCosets needs V7.AmplificationTrace (`:2122`): a coarse 7⇄8 cycle.
3. **Incomplete Dependencies lists.**
   - Layer 7's list "Layers 2, 4 and 6" (`:2086`) omits Layer 3 (`:2012`), Layer 5 (`:1986`) and Layer 8 (`:2067`).
   - Layer 12's list (`:3900`) omits Layer 8 (`:3643`).
   - Layer 13's list "Layers 4–12" (`:4463`) omits Layers 0–3 (`:3934`).

**Repair:**
1. Move the three V2 applications to the end of Layer 4, after V4.0.Multiplication, renaming them V4.*.
2. Move V7.GroupApplications into Layer 8, after V8.SubgroupCosets.
3. Update `:277–281`, `:960`, `:998–1000`, `:2121` and the three Dependencies lists.

No other roadmap cites these four ids (`roadmaps grep 'V2\.Abelian|V7\.GroupApplications'` finds none outside this folder), so no old → new table is needed.

## Verified sound

**Gate.**
- My run at a3fbf04: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.

**Dependency check** (verbatim, exit 0):

```text
depcheck: 236 roadmaps, 2419 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The suppliers are OperatorTheory (and its PolarDecomposition and OperatorIdeals), BanachSpaceTheory, AmenableGroups, OptimalTransport, the RepresentationTheory sub-roadmaps, and Completed GlobalNumberFields, ArithmeticDirichletSeries and OneParameterSemigroups. All are on main.

**Lean.**
- `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` exits 0 with exactly 19 `declaration uses sorry` warnings. They are at `:87, 98, 109, 118, 129, 141, 150, 165, 185, 214, 222, 229, 251, 275, 291, 309, 340, 347, 357`.
- **`#check @name` comparison:** a scratch copy with `#check @name` for all 31 declarations (19 theorems, 12 definitions) elaborated.
  - Every H-declaration keeps `[NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`.
  - `isInjective_iff_isHyperfinite` and both uniqueness theorems keep `[SeparableSpace H]`, and the latter also `[SeparableSpace K]`.
  - `dye` keeps `¬HasTypeITwoSummand M` and places no hypothesis on N.
  - `tomiyama` keeps `[PartialOrder A] [StarOrderedRing A]`.
  - Nothing changed, and each type matches its README statement.
- **One-tactic probe:** with each `sorry` replaced by `first | rfl | infer_instance | simp | aesop | trivial`, all 19 sites fail (`:91 … :364`), so none of them is padding.

**Library declarations opened.**
- At the branch pins:
  - Mathlib `CompletelyPositiveMap` (`Analysis/CStarAlgebra/CompletelyPositiveMap.lean:50`) and `WStarAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean:45`).
  - `VonNeumannAlgebra` (`:67`), `ErgodicSMul` (`Dynamics/Ergodic/Action/Basic.lean:43`) and `IsStarNormal.commute_star_right` (`Analysis/CStarAlgebra/Fuglede.lean:177`).
  - `IsHeckeTriple` and `𝕋` (`NumberTheory/HeckeRing/Defs.lean:75`, `:193`).
  - These are among 65 Mathlib names from the From Mathlib contract and the *Needs:* lines that I checked by a declaration grep at the pin. All 65 were found.
- At the branch Tau Ceti pin:
  - `ContinuousOn.aestronglyMeasurable_of_measure_ne_top` (`InnerRegular.lean:51`) and `ContRepresentation.integratedOperatorL1` (`Integrated/Basic.lean:141`).
  - `exists_pontryaginMeasureTransform_eq_inner` (`StronglyContinuous.lean:283`) and `FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular` (`Uniqueness.lean:263`).
  - `ext_of_forall_mem_subalgebra_integral_eq_of_innerRegular` (`FiniteMeasureExt.lean:263`) and `PontryaginDual.continuous_coe_eval_const` (`DualEval.lean:29`).
  - `HeckeAntiInvolution.ofAmbient` and `mul_comm_of_antiInvolution` (`Commutativity.lean:135`, `:459`).
  - `wienerIkehara` (`SharpCutoff.lean:301`), `higherPrimePowerTheta_isBigO` (`HigherPrimePowers.lean:316`), `primeCount_asymptotic_of_primeTheta` (`Transfer.lean:140`) and `logIntegral_isEquivalent_div_log` (`LogIntegral.lean:272`).
- The four modules missing at the branch pin are listed in R02.
- Neither pinned library defines a factor, Murray–von Neumann equivalence, a tracial state, injectivity or hyperfiniteness predicate. The eight new or kept predicates duplicate nothing there, and no other roadmap's `Suggested.lean` declares them (`roadmaps grep`).

**Cross-roadmap citations resolved on main `1d4e7ce`:**
- BanachSpaceTheory B1 `:54`, B2 `:135`, B4 `:239`.
- AmenableGroups Layers 5–7 (`:289`, `:391`, `:415`), whose anchors match their headings.
- OptimalTransport Layers 2 (`:444`) and 8 (`:974`).
- PolarDecomposition PD-A36–A45 and PD-B23–B36 (8 hits); OperatorIdeals OI-B23 and OI-B29–B41.
- RepresentationTheory: CompactGroups (Peter–Weyl), SemisimpleAlgebras (double centralizer) and LieHighestWeight (Clebsch–Gordan `:348`).
- Completed ArithmeticDirichletSeries Layer 9 (`:337`), Completed GlobalNumberFields Layer 4 (`:418`) and Completed OneParameterSemigroups.
- Consumers confirmed:
  - SelfAdjointSpectralTheory SA-B85 (`:255`).
  - OperatorAlgebraDynamics V0–V4 and D4 (`:46`, `:50`).
  - TypeAHeckeAlgebras H3 (`:366`).
  - CStarAlgebras V0, V12.J, V13a and V13b (`:46–53`).
  - FactorRigidity (`:39`, `:87`).
  - QuantumFoundations, open, consumes V12.J by id and restates nothing.
  - NoncommutativeIntegration, open, consumes V10/V11.
- The BanachAlgebras claim fails (R01).

**Sources: the seeded sample 13.1 and 13.2.** Printed page = pdf page − 6 for anantharaman-popa, and = pdf page for hiai-lectures.
- **Hiai, Theorem 6.5** (hiai-lectures line 2666, pp. 55–56): for a C*-algebra A and C*-subalgebra B, a norm-one projection satisfies (ii) bimodularity and (v) complete positivity of Theorem 6.4 (lines 2596, 2602). This matches `tomiyama`'s three conclusions; positivity is part of (v).
- **Anantharaman–Popa, Chapter 10:**
  - Definition 10.2.1 and Proposition 10.2.2(iii), "for any B(H) containing M": line 7191, p. 161.
  - Proposition 10.2.5, hypertrace: line 7269, p. 163.
  - Theorem 10.2.8, Powers–Størmer `‖x−y‖²₂≤‖Tr(x²·)−Tr(y²·)‖`, which is `README.md:4083` with `a=x²`: line 7325, p. 164.
  - Theorem 10.2.9(2), with `‖T‖₂=1`, (10.1) and (10.2) exactly as at `:4084–4087`: line 7333, p. 164.
  - Theorem 10.3.1, the projection form (10.3) with no trace clause: line 7413, p. 166. The remark at line 7405 drops (10.2) only for II₁ factors, which is the Check at `:4124–4128`.
  - Theorem 10.3.4: line 7532, p. 168.
- **Anantharaman–Popa, Chapter 11:**
  - Definitions 11.1.1–11.1.2: lines 7685, 7697, p. 173.
  - Theorem 11.1.3: line 7702 (see R05).
  - Theorem 11.2.2(3), increasing finite-dimensional `(∪Qₙ)''=M` with the same unit: line 8298, p. 186. This is `IsHyperfinite`.
  - The AFD definition for separable factors (line 8371) and Corollary 11.2.4 (line 8376), both p. 188. The corollary's proof uses only amenability after its first line, so it gives injective II∞ ≅ `R⊗̄B(ℓ²)`.
- **Haagerup 1989:** printed p. 265 is the first page of the article (haagerup-1989 lines 35–37, Connes's uniqueness recalled). Theorem 6.1 is line 1177, p. 303, with `σ^φ_(t₀)=id`, as at `:4285–4286`.
- **Haagerup 2016:** Theorems 1.1–1.2 are lines 49 and 52, p. 2.
- **Bunce–Wright 1992** (Bull. AMS 26, pp. 288–293):
  - Conditions (a)–(b): bunce-wright-1992 lines 38–39, p. 288.
  - Theorems A and B (lines 53, 57, p. 289) have the hypothesis "no direct summand of Type I₂", which is `¬HasTypeITwoSummand`. Uniqueness comes from Theorem A with X=ℂ.
  - `‖β‖≤4 sup|β(p)|` in the proof of Lemma 1.1: line 86, p. 289.
- **Hamhalter 2014:** Dye's theorem with uniqueness, "no Type I₂ direct summand", hamhalter-2014 lines 85–91, pp. 2–3. Theorem 4.3, an orthoisomorphism of AW*-projection lattices extending to a Jordan *-isomorphism with no normality, line 627, p. 14.
- **Jones:** Theorem 16.3.1 with constant 14 (jones-vna line 3395) and Theorem 8.1.15 (line 1672).

**Adversarial pass.** All rows were computed this round.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `exists_faithful_nondegenerate_representation` | A=0; A=ℂ²; control `π(z)=diag(z,0)` | K=0, π=0, span {0} dense in 0; `diag(a,b)` spans ℂ²; control injective but span `ℂ×0` not dense | holds |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | `z↦z·1` on ℓ²; for A=0 only π=0, span {0}≠ℓ², so `[Nontrivial A]` is needed | holds |
| `double_commutant_iff_isClosed_image_ofCLM` | ℂI; finite rank + scalars on ℓ²; H=0 | `ℂI''=ℂI` closed; `A''=B(ℓ²)≠A` and A not WOT closed; H=0 both true | holds |
| `closure_unitBall_eq_unitBall_double_centralizer` | ℂI; finite rank + scalars; q = even projection | `{|c|≤1}I` both sides; `qPₙ→q` SOT while `‖q−(c+F)‖≥1/2` | holds |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ; ℓ², C=½ | `{0,1}` excludes ½; block `[[½,½],[½,½]]` has eigenvalues {1,0} and compression ½ | holds |
| `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv` | N=ℂ; Mₙ; H=0; M=ℂ² | X=ℂ with `z↦z̄`; `conj S₁(ℂⁿ)`; X=0; `pr₁,pr₂` give diag on ℂ² | holds |
| `isCyclic_iff_isSeparating_commutant` | M₂; diagonal; H=0 | e₁ cyclic for M₂ and separating for ℂI; `(1,1)` both, `(1,0)` neither (`diag(0,1)(1,0)=0`); H=0 both | holds |
| `equivalent_of_subequivalent` | B(ℓ²), p=1, `q=1−e₀e₀*` | `S*S=1`, `SS*=q`, `q≼1` via v=q, p∼q with p≠q | holds |
| `tracialState_unique` | M₂; ℂ⊕ℂ; B(ℓ²) | `x₁₁`: `e₁₂e₂₁↦1`, `e₂₁e₁₂↦0`; `t·pr₁+(1−t)pr₂` all tracial (factor needed); B(ℓ²): `τ(1)=2τ(1)` | holds |
| `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | R; B(ℓ²); ℂ⊕ℂ | `qᵢ=vᵢ*pvᵢ∈I` gives `1∈I`; compacts excluded by `IsFinite`; ideal `ℂ⊕0` excluded by `IsFactor` | holds |
| `IsTypeIIInfinity` | `R⊗̄B(ℓ²)`; B(ℓ²); R; `R_λ`; H=0 | p=1⊗e₀₀ finite, 1⊗S a non-unitary isometry, no atom: true. e₀₀ minimal: false. `IsFinite`: false. No finite p≠0: false. `1≠0` fails | holds |
| `ergodicSMul_dense_subgroup` | ℚ⊂ℝ; ℤ⊂ℝ | ℚ ergodic; `⋃[n,n+½)` ℤ-invariant with neither null nor conull complement, so density is needed; `G=⋃γK` σ-compact | holds |
| `HasTypeITwoSummand` | M₂; M₂⊕M₃; M₃; M₄; ℂ²; B(ℓ²); R | true (e₁₁,e₂₂); true (z=1⊕0); false (`3=2·rank e`); false (`eM₄e≅M₂`); false (e∼f ⇒ e=f ⇒ e=0); false (z=1 forces dim H=2); false | holds |
| `exists_unique_extension_of_finitelyAdditive` | H=ℂ; M₃, `μ=Tr(diag(1,−1,0)·)`; M₂ Bloch; H=0 | μ(0)=0, `φ(z)=zμ(1)`; `|μ|≤1`, ‖φ‖=2≤4; at (1/√2,0,1/√2) f=0.75 vs affine fit 0.677, so M₂ excluded; φ=0 | holds |
| `dye` | ℂ² swap; M₃ transpose; M₂ Bloch map; H=0 | Φ(a,b)=(b,a); `(e₁₂e₂₁)ᵀ=e₁₁≠e₂₂=e₁₂ᵀe₂₁ᵀ` (Jordan only); image inner product −3/5, not orthogonal, no extension (M₂ excluded); P={0} ⇒ N=0 | holds |
| `tomiyama`, 13.1 Checks | diagonal E on M₂; `e₁₁·e₁₁`; transpose; ρ | `axb=[[10,28],[45,84]]`, `E=diag(10,84)=aE(x)b`; ‖P‖=1 with P(1)=e₁₁; flip eigenvalue −1; `det ρ=¼−|c|²` | holds |
| `IsInjective` | H=0; B(ℓ²); ℓ∞; L(F₂) | P=0, ‖P‖=0≤1; P=id; diagonal expectation; `W(a)⊔aW(a⁻¹)` gives mass 2>1, so no hypertrace | holds |
| `IsHyperfinite` | R; B(ℓ²); L∞[0,1]; ℓ∞(I), `|I|>𝔠` | `M_(2ⁿ)`; `Mₙ⊕ℂ`; dyadic `ℓ∞(2ⁿ)`; W*(a) has ≤𝔠 projections against `2^|I|`, so separability is needed | holds |
| `isInjective_iff_isHyperfinite` | H=0; ℂ1 on ℓ²; L(F₂) | both true (P=0; A=⊤); `P(x)=⟨e₀,xe₀⟩1`, `ℂ1''=ℂ1`; both false | holds |
| II₁ / II∞ uniqueness | R vs L(S_∞); M₂; `R⊗̄B(ℓ²)`; B(ℓ²) | both injective II₁ ≅ R; M₂ fails no-atom; II∞ case via Cor. 11.2.4; B(ℓ²) fails no-atom | holds |
| V13b.SpatialNorm Checks | u; 1⊗1; (0,ℂ,id); C(X); ℂ² on ℂ³ | `u*u` rank 2, ‖u‖=1 vs 2; 1 vs `√2·√2`; 0 vs 1; `sup|f(x)−f(y)|=1`; both projections of norm 1 | holds |
| Følner Checks `:4115–4134` | ℂ², `τ=(1/3,2/3)`, u=(1,−1), ε=1/10 | `8p(1−p)≤1/100` ⇒ p≤0.0012516 or ≥0.9987484; P=1 gives ½; `T=diag(3^(−½),(⅔)^½)`: `Tr T²=1`, `Tr(xT²)=a/3+2b/3`; e₁₁ gives 1≠1/3 | holds |
| V12.J.Frame / Scalar / Bloch Checks | `|v₁|²−½`; `2|v₁|²+|v₂|²`; T=(aI+b·σ)/2 | weight −½, `diag(½,−½,−½)` trace −½; weight 3; a=1, b₃=½ ⇒ `½+n₃/4=0.677≠0.75`; `(1+2/√5)/2=0.947` vs 0.854 | holds |
| V12.J.Maps Check `:3679` | zero map; surjective Φ | zero map not surjective; `Φ(1)=1` from `Φ(x)∘Φ(1)=Φ(x)` | Check gloss false (R04) |
| Layer 4 Checks `:1176–1195`, `:1365–1380` | ultrafilter; `2^(−n−1)`; ℓ²(I); μ=2ν; ramp | `1_{0..N}↦0`, `φ(1)=1`; `1−2^(−N−1)`; `Σω(pᵢ)=1` ⇒ countably many nonzero; `∫|√2f|²dν=∫|f|²dμ`; `(M_tT−TM_t)f=½f(s−½)` | holds |
| Layer 12 central-sequence Checks | `R⊕ℂ`, `τ=(¼,¾)` | `‖(uₙ,0)−(λ,z)‖₂²=¼(1+|λ|²)+¾|z|²≥¼`; `|τ(v,z)|≥¾−¼=½` | holds |
| V8.RegularL2 vs BanachAlgebras A7 | ℤ, `f=δ₋₁+iδ₀+δ₁`; C₂, f=(1,i) | `‖λ(f)‖=√5<3`; BanachAlgebras `:1665` `√2<2`: same object in both roadmaps | duplicated (R01) |
| Separability convention `:115` | Definition 2.6.6 | anantharaman-popa line 2276 defines separable; 0 hits for "separable predual" | locator gap (R05) |

## Not verifiable

- **Arveson 1969, Theorem 1.2.3; Haagerup 1985; Haagerup 1987; Connes–Størmer 1978:** settled as uncertified, with no legal full text. Connes–Størmer's statement was checked through Haagerup 2016, Theorem 2.4.
- **Tomiyama 1957, Theorem 1:** the cached file recorded as certified for `tomiyama-1957` is a Project Euclid "Request unsuccessful" page, not the paper. Its hash certifies an error page.
- **Takesaki I–III, Runde, Sakai, Reed–Simon, Rudin, Goodman–de la Harpe–Jones:** paywalled books, not in the manifest. This covers Takesaki I IV.4.9; Takesaki III XV.3, XVI.1.9, XVII.3.12 and XVIII; Runde 6.4.14 and 6.4.24–6.4.25; and Goodman–de la Harpe–Jones §3.3.
- **Connes–Woods 1985 §7; Connes, *Periodic automorphisms*:** the first is paywalled; the second is an image-only scan, and OCR is not installed on this worker.
- **Ownership:** open pull requests outside the index of 2026-11-08T13:06:57Z were not searched.

## Source issues

- **Gap** in hiai-lectures at Theorem 6.5, pp. 55–56: the source states Tomiyama's theorem for any C*-algebra and C*-subalgebra but proves only a unital von Neumann subalgebra of a von Neumann algebra; it should give the bidual reduction for the general case; affects the proof.
- **Gap** in anantharaman-popa at Theorem 11.1.3, p. 173: the source proves the theorem only for separable algebras with a faithful normal trace, leaving the general finite case to an exercise; it should prove or reference the general reduction; affects the proof.
- **Misprint** in anantharaman-popa at Definition 10.2.1, p. 161: the source writes "a von Neumann M" without "algebra"; it should read "a von Neumann algebra M"; affects nothing.
- **Misprint** in hamhalter-2014 at the statement of Dye's theorem, p. 2: the source writes "Let M ad N be von Neumann algebras"; it should read "M and N"; affects nothing.
