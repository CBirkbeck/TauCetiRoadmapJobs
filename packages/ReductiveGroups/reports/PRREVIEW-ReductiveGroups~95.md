# Review of ReductiveGroups (pull request #1797 at ad233ac)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ReductiveGroups/README.md` (4543 lines) and `TauCetiRoadmap/ReductiveGroups/Suggested.lean` (309 lines). The folder text is unchanged since df89c5d. Seven findings, four of them blocking (P2). No finding is a re-raise: no repair report marks anything "not actionable in this package".

## R01 (P2) — Lang's theorem has two owners on main once this merges (ReductiveGroupsPartII)

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md:29–30`: "ReductiveGroupsPartII RG2.3.7 states Lang's theorem again under its own name; it is a consumer of Layer 7a, not a second supplier of it." The headline is `StructureAcceptance.lang_surjective` (`Suggested.lean:217`).

**Claim.** On main, this README consumed Lang's theorem from ReductiveGroupsPartII RG2.3.7. This head moves ownership down to Layer 7a. That is the right direction, because PartII consumes this roadmap (its *Needs:* cite ReductiveGroups layers 0–7). But PartII is not revised, so after the merge two roadmaps on main each claim the theorem and each state it in Lean.

**Witness.** Main `TauCetiRoadmap/ReductiveGroupsPartII/README.md:61–62`: "RG2.3 is the single owner in Tau Ceti of Lang's theorem for connected smooth groups over finite fields". Its `Suggested.lean:212` declares `Lang.lang_surjective`, which is our statement at K = `AlgebraicClosure F`. RG2.3.7's *Needs:* (line 5214) cites only ReductiveGroups layer 3.

**Repair.** Add `TauCetiRoadmap/ReductiveGroupsPartII/` to this pull request, since the pull request is the one moving the ownership:
- In PartII's Scope (lines 61–64), replace the single-owner sentence for finite-field Lang by a citation of ReductiveGroups Layer 7a. Keep its own inverse-limit form `lang_proAlgebraic_surjective`.
- In RG2.3.7(a), cite `StructureAcceptance.lang_surjective` and add Layer 7a to *Needs:*.
- Delete `Lang.lang_surjective` from PartII's `Suggested.lean`.

Nothing is lost: PartII's hypotheses (smooth, geometrically connected, σ the |F|-power map on `AlgebraicClosure F`) are an instance of ours.

## R02 (P2) — three open roadmaps still own what this README says they consume

**Location.** `README.md:31–35`: "IntegralHeckeAndGaloisDeterminants §0.7 states the rational cohomology and induction of Layer 1.1, and ComplexComparisonPartII C-1.1 states the complex-point comparisons … each is a consumer". Also "AdelicAlgebraicGroups AA.3.1 … is a consumer of Layer 6A". The ownership claims are at lines 15–23.

**Claim.** At their current heads none of the three is a consumer. Each plans the same object itself, so Layer 1.1, Layer 3A.5 and Layer 6A each have a second owner. On main, this README consumed IntegralHeckeAndGaloisDeterminants §0.7; this head reverses that edge without the other side following.

**Witness.**
- IntegralHeckeAndGaloisDeterminants (#1689, head 0609cf2), README line 38: "owns … rational cohomology of a flat affine group scheme". Its §0.7, lines 1145–1218, builds the Hochschild complex and cotensor induction.
- ComplexComparisonPartII (#848, head db79c46), lines 1075–1079: "owns … `complexSchemeAnalytification` … and all the comparisons above"; "forgetting the analytic ring sheaf gives the classical topological carrier". `SchemePointTopology` occurs 0 times in it. It cites ReductiveGroups only for smooth affine groups (lines 792–795).
- AdelicAlgebraicGroups (#792, head 989a3a7), lines 2404–2413: "For char F = 0 and geometrically connected P, prove that a Levi decomposition exists ([Borel], §1.13)". No ReductiveGroups citation.

**Repair.** ReductiveGroups is on main, so it keeps all three objects, and the open roadmaps must cite it:
- #1689: Scope line 38 and the two §0.7 paragraphs cite ReductiveGroups §1.1.
- #848: C-1.1 takes the underlying space and the general-scheme comparisons from Layer 3A.5's comparisons on `TauCeti.SchemePointTopology.topology`, and keeps the analytic ring sheaf.
- #792: AA.3.1 cites `StructureAcceptance.exists_levi_complement` and keeps its point-level form as a corollary.

Name all three revisions in this pull request's merge-order paragraph. Until they land, the consumer sentences at lines 31–35 are false.

## R03 (P2) — §8.2's disconnected-base pinning target misses two hypotheses

**Location.** `README.md:2733–2734`: "and on a disconnected base the pinning of the constant root datum as the family of native pinnings over the connected components."

**Claim.** A family of native `TauCeti.Pinning`s over the connected components is not, in general, a pinning of the constant root datum. Two conditions are missing:
- one common positive system Φ⁺;
- components that are open, so that sections glue.

**Witness.**
- (i) The README's own Check at line 2748: over Spec(k×k), B⁺ on one SL₂ and B⁻ on the other is a family of native pinnings with positive systems {α} and {−α}. It is not a pinning (Conrad, Remark 6.1.2, p. 186).
- (ii) R = ∏_ℕ 𝔽₃: the components are the points of βℕ and are not open. Choose E₁₂ at every principal point and −E₁₂ at one non-principal ultrafilter U. No unit of R induces this family, since any u ∈ ∏{±1} takes the value lim_U u_n = 1 at U.

**Repair.** Split the target in two:
- For R ≅ R₁ × ⋯ × R_n with each Spec Rᵢ connected, pinnings (Φ⁺, (X_a)) of the split datum over R correspond bijectively to families of native `TauCeti.Pinning Rᵢ …` whose Borel-determined positive systems all equal Φ⁺ under the fixed T ≃ D_S(M).
- Over an arbitrary affine base, keep Conrad's Definition 6.1.1 directly (Φ⁺ ⊂ Φ and trivializing X_a ∈ 𝔤_a(R)), with no reduction to components.

Add (ii) as a negative-control Check. Tested: the common-Φ⁺ condition rejects (i), and the finite-product hypothesis excludes (ii).

## R04 (P2) — two headline theorems that can be stated at the pins are absent, and Layer 9D's classification is not named

**Location.** `README.md:63–71` lists among the remaining targets "the full Nagata theorem, `G = R(G)·G_der` and the simply connected cover". `Suggested.lean` states neither, and its docstring (lines 55–100) names neither. Nagata is a Layer 7 target (README 2063–2066); the cover is a Layer 6 target (README 1697–1698).

**Claim.** Both are deep classical results this roadmap is built to reach, and every carrier exists at the pins.

**Witness.** Both statements below elaborate in a scratch module under `lake env lean` with only `sorry` warnings. #1676 states the first verbatim, as its `linearlyReductive_iff_torus`.

```lean
theorem linearlyReductive_iff_torus {k : Type v} [Field k] [IsAlgClosed k] (p : ℕ)
    [Fact p.Prime] [CharP k p] (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    TauCeti.linearlyReductiveCommHopfAlgProperty k H.obj ↔
      TauCeti.torusCommHopfAlgProperty k H := by sorry

theorem exists_simplyConnected_centralIsogeny {k : Type v} [Field k]
    (G : TauCeti.SemisimpleCommHopfAlgCat.{v} k) :
    ∃ (G' : TauCeti.SemisimpleCommHopfAlgCat.{v} k) (f : G ⟶ G'),
      TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty k G' ∧
        TauCeti.CommHopfAlgCat.IsCentralIsogeny f.hom.hom := by sorry
```

The required modules are `TauCeti.Algebra.AlgebraicGroup.{LinearlyReductive, Torus.Basic, Semisimple.Basic, SimplyConnected.Basic, Isogeny.Basic}`.

**Repair.**
- Add both theorems to `Suggested.lean`.
- Nagata's docstring cites Milne, Proposition 12.54 and Remark 12.56, pp. 248–249. It records that smoothness is needed (μ_p in characteristic p is connected and linearly reductive but not a torus) and that p > 0 is needed (SL₂ in characteristic 0).
- The cover's docstring cites Milne, Theorem 18.25 and Remark 18.27, p. 393, and checks the convention on SL₂ → PGL₂, with kernel μ₂.
- Add a docstring bullet naming Layer 9D's isomorphism and existence theorems (Conrad, Theorems 6.1.16–6.1.17) as not statable, with their missing carrier: the root datum of a split reductive group.

## R05 (P3) — the Tits-system headline cites the abstract Bruhat theorem, not the theorem it states

**Location.** `Suggested.lean:172–173`: "its Weyl group is `N_G(T)(k)/T(k)` (Milne, Algebraic Groups, Theorem 21.45, p. 438)". Also `README.md:2078–2079`: "(Milne, Theorem 21.45, p. 438), in the form `StructureAcceptance.exists_titsSystem`".

**Claim.** `exists_titsSystem` asserts that G(k) carries a Tits system with B = B(k) and N = N(T(k)). Milne 21.45 instead assumes a Tits system and derives the disjoint Bruhat decomposition.

**Witness.** Milne 2017, Theorem 21.45 (p. 438, line 18041 of the iAG2017 text) begins "Let (G,B,N,S) be a Tits system". The existence statement is Proposition 21.75, p. 448 (line 18457): "The quadruple (G(k), B(k), N(k), S) arising, as in Example 21.47, from a split reductive group … is a Tits system."

**Repair.** In the docstring and in README line 2078, cite Proposition 21.75, p. 448, with Example 21.47, p. 439. Keep Theorem 21.45 only for the consequence G(k) = ⊔ B(k)wB(k). README line 2002 already cites §21.h, p. 446, correctly.

## R06 (P3) — Brieskorn's Proposition 1 is for irreducible reflection groups; the README states the source more broadly

**Location.** `README.md:4181`: "The source presentation is for finite real reflection groups". Also `Suggested.lean:294`: "Proposition 1, p. 25, for finite real reflection groups", and `README.md:4355`.

**Claim.** The Lean headline covers reducible root pairings (README 4235 asks for "reducible products"). The source's setting assumes irreducibility, and the README never states the reduction step.

**Witness.** Brieskorn, p. 24 (`brieskorn` line 75–76): "soit W un groupe fini irréductible engendré par des réflexions"; Proposition 1 (line 98) refers to that W. Recomputed for A₁ × A₁ on ℂ²: (ℂ*)²/(±1)² ≅ (ℂ*)² by squaring, so π₁ = ℤ², which is the Artin group with m₁₂ = 2. The theorem holds, but only through the product step.

**Repair.**
- Say "for finite irreducible real reflection groups" at all three places.
- Add the step to 11B as a target: for W = W₁ × W₂ on V₁ ⊕ V₂, V_reg/W = V₁,reg/W₁ × V₂,reg/W₂, and the Artin group of a block-diagonal Coxeter matrix with m = 2 across blocks is the product.
- Add the A₁ × A₁ computation as a Check.

## R07 (P3) — five other open pull requests change this roadmap, conflict with this head, and no order is stated

**Location.** The pull request description says nothing about #1332, #1676, #1807, #1808 or #1854. Each conflicts with this head in `TauCetiRoadmap/ReductiveGroups/README.md` and `Suggested.lean` (overlap index of 2026-11-09).

**Claim.** The heads change the same targets differently:
- #1676 (kim-em, 69572c3) states the same headlines under other names: `isIso_coinvariantsQuotient_of_isNormal` (`Suggested.lean:138`), `exists_conjugate_eq_of_isMaximalTorus` (210) and `exists_titsSystem_of_isBorel` (231).
- #1854 (473bbf7) makes the opposite ownership choices: its README lines 94–97 say ReductiveGroups "does not own … rational cohomology and induction of comodules (IntegralHeckeAndGaloisDeterminants §0.7)", and its line 418 consumes ComplexComparisonPartII C−1.1's complex points.

**Witness.** As above; `roadmaps overlaps ReductiveGroups` lists all five as conflicting.

**Repair.** In the description's merge-order paragraph, state which of #1797, #1332, #1676, #1807, #1808 and #1854 rebases on which. Reconcile with #1676 one declaration name per headline. Close or rebase #1854 so that it no longer reverses the ownership of Layer 1.1 and Layer 3A.5 chosen here.

## Verified sound

**Gate and build.**
- The worker's gate at ad233ac is all zero, `build=0`.
- My own run (`gate … --base origin/main`) fails only on `outside-folder=47`. All 47 are in this pull request's own folders: AlgebraicTopology 9, GeometricTopology 30, IntegralLattices 2, QuadraticFormInvariants 3, LieHighestWeight 3. `git diff --name-only origin/main...HEAD` lists nothing else.
- `lake env lean …/Suggested.lean` exits 0, with eight `declaration uses 'sorry'` warnings and nothing else.

**Dependency check.** Output: `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`. No UPWARD or CYCLE line.

Every supplier this README cites is on main, and none cites ReductiveGroups as a supplier. I grepped their READMEs at this head. LieGroups line 9 and RootSystems line 622 only mention this roadmap as a consumer. The three roadmaps not on main (IntegralHeckeAndGaloisDeterminants, ComplexComparisonPartII, AdelicAlgebraicGroups) are named only as consumers; see R02.

**Signatures.** I elaborated `#check @name` for all 17 declarations in one scratch copy. Every elaborated type matches its README statement, and no binder was lost: every hypothesis is an explicit binder of its own declaration, with no section variables. `UnorderedPlane` carries `instTopologicalSpaceQuotient`.

**One-tactic probe.** I replaced each `sorry` with `first | rfl | infer_instance | trivial | simp | exact ⟨inferInstance⟩ | aesop`. It closes none of the eight theorems, so nothing is padding. The nine definitions are needed to state 11A and 11B, and none is sorry'd data.

**Seeded sample.**
- §1.1: jantzen-1985 §2.8 (pp. 36–39, lines 1100–1165); §3.3 (p. 52, line 1507); §3.9 (p. 60, line 1688–1707: enough injectives via I ⊗ k[G]); §4.2 (pp. 69–70, line 1923); §4.7(a) (p. 73, line 2001: H^n(G, N ⊗ k[G]) = N, 0); §§4.14–4.16 (pp. 77–79a, lines 2116–2160). Jantzen's induction convention f(gh) = h⁻¹f(g) (line 1532) matches the README's antipode transport.
- §8.1: conrad-rgs Definition 5.1.1, p. 136 (line 5651). Conditions (1)–(3) are as restated, and nonempty S is required.
- §8.2: conrad-rgs Definition 6.1.1 (line 7725) and Remark 6.1.2 (line 7738), p. 186.

**Headline locators.** Checked against Milne 2017 (iAG2017), fetched through the sources service into a scratch copy of the manifest (printed page = PDF page − 12):
- Theorem 5.14, p. 102 and Proposition 5.18, p. 103 (lines 4449, 4492).
- Theorem 17.10, p. 354 (line 14547).
- Corollary 17.97, p. 383 (line 15767; its hypothesis is a connected group variety).
- Theorem 17.96 and Definition 17.95, pp. 383/382; Theorem 16.33, p. 335; Definition 17.6 and Theorem 17.9, pp. 353–354; Definition 17.15 and Theorem 17.16, p. 356; Theorems 21.11 and 21.37, pp. 428 and 435; Proposition 12.54, p. 248; Corollary 22.43, p. 478; Theorems 23.25, 23.58 and 23.74, pp. 492, 501, 511; §21.h, p. 446.
- Other sources: mcninch §3.1, p. 6 (lines 233–252: connected groups, characteristic 0) and (3.2.1), p. 7 (line 280); conrad-feng §12.3 and Proposition 12.3.1, p. 127 (lines 5325–5346); fox-neuwirth §7, pp. 122–126 (lines 153–218); brieskorn Proposition 1, p. 25 (line 98); fadell-neuwirth §II, p. 114; birman-brendle §§1.1–1.2 and p. 69.

The board manifest's `milne-iag` entry is v2.00 (2015), whose numbering differs: its 5.14 is the homomorphism theorem. The README cites and links the 2017 text, and every number above matches that text. The worker may want to record iAG2017 in the manifest.

**Library declarations opened at the pin** (Tau Ceti, `TauCeti/Algebra/AlgebraicGroup/` unless stated):
- `HopfIdeal.coinvariants` (`HopfIdeal/Coinvariants/Basic.lean:95`) and `IsNormal` (`HopfIdeal/Normal/Basic.lean:67`).
- `fppfHomogeneousQuotientToCoinvariantsPoints` (`Fppf/Quotient/Homogeneous/Coinvariants.lean:111`). Native representability needs either `[IsGeometricallyReduced]` plus linear reductivity (lines 210–241) or characteristic 0 (line 255). `coinvariantsFppfQuotientIso` (`Fppf/Quotient/Coinvariants.lean:48`) is for geometrically reduced H. So the Layer 3 headline duplicates nothing.
- `IsMaximalTorus` (`Torus/Maximal.lean:50`), `conjugate` (`HopfIdeal/Conjugation.lean:75`), `IsBorelOverAlgClosed` (`Borel/Basic.lean:148`), `IsParabolic` (`Parabolic/Basic.lean:248`) and `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:71`).
- `TitsSystem` (`TauCeti/GroupTheory/TitsSystem/Basic.lean:50`). Empty `simple` is allowed, so the torus case has a Tits system.
- `BraidGroup n := ArtinGroup (CoxeterMatrix.A (n − 1))` (`GroupTheory/SpecificGroups/Braid/Basic.lean:99`), trivial for n = 0, 1. `ArtinGroup` (`GroupTheory/Coxeter/Artin.lean:121`). `coxeterMatrixOfBase` (`LinearAlgebra/RootSystem/Coxeter/Matrix.lean:278`).
- `Pinning` (`Pinning/Basic.lean:88`, which needs `ConnectedSpace (PrimeSpectrum R)`).
- `linearlyReductiveCommHopfAlgProperty_iff_torus_of_isSolvable` (`Solvable/LinearlyReductive.lean:86`, assuming reduced, connected and solvable), `IsCentralIsogeny` (`Isogeny/Basic.lean:78`) and `simplyConnectedSemisimpleCommHopfAlgProperty` (`SimplyConnected/Basic.lean:65`).
- Every one of 57 further backticked library names checked by grep at the pins exists, including `IsMaximalTorus.exists_isBorelOverAlgClosed_le` (`Borel/Torus.lean:67`) and `reductiveCommHopfAlgProperty.of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive` (`Reductive/LinearlyReductive.lean:331`). All 24 Mathlib file paths in "From Mathlib" exist.

**Cross-roadmap citations resolved on main** (main README line numbers):
- SchemeAndStackFoundations §0.7 (755), §0.8 (798), §1.1 (2071), §1.5 (2167), §§1.13–1.15 (2418, 2458, 2502).
- ModularCurves §0E (840) and §0F (887; finite-locally-free Weil restriction present).
- RootSystems §2.1 (616) and §3.1 (687).
- LieGroups Layer 2 (356), Layer 7 (787) and Layer 8 (1078).
- InductionRestriction Layer 2.1 (346).
- DGFloer Layer 1 item 2 (fibration homotopy exact sequence, lines 470–500).
- LieHighestWeight Layers 3–4 and 7 (at this head, 561/680/826; same numbering on main).

The 12 own names the citation tool could not find are all declared in `Suggested.lean`, confirmed by `#check`.

**Ownership against open work.** I read the closest open roadmaps at their heads:
- GroupSchemesOverABase, ClassicalGroupsPartII, SchubertGeometry and FormalConnectionsOpers cite this roadmap as a supplier.
- The three exceptions are R02.
- ReductiveGroupsPartII on main is R01.

**Adversarial table** (values computed; "✓" means both sides agree):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 cobar complex | H = ℤ[t,t⁻¹], weight-one line | d⁰(1) = 1⊗(t−1); d¹(t−1) = t⊗(t−1) − (t⊗t − 1⊗1) + (t−1)⊗1 = 0 | ✓ | none |
| §1.1 differentials, trivial group over ℤ | degrees 0, 1, 2; M = ℤ/2 | Σ_{i≤n+1}(−1)^i id = 0, id, 0; H⁰ = ℤ/2, H¹ = H² = 0 | ✓ | none |
| §1.1 "cofree ≠ injective" | ℤ over trivial group | extending 2ℤ → ℤ, 2 ↦ 1 needs 2f(1) = 1: impossible; acyclic since (−)^G = id is exact | ✓ | none |
| §1.1 induction | C₂ ⊂ S₃; ℤ → ℤ[t,t⁻¹] | rank 3 = index; (C₂(123))⁻¹ = {(132), (132)(12)} = (132)C₂; weight one ↦ 0, trivial ↦ ℤ | ✓ | none |
| §8.1 split data | SL₂, PGL₂, SL₂/𝔽₂ | root = 2ω vs generator; centre 𝔽₂[t]/(t−1)², length 2 | ✓ | none |
| §8.2 pinning Checks | x_α(2t) over ℚ; over ℤ | 2 ∈ ℚˣ, so a valid pinning; over ℤ, 2E₁₂ generates 2ℤE₁₂ ≠ 𝔤_α | ✓ | none |
| §8.2 disconnected-base target | Spec(k×k) with (B⁺, B⁻); ∏_ℕ 𝔽₃ | Φ₁⁺ = {α} ≠ Φ₂⁺ = {−α}; at U, lim_U u_n = 1 ≠ −1 | ✗ | R03 |
| `isIso_quotient_of_isNormal` | μ_p ⊂ μ_{p²} | coinvariants = span{t^{pj}} ≅ k[s]/(s^p−1); O(G) free on 1,…,t^{p−1} | ✓ | none |
| same, extremes | I = augmentation (N = 1); I = 0 (N = G) | coinvariants H (since (id⊗ε)Δh = h); coinvariants k (Δh = h⊗1 ⇒ h = ε(h)) | ✓ | none |
| `exists_levi_complement` | 𝔾_a; Borel of GL₂; char p | I_u = 0, coinvariants k, J = aug; coinvariants k[a^±,d^±], J = (b) bijective, J = (a−1) not injective; Greenberg SL₂(W₂) has no J (McNinch (3.2.1)) | ✓ | none |
| 6A H¹ Check | 𝔾_m on 𝔾_a weight 1 | a(ts) = a(t) + t·a(s) forces a₁ = −a₀, so a = c(t−1) = d(c) | ✓ | none |
| `IsMaximalTorus.exists_conjugate_eq` | μ_p × 𝔾_m; constant S₃; SL₂ over ℝ | unique torus 1 × 𝔾_m, g = 1; trivial torus; diag vs SO₂ not ℝ-conjugate (needs `IsAlgClosed`) | ✓ | none |
| `exists_titsSystem` | torus T; GL₂; N_{GL₂}(T) | B = N = T(k), W = 1, S = ∅ allowed; W = {1,s}, sBs⁻¹ lower triangular; T normal, so (T4) fails while \|W\| = 2 | ✓ | none |
| same, locator | Milne 21.45 vs 21.75 | 21.45 assumes a Tits system; 21.75 constructs it | ✗ | R05 |
| `IsParabolic.exists_levi_complement` | P = G; P = B ⊂ GL₂; no `hred` | coinvariants of aug = O(G), J = 0; J = (b); Greenberg SL₂(W₂) is parabolic in itself with no Levi | ✓ | none |
| `lang_surjective` | 𝔾_a/𝔽₂; 𝔾_m; C₂; transcendental a | θ²−θ = 1 (θ ∈ 𝔽₄); x^{q−1} onto Kˣ; C₂ Lang map ≡ 1 misses the other element; T^q − T − a has a root in K | ✓ | none |
| 7a fixed-coset Check | F̄_qˣ, J = ±1, q odd | Lang of J ≡ (±1)^{q−1} = 1; σ(a) = −a when a^{q−1} = −1; a ∈ 𝔽_{q²}∖𝔽_q | ✓ | none |
| Lang ownership | PartII on main vs Layer 7a | two `lang_surjective` statements; PartII's is the K = 𝔽̄_q case | ✗ | R01 |
| `nonempty_plane_braid` | n = 0, 1, 2, 3 | point/1; ℂ/1; ℂ×ℂ*, ℤ = B₂; (012)·(0,1,2) = (2,0,1) via z_{σ⁻¹i} | ✓ | none |
| `nonempty_weylQuotient_artin` | ι = ∅; A₁ (±2, ±1 on ℂ); A₂ on ℂ³ | ℂ^κ, π₁ = 1 = Artin(∅); ℂ*/±1 ≅ ℂ*, ℤ = Artin(A₁); PConf₃/S₃, B₃ | ✓ | none |
| same, reducible | A₁ × A₁ on ℂ² | (ℂ*)²/(±1)² ≅ (ℂ*)², π₁ = ℤ² = Artin(m₁₂ = 2); outside Brieskorn's irreducible setting | ✓ (route gap) | R06 |
| Nagata (absent) | μ_p; 𝔾_m; SL₂ in char 0 and char p | μ_p linearly reductive but not a torus (needs smooth); SL₂ linearly reductive in char 0 only (needs p > 0) | statable, absent | R04 |
| Simply connected cover (absent) | SL₂ → PGL₂ | central isogeny, kernel μ₂; SL₂ simply connected | statable, absent | R04 |
| 6B Check | g = diag(2,1), h = swap | (gh)(gh)ᵗ = ggᵗ = diag(4,1); gᵗg = diag(4,1) ≠ (gh)ᵗ(gh) = diag(1,4) | ✓ | none |
| 7e Check, GL₂(𝔽₃) | t = diag(2,1), w = swap | wtw⁻¹ = diag(1,2); second columns of tw and wt are (2,0) and (1,0), invariant under U⁻ | ✓ | none |
| 7f Check | S₃, H = ⟨(12)⟩; (ℤ/8)ˣ ⋉ ℤ/8 | 1·2 = 2·1; {x, 3x+4, 5x+4, 7x} closed under composition, meets (u,0) classes once, no fixed point | ✓ | none |
| Layer 2 / 4 / 5 Checks | [E₁₂,E₂₁]; Jordan of [[2,1],[0,2]]; 𝔽₂(a) | diag(1,−1); g_u = [[1,1/2],[0,1]]; char poly x² − a = (x−√a)² | ✓ | none |
| Layer 10 Checks | SL₂ char p | dim L(p) = (0+1)(1+1) = 2 ≠ p+1 = dim ∇(p); Steinberg dim p | ✓ | none |

**Coverage.** I read in full Scope, Conventions, the supplier contracts, Layers 0–3, 6–8 and 11, and the References. I read the Checks and headline passages of Layers 4, 5, 5P, 9D–9E and 10. Layers 3A, 7C and 9A–9C were read only in part.

## Not verifiable

- Waterhouse, Borel and Springer are recorded as uncertified (paywalled). Here they appear only as general references without locators (README 4509–4511), so there is nothing to check.
- SGA3 Exposé XIX (README 4523) was not fetched; it is a general reference.
- Conrad, *Reductive Group Schemes*, Theorems 4.1.7, 5.1.13 and 6.1.16–6.1.17 were not opened this round. They are outside the sample and support no headline stated in Lean.

## Source issues

- **Error** in milne-ag2017 (Milne, *Algebraic Groups*, 2017) at Remark 12.56, p. 249: the source says an algebraic group in characteristic p is linearly reductive iff G° is a torus and p does not divide (G:G°); it should be "G° is of multiplicative type" (torus only for group varieties), since μ_p is linearly reductive and connected but not a torus; affects nothing (README 2063–2066 states Nagata for smooth connected groups).
