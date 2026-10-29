<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1502#issuecomment-6485807734 -->
Red team round 2 pass b (claude) of eefe719

Verdict: needs_changes

1. **F01** (P3) AnalyticToricGeometryPartII is cited by design labels that do not exist at its open head

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:15` ("AnalyticToricGeometryPartII NT.0–NT.6 owns the toric spaces, projection, cohomology isomorphism and approximation"), `:95–97`, `:571`, `:575`, `:577`, `:780`, `:788`, `:816`, `:824`, `:826`, `:840`, `:893`, `:907`, `:915`.

   **Claim.** The supplier's targets are NT.0 (integral sections), NT.1 (unit space and complete-fan comparison), NT.3 (projection and open-topos square), NT.4 (prime-to-p cohomology isomorphism), NT.5 (section domains, hypersurface approximation), NT.6 (complete-intersection approximation).

   **Witness.** The open head of AnalyticToricGeometryPartII (`rev/1647`, commit `4c15f2e`, the head the brief names) numbers its sections §0.1–§6.4; `grep "NT\.[0-9]"` on its README returns nothing. Its "Downstream consumers" paragraph names for this roadmap "§3.4–§3.6 for field-natural π and restricted-open geometric morphisms, §4.2 for the equivariant torsion comparison, and §5.3/§6.4 for dense-field approximation". The NT labels exist only in `packages/AnalyticToricGeometryPartII/design/README.md`.

   **Repair.** Replace every NT citation by the head's section numbers: NT.0 → "§§0.3–0.5 (monomial sections, invariant divisor representatives, integral toric line bundles)"; NT.1 → "§§1.1–1.2 (unit toric spaces, complete-fan analytification comparison)"; NT.3 → "§§3.4–3.6 (tilting projection π, étale-topos comparison, open topos restrictions)"; NT.4 → "§4.2 (toric torsion cohomology comparison)"; NT.5 section-domain neighbourhoods → "§5.1 (toric section neighbourhoods, N_c)"; NT.5 hypersurface approximation → "§§5.2–5.3 (dense-field section approximation, toric hypersurface approximation)"; NT.6 → "§6.4 (toric complete-intersection approximation)". At README:97 write "The §3.4 projection and §3.6 open-topos targets explicitly include this field naturality … and §4.2 includes the resulting cohomology equivariance". Merge the duplicate Checks README:571 and README:575 (both state T(V(f₁,…,f_s), |ϖ|^c) = N_c(f₁,…,f_s)) into one bullet citing §5.1. Tested on the refuting instance: after the change every cited section exists at `rev/1647` (§3.4 line 486, §3.6 line 524, §4.2 line 580, §5.1 line 606, §5.3 line 639, §6.4 line 725, §1.2 line 282), and §3.4's API bullet "a continuous automorphism σ of a completed algebraic closure C of K, with its tilt σ♭, commutes with π_C" is exactly the naturality README:97 relies on.

2. **F02** (P3) Two ClassicalAdicEtaleCohomology declaration names no longer exist at its head

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:83` ("§5.4 the general-base nearby-cycle topos (`OrientedEtaleProduct.nearbyCycles_stalk`), de Jong's `PlurinodalAlteration.exists`"), `:626` ("this is ClassicalAdicEtaleCohomology §5.4 `OrientedEtaleProduct.nearbyCycles_stalk`"), `:639` (twice: "`PlurinodalAlteration.exists` supplies the plurinodal factorization", and the Needs line).

   **Claim.** ClassicalAdicEtaleCohomology §5.4 states targets with these names.

   **Witness.** At the supplier's head (#875, `d99fe53`, 5829 README lines, 125 Lean lines) neither string occurs in the README or in `Suggested.lean` (grep: 0 hits). §5.4 (README line 3053–3083) does state the oriented product `OrientedEtaleProduct`, "the nearby-cycle stalk formula, identifying the stalk at (x,η,sp) with RΓ(X_(x)×_{S_(s)}S_(η),F)", and "the plurinodal alteration theorem" (de Jong, Families of curves and alterations, Theorem 5.9 and Corollary 5.10, "without prescribed opens"), and "the uniform bound q ≤ 2N" — the content survives, the names do not. The citation resolver's lead (`citations.md`) lists both names as found nowhere.

   **Repair.** At README:83 write "§5.4 the general-base nearby-cycle topos `OrientedEtaleProduct` with its nearby-cycle stalk formula, de Jong's plurinodal alteration theorem (a plurinodal factorization with group control, stated without prescribed opens or marked boundaries) and the uniform bound q ≤ 2N on R^qΨ for fibre dimension ≤ N". At README:626 write "this is the nearby-cycle stalk formula of ClassicalAdicEtaleCohomology §5.4". At README:639 write "ClassicalAdicEtaleCohomology §5.4, the plurinodal alteration theorem, supplies the plurinodal factorization" and in the Needs line "(oriented products, the nearby-cycle stalk formula, the plurinodal alteration theorem, the uniform amplitude bound)". Tested: every replaced phrase is a quotation-free description of a statement present at line 3053–3077 of the head README; the gap `adapted-plurinodal-alteration` is unchanged.

3. **F03** (P1) The smooth, geometrically irreducible alteration over a finite constant extension has no owner

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:101` ("Sections 4.16 and 4.19 supply alterations, including the finite constant-field extension making the source smooth and geometrically irreducible"), `:752` ("apply the alteration theorem with empty boundary. The finite constant extension of DJ96 Remark 4.2 makes the alteration smooth and geometrically irreducible"), `:762–764` (API: Z′ geometrically irreducible, smooth and projective over k₁).

   **Claim.** SchemeAndStackFoundations §§4.16, 4.19 supply, for an integral variety over the (imperfect) global function field k₁, an alteration that is smooth and geometrically irreducible after a finite extension of constants (de Jong 1996, Remark 4.2).

   **Witness.** Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6374–6380` and `Suggested.lean:2322–2334` (`alteration_theorem`): for X integral separated of finite type over a field k, an integral alteration X₁ → X with X̄₁ regular proper over the same k, SNC boundary, and `(PerfectField k) → IsGenericallyEtale φ`. No statement in §§4.16–4.19 (lines 6038–6470) mentions a constant-field extension, smoothness or geometric irreducibility of the output; the only such text is the Check `alteration_imperfect_conic_valid` (line 6396–6400), an example. Over the imperfect k₁ ⊇ 𝔽_q(t^(1/p^n)) a regular projective X̄₁ need not be smooth (the conic there over 𝔽₂(s,t) is regular and not smooth), and §4.3/§4.5 need Z′ smooth and geometrically connected for the one-dimensional top group and Poincaré duality. The step is a proof-plan input provided by no layer, no supplier section and no pinned declaration.

   **Repair.** Rewrite the §4.1 route so that the alteration is taken over a perfect field and descended afterwards, which uses only existing suppliers: "Apply the complete-intersection approximation with the dense perfect subfield k₀ = 𝔽_q(t)^perf of K♭. Take the reduction of Z₀ and a d-dimensional irreducible component W₀; let k₂ be the algebraic closure of k₀ in κ(W₀) (finite and separable over k₀, so perfect), over which W₀ is geometrically irreducible (SchemeAndStackFoundations §0.7). Apply SchemeAndStackFoundations §4.19 `alteration_theorem` over k₂ with empty Z: X̄₁ is regular projective over the perfect field k₂, hence smooth (§4.13 `regularLocus_eq_smoothLocus`); replace k₂ by the algebraic closure k₃ of k₂ in κ(X̄₁) so that X̄₁ is geometrically irreducible over k₃. Descend X̄₁, its map to X_{Σ,k₃} and the image containment to a finite stage k₁ ⊆ k₃ finitely generated over 𝔽_q(t^(1/p^n)) (§0.9); since k₃/k₁ is purely inseparable, smoothness, properness, geometric irreducibility and the containment are unchanged. Put Z′ = the descended variety and g its map to X_{Σ,k₁}." Replace README:101 by "Sections 4.16 and 4.19 supply alterations with regular projective output; over the perfect fields used here §4.13 makes that output smooth, and §§0.7, 0.9 supply the constant-field and finite-stage descents." Keep DJ96 Remark 4.2 as a reference only. Alternatively declare `gap:alteration-constant-field-extension` on SchemeAndStackFoundations §4.19 with needs "for X integral of finite type over a field k, an alteration X₁ → X with X̄₁ projective over a finite extension k₁/k, smooth and geometrically irreducible over k₁ (de Jong 1996, Remark 4.2)". Tested on the instance of README:782: Y = ℙ¹ over ℚ₃, Z₀ the elliptic curve y² = x³ − x over 𝔽₃(t) ⊆ 𝔽₃(t)^perf; it is already smooth and geometrically irreducible over k₂ = 𝔽₃(t)^perf, §4.19 returns it with the identity alteration, and the finite-stage descent returns the same curve over k₁ = 𝔽₃(t), degree-2 x-map included. On SchemeAndStackFoundations' conic over 𝔽₂(s,t) the old route would stop at a regular non-smooth curve, while the new route never meets an imperfect base field before descent.

Head reviewed: `eefe719` (the board checkout was already at that head). Files read in full: `packages/DeligneWeightsAndPurityPartII/README.md` (931 lines, 30 numbered targets, 8 bold sub-targets in §3.4, 39 Check blocks), `packages/DeligneWeightsAndPurityPartII/Suggested.lean` (48 lines, no declaration), `design/plan.json` (`gaps` only), `sources.toml`, `metadata.toml`. Pins: Mathlib `f6090c7`, Tau Ceti `358314d4`. `git diff --stat origin/main...HEAD` touches only `packages/DeligneWeightsAndPurityPartII/`.

## Round-1 findings at this head

| Finding | Status | Witness at `eefe719` |
|---|---|---|
| a F01 (P2) zero-width annulus | repaired | README:683 "Let a, b ∈ \|Kˣ\| satisfy a < b ≤ 1"; README:661 "annuli B(a,b) = {a ≤ \|T\| ≤ b} for a < b ≤ 1"; negative Check README:690 (a = b = 1, ℤ/3 → 0). ITO20 line 1674 and line 1429 require a < b. |
| a F02 = b F02 (P3) base-changed scheme | repaired | README:634 "only the generic fibre splits, into two points … the special fibre is κ[t]/(t²) with one point rather than κ × κ". Recomputed: (t−s)−(t+s) = −2s ∈ 𝔪, so the two factors are not comaximal; the stalk stays (ℤ/n)² with trivial action. |
| a F03 (P1) adapted plurinodal alteration | repaired as a gap | README:89 contract `gap:adapted-plurinodal-alteration`; same slug and supplier in `plan.json` `gaps` (section "5.4"); consumed at README:639 and in the Dependencies README:744. The `needs` matches ITO20 line 412–422 and line 381–385 (adaptedness: smooth over S°, étale D in the smooth locus, f⁻¹(S°) ∖ D = X°). |
| a F04 (P3) dyadic sign locator | repaired | README:75 "§R07.4.3 supplies the Kummer field of norms, its Galois equivalence and the p = 2 norm-compatible sign; §R07.4.1 supplies the mod-p Kummer frame", with N(√2) = −2 and N(−π_(n+1)) = −π_n. FiniteFlatGroupsAndIntegralPadicHodgeTheory head §R07.4.3 (line 5570) states the signed system π̃ = (−π_n)_n for p = 2 and the Check N(√2) = −2 (line 5607). |
| a F05 (P3) non-test Checks | repaired | §0.1 now has five Checks (README:147–155), all computed; §0.4 contragredient Check README:283 (eigenvalues 1/2 and 1, weights −2 and 0, centre −1, and −Nᵗ versus +Nᵗ); §0.7 S₃ Check README:323; §0.8 split-Tate local factor README:361; §3.2 has one Check (README:587), §3.5 two (README:718–720), §4.6 four. No non-test bullet remains. |
| b F01 (P2) smooth relative duality | repaired as a gap | README:83 now describes §9.6 as curve duality plus effacement and §9.7 as the Berkovich-strict duality; `gap:huber-smooth-relative-duality` at README:91 and in `plan.json` (section "9.6–9.7"), cited at README:694 (twice) and README:744; "9.6" is absent from the uniform direct-image Needs (README:675). ClassicalAdicEtaleCohomology head §9.6 (line 5057) and §9.7 (line 5153, Berkovich 7.3.1 for separated smooth strict Berkovich maps, "not asserted … for every arbitrary non-overconvergent adic G") match that description. |
| b F03 (P3) Nagata compactification | repaired | README:694 "EtaleCohomologyFoundations §G.2 `nagataCompactification` for the proper model over `Spec O[T^(1/p^N)]`"; main `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:105–110` states it for qcqs S and separated finite-type f. |
| b F04 (P3) ITO20 references entry | repaired | README:926 lists every ITO20 theorem and all 49 line locators used in the text, including lines 381, 2009 and 2038 introduced by the gaps; pages agree with `sources.toml` ("pp. 1–54"). |
| b F05 (P3) free-carrier Lean declaration | repaired | `Suggested.lean` declares nothing; its docstring names §4.4 as a README target and lists every non-statable headline with the missing carrier; README:113 says no headline is statable at the pins and §4.4 "is kept as a target here". No backticked name of this roadmap's own remains in the README. |

Side effects of the repairs checked: the new §0.7 Check (README:323) is a valid datum (H/I = ℤ̂ with Φ ↦ 1; the twist (s′,(y,1))(s,(x,0))(s′,(y,1))⁻¹ = (s′ss′⁻¹,(q⁻¹x,0)) gives t = q⁻¹x), the representation is continuous (S₃ discrete), N = 0 on the open subgroup {1} × ℤ_3, every Frobenius acts by a permutation matrix (eigenvalues roots of unity, weight 0), and (a,a,a) ∈ {x₁+x₂+x₃ = 0} forces 3a = 0, a = 0 in ℚ₃. The new §0.8 Check (README:361): H¹ of a split Tate curve has inertia invariants the line Ee₀ (eigenvalue 1), local factor (1 − q⁻ˢ)⁻¹, pole at Re s = 0 ≤ 1/2; the semisimplification adds (1 − q^(1−s))⁻¹ with pole at Re s = 1. The §0.4 contragredient Check: (Φ⁻¹)ᵗ has eigenvalues 1 and 1/q, N^∨ = −Nᵗ sends e₀* ↦ −e₁*, ker N^∨ = Ee₁* in grade −1 with eigenvalue 1/2 (weight −2), e₀* in grade +1 with eigenvalue 1 (weight 0), and (Φ⁻¹)ᵗ(±Nᵗ)Φᵗ = q⁻¹(±Nᵗ), so only the exponential law separates the two signs. No repair introduced an error. The rewritten contract sentence at README:83 is accurate at the current supplier head.

## Verified sound

Counts: 0 Lean declarations (the file states nothing; its docstring lists the non-statable headlines, checked against the README's headline list below); 30 numbered targets and 8 bold sub-targets read and tested (tables below); 77 locators verified against the cached extractions (ITO20: lines 76, 99, 103, 124, 189, 238, 252, 317, 348, 359, 381, 388, 412, 429, 803, 866, 918, 964, 974, 987, 1003, 1030, 1198, 1299, 1413, 1427, 1439, 1455, 1481, 1502, 1518, 1586, 1606, 1662, 1673, 1738, 1774, 1813, 1846, 1901, 1928, 1973, 2009, 2038, 2191, 2279, 2338, 2382, 2391; SCH12: Theorem 8.5 line 2414–2443, Proposition 8.6 line 2446, Proposition 8.7 line 2458, Corollary 8.8 line 2496, §9 lines 2508–2530, Conjecture 9.3 line 2543–2547, local factor line 2560–2564, Theorem 9.4 line 2571, Lemma 9.5 line 2585, Theorem 9.6 line 2589–2609, Theorem 9.7 line 2604, Lemma 9.8 line 2622, Lemma 9.9 line 2636–2651, conclusion line 2652; DEL80 line 1524–1529; DJ96 line 597–606); 48 Checks recomputed (table below) and all 118 Check bullets read; 111 supplier citations resolved at the current heads or on main (ClassicalAdicEtaleCohomology #875 `d99fe53`: §§1.1–1.5, 3.2, 4.5, 5.2, 5.4, 8.2–8.5, 9.6, 9.7, 10.1–10.5, 11.1 all present, `annulusKummer` at §10.3 line 5423, two names missing = S02; DeligneWeightsAndPurity #929: §§0.1, 0.9, 0.11, 0.12, 0.19, 5.11, 7.15, Layers DWP.4, DWP.7; ArithmeticGaloisRepresentations #856: §§1.5, 2.1a, 2.4, 2.5, 2.6, `WeilDeligneRep.IsWeilNumber`, `WeilDeligneRep.IsPureEnd`, dual weight −w and twist w − 2 at its §2.6; LefschetzPencilsAndVanishingCycles #873: §§0.1, 1.1–1.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory #879: §§R07.4.1, R07.4.3; AbelianSchemesAndArithmeticModuli #849: §A2.7 `ampleIntersectionPositive` for nonempty d-dimensional Z; EtaleDualityAndPerverseSheaves #1040: §§0.5, 0.6, 1.3, 3.4–3.7; AnalyticToricGeometryPartII #1647: the seven NT labels unresolved = S01, the objects present at §§0.3–0.5, 1.2, 3.4–3.6, 4.2, 5.1–5.3, 6.4; main: EtaleCohomologyFoundations §§F.2.1–F.2.3, F.3, F.3a, F.4.1–F.4.6, G.2, 0.9, F.6, F.10.2, `VanishingCycles.adicFunctoriality`, `nagataCompactification`; SchemeAndStackFoundations §§0.7–0.9, 0.23a, 4.11, 4.16, 4.19 `alteration_theorem`, 5.2–5.3 (the constant-field claim = S03); PerfectoidSpaces §§P1.4–P1.6, P1.10–P1.15, P1.32a, P3.7–P3.8, `tiltField.residueFieldEquiv`; AdicEtaleGeometry A1.0.5; AdicSpacesPartII §§R0.19.1–R0.19.2, R1.3–R1.6; AdicSpacesPartIII §§R2.3, R2.4, R2.8 (φ an isomorphism for proper models), R2.10; AnalyticToricGeometry Layer 0; LocalFieldsRamification Layers 0–4); 16 pinned declarations opened (`Field.absoluteGaloisGroup` and `.mapOfAlgebra` at `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42,59`; `Representation` abbrev at `RepresentationTheory/Basic.lean:48`; `IsNilpotent.exp`; `LinearMap.IsPerfPair` class at `LinearAlgebra/PerfectPairing/Basic.lean:39`; `Module.End.HasEigenvalue`; `CategoryTheory.Abelian.Ext.comp` at `Ext/Basic.lean:128`; `Ext.mapExactFunctor_comp` at `Ext/Map.lean:223`; `CategoryTheory.Sheaf.H` abbrev at `Sites/SheafCohomology/Basic.lean:56`; `Padic`, `PadicInt`; `TauCeti.inertiaSubgroup` `Inertia/Basic.lean:106`, `isClosed_inertiaSubgroup` `:153`, `IsArithFrobeniusLift`, `inertiaTameCharacter` `Tame/Character.lean:401` (Kummer ratio σ(π^(1/m))/π^(1/m)), `IsArithFrobeniusLift.smul_eq_pow` `Tame/Quotient.lean:387`, `teichmullerLift` `Teichmuller.lean:63`).

Gaps: the four slugs in README:85–91 and `plan.json` agree (suppliers and sections "4.5, 5.2, 8.3–8.4", "8.2, 11.1", "5.4", "9.6–9.7"); each `needs` is one precise sentence with its hypotheses; none asks for what a supplier states (CAEC head §5.4 has the scheme stalk formula but not Huber's Theorem 5.7.8 over a microbial valuation ring with compact support; §§8.2 and 11.1 state no automorphism naturality; §5.4's plurinodal theorem has no prescribed opens; §9.7 asserts duality only for strict Berkovich maps).

Dependency gate, run from the board checkout with the prescribed command:

```text
depcheck: 188 roadmaps, 1241 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. DeligneWeightsAndPurityPartII is at line 180 of the merge order after every supplier (ClassicalAdicEtaleCohomology 62, DeligneWeightsAndPurity 92, EtaleDualityAndPerverseSheaves 118, AnalyticToricGeometryPartII 178); WeightsInEtaleCohomology (160) is named only as a consumer and cites nothing here; no supplier README mentions DeligneWeightsAndPurityPartII.

Ownership: `roadmaps grep` over main and the indexed open heads finds no owner of "local monodromy datum", "oc-quasi-constructible" or "sliced nearby"; "set-theoretic complete intersection" occurs only in AnalyticToricGeometryPartII (the approximation, imported here); "weight–monodromy conjecture" occurs in CrystallineCohomology (the p-adic statement, excluded at README:17), once each in LefschetzPencilsAndVanishingCycles and AutomorphicGaloisRepresentations as remarks; "Lütkebohmert" on main and in ClassicalAdicEtaleCohomology refers to Bosch–Lütkebohmert flattening and Lütkebohmert 1995 compactifications, not the 1993 punctured-disc theorem. Ownership against open pull requests whose files the brief does not provide was not checked beyond that index.

Policy: no `lemma`, no `set_option`, no pull-request number or process narrative in README or Lean; every target has a locator; `Suggested.lean` has a single `import Mathlib`, one module docstring in the prescribed form, the namespace and nothing else; no machine path in any package file.

Headline theorems and statability: the headlines are §4.6 (Scholze's Theorem 9.6), §4.7, §3.4's two neighbourhood theorems, §3.6, §1.1–1.2, §0.5 and §2.4–2.5. None is statable at the pins: Mathlib has no ℓ-adic étale cohomology of varieties with Galois action, no adic étale sites, no tilting of fields as a functor on absolute Galois groups, and no toric adic spaces; the §0.x statements would need a Weil-number predicate and the monodromy filtration as ad hoc encodings. The docstring names each headline family and its missing carrier; no stand-in is written. No padding exists.

### Adversarial pass (one row per statement; values on both sides)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions string | Ne₁ = e₀, Φ = diag(1,q), q = 2, 3 | NΦe₁ = qe₀ = qΦNe₁; ΦNΦ⁻¹e₁ = q⁻¹e₀; grades −1, 1 carry 1, q, weights 0, 2, centre 1; twist gives q⁻¹, 1, centre −1 | agrees with SCH12 line 2530 |
| §0.1 datum | ℤ_ℓ ⋊ ℤ̂ with n·x = q⁻ⁿx | (0,1)(x,0)(0,−1) = (q⁻¹x,0): t = Q⁻¹t; Fr = I forces (1−Q⁻¹)t = 0, impossible for Q ≥ 2, t ≠ 0; arithmetic coset gives q, no Q ≥ 2 | holds; Checks hold |
| §0.1 open subgroups | I₁ ⊆ I open, σ with t(σ) ≠ 0 | some σ^m ∈ I₁, m ≥ 1, t(σ^m) = m t(σ) ≠ 0 | nonvanishing on open subgroups holds |
| §0.1 discrete model | ℤ[1/Q] ⋊ ℤ | twist holds; {0} open in I with t = 0 | excluded only by profiniteness, as stated |
| §0.2 restriction scalar | ϖ = u ϖ′^e, ℓ ≠ p | u^(1/ℓⁿ) ∈ k′^ur (Hensel), Kummer ratio of ϖ = (ratio of ϖ′)^e, so t_k = e t_{k′}; constant e⁻¹; Q′ = q^f | holds, also for ℓ = 2 |
| §0.3 restricted datum | H′ with image fℤ̂; Φ′ = Φ^fτ | t(Φ′σΦ′⁻¹) = Q^(−f)t(σ); Fr′ nonempty since f lifts; H′/(H′∩I) ≅ ℤ̂ | holds; Q^f ≥ 2 prime to ℓ |
| §0.3 Check H′ = G_{k∞} | k∞ = k(ϖ^(1/p^∞)) | [k∞k^ur(ϖ^(1/ℓⁿ)) : k∞k^ur] = ℓⁿ (Kummer degree ℓⁿpᵐ over k^ur), so t(I_{k∞}) = ℤ_ℓ; f = 1 | holds |
| §0.4 uniqueness and Frobenius relation | I₂ = I₁ ∩ Φ⁻¹I₁Φ, a = t(σ) ≠ 0 | exp(aN) = exp(aN′) ⇒ N = N′; exp(t(σ)ΦNΦ⁻¹) = exp(Q⁻¹t(σ)N) ⇒ ΦNΦ⁻¹ = Q⁻¹N | holds |
| §0.4 lift independence | A = ρ̄(Φ), F finite inertia image on gr_j, r = order of conjugation | (Aτ)^(r\|F\|) = A^(r\|F\|); \|β\|^m = \|α\|^m under every embedding ⇒ same weight | holds both ways |
| §0.4 contragredient | q = 2 string | dual operator −Nᵗ, eigenvalues 1/2, 1, weights −2, 0, centre −1; +Nᵗ has the same twist, fails exp(−t(σ)Nᵗ) | Check correct |
| §0.5 detection | H′ admissible, Φ′ = Φ^fτ | N on G_k restricts to N (t ≠ 0 on open subgroups of H′∩I); eigenvalue α of Φ with α^f a Weil Q^f-number of weight w+j ⇔ \|α\| = Q^((w+j)/2) | both directions hold |
| §0.5 non-example | H′ = G_{k(ϖ^(1/ℓ^∞))} | t = 0 on H′∩I; Tate string restricted: eigenvalues 1, q in one grade | fails as stated |
| §0.6 transport | D → ℓD, ℓ = 2 | N′ = N/2, 2(N/2) = N | holds |
| §0.7 sums and S₃ Check | V ⊕ 0; S₃ on ℚ₃³ | projectors commute with log; diagonal (1) and plane (1,1) both weight 0; intersection 3a = 0 ⇒ a = 0 | holds; ker N of Tate string has weight 0 ≠ 1 |
| §0.8 L-factor | V^I ⊆ ker N ⊆ M₀ | weights on M₀ ≤ i, \|α\| ≤ q^(i/2), poles Re s ≤ i/2; split Tate: (1−q⁻ˢ)⁻¹ | consequence holds |
| §0.9 purely inseparable | k′ = k^(1/p^r) | G_{k′} = G_k, e = p^r, constant p^(−r) ∈ ℤ_ℓ^× | holds |
| §0.10 good reduction | ℙ², Tate curve | ℙ²: eigenvalues 1, q, q², N = 0; Tate: rank N = 1, no smooth proper model | holds |
| §1.1 curve theorem | Legendre λ = 0, p odd; residue degree a | node, N ≠ 0, weights 0, 2 about 1; base q^a = #κ(x) | DWP §5.11 states Gr_i pure of weight β+i with q_x |
| §1.2 global | Z = ℙⁿ_F | unramified, weights 2r at every place | holds |
| §2.1 tower | k = ℚ₂(√2); O_K/ϖ | degree 2 stage, v(ϖ₁) = 1/2; ϖ₁ ≠ 0, ϖ₁² = 0 in O_K/ϖ; N(ϖ₁) = −ϖ, t♯ = ϖ | holds |
| §2.2 β | k = ℚ₂, σζ₃ = ζ₃² | (β(σ)ζ₃♭)♯ = ζ₃² ≠ ζ₃; degrees 2 = 2 | holds |
| §2.3 torsion | x^(ℓⁿ) = 1, x♯ = 1 | x_r has order dividing gcd(p^r, ℓⁿ) = 1; both groups have ℓⁿ elements; ℓ = p: μ_{pⁿ}(C♭) = 1 | holds; ε = (1,ζ_p,…) has ε^p ≠ 1 |
| §2.4 scalar direction | t = u ϖ″^e | (β(σ)t^(1/ℓⁿ)/t^(1/ℓⁿ))♯ = σ(ϖ^(1/ℓⁿ))/ϖ^(1/ℓⁿ), so t_{ℓ,k} = e(t_{ℓ,k″}∘β); constant e⁻¹; k″ = 𝔽_q((t^(1/p))): e = p | holds |
| §2.4 Q equality | L/K finite | Q′ = q^f = #κ(L) = #κ(L♭) by P1.15 | holds |
| §2.5 transfer | ker N of Tate string | embeds without complement, weight 0 ≠ 1 | non-example as stated |
| §3.1 tubes | Z = V(T), V(ϖT), ε = \|ϖ\|²; Z = ∅; higher-rank point | radii \|ϖ\|², \|ϖ\|; ∅ at ε < 1, all at ε ≥ 1; continuity: \|g\| ≤ \|ϖ\|ⁿ ∀n ⇒ \|g\| = 0 | ∩_ε T = d(Ẑ) holds for continuous valuations |
| §3.2 Huber | X = Spec O[T], f = T | R⁰ = ℤ/n, Rʲ = 0 | matches ITO20 line 99 (degreewise, char 0) |
| §3.3 Lütkebohmert | Kummer degree m; AS in char 2 | self-trivialization; g² − g = S^(−m) diverges | matches ITO20 line 103 |
| §3.4 Huber Theorem 4.5(2) | F constant rank 2 on a disc | H⁰ (ℤ/n)² → (ℤ/n)², higher 0 | hypotheses (char 0, F constructible locally constant) match line 964–978 |
| §3.4 sliced nearby cycles | f = id; t² = π, p ≠ 2 | RΨ = ℤ/n[0]; (σ−1)^k = (−2)^(k−1)(σ−1): nonzero for odd n > 1, zero for 2-powers at k ≥ 3; after V[√π] action trivial, special fibre κ[t]/(t²) | matches ITO20 Definition 2.2 |
| §3.4 uniform alteration | Corollary 3.17 | S Noetherian excellent, f separated finite type, one S′ for all n | matches line 803–806 |
| §3.4 propagation | Proposition 3.1 | S Noetherian, nodal curve adapted, S° normal | matches line 388–395 |
| §3.4 adapted coefficients | Definition 6.5, T = S³, n = 2 | 3-cycle on 𝔽₂³ not unipotent; π = f gives rank 3 off 0, rank 1 at 0 | matches line 1455–1500 |
| §3.4 tameness and Galois order | unipotent g = 1 + x on a finite ℤ/n-module | order of g on the p-part is a p-power for p \| n; order invertible in O | "product of primes dividing n" holds |
| §3.4 annular decomposition | Theorem 6.2, AS char 2 | preimage B(a^(1/2), b^(1/2)), dT/dw = w²/(1−w)² ≠ 0, degree 2 not Kummer | matches line 1427–1438 |
| §3.4 tame trivialization | Theorem 6.3 | a/b < t² < 1 ⇔ a/t < tb; m invertible in O | matches line 1439–1445 |
| §3.4 uniform annular | Theorem 1.4/6.10 | h = g ∘ φ_m (Kummer first, then finite Galois g); δ independent of n, h may depend on n | order of factors matches line 133–139 |
| §3.4 annular comparison | Lemma 6.11, a = b = 1, n = 3 | H⁰ = ℤ/3 → 0 for D(1)° ∩ {\|T\| = 1} = ∅ | strict inequality now stated; (2) at radius δ follows by T ↦ T/c |
| §3.4 descent truncation | Corollary 7.4, r = −1 | hypotheses at m = 0 only: H^(−1)(C₀) = 0 ⇒ H^(−1)(C) = 0 | matches line 1822–1823 |
| §3.4 characteristic-p parameter change | f = (f′)^(p^N), ε = \|t\|² | \|f′\| ≤ ε ⇔ \|f\| ≤ ε^(p^N); T(V(T),ε) = T(V(T²),ε²) | matches line 1961–1965 |
| §3.4 uniform endpoint | n = p over C_p | H¹(B(1),ℤ/p) infinite, H¹({0}) = 0 | exclusion needed (line 987) |
| §3.5 cup compatibility | ℤ/3, a = b = 2 | ab = 1 on both sides; zero map sends 1 ↦ 0 | holds |
| §3.6 neighbourhood | plane cubic in ℙ² | H¹(ℙ²_C) = 0, dim H¹(Y_C) = 2 | ambient space fails, as stated; Cor 4.11 matches |
| §4.1 approximation | c = 0; elliptic x-map over 𝔽₃(t) | g = id; degree 2, dim H¹ = 2 vs 0 | data valid; smoothness/irreducibility step is S03 |
| §4.1 degree | deg(c₁(g*H)^d[Z′]) | = deg(g)·(H^d·W) > 0 by projection formula and A2.7 | holds |
| §4.2 comparison | degree 0; identity approximation; π direction | 1 ↦ 1; f* = π*_X; π : X_{Σ,C♭}^ad → X_{Σ,C}^ad per SCH12 line 2443 | directions agree |
| §4.3 top degree | elliptic double cover, ℓ = 2 | trace 2 ≠ 0 in ℚ̄₂, 0 mod 2 | holds rationally only |
| §4.4 splitting | S₃ diagonal over ℚ, c = 3; C₂ sign | plane x₁+x₂+x₃ = 0, 1 + 2 = 3; q(g1,g1) = −1 = χ(g) | holds; char 3 fails as stated |
| §4.5 summand | i = 0, 2d | both sides one-dimensional, complement 0 | holds |
| §4.6–4.7 | ℙⁿ; Fermat p ∤ e; cubic threefold | ℙⁿ via §0.8; partials e x_j^(e−1) have no common projective zero; threefold has no reduction hypothesis | agrees with SCH12 Theorem 9.6/1.15 |

### Checks recomputed

| README line | Instance and values | Result |
|---|---|---|
| 29 | q = 2: NΦe₁ = 2e₀ = 2ΦNe₁; ΦNΦ⁻¹e₁ = e₀/2 | pass |
| 30 | eigenvalues (1, q) on grades (−1, 1), weights (0, 2), centre 1; twist (q⁻¹, 1), centre −1 | pass |
| 31 | N = 0: only grade 0; q = 1: 1 = 1^(w/2) for all w | pass (q = 1 excluded) |
| 147 | (0,1)(x,0)(0,1)⁻¹ = (q⁻¹x, 0) | pass |
| 149 | Fr = I: (1−Q⁻¹)t = 0 contradicts t ≠ 0 | pass |
| 151 | ℤ_ℓ × {−1}: (0,−1)(x,0)(0,1) = (qx, 0) | pass |
| 153 | c = ℓ: t′∘id = ℓt, constant ℓ ≠ 1 | pass |
| 155 | ℤ[1/Q] ⋊ ℤ: twist holds, {0} open, t = 0 there | pass |
| 183 | ratio ζ_{ℓⁿ} ↦ coordinate 1 | pass |
| 185 | e = 1, Q′ = q^(f′) | pass |
| 187 | e = 2: 2·(1/2) = 1 in ℚ_ℓ, ℓ = 2 included | pass |
| 189 | arithmetic φ: class −1, t(φσφ⁻¹) = q t(σ) | pass |
| 219 | f = 3: Q′ = q³ | pass |
| 223 | H′ = I: image 0, not open | pass |
| 225 | ℓ-root tower: ratios 1, t = 0, exp(0·N) = 1 | pass |
| 229 | p-tower: t(I_{k∞}) = ℤ_ℓ, f = 1 | pass |
| 275 | χ_ℓ⁻¹: Φ acts by q, q = q^(2/2), N = 0 | pass |
| 277 | M₋₁ = Ee₀, M₁ = V, weights 0, 2, centre 1 | pass |
| 281 | ℚ_ℓ ⊕ ℚ_ℓ(−1), N = 0: eigenvalues 1, q in grade 0 | pass |
| 283 | contragredient: 1/2, 1; weights −2, 0; −Nᵗ vs +Nᵗ | pass |
| 285 | Tate H¹ rank N = 1 vs semisimplification rank 0 | pass |
| 297 | ℓ-root tower restriction: eigenvalues 1, q on one grade | pass |
| 309 | 2·(N/2) = N | pass |
| 321 | ker N: eigenvalue 1, weight 0 ≠ 1 | pass |
| 323 | S₃ × tame datum: spectra (1), (1,1); 3a = 0 ⇒ a = 0 in ℚ₃ | pass |
| 351–359 | ℙⁿ: H^(2r) = ℚ̄_ℓ(−r), weight 2r; Spec k weight 0 | pass |
| 361 | split Tate: (1−q⁻ˢ)⁻¹ pole Re s = 0; semisimplification pole Re s = 1 | pass |
| 413 | Legendre λ = 0, p odd: node, N ≠ 0, weights 0, 2 | pass |
| 456–462 | ℚ₂(√2): degree 2, v = 1/2, ϖ₁² = 0 in O_K/ϖ, N(ϖ₁) = −ϖ, t♯ = ϖ; finite stages discrete | pass |
| 479–481 | β(1) = id; (β(σ)ζ₃♭)♯ = ζ₃²; degrees 2 = 2 | pass |
| 493–495 | μ_{ℓⁿ} bijective; μ_{pⁿ}(C♭) = 1 vs pⁿ; ε♯ = 1, ε ≠ 1, infinite order | pass |
| 507–509 | k″ = 𝔽_q((t)): scalar 1; k″ = 𝔽_q((t^(1/p))): scalar p⁻¹, (1/2)(2N) = N | pass |
| 567–573 | disc \|T\| ≤ ε; ideal 0 and (1); radii \|ϖ\|² vs \|ϖ\|; ε ≥ 1 both unit disc | pass |
| 571 = 575 | T(V(f),\|ϖ\|^c) = N_c(f) at the head's §5.1 (f = t, c = 1: \|t\| ≤ \|ϖ\|) | pass, duplicate bullet (S01) |
| 587 | f = T: R⁰ = ℤ/n, Rʲ = 0 | pass |
| 600–602 | Kummer self-trivialization; AS not Kummer-dominated | pass |
| 616–618 | identity disc b = 0; Z = X blow-up empty; two discs (ℤ/n)² | pass |
| 633–635 | id: ℤ/n[0]; t² = π swap computation; V[√π] special fibre κ[t]/(t²) | pass |
| 643–645 | id; degree-2 alteration kills swap; no finite common refinement of p^r covers | pass |
| 657–659 | id adapted; T = S³, n = 2 not adapted, π = f ranks 3/1; AS char 2 with n = 3 | pass |
| 671–673 | Kummer m incl. m = p in char 0; AS radii (√a, √b); odd m divergence | pass |
| 679–681 | id; T ↦ T³ rank 3 at n = 3; AS wild order 2 | pass |
| 687–690 | H⁰ = ℤ/n, H¹ = ℤ/n(−1) both sides; rank 2; a = b = 1 fails | pass |
| 698–700 | f = T, N = 1; f = T² in char 2 radius ε²; empty Z, n = 1 | pass |
| 704–706 | 𝔽₂((t))^: odd n, ε₀ = 1; n = p excluded; V(T²) radius ε^(1/2) | pass |
| 718–720 | ℤ/3: 2·2 = 1; zero map fails unit | pass |
| 776–786 | c = 0 identity; d = 0 point; O(p^N D); elliptic degree 2; deg g*O(1) = 2; [L:k] = p | pass (route itself: S03) |
| 814–824 | degree 0 identity; toric identity; χ_ℓ^(−d) matched by β; ambient ℙ² fails | pass |
| 836–838 | ℓ \| 2 fails mod ℓ; disconnected target 1 ↦ (1,1) | pass |
| 852–860 | ℙ¹ → elliptic: B¹ = 0 ⊕ B¹; zero map; S₃; C₂ sign; U = 0 and 𝔽₂ | pass |
| 903–905 | Fermat p ∤ e smooth reduction; cubic threefold | pass |

## Not verifiable

- HUB96 (Theorems 3.7.2, 3.8.1, Lemma 2.7.11, Corollary 7.5.5, Theorem 5.7.8), HUB98 (Definition 1.4, Theorems 2.1, 3.6) and LUT93 (Theorem 2.2) are settled uncertified; their formulations were checked only against the recollections in ITO20 (lines 99–106, 964–981, 1198–1201, 1662, 2009–2013) and SCH12 (line 2604). No request was reopened.
- The supplier heads served by `roadmaps show` on 2026-10-29 (ClassicalAdicEtaleCohomology `d99fe53`, DeligneWeightsAndPurity `87323d1`, ArithmeticGaloisRepresentations `682bd29`, LefschetzPencilsAndVanishingCycles `dbf5ba2`, FiniteFlatGroupsAndIntegralPadicHodgeTheory `0e779dc`, AbelianSchemesAndArithmeticModuli `21a8758`, EtaleDualityAndPerverseSheaves `d1fab8f`) are later than the heads the round-1 passes read; ClassicalAdicEtaleCohomology was rewritten in between (2721 → 5829 lines), which is the origin of S02.
- Whether some Layer 0 statement (§0.5 or §0.7) could be stated at the pins with real-body definitions of the datum, the monodromy filtration and a Weil-number predicate is a judgment; I agree with the docstring that it would be a long ad hoc encoding and not a headline, so no finding is raised.
- No Lean was run (the brief gives no Lean command for this pass and the file declares nothing).
- Ownership against open pull requests whose files the brief does not provide was not checked beyond the `roadmaps grep` index.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eefe719", "job": "RT-DeligneWeightsAndPurityPartII~2b", "model": "fable", "worker": "chris-x10"} -->

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eefe71980da901e56aa04fb1b74fbdb58166504f", "job": "RT-DeligneWeightsAndPurityPartII~2b", "model": "fable", "worker": "chris-x10"} -->
