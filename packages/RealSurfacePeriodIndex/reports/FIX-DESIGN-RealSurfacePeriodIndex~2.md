# FIX-DESIGN-RealSurfacePeriodIndex~2

This report covers the nineteen findings of REV-DESIGN-RealSurfacePeriodIndex, settled against the design in
`packages/RealSurfacePeriodIndex/design/` (`README.md`, `plan.json`) and `packages/RealSurfacePeriodIndex/sources.toml`.
The README is still generated from `plan.json`, so every change below is in both files. Locators into the cached
sources are given as `<source id> line N`.

## F01 (P1) — applied

**Change.** I deleted PI.4/obstruction-vanishing-general, PI.4/pushforward-adjustment-general, PI.6/degree-two-splitting-general and gap G1. Ownership and "The argument" now say in one clause that Propositions 4.4, 4.5 and 6.6 are planned in uniform-evaluation form, the only form the induction uses. E3 is kept, with its correction rewritten. The routed items now point to the uniform targets.

**Evidence.** B19 line 856–861 gives `[ζ]₁ = [α̃]₁ + [α̃]₀[e]₁` on Ψ, so the general forms need `[α̃]₀ = 1` there. The case 4 | n (t = 0, Ψ = Θ(α)) remains an acceptance Check of PI.6/degree-two-splitting-uniform.

## F02 (P1) — applied differently

**Change.** I deleted G2 and added two PI.1 targets:

- PI.1/index-algebraically-closed-base-change: for any algebraically closed k ⊂ K and any integral X, per and ind of α are unchanged (proof by spreading out).
- PI.1/ramified-to-unramified-reduction: for prime period l there are Y over Ω, an algebraic closure of k(t), and r with r*α_Ω unramified and ind(α) | ind(r*α_Ω).

De Jong's theorem now cites both.

**Why differently.**

- Statement (b) is in the form CT05 actually proves (CT05 line 860, 906; Lemme 3.15 at line 921): divisibility for prime period, not "keeping period and index". The prime-power reduction is step 1 of the de Jong target.
- De Jong's theorem and the norm bound moved from PI.1 to PI.2 (PI.2/de-jong-period-index, PI.2/real-closed-norm-bound). Both use PI.2/complex-unramified-period-index, and a PI.1 target citing PI.2 inverted the layers.
- The norm bound therefore cites (a) and (b) through the de Jong target, not directly.

## F03 (P1) — applied differently

**Change.** I added PI.6/family-pair-stratification. On M = π⁻¹(Λ) it gives a G-invariant Whitney stratification with these strata:

- the exceptional curves over Sing R;
- the moving ℙ¹ fibres over R ∩ D_x;
- the constant curve R̃;
- their finitely many intersection points;
- the open complement.

Every stratum is submersive over Λ and f is proper. There is one gap, gap:at2-stratified-pair-transport (AlgebraicTopologyPartII, AT2.16/stratified-pair-transport). The alternative route is gone, and equivariant Ehresmann is now its own gap.

**Why differently.** AT2.16/stratified-pair-transport takes invariant control data as a hypothesis ("given, not assumed automatically"), and AlgebraicTopologyPartII's G13 records their existence as open. That existence is Mather's theorem for any Whitney stratification, not a property of this family. The PI.6 target therefore states the family's hypotheses, and the gap asks AlgebraicTopologyPartII for the control data.

## F04 (P1) — applied

**Change.** Old: G4, supplier none, pointing to the supplier's "extraction gap G10". New: gap:at2-double-cover-diagram, supplier AlgebraicTopologyPartII, section AT2.16/double-cover-diagram. Its needs: `g(δ) + ζ ∪ ω = g(η₀ ∪ ω)` with the plus sign, modulo the indeterminacy, the cochain chase being AlgebraicTopologyPartII's open item (its G14). PI.4/uniform-obstruction-vanishing cites it, and the packet and extraction wording is gone.

## F05 (P1) — applied differently

**Change.** I deleted G5. PI.6/brocker-sign-input and PI.9/prescribed-evaluation-class stay owned here, with locators; BRO80 and CTP90 are uncertified entries in sources.toml.

PI.9/enriques-picard-image is deleted, not re-sourced. MotivesAndAlgebraicCycles §7.10 already plans `H¹_alg = w₁(X(ℝ))^⊥` for real Enriques surfaces and lists `cl_R(K_X) = w₁` among its inputs to prove (Benoist–Wittenberg I, Corollary 3.20). It is imported from there, since a target another roadmap plans is never planned again. MVH98 Theorem 4.4 and Proposition 4.2 (MVH98 line 538, 500) are cited in PI.9/enriques-w1-square.

## F06 (P1) — applied

**Change.** I deleted G6.

- PI.0/albert-isotropy cites EKM Theorem 98.19 (EKM line 20715).
- PI.0/elman-lam-c2-bound now proves both cases: u(F(√−1)) = 4 by BEC05 §3 (BEC05 line 102–104), and u(F(√−1)) < 4 by EKM Corollary 36.4 (EKM line 8879) and Proposition 37.7 (EKM line 9252).
- New target PI.7/degree-four-del-pezzo-model (VA13 line 198, 388, 419) supplies the two-quadric model; PI.7/del-pezzo-point uses it.

## F07 (P1) — applied differently

**Change.** Every HodgeStructuresPartII H.8 citation is gone (15 distinct prerequisite slugs, plus mentions in prose).

- Owned here at the point of use: PI.2/geometric-variation (the variation, with Griffiths' formula), PI.2/voisin-kernel-cone, PI.2/open-cone-lattice-coset, PI.5/kodaira-spencer-normal-factorisation and PI.6/real-green-criterion.
- Weak Lefschetz and Andreotti–Frankel: AffineMorseLefschetz §A5 and §A3.
- Ehresmann, Gauss–Manin and the Hodge bundles: ComplexComparisonPartII §C5.2–§C5.3.
- The orthogonal-splitting and constant-symbol steps are now proof steps of PI.6/vanishing-variation.

**Why differently.** There is no new layer before PI.2, because the brief forbids reorganised layers. The finding's test holds: PI.2/dense-splitting-hypersurfaces now cites only PI.1–PI.2 targets, ComplexComparisonPartII §C5.2 and MotivesAndAlgebraicCycles §7.8.

## F08 (P1) — applied differently

**Change.** All nine SemisimpleAlgebrasPartII slugs are replaced. The roadmap now cites the pinned `TauCeti.Algebra.index` (TauCeti/Algebra/CentralSimple/Index.lean:99) and `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index` (:255). The rest is owned by two new targets:

- PI.0/brauer-period-index: per | ind with the same prime divisors, ind divides the degree of every splitting field, and `ind(α_L) | ind(α) | [L:K]·ind(α_L)`.
- PI.0/brauer-corestriction: `cor∘res = [L:K]`.

**Why differently.** The new targets sit in PI.0, not PI.1. PI.0/albert-isotropy and PI.0/pfister-brauer-criterion need the index, and PI.0 never imports PI.1. Corestriction is transported along `TauCeti.brauerCohomologyEquiv` (TauCeti/Algebra/CrossedProduct/Comparison.lean:267) from ProfiniteCohomology Layer 6.

## F09 (P1) — applied differently

**Change.** Every atlas label now points to the section that states the content:

| Old label | New citation |
|---|---|
| SF.0–SF.6 | SchemeAndStackFoundations §§0.1, 0.9, 0.17, 2.2, 2.6, 2.11, 2.16, 2.20, 2.22, 3.4, 4.9, 4.11, 4.13, 4.17, 5.4, 5.10 |
| MC.2, MC.7 | MotivesAndAlgebraicCycles §§0.5b, 7.6a, 7.6b, 7.8, 7.10 |
| R09.1, R09.7 | AlgebraicModuliForArithmeticGeometry §§1.1, 1.4; ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2, 7.8 |
| R03.3 | SchemeAndStackFoundations §§0.17, 4.13 |
| IG.3 | ComplexComparisonPartII §C6.2 |
| Enriques | WeilConjectures WC.7; EnriquesSurfaces E1a, E1c, E1d |

**Why differently.** Each item the finding listed as unstated is handled as follows:

- **New targets here:** Lemma 2.1 (PI.1/two-torsion-line-bundle-class) and the Kummer and topological Brauer sequences (PI.1/kummer-brauer-sequences).
- **Gaps:** the real étale–equivariant comparison (gap:real-artin-comparison, ComplexComparisonPartII §C6.3) and the torsion-free cokernel (gap:picard-cokernel-torsion-free, MotivesAndAlgebraicCycles §7.8).
- **Already stated by a supplier, so no gap:**
  - the residue formula: HeightsRationalPointsAndObstructions §2.16b, `smoothBrauer_residueExact` with the pullback-multiplicity clause;
  - the Gersten step: MotivesAndAlgebraicCycles §0.5b.
- **Disputed:** the finding says MotivesAndAlgebraicCycles does not state Kahn's `cl_R(K) = w₁`. That is right for the labels the design used, but §7.10 does plan it (see F05).
- **Enriques invariants:** these come from EnriquesSurfaces, another author's open roadmap that adds a new folder, not from EnriquesSurfacesAndIntegralNonexistence. The latter is a same-author draft not in the merge order, and the baseline gate run warned that it would have to be inserted first.

## F10 (P2) — applied differently

**Change.** The plan's `gaps` list and the README's "Gaps" section now declare 25 gaps:

- 22 on AlgebraicTopologyPartII AT2.6–AT2.16;
- gap:q2-tsen-lang (QuadraticFormInvariantsPartII Q2.5/transcendental-ci);
- gap:real-artin-comparison (ComplexComparisonPartII §C6.3);
- gap:picard-cokernel-torsion-free (MotivesAndAlgebraicCycles §7.8).

The PF.6 and Enriques citations needed no gaps once repointed to roadmaps the merge order allows (see F09). Equivariant Betti cohomology and the Borel–Haefliger classes now have one owner: MotivesAndAlgebraicCycles §§7.6a–7.6b.

**Why differently.** MotivesAndAlgebraicCycles is in the merge order (merge-order/ORDER.txt line 65). AlgebraicTopologyPartII is a board design that is not in the order, so it is used only for the double-cover topology that MotivesAndAlgebraicCycles does not plan.

## F11 (P1) — applied

**Change.**

- PI.9/enriques-odd-euler and its false acceptance Check are deleted.
- New target PI.9/enriques-w1-square: deg(w₁²) = 0, equivalently an even number of odd-χ components. Proof: `w₁ = cl_R(K_S) ∈ im cl_R = w₁^⊥` (MotivesAndAlgebraicCycles §7.10; MVH98 Theorem 4.4).
- PI.9/real-enriques-criterion is kept as printed, with a Check that it is equivalent to "nonorientable and both halves nonempty".
- New source issue E25 records the empty case.
- PI.9/enriques-even-euler became PI.9/enriques-one-half.

**Evidence.** The printed case is B19 line 79–80, and its use in the proof is B19 line 1786–1788. B19 line 1785 gives `deg w₁(Σ)² ≡ χ(Σ)`.

## F12 (P2) — applied

**Change.**

- Old Check: two loops meeting once, one blow-up, giving torus # ℝℙ².
- New Check: loops a, b, c with c in the class a + b, pairwise meeting once. The total class is `a + b + (a + b) = 0`. Three blow-ups give T² # 3ℝℙ², whose strict transforms have total class 0 and generate `H¹ ≅ 𝔽₂⁵` together with the exceptional circles.
- Proof step 1 now adds the loop in the class of the difference (B19 line 1129).

## F13 (P2) — applied

**Change.**

- PI.9/real-puiseux-field now uses `puiseuxField R`, `ramifiedEmbedding` and `puiseuxField_isAlgClosed` from FormalLaurentPuiseux L4.
- It plans only the leading-coefficient order and IsRealClosed, proved from IsRealClosed's three fields: semireal, square roots by the binomial series, and odd-degree roots by conjugation on `puiseuxField (R(√−1))`.
- `RealSurface.RealPuiseux`, `ofLaurent` and their eight sibling API and test names are deleted. The consumers (PI.9/sextic-k3-degeneration, PI.2/real-closed-norm-bound) are updated.

## F14 (P3) — applied

**Change.** PI.7/real-closure-pointwise-triviality, step 3: K, the real closure of ℝ((z₁))((z₂)), is not algebraic over ℝ(U). The proof now passes to R₀, the relative algebraic closure of ℝ(U) in K. R₀ is real closed and algebraic over ℝ(U), hence a real closure at the induced ordering, so `α_{R₀} = 0` and therefore `α_K = 0`. The (−1, −1) Check now records that both images are nonzero.

## F15 (P3) — applied

**Change.**

- PI.4/brauer-cover-hypotheses: Ψ is now open and closed in U(ℝ) (B19 line 670–671), with a Check on ℙ²_ℝ, R a line, Ψ = U(ℝ) ≅ ℝ², which is not closed in S(ℝ).
- Same pattern: PI.1/point-removal-extension now allows any open Σ, so its consumers accept such Ψ.
- PI.0/amer-brumer is stated for every field (EKM line 3877), with a characteristic-2 Check over 𝔽₂.

## F16 (P3) — applied

**Change.** PI.0/ci-brauer-vanishing is deleted. PI.0/witt-real-curve cites `tsen_theorem` (SchemeAndStackFoundations §2.16) for Br(ℂ(C)) = 0. No other target used the general statement "C₁ implies Br = 0". PI.0/curve-u-bound uses the C₁ property through gap:q2-tsen-lang, not Br = 0.

## F17 (P3) — applied

**Change.** sources.toml is complete, and `sources check` reports 0 problems.

- Certified: B19, MVH98, BW20, BW20II, EKM, BEC05, CT05, BEN18, VOI06, VA13.
- Uncertified, cited by locator: BCR, ARA75, SPR55, EL73, BRO80, DK96, CTP90, SER06, SCH94, GG73, BRE97, DIM85, DIK00.
- B19 carries a version_note on the published pagination, under a single key.
- Citations of texts nobody could read (DJ04, CT95, WITT37, PFI82, LAM05, VOI02) are replaced by locators in texts that were read (CT05, EKM, B19).
- No needs-references request is pending.

## F18 (P3) — applied

**Change.**

- Removed: the planet labels, the Suggested.lean path, the atlas, extraction, date and library-provenance wording, the Routing table and the Structure proposals.
- "Dependencies on other roadmaps" now lists every supplier section, what is assumed of it and its consumers, ShimuraData §3.1 included.
- The gate places the roadmap after HeightsRationalPointsAndObstructions (ORDER.txt line 104), which is after ShimuraData (line 90).

The roadmap-form rewrite (*Needs:* lines, supplier contracts, prose instead of field lists) is package-stage work, as the finding itself says.

## F19 (P3) — applied

**Change.**

1. U_α: the complement is "a curve or empty, empty exactly when α ∈ Br(S)".
2. The ⟨1, t⟩ example now gives its residue forms ⟨1⟩ and ⟨1⟩, and ⟨1, 1⟩ is noted as isotropic.
3. Albert's scaling factor is renamed e = −x₁x₂x₃, with the normal form written out.
4. λ is replaced by the φ ∈ Pic(S) of PI.4/uniform-first-component.
5. The example uses N = O and R a line, so L = L ⊗ N = O(1).
6. Smooth models cite `resolution_field` (ResolutionOfSingularitiesCharacteristicZero §7.8).

**Note on item 2.** I corrected the finding's own suggested wording. The residue forms ⟨1⟩, ⟨1⟩ belong to ⟨1, t⟩. The residue forms of ⟨1, 1⟩ are ⟨1, 1⟩ and 0.

## Checks

**Dependency gate.** Command (repository-relative paths): `tauceti-roadmap --conf <conf> gate --candidate packages/RealSurfacePeriodIndex/design/README.md --only RealSurfacePeriodIndex --order merge-order/ORDER.txt`. Final output, exit status 0:

```
candidate: RealSurfacePeriodIndex is not in the merge order yet; checked as if placed after HeightsRationalPointsAndObstructions (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 634 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The baseline run before my edits placed the roadmap after MotivesAndAlgebraicCycles, with 628 edges and a note that the supplier EnriquesSurfacesAndIntegralNonexistence was not in the merge order. That supplier is no longer cited.

**Other checks.**

- `roadmaps resolve` on the README: no missing Lean names. It reports two cross-roadmap leads, README line 88 (AlgebraicTopologyPartII AT2.6) and line 93 (QuadraticFormInvariantsPartII Q2.5). Both are board designs and are cited only through declared gaps; the resolver reads only main and open pull requests.
- `sources check packages/RealSurfacePeriodIndex/sources.toml`: 0 problems.
- Scratch consistency check of `plan.json`: 106 nodes, parses as JSON. Every internal prerequisite exists and lies in the same or an earlier layer. Every gap is used and every `gap:` prerequisite is declared. No atlas label (SF., MC., R0, IG., H.8, SA.) remains.
- The brief listed no gate failures.
- No `Suggested.lean` exists at the design stage, so there was no `#check` comparison to make.

## Changes

- **Nodes:** 98 → 106.
  - Deleted: PI.4/obstruction-vanishing-general, PI.4/pushforward-adjustment-general, PI.6/degree-two-splitting-general, PI.0/ci-brauer-vanishing, PI.9/enriques-odd-euler, PI.9/enriques-picard-image.
  - New: PI.0/brauer-corestriction, PI.0/brauer-period-index, PI.1/kummer-brauer-sequences, PI.1/two-torsion-line-bundle-class, PI.1/index-algebraically-closed-base-change, PI.1/ramified-to-unramified-reduction, PI.2/geometric-variation, PI.2/voisin-kernel-cone, PI.2/open-cone-lattice-coset, PI.5/kodaira-spencer-normal-factorisation, PI.6/real-green-criterion, PI.6/family-pair-stratification, PI.7/degree-four-del-pezzo-model, PI.9/enriques-w1-square.
- **Gaps:** six unowned gaps (G1–G6) replaced by 25 gaps, each naming a supplier and a section.
- **Source issues:** E3 and E21 corrected; E25 added.
- **README sections:** Ownership, Conventions, Layers, Dependencies and Gaps regenerated; layer introductions updated for the moved and new targets.

## For the maintainer

- **Renamed or moved ids:**
  - PI.1/de-jong-period-index → PI.2/de-jong-period-index
  - PI.1/real-closed-norm-bound → PI.2/real-closed-norm-bound
  - PI.9/enriques-even-euler → PI.9/enriques-one-half

  The ten `RealSurface.RealPuiseux*` API and test names are deleted. No roadmap on main or in an open pull request cites this roadmap (`roadmaps grep RealSurfacePeriodIndex`: no match). AlgebraicTopologyPartII's design names it only as a consumer, without slugs.
- **What suppliers are now asked for:**
  - AlgebraicTopologyPartII: 22 targets of AT2.6–AT2.16, which must keep their slugs.
  - QuadraticFormInvariantsPartII: Tsen–Lang (Q2.5/transcendental-ci).
  - ComplexComparisonPartII: the real étale–equivariant comparison (§C6.3).
  - MotivesAndAlgebraicCycles: the torsion-free cokernel of `cl` on Pic as a named result (§7.8).
- **Newly cited suppliers:**
  - AffineMorseLefschetz, FormalLaurentPuiseux, ModularCurves, ProfiniteCohomology and RealAlgebraicGeometry, all on main.
  - ComplexComparisonPartII, ShimuraData, WeilConjectures and HeightsRationalPointsAndObstructions, all earlier in the merge order.
  - EnriquesSurfaces and PurityOfBranchLocus, other authors' open roadmaps that add new folders.
- **No longer cited:** HodgeStructuresPartII and SemisimpleAlgebrasPartII (neither exists), PurityForFlatCohomology, InverseGaloisAndArithmeticFundamentalGroups, DeformationAndDerivedPatchingAlgebra and EnriquesSurfacesAndIntegralNonexistence.
- **Duplicated construction.** AlgebraicTopologyPartII AT2.6–AT2.10 and MotivesAndAlgebraicCycles §§7.6a–7.6b both construct equivariant Betti cohomology and the Borel–Haefliger classes. This roadmap takes them from MotivesAndAlgebraicCycles, and AlgebraicTopologyPartII may want to drop the duplicate.
- **E25.** B19 Theorem 0.6 (ii) has an empty second clause. Anything citing it should use "nonorientable and both halves nonempty".
- **Ownership against open work.** The brief named the open roadmap pull requests without checkout paths. I checked ownership by object with `roadmaps grep` and `roadmaps show` over main and the 367 open heads in the resolver's index, and with the board's packages. HodgeStructuresPartII, SemisimpleAlgebrasPartII and the two-quadric del Pezzo model still have no owner, so this roadmap owns the inputs listed under Ownership.
- **Untrusted text.** Nothing in the review, the sibling roadmaps or the fetched sources was treated as an instruction.

## Adversarial pass

The table covers every statement I added or whose mathematics changed. Citation-only repoints (F09, F10) change no statement; for those I checked that the cited section states the input: section heading, plus the declaration name where one is cited.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| PI.0/brauer-corestriction | L = K; ℂ/ℝ with the quaternion class α; L = K(√a) | `cor_{K/K} = id`; Br(ℂ) = 0, so `cor_{ℂ/ℝ} = 0` and `cor(res α) = 0 = 2α` in Br(ℝ) ≅ ℤ/2, while α ≠ 0, so cor is not a retraction; Br(K(√a)/K) = {(a, b)}, killed by 2 | holds | three Checks |
| PI.0/brauer-period-index | ℍ over ℝ; M₂(ℍ); α = 0; ℍ ⊗ ℂ | per = ind = 2; ind(M₂(ℍ)) = 2 although the degree is 4; per = ind = 1; ind(ℍ_ℂ) = 1 divides 2 = [ℂ:ℝ]·1 | holds | none |
| PI.1/kummer-brauer-sequences | Spec ℝ; ℙ¹_ℂ; Spec ℝ in degree 1 | H²(G, ℤ(1)) = 0 and H³(G, ℤ(1)) = ℤ/2, so Br(ℝ)[2] = ℤ/2 is purely topological; H²(S², ℤ/n) = ℤ/n = Pic/n, so Br[n] = 0; H¹_G(pt, 𝔽₂) = 𝔽₂ = ℝˣ/ℝˣ², with Pic = 0 | exact in all three | none |
| PI.1/two-torsion-line-bundle-class | Spec ℝ; ℙ¹_ℝ; K_S on a real Enriques surface | H¹(pt) = 0 on both sides; H¹_G(S², 𝔽₂) = 𝔽₂ restricts to components (1, 0) on ℙ¹(ℝ), so [e]₁ = 0 = cl_R(υ(e)), with Pic[2] = 0; [e]₁ = w₁ = cl_R(K_S) | holds | none |
| PI.1/index-algebraically-closed-base-change | k = K; ℚ̄ ⊂ ℂ with (x, y); ℝ ⊂ ℂ | trivial; per = ind = 2 on both sides, since ⟨1, −x, −y, xy⟩ is anisotropic by iterated Springer; ℍ has index 2 over ℝ and 1 over ℂ, so the hypothesis "algebraically closed" is needed | holds | negative Check |
| PI.1/ramified-to-unramified-reduction | α unramified; (x, y) on ℙ²_ℂ, l = 2 | Y = X_Ω and r = id give ind(α) \| ind(α_Ω), an equality by the previous row; the residue of (x, y) along x = 0 is the class of y in ℂ(y)ˣ/ℂ(y)ˣ², nonzero, and becomes 0 after multiplication by the ramification index 2 | holds | none |
| PI.2/geometric-variation | constant family; quartic surfaces | ∇ trivial, so ∇(λ) = 0; h^{2,0} = 1, h^{1,1} = 20, b₂ = 22 | holds | none |
| PI.2/voisin-kernel-cone | H²(O_S) = 0; classes p*σ | H²(T_b, O)_S = H²(T_b, O); p_*p*σ = dn·σ ≠ 0 for σ ≠ 0, so p*σ ∉ ker p_*, which is why the cone lies in ker p_* | holds | none |
| PI.2/open-cone-lattice-coset | (ℝ, ℤ, 2, (0, ∞)); B(0, 1/2); Γ = ℤ × 0 ⊂ ℝ² with Ω = {y > 0} | 1 ∈ (1 + 2ℤ) ∩ Ω; B(0, 1/2) ∩ (1 + 2ℤ) = ∅; Γ ∩ Ω = ∅ | holds; both hypotheses needed | two negative Checks |
| PI.5/kodaira-spencer-normal-factorisation | C = ∅; quartic containing a line | both composites are 0; lines form a 4-dimensional family and containing a given line imposes 5 conditions, so the locus has codimension 1 = h^{2,0} and the composite to H²(O_T) ≅ ℂ is onto | holds | none |
| PI.6/real-green-criterion | (0,2)-part = 0; quartic with ten spheres (BEN18 line 198–208) | Ω = all of H_{ℝ,b}(1)^G; rank H^{1,1}_ℝ(1)^G = 1, spanned by O(1), which stays (1,1), so ∇(λ) = 0: the hypothesis fails and nothing is claimed | holds | none |
| PI.6/family-pair-stratification | R = ∅; R smooth with R ∩ D_x = ∅ | P = ∅ (plain Ehresmann); P = R̃ × Λ, a single stratum | holds | none |
| PI.7/degree-four-del-pezzo-model | d = 4; d = 3; the diagonal pencil | h⁰(−K) = 1 + 1·2·4/2 = 5 and h⁰(−2K) = 1 + 2·3·4/2 = 13 < 15 = h⁰(ℙ⁴, O(2)); cubic: 1 + 2·3·3/2 = 10 = h⁰(ℙ³, O(2)), so no quadric; Σx_i² = Σa_i x_i² = 0 with distinct a_i: the gradients are dependent only when at most one coordinate is nonzero, which forces x = 0, so the surface is smooth | holds | wording of step 3 |
| PI.9/enriques-w1-square | ℝℙ² ⊔ ℝℙ²; one ℝℙ²; two Klein bottles; S(ℝ) = ∅ | 1 + 1 = 0, allowed; 1 ≠ 0, excluded; χ = 0 for both, so w₁² = 0 although w₁ ≠ 0; empty | holds | E25 |
| PI.9/enriques-one-half | one half nonempty, deg([α̃]₁ ∪ w₁) = 1 | Θ contains an odd number of odd-χ components while the total is even, so some Σ ∌ Θ has odd χ; deg(a ∪ w₁) = 1 + χ(Σ) ≡ 0 mod 2 | holds | none |
| PI.9/real-puiseux-field | X² − t; X³ − t; −t; n·t | roots ±t^{1/2}; t^{1/3} ∈ K, while t^{1/3}ζ₃^{±1} ∉ K; leading coefficient −1, so −t is not a square; 1 − nt has leading coefficient 1 > 0, so n·t < 1 for every n | holds | none |
| PI.0/amer-brumer (every field) | char 2: φ = ψ = x² + xy + y² over 𝔽₂; char 0: φ = x², ψ = y² over ℝ | values 1, 1, 1 at (1,0), (0,1), (1,1), so no common zero, and (1 + t)(x² + xy + y²) is anisotropic over 𝔽₂(t) because 𝔽₄(t) is a field; x² + ty² is anisotropic over ℝ(t) since −t is not a square, matching the absence of a common zero | holds | char-2 Check |
| PI.0/albert-isotropy normal form | ⟨1,1,1,−1,−1,−1⟩ over ℝ | signed discriminant −(1·(−1)³) = 1; e = −1, a = b = c = d = −1; eφ = ⟨−1,−1,−1,1,1,1⟩ = ⟨a, b, −ab, −c, −d, cd⟩; (−1,−1) ⊗ (−1,−1) ≅ M₄(ℝ), so isotropic, as φ is indefinite | holds | scalar renamed e |
| PI.0/elman-lam-c2-bound | F = ℝ; F = ℝ(x, y) | u(ℂ) = 1 ≤ 2, so u(ℝ) ≤ 2 (indeed 0, since W(ℝ) = ℤ) and I²ℝ = 4ℤ is torsion-free; u(ℂ(x, y)) = 4 gives u(F) ∈ {0, 1, 2, 4, 6} | consistent | u < 4 branch proved |
| PI.0/springer-complete-dvr Check | ⟨1, t⟩ and ⟨1, 1⟩ over ℂ((t)) | residue forms ⟨1⟩, ⟨1⟩ are anisotropic, so ⟨1, t⟩ is anisotropic; 1 + i² = 0, so ⟨1, 1⟩ is isotropic | holds | Check rewritten |
| PI.1/unramified-locus | α ∈ Br(S); (x, y) on 𝔸² | U_α = S, empty complement; the complement is the two axes | holds | "curve or empty" |
| PI.1/point-removal-extension (Σ open) | S², a point; T², a point; ℝ² ⊂ ℝℙ², a point | 0 → 0; 𝔽₂² → 𝔽₂², an isomorphism; 0 → 𝔽₂, injective but not surjective | holds | generalised, Check added |
| PI.2/de-jong-period-index | α = 0 on ℙ²_ℂ; (x, y) over ℚ̄ | ind = 1; per = ind = 2 | holds | moved to PI.2 |
| PI.2/real-closed-norm-bound | Albert's class (x, x) + (y, xy) over ℝ(x, y) (B19 line 85) | per = 2, ind = 4 = 2·per | holds | moved; smooth model cited |
| PI.4/brauer-cover-hypotheses (Ψ clopen in U(ℝ)) | S(ℝ) = ∅; ℙ²_ℝ with R a line and Ψ = U(ℝ) ≅ ℝ² | Ψ = ∅ and (i)–(iii) hold; Ψ is clopen in U(ℝ) but not closed in ℝℙ²; cl_R(R) generates H¹(ℝℙ²) = 𝔽₂ and R(ℝ) misses Ψ | holds | generalised |
| PI.4/uniform-pushforward-adjustment | t = 0; t = 1 | θ = θ₁ + 2μ + 2ν; θ = θ₁ + 2μ + 2φ + 2ν, with [η]₁\|_Ψ = cl_R(φ)\|_Ψ | holds | λ := φ |
| PI.5/curve-bearing-parameters | ℙ²_ℝ, A = O(1), l = 2, R = {z = 0}; N = O versus N = O(−1) | L = O(2) ⊗ O(−1) = O(1) and L ⊗ N = O(1), both very ample, with H¹(O(2)) = H¹(O(1)) = 0, and c = x² + y² + z² meets R in [1 : ±i : 0]; with N = O(−1), L = O is not very ample | holds for N = O | example fixed |
| PI.6/branch-conditions-blowup (torus) | a, b, c with c = a + b | a + b + (a + b) = 0; μ*(a + b + c) + 2Σeᵢ = 0; H¹(T² # 3ℝℙ²) = 𝔽₂⁵, spanned by μ*a = ã + e_ab + e_ac, μ*b and the three eᵢ; two loops alone: a + b ≠ 0 | holds | Check replaced |
| PI.6/kummer-lift-transport | R = ∅ | the pair is (T, ∅) and plain equivariant Ehresmann suffices | holds | hypotheses from PI.6/family-pair-stratification |
| PI.6/vanishing-variation | h²(O_S) = 0 | the vanishing part is all of H²(T, O_T) | holds | inputs owned here |
| PI.6/degree-two-splitting-uniform | S(ℝ) = ∅; t = 0 with 4 \| n and Ψ = Θ(α); U = S | a degree-2 splitting cover; no φ correction; principalization of the unit ideal is the identity | holds | principalization replaces SNC compactification |
| PI.7/real-closure-pointwise-triviality | (−1, −1) | α_x = (−1, −1) ≠ 0 at every real point; Br(R₀) = Br(K) = ℤ/2 generated by (−1, −1), so the images are nonzero: the hypothesis fails and so does the conclusion | consistent | R₀ added |
| PI.9/real-enriques-criterion | (ii) versus "nonorientable and both halves nonempty" | an odd count is impossible (enriques-w1-square row), so (ii) reduces to the second form | holds | Check, E25 |
| PI.9/enriques-complex-brauer | — | Br(S_ℂ) = H³(S(ℂ), ℤ)_tors ≅ H₁ = ℤ/2; cor(res α) = 2α and 2·res α = 0, so 4α = 0 | holds | suppliers repointed |
