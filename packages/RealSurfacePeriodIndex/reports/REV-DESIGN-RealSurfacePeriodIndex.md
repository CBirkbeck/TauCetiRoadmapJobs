<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/412#issuecomment-6368318972 -->
Review (claude) of 875bca4

Verdict: needs changes

1. **F01** (P1) Gap G1 is unowned and keeps three targets of unknown truth

   **Location.** `plan.json` gap `RealSurfacePeriodIndex/G1`; README:3104, quoting "The general statements remain open." Also the targets PI.4/obstruction-vanishing-general (README:1314–1333), PI.4/pushforward-adjustment-general (1337–1356) and PI.6/degree-two-splitting-general (1990–2008).

   **Claim.** The general forms of Propositions 4.4, 4.5 and 6.6 are targets, and G1 is a declared supplier gap.

   **Witness.** Supplier `none`, and no proof is known (README:1324). B19 line 856–861 gives [ζ]₁ = [α̃]₁ + [α̃]₀[e]₁, which equals [e]₁ only when [α̃]₀ = 1 on Ψ.

   **Repair.** Delete the three general targets and gap G1 from both files. Under scope, state in one clause that Propositions 4.4, 4.5 and 6.6 are planned in the uniform-evaluation form, the only one the induction uses. Keep E3 among the source issues. Test: the case 4 | n (t = 0, Ψ = Θ(α)) stays covered by PI.6/degree-two-splitting-uniform.

2. **F02** (P1) Gap G2 (de Jong's inputs) is unowned and compound

   **Location.** `plan.json` gap `RealSurfacePeriodIndex/G2`; README:3105 and PI.1/de-jong-period-index (README:655–660), quoting "Steps 1–2 are cited inputs (recorded as a gap)."

   **Claim.** Changing the algebraically closed base field preserves the index, and de Jong 2004 §7 reduces to unramified classes. Both are treated as supplied.

   **Witness.** Supplier `none`. No roadmap on main, at the 330 open heads or among the board's packages states either input (`roadmaps grep` finds only bibliography entries). The `needs` bundles two independent theorems.

   **Repair.** Make the two inputs targets of PI.1, each with exact hypotheses: (a) for algebraically closed k ⊂ K of characteristic 0 and S/k smooth projective, ind(α_{K(S)}) = ind(α); (b) de Jong's reduction, keeping period and index. If a supplier is preferred instead, declare two gaps naming it. Test: PI.1/real-closed-norm-bound then cites (a) and (b) separately.

3. **F03** (P1) Gap G3 is unowned; the verification belongs here

   **Location.** `plan.json` gap `RealSurfacePeriodIndex/G3`; README:3106 and PI.6/kummer-lift-transport (README:1927), quoting "verifying these for the family is the recorded gap RealSurfacePeriodIndex/G3".

   **Claim.** Transporting the pair (𝒯, p⁻¹R) is an unowned external input.

   **Witness.** Supplier `none`. `AlgebraicTopologyPartII:AT2.16/stratified-pair-transport` exists (job #275), and its gap G13 leaves verifying the hypotheses for this family to the consumer. The `needs` is an either/or of two routes.

   **Repair.** Add a PI.6 target stating, for the family 𝒯 → B near s, the invariant Whitney stratification (fixed exceptional curves over Sing R, moving ℙ¹ fibres over R ∩ D) and the control data that AT2.16 requires. Then declare one gap, supplier AlgebraicTopologyPartII, section AT2.16/stratified-pair-transport. Drop the alternative route from the `needs`, or make it a separate gap.

4. **F04** (P1) Gap G4 is unowned and points to the wrong supplier gap

   **Location.** `plan.json` gap `RealSurfacePeriodIndex/G4`; README:3107, quoting "that packet records the exact signed contract as its own gap (extraction gap G10)".

   **Claim.** The sign of the chase in (4.3)–(4.5) is an inherited gap of the supplier, recorded there as G10.

   **Witness.** Supplier `none`. In `packages/AlgebraicTopologyPartII/design/plan.json`, G10 is "Picard-to-ordinary-cohomology specialization" (AT2.13/near-top-omega). The gap on AT2.16/double-cover-diagram is G14, "Common-lift cochain chase and sign".

   **Repair.** Declare the gap with supplier AlgebraicTopologyPartII, section AT2.16/double-cover-diagram, and a `needs` that names the identity g(δ|S₀) + ζ⌣ω = g(η₀⌣ω) with its plus sign and the indeterminacy (AT2's G14). Remove "packet" and "extraction gap" wording.

5. **F05** (P1) Gap G5 is unowned, compound, and wrong about availability

   **Location.** `plan.json` gap `RealSurfacePeriodIndex/G5`; README:3108, quoting "Their sources are not freely available; a formaliser must acquire and plan them."

   **Claim.** Bröcker's theorem, Mangolte–van Hamel Theorem 4.4 and Colliot-Thélène–Parimala Proposition 3.1.2 have no owner and cannot be read.

   **Witness.** Supplier `none`. The three statements are already targets here (PI.6/brocker-sign-input, PI.9/enriques-picard-image, PI.9/prescribed-evaluation-class). MVH98 is on arXiv (alg-geom/9606007); Theorem 4.4 is MVH98 line 538–540.

   **Repair.** Delete G5. Keep the three targets owned here, each with its locator. For PI.9/enriques-picard-image, cite MVH98 Theorem 4.4 and Proposition 4.2 (manifest entry added) and outline the proof given there. Mark BRO80 and CTP90 as uncertified locators (the manifest now records them).

6. **F06** (P1) Gap G6 is unowned and compound; the del Pezzo model has no target

   **Location.** `plan.json` gap `RealSurfacePeriodIndex/G6`; README:3109; PI.7/del-pezzo-point (README:2300), quoting "through its anticanonical embedding, a smooth complete intersection of two quadrics in ℙ⁴_F (cited classical input)".

   **Claim.** Albert's theorem, Elman–Lam's bound for u(F(√−1)) ≤ 4 and the degree-4 del Pezzo model are supplied.

   **Witness.** Supplier `none`; the `needs` bundles three results. Albert and Elman–Lam are already targets here. No roadmap on main or at an open head states the degree-4 del Pezzo model (`roadmaps grep "intersection of two quadrics"`: no match).

   **Repair.** Delete G6. Keep the two PI.0 targets owned here with locators; BEC05 §3 p. 3 covers the case u(F(√−1)) = 4 (BEC05 line 102–104). Add a PI.7 target "a degree-4 del Pezzo surface over a field is a smooth complete intersection of two quadrics in ℙ⁴", or restate Theorem 0.13 for such intersections and make the identification a separate target.

7. **F07** (P1) HodgeStructuresPartII is cited as a supplier but exists nowhere

   **Location.** README:81–83 (ownership) and the prerequisites of PI.2/dense-splitting-hypersurfaces (README:852), PI.3/complex-pushforward-iso, PI.5/nl-codimension-bound, PI.6/vanishing-variation (1913) and PI.6/degree-two-splitting-uniform (1982). There are 16 slugs, among them `HodgeStructuresPartII:H.8/voisin-kernel-cone`.

   **Claim.** Voisin's kernel cone, Green's real open cone, integral weak Lefschetz, Andreotti–Frankel, Griffiths' formula and the Kodaira–Spencer factorisation are supplied by HodgeStructuresPartII H.8.

   **Witness.** Not on main, not at any of the 330 open heads (other heads only mention it as planned), not in the board-packages index, not among the 662 board job issues, and not in ORDER.txt.

   **Repair.** Own these inputs here, as targets of a new layer before PI.2, with exact hypotheses. Alternatively, name an existing owner and declare one gap per result, with supplier and section. The core of PI.2, PI.5 and PI.6 depends on them. Test: PI.2/dense-splitting-hypersurfaces then cites only targets of this roadmap or declared gaps.

8. **F08** (P1) SemisimpleAlgebrasPartII is cited as a supplier but exists nowhere

   **Location.** README:84–85 and 9 slugs: `SA.0/class-index`, `class-index-attained` (2615), `index-basechange-divides`, `index-divides-degree-index`, `index-divides-splitting-degree`, `SA.1/period-divides-index`, `same-prime-divisors`, `corestriction-restriction-degree`, `brauer-corestriction`.

   **Claim.** The basic facts about period and index come from SemisimpleAlgebrasPartII.

   **Witness.** `roadmaps grep SemisimpleAlgebrasPartII`: no match on main or at any open head, and there is no board job or package. The Tau Ceti pin has `TauCeti.Algebra.index` (Algebra/CentralSimple/Index.lean:99) and `exists_isSplittingField_finrank_eq_index` (:255).

   **Repair.** Main's SemisimpleAlgebras Layer 6 defines the index only through maximal subfields. Cite the two pinned declarations for the index and for the existence of a splitting field of degree equal to the index. Own the rest here, in a PI.1 subsection: per | ind with the same prime divisors, ind | [L:K]·ind(α_L), ind divides the degree of every splitting field, and cor∘res = [L:K] on Br. Alternatively, declare gaps naming an existing supplier.

9. **F09** (P1) Supplier drift: atlas stage labels do not match the cited roadmaps

   **Location.** "Dependencies on other roadmaps" (README:3079–3089) and the prerequisites throughout. Example (3089): "`SchemeAndStackFoundations:SF.6`: The finite-coefficient comparison H^i_ét(X, M) ≅ H^i_G(X(ℂ), M) for real varieties".

   **Claim.** The cited sections supply the listed content.

   **Witness.** SchemeAndStackFoundations on main has Layers 0–5 only, so there is no SF.6. In MotivesAndAlgebraicCycles (#1313), "Layer 2 (MC.2)" is classical realizations; the Borel–Haefliger maps are §7.6b. AlgebraicModuli (#853) §9.1 is marked ideals, so there is no R09.1.

   **Repair.** The remaining mismatches, cited label against what the roadmap actually has:

   - "SF.1" is cited for content in §4.9.
   - MotivesAndAlgebraicCycles has no "MC.7/tate-and-hodge-known-cases"; real Lefschetz (1,1) is §7.8. It states neither Benoist's Lemma 2.1 nor Kahn's cl_R(K) = w₁.
   - "R09.7/snc-compactification" does not exist; SNC compactification is AlgebraicModuli §9.5, consumed from ResolutionOfSingularitiesCharacteristicZero §6.2.
   - DeformationAndDerivedPatchingAlgebra has no "R03.3"; it defers Serre's conditions to SchemeAndStackFoundations §0.17.
   - In InverseGalois, "IG.3" covers braid orbits; the Artin comparison is ComplexComparisonPartII §§C6.0–C6.6.
   - In EnriquesSurfacesAndIntegralNonexistence (#139), `IsEnriques` is WeilConjectures WC.7, and there is no "E3/etale-canonical-is-k3".
   - Some items are only requested and are missing from their suppliers: the ramification-index residue formula (PF.6; README:1150), q = p_g = 0 and H³ torsion (E0; README:2710), and the Gersten step (SF.2; README:3086).

   Repoint each citation to the section that states it, at the earliest owner:

   - `ample_serre_vanishing`: SchemeAndStackFoundations §2.6.
   - Serre's criterion: SchemeAndStackFoundations §0.17 and §4.13.
   - `sncCompactification`: ResolutionOfSingularitiesCharacteristicZero §6.2; for smooth models of function fields (PI.1/real-closed-norm-bound, PI.8/unramified-index-doubling), `resolution_field` §7.8.
   - `artinComparison`: ComplexComparisonPartII §C6.
   - Borel–Haefliger maps and real Lefschetz (1,1): MotivesAndAlgebraicCycles §7.6b and §7.8.
   - `IsEnriques`: WeilConjectures WC.7.
   - Pic^τ and invariants: EnriquesSurfacesAndIntegralNonexistence §0.2 and §0.3.

   Every item the cited roadmap does not state becomes a declared gap with a named supplier and section, or a target here. This covers the real étale–equivariant comparison and Kummer sequences, Benoist's Lemma 2.1, the real topological Brauer sequence, Kahn's cl_R(K) = w₁, the residue formula, the Enriques invariants in characteristic 0 and the Gersten step.

10. **F10** (P2) Unbuilt board-package suppliers are used without declared gaps

   **Location.** "Builds on" lines (for example README:558, 887, 1095), with 28 `AlgebraicTopologyPartII:AT2.*` slugs, 3 `PurityForFlatCohomology:PF.6/*`, 4 `QuadraticFormInvariantsPartII:Q2.5*` and 4 `EnriquesSurfacesAndIntegralNonexistence:*`.

   **Claim.** These are supplied roadmap sections.

   **Witness.** All 28 AT2 slugs exist in AlgebraicTopologyPartII's accepted design (job #275), and the PF.6 and Q2.5 slugs in jobs #470 and #469. None of these is in ORDER.txt or on main. Enriques is board package #139.

   **Repair.** The resolver's lead for "QuadraticFormInvariantsPartII Q2.5" (README:76) is this case: the resolver reads only main and open heads. For each of the four suppliers, declare gaps (slug, supplier, section, one-sentence `needs`) for the targets consumed, and list them in the README's gaps. Keep the citations, which resolve to real unbuilt targets. Also choose one owner for equivariant Betti cohomology and Borel–Haefliger classes: AlgebraicTopologyPartII AT2.6–AT2.10 and MotivesAndAlgebraicCycles §§7.6a–7.6b both construct them, and the design cites both.

11. **F11** (P1) PI.9/enriques-odd-euler is vacuous and its acceptance example is false

   **Location.** README:2843, quoting "If S(ℝ) is nonorientable, exactly one half is nonempty and deg(w₁²) ≠ 0 … then there is α ∈ Br(S) of period 2 and index 4". Acceptance at README:2852: "A real Enriques surface with real locus a single ℝℙ² in one half is an example."

   **Claim.** This case occurs and yields index-4 classes.

   **Witness.** The roadmap's own targets give w₁ = cl_R(K_S) (2772) and im cl_R = w₁^⊥ (2750), so deg w₁² = 0. Lefschetz on the K3 cover gives χ(S(ℝ)) = 24 − r₋(c) − r₋(cτ), with that sum ≡ 12: χ is even, while χ(ℝℙ²) = 1.

   **Repair.** Delete PI.9/enriques-odd-euler and its acceptance. Add the target "for every real Enriques surface with S(ℝ) ≠ ∅, deg(w₁²) = 0, equivalently S(ℝ) has an even number of components of odd Euler characteristic" (proof: K_S ∈ Pic, MVH98 Theorem 4.4). Keep PI.9/real-enriques-criterion as printed, with a Check that it is equivalent to "S(ℝ) nonorientable and both halves nonempty". Test: ℝℙ² ⊔ ℝℙ² has χ = 2, which is allowed.

12. **F12** (P2) False Check in PI.6/branch-conditions-blowup (torus)

   **Location.** README:1758, quoting "For Ξ a torus with R(ℝ) = ∅, two loops meeting once give one double point; one blow-up makes Ξ′ a torus # ℝℙ² with an embedded pair of circles."

   **Claim.** This configuration satisfies Assumption 6.1.

   **Witness.** Condition (ii) needs ι_*[𝒮] = cl_R(R) = 0, but a + b ≠ 0 in H¹(T², 𝔽₂), and after the blow-up μ*(a+b) + 2e ≠ 0. B19 Lemma 6.3 adds loops for exactly this reason (line 1131–1137).

   **Repair.** Replace with: loops a, b and c, with c in class a + b, pairwise meeting once. That gives three double points and three blow-ups, after which the embedding has class 0 and generates H¹ together with the exceptional circles. Check: a + b + (a + b) = 0.

13. **F13** (P2) PI.9/real-puiseux-field re-plans main's Puiseux field and misstates a library fact

   **Location.** README:2912–2931, quoting "Define K inside Mathlib's HahnSeries ℚ ℝ as the union over n of the image of the Laurent series in t^{1/n}". Step 2 (2919) relies on "Mathlib's isRealClosed from an algebraically closed quadratic extension".

   **Claim.** The carrier `RealSurface.RealPuiseux` and its level embeddings are new here, and Mathlib provides the real-closedness criterion.

   **Witness.** Main's FormalLaurentPuiseux has `puiseuxField K : Subfield (HahnSeries ℚ K)`, `ramifiedEmbedding` and `puiseuxField_isAlgClosed` (Suggested.lean:71, :45, :250). The pinned IsRealClosed/Basic.lean has no such criterion, and RealAlgebraicGeometry Layer 1 proves only the converse.

   **Repair.** Use `puiseuxField ℝ` and `ramifiedEmbedding` from FormalLaurentPuiseux and cite `puiseuxField_isAlgClosed` for ℂ. Keep only the leading-coefficient order and IsRealClosed here, proved from its three defining fields (squares, odd-degree roots via conjugation, semireal). Delete `RealSurface.RealPuiseux` and `ofLaurent`.

14. **F14** (P3) PI.7/real-closure-pointwise-triviality: the field K is not a real closure

   **Location.** README:2172, quoting "α_K = 0 (K is a real closure of ℝ(U) at the induced ordering)".

   **Claim.** The iterated Puiseux field is a real closure of ℝ(U).

   **Witness.** PI.0/real-closure-at-ordering requires R to be algebraic over F (README:208). The iterated Puiseux field has infinite transcendence degree over ℝ(U).

   **Repair.** Let R₀ be the relative algebraic closure of ℝ(U) in K. It is real closed and algebraic, hence a real closure at the induced ordering. Then α_{R₀} = 0, so α_K = 0. Test: for α = (−1,−1), the class is nonzero over both R₀ and K, which is consistent.

15. **F15** (P3) Generality narrower than the sources

   **Location.** README:1103 ("Ψ ⊂ U(ℝ) a subset open and closed in S(ℝ)") and README:466 ("char F ≠ 2 (EKM proves it in all characteristics)").

   **Claim.** These are the sources' hypotheses.

   **Witness.** In B19 line 670–671, Ψ only needs to be open and closed in U(ℝ). EKM Theorem 17.14 (EKM line 3877–3879, p. 74) has no characteristic hypothesis.

   **Repair.** State Assumption 4.1 with Ψ open and closed in U(ℝ). The S(ℝ)-clopen case of PI.6 remains a special case. State Amer–Brumer for all fields, with char ≠ 2 as a Check.

16. **F16** (P3) PI.0/ci-brauer-vanishing restates Tsen's theorem on main

   **Location.** README:365, quoting "In particular the function field of an integral curve over an algebraically closed field … has trivial Brauer group."

   **Claim.** This is new here.

   **Witness.** SchemeAndStackFoundations §2.16 on main has `tsen_theorem`: such a field is C₁ and Br(K) = 0. Witt's proof already cites it (README:419).

   **Repair.** Cite `tsen_theorem` (SchemeAndStackFoundations §2.16) for curve function fields. Keep only the general statement "C₁ ⇒ Br = 0" if a consumer needs it; none does beyond curves.

17. **F17** (P3) No sources manifest

   **Location.** `packages/RealSurfacePeriodIndex/sources.toml` was absent; sources appear only in `plan.json` "sources".

   **Claim.** The cited works are recorded.

   **Witness.** The brief requires a `tauceti-roadmap-sources/v1` manifest. The one the service created here has B19 from arXiv v2, whose numbering matches the published version I read (sha 8dfc0f…, as in the plan).

   **Repair.** Complete the manifest for every work cited (EKM, BEC05, BW20 and MVH98 are certified; the other cited works are uncertified or listed as missing). Add the published-version locator to B19 as a `version_note`, without a second key.

18. **F18** (P3) Shape, house style and process narrative

   **Location.** For example README:135 ("planet: **Space of orderings**"), 102 ("research/blueprint/suggested/RealSurfacePeriodIndex.lean"), 3114 ("first recorded by the atlas extraction PAPER-BENOIST-19"), 3266 ("read in full on 2026-10-19"), 3267 ("maintainer-cleared copy (atlas library)").

   **Claim.** The README follows TauCetiRoadmap form.

   **Witness.** Field lists with a Lean name on every Check; "Suggested home" lines, a Routing table and "Structure" proposals; no Scope, supplier contracts, Examples, Dependencies or *Needs:* lines. The gate placed it after MotivesAndAlgebraicCycles (order line 65) and missed ShimuraData (line 90, README:1913).

   **Repair.** The Routing table is README:3140–3256 and the "Structure" proposals 3258–3261; the "Dependencies" list omits seven suppliers. At the package stage, rewrite in roadmap form with a *Needs:* line per target, every supplier listed under its contract, and no atlas, packet, extraction, job or date wording. Point the VHS carrier at an owner that precedes this roadmap's slot, or list ShimuraData so that the gate places the roadmap after it.

19. **F19** (P3) Imprecise statements and Checks

   **Location and witness.**

   - README:566 says the complement of U_α "is a curve". For α ∈ Br(S) the complement is empty.
   - README:450 says "⟨1, t⟩ … isotropic over ℂ", which is meaningless.
   - README:493 uses d both as the scaling factor and as a slot.
   - README:1300 uses λ without defining it.
   - README:1393 calls l = 2 "admissible", but Assumption 5.1 depends on N and R. With the README's own N = O(−1) and R a line, L = O is not very ample.
   - README:676–685 needs a smooth projective model, which is not cited.

   **Repair.** Say "contained in a curve (empty when α is unramified)". Replace the ℂ example with "⟨1,1⟩ over ℂ is isotropic, and its residue forms over ℂ((t)) are ⟨1⟩, ⟨1⟩". Rename the scalar e. Define λ := φ from PI.4/uniform-first-component. Specify N = O, R a line (then L = O(1) and L⊗N = O(1) are very ample). Cite `resolution_field` (ResolutionOfSingularitiesCharacteristicZero §7.8).

Independent review of `packages/RealSurfacePeriodIndex/design/README.md` (3283 lines, read in full), `packages/RealSurfacePeriodIndex/design/plan.json` (98 nodes, 6 gaps, 22 source issues) and the sources manifest. The design had no `sources.toml`; the sources service created `packages/RealSurfacePeriodIndex/sources.toml` while I fetched texts (entries B19, MVH98, BW20, EKM, BEC05 certified; SPR55, CTP90, DK96, BRO80, ARA75, EL73, BCR recorded uncertified). Texts with no legal copy are listed in the job's scratch `needs-references.toml` (DJ04, CT95, WITT37, VA13, PFI82, LAM05). No previous review exists. Nineteen findings: ten P1, three P2, six P3. The mathematics of Benoist's argument is restated carefully and most of it checks out (see the adversarial table). What blocks it is the supply side: all six declared gaps are unowned, two cited supplier roadmaps exist nowhere, most supplier labels are atlas stage ids that do not match the cited roadmaps, and one Enriques target is vacuous.

## Adversarial mathematics pass

Every row records the instance and the values computed. "Holds" means that both sides agree on the instance.

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| PI.0/ordering-space | ℝ; ℂ; ℚ(√2); ΣF² in ℝ(t) | 1 point; ∅ (−1=i²); 2 points; t, −t ∉ ΣF² | holds | — |
| PI.0/harrison-compact | ℂ; ℚ(√2); ℝ(t) | ∅; 2-point discrete; infinite compact | holds | — |
| PI.0/real-closure-at-ordering | (ℚ, ℝ_alg); ℂ | ℚ≥0 ↦ squares; ℂ not semireal | holds | — |
| PI.0/signature-at-ordering | ⟨1,1⟩; H; ⟨1,−t⟩ | 2; 0; 0 (t>0), 2 (t<0) | holds | — |
| PI.0/brauer-nonvanishing-locus | M_d vs M_{d/2}(ℍ); (−1,t) | d(d+1)/2−d(d−1)/2 = d; (2m²−m)−(2m²+m) = −d; T = 2⟨1,−1,t,t⟩: +2 / −2 | holds | — |
| PI.0/elman-lam-u | ℂ; ℝ; ℝ(t) | 1; 0; ⟨1,−(1+t²)⟩ aniso, sig 0 → 2 | holds | — |
| PI.0/ci-brauer-vanishing | quaternion D over C₁ field | reduced norm: degree 2 in 4 > 2 variables has a zero | holds | R16 |
| PI.0/curve-u-bound | ⟨1,1,−(1+t²)⟩ | 1+t² = 1²+t² ⇒ isotropic | holds | — |
| PI.0/witt-real-curve | (−1,t); (−1,1+t²); x²+y²=−1 | ≠0 at t<0; N(1+ti) ⇒ 0; nonreal ⇒ Br=0 | holds | — |
| PI.0/springer-complete-dvr | ⟨1,y₁,−y₂,−y₁y₂⟩ | residues ⟨1,y₁⟩, ⟨−1,−y₁⟩ → ⟨1⟩, ⟨1⟩ anisotropic | holds | R19 |
| PI.0/amer-brumer | ⟨1,1⟩, ⟨1,−1⟩ over ℝ | ⟨1+t,1−t⟩: −(1+t)/(1−t) not a square | holds | R15 |
| PI.0/albert-isotropy | a=b=c=d=−1 | ⟨−1,−1,−1,1,1,1⟩ isotropic; ℍ⊗ℍ = M₄(ℝ); e = −x₁x₂x₃ gives det −a²b² | holds | R19 |
| PI.0/elman-lam-c2-bound | ℝ; ℂ(x); ℝ(x,y) | u=0; 2; u(ℂ(x,y)) = 4 | holds (cited) | R06 |
| PI.0/pfister-brauer-criterion | K nonreal | reduces to ind ≤ 2 ⇒ u ≤ 4; c(3H) = 0 | holds | — |
| PI.1/unramified-locus | (x,y) on 𝔸²; α ∈ Br(S) | residues y, x ≠ 0 ⇒ U = {xy≠0}; U_{2α} = 𝔸²; complement ∅ | wording | R19 |
| PI.1/real-evaluation-locus | (−1,x); period 4 | Θ = {x<0}; μ_n→μ₂ is x↦x^{n/2} ⇒ [·]₀ = (n/2 mod 2)1_Θ = 0 | holds | — |
| PI.1/de-jong-period-index | (x,y) over ℂ(x,y) | norm form ⟨1,−x,−y,xy⟩ aniso ⇒ ind 2 = per | holds | R02 |
| PI.1/real-closed-norm-bound | (x,x)+(y,xy) | = (−1,xy)+(x,y); Albert form ⟨−1,xy,xy,−x,−y,xy⟩ aniso (Springer twice) ⇒ ind 4 | holds | R19 |
| PI.1/point-removal-extension | S², T² minus point | 0→0; 𝔽₂²→𝔽₂²; H¹(D,D∖pt)=0 | holds | — |
| PI.2/complex-hypersurface-family | ℙ², O(1); quintic | 2(−3)−2·1 = −8; 5 = 5 excluded; O(2): 20 > 10 | holds | — |
| PI.2/complex-obstruction-vanishes | weak Lefschetz | H³(T)→H⁵(X) iso (3 > dim T); dn·c₁ kills n-torsion | holds | — |
| PI.2/compatible-complex-lift | n = 1; α = 0 | β−γ ∈ ker p_*; p_*β ≡ dnα̃ ≡ 0 | holds | — |
| PI.2/dense-splitting-hypersurfaces | open cone vs lattice coset | open cone meets every coset of a full lattice | holds | R07 |
| PI.2/complex-unramified-period-index | Enriques/ℂ | gcd(dn,(d+1)n) = n ⇒ ind 2 | holds | — |
| PI.3/branch-cover-finite-model | r=x, s=y; b=1 | z²=xy (A₁); S⊔S; Mathlib ω² = a+bω so QuadraticAlgebra O b 0, discr 4b | holds | — |
| PI.3/incidence-double-cover | crossing charts | y=xa², z=xa; x=yc², z=yc; c=a⁻¹; over Sing R: w=0 | holds | — |
| PI.3/incidence-local-resolution | crossing | monomials r^a x^b, 0≤b≤2a ⇒ k[r,rx,rx²] ≅ k[r,z,s]/(z²−rs) | holds | — |
| PI.3/double-cover-strata | line + transverse conic | Sing Δ = 2 points ⇒ E = 2ℙ¹; length-2 fibre | holds | — |
| PI.3/complex-pushforward-iso | ℙ², D conic ⇒ T = ℙ¹×ℙ¹ | H²: ℤ²→ℤ onto; H⁴ ℤ≅ℤ | holds | — |
| PI.3/equivariant-pushforward-image | degree i, ℤ(i−1) | components need p odd ⇒ only [ξ]₁ | holds | — |
| PI.4/brauer-cover-hypotheses | S(ℝ)=∅; D(ℝ)∩Ψ≠∅ | vacuous; (i) fails | holds | R15 |
| PI.4/pullback-unramified | R curve, e = 2 | e·res = 2·res = 0 for period 2 | holds | R09 |
| PI.4/obstruction-cup-omega | T(ℝ)=∅ | τ⌣ω = m·cl(y+σy); p_*: 2m points ⇒ m=0 | holds | — |
| PI.4/uniform-first-component | t = 0, 1 | (a₀,a₁,a₂) ↦ (0, a₁+a₀[e]₁, Sq¹a₁+a₁[e]₁) ⇒ t[e]₁ (= B19 line 858) | holds | — |
| PI.4/uniform-obstruction-vanishing | S(ℝ)=∅ | Ψ=∅, τ=0 | holds | R04 |
| PI.4/primitive-picard-trace-correction | α = 0 | p_*b = 2η ⇒ 2(δ−η−p_*γ₀) = cl(p_*φ₀−θ₁); BW20 Prop 2.9 | holds | — |
| PI.4/curve-adjustment | [d]₁ = 0 | ν = 0 | holds | — |
| PI.4/uniform-pushforward-adjustment | algebra | 2δ+clθ₁−2(δ−clμ−t clλ−clν) = cl(θ₁+2μ+2tλ+2ν) | holds | R19 |
| PI.4/obstruction-vanishing-general | Ψ = Θ ⊔ Σ | needs cl_R(φ) restricted to Ψ = 1_Θ[e]₁ | unproved | R01 |
| PI.4/pushforward-adjustment-general | same | same | unproved | R01 |
| PI.5/curve-bearing-parameters | ℙ², l = 2, N = O(−1), R line | L = O not very ample | Check loose | R19 |
| PI.5/curve-lift | bundles | L²(R)(−C) = A^lN²(−R) = L⊗N; a₂c ∈ L²(R) | holds | — |
| PI.5/trace-zero-restriction | v = √a₁gw | z = rv/w ↦ √a₁rg | holds | — |
| PI.5/auxiliary-hypotheses | ℙ², line, O(−1) | O(−4); O(−1); H¹(ℙ¹,O(−1)) = 0 | holds | — |
| PI.5/normal-bundle-bound | C ⊂ X | T_{X/S} on C = O(2)L⁻¹ ≅ L; L(−C) = N(−R) | holds | — |
| PI.5/twisted-curve-vanishing | adjunction | K_X̄ = π*K_S⊗O(−2)⊗L, T̄ in the linear system of O(2)(R) ⇒ ω = p̄*(K_S L(R)) | holds | — |
| PI.5/nl-codimension-bound | rational S | coker ≤ 0 ⇒ onto; (5.7) index fixed | holds | — |
| PI.5/blowup-auxiliary-bundle | pushforwards | μ_*O(3F−E) = I_P; μ_*O(3E−F) = I_Q | holds | — |
| PI.6/squared-line-positivity | M = ℝ; rescaling by −1 | m⊗m > 0; signs swap | holds | — |
| PI.6/branch-locus-conditions | S²; T² | class 0, two discs; null circle fails (iii) | holds | — |
| PI.6/branch-conditions-stable | small isotopy | classes locally constant | holds | — |
| PI.6/branch-conditions-blowup | torus, loops a, b | ι_*[𝒮] = a+b ≠ 0 | Check false | R12 |
| PI.6/nash-approximation-input | circle in ℝℙ² | class in ℤ/2 algebraic (line or conic) | holds (BCR uncertified) | — |
| PI.6/brocker-sign-input | even degree on ℝℙ² | cl_R = deg mod 2 = 0 | holds (uncertified) | R05 |
| PI.6/signed-branch-section | order along R | −1+1+0 = 0; printed +1+1 = 2 | holds | — |
| PI.6/topology-to-cover-hypotheses | rv² = sw² | rs = r²t² ≥ 0 or r = 0 | holds | — |
| PI.6/vanishing-variation | ℙ¹×ℙ¹ → ℙ² | (f₁−f₂)·(f₁+f₂) = 0; rank 2−1 = 1 | holds | R07 |
| PI.6/kummer-lift-transport | R = ∅ | ordinary Ehresmann | holds | R03 |
| PI.6/degree-two-splitting-uniform | S(ℝ)=∅; t = 0 | Ψ=Ξ=∅; no correction | holds modulo gaps | R03, R07 |
| PI.6/degree-two-splitting-general | as above | unproved | — | R01 |
| PI.7/half-period-uniform-evaluation | n = 2, 4, 6 | t = 1, 0, 1 | holds | — |
| PI.7/period-induction-step | n = 2 | per(α_T) = 1; per(2α) = n/2 | holds | — |
| PI.7/arbitrary-period-sufficiency | n = 2, Θ = ∅ | ind ∣ 2·1 | holds | — |
| PI.7/no-real-points-period-index | x²+y²+z²=−1 | nonreal, cd 2 | holds | — |
| PI.7/zero-evaluation-period-index | (−1,1+x²) | = 0; ind = per = 1 | holds | — |
| PI.7/unramified-odd-or-vanishing | H¹ algebraic | subtract cl(θ) ⇒ [ξ]₁ = 0 | holds | — |
| PI.7/real-closure-pointwise-triviality | (−1,−1) | nonzero on both sides; K not algebraic | step false | R14 |
| PI.7/u-invariant-upper-bound | K₀ = ℝ(x) | K/K₀ not algebraic ⇒ E9 fix needed | holds | — |
| PI.7/sharp-anisotropic-form | 𝔸², w = x | w′²+1 = (x²+1)²/(4x²) ∈ m²; y_j ≡ 2(1+i)z_j; uncorrected det c(α+β+c) can vanish | holds | — |
| PI.7/u-invariant-equals-four | ℝ(x,y) | ≤ 4 and ≥ 4 | holds | — |
| PI.7/rank-five-isotropy | x²+y²+z²=−1 | 1+x²+y²+z² = 0 | holds | — |
| PI.7/del-pezzo-point | C×ℙ¹, C(ℝ)=∅ | q₁+tq₂ isotropic ⇒ common zero | holds | R06 |
| PI.8/finite-flat-open | n = 2 | V = S∖Δ; n−m_i odd ⇒ real point | holds | — |
| PI.8/alternating-double-cover | simple branch | sign (−1)^{Σ(e−1)} = (−1)^{m}; m = 1 | holds | — |
| PI.8/trace-quotient-lift-surface | α = 0 | η = ζ = 0 | holds | — |
| PI.8/corrected-pullback-lift | ψ∘π = p*Tr − n | ψ ≡ p*φ mod n; Tr(p*η−ψζ) = nη | holds | — |
| PI.8/circle-double-cover | n = 2 | Q(1) ≅ ℤ, x ↦ (x̄, 2x): coker ≅ ℤ/4 | holds | — |
| PI.8/circle-monodromy-correction | m = 2, 4 | m/2 mod 2 = 1, 0 | holds | — |
| PI.8/correcting-line-bundle | n = 2 | m = 1, 4∤1 contributes | holds | — |
| PI.8/quotient-component-algebraicity | Θ₀ = ∅ | vacuous | holds | — |
| PI.8/even-degree-splitting-obstruction | algebra | n(η−p_*γ) = cl(p_*φ); signs vanish mod 2 | holds | — |
| PI.8/unramified-index-doubling | Enriques, two halves | agrees with PI.9/enriques-two-halves | holds | R09 |
| PI.9/real-locus-image | ℙ²_ℝ; δ ∪ ω | image 𝔽₂⊕𝔽₂; ρ(δ∪ω) = (0,[δ]₁) ⇒ deg([δ]₁²) = 0 | holds | R11 |
| PI.9/real-enriques-halves | real point | in exactly one form | holds | R09 |
| PI.9/enriques-complex-brauer | H³ ≅ H₁ = ℤ/2 | cor∘res = 2 ⇒ 4-torsion | holds | — |
| PI.9/enriques-period-four | per 4 | res ≠ 0; ind ∣ 4 | holds | — |
| PI.9/enriques-picard-image | MVH98 Th. 4.4 | image = w₁^⊥ (read) | holds | R05 |
| PI.9/enriques-half-detector | S(ℝ)=∅ | 4 classes; caveat correct | holds | — |
| PI.9/enriques-orientable-case | spheres, tori | w₁ = 0 ⇒ onto | holds | — |
| PI.9/enriques-two-halves | no δ | (1,a₁) in image | holds | — |
| PI.9/enriques-odd-euler | any real Enriques | deg w₁² = χ mod 2 = 0 | vacuous | R11 |
| PI.9/enriques-even-euler | correction on Σ | 1+1 = 0 | holds | — |
| PI.9/real-enriques-criterion | clause (ii) | second clause never holds | true | R11 |
| PI.9/real-puiseux-field | t^{1/2}; n·t | (t^{1/2})² = t; n·t < 1 | holds | R13 |
| PI.9/sextic-k3-degeneration | t = 0 | z/(uv) gives the quadric; sextic ⇒ K = 0 | holds | — |
| PI.9/prescribed-evaluation-class | 4 components | Θ = 3 components | holds (uncertified) | R05 |
| PI.9/quaternion-sign-contradiction | norm bound over K | ind ∣ 2·2 | holds | — |
| PI.9/puiseux-counterexample | spheres | H¹ = 0, ind 4 | holds | — |

## Verified sound

- **Coverage.** I read all 3283 README lines and all 98 nodes (31 definitions or constructions with 4 Checks each, 124 Checks in total, and 67 theorems). Every node has at least one locator.
- **Principles.** There is no route-specific shortcut, no computational algorithm, no copied passage, no LaTeX, no `set_option` and no sorry'd data. The design has no `Suggested.lean`, so nothing was elaborated: this lane does not elaborate, and no `#check` comparison was possible. Steps 6 (Lean form) and 7 (padding probe) apply at the package stage. Headlines that the package can state at the pins are Theorems 0.3, 0.4, 0.10, 0.12 and 0.13 (the last as an intersection of two quadrics). Theorems 0.5, 0.6 and Proposition 0.7 need equivariant or semialgebraic cohomology, which no pinned library has.
- **Seeded sample.** The worker's sample listed field labels ("Source:", "Proof", …) instead of targets. I therefore verified that field on fifteen targets, against B19 at the published pages: Source of PI.3/incidence-double-cover (B19 line 537–558, E1 and E18 confirmed); Direct prerequisites of PI.4/uniform-obstruction-vanishing and PI.6/degree-two-splitting-uniform (R07, R09, R10); Acceptance of PI.1/real-closed-norm-bound (line 85–87, computed above); Hypotheses of PI.4/brauer-cover-hypotheses (line 676–685, R15); Construction of PI.7/sharp-anisotropic-form (line 1329–1338, E10 confirmed); Source of PI.9/enriques-picard-image (MVH98 line 538–540); Hypotheses of PI.5/auxiliary-hypotheses (line 972–974); Unit tests of PI.6/branch-conditions-blowup (R12); Proof of PI.4/uniform-first-component (line 856–861); Proof of PI.9/enriques-odd-euler (line 1786–1790, R11); Acceptance of PI.7/del-pezzo-point (line 154); Uses of PI.0/ordering-space (line 1313–1318); Uses of PI.5/curve-bearing-parameters (line 976–1045); Acceptance of PI.9/sextic-k3-degeneration (line 1824–1825). The statements of Theorems 0.3–0.13 match B19 line 43–147. EKM 17.14 (p. 74), 37.4, 37.5 (pp. 167–168) and 37.8 (p. 169) match, as do BEC05 §3 (p. 3) and BW20 Props 1.3, 2.8, 2.9, Thm 1.12 and Lemma 2.11.
- **Source issues.** I checked 17 of the design's 22 entries at their locators and agree with them: E1, E3–E5, E8–E10, E12–E15, E18, E20–E24. I did not check E2, E6, E7, E11 and E17.
- **Declarations opened at the pins.** Mathlib: `IsRealClosed` (FieldTheory/IsRealClosed/Basic.lean:48), `IsRealClosed.isSquare_neg_of_not_isSquare` (:76), `RingPreordering` (Algebra/Order/Ring/Ordering/Defs.lean:47), `RingPreordering.IsOrdering` (:193), `IsSemireal` (Algebra/Ring/Semireal/Defs.lean:38), `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'` (LinearAlgebra/QuadraticForm/IsometryEquiv.lean:177), `QuadraticForm.equivalent_signType_weighted_sum_squared` (…/Real.lean:77), `QuadraticAlgebra` (Algebra/QuadraticAlgebra/Defs.lean:38, multiplication at :194), `basis` (:378), `finrank_eq_two` (:396), `discr_def` (Discriminant.lean:43), `CliffordAlgebra.even` (Even.lean:54), `HenselianLocalRing` (Henselian.lean:108). Tau Ceti: `TauCeti.BrauerGroup.baseChange` (Algebra/BrauerGroup/BaseChange.lean:136), `TauCeti.Quaternion.brauerGroupMulEquiv` (Real.lean:102), `TauCeti.hyperbolicPlane` (LinearAlgebra/QuadraticForm/Hyperbolic.lean:68), `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing` (Division.lean:69), `QuadraticForm.not_anisotropic_baseChange` (LinearAlgebra/QuadraticForm/BaseChange.lean:312), `TauCeti.Algebra.index` (Algebra/CentralSimple/Index.lean:99). All exist as cited.
- **Citations resolved.** On main: QuadraticFormInvariants Layers 0, 1, 2, 4 and 5, SemisimpleAlgebras Layer 6, StableReduction Layer 4, AlgebraicTopology Stage 6, RealAlgebraicGeometry Layer 1 (`exists_realClosure` and preordering extension), and SchemeAndStackFoundations §§0.1, 2.2, 2.6, 2.8, 2.16, 2.20, 2.22, 4.9, 4.11, 4.13, 4.17, 5.4, 5.10 exist. Board designs: all AT2 (28), PF.6 (3) and Q2.5 (3) slugs exist. Open heads: MotivesAndAlgebraicCycles (#1313), AlgebraicModuli (#853), DeformationAndDerivedPatching (#1034), InverseGalois (#850), ShimuraData (#1038, §3.1 is the VHS carrier) and ResolutionOfSingularities (#1199) were read. Mismatches are reported in R07–R10.
- **Gate.** Output: "candidate: RealSurfacePeriodIndex is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCycles … depcheck: 27 roadmaps, 226 edges, 0 problem(s)". It shows no UPWARD or CYCLE line, but misses ShimuraData (R18).
- **Ownership.** I checked against open pull requests with `roadmaps grep`/`show` (330 heads and main); the brief's sibling list carries no checkout paths. PI.0 is legitimately owned here: QuadraticFormsRealFunctionFields does not exist.

## Not verifiable

- BCR (Theorem 12.4.11, Example 15.2.2, Example 7.1.4, §10.3, §4.1): paywalled, so the service recorded it uncertified. The design's "maintainer-cleared copy" is not available to this lane.
- DJ04 §7, CT95 (3.9) and 3.3.1, WITT37 Satz 22, PFI82 Prop. 9, LAM05 III.4.8, VA13: no legal copy found (listed in the job's `needs-references.toml`).
- SPR55, CTP90 Prop. 3.1.2, DK96 §1.3, BRO80 Satz a), b), ARA75 Hilfssatz 2, EL73: paywalled, recorded uncertified.
- B19 Lemma 7.5 stalks for 4 | n: checked only for n = 2 (ℤ/4, computed above).

## Source issues

- **Error** in B19 at Theorem 0.6 (ii), p. 65, and its proof, p. 107: the source says one nonempty half with an odd number of odd-Euler components gives index-4 classes, since w₁ ∉ im cl_R; it should be that this case never occurs: w₁ = cl_R(K_S) ∈ w₁^⊥ forces deg w₁² = 0; affects a stated result.
- **Error** in B19 at §3.1, p. 76: the source says T = {rv² = sw²} is a finite double cover of S; it should be proper and generically of degree 2, finite only over S₀, with ℙ¹ fibres over R ∩ D; affects the proof.
- **Misprint** in B19 at §3.1, p. 77: the source says the fixed singular points lie over Sing R where v vanishes; it should be where w vanishes; affects nothing.
- **Gap** in B19 at Proposition 4.2, proof, p. 80: the source says the remaining curves are exceptional divisors of T → T̄; it should be those and the ℙ¹ fibres over R ∩ D, treated by the same argument; affects the proof.
- **Gap** in B19 at Proposition 4.4, proof after (4.8), p. 84: the source says [ζ]₁ = [e]₁ on Ψ; it should be [α̃]₀·[e]₁, which equals [e]₁ only when α is nonzero on all of Ψ; affects a stated result.
- **Gap** in B19 at Proposition 4.5, proof, pp. 84–85: the source says β restricted to T_U is the mod-2 lift α̃ plus integral classes; it should be an integral class, for example from the trace sequence; affects the proof.
- **Gap** in B19 at Proposition 4.5, proof, p. 85: the source says Proposition 3.3 applies once the first component vanishes on Ψ; it should be after subtracting the curve classes given by Assumption 4.1 (ii); affects the proof.
- **Misprint** in B19 at Proposition 4.5, proof, p. 85: the source says [p_*ε]₁ vanishes in H¹(S(ℝ)); it should be in H¹(U(ℝ)), after restriction to Ψ; affects nothing.
- **Misprint** in B19 at (5.7), p. 88: the source says the normal-sequence boundary lands in H⁰(C, N_{C/T}); it should be H¹(C, N_{C/T}); affects nothing.
- **Error** in B19 at Lemma 6.4, proof, p. 92: the source says h₁ vanishes to order one along R, which makes t vanish doubly there; it should have a simple pole along R, so that the real zero locus is H(ℝ); affects the proof.
- **Misprint** in B19 at Lemma 6.5, proof, p. 92: the source says p(T(ℝ)) is disjoint from Θ; it should be disjoint from Ψ = S(ℝ) ∖ Ξ; affects nothing.
- **Gap** in B19 at Proposition 6.6, proof, pp. 94–95: the source says replacing T by T_x concludes; it should first check that the transported lift still induces α, by normalising it on T_U; affects the proof.
- **Misprint** in B19 at Proposition 6.7, p. 95: the source says a lift of (n/2)α is given for every n; it should be required only for even n; affects nothing.
- **Gap** in B19 at proof of Theorem 0.12, p. 95: the source says K is the union of finite extensions of K₀; it should be after adding a transcendence basis to K₀; affects the proof.
- **Gap** in B19 at proof of Theorem 0.12, p. 96: the source says two non-proportionality conditions make y₁, y₂ parameters; it should be a choice of w with w² + 1 ∈ m², since the determinant can vanish otherwise; affects the proof.
- **Misprint** in B19 at proof of Theorem 0.6, pp. 106–107: the source says the class δ with [δ]₀ = 0 is unique; it should be the unique nonzero such class; affects nothing.
- **Misprint** in B19 at proof of Proposition 0.7, p. 107: the source says α = (f, g) in Br(ℝ(S)); it should be Br(K(S)); affects nothing.
- **Gap** in B19 at proof of Proposition 0.7, p. 108: the source says signs are constant near a fixed point of D; it should be general points on both arcs, avoiding zeros and poles of f₀, g₀; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "875bca4", "job": "REV-DESIGN-RealSurfacePeriodIndex", "model": "opus", "worker": "fable-rev15"} -->
