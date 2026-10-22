<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/159#issuecomment-6335712748 -->
Red team round 1 pass b (claude) of e7f3852

Verdict: needs_changes

1. **F01** (P1) Supplier citations name sections and slugs that do not exist at the suppliers' current heads

   **Location:** `packages/HeegnerPointEulerSystems/README.md:75`: “`SelmerIwasawaCohomology:L0–L4` supplies continuous inverse limits, saturated lattices, propagated local conditions, Iwasawa–Shapiro, semilocal cohomology and descent.”; also `README.md:71`, `:72`, `:76`, `:77`, `:78`, `:81` and every `*Prerequisites:*` line that cites `SelmerIwasawaCohomology:L1`, `…:L2/greenberg-condition`, `…:L3/iwasawa-shapiro`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`, `ArithmeticGaloisRepresentations:R01.3`, `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4`, `ShimuraVarieties:V5`, `SerreWeightAndLevelOptimisation:R20.2`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `ArithmeticGaloisDuality:R02.2/five-term-transgression`, `NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration`.

   **Claim:** Fifteen of the cited suppliers are open pull requests of the roadmap repository (all earlier in `merge-order/ORDER.txt`, so eligible), and the package cites them by section labels and anchor slugs. At the suppliers' current heads the label schemes `ES.k`, `L0`–`L4`, `R01.k`, `R14.k`, `GN.k`, `Vk`, `R20.k` do not occur at all (the suppliers number their layers `## Layer k` / `### k.n`), `SelmerIwasawaCohomology` has no Layer 1 although `L1` is cited nine times (`README.md:429`, `:696`, `:774`, `:786`, `:846`, `:948`, `:984`, `:996`, `:1086`), and none of the twenty-four slugs after a `/` (`howard-hypotheses`, `howard-dvr-theorem`, `divisibility-invariants`, the fifteen `SelmerIwasawaCohomology` slugs, `five-term-transgression`, `elliptic-filtration`, `rational-cusp-abel-jacobi`, `special-fibre-eichler-shimura`, `neron-hecke-extension`, `modular-parametrisation`) exists as an anchor or even as a string (`component-group` occurs as a word, not as an anchor); the only cited slug that exists is `level-raising-diamond`. A dependency written as if supplied, citing a section that does not exist where it is cited, is unowned. Pass a (F04, F10) covered the seven ineligible suppliers and the two main-branch sections; the fifteen open-pull-request suppliers were listed there as not verifiable and are the subject here.

   **Witness:** at the supplier heads read for this pass — `TauCetiRoadmap/SelmerIwasawaCohomology/README.md` (roadmap pull request 869, head 17f6056) has layer headings only at lines 146 (`Layer 0`), 344 (`Layer 2`), 978 (`Layer 2A`), 1315 (`Layer 3`), 1863 (`Layer 4`); `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md` (pull request 1272, head 4fb7ae9) numbers `## Layer 0` … `## Layer 8` at lines 239, 676, 1519, 1933, 2637, 3335, 3757, 4098, 4313 and contains no `ES.`; `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md` (856, head 76d989b) `## Layer 1`–`## Layer 7` at lines 650–4055, no `R01.`; `TauCetiRoadmap/ModularCurvesPartII/README.md` (913, head 27ac927) `## Layer 0`–`## Layer 17` at lines 306–4629, no `R14.`; `TauCetiRoadmap/ShimuraVarieties/README.md` (933, head ce10821) `## Layer 0`–`## Layer 8` at lines 207–2196, no `V5`; `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` (851, head 01c64f0) `## Layer 0`–`## Layer 6` at lines 220–2593, no `GN.`; `TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md` (1013, head 763a749) `## Layer 1` at line 163, `## Layer 2` at 312, no `R20.`, anchor `level-raising-diamond` at line 406 only. By contrast `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md` (852, head 9d58065) line 624 declares the alias `R11.1–R11.6` for its six layers, and `R02.2`/`R02.4`/`D7`, `R18.1–R18.5`, `CM.1/2/4`, `R29.5`, `R17.3` (`global-jl`, `multiplicity-one`), `R28.4`, `R07.4` are present at their heads.

   **Exact repair text:** rewrite every citation of these suppliers to the heading the supplier actually carries, after reading it, in the form `<Roadmap> Layer k.n <title as printed>`; for `EulerSystemsAndKolyvaginSystems` the candidates are Layer 1 (auxiliary primes and finite–singular comparison), Layer 3 (Kolyvagin derivatives), Layer 4 (descent and bounded errors), Layer 5 (primitivity and self-dual structure), Layer 8 (rank-one Iwasawa variation); for `SelmerIwasawaCohomology` they are Layer 0 (completions and coefficient limits), Layer 2 (Selmer structures and complexes), Layer 2A (arithmetic Selmer comparisons), Layer 3 (Iwasawa cohomology, control and determinants), Layer 4 (finite conditions and arithmetic applications), and each of the nine `L1` citations must be re-pointed to the layer that states the consumed result. Where the named declaration (Howard's hypothesis record and DVR theorem, Iwasawa–Shapiro, the Greenberg condition, the five-term transgression, the rational-cusp Abel–Jacobi map, the elliptic filtration, the modular-parametrisation target, the CM-local-dynamics statement) is not stated at the supplier's head, add under `## Exact supplier contracts` the line “What <Supplier> must provide (gap:<slug>): <one sentence with hypotheses>” and cite `gap:<slug>` at the consuming target.

2. **F02** (P3) Six targets are verbatim restatements of API laws already listed under their definitions

   **Location:** `packages/HeegnerPointEulerSystems/README.md:1548`–`1550`: “### Iwasawa–Shapiro level comparison / Under Iwasawa–Shapiro, level k equals the Kummer class of y_k.”; likewise `:1534` (he-8-43), `:1562` (he-8-46), `:1727` (he-8-47), `:1769` (he-8-49), `:1810` (he-8-45).

   **Claim:** The six subsections he-8-43, he-8-44, he-8-45, he-8-46, he-8-47, he-8-49 each consist of one sentence copied from a law bullet of a definition target, carry the same `Lean interface:` name as that bullet, and are then cited as prerequisites by other targets (he-8-43 at `README.md:1888`; he-8-44 at `:1654`, `:1834`; he-8-45 at `:1834`, `:1846`, `:1888`; he-8-46 at `:1682`, `:1902`; he-8-47 at `:1751`, `:1765`; he-8-49 at `:1806`, `:1846`). One declaration is thereby presented as two targets, the 140-target count is inflated by six, and the dependency graph routes through empty nodes.

   **Witness:** `universalNormFamily_level_zero` appears at `README.md:1270` (law of he-8-5) and `:1540` (he-8-43), `universalNormFamily_trace` at `:1271` and `:1775`, `heegnerIwasawaClass_level` at `:1300` and `:1554`, `nearTrivialCharacter_congruent` at `:1436` and `:1568`, `determinantalHeegnerElement_image` at `:1710` and `:1733`, `lambdaDerivativeClass_restrict` at `:1793` and `:1816`; each is a single declaration in `packages/HeegnerPointEulerSystems/Suggested.lean` (lines 910, 918, 1003, 1163, 1248, 1106).

   **Exact repair text:** delete the six subsections (anchors he-8-43, he-8-44, he-8-45, he-8-46, he-8-47, he-8-49) and replace each prerequisite link to them by the definition target that owns the law: `[Howard universal-norm Heegner family](#he-8-5)` for he-8-43 and he-8-49, `[Anticyclotomic Heegner class](#he-8-6)` for he-8-44, `[Λ-adic Heegner derivative class](#he-8-17)` for he-8-45, `[Crystalline characters near the identity](#he-8-23)` for he-8-46, `[Determinantal Heegner element](#he-8-37)` for he-8-47.

3. **F03** (P3) Nine sorried theorems and five admitted examples close by one tactic or by `Classical.choose_spec` at the pins

   **Location:** `packages/HeegnerPointEulerSystems/Suggested.lean:233`: “theorem dihedral_conjugation {G : Type*} [Group G] (n : ℕ) (f : DihedralGroup n →* G) (i : ZMod n) :”; also lines 452, 531, 761, 910, 918, 923, 934, 1713 and the examples at lines 157, 971, 982, 988, 1140.

   **Claim:** These declarations are stated as targets but carry no mathematics beyond Mathlib: `dihedral_conjugation` is the pinned `DihedralGroup` algebra, `tamagawa_and_local_torsion_tests` is `Nat.card_of_subsingleton`, `universalNormFamily_level_zero`/`_trace` are the two projections of `Classical.choose_spec` of the very existence theorem used to define `universalNormFamily`, `universalNormFamily_corestriction` is `htransition` applied to a point, `universalNormFamily_choice` is linearity, and `zhang_indivisibility`, `cm_heegner_field_disjointness`, `relative_ring_class_tower_torsion_finite` are one-line consequences of their hypotheses (pass a F12 asks that these last three be removed as stand-ins; the proofs below show why). The five examples (157 and 1140 are the same statement) are `simp`/`decide` facts about `ℤ` and `ZMod`. Pass a F05 (prove every example) and F12 are not re-raised; the verified proof text is supplied for whatever the repair keeps.

   **Witness:** a probe copy containing exactly the statements below, with `import Mathlib` and the section variables of lines 880–891 and the `include` line 897 reproduced verbatim, elaborated against the content repository's pins with the single intended `sorry` (the existence theorem) and no error.

   **Exact repair text:**
   ```lean
   theorem dihedral_conjugation {G : Type*} [Group G] (n : ℕ)
       (f : DihedralGroup n →* G) (i : ZMod n) :
       f (DihedralGroup.sr 0) * f (DihedralGroup.r i) * (f (DihedralGroup.sr 0))⁻¹ =
         (f (DihedralGroup.r i))⁻¹ := by
     simp [← map_mul, ← map_inv, DihedralGroup.sr_mul_r, DihedralGroup.inv_sr,
       DihedralGroup.sr_mul_sr, DihedralGroup.inv_r]

   theorem tamagawa_and_local_torsion_tests (p : ℕ) [Fact p.Prime] {Φ : Type*} [AddCommGroup Φ]
       (hcard : Nat.card Φ = p) : ¬ Subsingleton Φ :=
     fun _ => (Fact.out : p.Prime).one_lt.ne' (hcard ▸ Nat.card_of_subsingleton (0 : Φ))

   theorem zhang_indivisibility {C L : Type*} [AddCommGroup C] [AddCommGroup L]
       (Λ : Set ℕ) (classes : ℕ → C) (loc : C →+ L) (auxiliary : ℕ → L)
       (hcongruence : ∀ n ∈ Λ, loc (classes n) = auxiliary n)
       (hauxiliary : ∃ n ∈ Λ, auxiliary n ≠ 0) : ∃ n ∈ Λ, classes n ≠ 0 := by
     obtain ⟨n, hn, h⟩ := hauxiliary
     exact ⟨n, hn, fun h0 => h (by rw [← hcongruence n hn, h0, map_zero])⟩

   theorem cm_heegner_field_disjointness (cmDiscriminant heegnerDiscriminant N : ℕ)
       (hcm : cmDiscriminant ∣ N) (hcoprime : Nat.Coprime heegnerDiscriminant N)
       (hramified : 1 < cmDiscriminant) : cmDiscriminant ≠ heegnerDiscriminant := by
     rintro rfl; exact hramified.ne' (Nat.Coprime.eq_one_of_dvd hcoprime hcm)

   theorem relative_ring_class_tower_torsion_finite {A B : Type*}
       [AddCommGroup A] [Fintype B] (tors : AddSubgroup A)
       (red : tors → B) (hinj : Function.Injective red) : Set.Finite (tors : Set A) :=
     haveI := Finite.of_injective red hinj; Set.toFinite _

   theorem universalNormFamily_choice {I J : Type*} {P L : I → Type*}
       [∀ i, AddCommGroup (P i)] [∀ i, AddCommGroup (L i)]
       (source target : J → I) (π : ∀ i, L i →+ P i)
       (tr : ∀ j, L (target j) →+ L (source j)) (a : J → ℤ) (q q' : ∀ i, L i)
       (hbottom : ∀ i, π i (q i) = π i (q' i))
       (hq : ∀ j, tr j (q (target j)) = a j • q (source j))
       (hq' : ∀ j, tr j (q' (target j)) = a j • q' (source j)) :
       (∀ i, π i (q i - q' i) = 0) ∧
       (∀ j, tr j (q (target j) - q' (target j)) = a j • (q (source j) - q' (source j))) :=
     ⟨fun i => by simp [hbottom i], fun j => by simp [map_sub, hq j, hq' j, smul_sub]⟩

   -- inside `section UniversalNormFamily`, after `def universalNormFamily`:
   theorem universalNormFamily_level_zero (i : I) :
       π i (universalNormFamily source target Φ point π tr a hπ htr hfinite i) =
         Φ i (point i) :=
     (Classical.choose_spec (universalNormFamily_exists source target Φ point π tr a hπ htr hfinite)).1 i

   theorem universalNormFamily_trace (j : J) :
       tr j (universalNormFamily source target Φ point π tr a hπ htr hfinite (target j)) =
         a j • universalNormFamily source target Φ point π tr a hπ htr hfinite (source j) :=
     (Classical.choose_spec (universalNormFamily_exists source target Φ point π tr a hπ htr hfinite)).2 j

   theorem universalNormFamily_corestriction {M : I → ℕ → Type*}
       [∀ i k, AddCommGroup (M i k)]
       (proj : ∀ i k, L i →+ M i k) (cor : ∀ i k, M i (k+1) →+ M i k)
       (htransition : ∀ i k, (cor i k).comp (proj i (k+1)) = proj i k) (i : I) (k : ℕ) :
       cor i k (proj i (k+1)
         (universalNormFamily source target Φ point π tr a hπ htr hfinite i)) =
         proj i k (universalNormFamily source target Φ point π tr a hπ htr hfinite i) :=
     DFunLike.congr_fun (htransition i k) _

   -- the examples at lines 157 and 1140:
   example : (0 : ℤ) ≠ 1 ∧ (0 : ℤ →+ ℤ) 0 = (0 : ℤ →+ ℤ) 1 := by simp
   -- line 971: replace `sorry` by `decide`
   -- line 982: replace `sorry` by `simp; decide`
   -- line 988:
     rintro ⟨q, h1, h2⟩
     have a := h1 () (by simp); have b := h2 () (by simp)
     simp at a b; rw [a] at b; exact absurd b (by decide)
   ```

4. **F04** (P3) The README has no `## Exact supplier contracts` section (or any TauCetiRoadmap-form section) in which the gap contracts required by the other findings can be declared

   **Location:** `packages/HeegnerPointEulerSystems/README.md:1`: “# Heegner-point Euler systems and arithmetic descent”; `README.md:39`: “## Existing library and prerequisite interfaces”; `README.md:116`–`120`: “Lean interface: `local_toral_order`. … Sources: … Prerequisites: …”.

   **Claim:** The package is written as a catalogue (title without `Roadmap:`, a single bullet list for all suppliers, per-target `Lean interface:` / `Additional hypotheses:` / `Sources:` / `Prerequisites:` field lists, no `**Checks.**` lists, no `### Examples` / `### Dependencies`, no `## Scope and ownership`, `## Conventions` is present only in substance, no `## Exact supplier contracts`, no `## How to read the build`). The intake reads declared gaps from `## Exact supplier contracts`, in the supplier's subsection, as “What <Supplier> must provide (gap:<slug>): …”; pass a F04 and F15 and F01 above each require such contracts, and the README has nowhere to put them. The per-target field lists are the form the house style excludes.

   **Witness:** every sibling at the cited supplier heads carries the sections, e.g. `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:5` “## Scope and ownership”, `:69` “## Exact supplier contracts”, `:235` “## How to read the build”; the package's only supplier section is the bullet list at `README.md:68`–`86`.

   **Exact repair text:** retitle line 1 “# Roadmap: Heegner-point Euler systems and arithmetic descent”; insert after the summary paragraphs the sections “## Scope and ownership” (the material now at lines 7–9), “## Conventions” (lines 11–37), “## Exact supplier contracts” with one subsection per supplier (“### From Mathlib”, “### From Tau Ceti”, “### From TauCetiRoadmap.<X>” for each roadmap on main or in the merge order, each listing the consumed sections by their printed headings and any “What <X> must provide (gap:<slug>): …” line), and “## How to read the build”; inside each layer convert “Lean interface: `name`.” into prose (“Prove `name` …”), “Sources:” into the parenthesised locator at the claim, “Prerequisites:” into a “*Needs:*” sentence, and “Examples and tests:” into a “**Checks.**” bullet list, closing each layer with “### Examples” and “### Dependencies”.

5. **F05** (P3) Two page locators start one page late

   **Location:** `packages/HeegnerPointEulerSystems/README.md:1072`: “§§4.8–4.13 pp.25–27”; `README.md:154`: “Appendix6.1 pp.61–63 (quadratic local orders)”.

   **Claim:** In the cited 53-page Nekovář preprint, paragraph (4.8) begins on page 24 (page 25 starts twelve lines later), so the range for §§4.8–4.13 is pp.24–27. In the Cornut–Vatsal manuscript the appendix starts on page 60 and its §6.1 on page 62, so “pp.61–63” neither contains the start of the appendix nor begins at §6.1.

   **Witness:** nekovar line 1171 (page 24; the page-25 marker is at line 1183); cornut-vatsal line 2127 (appendix heading, page 60) and line 2192 (§6.1, page 62).

   **Exact repair text:** line 1072: replace “§§4.8–4.13 pp.25–27” by “§§4.8–4.13 pp.24–27”; line 154: replace “Appendix6.1 pp.61–63 (quadratic local orders)” by “Appendix §6.1 pp.62–63 (quadratic local orders)”.

## Verified sound

Read in full: `packages/HeegnerPointEulerSystems/README.md` (2,250 lines, 140 `###` targets, 140 `Lean interface:` lines, each naming a declaration present in `Suggested.lean`) and `packages/HeegnerPointEulerSystems/Suggested.lean` (1,718 lines; 173 theorems, 15 definitions, 47 examples, 2 local instances); `metadata.toml`, `review.json`; there is no `sources.toml` (pass a F07, not re-raised). The whole pass-a comment was read first.

Elaboration: the submitted `Suggested.lean` elaborates against the content repository's pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf) with exactly 234 `declaration uses 'sorry'` warnings and no other diagnostic (exit 0); its nineteen `Mathlib.*` imports resolve at those pins (the import form itself is pass a F06). No `TauCeti.*` module is imported, so the addendum does not apply. No `lemma`; `set_option` at line 780 is pass a F06.

One-tactic probe: nine sorried theorems and five admitted examples close (F03); the remaining sorried theorems were not attempted because they mention a `sorry`'d definition (pass a F01) or were shown false by pass a (F02).

Locators: 146 theorem/section/equation labels were found at the cited page in the cached legal copies of all 22 source ids (gross by OCR without page markers, the rest by `=== page N ===` markers): Khayutin (Prop. 2.2, Lemma 2.3, Remark 2.7 and Lemma 5.8 on printed pp.165, 166, 167, 184), Cornut–Vatsal part I (24 labels including Lemma 1.1 p.5, Theorems 1.4–1.5 pp.6–7, Lemma 2.7 p.22, Lemma 2.8 p.23, Prop. 4.4 p.38, Theorem 4.10 p.41, Prop. 4.17 p.49, Props. 5.6–5.8 pp.55–56, Theorem 5.10 p.58, Cor. 6.6 p.64), part II (Theorem 2.9 p.11, Cor. 2.10 p.12, Theorem 2.29 p.31, Lemma 2.30 p.32), Nekovář (21 labels: (1.19) p.14, (3.1)–(3.5) pp.18–19, 6.1.2/6.2.1/6.2.2 pp.35–36, 7.1.2 p.43, 7.2.1/7.2.3 p.44, 7.3–7.5 pp.45–46, (5.1), (5.8), (5.15), (5.19), (6.3), (6.5)), Howard preprint (16 labels: Theorems A and B p.2, §2.3 pp.28–29, Lemmas 2.3.2–2.3.5 pp.29–32, Theorem 2.3.7 p.34, Lemma 1.7.1 p.20, Prop. 1.7.4 and Theorem 1.7.5 p.21, Theorems 1.6.1 and 1.6.5 pp.16–19, Prop. 2.1.3 p.23, Lemma 2.2.7 p.25, Theorem 2.2.10 p.26), Howard published (Prop. 1.7.4), Zhang (16 labels: Theorem 1.1 printed p.195, Hypothesis ♥ pp.202–203, Theorem 2.1 p.203, Remarks 6–7 pp.205–206, Theorem 3.1 p.210, Lemma 3.3 p.215, Theorem 4.3 p.218, Theorem 5.2 p.223, Cor. 6.2 p.227, Theorem 6.4 p.229, Theorem 6.5 p.230, Theorem 7.1 p.231, Lemmas 8.1–8.2 p.235, Definition 8.3 p.236, Lemma 8.4 p.236, Theorem 9.3 p.243), BCGS (17 labels: Theorem A p.2, Lemma 1.1.5 p.9, Theorem 1.1.6, Theorem 1.2.1 and Definition 1.2.2 p.10, Lemmas 1.2.3 and 1.2.5 pp.11–12, Theorem 1.2.7 p.13, Lemma 1.2.8, Conjecture 1.2.10, Cor. 1.2.12 and Theorem 1.2.13 p.14, Theorem 1.3.1 p.15, Prop. 2.2.1 and Theorem 2.2.2 p.17, Lemma 2.2.4 p.18), Castella–Sano (11 labels: Theorem C p.4, Lemma 3.1.1 and (3.5)–(3.8) pp.12–13, Theorem 3.2.1 p.13, Conjecture 3.2.2 and Prop. 3.2.3 p.14, Prop. 3.3.2 p.14, Lemma 3.3.3 and Cor. 3.3.4 p.16), BCS (Theorems 1.2.2 and 1.2.4 and Remark 1.2.3 p.3, Theorem 4.2.1 p.8, Prop. 5.2.1 p.9, Lemma 5.2.3 p.10), Skinner (Theorem B p.2, Theorem 2.5.2 p.15, §3.2 p.20), Pollack–Weston (§6.2 p.18, Theorem 6.2 and Prop. 6.3 p.19, Prop. 6.7 p.20, §6.5 and Theorem 6.8 p.21), CGLS (Theorem 4.1.1 p.27, Theorem 4.1.2 and Remark 4.1.3 p.28, Prop. 4.2.1 pp.28–29), CGS (Theorem C p.3), BCK (Theorem 5.2 p.20 = printed 1646), Zanarella (Prop. 2.3.3 p.19, Theorem 2.3.6 p.20), Kolyvagin (Theorem A printed p.95), Wüthrich (Theorem 4 printed p.384), Cornut (main theorem pp.2–3), Gross (Prop. 2.1, Prop. 5.4, Theorem 1.3).

Statements checked against the text, 21: Howard Theorem A (hypotheses p odd, p, D, N pairwise coprime, surjective image on T, conclusion with length M ≤ length(S_p/ℤ_pκ₁)) and Theorem B (p ∤ h_K, char(M)=char(M)^ι, X ∼ Λ⊕M⊕M, char(M) | char(H¹/H)) agree with `README.md:756` and `:1852`; Howard's Φ at §2.3 agrees with `README.md:1182` in both cases, and its γ-relations give the recurrence of `:1236`; CGLS Remark 4.1.3 gives exactly the α-stabilisation of `:1207` with the u_K⁻¹ initial corrections and the comparison factors u_Kα²(β−1)², u_Kα²(β²−1) of `:1412`; Gross Prop. 2.1 agrees with `:792` (odd p, full GL₂(F_p), y_K ∉ pE(K), non-CM), Prop. 5.4 gives τ-eigenvalue ε(−1)^{f_n} as at `:611`, Theorem 1.3's bound t_{E/K}·I_K² as at `:1164`; Kolyvagin Theorem A (#Ш divides d·C_K², ord_ℓ d = 0 for ℓ ∈ B(E), B(E) the odd primes prime to disc(O) with surjective image) as at `:1164`; Zhang Theorem 1.1, Hypothesis ♥ (three clauses), Theorem 7.1 (p ≥ 3, good ordinary, image ⊇ SL₂(F_p), residually ramified ℓ∥N) and Definition 8.3 agree with `:21`, `:852`, `:888`, `:915`, `:1002`; BCGS Definition 1.2.2 (u ∈ 1+pℤ_p, γ^h = rec(u), ξ_n(γ)=u^n, infinity type (hn,−hn), α_m = ξ_{(p−1)p^{m−1}} ≡ 1 mod p^m) agrees with `:1426`; BCGS Theorem A (p odd good ordinary split, (Heeg),(disc),(tor), rational main conjecture ⇒ some κ_n ≠ 0; the two unconditional cases) agrees with `:1922` and `:2122`; Castella–Sano Theorem C (p > 3, (sur), p ∤ c_φ, good ordinary, p unramified in K, M∞ = ord_p Tam_E ⟺ Conjecture 3.2.2) and Conjecture 3.2.2 agree with `:1964` and `:1702`; BCS Prop. 5.2.1 (i)–(vi) agree with `:2010`; Skinner Theorem B hypotheses agree with `:852`; Nekovář (7.5.3) gives 2²¹p^{2C₀+2C₁+4C₂+4C₃+C₅+C₆} as at `:1080`, with C₀, C₅, C₆ defined as there; Cornut–Vatsal Lemma 1.1's S agrees with `:1346`.

Checks recomputed, 14: coefficient ideals (10,20)=(5) and (5)+(25)=(5) in ℤ₅; Φ = 25 (split, σ=σ*=1) and 35 (inert) for p=5, a_p=1; stabilised value (1/2)(4−(1/2)·2)=3/2; ℤ/7 bottom 5·1=5; exponents 4 and 20 for p=5, m=1,2; determinant coefficient 5 for (5,1); the C₂ trace 1+(−1)=0 ≠ 1; the conductor-change kernel u·#ker = ℓ−χ(ℓ) (ℓ ∤ c) and ℓ (ℓ | c) from (O_c/ℓ)×/(ℤ/ℓ)× of order ℓ−1, ℓ+1, ℓ, ℓ; neighbour counts 1+ε_P and N(P)−ε_P summing to N(P)+1; dim H¹(K_ℓ,V)=4 for an inert Kolyvagin prime (Frobenius² trivial on V and on V(1)); the norm-compatibility Tr y_{k+1} = y_k for α^{−k}(P_{p^k} − α⁻¹P_{p^{k−1}}) including k=0 in both splitting types; the unit comparison factors above; #Ẽ(𝔽_{p²}) = (p+1)²−a_p²; the Tamagawa product over K being the square of the rational p-part under the Heegner hypothesis.

Suppliers: the fifteen open-pull-request suppliers were read at their heads (F01); `NeronModelsAndSemistableAbelianVarieties` (alias R11.1–R11.6 declared at its line 624), `ArithmeticGaloisDuality` R02.2/R02.4/D7, `HilbertModularVarietiesAndShimuraCurves` R18.1–R18.5, `ComplexMultiplicationAndExplicitReciprocity` CM.1/CM.2/CM.4, `EllipticCurveModularity` R29.5, `GL2AutomorphicRepresentationsAndTransfer` R17.3 with `global-jl` and `multiplicity-one`, `FaltingsFinitenessAndIsogenyTheorems` R28.4 and `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.4 exist as cited; all fifteen are listed in `merge-order/ORDER.txt`. On main, `TauCetiRoadmap/GlobalNumberFields/README.md:565` (Layer 11), `TauCetiRoadmap/ClassFieldTheory/README.md:1724`, `:1799` (Layers 12, 13), `TauCetiRoadmap/EllipticCurves/README.md:647`, `:793`, `:1200`, `:1262` (Layers 2, 4, 6, 7), `TauCetiRoadmap/Chebotarev/README.md:410` (Layer 10) and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:567`, `:2328`, `:3165` (Layers 1, 4, 5; no `L0a`, pass a F10) carry the cited layers. The package is absent from `merge-order/ORDER.txt` (an imported package; not a defect). The dependency check output, verbatim:

```text
NOT IN ORDER: HeegnerPointEulerSystems (insert it after its last supplier)
depcheck: 9 roadmaps, 83 edges, 1 problem(s)
```

(exit status 1; no UPWARD or CYCLE line.)

Policy: no `lemma`; no issue or pull-request numbers in the README; no process words beyond those pass a F02/F06 already locate (`README.md:37`, the “Prototype boundary” comments); the README title keeps “Heegner” capitalised.

Not re-raised (pass a round 1, all still open at this head): F01 admitted data definitions, F02 false universal signatures, F03 wrong pins (confirmed: the file elaborates at the content pins but names 082e2d37/f7904748), F04 seven ineligible suppliers, F05 admitted examples, F06 Lean module form, F07 missing `sources.toml`, F08 Selmer-complex shift, F09 isogeny invariance, F10 GlobalNumberFields/PadicMeasures contracts, F11 augmentation of Φ, F12 elementary stand-ins, F13 coefficient-ideal normal form, F14 definition Checks, F15 CM local dynamics, F16 split-only dependency, F17 four locators, F18 the p=3 case.

## Not verifiable

- The hypotheses under which the fifteen open-pull-request suppliers state the consumed results: their heads were read only to the extent of headings, labels and anchors (F01); whether the eventual target sections carry the same hypotheses as the package assumes was not checked and cannot be until the citations name real sections.
- Mathematical content of the seven ineligible suppliers of pass a F04 (`GrossZagierAndArithmeticHeights`, `ModularIwasawaMainConjectures`, `KatoEulerSystems`, `PadicHodgeRegulators`, `AutomorphicCongruences`, `AutomorphicPadicLFunctions`, `RankZeroOneBSD`): no text exists anywhere to check against.
- Gross is an image-only scan read through OCR with interleaved columns; the three statements checked there were read from legible lines, but printed page numbers for Gross (pp.236–256) could not be tied to `=== page N ===` markers.
- The published pagination of Howard (pp.1457–1458 for Prop. 1.7.4) and of Zhang beyond the offset PDF = printed − 190 was inferred from running heads, not from a publisher table of contents.
- Zanarella Theorem 2.3.6's standing hypotheses (`README.md:816` asserts p ≥ 5) and BCK's standing p > 3 were not re-read; pass a lists both locators as verified.
- The five Mathlib declarations with pinned permalinks in `README.md:42`–`66` were not re-opened at the content pins; pass a reports them present.
