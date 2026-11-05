<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1599#issuecomment-6639487639 -->
Red team round 2 pass b (claude) of 295c94f

Verdict: needs_changes

1. **F01** (P2) ShimuraCompactifications is cited at sections that do not exist at its head

   **Location.** `packages/StableReductionPartII/README.md:233` ("§§C4.1–C4.10 and C5.13–C5.18 supplies semi-abelian degeneration, Hodge semiampleness, minimal contraction and ample Hodge line"), :237 (gap:minimal-siegel-all-characteristics "(§§C4.1–C4.10, C5.16–C5.17.)"), :14 ("Layers C4–C5"), :6921, :7107, :7136, :7150, :7214 (Needs lines), and the gap's `section` field in `design/plan.json`.

   **Claim.** The cited sections exist in ShimuraCompactifications as it is now and own the degeneration, semiampleness and minimal-compactification statements.

   **Witness.** ShimuraCompactifications at its open head (`roadmaps show`, #1053) has no heading of the form `### C…` (grep count 0). Its degenerations are §§6.1–6.18 ("Semi-abelian schemes" … "Level structures at the boundary"), Hodge semiampleness §7.13, "The integral minimal compactification" §7.16, "The Hodge line on the minimal compactification" §7.17, and "The map to the minimal compactification" §2.8. The resolver's two leads (C4.1, C5.13) are the visible part: the other C-numbers matched that roadmap's own citations of ComplexComparisonPartII C4.2 and C4.4.

   **Repair.** Replace every "§§C4.1–C4.10" by "§§6.1–6.7 and 6.10", every "§§C5.13–C5.18" and "C5.16–C5.17" by "§§7.13–7.17, with §2.8", and "Layers C4–C5" by "Layers 6–7"; write the gap as "What ShimuraCompactifications must provide (gap:minimal-siegel-all-characteristics): … (§§6.1–6.7, 7.16–7.17.)" and set the same `section` string on that gap in `design/plan.json` (slug unchanged). Test: `roadmaps resolve` on the README reports no ShimuraCompactifications section found nowhere, and §7.17's "positive power ω^{⊗m} descends to an ample invertible sheaf on the neat integral minimal compactification" is the statement the gap extends.

2. **F02** (P2) The universal-curve identification already has an owner on main

   **Location.** `packages/StableReductionPartII/README.md:385` (§0.6: "No equivalence with `M̄_{g,n+1}` is assumed; that equivalence is proved in Layer 2, §2.256."), :5736 (§2.256 statement), :3 (Summary: "identify the unrestricted universal curve with the added-marking moduli problem").

   **Claim.** This roadmap is the owner of the statement that `M̄_{g,n+1}` is the universal curve over `M̄_{g,n}`.

   **Witness.** SchemeAndStackFoundations §4.15 on main states it as part of the `Mbar.forget` API: "its identification with the universal curve supplies the added-marking induction, Knudsen II, Corollary 2.6 and Theorem 2.7" (its README lines 5734–5736), and uses it again for level projectivity: "Its projective universal stable curve `M̄_{g,n+1} → M̄_{g,n}` comes from stabilization" (line 5958). Two roadmaps plan the same object; this roadmap's Scope (:10) lists "universal forgetting" among the §4.15 imports and then re-states the identification as its own end result.

   **Repair.** In §0.6 replace the quoted sentence by "The identification of `M̄_{g,n+1}` with this universal curve is the statement of SchemeAndStackFoundations §4.15 `Mbar.forget`; §2.256 supplies its proof route and the coherent inverse over arbitrary schemes." Open §2.256 with "This proves the identification asserted by SchemeAndStackFoundations §4.15 `Mbar.forget` (Knudsen II, Corollary 2.6): the imported s and c are inverse …", add "SchemeAndStackFoundations §4.15 (`Mbar.forget`)" to its Needs, and in the Summary and Scope bullet :10 list the universal-curve identification among the §4.15 statements that Layer 2 refines. Test: on the instance (g,n)=(0,3), both texts now name one owner for "M̄₀,₄ is the universal curve over Spec ℤ", and §2.257 still derives M̄₀,₄≅ℙ¹ from §2.256.

3. **F03** (P3) §6.3 misstates JacobianChallengePartII §7.1 and omits the owner of the levelled Jacobian family

   **Location.** `packages/StableReductionPartII/README.md:6892` ("Do not import JC7/universal-level-jacobian: that application itself depends on this roadmap's full-level and fine-level nodes."); the same construction at :6890 and :7031.

   **Claim.** JacobianChallengePartII Layer 7 depends on this roadmap, so its levelled Jacobian cannot be imported.

   **Witness.** JacobianChallengePartII §7.1 (its README lines 1066–1083, read at its current copy) is stated for any Noetherian ℤ[1/ℓ,ζ_ℓ]-scheme M with a smooth projective curve and a full symplectic level α on J(C/M); its Needs are §§1.2–1.4, 2.1 and AbelianSchemesAndArithmeticModuli A3.7–A3.8; its motivating instance is AbelianSchemesAndArithmeticModuliPartII §B4.1; `roadmaps grep StableReductionPartII` finds no citation of this roadmap anywhere. The object "(J(C/M),λ_C,α) with pullback compatibility" that §§6.3 and 6.12 build is §7.1's statement.

   **Repair.** Delete the quoted sentence (it also carries the plan label "JC7/universal-level-jacobian"). In §6.3 replace "Equip this relative Jacobian with the given torsion frame and apply the M5/M6 fine ppav universal property" by "The levelled polarized Jacobian (J(C/M),λ_C,α) with its base-change comparison is JacobianChallengePartII §7.1; apply the M5/M6 fine ppav universal property to it", and in §6.12 replace "Transfer the curve level to its Jacobian torsion with the agreed Weil pairing" by the same citation; add "JacobianChallengePartII §7.1" to the Needs of §§6.3, 6.12 and to the JacobianChallengePartII contract (:201). Test: for g=2, N=3 the object classified by τ is the one JacobianChallengePartII §7.1 returns on the universal curve of §4.8.

4. **F04** (P3) Misfit locators remain (B-F03 residue)

   **Location.** `packages/StableReductionPartII/README.md:5120` (§2.222) and :5159 (§2.224): "`HomologicalComplex.Hom.isoOfComponents` in `Mathlib/Algebra/Homology/HomologicalComplex.lean`, line 498"; :3681 (§2.153) and :3729 (§2.155): "`CategoryTheory.Limits.IsLimit.hom_ext` and `CategoryTheory.Limits.IsLimit.lift_self`".

   **Claim.** Each locator names a declaration the target's route uses.

   **Witness.** §2.222 asserts `ExactAt (n+1)` and §2.224 `IsZero` of homology: no isomorphism of complexes occurs in either statement or route (the comparison iso is §2.223's). §§2.153 and 2.155 construct cones; the `IsLimit` they would need is first built in §2.190 and §2.200.

   **Repair.** Delete the `isoOfComponents` clause from the locators of §§2.222 and 2.224 (keep `exactAt_iff'`, `moduleCat_exact_iff`, `ExactAt.isZero_homology`); delete the `IsLimit.hom_ext`/`lift_self` clause from §§2.153 and 2.155 (keep `TensorProduct.map_tmul`/`map_comp`). Test: the fitted-locator script of round 1 reports 0 misfits.

5. **F05** (P3) Zero-law and API-repeating Checks remain (B-F04 residue)

   **Location.** `packages/StableReductionPartII/README.md:1073` (§2.14 "φ(ι0)=0"), :1391 (§2.32), :1972 (§2.64), :1998 (§2.65), :2560 (§2.97), :3438 (§2.140), :3493 (§2.143 "Ê_D(0)=0"), :4129 (§2.174), :4937 (§2.213); API repeats: :1276 (§2.26 "P(1,0)=(0,1)"), :3188–3189 (§2.128, equal to its API bullets :3182–3183), :3970–3971 (§2.167, equal to :3963–3964), :4128 (§2.174, equal to :4122).

   **Claim.** Each Check is a discriminating instance of the definition.

   **Witness.** Every linear map sends 0 to 0, so the nine zero-law bullets also hold for the wrong map; "The coordinates of inclusion are (1,0)" (:3188) is the API bullet "The inclusion j↦j has coordinates (1,0)" (:3182) word for word.

   **Repair.** Delete the thirteen bullets. Where a block then has fewer than three Checks, add the fixture value (A=ℤ, γ=δ=s=t=0): §2.32 "C_J(ε)=(ε(u),−ε(v))=(0,−u)"; §2.64 "for M=ℤ/2, θ_D,M(ε⊗1)(v)=u⊗1≠0"; §2.97 "[0,1]↦−v, which equals v only when 2=0"; §2.140 "[0,1] evaluates on v to −u"; §2.143 "with I=(2,u,v), Ê_D(of(ε))(E_J(1⊗v))=u in ℤ₂[[u,v]]/(u²)"; §2.174 "for f=m(u):J→T and N=ℤ₂, (C_J(f))₂(v)=uv⊗1". Test: a script finds 0 Checks of the form "…(0)=0" and 0 Checks equal to an API bullet of the same target.

6. **F06** (P3) Undeclared vocabulary and Lean syntax in statements (B-F05 residue)

   **Location.** `packages/StableReductionPartII/README.md:398` ("Under fiberEquivalence"), :1584 ("For the named canonical the dual generator ε"), :2010 and :2211 ("the existing polynomial nodal chart Ring A γ δ s t"), :2026 ("the existing the normal form signature"), :2217 ("exactly Ideal.Quotient.factorPow m hij"), :2376 ("The native the ideal projection p"), :3885 ("the existing the section Hom differential d(e,n)(A,γ,δ,s,t,M,e,n)"), :4562–4563 and :4587–4588 ("The native the underlying complex", "The native the augmentation"), :5165 and :5190 ("the native the Ext comparison"), :5165, :5190, :5229, :5243, :5283, :5301 ("_root_.Ext R (ModuleCat R) (n+1)").

   **Claim.** Statements are in the author's own words; identifiers are backticked library names or defined in the roadmap.

   **Witness.** `fiberEquivalence`, `Ring A γ δ s t` and `hij` are declared nowhere (not in Suggested.lean, not at the pins); the "the native the …" phrases are untyped leftovers of the round-1 identifier substitution; `_root_.Ext` is Lean namespace syntax inside six theorem statements.

   **Repair.** :398 "Under the representing equivalence of §0.6"; :1584 "For the canonical dual generator ε"; :2010, :2211 "the polynomial nodal chart R=A[Y][X]/(F)"; :2026 "the normal-form statement of §2.67"; :2217 "the native quotient transition `Ideal.Quotient.factorPow`"; :2376 "The ideal projection p"; :3885 "the section Hom differential d(e,n) of §2.9"; :4562–4563 "The underlying complex of the two-periodic resolution of J is C(false)" and "Its augmentation is π_J" (likewise for D); :5165, :5190 "the Ext comparison of the two-periodic resolution"; in §§2.225–2.232 write "the derived-functor Ext^{n+1}_R(J,R⊗_A M), Mathlib's `Ext` as opposed to `CategoryTheory.Abelian.Ext`". Test: a script finds no camelCase identifier outside backticks that is not declared at the pins, in a supplier or in Suggested.lean.

7. **F07** (P3) A Stacks tag is cited under a key whose text lacks it; three reference entries are cited by no target

   **Location.** `packages/StableReductionPartII/README.md:7260` (§7.2: "[mc0-stacks-perfect], Lemma36.32.6 (0E0L); Lemma36.32.5 (0E62); Lemma33.9.3(7) (0BUG)"); References :7578 (mc1-stackdim), :7580 (mc1-stackval), :7596 (mc4-stacks).

   **Claim.** Every tag is cited under the manifest key whose cached text contains it, and every reference entry is used.

   **Witness.** mc0-stacks-perfect (Derived Categories of Schemes) has 0E0L at line 3679 and 0E62 at line 3655 and no occurrence of "0BUG"; 0BUG is Varieties, Lemma 33.9.3, and `sources.toml` has no Varieties entry. mc1-stackdim, mc1-stackval and mc4-stacks occur only in the References list (grep), after the round-1 deletions.

   **Repair.** Either fetch Stacks "Varieties" through the sources service and cite 0BUG under that key, or drop the 0BUG clause (the cached proof of 0E0L already invokes it). Delete the three unused References entries (and their `sources.toml` records), or cite them where their content is used (stack dimension in §1.13, the stack valuative criterion in §1.16). Test: every "(tag)" in the README resolves to a key whose cached text contains it; every References entry is cited by at least one target.

Round 2. The whole of `packages/StableReductionPartII/README.md` (7627 lines, 375 numbered targets, 28 supplier contracts, 28 declared gaps) and `packages/StableReductionPartII/Suggested.lean` (162 lines, 12 declarations) were read line by line. Part 1 verifies the round-1 repairs finding by finding; Part 2 is the fresh pass, with new findings numbered from S01.

## Part 1: round-1 findings at this head

| Finding | Status | Witness at 295c94f |
|---|---|---|
| A-F01 (definition Checks) | repaired | §2.5 Checks compute 1/3↦3 in ℤ/8 and 2↦6 (README.md:890–892); §2.37 gives (2,3), (0,Y), (0,2Y) (:1493–1495); §§2.53, 2.54, 2.112 carry the f₃(1/3)=3, λ₃ and (1+2v+4v²,3+6v+4v²) values (:1780–1782, :1808–1810, :2833–2835) |
| A-F02 (ℤ-linearity clause) | repaired | §2.123 Check: "it is a value check, not a separation of the two scalar structures" (:3074); e₃((1/3)σ)=3+6v+4v² added |
| A-F03 (Hom/Ext headlines) | repaired | `HasUniversalCoefficients` (Suggested.lean:101–112) and `pointedSection_universalCoefficients` (:145–147); both named in §2.236 (README.md:5413); docstring scope narrowed (Suggested.lean:11–13) |
| A-F04 (uniform tricanonical equations) | repaired | old §§4.2–4.3 gone; §4.14 (:6435–6449) only transports the supplier's ample λ along the finite surjection h; Scope bullet :13 names `level_structure_cover_ample` as owner; rank Checks 15, 11, 4 at :6443 |
| A-F05 (stale narrative) | repaired | §2.214 bullet reads "compare the differential maps after transporting along those identifications" (:4956); §0.4 uses "the stable pointed-curve moduli pseudofunctor of SchemeAndStackFoundations §4.15" (:338); grep `key/` empty |
| A-F06 (0C58) | repaired | §2.259 cites "tag 0C59 (mc0-stacks-curves lines 2165–2174)" (:5792); grep `0C58` empty; the cached text has Lemma 20.1 at mc0-stacks-curves line 2165 |
| A-F07 (genus-one formula) | repaired | K3SurfacesAndSymplecticBoundedness §6.0b contract (:219), gap narrowed to χ(O_S)≥0 and nefness (:54), §4.6 route cites §6.0b (:6296); §6.0b exists at that roadmap's head (its README line 782) |
| A-F08 (fine level owner) | repaired | Scope :12, contract :215, §4.8 identification (:6330), §6.12 (:7033), §7.13 (:7454); AbelianSchemesAndArithmeticModuliPartII §B4.1 exists at its head (its README line 2176) and cites nothing of this roadmap |
| A-F09 (perfect-arbitrary-base) | repaired | slug absent from README and `design/plan.json`; EnhancedDerivedSheaves §E1.9 contract (:163–165); §§1.2, 1.4, 1.9 cite `perfect_proper_pushforward` and `single_degree_free_locus`, both present in their suppliers (EnhancedDerivedSheaves README line 1057; AlgebraicModuliForArithmeticGeometry §7.2) |
| A-F10 (ω³ very ampleness) | repaired | gap:stable-tricanonical-embedding declared (:83) and in plan `gaps`; §1.2 route "Use gap:stable-tricanonical-embedding … StableReduction Layer 8 proves only global generation" (:480); StableReduction Layer 8 on main indeed states only global generation of ω², ω³ |
| A-F11 (relative reflexivity headline) | repaired | `IsStablyReflexive`, `IsRelativelyStablyReflexive`, `relativelyStablyReflexive_iff_universalCoefficients` (Suggested.lean:80–95, 152–158); named in §§2.233, 2.234, 2.236 (:5319, :5350, :5413); hypotheses match Ile Remark 3.6 (ile lines 340–365) |
| B-F01 (ModularCurves layers) | repaired | §7.12 Needs "ModularCurves §§1C–1D, 2D, 4A–4C, 9D–9E" (:7448); all eight sections exist on main (ModularCurves README lines 486, 563, 751, 1063, 1077, 1100, 1949, 2008) |
| B-F02 (duplicate targets) | repaired | Layer 2 is §§2.0–2.265; script: 0 API bullets equal to another target's statement, 0 anchors without a heading |
| B-F03 (misfit locators) | partly repaired | the `Dual.eval_apply`/matrix/tensor misfits are gone; `isoOfComponents` and cone-stage `IsLimit` locators remain on §§2.222, 2.224, 2.153, 2.155: S04 |
| B-F04 (Checks) | partly repaired | §0.7, §2.244, §2.251, §2.262 now have computed Checks (:427–429, :5535–5537, :5670–5672, :5836–5838); nine zero-law Checks and three API repeats remain: S05 |
| B-F05 (undeclared vocabulary) | partly repaired | the 44 Lean-projection headings are gone; `_root_.Ext` syntax, `Ring A γ δ s t`, `factorPow m hij`, `fiberEquivalence` and garbled "the native the …" phrases remain: S06 |
| B-F06 (plan labels, narrative) | repaired | grep of the review's regex returns nothing; MordellLawrenceVenkatesh contract (:221); §4.11 routes topology to gap:stack-topology-boundary (:6403); "JC7/universal-level-jacobian" at :6892 is a plan label that survived: covered by S03 |
| B-F07 (false Checks) | repaired | (a) :4168 "differs from −3 whenever 6≠0 in A"; (b) §2.21 now "A may be the zero ring or have nilpotents" (:1180); (c) :932; (d) C2 targets say arbitrary or finite projective N (:3149, :4279); (e) :5283, :5301 have no M; (f) the four remaining "no flatness of N is assumed" (:3125, :3398, :3713, :5393) are on arbitrary-N targets, where it is true; (g) :809; (h) :900 |
| B-F08 (01Q3, 01VG) | repaired | grep returns nothing; no tag is cited under mc4-stacks (the key is now unused: S07) |
| B-F09 (Needs hygiene) | repaired | script: 0 unbackticked dotted names, 0 duplicate entries in 375 Needs lines |
| B-F10 (conventions, unbound symbols) | repaired | λₙ defined in C3 (:779); R′, ι′, φ bound in §2.78 (:2234); C_J,M constructed in §2.32 (:1375); p in §2.26 (:1260); K in §2.115 (:2878); ψ in §2.107 before its use in §2.170 |

No repair introduced a new error that I could find; the renumbered anchors all resolve (script: 0 broken).

## Part 2: new findings

## Verified sound

Read: 375 numbered targets, 28 contracts, 28 gaps, 12 Lean declarations, 162 Checks blocks. Locators verified: 48 Stacks tags against the cached texts (every tag cited under mc0-stacks-curves, mc0-stacks-moduli, mc0-stacks-perfect except 0BUG, mc0-stacks-duality, mc0-stacks-descent, mc0-stacks-quot, mc1-perf, mc1-def, mc1-etale, mc2-stacks-unramified-diagonal, mc3-stacks-norm, mc6-stacksregular, stacks-completion, stacks-hom-flat, stacks-noetherian-valuative-KKjBS6, stacks-moduli-stacks, stacks-spaces-cohomology resolves to the named lemma), 27 line-numbered Mathlib and Tau Ceti locators (all at the cited line, the two `Pi.lean` ones at the attribute line before it), 238 backticked dotted names found at the pins by declaration grep (including `AlgHom.liftEquiv`, `LinearMap.lcomp`, `LineBundleClass.mk_tensorProduct`, `Scheme.Modules.Cohomology`, `IsFinite.of_comp`), and 31 source locators by line or page (dm Theorem 1.2 at dm line 105; dm (5.3)–(5.4) at lines 1168–1178 with the H¹ pairing valued in R²(ℤ/kℤ)≅μ_k^{⊗−1}, as §4.9 says; ile Definitions 3.1 and 3.4 and Remark 3.6 at ile lines 268–365, whose hypotheses are exactly those of `relativelyStablyReflexive_iff_universalCoefficients`; knudsen2 Theorem 2 at line 977; knudsen2 Lemma 2.2, Definition 2.3, Theorems 2.4, 3.7 and Corollary 3.9 at the cited printed pages; knudsen2012 Lemma 2.6, Proposition 3.1, Corollary 3.2, Theorem 5.1 and line 414; clm Lemma 6.4 at line 918; milne Theorem 12.1 at p. 38; yuan Theorem 3.3 p. 42, Lemma 3.4 p. 43, §3.1.4 p. 45, §4.3.2 p. 73, Remark 3.9 p. 55; mumford1977 Definition 5.9, Theorem 5.10, Lemma 5.14; Deligne §6.2, Construction 7.2, §7.4; Eriksson–Freixas Proposition 6.1(2) sign at line 2894; hacking Lemma 4.2; EG97 Theorem 1 and Propositions 14–19; EG99 Theorem 3.1; polishchuk Proposition 3.5, Lemma 4.6; Frediani–Neumann Theorem 2.5; hall Theorem 1, Theorem A.1, Corollary A.3; ekedahl II 1.7; chen-zhang Theorem 1.3; dgh §6.1; av Example 5.1; ll Notation 1.10.1; ehkv Theorem 2.7; CLP Lemma 2.1; Edidin–Fulghesu Theorem 4.7).

Sibling and supplier citations checked at their current copies: SchemeAndStackFoundations §§0.3, 0.8, 0.9, 0.11, 0.17–0.21, 0.30, 1.1, 1.2, 1.9, 1.15, 1.18–1.23, 2.1–2.3, 2.6, 2.11, 2.18–2.22, 3.3–3.7, 4.1, 4.4–4.6, 4.8, 4.10, 4.14, 4.15, 4.18, 5.1–5.4, 5.8, 5.10 and the names `stableCurveDirectImage_nef`, `determinantQuotient_ample`, `level_structure_cover_ample`, `level_structure_cover_projective` (main); StableReduction Layers 0–11 and the Layer 8 content behind gap:stable-tricanonical-embedding; AlgebraicModuliForArithmeticGeometry §§1.1–1.7, 2.1–2.2, 3.1–3.5, 5.1–5.4, 7.2, 7.3, 7.6, 7.6.1a, 8.1–8.3 and `single_degree_free_locus`, `universal_functions`, `ModuliDescent.polarizedDescentComparison`; JacobianChallengePartII §§0.1–0.4, 1.1–1.4, 1.3a, 2.1–2.3, 4.4, 6.1–6.3, 7.1; JacobianChallenge Layers A–F; NeronModelsAndSemistableAbelianVarieties §4.1 `NormalizationExactSequence`, §4.13 `StableFamilyPicard`; AbelianSchemesAndArithmeticModuli §§A2.5, A3.1–A3.8, A6.18 `polarizedAutomorphisms`, `eq_one_of_finiteOrder_congruence`; AbelianSchemesAndArithmeticModuliPartII §B4.1 (head); K3SurfacesAndSymplecticBoundedness §6.0b (head); PELModuli §§M5.1–M5.3, M6.9–M6.10; ComplexComparisonPartII §§C3.2d.1–C3.2d.4; ModularCurvesPartII §§2.1–2.3, 2.11 `polygonCountStack`; ModularCurves §§1C, 1D, 2D, 4A, 4B, 4C, 9D, 9E and `isGroupHom_of_mapsZero`, `coarseJLine_int`, `coarseJLine`; MordellLawrenceVenkatesh §§5.9, 5.11, 5.12; DeformationAndDerivedPatchingAlgebra §3.3; EnhancedDerivedSheaves §E1.9; AlgebraicVectorBundles L0A–L0C; PadicMeasuresIwasawaAlgebras §5.1; StablePeriodicCurved Layer 2; AlgebraicCurves Layers 0–12; InverseGaloisAndArithmeticFundamentalGroups IG.5. All exist with the hypotheses cited, except the ShimuraCompactifications sections of S01. No roadmap on main or in the 449 open pull requests cites StableReductionPartII (no cycle), and no other roadmap states stable or relative stable reflexivity (`roadmaps grep`), so those predicates are owned here.

Gaps: all 28 slugs agree between README contracts and `design/plan.json`; each `needs` is one sentence with hypotheses; none asks for what the pins or an earlier roadmap already provide (gap:stable-tricanonical-embedding re-verified against StableReduction Layer 8, which proves global generation only; gap:perfect-arbitrary-base correctly removed). Only the section string of gap:minimal-siegel-all-characteristics is wrong (S01).

Dependency check, run as given:

```
depcheck: 209 roadmaps, 1821 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` changes nine files, all under `packages/StableReductionPartII`. Policy: `theorem` only, no `set_option`, no `#eval`, single `import Mathlib`, no pull-request numbers or process words in README or docstrings, every target has a locator.

**Suggested.lean.** The elaborated signatures (scratch `signatures.md`) were compared with the README statements: no binder is lost; the three predicates carry `Algebra A R`, `Module A M`, `IsScalarTower A R M`; the criterion carries both `IsNoetherianRing`s, `Module.Flat A R`, `Module.Finite R M`, exactly Ile's hypotheses. I ran no Lean (read-only brief). Headline inventory: the two polynomial theorems, the universal-coefficient theorem and the Ile criterion are stated; the nine geometric headlines are named as not statable with the missing carrier (docstring lines 9–27), and none is forced through a stand-in. Padding probe: `pointedSection_reflexive` follows from `pointedSection_universalCoefficients` at N=A only after transport along the unit isomorphisms R⊗_A A≅R and J⊗_A A≅J and the bidual identification, which is not one tactic or one library lemma; it is kept. No declaration restates a definition, mirrors a Check or computes a value.

**Lean declaration table.**

| Declaration | Context | Instances and values | Result |
|---|---|---|---|
| `pointedNodeEquation` | A : Type u, CommRing, γ δ s t | ℤ, zero parameters: X₀²; 𝔽₂, γ=1: X₀²+X₀X₁; ℤ/4, s=1: X₀²−1; zero ring: 0 | real body, matches §2.8's F |
| `pointedNodeRing` | same | ℤ fixture: ℤ[v]⊕uℤ[v], u²=0; zero ring: one element | matches §2.8 (nested monic quotient) |
| `pointedSectionIdeal` | same | span{u−s, v−t}; ℤ/4, s=1: (u−1,v); ev(u−s)=0 | matches §2.8's J |
| `nodePhi`, `nodePsi` | same | ℤ fixture: Φ=((0,u),(−u,v)), Ψ=((v,−u),(u,0)); ΦΨ=ΨΦ=u²I=0; 𝔽₂, γ=1: Φ=((u,u),(u,v)) | signs agree with §§2.7, 2.21 and knudsen2012 lines 417–427 |
| `IsStablyReflexive` | R, M : Type u | ℤ over ℤ: ℤ**=ℤ, Ext^{>0}=0 true; ℤ/2 over ℤ: dual 0, false; zero ring: true | Ile Definition 3.1 (ile line 268) |
| `IsRelativelyStablyReflexive` | A R M : Type u, tower | A=R=ℤ, M=ℤ: fibres 𝔽_p reflexive, true; M=ℤ/2: not flat, false; A=k[t]_(t), R=k(t): maximal ideal contracts to (0), fibre tested there as Ile requires | Ile Definition 3.4 (ile lines 286–291) |
| `HasUniversalCoefficients` | same | A=R=ℤ, M=ℤ, N=ℤ/2: both maps are ℤ/2≅Hom(ℤ,ℤ/2); M=ℤ/2: β:ℤ/2→Hom(0,·)=0 not bijective | Knudsen's (a)–(c) (knudsen2 lines 977–980; ile lines 344–355) |
| `nodeSection_universallyExact` | A : Type u, N : Type v | ℤ, N=ℤ/2: ker Φ=im Ψ={(vh+uf,uh)} on (𝔽₂[v]⊕u𝔽₂[v])²; transposes via p=((0,−1),(1,0)); A=0: all 0 | true for every A, N (cokernels A-projective, §§2.35, 2.87) |
| `pointedSection_reflexive` | A : Type u | fixture: η(v)(incl)=v, η(v)(ε)=u, ψ(F)=F(incl) inverse; ℤ/4, s=1: ε(u−1)=0, ε(v)=u+1 | true; D reflexive by the instance at `Dual/Defs.lean:263` |
| `pointedSection_universalCoefficients` | A : Type u | fixture, N=ℤ/2: Hom_R(J,R/2) free over 𝔽₂[v] on (u,v),(0,u); D/2D free on incl, ε with vε=u·incl; θ(incl⊗1)=(u,v), θ(ε⊗1)=(0,u): bijective; Ext^{>0} by exactness over 𝔽₂ | true |
| `relativelyStablyReflexive_iff_universalCoefficients` | Noetherian A R, flat, finite M | rows above; R=0: no maximal ideals, both sides reduce to Flat A 0, true; A=0 forces R=0 | Ile Remark 3.6 proves both directions under exactly these hypotheses |

**Adversarial table (README statements; values computed).**

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions, stability | (0,3), (0,2), (1,0), (1,1) | 2g−2+n = 1, 0, 0, 1 | correct |
| Conventions, Deligne symmetry | ℙ¹, O(1); genus g, ω | (−1)^{deg}=−1, +1; Koszul (−1)^{χ}: +1, (−1)^{g−1}; times (−1)^{χ(O)}: −1, +1 | the stated factor restores both |
| Graded determinant Checks | R² in degree 0; [R→R]; R in degree 1; ℙ¹ O(1), O(−2) | grades 2, 0, −1; 2 and −1 | correct |
| §0.2 | ℙ¹_S; elliptic family; two copies of ℙ¹ | R¹f_*O=0; rank 1; f_*O=O⊕O | correct |
| §0.3 | ℙ¹+3; ℙ¹+2; 2+2 split; rational one-nodal +1 | deg 1; 0; (1,1); −2+2+1=1 | correct |
| §0.7 | smooth; constant nodal; xy=t | S_sm=S; ∅; D(t), pullback by t↦t² is D(t) | correct |
| §1.1 | g=2,3,1,0 | 6T−1, 12T−2, 0, 1−6T; P_g(1)=5(g−1) | correct |
| §1.4 Check 2 | deg A=0, A≇O, g≥2 | deg ω³⊗A=6g−6≥2g+1 | very ample, excluded from W |
| §1.7 Check 4 | S=D₊(det)⊂ℙ^{r²−1} | Pic(S)=ℤ/r | correct |
| §1.9 | graph of φ | χ(ω^{6n})=(g−1)(12n−1)=P_g(2n) | correct |
| §1.12 | smooth g=2; one-nodal g=2; theta curve | 3; 2+1; 0+0+3; Σh¹+δ=3g−3 | correct |
| §1.13 | g=2 | 3+24=27 | correct |
| §1.16 | source density | R^sm dense in every component of R=U×PGL | correct |
| §2.1 identity | μ=−2δu+γv, ν=γu−2v | 2xμ+γ(xν+yμ)+2δyν=(γ²−4δ)(xu+yv) | correct, also at 2=0 |
| §2.6 | f=x, d=1 | u′=1, μ=0, ν=1, q(x,y+ε)−q(x,y)=εx | correct |
| §2.21 Checks | fixture; 𝔽₂, γ=1 | P_J(v,u)=uv−vu=0; P_J(0,−u)=uv≠0; P_J(u,u)=u²−uv=0 | correct |
| §2.30 API | symbolic | E(ur)=((q(s,t)−δY²)E(r)₁, E(r)₀−γYE(r)₁); E(cr)₁=E(r)₀−(s+γY)E(r)₁; E(b)=(C(s+γt),1) | correct |
| §2.35 Check | ℚ, γ=1 | p(u·1)=u, u·p(1)=0 | not R-linear, as claimed |
| §2.37 Checks | ℤ; 𝔽₂, γ=1; ℤ/4 | (2,3); u²=Yu so (0,Y); 2Yu≠0 | correct |
| §2.42 Checks | 𝔽₃, γ=1; ℤ/4, s=1 | ε(c)=−u, ε(d)=u, u≠−u; ε(v)=u+1 | correct |
| §2.46 Checks | fixture | m(u)=vε (both kill u, send v to uv); rv=u unsolvable | correct |
| §2.63 Checks | fixture | u·incl−vε kills u and v; v·incl−uε has value v² at v | correct |
| §2.75 Check | fixture, h=ev_v | (h(incl),−h(ε))=(v,−u) | correct |
| §2.106, §2.147 Checks | fixture, M=ℤ/2 | 1⊗Ψ(1,0)↦0, 1⊗Φ(1,0)↦uv≠0; 1⊗Φ(0,1)↦0, 1⊗Ψ(1,0)↦v·incl−uε≠0 | correct |
| §2.107 Check | fixture | ψ(η(v))=v, F↦F(ε) gives u | correct |
| §2.112, §2.123, §2.138 Checks | σ=Σ2^k v^k, N=ℤ₂², level 3 and 2 | (1+2v+4v², 3+6v+4v²) → (1+2v, 3+2v); (1/3)²≡1 mod 8 | correct |
| §2.115 Checks | 𝔽₂, γ=1; ℤ→ℤ/2 | K(u)=ε(u)=−a=−u=u; φ(K(u))=u′ | correct |
| §2.176 Check | γ=δ=s=t=0 | E_Q([(3+v)ε])=3; ≠−3 iff 6≠0 | correct after repair |
| §2.200 Check 2 | N=ℚ₂ | Qₙ⊗ℚ₂=0, limit 0; R̂⊗ℚ₂=R̂[1/2]≠0 | retract hypothesis needed, as claimed |
| §2.233 Check | k[x,y]_(x,y)/(xy), ideal (x,y) | 2 generators, rank 1 on each branch | stably reflexive, not projective |
| §2.234 Checks | A=R=ℤ_(2), M=A/2; A=k[t]_(t), R=k(t) | not flat; maximal ideal contracts to (0) | correct |
| §2.248 chart | (z−a)U+zV | U-chart z(1+v)=a; V-chart z(u+1)=au; a=0 attachment [1:−1]; 𝔽₂: v=1≠0,∞ | correct |
| §2.251 chart | zero parameters; 𝔽₂, γ=1 | R₀=A[v,y]/(vy²), R₁=A[x]; vy²=vy | correct (R₀ is the chart in the coordinate y=ε/incl) |
| §2.262 Checks | F smooth; F nodal | (4,4,1), g=2; (5,4,2), g=2; codim 5−1=4 | correct |
| §2.264 counterexample | A=k[t]_(t), R=k(t)[x], M=R/(x) | M/tⁿM=0; Hom_R(k(t),R)=0 | nonlocal extension false, as claimed |
| Layer 2 balancing example | α∈ℚ[[t]]∖ℚ(t), ℓ(1)=0, ℓ(α)=1 | (ℓ⊗id)(α⊗1−1⊗α)=1≠0 | kernel nonzero |
| §3.5 Checks | (0,4); genus 2; (0,3) | three types; Δ₀, Δ₁; no one-edge genus-zero graph with 3 legs | correct |
| §3.6 | separating edge with legs | GΓ=C₂ iff g₁=g₂ and no legs | correct |
| §3.9 | (1,1); (0,4) | [M̄₀,₃/C₂]=BC₂; three sections | correct |
| §3.12 Checks | x′=ux, y′=vy; x′=x+cx² | multiplier uv; multiplier 1 | correct |
| Layer 3 example | theta graph | |Aut|=12, node orbit 12/4=3, ordered-branch orbit 12/2=6 | correct |
| §4.2, §4.4 | N=2 | [−1] trivial on 2-torsion | excluded, as claimed |
| §4.6 Checks | ℙ¹×ℙ¹, m=a₁=a₂=2 | coefficient 2−4=−2, b_*O(−2E)=I_p², degrees 2 and 0; genus 0: Σa_i<2m zero, =2m rank 1, 2m+1 rank 2 | correct |
| §4.9 Checks | N=3 scaling e₁ by 2 | blocks scaled 2 and 1 | outside GSp₄ |
| §4.10 Check | T=[[1,1],[0,1]], N=4 | T²≠I, T⁴=I | order N |
| §4.14 Checks | g=2, d=2 | ranks 5, 15, 11, kernel 4; d=1 kernel 0 | correct |
| §5.1, §5.13 | g=0, 1, 2; derived grades | ranks 0, 1, 2; grades g−1 and 1−g | correct |
| §5.11, §5.12 | (1,1) exchange; self-clutching | sign −1; 0→E_{g−1,n+2}→ξ*E→O→0 by residue, ranks g−1, g | correct |
| §5.16 and Worked example | (2,3) pencil on ℙ¹×ℙ¹ | g=2, 12 base points, K²=−4, κ=(K+2F)²=4, deg λ=2, δ=16+4=20, 24=4+20 | correct |
| §6.14, §6.6 | genus 2; nonhyperelliptic genus 3, N=3 | one point; two points (C,±α) | correct |
| §6.16 | one-nodal irreducible g=2; E₁∪E₂; rational two self-nodes | a=1, X*(T)=ℤ; a=2; a=0, X*(T)=ℤ² | correct |
| §6.21 | relative Frobenius | degree p, deg λ_Y=p·deg λ_X | correct |
| §7.1, §7.7 Checks | T=ℙ¹_ℂ, constant curve | pr*L and pr*L⊗O(1) distinct, same relative class | correct |
| §7.9 | fixed C over k[ε]/ε² | kernel of Pic(C_A)→Pic(C) is H¹(O_C)ε, dim g; automorphisms 1+εk | correct |

## Not verifiable

- Fresh Lean elaboration is prohibited for this review; the elaborated signatures were taken from the worker's `signatures.md` and compared by reading.
- The two settled uncertified books (blr-relative-picard-LwkQQl, mc6-fc1990) are cited by locator only.
- clm's lemma labels are OCR glyph names ("/six.oldstyle./four.oldstyle."), so its numbered locators were checked at the line numbers the README cites (line 918 for Lemma 6.4) rather than by label; knudsen3's Theorem 4.1 label is not recoverable from the extraction (Theorem 4.2 is, at page 4 = printed 203).
- The printed page of KM76 Lemma 2 could not be fixed from the concatenated extraction (page markers of the sequel papers interleave).
- Ownership against open pull requests was checked through `roadmaps grep` over all 449 heads and by reading the two sibling folders this roadmap cites at their heads (AbelianSchemesAndArithmeticModuliPartII, K3SurfacesAndSymplecticBoundedness); the other sibling checkouts listed in the brief were not read individually.
- Universality: the computed instances are adversarial tests, not proofs of the universal statements; in particular the finite-projective completion comparisons of Layer 2 were tested on finite-free fixtures only.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "295c94fea94d6b6d4fa9ad030cdac1c466952a09", "job": "RT-StableReductionPartII~2b", "model": "fable", "worker": "chris-x9"} -->
